import torch
import torch.nn as nn
from torch import Tensor
import torch.nn.functional as F
import math


class PositionalEncoding(nn.Module):
    def __init__(self, emb_size: int, dropout: float, maxlen: int = 5000):
        super(PositionalEncoding, self).__init__()
        den = torch.exp(-torch.arange(0, emb_size, 2) * math.log(10000) / emb_size)
        pos = torch.arange(0, maxlen).reshape(maxlen, 1)
        pos_embedding = torch.zeros((maxlen, emb_size))
        pos_embedding[:, 0::2] = torch.sin(pos * den)
        pos_embedding[:, 1::2] = torch.cos(pos * den)
        pos_embedding = pos_embedding.unsqueeze(-2)

        self.dropout = nn.Dropout(dropout)
        self.register_buffer("pos_embedding", pos_embedding)

    def forward(self, token_embedding: Tensor):
        return self.dropout(
            token_embedding + self.pos_embedding[: token_embedding.size(0), :]
        )


class Encoder(nn.Module):
    def __init__(
        self, d_model, nhead, num_encoder_layers, dim_feedforward, dropout=0.1
    ):
        super().__init__()
        encoder_layer = nn.TransformerEncoderLayer(
            d_model, nhead, dim_feedforward, dropout
        )
        self.encoder = nn.TransformerEncoder(encoder_layer, num_encoder_layers)

    def forward(self, src, src_mask=None, src_key_padding_mask=None):
        """Forward function of Encoder

        Args:
            src (torch.Tensor): input tensor of shape (src_len, batch_size, d_model)
            src_mask (torch.Tensor, optional): The mask for the src sequence. Defaults to None.
            src_key_padding_mask (torch.Tensor, optional): The mask for the src keys per batch. Defaults to None.

        Returns:
            torch.Tensor: output tensor of shape (src_len, batch_size, d_model)
        """
        return self.encoder(src, src_mask, src_key_padding_mask)


class AttentiveDiscriminator(nn.Module):
    def __init__(
        self, d_model=512, nhead=8, num_layers=6, dim_feedforward=None, dropout=0.1
    ):
        """Discriminator: VideoMAE + output projection to probability"""
        super().__init__()
        self.positional_encoder = PositionalEncoding(d_model, dropout)

        dim_feedforward = dim_feedforward or 2 * d_model
        self.extractor = Encoder(d_model, nhead, num_layers, dim_feedforward, dropout)
        self.out = nn.Sequential(
            nn.Linear(d_model, 1),
            nn.Sigmoid(),
        )

    def forward(self, features, src_mask=None, src_key_padding_mask=None):
        """
        Args:
            features: [seq_len, batch_size, emb_size]
        Return:
            h : [1, emb_size]
                Last h from top layer of discriminator
            prob: [batch_size=1, 1]
                Probability to be original feature from CNN
        """
        # input to video mae must have seq_len = 16, therefore, we chunk the input using a Conv2D

        # [seq_len, batch_size, emb_size]
        encoded_features = self.extractor(
            self.positional_encoder(features), src_mask, src_key_padding_mask
        )

        # [batch_size, emb_size]
        h = encoded_features.mean(dim=0)

        # [batch_size, 1] -> [batch_size]
        prob = self.out(h).squeeze()

        return h, prob


class AttentiveAutoEncoder(nn.Module):
    def __init__(
        self, d_model=512, nhead=8, num_layers=6, dim_feedforward=None, dropout=0.1
    ):
        """AutoEncoder: VideoMAE + output projection to probability"""
        super().__init__()
        self.positional_encoder = PositionalEncoding(d_model, dropout)

        dim_feedforward = dim_feedforward or 2 * d_model
        self.encoder = Encoder(d_model, nhead, num_layers, dim_feedforward, dropout)
        self.decoder = Encoder(d_model, nhead, num_layers, dim_feedforward, dropout)

    def forward(self, features, src_mask=None, src_key_padding_mask=None):
        """
        Args:
            features: [seq_len, 1, hidden_size]
        Return:
            decoded_features: [seq_len, 1, hidden_size]
        """
        # position encoding + [seq_len, batch_size, emb_size]
        positional_features = self.positional_encoder(features)

        # [seq_len, batch_size, emb_size]
        encoded_features = self.encoder(
            positional_features, src_mask, src_key_padding_mask
        )

        decoded_features = self.decoder(
            encoded_features, src_mask, src_key_padding_mask
        )

        return decoded_features


class AttentiveSelector(nn.Module):
    def __init__(
        self, d_model=512, nhead=8, num_layers=6, dim_feedforward=None, dropout=0.1
    ):
        super().__init__()
        self.positional_encoder = PositionalEncoding(d_model, dropout)

        dim_feedforward = dim_feedforward or 2 * d_model
        self.extractor = Encoder(d_model, nhead, num_layers, dim_feedforward, dropout)
        self.selector = nn.Sequential(
            nn.Linear(d_model, 1),
            nn.Sigmoid(),
        )

    def forward(self, features, src_mask=None, src_key_padding_mask=None):
        """
        Args:
            features: [seq_len, batch_size, emb_size]
        Return:
            scores: [seq_len, batch_size]
        """
        # [seq_len, batch_size, emb_size]
        encoded_features = self.extractor(
            self.positional_encoder(features), src_mask, src_key_padding_mask
        )

        # [seq_len, batch_size]
        scores = self.selector(encoded_features).squeeze(-1)

        return scores


class AttentiveSummarizer(nn.Module):
    def __init__(
        self, d_model=512, nhead=8, num_layers=6, dim_feedforward=None, dropout=0.1
    ):
        super().__init__()
        self.attentive_selector = AttentiveSelector(
            d_model, nhead, num_layers, dim_feedforward, dropout
        )
        self.attentive_auto_encoder = AttentiveAutoEncoder(
            d_model, nhead, num_layers, dim_feedforward, dropout
        )

    def forward(self, features, src_mask=None, src_key_padding_mask=None):
        """
        Args:
            features: [seq_len, batch_size, emb_size]
        Return:
            scores: [seq_len, batch_size]
        """
        # [seq_len, 1]
        scores = self.attentive_selector(features, src_mask, src_key_padding_mask)

        weighted_features = features * scores.view(-1, 1, 1)

        # [seq_len, 1, hidden_size]
        decoded_features = self.attentive_auto_encoder(
            weighted_features, src_mask, src_key_padding_mask
        )

        return scores, decoded_features

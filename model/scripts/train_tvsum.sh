cd ..

python train.py --split_index 0 --video_type tvsum --hidden_size 256 --nhead 4 --num_layers 2 --lr 0.00002
python train.py --split_index 1 --video_type tvsum --hidden_size 256 --nhead 4 --num_layers 2 --lr 0.00002
python train.py --split_index 2 --video_type tvsum --hidden_size 256 --nhead 4 --num_layers 2 --lr 0.00002
python train.py --split_index 3 --video_type tvsum --hidden_size 256 --nhead 4 --num_layers 2 --lr 0.00002
python train.py --split_index 4 --video_type tvsum --hidden_size 256 --nhead 4 --num_layers 2 --lr 0.00002

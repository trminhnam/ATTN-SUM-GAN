import os
import sys

import sys
# add current file directory to path
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))))

import numpy as np
from knapsack_implementation import knapSack


def generate_summary(all_shot_bound, all_scores, all_nframes, all_positions):
    all_summaries = []
    for video_index in range(len(all_scores)):
        # Get shots' boundaries
        shot_bound = all_shot_bound[
            video_index
        ]  # [number_of_shots, 2] - the boundaries refer to the initial number of frames (before the subsampling)
        frame_init_scores = all_scores[video_index]
        n_frames = all_nframes[video_index]
        positions = all_positions[video_index]
        # print(f"shot_bound: {shot_bound}")
        # print(f"frame_init_scores: {frame_init_scores}")
        # print(f"n_frames: {n_frames}")
        # print(f"positions: {positions}")
        # exit()

        # Compute the importance scores for the initial frame sequence (not the subsampled one)
        frame_scores = np.zeros((n_frames), dtype=np.float32)
        if positions.dtype != int:
            positions = positions.astype(np.int32)
        if positions[-1] != n_frames:
            # print(f"positions[-1]: {positions[-1]} != n_frames: {n_frames}")
            positions = np.concatenate([positions, [n_frames]])
        # print(f"positions: {positions} with shape {positions.shape}")
        # exit()
        for i in range(len(positions) - 1):
            try:
                pos_left, pos_right = positions[i], positions[i + 1]
                if i == len(frame_init_scores):
                    frame_scores[pos_left:pos_right] = 0
                else:
                    # print(f"frame_init_scores[{i}]: {frame_init_scores[i]}")
                    # print(
                    #     f"frame_scores[{pos_left}:{pos_right}]: {frame_scores[pos_left:pos_right]}"
                    # )
                    # print()
                    frame_scores[pos_left:pos_right] = frame_init_scores[i]
            except Exception as e:
                print(f"e: {e}")
                continue

        # Compute shot-level importance scores by taking the average importance scores of all frames in the shot
        shot_imp_scores = []
        shot_lengths = []
        for shot in shot_bound:
            shot_lengths.append(shot[1] - shot[0] + 1)
            shot_imp_scores.append((frame_scores[shot[0] : shot[1] + 1].mean()).item())

        # Select the best shots using the knapsack implementation
        final_max_length = int((shot[1] + 1) * 0.15)

        selected = knapSack(
            final_max_length, shot_lengths, shot_imp_scores, len(shot_lengths)
        )

        # Select all frames from each selected shot (by setting their value in the summary vector to 1)
        summary = np.zeros(shot[1] + 1, dtype=np.int8)
        for shot in selected:
            summary[shot_bound[shot][0] : shot_bound[shot][1] + 1] = 1

        all_summaries.append(summary)

    return all_summaries

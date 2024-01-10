cd ..

# SMALL (hidden_size=256, nhead=4, num_layers=2)

python train.py --split_index 0 --video_type tvsum --hidden_size 256 --nhead 2 --num_layers 2 --save_dir ./output/ablation_num_head/2
python train.py --split_index 1 --video_type tvsum --hidden_size 256 --nhead 2 --num_layers 2 --save_dir ./output/ablation_num_head/2
python train.py --split_index 2 --video_type tvsum --hidden_size 256 --nhead 2 --num_layers 2 --save_dir ./output/ablation_num_head/2
python train.py --split_index 3 --video_type tvsum --hidden_size 256 --nhead 2 --num_layers 2 --save_dir ./output/ablation_num_head/2
python train.py --split_index 4 --video_type tvsum --hidden_size 256 --nhead 2 --num_layers 2 --save_dir ./output/ablation_num_head/2


# python train.py --split_index 0 --video_type tvsum --hidden_size 256 --nhead 8 --num_layers 2 --save_dir ./output/ablation_num_head/8
# python train.py --split_index 1 --video_type tvsum --hidden_size 256 --nhead 8 --num_layers 2 --save_dir ./output/ablation_num_head/8
# python train.py --split_index 2 --video_type tvsum --hidden_size 256 --nhead 8 --num_layers 2 --save_dir ./output/ablation_num_head/8
# python train.py --split_index 3 --video_type tvsum --hidden_size 256 --nhead 8 --num_layers 2 --save_dir ./output/ablation_num_head/8
# python train.py --split_index 4 --video_type tvsum --hidden_size 256 --nhead 8 --num_layers 2 --save_dir ./output/ablation_num_head/8


# python train.py --split_index 0 --video_type tvsum --hidden_size 256 --nhead 16 --num_layers 2 --save_dir ./output/ablation_num_head/16
# python train.py --split_index 1 --video_type tvsum --hidden_size 256 --nhead 16 --num_layers 2 --save_dir ./output/ablation_num_head/16
# python train.py --split_index 2 --video_type tvsum --hidden_size 256 --nhead 16 --num_layers 2 --save_dir ./output/ablation_num_head/16
# python train.py --split_index 3 --video_type tvsum --hidden_size 256 --nhead 16 --num_layers 2 --save_dir ./output/ablation_num_head/16
# python train.py --split_index 4 --video_type tvsum --hidden_size 256 --nhead 16 --num_layers 2 --save_dir ./output/ablation_num_head/16


# python train.py --split_index 0 --video_type tvsum --hidden_size 256 --nhead 32 --num_layers 2 --save_dir ./output/ablation_num_head/32
# python train.py --split_index 1 --video_type tvsum --hidden_size 256 --nhead 32 --num_layers 2 --save_dir ./output/ablation_num_head/32
# python train.py --split_index 2 --video_type tvsum --hidden_size 256 --nhead 32 --num_layers 2 --save_dir ./output/ablation_num_head/32
# python train.py --split_index 3 --video_type tvsum --hidden_size 256 --nhead 32 --num_layers 2 --save_dir ./output/ablation_num_head/32
# python train.py --split_index 4 --video_type tvsum --hidden_size 256 --nhead 32 --num_layers 2 --save_dir ./output/ablation_num_head/32


# python train.py --split_index 0 --video_type summe --hidden_size 256 --nhead 4 --num_layers 2 --save_dir ./output/ablation_num_head/
# python train.py --split_index 1 --video_type summe --hidden_size 256 --nhead 4 --num_layers 2 --save_dir ./output/ablation_num_head/
# python train.py --split_index 2 --video_type summe --hidden_size 256 --nhead 4 --num_layers 2 --save_dir ./output/ablation_num_head/
# python train.py --split_index 3 --video_type summe --hidden_size 256 --nhead 4 --num_layers 2 --save_dir ./output/ablation_num_head/
# python train.py --split_index 4 --video_type summe --hidden_size 256 --nhead 4 --num_layers 2 --save_dir ./output/ablation_num_head/


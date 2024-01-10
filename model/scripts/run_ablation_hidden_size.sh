cd ..

# SMALL (hidden_size=64, nhead=4, num_layers=2)
python train.py --split_index 0 --video_type tvsum --hidden_size 32 --nhead 4 --num_layers 2 --save_dir ./output/ablation_hidden_size/32
python train.py --split_index 1 --video_type tvsum --hidden_size 32 --nhead 4 --num_layers 2 --save_dir ./output/ablation_hidden_size/32
python train.py --split_index 2 --video_type tvsum --hidden_size 32 --nhead 4 --num_layers 2 --save_dir ./output/ablation_hidden_size/32
python train.py --split_index 3 --video_type tvsum --hidden_size 32 --nhead 4 --num_layers 2 --save_dir ./output/ablation_hidden_size/32
python train.py --split_index 4 --video_type tvsum --hidden_size 32 --nhead 4 --num_layers 2 --save_dir ./output/ablation_hidden_size/32

python train.py --split_index 0 --video_type tvsum --hidden_size 64 --nhead 4 --num_layers 2 --save_dir ./output/ablation_hidden_size/64
python train.py --split_index 1 --video_type tvsum --hidden_size 64 --nhead 4 --num_layers 2 --save_dir ./output/ablation_hidden_size/64
python train.py --split_index 2 --video_type tvsum --hidden_size 64 --nhead 4 --num_layers 2 --save_dir ./output/ablation_hidden_size/64
python train.py --split_index 3 --video_type tvsum --hidden_size 64 --nhead 4 --num_layers 2 --save_dir ./output/ablation_hidden_size/64
python train.py --split_index 4 --video_type tvsum --hidden_size 64 --nhead 4 --num_layers 2 --save_dir ./output/ablation_hidden_size/64

python train.py --split_index 0 --video_type tvsum --hidden_size 128 --nhead 4 --num_layers 2 --save_dir ./output/ablation_hidden_size/128
python train.py --split_index 1 --video_type tvsum --hidden_size 128 --nhead 4 --num_layers 2 --save_dir ./output/ablation_hidden_size/128
python train.py --split_index 2 --video_type tvsum --hidden_size 128 --nhead 4 --num_layers 2 --save_dir ./output/ablation_hidden_size/128
python train.py --split_index 3 --video_type tvsum --hidden_size 128 --nhead 4 --num_layers 2 --save_dir ./output/ablation_hidden_size/128
python train.py --split_index 4 --video_type tvsum --hidden_size 128 --nhead 4 --num_layers 2 --save_dir ./output/ablation_hidden_size/128

python train.py --split_index 0 --video_type tvsum --hidden_size 512 --nhead 4 --num_layers 2 --save_dir ./output/ablation_hidden_size/512
python train.py --split_index 1 --video_type tvsum --hidden_size 512 --nhead 4 --num_layers 2 --save_dir ./output/ablation_hidden_size/512
python train.py --split_index 2 --video_type tvsum --hidden_size 512 --nhead 4 --num_layers 2 --save_dir ./output/ablation_hidden_size/512
python train.py --split_index 3 --video_type tvsum --hidden_size 512 --nhead 4 --num_layers 2 --save_dir ./output/ablation_hidden_size/512
python train.py --split_index 4 --video_type tvsum --hidden_size 512 --nhead 4 --num_layers 2 --save_dir ./output/ablation_hidden_size/512


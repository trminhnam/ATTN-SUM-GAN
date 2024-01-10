cd ..

# SMALL (hidden_size=256, nhead=4, num_layers=2)

python train.py --split_index 0 --video_type tvsum --hidden_size 256 --nhead 4 --num_layers 1 --save_dir ./output/ablation_num_layers/1
python train.py --split_index 1 --video_type tvsum --hidden_size 256 --nhead 4 --num_layers 1 --save_dir ./output/ablation_num_layers/1
python train.py --split_index 2 --video_type tvsum --hidden_size 256 --nhead 4 --num_layers 1 --save_dir ./output/ablation_num_layers/1
python train.py --split_index 3 --video_type tvsum --hidden_size 256 --nhead 4 --num_layers 1 --save_dir ./output/ablation_num_layers/1
python train.py --split_index 4 --video_type tvsum --hidden_size 256 --nhead 4 --num_layers 1 --save_dir ./output/ablation_num_layers/1


python train.py --split_index 0 --video_type tvsum --hidden_size 256 --nhead 4 --num_layers 3 --save_dir ./output/ablation_num_layers/3
python train.py --split_index 1 --video_type tvsum --hidden_size 256 --nhead 4 --num_layers 3 --save_dir ./output/ablation_num_layers/3
python train.py --split_index 2 --video_type tvsum --hidden_size 256 --nhead 4 --num_layers 3 --save_dir ./output/ablation_num_layers/3
python train.py --split_index 3 --video_type tvsum --hidden_size 256 --nhead 4 --num_layers 3 --save_dir ./output/ablation_num_layers/3
python train.py --split_index 4 --video_type tvsum --hidden_size 256 --nhead 4 --num_layers 3 --save_dir ./output/ablation_num_layers/3


python train.py --split_index 0 --video_type tvsum --hidden_size 256 --nhead 4 --num_layers 4 --save_dir ./output/ablation_num_layers/4
python train.py --split_index 1 --video_type tvsum --hidden_size 256 --nhead 4 --num_layers 4 --save_dir ./output/ablation_num_layers/4
python train.py --split_index 2 --video_type tvsum --hidden_size 256 --nhead 4 --num_layers 4 --save_dir ./output/ablation_num_layers/4
python train.py --split_index 3 --video_type tvsum --hidden_size 256 --nhead 4 --num_layers 4 --save_dir ./output/ablation_num_layers/4
python train.py --split_index 4 --video_type tvsum --hidden_size 256 --nhead 4 --num_layers 4 --save_dir ./output/ablation_num_layers/4
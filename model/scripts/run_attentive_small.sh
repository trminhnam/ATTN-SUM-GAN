cd ..

# SMALL (hidden_size=256, nhead=4, num_layers=2)
python train.py --split_index 0 --video_type tvsum --hidden_size 256 --nhead 4 --num_layers 2 --save_dir ./output/attentive/small
python train.py --split_index 1 --video_type tvsum --hidden_size 256 --nhead 4 --num_layers 2 --save_dir ./output/attentive/small
python train.py --split_index 2 --video_type tvsum --hidden_size 256 --nhead 4 --num_layers 2 --save_dir ./output/attentive/small
python train.py --split_index 3 --video_type tvsum --hidden_size 256 --nhead 4 --num_layers 2 --save_dir ./output/attentive/small
python train.py --split_index 4 --video_type tvsum --hidden_size 256 --nhead 4 --num_layers 2 --save_dir ./output/attentive/small

python train.py --split_index 0 --video_type summe --hidden_size 256 --nhead 4 --num_layers 2 --save_dir ./output/attentive/small
python train.py --split_index 1 --video_type summe --hidden_size 256 --nhead 4 --num_layers 2 --save_dir ./output/attentive/small
python train.py --split_index 2 --video_type summe --hidden_size 256 --nhead 4 --num_layers 2 --save_dir ./output/attentive/small
python train.py --split_index 3 --video_type summe --hidden_size 256 --nhead 4 --num_layers 2 --save_dir ./output/attentive/small
python train.py --split_index 4 --video_type summe --hidden_size 256 --nhead 4 --num_layers 2 --save_dir ./output/attentive/small


cd ..

# LARGE (hidden_size=512, num_layers=4)
python main.py --split_index 0 --video_type tvsum --hidden_size 512 --num_layers 4 --save_dir ./output/lstm/large
python main.py --split_index 1 --video_type tvsum --hidden_size 512 --num_layers 4 --save_dir ./output/lstm/large
python main.py --split_index 2 --video_type tvsum --hidden_size 512 --num_layers 4 --save_dir ./output/lstm/large
python main.py --split_index 3 --video_type tvsum --hidden_size 512 --num_layers 4 --save_dir ./output/lstm/large
python main.py --split_index 4 --video_type tvsum --hidden_size 512 --num_layers 4 --save_dir ./output/lstm/large

python main.py --split_index 0 --video_type summe --hidden_size 512 --num_layers 4 --save_dir ./output/lstm/large
python main.py --split_index 1 --video_type summe --hidden_size 512 --num_layers 4 --save_dir ./output/lstm/large
python main.py --split_index 2 --video_type summe --hidden_size 512 --num_layers 4 --save_dir ./output/lstm/large
python main.py --split_index 3 --video_type summe --hidden_size 512 --num_layers 4 --save_dir ./output/lstm/large
python main.py --split_index 4 --video_type summe --hidden_size 512 --num_layers 4 --save_dir ./output/lstm/large


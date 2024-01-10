cd ..

# SMALL (hidden_size=256, num_layers=2)
# python main.py --split_index 0 --video_type tvsum --hidden_size 256 --num_layers 2 --save_dir ./output/lstm/small
# python main.py --split_index 1 --video_type tvsum --hidden_size 256 --num_layers 2 --save_dir ./output/lstm/small
# python main.py --split_index 2 --video_type tvsum --hidden_size 256 --num_layers 2 --save_dir ./output/lstm/small
# python main.py --split_index 3 --video_type tvsum --hidden_size 256 --num_layers 2 --save_dir ./output/lstm/small
# python main.py --split_index 4 --video_type tvsum --hidden_size 256 --num_layers 2 --save_dir ./output/lstm/small

# python main.py --split_index 0 --video_type summe --hidden_size 256 --num_layers 2 --save_dir ./output/lstm/small
# python main.py --split_index 1 --video_type summe --hidden_size 256 --num_layers 2 --save_dir ./output/lstm/small
python main.py --split_index 2 --video_type summe --hidden_size 256 --num_layers 2 --save_dir ./output/lstm/small
python main.py --split_index 3 --video_type summe --hidden_size 256 --num_layers 2 --save_dir ./output/lstm/small
python main.py --split_index 4 --video_type summe --hidden_size 256 --num_layers 2 --save_dir ./output/lstm/small


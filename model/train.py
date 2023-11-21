import json
from configs import get_config
from attentive_solver import AttentiveSolver
from data_loader import get_loader
import wandb


if __name__ == "__main__":
    config = get_config(mode="train")
    test_config = get_config(mode="test")

    print(config)
    print(test_config)
    print("split_index:", config.split_index)

    train_loader = get_loader(config.mode, config.split_index, batch_size=1)
    test_loader = get_loader(test_config.mode, test_config.split_index)
    solver = AttentiveSolver(config, train_loader, test_loader)

    wandb.init(
        project=config.wandb_project,
        config=config,
        name=f"{config.wandb_run_prefix}{config.video_type}-split{config.split_index}",
    )

    solver.build()
    # solver.evaluate(
    #     -1
    # )  # evaluates the summaries generated using the initial random weights of the network
    solver.train()

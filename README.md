# データ収集

## 関連サイト

- https://github.com/ugo-plus/lerobot-robot-ugo-pro


## セットアップ

```
source setup_env1.sh or source setup_env2.sh
```

## カメラ確認

```
uv run lerobot-find-cameras
```

## テレオペ

```
uv run lerobot-teleoperate \
  --robot.type=ugo_pro \
  --robot.id=my_ugo_pro \
  --robot.cameras="{ front: {type: opencv, index_or_path: 2, width: 640, height: 480, fps: 30}, left: {type: opencv, index_or_path: 6, width: 640, height: 480, fps: 30}, right: {type: opencv, index_or_path: 10, width: 640, height: 480, fps: 30}}" \
  --teleop.type=ugo_bilcon \
  --teleop.id=my_ugo_bilcon \
  --display_data=true
```

```
uv run lerobot-record \
  --robot.type=ugo_pro \
  --robot.id=my_ugo_pro \
  --robot.cameras="{ front: {type: opencv, index_or_path: 2, width: 640, height: 480, fps: 30}, left: {type: opencv, index_or_path: 6, width: 640, height: 480, fps: 30}, right: {type: opencv, index_or_path: 10, width: 640, height: 480, fps: 30}}" \
  --teleop.type=ugo_bilcon \
  --teleop.id=my_ugo_bilcon \
  --display_data=false \
  --dataset.fps=30 \
  --dataset.reset_time_s=10 \
  --dataset.episode_time_s=20 \
  --dataset.push_to_hub=false \
  --dataset.repo_id=$REPO_ID \
  --dataset.single_task="$TASK_NAME" \
  --dataset.num_episodes=1 \
  --resume=true
```


```
TOKEN=
```
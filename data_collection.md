# 実データ収集に関するドキュメント

## 開発環境に入る

vscodeで以下のコマンドを実行して、テレオペできることを確認する

```bash
. .venv/bin/activate
```

## 動作確認

vscodeで以下のコマンドを実行して、テレオペできることを確認する。このとき`--robot.cameras`のindex_or_pathに関しては、`uv run lerobot-find-cameras`で確認できたものを使用する。

本作業は、データ収集間に一度確認する程度でよい。またまれにcameraのindexが変わることがある（コマンドがエラーになる）ので、その際は`uv run lerobot-find-cameras`で改めてcameraのインデックスを確認する。

```bash
uv run lerobot-teleoperate \
  --robot.type=ugo_pro \
  --robot.id=my_ugo_pro \
  --robot.cameras="{ front: {type: opencv, index_or_path: 6, width: 640, height: 480, fps: 30}, left: {type: opencv, index_or_path: 2, width: 640, height: 480, fps: 30}, right: {type: opencv, index_or_path: 10, width: 640, height: 480, fps: 30}}" \
  --teleop.type=ugo_bilcon \
  --teleop.id=my_ugo_bilcon \
  --display_data=true
```

## データ収集

vscodeで以下のコマンドを実行して、データ収集を開始する。このとき`--robot.cameras`のindex_or_pathに関しては、`uv run lerobot-find-cameras`で確認できたものを使用する。

```
uv run lerobot-record \
  --robot.type=ugo_pro \
  --robot.id=my_ugo_pro \
  --robot.cameras="{ front: {type: opencv, index_or_path: 6, width: 640, height: 480, fps: 30}, left: {type: opencv, index_or_path: 2, width: 640, height: 480, fps: 30}, right: {type: opencv, index_or_path: 10, width: 640, height: 480, fps: 30}}" \
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

コマンド実行後、以下の1から2まで進め初期姿勢をとり、その後recoding episodeという音声が聞こえたら、3から13までに沿ってPick and Placeを進める

1. グリッパー閉じる
2. 腕の高さをボックスより少し高い位置、奥行きはテーブルの手前、横方向を2つの郵便受けの間にする。（レクシャーします。）
3. 腕を操作して奥行きを郵便物が取れる位置まで伸ばす。
4. グリッパーを郵便物を余裕で掴める広さまで解放
5. 腕を郵便物が掴める高さまで移動（下げる）
6. 郵便物をグリッパーで握る
7. 腕を郵便受けの高さよりも高い位置に調整（上げる）
8. 腕を横移動させて、指定の郵便受けの位置に合わせる。（横移動）
9. 印の真ん中に郵便物が来るように奥行きを合わせる
10. 郵便物が郵便受けの底あたりにつく程度まで腕を下げる（くっつかない程度）
11. グリッパーを解放して、郵便物を離す
12. 腕を郵便受けよりも少し高い位置に持ち上げる。
13. 腕を引いて、肘がセットポジションの位置に戻す
14. 手首を上げて、カメラでテーブルの上が見えるようにする
15. グリッパーを握る
16. PCの右矢印を押下して作業完了

__データ収集後、タスクが成功したか失敗したかメモをとる__

失敗の条件

- recoding 時間終了までに作業を完了できなかった（13まで完了できていない）
- 腕を机にぶつけてしまった
- 郵便物を横移動させたときに郵便受けに郵便物をぶつけてしまった。

成功の条件

- 時間内に作業を完了させた
- 一度掴み取ろうとして、掴み損ねたが、リトライして成功している

## 注意事項

- 丁寧な作業をお願いします。
- ロボットはオペレーターの操作を模倣して動けるようになるため、作業スピードが一定ではない（特定のエピソードでは極端に早く、別のエピソードでは極端に遅いなど）場合、学習しずらいデータになります。


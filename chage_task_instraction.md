# 実データ収集時にやること

## 掴む箱の種類が変わるたびにセットアップすること（環境変数のセットアップ）

### 丸印の箱をpick and placeする場合

丸印の箱をpick and placeする場合には以下のコマンドを実行する

- `source setup_circle.sh`

その後以下のコマンドを実行して、`Pick up the package marked with a circle and place it in the box marked with a circle.`が表示されることを確認する。

- echo $TASK_NAME

### X印の箱をpick and placeする場合

X印の箱をpick and placeする場合には以下のコマンドを実行する

- `source setup_cross.sh`

その後以下のコマンドを実行して、`Pick up the package marked with a cross and place it in the box marked with a cross.`が表示されることを確認する。

- echo $TASK_NAME
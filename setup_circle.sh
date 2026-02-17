#!/bin/bash

export REPO_ID="Kosuke21/nttus"
export TASK_NAME="Pick up the package marked with a circle and place it in the box marked with a circle."

# .envファイルからHF_TOKENを読み込む
set -a
source .env
set +a


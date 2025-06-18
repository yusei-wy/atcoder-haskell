#!/bin/sh
# 使い方: ./make-problem.sh フォルダ名

DIR="$1"
mkdir -p "$DIR"
cp ./templates/default.hs "$DIR/Main.hs"

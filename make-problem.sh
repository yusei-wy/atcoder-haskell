#!/bin/sh
# 使い方: ./make-problem.sh abc476-a

if [ "$#" -ne 1 ]; then
  echo "使い方: $0 コンテスト名-問題記号（例: abc476-a）" >&2
  exit 1
fi

DIR="$1"
CONTEST="${DIR%-*}"
TASK="${DIR##*-}"

case "$DIR" in
  *-*) ;;
  *)
    echo "形式が正しくありません（例: abc476-a）" >&2
    exit 1
    ;;
esac

case "$CONTEST" in
  '' | *[!a-z0-9]*)
    echo "コンテスト名は小文字英数字で指定してください: $DIR" >&2
    exit 1
    ;;
esac

case "$TASK" in
  [a-g]) ;;
  *)
    echo "問題記号は a-g の1文字で指定してください: $DIR" >&2
    exit 1
    ;;
esac

mkdir -p "$DIR"
cp ./templates/default.hs "$DIR/Main.hs"

PROBLEM_ID="${CONTEST}_${TASK}"
PROBLEM_URL="https://atcoder.jp/contests/${CONTEST}/tasks/${PROBLEM_ID}"
if [ ! -e "$DIR/NOTE.md" ]; then
  sed \
    -e "s|{{PROBLEM_ID}}|${DIR}|g" \
    -e "s|{{PROBLEM_URL}}|${PROBLEM_URL}|g" \
    ./templates/NOTE.template.md >"$DIR/NOTE.md"
fi

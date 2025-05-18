#!/bin/bash

# executables セクションの開始を検出
start_line=$(grep -n '^executables:' package.yaml | cut -d: -f1)

# executables セクションが存在しない場合、ファイルの末尾に追加
if [ -z "$start_line" ]; then
  echo -e "\nexecutables:" >> package.yaml
  start_line=$(grep -n '^executables:' package.yaml | cut -d: -f1)
fi

# executables セクションの後に既存のエントリを削除
head -n $start_line package.yaml > package.yaml.tmp

# 各ディレクトリに対してエントリを追加
for dir in abc*; do
  if [ -d "$dir" ] && [ -f "$dir/Main.hs" ]; then
    echo "  ${dir}:" >> package.yaml.tmp
    echo "    main: Main.hs" >> package.yaml.tmp
    echo "    source-dirs: ${dir}" >> package.yaml.tmp
  fi
done

# 元のファイルを置き換え
mv package.yaml.tmp package.yaml

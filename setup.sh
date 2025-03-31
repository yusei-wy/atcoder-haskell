#!/bin/bash
contest=$1
problems=("a" "b" "c")

mkdir -p "$contest"
for p in "${problems[@]}"; do
    mkdir -p "$contest/$p"
    cp "./template/Main.hs" "$contest/$p/Main.hs"
done
echo "Created directories for $contest: ${problems[*]}"

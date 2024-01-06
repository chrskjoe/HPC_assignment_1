#!/bin/bash

block_sizes=(
    "16"
    "32"
    "64"
    "128"
    "264"
    "512"
    "1024"
    "2048"
    "4096"
)

for block_size in "${block_sizes[@]}"; do
    /appl/gprofng/20231218/bin/gp-collect-app -o test.$block_size.er -p on -S on -h dch -h dcm -h l2h -h l2m -h l3h -h l3m  ./mm_batch_blk.sub $block_size 
    gprofng display text -functions test.$block_size.er/
done
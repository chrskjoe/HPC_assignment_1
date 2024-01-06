#!/bin/bash

make clean
make OPT="-g -O3 -funroll-loops"
# I put some long time because my jobs were being killed
# trying with both kmn mkn (they should have similar performance)
# All the block sizes were calculated, but I put a lower one just to
# check

block_sizes=(
    "16"
    "32"
    "64"
    "128"
    "256"
    "512"
    "1024"
    "2048"
    "4096"
)

for block_size in "${block_sizes[@]}"; do
    bsub -J $block_size -W 1:30 -o "output/block/" ./mm_batch_blk.sub $block_size
done
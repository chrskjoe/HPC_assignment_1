#!/bin/bash

block_sizes=(
    "512"
    "1024"
    "4096"
    "524288" 
)

for block in "${block_sizes[@]}"; do
    perf stat -e L1-dcache-load-misses,L1-dcache-store-misses ./mm_batch_blk.sub $block >> l1
done

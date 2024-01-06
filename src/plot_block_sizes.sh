#!/bin/bash

# input_dir="data"

# block_sizes=(
#     "16"
#     "32"
#     "64"
#     "128"
#     "256"
#     "512"
#     "1024"
#     "2048"
#     "4096"
# )

# top_combinations=(
#     "kmn"
#     "mkn"
# )

# python3 "../mhplot.py" \
#     "${input_dir}/block/${block_sizes[0]}.dat" \
#     "${input_dir}/block/${block_sizes[1]}.dat" \
#     "${input_dir}/block/${block_sizes[2]}.dat" \
#     "${input_dir}/block/${block_sizes[3]}.dat" \
#     "${input_dir}/block/${block_sizes[4]}.dat" \
#     "${input_dir}/block/${block_sizes[5]}.dat" \
#     "${input_dir}/block/${block_sizes[6]}.dat" \
#     "${input_dir}/block/${block_sizes[7]}.dat" \
#     "${input_dir}/block/${block_sizes[8]}.dat" \
#     -l ${block_sizes[@]} \
#     -n "block_sizes.png" \
#     -t "Perfomance Matrix Multiplication (block size)" \
#     -log

# python3 "../mhplot.py" \
#     "${input_dir}/block/${block_sizes[0]}.dat" \
#     "${input_dir}/block/${block_sizes[1]}.dat" \
#     "${input_dir}/block/${block_sizes[2]}.dat" \
#     "${input_dir}/block/${block_sizes[3]}.dat" \
#     "${input_dir}/block/${block_sizes[4]}.dat" \
#     "${input_dir}/block/${block_sizes[5]}.dat" \
#     "${input_dir}/block/${block_sizes[6]}.dat" \
#     "${input_dir}/block/${block_sizes[7]}.dat" \
#     "${input_dir}/block/${block_sizes[8]}.dat" \
#     "${input_dir}/${top_combinations[1]}.dat" \
#     -l ${block_sizes[@]} ${top_combinations[1]}\
#     -n "block_sizes_mkn.png" \
#     -t "Blocked matrix multiplication (block size)" \
#     -log

python3 ../mhplot.py \
"data/block.dat" \
-l "block size"  \
-n block.png \
-log 
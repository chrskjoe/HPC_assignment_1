#!/bin/bash

input_dir="data"

block_sizes=(
    "512"
    "1024"
    "4096"
    "524288"
)

top_combinations=(
    "knm"
    "nkm"
)

python3 "../mhplot.py" \
    "${input_dir}/block/${block_sizes[0]}.dat" \
    "${input_dir}/block/${block_sizes[1]}.dat" \
    "${input_dir}/block/${block_sizes[2]}.dat" \
    "${input_dir}/block/${block_sizes[3]}.dat" \
    -l ${block_sizes[@]} \
    -n "block_sizes.png" \
    -t "Perfomance Matrix Multiplication (block size)" \
    -log

python3 "../mhplot.py" \
    "${input_dir}/block/${block_sizes[0]}.dat" \
    "${input_dir}/block/${block_sizes[1]}.dat" \
    "${input_dir}/block/${block_sizes[2]}.dat" \
    "${input_dir}/block/${block_sizes[3]}.dat" \
    "${input_dir}/${top_combinations[0]}.dat" \
    "${input_dir}/${top_combinations[1]}.dat" \
    -l ${block_sizes[@]} ${top_combinations[@]}\
    -n "block_sizes_knm_nkm.png" \
    -t "Blocked matrix multiplication (block size)" \
    -log
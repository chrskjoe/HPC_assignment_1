#!/bin/bash
input_dir="data/compiler-flags"

options=(
    "O0"
    "O3"
    "O3-funroll-loops"
)

permutations=(
    "kmn"
    "knm"
    "mkn"
    "mnk"
    "nkm"
    "nmk"
)

for option in "${options[@]}"; do
    echo -e "Option: $option"
    python3 "../mhplot.py" \
    "$input_dir/$option/kmn.dat" \
    "$input_dir/$option/knm.dat" \
    "$input_dir/$option/mkn.dat" \
    "$input_dir/$option/mnk.dat" \
    "$input_dir/$option/nkm.dat" \
    "$input_dir/$option/nmk.dat" \
    -l kmn knm mkn mnk nkm nmk \
    -n "${option}mhplot.png" \
    -log
done

for permutation in "${permutations[@]}"; do
    echo -e "Permutation: $permutation"
    python3 "../optplot.py" \
    "$input_dir/${options[0]}/$permutation.dat" \
    "$input_dir/${options[1]}/$permutation.dat" \
    "$input_dir/${options[2]}/$permutation.dat" \
    -l "${options[0]}" "${options[1]}" "${options[2]}" \
    -n "${permutation}optplot.png" \
    -log
done
    


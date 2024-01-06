#!/bin/bash

declare -A options

# Mapping option to directory name
options["O0"]="O0" # equivalent to no optimizations
options["O3"]="O3"
options["O3 -funroll-loops"]="O3-funroll-loops"

for option in  "${!options[@]}"; do
    echo -e "Option: $option ${options[$option]}"
    make clean
    make OPT=" -g -$option"
    # I put some long time because my jobs were being killed
    # bsub -W 1:30 -o "output/${options[$option]}/" ./mm_batch_kmn.sub
    # bsub -W 1:30 -o "output/${options[$option]}/" ./mm_batch_knm.sub
    bsub -W 1:30 -o "output/${options[$option]}/" ./mm_batch_mkn.sub
    # bsub -W 1:30 -o "output/${options[$option]}/" ./mm_batch_mnk.sub
    # bsub -W 1:30 -o "output/${options[$option]}/" ./mm_batch_nmk.sub
    # bsub -W 1:30 -o "output/${options[$option]}/" ./mm_batch_nkm.sub
done
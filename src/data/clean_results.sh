#!/bin/bash

# Run this script to automatically clean the output files
# It's a bit funky but it works
# +3
line_skip=3

basedir="."

for subdir in "${basedir}"/*/; do
    echo "Files in ${subdir}:"
    for input in "${subdir}"*; do
        if [[ $input == *.out ]]; then
            output=$(grep -oE '[^/]{3}\.sub' $input | rev | cut -c 5- | rev)
            output_dir="${subdir}"
            head $input -n 22 | tail -n "+${line_skip}" | awk '{print $1, $2}' > "$output_dir$output.dat"
        else
            echo "Skipped: $input (not a .out file)"
        fi
    done
done
#!/bin/bash

make OPT="-g -O3 -funroll-loops"
# I put some long time because my jobs were being killed
# trying with both mnk mkn (they should have similar performance)
# All the block sizes were calculated, but I put a lower one just to
# check
bsub -W 1:30 -o "output/block/" ./mm_batch_blk.sub 512
bsub -W 1:30 -o "output/block/" ./mm_batch_blk.sub 1024
bsub -W 1:30 -o "output/block/" ./mm_batch_blk.sub 4096
bsub -W 1:30 -o "output/block/" ./mm_batch_blk.sub 524288 
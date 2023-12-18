#!/bin/bash

# chaPhase
# exp_list=(002_00  005_00  010_00  014_00  018_00  021_00  025_00  028_00  031_00 040_00  \
# 003_00  008_00  011_00  015_00  019_00  022_00   046_00  050_00 \
# 004_00  009_00  013_00  017_00  020_00  027_00  030_00  039_00 )

# devPhase
exp_list=(004_00 005_00 006_00 007_00 009_00 010_00 011_00 012_00 013_00 \
014_00 015_00 016_00 018_00 019_00 020_00 023_00 024_00 025_00 \
026_00 029_00 030_00 032_00 033_00 034_00 035_00 036_00 037_00 \
038_00 040_00 041_00 042_00 043_00 044_00 045_00 047_00 048_00 \
049_00 051_00)

for i in {0..37..4}; do
{
CUDA_VISIBLE_DEVICES=3 python train.py --config configs/islh_mask4.txt \
    --datadir ./data/nerf_datasets/ILSH/chaPhase/${exp_list[i]} \
    --expname tensorf_ILSH_VM_${exp_list[i]}_vit_mask4_acc1e-2 \
    > log/tensorf_ILSH_VM_${exp_list[i]}_vit_mask4_acc1e-2_log.txt 2>&1 & 
CUDA_VISIBLE_DEVICES=4 python train.py --config configs/islh_mask4.txt \
    --datadir ./data/nerf_datasets/ILSH/chaPhase/${exp_list[i+1]} \
    --expname tensorf_ILSH_VM_${exp_list[i+1]}_vit_mask4_acc1e-2 \
    > log/tensorf_ILSH_VM_${exp_list[i+1]}_vit_mask4_acc1e-2_log.txt 2>&1 & 
CUDA_VISIBLE_DEVICES=5 python train.py --config configs/islh_mask4.txt \
    --datadir ./data/nerf_datasets/ILSH/chaPhase/${exp_list[i+2]} \
    --expname tensorf_ILSH_VM_${exp_list[i+2]}_vit_mask4_acc1e-2 \
    > log/tensorf_ILSH_VM_${exp_list[i+2]}_vit_mask4_acc1e-2_log.txt 2>&1 & 
CUDA_VISIBLE_DEVICES=6 python train.py --config configs/islh_blender.txt \
    --datadir ./data/nerf_datasets/ILSH/chaPhase/${exp_list[i+3]} \
    --expname tensorf_ILSH_VM_${exp_list[i+3]}_vit_mask4_acc1e-2 \
    > tensorf_ILSH_VM_${exp_list[i+3]}_vit_mask4_acc1e-2_log.txt 2>&1 & 
# echo ${exp_list[i]} & 
# echo ${exp_list[i+1]} &
# sleep 1
wait
}
done
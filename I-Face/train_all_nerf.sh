#!/bin/bash

# devPhase
# exp_list=(004_00 005_00 006_00 007_00 009_00 010_00 011_00 012_00 013_00 \
# 014_00 015_00 016_00 018_00 019_00 020_00 023_00 024_00 025_00 \
# 026_00 029_00 030_00 032_00 033_00 034_00 035_00 036_00 037_00 \
# 038_00 040_00 041_00 042_00 043_00 044_00 045_00 047_00 048_00 \
# 049_00 051_00)

# chaPhase
exp_list=(002_00  005_00  010_00  014_00  018_00  021_00  025_00  028_00  031_00  036_00  040_00  043_00  049_00 \
003_00  008_00  011_00  015_00  019_00  022_00  026_00  029_00  032_00  038_00  041_00  046_00  050_00 \
004_00  009_00  013_00  017_00  020_00  023_00  027_00  030_00  033_00  039_00  042_00  047_00 )


for i in {0..37..2}; do
{
python launch.py --config configs/nerf-blender_ilsh.yaml  --gpu 4 \
    --train dataset.scene=\'${exp_list[i]}\' tag=result \
    > ./exp/log_nerf-result-${exp_list[i]}.txt 2>&1 &
python launch.py --config configs/nerf-blender_ilsh.yaml  --gpu 5 \
    --train dataset.scene=\'${exp_list[i+1]}\' tag=result \
    > ./exp/log_nerf-result-${exp_list[i+1]}.txt 2>&1 &
# CUDA_VISIBLE_DEVICES=6 python train.py --config configs/islh.txt \
#     --datadir ./data/nerf_datasets/ILSH/devPhase/${exp_list[i]} \
#     --expname tensorf_ILSH_VM_${exp_list[i]}_baseline \
#     > tensorf_ILSH_VM_${exp_list[i]}_baseline/log.txt 2>&1 &
# CUDA_VISIBLE_DEVICES=7 python train.py --config configs/islh.txt \
#     --datadir ./data/nerf_datasets/ILSH/devPhase/${exp_list[i+1]} \
#     --expname tensorf_ILSH_VM_${exp_list[i+1]}_baseline \
#     > tensorf_ILSH_VM_${exp_list[i+1]}_baseline/log.txt 2>&1 & 
# CUDA_VISIBLE_DEVICES=8 python train.py --config configs/islh.txt \
#     --datadir ./data/nerf_datasets/ILSH/devPhase/${exp_list[i+2]} \
#     --expname tensorf_ILSH_VM_${exp_list[i+2]}_baseline \
#     > tensorf_ILSH_VM_${exp_list[i+2]}_baseline/log.txt 2>&1 & 
# CUDA_VISIBLE_DEVICES=9 python train.py --config configs/islh.txt \
#     --datadir ./data/nerf_datasets/ILSH/devPhase/${exp_list[i+3]} \
#     --expname tensorf_ILSH_VM_${exp_list[i+3]}_baseline \
#     > tensorf_ILSH_VM_${exp_list[i+3]}_baseline/log.txt 2>&1 & 
# echo ${exp_list[i]} & 
# echo ${exp_list[i+1]} &
# sleep 1
wait
}
done
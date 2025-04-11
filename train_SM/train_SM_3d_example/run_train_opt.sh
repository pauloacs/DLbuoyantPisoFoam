#/bin/bash

dropout_rate="0.02"

lr="1e-4"
batch_size="1024"

echo ${lr}

datasetPath="../generate_data_3d/dataset_plate_heat_3d_2sims_25ts_07Apr.hdf5"
outarrayPath="gridded_sim_data.h5"
outarrayFlatPath="PC_data.h5"

num_sims="2"
first_t="5"
num_ts="25"
n_samples_per_frame="2000"
var="0.95"

model_size="MLP_small"

num_epoch="1000"
chunk_size="500"
grid_res="2e-3"
block_size="16"
max_num_PC="128"
train_3d_optimized --dataset_path ${datasetPath} --outarray_fn ${outarrayPath} --num_sims ${num_sims} --num_epoch ${num_epoch} --lr ${lr} --n_samples_per_frame ${n_samples_per_frame} --var_p ${var} --var_in ${var} --model_architecture ${model_size} --last_t ${num_ts} --first_t ${first_t} --outarray_flat_fn ${outarrayFlatPath} --dropout_rate ${dropout_rate} --batch_size ${batch_size} --chunk_size ${chunk_size} --new_model "True" --grid_res ${grid_res} --block_size ${block_size} --max_num_PC ${max_num_PC} 

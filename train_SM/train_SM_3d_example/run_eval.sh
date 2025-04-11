#/bin/bash

datasetPath="../generate_data_3d/dataset_plate_heat_3d_2sims_10ts_03Apr.hdf5"
num_sims="2"
num_ts="10"
var="0.95"
delta="2e-3"
block_size="16"

model_name="model_MLP_small-std-0.95-drop0.02-lr0.0001-regNone-batch1024.h5"
echo ${model_name}
evaluation_3d --model_name ${model_name} --var_p ${var} --var_in ${var} --dataset_path ${datasetPath} --n_sims ${num_sims} --n_ts ${num_ts} --delta ${delta} --block_size ${block_size} --save_plots

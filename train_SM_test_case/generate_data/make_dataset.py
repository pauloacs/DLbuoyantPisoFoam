import os
from tqdm import *
import subprocess
import random


scale = 2
grading = 3

L = [0.5]*10 + [0.75]*10 + [1]*10 + [1.25]*10 + [1.5]*10
b = [0.05]*50
alpha = [-85, -80, -70, -60, -50, -40, -30, -20, -10, -5]*5
x_cord = [4]*50

num_runs = len(L)
sim_data_path = 'simulation_data'

# Create the simulation_data directory if it doesn't exist
if not os.path.exists(sim_data_path):
    os.makedirs(sim_data_path)

for i in tqdm(range(num_runs)):
    with open(os.devnull, 'w') as devnull:
        # Remove any previous simulation file
        cmd = f"rm -rf {sim_data_path}/{i}"
        subprocess.check_call(cmd.split(' '), stdout=devnull, stderr=devnull)

        # Copy the OpenFOAM forwardStep directory
        cmd = f"cp -a ./original_snappy/. ./{sim_data_path}/{i}"
        subprocess.check_call(cmd.split(' '), stdout=devnull, stderr=devnull)

        # Remove the blockMeshDict file from system directory
        cmd = f"rm -f ./{sim_data_path}/{i}/system/blockMeshDict"
        subprocess.check_call(cmd.split(' '), stdout=devnull, stderr=devnull)

        # Execute python program to write a blockMeshDict file
        cmd = "python gen_blockMeshDict_plate.py"+ " " + str(x_cord[i]) + " " + str(L[i]) + " " + str(b[i]) + " " + str(alpha[i]) + " " + str(scale) + " " + str(grading)
        subprocess.check_call(cmd.split(' '), stdout=devnull, stderr=devnull)

        # Move the blockMeshDict file to system directory
        cmd = f"mv blockMeshDict ./{sim_data_path}/{i}/system/blockMeshDict_plate"
        subprocess.check_call(cmd.split(' '), stdout=devnull, stderr=devnull)

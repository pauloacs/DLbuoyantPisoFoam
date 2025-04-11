# DLpisoFoam

## WORK IN PROGRESS - NOT FUNCTIONAL YET

## Contents

- [Introduction](#introduction)
- [Running with Docker](#running-with-docker)
- [Local Setup](#local-setup)
- [Run your first tutorial](#run-your-first-tutorial)

# Related articles

1 - Application of machine learning to model the pressure poisson equation for fluid flow on generic geometries:
https://link.springer.com/article/10.1007/s00521-024-09935-0
  - This paper contains a deep description of the ML Surrogate Model developed to solve the Pressure Poisson Equation.

2- Enhancing CFD solver with Machine Learning techniques: 
https://www.sciencedirect.com/science/article/pii/S004578252400389X
  - This paper contains the CFD solver benchmark

## Introduction

This repository contains the solvers and test cases for the **DLbuoyantPimpleFoam** solver. This solver is based on the OpenFOAM v8 version and is developed to solve compressible Navier-Stokes equations using the PIMPLE algorithm. The main goal of this solver is to enhance the pressure-velocity coupling with a Deep Learning surrogate model.

1 - **DLbuoyantPimpleFoam**:
 the solvers developed in https://github.com/pauloacs/Solving-Poisson-s-Equation-through-DL-for-CFD-apllications. These solvers use the **U_to_p surrogate model** in surrogate_models/u_to_p/.


Here you can find the DLbuoyantPimpleFoam solvers as well as test cases where those can be used. A DockerFile and everything that is needed to build the docker image is also provided here to ease the installation of the solver.

## How to start

### Setup the enviroment and install the CFD solvers

There are two ways to use DLbuoyantPimpleFoam:

#### 1. **Running with Docker**: - NOT READ YET

This is the easiest option as the setup of the environment is automated. To ensure reproducibility, a Docker container with the solver is provided. If you already have Docker installed, you can build your own docker image locally by running:

```sh

$ docker build dlbuoyantpimplefoam .
```

or pull the container with the following command:

```sh
$ docker pull pauloacs/dlbuoyantpimplefoam:latest
```

Using

```sh
$ docker run -it -v $(pwd):/home/repo --rm <image_name> bash
```

This will create a Docker container and launch a shell.

#### 2. **Local Setup**: This method requires manual setup and installation.

To set up the environment locally, follow these steps:

1. Create a Python conda virtual environment by running the following command:

```sh
$ conda env create -f env_311.yml
```

2. Install the surrogate model Python packages:

```sh
$ python -m pip install .
```

3. Make sure the required environment variables for the CFD solver are properly set by running:

```sh
$ ./prep_env311.sh
```

Note: You may need to create your own `prep_env311.sh` file with the correct path to your conda environment.

4. Finally, install the CFD solvers. For example, to install DLbuoyantPimpleFoam, navigate to the `source/DLbuoyantPimpleFoam` directory and run the following commands:

```sh
$ wclean
$ wmake
```

### Run your first tutorial

To run your first tutorial, navigate to the directory of the solver you want to test. For example, if you want to run DLpisoFoam_deltas, follow these steps:

1. Change to the `test_case_deltaU_deltaP/` directory:

```sh
$ cd test_case_deltaU_deltaP/
```

2. Run the DLpisoFoam_deltas solver:

```sh
$ DLbuoyantPimpleFoam
```

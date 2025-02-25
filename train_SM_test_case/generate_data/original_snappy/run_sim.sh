#!/bin/bash
#SBATCH --time=100:00:00   # walltime
#SBATCH --ntasks=4  # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH -p big,batch    # partition(s)
#SBATCH --mem-per-cpu=1000M   # memory per CPU core
#SBATCH -J "plate0"   # job name
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

# source OpenFOAM
source /opt/openfoam8/etc/bashrc
bash create_mesh.sh

rm 0/cellLevel 0/C* 0/nSurfaceLayers  0/pointLevel  0/thickness*
renumberMesh -overwrite
decomposePar
mpirun  -np 4 buoyantPimpleFoam_write -parallel
reconstructPar -newTimes
postProcess -func writeCellCentres

foamToVTK -useTimeName -noZero -ascii -noPointValues -fields '(delta_U delta_p_rgh U_non_cons p_rgh Cx Cy delta_U_prev delta_p_rgh_prev delta_pho)' -excludePatches '(inlet outlet defaultFaces)' > log.foamtoVTK

#/bin/bash
blockMesh -dict system/blockMeshDict_plate
if [ ! -d "constant/triSurface" ]; then
    mkdir -p constant/triSurface
fi
surfaceMeshTriangulate constant/triSurface/geometry.stl
surfaceFeatures
rm -r constant/polyMesh
blockMesh -dict system/blockMeshDict_block
snappyHexMesh -overwrite
extrudeMesh
checkMesh

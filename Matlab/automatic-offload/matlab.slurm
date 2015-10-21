#!/bin/bash
#SBATCH --mail-user=vunetid@vanderbilt.edu
#SBATCH --mail-type=ALL
#SBATCH --partition=mic
#SBATCH --nodes=1
#SBATCH --time=1-0:00:00
#SBATCH --mem=64G
#SBATCH --output=automatic-offload.out

# load Matlab and Intel environment
setpkgs -a matlab
setpkgs -a intel_cluster_studio_compiler
export BLAS_VERSION=/usr/local/intel/ClusterStudioXE_2013/composer_xe_2013_sp1.2.144/mkl/lib/intel64/libmkl_rt.so
export LAPACK_VERSION=/usr/local/intel/ClusterStudioXE_2013/composer_xe_2013_sp1.2.144/mkl/lib/intel64/libmkl_rt.so
export MKL_MIC_MAX_MEMORY=16G

# This single line allows MKL to decide whether to offload
# certain matrix operations to one or both MICs
export MKL_MIC_ENABLE=1
# This next line reports what was
# offloaded to the MIC
export OFFLOAD_REPORT=2

# Run program
matlab -nodisplay -nosplash < matrix.m

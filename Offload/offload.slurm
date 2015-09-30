#!/bin/bash
#SBATCH --mail-user=vunetid@vanderbilt.edu
#SBATCH --mail-type=ALL
#SBATCH --partition=mic
#SBATCH --nodes=1
#SBATCH --time=5:00
#SBATCH --mem=64G
#SBATCH --output=offload-test.out

# load Intel environment and build
setpkgs -a intel_cluster_studio_compiler
make

# These next two lines will control the number of OpenMP
# threads that are executed on the MIC. By default the 
# program will be run across 60 * 4 = 240 threads
export MIC_ENV_PREFIX=MIC
export MIC_OMP_NUM_THREADS=120

# Run program
./reduce_offload_mic

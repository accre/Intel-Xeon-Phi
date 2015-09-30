#!/bin/bash
#SBATCH --mail-user=vunetid@vanderbilt.edu
#SBATCH --mail-type=ALL
#SBATCH --partition=mic
#SBATCH --nodes=1
#SBATCH --time=1:00:00
#SBATCH --mem=64G
#SBATCH --output=mic-test.out

# load Intel environment and build executable
setpkgs -a intel_cluster_studio_compiler
make

# This next line will control the number of OpenMP
# threads that are executed on the MIC. By default the 
# program will be run across 61 * 4 = 244 threads
export MIC_OMP_NUM_THREADS=120

# micrun is a command for launching native compiled
# MIC binaries from the host
micrun ./sample.mic
#!/bin/bash
#SBATCH --mail-user=vunetid@vanderbilt.edu
#SBATCH --mail-type=ALL
#SBATCH --partition=mic
#SBATCH --nodes=1
#SBATCH --time=1-0:00:00
#SBATCH --mem=64G
#SBATCH --output=gcc-no-offload.out

# load R
setpkgs -a R_3.2.0_gcc

# Run program
Rscript --no-save bmark.R
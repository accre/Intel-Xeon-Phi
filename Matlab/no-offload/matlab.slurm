#!/bin/bash
#SBATCH --mail-user=vunetid@vanderbilt.edu
#SBATCH --mail-type=ALL
#SBATCH --partition=mic
#SBATCH --nodes=1
#SBATCH --time=1-0:00:00
#SBATCH --mem=64G
#SBATCH --output=vanilla.out

# load Matlab and Intel environment
setpkgs -a matlab

# Run program
matlab -nodisplay -nosplash < matrix.m

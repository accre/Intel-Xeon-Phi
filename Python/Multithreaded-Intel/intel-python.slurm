#!/bin/bash
#SBATCH --mail-user=vunetid@vanderbilt.edu
#SBATCH --mail-type=ALL
#SBATCH --partition=mic
#SBATCH --nodes=1
#SBATCH --time=1-0:00:00
#SBATCH --mem=64G
#SBATCH --output=intel-python.out

# load Python
setpkgs -a python2.7.8_intel14
export OMP_NUM_THREADS=16

# Run program
python bmark.py

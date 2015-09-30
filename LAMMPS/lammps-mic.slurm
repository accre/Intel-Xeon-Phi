#!/bin/bash
#SBATCH --mail-user=vunetid@vanderbilt.edu
#SBATCH --mail-type=ALL
#SBATCH --partition=mic
#SBATCH --nodes=1
#SBATCH --time=4:00:00
#SBATCH --mem=64G
#SBATCH --output=mic-lammps.out

# load Intel environment
setpkgs -a intel_cluster_studio_compiler

# load Intel Xeon Phi version of LAMMPS
setpkgs -a lammps_mic

# Run program
srun -n 2 lmp_intel_phi -in lammps.in

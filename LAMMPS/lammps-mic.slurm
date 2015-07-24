#!/bin/bash
#SBATCH --mail-user=vunetid@vanderbilt.edu
#SBATCH --mail-type=ALL
#SBATCH --partition=mic
#SBATCH --nodes=1
#SBATCH --time=4:00:00
#SBATCH --mem=64G
#SBATCH --output=mic-lammps.out

# load Intel environment
. /usr/local/intel/ClusterStudioXE_2013/composer_xe_2013_sp1/bin/compilervars.sh intel64
. /usr/local/intel/ClusterStudioXE_2013/impi/4.1.3.048/bin64/mpivars.sh

# load Intel Xeon Phi version of LAMMPS
setpkgs -a lammps_mic

# Run program
srun -n 2 lmp_intel_phi -in lammps.in

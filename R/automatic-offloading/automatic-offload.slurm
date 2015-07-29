#!/bin/bash
#SBATCH --mail-user=vunetid@vanderbilt.edu
#SBATCH --mail-type=ALL
#SBATCH --partition=mic
#SBATCH --nodes=1
#SBATCH --time=1-0:00:00
#SBATCH --mem=64G
#SBATCH --output=automatic-offload.out

# load R and Intel environment
setpkgs -a R_3.2.0
. /usr/local/intel/ClusterStudioXE_2013/composer_xe_2013_sp1/bin/compilervars.sh intel64

# This single line allows MKL to decide whether to offload
# certain matrix operations to one or both MICs
export MKL_MIC_ENABLE=1
# This next line reports what was
# offloaded to the MIC
export OFFLOAD_REPORT=2

# Run program
Rscript --no-save bmark.R
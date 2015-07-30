# Intel-Xeon-Phi

The Intel Xeon Phi co-processor (aka, Many Integrated Core, or MIC card) is a device that
can be used to improve the performance of compute-intensive applications. It can work independently or in tandem
with a CPU (aka, host) to reduce execution time of programs containing support for multi-threaded and/or
multi-process applications. 

ACCRE currently has four Phi nodes in production. Each node contains two Phi co-processors. 

This repo contains examples and instructions for running programs on the ACCRE cluster using Intel Xeon Phis.

## Available Software on ACCRE Cluster

* Matlab (r2014a and later)
* R (3.2.0)
* Python (2.7.8)
* LAMMPS (mid-July 2015 version)

Examples for each of these are included in this repo. In addition, there are simple
C programs demonstrating how to run programs either natively on a MIC card or by offloading
certain tasks from the host to a MIC card. These examples also contain Makefiles to
aid in building the executables for these examples.

## Getting Access

Add the following line to your SLURM script to submit to the MIC queue:

```shell
#SBATCH --partition=mic
```

If you get an error like this one:

```shell
sbatch: error: Batch job submission failed: Invalid account or account/partition combination specified
```

Then open a ticket with us (http://www.accre.vanderbilt.edu/?page_id=369) requesting to be granted access to the Intel Xeon Phi nodes:

## Cluster Policies
Until usage on the Phi nodes gets high enough, a single job will be allocated an entire node,
which consists of:

- 2 Intel Xeon Phi Co-Processors (each with 61 cores, 4 hardware threads/core, 1.3 GHz)
- 2 Intel Xeon E5-2670 CPUs (each with 4 cores, 2 hardware threads/core, 2.60 GHz)
- 132 GB system RAM
- 15.8 GB RAM per Phi card

By default a job will have access to both Phis, 
all 8 CPU cores, and 16 GB RAM. To request more system memory simply add a 
```#SBATCH --mem=``` directive to your SLURM script. Some memory is reserved 
for the OS and filesystem so you cannot request any more than 123 GB.

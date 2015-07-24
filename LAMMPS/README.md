# LAMMPS on the Intel Xeon Phi

LAMMPS has incorporated support for Symmetric/heterogenous host-phi computing, 
i.e. MPI processes and OpenMP threads are run on both the host and mic simultaneously. 
LAMMPS also allows you to run across multiple MIC cards at once.

Instructions for running LAMMPS on the Intel Xeon Phi can
be found on the LAMMPS website: http://lammps.sandia.gov/doc/accelerate_intel.html

## Loading LAMMPS and Intel libs on ACCRE

Type the following to set up your environment:

```shell
. /usr/local/intel/ClusterStudioXE_2013/composer_xe_2013_sp1/bin/compilervars.sh intel64
. /usr/local/intel/ClusterStudioXE_2013/impi/4.1.3.048/bin64/mpivars.sh
```

And then use ```setpkgs -a``` to load the appropriate version of LAMMPS:

```shell
setpkgs -a lammps_mic
```

## Comments

This example is a relatively small system and therefore the performance gains
may be marginal, especially if you use multiple Phi cards and too many threads.
The intention is to provide a simple test case for users to build off of.
# Offload Example

In this simple example a parallel reduction is performed
on a single MIC card. 

## Build Instructions

To compile the code type:

```shell
. /usr/local/intel/ClusterStudioXE_2013/composer_xe_2013_sp1/bin/compilervars.sh intel64
make
```

## Running program

First set up a few environment variables, where the second
line will affect how many threads are run for the parallel
reduction:

```shell
export MIC_ENV_PREFIX=MIC
export MIC_OMP_NUM_THREADS=120
```

To run simply type:

```shell
./reduce_offload_mic
```

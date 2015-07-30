# Host Reduction Example

In this simple example a parallel reduction is performed
on the host (CPU). 

## Running program

First set up a few environment variables, where the following
line will affect how many threads are run for the parallel
reduction:

```shell
export OMP_NUM_THREADS=8
```

To run simply type:

```shell
./reduce_offload_host
```

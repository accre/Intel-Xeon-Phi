# Automatic Offloading of NumPy Matrix Operations

For programs that are linked to the Intel MKL (Math Kernel Library), computationally
intensive operations (e.g. matrix-matrix multiplies) can be automatically offloaded to
one or more MIC cards simply by issuing the following command:

```shell
export MKL_MIC_ENABLE=1
```

The Intel software will decide which operations would benefit from offloading, and
run these operations in a heterogenous manner across the host and MIC card(s). To 
get a report back about which operations were offloaded, how much data was moved, how
long the operations took, etc, you can include an additional environment variable:

```shell
export OFFLOAD_REPORT=2
```

More details about automatic offloading can be found on this page:

https://software.intel.com/sites/default/files/11MIC42_How_to_Use_MKL_Automatic_Offload_0.pdf

## Benchmark Results

All examples run on 20000 x 20000 matrices

* SVD: Single Value Decomposition
* INV: Matrix Inversion
* DOT: Matrix Dot Product

Job Details  | SVD Runtime (sec) | INV Runtime (sec) | DOT Runtime (sec)
------------- | ------------- | -------------- | --------------
GCC-compiled  | 28559 | 2234 | 3827
Intel-compiled (includes multithreading)  |  25847 | 1123 | 1913
Intel Offload Default | 24584 | 297 | 314
Intel Offload 120 threads | 24697 | 371 | 412

Note that all but the Offload jobs are run on a normal Intel CPU processor (i.e. host). 
Note that the Intel-compiled version includes multi-threading as long as there are 
multiple cores included in a job's allocation.

Offloading improves performance slightly for the single value decomposition, but quite
drastically for the matrix inversion and matrix dot product. In fact, the default offload
configuration where the maximum number of hardware threads (240) are employed on the MIC
card results in the best performance. 
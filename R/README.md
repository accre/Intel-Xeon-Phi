# Automatic Offloading of R Matrix Operations

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

* MM: Matrix Multiply (40000 x 40000 matrix)
* ChF: Cholesky Factorization (40000 x 40000 matrix)
* SVD: Single Value Decomposition (20000 x 20000 matrix)
* PCA: Principal Components Analysis (20000 x 20000 matrix)

Job Details  | MM Runtime (sec) | ChF Runtime (sec) | SVD Runtime (sec) | PCA Runtime (sec)
------------- | ------------- | -------------- | -------------- | --------------
GCC-compiled  | 5622 | 2253 | 6900 | 13876
Intel-compiled (includes multithreading) | 413 | 143 | 1325 | 1814
Intel Offload | 405 | 87 | 1321 | 1663

Note that all but the Offload jobs are run on a normal Intel CPU processor (i.e. host). The
intel-compiled version of R runs substantially faster than the GCC version due to 
various factors, namely that multi-threading is included in the Intel-compiled version. 
This means that if multiple CPU cores are available in the allocation then multiple 
threads of execution can be run in parallel for faster processing. Offloading to the Phi
results in a noticeable performance gain for the Cholesky Factorization calculation. For the
other three algorithms offloading helps only marginally.

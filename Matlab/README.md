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

* MM: Matrix Multiply (25000 x 25000 matrix)
* LU: LU Matrix Factorization (25000 x 25000 matrix)

Job Details  | MM Runtime (sec) | LU Runtime (sec)
------------- | ------------- | --------------
No Offload | 189 | 69 
Offloaded | 49 | 18

There is a sizeable performance boost from running
these matrix operations across the host and MIC cards
available on the cluster. Note that offloading is only beneficial
for supported operations and for relatively large matrices. For instance,
offloading would not help if we repeated these benchmarks on
a 100 x 100 matrix.

# Natively Built OpenMP Example

This example is distributed by Intel and can be found on the 
ACCRE cluster at: 

/usr/local/intel/ClusterStudioXE_2013/composer_xe_2013_sp1/Samples/en_US/C++/openmp_samples/

A natively built binary means that this code is built with an
instruction set that is native to the Intel Xeon Phi MIC 
architecture. The command ```micrun``` is used to remotely run
a native binary on a MIC card. This script will only run binaries
on mic0, if you want to run on mic1 try creating a copy of ```micrun```
and editing it (a simple shell script).

The -mmic switch is what tells the Intel compiler to create a 
native MIC executable. The convention is for native binaries
to be prefixed with .mic.
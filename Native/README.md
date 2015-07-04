# Natively Built OpenMP Example

This example is distributed by Intel and can be found on the 
ACCRE cluster at: 

```
/usr/local/intel/ClusterStudioXE_2013/composer_xe_2013_sp1/Samples/en_US/C++/openmp_samples/
```

A natively built binary means that this code is built with an
instruction set that is native to the Intel Xeon Phi MIC 
architecture. The command ```micrun``` is used to remotely run
a native binary on a MIC card. This script will only run binaries
on mic0, if you want to run on mic1 try creating a copy of ```micrun```
and editing it, as it's a simple shell script.

The -mmic switch in the Makefile is what tells the Intel compiler to create a 
native MIC executable. The convention is for native binaries
to use the .mic extension. 

## Building and running

```shell
cd Native
salloc --partition=mic --time=30:00
```

Once you are logged into a Phi node:

```shell
. /usr/local/intel/ClusterStudioXE_2013/composer_xe_2013_sp1/bin/compilervars.sh intel64
make
exit
```

Now submit SLURM job:

```shell
sbatch --partition=mic native-mic.slurm
```

### Controlling thread execution

You can control how many OpenMP threads will be executed on the MIC
card with the MIC_OMP_NUM_THREADS environment variable. For example:

```shell
export MIC_OMP_NUM_THREADS=120
```

By default, the program will max out all available hardware threads
on the MIC card, which for the cards on ACCRE is 244 (61 cores * 
4 hw threads per core).

## Setting up key pairs

The MIC cards run their own micro Linux operating system. You can
actually log into them manually with ```ssh```, and you will be prompted
for your password in the same way you would if attempting to ```ssh```
into any ordinary server. You can create passwordless key pairs to avoid 
entering a password at login, which is a good idea for natively
run executables. Here is a simple way to set up passwordless key pairs:

```shell
ssh-keygen
```

When you are prompted for a place to store your file, accept the default
location by hitting return. When you are prompted for a passphrase, just hit
return. Now move into your ~/.ssh directory, copy your public key to the bottom
of your authorized_keys file, and you should be good to go:

```shell
cp autorized_keys authorized_keys.copy
cat id_rsa.pb >> authorized_keys
rm id_rsa.pub
```

You should now be able to ```ssh``` into a MIC card from its host without
being prompted for a password. Test this by launching an interactive job with
```salloc --partition=mic``` and then typing:

```shell
ssh HOST-mic0
```

where HOST is the name of the host/node (look for something that starts with vmp9, e.g. 
vmp902). 
# Intel-Xeon-Phi
Examples for running software on Intel Xeon Phi Co-Processors

## Building Examples
To build an executable you must be logged into a node with an Intel Xeon Phi present.
I recommend launching an interactive SLURM session via ```salloc```:

```shell
salloc --partition=mic --time=30:00
```

where this will give you thirtly minutes of interactive access to a Intel Xeon Phi node. If you
see a message like this one:

```shell
[jill@vmps13 ~]$ salloc --partition=mic --time=30:00
sbatch: error: Batch job submission failed: Invalid account or account/partition combination specified
```

Then open a ticket with us requesting to be granted access to the Intel Xeon Phi nodes:

http://www.accre.vanderbilt.edu/?page_id=369

Once you are logged into a Phi node, move to the appropriate file containing a
```Makefile```, and type:

```shell
. /usr/local/intel/ClusterStudioXE_2013/composer_xe_2013_sp1/bin/compilervars.sh intel64
make
```

The first command loads the Intel compiler software into your environment, while the
second command will run the commands to build the executable.

## Cluster Policies
Until usage on the Phi nodes gets high enough, a single job will be allocated an entire node,
which consists of:

- 2 Intel Xeon Phi Co-Processors (61 cores, 4 hardware threads/core, 1.3 GHz)
- 1 Intel Xeon E5-2670 CPU (8 cores, 2 hardware threads/core, 2.60 GHz)
- 132 GB system RAM
- 15.8 GB RAM per Phi card

By default a job will have access to both Phis (and all on-board memory), 
all 8 CPU cores, and 16 GB RAM. To request more system memory simply add a 
```#SBATCH --mem=``` directive to your SLURM script. Some memory is reserved 
for the OS and filesystem so you cannot request any more than 123 GB.

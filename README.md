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

When inside a directory with a ```Makefile```, simply type:

```shell
. /usr/local/intel/ClusterStudioXE_2013/composer_xe_2013_sp1/bin/compilervars.sh intel64
make
```

CC=icc
CFLAGS=-std=c99 -O3 -vec-report3 -openmp
EXE=reduce_offload_host

$(EXE) : reduce_omp_host.c
	$(CC) -o $@ $< $(CFLAGS) 

.PHONY: clean

clean:
	rm $(EXE)
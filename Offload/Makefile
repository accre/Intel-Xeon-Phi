CC=icc
CFLAGS=-std=c99 -O3 -vec-report3 -openmp
EXE=reduce_offload_mic

$(EXE) : reduce_omp_mic.c
	$(CC) -o $@ $< $(CFLAGS) 

.PHONY: clean

clean:
	rm $(EXE)
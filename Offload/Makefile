CC=icc
CFLAGS=-std=c99 -xHost -O3 -vec-report2 -openmp
EXE=reduce_offload_mic

$(EXE) : reduce_omp_mic.c
	$(CC) -o $@ $< $(CFLAGS) 

.PHONY: clean

clean:
	rm $(EXE)
CC=icc
CFLAGS=-std=c99 -O3 -mmic -vec-report3 -openmp
EXE=sample.mic

$(EXE) : openmp_sample.c
	$(CC) -o $@ $< $(CFLAGS) 

.PHONY: clean

clean:
	rm $(EXE)
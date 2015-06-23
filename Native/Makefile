CC=icc
CFLAGS=-O3 -mmic -vec-report3 -openmp
EXE=sample.mic

$(EXE) : openmp_sample.c
	$(CC) -o $@ $< $(CFLAGS) 

.PHONY: clean

clean:
	rm $(EXE)
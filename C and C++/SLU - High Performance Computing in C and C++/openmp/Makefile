CC=g++
CFLAGS=-Wall -fopenmp

all: prime_count_omp

prime_count_omp: nested_forloops_omp.cpp
	$(CC) $(CFLAGS) -o prime_count_omp prime_count_omp.cpp
clean:
	rm -f prime_count_omp

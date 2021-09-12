#include <iostream>
#include <cstdlib>
#include <ctime>
#include <mpi.h>
#define MASTER 0

using namespace std;

int main(int argc, char **argv)
{
	int N = 1000;
	int nprocs, rank, tag=0;
	int tmp_sum = 0, partial_sum = 0, total_sum = 0;
	int startval = 0, endval = 0;

	// MPI init
	MPI_Init(&argc, &argv);
	MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	
	// Work
	startval = N*rank/nprocs + 1;
	endval = N*(rank+1)/nprocs;
	// Need to modify based on number of processors
	for(int i=startval; i<=endval; i++){
		partial_sum+=i;
	}

	// Your work
	MPI_Reduce(&partial_sum, &total_sum, 1, MPI_INT, MPI_SUM, 0, MPI_COMM_WORLD);

	if(rank == MASTER){
		cout << "The sum from 1 to " << N << " is: " << total_sum << endl;
}
	MPI_Finalize();

}

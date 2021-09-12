# include <iostream>
# include <cstdlib> // has exit(), etc.
# include <ctime>
# include <stdio.h>
# include "mpi.h"   // MPI header file

#define SIZE 4
using namespace std;

int main (int argc, char **argv)
{
  int nprocs, rank;

  MPI_Init(&argc, &argv);
  MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);

  // the data to be distributed
  char data[SIZE][SIZE] = {
    {'a', 'b', 'c', 'd'},
    {'e', 'f', 'g', 'h'},
    {'i', 'j', 'k', 'l'},
    {'m', 'n', 'o', 'p'}
  };

  char rec_buf[100]={'x'};
  //int sendcounts[nprocs];
  //int displs[nprocs];

  // calculate send counts and displacements
  // Your code
 /* for(int i = 0; i < nprocs; i++){
	sendcounts[i] = i+1;
	displs[i] = 4*i;
	}*/
  int sendcounts[4] = {1,2,3,4};
  int displs[4] = {0,4,8,12};

  // print calculated send counts and displacements for each process
  if (rank == 0) {
    for (int i = 0; i < 4; i++) {
      printf("sendcounts[%d] = %d\tdispls[%d] = %d\n", i, sendcounts[i], i, displs[i]);
    }
  }

  // MPI_Scatterv
  // Your code
  MPI_Scatterv(&data,sendcounts,displs,MPI_CHAR,&rec_buf,100,MPI_CHAR,0,MPI_COMM_WORLD);


  printf("%d: ", rank);
  for (int i = 0; i < 4; i++) {
    printf("%c\t", rec_buf[i]);
  }
  printf("\n");

  MPI_Finalize();
  return 0;
}

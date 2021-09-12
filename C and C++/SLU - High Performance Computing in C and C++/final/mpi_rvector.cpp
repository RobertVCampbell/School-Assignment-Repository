#include <iostream>
#include <cstdlib>     // has exit(), etc.
#include <ctime>
#include <mpi.h>
#define MASTER 0

using namespace std;

int main(int argc, char **argv)
{
  // Just simply set N(4) X M(4) matrix and M(4) X 1 vector
     int N=4; 
     int A[N][N], B[N][N], X[N][N]; 
     int root=0;
     int nproc, rank;
     int chunk;

     double start, end, total; 

     memset(X, 0, sizeof(int)*N*N);
 
  // MPI init
     MPI_Init(&argc, &argv);
     MPI_Comm_size(MPI_COMM_WORLD, &nproc);
     MPI_Comm_rank(MPI_COMM_WORLD, &rank);

     chunk = N/nproc;
     int Apart[chunk][N];
     int Xpart[chunk][N];

     //memset(Apart, 0, sizeof(int)*N*chunk);
     memset(Xpart, 0, sizeof(int)*N*chunk);

  // Initialize matrix
     if (rank == MASTER) {
	for(int i = 0; i < N; i++){
	   for(int j = 0; j < N; j++){
		//A[i][j] = (i*4) + j;
		//B[i][j] = (i*4) + j;
		A[i][j] = 1;
		B[i][j] = 1; 
		}
	}
	 
 	start = MPI_Wtime();
     } 
 
  // MPI Scatter the A Matrix

     MPI_Scatter(&A, N*chunk, MPI_INT, &Apart, N*chunk, MPI_INT, 0, MPI_COMM_WORLD);
  
  // Broadcast the B Matrix
 
     MPI_Bcast(&B, N*N, MPI_INT, 0, MPI_COMM_WORLD); 
 
  // Calculate Xpart
  
     for(int i=0;i<chunk;i++){
	for(int j=0;j<N;j++){
		for(int k=0; k<N;k++){
			Xpart[i][j] += Apart[i][k]*B[k][j];
			}
		}
	}
 
  // MPI Gather
  
     MPI_Gather(&Xpart, N*chunk, MPI_INT, &X, N*chunk, MPI_INT, 0, MPI_COMM_WORLD);
  
  // Print results
 
     if (rank == MASTER) {
	end = MPI_Wtime();
	total = end-start;
	cout << "Time for " << nproc << " processors: " << total << endl << endl;
	cout << "Corners:\n";
	cout << X[0][0] << " "<<X[0][N-1] << endl << X[N-1][0]<< " "  << X[N-1][N-1] <<endl;

       /*for(int i=0; i<N; i++) {
		cout << " " ;
		for (int j=0;j<N; j++){
           		cout << " " << X[i][j] << " ";
         	}
		cout << endl;
	}*/ 
	}  
 
     MPI_Finalize();  // MPI finalize
 
     return 0;     // Exit 
  
      }

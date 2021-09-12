#include <iostream>
#include <iomanip>
#include <mpi.h>
#include <cmath>
#define MASTER 0
//#define SEED 35791246

using namespace std;

int main(int argc, char **argv)
{
    int nprocs, rank, n, chunksize;
    double partial_dotprod=0, stime, etime;

    // MPI Init and rank
    MPI_Status status;
    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    // Your code

    if (rank == MASTER)
        stime = MPI_Wtime(); // start time

    // Get vector size
    n = 10000000;
    if (argc >= 2)
        n = atoi(argv[1]);

    // Calculate chunksize
    // Your code
    chunksize = n/nprocs;
    if(rank == MASTER)
        chunksize += (n%nprocs);

    // Seed the vectors (just 1.00 for now)
    double x[chunksize];
    double y[chunksize];
    for(int i = 0; i < chunksize; i++)
    {
        x[i] = 1.00;
        y[i] = 1.00;
    }

    for(int i = 0; i<chunksize; i++)
    {
        partial_dotprod += x[i] * y[i];
    }

    if (rank == MASTER) // I am MASTER
    {
        // Your code
        double count;

        //cout << "Master partial: " << partial_dotprod << endl << endl;

        for(int i = 1; i < nprocs; i++)
        {
           MPI_Recv(&count, 1, MPI_DOUBLE, MPI_ANY_SOURCE, MPI_ANY_TAG, MPI_COMM_WORLD, &status);
           partial_dotprod += count;
           //cout << "Recvd: " << count << endl;
           //cout << "New Partial: " << partial_dotprod << endl;
        }


        etime = MPI_Wtime(); // end time

        //cout << "Chunksize: " << n/nprocs << ", chunk + rem: " << chunksize << endl << endl;

        cout << "  " << setw(10) << "n"
             << "  " << setw(10) << "dot product"
             << "  " << setw(10) << "nprocs"
			 << "  " << setw(30) << "elapsed wall-clock time" << "\n";
        cout << "  " << setw(10) << n
             << "  " << setw(10) << partial_dotprod
             << "  " << setw(10) << nprocs
             << "  " << setw(30) << etime-stime << "\n";
    }
    else  // I am WORKER
    {
        // Your code
        //cout << "Thread: " << rank << ", sending: " << partial_dotprod << endl;
        MPI_Send(&partial_dotprod, 1, MPI_DOUBLE, MASTER, 0, MPI_COMM_WORLD);
    }

    // MPI finalize
    MPI_Finalize();
}

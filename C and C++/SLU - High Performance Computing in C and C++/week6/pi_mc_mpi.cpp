#include <iostream>
#include <iomanip>
#include <mpi.h>
#include <cmath>
#define MASTER 0
#define SEED 35791246

using namespace std;

int main(int argc, char **argv)
{
    int nprocs, rank, npoints, circle_count=0, num, val;
    double x, y, pi, stime, etime;

    // MPI Init and rank
    MPI_Status status;
    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    // Your code

    if (rank == MASTER)
        stime = MPI_Wtime(); // start time

    // Get number of points
    npoints = 10000000;
    if (argc >= 2)
        npoints = atoi(argv[1]);

    // Calculate number of points for each rank
    // Your code
    int p = nprocs;
    num = npoints/p;

    // You should consider npoints is not divided nprocs
    // I'm not sure what he means here.

    // Random numbers and count the points of inside of the circle
    srand(SEED+rank);   // Give rand() a seed value
    // Your code
    for(int i = 0; i < num; i++)
    {
        x = (float)rand()/RAND_MAX;
        y = (float)rand()/RAND_MAX;
		float dist = sqrt(pow((x-0.5),2) + pow((y-0.5),2));
        if(dist <= 0.5)
        {
           circle_count = circle_count + 1;
        }
    }

    if (rank == MASTER) // I am MASTER
    {
        // Your code
        int count;
        for(int i = 1; i < nprocs; i++)
        {
           MPI_Recv(&count, 1, MPI_INT, i, MPI_ANY_TAG, MPI_COMM_WORLD, &status);
           circle_count += count;
        }

        pi = 4.0 *((float)circle_count / (float)npoints);

        etime = MPI_Wtime(); // end time
        cout << "  " << setw(10) << "npoints"
             << "  " << setw(10) << "pi"
             << "  " << setw(10) << "nprocs"
			 << "  " << setw(30) << "elapsed wall-clock time" << "\n";
        cout << "  " << setw(10) << npoints
             << "  " << setw(10) << pi
             << "  " << setw(10) << nprocs
             << "  " << setw(30) << etime-stime << "\n";
    }
    else  // I am WORKER
    {
        // Your code
        MPI_Send(&circle_count, 1, MPI_INT, MASTER, 0, MPI_COMM_WORLD);
    }

    // MPI finalize
    MPI_Finalize();
}
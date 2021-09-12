#include <iostream>
#include <iomanip>
#include <mpi.h>
#include <cmath>
#define MASTER 0
#define SEED 35791246

using namespace std;

int main(int argc, char **argv)
{
    int nprocs, rank, m, circle_count=0, nsims, num, val;
    double x, y, stime, etime;
    double points[4] = {1000000, 5000000, 10000000, 50000000};

    // MPI Init and rank
    MPI_Status status;
    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    // Start time
    if (rank == MASTER)
        stime = MPI_Wtime(); // start time

    // Get number of simulations
    m = 100;
    if (argc >= 2)
        m = atoi(argv[1]);

    // Calculate number of simulations per thread
    double pisim[m]={0};
    nsims = m/nprocs;
    if(rank == (nprocs-1))
	nsims += (m%nprocs);

    // Random numbers and count the points of inside of the circle
    srand(SEED+rank);   // Give rand() a seed value

    // Run nsims per thread
    for(int j = 0; j < nsims; j++){

	// Calucate the number of points in this thread
	int k =  (int)(((float)rand()/RAND_MAX)*4.0);
	num = points[k];

	    // Run the simulation for num points
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
	// Calculate this simulation's pi value and add to array
	pisim[j] = 4.0*((float)circle_count/(float)num);
	circle_count = 0;
    }

    if (rank == MASTER) // I am MASTER
    {
     	double pi = 0.0;   
        int r = (m%nprocs);
	
	// Collect the pi values
        for(int i = 1; i < nprocs; i++)
        {
	   if(i == (nprocs - 1)){
		MPI_Recv(&(pisim[i*nsims]), nsims+r, MPI_DOUBLE, i, MPI_ANY_TAG, MPI_COMM_WORLD, &status);
	}
	else
           MPI_Recv(&(pisim[i*nsims]), nsims, MPI_DOUBLE, i, MPI_ANY_TAG, MPI_COMM_WORLD, &status);
        }
        
	// Calculate the average
	for(int i = 0; i < m; i++){
		pi+= pisim[i];
	}

	pi = pi/m;

        etime = MPI_Wtime(); // end time
        cout << "  " << setw(10) << "avg. pi"
             << "  " << setw(10) << "nprocs"
             << "  " << setw(30) << "elapsed wall-clock time" << "\n";
        cout << "  " << setw(10) << pi
             << "  " << setw(10) << nprocs
             << "  " << setw(30) << etime-stime << "\n";
    }
    else  // I am WORKER
    {
        // Send the array chunk
        MPI_Send(&pisim, nsims, MPI_DOUBLE, MASTER, 0, MPI_COMM_WORLD);
    }

    // MPI finalize
    MPI_Finalize();
}

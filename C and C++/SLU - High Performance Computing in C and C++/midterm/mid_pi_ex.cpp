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
    double x, y, pi, stime, etime;
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

    // Random numbers and count the points of inside of the circle
    srand(SEED+rank);   // Give rand() a seed value


    if (rank == MASTER) // I am MASTER
    {
	// Assign 1 sim to each thread to start, as long as there
	// are enough sims to start
	int assign = 1;
	int counts;
	double pisim[m]={0};
	for(counts = 1; counts < nprocs; counts++){
		if(counts >= m)
			assign = 0;
		// Use flag 0 for assignment, 1 for rank, 2 for data
		MPI_Send(&assign, 1, MPI_INT, counts, 0, MPI_COMM_WORLD);
	}

	for(int countr=0; countr < m; countr++){
		int wrk;
		// Receive finished worker rank, tag 1
		MPI_Recv(&wrk, 1, MPI_INT, MPI_ANY_SOURCE, 1, MPI_COMM_WORLD, &status);

		// Receive data, tag 2, collecting pi values
		MPI_Recv(&(pisim[countr]),1, MPI_DOUBLE, wrk, 2, MPI_COMM_WORLD, &status);
		if(counts > m){
			assign = 0;
		}
		MPI_Send(&assign, 1, MPI_INT, wrk, 0, MPI_COMM_WORLD);
		counts++;
	}
	//MPI_Abort(MPI_COMM_WORLD, 0);

        
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
	int assigned = 0;
	MPI_Recv(&assigned, 1, MPI_INT, MASTER, 0, MPI_COMM_WORLD, &status);
	while(assigned){
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
		pi = 4.0*((float)circle_count/(float)num);
                circle_count = 0;
	
		// Send the finished sim rank
		MPI_Send(&rank, 1, MPI_INT, MASTER, 1, MPI_COMM_WORLD);
       	 	// Send the pivalue
        	MPI_Send(&pi, 1, MPI_DOUBLE, MASTER, 2, MPI_COMM_WORLD);
		// Receive sim assignment
		MPI_Recv(&assigned, 1, MPI_INT, MASTER, 0, MPI_COMM_WORLD, &status);
    	}
   }
    // MPI finalize
    MPI_Finalize();
}

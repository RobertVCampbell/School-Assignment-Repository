#!/bin/bash
#SBATCH -o mpi_type_vector.out
#SBATCH --reservation csci4850
#SBATCH -n 2

module load openmpi/gcc/64/1.10.7
mpirun -np 2 /xfs2/courses/cs/csci4850/robert.campbell/campbellrobert/week10/mpi_type_vector

exit 0

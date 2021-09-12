#!/bin/bash
#SBATCH -o mid_pi_ex.out
#SBATCH --reservation=csci4850
#SBATCH -n 32

module load openmpi/gcc/64/1.10.7
mpirun -np 2 /xfs2/courses/cs/csci4850/robert.campbell/campbellrobert/midterm/mid_pi_ex 100
mpirun -np 4 /xfs2/courses/cs/csci4850/robert.campbell/campbellrobert/midterm/mid_pi_ex 100
mpirun -np 8 /xfs2/courses/cs/csci4850/robert.campbell/campbellrobert/midterm/mid_pi_ex 100
mpirun -np 16 /xfs2/courses/cs/csci4850/robert.campbell/campbellrobert/midterm/mid_pi_ex 100
mpirun -np 32 /xfs2/courses/cs/csci4850/robert.campbell/campbellrobert/midterm/mid_pi_ex 100

exit 0

#!/bin/bash
#SBATCH -o final2.out
#SBATCH --reservation csci4850
#SBATCH -n 16

module load openmpi/gcc/64/1.10.7
mpirun -np 1 /xfs2/courses/cs/csci4850/robert.campbell/campbellrobert/final/final2
mpirun -np 4 /xfs2/courses/cs/csci4850/robert.campbell/campbellrobert/final/final2
mpirun -np 9 /xfs2/courses/cs/csci4850/robert.campbell/campbellrobert/final/final2
mpirun -np 16 /xfs2/courses/cs/csci4850/robert.campbell/campbellrobert/final/final2

exit 0

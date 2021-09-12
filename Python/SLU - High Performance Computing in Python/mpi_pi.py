import time
from numba import jit
from mpi4py import MPI

@jit
def loop(num_steps, begin, end):
    step = 1.0/num_steps
    sum = 0
    for i in range(begin,end):
        x=(i+0.5)*step
        sum = sum + 4.0/(1.0+x*x)
    
    #print("Partial: %f, steps: %d, step size: %f, begin: %f, end: %f" %(sum, num_steps,step, begin, end))
    return sum

def Pi(num_steps):
    comm = MPI.COMM_WORLD
    rank = comm.Get_rank()
    size = comm.Get_size()

    begin = time.time()
    sum = loop((num_steps), ((rank*num_steps)/size), ((((1+rank)*num_steps)/size)-1))
    pi = comm.reduce(sum, op=MPI.SUM, root=0)
    end = time.time()
    elapsed = end-begin
    if rank==0:
        pi = pi/num_steps
        print("Pi with %d steps is %f in %f secs" %(num_steps, pi, elapsed))

if __name__ == '__main__':
    Pi(1000000000)

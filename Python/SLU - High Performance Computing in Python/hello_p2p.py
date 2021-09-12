#hello_p2p.py
from mpi4py import MPI

comm = MPI.COMM_WORLD
rank = comm.Get_rank()
size = comm.Get_size()

if rank == 0:
    for i in range(1,size):
        sendMSG = "Hello, Rank %d" %i
        comm.send(sendMSG, dest=i, tag=11)

else:
    recvMsg = comm.recv(source=0,tag=11)
    print(recvMsg)

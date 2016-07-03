mpicc -g -Wall -o aes aes_mpi.c -lm
mpiexec -n 6 ./aes

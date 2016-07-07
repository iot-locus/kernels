mpicc -g -Wall 2dconv_mpi.c -o 2dconv_mpi -lm
mpiexec -n 16 ./2dconv_mpi -i 256 -j 256 -t 16

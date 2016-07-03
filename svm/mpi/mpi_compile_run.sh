mpiCC -g -Wall -o svm_mpi svm_mpi.c -lm
mpiexec -n 4 ./svm_mpi

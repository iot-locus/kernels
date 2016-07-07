mpicc -g -Wall -o a.out main.c -lm
mpiexec -n 16 ./a.out -n 100 -b 10

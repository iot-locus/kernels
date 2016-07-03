#include <float.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <assert.h>

#define DUMP

#ifdef DUMP
#include "mpi.h"
#include <m5op.h>
#endif

#ifndef DUMP
#include <mpi/mpi.h>
#endif

#define INPUT_SIZE 2

int main(int argc, char *argv[])
{
        int rank;
        int n_ranks;
	int j;
	int sum = 0;
	int i;
        MPI_Init(&argc, &argv);
        MPI_Comm_size(MPI_COMM_WORLD, &n_ranks);
        MPI_Comm_rank(MPI_COMM_WORLD, &rank);

	MPI_Barrier(MPI_COMM_WORLD);
	//printf("crossing bar1 %d\n", rank);

	for(i = 0; i < 10000; i++)
		sum+= i;

	//printf("before second barrier %d\n", rank);
	MPI_Barrier(MPI_COMM_WORLD);

	//printf("done with thread %d\n", rank);

	MPI_Finalize();
	return 0;
}

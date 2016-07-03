#include <float.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <assert.h>

#define DUMP

#ifdef __arm__
#define DUMP
#endif

#ifdef DUMP
#include "mpi.h"
#include <m5op.h>
#endif

#ifndef DUMP
#include <mpi/mpi.h>
#endif

#define INPUT_SIZE 50
#define MAT_DIM 4

typedef float data_t;

data_t input_vec[MAT_DIM];
data_t **SV; //Support Vector
int NUM_EL[4] = {0,0,0,0}; //Function to store the total number of SV read
int MAX_EL = 800; //Max is set as 800 since we have only 764 currently

//THis function is used to get the SV from the corresponding file
void get_data(int rank)
{ 
	char filename[256] = {"model_"};
	int base_fname_length = 6, i, j;
	char rank_str[20];
	int curr_index = 0;
	int ret_val;

	SV = (data_t**)malloc(MAX_EL*sizeof(data_t*));

	for(i=0; i<MAX_EL; i++)
		SV[i] = (data_t*)malloc((MAT_DIM+1)*sizeof(data_t));

	sprintf(rank_str, "%d", rank);

	for(i = 0; rank_str[i] != '\0'; i++)
			filename[base_fname_length + i] = rank_str[i];

	filename[base_fname_length + i] = '\0';

	FILE *fp = fopen(filename, "r");
	if (fp == NULL) printf("file cannot be opened : %s\n",filename);
	assert(fp);

	while (fscanf(fp, "%f", &SV[curr_index][0]) != EOF) {

		for(j = 1; j < MAT_DIM+1; j++)
			ret_val = fscanf(fp, "%f", &SV[curr_index][j]);

		if(ret_val <= 0) {
			printf("error reading file, curr_index : %d, SV[curr_index][j] : %f  \n",curr_index,SV[curr_index][j]);
		}

		curr_index++;
	}
	NUM_EL[rank] = curr_index;
    fclose(fp);
}

void get_input(int id, int start_rank, int n_rank)
{
	MPI_Recv(input_vec, 4, MPI_FLOAT, start_rank-1, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
	//printf("received the values from the output core\n");
	/*	
	int x = start_rank, i;
	if(id == start_rank)
	{
		input_vec[0] = 1.6570130;
		input_vec[1] = 80.6630100;
		input_vec[2] = 0.2126006;
		input_vec[3] = 68.6683400;

		for(i = start_rank+1; i < start_rank+n_rank; i++)
		{
			MPI_Send(&input_vec[0], 1, MPI_FLOAT, i, 0, MPI_COMM_WORLD);
			MPI_Send(&input_vec[1], 1, MPI_FLOAT, i, 0, MPI_COMM_WORLD);
			MPI_Send(&input_vec[2], 1, MPI_FLOAT, i, 0, MPI_COMM_WORLD);
			MPI_Send(&input_vec[3], 1, MPI_FLOAT, i, 0, MPI_COMM_WORLD);
		}
	}
	else
	{
		MPI_Recv(&input_vec[0], 1, MPI_FLOAT, x, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
		MPI_Recv(&input_vec[1], 1, MPI_FLOAT, x, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
		MPI_Recv(&input_vec[2], 1, MPI_FLOAT, x, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
		MPI_Recv(&input_vec[3], 1, MPI_FLOAT, x, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
	}
	*/
}

float compute_svm_sum(int rank, float gamma)
{
	int i, j;
	float sum = 0;
	for(i = 0; i < NUM_EL[rank]; i++)
	{
		float dot_prod = 0;
		for(j = 1; j < MAT_DIM +1; j++)
			dot_prod += (input_vec[j-1] - SV[i][j]) * (input_vec[j-1] - SV[i][j]);
		sum += SV[i][0] * exp(-gamma*dot_prod);
	}
	return sum;
}

void free_data()
{
	int i = 0;
	for(i=0; i<MAX_EL; i++)
		free(SV[i]);
	free(SV);
}

int main(int argc, char *argv[])
{
	int rank;
	int n_ranks, start_rank;
	int i,j;
	float gamma = 0.25, rho = -0.495266;
	float GLOB_SUM = 0, sum = 0;

	MPI_Init(&argc, &argv);
	MPI_Comm_size(MPI_COMM_WORLD, &n_ranks);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);

	printf("before get data in id %d\n", rank);

	get_data(rank%4);
	start_rank = 6;
	n_ranks = 4;

	printf("done getting dat rank %d\n", rank);

	MPI_Barrier(MPI_COMM_WORLD);
	
	for (j = 0; j < INPUT_SIZE; ++j)
	{
		get_input(rank, start_rank, n_ranks);
		sum = compute_svm_sum(rank%4, gamma);
		if(rank == start_rank)
		{
			float tempBuff;
			GLOB_SUM = sum;
			for (i = start_rank+1; i < start_rank + n_ranks; ++i) {
				MPI_Recv(&tempBuff, 1, MPI_FLOAT, i, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
				GLOB_SUM = GLOB_SUM + tempBuff;
			}
			GLOB_SUM -= rho;
		}
		else {
			MPI_Send((float*)&sum, 1, MPI_FLOAT, start_rank, 0, MPI_COMM_WORLD);
		}
	}

	if(rank == start_rank)
	{
		#ifdef DUMP
			m5_dump_stats(0, 0);
			m5_reset_stats(0, 0);
		#endif
		printf("global sum = %f\n", GLOB_SUM);
	}
	
	free_data();
	MPI_Finalize();
	return 0;
}

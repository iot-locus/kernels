#include <float.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
//#include "../svm_common.h"
#include <assert.h>

// IF targeted at arm include DUMP
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
#define NUM_THREADS 4
#define PATH "svm/data/vanchi/"

typedef float data_t;

data_t input_vec[MAT_DIM];
data_t **SV; //Support Vector
int NUM_EL[4] = {0,0,0,0}; //Function to store the total number of SV read
int MAX_EL = 800; //Max is set as 800 since we have only 764 currently

void my_bcast(float* data, int count, int datatype, int root, int communicator) {
  int world_rank;
  MPI_Comm_rank(communicator, &world_rank);
  int world_size;
  MPI_Comm_size(communicator, &world_size);

  if (world_rank == root) {
    // If we are the root process, send our data to everyone
    int i;
    for (i = 0; i < world_size; i++) {
      if (i != world_rank) {
        MPI_Send(data, count, datatype, i, 0, communicator);
      }
    }
  } else {
    // If we are a receiver process, receive the data from the root
    MPI_Recv(data, count, datatype, root, 0, communicator,
             MPI_STATUS_IGNORE);
  }
}


//THis function is used to get the SV from the corresponding file
void get_data(int rank)
{ 
	char filename[256] = {"input_svm/model_"};
        int base_fname_length = 16, i, j;
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
        if(curr_index == 100)
            break;

        }

	NUM_EL[rank] = curr_index/NUM_THREADS;

        fclose(fp);
        //printf("Filename of Rank %d is %s num_el %d\n",rank, filename, NUM_EL[rank]);
}

void get_input()
{
	char filename[256] = {"input_svm/input"};
	int curr_index = 0;

    FILE *fp = fopen(filename, "r");
    assert(fp);
	//printf("Filename : %s\n",filename);
        while (fscanf(fp, "%f", &input_vec[curr_index]) != EOF) {
		curr_index++;
        }

        fclose(fp);
        //printf("val0 %f val1 %f val2 %f val3 %f\n", input_vec[0], input_vec[1],input_vec[2],input_vec[3]);
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
        int n_ranks;
		int i;

        MPI_Init(&argc, &argv);
        MPI_Comm_size(MPI_COMM_WORLD, &n_ranks);
        MPI_Comm_rank(MPI_COMM_WORLD, &rank);


	float gamma = 0.25, rho = -0.495266;
	float GLOB_SUM = 0, sum = 0;


	get_data(rank%4);

	if(rank == 0)
		get_input();

	MPI_Barrier(MPI_COMM_WORLD);
	if(rank == 0){
	#ifdef DUMP
		m5_dump_stats(0, 0);
		m5_reset_stats(0, 0);
	#endif
	}
	
	// MPI_Bcast((float*)&input_vec, MAT_DIM, MPI_FLOAT, 0, MPI_COMM_WORLD); // broadcast the input value
	for (int i = 0; i < INPUT_SIZE; ++i) {
		MPI_Bcast((float*)&input_vec, MAT_DIM, MPI_FLOAT, 0,MPI_COMM_WORLD);
	}


	MPI_Barrier(MPI_COMM_WORLD);
	// MPI_Bcast((float*)&gamma, 1, MPI_FLOAT, 0, MPI_COMM_WORLD); //bcast gamma and rho
	MPI_Bcast((float*)&gamma, 1, MPI_FLOAT, 0,MPI_COMM_WORLD);

	MPI_Barrier(MPI_COMM_WORLD);
	if(rank == 0){
	#ifdef DUMP
		m5_dump_stats(0, 0);
		m5_reset_stats(0, 0);
	#endif
	}

	//printf("Rank : %d, starting computation...\n",rank);
	for (int i = 0; i < INPUT_SIZE; ++i) {
		sum = compute_svm_sum(rank%4, gamma);
	}


	//printf("RANK :: %d, sum : %f\n", rank, sum);
	//printf("Rank : %d,computation done...\n",rank);
	//printf("rank %d sum = %f\n", rank, sum);
	MPI_Barrier(MPI_COMM_WORLD);

	if(rank==0){
		#ifdef DUMP
		m5_dump_stats(0, 0);
		m5_reset_stats(0, 0);
		#endif
	}


	
	//MPI_Reduce((float*)&sum, (float*)&GLOB_SUM, 1, MPI_FLOAT, MPI_SUM, 0, MPI_COMM_WORLD);

	if(rank == 0)
	{
		float tempBuff;

		int j;

		for (j=0 ; j<INPUT_SIZE ; j++) {
			GLOB_SUM = sum;
			for (i = 1; i < n_ranks; ++i) {
				MPI_Recv(&tempBuff, 1, MPI_FLOAT, i, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
				GLOB_SUM = GLOB_SUM + tempBuff;
			}
		
		GLOB_SUM -= rho;
		printf("gloabl sum = %f\n", GLOB_SUM);
		if(GLOB_SUM > 0)
			printf("CLASS is 1\n");
		else
			printf("CLASS is 0\n");

		}

		#ifdef DUMP
			m5_dump_stats(0, 0);
			m5_reset_stats(0, 0);
		#endif
	}
	else {
		for (int i = 0; i < INPUT_SIZE; ++i) {
			MPI_Send((float*)&sum, 1, MPI_FLOAT, 0, 0, MPI_COMM_WORLD);
		}
	}


//	free_data();

        MPI_Finalize();
        return 0;
}

#define DUMP
#ifdef DUMP
#include<m5op.h>
#endif

#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<string.h>

#define DIMY 1024
#define NUM_TH 16

#ifdef DUMP
#include "mpi.h"
#include <m5op.h>
#endif

#ifndef DUMP
#include <mpi/mpi.h>
#endif

float *input_mat;
float *output_mat;
int levels = 3;

void initArray()
{
	input_mat = (float*)malloc((DIMY/NUM_TH)*sizeof(float));
	output_mat = (float*)malloc((DIMY/NUM_TH)*sizeof(float));
}

//This function is used to get the SV from the corresponding file
void get_data(int rank)
{
	char filename[256] = {"input_dwt/dwt_"};
	int base_fname_length = 14, i;
	char rank_str[20];
	int curr_index = 0;

	sprintf(rank_str, "%d", rank);

	for(i = 0; rank_str[i] != '\0'; i++)
		filename[base_fname_length + i] = rank_str[i];

	filename[base_fname_length + i] = '\0';

	FILE *fp = fopen(filename, "r");

	while (fscanf(fp, "%f", &input_mat[curr_index]) != EOF)
	{
		curr_index++;
		if(curr_index == DIMY/NUM_TH)
			break;
	}

	if(curr_index != DIMY/NUM_TH)
		printf("error reading file\n");

	fclose(fp);
}

void writeImage(int rank, float* matrix)
{
        char filename[256] = {"out_"};
        int base_fname_length = 4, i, j;
        char rank_str[20];
	FILE *fp;

        sprintf(rank_str, "%d", rank);
        for(i = 0; rank_str[i] != '\0'; i++)
                filename[base_fname_length + i] = rank_str[i];
        filename[base_fname_length + i] = '\0';

	//open file for output
	fp = fopen(filename, "w");
	if (!fp) {
		fprintf(stderr, "Unable to open file '%s'\n", filename);
		exit(1);
	}

	for(j = 0; j < DIMY/NUM_TH; j++)
	{
		fprintf(fp, "%.2f ", matrix[j]);
	}
	fprintf(fp, "\n");
	fclose(fp);
}

/** The 2D Haar Transform **/
void haar2_step1(int elem_per_thread, int rank, int half_point)
{
	int i;
	int i_bound = elem_per_thread >> 1;
	float elem1, elem2;

	for(i =0; i < i_bound; i++)
	{
		int out_1 = i;
		int out_2 = out_1 + half_point;

		elem1 = input_mat[2*i];
		elem2 = input_mat[2*i + 1];

		//if(elem1 != elem2 && elem1 != 1)
		//	printf("AAAAAAAAAAAAAAAAAAAAAAAAAAA\n");

		output_mat[ out_1 ] = (elem1 + elem2) / 2.0;
		input_mat [out_1]   = output_mat[ out_1 ];
		output_mat[ out_2 ] = (elem1 - elem2) / 2.0;
	}
}

int main(int argc, char *argv[])
{
	int i, j;
        int rank;
        int n_ranks;
	int k = 0, NUM_ITER = 50;

        MPI_Init(&argc, &argv);
        MPI_Comm_size(MPI_COMM_WORLD, &n_ranks);
        MPI_Comm_rank(MPI_COMM_WORLD, &rank);

	j = rank;

	initArray();
	get_data(j);
	printf("done getting data\n");

	MPI_Barrier(MPI_COMM_WORLD);
#ifdef DUMP
        if(j == 0)
        {
                m5_dump_stats(0, 0);
                m5_reset_stats(0, 0);
        }
#endif

	for(k = 0; k < NUM_ITER; k++)
	{
	        int half_point = DIMY/(2*NUM_TH);
        	int elem_to_process = DIMY/NUM_TH;

		for(i = 1; i <= levels; i++)
		{
			haar2_step1(elem_to_process, j, half_point);
			half_point = half_point >> 1;
			elem_to_process = elem_to_process >> 1;
		}
	}
	MPI_Barrier(MPI_COMM_WORLD);
#ifdef DUMP
        if(j == 0)
        {
                m5_dump_stats(0, 0);
                m5_reset_stats(0, 0);
        }
#endif

	writeImage(j, output_mat);
	MPI_Finalize();
	return 0;
}

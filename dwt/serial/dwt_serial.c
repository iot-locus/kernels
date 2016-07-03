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

float input_mat[NUM_TH][DIMY/NUM_TH];
float output_mat[NUM_TH][DIMY/NUM_TH];
int levels = 3;

//This function is used to get the SV from the corresponding file
void get_data(int rank)
{
	char filename[256] = {"dwt_"};
	int base_fname_length = 4, i, j;
	char rank_str[20];
	int curr_index = 0;
	int ret_val;

	sprintf(rank_str, "%d", rank);

	for(i = 0; rank_str[i] != '\0'; i++)
		filename[base_fname_length + i] = rank_str[i];

	filename[base_fname_length + i] = '\0';

	FILE *fp = fopen(filename, "r");

	while (fscanf(fp, "%f", &input_mat[rank][curr_index]) != EOF)
	{
		curr_index++;
		if(curr_index == DIMY/NUM_TH)
			break;
	}

	if(curr_index != DIMY/NUM_TH)
		printf("error reading file\n");
	fclose(fp);
}

void writeImage(int rank/*, float** matrix*/)
{
	int i,j;
	FILE *fp;
        char filename[256] = {"out_"};
        int base_fname_length = 4;
        char rank_str[20];

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
		fprintf(fp, "%.2f ", output_mat[rank][j]);
	}
	fprintf(fp, "\n");
	fclose(fp);
}

/** The 2D Haar Transform **/
void haar2_step1(int elem_per_thread, int rank, int half_point)
{
	int i;
	int i_bound = elem_per_thread >> 1;
	int output_index;
	float elem1, elem2;

	//if(rank == 0)
		//printf("I'm here");

	for(i =0; i < i_bound; i++)
	{
		int out_1 = i;
		int out_2 = out_1 + half_point;

		elem1 = input_mat[rank][2*i];
		elem2 = input_mat[rank][2*i + 1];

		//if(elem1 != elem2 && elem1 != 1)
		//	printf("AAAAAAAAAAAAAAAAAAAAAAAAAAA\n");

		output_mat[rank][ out_1 ] = (elem1 + elem2) / 2.0;
		input_mat[rank][out_1]    = output_mat[rank][ out_1 ];
		output_mat[rank][ out_2 ] = (elem1 - elem2) / 2.0;

		//if(rank == 0)
		//	printf("elem1 %f elem2 %f diff %f out_1 %d out_2 %d\n", elem1, elem2, output_mat[rank][out_2], out_1, out_2);
	}
}

/*
void thread_function(int thread_id)
{
	int i, j = thread_id;
	int half_point = DIMY/(2*NUM_TH);
	int elem_to_process = DIMY/NUM_TH;
	int k = 0, NUM_ITER = 500;

	for(k = 0; k <NUM_ITER; k++)
	{

		for(i = 1; i <= levels; i++)
		{
			haar2_step1(elem_to_process, j, half_point);
			half_point = half_point >> 1;
			elem_to_process = elem_to_process >> 1;
		}
		//writeImage(j);
	}
}
*/

int main()
{
	int thread_id;
	int k = 0, NUM_ITER = 50;

	for(thread_id=0; thread_id < NUM_TH; thread_id++)
		get_data(thread_id);
	printf("done getting data\n");

#ifdef DUMP
	m5_dump_stats(0, 0);
	m5_reset_stats(0, 0);
#endif
	//Start threads
	for(k = 0; k <NUM_ITER; k++)
	{
		for(thread_id=0; thread_id < NUM_TH; thread_id++)
		{
			int i, j = thread_id;
			int half_point = DIMY/(2*NUM_TH);
			int elem_to_process = DIMY/NUM_TH;

			for(i = 1; i <= levels; i++)
			{
				haar2_step1(elem_to_process, j, half_point);
				half_point = half_point >> 1;
				elem_to_process = elem_to_process >> 1;
			}
		}
	}
	//thread_function(thread_id);
#ifdef DUMP
	m5_dump_stats(0, 0);
	m5_reset_stats(0, 0);
#endif

	for(thread_id=0; thread_id < NUM_TH; thread_id++)
		writeImage(thread_id);
	return 0;
}

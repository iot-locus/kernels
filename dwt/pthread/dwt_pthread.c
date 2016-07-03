#define _XOPEN_SOURCE 600

#define DUMP
#ifdef DUMP
#include<m5op.h>
#endif

#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<string.h>
#include <pthread.h>

#define DIMY 1024
#define NUM_TH 16

pthread_barrier_t barr;
pthread_t thread[NUM_TH - 1];

float input_mat[NUM_TH][DIMY/NUM_TH];
float output_mat[NUM_TH][DIMY/NUM_TH];
int levels = 3;

//This function is used to get the SV from the corresponding file
void get_data(int rank)
{
	char filename[256] = {"input_dwt/dwt_"};
	int base_fname_length = 14, i, j;
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
        char filename[256] = {"pth_"};
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
	}
}

void* thread_function(void* thread_id)
{
        int *temp = (int*)thread_id;
        int i, j = *temp;

	int k = 0, NUM_ITER = 50;

	get_data(j);
	printf("done getting data\n");
	pthread_barrier_wait(&barr);

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
//	pthread_barrier_wait(&barr);


#ifdef DUMP
    if(j == 15)
    {
	    m5_dump_stats(0, 0);
    	m5_reset_stats(0, 0);
    }
#endif

/*
	//printf("Just after barrier %d\n", j);
#ifdef DUMP
        if(j == 0)
        {
                m5_dump_stats(0, 0);
                m5_reset_stats(0, 0);
        }
#endif

	//printf("before writing image ID %d\n", j);
	writeImage(j);
*/
}

int main()
{
	int i;
        int thread_id;
	int thread_id_array[NUM_TH];

        pthread_barrier_init(&barr, NULL, NUM_TH);
        //Start threads
        for(thread_id=0; thread_id < NUM_TH - 1; thread_id++)
        {
		thread_id_array[thread_id] = thread_id;
                pthread_create( &thread[thread_id], NULL, thread_function, (void*) (thread_id_array + thread_id) );
        }
	thread_id_array[thread_id] = thread_id;
        thread_function((void*) (thread_id_array + thread_id));

//#ifdef DUMP
//	m5_dump_stats(0, 0);
//	m5_reset_stats(0, 0);
//#endif

	return 0;
}

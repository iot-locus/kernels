/* Lab 1: Histrogram generation 
 * compile as follows: gcc -o histogram histogram.c -std=c99 -lpthread -lm
 * Histogramerific!
 * reset && gcc -g -o histogramerific.wow histogram.c -std=c99 -lpthread -lm && ./histogramerific.wow 500000000
 */
 
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <float.h>

#include <string.h>
#include <unistd.h>

#define DUMP

#ifdef DUMP
#include <m5op.h>
#endif

typedef float data_t;
 
void compute_hist();
int DATA_LEN = 2000, BUCKET_LEN = 10, THREAD_LEN = 16; 

void get_options(int argc, char **argv)
{
        int op;
        while ((op = getopt(argc, argv, "hn:b:t:")) != -1) {
                switch (op) {
                        case 'n':
                                DATA_LEN = atoi(optarg);
                                break;
                        case 'b':
                                BUCKET_LEN = atoi(optarg);
                                break;
                        case 't':
				THREAD_LEN = atoi(optarg);
                        default:
                                //printf("wrong usage of execution statement");
				break;
                }
        }
}
 
////////////////////////////////////////////////////////////////////////////////
// Program main
////////////////////////////////////////////////////////////////////////////////
int main( int argc, char** argv) 
{
//	if(argc != 4){
//		printf("Usage: histogram <num elements> \n");
//		exit(0);	
//	}

	//get_options(argc, argv);
	
	printf("THREAD_LEN %d DATA_LEN %d BUCKET_LEN %d\n",THREAD_LEN, DATA_LEN, BUCKET_LEN);
	compute_hist();
	return 0;
}
 
/* This function computes the reference solution. */
void compute_hist()
{
  int i, j, k;
  data_t max = -1, min = 10000;
  data_t *input_data = (data_t *)malloc(sizeof(data_t) * THREAD_LEN * DATA_LEN);
  int *histogram = (int *)malloc(sizeof(int) * BUCKET_LEN);
  int count = 0;

  for(i =0; i < THREAD_LEN; i++)
  {
        char filename[256] = {"input_histogram/input_"};
        int base_fname_length = 22;

        //char filename[256] = {"input_"};
        //int base_fname_length = 6;
        char rank_str[20];
	data_t p;

        sprintf(rank_str, "%d", i);

        for(k = 0; rank_str[k] != '\0'; k++)
                filename[base_fname_length + k] = rank_str[k];
        filename[base_fname_length + k] = '\0';

        FILE *fp = fopen(filename, "r");

	for(j =0; j < DATA_LEN; j++)
	{
		fscanf(fp, "%f", &p);
                if (p < min)
                        min = p;
                else if (p > max)
                        max = p;
		input_data[count] = p;
		count++;
	}

        fclose(fp);
  }

  // Initialize histogram
  for(i = 0; i < BUCKET_LEN; i++) 
	histogram[i] = 0; 
 
  double dmin = (double)min;
  double delt = (double)(max - dmin);

#ifdef DUMP
    m5_dump_stats(0, 0);
    m5_reset_stats(0, 0);
#endif

  for (i = 0; i < count; i++) {
	  double r = BUCKET_LEN * (input_data[i] - dmin) / delt;
	  int b = (int)floor(r);
	  if (b == BUCKET_LEN)
		  b--;
	  if (b >= 0 && b < BUCKET_LEN)
		  histogram[b]++;
	  else
	  {
		  printf("RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRROR\n");
		  exit(0);
	  }
  }

#ifdef DUMP
    m5_dump_stats(0, 0);
    m5_reset_stats(0, 0);
#endif

  printf("len %d\n", BUCKET_LEN);
  printf("min %lf\n", min);
  printf("del %lf\n", delt);
  for (i = 0; i < BUCKET_LEN; i++)
	  printf("%d ", histogram[i]);
  printf("\n");

  free(input_data);
  free(histogram);
}

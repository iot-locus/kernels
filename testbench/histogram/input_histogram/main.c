#include<stdio.h>
#include <time.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
	int num_el = atoi(argv[1]);
	int num_files = atoi(argv[2]);
	char filename[256] = "input_";
        int base_fname_length = 6;

	int i, j;

	srand(time(NULL));

	if(argc != 3)
	{
		printf("Invalid arguments\n");
		return 0;
	}

	printf("NUM_EL %d NUM_FILES %d\n", num_el, num_files);

	for(i = 0; i < num_files; i++)
	{
		FILE *fp;
		char rank_str[100];
		int COUNT = 0;
	        sprintf(rank_str, "%d", i);

	        for(j = 0; rank_str[j] != '\0'; j++)
        	        filename[base_fname_length + j] = rank_str[j];

		filename[base_fname_length + j] = '\0';

		fp = fopen(filename, "w");

		while(COUNT < num_el)
		{	
			int r = rand()%256;
			if(COUNT == num_el-1)
				fprintf(fp, "%d",r);
			else
				fprintf(fp, "%d ",r);
			COUNT++;
		}
		fclose(fp);	
	}
	return 0;
}

#include <stdio.h>
#include <pthread.h>
#include "fft.h"

#define SIZE 640

#define samplingrate 100
#define windowsize 8 //should be floor(samplingrate * 571 /1000)
#define filtervalue 4

complex **pSignal;

using namespace std;
#define NUM 16

//#define inputfile

int* peak_pos_all;
double* peak_val_all;

void init(complex** signal)
{
    char filename[256] = {"input"};
    int fname_length = 4;

    //    char rank_str[20];
    //    sprintf(rank_str, "%d", rank);

    //    for(i = 0; rank_str[i] != '\0'; i++)
    //        filename[base_fname_length + i] = rank_str[i];
    filename[fname_length + 1] = '\0';

    FILE *fp = fopen(filename, "r");
    if(fp == NULL)
    {
        printf("\ncannot open file \"%s\".\n", filename);
        return;
    }

    float data;

    for(int n=0; n<NUM; ++n)
    {
        signal[n] = new complex[SIZE];
        for(int i=0; i<SIZE; ++i)
        {
#ifndef inputfile
            signal[n][i] = (((SIZE*n+i) % 10)+0.1) / 11.0;
#endif

#ifdef inputfile
            fscanf(fp, "%f", &data);
            signal[n][i] = data;
#endif
        }
    }

    fclose(fp);
}

void filter(complex* signal)
{
    for(int i=0; i<SIZE*5/samplingrate; ++i)
    {
        signal[i] = 0;
    }

    for(int i=SIZE-SIZE*5/samplingrate; i<SIZE; ++i)
    {
        signal[i] = 0;
    }
}

void window(int *peak_position, double *peak_value, complex *signal)
{
    double max = 0;
    for(int i=0; i<SIZE/windowsize; ++i)
    {
        max = 0;
        peak_position[i] = i*windowsize + windowsize/2;
        for(int w=i*windowsize; w<(i+1)*windowsize; ++w)
        {
            if(signal[w].re() > max)
            {
                max = signal[w].re();
                peak_position[i] = w;
                peak_value[i] = max;
            }
        }
    }
}

void* master(int id)
{
    //Apply FFT
    CFFT::Forward(pSignal[id], SIZE);

    //Filter transformed result
    filter(pSignal[id]);

    //Inverse FFT
    CFFT::Inverse(pSignal[id], SIZE);

    //Detect peaks
    int* peak_pos = new int[SIZE/windowsize];
    double* peak_val = new double[SIZE/windowsize];
    window(peak_pos, peak_val, pSignal[id]);

    //Gather all peak position through pthread mutex
    for(int i=0; i<SIZE/windowsize; ++i)
    {
        peak_pos_all[id*(SIZE/windowsize)+i] = peak_pos[i];
    }

    //Gather all peak value through pthread mutex
    for(int i=0; i<SIZE/windowsize; ++i)
    {
        peak_val_all[id*(SIZE/windowsize)+i] = peak_val[i];
    }

}

int main()
{
    //Allocate memory for signal data
    pSignal = new complex*[NUM];
    peak_pos_all = new int[NUM*SIZE/windowsize];
    peak_val_all = new double[NUM*SIZE/windowsize];

    //Fill signal array with data
    init(pSignal);

    printf("================= ECG R peak detection==============\n");

#ifdef DUMP
    m5_dump_stats(0,0);
    m5_reset_stats(0,0);
#endif

    //Create threads
    for(int x=0; x<NUM; ++x)
    {
        master(x);
    }

#ifdef DUMP
    m5_dump_stats(0,0);
    m5_reset_stats(0,0);
#endif

/*
    for(int i=0; i<NUM*SIZE/windowsize; ++i)
    {
        printf("[%d]=%.2f; ", i, peak_val_all[i]);
    }
    printf("\n");
*/

    return 0;
}

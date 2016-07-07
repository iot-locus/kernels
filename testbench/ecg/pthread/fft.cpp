//   fft.cpp - impelementation of class
//   of fast fourier transform - fft
//
//   the code is property of librow
//   you can use it on your own
//   when utilizing credit librow site

//   include declaration file
#include "fft.h"
//   include math library
#include <math.h>

//   forward fourier transform
//     input  - input data
//     output - transform result
//     n      - length of both input data and result
bool CFFT::Forward(const complex *const input, complex *const output, const unsigned int n)
{
    //   check input parameters
    if (!input || !output || n < 1 || n & (n - 1))
        return false;
    //   initialize data
    Rearrange(input, output, n);
    //   call fft implementation
    Perform(output, n);
    //   succeeded
    return true;
}

//   forward fourier transform, inplace version
//     data - both input data and output
//     n    - length of input data
bool CFFT::Forward(complex *const data, const unsigned int n)
{
    //   check input parameters
    if (!data || n < 1 || n & (n - 1))
        return false;
    //   rearrange
    Rearrange(data, n);
    //   call fft implementation
    Perform(data, n);
    //   succeeded
    return true;
}

//   inverse fourier transform
//     input  - input data
//     output - transform result
//     n      - length of both input data and result
//     scale  - if to scale result
bool CFFT::Inverse(const complex *const input, complex *const output, const unsigned int n, const bool scale /* = true */)
{
    //   check input parameters
    if (!input || !output || n < 1 || n & (n - 1))
        return false;
    //   initialize data
    Rearrange(input, output, n);
    //   call fft implementation
    Perform(output, n, true);
    //   scale if necessary
    if (scale)
        CFFT::Scale(output, n);
    //   succeeded
    return true;
}

//   inverse fourier transform, inplace version
//     data  - both input data and output
//     n     - length of both input data and result
//     scale - if to scale result
bool CFFT::Inverse(complex *const data, const unsigned int n, const bool scale /* = true */)
{
    //   check input parameters
    if (!data || n < 1 || n & (n - 1))
        return false;
    //   rearrange
    Rearrange(data, n);
    //   call fft implementation
    Perform(data, n, true);
    //   scale if necessary
    if (scale)
        CFFT::Scale(data, n);
    //   succeeded
    return true;
}

//   rearrange function
void CFFT::Rearrange(const complex *const input, complex *const output, const unsigned int n)
{
    //   data entry position
    unsigned int target = 0;
    //   process all positions of input signal
    for (unsigned int position = 0; position < n; ++position)
    {
        //  set data entry
        output[target] = input[position];
        //   bit mask
        unsigned int mask = n;
        //   while bit is set
        while (target & (mask >>= 1))
            //   drop bit
            target &= ~mask;
        //   the current bit is 0 - set it
        target |= mask;
    }
}

//   inplace version of rearrange function
void CFFT::Rearrange(complex *const data, const unsigned int n)
{
    //   swap position
    unsigned int target = 0;
    //   process all positions of input signal
    for (unsigned int position = 0; position < n; ++position)
    {
        //   only for not yet swapped entries
        if (target > position)
        {
            //   swap entries
            const complex temp(data[target]);
            data[target] = data[position];
            data[position] = temp;
        }
        //   bit mask
        unsigned int mask = n;
        //   while bit is set
        while (target & (mask >>= 1))
            //   drop bit
            target &= ~mask;
        //   the current bit is 0 - set it
        target |= mask;
    }
}

//   fft implementation
void CFFT::Perform(complex *const data, const unsigned int n, const bool inverse /* = false */)
{
    const double pi = inverse ? 3.14159265358979323846 : -3.14159265358979323846;
    //   iteration through dyads, quadruples, octads and so on...
    for (unsigned int step = 1; step < n; step <<= 1)
    {
        //   jump to the next entry of the same transform factor
        const unsigned int jump = step << 1;
        //   angle increment
        const double delta = pi / double(step);
        //   auxiliary sin(delta / 2)
        const double sine = sin(delta * .5);
        //   multiplier for trigonometric recurrence
        const complex multiplier(-2. * sine * sine, sin(delta));
        //   start value for transform factor, fi = 0
        complex factor(1.);
        //   iteration through groups of different transform factor
        for (unsigned int group = 0; group < step; ++group)
        {
            //   iteration within group 
            for (unsigned int pair = group; pair < n; pair += jump)
            {
                //   match position
                const unsigned int match = pair + step;
                //   second term of two-point transform
                const complex product(factor * data[match]);
                //   transform for fi + pi
                data[match] = data[pair] - product;
                //   transform for fi
                data[pair] += product;
            }
            //   successive transform factor via trigonometric recurrence
            factor = multiplier * factor + factor;
        }
    }
}

//   scaling of inverse fft result
void CFFT::Scale(complex *const data, const unsigned int n)
{
    const double factor = 1. / double(n);
    //   scale all data entries
    for (unsigned int position = 0; position < n; ++position)
        data[position] *= factor;
}


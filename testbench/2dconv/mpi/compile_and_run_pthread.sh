gcc -o 2dconv_p 2dconv_pthread.c -std=c99 -lpthread -lm
./2dconv_p -i 16 -j 16 -t 16

gcc -o aes_pthread aes_pthread.c -std=c99 -lpthread -lm
./aes_pthread -n 100 -t 16 -b 10

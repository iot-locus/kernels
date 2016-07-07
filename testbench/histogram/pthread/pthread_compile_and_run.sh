g++ -o histogram_pthread histogram_pthread.cpp -lpthread -lm
./histogram_pthread -n 100 -t 16 -b 10

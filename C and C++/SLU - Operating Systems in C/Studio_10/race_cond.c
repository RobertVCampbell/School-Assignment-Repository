#include <stdio.h>
#include <pthread.h>
#define ITER 20000000
int race = 0;

void* adder(void* args){
    for(int i = 0; i < ITER; i++){
        race++;
    }
    printf("After adder race variable: %d\n", race);
    
    return NULL;
}

void* subtractor(void* args){
    for(int i = 0; i < ITER; i++ ){
        race--;
    }
    printf("After subtractor race variable: %d\n", race);
    return NULL;
}


int main(int argc, char* arvg[]){

    printf("Starting race variable: %d\n", race);
    // adder();
    // printf("After adder race variable: %d\n", race);
    // subtractor();
    // printf("After subtractor race variable: %d\n", race);

    pthread_t tid[2];
    int err;

    err = pthread_create(&tid[0], NULL, adder, NULL);
    if(err != 0) printf("Error %d when creating adder thread.\n", err);
    err = pthread_create(&tid[1], NULL, subtractor, NULL);
    if(err != 0) printf("Error %d when creating subtractor thread.\n, err");

    pthread_join(tid[0], NULL);
    pthread_join(tid[1], NULL);

    printf("Final race variable: %d\n", race);

    return 0;
}
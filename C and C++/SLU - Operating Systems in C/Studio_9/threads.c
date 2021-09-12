#include <pthread.h>
#include <stdio.h>
#define N 5

struct mystruct{
    int arg1;
    char arg2[100];
    int ret;
};

void* thread_entry(void* args){
    struct mystruct* struct_in = args;

    //printf("This is a threaded message\n");
    //printf("thread arg1: %d\n", struct_in->arg1);
    snprintf(struct_in->arg2, 100, "This is thread %d", struct_in->arg1);
    printf("thread arg2: %s\n\n", struct_in->arg2);
   // printf("thread ret: %d\nChanged to 2\n\n", struct_in->ret);

    struct_in->ret = 2;
    return &(struct_in->ret);
}

int main(int argc, char* argv[]){
    pthread_t tid[N];
    int errchk;
    //int* retval;

    struct mystruct argum[N];
    //argum.arg1 = 10;
    //snprintf(argum.arg2, 100, "Struct text here.");
    //argum.ret = 1;

    for(int j = 0; j < N; j++){
        for(int i = 0; i < N; i++){
            argum[i].arg1 = i;
            argum[i].ret = 0;
            errchk = pthread_create(&tid[i], NULL, thread_entry, &argum[i]);
            if(errchk != 0 ){
                printf("Error %d when creating thread %d\n", errchk, i);
            }
        }

        for(int i = 0; i < N; i++){
            pthread_join(tid[i], NULL);
        }
    }

    // errchk = pthread_create(&tid,NULL,thread_entry,&argum);

    // if(errchk != 0){
    //     printf("Error %d when creating thread\n", errchk);
    // }

    // pthread_join(tid, NULL);

    // printf("Thread changed the struct ret: %d\n", argum.ret);

    return 0;
}
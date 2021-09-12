
#include <stdio.h>
#include <omp.h>

int testPrime(int x){
    //Test in input is 2
    if(x==2){
        return 1;
    }

    //Test if input is 1, 0, or even
    if((x==1)||(x==0)||!(x%2)){
        return 0;
    }
    

    //Assume x is prime until a divisor is found
    int prime = 1;

    for(int i = 3; i*i <= x; i+=2)
    {
        //If x is divisible by i, then not prime
        if(!(x % i)){
            prime = 0;
            break;
        }
    };

    return prime;

}

int main(int argc, char* argv){
    int num = 25;

    omp_set_num_threads(5);

    //printf("Prime numbers from 1 - %d are:\n", num);
    #pragma omp parallel for schedule( dynamic,1)
    for(int i = 1; i <= num; i++){
        printf("Loop index: %d  Thread number: %d\n", i, omp_get_thread_num());
        if(i <= 4) sleep(1);
        if(testPrime(i)){
            //printf("%d, ", i);
        }
        else{
            //printf("Provided number '%d' is not prime.\n", i);
        }
    }
    printf("Max threads: %d\n", omp_get_max_threads());

    //printf("\n");

    return 0;
}
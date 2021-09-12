// Robert Campbell
// 08/19/2020
// A program to print "Hello World!" using C's fprintf()

#include <unistd.h>

#define bufferSize 100000
char buffer[bufferSize];
int count;

int main(int argc, char* argv []){
    while(1){
        count = (read(STDIN_FILENO, buffer, bufferSize));
        if( count ==0){
            break;
        }
        else{
            write(STDOUT_FILENO, buffer, count);
        }
    }
    

    return 0;
}
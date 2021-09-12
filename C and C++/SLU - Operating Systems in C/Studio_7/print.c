// Robert Campbell
// 08/19/2020
// A program to print "Hello World!" using C's fprintf()

#include <unistd.h>

int main(int argc, char* argv[]){
    char buffer[] = "Hello world!\n";
    write(STDOUT_FILENO,buffer, sizeof(buffer));
    return 0;
}
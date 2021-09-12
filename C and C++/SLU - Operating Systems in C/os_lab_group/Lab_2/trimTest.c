#define MAX_ARGV 15
#define MAX_CHARS 256
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

char* trim(char string[]){
    //trims leading and trailing whitespace from string and returns modified string address
    char* trimstart = string;
    int i = 0;
    while(1){
        if(*trimstart == ' ' || *trimstart == '\t' || *trimstart == '\n' || *trimstart == '\r'){
            trimstart+=sizeof(char);
            continue;
        }
        break;
    }
    char* trimEnd = trimstart;
    while(1){
        if(*trimEnd == '\0'){
            break;
        }
        trimEnd+=sizeof(char);
    }
    trimEnd-=sizeof(char);
    while(1){
        if(*trimEnd == ' ' || *trimEnd == '\t' || *trimEnd == '\n' || *trimEnd == '\r'){
            trimEnd[0] = '\0';
            trimEnd-=sizeof(char);
            continue;
        }
        break;
    }
    return trimstart;
}

int main(int argc, char* argv[]){
    char a[] = "hello\n";
    printf("-%s-\n",trim(a));
    char b[] = "\nhello";
    printf("-%s-\n",trim(b));
    char c[] = "\nhello\n";
    printf("-%s-\n",trim(c));

    char d[] = "hello\t";
    printf("-%s-\n",trim(d));
    char e[] = " hello                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ";
    printf("-%s-\n",trim(e));
    char f[] = "\n  hello\n ";
    printf("-%s-\n",trim(f));
}
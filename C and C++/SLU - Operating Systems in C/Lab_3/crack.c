/*Need a struct that can hold the salt, the hash, a flag for if it is found*/
/*Might need a thread function and a recursive function*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>
#include <crypt.h>

#define INPUT 4
#define MAXTHREAD 6
#define MAXLENGTH 8

struct my_data {
    char* hash;
    char* salt;
    char testpwd[MAXLENGTH+1];
    int keylength;
    int solved;
    char solution[MAXLENGTH+1];
    struct crypt_data d;
    int count;
};

void setup_my_data(struct my_data * t, char* h, char* s, char pw[], int key){
    t->hash = h;
    t->salt = s;
    strcpy(t->testpwd, pw);
    t->keylength = key;
    t->solved = 0;
    memset(t->solution,0,sizeof(t->solution));

}

/*struct version of decrypt*/
/*Recursive call function*/
void decrypt2(struct my_data *thrd_data){

    //Reduce keylength by 1 for the depth the funciton is at
    thrd_data->keylength -= 1;

    //Store the string that was in the struct when the function was called
    char pwd[MAXLENGTH+1];
    strcpy(pwd, thrd_data->testpwd);
    int len = strlen(pwd);

    //char* test;
    
    //printf("hash: %s\nsalt: %s\nPwd: %s\nlen: %d\n", thrd_data->hash, thrd_data->salt, pwd, len);
    //char tpass[len+2];
    
    for(char i = 'a'; i <= 'z' ; i++){
        memset(thrd_data->testpwd,0,sizeof(thrd_data->testpwd));
        strncpy(thrd_data->testpwd, pwd, strlen(pwd));
        strcat(thrd_data->testpwd, &i);
        thrd_data->testpwd[len+1] = '\0';
       
        if(thrd_data->keylength > 1){
            //printf("Depth > 1 recursive call.\n");
            decrypt2(thrd_data);
        }
        if(thrd_data->solved) break;
        memset(thrd_data->testpwd,0,sizeof(thrd_data->testpwd));
        strncpy(thrd_data->testpwd, pwd, strlen(pwd));
        strcat(thrd_data->testpwd, &i);
        thrd_data->testpwd[len+1] = '\0';

        
        /*Try hashing at this depth*/
        //printf("Testing '%s'.\n", thrd_data->testpwd);
        crypt_r(thrd_data->testpwd, thrd_data->salt, &(thrd_data->d));
        //printf("Test hash is: %s\nOriginal Hash is: %s\n", test,thrd_data->hash);
        if(!(strcmp(thrd_data->d.output,thrd_data->hash))){
            thrd_data->solved = '1';
            printf("The password '%s' returned the correct hash '%s'\n", thrd_data->testpwd, thrd_data->d.output);
            strcpy(thrd_data->solution,thrd_data->testpwd);
        }
        if(thrd_data->solved) break;
    }

    thrd_data->keylength += 1;
    return;
}

/*
//Recursive call function w/o struct
int decrypt(char* hash, char* salt, char pwd[], int depth){
    int found = 0;
    char* test;
    int len = strlen(pwd);
    printf("hash: %s\nsalt: %s\nPwd: %s\nlen: %d\n", hash, salt, pwd, len);
    char tpass[len+2];
    
    for(char i = 'a'; i <= 'z' ; i++){
        memset(tpass,0,sizeof(tpass));
        strncpy(tpass, pwd, strlen(pwd));
        strcat(tpass, &i);
        tpass[len+1] = '\0';
       
        if(depth > 1){
            //printf("Depth > 1 recursive call.\n");
            found = decrypt(hash, salt, tpass, (depth-1));
        }
        if(found) break;

        
        //Try hashing at this depth
        printf("Testing '%s'.\n", tpass);
        test = crypt(tpass, salt);
        printf("Test hash is: %s\nOriginal Hash is: %s\n", test,hash);
        if(!(strcmp(test,hash))){
            found = '1';
            printf("The password '%s' returned the correct hash '%s'\n", tpass, test);
        }
        if(found) break;
    }

    return found;
}*/

void* thread_entry(void* args){
    struct my_data* data = args;
    decrypt2(data);
    return args;

}

int main(int argc, char* argv[]){

     //Input parsing and cleaning
    if(argc != INPUT){
        printf("Usage: <num threads> <max keysize> <hash string to break>\n");
        return -1;
    }

    int threads = atoi(argv[1]);
    /*//Check to see if num threads exceeds num cores available
    if((threads < 1) || (threads > 6)){
        printf("Usage: Thread value must be between 1 and %d.\n", MAXTHREAD);
        return -1;
    }*/

    int keysize = atoi(argv[2]);
    if((keysize < 1) || (keysize > 8)){
        printf("Usage: Keysize must be between 1 - 8 char.\n");
        return -1;
    }
    char* hash = argv[3];
    //printf("Provided hash: %s\n", hash);
    char salt[3];
    strncpy(salt,hash,2);
    salt[2] = '\0';

    //printf("Provided salt: %s\n\n", salt);

    char pwd[] = "a";
    

    struct my_data testdat[threads];
    pthread_t tid[threads];
    int done = 0;
     
    for(char i = 'a'; i<='z'; i+=threads){

        for(int j = 0; j < threads ; j++){
            pwd[0] = i+j;
            if((i+j) >'z') break;
            int err = 0;
            setup_my_data(&testdat[j], hash, salt, pwd, keysize);
            printf("Checking passwords starting with '%c'\n", pwd[0]);
            
            err = pthread_create(&tid[j], NULL, thread_entry, &testdat[j]);
            if(err != 0) printf("Error creating thread for '%c'\n", i+j);

            //decrypt2(&testdat[j]);
        }

        for(int j = 0; j < threads ; j++){
            pthread_join(tid[j], NULL);
            //printf("Computations: %d\n\n", testdat[j].count);

            if((testdat[j].solved)){
                done = 1;
                //printf("The password was %s\n", (testdat[j].solution));
                //break;
            }
        }
        if(done) break;
          
    }


    /*
    //For loop without threading
    for(char i = 'a'; i<='z'; i++){
        pwd[0] = i;
        setup_my_data(&testdat, hash, salt, pwd, keysize);
        printf("Checking passwords starting with '%c'\n", pwd[0]);
        decrypt2(&testdat);
        if((testdat.solved)){
           printf("The password was %s\n", (testdat.solution));
            break;
        }
    }*/
    

    /*char pwd[] = "a";
    success = decrypt("nahVXb7dCBBV.","na",pwd,2);*/
    /*
    if(!done){
        printf("Password not found.\n");
    }*/





    return 0;

}
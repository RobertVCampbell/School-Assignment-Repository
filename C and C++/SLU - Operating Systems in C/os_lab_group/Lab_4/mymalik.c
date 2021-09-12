//Aaron Sala, Joe Sloyan, Robert Campbell


#include <stdio.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>

struct node{
	struct node* next;
    void* memStart;
	int size;
	int free;
};

struct node* start; 
int setup = 0;
size_t PAGE_SIZE;

void* roundUp(void* a){
	//return a+((8-a%8)%8);
	//Good chance this is no faster, but if GCC is dumb 
	return (void*)((long long)a + (((8-((long long)(a))&0x07))&0x07));
}

int getNPages(size_t a){
	int pageSize = sysconf(_SC_PAGESIZE);
	if(a%pageSize == 0){
		return a/pageSize;
	}
	return a/pageSize+1;
}

struct node* locateNode(void* addr){
    struct node* current = start; 
    while(current->next){
        if(current->memStart == addr){
            return current;
        }
        current = current->next;
    }
    if(current->memStart == addr){
        return current;
    }
    return NULL;
}

void* splitAndAllocate(struct node* node, size_t size){
    struct node* endOfNewSegmentNode = node->memStart+size;
    //void* endOfSeg = (void*)(node->next) - sizeof(struct node);
    void* nextStart = roundUp((void*)endOfNewSegmentNode + sizeof(struct node));
    node->free = 0;
    if((long long)nextStart >= (long long)node->next){
        return node->memStart;
    }
    struct node* newNode = endOfNewSegmentNode;
    newNode->next = node->next;
    newNode->free = 1;
    newNode->memStart = nextStart;
    newNode->size = (long long)(newNode->next) - (long long)nextStart;
    node->next = newNode;
    node->size = (long long)(newNode) - (long long)(node->memStart);
    return node->memStart;
}


void* malloc(size_t size){
    if(setup == 0){
        PAGE_SIZE = sysconf(_SC_PAGE_SIZE);
        size_t totalNeeded = size+3*sizeof(struct node)+7;
        size_t numToRequest = PAGE_SIZE*getNPages(totalNeeded);
        void* startOfPage = sbrk(numToRequest);
        if (startOfPage == ((void *)-1)){
            errno = ENOMEM;
            return NULL;
        }
        void* endOfPage = startOfPage+numToRequest;
        start = startOfPage;
        start->next = endOfPage-sizeof(struct node);
        start->next->size = 0;
        start->next->free = 0;
        start->next->next = NULL;
        start->next->memStart = endOfPage;
        start->free = 1;
        start->memStart = roundUp((void*)start+sizeof(struct node));
        start->size = (int)((void*)start->next - (void*)start->memStart);
        setup = 1; 
        return malloc(size);
    }
    struct node* current = start;
    while(current->next){
        if(current->size > size+sizeof(struct node) && current->free == 1){
            break;
        }
        current = current->next;
    }
    if(current->next){
        splitAndAllocate(current,size);
    }else{
        //createNewPageHere
        size_t totalNeeded = size+3*sizeof(struct node)+7;
        size_t numToRequest = PAGE_SIZE*getNPages(totalNeeded);
        void* startOfPage = sbrk(numToRequest);
        if (startOfPage == ((void *)-1)){
            errno = ENOMEM;
            return NULL;
        }
        void* endOfPage = startOfPage+numToRequest;
        struct node* Newstart = startOfPage;
        Newstart->next = endOfPage-sizeof(struct node);
        Newstart->next->size = 0;
        Newstart->next->free = 0;
        Newstart->next->next = NULL;
        Newstart->next->memStart = endOfPage;
        Newstart->free = 1;
        Newstart->memStart = roundUp((void*)Newstart+sizeof(struct node));
        Newstart->size = (int)((void*)Newstart->next - (void*)Newstart->memStart);
        current->next = Newstart;
        current->size = 0;
        current->free = 0;
        current->memStart = NULL;
        return malloc(size);
    }
}

void free(void* ptr){
    if(ptr == NULL) return;
    struct node* cur = locateNode(ptr);
    if(cur == NULL ) return;
    cur->free = 1;
}

void* realloc(void* ptr, size_t req){
    if(ptr == NULL) return NULL;
    struct node* cur = locateNode(ptr);
    if(cur == NULL ) return NULL;
    if(cur->size > req) {
        splitAndAllocate(cur, req);
        return cur->memStart;}
    else{
        void* newMem = malloc(req);
        cur->free = 1;
        memmove(newMem, cur->memStart, cur->size);
        return newMem;
    }

}

void* calloc(long unsigned int numEl, long unsigned int elSize ){
    size_t nBytes = numEl * elSize;
    char* addr = malloc(nBytes);

    for(int i = 0; i < nBytes; i++){
        *(addr + i ) = 0;
    }
    return addr;

}
/*
int main(){
    int* adds[30];
	int* ret;
    //Malloc tests
    printf("20 mallocs.\n\n");
    adds[0] = mymalloc(250);
    printf("250 @ %p\n", adds[0]);
	for(int i = 1; i < 20; i++){
		if(!(i%3)){
			ret = mymalloc(4000);
            printf("4000 @ %p\n", ret);
		}
		else if(!(i %2)){
			ret = mymalloc(250);
            printf(" 250 @ %p\n", ret);
		}
		else{
			ret =  mymalloc(12);
            printf("  12 @ %p\n", ret);
		}
        adds[i] = ret;
        printf("    address gap: %d\n",(long long)adds[i]- (long long)adds[i-1]);
	
	}
    //Resulting array:
    //0    1    2    3    4    5    6    7    8    9    10   11   12   13   14   15   16   17   18   19  
    //250  12   250  4000 250  12   4000 12   250  4000 250  12   4000 12   250  4000 250  12   4000 12 

    //free and malloc tests
    printf("\nFreeing NULL should do nothing:\n");
    myfree(NULL);
    printf("\n%p has 250 bytes\n", adds[0]);
    printf("Freeing %p\n", adds[0]);
    myfree(adds[0]);

    printf("malloc(10), address should be %p:\n", adds[0]);
    ret = mymalloc(10);

    printf("New add: %p    Old add: %p\n\n", ret, adds[0] );
    printf("Another malloc(10)\nResult between %p - %p\n", ret, adds[1]);
    ret = mymalloc(10);
    printf("New add: %p\n\n", ret);


    printf("malloc(4000), should be after %p, or at least not near %p\n", adds[19], ret);
    ret = mymalloc(4000);
    printf("New add: %p\n\n", ret);

    //realloc tests
    printf("realloc NULL should return NULL\n");
    ret = myrealloc(NULL, 100);
    if(ret == NULL) printf("Returned NULL pointer\n\n");
    else printf("Did not return a NULL pointer\n\n");

    //Adds[2] has 250bytes
    printf("realloc size 100 at %p should return the same address\n", adds[2]);
    printf("malloc(50) should return address between %p - %p\n", adds[2], adds[3]);
    ret = myrealloc(adds[2], 100);
    printf("Realloc add: %p\n\n", ret);
    ret = mymalloc(50);
    printf("Malloc add: %p\n\n", ret);

    //Adds[1] has 12bytes
    printf("realloc size 100 at %p should return a new address\n", adds[1]);
    printf("malloc(10) should return address between %p - %p\n", adds[1], adds[4]);
    ret = myrealloc(adds[2], 100);
    printf("Realloc add: %p\n\n", ret);
    ret = mymalloc(10);
    printf("Malloc add: %p\n\n", ret);

    



    return 0;
}*/

//Lab group: Aaron Sala, Robert Campbell, Joe Sloyan

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


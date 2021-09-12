
#include <stdio.h>
#include <unistd.h>
#include <errno.h>

void* roundUp(void* a){
	//return a+((8-a%8)%8);
	//Good chance this is no faster, but if GCC is dumb 
	return (void*)((long long)a + (((8-((long long)(a))&0x07))&0x07));
}

void* add_addr(void* a, int offset){
	return (void*)((long long)a + offset);
}

int getNPages(size_t a){
	int pageSize = sysconf(_SC_PAGESIZE);
	if(a%pageSize == 0){
		return a/pageSize;
	}
	return a/pageSize+1;
}

struct node{
	struct node* next;
	struct node* prev; 
	void* memStart;
	int size;
	int free;
};

void split_and_allocate(struct node* ptr, int request){
	int original_size = ptr->size;
	struct node* orig_next = ptr->next;
	ptr->size = request;
	ptr->free = 0;
	ptr->next = roundUp((void*)ptr + sizeof(struct node) + request);
	struct node* next = ptr->next;
	next->size = original_size - request - sizeof(struct node);
	next->free = 1;
	next->next = orig_next;

}

void* endOfCurrentPage = NULL;
struct node* start;
int setup = 0;
//Every time malloc is called we request new memory from the OS. If we succeed,
//we return the pointer from sbrk(). If we fail, we set errno and return NULL.
//We do not search for unallocated memory that can be re-used.
void* malloc(size_t size){
	int pageSize = sysconf(_SC_PAGESIZE);
	if(setup == 0){
		int TotalNeeded = sizeof(*start) + size + 16 + sizeof(*start); //plus 16 for allignment purposes
		int nPages = getNPages(TotalNeeded);
		int bytesRequested = pageSize*nPages;
		start = sbrk(bytesRequested); 
		endOfCurrentPage = add_addr(start, bytesRequested);
		void* retVal = roundUp(add_addr(start,sizeof(*start)));
		start->memStart = retVal; 
		struct node* endOfBlock = roundUp(add_addr(retVal, size));
		endOfBlock->prev = start;
		endOfBlock->next = NULL;
		start->prev = NULL;
		start->size = size; 
		start->next = endOfBlock;
		start->free = 0;
		setup = 1;
		return retVal;
	}
	struct node* current = start; 
	size_t requestedSize = sizeof(*start) + size + 16; //plus 16 for allignment purposes 
	while(1){
		while(current->free == 0 && current->next != NULL){ 
			current = current->next; 
		}
		if((current->next == NULL)){
			break;
		}
		if((current->next)-current < requestedSize){ //needs to be fixed
			current = current->next;
			continue;
		}
		break;
	}
	if(current->next == NULL){
		//Do this if we need new mem 
		
		void* memStart = roundUp(add_addr(current,sizeof(*current)));
		if(add_addr(memStart,requestedSize) > endOfCurrentPage){
			void* newMem = sbrk(pageSize*getNPages(requestedSize)); //get new Page 
			endOfCurrentPage = add_addr(newMem, pageSize*getNPages(requestedSize)); //set end of Current page address
			struct node* newStart = newMem; //New Node at the start of memory
			void* retVal = roundUp(add_addr(newMem, sizeof(*newStart))); //start of the given memory 
			newStart->memStart = retVal; 	//Set the start of the Node memory as memstart. 
			struct node* endOfBlock = roundUp(add_addr(retVal,size)); //create endNode 
			endOfBlock->prev = newStart; 
			endOfBlock->next = NULL;
			newStart->prev = current;
			newStart->size = size; 
			newStart->next = endOfBlock;
			newStart->free = 0;
			current->next = newStart;
			current->free = 1;
			return retVal;
		}else{
			void* retVal = roundUp(add_addr(current, sizeof(*current)));
			struct node* newEnd = roundUp(add_addr(retVal, size));
			newEnd->prev = current;
			newEnd->next = NULL;
			current->next = newEnd;
			current->memStart = retVal;
			current->free = 0;
			return retVal;
		}
	}
	current->memStart = roundUp(add_addr(current,sizeof(*current)));	void* retVal = roundUp(add_addr(current,sizeof(*current)));
	start->free = 0;
	//setup = 1;
	return retVal;
	//Do this if it fits.
	



	//HANDLE When We can fit it 
	//Handle when we can't 


}

void free(void* addr){
	struct node* current = start; 
	while(current->next){
		if(current->memStart == addr){
			current->free = 1;
			return;
		}
	}
	//ERROR

}


void main(){
	int* ret;
	for(int i = 0; i < 20; i++){
		if(i%3){
			ret = malloc(4000);
		}
		else if(i %2){
			ret = malloc(250);
		}
		else{
			ret =  malloc(12);
		}
	
	}
	return;	
}


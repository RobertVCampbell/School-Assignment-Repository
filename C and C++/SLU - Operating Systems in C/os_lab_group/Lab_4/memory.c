#include <sys/types.h>

struct node{
	int size;
	bool free;
	void* start;
	struct node next;
};

void split_and_allocate(struct node* ptr, int request){
	int original_size = ptr->size;
	struct node* orig_next = ptr->next;
	ptr->size = request;
	ptr->free = False;
	ptr->next = (void*)ptr + sizeof(node) + request;
	struct node* next = ptr->next;
	next->size = orig_size - request - sizeof(node);
	next->free = true;
	next->next = orig_next;
	
}

void *malloc( size_t size );
void free( void *ptr );
void *calloc( size_t num_of_elts, size_t elt_size );
void *realloc( void *pointer, size_t size);

int main(int argc, char* argv[]){
	called = False;
	struct node* HEAD;
	int size = 4096; //probably supposed to be a constant
	
	if(!called){
		HEAD = sbrk(size);
		HEAD->size = size;
		HEAD->free = true;
		HEAD->next = NULL;
		HEAD->start = HEAD + sizeof(node);
	}
	
	return 0;
}
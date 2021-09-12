#include <stdexcept>
#include <iostream>
using namespace std;

/** The vector class
 * based on implementation from chapter 6 of textbook
 */
template <typename Object>
class Vector {
  
private:
  


  int _capacity;	//current maximum capacity
  int _size;		//number of elements in vector currently
  Object * _data;	//array to store the vector
   
public:
  
  //constructor
  Vector(int cap=100) : _capacity(cap), _size(0), _data(new Object[_capacity]) {}
  
  //destructor
  ~Vector() {
    delete[] _data;
  }

  /* function to insert and shift the rest of the list down
  *  input: an int which is the index of where to insert
            the data to insert into the vector */  
  void insert(int index, const Object& element) {
	if((index < 0) || (index > _size))
		throw domain_error("index is out of bounds");
	
	if(_size < _capacity){
		for(int i = _size; i > index; i--){
			_data[i] = _data[i-1];}
} 
  } //end of insert function

  /*  function to return the current size of the vector */  
  int size() const {
   return _size; 
  }
  
  /*  function to return true if the vector is empty (regardless of capacity) */
  bool empty() const {
    return _size == 0;
  }
  
  /*  function to allow access to arbitrary elements in the vector
   *  input: an index of an element in the array
   *  output: a reference to that object  */
  Object& operator[](int index) {
    if ((index >= _size) || (index < 0))
      throw domain_error("index is out of bounds");
    
    return _data[index];
  }
  
  /* function to delete an element of the vector, and shift the rest down
   * input: a valid index of an element in the vector */
  void erase(int index) {

  }

  void push_back(Object e) {
  }
  
  void pop_back() {
  }  

  
  //copy constructor
  Vector(const Vector& other) {
  }

  
  //operator=
  Vector& operator=(const Vector& other) {
    if (this != &other) {
    }
    return *this;
  }
  
};

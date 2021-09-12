#include "Vector.h"
#include <iostream>
using namespace std;

int main() {
	Vector<int> testvec;
	Vector<int> test2vec;
	
	for(int i = 0; i <= 10; i++)
		testvec.push_front(i);
	
	testvec.print();
	
	testvec.insert(5, 1);
	testvec.insert(5,0);
	testvec.insert(5,3);
	
	testvec.print();
	
	testvec.reverse();
	
	testvec.print();
	
	test2vec.push_front(5);
	test2vec.push_front(10);
	test2vec.push_front(90);
	test2vec.push_front(29);
	test2vec.push_front(34);
	test2vec.push_front(21);
	test2vec.push_front(3);
	test2vec.push_front(7);
	test2vec.push_front(15);
   
   test2vec.print();
   test2vec.sort();
   test2vec.print();
   test2vec.reverse();
   test2vec.print();
   
   cout << test2vec.maximum() << endl;
   cout << testvec.maximum() << endl;
   return 0;
}
#include "Vector.h"
#include <iostream>
using namespace std;

int main() {
/*	Vector<float> testvec;
	
	testvec.push_back(3.7);
	testvec.push_back(2.1);
	testvec.push_back(9.8);
	testvec.push_back(-3.9);
	testvec.push_back(5.3);
	testvec.push_back(-11.2);
	testvec.push_back(7.6);
	
	testvec.print();
	
	testvec.reverse();
	testvec.print();
	
	testvec.sort();
	testvec.print();
*/

	//Quicksort testing
	Vector<int> testvec;
	testvec.push_back(20);
	testvec.push_back(10);
	testvec.push_back(9);
	testvec.push_back(10);
	testvec.push_back(15);
	testvec.push_back(51);
	testvec.push_back(310);
	testvec.push_back(24);

	testvec.print();
	testvec.reverse();
	testvec.print();
	testvec.sort();
	testvec.print();

	testvec.sort();
	testvec.print();
   return 0;
}

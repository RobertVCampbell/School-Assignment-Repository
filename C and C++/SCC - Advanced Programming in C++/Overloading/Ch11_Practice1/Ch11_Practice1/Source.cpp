#include "Box.h"

#ifndef RectangleType_h
#define RectangleType_h
#endif

#include <iostream>
using namespace std;

int main(){
	cout << "Rectangle with default constructor." << endl;
	RectangleType r1;
	r1.print();

	cout << endl;

	cout << "Rectangle with parameter constructor." << endl;
	RectangleType r2(3,4);
	r2.print();

	cout << endl;

	cout << "Rectangle with setDimension method." << endl;
	RectangleType r3(10,4);
	r3.print();
	r3.setDimensions(3,5);
	cout << endl;
	r3.print();
	cout << endl;

	cout << "Box with default constructor." << endl;
	Box b1;
	b1.print();
	cout << endl;

	cout << "Box with parameter constructor." << endl;
	Box b2(7,8,9);
	b2.print();
	cout << endl;





system("pause");
return 0;
}
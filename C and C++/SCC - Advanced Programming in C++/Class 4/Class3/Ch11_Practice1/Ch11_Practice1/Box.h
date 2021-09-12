#include "RectangleType.h"
#include <iostream>

using namespace std;

class Box : public RectangleType{
private: 
	double height;
	

public:

	//default constructor
	Box(){
		height = 0;
	}

	//Invoke the constructor of the base class to assign the variables in creating this box
	Box(double l, double w, double h): RectangleType(l,w){
		height = h;
	}

	void setDimensions(double l, double w, double h){
		RectangleType::setDimensions(l,w); // accessing a function from the base class
		height = h;
	}

	double getHeight(){
	return height;}

	double calcArea(){
		return ((2 * height * getWidth()) + (2 * height * getLength()) + (2 * getLength() * getWidth())); 
	}

	double calcVolume() const{
		return RectangleType::calcArea() * height;
	}

	void print(){
		cout << "Height " << height<< endl;
		RectangleType::print();
	}




};
#include <iostream>


using namespace std;

class RectangleType{
private:
	double length, width;


public:
	RectangleType(){//default constructor
	length =0;
	width = 0;
	}

	RectangleType(double l, double w){
	length = l;
	width = w;
	}


	void setDimensions(double l, double w){
		length = l;
		width = w;	
	}

	double getLength()const{
	return length;}


	double getWidth() const {
		return width;}

	double calcArea() const{
		return length * width;
	}

	double calcPerim() const {
		return (2* length) + (2 * width);
	}

	void print () const{
		cout << "Length " << length << endl;
		cout << "Width " << width << endl;
		//cout << "Area " << calcArea() << endl;
		//cout << "Perimeter " << calcPerim() << endl;
	}

};
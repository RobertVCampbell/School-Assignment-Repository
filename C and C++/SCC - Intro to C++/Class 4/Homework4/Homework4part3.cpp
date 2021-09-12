// Homework4part3.cpp : Defines the entry point for the console application.
//Name:       Robert Campbell
//Page 255 # 4
//Put the code in the correct order

#include "stdafx.h"
#include <string>
#include <iostream>
#include <iomanip>
#include <cmath>

using namespace std;
const double PI = 3.1416;

int _tmain(int argc, _TCHAR* argv[])
{
	
	string shape;
	double height;
	double width;
	double radius;
	double length;

	cout << fixed << showpoint << setprecision(2);

	
	cout << "Enter the shape type: (rectangle, circle, cylinder) ";
	cin >> shape;
	cout << endl;


	
	if (shape == "rectangle"){
		cout << "Enter the length of the rectangle: ";
		cin >> length;
		cout << endl;

		cout << "Enter the width of the rectangle: ";
		cin >> width;
		cout << endl;

		cout << "Perimeter of the rectangle = "
			<< 2 * (length + width) << endl;
		
		cout << "Area of the rectangle = "
			<< length * width << endl;
	}
	else if (shape == "circle"){
		cout << "Enter the radius of the circle: ";
		cin >> radius;
		cout << endl;

		cout << "Circumference of the circle: "
			<< 2 * PI * radius << endl;

		cout << "Area of the circle = "
			<< PI * pow(radius, 2.0) << endl;
	}
	else if (shape == "cylinder"){
		cout << "Enter the radius of the base of the cylinder: ";
		cin >> radius;
		cout << endl;

		cout << "Enter the height of the cylinder: ";
		cin >> height;
		cout << endl;

		cout << "Surface area of the cylinder: "
			<< 2 * PI * radius * height + 2 * PI * pow(radius, 2.0)
			<< endl;

		cout << "Volume of the cylinder = "
			<< PI * pow(radius, 2.0) * height << endl;
	}
	else
		cout << "The program does not handle " << shape << endl;

	system("pause");
	return 0;
}//End of main


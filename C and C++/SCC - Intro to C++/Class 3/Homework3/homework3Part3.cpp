// homework3Part3.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iomanip>
#include <cmath>
#include <iostream>



using namespace std;

const double PI = 3.14159; 

int main()
{
	cout << fixed << showpoint << setprecision(2);

	//Declarations
	double height;
	double radius;



	//Input
	cout << "Enter the height of the cylinder = ";
	cin >> height;
	cout << endl;

	cout << "Enter the radius of the base of the cylinder: ";
	cin >> radius;
	cout << endl;


	//Processing

	//Outpout
	cout << "Volume of the cylinder = " << PI * pow(radius, 2.0) * height << endl;
	cout << "Surface area: " << 2 * PI * radius * height + 2 * PI * pow(radius, 2.0) << endl;



	system("pause");
	return 0;
}


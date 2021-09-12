// ConsoleApplication2.cpp : Defines the entry point for the console application.
//

#include <iostream>

using namespace std;

//CONSTANTS
const double PI = 3.14;

int main()
{
	//Declaring variables "radius" and "area"
	double radius;
	double area;
	double circumference;
	
	//Asks for and stores the value of the radius
	cout << "Enter the radius: ";
	cin >> radius;
	cout << endl;

	//Calculations
	area = PI * radius * radius;
	circumference = 2 * PI * radius;

	//Output the results
	cout << "Area = " << area << endl;
	cout << "Circumference = " << circumference << endl;

	system ("pause");
	return 0;
}


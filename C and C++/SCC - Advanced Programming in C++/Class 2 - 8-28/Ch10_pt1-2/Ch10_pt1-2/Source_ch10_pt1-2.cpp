/*Name: Robert Campbell
  Date: 09/03/2017
  Purpose: Create a class file containing the information about a day and a program to test it
		- Class (dayType.h):
			+ Must keep track of and return the day of the week of the object
			+ Must be able to print the day of the week of the object
			+ Must be able to be able to return the day after and the day prior to the object
			+ Must be able to calculate what day occurs x days before or after the objects day, where x is a user input value
		- Main (Source_ch10_pt1-2.cpp):
			+ Must be able to test all of the object's functions
  */

#include <iostream>
#include <string>
#include "dayType.h"

using namespace std;

int main() {
	string day, tempD;
	int dayNum, tempNum;

	dayType d1;
	dayType d2(7);
	dayType d3("Wednesday");

	d1.display();
	d2.display();
	d3.display();

	d1.setDay(3);
	d1.display();

	d2.setDay("tuesday");

	cout << "The day of object 1 is: " << d1.today() << ". Which is the " << d1.dayNum() << " day of the week." << endl;
	cout << "Yesterday was: " << d1.preDay() << endl;
	cout << "Tomorrow is: " << d1.nextDay() << endl;
	cout << endl;


	cout << "21 days from object 2: " << d2.today() << "\nis: " << d2.calcDay(21) << endl;
	cout << "62 days prior to object 3: " << d3.today() << "\nis: " << d3.calcDay(62) << endl;


	
	system("pause");
	return 0;
};//End of main
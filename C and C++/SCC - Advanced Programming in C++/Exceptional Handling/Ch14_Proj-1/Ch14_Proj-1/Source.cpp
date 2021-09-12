/*Created by: Robert Campbell
  Created on: 10/18/17
  Purpose: Write a program that converts a distance from ft/in  to cm.
		   Use try/throw/catch to handle the appropriate exception and
		   prompt the user to enter another set of numbers*/


#include <iostream>
#include <iomanip>
#include <string>

using namespace std;

int main() {
	int ft, in;
	int cm;

	bool pass = false; 
	try {
		cout << "Please enter a length in feet and inches when prompted." << endl;
		cout << "Please enter the number of feet: ";
		cin >> ft;
		if (cin.fail())
		{
			cin.clear();
			cin.ignore();
			throw(1);
		}
		else if (ft < 0)
			throw 1;
	}

	catch (int x) {
		cout << "Please enter a valid value for the number of feet: ";
		cin >> ft;
	}

	try {
		cout << "please enter the number of inches:"
	}
	

	system("pause");
	return 0;
}
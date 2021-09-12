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
	int cm, temp;

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
		do {
			cout << "Please enter a valid value for the number of feet: ";
			cin >> ft;
		
			if (cin.fail())
			{
				cin.clear();
				cin.ignore();
				cout << endl;
			}
			else if (ft < 0)
				cout << endl;
			else {
				pass = true;
			}
		} while (!pass);
	}

	pass = false;

	try {
		cout << "Please enter the number of inches:";
		cin >> in;
		if (cin.fail())
		{
			cin.clear();
			cin.ignore();
			throw(1);
		}
		else if (in < 0)
			throw 1;
		else if (in < 12)
			throw 1;
	}

	catch (int x) {
		do {
			cout << "Please enter a valid value for the number of inches: ";
			cin >> in;
		
			if (cin.fail())
			{
				cin.clear();
				cin.ignore();
				cout << endl;
			}
			else if (in < 0)
				cout << endl;
			else if (in >= 12)
				cout << endl;
			else {
				pass = true;
			}
		} while (!pass);
	}
	
	temp = (ft * 12) + in;
	cm = (temp * 2.54);

	cout << "\nThe length " << ft << "' " << in << "\" " << "in cm is:  " << cm << "cm." << endl;
	

	system("pause");
	return 0;
}
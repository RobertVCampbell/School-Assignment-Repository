/*Created by: Robert Campbell
  Created on 10/16/2017
  Purpose: Create a program that takes a standard format time value from a user and returns a 24hr format ("military time")*/

#include <iostream>
#include <string>
#include <iomanip>

using namespace std;


int conversion(int h, bool n) {
	if (n) {
		if (h != 12) 
			h += 12;
		else
			h = 12;
		}//endif
	else {
		if (h == 12)
			h = 0;
		else
			h = h;			
	}//endelse

	return h;


};

int main() {
	int sH, min, sec;
	int mH = -2;

	bool noon, pass;
	char tod;


	cout << "Please enter the time in standard 12-hr format as prompted." << endl;

	try {
		cout << "\nPlease enter the [hour]: ";
		cin >> sH;

		if (cin.fail()) {
			cin.clear();
			cin.ignore();
			throw 1;
		}
		else if (sH <= 0 || sH > 12)
			throw 1;
	}

	catch(int x){
		pass = false;
		
		do {
			cout << "Please enter a valid [hours] value: ";
			cin >> sH;

			if (cin.fail()) {
				cin.clear();
				cin.ignore();
				cout << endl;
			}
			else if (sH <= 0 || sH > 12)
				cout << endl;
			else
				pass = true;

		} while (!pass);
	}

	try {
		cout << "\nPlease enter the [minutes]: ";
		cin >> min;

		if (cin.fail()) {
			cin.clear();
			cin.ignore();
			throw 1;
		}
		else if (min < 0 || min >= 60)
			throw 1;
	}

	catch (int x) {
		pass = false;

		do {
			cout << "Please enter a valid [minutes] value: ";
			cin >> min;

			if (cin.fail()) {
				cin.clear();
				cin.ignore();
				cout << endl;
			}
			else if (min < 0 || min >= 60)
				cout << endl;
			else
				pass = true;

		} while (!pass);
	}

	try {
		cout << "\nPlease enter the [seconds]: ";
		cin >> sec;

		if (cin.fail()) {
			cin.clear();
			cin.ignore();
			throw 1;
		}
		else if (sec < 0 || sec >= 60)
			throw 1;
	}

	catch (int x) {
		pass = false;

		do {
			cout << "Please enter a valid [seconds] value: ";
			cin >> sec;

			if (cin.fail()) {
				cin.clear();
				cin.ignore();
				cout << endl;
			}
			else if (sec < 0 || sec >= 60)
				cout << endl;
			else
				pass = true;

		} while (!pass);
	}


	try {
		cout << "\n\nPlease enter if it is morning (am)  or afternoon (pm): ";
		cin >> tod;
		cin.clear();
		//fflush(stdin);
		cout << endl;

		if (cin.fail()) {
			cin.clear();

			throw 1;
		}

		switch (tod) {
		case 'a': case 'A':
			noon = false;
			break;
		case 'p': case 'P':
			noon = true;
			break;
		default:
			throw 1;
		}//End switch
		
	}//End try

	catch (int x) {
		pass = false;

		do {
			cout << "Please enter a valid value for morning [am]  or afternoon [pm]: ";
			cin >> tod;
			cin.clear();

			if (cin.fail()) {
				cin.clear();
				cin.ignore();
				cout << endl;
			}

			switch (tod) {
			case 'a': case 'A':
				noon = false;
				pass = true;
				break;
			case 'p': case 'P':
				noon = true;
				pass = true;
				break;
			default:
				cout << endl;
				break;
			}//End switch
		} while (!pass);
	}

	
	cout << "\n\nIn 24hr format, the time is: " << setfill('0') << setw(2)  << conversion(sH, noon) << ":"  << setfill('0') << setw(2) << min << ":" << setfill('0') << setw(2)<< sec << endl << endl;




	system("pause");
	return 0;
}
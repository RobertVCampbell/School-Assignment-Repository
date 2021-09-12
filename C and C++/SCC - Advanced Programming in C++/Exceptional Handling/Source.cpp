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

	bool noon;
	char tod;

	cout << set;
	cout << "Please enter the time in standard 12-hr format as prompted." << endl;
	cout << "\nPlease enter the (hour): ";
	cin >> sH;

	cout << "\n\nPlease enter the (minutes) past the hour: ";
	cin >> min;

	cout << "\n\nPlease enter the (seconds) past the minute: ";
	cin >> sec;

	cout << "\n\nPlease enter if it is morning (am)  or afternoon (pm): ";
	cin >> tod;
	cin.clear();
	fflush(stdin);
	
	try {
		switch (tod) {
		case 'a': case 'A':
			noon = false;
			break;
		case 'p': case 'P':
			noon = true;
			break;
		default:
			throw string("Invalid Time of Day.");
		}//End switch


		if (sH > 0 && sH <= 12) {
			mH = conversion(sH, noon);
		}//endIf
		else
			throw string("The hours given were not in standard (12hr) format.");

		if (min < 0 || min >= 60)
			throw string("The minutes given were not valid.");


		if (sec < 0 || sec >= 60)
			throw string("The seconds given were not valid.");

	}//end try

	catch (string s) {
		cout << "Error:\n" << s << endl;
	}

	cout << "\n\nIn 24hr format, the time is: " << setfill("0") << setw(2) << mH << ":"  << setfill("0") << setw(2) << min << ":" << setfill("0") << setw(2)<< sec << endl;




	system("pause");
	return 0;
}
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
#include <locale>

using namespace std;


class dayType {
	private:
		string DAY[7] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
		int MAX = 6;

		int thisDay;

	public:
		dayType(){
			thisDay = 0;
		}//End default constructor

		dayType(int d) {
			while (thisDay == NULL){
				if (d > 0 && d <= 7) {
					thisDay = d - 1;}//End if
				else {
					cout << "Please enter a valid day of the week (between 1-7): ";
					cin >> d;}//end else
			}//end while
		}//end int constructor

		dayType(string temp) {
			bool match = false;
			while (!match) {
				for (int i = 0; i < 7; i++) {
					if (DAY[i] == temp) {
						thisDay = i;
						match = true;
						break;	}//End if
				}//End for

				if (!match) {
					cout << "No match found. Please make sure you are using standard format (e.g. \"Monday\")\n" << endl;
					cout << "Please enter the day of the week: ";
					cin >> temp;
				}//End if
			}//End while

		}//End string constructor


		//Mutator Functions

		void setDay(string temp) {
			bool match = false;
			while (!match) {
				for (int i = 0; i < 7; i++) {
					if (DAY[i] == temp) {
						thisDay = i;
						match = true;
						break;
					}//End if
				}//End for

				if (!match) {
					cout << "No match found. Please make sure you are using standard format (e.g. \"Monday\")\n" << endl;
					cout << "Please enter the day of the week: ";
					cin >> temp;
				}//End if
			}//End while

		}//End of string Setday

		void setDay(int d) {
			bool set = false;

			while (!set) {
				if (d > 0 && d <= 7) {
					thisDay = d - 1;
					set = true;
				}//End if
				else {
					cout << "Please enter a valid day of the week (between 1-7): ";
					cin >> d;
				}//end else
			}//end while
		}//End of int setDay



		//Accessor functions

		void display() {
			cout << "Today is: " << DAY[thisDay] << endl;
		}//end of display

		string today() {
			return DAY[thisDay];}//end of today()

		int dayNum() {
			return thisDay + 1;	}//end of dayNum

		string nextDay() {
			if (thisDay < MAX)
				return DAY[thisDay + 1];
			else
				return DAY[0];
		}//End nextDay

		string preDay() {
			if (thisDay > 0)
				return DAY[thisDay - 1];
			else
				return DAY[MAX];
		}//End of preDay

		string calcDay(int d) {
			int dayNum = thisDay;

			while (d > 6) {
				d -= 6;		}//end while

			//Subtract days
			while (d < -6) {
				d += 6;
			}//endwhile

			while (d > 0) {
				if (dayNum + d == -1) {
					dayNum = 6;
					d -= 1;
				}//end if
				else if (dayNum + d == 7) {
					dayNum = 0;
					d -= 1;
				}//end else if

				else {
					dayNum += d;
					d -= 1;
				}
			}//end of while

			while (d < 0) {
				if (dayNum + d == -1) {
					dayNum = 6;
					d += 1;
				}//end if
				else if (dayNum + d == 7) {
					dayNum = 0;
					d += 1;
				}//end else if

				else {
					dayNum += d;
					d += 1;
				}
			}//end of while

			return DAY[dayNum];				
		}//End of calcDay


};//end of class
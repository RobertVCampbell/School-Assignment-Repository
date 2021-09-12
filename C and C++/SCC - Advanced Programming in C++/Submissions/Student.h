/*Name: Robert Campbell
  Date Created: 08/28/2017
  Purpose: Practice creating and managing objects by:
		- Defining a class file
			+ Controlling access to members and methods
			+ Creating mutator and accessor methods
		- Importing the class file into a source file
			+ Create multiple instances of an object
			+ Manipulate the members of the objects via mutators
			+ Access the members via accessors
		- Use main() to test the class file and its methods
*/

#include <string>
#include <iostream>

using namespace std;

class Student{
	private:
		int admno;
		string sname;
		double eng, math, science;
		double total;
		string temp;

		//Method to test if a grade is out of the expected range of 0 to 100
		//   Additional note about getline: getline stops at an eol in the input stream
		//     w/ return being the normal key to press to send input, that leaves a eol in the 
		//     input stream (my assumption) when just using cin. This extra getline is to clear that.
		double testGrade(string course, string tname, double x){
			while(x > 100 || x < 0){
				cout << tname << "'s " << course << " grade is out of the expected range.\nPlease enter a valid grade (0 - 100): ";
				cin >> x;
				getline(cin, temp);
				cout << endl;
			}//end of while loop
			return x;
		}

		//Method to calculate the total grade
		double ctotal(){
			return (eng + math + science);
		}

	public:

		//Default constructor
		// Uses 0's and blanks as no information was provided
		Student(){
			admno = 0;
			sname = "blank";
			eng = 0;
			math = 0;
			science = 0;

			total = ctotal();

		}

		//Constructor that accepts values for each member
		// except total, as that number is calculated
		Student(int a, string n, double e, double m, double s){
			admno = a;
			sname = n;
			
			eng = testGrade("English", n, e);

			math = testGrade("Math", n, m);

			science = testGrade("Science", n, s);

			total = ctotal();
		}


		void takeData(int a, string n, double e, double m, double s){
			admno = a;
			sname = n;
			admno = a;
			sname = n;
			
			eng = testGrade("English", n, e);

			math = testGrade("Math", n, m);

			science = testGrade("Science", n, s);

			total = ctotal();
		}

		void showData(){
			cout << "Student id: " << admno << endl;
			cout << "Student name: " << sname << endl;
			cout << "English grade: " << eng << " out of 100" << endl;
			cout << "Math grade: " << math << " out of 100" << endl;
			cout << "Science grade: " << science << " out of 100" << endl;
			cout << "Total grade: " << total << " out of 300" << endl << endl;
		}


};
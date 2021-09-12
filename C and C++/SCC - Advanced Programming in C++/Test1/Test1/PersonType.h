/*Created by: Robert Campbell
  Created on: 09/27/2017
  Purpose: To create and test an inherited class
	The parent class is to be named PersonType
		- Has variables: (firstName, lastName, age)
		- Has functions: (print, setName, setAge, getFirstName, getLastName)
		- Has constructors: (default, 3 parameter [string string int])
	The child class is to be named DoctorType
		- Has variable: (specialty)
		- Has manipulator and accessor functions
		- Has constructors: (default, 4 parameter [string string int string])
	Source file will test the objects and functions
*/

#include <iostream>
#include <string>

using namespace std;

class PersonType {
	private: 
		string firstName, lastName;
		int age;

	public:
		//default constructor
		PersonType() {
			firstName = "No";
			lastName = "Name";
			age = -1;
		}

		//parameter constructor
		PersonType(string f, string l, int a) {
			firstName = f;
			lastName = l;
			age = a;
		}


		//Mutator functions
		void setName(string f, string l) {
			firstName = f;
			lastName = l;
		}

		void setAge(int a) {
			age = a;
		}


		//Accessor functions
		void print() {
			cout << "First name: " << firstName << endl;
			cout << "Last name:  " << lastName << endl;
			cout << "Age:        " << age << endl;
		}
	
		string getFirstName() {
			return firstName;
		}

		string getLastName() {
			return lastName;
		}

		int getAge() {
			return age;
		}

};//End of class
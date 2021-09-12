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

#include "PersonType.h"
#include <iostream>
#include <string>

using namespace std;

class DoctorType {
	private:
		string spec;
		PersonType doctor;

	public:
		//default constructor
		DoctorType() {
			spec = "none";
			
		}
		//Parameter constructor
		DoctorType(string f, string l, int a, string s) {
			spec = s;

			doctor.setName(f, l);
			doctor.setAge(a);
		}

		//Accessor functions
		void print() {
			doctor.print();
			cout << "Specialty:  " << spec << endl;
		}

		int getAge() {
			return doctor.getAge();
		}

		string getFName() {
			return doctor.getFirstName();
		}

		string getLName() {
			return doctor.getLastName();
		}

		//Mutator functions
		void setSpecialty(string s) {
			spec = s;
		}

		void setName(string f, string l) {
			doctor.setName(f, l);
		}

		void setAge(int a) {
			doctor.setAge(a);
		}

		

};//End of class


#include <string>
using namespace std;

class Dog{
	//Accessibility
	private:
		//Member variable
		string name;
		int age;

	public:
		
		//Constructors

		//default constructor

		Dog(){
			name = "rex";
			age = 3;
		}

		Dog(string n, int a) {
			name = n;
			age = a;
		}

		//methods

		void bark(){
			cout << "woof woof" << endl;
			cout << "My name is " << name << endl;
			cout << "My age is " << age << endl;
			cout << endl;
		}


		void display(){
			cout << "Name: " << name << endl;
			cout << "Age: " << age << endl;
		}

		//mutator functions
		void haveBday(){
			age++;
		}

		//accessor method()
		//constant (unchanging) method
		int getAge() const{
			return age;
		}
};
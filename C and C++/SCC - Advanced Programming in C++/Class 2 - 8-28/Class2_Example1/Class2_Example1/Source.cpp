
#include <iostream>
#include <string>
#include "Dog.h"

using namespace std;



int main(){

	//Creating an object
	Dog d1;
	Dog d2("tommy", 20);

	d1.display();
	d1.bark();

	//d1.name = "Rex";
	//d1.age = 5;

	d1.haveBday();

	d1.display();
	d1.bark();

	d2.display();
	d2.bark();

	d2.haveBday();
	cout << "After birthday: " << d2.getAge() << endl;

system("pause");
return 0;
}//end of main
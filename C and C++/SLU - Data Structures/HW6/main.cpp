#include "List.h"
#include <iostream>
using namespace std;

int main() {
	
	List<float> testList;
	
	testList.push_back(3.7);
	testList.push_back(2.1);
	testList.push_back(9.8);
	testList.push_back(-3.9);
	testList.push_back(5.3);
	testList.push_back(-11.2);
	testList.push_back(7.6);
	
	testList.print_list();
		
	testList.reverse();
	testList.print_list();
	
	testList.sort();
	testList.print_list();
   
   return 0;
}
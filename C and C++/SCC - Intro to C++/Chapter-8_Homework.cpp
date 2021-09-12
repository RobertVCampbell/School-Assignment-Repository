// Chapter-8_Homework.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>

using namespace std;

int main()
{
	int count;
	int alpha[50];

	for(count=0; count < 25; count++){
		alpha[count] = count * count;
	}
	for(count; count < 50; count++){
		alpha[count] = count * 3;
	}

	for(count = 0; count < 50; count){
		cout << alpha[count] << " " << alpha[count + 1] << " " <<alpha[count + 2] << " " <<alpha[count + 3] << " "
			<<alpha[count + 4] << " " <<alpha[count + 5] << " " <<alpha[count + 6] << " " <<alpha[count + 7] << " "
			<<alpha[count + 8] << " " <<alpha[count + 9] << endl;
		count += 10;
	}

	system("pause");
	return 0;
}



#include "stdafx.h"
#include <iostream>
#include <iomanip>
#include "houseType.h"
 
using namespace std;

int main()
{
    houseType myHouse("Ranch", 3, 2, 2, 2005, 1300, 185000, 3600.0);

    cout << fixed << showpoint << setprecision(2);

    cout << "My house:------" << endl;
    myHouse.print();
    cout << endl;
	system ("pause");
    return 0;
}//end main




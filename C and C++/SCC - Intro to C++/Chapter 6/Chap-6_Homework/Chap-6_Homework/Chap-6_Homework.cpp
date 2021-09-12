/* Chap-6_Homework.cpp : Defines the entry point for the console application.
	Created by: Robert Campbell
	Created on: 10/17/2016
	Purpose: To test set strings to see if they are palindromes.

*/

#include "stdafx.h"
#include <iostream>
#include <iomanip>
#include <string>
#include <cctype>

using namespace std;

bool isPalindrome(string str);
void output(bool pal);

int main()
{
	string input = "";
	bool palindrome;

	/*cout << "This program tests for palindromes.\nPlease enter a word or number:";
	cin >> input;
	*/

	input = "madam";
	cout << "Is " << input << " a palindrome?" << endl << endl;
	palindrome = isPalindrome(input);
	output(palindrome);
	
	input = "Madam";
	cout << "Is " << input << " a palindrome?" << endl << endl;
	palindrome = isPalindrome(input);
	output(palindrome);
	
	input = "abba";
	cout << "Is " << input << " a palindrome?" << endl << endl;
	palindrome = isPalindrome(input);
	output(palindrome);
	
	input = "22";
	cout << "Is " << input << " a palindrome?" << endl << endl;
	palindrome = isPalindrome(input);
	output(palindrome);
	
	input = "67876";
	cout << "Is " << input << " a palindrome?" << endl << endl;
	palindrome = isPalindrome(input);
	output(palindrome);
	
	input = "444244";
	cout << "Is " << input << " a palindrome?" << endl << endl;
	palindrome = isPalindrome(input);
	output(palindrome);
	
	system("pause");
	return 0;
}//End of main()

bool isPalindrome(string str){
	int length = str.length();
	for (int i = 0; i < length / 2; i++) {
		if(tolower(str[i]) != tolower(str[length -1 -i])){
			return false;
			}//End of if
		
		}//End of for loop
	return true;
}//End of isPalindrom()

void output(bool pal){

	if(pal){
		cout << "This IS a palindrome" << endl << endl;
	}
	else {
		cout << "This IS NOT a palindrome" << endl << endl;
	}
	

}//end of output
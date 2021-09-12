#pragma once
#include <string>
using namespace std;

/*#include "stdafx.h"
#include <iostream>
#include <string>
#include <iomanip>
#include "studentType.h"
*/

class studentType
	{
	private:
		string firstName;
		string lastName;
		char courseGrade;
		int testScore;
		int programmingScore;
		double GPA;

	public:
		void setData(string fn = "", string ln = "", char grade = '*',
			int tScore = 0, int prgScore = 0, double gp = 0.0);

		void setFirstName(string fn);
		void setLastName(string ln);
		void setGrade();
		void setTestScore(int tScore);
		void setProgScore(int prgScore);
		void setGPA(double gp);

		string getFirstName() const;
		string getLastName() const;
		char getGrade() const;
		int getTestScore() const;
		int getProgScore() const;
		double getGPA() const;

		void print() const;

		studentType(string fn = "", string ln = "", char grade = '*',
			int tScore = 0, int prgScore = 0, double gp = 0.0);
};
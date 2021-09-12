#include "stdafx.h"
#include <iostream>
#include <string>
#include <iomanip>
#include "studentType.h"

using namespace std;


void studentType::setData(string fn, string ln, char grade,
	int tScore, int prgScore, double gp)
{
	firstName = fn;
	lastName = ln;
	courseGrade = grade;
	testScore = tScore;
	programmingScore = prgScore;
	GPA = gp;
	return;

}

void studentType::setFirstName(string fn)
{
	firstName = fn;
	return;
}

void studentType::setLastName(string ln)
{
	lastName = ln;
	return;
}

void studentType::setGrade()
{
	int score = (testScore + programmingScore) / 2;

	if (score >= 90)
		courseGrade = 'A';
	else if (score >= 80)
		courseGrade = 'B';
	else if (score >= 70)
		courseGrade = 'C';
	else if (score >= 60)
		courseGrade = 'D';
	else
		courseGrade = 'F';
	return;
}

void studentType::setTestScore(int tScore)
{
	testScore = tScore;
	return;
}

void studentType::setProgScore(int prgScore)
{
	programmingScore = prgScore;
	return;
}

void studentType::setGPA(double gp)
{
	GPA = gp;
	return;
}


string studentType::getFirstName() const
{
	return firstName;
}

string studentType::getLastName() const
{
	return lastName;
}

char studentType::getGrade() const
{
	return courseGrade;
}

int studentType::getTestScore() const
{
	return testScore;
}

int studentType::getProgScore() const
{
	return programmingScore;
}

double studentType::getGPA() const
{
	return GPA;
}

void studentType::print() const
{
	cout << "Name: " << firstName << " " << lastName << endl << endl;
	cout << "Grade: " << courseGrade << endl << endl;
	cout << "Test score: " << testScore << endl << endl;
	cout << "Programming score: " << programmingScore << endl << endl;
	cout << "GPA: " << GPA << endl << endl;
}



studentType::studentType(string fn, string ln, char grade,
		int tScore, int prgScore, double gp)
	{
		firstName = fn;
		lastName = ln;
		testScore = tScore;
		programmingScore = prgScore;
		setGrade();
		GPA = gp;
		return;
	}

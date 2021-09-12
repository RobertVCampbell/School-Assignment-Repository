// Chapter-10b_Homework.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>
#include <iomanip>
#include "houseType.h"

void houseType::set(string s, int bed, int bath, int garage, int year, int foot, double cost, double propTx){
	style = s;
	numOfBedrooms = bed;
	numOfBathrooms = bath;
	numOfCarsGarage = garage;
	yearBuilt = year;
	finishedSquareFootage = foot;
	price = cost;
	tax = propTx;
}

void houseType::print() const{
	cout << "Style: " << style << endl;
	cout << "Number of bedrooms: " << numOfBedrooms<< endl;
	cout << "Number of bathrooms: "<< numOfBathrooms<< endl;
	cout << "Garage: " << numOfCarsGarage << " cars" << endl;
	cout << "Year built: " << yearBuilt << endl;
	cout << "Square footage: " << finishedSquareFootage << endl;
	cout << "Value: $" << price <<endl;
	cout << "Property taxes: $" << tax << endl;
}

void houseType::setStyle(string s){
	style = s;
}

string houseType::getStyle() const{
	return style;
}

void houseType::setNumOfBedrooms(int bed){
	numOfBedrooms = bed;
}

int houseType::getNumOfBedrooms() const{
	return numOfBedrooms;
}

void houseType::setNumOfBathrooms(int bath){
	numOfBathrooms = bath;
}

int houseType::getNumOfBathrooms()const{
	return numOfBathrooms;
}

void houseType::setNumOfCarsGarage(int garage){
	numOfCarsGarage = garage;
}

int houseType::getNumOfCarsGarage()const{
	return numOfCarsGarage;
}

void houseType::setYearBuilt(int year){
	yearBuilt = year;
}

int houseType::getYearBuilt() const{
	return yearBuilt;
}

void houseType::setFinishedSquareFootage(int foot){
	finishedSquareFootage = foot;
}

int houseType::getFinishedSquareFootage()const {
	return finishedSquareFootage;
}

void houseType::setPrice(double cost){
	price = cost;
}

double houseType::getPrice()const {
	return price;
}

void houseType::setTax(double propTx){
	tax = propTx;
}

double houseType::getTax() const {
	return tax;
}

houseType::houseType(string s, int bed, int bath, int garage, int year, int foot, double cost, double propTx){
	style = s;
	numOfBedrooms = bed;
	numOfBathrooms = bath;
	numOfCarsGarage = garage;
	yearBuilt = year;
	finishedSquareFootage = foot;
	price = cost;
	tax = propTx;
}
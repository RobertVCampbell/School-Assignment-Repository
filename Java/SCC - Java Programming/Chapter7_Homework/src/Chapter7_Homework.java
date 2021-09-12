/*Created by: Robert Campbell
 *Created on: After the due date
 *Purpose:    Create a program that:	- accepts 5 numbers from a user
 *										- calculates the mean (in a method)
 *										- calculates the standard deviation
 */

import java.util.*;

public class Chapter7_Homework {
	static Scanner console = new Scanner(System.in);
	
	//Declare integers as global variables to reduce the number of variables that need to be passed
	static double num1, num2, num3, num4, num5;
	
	public static void main(String[] args) {
		//double variables for the mean and the std deviation
		double mean, std;
		
		System.out.println("Please enter 5 numbers: ");
		
		num1 = (double)console.nextInt();
		num2 = (double)console.nextInt();
		num3 = (double)console.nextInt();
		num4 = (double)console.nextInt();
		num5 = (double)console.nextInt();
		
		mean = calculateMean();
		
		System.out.println("The mean of these numbers is: " + mean);
		
		std = calculateDeviation(mean);
		
		System.out.println("The standard deviation is: " + std);

	}//- - - - - - - - - - - - - End of main - - - - - - - - - - - - - 
	
	//Calculate the mean
	static double calculateMean(){
		double num = (num1 + num2 + num3 + num4 + num5 ) / 5;
		return num;
	}//- - - - - - - - - - - - - End of calculateMean()- - - - - - - - - - - - -
	
	//Calculate Standard Deviation
	static double calculateDeviation(double avg){
		double dev;
		
		dev = Math.sqrt((Math.pow(num1 - avg, 2)+ Math.pow(num2 - avg, 2)
						+ Math.pow(num3 - avg, 2)+ Math.pow(num4 - avg, 2)
						+ Math.pow(num5 - avg, 2)) / 5);
		
		return dev;
	}//- - - - - - - - - - - - - End of calculateDeviation()- - - - - - - - - - - - 

}//- - - - - - - - - - - - - - - - - - - - - - - - - - End of Class - - - - - - - - - - - - - - - - - - - - - - - - - - 

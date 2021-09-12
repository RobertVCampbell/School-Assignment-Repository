//import classes

import java.util.*;

public class Chapter2 {
	//Create scanner
	static Scanner console = new Scanner(System.in);
	
	//Create constants
	static final int SECRET = 11;
	static final double RATE = 12.50;
	
	public static void main(String[] args) {
				
		//variable declaration
		int num1;
		int num2;
		int newNum;
		String name;
		double hoursWorked;
		double wages;
		
		//executable statements
		//Prompt for and accept two numbers
		System.out.print("Enter two integers, separated by spaces: ");
		num1 = console.nextInt();
		num2 = console.nextInt();
		System.out.println();
		
		//Output stored numbers
		System.out.println("The value of num1 = " + num1 +
				"\nThe value of num2 = " + num2);
		
		//Multiply num1 by 2 and add num2, output the result
		newNum = num1 * 2 + num2;
		System.out.println("The value of newNum = " + newNum);
		
		//add SECRET to newNum, output the result (h)
		newNum += SECRET;
		System.out.println("The value of newNum + |redacted| = " + newNum);
		
		//Prompt for and accept users last name (i)
		System.out.print("Enter your last name: ");
		name = console.next();
		System.out.println();
		
		//Prompt for and store a decimal number between 0-70 (j)
		System.out.print("Please a decimal number beween 0.00 and 70.00: ");
		hoursWorked = console.nextDouble();
		System.out.println();
		
		//Multiply the hours with RATE and store in wages (k)
		wages = hoursWorked * RATE;
		
		//Output name, RATE, hoursWorked, and wages (l)
		System.out.println("Name: " + name);
		System.out.println("Pay Rate: $" + RATE);
		System.out.println("Hours Worked: " + hoursWorked);
		System.out.println("Salary: $" + wages);

		
	}//End of main

}//End of class

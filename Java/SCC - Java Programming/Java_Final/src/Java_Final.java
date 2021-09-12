/*Created by: Robert Campbell
 * Purpose:   Create a code that performs Euclid's algorithm
 * 				-Accept two values
 * 				-Output the Greatest Common Denominator
 */
//import java.io.*;
import java.util.*;


public class Java_Final {

	static Scanner console = new Scanner(System.in);
	
	public static void main(String[] args) {
		//Declare 3 int variables
		int num1;
		int num2;
		int r;
				
			//Prompt for first number, accept input
			System.out.println("Please enter the first positive integer: ");
			num1 = console.nextInt();
			
			//Prompt for second input
			System.out.println("\nPlease enter the second positive integer: ");
			num2 = console.nextInt();
			System.out.println();
			
			
			//Test to see if the numerator (num1) will be larger
			//If not (num2 is larger) then switch num1 and num2
			if(num1 < num2){
				r = num1;
				num1 = num2;
				num2 = r;
			}//End of if
			
			
			//While loop of Euclid's algorithm
			//Once a % of 0 is found, it will fall out of the loop
			//In the loop, the denominator (num2) will replace the numerator (num1) and
			//    the remainder (num1%num2) will become num2
			while(num1 % num2 != 0){
				r = num1 % num2;
				num1 = num2;
				num2 = r;
			}//End Euclid while
			
			System.out.println("The greatest common devisor is " + num2);

		
	}//End of main

}//End of class

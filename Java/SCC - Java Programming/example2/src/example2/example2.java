package example2;

//import .io and .util;
import java.io.*;
import java.util.*;

public class example2 {
	
	//Create main, with a FileNotFoundException in case there is no input file
	public static void main(String[] args)throws FileNotFoundException {
		
		//***Setup
		
		//Declare variables
		double test1,
				test2,
				test3,
				test4,
				test5;
		double average;
		String firstName;
		String lastName;
		
		//Create a Scanner to load up the file
		Scanner inFile = new Scanner(new FileReader("test.txt"));
		
		//Create PrintWriter which will create and write to file "TestAvg.txt"
		PrintWriter outFile = new PrintWriter("TestAvg.txt");
		
		//***Input
		
		//Read the information inside the text document and store in the variables
		//This assumes the information on the document is formated as below:
		//
		// Name Name Number Number Number Number Number
		firstName = inFile.next();
		lastName = inFile.next();
		
		test1 = inFile.nextDouble();
		test2 = inFile.nextDouble();
		test3 = inFile.nextDouble();
		test4 = inFile.nextDouble();
		test5 = inFile.nextDouble();
		
		//***Calculation/processing
		
		//Calculate the average of the imported values
		average = (test1 + test2 + test3 + test4 + test5) / 5;
				
		//***Output
		
		//Print to the new file that outFile is set to write to
		outFile.println("Student Name: " + firstName + " " + lastName);
		
		//Print test scores using .printf:
		//		%5.2f means number(%) w/ 5 (5) spaces left of the . (.) and 2 (2) spaces
		//			to the right and it is a float (f) 
		outFile.printf("Test scores: %5.2f %5.2f %5.2f %5.2f %5.2f %n", test1, test2, test3, test4, test5);
		
		//Print the average of the test scores using .printf
		outFile.printf("Average test score: %5.2f", average);
		
		
		//***Clean up
		
		//Close the files that have been opened using the .close() method
		inFile.close();
		outFile.close();
		
	}//End of main

}//End of class

/*Created by: Robert Campbell
 *Created on: 11/04/2016
 *Purpose:		- Import Test key and answers from a file (20 answers)
 *					+ Load key and answers into a 2d char array
 *					+ Store student ID as a String
 *				- Compare student answers to the answer key
 *					+ Calculate score/percentage and the letter grade
 *				- Output student ids, answers provided, score, and grade	
 **/
import java.io.*;
import java.util.*;

public class Chapter9_Homework {
	
	public static void main(String[] args) throws FileNotFoundException {
		//Test array
		String datIn;
		String name;
		int i;
		int row = 0;
		char[][] test;
		
		//Create inFile for 
		Scanner inFile = new Scanner(new FileReader("Ch9_Ex6Data.txt"));
		PrintWriter outFile = new PrintWriter("Ch9_output.txt");
		
		while(inFile.hasNext()){
			row += 1;
		}				
		
		while(inFile.hasNext()){		
			datIn = inFile.nextLine();
			test = new char[row][datIn.length()];
		
			for(i = 0; i < datIn.length(); i++){
				test[0][i] = datIn.charAt(i);
			}
			
			outFile.println("Results of " + datIn.length() + " question test.");
		
			name = inFile.next();
			datIn = inFile.nextLine();
			row = 1;
		
			for(i = 0; i < datIn.length(); i++){
				test[row][i] = datIn.charAt(i);
			}
		
			System.out.println(name + "\n" + datIn);
		}
		
		//close inFile
		inFile.close();
		outFile.close();
		
	}//- - - - - - - - - - - End of Main - - - - - - - - - - - 
	

}//- - - - - - - - - - - - - - - - - - - - - - - - End of Class - - - - - - - - - - - - - - - - - - - - - - - -

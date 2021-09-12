package homework2;
/*Name: 			Robert Campbell
 *Last modified:	09/16/2016
 *Purpose:			Complete the project on P174 #5
 *Details:			Read in a formated .txt file
 *					Perform calculations on provided numbers
 *					Output a different formated .txt file
 * */
//import util and io
import java.io.*;
import java.util.*;


public class homework2 {

	public static void main(String[] args) throws FileNotFoundException {
		
		//Declare variables: Price per ticket type, number of each ticket type sold, and total dollar value sold
		double boxPrice, sidelinePrice, premiumPrice, generalPrice;
		int boxSold, sidelineSold, premiumSold, generalSold;
		double boxTotal, sidelineTotal, premiumTotal, generalTotal;
		
		//Create inFile Scanner
		Scanner inFile = new Scanner(new FileReader("tickets.txt"));
		
		//Create printWriter for the outFile
		PrintWriter outFile = new PrintWriter("Daily_Sales.txt");
		
		//Initialize outfile format with headers
		outFile.printf("%10s%10s%15s%n","Box Type", "# Sold", "$ Total");
				
		//Read in the variables
		//First two things in the formatted document are pre-established titles
		//Using two ".next()" methods to collect and dump those values and start storing the variables wanted
		inFile.next();
		inFile.next();
		boxPrice = inFile.nextFloat();
		boxSold = inFile.nextInt();
		sidelinePrice = inFile.nextFloat();
		sidelineSold = inFile.nextInt();
		premiumPrice = inFile.nextFloat();
		premiumSold = inFile.nextInt();
		generalPrice = inFile.nextFloat();
		generalSold = inFile.nextInt();
		
		//Calculate totals and output sales numbers
		
		boxTotal = (boxPrice * boxSold);
		sidelineTotal = (sidelinePrice * sidelineSold);
		premiumTotal = (premiumPrice * premiumSold);
		generalTotal = (generalPrice * generalSold);
		
		outFile.printf("%10s%10d%15.2f%n", "Box", boxSold, boxPrice * boxSold);
		outFile.printf("%10s%10d%15.2f%n", "Sideline", sidelineSold, sidelinePrice * sidelineSold);
		outFile.printf("%10s%10d%15.2f%n", "Premium", premiumSold, premiumPrice * premiumSold);
		outFile.printf("%10s%10d%15.2f%n", "General", generalSold, generalPrice * generalSold);
		outFile.printf("Total: $%.2f", (boxTotal + sidelineTotal + premiumTotal + generalTotal) );
		
		//test for stored variable
		//System.out.print(boxPrice);
		
		//Close in and out files
		inFile.close();
		outFile.close();

	}//End of Main

}//End of Class


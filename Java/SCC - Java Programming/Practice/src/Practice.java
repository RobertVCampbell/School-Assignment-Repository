import java.io.*;
import java.util.*;


public class Practice {
	static Scanner console = new Scanner(System.in);
	
	public static void main(String[] args) throws FileNotFoundException {
		int number;
		
		int max;
		int count = 0;
		
		PrintWriter outFile = new PrintWriter("Test.txt");
		
		System.out.print("What is the max value allowed?");
		max = console.nextInt();
		
		do{
		number = (int)(Math.random()* 100);
		outFile.print(number + " ");
		
		count += 1;
		}//end do
		while(count < max);//end while
		outFile.close();
		
		
		Scanner inFile = new Scanner(new FileReader("Test.txt"));
		
		while(inFile.hasNext()){
			number = inFile.nextInt();
			System.out.println((number + 1));
			
		};
		
		
		inFile.close();	}//End of main

}//End of class

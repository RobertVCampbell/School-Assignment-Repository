/*P.321 #6
 * 
 * 
 * */
import java.io.*;
import java.util.*;



public class Class5Example2 {
	
	//static Scanner console = new Scanner(System.in);

	public static void main(String[] args) throws FileNotFoundException {
		//Set variables
		//int i;
		int even = 0, odd = 0, num = 0;
		
		System.out.println("Generating numbers...");
		
		PrintWriter outFile = new PrintWriter("Numbers.txt");
		for(int i = 0; i < 50; i++){
			num = (int)(Math.random() * 100);
			outFile.println(num + "\n");
		}//End of file generation for loop
		
		outFile.close();//End of file generation
		
		
		//Read in the generated numbers
		Scanner inFile = new Scanner(new FileReader("Numbers.txt"));
		
		System.out.println("Calculating sums...");
		
		while(inFile.hasNext()){
			num = inFile.nextInt();
			
			//If statement to test if the number is even
			if((num % 2) == 0 ){
				even = even + num;
			}
			//Else it is odd
			else{
				odd = odd + num;
			}//End even and odd
				
		}//End of inFile while loop
		
		inFile.close();
		
		System.out.println("The sum of the even numbers is: " + even);
		System.out.println("The sum of the odd numbers is: " + odd);
		
	}//End of main

}//End of class

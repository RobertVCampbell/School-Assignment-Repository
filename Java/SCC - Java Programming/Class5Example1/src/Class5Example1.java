import java.util.*;


public class Class5Example1 {
	
	static Scanner console = new Scanner(System.in);
	
	public static void main(String[] args) {
		
		//
		int num, test = 2;
		double root;
		boolean isPrime = true;
		
		do{
		System.out.print("Please enter a positive, whole number: ");
		num = console.nextInt();
		System.out.print("The number you entered is: " + num + "\n");
		if(num < 0){
			System.out.println("Please enter a valid number.");
		}//End of if (test for positive)
		
		}
		while(num < 0);//End of while (test for positive)
		
		
		root = (int)(Math.sqrt(num));
			
		while(test <= root){
			if((num % test) == 0 )
			{ 
				isPrime = false;
				break;
			}//End of if
			test += 1;
		}//End of while

		if(isPrime == true){
			System.out.println(num + " is a prime number");
		}
		else{
			System.out.println(num + " is not a prime number");
			
		}//End of if else
			
	}//End of main

}//End of class

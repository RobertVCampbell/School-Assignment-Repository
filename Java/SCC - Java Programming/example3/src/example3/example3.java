package example3;

import java.io.*;
import java.util.*;

public class example3 {

	//Declare Constants
	
	static final double REGULAR_BASE = 10.00;
	static final int REGULAR_FREE_MIN = 50;
	static final double REGULAR_RATE = 0.2;
	
	static final double PREMIUM_BASE = 25.00;
	static final int P_FREE_DAY_MIN = 75;
	static final double P_DAY_RATE = 0.1;
	static final int P_FREE_NIGHT_MIN = 100;
	static final double P_NIGHT_RATE = 0.05;
	
	//Establish input scanner
	static Scanner console = new Scanner(System.in);
	
	public static void main(String[] args) {
		
		//Declare variables
		
		String acct;
		int min, nightMin;
		char servCode;
		
		double total = 0;
		
		
		//Prompt for Account #, service code (r or p), and minutes used
		System.out.print("Please enter your account number: ");
		acct = console.next();
		System.out.println();
		
		System.out.print("Enter your service code: (r or R) for Regular" +
						"(p or P) for Premium: ");
		servCode = console.next().charAt(0);
		System.out.println();
		
		
/*		//While loop to test to make sure it is a valid 
		while(servCode != 'r' || servCode != 'R' || servCode != 'p' || servCode != 'P'){
			System.out.println("Please enter a valid service code.");
			System.out.print("Enter your service code: (r or R) for Regular" +
					"(p or P) for Premium: ");
			servCode = console.next().charAt(0);
			System.out.println();
		}
		*/
		
		
		//Create switch to identify based on the servCode
		do{
		switch(servCode)
		{
			case 'r': case 'R':
				System.out.print("Please enter the number of minutes used: ");
				min = console.nextInt();
				System.out.println();
				
				if(min <= REGULAR_FREE_MIN){
					total = REGULAR_BASE;					
				}
				
				else{
					total = REGULAR_BASE + ((min - REGULAR_FREE_MIN) * REGULAR_RATE);
				}
				
				//Output account number, service type, minutes used, and total cost
				System.out.println("Account Number: " + acct);
				System.out.println("Service type: Regular");
				System.out.println("Minutes used: " + min);
				System.out.printf("Amount Due: $%.2f %n", total);
								
				break; //End of Case 'r'||'R'
			
				
			case 'p': case 'P':
				System.out.print("Please enter the number of daytime minutes used: ");
				min = console.nextInt();
				System.out.println();
				
				System.out.print("Please enter the number of nighttime minutes used: ");
				nightMin = console.nextInt();
				System.out.println();
				
				total = PREMIUM_BASE;
				
				if(min > P_FREE_DAY_MIN){
					total = total + ((min - P_FREE_DAY_MIN) * P_DAY_RATE);					
				}
				if(nightMin > P_FREE_NIGHT_MIN){
					total = total + ((min - P_FREE_NIGHT_MIN) * P_NIGHT_RATE);
				}
				
				
				//Output account number, service type, minutes used, and total cost
				System.out.println("Account Number: " + acct);
				System.out.println("Service type: Premium");
				System.out.println("Minutes used: " + (min + nightMin));
				System.out.printf("Amount Due: $%.2f %n", total);
				
				
				break; //End of Case 'p'||'P'
				
				default:
					//While loop to test to make sure it is a valid 
					System.out.println("Please enter a valid service code.");
					System.out.print("Enter your service code: (r or R) for Regular" +
							"(p or P) for Premium: ");
					servCode = console.next().charAt(0);
					System.out.println();
		
		}//End of switch(servCode)
		}//end of do
		while(total == 0);
		
		
		
		//Calculate rate
		
		//is reg or premium
		
		//over 50 mins
		
		//error if not r or p
		
		
		
		
		//Output account number, type of service, number of minutes used and the amount due from the user, "possibly enter for day and night"

	}//End of Main

}//End of Class

/*
 *Created by: Robert Campbell
 *Created on: 10/12/2016
 *Purpose: Calculate Employee pay and deduction rates based on hours worked 
*/
import javax.swing.JOptionPane;

public class Campbell_MidTerm {
	
	static final double FEDERAL_TAX = .035;
	static final double STATE_TAX = .0175;
	static final double SOCIAL_SECURITY = .05;
	static final double HEALTH = 100.00;
	static final double DENTAL = 30.00;
	static final double FT_RETIREMENT = .08;
	static final double PT_RETIREMENT = .04;
	static final double FULL_TIME = 40.00;
	static final double MAXIMUM_HOURS = 168.00;
		
	public static void main(String[] args){ 
		
		String name, pay = "";
		double hours, payRate;
		String nameTest, payRateS, hoursString;
		double grossPay, federal, state, social, retirement, netPay;
		String type = "";
		
		
		while(true){
			//Popup for name
			name = JOptionPane.showInputDialog("Please enter the employee's first and last name ['exit' to quit]: ");
			nameTest = name.toLowerCase();
			
			//Test to see if name is exit
			//If it is, break out of main
			if((nameTest.compareTo("exit")) == 0){
				break;
				}
			else{
				//Popup for payRate
				payRateS = JOptionPane.showInputDialog("What is " + name + "'s hourly wage? ");
				payRate = Double.parseDouble(payRateS);
				
				//Prompt for hours worked, test if entry is valid
				do{
					//Popup for hours worked
					hoursString = JOptionPane.showInputDialog("How many hours has " + name + " worked?");
					hours = Double.parseDouble(hoursString);
					
					//Test if hours were possible for the week
					if(hours > MAXIMUM_HOURS || hours < 0){
						JOptionPane.showMessageDialog(null, "Please enter a valid number of hours worked.", "Error!", JOptionPane.WARNING_MESSAGE);
					}//End hours if
					
				}while(hours > MAXIMUM_HOURS);//end hours do-while
			
				
				//Test to see if fulltime and calculate pay
				if(hours >= FULL_TIME){
					grossPay = FULL_TIME * payRate;//Full-time base pay
					grossPay += (hours - FULL_TIME) * payRate * 1.5;//Add overtime pay
					
					//Pay deduction calculations
					federal = FEDERAL_TAX * grossPay;//federal taxes paid
					state = STATE_TAX * grossPay;//state taxes paid
					social = SOCIAL_SECURITY * grossPay;//social security paid
					retirement = FT_RETIREMENT * grossPay;//Full time retirement deduction
					
					
					//netPay Calculation
					//Health and dental included for full time
					netPay = grossPay - federal - state - social
									- retirement - HEALTH - DENTAL;
					
					//Building the output string
					pay = String.format( "Employee name: %s\n", name);
					pay += String.format("Employee's Hourly Pay: $%.2f\n", payRate);
					pay += String.format("Hours Worked: %.1f\n", hours);
					pay += String.format("Gross Pay: $%.2f\n", grossPay);
					pay += String.format("Full Time\n", name);
					pay += String.format("Federal Tax Paid: $%.2f\n", federal);
					pay += String.format("State Tax Paid: $%.2f\n", state);
					pay += String.format("Social Security Paid: $%.2f\n", social);
					pay += String.format("Health Insurance Paid: $%.2f\n", HEALTH);
					pay += String.format("Dental Insurance Paid: $%.2f\n", DENTAL);
					pay += String.format("Retirement Paid: $%.2f\n", retirement);
					pay += String.format("Net Pay: $%.2f\n", netPay);
					
					type = " - Full Time";

				}//End fulltime if
				
				
				else if(hours >= 0){
					grossPay = hours * payRate;//Part-time Pay
					
					//Pay deduction calculations
					federal = FEDERAL_TAX * grossPay;//federal taxes paid
					state = STATE_TAX * grossPay;//state taxes paid
					social = SOCIAL_SECURITY * grossPay;//social security paid
					retirement = PT_RETIREMENT * grossPay;//Part time retirement deduction
					
					//netPay Calculation
					//No health or dental for part time
					netPay = grossPay - federal - state - social
									- retirement;
					
					//Building the output string
					pay = String.format( "Employee name: %s\n", name);
					pay += String.format("Employee's Hourly Pay: $%.2f\n", payRate);
					pay += String.format("Hours Worked: %.1f\n", hours);
					pay += String.format("Gross Pay: $%.2f\n", grossPay);
					pay += String.format("Part Time\n", name);
					pay += String.format("Federal Tax Paid: $%.2f\n", federal);
					pay += String.format("State Tax Paid: $%.2f\n", state);
					pay += String.format("Social Security Paid: $%.2f\n", social);
					pay += String.format("Health Insurance Paid: $%.2f\n", 0.00);
					pay += String.format("Dental Insurance Paid: $%.2f\n", 0.00);
					pay += String.format("Retirement Paid: $%.2f\n", retirement);
					pay += String.format("Net Pay: $%.2f\n", netPay);
					
					type = " - Part Time";
					
				}//End parttime else if
				
				
				JOptionPane.showMessageDialog(null, pay, name + type, JOptionPane.INFORMATION_MESSAGE);//JOptionPane output
				
			}//End "exit" else
			
		}//End program while loop
	
	}//End of main

} //End of class

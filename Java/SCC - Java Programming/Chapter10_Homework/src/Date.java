
public class Date {
	private int dMonth;//Variable to store the month
	private int dDay;//Variable to store the Day
	private int dYear;//Variable to store the Year
	
	private boolean dLeap;//Boolean for if it is a leap year
	
	public Date(){
		/* Default Constructor
		 * the instance variables dMonth, dDay, and dYear are set
		 * to the default values
		 * Post condition: dMonth = 1; dDay = 1; dYear = 2000*/

		dMonth = 1;
		dDay = 1;
		dYear = 2000;
		dLeap = true;
	}//|----------------------------------------------------------------------------------------End of default constructor----------------------------------------------------------------------------------------|
	
	public Date(int month, int day, int year){
		/*Constructor to set the Date
		 * The instance variables dMonth, dDay, and dYear are set
		 * according to the parameters
		 * Postcondition: dMonth = month, dDay = day, dYear = year*/
		
		//Test to see if the date is valid
				if(year > 2000){
					//Test for leap year
					if(year % 4 == 0){
						dLeap = true;
					}
					else
						dLeap = false;
					//End of leap year----------------------------------------------------------------------------------------|
					
					//Test of 31 day month
					if(month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12){
						if(day <= 31){}
						else{
							System.out.println("Invalid date");
							return;
						}
					}//End of 31 days----------------------------------------------------------------------------------------|
					
					//test for 30 day month
					else if(month == 4 || month == 6 || month == 9 || month == 11){
						if(day <= 30){}
						else{
							System.out.println("Invalid date");
							return;
						}
					}//End of 30 days----------------------------------------------------------------------------------------|
					
					//Test february
					else if(month == 2){
						
						//29 days?
						if(dLeap){
							if(day <= 29){}
							else{
								System.out.println("Invalid date");
								return;
							}
						}//End of 29 days
						
						//28 days?
						else{
							if(day <= 28){}
							else{
								System.out.println("Invalid date");
								return;
							}
						}//End of 28 days
					}//End of February----------------------------------------------------------------------------------------|
				}
				else{
					System.out.println("Invalid date");
					return;
				}//End of Date test----------------------------------------------------------------------------------------|
		
		
		dMonth = month;
		dDay = day;
		dYear = year;
	}//|----------------------------------------------------------------------------------------End of parameter constructor ----------------------------------------------------------------------------------------|
	
	public void setDate(int month, int day, int year){
		
		//Test to see if the date is valid
		if(year > 2000){
			//Test for leap year
			if(year % 4 == 0){
				dLeap = true;
			}
			else
				dLeap = false;
			//End of leap year----------------------------------------------------------------------------------------|
			
			//Test of 31 day month
			if(month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12){
				if(day <= 31){}
				else{
					System.out.println("Invalid date");
					return;
				}
			}//End of 31 days----------------------------------------------------------------------------------------|
			
			//test for 30 day month
			else if(month == 4 || month == 6 || month == 9 || month == 11){
				if(day <= 30){}
				else{
					System.out.println("Invalid date");
					return;
				}
			}//End of 30 days----------------------------------------------------------------------------------------|
			
			//Test february
			else if(month == 2){
				
				//29 days?
				if(dLeap){
					if(day <= 29){}
					else{
						System.out.println("Invalid date");
						return;
					}
				}//End of 29 days
				
				//28 days?
				else{
					if(day <= 28){}
					else{
						System.out.println("Invalid date");
						return;
					}
				}//End of 28 days
			}//End of february----------------------------------------------------------------------------------------|
		}
		else{
			System.out.println("Invalid date");
			return;
		}//End of Date test----------------------------------------------------------------------------------------|
		
		dMonth = month;
		dDay = day;
		dYear = year;
	}//|----------------------------------------------------------------------------------------End of setDate()----------------------------------------------------------------------------------------|
	
	public int getMonth(){
		return dMonth;
	}//|----------------------------------------------------------------------------------------End of getMonth()----------------------------------------------------------------------------------------|
	
	public int getDay(){
		return dDay;
	}//|----------------------------------------------------------------------------------------End of getDay()----------------------------------------------------------------------------------------|
	
	public int getYear(){
		return dYear;
	}//|----------------------------------------------------------------------------------------End of getYear()----------------------------------------------------------------------------------------|
	
	public String toString(){
		return (dMonth + "-" + dDay + "-" + dYear);
	}//|----------------------------------------------------------------------------------------End of toString()----------------------------------------------------------------------------------------|

	public boolean isLeapYear(){
		return dLeap;
	}
}//|----------------------------------------------------------------------------------------End of Class----------------------------------------------------------------------------------------|

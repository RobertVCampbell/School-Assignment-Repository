/*Created by:	Robert Campbell
 *Created on: 	02/13/17
 *Purpose:		-Create employee objects with relevant scheduling and
 *					payroll information, on a week to week basis.*/
public class Employee {
	
	/*2D array for the schedule, with a column for each day of the week
	* Row 0 = date
	* Row 1 = start time
	* Row 2 = end time*/
	private String[][] schedule = new String[3][7];
	private String first, last;
	private String position;
	
	//The employees payRate and the pay they earned that week
	private double payRate;
	private double weekPay;
	
	//Array for total hours for each day of the week
	private int[] totalDHours;
	//int for the total hours scheduled for the week
	private int totalWHours;
	
	/*Flag for priority sorting
	 *May remove this feature, but this is intended as a way to 
	 *mark specific employees to sort separately for specific things
	 *whether that is just used as a remind or what is to be determined */
	private boolean priority;
	
	//Primary constructor, accepting just first and last name values
	public Employee(String f, String l){
		first = f;
		last = l;
		priority = false;
		return;
	}//End of constructor
	
//Get functions
	//Get the Employee's full name
	public String getName(){
		String answer = last + ", " + first;
		return answer;
	}//End getName
	
	//Get the Employee's first name
	public String getFirst(){
		return first;}//end getFirst()

	//Get the Employee's last name
	public String getLast(){
		return last;}//end getLast()
	
	//Get the Employee's position
	public String getPosition(){
		return position;}//end get position
	
	//Get the Employee's payRate
	public double getRate(){
		return payRate;}//end getRate()
	
	//Get Employee's week's pay
	public double getPay(){
		return weekPay;}//end getPay
	
	/*This is a prototype of getting daily hours,
	 *subject to change as the program is built*/
	 public int getDay(int day){
	 	return totalDHours[day];}//End getDay
	 
	 //Return the total hours scheduled for the week
	 public int getWeek(){
		 return totalWHours;}//End getWeek
	 
	 //Return the priority boolean
	 public boolean getPriority(){
		 return priority;}//end getPriority
	
	 //Return the start time for a given day
	 public String getStart(int day){
		 return schedule[1][day];
	 }//end of getStart
	 
	 //Return the end time for a given day
	 public String getEnd(int day){
		 return schedule[2][day];}//end getEnd
	 
	 //Return the entire schedule array
	 public String[][] getSchedule(){
		 return schedule;
	 }//end of get schedule


	 
 //Set Functions
	 //Set priority
	 public void setPriority(boolean p){
		 priority = p;
		 return;}//End setPriority
	 
	 //Set the first name
	 public void setFirst(String f){
		 first = f;
		 return;}//end setFirst
	 
	 //Set the last name
	 public void setLast(String l){
		 last = l;
		 return;}//end setLast
	 
	 
	 //set the date for each day in the schedule
	 /*Another work in progress.
	  * Right now the function will expect 2 arguemnts to conc.
	  * Currently does not account for leap years*/
	 public void setDate(int m, int d){
		 schedule[0][0] = m + "/" + d;
		 d += 1;
		 
		 //Test for the month
		 switch(m){
		 //January
			 case 1:
				 for(int i = 1; i < 6; i++){
					 if(d > 31){
						 m += 1;
						 d = 1;
						 schedule[0][i] = m + "/" + d;
						 d += 1;}//End if
					 else{
						 schedule[0][i] = m + "/" + d;
						 d += 1;}//end else
				 }//end for
				 break;//end case 1
	
			 //February
			 case 2:
				 for(int i = 1; i < 6; i++){
					 if(d > 28){
						 m += 1;
						 d = 1;
						 schedule[0][i] = m + "/" + d;
						 d += 1;}//End if
					 else{
						 schedule[0][i] = m + "/" + d;
						 d += 1;}//end else
				 }//end for
				 break;//end case 2
				 
			 //March
			 case 3:
				 for(int i = 1; i < 6; i++){
					 if(d > 31){
						 m += 1;
						 d = 1;
						 schedule[0][i] = m + "/" + d;
						 d += 1;}//End if
					 else{
						 schedule[0][i] = m + "/" + d;
						 d += 1;}//end else
				 }//end for
				 break;//end case 3
				 
			 //April
			 case 4:
				 for(int i = 1; i < 6; i++){
					 if(d > 30){
						 m += 1;
						 d = 1;
						 schedule[0][i] = m + "/" + d;
						 d += 1;}//End if
					 else{
						 schedule[0][i] = m + "/" + d;
						 d += 1;}//end else
				 }//end for
				 break;//end case 4
				 
			//May
			 case 5:
				 for(int i = 1; i < 6; i++){
					 if(d > 31){
						 m += 1;
						 d = 1;
						 schedule[0][i] = m + "/" + d;
						 d += 1;}//End if
					 else{
						 schedule[0][i] = m + "/" + d;
						 d += 1;}//end else
				 }//end for
				 break;//end case 5
				 
			 //June
			 case 6:
				 for(int i = 1; i < 6; i++){
					 if(d > 30){
						 m += 1;
						 d = 1;
						 schedule[0][i] = m + "/" + d;
						 d += 1;}//End if
					 else{
						 schedule[0][i] = m + "/" + d;
						 d += 1;}//end else
				 }//end for
				 break;//end case 6
				 
			 //July
			 case 7:
				 for(int i = 1; i < 6; i++){
					 if(d > 31){
						 m += 1;
						 d = 1;
						 schedule[0][i] = m + "/" + d;
						 d += 1;}//End if
					 else{
						 schedule[0][i] = m + "/" + d;
						 d += 1;}//end else
				 }//end for
				 break;//end case 7
				 
			 //August
			 case 8:
				 for(int i = 1; i < 6; i++){
					 if(d > 31){
						 m += 1;
						 d = 1;
						 schedule[0][i] = m + "/" + d;
						 d += 1;}//End if
					 else{
						 schedule[0][i] = m + "/" + d;
						 d += 1;}//end else
				 }//end for
				 break;//end case 8
				 
			 //September
			 case 9:
				 for(int i = 1; i < 6; i++){
					 if(d > 30){
						 m += 1;
						 d = 1;
						 schedule[0][i] = m + "/" + d;
						 d += 1;}//End if
					 else{
						 schedule[0][i] = m + "/" + d;
						 d += 1;}//end else
				 }//end for
				 break;//end case 9
				 
			 //October
			 case 10:
				 for(int i = 1; i < 6; i++){
					 if(d > 31){
						 m += 1;
						 d = 1;
						 schedule[0][i] = m + "/" + d;
						 d += 1;}//End if
					 else{
						 schedule[0][i] = m + "/" + d;
						 d += 1;}//end else
				 }//end for
				 break;//end case 10
				 
			 //November
			 case 11:
				 for(int i = 1; i < 6; i++){
					 if(d > 30){
						 m += 1;
						 d = 1;
						 schedule[0][i] = m + "/" + d;
						 d += 1;}//End if
					 else{
						 schedule[0][i] = m + "/" + d;
						 d += 1;}//end else
				 }//end for
				 break;//end case 11
				 
			 //December
			 case 12:
				 for(int i = 1; i < 6; i++){
					 if(d > 31){
						 m = 1;
						 d = 1;
						 schedule[0][i] = m + "/" + d;
						 d += 1;}//End if
					 else{
						 schedule[0][i] = m + "/" + d;
						 d += 1;}//end else
				 }//end for
				 break;//end case 12
				
			 default:
				 System.out.println("Invalid date");
					break; 
				 }//End switch 
		 return;}//End of setDate
	
	 //Set start time
	 public void setStart(String start, int day){
		 schedule[1][day] = start;
		 setDuration(day);
		 return;}//end of setStart
	 
	 //Set end time
	 public void setEnd(String end, int day){
		 schedule[2][day] = end;
		 setDuration(day);
		 return;}//End of setEnd
	 
	 //Set duration
	 public void setDuration(int index){		 
		 int startH, startM, endH, endM;
		 
		 //Split
		 String[] startArr = schedule[1][index].split(":");
		 String[] endArr = schedule[2][index].split(":");
		 
		 startH = Integer.parseInt(startArr[0]);
		 startM = Integer.parseInt(startArr[1]);
		 endH = Integer.parseInt(endArr[0]);
		 endM = Integer.parseInt(endArr[1]);
		 
		 
		 //Shifts are not expected to be over 12 hours.
		 //This converts the end time by 12 hours if it's initial value is less than the start time
		 //Ex. start at 10am, end at 1am, then 1am become 13
		 if(endH < startH){
			 endH += 12;}//end if
		 
		 //Convert minutes into partial hours and then combine w/ the relevant hour
		 startM = startM/60;
		 startH += startM;
		 
		 endM = endM/60;
		 endH += endM;
		 
		 //total hours for the day are end time - start time
		 totalDHours[index] = endH - startH;
		 
		 //Runs the function that sets the weekly total
		 setWeek();
		 
		 return;}//End of setDuration
	 
	 //Set the total hours for the week
	 public void setWeek(){
		 totalWHours = 0;
		 for(int count = 0; count < 7; count++){
			 totalWHours += totalDHours[count];}//End for
		 
		 setPay();
	 	return;}//End setWeek
	 
	 //Set the hourly payrate for the employee
	 public void setRate(double pay){
		 payRate = pay;
		 setPay();}//end setPayRate()
	 
	 /*Calculate the total pay for the weeks work
	 * set to private so it can only be called from either the setWeek or
	 * the setPayRate functions*/
	 private void setPay(){
		 weekPay = totalWHours * payRate;
	 }//End setWeekPay()
	 
}//End of Class

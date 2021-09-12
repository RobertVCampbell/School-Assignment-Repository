
public class Chapter10_Homework {

	public static void main(String[] args) {
		
		//Instantiate two test objects, first with default constructor and second w/ parameters
		final Date test = new Date();
		final Date test2 = new Date(2, 29, 2010);
		
		//Test retrieveing and outputting values in the object
		//Test leap year boolean (test is a leap year, test2 is not)
		if(test2.isLeapYear()){
			System.out.println("This is a leap year");
			System.out.println(test2.getMonth() + "-" + test2.getDay() +"-" + test2.getYear());
			System.out.println(test2.toString());
		}
		else{
			System.out.println("This is a not leap year");
			System.out.println(test2.getMonth() + "-" + test2.getDay() +"-" + test2.getYear());
			System.out.println(test2.toString());
		}
		
		if(test.isLeapYear()){
			System.out.println("This is a leap year");
			System.out.println(test.getMonth() + "-" + test.getDay() +"-" + test.getYear());
			System.out.println(test.toString());
		}
		else{
			System.out.println("This is a not leap year");
			System.out.println(test.getMonth() + "-" + test.getDay() +"-" + test.getYear());
			System.out.println(test.toString());
		}
		
		//Update test2 to be a leap year 
		test2.setDate(2, 29, 2012);
		
		//Test test2 now that it is a leap year
		if(test2.isLeapYear()){
			System.out.println("This is a leap year");
			System.out.println(test2.getMonth() + "-" + test2.getDay() +"-" + test2.getYear());
			System.out.println(test2.toString());
		}
		else{
			System.out.println("This is a not leap year");
			System.out.println(test2.getMonth() + "-" + test2.getDay() +"-" + test2.getYear());
			System.out.println(test2.toString());
		}
		


	}//End of main

}//End of Class

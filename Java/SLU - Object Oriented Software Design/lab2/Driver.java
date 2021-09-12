//import java.util.Scanner;

public class Driver{
	
	
	
	public static void main(String []args){
		Vehicle first = new Vehicle("Chevy", "Malibu", "2005");
		System.out.println(first);
		
		Truck second = new Truck();
		System.out.println(second);
		
		Truck third = new Truck("Ford", "F150", "1990", "2", "32ft", "72lbs");
		System.out.println(third);
		
		Vehicle fourth = new Truck("Ford", "F150", "1990", "2", "32ft", "72lbs");
		System.out.println(fourth);
		
		Car fifth = new Car("Chevy", "Monte Carlo", "2006", "2", "Sedan");
		System.out.println(fifth);
		
		Motorcycle sixth = new Motorcycle("BMW", "BMW Model", "2015", "Street", "no");
		System.out.println(sixth);
		
	}
	
	
}
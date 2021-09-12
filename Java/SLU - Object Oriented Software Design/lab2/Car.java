public class Car extends Vehicle{
	private String door;
	private String body;

	public Car(){
		super();
		door = "0";
		body = "none";
		
	}
	
	public Car(String ma, String mo, String yr, String d, String b){
		
		super(ma,mo,yr);
		door = d;
		body = b;
		
	} 

	public String toString(){
		return super.toString() + "\nDoors: " + door + "\nBody: " + body;
		
	}


}
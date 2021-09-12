public class Vehicle{
	private String make;
	private String model;
	private String year;
	
	public Vehicle(){
		make = "";
		model = "";
		year = "1899";
	}
	
	public Vehicle(String ma, String mo, String yr){
		make = ma;
		model = mo;
		year = yr;
	}
	
	public String getMake(){
		return make;
		}
	public String getModel(){
		return model;
	}
	public String getYear(){
		return year;
		}

public String toString(){
		
		return "Make: " + make + "\nModel: " + model + "\nYear: " + year;
		
	}

}

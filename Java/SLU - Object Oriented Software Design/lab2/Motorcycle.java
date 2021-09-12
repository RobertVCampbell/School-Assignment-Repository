public class Motorcycle extends Vehicle{
	private String type;
	private String side;
	
	public Motorcycle(){
		super();
		type = "none";
		side = "no";
		
	}
	
	public Motorcycle(String ma, String mo, String yr, String t, String s){
		
		super(ma,mo,yr);
		type = t;
		side = s;		
		
	}
	
	public String toString(){
		return super.toString() + "\nType: " + type + "\nCan use sidecar: " + side;
		
	}
	
	
}
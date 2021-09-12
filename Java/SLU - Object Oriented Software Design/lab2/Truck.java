public class Truck extends Vehicle{
	private String bed;
	private String door;
	private String tow;
	
	public Truck(){
		super();
		bed = "0";
		door = "0";
		tow = "0";
	}
	
	public Truck(String ma, String mo, String yr, String b, String d, String t){
		super(ma,mo,yr);
		bed = b;
		door = d;
		tow = t;
	}
	
	public String toString(){
		return super.toString() + "\nDoors: " + door + "\nBed Size: " + bed + "\nTow capacity:" + tow;
	}



}

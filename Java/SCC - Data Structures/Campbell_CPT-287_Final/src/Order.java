//Data object as a link in a linked list
//This data object holds information about order placed by customers
//   in relation to a specific model number
public class Order {
	public Order next;
	//public Order previous;
	
	public String customer= "";
	public String model = "";
	
	public long quantity;
	public double total;
	
	public Order(Order n, String f, String g, long h, double i){
		next = n;
		customer = f;
		model = g;
		quantity = h;
		total = i;
	}//End constructor
	
	public Order(){
		
	}//null constructor for data removal
	
	public boolean hasNext(){
		if(next != null){
			return true;
		}
		else
			return false;
	}
	
	public void display(){
		System.out.println("  Order: " + customer + ", " + model + ", " + quantity + ", " + total);
	}
	
	

}

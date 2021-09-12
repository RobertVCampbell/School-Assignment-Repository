
public class Item {
	//A data object to hold information about items in stock
	//Functions as a linked list w/ orders linked underneath it
	public Order first;
	public Order last;
	
	public int key;
	public String model = "";
	private String description = "";
	
	private double cost;
	private double price;
	private long stock;
	
	public Item(String a, String b, double c, double d, long e){
		model = a;
		description = b;
		//Description size limits because I can't remember how to format
		if(description.length() > 29)
			description = description.substring(0,28);
		else
		{
			int j = 29 - description.length();
			for(int i = 0; i < j; i++){
				description += " ";
			}
		}
		cost = c;
		price = d;
		stock = e;
		makeKey();
	}//End of constructor
	
	public Item(){
		
	}//null value data Item
	
	public void insert(String f, String g, long h, double i){
		first = new Order(first, f, g, h, i);
		first.display();
		
	}
	
	public int getKey(){
		return key;
	}
	
	public void makeKey()
	{
		key = Integer.parseInt(model.substring(3));
		
	}
	
	public void display(){
		System.out.println(model + "     " + description + "$" + cost + 
				" $" + price + "  " + stock);
		
	}

}

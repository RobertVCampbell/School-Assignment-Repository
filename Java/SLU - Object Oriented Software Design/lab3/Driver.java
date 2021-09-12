public class Driver{
	
	
	public static void main(String []args){
		
		Pizza pie = new Pizza();
		pie.addTopping(new Topping("pepperoni"));
		pie.addTopping(new Topping("sausage"));
		
		System.out.println(pie);
		
		
		}//end main
	
	}//end class

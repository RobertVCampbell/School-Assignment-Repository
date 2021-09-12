
public class midTerm {
	public static void main(String[] args)
	{
		X theX = new X(12); //Expanded the array to fit all values
		
		theX.put(20); 
		theX.put(40);
		theX.put(60);
		theX.put(80);
		theX.put(10); 
		theX.put(50);
		theX.put(90);
		theX.put(100000);
		theX.put(120); 
		theX.put(110);
		theX.put(100);
		theX.put(150);
		
		
		while( !theX.isEmpty() ) 	
		{ 							
			long value = theX.take();
			System.out.print(value);
			System.out.print(" ");
		}
		
		System.out.println("");
		
	}
}

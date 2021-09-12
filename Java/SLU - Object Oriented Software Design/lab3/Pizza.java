public class Pizza{
	private int maxToppings = 10;
	private Topping [] toppings = new Topping[maxToppings];
	private int nextTopInd = 0;
	
	public Pizza(){
		toppings[0] = new Topping("cheese");
		nextTopInd +=1; 
		}
	
	public Topping[] getToppings(){
		return toppings;
		}
		
	public void addTopping(Topping top){
		if(nextTopInd >= 10){
			System.out.println("Already at max number of toppings.");
			}
		else{
			toppings[nextTopInd] = top;
			nextTopInd += 1;
			}
		}
		
	public String toString(){
		String pizza = "This pizza has: ";
		for(int i=0; i < (nextTopInd - 1); i++){
			pizza = pizza + toppings[i] + " "; 
			}
		
		return pizza;
		}
}

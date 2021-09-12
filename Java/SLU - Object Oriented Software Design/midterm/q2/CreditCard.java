import java.util.ArrayList;


public class CreditCard extends Card{
	public CreditCard(ArrayList<Integer> num){
		super.number = num;
	}
	
	public boolean pay(double amount){
		return true;
		}
	}

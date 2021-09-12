import java.util.ArrayList;


public class DebitCard extends Card{
		private int pin;
		
		public DebitCard(ArrayList<Integer> num, int p){
			super.number = num;
			pin = p;
		}
		public boolean pay(double amount){
		return true;
		}
	}

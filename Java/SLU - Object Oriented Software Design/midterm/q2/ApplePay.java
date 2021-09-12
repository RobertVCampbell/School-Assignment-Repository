public class ApplePay implements IPaymentMethod{
		private String userID;
		
		public ApplePay(String user){
			userID = user;
			}
			
		public boolean pay(double amount){
		return true;
		}
	}

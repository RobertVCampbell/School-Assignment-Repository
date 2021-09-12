public class ShoppingCartTest {

   public static void main(String[] args) 
   {
      ShoppingCart cart = new ShoppingCart();
		
      Item item1 = new Item("1234",10);
      Item item2 = new Item("5678",40);
		
      cart.addItem(item1);
      cart.addItem(item2);

      PaymentStrategy paypal = PaymentStrategyFactory.getStrategy("PayPal");		
      cart.pay(paypal);
      PaymentStrategy credit = PaymentStrategyFactory.getStrategy("Credit");
      cart.pay(credit);
   }
}

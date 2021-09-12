public class Customer
{
   IPaymentMethod paymentMethod;
   String name;

   public Customer(String name)
   {
      this.name = name;
   }

   public boolean pay(double amount)
   {
      return paymentMethod.pay(amount);
   }

   void setPaymentMethod(IPaymentMethod paymentMethod)
   {
      this.paymentMethod = paymentMethod;
   }
}

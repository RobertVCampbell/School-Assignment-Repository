import java.util.ArrayList;

public class Driver
{
   public enum PaymentType{CC, DC, AP};

   public static IPaymentMethod getPaymentMethod(PaymentType type)
   {
      IPaymentMethod paymentMethod = null;
      switch (type)
      {
         case CC:
           paymentMethod = new CreditCard(new ArrayList<Integer>());
           break;
         case DC:
           paymentMethod = new DebitCard(new ArrayList<Integer>(), 1234);
           break;
         case AP:
           paymentMethod = new ApplePay("joebob");
           break;
      }
      return paymentMethod;
   }

   public static void testPaymentMethod(PaymentType type)
   {
      System.out.println("Testing payment method "+type);
      IPaymentMethod paymentMethod = getPaymentMethod(type);
      Customer customer = new Customer("Jane");
      customer.setPaymentMethod(paymentMethod);
      customer.pay(100.5);
   }

   public static void main(String []args)
   {
      testPaymentMethod(PaymentType.CC);
      testPaymentMethod(PaymentType.DC);
      testPaymentMethod(PaymentType.AP);
   }
}

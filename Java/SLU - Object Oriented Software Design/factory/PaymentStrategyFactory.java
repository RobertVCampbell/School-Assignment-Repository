import java.util.Scanner;

public class PaymentStrategyFactory
{
   public static PaymentStrategy getStrategy(String type)
   {
      Scanner scanner = new Scanner(System.in);
      if (type == "Credit")
      {
         // read credit card info from user
         System.out.println("Enter name as it appears on the card: ");
         String name = scanner.nextLine();
         System.out.println("Enter credit card number: ");
         String number = scanner.nextLine();
         System.out.println("Enter cvv from the back of the card: ");
         String cvv = scanner.nextLine();
         System.out.println("Enter expiration date: ");
         String expDate = scanner.nextLine();
         return new CreditCardStrategy(name, number, cvv, expDate);
      }
      else if (type == "PayPal")
      {
         // read PayPal info from user
         System.out.println("Enter email address: ");
         String email = scanner.nextLine();
         System.out.println("Enter password: ");
         String password = scanner.nextLine();
         return new PaypalStrategy(email, password);
      }
      return null;
   }
}

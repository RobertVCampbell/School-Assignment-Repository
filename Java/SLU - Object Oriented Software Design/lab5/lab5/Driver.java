public class Driver
{
   public static void main(String []argv)
   {
      // TODO: add try-catch block to handle an exception throw by Card class constructor
      Card tenDiamonds = new Card(10, 'D');
      System.out.println("Card is "+tenDiamonds);

      Card aceSpades = new Card(15, 'r');
      System.out.println("Card is " + aceSpades);
   }
}

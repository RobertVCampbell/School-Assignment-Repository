import java.util.Scanner;
public class PassArray
{
   public static void printFirst(String []values)
   {
      if (values.length > 0)
      {
         System.out.println("First value is "+values[0]);
      }
      else
      {
         System.out.println("Array is empty");
      }
   }

   public static void swap(String []values)
   {
      if (values.length > 0)
      {
         String temp = values[0];
         values[0] = values[values.length-1];
         values[values.length-1] = temp;
      }
      else
      {
         System.out.println("Array is empty");
      }

   }

   public static void main(String []args)
   {
      Scanner in = new Scanner(System.in);
      String dataFromTerminal = in.nextLine();
      String valuesFromTerminal[] = dataFromTerminal.split(",");
      printFirst(valuesFromTerminal); 
      System.out.println("SWAPPING FIRST and LAST");
      swap(valuesFromTerminal);
      System.out.println("First value is "+valuesFromTerminal[0]);
         System.out.println("Last values is "+valuesFromTerminal[valuesFromTerminal.length-1]);

   }
}

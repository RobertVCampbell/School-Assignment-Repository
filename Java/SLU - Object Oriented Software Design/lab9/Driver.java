import javax.naming.SizeLimitExceededException;
import java.util.Iterator;
import java.util.ArrayList;

public class Driver
{
   public static void main(String []args)
   {
	   ArrayList<String> test = new ArrayList<String>();

         test.add("Test Text1");
         test.add("Test Text2");
         test.add("Test Text3");


      for (String s : test)
      {
         System.out.println(s);
      }

   }
}

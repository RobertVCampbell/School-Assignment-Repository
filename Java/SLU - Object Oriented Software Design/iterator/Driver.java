import javax.naming.SizeLimitExceededException;
import java.util.Iterator;

public class Driver
{
   public static void main(String []args)
   {
      BookShelf shelf = new BookShelf(100);
  
      try
      {
         shelf.add(new Book("Object Oriented Software Design"));
         shelf.add(new Book("The adventures of Tom Sayer"));
         shelf.add(new Book("Cooking for Dummies"));
      }
      catch (SizeLimitExceededException e)
      {
         System.out.println("Error: "+e.getMessage());
      }
      Iterator<Book> bookIter = shelf.iterator();
      while (bookIter.hasNext())
      {
         System.out.println(bookIter.next());
      }
   }
}

import javax.naming.SizeLimitExceededException;
import java.util.NoSuchElementException;
import java.util.Iterator;

public class BookShelf
{
   protected Book []books;
   protected int capacity;
   protected int  numBooks;
 
   public BookShelf(int capacity)
   {
      this.numBooks = 0;
      this.capacity = capacity;
      this.books = new Book[capacity];
   }

   public void add(Book b) throws SizeLimitExceededException
   {
      if (numBooks < capacity)
      {
         books[numBooks] = new Book(b);
         numBooks++;
      }
      else
      {
         throw new SizeLimitExceededException("Book shelf is at capacity"); 
      }
   }

   public Iterator<Book> iterator()
   {
      return new BookIterator();
   }


   /**
    * BookIterator nested class
    */
   private class BookIterator implements Iterator<Book>
   {
      private int bookIndex;

      public BookIterator()
      {
         bookIndex = -1;
      }
     
      public boolean hasNext()
      {
         if (bookIndex+1 < numBooks)
         {
            return true;
         }
         return false;
      }

      public Book next() throws NoSuchElementException
      {
         if (hasNext())
         {
            bookIndex++;
            return books[bookIndex];
         }
         throw new NoSuchElementException("No more books left on the shelf");
      }
   }
}

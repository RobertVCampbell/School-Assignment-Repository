public class Book
{
   protected String title;

   public Book(String title)
   {
      this.title = title;
   }

   // copy constructor
   public Book(Book b)
   {
      this.title = b.title;
   }

   public String toString()
   {
      return title;
   }
}

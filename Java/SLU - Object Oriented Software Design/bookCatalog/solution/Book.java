/*
 * A book for a catalog 
 */

public class Book
{
   private String title;
   private Author author;

   Book(String title, String fName, String lName)
   {
      this.title = title;
      author = new Author(fName, lName);
   }
}

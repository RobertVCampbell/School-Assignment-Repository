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

   public String toString()
   {
      String bookString = "\"" + title + "\" by " + author;
      return bookString;
   }

   public boolean titleMatches(String title)
   {
      return this.title.equals(title);
   }

   public boolean authorMatches(String name)
   {
      return author.getFirstName().equals(name) || author.getLastName().equals(name);
   }
}

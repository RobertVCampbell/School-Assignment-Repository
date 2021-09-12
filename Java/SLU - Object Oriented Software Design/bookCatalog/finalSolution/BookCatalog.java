/*
 * Book catalog 
 */

import java.util.ArrayList;
public class BookCatalog
{
   private ArrayList<Book> books;

   BookCatalog()
   {
      books = new ArrayList<Book>();
   }

   public Book[] list()
   {
      Book []b ={};
      return books.toArray(b);
   }

   public void add(Book book)
   {
      books.add(book);
   }

   public Book[] searchByTitle(String title)
   {
      ArrayList<Book> matches = new ArrayList<Book>();
      for (int i = 0; i < books.size(); i++)
      {
          if (books.get(i).titleMatches(title))
          {
             matches.add(books.get(i));
          }
      }
      Book []b ={};
      return matches.toArray(b);
   }

   public Book[] searchByAuthor(String author)
   {
      ArrayList<Book> matches = new ArrayList<Book>();
      for (int i = 0; i < books.size(); i++)
      {
          if (books.get(i).authorMatches(author))
          {
             matches.add(books.get(i));
          }
      }
      Book []b ={};
      return matches.toArray(b);
   }
}

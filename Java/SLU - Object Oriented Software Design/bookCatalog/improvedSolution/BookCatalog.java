/*
 * Book catalog 
 */

import java.io.*;
import java.util.ArrayList;
import java.util.Scanner;

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

   /*
    * Loads book caltalog from a CSV file
    * File format is:
    * Title, Author last name, Author first name
    */
   public void fromCSV(String file)
   {
      try
      {
         Scanner s = new Scanner(new BufferedReader(new FileReader(file)));
         fromScanner(s);
      }
      catch(Exception e)
      {}
   }

  
   private void fromScanner(Scanner s)
   {
      while (s.hasNext())
      {
         String line = s.nextLine();
         String []values = line.split(",");
         String title = values[0];
         String lastName = values[1].trim();
         String firstName = values[2].trim();
         Book book = new Book(title, firstName, lastName);
         add(book);
      }
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

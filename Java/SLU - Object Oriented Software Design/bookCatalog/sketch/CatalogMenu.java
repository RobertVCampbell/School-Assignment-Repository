/*
 * Driver code for entering books into a catalog
 */

import java.util.Scanner;
public class CatalogMenu
{
   public static void printMenu()
   {
      System.out.println("1. Add new book");
      System.out.println("2. Search by title");
      System.out.println("3. Search by author");
      System.out.println("4. List all books");
   }

   public static int selectFromMenu()
   {
      Scanner scanner = new Scanner(System.in);
      int option = scanner.nextInt();
      return option;
   }

   public static void addBook(BookCatalog catalog)
   {
      Scanner scanner = new Scanner(System.in);
      String title, firstName, lastName;
      System.out.println("Enter book title: ");
      title = scanner.nextLine();
      System.out.println("Enter author's first name: ");
      firstName = scanner.nextLine();
      System.out.println("Enter author's last name: ");
      lastName = scanner.nextLine();

      Book book = new Book(title, firstName, lastName);
      catalog.add(book); 
   }

   public static void searchByTitle(BookCatalog catalog)
   {
   }
 
   public static void searchByAuthor(BookCatalog catalog)
   {
   }

   public static void listBooks(BookCatalog catalog)
   {
   }

   public static void main(String []args)
   {
      BookCatalog catalog = new BookCatalog();

      printMenu();
      int option = selectFromMenu();
      switch (option)
      {
         case 1:
            addBook(catalog);
            break;
         case 2:
            searchByTitle(catalog);
            break;
         case 3:
            searchByAuthor(catalog);
            break;
         case 4:
            listBooks(catalog);
            break;
      }
   }
}

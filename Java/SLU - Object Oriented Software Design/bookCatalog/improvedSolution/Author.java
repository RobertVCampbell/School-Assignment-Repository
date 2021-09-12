/*
 * Basic name information of an author
 */

public class Author
{
   private String firstName;
   private String lastName;

   public Author(String firstName, String lastName)
   {
      this.firstName = firstName;
      this.lastName = lastName;
   }

   public String toString()
   {
      String authorString = firstName + " " + lastName;
      return authorString;
   }

   public String getFirstName()
   {
      return firstName;
   }

   public String getLastName()
   {
      return lastName;
   }
}

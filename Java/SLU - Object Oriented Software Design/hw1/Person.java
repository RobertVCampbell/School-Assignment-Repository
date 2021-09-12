/*
 * Person for phonebook 
 */

public class Person
{
   private String firstName;
   private String lastName;
   private String number;

   Person(String first, String last, String num)
   {
      firstName = first;
      lastName = last;
	  number = num;
   }

   public String toString()
   {
      String personString = firstName + " " + lastName + ", " + number;
      return personString;
   }

   public boolean firstMatches(String first)
   {
      return this.firstName.equals(first);
   }
	
	public boolean lastMatches(String last)
   {
      return this.lastName.equals(last);
   }
   
   public boolean numMatches(String num)
   {
      return this.number.equals(num);
   }

}

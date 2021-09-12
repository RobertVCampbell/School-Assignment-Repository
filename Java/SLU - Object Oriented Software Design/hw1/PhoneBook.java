/*
 * PhoneBook 
 */
import java.io.*;
import java.util.ArrayList;
import java.util.Scanner;

public class PhoneBook
{
   private ArrayList<Person> people;

   PhoneBook()
   {
      people = new ArrayList<Person>();
   }
   
   PhoneBook(String file){
	   
	   people = new ArrayList<Person>();
	   this.fromCSV(file);
	   
   }

   public Person[] list()
   {
      Person []p ={};
      return people.toArray(p);
   }
   
    /*
    * Loads phonebook from a CSV file
    * File format is:
    * First name, last name, phone number
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
         String first = values[0];
         String last = values[1].trim();
         String num = values[2].trim();
         Person person = new Person(first, last, num);
         add(person);
      }
   }

   public void add(Person person)
   {
      people.add(person);
   }

   public Person[] searchByFirst(String first)
   {
      ArrayList<Person> matches = new ArrayList<Person>();
      for (int i = 0; i < people.size(); i++)
      {
          if (people.get(i).firstMatches(first))
          {
             matches.add(people.get(i));
          }
      }
      Person []p ={};
      return matches.toArray(p);
   }
   
   public Person[] searchByLast(String last)
   {
      ArrayList<Person> matches = new ArrayList<Person>();
      for (int i = 0; i < people.size(); i++)
      {
          if (people.get(i).lastMatches(last))
          {
             matches.add(people.get(i));
          }
      }
      Person []p ={};
      return matches.toArray(p);
   }
   
   public Person[] searchByNum(String num)
   {
      ArrayList<Person> matches = new ArrayList<Person>();
      for (int i = 0; i < people.size(); i++)
      {
          if (people.get(i).numMatches(num))
          {
             matches.add(people.get(i));
          }
      }
      Person []p ={};
      return matches.toArray(p);
   }
   

}

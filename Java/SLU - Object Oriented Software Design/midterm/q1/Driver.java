/*
 * Fix compiler and run-timme errors of this code.
 */
import java.io.*;
import java.util.ArrayList;

public class Driver
{
   public static void write(ArrayList<Integer> data, String fileName) throws IOException
   {
	   
       FileWriter writer = new FileWriter(fileName);
       try{for (int i = 0; i < data.size(); i++)
       {
          writer.write(data.get(i));
       }}
       catch(IOException){
		   System.out.println("Errored");}
       
       


   }
   public static void main(String []args)
   {
      ArrayList<Integer> myNumbers = new ArrayList<Integer>();
      for(int i = 0; i < 10; i++)
      {
          myNumbers.add(i);
      }
       
      write(myNumbers, "./results.txt");
   }
}

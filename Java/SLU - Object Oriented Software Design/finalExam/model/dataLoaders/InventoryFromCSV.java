package model.dataLoaders;

import model.store.Inventory;
import model.store.Item;

import java.io.IOException;
import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;

public class InventoryFromCSV implements InventoryLoader
{
   protected String fileName;
   public InventoryFromCSV(String fileName)
   {
       this.fileName = fileName;
   }
   public Inventory read() throws IOException, FileNotFoundException
   {
      Inventory result = new Inventory();
      File inputFile = new File(fileName);
      Scanner scanner = new Scanner(inputFile);
      String[] itemData;
      int id;
      float price;
      
      do {
    	  itemData = scanner.nextLine().split(",");
    	  id = Integer.parseInt(itemData[0]);
    	  price = Float.parseFloat(itemData[2]);
    	  result.add(new Item(id, itemData[1], price));
      }while(scanner.hasNextLine());
      // TODO: add code that reads from CSV file and populates inventory
      return result;
   }
}

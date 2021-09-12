package model.dataLoaders;

import java.io.FileNotFoundException;
import java.io.IOException;

import model.store.Inventory;

public class InventoryFromJSON implements InventoryLoader
{
   protected String fileName;
   public InventoryFromJSON(String fileName)
   {
      this.fileName = fileName;
   }
   public Inventory read() throws IOException, FileNotFoundException
   {
      return new Inventory();
   }
}


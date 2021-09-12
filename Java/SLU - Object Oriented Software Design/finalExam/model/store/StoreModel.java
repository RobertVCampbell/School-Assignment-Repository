package model.store;

import java.util.Iterator;
import java.io.IOException;

import model.dataLoaders.*;

public class StoreModel
{
   Inventory inventory;

   /**
    * This method must be called prior to any other methods
    **/
   public void initializeInventory(InventoryLoader source) throws IOException
   {
      this.inventory = source.read();  
   }

   public void addItem(Item item)
   {
      if (inventory == null)
      {
         inventory = new Inventory();
      }
      inventory.add(item);
   }
   public Item getItem(int itemId)
   {
      return inventory.getItemById(itemId);
   }
  
   public Iterator<Item> inventoryIterator()
   {
       return inventory.items.iterator();
   }
}

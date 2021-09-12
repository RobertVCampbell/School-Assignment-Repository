package model.store;

import java.util.ArrayList;
public class Inventory
{
   protected ArrayList<Item> items;
   public Inventory()
   {
       items = new ArrayList<Item>();
   }
   public Item getItemById(int itemId)
   {
      Item retValue = null;
      for (Item i: items)
      {
         if (i.getId() == itemId)
         {
            retValue = i;
            break;
         }
      }
      return retValue;
   }

   public void add(Item item)
   {
      items.add(item);
   }
}

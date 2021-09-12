package model.store;

public class Item
{
   protected int itemId;
   protected String description;
   protected float price;

   public Item(int itemId, String description, float price)
   {
       this.itemId = itemId;
       this.description = description;
       this.price = price;
   }
   public int getId()
   {
      return itemId;
   }

   public float getPrice()
   {
      return price;
   }

   public String getDescription()
   {
      return description;
   }

   public String toString()
   {
      String result = Integer.toString(itemId) + ", " + description + ", " + Float.toString(price);
      return result;
   }
}

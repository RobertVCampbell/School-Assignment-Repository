package model.cart;

import java.util.ArrayList;
import java.util.Iterator;
import model.store.Item;

public class Cart
{
   // items in this cart
   protected ArrayList<CartItem> items;

   /**
    * Creates an empty cart
    */
   public Cart()
   {
      items = new ArrayList<CartItem>();
   }

   /**
    * Adds an item to the cart, duplicate items should not be added:OB 
    * if a duplcate item is being added, the quantity of that item in the cart 
    * needs to be incremented
    */
   public void addItem(Item item)
   {	
	   int id;
	   for (CartItem i: items)
	   {
	     id = i.getStoreItem().getId();
	     if(item.getId() == id) {
	    	 i.increment(1);
	    	 return;
	     }
	   }
      items.add(new CartItem(item));
   }

   /**
    * Returns true if there are no items in the cart, false otherwise
    */
   public boolean isEmpty()
   {
      return items.size() == 0;
   }

   /**
    * Provides an iterator over all CartItem objects that are in this cart
    */
   public Iterator<CartItem> itemIterator()
   {
      return items.iterator();
   }

   /**
    * Returns the toal price of all items in the cart
    */
   public float getTotal()
   {
      float total = 0;
      for (CartItem i: items)
      {
         total+= i.getStoreItem().getPrice();
      }
      return total;
   }
}

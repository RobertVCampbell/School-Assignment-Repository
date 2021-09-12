package model.cart;

import model.store.Item;

public class CartItem
{
   protected Item storeItem;
   protected int quantity;
   protected float totalPrice;
 
   public CartItem(Item storeItem)
   {
      this.storeItem = storeItem;
      quantity = 1;
      recalculateTotal();
   }
   public void increment(int amount)
   {
      quantity+=amount;
      recalculateTotal();
   }

   public void decrement(int amount)
   {
      quantity-=amount;
      recalculateTotal();
   }

   public void recalculateTotal()
   {
      totalPrice = quantity * storeItem.getPrice();
   }
   public int getQuantity()
   {
      return quantity;
   }
   public Item getStoreItem()
   {
      return storeItem;
   }

   public float getTotalPrice()
   {
      return totalPrice;
   }
}

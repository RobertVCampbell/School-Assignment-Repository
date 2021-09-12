package model.cart;
import model.store.Item;

import org.junit.*;
import static org.junit.Assert.*;

public class CartTest
{
  @Test
  public void testConstructor() {
	  Cart cart = new Cart();
	  assertEquals("New cart should be empty", 0, cart.items.size());
  }
  @Test
  public void addItem_AddOneItem()
  {
     Cart cart = new Cart();
     Item item = new Item(12345, "X", 0);
     cart.addItem(item);
     assertEquals("Mismatch on number of cart items", 1, cart.items.size());
  }
  @Test
  public void addItem_AddTwoItems()
  {
     Cart cart = new Cart();
     Item item = new Item(12345, "X", 0);
     cart.addItem(item);
     cart.addItem(item);
     assertEquals("Mismatch on number of cart items", 2, cart.items.size());
  }
  
  @Test
  public void testIsEmpty() {
	  Cart cart = new Cart();
	  assertEquals("New cart should return empty", true, cart.isEmpty());
	  Item item = new Item(12345, "X", 0);
	  cart.addItem(item);
	  assertEquals("Cart with items should return false", false, cart.isEmpty());
  }
  
  @SuppressWarnings("deprecation")
  @Test
  public void testTotal() {
	  Cart cart = new Cart();
	  Item item = new Item(12345, "X", 1);
	  Item item2 = new Item(23451, "Y", 2);
	  cart.addItem(item);
	  cart.addItem(item);
	  cart.addItem(item2);
	  
	  assertEquals("Mismatch on total cost", 4.00, cart.getTotal());
	 
  }
  


/*public void main(String [] args) {
	testConstructor();
	addItem_AddOneItem();
	addItem_AddTwoItems();
	testIsEmpty();
	testTotal();
	
	
}*/
}

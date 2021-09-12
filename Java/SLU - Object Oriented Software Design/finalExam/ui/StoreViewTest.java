package ui;
import model.store.Item;
import model.cart.Cart;
import model.store.StoreModel;

import javax.swing.JButton;
import java.util.Iterator;

import org.junit.*;
import static org.junit.Assert.*;

public class StoreViewTest
{
   @Test
   public void clickButton()
   {
      Cart cart = new Cart();
      Item item = new Item(12345, "X", 0);
      StoreModel store = new StoreModel();
      store.addItem(item);

      StoreView storeView = new StoreView(store, cart);
      Iterator<JButton> addItemButtonIter = storeView.addItemButtonIterator();
      while (addItemButtonIter.hasNext())
      { 
         JButton button = addItemButtonIter.next();
         button.doClick();
      }
      assertEquals("Cart.isEmpty", false, cart.isEmpty());
   }
}

package ui;

import java.util.Iterator;
import javax.swing.*;

import model.cart.*;
import model.store.Item;

public class CartView extends JPanel
{
   private JLabel discountLabel;
   private Cart   cart;

   public CartView(Cart cart)
   {
      super();
      this.cart = cart;
      redraw();
   }

   public void redraw()
   {
      removeAll();
      BoxLayout boxLayout = new BoxLayout(this, BoxLayout.Y_AXIS);
      setLayout(boxLayout);

      Iterator<CartItem> cartItemIterator = cart.itemIterator();
      while (cartItemIterator.hasNext())
      {
         JPanel itemPanel = new JPanel();
         itemPanel.setLayout(new BoxLayout(itemPanel, BoxLayout.X_AXIS));

         CartItem item = cartItemIterator.next();
         Item storeItem = item.getStoreItem();
         JLabel itemLabel = new JLabel(storeItem.getDescription() + 
                                      ": $" + storeItem.getPrice() + 
                                      " quantity " + item.getQuantity()); 
         itemPanel.add(itemLabel);
         add(itemPanel);
      }

      JLabel total = new JLabel("Total: " + cart.getTotal());
      add(total);
   }
}

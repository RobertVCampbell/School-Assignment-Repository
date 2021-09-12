import model.store.*;
import model.cart.*;
import model.dataLoaders.*;

import ui.CartView;
import ui.StoreView;
import ui.MarketPlaceView;

import javax.swing.JFrame;
import java.util.Iterator;
import java.io.IOException;
import java.awt.Dimension;

public class Driver
{
   public static void loadInventory(StoreModel storeModel, String inventoryFile)
   {
      if (inventoryFile.endsWith(".csv"))
      {
         InventoryFromCSV dataLoader = new InventoryFromCSV(inventoryFile);
         try
         {
            storeModel.initializeInventory(dataLoader);         
         }
         catch (IOException e)
         {
            System.out.println(e.getMessage());
            System.exit(0);
         }
      }
      else if (inventoryFile.endsWith(".json"))
      {
      }

   }
   
   public static void main(String []args)
   {
      StoreModel storeModel = new StoreModel();

      if (args.length < 1)
      {
         System.out.println("Usage: java Driver <InventoryFile>");
         return;
      }
      for (int i = 0; i < args.length; i++)
      {
         System.out.println(args[i]+" ");
      }
      // load the store items from file
      String inventoryFile = args[0];
      loadInventory(storeModel, inventoryFile);

      
      // create a cart
      Cart cart = new Cart();

      // create cart view
      CartView cartView = new CartView(cart);

      // create a store view
      StoreView storeView = new StoreView(storeModel, cart);

      // create MarketPlaceView
      MarketPlaceView market = new MarketPlaceView();
      market.initializeStoreView(storeView);
      market.initializeCartView(cartView);
      market.displayStore();
   }
}

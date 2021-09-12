package ui;

import javax.swing.*;
import java.awt.event.*;
import java.awt.Dimension;

public class MarketPlaceView implements ActionListener
{
   private JFrame       mainFrame;
   private JPanel       mainPanel;
   private JPanel       storePanel;
   private JPanel       cartPanel;
   private JButton      cartButton; 
   private StoreView    storeView;
   private JButton      storeButton;
   private CartView     cartView;
   private boolean      marketPlaceView; 

   private Dimension    internalSize;

   public MarketPlaceView()
   {
      mainFrame = new JFrame();
      mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
      marketPlaceView = true;
      internalSize = new Dimension(500, 300);
      mainPanel = new JPanel();
      mainPanel.setPreferredSize(internalSize);
      mainFrame.add(mainPanel);
   }

   @Override
   public void actionPerformed(ActionEvent e)
   {
      if (marketPlaceView)
      {
         displayCart();   
      }
      else
      {
         displayStore();
      }
      marketPlaceView = !marketPlaceView;
   }
   public void initializeStoreView(StoreView storeView)
   {
      storePanel = new JPanel();
      storePanel.setLayout(new BoxLayout(storePanel, BoxLayout.Y_AXIS));

      cartButton = new JButton("Cart");
      cartButton.addActionListener(this);

      this.storeView = storeView;
      storePanel.add(this.storeView);
      storePanel.add(cartButton);
   }

   public void initializeCartView(CartView cartView)
   {
      cartPanel = new JPanel();
      cartPanel.setLayout(new BoxLayout(cartPanel, BoxLayout.Y_AXIS));

      storeButton = new JButton("Continue Shopping");
      storeButton.addActionListener(this);
      this.cartView = cartView;
      cartPanel.add(cartView);
      cartPanel.add(storeButton);
   }

   public void displayStore()
   {
      mainPanel.remove(cartPanel);
      mainPanel.add(storePanel);
      storeView.redraw();
      mainPanel.repaint();
      mainFrame.pack();
      mainFrame.setVisible(true);
   }

   public void displayCart()
   {
      mainPanel.remove(storePanel);
      mainPanel.add(cartPanel);
      cartView.redraw();
      mainPanel.repaint();
      mainFrame.pack();
      mainFrame.setVisible(true);  
   } 
}

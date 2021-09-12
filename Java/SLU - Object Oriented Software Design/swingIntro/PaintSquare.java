import javax.swing.*;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.BorderLayout;

public class PaintSquare extends JPanel
{
   private int height;
   private int width;
   public PaintSquare(int h, int w)
   {
      this.height =  h;
      this.width = w;
      setPreferredSize(new Dimension(this.width, this.height));
   }

   @Override
   protected void paintComponent(Graphics g)
   {
      super.paintComponent(g);
      g.setColor(Color.BLUE);
      g.fillRect(0, 0, width, height);
   }

   public static void main(String[] args)
   {
      JFrame frame = new JFrame("Square");
      // operation to do when the window is closed
      frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

      PaintSquare mainPanel = new PaintSquare(200, 300);
      mainPanel.setLayout(new BorderLayout());

      frame.add(mainPanel);

      // packs the components within the window based on their preferred size
      frame.pack();
      frame.setVisible(true);
   }
}

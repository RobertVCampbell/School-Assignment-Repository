/*
 * Movable Snowman
 */

import javax.swing.*;
import java.awt.Component;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.geom.*;
import java.awt.Rectangle;

import java.awt.Color;

public class MeltingSnowman implements MovableShape
{
   private int height;

   public MeltingSnowman(int height)
   {
      this.height = height;
   }

   public void draw(Graphics2D g2, int x, int y)
   {
      double oneSixth = height/6.0;

      Ellipse2D.Double head = new Ellipse2D.Double(x, y, oneSixth, oneSixth);
      g2.setColor(Color.BLUE);
      g2.fill(head);

      Ellipse2D.Double middle = new Ellipse2D.Double(x, y+oneSixth, 2*oneSixth, 2*oneSixth);
      g2.fill(middle);

      Ellipse2D.Double bottom = new Ellipse2D.Double(x, y+3*oneSixth, 3*oneSixth, 3*oneSixth);
      g2.fill(bottom);
   }

   public void move()
   {
      height = height/2;
   }
}

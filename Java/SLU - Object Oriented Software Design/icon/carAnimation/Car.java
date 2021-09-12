/*
 * Movable car
 */

import javax.swing.*;
import javax.imageio.ImageIO;
import java.awt.Component;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.geom.*;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.awt.Color;

public class Car implements MovableShape{
   private String source;
   private int x;
   private int y;
   private BufferedImage image;

   public Car(String source, int x, int y)throws IOException{
      this.source = source;
      this.x = x;
      this.y = y;
      image = ImageIO.read(new File(source));
   }

   public void move()
   {
      x++;
   }   

   public void draw(Graphics2D g2, int x, int y)
   {
      System.out.println("drawing car");
      g2.drawImage(image, this.x, y, null);   
   }
}

/*
 * Class that defines a circle in 2D 
 */

public class Circle2D
{
   private float radius;
   private Point2D center;  

   public Circle2D()
   {
      center = new Point2D();
      radius = 0;
   }

   public Circle2D(Point2D c, int radius)
   {
      this.center = c;
      this.radius = radius;
   }

   public String toString()
   {
      String val = "center: " + center.toString() + ", radius: " + radius;
      return val;
   }
}

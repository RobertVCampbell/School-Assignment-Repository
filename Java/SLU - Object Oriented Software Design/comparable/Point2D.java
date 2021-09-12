/*
 * Class that defines a point in 2D
 */

public class Point2D implements Comparable<Point2D>
{
   private int x;
   private int y;

   public Point2D()
   {
      this.x = 0;
      this.y = 0;
   }

   public Point2D(int x, int y)
   {
      this.x = x;
      this.y = y;
   }

   int getX()
   {
      return x;
   }

   int getY()
   {
      return y;
   }

   @Override
   public String toString()
   {
      String val = "(" + x + ", " + y + ")";
      return val; 
   }

   @Override
   public int compareTo(Point2D p)
   {
       int result;
       // compare two points based on their distance from (0, 0)
       double distance1 = Math.sqrt(x * x + y * y);
       double distance2 = Math.sqrt(p.x * p.x + p.y * p.y);
       if (distance1 < distance2)
       {
          result = -1;
       }
       else if (distance1 == distance2)
       {
          result = 0;
       }
       else
       {
          result = 1;
       }
       return result;
   }
   
}

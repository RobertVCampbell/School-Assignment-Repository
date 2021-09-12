/*
 * An example of how Comparable inteface of Point2D can be useful
 */

import java.util.ArrayList;
import java.util.Collections;

public class SortPoints
{
   public static void main(String []args)
   {
      ArrayList<Point2D> points = new ArrayList<Point2D>();
      points.add(new Point2D(2,2));
      points.add(new Point2D(0,0));
      points.add(new Point2D(-1,-1));
      Collections.sort(points);

      for (Point2D p: points)
      {
         System.out.println(p);
      }
   }
}

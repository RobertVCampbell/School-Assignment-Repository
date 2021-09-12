public class Swap
{
   public static void swap(int a, int b)
   {
      int temp = a;
      a = b;
      b = temp; 
   }

   public static void swap(Point2D a, Point2D b)
   {
      Point2D temp = a;
      a = b;
      b = temp;
   }
   public static void main(String []args)
   {
      System.out.println("SWAPPING INTS");
      int x = 0;
      int y = 1;
      System.out.println("Before swap");
      System.out.println("x = "+x+", y ="+y);
      swap(x, y);
      System.out.println("After swap");
      System.out.println("x = "+x+", y ="+y);

      System.out.println("SWAPPING POINTS");
      Point2D pointX = new Point2D(1, 1);
      Point2D pointY = new Point2D(5, 5);
      System.out.println("Before swap");
      System.out.println("pointX = "+pointX+", pointY = "+pointY);
      swap(pointX, pointY);
      System.out.println("After swap");
      System.out.println("pointX = "+pointX+", pointY = "+pointY);

   }
}

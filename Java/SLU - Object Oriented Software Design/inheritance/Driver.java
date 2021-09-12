import java.awt.Color;

public class Driver
{
   public static void main(String []args)
   {
      Shape shape = new Shape();
      // Can you use methods of Shape class on shape object?
      shape.getColor();

      Circle circle = new Circle();
      // Can you use methods of Shape class on circle object?
      circle.getColor();

	Circle c0 = new Circle();
	Shape  s0 = new Shape ();
	//Circle c1 = new Shape ();  // question 5a
	Shape  s1 = new Circle();  // question 5b


   }
}

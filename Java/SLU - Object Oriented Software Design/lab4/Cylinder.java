/*
 * A Cylinder is a Circle plus a height.
 */

public class Cylinder extends Geometry {
   // private instance variable
   private double height;
   private Circle end;
   
   // Constructors
   public Cylinder() {
      super();  // invoke superclass' constructor Circle()
      this.height = 1.0;
      end = new Circle();
   }
   public Cylinder(double height, Circle circ) {
      super();  // invoke superclass' constructor Circle()
      this.height = height;
      this.end = circ;
   }

   public Cylinder(double height, double radius) {
      this.end = new Circle(radius);  // invoke superclass' constructor Circle(radius)
      this.height = height;
   }
   public Cylinder(double height, double radius, String color) {
      this.end = new Circle(radius, color);  // invoke superclass' constructor Circle(radius, color)
      this.height = height;
   }
   
   // Getter and Setter
   public double getHeight() {
      return this.height;
   }
   public void setHeight(double height) {
      this.height = height;
   }
   
   public double getRadius(){
	   return end.getRadius();
	   }
	   
   public String getColor(){
	   return end.getColor();
	   }
   
   // Need to change the getVolume() as well
   public double getVolume() {
      return this.end.getArea()*height;   // use superclass' getArea()
   }

   // Override the getArea() method inherited from superclass Circle
   @Override
   public double getArea() {
      return 2*Math.PI* end.getRadius() *height + 2* end.getArea();
   }

   // Override the inherited toString()
   @Override
   public String toString() {
      return "Cylinder[" + end.toString() + ",height=" + height + "]";   
   }
}

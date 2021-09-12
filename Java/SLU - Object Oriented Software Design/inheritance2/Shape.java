import java.awt.Color;

public class Shape
{
   private Color color = Color.BLACK;

   // constructors
   public Shape()
   { 
      this(Color.BLACK); 
   }

   public Shape(Color c) 
   { 
      setColor(c);
   }

   public Color getColor() 
   { 
      return this.color; 
   }

   public void  setColor(Color aColor) 
   {
     if (aColor != null) 
     { 
        this.color = aColor; 
     }
   }

   public void  setColor(int r, int g, int b) 
   {
     if ( r>=0 && r<=255 && g>=0 && g<=255 && b>=0 && b<=255 ) 
     {
       setColor( new Color(r,g,b) );
     }
   }

}

import javax.swing.*;
import java.awt.BorderLayout;

public class FileChooser
{
   public static void main(String[] args)
   {
      JFileChooser fc = new JFileChooser();
      int retVal = fc.showOpenDialog(null);

      if (retVal == JFileChooser.APPROVE_OPTION)
      {
         System.out.println("File: " + fc.getSelectedFile());
      }

   }
}

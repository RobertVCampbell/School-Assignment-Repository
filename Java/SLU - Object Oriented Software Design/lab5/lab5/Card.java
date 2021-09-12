/*
 * Card class
 * TODO: In the constructor of the class, check if the passed arguments are in the
 *       valid range. If not, throw an java.security.InvalidParameterException
 */

// use import statments to specify the package where class is defined
// now you can just refer to the exception by its name InvalidParameterException
import java.security.InvalidParameterException;

public class Card{
   private int  value;
   private char suite;

   /*
    * Constructor of the Card class
    * @param val - card value in the range [2-14], where 11-Jack, 12-Queen, 13-King, 14-Ace
    * @param suite - the suite of the card: D - diamonds, H - hearts, S - Spaces, C - clubs
    */
   public Card(int val, char s) throws InvalidParameterException
   {
       // check the input for being in the valid range
       if (val < 2 || val > 14)
       {
          throw new InvalidParameterException("Value must be in the range [2, 14]");
       }

       // check if the suite is valid
       if (s != 'D' && s != 'H' && s != 'S' && s != 'C')
       {
          // TODO: throw an exception
       }
       value = val;
       suite = s;
   }

   public int getValue(){
      return value;
   }

   public char getSuite(){
      return suite;
   }
 
   public String toString()
   {
      String cardDescription = "";
      if (value >=2 && value <=10){
         cardDescription+=value + " ";
      }
      else if (value == 11){
         cardDescription+="Jack ";
      }
      else if (value == 12){
         cardDescription+="Queen ";
      }
      else if (value == 13){
         cardDescription+="King ";
      }
      else if (value == 14){
         cardDescription+="Ace ";
      }

      if (suite == 'S'){
         cardDescription+="Spades";
      }
      else if (suite == 'D'){
         cardDescription+="Diamonds";
      }
      else if (suite == 'C'){
         cardDescription+="Clubs";
      }
      else if (suite == 'H'){
         cardDescription+="Hearts";
      }
      return cardDescription;
   }
}

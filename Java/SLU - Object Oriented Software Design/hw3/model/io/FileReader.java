package model.io;

import model.Token;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

public class FileReader
{
   private ArrayList<Token> tokens;
   private String lastLine = null;
 
   public FileReader(String fileName) throws FileNotFoundException
   {
      tokens = new ArrayList<Token>();
      // read input file and parse it into tokens
      File inputFile = new File(fileName);
      Scanner scanner = new Scanner(inputFile);

      do
      {
         String line = findNextToken(scanner);
         boolean invalidToken = false;
         if (isNewToken(line))
         { 
            Token t = new Token();
            if (line.charAt(1)=='M')
            {
               t.type = Token.QuestionType.M;
            }
            else if(line.charAt(1)=='N')
            {
               t.type = Token.QuestionType.N;
            }
            else
            {
               invalidToken = true;
            }

            if (!invalidToken)
            {
               readText(scanner,t);
               tokens.add(t);
            }
         }
      }while(scanner.hasNextLine());
   }
   
   private void readText(Scanner scanner, Token t)
   {
      while (scanner.hasNextLine())
      {
         lastLine = scanner.nextLine();
         if (!isNewToken(lastLine))
         {
            t.text.add(lastLine);
         }
         else
         {
            break;
         }
      }
   }

   private String findNextToken(Scanner scanner)
   {
      if (!isNewToken(lastLine))
      {
         while (scanner.hasNextLine())
         {
            lastLine = scanner.nextLine();
            if (isNewToken(lastLine))
            {
               break;
            }
         }
      }
      return lastLine;
   }

   private boolean isNewToken(String line)
   {
      boolean newToken = false;
      if (line != null)
      {
         newToken = line.matches("\\[.\\]");
      }
      return newToken;
   }

   public ArrayList<Token> getTokens()
   {
      return tokens;
   }
}

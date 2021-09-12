package model;
import java.util.ArrayList;


public class Token
{
   public enum QuestionType {M, N;}
   public QuestionType type;
   public ArrayList<String> text = new ArrayList<String>();
}

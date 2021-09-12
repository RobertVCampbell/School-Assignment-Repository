package model;
import java.util.ArrayList;
import java.util.Scanner;

public class MultipleChoiceQuestion extends Question
{
   private ArrayList<String> choices;
   private ArrayList<Boolean> answers;
   private String selectedAnswer = "";

   public MultipleChoiceQuestion(Token token)
   {
      choices = new ArrayList<String>();
      answers = new ArrayList<Boolean>();
      fromToken(token);
   }
   public MultipleChoiceQuestion(String wording)
   {
      super(wording);
      choices = new ArrayList<String>();
      answers = new ArrayList<Boolean>();
   }
   public void addChoice(String choice, boolean isCorrect)
   {
      choices.add(choice);
      answers.add(isCorrect);
   }
   public void setCorrectAnswer(String answer){}

   public ArrayList<String> getChoices()
   {
      return choices;
   }

   @Override
   public boolean isCorrect()
   {
      boolean correct = false;
      for (int i = 0; i < answers.size(); i++)
      {
         if (answers.get(i) && selectedAnswer.equals(choices.get(i)))
         {
            correct = true;
         }
      }
      return correct;
   }

   @Override
   public Token toToken()
   {
      Token token = new Token();
      token.type = Token.QuestionType.M;
      for (int i = 0; i < choices.size(); i++)
      {
         String choice = "";
         if (answers.get(i))
         {
            choice+="*";
         }
         choice+=choices.get(i);
      }
      return token;
   }

   @Override 
   public void fromToken(Token token)
   {
      if (token.text.size() > 0)
      {
         setQuestionWording(token.text.get(0));
      }
      for (int i = 1; i < token.text.size(); i++)
      {
         String line = token.text.get(i);
         if (line.startsWith("*"))
         {
            answers.add(true);
            line = line.replaceFirst("\\*", "");
         }
         else
         {
            answers.add(false);
         }
         choices.add(line);
      }
   }

   @Override
   public void setAnswer(String answer)
   {
      selectedAnswer = answer;
   }

}

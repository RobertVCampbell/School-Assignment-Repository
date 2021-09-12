package model;
import java.util.ArrayList;
import java.util.Scanner;

/**
*	An extension of the question class
* 	In addition to the question and point value in the question class
*   MultipleChoiceQuestion also contains a string arraylist of choices, a boolean
*	 arraylist to signify if the choice is correct, and a string that contains the
*	 answer selected by the user.
*/

public class MultipleChoiceQuestion extends Question
{
   private ArrayList<String> choices;
   private ArrayList<Boolean> answers;
   private String selectedAnswer = "";

	/**
	* Constructor that will build the question from a token.
	* Primarily used for loading a quiz from a file.
	*/

   public MultipleChoiceQuestion(Token token)
   {
      choices = new ArrayList<String>();
      answers = new ArrayList<Boolean>();
      fromToken(token);
   }
   
   /**
   * A constructor that takes in the question text and initializes the 
   *  chioce and answer ArrayLists. Choices will have to be added using the addChoice method.
   */
   
   public MultipleChoiceQuestion(String wording)
   {
      super(wording);
      choices = new ArrayList<String>();
      answers = new ArrayList<Boolean>();
   }
   
   /**
   * Adds an answer option to the choices array and if the answer is correct to the
   *  answers array.
   */
   public void addChoice(String choice, boolean isCorrect)
   {
      choices.add(choice);
      answers.add(isCorrect);
   }
   public void setCorrectAnswer(String answer){}

	/**
	*  @return Returns the ArrayList of answer choices
	*/
   public ArrayList<String> getChoices()
   {
      return choices;
   }

   @Override
   /**
   * Overrides the Question class' isCorrect method
   *  Iterates through the choices in the array and compares then to the user selected answer
   *  If it matches any of the answers in the array AND the answer is correct, it returns true.
   * @return Returns a boolean that is true if the user provided answer is correct
   */
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
   /**
   * Overrides the Question class' toToken method
   * Constructs a token using the MultipleChoiceQuestions current information
   *  @return Returns the constructed Token
   */
   public Token toToken()
   {
      Token token = new Token();
      token.type = Token.QuestionType.M;
      token.text.add(Integer.toString(getPointValue()));
      token.text.add(getQuestionWording());
      for (int i = 0; i < choices.size(); i++)
      {
         String choice = "";
         if (answers.get(i))
         {
            choice+="*";
         }
         choice+=choices.get(i);
         token.text.add(choice);
      }
      return token;
   }

   @Override 
   /**
   * Overrides the Question class' fromToken method
   * Fills in the MultipleChoiceQuestions details from a formated token
   */
   public void fromToken(Token token)
   {
      if (token.text.size() > 0)
      {
    	  setPointValue(Integer.parseInt(token.text.get(0)));
         setQuestionWording(token.text.get(1));
      }
      for (int i = 2; i < token.text.size(); i++)
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
   /**
   * Overrides the Question class' setAnswer method
   *  Accepts a string as a user selected input
   */
   public void setAnswer(String answer)
   {
      selectedAnswer = answer;
   }

}

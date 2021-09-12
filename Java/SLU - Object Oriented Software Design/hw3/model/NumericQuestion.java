package model;


/**
*	An extension of the Question class
* 	In addition to the question and point value in the question class
*   NumericQuestion also contains doubles for the correct answer and the
*	 user provided answer.
*/
public class NumericQuestion extends Question
{
	private double correctAnswer;
	private double selectedAnswer;
	
	
	/**
	* Constructs a NumericQuestion with only the string for the question
	*/
   public NumericQuestion(String wording)
   {
      super(wording);
   }


	/**
	* Constructor that will build the question from a token.
	* Primarily used for loading a quiz from a file.
	*/
   public NumericQuestion(Token token)
   {
      fromToken(token);
   }
   
   
	/**
	* A method to update correctAnswer
	* @param correctAnswer Correct answer as a double
	*/
   public void setCorrectAnswer(double answer){
	   correctAnswer = answer;
   }

   @Override
   /**
   * Overrides the Question class' isCorrect method
   *  Compares the user provided answer against the correct answer, returning
   *  true if they match
   *  @return Returns a boolean that is true if the user provided answer is correct.
   */
   public boolean isCorrect(){
	   if(selectedAnswer == correctAnswer)
		   return true;
	   else
			return false;
	   
   }
 
   @Override
   /**
   * Overrides the Question class' toToken method
   * Constructs a token using the NumericQuestion's current information
   * @return Returns the constructed Token
   */
   public Token toToken()
   {
      Token token = new Token();
      token.type = Token.QuestionType.N;
      token.text.add(Integer.toString(getPointValue()));
      token.text.add(getQuestionWording());
      token.text.add(Double.toString(correctAnswer));
      return token;
   }

   @Override 
   /**
   * Overrides the Question class' fromToken method
   * Fills in the NumericQuestion's details from a formated token
   */
   public void fromToken(Token token)
   {
      if (token.text.size() > 0)
      {
    	 setPointValue(Integer.parseInt(token.text.get(0)));
         setQuestionWording(token.text.get(1));
         correctAnswer = Double.parseDouble(token.text.get(2));
      }
   }
   
   @Override
   /**
   * Overrides the Question class' setAnswer method
   *  Accepts a string as a user selected input
   *  @param selectedAnswer User provided answer
   */
   public void setAnswer(String answer)
   {
      selectedAnswer = Double.parseDouble(answer);
   }
 
}

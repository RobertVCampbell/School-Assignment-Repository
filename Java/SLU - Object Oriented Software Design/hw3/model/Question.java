package model;


/**
* Question is an abstract class that can be extended to make specific
*  types of questions, such as NumericQuestion and MultipleChoiceQuestion.
* It contains common details, such as questionWording which contains the question
*  to present to the user and the pointValue, or total number of points the question is worth.
*/
public abstract class Question
{
   private int pointValue;
   private String questionWording;


	/**
	* The default constructor that initializes a question with default values.
	*/
   public Question()
   {
      pointValue = 10;
      questionWording = "Default Wording";
   }
   
   /**
   * A constructor that takes in a question string and initializes a default point value of 10
   */
   public Question(String wording)
   {
      this.questionWording = wording;
      this.pointValue = 10;
   }

   /**
    * Method for setting question's point value
    * @param pointValue int value associated with this question
    */
   public void setPointValue(int pointValue){this.pointValue = pointValue;}
   public void setQuestionWording(String questionWording){this.questionWording = questionWording;}

   /**
    * @return the point value associated with this question
    */
   public int getPointValue(){return pointValue;}
   public String getQuestionWording(){return questionWording;}
 
   public abstract boolean isCorrect();
   public abstract Token toToken();
   public abstract void fromToken(Token t);
   public abstract void setAnswer(String answer);
}

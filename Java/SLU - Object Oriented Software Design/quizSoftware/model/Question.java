package model;

public abstract class Question
{
   private int pointValue;
   private String questionWording;

   public Question()
   {
      pointValue = 10;
      questionWording = "Default Wording";
   }
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

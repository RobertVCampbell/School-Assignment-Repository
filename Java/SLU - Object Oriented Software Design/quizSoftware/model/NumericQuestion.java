package model;

public class NumericQuestion extends Question
{
   public NumericQuestion(String wording)
   {
      super(wording);
   }

   public NumericQuestion(Token token)
   {
      super();
   }

   public void setCorrectAnswer(double answer){}
   public void setAnswer(String answer){}

   @Override
   public boolean isCorrect(){return true;}
 
   @Override
   public Token toToken()
   {
      Token token = new Token();
      token.type = Token.QuestionType.N;
      token.text.add(getQuestionWording());
      return token;
   }

   @Override 
   public void fromToken(Token token)
   {
      if (token.text.size() > 0)
      {
         setQuestionWording(token.text.get(0));
      }
   }
 
}

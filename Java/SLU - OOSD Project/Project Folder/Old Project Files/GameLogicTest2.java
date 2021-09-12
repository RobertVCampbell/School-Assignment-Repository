public class GameLogicTest2
{
	@Test
	public void loadScoresTest()
	{
		GameLogic gL = new GameLogic();
		gL.loadScores();
	}
	@Test
	public void saveScoresTest()
	{
		GameLogic gL = new GameLogic();
		gL.saveScores();
	}
	@Test
	public void setGetHighScoreTest()
	{
		GameLogic gL = new GameLogic();
		gL.setHighScore();
		gL.getHighScore();
	}
}
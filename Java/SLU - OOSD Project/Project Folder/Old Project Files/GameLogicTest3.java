package model;

public class GameLogicTest3{
	
	public static void testPlayerPos(){
		GameLogic gameL = new GameLogic();
		int[] pos = gameL.getPlayerPos();
		
		if((pos[0] != 0) || (pos[1] != 0)){
			System.out.println("ERROR in getPlayerPos(). Expected (0,0), returned ("+ pos[0] + ", " + pos[1] + ").");
		} 
		
		gameL.player.x = 2;
		gameL.player.y = 1;
		
		pos = gameL.getPlayerPos();
		
		if((pos[0] != 2) || (pos[1] != 1)){
			System.out.println("ERROR in getPlayerPos(). Expected (0,0), returned ("+ pos[0] + ", " + pos[1] + ").");
		} 
	}
	
	public static void testMonPos(){
		GameLogic gameL = new GameLogic();
		int[] pos = gameL.getMonPos();
		
		if((pos[0] != 0) || (pos[1] != 0)){
			System.out.println("ERROR in getMonPos(). Expected (0,0), returned ("+ pos[0] + ", " + pos[1] + ").");
		} 
		
		gameL.mon.x = 2;
		gameL.mon.y = 1;
		
		pos = gameL.getMonPos();
		
		if((pos[0] != 2) || (pos[1] != 1)){
			System.out.println("ERROR in getMonPos(). Expected (0,0), returned ("+ pos[0] + ", " + pos[1] + ").");
		} 
		
	}
	
	public static void testHandleMove(){
		GameLogic gameL = new GameLogic();
		gameL.player.x = 2;
		gameL.player.y = 1;
		
		boolean valid;
		//valid move 
		valid = gameL.handleMove(Direction.UP);
		if(!valid){
			System.out.println("ERROR in handleMove(Direction.UP): Expected true, returned " + valid + ".");	
		}
		
		gameL.player.x = 2;
		gameL.player.y = 1;
		
		//Invalid move, wall
		valid = gameL.handleMove(Direction.RIGHT);
		if(valid){
			System.out.println("ERROR in handleMove(Direction.UP): Expected false, returned " + valid + ".");	
		}
		
		gameL.player.x = 0;
		gameL.player.y = 0;
		
		//Invalid move, wall
		valid = gameL.handleMove(Direction.UP);
		if(valid){
			System.out.println("ERROR in handleMove(Direction.UP): Expected false, returned " + valid + ".");	
		}
		
	}
	
	public static void testIsOver(){
		GameLogic gameL = new GameLogic();
		gameL.player.x = 2;
		gameL.player.y = 1;
		gameL.mon.x = 2;
		gameL.mon.y = 1;
		
		boolean valid;
		//Game is over, monster and player are overlapping
		valid = gameL.isOver();
		if(!valid){
			System.out.println("ERROR in isOver(): Expected true, returned " + valid + ".");	
		}
		
		gameL.player.x = 0;
		gameL.player.y = 0;
		
		//Game is not over, player and monster are in different positions
		valid = gameL.isOver();
		if(valid){
			System.out.println("ERROR in isOver(): Expected false, returned " + valid + ".");	
		}		
	}

	
	public static void main(String []args){
		testPlayerPos();
		testMonPos();
		testHandleMove();
		testIsOver();
		
	}
	

}

package model;

import java.util.Arrays;

public class MazeTest{
	
	public static void testIsInSightline(){
		Character player = new Character();
		Character mon = new Character();
		Maze m = new Maze();
		
		player.x = 2;
		player.y = 1;
		mon.x = 2;
		mon.y = 0;
		
		boolean valid = m.isInSightline(mon, player);
		//Player and monster are in each other's sightline
		if(!valid){
			System.out.println("ERROR in isInSightline(): Expected true, returned " + valid + ".");	
		}
		
		mon.x = 1;
		mon.y = 0;
		valid = m.isInSightline(mon, player);
		//In neither sightline, because of a wall
		if(valid){
			System.out.println("ERROR in isOver(): Expected false, returned " + valid + ".");	
		}
		
		/* Not implementing variable sightlines at this time
		//When player sightline greater than monster
		player.x = 2;
		player.y = 0;
		mon.x = 0;
		mon.y = 0;
		
		player.sight = 2;
		mon.sight = 1;
		
		//monster in player sightline
		valid = m.isInSightline(player,mon);
		if(!valid){
			System.out.println("ERROR in isOver(): Expected true, returned " + valid + ".");	
		}
		
		//But player not in monster sightline
		valid = m.isInSightline(mon, player);
		if(valid){
			System.out.println("ERROR in isOver(): Expected false, returned " + valid + ".");	
		}
		
		//Monster outside of player's greater range
		player.x = 6;
		valid = isInSightline(player, mon);
		if(valid){
			System.out.println("ERROR in isOver(): Expected false, returned " + valid + ".");	
		}*/
		
		
	}
	
	public static void testVisible(){
		//Test two positions
		Character player = new Character();
		Maze m = new Maze();
		player.x = 2;
		player.y = 1;

		int[] seen = m.visible(player);
		if(seen.length < 2){
			System.out.println("ERROR in visible(Character mover): Returned less than one ordered pair.");
		}
		if((seen.length % 2) != 0){
			System.out.println("ERROR in visible(Character mover): Returned incomplete coordinate pairs.");	
		}
		if((seen.length) != 10){
			System.out.println("ERROR in visible(Character mover): Expected array of length 6, returned " + seen.length);
		}
		
		//Array values:
		//Expecting: {2, 1, 2, 0, -1, -1, -1, -1, 1, 1}
		int[] ans1 = {2, 1, 2, 0, -1, -1, -1, -1, 1, 1};		
		for(int i = 0; i < seen.length; i++){	
			if(seen[i] != ans1[i]){
				System.out.println("ERROR in visible(Character mover): Expected " + ans1[i] + " at index " + i + ", but array contained " + seen[i] + ".");
				System.out.println("Array: " + Arrays.toString(seen));

			}
		}

		player.x = 5;
		player.y = 3;

		seen = m.visible(player);
		if(seen.length < 2){
			System.out.println("ERROR in visible(Character mover): Returned less than one ordered pair.");
		}
		if((seen.length % 2) != 0){
			System.out.println("ERROR in visible(Character mover): Returned incomplete coordinate pairs.");	
		}
		if((seen.length) != 10){
			System.out.println("ERROR in visible(Character mover): Expected array of length 6, returned " + seen.length);
		}
		
		//Array values:
		//Expecting: {5, 3, 5, 2, 6, 3, -1, -1, 4, 3}
		int[] ans2 = {5, 3, 5, 2, 6, 3, -1, -1, 4, 3};		
		for(int i = 0; i < seen.length; i++){	
			if(seen[i] != ans2[i]){
				System.out.println("ERROR in visible(Character mover): Expected " + ans2[i] + " at index " + i + ", but array contained " + seen[i] + ".");
				System.out.println("Array: " + Arrays.toString(seen));
			}
		}		
		
		
		
	}
	
	
	

public static void main(String []args){
	testIsInSightline();
	testVisible();	
	
	
}
}
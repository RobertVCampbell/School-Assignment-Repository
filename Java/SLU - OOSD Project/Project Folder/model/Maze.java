package model;

import java.lang.Math;

public class Maze{
    protected int[][] m = {{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1 },
                           {1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1 },
                           {1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 1, 1, 1 },
                           {1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0 },
                           {1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1 },
                           {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1 },
                           {1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1 },
                           {0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1 },
                           {1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1 },
                           {1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1 },
                           {1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1 },
                           {1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1 },
                           {1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1 }
};

    public int[][] getMaze(){
        return m;
    }
	
	/* This is now handled in game logic
	/*public boolean move(Direction d){
		return false;
	}*/
	
	public boolean isInSightline(Character seek, Character hide){
		//Assuming sight of 1 for now
		//Initialize to the array indecies
		int sx = seek.getX();
		int sy = seek.getY();
		int hx = hide.getX();
		int hy = hide.getY();
		
		int changex = hx - sx;
		int changey = hy - sy;
		
		//check adjacency, return false if not adjacent
		if(Math.abs(changex) == 1){
			if((changey) != 0){
				return false;
			}
			
		}
		else if(Math.abs(changey) == 1){
			if((changex) != 0){
				return false;
			}
		}
		else{
			return false;
		}

		//Convert to the array indecies
		sx = sx * 2;
		sy = sy * 2;
		hx = hx * 2;
		hy = hy * 2;
		
		if(m[sy + changey][sx + changex] == 1){
			return true;
			
		}
		else{
			return false;
		}
		
		
	}
	/*Test and return in order:
	/* Current position, up, right, down, left (clockwise)
	/* values are the array indecies/2, since the even rows/columns
	/* represent the connectivity or 'doors' between rooms.*/
	public int[] visible(Character mover){
		//Store the character position and converted array position
		int x = mover.getX();
		int y = mover.getY();
		int ax = x * 2;
		int ay = y * 2;
		
		//start the return array with the current position
		int[] val = new int[10];
		val[0] = x;
		val[1] = y;
		
		//Check in each of the 4 directions if the index is valid and
		// if there is a door connecting the rooms
		if(((y-1)>= 0) && (m[(ay - 1)][ax] == 1)){
			val[2] = x;
			val[3] = (y-1);
		}
		else{
			val[2] = -1;
			val[3] = -1;			
		}

		if(((x+1)<= 6) && (m[ay][ax + 1] == 1)){
			val[4] = x+1;
			val[5] = y;
		}
		else{
			val[4] = -1;
			val[5] = -1;			
		}		

		if(((y+1)<= 6) && (m[(ay + 1)][ax] == 1)){
			val[6] = x;
			val[7] = (y+1);
		}
		else{
			val[6] = -1;
			val[7] = -1;			
		}
		
		if(((x-1)>= 0) && (m[ay][ax - 1] == 1)){
			val[8] = x-1;
			val[9] = (y);
		}
		else{
			val[8] = -1;
			val[9] = -1;			
		}
		
		return val;
		
	}

}
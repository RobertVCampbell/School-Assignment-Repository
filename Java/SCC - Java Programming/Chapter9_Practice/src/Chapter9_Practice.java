/*Page 636 #11
 * */

import java.util.*;


public class Chapter9_Practice {

	static Scanner console = new Scanner(System.in);
	
	public static void main(String[] args) {
		
		//Create 2-dimensional array
		int[][] hiLowArray = new int[12][2];
		
		int indexHigh;
		int indexLow;
		
		getData(hiLowArray);
		
		System.out.println("Average high temp: " + avgHigh(hiLowArray));
		System.out.println("Average low temp: " + avgLow(hiLowArray));
		
		indexHigh = indexHighTemp(hiLowArray);
		System.out.println("The highest temp is: "+ hiLowArray[indexHigh][0]);
		
		indexLow = indexLowTemp(hiLowArray);
		System.out.println("The lowest temp is: " + hiLowArray[indexLow][1]);

	}//End of main
	

	public static void getData(int[][] twoDim){
		
		int i = 0;
		
		System.out.println("Enter the high temps for each month: ");
		
		for(i = 0; i < twoDim.length; i++){
			twoDim[i][0] = console.nextInt();			
		}//End of for loop
		
		System.out.println("Enter the low temps for each month: ");
		
		for(i = 0; i < twoDim.length; i++){
			twoDim[i][1] = console.nextInt();			
		}//End of for loop
		
	}//End of getData()
	
	
	public static int avgHigh(int[][] twoDim){
		int i;
		int sum = 0;
		
		//Add the total of all of the high temps
		for(i = 0; i < twoDim.length; i++){
			sum += twoDim[i][0];
		}//End of for loop
		
		//Return the average
		return sum/twoDim.length;
				
	}//End of avgHigh()
	
	
	public static int avgLow(int[][] twoDim){
		int i;
		int sum = 0;
		
		//Add the total of all of the low temps
		for(i = 0; i < twoDim.length; i++){
			sum += twoDim[i][1];
		}//End of for loop
		
		//Return the average
		return sum/twoDim.length;
				
	}//End of avgLow()
	
	
	public static int indexHighTemp(int[][] twoDim){
		int i;
		int highIndex = 0;
		
		for(i = 1; i < twoDim.length; i++){
			if(twoDim[highIndex][0] < twoDim[i][0]){
				highIndex = i;
			}//End of if
			
		}//End of for loop
			
		return highIndex;
		
	}//End of indexHighTemp
	
	
	public static int indexLowTemp(int[][] twoDim){
		int i;
		int lowIndex = 0;
		
		for(i = 1; i < twoDim.length; i++){
			if(twoDim[lowIndex][1] > twoDim[i][1]){
				lowIndex = i;
			}//End of if
			
		}//End of for loop
			
		return lowIndex;
		
	}//End of indexHighTemp
	
	
}//End of class

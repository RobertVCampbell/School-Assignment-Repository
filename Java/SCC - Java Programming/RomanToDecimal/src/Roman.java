
public class Roman {

	private int decimalNum;
	private String romanNum;
	
	public Roman(){
		romanNum = "I";
		decimalNum = 1;
		
	}//End of default constructor
	
	public Roman(String rString){
		romanNum = rString.toUpperCase();
		romanToDecimal();
	}
	
	/*public Roman(int dNum){
		decimalNum = dNum;
		decimalToRoman();
	}
	*/
	
	public void printDecimal() {
		System.out.println(decimalNum);
	}
	
	
	public void printRoman(){
		System.out.println(romanNum);
	}
	
	public void setRoman(String rString){
		romanNum = rString.toUpperCase();
		romanToDecimal();
	}
	
	public void romanToDecimal(){
		int sum = 0;
		int len = romanNum.length();
		int i;
		
		int previous = 1000;
		
		for (i = 0; i < len; i++){
			switch(romanNum.charAt(i)){
				case 'M':
					sum += 1000;
					if(previous < 1000){
						sum -= (2*previous);
					}
					previous = 1000;
					break;
				case 'D':
					sum += 500;
					if(previous < 500)
						sum -= (2*previous);
					previous = 500;
					break;
				case 'C':
					sum += 100;
					if(previous < 100)
						sum -= (2*previous);
					previous = 100;
					break;
				case 'L':
					sum += 50;
					if(previous < 50)
						sum -= (2*previous);
					previous = 50;
					break;
				case 'X':
					sum += 10;
					if(previous < 10)
						sum -= (2*previous);
					previous = 10;
					break;
				case 'V':
					sum += 5;
					if(previous < 5)
						sum -= (2*previous);
					previous = 5;
					break;	
				case 'I':
					sum += 1;
					if(previous < 1)
						sum -= (2*previous);
					previous = 1;
					break;				
				default:
					System.out.println("Invalid Data!!!!");
					
			}//End of switch
			
		}//end of for loop
		decimalNum = sum;
		
	}//End of romanToDecimal()
	
	
}//end of class

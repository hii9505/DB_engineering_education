package thursdayClass;
import java.util.Scanner;

public class Player {
	Scanner scan;
	private String name;
	private String word;
	
	public Player(String name) {
		this.name = name;
		scan = new Scanner(System.in);
	}
	
	public String getName() {return name;}
	
	public String sayWord() {
		System.out.print(name + ">>");
		word = scan.next();
		return word;
	}
	
	
	public boolean succeed(String lastWord) { 
		int lastIndex = lastWord.length()-1;
		
		if(lastWord.charAt(lastIndex) == word.charAt(0))
			return true;
		else
			return false;
		
	}
	

}

package thursdayClass;
import java.util.Scanner;

public class WordGameApp {
	private Scanner scan;
	private String startWord = "충남대";
	private Player[]  players;
	

	public WordGameApp()  {
		scan = new Scanner(System.in);
	}
	
	private void createPlayers() {
		System.out.print("게임에 참가하는 인원은 몇명입니까>>");
		int nPlayers = scan.nextInt();
		players = new player[nplayers];
		
		for(int i=0; i<nPlayers; i++) {
			System.out.print("참가자의 이름을 입력하세요>>");
			String name = scan.next();
			players[i] = new Player(name);
		}
	}
	
	public void run() {
		createPlayers();
		String lastWord = startWord;
		
		System.out.println("시작하는 단어는" + lastWord + "입니다");
		int next = 0;
	
	
	while(true) {
		String newWord = players[next].sayWord();
		if(!players[next].succeed(lastWord)) {
			System.out.print(players[next].getName() + "이 졌습니다.");
			break;
		}
		next++;
		next %= players.length;
		lastWord = newWord;
	 }
	}
	
	public static void main(String[] args) {
		WordGameApp game = new WordGameApp();
		game.run();
		
	}
	
}

package thursdayClass;

import java.util.Scanner;
import java.util.Random;

public class GBBGameApp {

	public static void main(String[] args) {
		Random random = new Random();
		Scanner s = new Scanner(System.in);
		
		while(true) { 
		
		System.out.println("가위 바위 보 게임입니다. 가위, 바위, 보 중에서 입력하세요");
		System.out.print("입력 >> ");
		String a = s.next();
		String b;
		int randomSelection = random.nextInt(3);
		if(randomSelection == 0) {
			b = "가위";
		}else if(randomSelection == 1) {
			b = "바위";
		}else {
			b = "보";
		}
		
		System.out.println("나는 " + a + " 컴퓨터는 " + b + "를 냈습니다.");
		
		
		if(a.equals("가위")) {
			if(b.equals("가위"))
				System.out.println("draw");
			else if(b.equals("바위"))
				System.out.println("you lose");
			else { 
				System.out.println("victory");
				break;
			}
		}
		else if(a.equals("바위")) {
			if(b.equals("가위")) 
			{	
				System.out.println("victory");
				break;
				}
			else if(b.equals("바위"))
				System.out.println("draw");
			else
				System.out.println("you lose");
		}
		else if(a.equals("보")){
			if(b.equals("가위"))
				System.out.println("you lose");
			else if(b.equals("바위"))
			{
				System.out.println("victory");
				break;
			}
			else
				System.out.println("draw");
		}
		else {
			System.out.println("다시 입력하세요");
		}
		
		}
		
		System.out.println("======Game Over=======");
		s.close();
		
	}
	
}

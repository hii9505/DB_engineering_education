package triangle;

import java.util.Scanner;

public class VandingMachine extends Beverage{
	
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		int money = 0;
		int choice = 0;
		int change = 0;
		
		System.out.println("-----------자판기 프로그램--------------");
		System.out.println("돈을 입력하세요");
		money = sc.nextInt();
		System.out.println("입력된 금액:" + money);
		System.out.println("메뉴를 고르세요.");
		System.out.println("1. 콜라(1000) 2. 사이다(800) 3.생수(600)");
		choice = sc.nextInt();
	
	
	switch (choice) {
	case 1:
		change = money - 1000;
		Coke coke = new Coke();
		System.out.println("콜라");
		System.out.println("음료이름: " + coke.getName());
		System.out.println("음료특징: " + coke.getFeature());
		System.out.println("잔돈: " + (change - coke.getPrice()));
		break;
	case 2:
		Sider sider = new Sider();
		System.out.println("사이다");
		change = money - 800;
		System.out.println("음료이름: " + sider.getName());
		System.out.println("음료특징: " + sider.getFeature());
		System.out.println("잔돈: " + (change - sider.getPrice()));
		break;
	case 3:
		Water water = new Water();
		System.out.println("생수");
		change = money - 800;
		System.out.println("음료이름: " + water.getName());
		System.out.println("음료특징: " + water.getFeature());
		System.out.println("잔돈: " + (change - water.getPrice()));
		break;	
	}
	sc.close();

}
}

package thursdayClass;

import java.util.*;

public class test {
	public static void main(String[] args) { 
		Scanner scan = new Scanner(System.in);
		int dividend;
		int divisor;
		
		System.out.println("나눗스를 입력하시오");
		dividend = scan.nextInt();
		System.out.print("나눗수를 입력하시오");
		divisor = scan.nextInt();
		
		try {
			System.out.print(dividend + "를" + "로 나누면 몫은" + dividend/divisor + "입니다");
		}
		catch(ArithmeticException e) {
			System.out.print("0으로 나눌 수 없습니다");
		}
		finally {
			scan.close();
		}
		
	}
}

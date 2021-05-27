package thursdayClass;

class A {
	public A() {
		System.out.println("생성자 A");
	}
	public A(int x) {
		System.out.println("매개변수생성자 A" + x);
	}
}

class B extends A {
	public B() {
		System.out.println("생성자 B");
	}
	public B(int x) { 
		super(x);
		System.out.println("매개변수생성자 B" + x);
	}
}


public class ConstructorEx4 {
	public static void main(String[] args) {
		B b;
		b = new B(5);
	}

}

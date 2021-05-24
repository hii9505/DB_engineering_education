class Animal {
	public void show()
	{
		System.out.println("Animal : show() called...");
	
	}
	
	public void oveeriding()
	{
		System.out.println("Animal : overriding() called...");
	}
	
}

class Dogdog extends Animal {
	public void overriding()
	{
		System.out.println("childClass: overriding() called...");
	}
}
	
public class oppTest{
	public static void main(String[] args) {
		Dogdog c = new Dogdog();
		c.show();
		c.overriding();
	}
}


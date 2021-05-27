package thursdayClass;

class Shape {
	public void draw() { 
		System.out.println("shape");
	}
}

class Line extends Shape { 
	public void draw( ) {
		System.out.println("LIne");
	}
}

class Rect extends Shape {
	public void draw() {
		System.out.println("Rect");
	}
}
class Circle extends Shape {
	public void draw() {
		System.out.println("Cricle");
	}
}
public class MethodOverridingEx {
	static void paint(Shape p) {
		
		p.draw();
	}
	
	public static void main(String[] args) {
		Line line = new Line();
		paint(line);
		
		paint(new Shape());
		paint(new Line());
		paint(new Rect());
		paint(new Circle());
	}
}

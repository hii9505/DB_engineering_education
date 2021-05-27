package PracticeEx;

class Point{
	private int x, y;
	public Point(int x, int y) {
		this.x = x; this.y = y;
	}
	
	public String toString() {
		return "Point(" + x + "," + y + ")";
	}
}

public class ObjectPropertyEx {
	public static void main(String [] args) {
		Point a = new Point(2,3);
		System.out.println(a.toString());
		System.out.println(a);
	}
}

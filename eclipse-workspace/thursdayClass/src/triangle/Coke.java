package triangle;

public class Coke extends Beverage {
	public Coke() {
		setType("탄산음료");
		setName("대림콜라");
		setPrice(1000);
		setFeature("달달한 맛");
	}
}

class Sider extends Beverage {
	public Sider() {
		setType("탄산음료");
		setName("대림사이다");
		setPrice(800);
		setFeature("청량한 맛");
	}
}

class Water extends Beverage {
	public Water() {
		setType("생수");
		setName("스파클 생수");
		setPrice(600);
		setFeature("물맛");
	}
}

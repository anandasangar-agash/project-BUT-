public class Cavalier extends Soldat {
	private int bonusForce;
	private Cheval cheval;

	public Cavalier() {
		super();
	}

	public Cavalier(Cavalier c){
		super(c);
		this.bonusForce = c.bonusForce;
		this.cheval = new Cheval (c.getCheval());
	}

	public Cheval getCheval() {

		return this.cheval;
	}

	public int getForce() {

		return super.getForce() + this.bonusForce;
	}

	public void init() {

		super.init();
		this.cheval = new Cheval();
		this.cheval.init();
		this.bonusForce = Clavier.readInt("bonus force ?")
	}

	public boolean equals(Object o) {

		if (o==null) return false;
		if (this.getClass()!=o.getClass()) return false;
		Cavalier c = (Cavalier) o;
		return (super.equals(c)
		&& this.getCheval() == c.getCheval());
	}

	public String toString() {
		return super.toString() + this.getCheval();
	}
}
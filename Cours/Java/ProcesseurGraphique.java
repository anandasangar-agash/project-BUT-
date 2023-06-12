public class ProcesseurGraphique extends Processeur {
	private int cadenceGraphique;
	private String formatGraphique;

	public ProcesseurGraphique() {

		super();
	}

	public ProcesseurGraphique(int uneCadence, int uneCadenceGraphique, String unFormatGraphique) {

		super(uneCadence);
		this.cadenceGraphique = uneCadenceGraphique;
		this.formatGraphique = unFormatGraphique;
	}

	public ProcesseurGraphique(ProcesseurGraphique p){

		super(p);
		this.cadenceGraphique = p.getCadenceGraphique();
		this.formatGraphique = new String (p.getFormatGraphique());
	}

	public String getFormatGraphique() {

		return this.formatGraphique;
	}

	public int getCadenceGraphique() {

		return this.cadenceGraphique;
	}

	public String toString() {

		return super.toString() + " sa cadence propre " + this.getCadenceGraphique() + " son format graphique " + this.getFormatGraphique();
	}

	public boolean equals(Object o){

		if (o==null) return false;
		if (this.getClass()!= o.getClass()) return false;
		ProcesseurGraphique p = (ProcesseurGraphique) o;
		return (super.equals(p)
		&& this.getCadenceGraphique() == p.getCadenceGraphique()
		&& this.getFormatGraphique().equals(p.getFormatGraphique())
		);
	}
}
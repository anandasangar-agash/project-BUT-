public class TacheGraphique extends Tache {
	private int nbInstructionsGraphique;
	private String unFormatGraphique;

	public TacheGraphique(){
		super();
	}

	public TacheGraphique(int nbInstructions, int nbInstructionsGraphique, String unFormatGraphique) {

		super(nbInstructions);
		this.nbInstructionsGraphique = nbInstructionsGraphique;
		this.unFormatGraphique = unFormatGraphique;
	}

	public TacheGraphique(TacheGraphique t){

		super(t);
		this.nbInstructionsGraphique = t.getNombreInstructionsGraphiques();
		this.unFormatGraphique = new String (t.getFormatGraphique());
	}

	public String getFormatGraphique() {

		return this.unFormatGraphique;
	}

	public int getNombreInstructionsGraphiques() {

		return this.nbInstructionsGraphique;
	}

	public int getNombreInstructions() {

		return super.getNombreInstructions() + this.nbInstructionsGraphique;
	}

	public void setNombreInstructionsGraphiques(int nbInstructionsGraphique) {

		this.nbInstructionsGraphique = nbInstructionsGraphique;
	}

	public String toString() {
		return super.toString() +
		" nombre d'instruction " + this.getNombreInstructionsGraphiques() +
		" format graphique " + this.getFormatGraphique();
	}
}
public class Fantassin extends Soldat {
	private int unBonusSante;

	public Fantassin(String unNom, int uneForce, int uneSante, int unBonusSante) {

		super(unNom, uneForce, uneSante);
		this.unBonusSante = unBonusSante;
	}

	public int getSante(){

		return super.getSante() + this.unBonusSante;
	}
}
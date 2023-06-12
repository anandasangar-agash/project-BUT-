public class ListeProcesseurs {
	private ArrayList<Processeur> processeurs;

	public ListeProcesseurs() {

		this.processeurs = new ArrayList<Processeur>();
	}

	public ArrayList<Processeur> getProcesseurs() {

		return this.processeurs;
	}

	public int nbProcesseurs() {

		return this.processeurs.size();
	}

	public boolean listeVide() {

		return this.nbProcesseurs() == 0;
	}

	public String toString() {
		String s = "";
		for (int i = 0; i < this.nbProcesseurs(); i++) {
			s = s + this.processeurs.get(i) + "\n" ; 
		}
		return s;
	}

	public void ajouterProcesseur(Processeur p){
		this.processeurs.add(p);
	}

	public Processeur getProcesseur(int i) throws Exception {
		int n = this.nbProcesseurs()
		if(i > n-1) throw new Exception ("il n'y a pas de processeur à ce rang !");
		return this.processeurs.get(i);
	}

	public Processeur retirerDernierProcesseur() throws Exception {
		int n = this.nbProcesseurs();
		if (n==0) throw new Exception ("la liste est vide !")
		return this.processeurs.remove(n-1);
	}

	public boolean equals(Object o) {
		if(o==null) return false;
		if(this.getClass()!=o.getClass()) return false;
		ListeProcesseurs lp = (ListeProcesseurs) o;
		if (this.nbProcesseurs()!=lp.nbProcesseurs()) return false;
		int = 0;
		boolean egale = true;
		while (egale && i < this.nbProcesseurs()) {
			if (!this.processeurs.get(i).equals(lp.processeurs.get(i))) egale = false;
			else i++;
		}
		return egale;
	}
}
public class Livre {
	public static final int MIN_PAGES = 1;
	public static final int MAX_PAGES = 1000;
	private String titre;
	private String auteur;
	private int nbPages;
	private double prix;

	public Livre() {}

	public Livre(String titre, String auteur, int nbPages, double prix) throws Exception{

		if (nbPages < MIN_PAGES | nbPages > MAX_PAGES) throw new Execption ("nombre pages invalide !")
		if (prix < 0) throw new Execption ("prix invalide !");
		this.titre = titre;
		this.auteur = auteur;
	} 

	public Livre(Livre unLivre){
		this.titre = new String (unLivre.getTitre());
		this.auteur = new String (unLivre.getAuteur());
		this.nbPages = unLivre.getNombrePage();
		this.prix = unLivre.getPrix();
	}

	public int
}
import java.util.ArrayList;

import ardoise.*;

public class GrandeForme extends Forme {
	
	private Forme forme1;
	private Forme forme2;
	private Forme forme3;
	private Forme forme4;
	
	public GrandeForme() {
		super();
	}
	
	public GrandeForme(String nom, Forme forme1, Forme forme2, Forme forme3)  {
		super(nom);
		this.forme1 = forme1;
		this.forme2 = forme2;
		this.forme3 = forme3;
		
	}
	
	public GrandeForme(String nom, Forme forme1, Forme forme2, Forme forme3, Forme forme4)  {
		super(nom);
		this.forme1 = forme1;
		this.forme2 = forme2;
		this.forme3 = forme3;
		this.forme4 = forme4;
	}
	

	@Override
	public void deplacer(int deplacementX, int deplacementY) {
		// TODO Auto-generated method stub
		if (this.forme4 == null) {
		this.forme1.deplacer(deplacementX, deplacementY);
		this.forme2.deplacer(deplacementX, deplacementY);
		this.forme3.deplacer(deplacementX, deplacementY);}
		else {
		this.forme1.deplacer(deplacementX, deplacementY);
		this.forme2.deplacer(deplacementX, deplacementY);
		this.forme3.deplacer(deplacementX, deplacementY);
		this.forme4.deplacer(deplacementX, deplacementY);}
	}

	@Override
	public ArrayList<Segment> dessiner() {
		// TODO Auto-generated method stub
		ArrayList<Segment> dessin = new ArrayList<Segment>();
		if (this.forme4 == null) {
			dessin.addAll(this.forme1.dessiner());
			dessin.addAll(this.forme2.dessiner());
			dessin.addAll(this.forme3.dessiner());}
		else {
			dessin.addAll(this.forme1.dessiner());
			dessin.addAll(this.forme2.dessiner());
			dessin.addAll(this.forme3.dessiner());
		    dessin.addAll(this.forme4.dessiner());}
		
		return dessin;
	}

	@Override
	public String typeForme() {
		// TODO Auto-generated method stub
		return "GF";
	}

}

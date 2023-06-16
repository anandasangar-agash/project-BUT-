import java.util.ArrayList;

import ardoise.*;

public class Quadrilatere extends Forme {
	
	private PointPlan p1;
	private PointPlan p2;
	private PointPlan p3;
	private PointPlan p4;
	
	public Quadrilatere() {
		super();
	}
	
	public Quadrilatere(String nom,PointPlan p1,PointPlan p2) throws Exception {
		super(nom);
		if(p1.getAbscisse() < 0 || p1.getAbscisse() > 200 ||
		   p1.getOrdonnee() < 0 || p1.getOrdonnee() > 200 ||
		   p2.getAbscisse() < 0 || p2.getAbscisse() > 200 ||
		   p2.getOrdonnee() < 0 || p2.getOrdonnee() > 200)
		   throw new Exception("les coordonnées des points doivent être compris entre 0 et 200");
		this.p1 = p1;
		this.p2 = p2;
		this.p3 = new PointPlan(this.p1.getAbscisse(),this.p2.getOrdonnee());
		this.p4 = new PointPlan(this.p2.getAbscisse(), this.p1.getOrdonnee());
	}
	
	public void deplacer(int deplacementX, int deplacementY) {
		this.p1.setAbscisse(this.p1.getAbscisse()+deplacementX);
		this.p1.setOrdonnee(this.p1.getOrdonnee()+deplacementY);
		
		this.p2.setAbscisse(this.p2.getAbscisse()+deplacementX);
		this.p2.setOrdonnee(this.p2.getOrdonnee()+deplacementY);
		
		this.p3.setAbscisse(this.p3.getAbscisse()+deplacementX);
		this.p3.setOrdonnee(this.p3.getOrdonnee()+deplacementY);
		
		this.p4.setAbscisse(this.p4.getAbscisse()+deplacementX);
		this.p4.setOrdonnee(this.p4.getOrdonnee()+deplacementY);
	}
	
	public ArrayList<Segment> dessiner(){
		ArrayList<Segment> dessin = new ArrayList<Segment>();
		try {
		if(this.p1.getAbscisse() == this.p2.getAbscisse() && this.p1.getOrdonnee() == this.p2.getOrdonnee() ||
		   this.p1.getAbscisse() == this.p3.getAbscisse() && this.p1.getOrdonnee() == this.p3.getOrdonnee() ||
		   this.p1.getAbscisse() == this.p4.getAbscisse() && this.p1.getOrdonnee() == this.p4.getOrdonnee() ||
		   this.p2.getAbscisse() == this.p3.getAbscisse() && this.p2.getOrdonnee() == this.p3.getOrdonnee() ||
		   this.p2.getAbscisse() == this.p4.getAbscisse() && this.p2.getOrdonnee() == this.p4.getOrdonnee() ||
		   this.p3.getAbscisse() == this.p4.getAbscisse() && this.p3.getOrdonnee() == this.p4.getOrdonnee())
			throw new Exception("les points ont les mêmes coordonnées");
		dessin.add(new Segment(this.p1,this.p3));
		dessin.add(new Segment(this.p3,this.p2));
		dessin.add(new Segment(this.p2,this.p4));
		dessin.add(new Segment(this.p4,this.p1));
		
		} catch(Exception e) { 
			System.out.println("Erreur:" + e.getMessage());
		}
		return dessin;
	}

	@Override
	public String typeForme() {
		// TODO Auto-generated method stub
		return "Q";
	}

}

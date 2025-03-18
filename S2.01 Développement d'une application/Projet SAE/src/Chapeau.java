import java.util.ArrayList;

import ardoise.*;

public class Chapeau extends Forme{
	
	private PointPlan p1;
	private PointPlan p2;
	private PointPlan p3;
	
	public Chapeau() {
		super();
	}
	
	public Chapeau(String nom,PointPlan p1,PointPlan p2,PointPlan p3) throws Exception {
		super(nom);
	
		if(p1.getAbscisse() < 0 || p1.getAbscisse() > 200 ||
				   p1.getOrdonnee() < 0 || p1.getOrdonnee() > 200 ||
				   p2.getAbscisse() < 0 || p2.getAbscisse() > 200 ||
				   p2.getOrdonnee() < 0 || p2.getOrdonnee() > 200 ||
				   p3.getAbscisse() < 0 || p3.getAbscisse() > 200 ||
				   p3.getOrdonnee() < 0 || p3.getOrdonnee() > 200 )
					 throw new Exception("les coordonnées des points doivent être compris entre 0 et 200");
		this.p1 = p1;
		this.p2 = p2;
		this.p3 = p3;
	}
	
	public void deplacer(int deplacementX, int deplacementY) {
		this.p1.setAbscisse(this.p1.getAbscisse()+deplacementX);
		this.p1.setOrdonnee(this.p1.getOrdonnee()+deplacementY);
		
		this.p2.setAbscisse(this.p2.getAbscisse()+deplacementX);
		this.p2.setOrdonnee(this.p2.getOrdonnee()+deplacementY);
		
		this.p3.setAbscisse(this.p3.getAbscisse()+deplacementX);
		this.p3.setOrdonnee(this.p3.getOrdonnee()+deplacementY);
	}
	
	public ArrayList<Segment> dessiner(){
		ArrayList<Segment> dessin = new ArrayList<Segment>();
		try {
		if(this.p1.getAbscisse() == this.p2.getAbscisse() && this.p1.getOrdonnee() == this.p2.getOrdonnee() ||
		   this.p1.getAbscisse() == this.p3.getAbscisse() && this.p1.getOrdonnee() == this.p3.getOrdonnee() ||
		   this.p2.getAbscisse() == this.p3.getAbscisse() && this.p2.getOrdonnee() == this.p3.getOrdonnee())
			throw new Exception("les points ont les mêmes coordonnées");
		dessin.add(new Segment(this.p1,this.p2));
		dessin.add(new Segment(this.p2,this.p3));
		
		} catch(Exception e) { 
			System.out.println("Erreur:" + e.getMessage());
		}
		return dessin;
	}

	@Override
	public String typeForme() {
		// TODO Auto-generated method stub
		return "C";
	}

}

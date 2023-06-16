import java.util.ArrayList;

import ardoise.*;

public class Triangle extends Forme{
	
	private PointPlan p1;
	private PointPlan p2;
	private PointPlan p3;
	
	public Triangle() {
		super();
	}
	
	public Triangle(String nom,PointPlan p1,PointPlan p2,PointPlan p3) throws Exception {
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
		
	@Override
	public void deplacer(int deplacememtX, int deplacememtY) {
		
		this.p1.setAbscisse(this.p1.getAbscisse()+deplacememtX);
		this.p1.setOrdonnee(this.p1.getOrdonnee()+deplacememtY);
			
		this.p2.setAbscisse(this.p2.getAbscisse()+deplacememtX);
		this.p2.setOrdonnee(this.p2.getOrdonnee()+deplacememtY);
			
		this.p3.setAbscisse(this.p3.getAbscisse()+deplacememtX);
		this.p3.setOrdonnee(this.p3.getOrdonnee()+deplacememtY);
		}

	@Override
	public ArrayList<Segment> dessiner(){
		ArrayList<Segment> dessin = new ArrayList<Segment>();
		try {
		if(this.p1.getAbscisse() == this.p2.getAbscisse() && this.p1.getOrdonnee() == this.p2.getOrdonnee() ||
		   this.p1.getAbscisse() == this.p3.getAbscisse() && this.p1.getOrdonnee() == this.p3.getOrdonnee() ||
		   this.p2.getAbscisse() == this.p3.getAbscisse() && this.p2.getOrdonnee() == this.p3.getOrdonnee())
			throw new Exception("les points ont les mêmes coordonnées");
		dessin.add(new Segment(this.p1,this.p2));
		dessin.add(new Segment(this.p2,this.p3));
		dessin.add(new Segment(this.p3, this.p1));
		
		} catch(Exception e) { 
			System.out.println("Erreur:" + e.getMessage());
		}
		return dessin;
	}

	@Override
	public String typeForme() {
		// TODO Auto-generated method stub
		return "T";
	}

}
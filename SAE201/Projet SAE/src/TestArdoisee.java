import java.util.ArrayList;

import ardoise.*;

public class TestArdoisee {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		Ardoise ardoise = new Ardoise();
		
		PointPlan Op1 = new PointPlan(118,13);
		PointPlan Op2 = new PointPlan(123,20);
		PointPlan Op3 = new PointPlan(128,13);
		PointPlan Op4 = new PointPlan(133,30);
		PointPlan Op5 = new PointPlan(136,32);
		PointPlan Op6 = new PointPlan(138,30);
		PointPlan Op7 = new PointPlan(142,14);
		PointPlan Op8 = new PointPlan(144,17);
		PointPlan Op9 = new PointPlan(146,14);
		
		Forme oiseau1 = new Chapeau("Oiseau 1",Op1,Op2,Op3);
		Forme oiseau2 = new Chapeau("Oiseau 2",Op4,Op5,Op6);
		Forme oiseau3 = new Chapeau("Oiseau 3",Op7,Op8,Op9);
		
		ArrayList<Segment> SegOiseau1 = oiseau1.dessiner();
		ArrayList<Segment> SegOiseau2 = oiseau2.dessiner();
		ArrayList<Segment> SegOiseau3 = oiseau3.dessiner();
		
		ardoise.ajouterForme(oiseau1);
		ardoise.ajouterForme(oiseau2);
		ardoise.ajouterForme(oiseau3);
		
		PointPlan Mp1 = new PointPlan(3,14);
		PointPlan Mp2 = new PointPlan(43,3);
		PointPlan Mp3 = new PointPlan(112,14);
		PointPlan Mp4 = new PointPlan(152,7);
		PointPlan Mp5 = new PointPlan(166,3);
		PointPlan Mp6 = new PointPlan(172,7);
		
		Forme montagne1 = new Triangle("Montagne 1",Mp1,Mp2,Mp3);
		Forme montagne2 = new Triangle("Montagne 2",Mp4,Mp5,Mp6);
		
		ArrayList<Segment> SegMontagne1 = montagne1.dessiner();
		ArrayList<Segment> SegMontagne2 = montagne2.dessiner();
		
		ardoise.ajouterForme(montagne1);
		ardoise.ajouterForme(montagne2);
		
		PointPlan Qp1 = new PointPlan(120,170);
		
		PointPlan Qp2 = new PointPlan(140,198);
		
		PointPlan Qp3 = new PointPlan(80,140);
		
		PointPlan Qp4 = new PointPlan(180,198);
		
		PointPlan Tp1 = new PointPlan(80,140);
		PointPlan Tp2 = new PointPlan(130,100);
		PointPlan Tp3 = new PointPlan(180,140);
		
		Forme Porte = new Quadrilatere("Porte maison",Qp1,Qp2);
		Forme Corps = new Quadrilatere("Corps maison",Qp3,Qp4);
		Chapeau Toit = new Chapeau("Toit maison",Tp1,Tp2,Tp3);
		Forme Maison = new GrandeForme("Maison",Toit,Corps,Porte);
		
		ArrayList<Segment> SegMaison = Maison.dessiner();
		
		ardoise.ajouterForme(Maison);
		
		PointPlan Qp5 = new PointPlan(9,100);
		PointPlan Qp6 = new PointPlan(20,198);
		
		
		Forme Tour = new Quadrilatere("Tour",Qp5,Qp6);
		
		ArrayList<Segment> SegTour = Tour.dessiner();
		
		ardoise.ajouterForme(Tour);
		
		PointPlan Ep1 = new PointPlan(170,52);
		PointPlan Ep2 = new PointPlan(173,45);
		PointPlan Ep3 = new PointPlan(177,52);
		PointPlan Ep4 = new PointPlan(177,52);
		PointPlan Ep5 = new PointPlan(184,57);
		PointPlan Ep6 = new PointPlan(177,60);
		PointPlan Ep7 = new PointPlan(177,60);
		PointPlan Ep8 = new PointPlan(174,66);
		PointPlan Ep9 = new PointPlan(170,60);
		PointPlan Ep10 = new PointPlan(170,60);
		PointPlan Ep11 = new PointPlan(164,57);
		PointPlan Ep12 = new PointPlan(170,52);
		
		Forme branche1 = new Chapeau("branche 1",Ep1,Ep2,Ep3);
		Forme branche2 = new Chapeau("branche 2",Ep4,Ep5,Ep6);
		Forme branche3 = new Chapeau("branche 3",Ep7,Ep8,Ep9);
		Forme branche4 = new Chapeau("branche 4",Ep10,Ep11,Ep12);
		Forme etoile = new GrandeForme("Etoile",branche1,branche2,branche3,branche4);
		
		ArrayList<Segment> SegEtoile = etoile.dessiner();
		
		ardoise.ajouterForme(etoile);
				
		ardoise.dessinerGraphique();
		
		while(true) {
		Thread.sleep(1000);
		ardoise.deplacer("C", 10, 20);
		ardoise.deplacer("GF",1 , 0);
		ardoise.deplacer("Q", 1, 0);
		}
		
	}

}

public class Armée {
	private String nom;
	private Soldat[] lesSoldats;
	private int forceTotale;

	public Armée(Armée a){

		this.nom = new String (a.getNom());
		this.forceTotale = a.getForceTotale();
		int n = c.getSoldat().length;
		this.lesSoldats = new Soldat[n]:

		for (int i = 0 ; i < n ; i++){
      Soldat unSoldat = a.getSoldats()[i] ;
		  	
      if (unSoldat instanceof Fantassin)
        lesSoldats[i] = new Fantassin((Fantassin) unSoldat) ;
      else {
        if (unSoldat instanceof Cavalier)
          lesSoldats[i] = new Cavalier((Cavalier) unSoldat) ;
        else
	  lesSoldats[i] = new Soldat(unSoldat) ;    	
      }	    	
    } 
  }

  public Soldat[] getSoldats() {

  	return this.lesSoldats;
  }

   public void init(){
    this.nom   = Clavier.readString("nom armee ? ")   ;
		  
    int n = Clavier.readInt("nombre de soldats ? ") ;  
    this.lesSoldats = new Soldat[n] ;
		  
    this.forceTotale = 0 ;
		  
    for (int i = 0 ; i < n ; i++){
      int reponse ;
		  	
      do {
        System.out.println("1 - Soldat, 2 - Fantassin, 3 - Cavalier") ;
        reponse = Clavier.readInt("numero choisi ? ") ;	
      }	while(reponse < 1 || reponse > 3) ;	
		  		
      switch(reponse){
        case 1 : this.lesSoldats[i] = new Soldat() ; break ;
        case 2 : this.lesSoldats[i] = new Fantassin() ; break ;
        case 3 : this.lesSoldats[i] = new Cavalier()  ;
      }
		  	
      this.lesSoldats[i].init() ; 
      this.forceTotale = this.forceTotale + this.lesSoldats[i].getForce() ;
    } // fin du for
  }

   public String toString(){
    String s = "nom armee = " + this.getNom() + "\n" + "force totale = " + this.getForceTotale() + "\n" ;
		
    for (int i = 0 ; i < this.getSoldats().length ; i++){
      s = s + "soldat " + i + " " + this.getSoldats()[i] + "\n" ;
    }
  
    return s ;
  }

  public boolean equals(Object o){

  	if (o==null | this.getClass()!=o.getClass()) return false;

  	Armee a = (Armee) o ;
		
    boolean egalite = true ;
		
    if (!this.getNom().equals(a.getNom()))
      egalite = false ;
		
    int i = 0 ;
    while (i < this.getSoldats().length && egalite){
      egalite = egalite && this.getSoldats()[i].equals(a.getSoldats()[i]) ;
      i++ ;
    }
    
    return egalite ;
  }
}
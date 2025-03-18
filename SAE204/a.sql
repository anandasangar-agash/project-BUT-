create or replace 
  function sgrade_salaire(out grade int, out msg money) 
  returns setof record as
$$
-- ****************************
DECLARE
  -- Création du curseur permettant de parcourir les grades 
  -- et les salaires des employés de la table employe
  curs CURSOR FOR 
	select empgrade, empsalaire from employe order by empgrade;

  -- salaire de l'employé courant
  sal employe.empsalaire%TYPE;

  -- premier grade du groupe courant
  first_grade_current_group int; 

  -- ****************************
  BEGIN

  -- somme des salaires par grade
  msg:=0;

  -- on ouvre le curseur pour pouvoir l'utiliser
  open curs;

  -- boucle externe permet de parcourir tous les grades et les salaires
  loop

    -- Récupération du grade et du salaire courant (indiqué par le curseur)
    -- dans grade et sal, le curseur avance automatiquement
    fetch curs into grade, sal;
  
    -- Si le curseur  atteint la fin des tuples
    -- on sort de la boucle externe
    exit when not found;
    
    -- rajout du premier salaire du premier grade dans la somme
    msg:=sal; 

    -- on enregistre le premier grade correspond au "début" 
    -- du groupe des employés de ce grade
    first_grade_current_group := grade; 

      -- **********************************************************
      -- Boucle interne qui permet de calculer la somme pour un grade donnée
      loop
        -- Récupération des autres salaires pour le grade courant
	fetch curs into grade, sal;

	-- A-t-on atteint le dernier tuple de la table employe ?
	if not found then  -- Si, dernier tuple atteint
	  grade := first_grade_current_group; -- -- on restaure le grade qui a été écrasé
	  return next;                        -- on retourne le tuple correspondant au grade 
                                              -- et la somme des salaires pour ce grade
	  exit;  -- on sort de la boucle interne
	end if; -- fin du if "a-t-on atteint dernier tuple ?"
	  
        -- Est-on toujours dans le même grade dont on calcule la somme
	if first_grade_current_group = grade then	
	  -- on rajoute le salaire à la somme des salaires pour le grade
	  msg := msg + sal;
	else
	  move prior in curs; -- sinon on recule le curseur pour tenir compte
                              -- de ce nouveau grade qui correspondra à un autre groupe
	                      -- on restaure le grade qui a été écrasé
	  grade := first_grade_current_group; 		
	  return next;   -- on retourne le tuple de resultat courant correspondant au grade 
                         -- et la somme des salaires pour ce grade dont le calcul est terminé
	  exit; 	 -- on sort de la boucle interne
	end if;  -- fin du if "est-on toujours dans le meme grade
	         -- pour le groupe en cours dont on calcule la somme ?"
      end loop;
      -- *************************************************************
  end loop;
  -- **********************************************************
  
  -- on ferme le curseur
  
  close curs;
  return;
END;
-- ****************************	
$$ language plpgsql
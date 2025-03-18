CREATE or REPLACE VIEW Releve_etudiant
AS 
	SELECT c.UE,m.num_module, m.nom_module, avg(n.note) as moyenne 
	FROM etudiant e, competence c, module m, controle co, note n 
	WHERE LOWER(e.prénom_etudiant) = session_user
	AND m.num_module = co.num_module
	AND co.num_controle = n.num_controle
	AND e.num_etudiant = n.num_etudiant
	AND m.num_module = c.num_module
	GROUP BY c.UE, m.num_module, m.nom_module;



CREATE or REPLACE VIEW Releve_note_etudiant
AS 
	SELECT m.num_module, m.nom_module, co.nom_controle, n.note 
	FROM etudiant e, module m, controle co, note n 
	WHERE LOWER(e.prénom_etudiant) = session_user
	AND m.num_module = co.num_module
	AND co.num_controle = n.num_controle
	AND e.num_etudiant = n.num_etudiant
	GROUP BY m.num_module, m.nom_module, co.nom_controle, n.note ;



CREATE or REPLACE VIEW Releve_promo
AS 
	SELECT e.nom_etudiant, e.prénom_etudiant, e.groupe, avg(n.note) as moyenne 
	FROM etudiant e,  note n 
	WHERE e.num_etudiant = n.num_etudiant
	GROUP BY e.nom_etudiant, e.prénom_etudiant, e.groupe;

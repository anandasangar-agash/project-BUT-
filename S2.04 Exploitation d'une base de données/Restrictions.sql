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

GRANT SELECT ON Releve_etudiant to etudiant;



CREATE or REPLACE VIEW Releve_note_etudiant
AS 
	SELECT m.num_module, m.nom_module, co.nom_controle, n.note 
	FROM etudiant e, module m, controle co, note n 
	WHERE LOWER(e.prénom_etudiant) = session_user
	AND m.num_module = co.num_module
	AND co.num_controle = n.num_controle
	AND e.num_etudiant = n.num_etudiant
	GROUP BY m.num_module, m.nom_module, co.nom_controle, n.note ;

GRANT SELECT ON Releve_note_etudiant to etudiant;



CREATE or REPLACE VIEW Releve_promo
AS 
	SELECT e.nom_etudiant, e.prénom_etudiant, e.groupe, avg(n.note) as moyenne 
	FROM etudiant e,  note n 
	WHERE e.num_etudiant = n.num_etudiant
	GROUP BY e.nom_etudiant, e.prénom_etudiant, e.groupe;

GRANT SELECT ON Releve_promo to enseignant;



CREATE OR REPLACE FUNCTION Notes (in num_etudiant, in num_controle, note)
AS
$$
DECLARE 
	a INT;

BEGIN
	SELECT a = COUNT(*) FROM note 
	WHERE num_etudiant= $1 and num_controle= $2;

	IF a > 0 THEN
		UPDATE Note
		SET note = $3
		WHERE num_etudiant= $1 and num_controle= $2;
	ELSE
		INSERT INTO note (num_etudiant,num_controle,note)
		VALUES ($1, $2, $3);
	END IF;
END;
$$
LANGUAGE PLPGSQL
GRANT SELECT,INSERT,UPDATE ON note to enseignant;


CREATE OR REPLACE VIEW resmodule
AS
SELECT c.nom_controle, c.num_controle, c.num.module  
FROM contrôle c, module m, enseignant e 
WHERE c.num_module = m.num_module
AND m.resp_module = e.num_enseignant
AND LOWER(e.nom_enseignant) = session_user;

GRANT SELECT, INSERT, UPDATE on controle to resp_module;


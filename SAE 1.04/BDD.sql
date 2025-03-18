DROP TABLE notation;
DROP TABLE etudiant;
DROP TABLE evaluation;
DROP TABLE module;
DROP TABLE enseignant;
DROP TABLE personne;

CREATE TABLE personne (
	id_personne INT PRIMARY KEY,
	nom_personne VARCHAR NOT NULL,
	prenom_personne VARCHAR NOT NULL
  );


CREATE TABLE etudiant (
    id_etudiant INT REFERENCES personne (id_personne)ON DELETE CASCADE,
    PRIMARY KEY (id_etudiant)
  );

CREATE TABLE enseignant (
	id_enseignant INT REFERENCES personne (id_personne)ON DELETE CASCADE,
	PRIMARY KEY (id_enseignant)
  );

CREATE TABLE module (
	id_module INT PRIMARY KEY,
	code VARCHAR NOT NULL,
	ue VARCHAR NOT NULL,
	intitule_module VARCHAR NOT NULL,
	id_enseignant INT REFERENCES personne (id_personne)ON DELETE CASCADE
  );

CREATE TABLE evaluation (
	id_evaluation INT PRIMARY KEY,
	nom_evaluation VARCHAR NOT NULL,
	date_evaluation VARCHAR NOT NULL,
	id_module INT REFERENCES module (id_module) ON DELETE CASCADE
  );

CREATE TABLE notation (
	id_etudiant INT REFERENCES personne (id_personne)ON DELETE CASCADE,
	id_evaluation INT REFERENCES evaluation (id_evaluation)ON DELETE CASCADE,
	PRIMARY KEY (id_etudiant, id_evaluation),
	note REAL CHECK (note > 0 OR note IS NULL)
  );


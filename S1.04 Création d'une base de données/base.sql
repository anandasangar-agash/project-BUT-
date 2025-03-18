DROP TABLE temp;

CREATE TABLE temp (
id_enseignant INT,
nom_enseignant VARCHAR NOT NULL,
prenom_enseignant VARCHAR NOT NULL,
id_module INT,
code VARCHAR NOT NULL,
UE VARCHAR NOT NULL,
intitule_module VARCHAR NOT NULL,
nom_evaluation VARCHAR NOT NULL,
date_evaluation VARCHAR,
note REAL CHECK (note > 0 OR note IS NULL),
id_etudiant INT,
nom_etudiant VARCHAR NOT NULL,
prenom_etudiant VARCHAR NOT NULL
);

COPY temp FROM '/Users/agash/Desktop/data.csv' DELIMITER ';' CSV Header;


DROP TABLE etudiant;
DROP TABLE evaluation;
DROP TABLE module;
DROP TABLE enseignant;


CREATE TABLE etudiant (
    id_etudiant INT,
	nom_etudiant VARCHAR NOT NULL,
	prenom_etudiant VARCHAR NOT NULL
  );

INSERT INTO etudiant (SELECT id_etudiant, nom_etudiant, prenom_etudiant FROM temp);

CREATE TABLE enseignant (
	id_enseignant INT,
	nom_enseignant VARCHAR NOT NULL,
	prenom_enseignant VARCHAR NOT NULL
  );

INSERT INTO enseignant (SELECT id_enseignant, nom_enseignant, prenom_enseignant FROM temp);

CREATE TABLE module (
	id_module INT,
	code VARCHAR NOT NULL,
	UE VARCHAR NOT NULL,
	intitule_module VARCHAR NOT NULL
  );

INSERT INTO module (SELECT id_module, code, UE, intitule_module FROM temp);

CREATE TABLE evaluation (
	nom_evaluation VARCHAR NOT NULL,
	date_evaluation VARCHAR NOT NULL,
	note REAL CHECK (note > 0 OR note IS NULL)
  );

INSERT INTO evaluation (SELECT nom_evaluation, date_evaluation, note FROM temp);

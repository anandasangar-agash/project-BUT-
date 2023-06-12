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
ALTER TABLE enseignant drop if exists num_module;
drop table if exists note;
drop table if exists etudiant;
drop table if exists competence;
drop table if exists controle;
drop table if exists module;
drop table if exists enseignant;


CREATE TABLE etudiant (
    num_etudiant int PRIMARY KEY ,
    nom_etudiant varchar not null,
    prénom_etudiant varchar not null,
    date_naissance date,
    groupe varchar not null,
    check (
        num_etudiant <= 12299999 and num_etudiant >= 12200000
        and
        groupe='tlaloc' or groupe='zeus' or groupe='shango' or groupe='indra' or groupe='whaitiri')
    );

CREATE TABLE enseignant (
    num_enseignant int PRIMARY KEY ,
    nom_enseignant varchar not null,
    prénom_enseignant varchar not null
);

CREATE TABLE module (
    num_module float PRIMARY KEY,
    resp_module int REFERENCES enseignant (num_enseignant) ON DELETE CASCADE,
    nom_module varchar not null,
    check(
        (num_module <= 1.12 and num_module >= 1.01)
        or
        (num_module <= 2.14 and num_module >= 2.01))
);

CREATE TABLE competence (
    UE int PRIMARY KEY,
    nom_competence varchar not null,
    num_module float REFERENCES module (num_module) ON DELETE CASCADE,
    check (
        (UE <= 16 and UE >= 11)
        or
        (UE <= 26 and UE >= 21))
);

CREATE TABLE controle (
    num_controle int PRIMARY KEY,
    num_module float REFERENCES module (num_module) ON DELETE CASCADE,
    nom_controle varchar
);

CREATE TABLE note (
    num_etudiant int REFERENCES etudiant (num_etudiant) ON DELETE CASCADE,
    num_controle int REFERENCES controle (num_controle) ON DELETE CASCADE,
    note float
);


ALTER TABLE enseignant ADD 
    num_module float REFERENCES module (num_module) ON DELETE CASCADE ;

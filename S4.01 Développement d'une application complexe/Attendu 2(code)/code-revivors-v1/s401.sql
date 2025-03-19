DROP TABLE IF EXISTS PERSONNE CASCADE;
DROP TABLE IF EXISTS PRESTATAIRE CASCADE;
DROP TABLE IF EXISTS CLIENT CASCADE;
DROP TABLE IF EXISTS INTERLOCUTEUR CASCADE;
DROP TABLE IF EXISTS COMMERCIAL CASCADE;
DROP TABLE IF EXISTS ADMINISTRATEUR CASCADE;
DROP TABLE IF EXISTS GESTIONNAIRE CASCADE;
DROP TABLE IF EXISTS TEXTE CASCADE;
DROP TABLE IF EXISTS Localiite CASCADE;
DROP TABLE IF EXISTS TypeVoie CASCADE;
DROP TABLE IF EXISTS Adresse CASCADE;
DROP TABLE IF EXISTS COMPOSANTE CASCADE;
DROP TABLE IF EXISTS MISSION CASCADE;
DROP TABLE IF EXISTS BON_DE_LIVRAISON CASCADE;
DROP TABLE IF EXISTS ACTIVITE CASCADE;
DROP TABLE IF EXISTS NB_HEURE CASCADE;
DROP TABLE IF EXISTS PLAGE_HORAIRE CASCADE;
DROP TABLE IF EXISTS JOUR CASCADE;
DROP TABLE IF EXISTS DEMI_JOUR CASCADE;
DROP TABLE IF EXISTS dirige CASCADE;
DROP TABLE IF EXISTS estDans CASCADE;
DROP TABLE IF EXISTS travailleAvec CASCADE;

CREATE TABLE PERSONNE (
   id_personne SERIAL PRIMARY KEY,
   prenom VARCHAR(50) NOT NULL,
   nom VARCHAR(50) NOT NULL,
   email VARCHAR(50) UNIQUE,
   mdp VARCHAR(50)
);

CREATE TABLE PRESTATAIRE (
   id_personne SERIAL PRIMARY KEY,
   interne BOOLEAN,
   FOREIGN KEY(id_personne) REFERENCES PERSONNE(id_personne)
);

CREATE TABLE CLIENT (
   id_client SERIAL PRIMARY KEY,
   nom_client VARCHAR(50) NOT NULL,
   telephone_client VARCHAR(50)
);

CREATE TABLE INTERLOCUTEUR (
   id_personne SERIAL PRIMARY KEY,
   FOREIGN KEY(id_personne) REFERENCES PERSONNE(id_personne)
);

CREATE TABLE COMMERCIAL (
   id_personne SERIAL PRIMARY KEY,
   interne BOOLEAN,
   FOREIGN KEY(id_personne) REFERENCES PERSONNE(id_personne)
);

CREATE TABLE ADMINISTRATEUR (
   id_personne SERIAL PRIMARY KEY,
   FOREIGN KEY(id_personne) REFERENCES PERSONNE(id_personne)
);

CREATE TABLE GESTIONNAIRE (
   id_personne SERIAL PRIMARY KEY,
   FOREIGN KEY(id_personne) REFERENCES PERSONNE(id_personne)
);

CREATE TABLE TEXTE (
   id_texte INT PRIMARY KEY
);

CREATE TABLE Localite (
   id_localite SERIAL PRIMARY KEY,
   cp INT,
   ville VARCHAR(50)
);

CREATE TABLE TypeVoie (
   id_type_voie SERIAL PRIMARY KEY,
   libelle VARCHAR(50)
);

CREATE TABLE Adresse (
   id_adresse SERIAL PRIMARY KEY,
   numero INT,
   nom_voie VARCHAR(50),
   id_type_voie SERIAL NOT NULL,
   id_localite SERIAL NOT NULL,
   FOREIGN KEY(id_type_voie) REFERENCES TypeVoie(id_type_voie),
   FOREIGN KEY(id_localite) REFERENCES Localite(id_localite)
);

CREATE TABLE COMPOSANTE (
   id_composante SERIAL PRIMARY KEY,
   nom_composante VARCHAR(50),
   id_adresse SERIAL NOT NULL,
   id_client SERIAL NOT NULL,
   FOREIGN KEY(id_adresse) REFERENCES Adresse(id_adresse),
   FOREIGN KEY(id_client) REFERENCES CLIENT(id_client)
);

CREATE TABLE MISSION (
   id_mission SERIAL PRIMARY KEY,
   type_bdl VARCHAR(50) NOT NULL,
   nom_mission VARCHAR(50),
   date_debut DATE ,
   id_composante SERIAL NOT NULL,
   FOREIGN KEY(id_composante) REFERENCES COMPOSANTE(id_composante)
);

CREATE TABLE BON_DE_LIVRAISON (
   id_bdl SERIAL PRIMARY KEY,
   est_valide BOOLEAN,
   mois VARCHAR(50),
   commentaire VARCHAR(50),
   signatureInterlocuteur VARCHAR(50),
   signaturePrestataire VARCHAR(50),
   id_interlocuteur INT,
   id_prestataire SERIAL NOT NULL,
   id_mission SERIAL NOT NULL,
   FOREIGN KEY(id_interlocuteur) REFERENCES INTERLOCUTEUR(id_personne),
   FOREIGN KEY(id_prestataire) REFERENCES PRESTATAIRE(id_personne),
   FOREIGN KEY(id_mission) REFERENCES MISSION(id_mission)
);

CREATE TABLE ACTIVITE (
   id_activite SERIAL PRIMARY KEY,
   commentaire VARCHAR(50),
   date_bdl VARCHAR(50),
   id_personne SERIAL NOT NULL,
   id_bdl SERIAL NOT NULL,
   FOREIGN KEY(id_personne) REFERENCES PRESTATAIRE(id_personne),
   FOREIGN KEY(id_bdl) REFERENCES BON_DE_LIVRAISON(id_bdl)
);

CREATE TABLE NB_HEURE (
   id_activite SERIAL PRIMARY KEY,
   nb_heure INT,
   FOREIGN KEY(id_activite) REFERENCES ACTIVITE(id_activite)
);

CREATE TABLE JOUR (
   id_activite SERIAL PRIMARY KEY,
   journee BOOLEAN,
   debut_heure_supp INT,
   fin_heure_supp INT,
   FOREIGN KEY(id_activite) REFERENCES ACTIVITE(id_activite)
);

CREATE TABLE DEMI_JOUR (
   id_activite SERIAL PRIMARY KEY,
   nb_demi_journee INT, 
   FOREIGN KEY(id_activite) REFERENCES ACTIVITE(id_activite)
);

CREATE TABLE dirige (
   id_composante SERIAL,
   id_personne SERIAL,
   PRIMARY KEY(id_composante, id_personne),
   FOREIGN KEY(id_composante) REFERENCES COMPOSANTE(id_composante),
   FOREIGN KEY(id_personne) REFERENCES INTERLOCUTEUR(id_personne)
);

CREATE TABLE estDans (
   id_composante SERIAL,
   id_personne SERIAL,
   PRIMARY KEY(id_composante, id_personne),
   FOREIGN KEY(id_composante) REFERENCES COMPOSANTE(id_composante),
   FOREIGN KEY(id_personne) REFERENCES COMMERCIAL(id_personne)
);

CREATE TABLE travailleAvec (
   id_personne SERIAL,
   id_mission SERIAL,
   PRIMARY KEY(id_personne, id_mission),
   FOREIGN KEY(id_personne) REFERENCES PRESTATAIRE(id_personne),
   FOREIGN KEY(id_mission) REFERENCES MISSION(id_mission)
);

-- Insertion de personnes
INSERT INTO PERSONNE (prenom, nom, email, mdp)
VALUES ('Jean', 'Dupont', 'jean@example.com', '$2y$10$AdRKx8/XlSQOhma3wx3dt.d4VFVzhu7k5hoOxZtSCGbAXObfLH2WO'),
       ('Marie', 'Martin', 'marie@example.com', '$2y$10$OQTibYkApn06f7t3ZrYLwuAKrGKPVaxpyh5QOYDGq9.GK./Ql4jba'),
       ('Pierre', 'Durand', 'pierre@example.com', '$2y$10$UZ4nJagTS4CRDCuy6YCbbuo8DB4aGs2t65abogTJFfJlHjUVpkLh2'),
       ('Karim', 'Ahmoud', 'karim@example.com', '$2y$10$JTefis8uMB3GRS9th8HNDewgPPGqIqzqzsn.obEzIa9pH5IHTZkDy'),
       ('David', 'Hébert', 'hebert@exemple.com', '$2y$10$2Z5qbM3udHaPu3HwoSovY.AaaltkQ/9bE67WLym0yeFlbmO.nW7ZC'),
       ('Franck', 'Butelle', 'butelle@exemple.com', '$2y$10$4PDRdj7qLfTnXbCA0RY2c.PuXEbVb400tSewpJz7PL4kzTw8MERjy'),
       ('Aurelie', 'Nassiet', 'nassiet@exemple.com', '$2y$10$QRTy2XOqiR71eHtiX4hXzeQRSCEgyn0X6NGn7.nXyWX.sckoKsYHK'),
       ('Vague', 'Kris', 'kris@exemple.com', '$2y$10$eREPxuBIFxzIBRtQsUvLVudVNjT0Z30Ppyj3TY4JVpgmAlwREqIw2'),
       ('Marya', 'Latif', 'latifmarya@gmail.com', '$2y$10$rRXfjzmizSweuqAw6t6E6eK.D5gRAwyOSkH8LMK78StFuplA8x5A.'),
       ('Aboubakar', 'Baouchi','aboubakar.baouchi@gmail.com', '$2y$10$ac4mlgeGvT8sPq9oGJ7ageE5OeYmtRXVyDZAFl6RhWmcb140WbZfu'),
       ('India','Cabo', 'ic@gmail.com', '$2y$10$xiuJuK3rDrVkX6MhBOouleU65mR7XDFBf.MWhaR4Z2uhoe2RCo/Ne');


-- Insertion de prestataires
INSERT INTO PRESTATAIRE (id_personne, interne)
VALUES (1, true),
       (2, True),
       (3, False),
       (4, True);
      
-- Insertion de commercial
INSERT INTO COMMERCIAL
VALUES (2, true), (9, true);

-- Insertion de gestionnaire
INSERT INTO GESTIONNAIRE (id_personne)
VALUES (9),
	   (10),
   (11);


-- Insertion de clients
INSERT INTO CLIENT  (nom_client)
VALUES ('Client A'),
       ('Client B');

-- insertion adresses


INSERT INTO  LOCALITE (cp, ville)
VALUES ( 95120, 'Ermont'),
	   ( 93800, 'Épinay-sur-Seine');

INSERT INTO TYPEVOIE (libelle)
VALUES ('Avenue'),
	   ('Rue'),
       ('Chemin');
       
INSERT INTO ADRESSE (numero, nom_voie,  id_type_voie, id_localite)
VALUES (1, 'nomVoie1', 1, 1),
	   (2, 'nomVoie2', 2, 2),
	   (1, 'nomVoie3', 2, 2);

-- Insertion de composantes
INSERT INTO COMPOSANTE ( nom_composante, id_client, id_adresse)
VALUES ('Composante X', 1, 1),
       ('Composante Y', 1, 2),
       ('Finance', 2, 3);

-- Insertion de missions
INSERT INTO MISSION (nom_mission, type_bdl, id_composante)
VALUES ('mission1', 'Heure', 1),
       ('mission2' ,'Journée', 2),
       ('mission3', 'Demi-journée', 3);

-- Insertion d'interlocuteurs
INSERT INTO INTERLOCUTEUR (id_personne)
VALUES (5),
       (6),
       (7),
       (8);

-- lien interlocuteurs composantes
INSERT INTO DIRIGE (id_composante, id_personne)
VALUES (1, 5),
	   (2, 6),
       (2, 8),
       (3, 7);

       
-- lien commercial composantes
INSERT INTO estDans (id_composante, id_personne)
VALUES (1, 2),
	   (2, 2),
       (3, 2);
      
-- lien prestataire missions
INSERT INTO travailleAvec (id_personne, id_mission)
VALUES (1, 2),
	   (1, 3),
	   (3, 1);

INSERT INTO BON_DE_LIVRAISON ( id_interlocuteur, id_mission, id_prestataire, mois)
VALUES (5, 1, 3, '2024-01'),
	   ( 6, 2, 2, '2024-02'),
     	   ( 7, 3, 1, '2024-01');
           
INSERT INTO ACTIVITE ( commentaire, date_bdl, id_personne, id_bdl)
VALUES ( 'com1', '2023-12-01', 1, 2),
	   ( 'com2', '2023-12-01', 1, 3),
       ( 'com3', '2023-12-01', 3, 1);

INSERT INTO NB_HEURE (id_activite, nb_heure)
VALUES (1, 70),
	   (2, 67);

INSERT INTO DEMI_JOUR (id_activite, nb_demi_journee)
VALUES (3, 2);



-- Création d'une vue matérialisée vue_clients_composantes
-- Cette vue combine les tables client et composante en joignant sur id_client
CREATE MATERIALIZED VIEW vue_clients_composantes AS
SELECT c.nom_client, co.nom_composante
FROM client c
JOIN composante co ON c.id_client = co.id_client;

-- Création d'une vue matérialisée vue_bdl_missions
-- Cette vue combine les tables bon_de_livraison et mission en joignant sur id_mission
CREATE MATERIALIZED VIEW vue_bdl_missions AS
SELECT b.mois, m.nom_mission, m.date_debut
FROM bon_de_livraison b
JOIN mission m ON b.id_mission = m.id_mission;

-- Création d'une vue matérialisée vue_activites_heures
-- Cette vue combine les tables activite et nb_heure en joignant sur id_activite
CREATE MATERIALIZED VIEW vue_activites_heures AS
SELECT a.id_activite, a.commentaire, a.date_bdl, nh.nb_heure
FROM activite a
JOIN nb_heure nh ON a.id_activite = nh.id_activite;


-- Création d'une procédure stockée ajouter_client
-- Cette procédure insère un nouveau client dans la table client
CREATE OR REPLACE PROCEDURE ajouter_client(
    IN nom_client VARCHAR(50),
    IN telephone_client VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO client (nom_client, telephone_client)
    VALUES (nom_client, telephone_client);
END;
$$;

-- Appel de la procédure stockée ajouter_client pour insérer un nouveau client
CALL ajouter_client('client C', '0707070707');


-- Suppression du type event et de la table log si elles existent déjà
DROP TYPE IF EXISTS event CASCADE;
DROP TABLE IF EXISTS log CASCADE;

-- Création du type event comme énumération
CREATE TYPE event as 
    ENUM ('INSERT', 'DELETE', 'UPDATE');

-- Création de la table log pour enregistrer les actions sur la table personne
CREATE TABLE log(
    action event,
    date_modif timestamp default current_timestamp,
    nom VARCHAR,
    prenom VARCHAR,
    id_personne INT
);

-- Création de la fonction fonction_log
-- Cette fonction est appelée par un trigger et enregistre les actions dans la table log
CREATE OR REPLACE FUNCTION fonction_log() 
RETURNS TRIGGER AS 
$$ 
BEGIN 
    IF TG_OP = 'INSERT' THEN
        INSERT INTO log (action, nom, prenom, id_personne) VALUES (TG_OP::event, NEW.nom, NEW.prenom, NEW.id_personne);
    ELSIF TG_OP = 'UPDATE' THEN 
        INSERT INTO log (action, nom, prenom, id_personne) VALUES (TG_OP::event, NEW.nom, NEW.prenom, NEW.id_personne);
    ELSE 
        INSERT INTO log (action, nom, prenom, id_personne) VALUES (TG_OP::event, OLD.nom, OLD.prenom, OLD.id_personne);
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Création du trigger personne_trig
-- Ce trigger appelle la fonction fonction_log après chaque opération d'insertion, mise à jour ou suppression sur la table personne
CREATE TRIGGER personne_trig
    AFTER
    UPDATE or INSERT or DELETE on personne
        FOR EACH ROW
        EXECUTE PROCEDURE fonction_log();


-- Suppression du type event et de la table log_activite si elles existent déjà
DROP TYPE IF EXISTS event CASCADE;
DROP TABLE IF EXISTS log_activite CASCADE;

-- Création du type event comme énumération
CREATE TYPE event as 
    ENUM ('INSERT', 'DELETE', 'UPDATE');

-- Création de la table log_activite pour enregistrer les actions sur la table activite
CREATE TABLE log_activite(
    action event,
    date_modif timestamp default current_timestamp,
    id_activite INT,
    commentaire VARCHAR,
    date_bdl VARCHAR,
    id_personne INT,
    id_bdl INT
);

-- Création de la fonction fonction_log_activite
-- Cette fonction est appelée par un trigger et enregistre les actions dans la table log_activite
CREATE OR REPLACE FUNCTION fonction_log_activite() 
RETURNS TRIGGER AS 
$$ 
BEGIN 
    IF TG_OP = 'INSERT' THEN
        INSERT INTO log_activite (action, id_activite, commentaire, date_bdl, id_personne, id_bdl) VALUES (TG_OP::event, NEW.id_activite, NEW.commentaire, NEW.date_bdl, NEW.id_personne, NEW.id_bdl);
    ELSIF TG_OP = 'UPDATE' THEN 
        INSERT INTO log_activite (action, id_activite, commentaire, date_bdl, id_personne, id_bdl) VALUES (TG_OP::event, NEW.id_activite, NEW.commentaire, NEW.date_bdl, NEW.id_personne, NEW.id_bdl);
    ELSE 
        INSERT INTO log_activite (action, id_activite, commentaire, date_bdl, id_personne, id_bdl) VALUES (TG_OP::event, OLD.id_activite, OLD.commentaire, OLD.date_bdl, OLD.id_personne, OLD.id_bdl);
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Création du trigger activite_trig
-- Ce trigger appelle la fonction fonction_log_activite après chaque opération d'insertion, mise à jour ou suppression sur la table activite
CREATE TRIGGER activite_trig
    AFTER
    UPDATE or INSERT or DELETE on activite
        FOR EACH ROW
        EXECUTE PROCEDURE fonction_log_activite();


-- Suppression du type event et de la table log_bdl si elles existent déjà
DROP TYPE IF EXISTS event CASCADE;
DROP TABLE IF EXISTS log_bdl CASCADE;

-- Création du type event comme énumération
CREATE TYPE event as 
    ENUM ('INSERT', 'DELETE', 'UPDATE');

-- Création de la table log_bdl pour enregistrer les actions sur la table bon_de_livraison
CREATE TABLE log_bdl(
    action event,
    date_modif timestamp default current_timestamp,
    id_bdl INT,
    est_valide BOOLEAN,
    commentaire VARCHAR,
    signatureinterlocuteur VARCHAR,
    signatureprestataire VARCHAR,
    id_interlocuteur INT,
    id_mission INT
);

-- Création de la fonction fonction_log_bdl
-- Cette fonction est appelée par un trigger et enregistre les actions dans la table log_bdl
CREATE OR REPLACE FUNCTION fonction_log_bdl() 
RETURNS TRIGGER AS 
$$ 
BEGIN 
    IF TG_OP = 'INSERT' THEN
        INSERT INTO log_bdl (action, id_bdl, est_valide, commentaire, signatureinterlocuteur, signatureprestataire, id_interlocuteur, id_mission) VALUES (TG_OP::event, NEW.id_bdl, NEW.est_valide, NEW.commentaire, NEW.signatureinterlocuteur, NEW.signatureprestataire, NEW.id_interlocuteur, NEW.id_mission);
    ELSIF TG_OP = 'UPDATE' THEN 
        INSERT INTO log_bdl (action, id_bdl, est_valide, commentaire, signatureinterlocuteur, signatureprestataire, id_interlocuteur, id_mission) VALUES (TG_OP::event, NEW.id_bdl, NEW.est_valide, NEW.commentaire, NEW.signatureinterlocuteur, NEW.signatureprestataire, NEW.id_interlocuteur, NEW.id_mission);
    ELSE 
        INSERT INTO log_bdl (action, id_bdl, est_valide, commentaire, signatureinterlocuteur, signatureprestataire, id_interlocuteur, id_mission) VALUES (TG_OP::event, OLD.id_bdl, OLD.est_valide, OLD.commentaire, OLD.signatureinterlocuteur, OLD.signatureprestataire, OLD.id_interlocuteur, OLD.id_mission);
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Création du trigger bdl_trig
-- Ce trigger appelle la fonction fonction_log_bdl après chaque opération d'insertion, mise à jour ou suppression sur la table bon_de_livraison
CREATE TRIGGER bdl_trig
    AFTER
    UPDATE or INSERT or DELETE on bon_de_livraison
        FOR EACH ROW
        EXECUTE PROCEDURE fonction_log_bdl();
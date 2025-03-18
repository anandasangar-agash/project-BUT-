
CREATE TABLE public.PERSONNE (
                id_personne INTEGER NOT NULL,
                nom_personne VARCHAR NOT NULL,
                prenom_personne VARCHAR NOT NULL,
                CONSTRAINT id_personne PRIMARY KEY (id_personne)
);


CREATE TABLE public.ETUDIANT (
                id_etudiant INTEGER NOT NULL,
                CONSTRAINT id_etudiant PRIMARY KEY (id_etudiant)
);


CREATE TABLE public.ENSEIGNANT (
                id_enseignant INTEGER NOT NULL,
                CONSTRAINT id_enseignant PRIMARY KEY (id_enseignant)
);


CREATE TABLE public.MODULE (
                id_module INTEGER NOT NULL,
                code VARCHAR NOT NULL,
                intitule_module VARCHAR NOT NULL,
                UE VARCHAR NOT NULL,
                id_enseignant INTEGER NOT NULL,
                CONSTRAINT id_module PRIMARY KEY (id_module)
);


CREATE TABLE public.EVALUATION (
                id_evaluation INTEGER NOT NULL,
                nom_evaluation VARCHAR NOT NULL,
                Date DATE NOT NULL,
                id_module INTEGER NOT NULL,
                CONSTRAINT id_evaluation PRIMARY KEY (id_evaluation)
);


CREATE TABLE public.NOTATION (
                id_etudiant INTEGER NOT NULL,
                id_evaluation INTEGER NOT NULL,
                Note REAL NOT NULL,
                CONSTRAINT id_notation PRIMARY KEY (id_etudiant, id_evaluation)
);


ALTER TABLE public.ENSEIGNANT ADD CONSTRAINT personne_enseignant_fk
FOREIGN KEY (id_enseignant)
REFERENCES public.PERSONNE (id_personne)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE public.ETUDIANT ADD CONSTRAINT personne_etudiant_fk
FOREIGN KEY (id_etudiant)
REFERENCES public.PERSONNE (id_personne)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE public.NOTATION ADD CONSTRAINT etudiant_notation_fk
FOREIGN KEY (id_etudiant)
REFERENCES public.ETUDIANT (id_etudiant)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.MODULE ADD CONSTRAINT enseignant_module_fk
FOREIGN KEY (id_enseignant)
REFERENCES public.ENSEIGNANT (id_enseignant)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE public.EVALUATION ADD CONSTRAINT module_evaluation_fk
FOREIGN KEY (id_module)
REFERENCES public.MODULE (id_module)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE public.NOTATION ADD CONSTRAINT evaluation_notation_fk
FOREIGN KEY (id_evaluation)
REFERENCES public.EVALUATION (id_evaluation)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

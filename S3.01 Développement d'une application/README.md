# Di Evoluzion - Outil de pilotage pour l'IUT de Villetaneuse
Cet outil a été développé dans le cadre d'une SAE (Situation d'apprentissage et évaluation) pour la formation de BUT Informatique en 2ème année au 3ème semestre. C'est un outil de pilotage des heures enseignants qui est sous forme de site intranet dynamique.
- [Structure de l'outil](#structure-de-loutil)
- [Fonctionnalités et accès du site intranet](#fonctionnalités-du-site-intranet)

## Structure de l'outil
L'outil se trouve dans le fichier zip `produit-final.zip`. Une fois les fichiers extrait, vous retrouverez : 
- **/competence2** Dans ce répertoire vous trouverez:
    - le répertoire `RSA` : avec les 2 fichiers fichiers PHP attendus : 
        - un qui montre RSA par l’utilisation de bibliothèque dédiées: `RSA_obscure.php` et un ou le chiffrement est programmé `RSA_claire.php`
    - le fichier `optimisation.php`: Un fichier PHP détaillé et commenté contenant une première version d’une fonctionnalité et une seconde version optimisée. 
- **/SAE_code** Dans ce répertoire vous retrouvez les code du site intranet avec des répertoires sous le modèle d'architecture MVC. Ce répertoire se compose de:
    - le répertoire `Content`: où se trouvent la feuille de style CSS, les polices d'écritures en format `.ttf`, et les images utilisées.
    - le répertoire `Controllers`: contenant les contrôleurs qui gèrent les interactions entre les modèles et les vues.
    - le répertoire `Models `: Ce répertoire contient les modèles de l'application, responsables de la logique métier et de l'interaction avec la base de données. À l'intérieur, vous retrouverez :
        - Le fichier `model.php` : ce fichier représente le modèle de base à partir duquel les autres modèles héritent. Il peut contenir des fonctionnalités communes à tous les modèles, telles que la connexion à la base de données ou la gestion des requêtes SQL.
        - Le fichier `credentials.php` : ce fichier est utilisé pour stocker les informations de connexion à la base de données ou d'autres informations sensibles. 
    - le répertoire `Utils `: Ce répertoire contient des fonctions réutilisables dans tout le projet. À l'intérieur, vous trouverez :
        - Le fichier `functions.php` : ce fichier contient  des fonctions utilitaires qui peuvent être utilisées à plusieurs endroits dans le projet. 
    - le répertoire `Views`: où sont stockées les vues, qui sont responsables de l'affichage des données et de l'interface utilisateur.
    - le fichier `index.php`: ce fichier orchestre le flux de contrôle de l'application, dirigeant les requêtes HTTP vers les contrôleurs appropriés pour le traitement.

- **/SQL** Dans ce répertoire vous retrouverez : 
    - le répertoire `Modeles_entite-association` : où se trouve le modèle entite association utilisé pour la base de données du site intranet.
    - le fichier `fonctions.sql`: où se trouve une fonction sql pour donner un grade selon le département auquel 
    - le fichier `SAE.sql`: où se trouve le script de la base de données utilisé 
    - le fichier `Trigger.sql`:  fichier contenant des déclencheurs (éxécute ensemble d'instruction après un événement)

A titre informatif les fichiers `.DS_Store` sont inutiles, c’est des résidu de macOS

## Fonctionnalités du site intranet
Cette section vous guidera à travers les différentes fonctionnalités du site intranet.

### Utilisation
1. L'identifiant 123 avec le mot de passe `Topaze` est un administrateur et a tous les droits.
2. L'identifiant 14 avec le mot de passe `Topaze` est un enseignant et ne possède pas tout les droits.

### Auteurs
L'outil a été développé par le groupe scolaire 'Di Evoluzion' composé de Thibaud BOULANGE, Camélia ANTOINE, Sophie DONG, Agash Anandasangar et Pauline VU
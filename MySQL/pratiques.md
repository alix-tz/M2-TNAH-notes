DROP DATABASE IF EXISTS universite;

CREATE DATABASE universite;

SHOW DATABASES;

USE universite;

SOURCE ./wsql2/universite.sql;
//(chemin pour Aurélia : ./Téléchargements/Meszaros/wsql2/universite.sql;)

SHOW TABLES;

SELECT * FROM etudiant;

INSERT INTO etudiant
(nom, prenom, telephone, adresse, code_postal, ville, pays, date_de_naissance)
VALUES
('Dan', 'Spencer', '4133645612', 'Ma maison', '12345', 'Dijon', 'France', '1962-01-14'),
('Thomas', 'Thoumias', '3235645645', '3 rue Rue', '12345', 'Paris', 'France', '1972-03-10');

//(remarque : si on veut vérifier les paramètres de la table, on peut utiliser DESCRIBE)
//(remarque : si num_etudiant n'est pas auto_increment, il faut l'ajouter à la main. )

ALTER TABLE etudiant ADD cours1 INT DEFAULT NULL;

ALTER TABLE etudiant ADD cours2 INT DEFAULT NULL;

ALTER TABLE etudiant ADD cours3 INT DEFAULT NULL;

ALTER TABLE etudiant ADD cours4 INT DEFAULT NULL;

UPDATE etudiant SET cours1=12, cours2=10, cours3=9, cours4=18 WHERE num_etudiant=1;
//(explication : on ajoute des valeurs en se rapportant à l'id)

UPDATE etudiant SET cours1=10, cours2=12, cours3=8, cours4=15 WHERE num_etudiant=2;
// etc...

-----

DROP DATABASE IF EXISTS marathon;

CREATE DATABASE marathon;

SHOW DATABASES;

USE marathon;

SOURCE ./wsql2/marathon.sql;

SHOW TABLES;

SELECT * FROM coureur;

SELECT * FROM coureur_resultats;

----

Devoir à faire :
- analyser le modèle de base de données.
- expliciter les choix, expliquer à quoi sert cette base de données.
- faire le dictionnaire pour la BDD à laquelle correspond le modèle (type de données, paramètres, etc).

# MySQL

Tous les éléments de la vie courante peuvent être recensés de manière systémique et donc modélisés.

## SGBD : système de gestion de base de données
C'est une manière de stocker des données de manières industrielle (en réponse à une besoin exprimé). La création d'une SGBD a pour objectif la séparation de données et des programmes. La multiplication des fichiers entraînait la redondance des données, ce qui rendait difficile les mises à jour.  

__Données -> informations -> connaissance__
- Une donnée est un fait, quelque chose qui a été extrait d'une réalité.
- L'information est une formalisation des données : on commence à apprendre quelque chose grâce à ces données, notamment par leur contextualisation.
- La mise en commun des informations, construisent une connaissance, un savoir.

Les bases de données sont la première étape de cette construction. Elles doivent être entretenues : on parle d'__intégration__ et de __partage__ de données. Il y a plusieurs manières de figurer l'intégration.
- __données intégrées :__ base de données vue comme l'unification de plusieurs fichiers  
- __données partagées :__ base de données partagées entre plusieurs utilisateurs  

__définition simple :__ une base de données est un ensemble structuré de données apparentées qui modélisent un univers réel.

---
### Plusieurs systèmes
- système propriétaire : Oracle Database, Microsoft SQL Server, DB2, maxBD, 4D, dBase, Informix, Sybase  
- système libre : MySQL, PostgreSQL, MariaDB, Firebird, Ingres, HSQLDB, Derby  
- orienté objet : ZOBD, db4o  
- embarqué : SQLite, Berkeley DB  
- NoSQL : Cassandra, etc.  
- ...

---
Il y a plusieurs générations de bases de données :
#### Première génération (1950-1965)
- SGF (Système de Gestion de Fichiers) : permettent de stocjer et d'organiser les données sur une mémoire secondaire. L'organisation pouvait être séquentielle, séquentielle triée, etc.

##### 1956 : Disques Durs
L'invention des disques durs a doté les ordinateurs de mémoire de masse de grande capacité. Cette invention a permis d'utiliser les ordinateurs pour collecter, classer et stocker de grandes quantités d'informations de façon plus souple et plus performante que le support antérieur : la bande magnétique.
##### 1964 : Database
Apparition du terme de database (...)

#### Deuxième génération (1965-1970)
SGBD navigationel : permet de se déplacer plus librement et différement entre les éléments. IMS : système hiérarchique. Codasyl et IDS2 : ajout de réseaux qui permettent de préciser la navigation.  
Ces bases de données ont pour principe de relier les données provenant de différents fichiers. Elles utilisent notamment en système de pointeur (qui sont des liens physiques entre les enregistrements informatiques).  
Le programme IMS (d'IBM) a été mis en service en 1956 pour le programme Apollo. Les informations étaient alors découpées en deux niveaux de hiérarchie. (cf diapo pour la suite).

##### 1968 : théorie des ensemble
Elle est développée par D. L. Childs : il établit trois notions "ensemblistes" :  
- sélection
- relation
- regroupement  
Ces trois notions donnent naissance à SQL.

#### Troisième génération (1969-...)
__SGBD relationnel__ (DB2, Oracle, Informix, MsAccess): Le principe est l'usage de langage asssertionnels où on pose la question "quoi" au lieu de "comment".  
__SQL :__ le langage de définition de base de données, ou de manipulation.  

Il existe deux types de langage de manipulation des BD relationnelles :
- les langages procédureaux : une requête s'exprime au travers d'un enchaînement d'opérations [\#procédurale](https://fr.wikipedia.org/wiki/Programmation_proc%C3%A9durale)
- les langages assertionnels : une requête contient ... (cf diapo) [\#assertion](https://fr.wikipedia.org/wiki/Assertion)

##### 1968 : Création de Pick
Pick est créé par Dick Pick. Il s'agit d'un système d'exploitation contenant un système de gestion de base de données multivaluée (SGBDR MV)

##### 1974 : SEQUEL
SEQUEL : A Structured English QUery Language : mis au point par Donal D Chamberlin et Raymond Ray Boyce. Renommé ultérieurement SQL.
Prototype SYSTEM/R.

##### 1975 :modèle entité-association
(...)

##### 1979 : Oracle
Larry Ellison crée la société Oracle dans le cadre d'un travail réalisé pour la CIA. Software Development Laboratory. Cette société commercialise le premier SGBD relationnel (écrit en C/assembleur). Ce que révèle ce nom : c'est qu'on pense que la quantité de données pourrait prédire certains "faits", certains éléments à venir. Cette tendance est toujours aussi forte aujourd'hui.

---
### Le Schéma Relationnel
- __modèle hiérarchique :__ la navigation peut uniquement se faire vers le haut ou vers le bas.
- __modèle réseau :__ la manière de se déplacer dans le système n'est pas uniquement ascendant, mais peut aussi être "latéral".
- __modèle relationnel :__ c'est un schéma logique qui associe différents blocs de données. Une relation est un sous-ensemble du produit cartésien [*En mathématiques, le produit cartésien de deux ensembles X et Y, appelé ensemble-produit, est l'ensemble de tous les couples dont la première composante appartient à X et la seconde à Y.*] de différents domaines. Chaque élément de ce sous-ensemble est appelé n-uples. Pour identifier les différents domaines, il est possible de les nommer. Ce nom est appelé attribut.  
Les entités sont liées par des liens d'association.

Le schéma relationnel est l'ensemble des relations qui modélisent le monde réel. Les avantage du modèle relationnel : c'est plus facile à manier et à représenter (sous forme de tables). On ne s'occupe plus de comment les éléments sont stockées (indépendance physique) : on n'a plus à optimiser l'organisation physique des données. Concept de vues : on peut développer des représentations des données, un peu comme des photo, en fonction des paramètres que l'on veut intégrer : on construit une possibilité de représentation d'un ensemble des données. Maintien de l'intégrité : une contrainte d'intégrité est définie au niveau du schéma pour éviter les aberrations.

##### Définitions
- relation : (...)  
- association : (...)  

[cf diapo]

---

### Base de données et internet
Gestion de données :  
- structurées  
- semi-structurées  
- hiérarchisées  
- réparties  

cf [\#OWL : Web Ontology Language](https://fr.wikipedia.org/wiki/Web_Ontology_Language)

#### Base de données et Big Data
Big data : données massives provenant du Web.  
2 aspects :
- gestion des données (SQL3, NoSQL, SPARQL)
- analyse des données

Le but du Big Data c'est d'accéder en temps réel à des bases de données massives. Il y a plusieurs difficultés qui se posent :  
- la rapidité (vélocité)
- la variété
- le volume  

Il n'est pas facile de construire une base de données évolutive qui répondent à ces trois contraintes. Une base de données qui ne prend pas en compte ces questions n'est pas une bonne base de données.

[\#*diapo*  
__le domaine des BD est vaste :__ chaque élément de la liste peut correspondre à un métier différent, regarder ce à quoi ils font référence. Dans le cadre du cours, on ne va toucher qu'à quelques aspects de cette liste]

---

## Cours 2


Les bases de données se composent de 4 éléments essentiels :
1. données
2. matériel
3. logiciel
4. utilisateurs

Il y a trois types d'utilisateurs
- l'administrateur (qui gère qui peut accéder à une BDD et comment)
- les utilisateurs finaux (gestion du fonctionnement de la base)
- les programmeurs d'applications


Il y a plusieurs types de données
- données persistantes (celles qui sont enregistrées sur un disque dur dans une base de donnée. Pour pouvoir les changer, il faut directement s'adresser à ces données là.)
- données relatives / volatiles

Une entité signifie n'importe quel élément concret. Tout objet perceptible représenté dans la BDD
Une association est une relation entre les entités.

SQL est un langage de type ensembliste mais qui inclut des opérations qui permettent de réduire le nombre de données manipulées verticalement ou horizontalement. Cette selection s'appelle une **projection**.  

* La `projection` permet la réduction verticale par diminution du nombre d'attributs manipulés.
* La `sélection` permet la réduction horizontale par diminution du nombre de n-uples manipulés.

SQL se décline sous la forme de deux langages
- `LDD` (langage de manipulation de données)
- `LMD` (langage de définition de données)
- + `LID` (langage d'interrogation de données)

### Objectifs du SGBD
- contrôler les données :
  - intégrité : (vérification de contraintes d'intégrités)
  - (...)

(...)

Pour notre formation, on se trouve plutôt du côté logique de la base de données et pas du côté physique.

### ACID
Atomisation
Cohérence
Isolation
Durabilité


[...]

---

`Les dictionnaires de données` : une collection de métadonnées ou de données de référence nécessaire à la conception d'une base de données relationnelle. Il a une importance stratégique car il est le vocabulaire commun de l'organisation et il décrit des données aussi importantes que les clients, les nomenclatures de produits et de services, les annuaires, etc.
C'est le référentiel principal de l'entreprise, sur lequel s'appuient les décisions de celle-ci. Il est souvent représenté par un tableau à quatre colonnes contenant le nom, le code, et le type de données ainsi que des commentaires.  

Tous les noms doivent être monovalués et non décomposables.

Il existe trois grands types de champs de données :
- numériques (tinyint ; smallint ; mediumint ; int ; bigint ; float : double ; real -> prennent des tailles différentes (1 octet, 2 octets, etc) avec à chaque fois des limites hautes et basses pour ce que ces entiers peuvent contenir : etc tinyint peut aller de -128 à 127 ou de 0 à 255).
- chaines de caractères (char ; varchar (1 à 255 caractères) ; tinyblob ; tinytext ; blob ; etc)
- date et heure (date ; datetime ; time ; year ; timestamp)

-----

### Cours 3

dictionnaires
======
Il faut un dictionnaire par table (?). Il donne la liste des éléments attendus dans la table avec des paramètres. Il précise donc le type de variables/valeur attendues, leur longueur, et précise des paramètres d'auto incrémentation, ou NOT NULL pour signaler que le champs doit absolument être rempli.

entités
======
Il est difficile de donner une définition très précise des entités.  
Une entité = tout objet identifiable et pertinent pour l'application.  
Certains comprennent l'entité comme la table, d'autre comme la ligne dans la table.  
D'une manière générale, il vaut mieux avoir des tables courtes, mieux optimisées, plutôt que des tables longues.

attributs
======
Les entités sont caractérisées par des *propriétés* : titre, noms, date de naissance, adresse, etc.  
Il faut se demander si certaines informations sont nécessaires pour le fonctionnement de la base. Par exemple, pour une table de personne, on pourrait vouloir mettre l'age, mais ça n'est utile que si c'est lié à un usage (ex: restriction de services en fonction de l'age, etc).

- les attributs multivalués sont constitué d'un *ensemble* de valeurs prises dans un même domaine. Une telle construction permet de résoudre le problème des numéros de téléphones multiples.
- les attributs composés sont constitués par agrégation d'autres attributs : (...)
- un attribut atomique prend une valeur et une seule : c'est l'idéal. On peut recréer des attributs plus complexes par la concaténation d'attributs atomiques, c'est pour ça qu'on n'a pas forcément besoin d'attributs multivalués ou d'attributs composés (qu'il vaut mieux rassembler dans une table à part s'ils sont multiples, au lieu de les garder dans la table où ils sont multiples)

Associations
======
Elles permettent de rattacher les tables entre elles. Les cardinalités permettent de préciser la nature des interaction entre deux 2 (1,1 ; 0,1 ; 0; N ; etc) : c'est-à-dire combien de ces interactions sont possibles et dans quel sens. Il faut faire attention à ces cardinalités et à ce qu'elles impliques plus tard.

MCD -> MLD -> SQL
======
On élabore un dictionnaire pour les tables. On connecte les tables. On peut ensuite créer un modèle de relations. Ensuite, on peut passer à MySQL puisqu'on a un modèle clair.

Les clefs
======
A définir :
- clef étrangère (Foreign_key)
- clef primaire (primary_key)

### Manipulations
`mysql -u root -p` (puis password [root ici c'est le nom de l'utilisateur]  
`CREATE USER "nom"@"localhost" IDENTIFIED BY "mot-de-passe";`  
On peut créer plusieurs utilisateurs. Attention à ne pas noter n'importe où les mots-de-passe !  

`GRANT [permission type] ON "base"."table" TO "nom de la personne"@"localhost";`  
On peut mettre : `GRANT ALL PRIVILEGES ON *. * TO 'nom'@'localhost';` -> les * permettent de dire "sur toutes les bases. sur toutes les tables". On peut ajouter "WITH GRANT OPTION"  

`FLUSH PRIVILEGES` : permet d'activer ce qui vient d'être inscrit.  

SELECT User, Host, Password FROM mysql.user;  

`exit` permet de quiter MySQL. Ensuite on se reconnecte avec le nom de l'utilisateur qu'on a créé auquel on a donné tous les droits.  

PRIVILEGES :
======
- GRANT CREATE, SELECT : peut créer des tables/bases/utilisateurs mais pas donner des droits, ni supprimer
- `REVOKE [permission type] ON [base].[table name] FROM 'nom_utilisateur'@'localhost';` : permet de révoquer des droits !
- `FLUSH PRIVILEGES;` pour activer ces modifications
- `DROP USER "nom_utilisateur"@"localhost"; `: permet de supprimer un utilisateur

AUTRES COMMANDES :
======
- SELECT USER();
- SELECT CURRENT_USER();
- SELECT database();
- status;
- SELECT DISTINCT User FROM mysql.user; : affiche la liste en ommettant les doublons


CREATION d'UNE BASE DE DONNEES :
=======
- `CREATE DATABASE nom_de_la_base;`
- `SHOW DATABASES;`
- `USE nom_de_la_base;`
- `CREATE TABLE client (cl_id int not null auto_increment, cl_nom varchar(20) not null, cl_prenom varchar(20) not null, cl_naissance date, cl_ville varchar(20) not null, cl_nbr_achats int, PRIMARY KEY (cl_id))ENGINE=InnoDB;` : il ne faut vraiment pas oublier le `;` à la fin. On peut retourner à la ligne autant qu'on veut, c'est le `;` qui signale la fin de la ligne de commande. Sauter des lignes permet plus de lisibilité. Exemple :
```
CREATE TABLE clients (
  cl_id int not null auto_increment,
  cl_nom varchar(20) not null,
  cl_prenom varchar(20) not null,
  cl_naissance date,
  cl_ville varchar(20) not null,
  cl_nbr_achats int,
  PRIMARY KEY (cl_id)
  )ENGINE=InnoDB;
```
- `SHOW TABLES;` ou `DESCRIBE clients;` :

AJOUTER DES DONNEES :
======
- `INSERT INTO clients (cl_nom, cl_prenom, cl_naissance, cl_ville, cl_nbr_achats) VALUES ('Repa', 'Jan', '1974-03-03', 'Bratislava', 23),('Doom', 'Thomas', '1985-12-12', 'Trnava', NULL);` : ajoute 2 lignes.
- `SELECT * FROM client;` : permet d'afficher ce qu'il y a dans la base

---

# interrogations simples

- requête de sélection : `select`
- éviter les doublon : `distinct`
- renommer une colonne : `as`
- trier les résultats : `order by`
- limiter le nombre de lignes de résultats : `top`/`limit`
- restreindre les résultats : `where`
  - comparaison de chaine : `like`
  - comparaison à une liste : `in`
  - intervalle : `between`
  - `and` et `or`

## composition d'une requête complète :  
1. `select <champ1>, <champ2>, ...`
2. `from <table>`
3. `where <condition>`
4. (`group by <champ1, <champ2>, ...`)
5. `having <conditions>`
6. `order by <champ1>, <champ2>, ...`
7. `limit;`  

**select** co_nom, co_prenom, co_naissance **from** coureur;  
-> permet de n'afficher que les colonnes CO_NOM, CO_PRENOM et CO_NAISSANCE de la table COUREUR.  

**select** distinct from COUREUR_RESULTAT;  
DISTINCT permet d'éviter les redondances de lignes dans les résultats de la requête.  

select *[champ]* AS *[champ_nouv]* FROM nom_table ORDER BY colonne ASC;  
- ASC : ordre ascendant (valeur par défault).  
- DESC : ordre descendant  

*champ* est le nom de la colonne dans la base, *champ_nouv* est le nom de la colonne que l'on veut afficher à la place du vrai nom.  
> select CO_NOM as 'NOM', CO_PRENOM as 'PRENOM' from COUREUR order by CO_NOM ASC;

Deux manières de limiter le nombre de résultats en fonction du système de bdd. LIMIT c'est notamment pour mysql et Oracle :  
SELECT TOP *[nombre]* *[champ1]*, *[champ2]* (,...) FROM *[table]*;   
SELECT *[champ1]*, *[champ2]* FROM *[table]* LIMIT *[nombre]*;
> select CO_NOM, CO_PRENOM from COUREUR order by CO_PRENOM limit 5;  

select *[champ1]*, *[champ2]*, ... from *[table]* limit *[nombre]* offset *[nombre]*;  
> permet de limiter le nombre de résultats à 5, mais en partant d'un rang donné.

Avec SELECT on choisit les colonne; avec WHERE on choisit les lignes.  
WHERE utilise des opérateurs :
- `=` : égal,
- `>`, `<`, `>=`, `<=` : plus petit, plus grand ou plus petit ou égal, etc,
- `<>`/`!=` : différent,
- `<=>` : y compris les valeurs nulles ?

Il y a aussi d'autres opérateurs possibles (conditions) :
- [not]in
- [not]between
- [not]like
- is null
- is not null
- and et or


SELECT *[champ1]*, *[champ2]*, ... from *[table]* where *[champ1]* like 'K%';
- `%` représente n'importe quelle chaine de caractères, quelle que soit sa longueur (y compris 0).
- `_` représente un seul caractère

> select CO_NOM, CO_PRENOM, CO_NAISSANCE from COUREUR WHERE CO_PRENOM in('Cédric', 'Etienne', 'Richard');

> select CO_NOM, CO_PRENOM from COUREUR where CO_NAISSANCE between '1940-03-01' AND '1960-12-31';

> select CO_NOM, CO_PRENOM from COUREUR where year(CO_NAISSANCE) between '1940' AND '1960'; -> comme les dates sont codifiées en MySQL, il comprend la date.

> select CO_NOM, CO_PRENOM from COUREUR where CO_NOM like '%a%' year(CO_NAISSANCE) between '1940' AND '1960';

-> par défaut, certaines bases de données comprennent l'enchaînement des deux condition comme "OR" sur certaines bases. Dans mysql on est obligé de préciser le connecteur.

A propos des connecteurs : `AND` a toujours la priorité sur `OR`. Globalement, il vaut mieux utiliser les `()`.

---

> select CO_NOM, CO_PRENOM if (CO_SEXE = 1, "Homme", "Femme") as "SEXE"

-> sélectionne les éléments co_nom et co_prenom en changer la valeur des cellule de la colonne co_sexe en "Homme", si elle vaut 1, et en "Femme" dans les autres cas, tout en affichant la colonne sous le nom "SEXE".  

Exercices
====
> select CL_NOM from CLUB where (CL_VILLE like "Bordeaux") order by CL_NOM;

> select IN_TEMP_EFFECTUE from COUREUR_RESULTAT where (CO_NOM like 'Aldrin');

**compter / afficher le nombre d'occurence du résultat d'une requête**  
> select CO_NOM, count(CO_NOM) from COUREUR_RESULTAT group by CO_NOM;

> select COUREUR.CO_NOM AS "nom", COUREUR.CO_PRENOM as "prenom", count(COUREUR_RESULTAT.CO_NOM) as "epreuves" from COUREUR, COUREUR_RESULTAT where COUREUR_RESULTAT.CO_NOM = "Aldrin";

-> restreint le nombre de résultat en croisant deux tables.  


- **Afficher le nom, prénom et date de naissance des 4 coureurs hommes les plus jeunes :**  
> select CO_NOM as "Nom", CO_PRENOM as "Prénom", CO_NAISSANCE as "Date de naissance" from COUREUR where CO_SEXE = 1 order by CO_NAISSANCE DESC limit 4;

- **Afficher les noms et prénoms des coureurs dont le nom contient un "o" :**
> select CO_NOM as "Nom", CO_PRENOM as "Prénom", CO_NAISSANCE as "Date de naissance" from COUREUR where CO_SEXE = 1 order by CO_NAISSANCE DESC limit 4;

- **Afficher le nom, prénom et date de naissance des femmes nées entre le 15/06/1920 et le 18/10/1950 :**
> select CO_NOM as "nom", CO_PRENOM as "prénom", CO_NAISSANCE as "date de naissance" from COUREUR  where CO_NAISSANCE between "1922-06-15" and "1950-10-18" AND CO_SEXE = 2 order by CO_NAISSANCE ASC;

- **Afficher les villes où se trouvent des clubs :**
> select distinct CL_VILLE from CLUB;

- **Lister les heures de départ des épreuves qui se sont déroulées en avril 2016 :**  
> select distinct EP_HEURE from EPREUVE where EP_DATE like "2016-04-%";  
> OU  
> select EP_HEURE as "Heure de départ" from EPREUVE where EP_DATE between "2016-03-31"and "2016-05-01";

- **Afficher le nom de la catégorie d'un coureur agé de 21 ans :**
> select distinct CA_LIBELLE from CATEGORIE_AGE where CA_AGEDEB < 21 and CA_AGEFIN > 21;

- **Afficher le nom et la date de naissance des coureurs dont le prénom commence par un S ou un B et dont le nom contient un w :**
> select CO_NOM, CO_NAISSANCE from COUREUR where (CO_PRENOM like "S%" or CO_PRENOM like "B%") and CO_NOM like "%w%";

- **is null** ou **is not null** : permet de cibler un élément vide ou n'est pas vide

## Utilisation de MySQL Workbench

## Exercice SELECT BDD (aerien)
Les fonctions agrégatives disponibles sont généralement les suivantes :
- SUM() somme,
- AVG() moyenne arithmétique,
- COUNT() nombre ou cardinalité,
- MAX() valeur maximale,
- MIN() valeur minimale,
- STDDEV() écart type,
- VARIANCE() variance

- ROUND() permet d'arrondir un élément. On donne en premier argument ce qu'il faut arrondir et ensuite éventuellement des paramètres (ex ,2 pour 2 chiffres après la virgule). On peut emboîter des fonctions.

## Exercices Base de données à partir d'un cas de figure
Simulation d'une situation où on doit faire une bdd puisqu'on part normalement d'un cahier des charges qui évoque d'abord le contexte, puis liste les contraintes. On définit donc les éléments de la BDD, les entités, et les relations (donc aussi, et c'est très important, les cardinalités).

### Salle de cinema
```
[SALLE_CINEMA:  
- nom_salle  
- adresse ]  
   |  
   | [0,1]  
   |  
[Projection / heure]
   |  
   | [0, n]  
   |  
[FILM:  
- visa  
- titre  
- realisateur  
- année_sortie ]  
   |  
   | [0, n]  
   |  
[Appreciation / impression]
   |  
   | [0, n]  
   |  
[SPECTATEUR:  
- numero  
- nom  
- prenom  
- adresse  
- date_naissance  
- cat_prp ]  
```

Groupement d'achat & banque  
```
cf. cahier
```

## Contraintes d'intégrité

Comment passer d'une traduction en schéma à une schéma relationnel et ensuite à des tables.  
Les contraintes d'intégrité sont des expressions logiques qui doivent être vraies à tout moment dans une base. On les traduit par des cardinalités.  
- contrainte de domaine (les valeurs que peuvent avoir un attribut ; TINYINT, TEXT, etc)
- contrainte de clef (ex deux éléments d'une table ne peuvent pas avoir la même valeur ; PRIMARY_KEY)
- contrainte obligatoire (par ex une colonne doit toujours avoir une variable ; NOT NULL)
- etc.
- contrainte d'intégrité référentielle (aussi appelée contrainte d'inclusion ; conditionne par exemple l'enregistrement d'une commande par la présence d'un client ; cf. cardinalité).
- contraintes transactionnelle
Ces contraintes permettent de contrôler la cohérence des données et permettent la vérification systématique par le SGBD.  

Les contraintes d'intégrité sont souvent mises sur le même niveau que les **dépendances fonctionnelles** (DF). Ce sont des propriétés définies sur le schéma. Une dépendance fonctionnelle est un cas particulier. Ex : A implique B ; ou B n'existe pas sans A. On écrit : A -> B. Un élément peut être fonctionnellement dépendant de plusieurs autres éléments.  
Les **liens relationnels** entre les données sont exprimés à travers plusieurs entités :
- domaine (ensemble des valeur qu'un attribut peut prendre)
- relation (un sous-ensemble d'un produit cartésien entre plusieurs entités)
- attribut (représente le nom de valeur d'un domaine utilisé)
- schéma de relation (le nom de la relation avec l'ensemble d'attributs qui la définissent)
- clé (attribut ou ensemble d'attributs qui permet d'identifier les éléments d'une relation)

La **normalisation** désigne un type particulier de la relation entre les entités qui est définie via plusieurs formes normales qu'une relation peut avoir. Elle sert à minimiser les anomalies transactionnelles qui peuvent provoquer différentes autres anomalies comme celle de lecture, d'écriture, de redondance et de la contre performance. La normalisation des données vérifie la robustesse de la conception du modèle, améliore le traitement des données en minimisant la redondance et les problèmes avec la mise à jour et avec la cohérence.  

-> [https://fr.wikipedia.org/wiki/Forme_normale_(bases_de_donn%C3%A9es_relationnelles)](https://fr.wikipedia.org/wiki/Forme_normale_(bases_de_donn%C3%A9es_relationnelles))
Il existe plusieurs types de dépendances :
- fonctionnelles
- multivaluées
- de jointure
- hiérarchique
- hiérarchique de jointures

On se concentre sur les dépendances fonctionnelles.  
`1FN, 2FN, 3FN, FNBC, 4FN, 5FN, ...`. 1FN, 2FN et 3FN sont des dépendances fonctionnelles. On ne va pas souvent plus loin pour des projets simples, et on n'ira pas plus loin dans le cadre de ce cours.   

La normalisation sert surtout à rendre une base de donnée robuste, quelque chose dont toutes les contraintes ont été maîtrisées. Mais il ne faut pas non plus qu'elle empêche la base de données de fonctionner. Trop de contraintes peu devenir une contrainte en elle-même. La normalisation rajoute des calculs et ralenti les performances de la base. C'est pourquoi on adapte le niveau de normalisation aux besoins.

`OLTP : online transaction processing :` des types de bases de données pour lesquels la normalisation doit aller à un stade très avancé, au moins le 5e.
`OLAP : online analytical processing :` ces tales sont avant tout lues (pas écrites), on n'a donc pas besoin d'avoir une normalisation trop rigide. NoSQL par exemple ne prend presque pas en compte la normalisation.  

## Jointure
Select ne vise qu'une seule table.  
Les jointures permettent de piocher les données dans plusieurs tables et de les agréger. Les jointures complexifie la fouille de la base.  

une relation en 1FN est une relation dont les attributs possèdent tous un valeur sémantiquement atomique. Donc un attribut est dit atomique si aucune subdivision de l'information initiale n'apporte une information supplémentaire ou complémentaire. On devrait dire "minimale" plutôt qu'atomique.  

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

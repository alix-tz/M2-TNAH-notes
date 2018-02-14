# MySQL-Front Dump 2.5
#
# Host: localhost   Database: bd_film
# --------------------------------------------------------
# Server version 4.1.15-nt

DROP DATABASE IF EXISTS film;

CREATE DATABASE film;

USE film;

#
# Table structure for table 'acteur'
#

DROP TABLE IF EXISTS acteur;
CREATE TABLE acteur (
  numActeur int(10) unsigned NOT NULL auto_increment,
  nom varchar(255) default NULL,
  PRIMARY KEY  (numActeur),
  UNIQUE KEY numActeur (numActeur),
  KEY numActeur_2 (numActeur,nom)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



#
# Dumping data for table 'acteur'
#

INSERT INTO acteur (numActeur, nom) VALUES("1", "Gérard Depardieu");
INSERT INTO acteur (numActeur, nom) VALUES("2", "Anne Brochet");
INSERT INTO acteur (numActeur, nom) VALUES("3", "Jean Réno");
INSERT INTO acteur (numActeur, nom) VALUES("4", "Christian Clavier");
INSERT INTO acteur (numActeur, nom) VALUES("5", "Valérie Lemercier");
INSERT INTO acteur (numActeur, nom) VALUES("6", "Vincent Perez");


#
# Table structure for table 'film'
#

DROP TABLE IF EXISTS film;
CREATE TABLE film (
  numFilm int(10) unsigned NOT NULL auto_increment,
  nom varchar(255) default NULL,
  annee year(4) default NULL,
  PRIMARY KEY  (numFilm),
  UNIQUE KEY numFilm (numFilm),
  KEY numFilm_2 (numFilm,nom,annee)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



#
# Dumping data for table 'film'
#

INSERT INTO film (numFilm, nom, annee) VALUES("1", "Cyrano de Bergerac", "1990");
INSERT INTO film (numFilm, nom, annee) VALUES("2", "Tais-toi", "2002");
INSERT INTO film (numFilm, nom, annee) VALUES("3", "Les visiteurs", "1993");
INSERT INTO film (numFilm, nom, annee) VALUES("4", "Les visiteurs 2, les couloirs du temps", "1998");


#
# Table structure for table 'jouer'
#

DROP TABLE IF EXISTS jouer;
CREATE TABLE jouer (
  numJouer int(10) unsigned NOT NULL auto_increment,
  numActeur int(10) unsigned default NULL,
  numFilm int(10) unsigned default NULL,
  numRole int(10) unsigned default NULL,
  PRIMARY KEY  (numJouer),
  UNIQUE KEY numJouer (numJouer),
  KEY numJouer_2 (numJouer,numActeur,numFilm,numRole)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



#
# Dumping data for table 'jouer'
#

INSERT INTO jouer (numJouer, numActeur, numFilm, numRole) VALUES("1", "1", "1", "1");
INSERT INTO jouer (numJouer, numActeur, numFilm, numRole) VALUES("2", "2", "1", "2");
INSERT INTO jouer (numJouer, numActeur, numFilm, numRole) VALUES("3", "3", "2", "3");
INSERT INTO jouer (numJouer, numActeur, numFilm, numRole) VALUES("4", "1", "2", "4");
INSERT INTO jouer (numJouer, numActeur, numFilm, numRole) VALUES("5", "3", "3", "5");
INSERT INTO jouer (numJouer, numActeur, numFilm, numRole) VALUES("6", "4", "3", "6");
INSERT INTO jouer (numJouer, numActeur, numFilm, numRole) VALUES("7", "5", "3", "7");
INSERT INTO jouer (numJouer, numActeur, numFilm, numRole) VALUES("8", "6", "1", "8");
INSERT INTO jouer (numJouer, numActeur, numFilm, numRole) VALUES("9", "4", "3", "9");
INSERT INTO jouer (numJouer, numActeur, numFilm, numRole) VALUES("10", "3", "4", "5");
INSERT INTO jouer (numJouer, numActeur, numFilm, numRole) VALUES("11", "4", "4", "6");
INSERT INTO jouer (numJouer, numActeur, numFilm, numRole) VALUES("12", "4", "4", "9");
INSERT INTO jouer (numJouer, numActeur, numFilm, numRole) VALUES("13", "5", "4", "7");


#
# Table structure for table 'role'
#

DROP TABLE IF EXISTS role;
CREATE TABLE role (
  numRole int(10) unsigned NOT NULL auto_increment,
  nom varchar(255) default NULL,
  PRIMARY KEY  (numRole),
  UNIQUE KEY numRole (numRole),
  KEY numRole_2 (numRole,nom)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



#
# Dumping data for table 'role'
#

INSERT INTO role (numRole, nom) VALUES("1", "Cyrano de Bergerac");
INSERT INTO role (numRole, nom) VALUES("2", "Roxane");
INSERT INTO role (numRole, nom) VALUES("3", "Ruby");
INSERT INTO role (numRole, nom) VALUES("4", "Quentin");
INSERT INTO role (numRole, nom) VALUES("5", "Godefroy de Montmirail");
INSERT INTO role (numRole, nom) VALUES("6", "Jacquouille la Fripouille");
INSERT INTO role (numRole, nom) VALUES("7", "Béatrice de Montmirail");
INSERT INTO role (numRole, nom) VALUES("8", "Christian de Neuvillette");
INSERT INTO role (numRole, nom) VALUES("9", "Jacquard");

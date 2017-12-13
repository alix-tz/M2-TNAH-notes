# MySQL-Front Dump 2.5
#
# Host: localhost   Database: bd_universite
# --------------------------------------------------------
# Server version 4.1.15-nt


#
# Table structure for table 'enseignant'
#

DROP TABLE IF EXISTS enseignant;
CREATE TABLE enseignant (
  num_enseignant int(11) NOT NULL auto_increment,
  nom varchar(50) default NULL,
  prenom varchar(50) default NULL,
  PRIMARY KEY  (num_enseignant)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



#
# Dumping data for table 'enseignant'
#

INSERT INTO enseignant (num_enseignant, nom, prenom) VALUES("1", "Anciel", "Marc");
INSERT INTO enseignant (num_enseignant, nom, prenom) VALUES("2", "Toroute", "Pédro");
INSERT INTO enseignant (num_enseignant, nom, prenom) VALUES("3", "Voisine", "Roch");


#
# Table structure for table 'etudiant'
#

DROP TABLE IF EXISTS etudiant;
CREATE TABLE etudiant (
  num_etudiant int(11) NOT NULL auto_increment,
  nom varchar(50) default NULL,
  prenom varchar(50) default NULL,
  telephone varchar(50) default NULL,
  adresse varchar(50) default NULL,
  code_postal varchar(50) default NULL,
  ville varchar(50) default NULL,
  pays varchar(50) default NULL,
  date_de_naissance date default NULL,
  PRIMARY KEY  (num_etudiant)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



#
# Dumping data for table 'etudiant'
#

INSERT INTO etudiant (num_etudiant, nom, prenom, telephone, adresse, code_postal, ville, pays, date_de_naissance) VALUES("1", "Tournesol", "Tryphon", "0123456789", "10, avenue", "59000", "Lille", "Guatemala", "1998-03-12");
INSERT INTO etudiant (num_etudiant, nom, prenom, telephone, adresse, code_postal, ville, pays, date_de_naissance) VALUES("2", "Calculus", "Cuthbert", "9876543210", "10, rue", "75001", "Paris", "Suisse", "1985-08-12");
INSERT INTO etudiant (num_etudiant, nom, prenom, telephone, adresse, code_postal, ville, pays, date_de_naissance) VALUES("3", "Clerc", "Julien", "456456456", "20, boulevard", "10000", "Troyes", "France", "1901-01-31");
INSERT INTO etudiant (num_etudiant, nom, prenom, telephone, adresse, code_postal, ville, pays, date_de_naissance) VALUES("4", "César", "Jules", "4145645645", "palais impérial", "12345", "Rome", "Empire romain", "1952-02-14");


#
# Table structure for table 'evaluation'
#

DROP TABLE IF EXISTS evaluation;
CREATE TABLE evaluation (
  num_evaluation int(11) NOT NULL auto_increment,
  type_evaluation varchar(50) default NULL,
  coefficient int(11) default NULL,
  date date default NULL,
  num_module int(11) default NULL,
  PRIMARY KEY  (num_evaluation)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



#
# Dumping data for table 'evaluation'
#

INSERT INTO evaluation (num_evaluation, type_evaluation, coefficient, date, num_module) VALUES("1", "TP", "1", "2005-04-03", "1");
INSERT INTO evaluation (num_evaluation, type_evaluation, coefficient, date, num_module) VALUES("2", "Examen final", "3", "2005-06-21", "1");


#
# Table structure for table 'inscription'
#

DROP TABLE IF EXISTS inscription;
CREATE TABLE inscription (
  num_etudiant int(11) NOT NULL default '0',
  num_module int(11) NOT NULL default '0',
  obtention tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (num_etudiant,num_module)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



#
# Dumping data for table 'inscription'
#

INSERT INTO inscription (num_etudiant, num_module, obtention) VALUES("1", "1", "0");
INSERT INTO inscription (num_etudiant, num_module, obtention) VALUES("1", "2", "0");
INSERT INTO inscription (num_etudiant, num_module, obtention) VALUES("1", "5", "0");
INSERT INTO inscription (num_etudiant, num_module, obtention) VALUES("2", "1", "0");
INSERT INTO inscription (num_etudiant, num_module, obtention) VALUES("2", "3", "0");
INSERT INTO inscription (num_etudiant, num_module, obtention) VALUES("3", "1", "0");
INSERT INTO inscription (num_etudiant, num_module, obtention) VALUES("3", "4", "0");
INSERT INTO inscription (num_etudiant, num_module, obtention) VALUES("4", "1", "0");
INSERT INTO inscription (num_etudiant, num_module, obtention) VALUES("4", "5", "0");


#
# Table structure for table 'module'
#

DROP TABLE IF EXISTS module;
CREATE TABLE module (
  num_module int(11) NOT NULL auto_increment,
  nom varchar(50) default NULL,
  description varchar(100) default NULL,
  num_enseignant int(11) default NULL,
  num_semestre int(11) default NULL,
  PRIMARY KEY  (num_module)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



#
# Dumping data for table 'module'
#

INSERT INTO module (num_module, nom, description, num_enseignant, num_semestre) VALUES("1", "Equitation", "bla bla…", "3", "1");
INSERT INTO module (num_module, nom, description, num_enseignant, num_semestre) VALUES("2", "Mécanique des fluides", NULL, "2", "1");
INSERT INTO module (num_module, nom, description, num_enseignant, num_semestre) VALUES("3", "Puissance Point", "le logiciel de présentation de PetitMou", "1", "1");
INSERT INTO module (num_module, nom, description, num_enseignant, num_semestre) VALUES("4", "Percussions japonaises (perfectionnement)", NULL, "3", "1");
INSERT INTO module (num_module, nom, description, num_enseignant, num_semestre) VALUES("5", "Droit du travail", NULL, "2", "2");


#
# Table structure for table 'note'
#

DROP TABLE IF EXISTS note;
CREATE TABLE note (
  num_note int(11) NOT NULL auto_increment,
  note int(11) default NULL,
  num_etudiant int(11) default NULL,
  num_evaluation int(11) default NULL,
  PRIMARY KEY  (num_note)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



#
# Dumping data for table 'note'
#

INSERT INTO note (num_note, note, num_etudiant, num_evaluation) VALUES("1", "5", "1", "1");
INSERT INTO note (num_note, note, num_etudiant, num_evaluation) VALUES("2", "10", "2", "1");
INSERT INTO note (num_note, note, num_etudiant, num_evaluation) VALUES("3", "15", "3", "1");
INSERT INTO note (num_note, note, num_etudiant, num_evaluation) VALUES("4", "20", "4", "1");
INSERT INTO note (num_note, note, num_etudiant, num_evaluation) VALUES("5", "10", "1", "2");
INSERT INTO note (num_note, note, num_etudiant, num_evaluation) VALUES("6", "12", "2", "2");
INSERT INTO note (num_note, note, num_etudiant, num_evaluation) VALUES("7", "6", "3", "2");
INSERT INTO note (num_note, note, num_etudiant, num_evaluation) VALUES("8", "3", "4", "2");


#
# Table structure for table 'semestre'
#

DROP TABLE IF EXISTS semestre;
CREATE TABLE semestre (
  num_semestre int(11) NOT NULL auto_increment,
  nom varchar(50) default NULL,
  date_debut date default NULL,
  date_fin date default NULL,
  PRIMARY KEY  (num_semestre)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



#
# Dumping data for table 'semestre'
#

INSERT INTO semestre (num_semestre, nom, date_debut, date_fin) VALUES("1", "S1", "2005-03-01", "2005-06-18");
INSERT INTO semestre (num_semestre, nom, date_debut, date_fin) VALUES("2", "S2", "1995-05-01", "1995-09-02");

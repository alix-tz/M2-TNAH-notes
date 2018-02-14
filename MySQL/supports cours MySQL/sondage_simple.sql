# MySQL-Front Dump 2.5
#
# Host: localhost   Database: bd_sondage_simple
# --------------------------------------------------------
# Server version 4.1.15-nt

DROP DATABASE IF EXISTS sondage;

CREATE DATABASE sondage;

USE sondage;
#
# Table structure for table 'age'
#

DROP TABLE IF EXISTS age;
CREATE TABLE age (
  age int(11) NOT NULL auto_increment,
  minimum int(11) default NULL,
  maximum int(11) default NULL,
  intitule varchar(50) default NULL,
  PRIMARY KEY  (age)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



#
# Dumping data for table 'age'
#

INSERT INTO age (age, minimum, maximum, intitule) VALUES("1", "0", "14", "De 0 à 14 ans");
INSERT INTO age (age, minimum, maximum, intitule) VALUES("2", "15", "24", "De 15 à 24 ans");
INSERT INTO age (age, minimum, maximum, intitule) VALUES("3", "25", "39", "De 25 à 39 ans");
INSERT INTO age (age, minimum, maximum, intitule) VALUES("4", "40", "64", "De 40 à 64 ans");
INSERT INTO age (age, minimum, maximum, intitule) VALUES("5", "65", "120", "65 ans et +");


#
# Table structure for table 'frequence'
#

DROP TABLE IF EXISTS frequence;
CREATE TABLE frequence (
  frequence int(11) NOT NULL auto_increment,
  intitule varchar(50) default NULL,
  valeur_numerique int(11) default NULL,
  PRIMARY KEY  (frequence)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



#
# Dumping data for table 'frequence'
#

INSERT INTO frequence (frequence, intitule, valeur_numerique) VALUES("1", "Jamais", "0");
INSERT INTO frequence (frequence, intitule, valeur_numerique) VALUES("2", "Occasionnellement", "1");
INSERT INTO frequence (frequence, intitule, valeur_numerique) VALUES("3", "Souvent", "2");
INSERT INTO frequence (frequence, intitule, valeur_numerique) VALUES("4", "Très souvent", "3");


#
# Table structure for table 'personne'
#

DROP TABLE IF EXISTS personne;
CREATE TABLE personne (
  personne int(11) NOT NULL auto_increment,
  age int(11) default NULL,
  sexe int(11) default NULL,
  internet int(11) default NULL,
  brossage_des_dents int(11) default NULL,
  bandes_dessinees int(11) default NULL,
  bananes int(11) default NULL,
  PRIMARY KEY  (personne)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



#
# Dumping data for table 'personne'
#

INSERT INTO personne (personne, age, sexe, internet, brossage_des_dents, bandes_dessinees, bananes) VALUES("1", "1", "1", "1", "2", "2", "3");
INSERT INTO personne (personne, age, sexe, internet, brossage_des_dents, bandes_dessinees, bananes) VALUES("2", "3", "1", "2", "3", "3", "3");
INSERT INTO personne (personne, age, sexe, internet, brossage_des_dents, bandes_dessinees, bananes) VALUES("3", "1", "2", "3", "3", "2", "3");
INSERT INTO personne (personne, age, sexe, internet, brossage_des_dents, bandes_dessinees, bananes) VALUES("4", "2", "2", "3", "4", "4", "2");
INSERT INTO personne (personne, age, sexe, internet, brossage_des_dents, bandes_dessinees, bananes) VALUES("5", "3", "2", "2", "4", "4", "1");
INSERT INTO personne (personne, age, sexe, internet, brossage_des_dents, bandes_dessinees, bananes) VALUES("6", "5", "2", "1", "4", "2", "3");
INSERT INTO personne (personne, age, sexe, internet, brossage_des_dents, bandes_dessinees, bananes) VALUES("7", "4", "1", "4", "2", "1", "4");
INSERT INTO personne (personne, age, sexe, internet, brossage_des_dents, bandes_dessinees, bananes) VALUES("8", "4", "2", "4", "1", "4", "1");
INSERT INTO personne (personne, age, sexe, internet, brossage_des_dents, bandes_dessinees, bananes) VALUES("9", "5", "1", "2", "1", "4", "2");
INSERT INTO personne (personne, age, sexe, internet, brossage_des_dents, bandes_dessinees, bananes) VALUES("10", "2", "1", "1", "1", "2", "4");


#
# Table structure for table 'sexe'
#

DROP TABLE IF EXISTS sexe;
CREATE TABLE sexe (
  sexe int(11) NOT NULL auto_increment,
  intitule varchar(50) default NULL,
  PRIMARY KEY  (sexe)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



#
# Dumping data for table 'sexe'
#

INSERT INTO sexe (sexe, intitule) VALUES("1", "Femme");
INSERT INTO sexe (sexe, intitule) VALUES("2", "Homme");

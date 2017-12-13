-- phpMyAdmin SQL Dump
-- version 3.3.7deb7
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Mer 15 Mars 2017 à 14:39
-- Version du serveur: 5.1.73
-- Version de PHP: 5.3.3-7+squeeze19

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `bddlivre`
--

-- --------------------------------------------------------

--
-- Structure de la table `ADHESION`
--

CREATE TABLE IF NOT EXISTS `ADHESION` (
  `AD_COUREUR_FK` int(11) NOT NULL,
  `AD_ANNEE` int(11) NOT NULL,
  `AD_LICENCE` varchar(50) NOT NULL,
  `AD_COTISATION` int(11) NOT NULL,
  `AD_CLUB_FK` int(11) NOT NULL,
  PRIMARY KEY (`AD_COUREUR_FK`,`AD_ANNEE`),
  KEY `FK_ADHESION_CO_ID_idx` (`AD_COUREUR_FK`),
  KEY `FK_ADHESION_CL_ID_idx` (`AD_CLUB_FK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ADHESION`
--

INSERT INTO `ADHESION` (`AD_COUREUR_FK`, `AD_ANNEE`, `AD_LICENCE`, `AD_COTISATION`, `AD_CLUB_FK`) VALUES
(1, 2015, '314156', 43, 1),
(3, 2015, '965214', 42, 1),
(4, 2013, '547264', 35, 2),
(5, 2013, '456387', 30, 1),
(5, 2014, '963685', 40, 1),
(5, 2015, '574259', 42, 1),
(6, 2015, '136874', 40, 3),
(7, 2014, '108781', 45, 4),
(9, 2013, '147268', 40, 3),
(9, 2014, '718593', 40, 3),
(9, 2015, '369751', 40, 3),
(10, 2016, '161803', 50, 5),
(11, 2014, '125638', 40, 1),
(11, 2015, '329874', 42, 1),
(12, 2015, '532789', 40, 3),
(13, 2015, '568974', 42, 1),
(14, 2015, '965874', 48, 4),
(15, 2015, '145268', 40, 3),
(16, 2014, '745369', 45, 4),
(17, 2013, '963147', 35, 2),
(17, 2014, '987088', 30, 4);

-- --------------------------------------------------------

--
-- Structure de la table `CATEGORIE_AGE`
--

CREATE TABLE IF NOT EXISTS `CATEGORIE_AGE` (
  `CA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CA_LIBELLE` text NOT NULL,
  `CA_AGEDEB` int(11) NOT NULL,
  `CA_AGEFIN` int(11) NOT NULL,
  PRIMARY KEY (`CA_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `CATEGORIE_AGE`
--

INSERT INTO `CATEGORIE_AGE` (`CA_ID`, `CA_LIBELLE`, `CA_AGEDEB`, `CA_AGEFIN`) VALUES
(1, 'Masters', 40, 99),
(2, 'Seniors', 23, 39),
(3, 'Espoirs', 20, 22),
(4, 'Juniors', 18, 19),
(5, 'Cadets', 16, 17),
(6, 'Minimes', 14, 15),
(7, 'Benjamins', 12, 13),
(8, 'Poussins', 10, 11);

-- --------------------------------------------------------

--
-- Structure de la table `CHAMPIONNAT`
--

CREATE TABLE IF NOT EXISTS `CHAMPIONNAT` (
  `CH_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CH_NOM` varchar(100) NOT NULL,
  `CH_DATEDEB` date NOT NULL,
  `CH_DATEFIN` date NOT NULL,
  PRIMARY KEY (`CH_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `CHAMPIONNAT`
--

INSERT INTO `CHAMPIONNAT` (`CH_ID`, `CH_NOM`, `CH_DATEDEB`, `CH_DATEFIN`) VALUES
(1, 'Les marathons de la côte', '2016-04-01', '2016-10-31'),
(2, 'Championnat de France', '2016-01-01', '2016-12-01');

-- --------------------------------------------------------

--
-- Structure de la table `CLUB`
--

CREATE TABLE IF NOT EXISTS `CLUB` (
  `CL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CL_NOM` text NOT NULL,
  `CL_VILLE` text NOT NULL,
  PRIMARY KEY (`CL_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `CLUB`
--

INSERT INTO `CLUB` (`CL_ID`, `CL_NOM`, `CL_VILLE`) VALUES
(1, 'La foulée bordelaise', 'Bordeaux'),
(2, 'Union Athlétique du médoc', 'Paulliac'),
(3, 'La foulée arcachonnaise', 'Arcachon'),
(4, 'Les coureurs du bassin', 'Lège'),
(5, 'Les scientifiques font du sport', 'Bordeaux'),
(6, 'Les coureurs de la dune', 'Lège'),
(7, 'Les galopins de guyenne', 'Soulac sur Mer');

-- --------------------------------------------------------

--
-- Structure de la table `COUREUR`
--

CREATE TABLE IF NOT EXISTS `COUREUR` (
  `CO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CO_NOM` varchar(100) NOT NULL,
  `CO_PRENOM` varchar(100) NOT NULL,
  `CO_NAISSANCE` date NOT NULL,
  `CO_SEXE` tinyint(1) NOT NULL COMMENT '1 Homme / 2 Femme',
  PRIMARY KEY (`CO_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

--
-- Contenu de la table `COUREUR`
--

INSERT INTO `COUREUR` (`CO_ID`, `CO_NOM`, `CO_PRENOM`, `CO_NAISSANCE`, `CO_SEXE`) VALUES
(1, 'Aldrin', 'Buzz', '1930-01-20', 1),
(2, 'El Karoui', 'Nicole', '1944-05-29', 2),
(3, 'Hawking', 'Stephen', '1942-01-08', 1),
(4, 'Moyo', 'Dambisa', '1969-02-02', 2),
(5, 'Dawkins', 'Richard', '1941-03-26', 1),
(6, 'Krauss', 'Lawrence', '1954-05-27', 1),
(7, 'Lordon', 'Frédéric', '2002-01-15', 1),
(8, 'Blum', 'Lenore', '1942-12-18', 2),
(9, 'Laplace', 'Pierre', '1999-03-23', 1),
(10, 'Cooper', 'Sheldon', '1998-03-26', 1),
(11, 'Klein', 'Etienne', '1958-04-01', 1),
(12, 'Boyd Granville', 'Evelyn', '1924-05-01', 2),
(13, 'Villani', 'Cédric', '1973-10-05', 1),
(14, 'Bell', 'Jocelyn', '1943-07-15', 2),
(15, 'Juliot-Curie', 'Irène', '1995-03-04', 2),
(16, 'Turing', 'Alan', '1990-05-16', 1),
(17, 'Cood', 'Edgar Frank', '1991-05-18', 1);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `COUREUR_RESULTAT`
--
CREATE TABLE IF NOT EXISTS `COUREUR_RESULTAT` (
`CO_ID` int(11)
,`CO_NOM` varchar(100)
,`EP_ID` int(11)
,`EP_DATE` date
,`TY_LIBELLE` text
,`IN_TEMP_EFFECTUE` time
,`IN_DOSSARD` int(11)
,`MA_ID` int(11)
,`MA_NOM` varchar(100)
);
-- --------------------------------------------------------

--
-- Structure de la table `EPREUVE`
--

CREATE TABLE IF NOT EXISTS `EPREUVE` (
  `EP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EP_DATE` date NOT NULL,
  `EP_HEURE` time NOT NULL COMMENT 'Heure de départ de l''épreuve',
  `EP_TYPE_FK` int(11) NOT NULL,
  `EP_MANIF_FK` int(11) NOT NULL,
  `EP_NB` int(11) NOT NULL,
  PRIMARY KEY (`EP_ID`),
  KEY `FK_EPREUVE_TY_ID_idx` (`EP_TYPE_FK`),
  KEY `FK_EPREUVE_MA_ID_idx` (`EP_MANIF_FK`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `EPREUVE`
--

INSERT INTO `EPREUVE` (`EP_ID`, `EP_DATE`, `EP_HEURE`, `EP_TYPE_FK`, `EP_MANIF_FK`, `EP_NB`) VALUES
(1, '2016-04-11', '20:30:00', 1, 1, 2),
(2, '2016-04-11', '19:00:00', 2, 1, 7),
(3, '2016-09-09', '13:00:00', 1, 2, 1),
(4, '2016-09-09', '14:00:00', 2, 2, 98),
(7, '2016-04-11', '10:30:00', 3, 1, 98),
(8, '2015-04-12', '13:30:00', 1, 3, 98),
(9, '2015-04-12', '14:30:00', 2, 3, 98);

-- --------------------------------------------------------

--
-- Structure de la table `INSCRIPTION`
--

CREATE TABLE IF NOT EXISTS `INSCRIPTION` (
  `IN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `IN_COUREUR_FK` int(11) NOT NULL,
  `IN_EPREUVE_FK` int(11) NOT NULL,
  `IN_CATEG_AGE_FK` int(11) NOT NULL,
  `IN_AGE` int(11) NOT NULL,
  `IN_CERTIF` tinyint(1) NOT NULL COMMENT '0: absent, 1 : Présent',
  `IN_DOSSARD` int(11) NOT NULL,
  `IN_DATE` date NOT NULL COMMENT 'Date d''inscription',
  `IN_TAILLE` varchar(3) NOT NULL COMMENT 'Taille du T-Shirt',
  `IN_STATUT` varchar(26) NOT NULL COMMENT 'Statut de l''inscription',
  `IN_TEMP_ANNONCE` time NOT NULL,
  `IN_TEMP_EFFECTUE` time NOT NULL,
  PRIMARY KEY (`IN_ID`),
  KEY `IN_DOSSARD_IDX` (`IN_DOSSARD`),
  KEY `FK_INSCRIPTION_EP_ID_idx` (`IN_EPREUVE_FK`),
  KEY `FK_INSCRIPTION_CO_ID_idx` (`IN_COUREUR_FK`),
  KEY `FK_INSCRIPTION_CA_ID_idx` (`IN_CATEG_AGE_FK`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Contenu de la table `INSCRIPTION`
--

INSERT INTO `INSCRIPTION` (`IN_ID`, `IN_COUREUR_FK`, `IN_EPREUVE_FK`, `IN_CATEG_AGE_FK`, `IN_AGE`, `IN_CERTIF`, `IN_DOSSARD`, `IN_DATE`, `IN_TAILLE`, `IN_STATUT`, `IN_TEMP_ANNONCE`, `IN_TEMP_EFFECTUE`) VALUES
(1, 1, 1, 1, 86, 1, 33, '2014-11-15', 'XL', 'Complète', '04:15:00', '04:53:18'),
(2, 1, 4, 1, 86, 1, 18, '0000-00-00', '', '', '00:00:00', '02:06:05'),
(3, 1, 8, 1, 85, 1, 18, '0000-00-00', '', '', '00:00:00', '04:32:25'),
(4, 6, 8, 1, 61, 1, 18, '0000-00-00', '', '', '00:00:00', '03:15:02'),
(5, 7, 8, 7, 13, 1, 18, '0000-00-00', '', '', '00:00:00', '03:37:00'),
(6, 11, 8, 1, 57, 1, 18, '0000-00-00', '', '', '00:00:00', '03:17:12'),
(7, 14, 9, 1, 72, 0, 18, '0000-00-00', '', '', '00:00:00', '01:47:01'),
(8, 12, 9, 1, 91, 0, 18, '0000-00-00', '', '', '00:00:00', '01:54:03'),
(9, 17, 1, 2, 25, 1, 26, '0000-00-00', '', '', '00:00:00', '03:57:12'),
(10, 10, 7, 4, 18, 1, 31, '0000-00-00', '', '', '00:00:00', '00:19:56'),
(11, 5, 2, 1, 75, 1, 28, '0000-00-00', '', '', '00:00:00', '02:59:12'),
(12, 3, 2, 1, 74, 1, 29, '0000-00-00', '', '', '00:00:00', '03:04:18'),
(13, 15, 2, 3, 21, 0, 18, '0000-00-00', '', '', '00:00:00', '02:30:17'),
(14, 9, 2, 5, 17, 0, 18, '0000-00-00', '', '', '00:00:00', '02:07:15'),
(15, 16, 2, 2, 26, 0, 18, '0000-00-00', '', '', '00:00:00', '02:07:18'),
(16, 13, 2, 1, 43, 1, 30, '0000-00-00', '', '', '00:00:00', '02:08:01'),
(35, 2, 2, 2, 0, 0, 0, '0000-00-00', '', '', '00:00:00', '00:00:00');

--
-- Déclencheurs `INSCRIPTION`
--
DROP TRIGGER IF EXISTS `INSCRIPTION_AFTER_INSERT`;
DELIMITER //
CREATE TRIGGER `INSCRIPTION_AFTER_INSERT` AFTER INSERT ON `INSCRIPTION`
 FOR EACH ROW BEGIN
UPDATE EPREUVE SET EP_NB = (SELECT COUNT(*) FROM INSCRIPTION WHERE IN_EPREUVE_FK = NEW.IN_EPREUVE_FK) WHERE EP_ID = NEW.IN_EPREUVE_FK;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `INSCRIPTION_AFTER_DELETE`;
DELIMITER //
CREATE TRIGGER `INSCRIPTION_AFTER_DELETE` AFTER DELETE ON `INSCRIPTION`
 FOR EACH ROW BEGIN
UPDATE EPREUVE SET EP_NB = (SELECT COUNT(*) FROM INSCRIPTION WHERE IN_EPREUVE_FK = OLD.IN_EPREUVE_FK) WHERE EP_ID = OLD.IN_EPREUVE_FK;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `MANIFESTATION`
--

CREATE TABLE IF NOT EXISTS `MANIFESTATION` (
  `MA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MA_NOM` varchar(100) NOT NULL,
  `MA_CHAMP_FK` int(11) NOT NULL,
  PRIMARY KEY (`MA_ID`),
  KEY `MA_CHAMP_FK` (`MA_CHAMP_FK`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `MANIFESTATION`
--

INSERT INTO `MANIFESTATION` (`MA_ID`, `MA_NOM`, `MA_CHAMP_FK`) VALUES
(1, 'Marathon de Bordeaux', 2),
(2, 'Marathon du Médoc', 1),
(3, 'Marathon de Paris', 2);

-- --------------------------------------------------------

--
-- Structure de la table `TYPE_EPREUVE`
--

CREATE TABLE IF NOT EXISTS `TYPE_EPREUVE` (
  `TY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TY_LIBELLE` text NOT NULL,
  `TY_DISTANCE` decimal(10,3) NOT NULL,
  PRIMARY KEY (`TY_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `TYPE_EPREUVE`
--

INSERT INTO `TYPE_EPREUVE` (`TY_ID`, `TY_LIBELLE`, `TY_DISTANCE`) VALUES
(1, 'Marathon', '42.135'),
(2, 'Semi marathon', '21.097'),
(3, 'I-RUN KID’S', '1.040');

-- --------------------------------------------------------

--
-- Structure de la vue `COUREUR_RESULTAT`
--
DROP TABLE IF EXISTS `COUREUR_RESULTAT`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `COUREUR_RESULTAT` AS select `COUREUR`.`CO_ID` AS `CO_ID`,`COUREUR`.`CO_NOM` AS `CO_NOM`,`EPREUVE`.`EP_ID` AS `EP_ID`,`EPREUVE`.`EP_DATE` AS `EP_DATE`,`TYPE_EPREUVE`.`TY_LIBELLE` AS `TY_LIBELLE`,`INSCRIPTION`.`IN_TEMP_EFFECTUE` AS `IN_TEMP_EFFECTUE`,`INSCRIPTION`.`IN_DOSSARD` AS `IN_DOSSARD`,`MANIFESTATION`.`MA_ID` AS `MA_ID`,`MANIFESTATION`.`MA_NOM` AS `MA_NOM` from ((((`COUREUR` join `INSCRIPTION` on(((`COUREUR`.`CO_ID` = `INSCRIPTION`.`IN_COUREUR_FK`) and (`INSCRIPTION`.`IN_TEMP_EFFECTUE` <> '00:00:00')))) join `EPREUVE` on((`INSCRIPTION`.`IN_EPREUVE_FK` = `EPREUVE`.`EP_ID`))) join `TYPE_EPREUVE` on((`EPREUVE`.`EP_TYPE_FK` = `TYPE_EPREUVE`.`TY_ID`))) join `MANIFESTATION` on((`EPREUVE`.`EP_MANIF_FK` = `MANIFESTATION`.`MA_ID`)));

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `ADHESION`
--
ALTER TABLE `ADHESION`
  ADD CONSTRAINT `FK_ADHESION_CL_ID` FOREIGN KEY (`AD_CLUB_FK`) REFERENCES `CLUB` (`CL_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ADHESION_CO_ID` FOREIGN KEY (`AD_COUREUR_FK`) REFERENCES `COUREUR` (`CO_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `EPREUVE`
--
ALTER TABLE `EPREUVE`
  ADD CONSTRAINT `FK_EPREUVE_MA_ID` FOREIGN KEY (`EP_MANIF_FK`) REFERENCES `MANIFESTATION` (`MA_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_EPREUVE_TY_ID` FOREIGN KEY (`EP_TYPE_FK`) REFERENCES `TYPE_EPREUVE` (`TY_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `INSCRIPTION`
--
ALTER TABLE `INSCRIPTION`
  ADD CONSTRAINT `FK_INSCRIPTION_CA_ID` FOREIGN KEY (`IN_CATEG_AGE_FK`) REFERENCES `CATEGORIE_AGE` (`CA_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_INSCRIPTION_CO_ID` FOREIGN KEY (`IN_COUREUR_FK`) REFERENCES `COUREUR` (`CO_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_INSCRIPTION_EP_ID` FOREIGN KEY (`IN_EPREUVE_FK`) REFERENCES `EPREUVE` (`EP_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `MANIFESTATION`
--
ALTER TABLE `MANIFESTATION`
  ADD CONSTRAINT `FK_MANIFESTATION_CH_ID` FOREIGN KEY (`MA_CHAMP_FK`) REFERENCES `CHAMPIONNAT` (`CH_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

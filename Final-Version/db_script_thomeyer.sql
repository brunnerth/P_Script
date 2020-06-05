-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Ven 05 Juin 2020 à 12:45
-- Version du serveur :  5.7.11
-- Version de PHP :  7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `db_script_thomeyer`
--
CREATE DATABASE IF NOT EXISTS `db_script_thomeyer` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db_script_thomeyer`;

-- --------------------------------------------------------

--
-- Structure de la table `t_user`
--

CREATE TABLE `t_user` (
  `idUser` int(11) NOT NULL,
  `useLogin` varchar(50) NOT NULL,
  `usePassword` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `t_user`
--

INSERT INTO `t_user` (`idUser`, `useLogin`, `usePassword`) VALUES
(1, 'User1', '76492d1116743f0423413b16050a5345MgB8AGwAdAAvAHoANgB0ADgATwBSAGQAbABiAGYAWAArAEEAVwA3ADYATAA4AGcAPQA9AHwAZgBhADcANgA4AGIAZgA1ADQAMQA5ADcAMwBhADIAOQAzAGEAOQAwADkAZQAwADIAOQBlAGQAZAAxADkAYwA1AA=='),
(2, 'User2', '76492d1116743f0423413b16050a5345MgB8AFoAQgBJAEcAWABDAHgAcwBVAGQAVQBZAEcAbgBNAGgAcgBxAEUAeQBkAFEAPQA9AHwAYwAwAGEAYwBhADcAOAAxADcANgA3ADYAZQBmADMANQBhAGMANABmADMAZAA0ADIAYwAzADYAZgBjADcAYQBjADkAZAA5ADkAMQA1AGEAMQA3AGUANwA1ADAAMABhADUAMQBjAGYANAA4ADQANABhADMAYwBmADQAOAA3ADkANwA=');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `t_user`
--
ALTER TABLE `t_user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

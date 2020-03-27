-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Ven 27 Mars 2020 à 13:50
-- Version du serveur :  5.7.11
-- Version de PHP :  7.0.3
create database `db_script_thomeyer`;
use `db_script_thomeyer`;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


--
-- Base de données :  `db_script_thomeyer`
--

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
(1, 'User1', '01000000d08c9ddf0115d1118c7a00c04fc297eb01000000c1e854fc55fc864f91034531e7dea61600000000020000000000106600000001000020000000a8ebcd5273b36ef69e1ad247890f02133accad49be6e74\r\ne1a672901132a07a17000000000e8000000002000020000000bc96171d8197712dff52947e78a1467ce19141559e9caca45a2c460e771568f9100000000a855654cfb853eabe535ce34d3afd4640000000d3967cbc\r\n24319c8f6516af27d8227226be093dad9fe4e84434178592818e33ef12d88a8673fb1f4175a784129118a0bfe10a6a461878e7a5b6ec726e81d6c7ed'),
(2, 'User2', '01000000d08c9ddf0115d1118c7a00c04fc297eb01000000c1e854fc55fc864f91034531e7dea61600000000020000000000106600000001000020000000cfddcb0905b89415110bc67cf1985bedfa1d84bcb7a54f\r\nb0781f6ce1822a481e000000000e80000000020000200000007af96dfe9a059803b001e4e15ca54d0b9f1b3f05fb9f49168bbaf5b91bc967ba20000000e941dce0c01fad2e8092070549cafd92c33aaed43026c905\r\nde89b5405f5b580e400000004e2f571708bfaf30825dcb6ae1046b71f6ff26fe5c77788adeaebb2b9a3a99560280f66e77118327d4d7556c4c2259ef3d66ff7e5671a7446ded6dd928d6a6b5');

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

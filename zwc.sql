-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Lun 30 Avril 2018 à 23:14
-- Version du serveur :  5.7.22-0ubuntu0.16.04.1
-- Version de PHP :  7.0.28-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `zwc`
--

-- --------------------------------------------------------

--
-- Structure de la table `action`
--

CREATE TABLE `action` (
  `id` int(11) NOT NULL,
  `title_fr` varchar(300) NOT NULL COMMENT 'Titre de l''action en français',
  `title_en` varchar(300) NOT NULL COMMENT 'Titre de l''action en anglais',
  `pros_fr` text NOT NULL COMMENT 'Avantages en français',
  `pros_en` int(11) NOT NULL COMMENT 'Avantages en anglais',
  `content_fr` text NOT NULL COMMENT 'Contenu de la fiche en français',
  `content_en` int(11) NOT NULL COMMENT 'Contenu de la fiche en anglais',
  `carbon_footprint` int(11) NOT NULL COMMENT 'Empreinte carbone en kg eq. CO2'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Action à réaliser par l''utilisateur';

-- --------------------------------------------------------

--
-- Structure de la table `action_category`
--

CREATE TABLE `action_category` (
  `action_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Catégories d''une action';

-- --------------------------------------------------------

--
-- Structure de la table `action_rating`
--

CREATE TABLE `action_rating` (
  `user_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `duration` int(11) NOT NULL COMMENT 'Durée de réalisation d''une action',
  `cost` int(11) NOT NULL COMMENT 'Coût de réalisation d''une action',
  `difficulty` int(11) NOT NULL COMMENT 'Difficulté de réalisation d''une action',
  `saving` int(11) NOT NULL COMMENT 'Economies suite à la réalisation d''une action'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name_fr` varchar(200) NOT NULL,
  `name_en` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `picture` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Produit pouvant être impacté par une action';

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `login` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `registration_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table des utilisateurs';

-- --------------------------------------------------------

--
-- Structure de la table `user_information`
--

CREATE TABLE `user_information` (
  `user_id` int(11) NOT NULL,
  `sexe` int(11) NOT NULL,
  `birthdate` date NOT NULL,
  `country` varchar(3) NOT NULL COMMENT 'country of living',
  `city` varchar(100) NOT NULL,
  `language` int(11) NOT NULL COMMENT 'application language',
  `residence_type` int(11) NOT NULL COMMENT 'house, apartment, trailer, ...',
  `children` tinyint(1) NOT NULL COMMENT 'children or not'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Informations personnelles utilisateurs';

--
-- Index pour les tables exportées
--

--
-- Index pour la table `action`
--
ALTER TABLE `action`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_2` (`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `action`
--
ALTER TABLE `action`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

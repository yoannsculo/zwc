-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mer 02 Mai 2018 à 18:24
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
  `ac_id` int(11) NOT NULL,
  `ac_carbon_footprint` int(11) NOT NULL COMMENT 'Empreinte carbone en kg eq. CO2',
  `ac_picture` int(11) NOT NULL,
  `ac_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Action ou recette à réaliser par l''utilisateur';

-- --------------------------------------------------------

--
-- Structure de la table `action_rating`
--

CREATE TABLE `action_rating` (
  `ar_user_id` int(11) NOT NULL COMMENT 'Id de l''utilisateur notant une page',
  `action_id` int(11) NOT NULL COMMENT 'Id de l''action notée par l''utilisateur',
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
  `cat_id` int(11) NOT NULL,
  `cat_title_fr` varchar(200) NOT NULL COMMENT 'Titre de catégorie en français',
  `cat_title_en` varchar(200) NOT NULL COMMENT 'Titre de catégorie en anglais'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `comment_rating`
--

CREATE TABLE `comment_rating` (
  `cr_id` int(11) NOT NULL,
  `cr_date` date NOT NULL COMMENT 'Date de notation d''un commentaire',
  `cr_user_id` int(11) NOT NULL COMMENT 'Id de l''utilisateur notant le commentaire',
  `cr_pc_id` int(11) NOT NULL COMMENT 'Id du commentaire noté',
  `cr_rating` int(11) NOT NULL COMMENT 'Note du commentaire par l''utilisateur'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `keyword`
--

CREATE TABLE `keyword` (
  `key_id` int(11) NOT NULL,
  `key_lang` int(11) NOT NULL COMMENT 'Langue du mot clé',
  `key_title` int(11) NOT NULL COMMENT 'Titre du mot clé'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `keyword_links`
--

CREATE TABLE `keyword_links` (
  `kl_id` int(11) NOT NULL,
  `kl_page_id` int(11) NOT NULL COMMENT 'Id de la page associée',
  `kl_key_id` int(11) NOT NULL COMMENT 'Id du mot clé associé'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `page`
--

CREATE TABLE `page` (
  `page_id` int(11) NOT NULL,
  `page_title` varchar(200) NOT NULL COMMENT 'Titre de la fiche dans sa langue',
  `page_lang` int(11) NOT NULL COMMENT 'Langu de la fiche',
  `page_ac_id` int(11) NOT NULL COMMENT 'action id correspondant',
  `page_text_id` int(11) NOT NULL COMMENT 'Dernière version de contenu de la fiche'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Fiche reliée à une action';

-- --------------------------------------------------------

--
-- Structure de la table `page_comment`
--

CREATE TABLE `page_comment` (
  `pc_id` int(11) NOT NULL,
  `pc_date` int(11) NOT NULL COMMENT 'Date de publication du commentaire',
  `pc_text_id` int(11) NOT NULL COMMENT 'Contenu du commentaire',
  `pc_page_id` int(11) NOT NULL COMMENT 'Id de la page commentée',
  `pc_user_id` int(11) NOT NULL COMMENT 'Id de l''utilisateur écrivant le commentaire'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `prod_id` int(11) NOT NULL,
  `prod_title_fr` varchar(300) NOT NULL COMMENT 'Non du produit en français',
  `prod_title_en` int(11) NOT NULL COMMENT 'Non du produit en anglais',
  `prod_picture` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Produit pouvant être impacté par une action';

-- --------------------------------------------------------

--
-- Structure de la table `product_links`
--

CREATE TABLE `product_links` (
  `pl_id` int(11) NOT NULL,
  `pl_ac_id` int(11) NOT NULL COMMENT 'Action d''id associé au produit',
  `pl_prod_id` int(11) NOT NULL COMMENT 'Id de produit'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `revision`
--

CREATE TABLE `revision` (
  `rev_id` int(11) NOT NULL,
  `rev_page` int(11) NOT NULL COMMENT 'Id de page/fiche associée',
  `rev_text_id` int(11) NOT NULL COMMENT 'Id du texte associé à cette révision',
  `rev_user` int(11) NOT NULL COMMENT 'Utilisateur ayant modifié la page'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `text`
--

CREATE TABLE `text` (
  `text_id` int(11) NOT NULL,
  `text_content` text NOT NULL COMMENT 'Contenu de la fiche'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_login` varchar(200) NOT NULL,
  `user_password` varchar(200) NOT NULL,
  `user_mail` varchar(200) NOT NULL,
  `user_registration_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table des utilisateurs';

-- --------------------------------------------------------

--
-- Structure de la table `user_information`
--

CREATE TABLE `user_information` (
  `ui_user_id` int(11) NOT NULL,
  `ui_sex` int(11) NOT NULL,
  `ui_birthdate` date NOT NULL,
  `ui_country` varchar(3) NOT NULL COMMENT 'country of living',
  `ui_city` varchar(100) NOT NULL,
  `ui_language` int(11) NOT NULL COMMENT 'application language',
  `ui_residence_type` int(11) NOT NULL COMMENT 'house, apartment, trailer, ...',
  `ui_children` tinyint(1) NOT NULL COMMENT 'children or not'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Informations personnelles utilisateurs';

--
-- Index pour les tables exportées
--

--
-- Index pour la table `action`
--
ALTER TABLE `action`
  ADD PRIMARY KEY (`ac_id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Index pour la table `keyword`
--
ALTER TABLE `keyword`
  ADD PRIMARY KEY (`key_id`);

--
-- Index pour la table `keyword_links`
--
ALTER TABLE `keyword_links`
  ADD PRIMARY KEY (`kl_id`);

--
-- Index pour la table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`page_id`);

--
-- Index pour la table `page_comment`
--
ALTER TABLE `page_comment`
  ADD PRIMARY KEY (`pc_id`),
  ADD KEY `pc_id` (`pc_id`),
  ADD KEY `pc_id_2` (`pc_id`),
  ADD KEY `pc_id_3` (`pc_id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prod_id`),
  ADD UNIQUE KEY `id` (`prod_id`);

--
-- Index pour la table `product_links`
--
ALTER TABLE `product_links`
  ADD PRIMARY KEY (`pl_id`);

--
-- Index pour la table `revision`
--
ALTER TABLE `revision`
  ADD PRIMARY KEY (`rev_id`);

--
-- Index pour la table `text`
--
ALTER TABLE `text`
  ADD KEY `id` (`text_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `id_2` (`user_id`),
  ADD KEY `id` (`user_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `action`
--
ALTER TABLE `action`
  MODIFY `ac_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `keyword`
--
ALTER TABLE `keyword`
  MODIFY `key_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `keyword_links`
--
ALTER TABLE `keyword_links`
  MODIFY `kl_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `page`
--
ALTER TABLE `page`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `page_comment`
--
ALTER TABLE `page_comment`
  MODIFY `pc_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `product_links`
--
ALTER TABLE `product_links`
  MODIFY `pl_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `revision`
--
ALTER TABLE `revision`
  MODIFY `rev_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `text`
--
ALTER TABLE `text`
  MODIFY `text_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

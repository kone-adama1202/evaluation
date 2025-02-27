-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 27 fév. 2025 à 23:52
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `evaluation`
--

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

CREATE TABLE `employe` (
  `matricule` int(11) NOT NULL,
  `nomEmp` varchar(100) NOT NULL,
  `prenomEmp` varchar(100) DEFAULT NULL,
  `fonctionEmp` varchar(100) DEFAULT NULL,
  `serviceEmp` varchar(100) DEFAULT NULL,
  `dateEmbauche` date DEFAULT NULL,
  `sexeEmp` enum('M','F') DEFAULT NULL,
  `salaireBase` double DEFAULT NULL,
  `entreprise_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `employe`
--

INSERT INTO `employe` (`matricule`, `nomEmp`, `prenomEmp`, `fonctionEmp`, `serviceEmp`, `dateEmbauche`, `sexeEmp`, `salaireBase`, `entreprise_id`) VALUES
(2, 'qw', 'q', 'qq', 'qq', '0022-02-12', 'M', 122, 1),
(3, 'qw', 'q', 'qq', 'qq', '0022-02-12', 'M', 122, 1),
(5, 'adama', 'kone', 'etudiant', 'etudiant', '2000-02-12', 'M', 2000000, 2),
(6, 'adama', 'kone', 'etudiant', 'etudiant', '2000-02-12', 'M', 2000000, 2),
(8, 'qw', 'q', 'qq', 'etudiant', '2022-12-25', 'M', 12, 2),
(9, 'qw', 'q', 'qq', 'etudiant', '2022-12-25', 'M', 12, 2),
(10, 'kodo', 'j', 'j', 'etudiant', '2022-12-28', 'M', 111, 2),
(11, 'qw', 'kone', 'qq', 'etudiant', '2022-12-24', 'M', 11, 2);

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

CREATE TABLE `entreprise` (
  `id` int(11) NOT NULL,
  `nomEntreprise` varchar(100) NOT NULL,
  `adressEnt` varchar(255) DEFAULT NULL,
  `date_creation` date DEFAULT NULL,
  `chiffre_affaire` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `entreprise`
--

INSERT INTO `entreprise` (`id`, `nomEntreprise`, `adressEnt`, `date_creation`, `chiffre_affaire`) VALUES
(1, 'qwww', 'qqq', '0022-02-12', 1233),
(2, 'snatel', 'Medina', '6322-02-12', 1000000),
(3, 'qwww', 'Medina', '2022-11-25', 111);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','employe') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', 'admin123', 'admin'),
(2, 'employe1', 'employe123', 'employe');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`matricule`),
  ADD KEY `entreprise_id` (`entreprise_id`);

--
-- Index pour la table `entreprise`
--
ALTER TABLE `entreprise`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `employe`
--
ALTER TABLE `employe`
  MODIFY `matricule` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `entreprise`
--
ALTER TABLE `entreprise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `employe_ibfk_1` FOREIGN KEY (`entreprise_id`) REFERENCES `entreprise` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

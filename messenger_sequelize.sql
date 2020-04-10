-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  ven. 10 avr. 2020 à 02:28
-- Version du serveur :  5.7.17
-- Version de PHP :  5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `messenger_sequelize`
--

-- --------------------------------------------------------

--
-- Structure de la table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'elhamra', '$2a$10$t7pMdpq/n0gKau5eIBO9MuYmAnQ4sU1uqNT5o94PgMUtb22jx7KYe', '2020-04-08 18:41:52', '2020-04-08 18:41:52'),
(2, 'walid', '$2a$10$uNhs4IRN2iXx8BywNwUaCOHblFsv3tjRWCCpQapEyhSULV4Bn8/.6', '2020-04-09 01:40:27', '2020-04-09 01:40:27'),
(3, 'zbiri', '$2a$10$vwvw.5aMaTnnCzYvECrhmO2WMENg2CZpAdHVxknitp3lunX8IKEAi', '2020-04-09 01:54:54', '2020-04-09 01:54:54'),
(4, 'zbiri', '$2a$10$3qFAH6ZA6xDrTh7ROH8MyOBa9x87mNru610v907.GO6PtsHAJwTDi', '2020-04-09 01:54:56', '2020-04-09 01:54:56'),
(5, 'zri', '$2a$10$ztvlrLfZunl0NI3YswuDCOl3giNEGRvSUAccBwzaFmgHYzz.1/qa2', '2020-04-09 01:55:24', '2020-04-09 01:55:24'),
(6, 'walid', '$2a$10$ouK7OxgQJp1G0SRwRCdPL.0ZuDB8Y0dipbRwdLH4ZMQz1JzmejfyW', '2020-04-09 02:16:21', '2020-04-09 02:16:21'),
(7, 'walid', '$2a$10$cOztnIENILiJxCjFYA6ADezzbebjrkMVXoApyAocAuasqMK8MhTTG', '2020-04-09 02:22:31', '2020-04-09 02:22:31'),
(8, 'okbye', '$2a$10$9VxPLIrXcro7SwzThCgyVusRRVdcvQW3tU7x59kuq8DhHL8PQmH3W', '2020-04-09 02:24:59', '2020-04-09 02:24:59'),
(9, 'asmai', '$2a$10$kMQGmVaHmP2pbPir4Cv2TeVDrGWlLTp1nMj2juDNVZa4qmKa7f9kq', '2020-04-09 15:18:51', '2020-04-09 15:18:51'),
(10, 'elhamra1', '$2a$10$R4jg0Rkv240PjbqkzpRDqOdKh6ntGEDfRnL7vVuasldU0Ek4PQCPa', '2020-04-09 17:42:04', '2020-04-09 17:42:04');

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `contenu` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) NOT NULL,
  `messageId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `contenu`, `createdAt`, `updatedAt`, `userId`, `messageId`) VALUES
(1, 'nice post', '2020-04-09 00:44:58', '2020-04-09 00:44:58', 5, 11),
(2, 'nice message', '2020-04-10 00:26:00', '2020-04-10 00:26:00', 6, 11),
(3, 'nice message', '2020-04-10 00:26:34', '2020-04-10 00:26:34', 5, 11);

-- --------------------------------------------------------

--
-- Structure de la table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `messageId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `likes`
--

INSERT INTO `likes` (`id`, `userId`, `messageId`, `createdAt`, `updatedAt`) VALUES
(6, 5, 11, '2020-04-09 01:20:26', '2020-04-09 01:20:26'),
(7, 6, 11, '2020-04-10 00:27:48', '2020-04-10 00:27:48');

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `contenu` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `UserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id`, `contenu`, `createdAt`, `updatedAt`, `UserId`) VALUES
(1, 'wa hzjjzjjzjzhhahha', '2020-04-08 23:05:13', '2020-04-09 00:10:58', 5),
(2, 'Oui mdfk hhgkhjkhj', '2020-04-08 23:33:30', '2020-04-09 00:09:12', 5),
(11, 'hello guys', '2020-04-09 00:30:44', '2020-04-09 00:30:44', 5),
(12, 'hello drari', '2020-04-10 00:24:03', '2020-04-10 00:24:03', 6);

-- --------------------------------------------------------

--
-- Structure de la table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20200405195223-create-user.js'),
('20200405195224-create-message.js'),
('20200405196855-create-admin.js'),
('20200405197724-create-like.js'),
('20200405198428-create-comment.js'),
('20200405199559-create-share.js');

-- --------------------------------------------------------

--
-- Structure de la table `shares`
--

CREATE TABLE `shares` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `messageId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `age`, `email`, `createdAt`, `updatedAt`) VALUES
(5, 'walid', 22, 'zbiri@gmail.com', '2020-04-08 22:50:47', '2020-04-08 22:54:58'),
(6, 'elhamra', 29, 'zi@gmail.com', '2020-04-10 00:22:52', '2020-04-10 00:22:52');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `messageId` (`messageId`);

--
-- Index pour la table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `actions_unique` (`messageId`,`userId`),
  ADD KEY `userId` (`userId`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserId` (`UserId`);

--
-- Index pour la table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `shares`
--
ALTER TABLE `shares`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `actions_unique` (`messageId`,`userId`),
  ADD KEY `userId` (`userId`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `shares`
--
ALTER TABLE `shares`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`messageId`) REFERENCES `messages` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`messageId`) REFERENCES `messages` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `shares`
--
ALTER TABLE `shares`
  ADD CONSTRAINT `shares_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shares_ibfk_2` FOREIGN KEY (`messageId`) REFERENCES `messages` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

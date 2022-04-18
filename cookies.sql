-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 18 avr. 2022 à 01:37
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cookies`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(2, NULL, 1, 'Category 2', 'category-2', '2022-04-11 22:52:30', '2022-04-11 22:52:30');

-- --------------------------------------------------------

--
-- Structure de la table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'voyager::seeders.data_rows.roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, '{}', 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 0, 0, 1, 1, 1, 1, '{}', 4),
(48, 6, 'body', 'rich_text_box', 'Body', 0, 0, 1, 1, 1, 1, '{}', 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 0, 0, 1, 1, 1, 1, '{}', 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 0, 0, 1, 1, 1, 1, '{}', 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, '{}', 12),
(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(58, 7, 'Prenom', 'text', 'Prenom', 0, 1, 1, 1, 1, 1, '{}', 3),
(59, 7, 'Photo', 'image', 'Photo', 0, 1, 1, 1, 1, 1, '{}', 4),
(63, 7, 'Telephone', 'text', 'Telephone', 0, 1, 1, 1, 1, 1, '{}', 8),
(64, 7, 'Email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 9),
(67, 7, 'specialite', 'text', 'Specialite', 0, 1, 1, 1, 1, 1, '{}', 12),
(69, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(70, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(71, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(72, 8, 'Nom', 'text', 'Nom', 0, 1, 1, 1, 1, 1, '{}', 2),
(73, 7, 'professeur_belongsto_speciality_relationship', 'relationship', 'specialities', 1, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Speciality\",\"table\":\"specialities\",\"type\":\"belongsTo\",\"column\":\"id\",\"key\":\"nom\",\"label\":\"nom\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 14),
(74, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 14),
(75, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 15),
(76, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 6),
(85, 1, 'cin', 'text', 'Cin', 0, 1, 1, 1, 1, 1, '{}', 12),
(86, 1, 'prenom', 'text', 'Prenom', 0, 1, 1, 1, 1, 1, '{}', 13),
(87, 1, 'photo', 'file', 'Photo', 0, 1, 1, 1, 1, 1, '{}', 14),
(88, 1, 'numDRPP', 'number', 'NumDRPP', 0, 1, 1, 1, 1, 1, '{}', 15),
(89, 1, 'dateRecrutement', 'date', 'DateRecrutement', 0, 1, 1, 1, 1, 1, '{}', 16),
(90, 1, 'dateNaissance', 'date', 'DateNaissance', 0, 1, 1, 1, 1, 1, '{}', 17),
(91, 1, 'profappaensa', 'checkbox', 'Profappaensa', 0, 1, 1, 1, 1, 1, '{}', 18),
(92, 1, 'structureRecherche', 'text', 'StructureRecherche', 0, 1, 1, 1, 1, 1, '{}', 19),
(93, 1, 'DirecteurStructureRecherche', 'text', 'DirecteurStructureRecherche', 0, 1, 1, 1, 1, 1, '{}', 20),
(94, 7, 'Name', 'text', 'Nom', 0, 1, 1, 1, 1, 1, '{}', 2),
(95, 7, 'cin', 'text', 'Cin', 0, 1, 1, 1, 1, 1, '{}', 5),
(96, 7, 'numdrpp', 'text', 'Numero_deppartement', 0, 1, 1, 1, 1, 1, '{}', 6),
(97, 7, 'Daterecrutement', 'text', 'Date_recrutement', 0, 1, 1, 1, 1, 1, '{}', 7),
(98, 7, 'dateNaissance', 'text', 'Date_Naissance', 0, 1, 1, 1, 1, 1, '{}', 10),
(99, 7, 'profappaensa', 'text', 'Prof_appartenant_ensa', 0, 1, 1, 1, 1, 1, '{}', 11),
(100, 7, 'structureRecherche', 'text', 'Structure_de_Recherche', 0, 1, 1, 1, 1, 1, '{}', 13),
(101, 1, 'specialite', 'text', 'Specialite', 0, 1, 1, 1, 1, 1, '{}', 21),
(102, 1, 'telephone', 'number', 'Telephone', 0, 1, 1, 1, 1, 1, '{}', 22),
(103, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(104, 9, 'file', 'file', 'Fichier', 0, 1, 1, 1, 1, 1, '{}', 2),
(105, 9, 'name_dossier', 'text', 'Npm_Dossier', 0, 1, 1, 1, 1, 1, '{}', 3),
(106, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(107, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(108, 9, 'status', 'text', 'Status', 0, 1, 1, 0, 0, 1, '{}', 6),
(109, 9, 'id_user', 'text', 'Id User', 0, 1, 1, 0, 0, 1, '{}', 7),
(110, 7, 'DirecteurStructureRecherche', 'text', 'DirecteurStructureRecherche', 0, 1, 1, 1, 1, 1, '{}', 16),
(111, 9, 'type_dossier', 'select_dropdown', 'Type Dossier', 0, 1, 1, 1, 1, 1, '{\"options\":{\"pedagogique\":\"pedagogique\",\"Administrative\":\"Administrative\",\"scientifique\":\"scientifique\"}}', 8);

-- --------------------------------------------------------

--
-- Structure de la table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2022-04-11 22:52:29', '2022-04-13 16:28:43'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2022-04-11 22:52:29', '2022-04-11 22:52:29'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2022-04-11 22:52:29', '2022-04-11 22:52:29'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, 'App\\Http\\Controllers\\DossierController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2022-04-11 22:52:30', '2022-04-13 15:46:00'),
(7, 'professeurs', 'professeurs', 'Professeur', 'Professeurs', NULL, 'App\\Professeur', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-04-12 13:24:18', '2022-04-15 11:24:44'),
(8, 'specialities', 'specialities', 'Speciality', 'Specialities', NULL, 'App\\Speciality', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-04-12 13:31:34', '2022-04-12 13:31:34'),
(9, 'dossiers', 'dossiers', 'Dossier', 'Dossiers', NULL, 'App\\Dossier', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-04-13 15:32:56', '2022-04-17 23:14:34');

-- --------------------------------------------------------

--
-- Structure de la table `dossiers`
--

CREATE TABLE `dossiers` (
  `id` int(10) UNSIGNED NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_dossier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `type_dossier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `dossiers`
--

INSERT INTO `dossiers` (`id`, `file`, `name_dossier`, `created_at`, `updated_at`, `status`, `id_user`, `type_dossier`) VALUES
(1, '[{\"download_link\":\"dossiers\\\\April2022\\\\GnI2dqAa5y1cstBbD5Mu.pdf\",\"original_name\":\"Mini Projet 2ITE.pdf\"}]', 'test1', '2022-04-13 15:47:21', '2022-04-13 15:47:21', NULL, NULL, NULL),
(2, '[{\"download_link\":\"dossiers\\\\April2022\\\\eTECCbhfAYMAdBSZwfCF.pdf\",\"original_name\":\"1 - Intro UML + Cas utilisations .pdf\"}]', 'uml', '2022-04-13 16:05:00', '2022-04-13 20:55:45', 'refus', 1, NULL),
(3, '[{\"download_link\":\"dossiers\\\\April2022\\\\PfynGc4iT2GoIiDmykOr.pdf\",\"original_name\":\"3-  SEQUENCE Diagramme activit\\u00e9 .pdf\"}]', 'sequence', '2022-04-13 20:54:49', '2022-04-13 20:54:49', 'refus', 1, NULL),
(4, '[{\"download_link\":\"dossiers\\\\April2022\\\\Q9uVucWUbV0yU3JcTMAT.docx\",\"original_name\":\"Rapport_TD1_UML_AYA_EL_AMARI.docx\"}]', 'rapport', '2022-04-13 21:21:11', '2022-04-13 21:21:11', 'refus', 4, NULL),
(5, '[{\"download_link\":\"dossiers\\\\April2022\\\\3aM3l4n3ywFOadohvWYJ.pdf\",\"original_name\":\"Agile Scrum.pdf\"}]', 'scrum', '2022-04-15 13:04:22', '2022-04-15 13:04:22', 'acceptee', 6, NULL),
(6, '[{\"download_link\":\"dossiers\\\\April2022\\\\8eHrTbZ8EojofWhkPU5z.docx\",\"original_name\":\"besoin fonctionnelle.docx\"}]', 'besoin', '2022-04-15 13:08:24', '2022-04-15 13:08:24', NULL, 6, NULL),
(7, '[{\"download_link\":\"dossiers\\\\April2022\\\\I8ZC1JX2bAqcctigSniX.pdf\",\"original_name\":\"C01-Introduction_et_Premiere_application.pdf\"}]', 'tst1', '2022-04-15 17:46:47', '2022-04-15 17:46:47', 'acceptee', 8, NULL),
(9, '[{\"download_link\":\"dossiers\\\\April2022\\\\lS29L29B1FIn9b0hVTdi.rar\",\"original_name\":\"java.rar\"}]', 'java_cours', '2022-04-15 18:23:05', '2022-04-15 18:23:05', 'acceptee', 15, NULL),
(10, '[{\"download_link\":\"dossiers\\\\April2022\\\\T52SZXDdwvvnP3cfKpIh.zip\",\"original_name\":\"Im_test.zip\"}]', 'image_test', '2022-04-15 18:29:08', '2022-04-15 18:29:08', 'refus', 17, NULL),
(11, '[{\"download_link\":\"dossiers\\\\April2022\\\\1Vp9XTQr3Pne0gA4s0X9.rar\",\"original_name\":\"src.rar\"}]', 'code_src', '2022-04-15 18:34:44', '2022-04-15 18:34:44', 'acceptee', 18, NULL),
(12, '[{\"download_link\":\"dossiers\\\\April2022\\\\L4fpiXuLRXNfI4ahXVS5.zip\",\"original_name\":\"Im_test.zip\"}]', 'test_code', '2022-04-15 21:41:35', '2022-04-15 21:41:35', NULL, 20, NULL),
(13, '[{\"download_link\":\"dossiers\\\\April2022\\\\ukQN1qFBOEwZlvmFB6Di.zip\",\"original_name\":\"Im_test.zip\"}]', 'src_code', '2022-04-15 21:57:39', '2022-04-15 21:57:39', 'acceptee', 21, NULL),
(14, '[{\"download_link\":\"dossiers\\\\April2022\\\\IaqHGKuV0l16UhPXQsgt.pdf\",\"original_name\":\"C01-Introduction_et_Premiere_application.pdf\"}]', 'java_cours', '2022-04-17 23:12:33', '2022-04-17 23:12:33', NULL, 1, 'option2'),
(15, '[{\"download_link\":\"dossiers\\\\April2022\\\\7xI4EGnN9MvYODXCGAp7.jpg\",\"original_name\":\"proteger-les-donnees-etat.jpg\"}]', 'koo', '2022-04-17 23:15:06', '2022-04-17 23:15:06', NULL, 1, 'Administrative'),
(16, '[{\"download_link\":\"dossiers\\\\April2022\\\\cmKrBErdpofjyGeamFQO.jpg\",\"original_name\":\"Anonymous.jpg\"}]', 'll', '2022-04-17 23:15:25', '2022-04-17 23:15:25', NULL, 1, 'pedagogique');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2022-04-11 22:52:29', '2022-04-11 22:52:29');

-- --------------------------------------------------------

--
-- Structure de la table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2022-04-11 22:52:29', '2022-04-11 22:52:29', 'voyager.dashboard', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 4, '2022-04-11 22:52:29', '2022-04-12 13:45:20', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 3, '2022-04-11 22:52:29', '2022-04-12 13:45:23', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 8, '2022-04-11 22:52:29', '2022-04-15 21:06:39', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2022-04-11 22:52:29', '2022-04-12 13:45:14', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2022-04-11 22:52:29', '2022-04-15 21:06:39', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2022-04-11 22:52:29', '2022-04-15 21:06:39', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2022-04-11 22:52:29', '2022-04-15 21:06:39', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 9, '2022-04-11 22:52:29', '2022-04-15 21:06:39', 'voyager.settings.index', NULL),
(13, 1, 'Dossiers', '', '_self', 'voyager-file-text', '#ee7272', NULL, 5, '2022-04-11 22:52:30', '2022-04-15 21:21:49', 'voyager.pages.index', 'null'),
(14, 1, 'Professeurs', '', '_self', NULL, NULL, NULL, 10, '2022-04-12 13:24:18', '2022-04-15 21:06:39', 'voyager.professeurs.index', NULL),
(15, 1, 'Specialities', '', '_self', NULL, NULL, NULL, 11, '2022-04-12 13:31:34', '2022-04-15 21:06:39', 'voyager.specialities.index', NULL),
(16, 1, 'Profile', '/admin/profile', '_self', 'voyager-news', '#ff5c5c', NULL, 2, '2022-04-12 13:43:49', '2022-04-15 11:27:12', NULL, ''),
(17, 1, 'listes dossiers', '', '_self', 'voyager-paper-plane', '#f94343', NULL, 6, '2022-04-13 15:32:56', '2022-04-15 21:24:13', 'voyager.dossiers.index', 'null'),
(18, 1, 'add dossier', '/admin/dossiers/create', '_self', 'voyager-list-add', '#f45252', NULL, 7, '2022-04-15 21:04:02', '2022-04-15 21:20:58', NULL, '');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2016_01_01_000000_create_pages_table', 2),
(26, '2016_01_01_000000_create_posts_table', 2),
(27, '2016_02_15_204651_create_categories_table', 2),
(28, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Structure de la table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2022-04-11 22:52:30', '2022-04-11 22:52:30');

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2022-04-11 22:52:29', '2022-04-11 22:52:29'),
(2, 'browse_bread', NULL, '2022-04-11 22:52:29', '2022-04-11 22:52:29'),
(3, 'browse_database', NULL, '2022-04-11 22:52:29', '2022-04-11 22:52:29'),
(4, 'browse_media', NULL, '2022-04-11 22:52:29', '2022-04-11 22:52:29'),
(5, 'browse_compass', NULL, '2022-04-11 22:52:29', '2022-04-11 22:52:29'),
(6, 'browse_menus', 'menus', '2022-04-11 22:52:29', '2022-04-11 22:52:29'),
(7, 'read_menus', 'menus', '2022-04-11 22:52:29', '2022-04-11 22:52:29'),
(8, 'edit_menus', 'menus', '2022-04-11 22:52:29', '2022-04-11 22:52:29'),
(9, 'add_menus', 'menus', '2022-04-11 22:52:29', '2022-04-11 22:52:29'),
(10, 'delete_menus', 'menus', '2022-04-11 22:52:29', '2022-04-11 22:52:29'),
(11, 'browse_roles', 'roles', '2022-04-11 22:52:29', '2022-04-11 22:52:29'),
(12, 'read_roles', 'roles', '2022-04-11 22:52:29', '2022-04-11 22:52:29'),
(13, 'edit_roles', 'roles', '2022-04-11 22:52:29', '2022-04-11 22:52:29'),
(14, 'add_roles', 'roles', '2022-04-11 22:52:29', '2022-04-11 22:52:29'),
(15, 'delete_roles', 'roles', '2022-04-11 22:52:29', '2022-04-11 22:52:29'),
(16, 'browse_users', 'users', '2022-04-11 22:52:29', '2022-04-11 22:52:29'),
(17, 'read_users', 'users', '2022-04-11 22:52:29', '2022-04-11 22:52:29'),
(18, 'edit_users', 'users', '2022-04-11 22:52:29', '2022-04-11 22:52:29'),
(19, 'add_users', 'users', '2022-04-11 22:52:29', '2022-04-11 22:52:29'),
(20, 'delete_users', 'users', '2022-04-11 22:52:29', '2022-04-11 22:52:29'),
(21, 'browse_settings', 'settings', '2022-04-11 22:52:29', '2022-04-11 22:52:29'),
(22, 'read_settings', 'settings', '2022-04-11 22:52:29', '2022-04-11 22:52:29'),
(23, 'edit_settings', 'settings', '2022-04-11 22:52:29', '2022-04-11 22:52:29'),
(24, 'add_settings', 'settings', '2022-04-11 22:52:29', '2022-04-11 22:52:29'),
(25, 'delete_settings', 'settings', '2022-04-11 22:52:29', '2022-04-11 22:52:29'),
(26, 'browse_categories', 'categories', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(27, 'read_categories', 'categories', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(28, 'edit_categories', 'categories', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(29, 'add_categories', 'categories', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(30, 'delete_categories', 'categories', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(31, 'browse_posts', 'posts', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(32, 'read_posts', 'posts', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(33, 'edit_posts', 'posts', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(34, 'add_posts', 'posts', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(35, 'delete_posts', 'posts', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(36, 'browse_pages', 'pages', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(37, 'read_pages', 'pages', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(38, 'edit_pages', 'pages', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(39, 'add_pages', 'pages', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(40, 'delete_pages', 'pages', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(41, 'browse_professeurs', 'professeurs', '2022-04-12 13:24:18', '2022-04-12 13:24:18'),
(42, 'read_professeurs', 'professeurs', '2022-04-12 13:24:18', '2022-04-12 13:24:18'),
(43, 'edit_professeurs', 'professeurs', '2022-04-12 13:24:18', '2022-04-12 13:24:18'),
(44, 'add_professeurs', 'professeurs', '2022-04-12 13:24:18', '2022-04-12 13:24:18'),
(45, 'delete_professeurs', 'professeurs', '2022-04-12 13:24:18', '2022-04-12 13:24:18'),
(46, 'browse_specialities', 'specialities', '2022-04-12 13:31:34', '2022-04-12 13:31:34'),
(47, 'read_specialities', 'specialities', '2022-04-12 13:31:34', '2022-04-12 13:31:34'),
(48, 'edit_specialities', 'specialities', '2022-04-12 13:31:34', '2022-04-12 13:31:34'),
(49, 'add_specialities', 'specialities', '2022-04-12 13:31:34', '2022-04-12 13:31:34'),
(50, 'delete_specialities', 'specialities', '2022-04-12 13:31:34', '2022-04-12 13:31:34'),
(51, 'browse_dossiers', 'dossiers', '2022-04-13 15:32:56', '2022-04-13 15:32:56'),
(52, 'read_dossiers', 'dossiers', '2022-04-13 15:32:56', '2022-04-13 15:32:56'),
(53, 'edit_dossiers', 'dossiers', '2022-04-13 15:32:56', '2022-04-13 15:32:56'),
(54, 'add_dossiers', 'dossiers', '2022-04-13 15:32:56', '2022-04-13 15:32:56'),
(55, 'delete_dossiers', 'dossiers', '2022-04-13 15:32:56', '2022-04-13 15:32:56');

-- --------------------------------------------------------

--
-- Structure de la table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 1),
(2, 4),
(3, 1),
(3, 4),
(4, 1),
(4, 4),
(5, 1),
(5, 4),
(6, 1),
(6, 4),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(11, 4),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(16, 4),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(21, 4),
(22, 1),
(22, 4),
(23, 1),
(23, 4),
(24, 1),
(24, 4),
(25, 1),
(25, 4),
(26, 1),
(26, 4),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(31, 4),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(36, 3),
(36, 4),
(37, 1),
(37, 3),
(38, 1),
(38, 3),
(39, 1),
(39, 3),
(40, 1),
(40, 3),
(41, 1),
(41, 4),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(46, 4),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(51, 4),
(52, 1),
(53, 1),
(54, 1),
(54, 3),
(55, 1);

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `professeurs`
--

CREATE TABLE `professeurs` (
  `id` int(10) UNSIGNED NOT NULL,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Prenom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cin` int(11) DEFAULT NULL,
  `numdrpp` int(11) DEFAULT NULL,
  `Daterecrutement` date DEFAULT NULL,
  `Telephone` int(11) DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateNaissance` date DEFAULT NULL,
  `profappaensa` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specialite` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `structureRecherche` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `DirecteurStructureRecherche` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2022-04-11 22:52:29', '2022-04-11 22:52:29'),
(3, 'Professeurs', 'Professeurs', '2022-04-12 13:46:56', '2022-04-12 13:46:56'),
(4, 'SuperAdmin', 'Superadmin', '2022-04-12 13:47:29', '2022-04-12 13:47:29');

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\April2022\\8rJxxNNuYbvBeye2Ic3G.jfif', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'ENSAJ', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Bienvenu a notre site WEB', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', 'settings\\April2022\\SENGbcOvzhxnALWG4DWv.jfif', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\April2022\\Nt17zXr0IYJMpYKNfHJh.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '10121592855-k166670v5s49r00mi6efat6i4rs7oih8.apps.googleusercontent.com', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Structure de la table `specialities`
--

CREATE TABLE `specialities` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `Nom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `specialities`
--

INSERT INTO `specialities` (`id`, `created_at`, `updated_at`, `Nom`) VALUES
(1, '2022-04-12 13:34:51', '2022-04-12 13:34:51', 'Informatique'),
(2, '2022-04-12 13:35:07', '2022-04-12 13:35:07', 'Industielle');

-- --------------------------------------------------------

--
-- Structure de la table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2022-04-11 22:52:30', '2022-04-11 22:52:30'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2022-04-11 22:52:30', '2022-04-11 22:52:30');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cin` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prenom` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numDRPP` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateRecrutement` date DEFAULT NULL,
  `dateNaissance` date DEFAULT NULL,
  `profappaensa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `structureRecherche` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DirecteurStructureRecherche` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specialite` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `cin`, `prenom`, `photo`, `numDRPP`, `dateRecrutement`, `dateNaissance`, `profappaensa`, `structureRecherche`, `DirecteurStructureRecherche`, `specialite`, `telephone`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$lh0n5mUGVhbKXGvx2PgBsujk2thZYc1He.jU4TT8zi0STVEcAKZ6u', 'GkDiWtxTHevEDuPg4MKqDABJY3wf2aPLyJsGRKQBcxZ5Ro8I0WbFIul5ka8K', NULL, '2022-04-11 22:52:30', '2022-04-11 22:52:30', '188872', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 3, 'Kaouthar Ed-Daif', 'kawtardaif@yahoo.com', 'users/default.png', NULL, '$2y$10$zEI4nHWvxFPvALysDkZz/uWLs0H.W9kEKaXviNX5ObQn/Jl9bISTu', NULL, '{\"locale\":\"en\"}', '2022-04-12 14:30:31', '2022-04-12 15:44:01', 'KB123', 'Ed-Daif', '[]', '12', '2005-09-11', '2001-04-30', '1', 'cv', 'mr cv', 'info', 604657716),
(3, NULL, 'jj', 'kawtardaif@hotmail.com', 'users/default.png', NULL, '$2y$10$8od/cfLdCh2.SGKLtZqHAuKLJt/ZcWVx5G8giLqiZNfQLfySduwW.', NULL, NULL, '2022-04-13 21:13:42', '2022-04-13 21:13:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 3, 'kiki', 'kiki@gmail.com', 'users/default.png', NULL, '$2y$10$Zk4iAugsUtlMswvXN8FXPOR4abn3W3ZNlLiG2DMtBdBLbcWC/5/p6', NULL, NULL, '2022-04-13 21:16:08', '2022-04-13 21:16:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 3, 'kawtar', 'kakuyusuf2016@gmail.com', 'users/default.png', NULL, '$2y$10$iCqVJakomoWsYBl/eHZbMeDmAJwrWPFF4QTtDwjUckV7zCnaEb0uS', NULL, NULL, '2022-04-15 03:40:51', '2022-04-15 03:40:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 3, 'Kaouthar Ed-Daif', 'beckylucie123@gmail.com', 'users/default.png', NULL, '$2y$10$sIoTJjFF1NU/boExLhoIN..82PGGZS4P7.5B/axQ1kmI6X/ZVvoL.', 'rJDVisjbzWXN2IVzoVHMYgSfktfxcUHF87VkkbsFELpgCciRr13CxoVo3IvD', '{\"locale\":\"en\"}', '2022-04-15 03:44:03', '2022-04-15 16:47:12', NULL, NULL, '[]', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL),
(7, 3, 'prof1', 'prof1@gmail.com', 'users/default.png', '2022-04-15 12:06:39', '$2y$10$ntaks3d6zkVtHqDmseEllO1ZTqSWoKJpUxozsfkoLPUOct2rUv6km', NULL, NULL, '2022-04-15 12:06:20', '2022-04-15 12:06:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 3, 'kawtar', 'kawtardaif123@hotmail.com', 'users/default.png', NULL, '$2y$10$nVJVbvW4GdNF8pt8bF.NXO6e.7H0rweOE.jdY2C9InXviMlidWswq', '0aq19rykQO5EbPUYfsIFlURritqeH5Uo3cEl9oO0B6bk7r30ZGQRPqzQMYXF', '{\"locale\":\"en\"}', '2022-04-15 17:45:26', '2022-04-15 17:48:10', 'kb1234', 'daif', '[]', '5', '2022-04-06', NULL, '1', NULL, NULL, NULL, NULL),
(9, 3, 'kawtar', 'kawtardaif1234@yahoo.com', 'users/default.png', NULL, '$2y$10$yoAaQxnOh2hTBE63mbXdIeu3pmb7agjzHZcxSoenmqxHgkSMYgFFO', NULL, NULL, '2022-04-15 18:07:54', '2022-04-15 18:07:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 3, 'kawtar', 'kawtar12345@gmail.com', 'users/default.png', '2022-04-15 18:10:46', '$2y$10$CdiKHphinqi3pJFlrRAbZutAu8kaZ8o.41Vr.TkihLiukn67PFZ8O', NULL, NULL, '2022-04-15 18:10:27', '2022-04-15 18:10:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 3, 'kaouthar', 'kawtardaif1@gmail.com', 'users/default.png', NULL, '$2y$10$m2MtrBlXsOKTwzk7dV0M3uDS7L715DW5CHWGnGfsgtN3wOd0vtGbK', NULL, NULL, '2022-04-15 18:14:31', '2022-04-15 18:14:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 3, 'Kaouthar Ed-Daif', 'kawtardaif8@yahoo.com', 'users/default.png', NULL, '$2y$10$IJfw3/ijI7sqCkGprW35wuwVZsublNDdhTrTsIgl3hgj736DIcagq', NULL, NULL, '2022-04-15 18:17:12', '2022-04-15 18:17:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 3, 'kaouthar', 'kawtardaif12@yahoo.com', 'users/default.png', NULL, '$2y$10$5px2qJWJ1UY2Hrr5xvefzu6blH2M68rh5CsblqJeTzvKEbbmnZXgi', NULL, NULL, '2022-04-15 18:18:42', '2022-04-15 18:18:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 3, 'kaouthar', 'kawtardaif555@yahoo.com', 'users/default.png', NULL, '$2y$10$tsrCsqoQmHn32.UoXtO3e.6nI5LV/BFAENS5IvK.Y6uzcs9jz2wya', NULL, '{\"locale\":\"en\"}', '2022-04-15 18:19:47', '2022-04-15 18:20:44', NULL, NULL, '[]', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL),
(15, 3, 'kawtar', 'kawtar1255@yahoo.com', 'users\\April2022\\TfecubCVDtiM4V1p8Cqq.jpeg', NULL, '$2y$10$ZLo.g8JQvpHLR4aynoNkg./28Y66SlVnsHWKlthKX984OS.D.jePa', NULL, '{\"locale\":\"en\"}', '2022-04-15 18:21:53', '2022-04-15 18:22:25', 'kn23456', NULL, '[]', '5', NULL, NULL, '1', 'info', NULL, 'info', NULL),
(16, 3, 'kawtaru', 'kawtaru77@gmail.com', 'users/default.png', '2022-04-15 18:26:35', '$2y$10$EPwkNEex5ZXfpauDCjZr1u1fhLHqL0AXmsPIQUvcvjm9n21Bj/NjC', NULL, NULL, '2022-04-15 18:26:23', '2022-04-15 18:26:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 3, 'kawtaruu', 'kawtaruu@gmail.com', 'users\\April2022\\IBb32PoM20vsROMCf71d.jpeg', NULL, '$2y$10$awGfh66aVtlNkEYBswgK0eBarS9apQTlnVwDHzDEhSkXKTR7MWGdW', NULL, '{\"locale\":\"en\"}', '2022-04-15 18:28:05', '2022-04-15 18:28:39', 'kn1223', NULL, '[]', '8', NULL, NULL, '1', NULL, NULL, NULL, 78647865),
(18, 3, 'professeur1', 'professeur1@yahoo.com', 'users\\April2022\\zC6Iyq9lqbts5aX6LXb1.jpg', '2022-04-15 18:36:10', '$2y$10$XwrAg1W8orOeecmXiHMqLO3gaTQGVOn0dx4KppLSEuciz9KxZ4GZG', 'yoFQhcPpYL4st2yt9189qBgW5ZUMwwdFhdT3wLLyOS8SdoedrHEy562SVvpz', '{\"locale\":\"en\"}', '2022-04-15 18:33:44', '2022-04-15 18:36:55', NULL, NULL, '[]', '12', NULL, NULL, '1', NULL, NULL, NULL, 678743572),
(19, 3, 'sara', 'sara123@gmail.com', 'users/default.png', NULL, '$2y$10$t7pVDNj6LsNzZN8oNCogFerWRCjFaubVZop.Z9BT4atvbWKk0hKF6', NULL, '{\"locale\":\"en\"}', '2022-04-15 20:57:56', '2022-04-15 21:01:46', NULL, NULL, '[]', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL),
(20, 3, 'professeur2', 'professeur2@gmail.com', 'users\\April2022\\MdhW5Ez89t1SGXY1V8ij.jpg', NULL, '$2y$10$s3rATSW4/DwTRYHuONIZPuVRlvjAIKhLULNNd9C.259ssQdGEOs5i', NULL, '{\"locale\":\"en\"}', '2022-04-15 21:40:21', '2022-04-15 21:41:06', 'jh12345', 'salimi', '[]', '3', NULL, NULL, '1', NULL, NULL, 'info', 9767556),
(21, 3, 'professeur3', 'professeur3@gmail.com', 'users\\April2022\\wqoFJr3uXN6Rf6aGluHb.png', NULL, '$2y$10$hGHZcK8UbyM7O99wyEfvlenmP0GQYqwK.8Pmtap6gQkFvUMHP0p2C', 'FnsMwoNXAylE1LZHrcBDmsCoOqIV5sNDf3g49xOnaZsVZkjabbIus280hYwK', '{\"locale\":\"en\"}', '2022-04-15 21:56:25', '2022-04-15 21:59:35', 'kb12345', 'salimi', '[]', '2', NULL, NULL, '0', NULL, NULL, NULL, 6863783);

-- --------------------------------------------------------

--
-- Structure de la table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Index pour la table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Index pour la table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Index pour la table `dossiers`
--
ALTER TABLE `dossiers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Index pour la table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Index pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Index pour la table `professeurs`
--
ALTER TABLE `professeurs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Index pour la table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Index pour la table `specialities`
--
ALTER TABLE `specialities`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Index pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT pour la table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `dossiers`
--
ALTER TABLE `dossiers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `professeurs`
--
ALTER TABLE `professeurs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `specialities`
--
ALTER TABLE `specialities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Contraintes pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

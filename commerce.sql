-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 15, 2020 at 06:20 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `commerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `label`) VALUES
(1, 'Carte Mère'),
(2, 'Carte Graphique'),
(3, 'CPU'),
(4, 'Boitier'),
(5, 'Ecran'),
(6, 'Souris'),
(7, 'Clavier'),
(8, 'Ventilateur');

-- --------------------------------------------------------

--
-- Table structure for table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20200229143505', '2020-02-29 14:38:39'),
('20200312095346', '2020-03-12 09:58:16'),
('20200312160201', '2020-03-12 16:06:19');

-- --------------------------------------------------------

--
-- Table structure for table `product_table`
--

DROP TABLE IF EXISTS `product_table`;
CREATE TABLE IF NOT EXISTS `product_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `categorie` int(11) NOT NULL,
  `sous_categorie` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marque` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `couleur` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `in_stock` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_table`
--

INSERT INTO `product_table` (`id`, `name`, `price`, `categorie`, `sous_categorie`, `description`, `photo`, `marque`, `couleur`, `in_stock`) VALUES
(1, 'Carte mere 1', 150, 1, 'atx', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas efficitur ipsum ut felis consequat, non ullamcorper quam ultricies. Pellentesque vel nisl ac est pretium posuere. Vivamus eget mi orci. Suspendisse hendrerit arcu iaculis, sollicitudin tellus a, dictum ligula. Duis efficitur porttitor purus vel pulvinar. Proin tempor tincidunt lacus in lacinia. Curabitur elementum, magna in mollis posuere, augue felis scelerisque ligula, vel ultrices tortor nunc quis arcu. Curabitur tempus leo arcu, ut mattis eros semper vitae. Integer posuere pharetra lorem non cursus. Suspendisse fermentum quis risus tristique malesuada. Praesent mattis tristique lorem, lobortis euismod sem iaculis vel. Morbi nisl velit, consectetur sagittis luctus vitae, efficitur quis magna. Nullam elementum, leo sed convallis vulputate, sapien tortor sagittis felis, auctor venenatis odio nisl et turpis. Nam a ultrices neque. In hac habitasse platea dictumst.', 'http://placehold.it/200x200', 'marque carte mere', NULL, 1),
(2, 'Carte Mere n1', 147.8, 1, 'mini-atx', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas efficitur ipsum ut felis consequat, non ullamcorper quam ultricies. Pellentesque vel nisl ac est pretium posuere. Vivamus eget mi orci. Suspendisse hendrerit arcu iaculis, sollicitudin tellus a, dictum ligula. Duis efficitur porttitor purus vel pulvinar. Proin tempor tincidunt lacus in lacinia. Curabitur elementum, magna in mollis posuere, augue felis scelerisque ligula, vel ultrices tortor nunc quis arcu. Curabitur tempus leo arcu, ut mattis eros semper vitae. Integer posuere pharetra lorem non cursus. Suspendisse fermentum quis risus tristique malesuada. Praesent mattis tristique lorem, lobortis euismod sem iaculis vel. Morbi nisl velit, consectetur sagittis luctus vitae, efficitur quis magna. Nullam elementum, leo sed convallis vulputate, sapien tortor sagittis felis, auctor venenatis odio nisl et turpis. Nam a ultrices neque. In hac habitasse platea dictumst.', 'http://placehold.it/300x350', 'Marque carte mere', NULL, 1),
(3, 'Carte graphique n1', 467.4, 2, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas efficitur ipsum ut felis consequat, non ullamcorper quam ultricies. Pellentesque vel nisl ac est pretium posuere. Vivamus eget mi orci. Suspendisse hendrerit arcu iaculis, sollicitudin tellus a, dictum ligula. Duis efficitur porttitor purus vel pulvinar. Proin tempor tincidunt lacus in lacinia. Curabitur elementum, magna in mollis posuere, augue felis scelerisque ligula, vel ultrices tortor nunc quis arcu. Curabitur tempus leo arcu, ut mattis eros semper vitae. Integer posuere pharetra lorem non cursus. Suspendisse fermentum quis risus tristique malesuada. Praesent mattis tristique lorem, lobortis euismod sem iaculis vel. Morbi nisl velit, consectetur sagittis luctus vitae, efficitur quis magna. Nullam elementum, leo sed convallis vulputate, sapien tortor sagittis felis, auctor venenatis odio nisl et turpis. Nam a ultrices neque. In hac habitasse platea dictumst.', 'http://placehold.it/300x350', 'Marque carte graphique n2', NULL, 1),
(4, 'CPU intel core n1', 246, 3, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas efficitur ipsum ut felis consequat, non ullamcorper quam ultricies. Pellentesque vel nisl ac est pretium posuere. Vivamus eget mi orci. Suspendisse hendrerit arcu iaculis, sollicitudin tellus a, dictum ligula. Duis efficitur porttitor purus vel pulvinar. Proin tempor tincidunt lacus in lacinia. Curabitur elementum, magna in mollis posuere, augue felis scelerisque ligula, vel ultrices tortor nunc quis arcu. Curabitur tempus leo arcu, ut mattis eros semper vitae. Integer posuere pharetra lorem non cursus. Suspendisse fermentum quis risus tristique malesuada. Praesent mattis tristique lorem, lobortis euismod sem iaculis vel. Morbi nisl velit, consectetur sagittis luctus vitae, efficitur quis magna. Nullam elementum, leo sed convallis vulputate, sapien tortor sagittis felis, auctor venenatis odio nisl et turpis. Nam a ultrices neque. In hac habitasse platea dictumst.', 'http://placehold.it/300x350', 'Marque CPU', NULL, 1),
(5, 'Boitier sympathique', 75, 4, 'micro-atx', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas efficitur ipsum ut felis consequat, non ullamcorper quam ultricies. Pellentesque vel nisl ac est pretium posuere. Vivamus eget mi orci. Suspendisse hendrerit arcu iaculis, sollicitudin tellus a, dictum ligula. Duis efficitur porttitor purus vel pulvinar. Proin tempor tincidunt lacus in lacinia. Curabitur elementum, magna in mollis posuere, augue felis scelerisque ligula, vel ultrices tortor nunc quis arcu. Curabitur tempus leo arcu, ut mattis eros semper vitae. Integer posuere pharetra lorem non cursus. Suspendisse fermentum quis risus tristique malesuada. Praesent mattis tristique lorem, lobortis euismod sem iaculis vel. Morbi nisl velit, consectetur sagittis luctus vitae, efficitur quis magna. Nullam elementum, leo sed convallis vulputate, sapien tortor sagittis felis, auctor venenatis odio nisl et turpis. Nam a ultrices neque. In hac habitasse platea dictumst.', 'http://placehold.it/300x350', 'Marque boitier', 'rouge', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sub_catégories`
--

DROP TABLE IF EXISTS `sub_catégories`;
CREATE TABLE IF NOT EXISTS `sub_catégories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

DROP TABLE IF EXISTS `user_table`;
CREATE TABLE IF NOT EXISTS `user_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`id`, `username`, `password`) VALUES
(2, 'salut', '$2y$13$bQ3TPpXjW0IzOpVXe1RzKe5fA9EXZVi5cx7SMrlqUPP49gWzujREm');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

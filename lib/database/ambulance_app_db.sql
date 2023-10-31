-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 31, 2023 at 05:35 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ambulance_app_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `merchant_name` longtext NOT NULL,
  `merchant_address` longtext NOT NULL,
  `cellphone` varchar(25) NOT NULL,
  `email_address` longtext NOT NULL,
  `town_city` varchar(150) NOT NULL,
  `username` varchar(150) NOT NULL,
  `password` longtext NOT NULL,
  `user_profile` longtext NOT NULL,
  `user_type` varchar(150) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `merchant_name`, `merchant_address`, `cellphone`, `email_address`, `town_city`, `username`, `password`, `user_profile`, `user_type`, `date_created`, `date_modified`) VALUES
(1, '$merchant_name', '$merchant_address', '$cellphone', '$email_address', '$town_city', '$username', '$password', '$user_profile', '', '2023-10-29 17:56:41', NULL),
(2, 'nnnn', 'nnndnd', 'mmdmmd', 'jjjfjjf', 'jjfjjf', 'iririr', '12345', '', '', '2023-10-30 22:27:43', NULL),
(3, 'Elifas Andreas', 'Katutura', '0815893186', 'none', 'Windhoek', 'Elly', '1234', '', '', '2023-10-30 22:51:00', NULL),
(4, 'Elifas Andreas', 'Katutura', '0815893186', 'none', 'Windhoek', 'Ellydiamond', '1234', '', 'user', '2023-10-30 22:53:03', NULL),
(5, 'Anna Kalimbo', 'Erf 1234, Jack Street', '0812345678', 'annak@gmail.com', 'Windhoek', 'anna', '1234', '', 'user', '2023-10-31 05:32:10', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

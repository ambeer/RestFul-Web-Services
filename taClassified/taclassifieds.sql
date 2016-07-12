-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 09, 2016 at 06:07 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `taclassifieds`
--
CREATE DATABASE IF NOT EXISTS `taclassifieds` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `taclassifieds`;

-- --------------------------------------------------------

--
-- Table structure for table `classified`
--

CREATE TABLE IF NOT EXISTS `classified` (
  `classifiedID` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `imagepath` varchar(200) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classified`
--

INSERT INTO `classified` (`classifiedID`, `name`, `description`, `price`, `imagepath`, `email`) VALUES
('TA1724', 'Want to sell my mobile', 'Want to sell my mobile phone', '5000', 'public/uploads/mobile-phone-banner.jpg', NULL),
('TA83531', 'Test', 'Test test', '10000', NULL, NULL),
('TA92583', 'Iphone 5s', 'with one year warranty', '20000', NULL, NULL),
('TA97262', 'test', 'test test', '10000', NULL, NULL),
('TA3850', 'TestTest', 'TestTestTestTest', '5000', 'public/uploads/CIBILScore.png', NULL),
('TA42848', 'Testtest', 'test', '1000', 'public/uploads/gitlab commands.png', NULL),
('TA67873', 'GopalTestTest', 'GopalTestTestGopalTestTest', '50000', 'public/uploads/localPSettings.jpg', NULL),
('TA2984', 'test classified', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', '4000', 'public/uploads/Lighthouse.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`password`, `email`, `phone`, `username`) VALUES
('testtest', 'amber.gopalrao@gmail.com', '9490408744', 'Gopal');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

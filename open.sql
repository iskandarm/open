-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 01, 2015 at 07:11 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `open`
--
CREATE DATABASE IF NOT EXISTS `open` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `open`;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `lastlogin` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`,`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `username`, `email`, `password`, `created_date`, `lastlogin`) VALUES
(1, 'iskandarm', 'iskandarm@live.com', '112233', '2015-07-01 00:28:29', '0000-00-00 00:00:00'),
(2, 'iskandarm1', 'iskandarm@live.com', '1234', '2015-07-01 01:10:52', '2015-07-01 01:14:54'),
(3, 'test', 'test@email.com', '333665', '2015-07-01 01:15:30', '0000-00-00 00:00:00'),
(4, 'iskandarm12', 'iskandarm2@live.com', '12345', '2015-07-01 01:16:11', '0000-00-00 00:00:00'),
(5, 'alex', 'alex@alex.com', '3654', '2015-07-01 01:19:44', '0000-00-00 00:00:00'),
(6, 'ahmad', 'ahmad@email.com', 'ahmad', '2015-07-01 01:25:29', '0000-00-00 00:00:00'),
(7, 'test222', 'test222@email.com', 'test222', '2015-07-01 01:28:45', '0000-00-00 00:00:00'),
(8, 'test41414', 'test41414@email.com', 'test41414', '2015-07-01 01:29:58', '0000-00-00 00:00:00'),
(9, 'iskandarm123', 'iskandarm123@email.com', 'iskandarm123', '2015-07-01 01:33:25', '0000-00-00 00:00:00'),
(10, 'iskandarm', 't222est@email.com', '123', '2015-07-01 01:35:22', '0000-00-00 00:00:00'),
(11, 'aaaaa', 'aaaaa@email.com', 'aaaaa', '2015-07-01 01:39:51', '0000-00-00 00:00:00'),
(12, 'ccccc', 'ccccc@email.com', 'ccccc', '2015-07-01 01:41:11', '0000-00-00 00:00:00'),
(13, 'rrrrrr', 'rrrrrr@email.com', '', '2015-07-01 02:00:18', '0000-00-00 00:00:00'),
(14, 'iskandarm411', 'iskandarm411@email.com', '', '2015-07-01 02:04:23', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `last_edited_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_CUSTOMERID` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `title`, `description`, `customer_id`, `created_date`, `last_edited_date`) VALUES
(2, 'test', 'test2 ', 1, '2015-07-01 00:42:10', '2015-06-30 21:42:10');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_CUSTOMERID` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

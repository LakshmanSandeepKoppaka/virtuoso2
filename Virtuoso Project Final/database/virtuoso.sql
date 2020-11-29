-- MySQL dump 10.10
--
-- Host: localhost    Database: virtuoso
-- ------------------------------------------------------
-- Server version	5.0.18-nt

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE virtuoso;
USE virtuoso;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
CREATE TABLE `album` (
  `id` int(11) NOT NULL auto_increment,
  `al_name` varchar(100) NOT NULL,
  `al_artist_name` varchar(100) NOT NULL,
  `al_price` varchar(100) NOT NULL,
  `al_desc` text NOT NULL,
  `al_image` varchar(100) default NULL,
  `al_img_blob` longblob,
  `al_audio` varchar(100) NOT NULL,
  `al_aud_blob` longblob,
  `al_category` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `album`
--


/*!40000 ALTER TABLE `album` DISABLE KEYS */;
LOCK TABLES `album` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `album` ENABLE KEYS */;

--
-- Table structure for table `event_reg`
--

DROP TABLE IF EXISTS `event_reg`;
CREATE TABLE `event_reg` (
  `id` int(11) NOT NULL auto_increment,
  `ev_name` varchar(100) NOT NULL,
  `ev_price` varchar(100) NOT NULL,
  `ev_date` date default NULL,
  `ev_time` varchar(100) NOT NULL,
  `ev_location` varchar(500) NOT NULL,
  `ev_coord_name` varchar(100) NOT NULL,
  `ev_coord_mobile` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `ev_total_tickets` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_reg`
--


/*!40000 ALTER TABLE `event_reg` DISABLE KEYS */;
LOCK TABLES `event_reg` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `event_reg` ENABLE KEYS */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL auto_increment,
  `pr_name` varchar(100) NOT NULL,
  `pr_price` int(11) NOT NULL,
  `pr_quantity` varchar(100) NOT NULL,
  `pr_desc` longtext NOT NULL,
  `pr_stock` varchar(100) NOT NULL,
  `pr_image` text,
  `blob_img` longblob,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--


/*!40000 ALTER TABLE `product` DISABLE KEYS */;
LOCK TABLES `product` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

--
-- Table structure for table `reg`
--

DROP TABLE IF EXISTS `reg`;
CREATE TABLE `reg` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `dob` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg`
--


/*!40000 ALTER TABLE `reg` DISABLE KEYS */;
LOCK TABLES `reg` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `reg` ENABLE KEYS */;

--
-- Table structure for table `user_event`
--

DROP TABLE IF EXISTS `user_event`;
CREATE TABLE `user_event` (
  `id` int(11) NOT NULL auto_increment,
  `eid` varchar(100) NOT NULL,
  `e_price` varchar(100) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `total_amount` varchar(100) NOT NULL,
  `card_type` varchar(100) NOT NULL,
  `acc_holder_name` varchar(100) NOT NULL,
  `acc_number` varchar(100) NOT NULL,
  `cvv` varchar(100) NOT NULL,
  `exp_date` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_event`
--


/*!40000 ALTER TABLE `user_event` DISABLE KEYS */;
LOCK TABLES `user_event` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `user_event` ENABLE KEYS */;

--
-- Table structure for table `user_product`
--

DROP TABLE IF EXISTS `user_product`;
CREATE TABLE `user_product` (
  `id` int(11) NOT NULL auto_increment,
  `product_id` varchar(100) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `user_qnty` varchar(100) NOT NULL,
  `pr_status` varchar(100) NOT NULL,
  `card_no` varchar(100) NOT NULL,
  `card_type` varchar(100) NOT NULL,
  `pr_total_amount` varchar(100) NOT NULL,
  `acc_name` varchar(100) NOT NULL,
  `cvv` varchar(100) NOT NULL,
  `expiry_date` varchar(100) NOT NULL,
  `total_price` varchar(100) NOT NULL,
  `shipping_address` longtext NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_product`
--


/*!40000 ALTER TABLE `user_product` DISABLE KEYS */;
LOCK TABLES `user_product` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `user_product` ENABLE KEYS */;

--
-- Table structure for table `user_song`
--

DROP TABLE IF EXISTS `user_song`;
CREATE TABLE `user_song` (
  `id` int(11) NOT NULL auto_increment,
  `song_id` varchar(100) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `aud_status` varchar(100) NOT NULL,
  `card_no` varchar(100) NOT NULL,
  `card_type` varchar(100) NOT NULL,
  `acc_name` varchar(100) NOT NULL,
  `cvv` varchar(100) NOT NULL,
  `expiry_date` varchar(100) NOT NULL,
  `song_price` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_song`
--


/*!40000 ALTER TABLE `user_song` DISABLE KEYS */;
LOCK TABLES `user_song` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `user_song` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


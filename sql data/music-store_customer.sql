-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: 127.0.0.1    Database: music-store
-- ------------------------------------------------------
-- Server version	5.7.17-log

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

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `mobile_no` varchar(45) NOT NULL,
  `address` varchar(100) NOT NULL,
  `enabled` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`email`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (100,'Nasif','Noman','naasifn@gmail.com','01703412261','Patuakhali','false'),(101,'Mizanur','Rahman','mizanbd@gmail.com','01721002222','Patuakhali','true'),(112,'Abdullah','Hossain','abdullah@pictutorial.net','01811002222','Patuakhali','true'),(113,'Abdur','Rahman','rony.cse.pstu@pictutorial.net','01738559391','Patuakhali','true'),(114,'kabir','Kashem','kabir@yahoo.com','01721002555','Barishal','true'),(116,'Golam','Mahmud','golam@gmail.com','01721002444','Patuakhali','true'),(117,'Shona','Mia','shonamia@gmail.com','01721009999','Patuakhali','true'),(119,'Sad','Ullah','sad@gmail.com','01721007777','Patuakhali','true'),(121,'Mayn','Uddin','mayn@gmail.com','01768884345','Patuakhali South Sabujbag Patuakhali Barishal ','true'),(123,'Asif','karim','asif@gmail.com','01711002229','Nondipara','true'),(124,'Abdullah Omar','Nasif','nomaanads@gmail.com','01703412261','House-7, Road-1\r\nSouth Sabujbag Patuakhali,\r\nBangladesh. 8600','false'),(126,'Naasif','Mokles','mizanbdsd@gmail.com','3773883','patualhali','false'),(127,'Naasif','Nomaan','mizanbds@gmail.com','0-1788383','patuakhali','true'),(130,'Naasif','Nomaan','naasif@pictutorial.net','01815315994','Patuakhali','true'),(131,'Golam','William','naasifnx@gmail.com','3773883','Patuakhali','true'),(132,'Naasif','Nomaan','naasif@pictutorialw.net','01921992978','Patuakhali','true'),(133,'Moksed','Mokles','max14326@luv2code.com','017126133883','Patuakhali','true'),(134,'New','Customer','newcustomer@gmail.com','01703412261','Dhaka, Bangladesh','true');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-21 20:29:28

CREATE DATABASE  IF NOT EXISTS `ing` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ing`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: ing
-- ------------------------------------------------------
-- Server version	5.6.21-log

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
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access` (
  `id` int(11) unsigned NOT NULL,
  `target` int(11) unsigned NOT NULL,
  `type` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`id`,`target`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access`
--

LOCK TABLES `access` WRITE;
/*!40000 ALTER TABLE `access` DISABLE KEYS */;
INSERT INTO `access` VALUES (11701,11703,'10'),(11701,11704,'10'),(11701,11705,'10'),(11702,11703,'10'),(11702,11704,'10'),(11702,11705,'10'),(11703,11701,'1'),(11703,11702,'1'),(11704,11701,'1'),(11704,11702,'1'),(11705,11701,'1'),(11705,11702,'1');
/*!40000 ALTER TABLE `access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `token` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11705 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (11701,'Bearer eyJhbGciOiJIUzI1NiIsImN0eSI6InRleHRcL3BsYWluIn0.eyJleHAiOjE0MTUxMDQwMzUsIm5vbmNlIjoiZTUxMjRjOGUtYzQ5My00OGMyLWFkNDUtM2RiOWY4NGY3ZTg3IiwiYXVkIjpbImNsaWVudF9pZCJdLCJpc3MiOiJ1aWQxMTcwMSIsImp0aSI6IjRjN2M1NGVmLTM1ZDktNDJjZC04N2IyLWMwZmZjYjg1ZGE2YSIsImlhdCI6MTQxNTg4MTI4OH0.Uz-EQEC58roxeATLcisH765jx1K2qfeTvXgKyx14oK0'),(11702,'Bearer eyJhbGciOiJIUzI1NiIsImN0eSI6InRleHRcL3BsYWluIn0.eyJleHAiOjE0MTUwNjg1MjgsIm5vbmNlIjoiYTNhNzQ0YmUtN2M4My00ODRmLWIzMTQtN2VkMTc4ZmFiNTIyIiwiYXVkIjpbImNsaWVudF9pZCJdLCJpc3MiOiJ1aWQxMTcwMiIsImp0aSI6IjQ4NWY5NDZlLTIwMTktNDQ5Ni1iZTljLTIwY2EzYTYyYTIyNiIsImlhdCI6MTQxNTg0NTc4MX0.kPisrbuOb3VutX8vGWppoL2Abd_U9skaCBLhTNnk9SM'),(11703,'Bearer eyJhbGciOiJIUzI1NiIsImN0eSI6InRleHRcL3BsYWluIn0.eyJleHAiOjE0MTUxMDQwNjgsIm5vbmNlIjoiNjIzYzJlOTEtM2U5OC00ZGNmLWFlNzYtZjVlNTgyOGRlZGM2IiwiYXVkIjpbImNsaWVudF9pZCJdLCJpc3MiOiJ1aWQxMTcwMyIsImp0aSI6IjA1ZjEzNGFiLTI0MzgtNDM1MS1iZTc0LWJmMTllYmU4MGNlOSIsImlhdCI6MTQxNTg4MTMyMH0.D7JZGmV5TAFzAxaGqG_fKQ6DrUeqh0USYt7GbV6K62A'),(11704,'Bearer eyJhbGciOiJIUzI1NiIsImN0eSI6InRleHRcL3BsYWluIn0.eyJleHAiOjE0MTUxMDQwOTksIm5vbmNlIjoiMDJjZmM3YmYtYzE4Ni00YTNjLWJlYzktYmJhZmZmOTU3ZmJlIiwiYXVkIjpbImNsaWVudF9pZCJdLCJpc3MiOiJ1aWQxMTcwNCIsImp0aSI6IjRmYjBjZDMwLWEzMDgtNDQ4OC1hOTMxLTNiODI1M2MxMDZkMiIsImlhdCI6MTQxNTg4MTM1Mn0.JWnZjb9CJT3_Cwgr74tvLw_IFs3TM5Zu5LOcpDHPydA');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verzoeken`
--

DROP TABLE IF EXISTS `verzoeken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verzoeken` (
  `tid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `van` int(11) DEFAULT NULL,
  `naar` int(11) DEFAULT NULL,
  `vanIban` varchar(255) DEFAULT NULL,
  `naarIban` varchar(255) DEFAULT NULL,
  `bedrag` int(11) DEFAULT NULL,
  `notitie` text,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verzoeken`
--

LOCK TABLES `verzoeken` WRITE;
/*!40000 ALTER TABLE `verzoeken` DISABLE KEYS */;
INSERT INTO `verzoeken` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL),(2,NULL,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL),(11,11701,11704,'Iris Koppe','Johan Smid',100,'halloo'),(14,11701,11704,'Iris Koppe','Johan Smid',100,'These are groceries');
/*!40000 ALTER TABLE `verzoeken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-13 13:27:32

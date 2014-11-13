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
INSERT INTO `access` VALUES (11701,11702,'ouder'),(11701,11703,'ouder'),(11702,11701,'kind'),(11703,11701,'kind');
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
INSERT INTO `tokens` VALUES (11701,'Bearer eyJhbGciOiJIUzI1NiIsImN0eSI6InRleHRcL3BsYWluIn0.eyJleHAiOjE0MTUwNzA3NDcsIm5vbmNlIjoiZTM1ZDc4MDktMTczYy00OWUyLThjMjctNDAwM2YzM2Q3MzM4IiwiYXVkIjpbImNsaWVudF9pZCJdLCJpc3MiOiJ1aWQxMTcwMSIsImp0aSI6IjM4MGU3MTE4LWUyYTItNGQ1Zi1iYTRmLTY3OGI2N2E1NTFkOCIsImlhdCI6MTQxNTg0Nzk5OX0.VKyi17uaP5ep2_7la-sysz9hNZiMGjtVPZsHz79ScqA'),(11702,'Bearer eyJhbGciOiJIUzI1NiIsImN0eSI6InRleHRcL3BsYWluIn0.eyJleHAiOjE0MTUwNjg1MjgsIm5vbmNlIjoiYTNhNzQ0YmUtN2M4My00ODRmLWIzMTQtN2VkMTc4ZmFiNTIyIiwiYXVkIjpbImNsaWVudF9pZCJdLCJpc3MiOiJ1aWQxMTcwMiIsImp0aSI6IjQ4NWY5NDZlLTIwMTktNDQ5Ni1iZTljLTIwY2EzYTYyYTIyNiIsImlhdCI6MTQxNTg0NTc4MX0.kPisrbuOb3VutX8vGWppoL2Abd_U9skaCBLhTNnk9SM'),(11703,'Bearer eyJhbGciOiJIUzI1NiIsImN0eSI6InRleHRcL3BsYWluIn0.eyJleHAiOjE0MTUwNjg5NzIsIm5vbmNlIjoiY2ZkYWU4MGItM2E0Yi00MTM0LTgzZGYtODE4NGVkYmM1MDU5IiwiYXVkIjpbImNsaWVudF9pZCJdLCJpc3MiOiJ1aWQxMTcwMyIsImp0aSI6IjFlNzEyZmI4LTM3M2EtNDkxYS05YzhlLTJiNzUxZmQ4MWQ4NyIsImlhdCI6MTQxNTg0NjIyNH0.lePLhUAcPRg9JXY5vqBY_mQlj2CECTbCEWcvGgs4A_s'),(11704,'Bearer eyJhbGciOiJIUzI1NiIsImN0eSI6InRleHRcL3BsYWluIn0.eyJleHAiOjE0MTUwNjIxOTIsIm5vbmNlIjoiMTY2ZTBiOGEtN2ExYS00NGIyLTlkMzAtMjU1NmY3YmFjMTA0IiwiYXVkIjpbImNsaWVudF9pZCJdLCJpc3MiOiJ1aWQxMTcwNCIsImp0aSI6ImI1NjQ2YzMwLWM5MDEtNGRmNy05NGFjLTAyMTMzMjlmZmM4NiIsImlhdCI6MTQxNTgzOTQ0NX0.bYjxCGEPpvTUxdoCFG8orzzO-j5YH-TS0d54b0-FrOQ');
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
  `vanIban` varchar(16) DEFAULT NULL,
  `naarIban` varchar(16) DEFAULT NULL,
  `bedrag` int(11) DEFAULT NULL,
  `notitie` text,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verzoeken`
--

LOCK TABLES `verzoeken` WRITE;
/*!40000 ALTER TABLE `verzoeken` DISABLE KEYS */;
INSERT INTO `verzoeken` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL),(2,NULL,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL);
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

-- Dump completed on 2014-11-13  4:53:01

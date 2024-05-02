-- MySQL dump 10.13  Distrib 5.7.24, for osx10.9 (x86_64)
--
-- Host: localhost    Database: CityLibrary
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `AUTHORS`
--

DROP TABLE IF EXISTS `AUTHORS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHORS` (
  `PID` int NOT NULL,
  `DOCID` int NOT NULL,
  PRIMARY KEY (`PID`,`DOCID`),
  KEY `DOCID` (`DOCID`),
  CONSTRAINT `authors_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `PERSON` (`PID`),
  CONSTRAINT `authors_ibfk_2` FOREIGN KEY (`DOCID`) REFERENCES `BOOK` (`DOCID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHORS`
--

LOCK TABLES `AUTHORS` WRITE;
/*!40000 ALTER TABLE `AUTHORS` DISABLE KEYS */;
INSERT INTO `AUTHORS` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `AUTHORS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BOOK`
--

DROP TABLE IF EXISTS `BOOK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BOOK` (
  `DOCID` int NOT NULL,
  `ISBN` varchar(13) NOT NULL,
  PRIMARY KEY (`DOCID`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`DOCID`) REFERENCES `DOCUMENT` (`DOCID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOOK`
--

LOCK TABLES `BOOK` WRITE;
/*!40000 ALTER TABLE `BOOK` DISABLE KEYS */;
INSERT INTO `BOOK` VALUES (1,'0-9679-2960-1'),(2,'0-5634-7877-2'),(3,'0-5390-2424-4'),(4,'0-4851-7475-8'),(5,'0-2492-7116-8'),(6,'0-3719-5464-9'),(7,'0-8064-7777-6'),(8,'0-5613-2838-2'),(9,'0-1470-1981-8'),(10,'0-7239-3800-8');
/*!40000 ALTER TABLE `BOOK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BORROWING`
--

DROP TABLE IF EXISTS `BORROWING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BORROWING` (
  `BOR_NO` int NOT NULL AUTO_INCREMENT,
  `BDTIME` datetime NOT NULL,
  `RDTIME` datetime DEFAULT NULL,
  PRIMARY KEY (`BOR_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BORROWING`
--

LOCK TABLES `BORROWING` WRITE;
/*!40000 ALTER TABLE `BORROWING` DISABLE KEYS */;
INSERT INTO `BORROWING` VALUES (100,'2020-07-13 10:00:00','2020-07-28 11:00:00'),(101,'2020-08-01 15:00:00','2020-08-25 13:00:00'),(102,'2020-10-22 16:00:00','2020-10-23 14:00:00'),(103,'2020-12-23 08:00:00','2020-12-25 17:00:00'),(104,'2020-04-04 12:00:00','2020-04-10 09:00:00'),(105,'2020-05-05 14:30:00','2020-05-26 12:30:00'),(106,'2020-10-18 09:30:00','2020-10-29 16:30:00'),(107,'2010-01-01 00:00:00',NULL),(108,'2010-01-03 00:00:00','2010-01-19 00:00:00'),(109,'2010-01-02 00:00:00','2010-01-23 00:00:00'),(110,'2010-01-04 00:00:00',NULL),(111,'2010-01-04 00:00:00',NULL),(112,'2010-01-04 00:00:00','2010-01-07 00:00:00'),(113,'2010-01-02 00:00:00','2010-01-07 00:00:00'),(114,'2010-01-02 00:00:00','2010-01-23 00:00:00'),(115,'2010-01-02 00:00:00','2010-01-23 00:00:00'),(116,'2010-01-02 00:00:00','2010-01-23 00:00:00'),(117,'2010-01-02 00:00:00','2010-01-16 00:00:00'),(118,'2010-01-01 00:00:00','2010-01-18 00:00:00'),(119,'2010-01-04 00:00:00',NULL),(120,'2010-01-04 00:00:00',NULL),(121,'2010-01-03 00:00:00',NULL),(122,'2010-01-04 00:00:00','2010-01-23 00:00:00'),(123,'2010-01-02 00:00:00','2010-01-21 00:00:00'),(124,'2010-01-01 00:00:00','2010-01-22 00:00:00'),(125,'2010-01-04 00:00:00','2010-01-06 00:00:00'),(126,'2010-01-01 00:00:00','2010-01-15 00:00:00'),(127,'2010-01-02 00:00:00','2010-01-24 00:00:00'),(128,'2010-01-04 00:00:00','2010-01-06 00:00:00'),(129,'2010-01-04 00:00:00','2010-01-24 00:00:00'),(130,'2010-01-04 00:00:00','2010-01-08 00:00:00'),(131,'2010-01-01 00:00:00','2010-01-26 00:00:00'),(132,'2010-01-04 00:00:00','2010-01-24 00:00:00'),(133,'2010-01-03 00:00:00',NULL),(134,'2010-01-04 00:00:00',NULL),(135,'2010-01-02 00:00:00',NULL),(136,'2010-01-02 00:00:00','2010-01-08 00:00:00'),(137,'2010-01-04 00:00:00','2010-01-18 00:00:00'),(138,'2010-01-04 00:00:00','2010-01-15 00:00:00'),(139,'2010-01-04 00:00:00','2010-01-27 00:00:00'),(140,'2010-01-02 00:00:00','2010-01-23 00:00:00'),(141,'2010-01-01 00:00:00','2010-01-23 00:00:00'),(142,'2010-01-01 00:00:00','2010-01-11 00:00:00'),(143,'2010-01-04 00:00:00','2010-01-21 00:00:00'),(144,'2010-01-01 00:00:00',NULL),(145,'2010-01-01 00:00:00',NULL),(146,'2010-01-04 00:00:00',NULL),(147,'2010-01-04 00:00:00',NULL),(148,'2010-01-04 00:00:00','2010-01-17 00:00:00'),(149,'2010-01-01 00:00:00','2010-01-14 00:00:00'),(150,'2010-01-04 00:00:00','2010-01-07 00:00:00'),(151,'2010-01-03 00:00:00','2010-01-10 00:00:00'),(152,'2010-01-01 00:00:00','2010-01-12 00:00:00'),(153,'2010-01-04 00:00:00','2010-01-19 00:00:00'),(154,'2010-01-04 00:00:00','2010-01-24 00:00:00'),(155,'2010-01-01 00:00:00','2010-01-13 00:00:00'),(156,'2010-01-04 00:00:00','2010-01-26 00:00:00'),(157,'2010-01-04 00:00:00','2010-01-16 00:00:00'),(158,'2010-01-01 00:00:00','2010-01-17 00:00:00'),(159,'2010-01-02 00:00:00','2010-01-23 00:00:00'),(160,'2010-01-03 00:00:00','2010-01-17 00:00:00'),(161,'2010-01-04 00:00:00','2010-01-18 00:00:00'),(162,'2010-01-01 00:00:00','2010-01-22 00:00:00'),(163,'2010-01-03 00:00:00','2010-01-12 00:00:00'),(164,'2010-01-03 00:00:00','2010-01-24 00:00:00'),(165,'2010-01-04 00:00:00','2010-01-23 00:00:00'),(166,'2010-01-04 00:00:00','2010-01-12 00:00:00');
/*!40000 ALTER TABLE `BORROWING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BORROWS`
--

DROP TABLE IF EXISTS `BORROWS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BORROWS` (
  `BOR_NO` int NOT NULL,
  `DOCID` int NOT NULL,
  `COPYNO` int NOT NULL,
  `BID` int NOT NULL,
  `RID` int NOT NULL,
  PRIMARY KEY (`BOR_NO`,`DOCID`,`COPYNO`,`BID`),
  KEY `DOCID` (`DOCID`,`COPYNO`,`BID`),
  CONSTRAINT `borrows_ibfk_1` FOREIGN KEY (`BOR_NO`) REFERENCES `BORROWING` (`BOR_NO`),
  CONSTRAINT `borrows_ibfk_2` FOREIGN KEY (`DOCID`, `COPYNO`, `BID`) REFERENCES `COPY` (`DOCID`, `COPYNO`, `BID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BORROWS`
--

LOCK TABLES `BORROWS` WRITE;
/*!40000 ALTER TABLE `BORROWS` DISABLE KEYS */;
INSERT INTO `BORROWS` VALUES (100,1,1,1,300),(101,1,2,1,302),(102,1,3,1,301),(103,1,4,1,304),(104,1,5,1,306),(105,1,6,1,305),(106,2,1,1,307),(107,2,2,1,308),(108,2,3,1,303),(109,2,4,1,309),(110,2,1,2,300),(111,2,2,2,300),(112,3,1,2,300),(113,3,2,2,300),(114,3,3,2,300),(115,4,1,3,300),(116,5,1,3,300),(117,5,2,3,300),(118,5,3,3,300),(119,6,1,4,300),(120,6,2,4,300),(121,6,3,4,300),(122,7,1,5,300),(123,7,2,5,300),(124,7,3,5,302),(125,8,1,6,302),(126,9,1,6,302),(127,10,1,6,302),(128,10,2,6,301),(129,2,1,2,301),(130,2,2,2,301),(131,3,1,2,301),(132,3,2,2,301),(133,3,3,2,306),(134,4,1,3,306),(135,5,1,3,306),(136,5,2,3,306),(137,5,3,3,305),(138,6,1,4,305),(139,6,2,4,305),(140,6,3,4,305),(141,7,1,5,305),(142,7,2,5,305),(143,7,3,5,305),(144,8,1,6,305),(145,9,1,6,303),(146,10,1,6,303),(147,10,2,6,303),(148,2,1,2,303),(149,2,2,2,303),(150,3,1,2,303),(151,3,2,2,303),(152,3,3,2,303),(153,4,1,3,304),(154,5,1,3,304),(155,5,2,3,304),(156,5,3,3,304),(157,6,1,4,304),(158,6,2,4,304),(159,6,3,4,304),(160,7,1,5,304),(161,7,2,5,307),(162,7,3,5,307),(163,8,1,6,307),(164,9,1,6,308),(165,10,1,6,308),(166,10,2,6,308);
/*!40000 ALTER TABLE `BORROWS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BRANCH`
--

DROP TABLE IF EXISTS `BRANCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BRANCH` (
  `BID` int NOT NULL,
  `LNAME` varchar(255) NOT NULL,
  `LOCATION` varchar(255) NOT NULL,
  PRIMARY KEY (`BID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BRANCH`
--

LOCK TABLES `BRANCH` WRITE;
/*!40000 ALTER TABLE `BRANCH` DISABLE KEYS */;
INSERT INTO `BRANCH` VALUES (1,'Nutley Library','Nutley'),(2,'Bloomfield Library','Bloomfield'),(3,'Parsippany Library','Parsippany'),(4,'Newark Library','Newark'),(5,'Morristown Library','Morristown'),(6,'Clifton Library','Clifton');
/*!40000 ALTER TABLE `BRANCH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CHAIRS`
--

DROP TABLE IF EXISTS `CHAIRS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CHAIRS` (
  `PID` int NOT NULL,
  `DOCID` int NOT NULL,
  PRIMARY KEY (`PID`,`DOCID`),
  KEY `DOCID` (`DOCID`),
  CONSTRAINT `chairs_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `PERSON` (`PID`),
  CONSTRAINT `chairs_ibfk_2` FOREIGN KEY (`DOCID`) REFERENCES `PROCEEDINGS` (`DOCID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHAIRS`
--

LOCK TABLES `CHAIRS` WRITE;
/*!40000 ALTER TABLE `CHAIRS` DISABLE KEYS */;
INSERT INTO `CHAIRS` VALUES (21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30);
/*!40000 ALTER TABLE `CHAIRS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COPY`
--

DROP TABLE IF EXISTS `COPY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COPY` (
  `DOCID` int NOT NULL,
  `COPYNO` int NOT NULL,
  `BID` int NOT NULL,
  `POSITION` varchar(255) NOT NULL,
  PRIMARY KEY (`DOCID`,`COPYNO`,`BID`),
  KEY `BID` (`BID`),
  CONSTRAINT `copy_ibfk_1` FOREIGN KEY (`DOCID`) REFERENCES `DOCUMENT` (`DOCID`),
  CONSTRAINT `copy_ibfk_2` FOREIGN KEY (`BID`) REFERENCES `BRANCH` (`BID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COPY`
--

LOCK TABLES `COPY` WRITE;
/*!40000 ALTER TABLE `COPY` DISABLE KEYS */;
INSERT INTO `COPY` VALUES (1,1,1,'001A03'),(1,1,2,'001B01'),(1,2,1,'001A03'),(1,2,2,'001B01'),(1,3,1,'001A03'),(1,4,1,'001A03'),(1,5,1,'001A03'),(1,6,1,'001A03'),(2,1,1,'001A04'),(2,1,2,'001B02'),(2,2,1,'001A04'),(2,2,2,'001B02'),(2,3,1,'001A04'),(2,4,1,'001A04'),(3,1,2,'001B02'),(3,2,2,'001B02'),(3,3,2,'001B02'),(4,1,3,'001C05'),(5,1,3,'001C05'),(5,2,3,'001C05'),(5,3,3,'001C05'),(6,1,4,'001C05'),(6,2,4,'001C05'),(6,3,4,'001C05'),(7,1,5,'001D01'),(7,2,5,'001D01'),(7,3,5,'001D01'),(8,1,6,'001D01'),(9,1,6,'001E01'),(10,1,6,'001E01'),(10,2,6,'001E01'),(11,1,1,'001A10'),(11,2,1,'001A10'),(11,3,1,'001A10'),(11,4,1,'001A10'),(11,5,1,'001A10'),(11,6,1,'001A10'),(13,1,1,'001A10'),(13,2,1,'001A10'),(13,3,1,'001A10'),(15,1,1,'001A10'),(15,2,1,'001A10'),(15,3,1,'001A10'),(15,4,1,'001A10'),(15,5,5,'001A10'),(21,1,5,'001B10'),(21,2,5,'001B11'),(21,3,5,'001B12'),(21,4,5,'001B13'),(21,5,6,'001B14'),(21,6,6,'001B15'),(25,1,6,'001B16'),(25,2,6,'001B17'),(25,3,6,'001B18'),(25,4,6,'001B19'),(29,1,6,'001B20'),(29,2,6,'001B21'),(29,3,6,'001B22');
/*!40000 ALTER TABLE `COPY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DOCUMENT`
--

DROP TABLE IF EXISTS `DOCUMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DOCUMENT` (
  `DOCID` int NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL,
  `PDATE` date NOT NULL,
  `PUBLISHERID` int DEFAULT NULL,
  PRIMARY KEY (`DOCID`),
  KEY `PUBLISHERID` (`PUBLISHERID`),
  CONSTRAINT `document_ibfk_1` FOREIGN KEY (`PUBLISHERID`) REFERENCES `PUBLISHER` (`PUBLISHERID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOCUMENT`
--

LOCK TABLES `DOCUMENT` WRITE;
/*!40000 ALTER TABLE `DOCUMENT` DISABLE KEYS */;
INSERT INTO `DOCUMENT` VALUES (1,'Handbook of Amygdala Structure and Function','2020-11-29',71205),(2,'Dysphagia  (Third Edition)','2011-11-07',87373),(3,'Extrusion Cooking','2010-08-23',26915),(4,'Obesity Hypoventilation Syndrome','2011-05-14',47438),(5,'Metabolic Disorders and Shen in Integrative Cardiovascular Chinese Medicine','2013-06-27',25064),(6,'Bioactive Natural Products','2016-12-12',21148),(7,'Handbook of Chitin and Chitosan','2017-08-14',68241),(8,'Vibrational Spectroscopy Applications in Biomedical, Pharmaceutical and Food Sciences','2021-02-14',79166),(9,'Handbook on Miniaturization in Analytical Chemistry','2017-07-07',75158),(10,'Geological Records of Tsunamis and Other Extreme Waves','2010-03-15',21515),(11,'Harry Potter and the Goblet of Fire','1990-10-29',29511),(12,'White Teeth','1991-08-07',41257),(13,'The Corrections','1991-09-13',68241),(14,'Runaway','1993-04-30',29511),(15,'Cloud Atlas','1993-11-02',47438),(16,'Never Let Me Go ','1993-12-30',75158),(17,'Kafka on the Shore','1994-08-19',68241),(18,'The Road','1994-09-13',47438),(19,'The Last Samurai','1996-12-30',22217),(20,'The Neapolitan Novels','1997-10-10',21515),(21,'The Argonauts','1997-12-08',75158),(22,'The Sellout','1998-11-09',37433),(23,'The Wind-Up Bird Chronicle','2001-11-07',37433),(24,'Harry Potter and the Philosophers Stone','2005-12-26',21515),(25,'Rabbit at Rest','2006-03-08',68241),(26,'Disgrace','2006-09-14',26915),(27,'The Shipping News','2007-01-18',94273),(28,'Possession','2007-01-23',22217),(29,'The Poisonwood Bible','2007-12-10',12275),(30,'The Secret History','2008-07-11',94273),(31,'The God of Small Things','2008-12-22',68241),(32,'All the Pretty Horses','2010-01-19',87373),(33,'Infinite Jest','2010-06-11',21515),(34,'A Suitable Boy','2010-09-02',71205),(35,'Regeneration','2010-10-15',21515);
/*!40000 ALTER TABLE `DOCUMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GEDITS`
--

DROP TABLE IF EXISTS `GEDITS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GEDITS` (
  `DOCID` int NOT NULL,
  `ISSUE_NO` int NOT NULL,
  `PID` int NOT NULL,
  PRIMARY KEY (`DOCID`,`ISSUE_NO`,`PID`),
  KEY `PID` (`PID`),
  CONSTRAINT `gedits_ibfk_1` FOREIGN KEY (`DOCID`, `ISSUE_NO`) REFERENCES `JOURNAL_ISSUE` (`DOCID`, `ISSUE_NO`),
  CONSTRAINT `gedits_ibfk_2` FOREIGN KEY (`PID`) REFERENCES `PERSON` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GEDITS`
--

LOCK TABLES `GEDITS` WRITE;
/*!40000 ALTER TABLE `GEDITS` DISABLE KEYS */;
INSERT INTO `GEDITS` VALUES (14,2,12),(15,1,12),(15,2,12),(16,1,12),(17,1,12),(18,1,12),(19,1,12),(20,1,12),(11,1,19),(11,2,19),(11,3,19),(11,4,19),(12,1,19),(12,2,19),(12,3,19),(13,1,19),(13,2,19),(14,1,19);
/*!40000 ALTER TABLE `GEDITS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JOURNAL_ISSUE`
--

DROP TABLE IF EXISTS `JOURNAL_ISSUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JOURNAL_ISSUE` (
  `DOCID` int NOT NULL,
  `ISSUE_NO` int NOT NULL,
  `SCOPE` varchar(255) NOT NULL,
  PRIMARY KEY (`DOCID`,`ISSUE_NO`),
  CONSTRAINT `journal_issue_ibfk_1` FOREIGN KEY (`DOCID`) REFERENCES `JOURNAL_VOLUME` (`DOCID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JOURNAL_ISSUE`
--

LOCK TABLES `JOURNAL_ISSUE` WRITE;
/*!40000 ALTER TABLE `JOURNAL_ISSUE` DISABLE KEYS */;
INSERT INTO `JOURNAL_ISSUE` VALUES (11,1,'science'),(11,2,'science'),(11,3,'science'),(11,4,'science'),(12,1,'nature'),(12,2,'nature'),(12,3,'nature'),(13,1,'cars'),(13,2,'cars'),(14,1,'cars'),(14,2,'cars'),(15,1,'physics'),(15,2,'physics'),(16,1,'science'),(17,1,'science'),(18,1,'science'),(19,1,'science'),(20,1,'science');
/*!40000 ALTER TABLE `JOURNAL_ISSUE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JOURNAL_VOLUME`
--

DROP TABLE IF EXISTS `JOURNAL_VOLUME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JOURNAL_VOLUME` (
  `DOCID` int NOT NULL,
  `VOLUME_NO` int NOT NULL,
  `EDITOR` varchar(255) NOT NULL,
  PRIMARY KEY (`DOCID`),
  CONSTRAINT `journal_volume_ibfk_1` FOREIGN KEY (`DOCID`) REFERENCES `DOCUMENT` (`DOCID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JOURNAL_VOLUME`
--

LOCK TABLES `JOURNAL_VOLUME` WRITE;
/*!40000 ALTER TABLE `JOURNAL_VOLUME` DISABLE KEYS */;
INSERT INTO `JOURNAL_VOLUME` VALUES (11,2,'11'),(12,5,'12'),(13,2,'13'),(14,4,'14'),(15,6,'15'),(16,7,'16'),(17,2,'17'),(18,3,'18'),(19,8,'19'),(20,1,'20');
/*!40000 ALTER TABLE `JOURNAL_VOLUME` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERSON`
--

DROP TABLE IF EXISTS `PERSON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERSON` (
  `PID` int NOT NULL AUTO_INCREMENT,
  `PNAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERSON`
--

LOCK TABLES `PERSON` WRITE;
/*!40000 ALTER TABLE `PERSON` DISABLE KEYS */;
INSERT INTO `PERSON` VALUES (1,'Johanna Ehrlich'),(2,'David Ferris'),(3,'Marlo Garner'),(4,'Matthew Gibson'),(5,'Karin Graham'),(6,'Susan Maia Grossman'),(7,'Jeff Karon'),(8,'Barbara Kimble'),(9,'John David Kudrick'),(10,'Thomas Wray'),(11,'Garald Tomley'),(12,'Aurel Jirousek'),(13,'Dirk Seville'),(14,'Leilah Biggin'),(15,'Wadsworth Gennings'),(16,'Zoe Jouanot'),(17,'Elwyn Santoro'),(18,'Leonelle Kenion'),(19,'Nan Birtwistle'),(20,'Norry Carrol'),(21,'Daria Ketteman'),(22,'Danita Heaslip'),(23,'Jud Duplan'),(24,'Allen Hardaker'),(25,'Lissa Cubley'),(26,'Nickey Offill'),(27,'Mirelle Kennifick'),(28,'Rivkah Thridgould'),(29,'Rourke Casoni'),(30,'Cheryl Griffoen');
/*!40000 ALTER TABLE `PERSON` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROCEEDINGS`
--

DROP TABLE IF EXISTS `PROCEEDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROCEEDINGS` (
  `DOCID` int NOT NULL,
  `CDATE` date NOT NULL,
  `CLOCATION` varchar(255) NOT NULL,
  `CEDITOR` varchar(255) NOT NULL,
  PRIMARY KEY (`DOCID`),
  CONSTRAINT `proceedings_ibfk_1` FOREIGN KEY (`DOCID`) REFERENCES `DOCUMENT` (`DOCID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROCEEDINGS`
--

LOCK TABLES `PROCEEDINGS` WRITE;
/*!40000 ALTER TABLE `PROCEEDINGS` DISABLE KEYS */;
INSERT INTO `PROCEEDINGS` VALUES (21,'2015-10-21','California','David Alan'),(22,'2018-05-18','Florida','Ann Aubrey'),(23,'2019-08-12','Maryland','Amy Bennett'),(24,'2014-02-20','Mississippi','James N. Bond'),(25,'2016-11-28','Ohio','Lauren Brenzy'),(26,'2011-01-11','Arizona','Theodora Bryant'),(27,'2018-06-12','Tennessee','Peggy Campbell'),(28,'2003-03-30','New Jersey','Carrie Cantor'),(29,'2020-09-22','Washington','Henry Denard'),(30,'2012-04-08','Ohio','Ana Howard');
/*!40000 ALTER TABLE `PROCEEDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PUBLISHER`
--

DROP TABLE IF EXISTS `PUBLISHER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PUBLISHER` (
  `PUBLISHERID` int NOT NULL,
  `PUBNAME` varchar(255) NOT NULL,
  `ADDRESS` varchar(255) NOT NULL,
  PRIMARY KEY (`PUBLISHERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PUBLISHER`
--

LOCK TABLES `PUBLISHER` WRITE;
/*!40000 ALTER TABLE `PUBLISHER` DISABLE KEYS */;
INSERT INTO `PUBLISHER` VALUES (12275,'Dacie Ridge','6 Waxwing Point'),(21148,'Averil Harroll','90615 Truax Way'),(21515,'Ruddy Yeskov','4326 Marquette Avenue'),(22217,'Christie Pretious','72 Lighthouse Bay Alley'),(25064,'Buck Gunstone','21916 Sutteridge Place'),(26915,'Ernest Poulsom','4421 Morningstar Hill'),(29511,'Verla Spada','9 5th Pass'),(37433,'Beverie Budgen','6 Gulseth Circle'),(41257,'Calv Fearnside','898 Northwestern Point'),(47438,'Eleonora Ruthen','9 Gina Trail'),(68241,'Randene Thow','302 Towne Plaza'),(71205,'Donall Linskey','85 Crownhardt Place'),(75158,'Westleigh Filyakov','9679 6th Trail'),(79166,'Marcela Beddow','66 Upham Circle'),(87373,'Maddi Leah','55 Sauthoff Street'),(94273,'Biron Carslake','9692 Menomonie Trail');
/*!40000 ALTER TABLE `PUBLISHER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `READER`
--

DROP TABLE IF EXISTS `READER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `READER` (
  `RID` int NOT NULL AUTO_INCREMENT,
  `RTYPE` varchar(255) NOT NULL,
  `RNAME` varchar(255) NOT NULL,
  `RADDRESS` varchar(255) NOT NULL,
  `PHONE_NO` bigint DEFAULT NULL,
  PRIMARY KEY (`RID`)
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `READER`
--

LOCK TABLES `READER` WRITE;
/*!40000 ALTER TABLE `READER` DISABLE KEYS */;
INSERT INTO `READER` VALUES (300,'Student','James','NO 2,First Street,Harrison,NJ07029',1111111111),(301,'Senior Citizen','Gerrard','NO 4,Euclid Avenue, Kearny, NJ07032',2222222222),(302,'Student','Messi','NO 12, Second Cross Street, Paterson, NJ07040',3333333333),(303,'Staff','Ronaldo','NO 5, Halstead Street, Kearny, NJ07032',4444444444),(304,'Senior Citizen','Lampard','NO 7, Hudson Avenue, Hudson, NJ07033',5555555555),(305,'Staff','Drogba','NO 8, Third Street, Paterson, NJ07040',6666666666),(306,'Student','Neymar','NO 15, Union Street, Newark, NJ07107',7777777777),(307,'Senior Citizen','Ramos','NO 49, Bloomfield Avuenue, Bloomfield, NJ07100',8888888888),(308,'Student','Rooney','NO 30, Third Cross Street, Paterson, NJ07040',9898989898),(309,'Staff','Henderson','NO 20, Manor Avunue, Harrison, NJ07029',2525252525);
/*!40000 ALTER TABLE `READER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESERVATION`
--

DROP TABLE IF EXISTS `RESERVATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESERVATION` (
  `RES_NO` int NOT NULL AUTO_INCREMENT,
  `DTIME` datetime NOT NULL,
  PRIMARY KEY (`RES_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=1031 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESERVATION`
--

LOCK TABLES `RESERVATION` WRITE;
/*!40000 ALTER TABLE `RESERVATION` DISABLE KEYS */;
INSERT INTO `RESERVATION` VALUES (991,'2020-10-05 01:30:00'),(992,'2020-11-10 09:00:00'),(993,'2020-09-22 13:00:00'),(994,'2020-07-23 10:00:00'),(995,'2020-08-01 15:00:00'),(996,'2020-10-22 16:00:00'),(997,'2020-12-23 08:00:00'),(998,'2020-04-04 12:00:00'),(999,'2020-05-15 14:30:00'),(1000,'2020-10-18 09:30:00'),(1001,'2021-04-22 05:06:00'),(1002,'2021-04-29 06:33:00'),(1003,'2021-04-22 14:37:00'),(1004,'2021-04-24 06:47:00'),(1005,'2021-04-23 21:59:00'),(1006,'2021-04-23 07:26:00'),(1007,'2021-04-23 02:02:00'),(1008,'2021-04-23 00:47:00'),(1009,'2021-04-28 05:45:00'),(1010,'2021-04-30 05:03:00'),(1011,'2021-04-26 01:12:00'),(1012,'2021-04-23 14:15:00'),(1013,'2021-04-29 02:17:00'),(1014,'2021-04-22 13:04:00'),(1015,'2021-04-29 00:17:00'),(1016,'2021-04-23 09:12:00'),(1017,'2021-04-22 05:29:00'),(1018,'2021-04-29 06:41:00'),(1019,'2021-04-27 00:51:00'),(1020,'2021-04-23 00:45:00'),(1021,'2021-04-28 15:28:00'),(1022,'2021-04-23 00:18:00'),(1023,'2021-05-01 11:29:00'),(1024,'2021-04-25 21:34:00'),(1025,'2021-04-23 20:31:00'),(1026,'2021-04-28 22:46:00'),(1027,'2021-04-23 02:12:00'),(1028,'2021-04-25 14:13:00'),(1029,'2021-04-29 12:37:00'),(1030,'2021-04-24 16:49:00');
/*!40000 ALTER TABLE `RESERVATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESERVES`
--

DROP TABLE IF EXISTS `RESERVES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESERVES` (
  `RID` int NOT NULL,
  `RESERVATION_NO` int NOT NULL,
  `DOCID` int NOT NULL,
  `COPYNO` int NOT NULL,
  `BID` int NOT NULL,
  PRIMARY KEY (`RESERVATION_NO`,`DOCID`,`COPYNO`,`BID`),
  KEY `DOCID` (`DOCID`,`COPYNO`,`BID`),
  CONSTRAINT `reserves_ibfk_1` FOREIGN KEY (`RESERVATION_NO`) REFERENCES `RESERVATION` (`RES_NO`),
  CONSTRAINT `reserves_ibfk_2` FOREIGN KEY (`DOCID`, `COPYNO`, `BID`) REFERENCES `COPY` (`DOCID`, `COPYNO`, `BID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESERVES`
--

LOCK TABLES `RESERVES` WRITE;
/*!40000 ALTER TABLE `RESERVES` DISABLE KEYS */;
INSERT INTO `RESERVES` VALUES (301,991,1,2,1),(304,992,2,3,1),(308,993,2,1,1),(307,994,1,5,1),(302,995,1,1,1),(305,996,1,6,1),(305,997,2,4,1),(306,998,1,3,1),(309,999,1,4,1),(303,1000,2,2,1),(302,1001,1,2,1),(302,1002,1,3,1),(302,1003,1,4,1),(302,1004,1,5,1),(302,1005,1,6,1),(302,1006,2,1,1),(302,1007,2,2,1),(306,1008,1,1,1),(306,1009,1,2,1),(306,1010,1,3,1),(306,1011,1,4,1),(306,1012,1,5,1),(306,1013,1,6,1),(304,1014,2,1,1),(304,1015,2,2,1),(304,1016,2,3,1),(304,1017,2,4,1),(304,1018,1,1,1),(304,1019,1,2,1),(304,1020,1,3,1),(308,1021,1,4,1),(308,1022,1,5,1),(308,1023,1,6,1),(303,1024,2,1,1),(303,1025,2,2,1),(303,1026,2,3,1),(303,1027,2,4,1),(303,1028,1,5,1),(303,1029,1,6,1),(303,1030,2,1,1);
/*!40000 ALTER TABLE `RESERVES` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-30 14:11:05

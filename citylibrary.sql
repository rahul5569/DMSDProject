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
  `ISBN` int NOT NULL,
  PRIMARY KEY (`DOCID`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`DOCID`) REFERENCES `DOCUMENT` (`DOCID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOOK`
--

LOCK TABLES `BOOK` WRITE;
/*!40000 ALTER TABLE `BOOK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BOOK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BORROWING`
--

DROP TABLE IF EXISTS `BORROWING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BORROWING` (
  `BOR_NO` int NOT NULL,
  `BDTIME` datetime NOT NULL,
  `RDTIME` datetime NOT NULL,
  PRIMARY KEY (`BOR_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BORROWING`
--

LOCK TABLES `BORROWING` WRITE;
/*!40000 ALTER TABLE `BORROWING` DISABLE KEYS */;
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
  `POSITION` int NOT NULL,
  PRIMARY KEY (`DOCID`,`COPYNO`,`BID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COPY`
--

LOCK TABLES `COPY` WRITE;
/*!40000 ALTER TABLE `COPY` DISABLE KEYS */;
/*!40000 ALTER TABLE `COPY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DOCUMENT`
--

DROP TABLE IF EXISTS `DOCUMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DOCUMENT` (
  `DOCID` int NOT NULL,
  `TITLE` varchar(255) NOT NULL,
  `PDATE` date NOT NULL,
  `PUBLISHERID` int DEFAULT NULL,
  PRIMARY KEY (`DOCID`),
  KEY `PUBLISHERID` (`PUBLISHERID`),
  CONSTRAINT `document_ibfk_1` FOREIGN KEY (`PUBLISHERID`) REFERENCES `PUBLISHER` (`PUBLISHERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOCUMENT`
--

LOCK TABLES `DOCUMENT` WRITE;
/*!40000 ALTER TABLE `DOCUMENT` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `JOURNAL_VOLUME` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERSON`
--

DROP TABLE IF EXISTS `PERSON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERSON` (
  `PID` int NOT NULL,
  `PNAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERSON`
--

LOCK TABLES `PERSON` WRITE;
/*!40000 ALTER TABLE `PERSON` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `PUBLISHER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `READER`
--

DROP TABLE IF EXISTS `READER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `READER` (
  `RID` int NOT NULL,
  `RTYPE` varchar(255) NOT NULL,
  `RNAME` varchar(255) NOT NULL,
  `RADDRESS` varchar(255) NOT NULL,
  `PHONE_NO` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `READER`
--

LOCK TABLES `READER` WRITE;
/*!40000 ALTER TABLE `READER` DISABLE KEYS */;
/*!40000 ALTER TABLE `READER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESERVATION`
--

DROP TABLE IF EXISTS `RESERVATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESERVATION` (
  `RES_NO` int NOT NULL,
  `DTIME` datetime NOT NULL,
  PRIMARY KEY (`RES_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESERVATION`
--

LOCK TABLES `RESERVATION` WRITE;
/*!40000 ALTER TABLE `RESERVATION` DISABLE KEYS */;
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

-- Dump completed on 2024-04-27 12:32:07

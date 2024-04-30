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
  `ISBN` bigint NOT NULL,
  PRIMARY KEY (`DOCID`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`DOCID`) REFERENCES `DOCUMENT` (`DOCID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOOK`
--

LOCK TABLES `BOOK` WRITE;
/*!40000 ALTER TABLE `BOOK` DISABLE KEYS */;
INSERT INTO `BOOK` VALUES (1,9781234567890),(2,9780987654321),(3,9780123456789),(4,9789876543210),(5,9781122334455),(6,9783216549870),(7,9784567890123),(8,9787890123456),(9,9786543210987),(10,9785432109876);
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
  `RDTIME` datetime DEFAULT NULL,
  PRIMARY KEY (`BOR_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BORROWING`
--

LOCK TABLES `BORROWING` WRITE;
/*!40000 ALTER TABLE `BORROWING` DISABLE KEYS */;
INSERT INTO `BORROWING` VALUES (1,'2024-04-01 10:00:00',NULL),(2,'2024-04-02 11:30:00',NULL),(3,'2024-04-03 09:45:00',NULL),(4,'2024-04-04 15:20:00',NULL),(5,'2024-04-05 12:15:00',NULL);
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
INSERT INTO `BORROWS` VALUES (1,1,1,1,1),(2,2,2,2,2),(3,3,3,3,3),(4,4,4,1,4),(5,5,5,2,5);
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
INSERT INTO `BRANCH` VALUES (1,'Main Library','123 Library St.'),(2,'Downtown Branch','456 Downtown Ave.'),(3,'East Side Library','789 East St.');
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
INSERT INTO `CHAIRS` VALUES (6,6),(7,7),(8,8),(9,9),(10,10);
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
INSERT INTO `COPY` VALUES (1,1,1,'001A03'),(2,2,2,'002B04'),(3,3,3,'003C05'),(4,4,1,'004D06'),(5,5,2,'005E07'),(6,1,3,'006F08'),(7,2,1,'007G09'),(8,3,2,'008H10'),(9,4,3,'009I11'),(10,5,1,'010J12');
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
INSERT INTO `DOCUMENT` VALUES (1,'Introduction to Programming','2022-01-15',1),(2,'Database Management Essentials','2021-08-20',2),(3,'Data Structures and Algorithms','2023-03-10',3),(4,'Web Development Fundamentals','2022-11-05',1),(5,'Networking Basics','2023-06-30',2),(6,'Artificial Intelligence Fundamentals','2023-09-15',3),(7,'Machine Learning Techniques','2022-05-20',1),(8,'Cloud Computing Basics','2021-12-10',2),(9,'Cybersecurity Essentials','2024-02-28',3),(10,'Data Science Foundations','2023-06-05',1);
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
INSERT INTO `GEDITS` VALUES (7,1,11),(8,2,12),(9,3,13),(10,4,14),(6,5,15);
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
INSERT INTO `JOURNAL_ISSUE` VALUES (6,5,'Educational Research'),(7,1,'Technology Trends'),(8,2,'Business Strategies'),(9,3,'Healthcare Innovations'),(10,4,'Environmental Science');
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
INSERT INTO `JOURNAL_VOLUME` VALUES (6,5,'Christopher Brown'),(7,1,'John Doe'),(8,2,'Jane Smith'),(9,3,'Michael Johnson'),(10,4,'Emily Williams');
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
INSERT INTO `PERSON` VALUES (1,'John Smith'),(2,'Jane Doe'),(3,'Michael Johnson'),(4,'Emily Williams'),(5,'Christopher Brown'),(6,'Jessica Lee'),(7,'Matthew Anderson'),(8,'Olivia Martinez'),(9,'William Taylor'),(10,'Sophia Clark'),(11,'Daniel White'),(12,'Ava Rodriguez'),(13,'Joseph Wilson'),(14,'Mia Moore'),(15,'Ethan Harris');
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
INSERT INTO `PROCEEDINGS` VALUES (6,'2024-07-15','Conference Center A','Dr. Anna Garcia'),(7,'2023-10-20','Convention Hall B','Prof. David Miller'),(8,'2023-12-05','Expo Center C','Dr. Sarah Thompson'),(9,'2022-11-30','Seminar Room D','Prof. Kevin Robinson'),(10,'2024-03-10','Auditorium E','Dr. Laura Adams');
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
INSERT INTO `PUBLISHER` VALUES (1,'TechBooks Inc.','123 Tech St.'),(2,'Academic Press','456 Academic Ave.'),(3,'Research Publishers','789 Research Rd.');
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
  `PHONE_NO` bigint DEFAULT NULL,
  PRIMARY KEY (`RID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `READER`
--

LOCK TABLES `READER` WRITE;
/*!40000 ALTER TABLE `READER` DISABLE KEYS */;
INSERT INTO `READER` VALUES (1,'Student','Emma Johnson','10 College St.',1234567890),(2,'Faculty','Robert Smith','20 University Ave.',2345678901),(3,'Student','Sophie Brown','30 High School Rd.',3456789012),(4,'Faculty','Andrew Wilson','40 Research Blvd.',4567890123),(5,'Student','James Taylor','50 Library Lane',5678901234);
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
INSERT INTO `RESERVATION` VALUES (1,'2024-04-10 14:00:00'),(2,'2024-04-12 16:30:00'),(3,'2024-04-15 11:45:00'),(4,'2024-04-20 09:00:00'),(5,'2024-04-25 13:15:00');
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
INSERT INTO `RESERVES` VALUES (1,1,1,1,1),(2,2,2,2,2),(3,3,3,3,3),(4,4,4,4,1),(5,5,5,5,2);
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

-- Dump completed on 2024-04-28 19:42:49

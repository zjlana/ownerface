-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: jacobdb
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adds_on`
--

DROP TABLE IF EXISTS `adds_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adds_on` (
  `ADDSONID` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `ITEM` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `AMOUNT` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ADDSONID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adds_on`
--

LOCK TABLES `adds_on` WRITE;
/*!40000 ALTER TABLE `adds_on` DISABLE KEYS */;
INSERT INTO `adds_on` VALUES ('ID-00001','bed','100');
/*!40000 ALTER TABLE `adds_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily`
--

DROP TABLE IF EXISTS `daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily` (
  `RESERVATIONID` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `GUESTID` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  `BOOKDATE` date NOT NULL,
  `ROOMNUMBER` int NOT NULL,
  `CHECKIN` datetime(6) NOT NULL,
  `CHECKOUT` datetime(6) DEFAULT NULL,
  `STATUS` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`RESERVATIONID`),
  KEY `FK_Daily_RoomNum` (`ROOMNUMBER`),
  KEY `GUESTID` (`GUESTID`) USING BTREE,
  CONSTRAINT `FK_Daily_GuestID` FOREIGN KEY (`GUESTID`) REFERENCES `guest` (`GUESTID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Daily_RoomNum` FOREIGN KEY (`ROOMNUMBER`) REFERENCES `room` (`ROOMNUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily`
--

LOCK TABLES `daily` WRITE;
/*!40000 ALTER TABLE `daily` DISABLE KEYS */;
INSERT INTO `daily` VALUES ('BK-20240216010617','2','2024-02-16',10,'2024-02-16 13:05:13.388625',NULL,'Check-in'),('BK-20s240216010617','2','2024-02-16',10,'2024-02-16 13:05:13.388625',NULL,'Check-in');
/*!40000 ALTER TABLE `daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest` (
  `GUESTID` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `FIRSTNAME` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `MIDDLEINITIAL` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `LASTNAME` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `STATUS` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `PHONENUMBER` bigint DEFAULT NULL,
  PRIMARY KEY (`GUESTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest`
--

LOCK TABLES `guest` WRITE;
/*!40000 ALTER TABLE `guest` DISABLE KEYS */;
INSERT INTO `guest` VALUES ('2','Juan','A','Dela Cruz','Check-in',1123),('3','Juan','A','Dela Cruz','Check-in',91234);
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest_addson`
--

DROP TABLE IF EXISTS `guest_addson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest_addson` (
  `RESERVATIONID` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `GUESTID` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `BOOKDATE` date NOT NULL,
  `ADDSONID` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  KEY `GUESTID` (`GUESTID`) USING BTREE,
  KEY `ADDSONID` (`ADDSONID`) USING BTREE,
  KEY `BOOKDATE` (`BOOKDATE`) USING BTREE,
  KEY `RESERVATIONID` (`RESERVATIONID`) USING BTREE,
  CONSTRAINT `FK_GuestAddsOn_AddsOnID` FOREIGN KEY (`ADDSONID`) REFERENCES `adds_on` (`ADDSONID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest_addson`
--

LOCK TABLES `guest_addson` WRITE;
/*!40000 ALTER TABLE `guest_addson` DISABLE KEYS */;
INSERT INTO `guest_addson` VALUES ('RES-20240214091636','GUE-00001','2024-02-14',NULL),('RES-20240214091636','GUE-00001','2024-02-14',NULL);
/*!40000 ALTER TABLE `guest_addson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('Teresa','Jacob'),('admin','admin');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overnight`
--

DROP TABLE IF EXISTS `overnight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `overnight` (
  `RESERVATIONID` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `GUESTID` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `BOOKDATE` date NOT NULL,
  `ROOMNUMBER` int NOT NULL,
  `CHECKIN` datetime(6) NOT NULL,
  `CHECKOUT` datetime(6) DEFAULT NULL,
  `STATUS` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`RESERVATIONID`),
  KEY `GUESTID` (`GUESTID`) USING BTREE,
  KEY `FK_Overnight_RoomNum` (`ROOMNUMBER`),
  CONSTRAINT `FK_Overnight_GuestID` FOREIGN KEY (`GUESTID`) REFERENCES `guest` (`GUESTID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Overnight_RoomNum` FOREIGN KEY (`ROOMNUMBER`) REFERENCES `room` (`ROOMNUMBER`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overnight`
--

LOCK TABLES `overnight` WRITE;
/*!40000 ALTER TABLE `overnight` DISABLE KEYS */;
INSERT INTO `overnight` VALUES ('BK-20240216010617','2','2024-02-16',10,'2024-02-16 13:05:13.388625',NULL,'Check-in'),('BK-sample','2','2024-02-16',10,'2024-02-16 13:05:13.388625',NULL,'Check-in');
/*!40000 ALTER TABLE `overnight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PAYMENTID` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `TRANSDATE` date NOT NULL,
  `GUESTID` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PRICE` int NOT NULL,
  `STATUS` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `TENDERED` int NOT NULL,
  `CHANGED` int NOT NULL,
  PRIMARY KEY (`PAYMENTID`),
  KEY `GUESTID` (`GUESTID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('PAY-00001','2024-02-16','GUE-00002',250,'Paid',1000,750),('PAY-00002','2024-02-16','GUE-00002',250,'Paid',1000,750),('PAY-00003','2024-03-01','GUE-00002',1,'Paid',2,3);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `ROOMNUMBER` int NOT NULL,
  `ROOMTYPE` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `STATUS` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ROOMNUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (2,'Standard Room','Available'),(3,'Ordinary Room','Occupied'),(4,'Ordinary Room','Occupied'),(5,'Standard Room','Available'),(6,'Standard Room','Available'),(7,'Ordinary Room','Occupied'),(8,'Ordinary Room','Occupied'),(9,'Ordinary Room','Available'),(10,'Ordinary Room','Occupied'),(11,'Ordinary Room','Available'),(12,'Ordinary Room','Available'),(14,'Standard Room','Available'),(15,'Ordinary Room','Available'),(16,'Standard Room','Available'),(17,'Ordinary Room','Available'),(18,'Ordinary Room','Available'),(20,'Standard Room','Available'),(21,'Suite Room','Available'),(22,'Suite Room','Available'),(23,'Suite Room','Available'),(24,'Suite Room','Available'),(25,'Suite Room','Available'),(26,'Suite Room','Available'),(191,'Ordinary Room','Available');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shortime`
--

DROP TABLE IF EXISTS `shortime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shortime` (
  `RESERVATIONID` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `GUESTID` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `ROOMNUMBER` int NOT NULL,
  `CHECKIN` datetime(6) NOT NULL,
  `CHECKOUT` date DEFAULT NULL,
  PRIMARY KEY (`RESERVATIONID`),
  KEY `FK_Shortime_GuestID` (`GUESTID`),
  KEY `FK_ShortTime_RoomNum` (`ROOMNUMBER`),
  CONSTRAINT `FK_ShortTime_RoomNum` FOREIGN KEY (`ROOMNUMBER`) REFERENCES `room` (`ROOMNUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shortime`
--

LOCK TABLES `shortime` WRITE;
/*!40000 ALTER TABLE `shortime` DISABLE KEYS */;
INSERT INTO `shortime` VALUES ('BK-20240216010617','GUE-00002',10,'2024-02-16 13:05:13.388625',NULL),('RES-20240216095653','GUE-00001',9,'2024-02-16 09:56:07.811525','2024-02-16');
/*!40000 ALTER TABLE `shortime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `StaffName` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `PhoneNumber` int NOT NULL,
  PRIMARY KEY (`StaffName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('Teresa Jacob',123);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-01  0:44:58

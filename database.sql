-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: taclassifieds
-- ------------------------------------------------------
-- Server version	5.5.47-0ubuntu0.14.04.1

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
-- Table structure for table `classified`
--

DROP TABLE IF EXISTS `classified`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classified` (
  `classifiedID` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `imagepath` varchar(200) DEFAULT NULL,
  `phoneno` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`classifiedID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classified`
--

LOCK TABLES `classified` WRITE;
/*!40000 ALTER TABLE `classified` DISABLE KEYS */;
INSERT INTO `classified` VALUES ('TA10659','Testing','Classified','200','public/uploads/Desert.jpg','1370','sreejas@techaspect.com'),('TA12247','Test','Test','1234','public/uploads/test.gif','1470','alankrutha.ambarkar@techaspect.com'),('TA35940','<script>alert(hi)</script>','security','1000','public/uploads/appliances-banner.png','1128','gopala@techaspect.com'),('TA43988','Test classified','Test','10000','public/uploads/gitlab commands.png','1370','sreejas@techaspect.com'),('TA44298','sd','test sd','10000','public/uploads/Untitled.png','1370','sreejas@techaspect.com'),('TA44987','test','test','1000','public/uploads/TA-logo.png','1306','rahulv@techaspect.com'),('TA57007','DemoDemo','DemoDemoDemoDemo','500','public/uploads/mobile.jpg','1128','gopala@techaspect.com'),('TA60520','sd','sd','23423',NULL,'1370','sreejas@techaspect.com'),('TA71152','Test','TestTest','500','public/uploads/mobile.jpg','1128','gopala@techaspect.com');
/*!40000 ALTER TABLE `classified` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `message` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES ('test','test@gmail.com','test',NULL),('Gopal','amber.gopalrao@gmail.com','Good',NULL),('test','test@gmail.com','test',NULL),('test','test@gmail.com','test','test');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(30) NOT NULL DEFAULT '',
  `phone` varchar(30) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('testtest','amber.gopalrao@gmail.com','9490408744','Gopal'),('raja','rajakvk@gmail.com','1234567890','rajakvk'),('ambeer','snehalathaambeer@gamil.com','940408744','Sneha'),('March@2016','sreejas@techaspect.com','9912345667','Sreeja');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2002-02-02  9:03:33

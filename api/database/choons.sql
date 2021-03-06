-- MySQL dump 10.13  Distrib 5.7.19, for osx10.11 (x86_64)
--
-- Host: localhost    Database: choons
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userNameRef` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'eden','Cathy','Ames','2017-11-08 06:31:29','2017-11-08 06:31:29'),(2,'nickyg','Nick','Guilford','2017-11-08 06:52:26','2017-11-08 06:52:26'),(3,'prog','Henry','Wallace','2017-11-09 05:43:54','2017-11-09 05:43:54');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `song` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `track_number` int(11) DEFAULT NULL,
  `artist` varchar(255) DEFAULT NULL,
  `album` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (1,'Skew it On The Bar-B',4,'Outkast','Aquemini',1998,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(2,'Hold On Be Strong',1,'Outkast','Aquemini',1998,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(3,'Return of the \"G\"',2,'Outkast','Aquemini',1998,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(4,'Rosa Parks',3,'Outkast','Aquemini',1998,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(5,'Aquemini',5,'Outkast','Aquemini',1998,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(6,'Synthesizer',6,'Outkast','Aquemini',1998,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(7,'Slump',7,'Outkast','Aquemini',1998,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(8,'West Savannah',8,'Outkast','Aquemini',1998,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(9,'Da Art Of Storytelling (Part 1)',9,'Outkast','Aquemini',1998,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(10,'Da Art Of Storytelling (Part 2)',10,'Outkast','Aquemini',1998,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(11,'Mamacita',11,'Outkast','Aquemini',1998,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(12,'SpottieOttieDopaliscious',12,'Outkast','Aquemini',1998,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(13,'Yall Scared',13,'Outkast','Aquemini',1998,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(14,'Nathaniel',14,'Outkast','Aquemini',1998,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(15,'Liberation',15,'Outkast','Aquemini',1998,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(16,'Chonkyfire',16,'Outkast','Aquemini',1998,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(17,'Get Up',1,'Washed Out','Life of Leisure',2010,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(18,'New Theory',2,'Washed Out','Life of Leisure',2010,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(19,'Hold Out',3,'Washed Out','Life of Leisure',2010,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(20,'Feel if All Around',4,'Washed Out','Life of Leisure',2010,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(21,'Lately',5,'Washed Out','Life of Leisure',2010,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(22,'You\'ll See It',6,'Washed Out','Life of Leisure',2010,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(23,'The Trees Were Mistaken',1,'Andrew Bird','Soldier On',2008,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(24,'Sic of Elephants',2,'Andrew Bird','Soldier On',2008,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(25,'The Water Jet Cilice',3,'Andrew Bird','Soldier On',2008,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(26,'Plasticities (Remix)',4,'Andrew Bird','Soldier On',2008,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(27,'Heretics (Early Version)',5,'Andrew Bird','Soldier On',2008,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(28,'Sectionate City',6,'Andrew Bird','Soldier On',2008,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(29,'How You Gonna Keep \'Em Down On The Farm',7,'Andrew Bird','Soldier On',2008,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(30,'Oh Sister',8,'Andrew Bird','Soldier On',2008,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(31,'Sun Giant',1,'Fleet Foxes','Sun Giant',2008,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(32,'Drops in the River',2,'Fleet Foxes','Sun Giant',2008,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(33,'English House',3,'Fleet Foxes','Sun Giant',2008,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(34,'Mykonos',4,'Fleet Foxes','Sun Giant',2008,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(35,'Innocent Son',5,'Fleet Foxes','Sun Giant',2008,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(36,'Sintra',1,'Flume','Flume',2013,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(37,'Holdin On',2,'Flume','Flume',2013,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(38,'Left Alone',3,'Flume','Flume',2013,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(39,'Sleepless',4,'Flume','Flume',2013,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(40,'On Top',5,'Flume','Flume',2013,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(41,'Stay Close',6,'Flume','Flume',2013,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(42,'Insane',7,'Flume','Flume',2013,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(43,'Change',8,'Flume','Flume',2013,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(44,'Ezra',9,'Flume','Flume',2013,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(45,'More Than You Thought',10,'Flume','Flume',2013,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(46,'Space Cadet',11,'Flume','Flume',2013,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(47,'Bring You Down',12,'Flume','Flume',2013,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(48,'Warm Thoughts',13,'Flume','Flume',2013,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(49,'What You Need',14,'Flume','Flume',2013,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(50,'Star Eyes',15,'Flume','Flume',2013,'2017-11-09 05:43:54','2017-11-09 05:43:54');
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_song`
--

DROP TABLE IF EXISTS `user_song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_song` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `song_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `plays` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userIDSongIDRef` (`user_id`,`song_id`),
  KEY `song_id` (`song_id`),
  CONSTRAINT `user_song_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_song_ibfk_2` FOREIGN KEY (`song_id`) REFERENCES `song` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_song`
--

LOCK TABLES `user_song` WRITE;
/*!40000 ALTER TABLE `user_song` DISABLE KEYS */;
INSERT INTO `user_song` VALUES (1,2,1,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(2,2,2,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(3,2,3,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(4,2,4,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(5,2,5,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(6,2,6,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(7,2,7,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(8,2,8,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(9,2,9,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(10,2,10,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(11,2,11,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(12,2,12,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(13,2,13,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(14,2,14,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(15,2,15,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(16,2,16,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(17,2,31,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(18,2,32,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(19,2,33,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(20,2,34,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(21,2,35,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(22,1,36,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(23,1,37,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(24,1,38,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(25,1,39,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(26,1,40,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(27,1,41,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(28,1,42,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(29,1,43,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(30,1,44,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(31,1,45,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(32,1,46,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(33,1,47,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(34,1,48,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(35,1,49,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(36,1,50,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(37,3,17,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(38,3,18,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(39,3,19,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(40,3,20,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(41,3,21,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(42,3,22,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(43,3,23,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(44,3,24,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(45,3,25,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(46,3,26,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(47,3,27,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(48,3,28,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(49,3,29,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(50,3,30,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(85,2,17,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(86,2,18,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(87,2,19,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(88,2,20,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(89,2,21,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(90,2,22,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(91,2,23,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(92,2,24,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(93,2,25,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(94,2,26,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(95,2,27,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(96,2,28,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(97,2,29,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(98,2,30,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(104,2,36,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(105,2,37,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(106,2,38,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(107,2,39,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(108,2,40,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(109,2,41,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(110,2,42,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(111,2,43,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(112,2,44,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(113,2,45,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(114,2,46,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(115,2,47,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(116,2,48,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(117,2,49,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54'),(118,2,50,NULL,NULL,'2017-11-09 05:43:54','2017-11-09 05:43:54');
/*!40000 ALTER TABLE `user_song` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-08 23:37:14

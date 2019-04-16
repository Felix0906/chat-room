-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: user_info
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

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
-- Table structure for table `张大帅`
--

DROP TABLE IF EXISTS `张大帅`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `张大帅` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `friend_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `张大帅`
--

LOCK TABLES `张大帅` WRITE;
/*!40000 ALTER TABLE `张大帅` DISABLE KEYS */;
INSERT INTO `张大帅` VALUES (1,'张大帅');
/*!40000 ALTER TABLE `张大帅` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `张大帅_unread_info`
--

DROP TABLE IF EXISTS `张大帅_unread_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `张大帅_unread_info` (
  `friend` varchar(128) NOT NULL,
  `Time` varchar(128) NOT NULL,
  `unread_info` varchar(8192) NOT NULL,
  `read_state` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `张大帅_unread_info`
--

LOCK TABLES `张大帅_unread_info` WRITE;
/*!40000 ALTER TABLE `张大帅_unread_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `张大帅_unread_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `我们一家人`
--

DROP TABLE IF EXISTS `我们一家人`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `我们一家人` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `friend_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `我们一家人`
--

LOCK TABLES `我们一家人` WRITE;
/*!40000 ALTER TABLE `我们一家人` DISABLE KEYS */;
INSERT INTO `我们一家人` VALUES (1,'Tom'),(2,'Jerry'),(3,'Jack'),(4,'xiaozhang'),(5,'fangyuxin');
/*!40000 ALTER TABLE `我们一家人` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `王者超神`
--

DROP TABLE IF EXISTS `王者超神`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `王者超神` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `friend_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `王者超神`
--

LOCK TABLES `王者超神` WRITE;
/*!40000 ALTER TABLE `王者超神` DISABLE KEYS */;
INSERT INTO `王者超神` VALUES (1,'王者超神'),(2,'马大帅'),(3,'张大帅'),(4,'Jack'),(5,'Jerry'),(6,'Tom'),(7,'xiaowang'),(8,'fangyuxin');
/*!40000 ALTER TABLE `王者超神` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `王者超神_unread_info`
--

DROP TABLE IF EXISTS `王者超神_unread_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `王者超神_unread_info` (
  `friend` varchar(128) NOT NULL,
  `Time` varchar(128) NOT NULL,
  `unread_info` varchar(8192) NOT NULL,
  `read_state` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `王者超神_unread_info`
--

LOCK TABLES `王者超神_unread_info` WRITE;
/*!40000 ALTER TABLE `王者超神_unread_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `王者超神_unread_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `马大帅`
--

DROP TABLE IF EXISTS `马大帅`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `马大帅` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `friend_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `马大帅`
--

LOCK TABLES `马大帅` WRITE;
/*!40000 ALTER TABLE `马大帅` DISABLE KEYS */;
INSERT INTO `马大帅` VALUES (1,'马大帅');
/*!40000 ALTER TABLE `马大帅` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `马大帅_unread_info`
--

DROP TABLE IF EXISTS `马大帅_unread_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `马大帅_unread_info` (
  `friend` varchar(128) NOT NULL,
  `Time` varchar(128) NOT NULL,
  `unread_info` varchar(8192) NOT NULL,
  `read_state` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `马大帅_unread_info`
--

LOCK TABLES `马大帅_unread_info` WRITE;
/*!40000 ALTER TABLE `马大帅_unread_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `马大帅_unread_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Jack`
--

DROP TABLE IF EXISTS `Jack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Jack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `friend_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Jack`
--

LOCK TABLES `Jack` WRITE;
/*!40000 ALTER TABLE `Jack` DISABLE KEYS */;
INSERT INTO `Jack` VALUES (1,'Jack'),(2,'Jerry'),(3,'Tom'),(4,'fangyuxin'),(5,'xiaowang'),(6,'张大帅'),(7,'xiaozhang'),(8,'[群聊]我们一家人');
/*!40000 ALTER TABLE `Jack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Jack_unread_info`
--

DROP TABLE IF EXISTS `Jack_unread_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Jack_unread_info` (
  `friend` varchar(128) NOT NULL,
  `Time` varchar(128) NOT NULL,
  `unread_info` varchar(8192) NOT NULL,
  `read_state` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Jack_unread_info`
--

LOCK TABLES `Jack_unread_info` WRITE;
/*!40000 ALTER TABLE `Jack_unread_info` DISABLE KEYS */;
INSERT INTO `Jack_unread_info` VALUES ('Tom','Sun Dec 16 17:06:19 2018','Tom-->Sun Dec 16 17:06:19 2018:\n	哈哈哈哈\n\n',1),('Jerry','Sun Dec 16 17:22:20 2018','Jerry-->Sun Dec 16 17:22:20 2018:\n	nimenhao\n\n',1),('Jerry','Sun Dec 16 17:22:26 2018','Jerry-->Sun Dec 16 17:22:26 2018:\n	ni men doushi laji\n\n',1);
/*!40000 ALTER TABLE `Jack_unread_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Jerry`
--

DROP TABLE IF EXISTS `Jerry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Jerry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `friend_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Jerry`
--

LOCK TABLES `Jerry` WRITE;
/*!40000 ALTER TABLE `Jerry` DISABLE KEYS */;
INSERT INTO `Jerry` VALUES (1,'Jerry'),(2,'[群聊]我们一家人'),(3,'Jack'),(4,'fangyuxin');
/*!40000 ALTER TABLE `Jerry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Jerry_unread_info`
--

DROP TABLE IF EXISTS `Jerry_unread_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Jerry_unread_info` (
  `friend` varchar(128) NOT NULL,
  `Time` varchar(128) NOT NULL,
  `unread_info` varchar(8192) NOT NULL,
  `read_state` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Jerry_unread_info`
--

LOCK TABLES `Jerry_unread_info` WRITE;
/*!40000 ALTER TABLE `Jerry_unread_info` DISABLE KEYS */;
INSERT INTO `Jerry_unread_info` VALUES ('Jack','Sun Dec 16 17:13:50 2018','Jack-->Sun Dec 16 17:13:50 2018:\n	hahaha\n\n',1),('Tom','Sun Dec 16 17:14:00 2018','Tom-->Sun Dec 16 17:14:00 2018:\n	工时费刚发给谁\n\n',1),('Jack','Sun Dec 16 17:14:15 2018','Jack-->Sun Dec 16 17:14:15 2018:\n	hahahaha\n\n',1),('Tom','Sun Dec 16 17:14:33 2018','Tom-->Sun Dec 16 17:14:33 2018:\n	为UI合肥市咖啡\n\n',1),('Tom','Sun Dec 16 17:15:23 2018','Tom-->Sun Dec 16 17:15:23 2018:\n	我是离线消息~~~\n\n',1);
/*!40000 ALTER TABLE `Jerry_unread_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tom`
--

DROP TABLE IF EXISTS `Tom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `friend_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tom`
--

LOCK TABLES `Tom` WRITE;
/*!40000 ALTER TABLE `Tom` DISABLE KEYS */;
INSERT INTO `Tom` VALUES (1,'Tom'),(2,'Jerry'),(3,'Jack'),(4,'xiaozhang'),(5,'王者超神'),(6,'马大帅'),(7,'xiaowang'),(8,'fangyuxin'),(9,'[群聊]我们一家人');
/*!40000 ALTER TABLE `Tom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tom_unread_info`
--

DROP TABLE IF EXISTS `Tom_unread_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tom_unread_info` (
  `friend` varchar(128) NOT NULL,
  `Time` varchar(128) NOT NULL,
  `unread_info` varchar(8192) NOT NULL,
  `read_state` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tom_unread_info`
--

LOCK TABLES `Tom_unread_info` WRITE;
/*!40000 ALTER TABLE `Tom_unread_info` DISABLE KEYS */;
INSERT INTO `Tom_unread_info` VALUES ('Jerry','Sun Dec 16 17:22:20 2018','Jerry-->Sun Dec 16 17:22:20 2018:\n	nimenhao\n\n',1),('Jerry','Sun Dec 16 17:22:26 2018','Jerry-->Sun Dec 16 17:22:26 2018:\n	ni men doushi laji\n\n',1),('fangyuxin','Sun Dec 16 17:22:31 2018','fangyuxin-->Sun Dec 16 17:22:31 2018:\n	你们公会\n\n\n',1),('fangyuxin','Sun Dec 16 17:22:40 2018','fangyuxin-->Sun Dec 16 17:22:40 2018:\n	爽肤水、\n\n\n',1),('Jack','Sun Dec 16 17:22:47 2018','Jack-->Sun Dec 16 17:22:47 2018:\n	dajiahao\n\n',1),('Jerry','Sun Dec 16 17:26:46 2018','[群聊]我们一家人Jerry-->Sun Dec 16 17:26:46 2018:\n	rubbish\n\n',1),('fangyuxin','Sun Dec 16 17:26:57 2018','[群聊]我们一家人fangyuxin-->Sun Dec 16 17:26:57 2018:\n	大噶好~~~\n\n',1),('Jack','Sun Dec 16 17:27:02 2018','[群聊]我们一家人Jack-->Sun Dec 16 17:27:02 2018:\n	大家好，我是Jack\n\n',1);
/*!40000 ALTER TABLE `Tom_unread_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fangyuxin`
--

DROP TABLE IF EXISTS `fangyuxin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fangyuxin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `friend_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fangyuxin`
--

LOCK TABLES `fangyuxin` WRITE;
/*!40000 ALTER TABLE `fangyuxin` DISABLE KEYS */;
INSERT INTO `fangyuxin` VALUES (1,'fangyuxin'),(2,'王者超神'),(3,'Jack'),(4,'xiaowang'),(5,'Tom'),(6,'xiaozhang'),(7,'Jerry'),(8,'张大帅'),(9,'[群聊]我们一家人');
/*!40000 ALTER TABLE `fangyuxin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fangyuxin_unread_info`
--

DROP TABLE IF EXISTS `fangyuxin_unread_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fangyuxin_unread_info` (
  `friend` varchar(128) NOT NULL,
  `Time` varchar(128) NOT NULL,
  `unread_info` varchar(8192) NOT NULL,
  `read_state` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fangyuxin_unread_info`
--

LOCK TABLES `fangyuxin_unread_info` WRITE;
/*!40000 ALTER TABLE `fangyuxin_unread_info` DISABLE KEYS */;
INSERT INTO `fangyuxin_unread_info` VALUES ('王者超神','Sun Dec 16 16:50:36 2018','王者超神-->Sun Dec 16 16:50:36 2018:\n	你好，我是王者超神~~。\n\n',1),('王者超神','Sun Dec 16 16:50:47 2018','王者超神-->Sun Dec 16 16:50:47 2018:\n	加个好友呗\n\n',1),('Tom','Sun Dec 16 16:54:57 2018','Tom-->Sun Dec 16 16:54:57 2018:\n	hello\n\n',1),('Jack','Sun Dec 16 17:13:50 2018','Jack-->Sun Dec 16 17:13:50 2018:\n	hahaha\n\n',1),('Tom','Sun Dec 16 17:14:00 2018','Tom-->Sun Dec 16 17:14:00 2018:\n	工时费刚发给谁\n\n',1),('Jack','Sun Dec 16 17:14:15 2018','Jack-->Sun Dec 16 17:14:15 2018:\n	hahahaha\n\n',1),('Tom','Sun Dec 16 17:14:33 2018','Tom-->Sun Dec 16 17:14:33 2018:\n	为UI合肥市咖啡\n\n',1),('Tom','Sun Dec 16 17:15:23 2018','Tom-->Sun Dec 16 17:15:23 2018:\n	我是离线消息~~~\n\n',1),('Jerry','Sun Dec 16 17:16:35 2018','Jerry-->Sun Dec 16 17:16:35 2018:\n	nimenhao\n\n',1),('Jerry','Sun Dec 16 17:22:20 2018','Jerry-->Sun Dec 16 17:22:20 2018:\n	nimenhao\n\n',1);
/*!40000 ALTER TABLE `fangyuxin_unread_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(15) NOT NULL,
  `passwd` varchar(20) NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (13,'Tom','1234','1061235013@qq.com','13888888888'),(14,'Jerry','1234','1061235013@qq.com','12999999999'),(15,'fangyuxin','123456','135463@qq.com','13452633212'),(16,'Jack','1234','1061235013@qq.com','18212354123'),(17,'xiaowang','1234','185652321@128.com','12451234156'),(18,'王者超神','123456','14521@163.com','18621004512'),(19,'张大帅','123456','18451221@qq.com','18621007682'),(20,'马大帅','1234','1234511@qq.com','12452124122'),(21,'xiaozhang','1234','1255125212@qq.com','13127776972');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xiaowang`
--

DROP TABLE IF EXISTS `xiaowang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xiaowang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `friend_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xiaowang`
--

LOCK TABLES `xiaowang` WRITE;
/*!40000 ALTER TABLE `xiaowang` DISABLE KEYS */;
INSERT INTO `xiaowang` VALUES (1,'xiaowang'),(2,'fangyuxin'),(3,'Jack'),(4,'张大帅'),(5,'Tom'),(6,'xiaozhang'),(7,'Jerry'),(8,'马大帅');
/*!40000 ALTER TABLE `xiaowang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xiaowang_unread_info`
--

DROP TABLE IF EXISTS `xiaowang_unread_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xiaowang_unread_info` (
  `friend` varchar(128) NOT NULL,
  `Time` varchar(128) NOT NULL,
  `unread_info` varchar(8192) NOT NULL,
  `read_state` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xiaowang_unread_info`
--

LOCK TABLES `xiaowang_unread_info` WRITE;
/*!40000 ALTER TABLE `xiaowang_unread_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `xiaowang_unread_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xiaozhang`
--

DROP TABLE IF EXISTS `xiaozhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xiaozhang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `friend_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xiaozhang`
--

LOCK TABLES `xiaozhang` WRITE;
/*!40000 ALTER TABLE `xiaozhang` DISABLE KEYS */;
INSERT INTO `xiaozhang` VALUES (1,'xiaozhang'),(2,'[群聊]我们一家人');
/*!40000 ALTER TABLE `xiaozhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xiaozhang_unread_info`
--

DROP TABLE IF EXISTS `xiaozhang_unread_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xiaozhang_unread_info` (
  `friend` varchar(128) NOT NULL,
  `Time` varchar(128) NOT NULL,
  `unread_info` varchar(8192) NOT NULL,
  `read_state` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xiaozhang_unread_info`
--

LOCK TABLES `xiaozhang_unread_info` WRITE;
/*!40000 ALTER TABLE `xiaozhang_unread_info` DISABLE KEYS */;
INSERT INTO `xiaozhang_unread_info` VALUES ('Jack','Sun Dec 16 17:13:50 2018','Jack-->Sun Dec 16 17:13:50 2018:\n	hahaha\n\n',1),('Tom','Sun Dec 16 17:14:00 2018','Tom-->Sun Dec 16 17:14:00 2018:\n	工时费刚发给谁\n\n',1),('Jack','Sun Dec 16 17:14:15 2018','Jack-->Sun Dec 16 17:14:15 2018:\n	hahahaha\n\n',1),('Tom','Sun Dec 16 17:14:33 2018','Tom-->Sun Dec 16 17:14:33 2018:\n	为UI合肥市咖啡\n\n',1),('Tom','Sun Dec 16 17:15:23 2018','Tom-->Sun Dec 16 17:15:23 2018:\n	我是离线消息~~~\n\n',1),('Jerry','Sun Dec 16 17:16:35 2018','Jerry-->Sun Dec 16 17:16:35 2018:\n	nimenhao\n\n',1),('fangyuxin','Sun Dec 16 17:19:17 2018','fangyuxin-->Sun Dec 16 17:19:17 2018:\n	发生的经济\n\n\n',1),('Jack','Sun Dec 16 17:19:53 2018','Jack-->Sun Dec 16 17:19:53 2018:\n	welcome everybody\n\n',1),('Jerry','Sun Dec 16 17:22:20 2018','Jerry-->Sun Dec 16 17:22:20 2018:\n	nimenhao\n\n',1),('Jerry','Sun Dec 16 17:22:26 2018','Jerry-->Sun Dec 16 17:22:26 2018:\n	ni men doushi laji\n\n',1),('fangyuxin','Sun Dec 16 17:22:31 2018','fangyuxin-->Sun Dec 16 17:22:31 2018:\n	你们公会\n\n\n',1),('fangyuxin','Sun Dec 16 17:22:40 2018','fangyuxin-->Sun Dec 16 17:22:40 2018:\n	爽肤水、\n\n\n',1),('Jack','Sun Dec 16 17:22:47 2018','Jack-->Sun Dec 16 17:22:47 2018:\n	dajiahao\n\n',1),('Jerry','Sun Dec 16 17:26:46 2018','[群聊]我们一家人Jerry-->Sun Dec 16 17:26:46 2018:\n	rubbish\n\n',1),('fangyuxin','Sun Dec 16 17:26:57 2018','[群聊]我们一家人fangyuxin-->Sun Dec 16 17:26:57 2018:\n	大噶好~~~\n\n',1),('Jack','Sun Dec 16 17:27:02 2018','[群聊]我们一家人Jack-->Sun Dec 16 17:27:02 2018:\n	大家好，我是Jack\n\n',1);
/*!40000 ALTER TABLE `xiaozhang_unread_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-16 17:35:09

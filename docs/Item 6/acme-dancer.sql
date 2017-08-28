start transaction;

drop database if exists `Acme-Dancer`;
create database `Acme-Dancer`;

use `Acme-Dancer`;

drop user if exists 'acme-user'@'%';
drop user if exists 'acme-manager'@'%';

create user 'acme-user'@'%' identified by password '*4F10007AADA9EE3DBB2CC36575DFC6F4FDE27577';
create user 'acme-manager'@'%' identified by password '*FDB8CD304EB2317D10C95D797A4BD7492560F55F';

grant select, insert, update, delete on `Acme-Dancer`.* to 'acme-user'@'%';
grant select, insert, update, delete, create, drop, references, index, alter,
	create temporary tables, lock tables, create view, create routine,
	alter routine, execute, trigger, show view on `Acme-Dancer`.* to 'acme-manager'@'%';

-- MySQL dump 10.13  Distrib 5.5.29, for Win64 (x86)
--
-- Host: localhost    Database: Acme-Dancer
-- ------------------------------------------------------
-- Server version	5.5.29

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
-- Table structure for table `academy`
--

DROP TABLE IF EXISTS `academy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academy` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `actorName` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  `commercialName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ae6mrfke5ikqsinq6dx38dy8m` (`userAccount_id`),
  CONSTRAINT `FK_ae6mrfke5ikqsinq6dx38dy8m` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academy`
--

LOCK TABLES `academy` WRITE;
/*!40000 ALTER TABLE `academy` DISABLE KEYS */;
INSERT INTO `academy` VALUES (640,0,'Juan Carlos','41100','jc@hotmail.com','+34 (777) 1234','Lopez',634,'karli academy'),(641,0,'Laura','41100','laura@hotmail.com','+34 (777) 1224','Padial',635,'laurita academy'),(642,0,'Karli','41109','jc@hotmail.com','+34 (666) 1234','Lopez',637,'karlichin');
/*!40000 ALTER TABLE `academy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academy_course`
--

DROP TABLE IF EXISTS `academy_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academy_course` (
  `Academy_id` int(11) NOT NULL,
  `courses_id` int(11) NOT NULL,
  UNIQUE KEY `UK_mwbdkqt1xbqbewvr01k9ktbvi` (`courses_id`),
  KEY `FK_kpu3gjcj1eydy48pysg1j4jam` (`Academy_id`),
  CONSTRAINT `FK_kpu3gjcj1eydy48pysg1j4jam` FOREIGN KEY (`Academy_id`) REFERENCES `academy` (`id`),
  CONSTRAINT `FK_mwbdkqt1xbqbewvr01k9ktbvi` FOREIGN KEY (`courses_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academy_course`
--

LOCK TABLES `academy_course` WRITE;
/*!40000 ALTER TABLE `academy_course` DISABLE KEYS */;
INSERT INTO `academy_course` VALUES (640,667),(640,668),(640,671),(641,669),(641,672),(642,670);
/*!40000 ALTER TABLE `academy_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academy_tutorial`
--

DROP TABLE IF EXISTS `academy_tutorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academy_tutorial` (
  `Academy_id` int(11) NOT NULL,
  `tutorials_id` int(11) NOT NULL,
  UNIQUE KEY `UK_5wh59a9xjdfn5ibje8l1scedf` (`tutorials_id`),
  KEY `FK_qh8m6xqdmaidosxqfb9yl36s8` (`Academy_id`),
  CONSTRAINT `FK_qh8m6xqdmaidosxqfb9yl36s8` FOREIGN KEY (`Academy_id`) REFERENCES `academy` (`id`),
  CONSTRAINT `FK_5wh59a9xjdfn5ibje8l1scedf` FOREIGN KEY (`tutorials_id`) REFERENCES `tutorial` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academy_tutorial`
--

LOCK TABLES `academy_tutorial` WRITE;
/*!40000 ALTER TABLE `academy_tutorial` DISABLE KEYS */;
INSERT INTO `academy_tutorial` VALUES (640,654),(640,655),(641,656),(642,659);
/*!40000 ALTER TABLE `academy_tutorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `actorName` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_cgls5lrufx91ufsyh467spwa3` (`userAccount_id`),
  CONSTRAINT `FK_cgls5lrufx91ufsyh467spwa3` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actor_actor`
--

DROP TABLE IF EXISTS `actor_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor_actor` (
  `Actor_id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor_actor`
--

LOCK TABLES `actor_actor` WRITE;
/*!40000 ALTER TABLE `actor_actor` DISABLE KEYS */;
INSERT INTO `actor_actor` VALUES (639,641),(639,643),(639,644),(640,641),(640,643),(640,644),(641,643),(641,644),(643,641),(644,641),(644,643);
/*!40000 ALTER TABLE `actor_actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actor_chirp`
--

DROP TABLE IF EXISTS `actor_chirp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor_chirp` (
  `Actor_id` int(11) NOT NULL,
  `chirps_id` int(11) NOT NULL,
  UNIQUE KEY `UK_csf50bdxyeca2437u2c85o9mn` (`chirps_id`),
  CONSTRAINT `FK_csf50bdxyeca2437u2c85o9mn` FOREIGN KEY (`chirps_id`) REFERENCES `chirp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor_chirp`
--

LOCK TABLES `actor_chirp` WRITE;
/*!40000 ALTER TABLE `actor_chirp` DISABLE KEYS */;
INSERT INTO `actor_chirp` VALUES (640,646),(641,647),(642,648),(643,649),(640,650),(641,651),(643,652),(644,653);
/*!40000 ALTER TABLE `actor_chirp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `actorName` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_idt4b4u259p6vs4pyr9lax4eg` (`userAccount_id`),
  CONSTRAINT `FK_idt4b4u259p6vs4pyr9lax4eg` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (639,0,'Laura','41109','lp@hotmail.com','+34 (666) 1234','Padial',631);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `createMoment` datetime DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2dsdgecqprpt2vqv2vym1esi3` (`course_id`),
  CONSTRAINT `FK_2dsdgecqprpt2vqv2vym1esi3` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (673,0,'2018-04-08 00:12:00','PENDING',667),(674,0,'2018-04-08 13:00:00','ACCEPTED',668),(675,0,'2018-04-08 20:00:00','REJECTED',669),(676,0,'2018-05-08 08:12:12','PENDING',670),(677,0,'2018-05-08 08:13:13','ACCEPTED',670),(678,0,'2018-05-08 08:20:00','REJECTED',670);
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chirp`
--

DROP TABLE IF EXISTS `chirp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chirp` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `momentWritten` datetime DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `actor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chirp`
--

LOCK TABLES `chirp` WRITE;
/*!40000 ALTER TABLE `chirp` DISABLE KEYS */;
INSERT INTO `chirp` VALUES (646,0,'2018-04-08 00:00:12','Hello world!',640),(647,0,'2018-04-08 00:00:15','How are you?',641),(648,0,'2018-04-08 00:00:20','This is great!',642),(649,0,'2018-04-08 00:00:21','I was train a lot',643),(650,0,'2018-05-08 08:00:00','Good morning',640),(651,0,'2018-05-08 08:01:00','What\'s happen in the morning\'',641),(652,0,'2018-05-08 08:02:00','Today we start hard!',643),(653,0,'2018-05-08 08:03:00','Woww I appoint!',644);
/*!40000 ALTER TABLE `chirp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `dayWeek` varchar(255) DEFAULT NULL,
  `end` date DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `start` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `academy_id` int(11) NOT NULL,
  `style_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bc9ifd1hhxpnv9se06pofu6sx` (`academy_id`),
  KEY `FK_rlcfhfpi6xh26k29e7jieulxx` (`style_id`),
  CONSTRAINT `FK_rlcfhfpi6xh26k29e7jieulxx` FOREIGN KEY (`style_id`) REFERENCES `style` (`id`),
  CONSTRAINT `FK_bc9ifd1hhxpnv9se06pofu6sx` FOREIGN KEY (`academy_id`) REFERENCES `academy` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (667,0,'Monday','2018-04-12','BEGINNER','2018-04-08','20:00:00','Bachata lessons',640,660),(668,0,'Tuesday','2019-04-12','INTERMEDIATE','2018-04-08','17:00:00','course salsa latina',640,661),(669,0,'Thursday','2019-04-10','ADVANCED','2018-04-08','20:00:00','Pachanga lessons',641,662),(670,0,'Wednesday','2020-01-06','BEGINNER','2018-03-09','16:00:00','Cha-chá lessons',642,663),(671,0,'Tuesday','2019-04-06','INTERMEDIATE','2019-04-01','17:00:00','Rumba lessons',640,664),(672,0,'Friday','2019-04-06','ADVANCED','2019-04-03','20:00:00','Kizomba lessons',641,665);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_application`
--

DROP TABLE IF EXISTS `course_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_application` (
  `Course_id` int(11) NOT NULL,
  `applications_id` int(11) NOT NULL,
  UNIQUE KEY `UK_j4mvdqvqg6kxmtskxo018qpl2` (`applications_id`),
  KEY `FK_mginfqgiumbqmsshu4a04molr` (`Course_id`),
  CONSTRAINT `FK_mginfqgiumbqmsshu4a04molr` FOREIGN KEY (`Course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_j4mvdqvqg6kxmtskxo018qpl2` FOREIGN KEY (`applications_id`) REFERENCES `application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_application`
--

LOCK TABLES `course_application` WRITE;
/*!40000 ALTER TABLE `course_application` DISABLE KEYS */;
INSERT INTO `course_application` VALUES (667,673),(668,674),(669,675),(670,676),(670,677),(670,678);
/*!40000 ALTER TABLE `course_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dancer`
--

DROP TABLE IF EXISTS `dancer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dancer` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `actorName` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ns7fscvc0od1jrlgncofm8d0d` (`userAccount_id`),
  CONSTRAINT `FK_ns7fscvc0od1jrlgncofm8d0d` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dancer`
--

LOCK TABLES `dancer` WRITE;
/*!40000 ALTER TABLE `dancer` DISABLE KEYS */;
INSERT INTO `dancer` VALUES (643,0,'Juan Jose','41100','jj@hotmail.com','+34 (777) 1524','Valle',632),(644,0,'Adrian','41100','adrian@hotmail.com','+34 (777) 2524','Sanchez',633),(645,0,'Pepito','41108','pegri@hotmail.com','+34 (777) 4343','Grillo',638);
/*!40000 ALTER TABLE `dancer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dancer_application`
--

DROP TABLE IF EXISTS `dancer_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dancer_application` (
  `Dancer_id` int(11) NOT NULL,
  `applications_id` int(11) NOT NULL,
  UNIQUE KEY `UK_chj0gmip096k0gosslfcurlkt` (`applications_id`),
  KEY `FK_mor4ei7r7qagbid6lgikdoikl` (`Dancer_id`),
  CONSTRAINT `FK_mor4ei7r7qagbid6lgikdoikl` FOREIGN KEY (`Dancer_id`) REFERENCES `dancer` (`id`),
  CONSTRAINT `FK_chj0gmip096k0gosslfcurlkt` FOREIGN KEY (`applications_id`) REFERENCES `application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dancer_application`
--

LOCK TABLES `dancer_application` WRITE;
/*!40000 ALTER TABLE `dancer_application` DISABLE KEYS */;
INSERT INTO `dancer_application` VALUES (643,673),(643,674),(644,675);
/*!40000 ALTER TABLE `dancer_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequences`
--

DROP TABLE IF EXISTS `hibernate_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) DEFAULT NULL,
  `sequence_next_hi_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequences`
--

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;
INSERT INTO `hibernate_sequences` VALUES ('DomainEntity',1);
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `style`
--

DROP TABLE IF EXISTS `style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `style` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `style`
--

LOCK TABLES `style` WRITE;
/*!40000 ALTER TABLE `style` DISABLE KEYS */;
INSERT INTO `style` VALUES (660,0,'Latin dance','Bachata'),(661,0,'Cuban dance','Salsa'),(662,0,'Cuban dance, mix between salsa and merengue','Pachanga'),(663,0,'Cuban dance','Chá-chá'),(664,0,'Flamenco','Rumba'),(665,0,'African dance very sensual','Kizomba'),(666,0,'Latin dance, very funny','Mambo');
/*!40000 ALTER TABLE `style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `style_course`
--

DROP TABLE IF EXISTS `style_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `style_course` (
  `Style_id` int(11) NOT NULL,
  `courses_id` int(11) NOT NULL,
  UNIQUE KEY `UK_f0ay07dvoeahg99s8gqodq13a` (`courses_id`),
  KEY `FK_8i25ot42nldw5gavjvjbnkktg` (`Style_id`),
  CONSTRAINT `FK_8i25ot42nldw5gavjvjbnkktg` FOREIGN KEY (`Style_id`) REFERENCES `style` (`id`),
  CONSTRAINT `FK_f0ay07dvoeahg99s8gqodq13a` FOREIGN KEY (`courses_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `style_course`
--

LOCK TABLES `style_course` WRITE;
/*!40000 ALTER TABLE `style_course` DISABLE KEYS */;
INSERT INTO `style_course` VALUES (660,667),(661,668),(662,669),(663,670),(664,671),(665,672);
/*!40000 ALTER TABLE `style_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `style_pictures`
--

DROP TABLE IF EXISTS `style_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `style_pictures` (
  `Style_id` int(11) NOT NULL,
  `pictures` varchar(255) DEFAULT NULL,
  KEY `FK_c8ig4n8ltumwgswyluh26mf07` (`Style_id`),
  CONSTRAINT `FK_c8ig4n8ltumwgswyluh26mf07` FOREIGN KEY (`Style_id`) REFERENCES `style` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `style_pictures`
--

LOCK TABLES `style_pictures` WRITE;
/*!40000 ALTER TABLE `style_pictures` DISABLE KEYS */;
INSERT INTO `style_pictures` VALUES (660,'\n					http://dancingboulevard.com/wp-content/uploads/2015/10/bachata-2.jpg\n				'),(661,'\n					https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGMDP_uW6sXGUhK5bqtuQQg4ChyOiqqb3C6G0IE-6eQsd7OKwRIQ\n				'),(662,'\n					http://1.bp.blogspot.com/_A_JOA4qbTsw/TJax4_-RvbI/AAAAAAAAFbs/hWs7xfoGvLU/s400/DSC_0312.JPG\n				'),(663,'\n					https://usercontent2.hubstatic.com/12161217_f520.jpg\n				'),(664,'\n					http://www.universogaditano.com/sites/default/files/imagecache/400xY/flamenco.jpg\n				'),(665,'https://www.youtube.com/watch?v=a15gEeLzT2E'),(666,'\n					https://inspirationanddance.files.wordpress.com/2012/04/mabo.jpg\n				');
/*!40000 ALTER TABLE `style_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `style_videos`
--

DROP TABLE IF EXISTS `style_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `style_videos` (
  `Style_id` int(11) NOT NULL,
  `videos` varchar(255) DEFAULT NULL,
  KEY `FK_2q2oun1en7hmp604m9k61nxtt` (`Style_id`),
  CONSTRAINT `FK_2q2oun1en7hmp604m9k61nxtt` FOREIGN KEY (`Style_id`) REFERENCES `style` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `style_videos`
--

LOCK TABLES `style_videos` WRITE;
/*!40000 ALTER TABLE `style_videos` DISABLE KEYS */;
INSERT INTO `style_videos` VALUES (660,'https://www.youtube.com/watch?v=PQSaof3b_aE'),(661,'https://www.youtube.com/watch?v=Gj-evaqUzeA'),(662,'https://www.youtube.com/watch?v=BwjN0t7eFPU'),(663,'https://www.youtube.com/watch?v=xKeUpU446Xg'),(664,'https://www.youtube.com/watch?v=Use9r0ywn-Y'),(665,'https://www.youtube.com/watch?v=a15gEeLzT2E'),(666,'https://www.youtube.com/watch?v=FdhPgVMdIqo');
/*!40000 ALTER TABLE `style_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutorial`
--

DROP TABLE IF EXISTS `tutorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutorial` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `numShows` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutorial`
--

LOCK TABLES `tutorial` WRITE;
/*!40000 ALTER TABLE `tutorial` DISABLE KEYS */;
INSERT INTO `tutorial` VALUES (654,0,'How dancer pachanga',6,'Pachanga','https://www.youtube.com/watch?v=BwjN0t7eFPU'),(655,0,'How dancer salsa latina',10,'salsa latina','https://www.youtube.com/watch?v=Z7rFasnFCHw'),(656,0,'How dancer popping',20,'popping dancer','https://www.youtube.com/watch?v=ExfzIXHh_i8'),(657,0,'La salsa más movida',6,'41 Pasos de Salsa Cubana','https://www.youtube.com/watch?v=Gj-evaqUzeA'),(658,0,'Daniel y Desiree (Luis fonsi - Despacito)',10,'Bachata sensual','https://www.youtube.com/watch?v=K0NGLAAlxCk'),(659,0,'How dancer twerk?',20,'Twerk','https://www.youtube.com/watch?v=Mn4orvxIeBg');
/*!40000 ALTER TABLE `tutorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount`
--

DROP TABLE IF EXISTS `useraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_csivo9yqa08nrbkog71ycilh5` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount`
--

LOCK TABLES `useraccount` WRITE;
/*!40000 ALTER TABLE `useraccount` DISABLE KEYS */;
INSERT INTO `useraccount` VALUES (631,0,'200ceb26807d6bf99fd6f4f0d1ca54d4','administrator'),(632,0,'932f3b9f35d20f6202d5181db55358aa','dancer1'),(633,0,'c2b207fa4f0fd315eeae2a7643c7a791','dancer2'),(634,0,'2867dc13a84476546c069b33dc859bc7','academy1'),(635,0,'86cbff988e1e889653b316f6695e5e6b','academy2'),(636,0,'1b3231655cebb7a1f783eddf27d254ca','super'),(637,0,'526c4e886de557da4a11880c41fe3c0f','academy3'),(638,0,'e1af577da725228139aa987d4c3dacb4','dancer3');
/*!40000 ALTER TABLE `useraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount_authorities`
--

DROP TABLE IF EXISTS `useraccount_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount_authorities` (
  `UserAccount_id` int(11) NOT NULL,
  `authority` varchar(255) DEFAULT NULL,
  KEY `FK_b63ua47r0u1m7ccc9lte2ui4r` (`UserAccount_id`),
  CONSTRAINT `FK_b63ua47r0u1m7ccc9lte2ui4r` FOREIGN KEY (`UserAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount_authorities`
--

LOCK TABLES `useraccount_authorities` WRITE;
/*!40000 ALTER TABLE `useraccount_authorities` DISABLE KEYS */;
INSERT INTO `useraccount_authorities` VALUES (631,'ADMINISTRATOR'),(632,'DANCER'),(633,'DANCER'),(634,'ACADEMY'),(635,'ACADEMY'),(636,'ADMINISTRATOR'),(636,'DANCER'),(636,'ACADEMY'),(637,'ACADEMY'),(638,'DANCER');
/*!40000 ALTER TABLE `useraccount_authorities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-27 12:24:36

commit;
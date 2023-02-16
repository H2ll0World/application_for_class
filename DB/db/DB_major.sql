-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: DB2018009216
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `major`
--

DROP TABLE IF EXISTS `major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `major` (
  `major_id` int NOT NULL,
  `name` text,
  PRIMARY KEY (`major_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` VALUES (1,'건설환경공학과'),(2,'소프트웨어전공'),(3,'컴퓨터전공'),(4,'전기공학전공'),(5,'건축공학부'),(6,'화학공학전공'),(7,'생명공학전공'),(8,'유기나노공학과'),(9,'에너지공학과'),(10,'기계공학부'),(11,'미래자동차공학과'),(12,'원자력공학과'),(13,'자원환경공학과'),(14,'산업공학과'),(15,'생체공학전공'),(16,'도시공학과'),(17,'융합전자공학부'),(18,'신소재공학부'),(19,'교육학과'),(20,'국어교육과'),(21,'영어교육과'),(22,'응용미술교육과'),(23,'교육공학과'),(24,'수학교육과'),(25,'성악과'),(26,'작곡과'),(27,'피아노과'),(28,'관현악과'),(29,'국악과'),(30,'국어국문학과'),(31,'영어영문학과'),(32,'독어독문학과'),(33,'중어중문학과'),(34,'사학과'),(35,'철학과'),(36,'관광학부'),(37,'수학전공'),(38,'물리학전공'),(39,'화학전공'),(40,'생명과학전공'),(41,'컴퓨터공학부'),(42,'정보시스템학과'),(43,'건축학부'),(44,'경영학부'),(45,'파이낸스경영학과'),(46,'국제학부'),(47,'경제금융학부'),(48,'STS(과학기술학)전공'),(49,'공공수행인문학전공'),(50,'미디어문화전공'),(51,'영어커뮤니케이션전공'),(52,'통상한국어커뮤니케이션전공'),(53,'글로벌비즈니스문화전공(영어전용)'),(54,'중국경제통상전공'),(55,'정책학과'),(56,'법학과'),(57,'의류학과'),(58,'식품영양학과'),(59,'실내건축디자인학과'),(60,'체육학과'),(61,'스포츠산업학과'),(62,'연극영화학과'),(63,'무용학과'),(64,'간호학전공'),(65,'간호전공'),(66,'정치외교학과'),(67,'사회학과'),(68,'미디어커뮤니케이션학과'),(69,'행정학과'),(70,'한중통번역전공'),(71,'화공생명공학부'),(72,'전기·생체공학부'),(73,'의예과'),(74,'수학과'),(75,'물리학과'),(76,'화학과'),(77,'생명과학과'),(78,'응용시스템학과'),(79,'교양인영역'),(80,'인문과예술영역'),(81,'언어와표현영역'),(82,'세계인영역'),(83,'사회와세계영역'),(84,'실용인영역'),(85,'비지니스와리더쉽영역'),(86,'과학과기술영역'),(87,'서울대학'),(88,'봉사인영역'),(89,'가상대학영역');
/*!40000 ALTER TABLE `major` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-08 20:10:56

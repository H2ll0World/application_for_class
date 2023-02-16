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
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` int NOT NULL,
  `password` text,
  `name` text,
  `sex` text,
  `major_id` int DEFAULT NULL,
  `lecturer_id` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `state` int DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (2018003125,'125125125','정남아','female',44,2001032011,4,0),(2018004052,'39nnf2','김관유','male',4,2001032064,3,0),(2019499349,'2bn4','이현주','female',5,2001032031,4,0),(2020004003,'banila','김동관','male',33,2001032030,3,0),(2020004203,'qwe123','주정현','male',2,2001021002,3,0),(2020004533,'35234','한준희',' male',3,2001032070,3,0),(2020040404,'x17171771','김다미','female',15,2001032068,3,0),(2020394929,'3425nn5','이지은','female',1,2001032085,3,0),(2021001445,'7007','노선영','female',4,2001032010,2,0),(2021004004,'foxfoxfox','윤준영','male',22,2001032004,2,0),(2021004394,'goodboy','윤인욱','male',1,2001032004,2,0),(2021030128,'food','윤지형','male',44,2001032078,2,0),(2021030303,'arandomkey','최다비드','male',34,2001032031,2,0),(2021040051,'zeroone234','최아랑','female',19,2001032078,2,0),(2022000001,'pw','김하나','male',44,2001032078,1,0),(2022001303,'192939','김다현','female',3,2001032009,1,0),(2022002331,'wer234','이상덕','male',2,2001032008,1,0),(2022005004,'hexahed','장두호','male',5,2001032081,1,0),(2022019493,'zerozero','임지훈','male',17,2001032003,1,0),(2022040404,'donkey','권지현','female',22,2001032053,1,0),(2022505050,'hellobaby','권희조','female',44,2001032078,1,0);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
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

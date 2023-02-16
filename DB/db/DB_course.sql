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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` text,
  `name` text,
  `credit` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('CIE3022','철근콘크리트구조설계',3),('CIE4011','수리학및실험',3),('CIE4065','유비쿼터스첨단건설공학',3),('EEC3005','상하수도공학',3),('CSE4006','소프트웨어공학',3),('ITE3070','전공멘토링6',1),('ELE3020','컴퓨터구조2',3),('ENE4019','컴퓨터네트워크',3),('ITE3016','데이터베이스시스템',3),('MAT3008','수치해석',3),('ECL4009','피드백시스템',3),('ECL4013','전기공학종합설계2',3),('ECL4018','전기공학세미나',3),('ELE4019','전력시스템공학',3),('ARE3009','건축구조역학2',3),('ARE4020','건축공학실험',3),('ARE4030','전기회로및조명시스템',3),('CIE2007','측량학',3),('CHE3012','물질전달',3),('CHM3066','화공기초실험',2),('CHM4013','고분자물성',3),('CME4002','화공전산설계',3),('GEN3052','환경공학',3),('MEE4001','열전달',3),('BTN4005','생물나노소재',3),('BTN4012','공학종합설계2(URIP)',1),('DBC3018','미생물학',3),('GEN6095','전공현장실습2',3),('ONE4004','유기나노공학종합설계2',3),('ONE4011','유기전자소재나노공정',3),('EGY4013','에너지공학종합설계2',3),('EGY4019','에너지유기소재',3),('CIE3032','지반공학및실험',3),('CIE4047','수공구조물설계',3),('CIE4068','건설환경공학종합설계2',3),('ELE4029','컴파일러',3),('GEN6006','특허법의이해',2),('ECL3005','임베디드제어시스템',3),('ECL4010','차량전자제어',3),('ECL4014','산업플라즈마공학',3),('ELE3004','제어공학',3),('ELE4025','펄스파워공학',3),('ARE3069','건설사업관리1',3),('ARE4022','건축음향',3),('ARE5013','건축종합설계2',3),('CIE3070','철근콘크리트구조2',3),('CHE1015','기능성고분자',3),('CHE4053','유기소자공학',3),('CHM3078','촉매반응공학',3),('CHM4083','나노화학공학',3),('COE1011','실용공학연구2',1),('GEN5026','테크노경영학',3),('BIO2022','세포생물학',3),('BTN4009','응용유전학',3),('ICH4022','고분자재료',3),('ONE4005','전공세미나(유기나노공학)URIP',3),('TXE4065','고분자구조',3),('EGY3001','재료물성학',3),('EGY4016','나노바이오에너지소재',3),('CIE3033','건설경제학',3),('CIE4058','구조동역학',3),('COE3053','공업수학3',3),('MME3026','암반공학',3),('ITE3068','소프트웨어스튜디오2',3),('ITE3060','시스템프로그램설계2',2),('ECL3007','플라즈마공학2',3),('ECL4011','전동력제어',3),('ECL4015','전력전자제어',3),('ELE3013','전기기기',3),('ARE4014','건축구조계획',3),('ARE4026','환경과생태건축',3),('ARE5032','공학프로젝트및현장실습2',3),('CHE3006','화공열역학2',3),('CHE4054','화학공학종합설계2(URIP)',3),('CHM4001','기기분석',3),('CIE7077','테스트',1),('CIE7777','테스트',2),('CIE9999','테스트',3),('CIE8888','테스트',3);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
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

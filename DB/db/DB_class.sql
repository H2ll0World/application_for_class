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
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `class_id` int NOT NULL,
  `class_no` int DEFAULT NULL,
  `course_id` text,
  `name` text,
  `major_id` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `credit` int DEFAULT NULL,
  `lecturer_id` int DEFAULT NULL,
  `person_cur` int DEFAULT '0',
  `person_max` int DEFAULT NULL,
  `opened` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (8832,10004,'CIE3032','지반공학및실험',1,2,3,2001032031,1,48,2022,163),(8833,10005,'CIE3033','건설경제학',1,1,3,2001032065,0,25,2022,101),(8834,10007,'CIE4011','수리학및실험',1,1,3,2001001002,17,18,2022,7),(8835,10009,'CIE4047','수공구조물설계',1,4,3,2001032032,3,38,2022,65),(8836,10010,'CIE4058','구조동역학',1,3,3,2001032066,1,25,2022,148),(8837,10012,'CIE4065','유비쿼터스첨단건설공학',1,1,3,2001011003,1,5,2022,153),(8838,10013,'CIE4068','건설환경공학종합설계2',1,4,3,2001032033,1,39,2022,82),(8839,10014,'COE3053','공업수학3',1,3,3,2001032067,0,25,2022,92),(8840,10015,'EEC3005','상하수도공학',1,3,3,2001011004,0,6,2022,107),(8841,10016,'GEN6095','전공현장실습2',1,3,3,2001032034,6,36,2022,156),(8842,10017,'MME3026','암반공학',1,3,3,2001032068,0,25,2022,91),(8843,10020,'CSE4006','소프트웨어공학',2,3,3,2001021002,9,7,2022,85),(8844,10022,'GEN6095','전공현장실습2',2,3,3,2001032035,0,30,2022,88),(8845,10025,'ITE3068','소프트웨어스튜디오2',2,3,3,2001032069,2,25,2022,117),(8846,10027,'ITE3070','전공멘토링6',2,3,1,2001031001,2,8,2022,99),(8847,10029,'CSE4006','소프트웨어공학',3,3,3,2001032036,0,33,2022,36),(8848,10030,'CSE4006','소프트웨어공학',3,3,3,2001032070,0,25,2022,193),(8849,10031,'ELE3020','컴퓨터구조2',3,3,3,2001032003,1,9,2022,12),(8850,10033,'ELE4029','컴파일러',3,3,3,2001032037,4,37,2022,76),(8851,10035,'ENE4019','컴퓨터네트워크',3,3,3,2001032071,5,25,2022,54),(8852,10036,'ENE4019','컴퓨터네트워크',3,3,3,2001032004,0,10,2022,11),(8853,10037,'GEN6006','특허법의이해',3,3,2,2001032038,7,33,2022,137),(8854,10038,'GEN6006','특허법의이해',3,3,2,2001032072,0,25,2022,6),(8855,10041,'ITE3016','데이터베이스시스템',3,2,3,2001021002,5,11,2022,1),(8856,10042,'ITE3016','데이터베이스시스템',3,2,3,2001032035,0,33,2022,2),(8857,10043,'ITE3060','시스템프로그램설계2',3,3,2,2001032073,0,25,2022,66),(8858,10045,'MAT3008','수치해석',3,3,3,2001032006,2,12,2022,172),(8859,10051,'ECL3005','임베디드제어시스템',4,3,3,2001032040,2,31,2022,194),(8860,10052,'ECL3007','플라즈마공학2',4,2,3,2001032074,1,25,2022,106),(8861,10055,'ECL4009','피드백시스템',4,4,3,2001032007,1,13,2022,80),(8862,10056,'ECL4010','차량전자제어',4,4,3,2001032041,4,31,2022,47),(8863,10057,'ECL4011','전동력제어',4,4,3,2001032075,0,25,2022,158),(8864,10058,'ECL4013','전기공학종합설계2',4,4,3,2001032008,0,14,2022,69),(8865,10059,'ECL4014','산업플라즈마공학',4,4,3,2001032042,1,34,2022,59),(8866,10060,'ECL4015','전력전자제어',4,4,3,2001032076,0,25,2022,168),(8867,10061,'ECL4018','전기공학세미나',4,1,3,2001032009,0,15,2022,12),(8868,10062,'ELE3004','제어공학',4,3,3,2001032043,0,38,2022,143),(8869,10063,'ELE3013','전기기기',4,3,3,2001032077,0,25,2022,33),(8870,10065,'ELE4019','전력시스템공학',4,3,3,2001032010,0,16,2022,124),(8871,10066,'ELE4025','펄스파워공학',4,3,3,2001032044,1,50,2022,51),(8872,10067,'GEN5026','테크노경영학',4,3,3,2001032078,0,25,2022,186),(8873,10072,'ARE3009','건축구조역학2',5,2,3,2001032011,0,17,2022,4),(8874,10073,'ARE3069','건설사업관리1',5,1,3,2001032045,0,30,2022,151),(8875,10074,'ARE4014','건축구조계획',5,4,3,2001032079,3,25,2022,111),(8876,10075,'ARE4020','건축공학실험',5,4,3,2001032012,0,18,2022,113),(8877,10076,'ARE4022','건축음향',5,3,3,2001032046,0,30,2022,109),(8878,10077,'ARE4026','환경과생태건축',5,1,3,2001032080,3,25,2022,18),(8879,10078,'ARE4030','전기회로및조명시스템',5,4,3,2001032013,1,19,2022,183),(8880,10079,'ARE5013','건축종합설계2',5,2,3,2001032047,1,30,2022,16),(8881,10080,'ARE5032','공학프로젝트및현장실습2',5,4,3,2001032081,2,25,2022,173),(8882,10081,'CIE2007','측량학',5,4,3,2001032014,1,20,2022,147),(8883,10082,'CIE3070','철근콘크리트구조2',5,3,3,2001032048,0,30,2022,145),(8884,10083,'GEN6095','전공현장실습2',5,3,3,2001032082,0,25,2022,50),(8885,10084,'MAT3008','수치해석',5,3,3,2001032015,0,21,2022,152),(8886,10086,'CHE1015','기능성고분자',6,4,3,2001032049,0,30,2022,68),(8887,10087,'CHE3006','화공열역학2',6,2,3,2001032083,0,25,2022,192),(8888,10088,'CHE3012','물질전달',6,3,3,2001032016,2,22,2022,93),(8889,10089,'CHE4053','유기소자공학',6,4,3,2001032050,0,30,2022,40),(8890,10090,'CHE4054','화학공학종합설계2(URIP)',6,4,3,2001032084,0,25,2022,197),(8891,10091,'CHM3066','화공기초실험',6,3,2,2001032017,2,23,2022,84),(8892,10092,'CHM3078','촉매반응공학',6,3,3,2001032051,0,30,2022,115),(8893,10093,'CHM4001','기기분석',6,2,3,2001032085,0,25,2022,70),(8894,10094,'CHM4013','고분자물성',6,3,3,2001032018,6,24,2022,182),(8895,10096,'CHM4083','나노화학공학',6,4,3,2001032052,0,30,2022,8),(8897,10099,'CME4002','화공전산설계',6,4,3,2001032019,1,25,2022,31),(8898,10100,'COE1011','실용공학연구2',6,3,1,2001032053,1,30,2022,13),(8900,10102,'GEN3052','환경공학',6,1,3,2001032020,1,26,2022,164),(8901,10103,'GEN5026','테크노경영학',6,3,3,2001032054,0,30,2022,75),(8903,10105,'MEE4001','열전달',6,3,3,2001032021,1,27,2022,10),(8904,10108,'BIO2022','세포생물학',7,3,3,2001032055,0,30,2022,138),(8906,10112,'BTN4005','생물나노소재',7,4,3,2001032022,1,28,2022,167),(8907,10113,'BTN4009','응용유전학',7,4,3,2001032056,0,30,2022,157),(8909,10115,'BTN4012','공학종합설계2(URIP)',7,4,1,2001032023,2,29,2022,103),(8910,10117,'COE1011','실용공학연구2',7,3,1,2001032057,0,30,2022,133),(8912,10119,'DBC3018','미생물학',7,3,3,2001032024,3,30,2022,199),(8913,10120,'GEN5026','테크노경영학',7,3,3,2001032058,0,30,2022,116),(8915,10124,'GEN6095','전공현장실습2',8,3,3,2001032025,0,31,2022,72),(8916,10125,'ICH4022','고분자재료',8,3,3,2001032059,1,30,2022,127),(8918,10131,'ONE4004','유기나노공학종합설계2',8,4,3,2001032026,4,32,2022,41),(8919,10132,'ONE4005','전공세미나(유기나노공학)URIP',8,4,3,2001032060,0,30,2022,60),(8921,10135,'ONE4011','유기전자소재나노공정',8,4,3,2001032027,3,33,2022,122),(8922,10140,'TXE4065','고분자구조',8,4,3,2001032061,0,30,2022,17),(8924,10142,'CHM4013','고분자물성',9,3,3,2001032028,0,34,2022,90),(8925,10144,'EGY3001','재료물성학',9,3,3,2001032062,0,30,2022,179),(8927,10147,'EGY4013','에너지공학종합설계2',9,4,3,2001032029,4,35,2022,170),(8928,10148,'EGY4016','나노바이오에너지소재',9,4,3,2001032063,0,30,2022,128),(8930,10150,'EGY4019','에너지유기소재',9,1,3,2001032030,4,36,2022,134),(8931,10151,'GEN5026','테크노경영학',9,3,3,2001032064,0,25,2022,160),(9999,10333,'CIE7077','테스트',1,2,3,2001001001,0,120,2022,1),(88311,10003,'CIE3022','철근콘크리트구조설계',1,1,3,2001001001,0,25,2021,169),(88312,10003,'CIE3022','철근콘크리트구조설계',1,1,3,2001001001,0,22,2020,169),(88313,10003,'CIE3022','철근콘크리트구조설계',1,1,3,2001001001,0,34,2019,169),(88321,10004,'CIE3032','지반공학및실험',1,2,3,2001032031,0,37,2021,163),(88322,10004,'CIE3032','지반공학및실험',1,2,3,2001032031,0,34,2020,163),(88323,10004,'CIE3032','지반공학및실험',1,2,3,2001032031,0,37,2019,163),(88331,10005,'CIE3033','건설경제학',1,1,3,2001032065,0,35,2021,101),(88332,10005,'CIE3033','건설경제학',1,1,3,2001032065,0,27,2020,101),(88333,10005,'CIE3033','건설경제학',1,1,3,2001032065,0,2,2019,101),(88341,10007,'CIE4011','수리학및실험',1,1,3,2001001002,0,25,2021,7),(88342,10007,'CIE4011','수리학및실험',1,1,3,2001001002,0,28,2020,7),(88343,10007,'CIE4011','수리학및실험',1,1,3,2001001002,0,32,2019,6),(88351,10009,'CIE4047','수공구조물설계',1,4,3,2001032032,0,38,2021,65),(88352,10009,'CIE4047','수공구조물설계',1,4,3,2001032032,0,23,2020,65),(88353,10009,'CIE4047','수공구조물설계',1,4,3,2001032032,0,38,2019,65),(88361,10010,'CIE4058','구조동역학',1,3,3,2001032066,0,25,2021,148),(88362,10010,'CIE4058','구조동역학',1,3,3,2001032066,0,36,2020,148),(88363,10010,'CIE4058','구조동역학',1,3,3,2001032066,0,3,2019,148),(88371,10012,'CIE4065','유비쿼터스첨단건설공학',1,1,3,2001011003,0,25,2021,153),(88372,10012,'CIE4065','유비쿼터스첨단건설공학',1,1,3,2001011003,0,33,2020,153),(88373,10012,'CIE4065','유비쿼터스첨단건설공학',1,1,3,2001011003,0,26,2019,153),(88381,10013,'CIE4068','건설환경공학종합설계2',1,4,3,2001032033,0,29,2021,82),(88382,10013,'CIE4068','건설환경공학종합설계2',1,4,3,2001032033,0,36,2020,82),(88383,10013,'CIE4068','건설환경공학종합설계2',1,4,3,2001032033,0,39,2019,82),(88391,10014,'COE3053','공업수학3',1,3,3,2001032067,0,25,2021,92),(88392,10014,'COE3053','공업수학3',1,3,3,2001032067,0,36,2020,92),(88393,10014,'COE3053','공업수학3',1,3,3,2001032067,0,4,2019,92),(88401,10015,'EEC3005','상하수도공학',1,3,3,2001011004,0,25,2021,107),(88402,10015,'EEC3005','상하수도공학',1,3,3,2001011004,0,38,2020,107),(88403,10015,'EEC3005','상하수도공학',1,3,3,2001011004,0,27,2019,107),(88411,10016,'GEN6095','전공현장실습2',1,3,3,2001032034,0,40,2021,50),(88412,10016,'GEN6095','전공현장실습2',1,3,3,2001032034,0,32,2020,14),(88413,10016,'GEN6095','전공현장실습2',1,3,3,2001032034,0,40,2019,60),(88421,10017,'MME3026','암반공학',1,3,3,2001032068,0,35,2021,91),(88422,10017,'MME3026','암반공학',1,3,3,2001032068,0,29,2020,91),(88423,10017,'MME3026','암반공학',1,3,3,2001032068,0,5,2019,91),(88431,10020,'CSE4006','소프트웨어공학',2,3,3,2001021002,0,25,2021,19),(88432,10020,'CSE4006','소프트웨어공학',2,3,3,2001021002,0,20,2020,83),(88433,10020,'CSE4006','소프트웨어공학',2,3,3,2001021002,0,26,2019,110),(88441,10022,'GEN6095','전공현장실습2',2,3,3,2001032035,0,29,2021,50),(88442,10022,'GEN6095','전공현장실습2',2,3,3,2001032035,0,31,2020,80),(88443,10022,'GEN6095','전공현장실습2',2,3,3,2001032035,0,34,2019,157),(88451,10025,'ITE3068','소프트웨어스튜디오2',2,3,3,2001032069,0,29,2021,3),(88452,10025,'ITE3068','소프트웨어스튜디오2',2,3,3,2001032069,0,24,2020,2),(88453,10025,'ITE3068','소프트웨어스튜디오2',2,3,3,2001032069,0,6,2019,3),(88461,10027,'ITE3070','전공멘토링6',2,3,1,2001031001,0,25,2021,99),(88462,10027,'ITE3070','전공멘토링6',2,3,1,2001031001,0,19,2020,99),(88463,10027,'ITE3070','전공멘토링6',2,3,1,2001031001,0,22,2019,99),(88471,10029,'CSE4006','소프트웨어공학',3,3,3,2001032036,0,33,2021,18),(88472,10029,'CSE4006','소프트웨어공학',3,3,3,2001032036,0,32,2020,14),(88473,10029,'CSE4006','소프트웨어공학',3,3,3,2001032036,0,30,2019,113),(88481,10030,'CSE4006','소프트웨어공학',3,3,3,2001032070,0,19,2021,75),(88482,10030,'CSE4006','소프트웨어공학',3,3,3,2001032070,0,29,2020,112),(88483,10030,'CSE4006','소프트웨어공학',3,3,3,2001032070,0,7,2019,118),(88491,10031,'ELE3020','컴퓨터구조2',3,3,3,2001032003,0,25,2021,12),(88492,10031,'ELE3020','컴퓨터구조2',3,3,3,2001032003,0,28,2020,12),(88493,10031,'ELE3020','컴퓨터구조2',3,3,3,2001032003,0,39,2019,12),(88501,10033,'ELE4029','컴파일러',3,3,3,2001032037,0,33,2021,76),(88502,10033,'ELE4029','컴파일러',3,3,3,2001032037,0,40,2020,76),(88503,10033,'ELE4029','컴파일러',3,3,3,2001032037,0,34,2019,76),(88511,10035,'ENE4019','컴퓨터네트워크',3,3,3,2001032071,0,34,2021,18),(88512,10035,'ENE4019','컴퓨터네트워크',3,3,3,2001032071,0,23,2020,108),(88513,10035,'ENE4019','컴퓨터네트워크',3,3,3,2001032071,0,8,2019,90),(88521,10036,'ENE4019','컴퓨터네트워크',3,3,3,2001032004,0,25,2021,13),(88522,10036,'ENE4019','컴퓨터네트워크',3,3,3,2001032004,0,27,2020,114),(88523,10036,'ENE4019','컴퓨터네트워크',3,3,3,2001032004,0,10,2019,108),(88531,10037,'GEN6006','특허법의이해',3,3,2,2001032038,0,35,2021,6),(88532,10037,'GEN6006','특허법의이해',3,3,2,2001032038,0,21,2020,6),(88533,10037,'GEN6006','특허법의이해',3,3,2,2001032038,0,38,2019,6),(88541,10038,'GEN6006','특허법의이해',3,3,2,2001032072,0,30,2021,6),(88542,10038,'GEN6006','특허법의이해',3,3,2,2001032072,0,24,2020,6),(88543,10038,'GEN6006','특허법의이해',3,3,2,2001032072,0,9,2019,6),(88551,10041,'ITE3016','데이터베이스시스템',3,2,3,2001032036,0,25,2021,3),(88552,10041,'ITE3016','데이터베이스시스템',3,2,3,2001021002,0,32,2020,5),(88553,10041,'ITE3016','데이터베이스시스템',3,2,3,2001032005,0,11,2019,7),(88561,10042,'ITE3016','데이터베이스시스템',3,2,3,2001032039,0,32,2021,4),(88562,10042,'ITE3016','데이터베이스시스템',3,2,3,2001032036,0,28,2020,6),(88563,10042,'ITE3016','데이터베이스시스템',3,2,3,2001032035,0,37,2019,11),(88571,10043,'ITE3060','시스템프로그램설계2',3,3,2,2001032073,0,34,2021,5),(88572,10043,'ITE3060','시스템프로그램설계2',3,3,2,2001032073,0,30,2020,5),(88573,10043,'ITE3060','시스템프로그램설계2',3,3,2,2001032073,0,10,2019,5),(88581,10045,'MAT3008','수치해석',3,3,3,2001032006,0,25,2021,10),(88582,10045,'MAT3008','수치해석',3,3,3,2001032006,0,29,2020,87),(88583,10045,'MAT3008','수치해석',3,3,3,2001032006,0,12,2019,107),(88591,10051,'ECL3005','임베디드제어시스템',4,3,3,2001032040,0,25,2021,194),(88592,10051,'ECL3005','임베디드제어시스템',4,3,3,2001032040,0,35,2020,194),(88593,10051,'ECL3005','임베디드제어시스템',4,3,3,2001032040,0,32,2019,194),(88601,10052,'ECL3007','플라즈마공학2',4,2,3,2001032074,0,38,2021,106),(88602,10052,'ECL3007','플라즈마공학2',4,2,3,2001032074,0,20,2020,106),(88603,10052,'ECL3007','플라즈마공학2',4,2,3,2001032074,0,11,2019,106),(88611,10055,'ECL4009','피드백시스템',4,4,3,2001032007,0,25,2021,80),(88612,10055,'ECL4009','피드백시스템',4,4,3,2001032007,0,22,2020,80),(88613,10055,'ECL4009','피드백시스템',4,4,3,2001032007,0,13,2019,80),(88621,10056,'ECL4010','차량전자제어',4,4,3,2001032041,0,36,2021,47),(88622,10056,'ECL4010','차량전자제어',4,4,3,2001032041,0,32,2020,47),(88623,10056,'ECL4010','차량전자제어',4,4,3,2001032041,0,32,2019,47),(88631,10057,'ECL4011','전동력제어',4,4,3,2001032075,0,37,2021,158),(88632,10057,'ECL4011','전동력제어',4,4,3,2001032075,0,38,2020,158),(88633,10057,'ECL4011','전동력제어',4,4,3,2001032075,0,12,2019,158),(88641,10058,'ECL4013','전기공학종합설계2',4,4,3,2001032008,0,25,2021,69),(88642,10058,'ECL4013','전기공학종합설계2',4,4,3,2001032008,0,18,2020,69),(88643,10058,'ECL4013','전기공학종합설계2',4,4,3,2001032008,0,14,2019,69),(88651,10059,'ECL4014','산업플라즈마공학',4,4,3,2001032042,0,33,2021,59),(88652,10059,'ECL4014','산업플라즈마공학',4,4,3,2001032042,0,40,2020,59),(88653,10059,'ECL4014','산업플라즈마공학',4,4,3,2001032042,0,18,2019,59),(88661,10060,'ECL4015','전력전자제어',4,4,3,2001032076,0,32,2021,168),(88662,10060,'ECL4015','전력전자제어',4,4,3,2001032076,0,39,2020,168),(88663,10060,'ECL4015','전력전자제어',4,4,3,2001032076,0,13,2019,168),(88671,10061,'ECL4018','전기공학세미나',4,1,3,2001032009,0,25,2021,12),(88672,10061,'ECL4018','전기공학세미나',4,1,3,2001032009,0,27,2020,12),(88673,10061,'ECL4018','전기공학세미나',4,1,3,2001032009,0,15,2019,12),(88681,10062,'ELE3004','제어공학',4,3,3,2001032043,0,21,2021,143),(88682,10062,'ELE3004','제어공학',4,3,3,2001032043,0,24,2020,143),(88683,10062,'ELE3004','제어공학',4,3,3,2001032043,0,37,2019,143),(88691,10063,'ELE3013','전기기기',4,3,3,2001032077,0,32,2021,33),(88692,10063,'ELE3013','전기기기',4,3,3,2001032077,0,34,2020,33),(88693,10063,'ELE3013','전기기기',4,3,3,2001032077,0,14,2019,33),(88701,10065,'ELE4019','전력시스템공학',4,3,3,2001032010,0,25,2021,124),(88702,10065,'ELE4019','전력시스템공학',4,3,3,2001032010,0,35,2020,124),(88703,10065,'ELE4019','전력시스템공학',4,3,3,2001032010,0,16,2019,124),(88711,10066,'ELE4025','펄스파워공학',4,3,3,2001032044,0,23,2021,51),(88712,10066,'ELE4025','펄스파워공학',4,3,3,2001032044,0,20,2020,51),(88713,10066,'ELE4025','펄스파워공학',4,3,3,2001032044,0,34,2019,51),(88721,10067,'GEN5026','테크노경영학',4,3,3,2001032078,0,18,2021,75),(88722,10067,'GEN5026','테크노경영학',4,3,3,2001032078,0,37,2020,136),(88723,10067,'GEN5026','테크노경영학',4,3,3,2001032078,0,15,2019,136),(88731,10072,'ARE3009','건축구조역학2',5,2,3,2001032011,0,25,2021,4),(88732,10072,'ARE3009','건축구조역학2',5,2,3,2001032011,0,38,2020,4),(88733,10072,'ARE3009','건축구조역학2',5,2,3,2001032011,0,17,2019,4),(88741,10073,'ARE3069','건설사업관리1',5,1,3,2001032045,0,30,2021,151),(88742,10073,'ARE3069','건설사업관리1',5,1,3,2001032045,0,29,2020,151),(88743,10073,'ARE3069','건설사업관리1',5,1,3,2001032045,0,34,2019,151),(88751,10074,'ARE4014','건축구조계획',5,4,3,2001032079,0,37,2021,111),(88752,10074,'ARE4014','건축구조계획',5,4,3,2001032079,0,35,2020,111),(88753,10074,'ARE4014','건축구조계획',5,4,3,2001032079,0,16,2019,111),(88761,10075,'ARE4020','건축공학실험',5,4,3,2001032012,0,25,2021,113),(88762,10075,'ARE4020','건축공학실험',5,4,3,2001032012,0,18,2020,113),(88763,10075,'ARE4020','건축공학실험',5,4,3,2001032012,0,18,2019,113),(88771,10076,'ARE4022','건축음향',5,3,3,2001032046,0,35,2021,109),(88772,10076,'ARE4022','건축음향',5,3,3,2001032046,0,22,2020,109),(88773,10076,'ARE4022','건축음향',5,3,3,2001032046,0,30,2019,109),(88781,10077,'ARE4026','환경과생태건축',5,1,3,2001032080,0,34,2021,18),(88782,10077,'ARE4026','환경과생태건축',5,1,3,2001032080,0,31,2020,18),(88783,10077,'ARE4026','환경과생태건축',5,1,3,2001032080,0,17,2019,18),(88791,10078,'ARE4030','전기회로및조명시스템',5,4,3,2001032013,0,25,2021,183),(88792,10078,'ARE4030','전기회로및조명시스템',5,4,3,2001032013,0,28,2020,183),(88793,10078,'ARE4030','전기회로및조명시스템',5,4,3,2001032013,0,19,2019,183),(88801,10079,'ARE5013','건축종합설계2',5,2,3,2001032047,0,40,2021,16),(88802,10079,'ARE5013','건축종합설계2',5,2,3,2001032047,0,35,2020,16),(88803,10079,'ARE5013','건축종합설계2',5,2,3,2001032047,0,34,2019,16),(88811,10080,'ARE5032','공학프로젝트및현장실습2',5,4,3,2001032081,0,21,2021,173),(88812,10080,'ARE5032','공학프로젝트및현장실습2',5,4,3,2001032081,0,28,2020,173),(88813,10080,'ARE5032','공학프로젝트및현장실습2',5,4,3,2001032081,0,18,2019,173),(88821,10081,'CIE2007','측량학',5,4,3,2001032014,0,25,2021,147),(88822,10081,'CIE2007','측량학',5,4,3,2001032014,0,20,2020,147),(88823,10081,'CIE2007','측량학',5,4,3,2001032014,0,20,2019,147),(88831,10082,'CIE3070','철근콘크리트구조2',5,3,3,2001032048,0,18,2021,145),(88832,10082,'CIE3070','철근콘크리트구조2',5,3,3,2001032048,0,35,2020,145),(88833,10082,'CIE3070','철근콘크리트구조2',5,3,3,2001032048,0,38,2019,145),(88841,10083,'GEN6095','전공현장실습2',5,3,3,2001032082,0,22,2021,14),(88842,10083,'GEN6095','전공현장실습2',5,3,3,2001032082,0,20,2020,80),(88843,10083,'GEN6095','전공현장실습2',5,3,3,2001032082,0,19,2019,157),(88851,10084,'MAT3008','수치해석',5,3,3,2001032015,0,21,2021,10),(88852,10084,'MAT3008','수치해석',5,3,3,2001032015,0,26,2020,87),(88853,10084,'MAT3008','수치해석',5,3,3,2001032015,0,21,2019,107),(88861,10086,'CHE1015','기능성고분자',6,4,3,2001032049,0,29,2021,68),(88862,10086,'CHE1015','기능성고분자',6,4,3,2001032049,0,37,2020,68),(88863,10086,'CHE1015','기능성고분자',6,4,3,2001032049,0,37,2019,68),(88871,10087,'CHE3006','화공열역학2',6,2,3,2001032083,0,23,2021,192),(88872,10087,'CHE3006','화공열역학2',6,2,3,2001032083,0,37,2020,192),(88873,10087,'CHE3006','화공열역학2',6,2,3,2001032083,0,20,2019,192),(88881,10088,'CHE3012','물질전달',6,3,3,2001032016,0,22,2021,93),(88882,10088,'CHE3012','물질전달',6,3,3,2001032016,0,29,2020,94),(88883,10088,'CHE3012','물질전달',6,3,3,2001032016,0,22,2019,96),(88891,10089,'CHE4053','유기소자공학',6,4,3,2001032050,0,25,2021,40),(88892,10089,'CHE4053','유기소자공학',6,4,3,2001032050,0,18,2020,40),(88893,10089,'CHE4053','유기소자공학',6,4,3,2001032050,0,32,2019,40),(88901,10090,'CHE4054','화학공학종합설계2(URIP)',6,4,3,2001032084,0,40,2021,197),(88902,10090,'CHE4054','화학공학종합설계2(URIP)',6,4,3,2001032084,0,31,2020,197),(88903,10090,'CHE4054','화학공학종합설계2(URIP)',6,4,3,2001032084,0,21,2019,197),(88911,10091,'CHM3066','화공기초실험',6,3,2,2001032017,0,23,2021,84),(88912,10091,'CHM3066','화공기초실험',6,3,2,2001032017,0,34,2020,84),(88913,10091,'CHM3066','화공기초실험',6,3,2,2001032017,0,23,2019,84),(88921,10092,'CHM3078','촉매반응공학',6,3,3,2001032051,0,21,2021,115),(88922,10092,'CHM3078','촉매반응공학',6,3,3,2001032051,0,23,2020,115),(88923,10092,'CHM3078','촉매반응공학',6,3,3,2001032051,0,32,2019,115),(88931,10093,'CHM4001','기기분석',6,2,3,2001032085,0,20,2021,70),(88932,10093,'CHM4001','기기분석',6,2,3,2001032085,0,33,2020,70),(88933,10093,'CHM4001','기기분석',6,2,3,2001032085,0,22,2019,70),(88941,10094,'CHM4013','고분자물성',6,3,3,2001032018,0,24,2021,90),(88942,10094,'CHM4013','고분자물성',6,3,3,2001032018,0,19,2020,90),(88943,10094,'CHM4013','고분자물성',6,3,3,2001032018,0,24,2019,90),(88951,10096,'CHM4083','나노화학공학',6,4,3,2001032052,0,21,2021,8),(88952,10096,'CHM4083','나노화학공학',6,4,3,2001032052,0,37,2020,12),(88953,10096,'CHM4083','나노화학공학',6,4,3,2001032052,0,18,2019,8),(88971,10099,'CME4002','화공전산설계',6,4,3,2001032019,0,25,2021,31),(88972,10099,'CME4002','화공전산설계',6,4,3,2001032019,0,33,2020,31),(88973,10099,'CME4002','화공전산설계',6,4,3,2001032019,0,25,2019,31),(88981,10100,'COE1011','실용공학연구2',6,3,1,2001032053,0,27,2021,133),(88982,10100,'COE1011','실용공학연구2',6,3,1,2001032053,0,38,2020,125),(88983,10100,'COE1011','실용공학연구2',6,3,1,2001032053,0,37,2019,99),(89001,10102,'GEN3052','환경공학',6,1,3,2001032020,0,26,2021,164),(89002,10102,'GEN3052','환경공학',6,1,3,2001032020,0,18,2020,164),(89003,10102,'GEN3052','환경공학',6,1,3,2001032020,0,26,2019,164),(89011,10103,'GEN5026','테크노경영학',6,3,3,2001032054,0,40,2021,186),(89012,10103,'GEN5026','테크노경영학',6,3,3,2001032054,0,20,2020,136),(89013,10103,'GEN5026','테크노경영학',6,3,3,2001032054,0,34,2019,136),(89031,10105,'MEE4001','열전달',6,3,3,2001032021,0,27,2021,10),(89032,10105,'MEE4001','열전달',6,3,3,2001032021,0,40,2020,10),(89033,10105,'MEE4001','열전달',6,3,3,2001032021,0,27,2019,10),(89041,10108,'BIO2022','세포생물학',7,3,3,2001032055,0,37,2021,138),(89042,10108,'BIO2022','세포생물학',7,3,3,2001032055,0,28,2020,138),(89043,10108,'BIO2022','세포생물학',7,3,3,2001032055,0,34,2019,138),(89061,10112,'BTN4005','생물나노소재',7,4,3,2001032022,0,28,2021,167),(89062,10112,'BTN4005','생물나노소재',7,4,3,2001032022,0,37,2020,167),(89063,10112,'BTN4005','생물나노소재',7,4,3,2001032022,0,28,2019,167),(89071,10113,'BTN4009','응용유전학',7,4,3,2001032056,0,18,2021,157),(89072,10113,'BTN4009','응용유전학',7,4,3,2001032056,0,18,2020,157),(89073,10113,'BTN4009','응용유전학',7,4,3,2001032056,0,30,2019,157),(89091,10115,'BTN4012','공학종합설계2(URIP)',7,4,1,2001032023,0,29,2021,103),(89092,10115,'BTN4012','공학종합설계2(URIP)',7,4,1,2001032023,0,30,2020,103),(89093,10115,'BTN4012','공학종합설계2(URIP)',7,4,1,2001032023,0,29,2019,103),(89101,10117,'COE1011','실용공학연구2',7,3,1,2001032057,0,40,2021,125),(89102,10117,'COE1011','실용공학연구2',7,3,1,2001032057,0,29,2020,99),(89103,10117,'COE1011','실용공학연구2',7,3,1,2001032057,0,34,2019,99),(89121,10119,'DBC3018','미생물학',7,3,3,2001032024,0,30,2021,199),(89122,10119,'DBC3018','미생물학',7,3,3,2001032024,0,38,2020,199),(89123,10119,'DBC3018','미생물학',7,3,3,2001032024,0,30,2019,199),(89131,10120,'GEN5026','테크노경영학',7,3,3,2001032058,0,22,2021,186),(89132,10120,'GEN5026','테크노경영학',7,3,3,2001032058,0,21,2020,136),(89133,10120,'GEN5026','테크노경영학',7,3,3,2001032058,0,38,2019,136),(89151,10124,'GEN6095','전공현장실습2',8,3,3,2001032025,0,29,2021,50),(89152,10124,'GEN6095','전공현장실습2',8,3,3,2001032025,0,30,2020,14),(89153,10124,'GEN6095','전공현장실습2',8,3,3,2001032025,0,31,2019,60),(89161,10125,'ICH4022','고분자재료',8,3,3,2001032059,0,37,2021,127),(89162,10125,'ICH4022','고분자재료',8,3,3,2001032059,0,35,2020,127),(89163,10125,'ICH4022','고분자재료',8,3,3,2001032059,0,37,2019,127),(89181,10131,'ONE4004','유기나노공학종합설계2',8,4,3,2001032026,0,32,2021,41),(89182,10131,'ONE4004','유기나노공학종합설계2',8,4,3,2001032026,0,34,2020,41),(89183,10131,'ONE4004','유기나노공학종합설계2',8,4,3,2001032026,0,32,2019,41),(89191,10132,'ONE4005','전공세미나(유기나노공학)URIP',8,4,3,2001032060,0,27,2021,60),(89192,10132,'ONE4005','전공세미나(유기나노공학)URIP',8,4,3,2001032060,0,38,2020,60),(89193,10132,'ONE4005','전공세미나(유기나노공학)URIP',8,4,3,2001032060,0,32,2019,60),(89211,10135,'ONE4011','유기전자소재나노공정',8,4,3,2001032027,0,33,2021,122),(89212,10135,'ONE4011','유기전자소재나노공정',8,4,3,2001032027,0,25,2020,122),(89213,10135,'ONE4011','유기전자소재나노공정',8,4,3,2001032027,0,33,2019,122),(89221,10140,'TXE4065','고분자구조',8,4,3,2001032061,0,37,2021,17),(89222,10140,'TXE4065','고분자구조',8,4,3,2001032061,0,33,2020,17),(89223,10140,'TXE4065','고분자구조',8,4,3,2001032061,0,32,2019,17),(89241,10142,'CHM4013','고분자물성',9,3,3,2001032028,0,34,2021,90),(89242,10142,'CHM4013','고분자물성',9,3,3,2001032028,0,18,2020,90),(89243,10142,'CHM4013','고분자물성',9,3,3,2001032028,0,34,2019,90),(89251,10144,'EGY3001','재료물성학',9,3,3,2001032062,0,39,2021,179),(89252,10144,'EGY3001','재료물성학',9,3,3,2001032062,0,21,2020,179),(89253,10144,'EGY3001','재료물성학',9,3,3,2001032062,0,18,2019,179),(89271,10147,'EGY4013','에너지공학종합설계2',9,4,3,2001032029,0,35,2021,170),(89272,10147,'EGY4013','에너지공학종합설계2',9,4,3,2001032029,0,29,2020,170),(89273,10147,'EGY4013','에너지공학종합설계2',9,4,3,2001032029,0,35,2019,170),(89281,10148,'EGY4016','나노바이오에너지소재',9,4,3,2001032063,0,36,2021,128),(89282,10148,'EGY4016','나노바이오에너지소재',9,4,3,2001032063,0,26,2020,128),(89283,10148,'EGY4016','나노바이오에너지소재',9,4,3,2001032063,0,37,2019,128),(89301,10150,'EGY4019','에너지유기소재',9,1,3,2001032030,0,36,2021,134),(89302,10150,'EGY4019','에너지유기소재',9,1,3,2001032030,0,36,2020,134),(89303,10150,'EGY4019','에너지유기소재',9,1,3,2001032030,0,36,2019,134),(89311,10151,'GEN5026','테크노경영학',9,3,3,2001032064,0,37,2021,186),(89312,10151,'GEN5026','테크노경영학',9,3,3,2001032064,0,29,2020,136),(89313,10151,'GEN5026','테크노경영학',9,3,3,2001032064,0,34,2019,136),(99999,10777,'CIE7777','테스트',1,1,2,2001001001,0,10,2022,1);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
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

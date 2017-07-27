-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: comunarr
-- ------------------------------------------------------
-- Server version	5.7.18

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
-- Dumping data for table `collective`
--

LOCK TABLES `collective` WRITE;
/*!40000 ALTER TABLE `collective` DISABLE KEYS */;
INSERT INTO `collective` VALUES (1,'Licenciatura',1),(2,'Bachillerato',1),(3,'Maestria',1),(4,'Repechique',1),(5,'Collectivo prueba SIIII',1),(6,'rootanatl',1),(7,'Mujeres artesanas',1),(8,'Mujeres artesanas II',1),(9,'Mujeres artesanas III',1),(10,'Mujeres artesanas IV',1),(11,'Mujeres artesanas V',1),(12,'Mujeres artesanas VI',1),(13,'Mujeres artesanas VII',1),(14,'Mujeres artesanas VIII',1),(15,'Mujeres artesanas IX',1),(16,'Mujeres ARTESANAAAS X',1);
/*!40000 ALTER TABLE `collective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `collective_comunarrProject`
--

LOCK TABLES `collective_comunarrProject` WRITE;
/*!40000 ALTER TABLE `collective_comunarrProject` DISABLE KEYS */;
INSERT INTO `collective_comunarrProject` VALUES (5,2),(3,1),(3,2),(6,1),(6,2),(6,3),(1,3),(2,3),(4,3),(7,1),(8,1),(8,2),(9,1),(9,2),(10,1),(10,2),(11,1),(11,2),(12,1),(12,2),(13,1),(13,2),(14,1),(14,2),(15,1),(15,2),(16,1),(16,3);
/*!40000 ALTER TABLE `collective_comunarrProject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `comunarrProject`
--

LOCK TABLES `comunarrProject` WRITE;
/*!40000 ALTER TABLE `comunarrProject` DISABLE KEYS */;
INSERT INTO `comunarrProject` VALUES (1,'Programa de aprendizaje',1),(2,'Red de economia solidroota',1),(3,'Red del maiz',1),(10,'prueba',1),(12,'prueba MODIFICADA',1),(13,'Projecto que da error',1),(14,'Projecto Y',1);
/*!40000 ALTER TABLE `comunarrProject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `contentType`
--

LOCK TABLES `contentType` WRITE;
/*!40000 ALTER TABLE `contentType` DISABLE KEYS */;
INSERT INTO `contentType` VALUES (1,'Relatoria',0),(2,'Registro',1),(3,'Contenido de prueba MODIFICADO',0),(4,'Video',1),(5,'Fotografía',0);
/*!40000 ALTER TABLE `contentType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (4,'Archivo 1','ITESO','Jalisco',NULL,3,2,1,7,1,2,2,'2017-07-05',2,'2017-07-05 01:53:57'),(5,'PROFECTAR 2017','SINE','Creel',NULL,3,2,1,7,2,2,2,'2017-07-10',2,'2017-07-10 06:09:40'),(6,'Archivo desde app con date default','ITESO','Jalisco',NULL,6,3,1,6,3,4,6,'2017-07-17',1,'124234230'),(8,'Archivo nuevo','Ariana',NULL,NULL,5,2,1,NULL,3,2,1,'2017-07-25',2,'1501020479450'),(9,'Archivo desde la app','Ariana',NULL,NULL,5,2,1,NULL,3,2,7,'2017-07-25',2,'1501032441676'),(10,'Archivo desde la app Renombre','Ariana',NULL,NULL,5,2,1,NULL,3,2,7,'2017-07-25',2,'1501039894106'),(11,'Archivo desde la app Eliminación','Ariana',NULL,NULL,5,2,1,NULL,3,2,7,'2017-07-25',2,'1501044966924');
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fileType`
--

LOCK TABLES `fileType` WRITE;
/*!40000 ALTER TABLE `fileType` DISABLE KEYS */;
INSERT INTO `fileType` VALUES (1,'PDF'),(2,'PPT'),(3,'docx'),(6,'txt'),(7,'sql');
/*!40000 ALTER TABLE `fileType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `generalTopic`
--

LOCK TABLES `generalTopic` WRITE;
/*!40000 ALTER TABLE `generalTopic` DISABLE KEYS */;
INSERT INTO `generalTopic` VALUES (1,'Educacion',1),(2,'Gestion del conocimiento',1),(3,'Defensa del bosque',1),(4,'Tema general',1),(5,'Tema general II',1);
/*!40000 ALTER TABLE `generalTopic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `keyWord`
--

LOCK TABLES `keyWord` WRITE;
/*!40000 ALTER TABLE `keyWord` DISABLE KEYS */;
INSERT INTO `keyWord` VALUES (1,'sierra'),(2,'educacion'),(3,'raramuri'),(4,'mineria'),(5,'finanzas'),(6,'bosque'),(8,'comunidades'),(9,'solidrootdad'),(14,'3'),(15,'6'),(16,'1'),(17,'terreno'),(18,'mina'),(20,'dulces'),(21,'cerro'),(22,'casa');
/*!40000 ALTER TABLE `keyWord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `keyWord_file`
--

LOCK TABLES `keyWord_file` WRITE;
/*!40000 ALTER TABLE `keyWord_file` DISABLE KEYS */;
INSERT INTO `keyWord_file` VALUES (8,4),(9,4),(11,5),(12,5),(20,6),(21,8),(22,8),(21,9),(22,9),(21,10),(22,10),(21,11),(22,11);
/*!40000 ALTER TABLE `keyWord_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `privacyType`
--

LOCK TABLES `privacyType` WRITE;
/*!40000 ALTER TABLE `privacyType` DISABLE KEYS */;
INSERT INTO `privacyType` VALUES (1,'Sólo yo'),(2,'Miembros del equipo'),(3,'Todos');
/*!40000 ALTER TABLE `privacyType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `specificTopic`
--

LOCK TABLES `specificTopic` WRITE;
/*!40000 ALTER TABLE `specificTopic` DISABLE KEYS */;
INSERT INTO `specificTopic` VALUES (1,'Explotacion de bosques',1),(3,'Cuidado del bosque',1),(6,'Autonomia',1),(7,'Tareas',1),(8,'Tema específico ejemplo',1),(9,'Tema específico ejemplo II',1);
/*!40000 ALTER TABLE `specificTopic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `specificTopic_generalTopic`
--

LOCK TABLES `specificTopic_generalTopic` WRITE;
/*!40000 ALTER TABLE `specificTopic_generalTopic` DISABLE KEYS */;
INSERT INTO `specificTopic_generalTopic` VALUES (6,1),(3,3),(7,1),(7,2),(1,2),(8,1),(8,2),(9,1);
/*!40000 ALTER TABLE `specificTopic_generalTopic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Óscar González','Temp1234',1,'ogonzale',1),(2,'rootaa','1111',1,'rootherna',2),(3,'Charli','1234',1,'cechauri',3),(4,'Gerardo','1234',1,'gmora',3),(5,'ARIIIII','12345',0,'arian',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `userToken`
--

LOCK TABLES `userToken` WRITE;
/*!40000 ALTER TABLE `userToken` DISABLE KEYS */;
INSERT INTO `userToken` VALUES (1,'5qge0f8od68eug1jfurd55tuae','2017-06-20 22:54');
/*!40000 ALTER TABLE `userToken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `userType`
--

LOCK TABLES `userType` WRITE;
/*!40000 ALTER TABLE `userType` DISABLE KEYS */;
INSERT INTO `userType` VALUES (1,'Administrador'),(2,'Miembro de equipo'),(3,'Usurooto');
/*!40000 ALTER TABLE `userType` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-26 22:55:01

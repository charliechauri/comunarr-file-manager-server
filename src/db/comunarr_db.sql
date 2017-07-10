-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 35.184.224.0    Database: comunarr
-- ------------------------------------------------------
-- Server version	5.7.14-google

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
INSERT INTO `collective` VALUES (1,'Licenciatura',0),(2,'Bachillerato',1),(3,'Maestria',1),(4,'Repechique',1),(5,'Collectivo prueba SIIII',0),(6,'Arianatl',1);
/*!40000 ALTER TABLE `collective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `collective_comunarrProject`
--

LOCK TABLES `collective_comunarrProject` WRITE;
/*!40000 ALTER TABLE `collective_comunarrProject` DISABLE KEYS */;
INSERT INTO `collective_comunarrProject` VALUES (5,2),(3,1),(3,2),(6,1),(6,2),(6,3);
/*!40000 ALTER TABLE `collective_comunarrProject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `comunarrProject`
--

LOCK TABLES `comunarrProject` WRITE;
/*!40000 ALTER TABLE `comunarrProject` DISABLE KEYS */;
INSERT INTO `comunarrProject` VALUES (1,'Programa de aprendizaje',1),(2,'Red de economia solidaria',1),(3,'Red del maiz',1),(10,'prueba',1),(12,'prueba MODIFICADA',0),(13,'Projecto que da error',1);
/*!40000 ALTER TABLE `comunarrProject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `contentType`
--

LOCK TABLES `contentType` WRITE;
/*!40000 ALTER TABLE `contentType` DISABLE KEYS */;
INSERT INTO `contentType` VALUES (1,'Relatoria',0),(2,'Registro',1),(3,'Contenido de prueba MODIFICADO',0),(4,'Video',1);
/*!40000 ALTER TABLE `contentType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (4,'Archivo 1','ITESO','Jalisco',NULL,3,2,1,7,1,2,2,'2017-07-05 00:00:00',2,'2017-07-05 01:53:57'),(5,'PROFECTAR 2017','SINE','Creel',NULL,3,2,1,7,2,2,2,'2017-07-10 00:00:00',2,'2017-07-10 06:09:40');
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fileType`
--

LOCK TABLES `fileType` WRITE;
/*!40000 ALTER TABLE `fileType` DISABLE KEYS */;
INSERT INTO `fileType` VALUES (1,'PDF'),(2,'PPT');
/*!40000 ALTER TABLE `fileType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `generalTopic`
--

LOCK TABLES `generalTopic` WRITE;
/*!40000 ALTER TABLE `generalTopic` DISABLE KEYS */;
INSERT INTO `generalTopic` VALUES (1,'Educacion',1),(2,'Gestion del conocimiento',0),(3,'Defensa del bosque',1);
/*!40000 ALTER TABLE `generalTopic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `keyWord`
--

LOCK TABLES `keyWord` WRITE;
/*!40000 ALTER TABLE `keyWord` DISABLE KEYS */;
INSERT INTO `keyWord` VALUES (1,'sierra'),(2,'educacion'),(3,'raramuri'),(4,'mineria'),(5,'finanzas'),(6,'bosque'),(8,'comunidades'),(9,'solidaridad');
/*!40000 ALTER TABLE `keyWord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `keyWord_file`
--

LOCK TABLES `keyWord_file` WRITE;
/*!40000 ALTER TABLE `keyWord_file` DISABLE KEYS */;
INSERT INTO `keyWord_file` VALUES (8,4),(9,4);
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
INSERT INTO `specificTopic` VALUES (1,'Explotacion de bosques',0),(3,'Cuidado del bosque',1),(6,'Autonomia',0),(7,'Tareas',1);
/*!40000 ALTER TABLE `specificTopic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `specificTopic_generalTopic`
--

LOCK TABLES `specificTopic_generalTopic` WRITE;
/*!40000 ALTER TABLE `specificTopic_generalTopic` DISABLE KEYS */;
INSERT INTO `specificTopic_generalTopic` VALUES (6,1),(3,3),(7,1),(7,2);
/*!40000 ALTER TABLE `specificTopic_generalTopic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Óscar González','Temp1234',1,'ogonzale',1),(2,'ariaa','1111',1,'ariherna',3),(3,'Charli','1234',1,'cechauri',3),(4,'Gerardo','1234',1,'gmora',3);
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
INSERT INTO `userType` VALUES (1,'Administrador'),(2,'Miembro de equipo'),(3,'Usuario');
/*!40000 ALTER TABLE `userType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'comunarr'
--
/*!50003 DROP FUNCTION IF EXISTS `split_str` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` FUNCTION `split_str`(
  str VARCHAR(1000),
  delimit VARCHAR(12),
  position INT
) RETURNS varchar(255) CHARSET utf8
RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(str, delimit, position),
       LENGTH(SUBSTRING_INDEX(str, delimit, position -1)) + 1),
       delimit, '') ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `userCanAccessTheFile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` FUNCTION `userCanAccessTheFile`(
	p_idUser INT,
    p_idFile INT
) RETURNS tinyint(1)
BEGIN

	# The user is the owner of the file
	IF (SELECT idUser FROM comunarr.file WHERE id = p_idFile) = p_idUser
	THEN
		RETURN 1;
	# The user is admin
	ELSEIF (SELECT idUserType FROM comunarr.user WHERE id = p_idUser) = 1
    THEN 
		RETURN 1;
	# The file is visible to the user
	ELSEIF (SELECT idUserType FROM comunarr.user WHERE id = p_idUser) =
		(SELECT idPrivacyType FROM comunarr.file WHERE id = p_idFile)
	THEN
		RETURN 1;
	END IF;

	RETURN 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `userIsActive` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` FUNCTION `userIsActive`(
	p_idUser INT
) RETURNS tinyint(1)
BEGIN

	IF EXISTS(SELECT * FROM comunarr.user WHERE id = p_idUser AND status = 1)
    THEN
		RETURN TRUE;
	END IF;

	RETURN 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `userIsAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` FUNCTION `userIsAdmin`(
	p_idUser INT
) RETURNS tinyint(1)
BEGIN
	
	# The user is admin
    IF EXISTS(SELECT * FROM comunarr.user WHERE id = p_idUser AND status = 1 AND idUserType = 1)
	THEN 
		RETURN 1;
	END IF;
    
	RETURN 0;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `validateCollective` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` FUNCTION `validateCollective`(
	p_id INT,
    p_name VARCHAR(255),
    p_idUser INT
) RETURNS tinyint(1)
BEGIN

	# Validate:
    # The collective is related to comunarr project's
	IF NOT EXISTS (SELECT * FROM temporaryIdTable) 
    THEN 
		RETURN 0;
    
    # The user is admin
    ELSEIF (SELECT userIsAdmin(p_idUser)) = 0
	THEN 
		RETURN 0;
        
	# Values length
    ELSEIF LENGTH(TRIM(p_name)) = 0 
    THEN
		RETURN 0;
    
	# The collective is not repeated
    ELSEIF EXISTS
    (
		SELECT * 
        FROM comunarr.collective 
        WHERE UPPER(name) = UPPER(p_name) 
        AND (p_id IS NULL OR (p_id IS NOT NULL AND id != p_id))
	) THEN RETURN 0;
    
	# All the comunarr projects related exist
    ELSEIF EXISTS
    (
		SELECT * 
        FROM temporaryIdTable 
		LEFT OUTER JOIN comunarr.comunarrProject 
		ON (temporaryIdTable.id = comunarr.comunarrProject.id)
		WHERE comunarr.comunarrProject.id IS NULL
	) THEN RETURN 0;
    
	ELSE RETURN 1;
    
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `validateComunarrProject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` FUNCTION `validateComunarrProject`(
	p_id INT,
	p_name VARCHAR(255),
    p_idUser INT
) RETURNS tinyint(1)
BEGIN

	# Validate:
    # ContentType exists
    IF (p_id IS NOT NULL AND NOT EXISTS (SELECT * FROM comunarr.comunarrProject WHERE id = p_id)) 
    THEN 
		RETURN 0;
    
    # The user is admin
    ELSEIF (SELECT userIsAdmin(p_idUser)) = 0
	THEN 
		RETURN 0;
    
	# Values length
    ELSEIF LENGTH(TRIM(p_name)) = 0 
    THEN
		RETURN 0;
    
    # The name is not repeated
	ELSEIF EXISTS 
    (
		SELECT * FROM comunarr.comunarrProject WHERE UPPER(name) = UPPER(p_name) 
		AND (p_id IS NULL OR (p_id IS NOT NULL AND id != p_id))
	) THEN RETURN 0;

	ELSE RETURN 1;
	
    END IF;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `validateContentType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` FUNCTION `validateContentType`(
	p_id INT,
	p_name VARCHAR(255),
    p_idUser INT
) RETURNS tinyint(1)
BEGIN

	# Validate:
    # ContentType exists
    IF (p_id IS NOT NULL AND NOT EXISTS (SELECT * FROM comunarr.contentType WHERE id = p_id)) 
    THEN 
		RETURN 0;
    
    # The user is admin
    ELSEIF (SELECT userIsAdmin(p_idUser)) = 0
	THEN 
		RETURN 0;
        
	# Values length
    ELSEIF LENGTH(TRIM(p_name)) = 0 
    THEN
		RETURN 0;
    
    # The name is not repeated
	ELSEIF EXISTS 
    (
		SELECT * FROM comunarr.contentType WHERE UPPER(name) = UPPER(p_name) 
		AND (p_id IS NULL OR (p_id IS NOT NULL AND id != p_id))
	) THEN RETURN 0;

	ELSE RETURN 1;
	
    END IF;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `validateFile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` FUNCTION `validateFile`(
	p_id INT,
	p_name VARCHAR(200),
    p_author VARCHAR(255),
    p_place VARCHAR(255),
    p_relatedDate DATE,
    p_idCollective INT,
	p_idComunarrProject INT,
	p_idGeneralTopic INT,
	p_idSpecificTopic INT,
    p_idPrivacyType INT,
    p_idContentType INT,
    p_fileType VARCHAR(5), 
    p_updateDate DATE, 
    p_idUser INT,
    p_timestamp TIMESTAMP,
    p_arraykeyWords VARCHAR(1000),
    p_action TINYINT # 1 - SELECT, 2 - INSERT, 3 - UPDATE, 4 - DELETE
    
) RETURNS tinyint(1)
BEGIN

	# User status
	IF (SELECT userIsActive(p_idUser)) = 0 
	THEN
		RETURN 0;
	END IF;
    
    # INSERT
    IF p_action = 2
    THEN
		# User type
		IF (SELECT idUserType FROM comunarr.user WHERE id = p_idUser) = 3
		THEN
			RETURN 0;
		END IF;
	END IF;
    
    # UPDATE, DELETE
    IF p_action IN (3, 4)
	THEN
		# The file exists 
		IF NOT EXISTS(SELECT * FROM comunarr.file WHERE id = p_id)
        THEN
			RETURN 0;
		ELSEIF (SELECT userCanAccessTheFile(p_idUser, p_id)) = 0
		THEN
			RETURN 0;
		END IF;
    END IF;
    
    # INSERT, UPDATE
    IF p_action IN(2, 3) THEN
		# Required fields    
		IF (p_name IS NULL OR LENGTH(TRIM(p_name)) = 0
			OR p_author IS NULL OR LENGTH(TRIM(p_author)) = 0
            OR p_idCollective IS NULL 
            OR p_idComunarrProject IS NULL
            OR p_idGeneralTopic IS NULL
            OR p_idPrivacyType IS NULL
            OR p_idContentType IS NULL
            OR p_fileType IS NULL
            OR p_updateDate IS NULL
            OR p_idUser IS NULL
            OR p_timestamp IS NULL)
		THEN
			RETURN 0;
		# Title is not repeated
		ELSEIF EXISTS(SELECT * FROM comunarr.file WHERE name = TRIM(p_name))
        THEN
			RETURN 0;
		# The catalog elements exist
		ELSEIF NOT EXISTS(SELECT * FROM comunarr.comunarrProject WHERE id = p_idComunarrProject AND status = 1)
		THEN
			RETURN 0;
		ELSEIF NOT EXISTS(SELECT * FROM comunarr.generalTopic WHERE id = p_idGeneralTopic AND status = 1 AND status = 1)
		THEN
			RETURN 0;
		ELSEIF NOT EXISTS(SELECT * FROM comunarr.privacyType WHERE id = p_idPrivacyType)
        THEN
			RETURN 0;
		ELSEIF NOT EXISTS(SELECT * FROM comunarr.contentType WHERE id = p_idContentType AND status = 1)
		THEN
			RETURN 0;
		# The file type is not executable
        ELSEIF TRIM(p_fileType) = 'exe'
        THEN
			RETURN 0;
		# The dependient catalog's elements exist
		ELSEIF p_idCollective IS NOT NULL
			AND (NOT EXISTS(SELECT * FROM comunarr.collective WHERE id = p_idCollective AND status = 1)
            OR NOT EXISTS(SELECT * FROM comunarr.collective_comunarrProject WHERE idCollective = p_idCollective AND idComunarrProject = p_idComunarrProject))
		THEN
			RETURN 0;
		ELSEIF p_idSpecificTopic IS NOT NULL
			AND (NOT EXISTS(SELECT * FROM comunarr.specificTopic WHERE id = p_idSpecificTopic AND status = 1)
            OR NOT EXISTS(SELECT * FROM comunarr.specificTopic_generalTopic WHERE idSpecificTopic = p_idSpecificTopic AND idGeneralTopic = p_idGeneralTopic))
		THEN
			RETURN 0;
		END IF;
        
	END IF;
    
    RETURN 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `validateGeneralTopic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` FUNCTION `validateGeneralTopic`(
	p_id INT,
	p_name VARCHAR(255),
    p_idUser INT
) RETURNS tinyint(1)
BEGIN

	# Validate:
    # GeneralTopic exists
    IF (p_id IS NOT NULL AND NOT EXISTS (SELECT * FROM comunarr.generalTopic WHERE id = p_id)) 
    THEN 
		RETURN 0;
    
    # The user is admin
    ELSEIF (SELECT userIsAdmin(p_idUser)) = 0
	THEN 
		RETURN 0;
        
	# Values length
    ELSEIF LENGTH(TRIM(p_name)) = 0 
    THEN
		RETURN 0;
        
    # The name is not repeated
	ELSEIF EXISTS 
    (
		SELECT * FROM comunarr.generalTopic WHERE UPPER(name) = UPPER(p_name) 
		AND (p_id IS NULL OR (p_id IS NOT NULL AND id != p_id))
	) THEN RETURN 0;

	ELSE RETURN 1;
	
    END IF;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `validateSpecificTopic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` FUNCTION `validateSpecificTopic`(
	p_id INT,
    p_name VARCHAR(255),
    p_idUser INT
) RETURNS tinyint(1)
BEGIN

	# Validate:
    # The specific topic is related to general topics
	IF NOT EXISTS (SELECT * FROM temporaryIdTable) 
    THEN 
		RETURN 0;
        
    # The user is admin
    ELSEIF (SELECT userIsAdmin(p_idUser)) = 0
	THEN 
		RETURN 0;
	
    # Values length
    ELSEIF LENGTH(TRIM(p_name)) = 0 
    THEN
		RETURN 0;
        
    # IdSpecificTopic exists
    ELSEIF (p_id IS NOT NULL AND NOT EXISTS(SELECT * FROM comunarr.specificTopic WHERE id = p_id)) THEN RETURN 0;

	# The specific topic is not repeated
    ELSEIF EXISTS
    (
		SELECT * 
        FROM comunarr.specificTopic 
        WHERE UPPER(name) = UPPER(p_name) 
        AND (p_id IS NULL OR (p_id IS NOT NULL AND id != p_id))
	) THEN RETURN 0;
    
	# All the general topics related exist
    ELSEIF EXISTS
    (
		SELECT * 
        FROM   temporaryIdTable 
		LEFT OUTER JOIN comunarr.generalTopic 
		ON (temporaryIdTable.id = comunarr.generalTopic.id)
		WHERE comunarr.generalTopic.id IS NULL
	) THEN RETURN 0;
    
	ELSE RETURN 1;
    
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `validateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` FUNCTION `validateUser`(
	p_id INT,
    p_name VARCHAR(255),
    p_password VARCHAR(255),
    p_status TINYINT(1),
    p_userName VARCHAR(255),
    p_idUserType INT(11),
    p_idUser INT,
    p_action TINYINT # 1 - SELECT, 2 - INSERT, 3 - UPDATE, 4 - DELETE
    
) RETURNS tinyint(1)
BEGIN

    # The user is admin
    IF (SELECT userIsAdmin(p_idUser)) = 0
	THEN 
		RETURN 0;
	END IF;

    # UPDATE, DELETE
    IF p_action IN(3, 4)
    THEN
		# The updated user exists
		IF NOT EXISTS(SELECT * FROM comunarr.user WHERE id = p_id)
        THEN
			RETURN 0;
		END IF;
	END IF;
    
    # INSERT
    IF p_action = 2
    THEN
		# Password lenght
		IF (p_password IS NULL) OR (LENGTH(TRIM(p_password)) < 4)
			OR (p_password LIKE '% %')
        THEN
			RETURN 0;
		END IF;
    END IF;
    
	# INSERT, UPDATE
    IF p_action IN(2, 3) 
    THEN
		# Required fields
		IF (p_name IS NULL OR LENGTH(TRIM(p_name)) = 0
            OR p_status IS NULL 
            OR p_userName IS NULL OR LENGTH(TRIM(p_userName)) = 0 OR (p_userName LIKE '% %')
            OR p_idUserType IS NULL)
		THEN
			RETURN 0;
		# The user name is not repeated
        ELSEIF EXISTS(SELECT * FROM comunarr.user WHERE userName = TRIM(p_userName) AND id != p_id)
        THEN
			RETURN 0;
		# IdUserType is valid
        ELSEIF NOT EXISTS (SELECT * FROM comunarr.userType WHERE id = p_idUserType)
        THEN
			RETURN 0;
		END IF;
	END IF;
    
    RETURN 1;
        

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `validateUserPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` FUNCTION `validateUserPassword`(
	p_id INT,
	p_password VARCHAR(255),
    p_newPassword VARCHAR(255),
    p_confirmPassword VARCHAR(255),
    p_idUser INT
) RETURNS tinyint(1)
BEGIN

	# The user is the password's owner or the admin
    IF (p_id != p_idUser) AND (SELECT userIsAdmin(p_idUser)) = 0
    THEN
		RETURN 0;
	END IF;
    
    # If the user is the password's owner
    IF (p_id = p_idUser) 
    THEN
		# The actual password is correct
        IF (SELECT password FROM comunarr.user WHERE id = p_id) != p_password
        THEN 
			RETURN 0;
		END IF;
	END IF;
    
    # The password and the confirm password are equals
	IF (p_newPassword != p_confirmPassword) OR (LENGTH(TRIM(p_password)) < 4)
	THEN
		RETURN 0;
	END IF;

	RETURN 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `collective_comunarrProject_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `collective_comunarrProject_select`()
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;

  SELECT idCollective, idComunarrProject
  FROM collective_comunarrProject;
  
COMMIT;  

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `collective_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `collective_insert`(
	IN p_name VARCHAR(255),
    IN p_arrayIdComunarrProject VARCHAR(1000),
    IN p_idUser INT
)
BEGIN

DECLARE insertedId INT;
 
DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;

  IF p_arrayIdComunarrProject IS NOT NULL THEN CALL splitArray(p_arrayidComunarrProject);
  END IF;

  IF (SELECT validateCollective (NULL, p_name, p_idUser)) = 0 

	 THEN SELECT 0 AS 'SUCCESS';
    
  ELSE
    
	  INSERT INTO collective (name)
	  VALUES (p_name);
      
	 SET insertedId = LAST_INSERT_ID();
	  
      INSERT INTO collective_comunarrProject (idCollective, idComunarrProject)
      SELECT insertedId, id
      FROM temporaryIdTable;
      
	  SELECT 1 AS 'SUCCESS';
  
  END IF;
  
  DROP TEMPORARY TABLE IF EXISTS temporaryIdTable;
  
COMMIT;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `collective_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `collective_select`()
BEGIN

  SELECT id, name, status
  FROM collective;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `collective_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `collective_update`(
	IN p_id INT,
	IN p_name VARCHAR(255),
    IN p_arrayIdComunarrProject VARCHAR(1000),
    IN p_status BOOL,
    IN p_idUser INT
)
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;

  IF p_arrayIdComunarrProject IS NOT NULL THEN CALL splitArray(p_arrayidComunarrProject);
  END IF;

  IF (SELECT validateCollective (p_id, p_name, p_idUser)) = 0 

	 THEN SELECT 0 AS 'SUCCESS';
    
  ELSE

	  UPDATE collective SET 
			name = p_name,
			status = p_status
	  WHERE id = p_id;
  
	 DELETE 
     FROM collective_comunarrProject 
     WHERE idCollective = p_id;
  
	 INSERT INTO collective_comunarrProject (idCollective, idComunarrProject)
      SELECT p_id, id
      FROM temporaryIdTable;
  
	  SELECT 1 AS 'SUCCESS';
      
  END IF;  
  
  DROP TEMPORARY TABLE IF EXISTS temporaryIdTable;
  
COMMIT;  
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `comunarrProject_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `comunarrProject_insert`(
	IN p_name VARCHAR(255),
    IN p_idUser INT
)
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;

  IF (SELECT validateComunarrProject (NULL, p_name, p_idUser)) = 0 

		THEN SELECT 0 AS 'SUCCESS';
    
  ELSE
      
	  INSERT INTO comunarrProject (name)
	  VALUES (p_name);
		
	  SELECT 1 AS 'SUCCESS';
  
  END IF;
  
COMMIT;  
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `comunarrProject_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `comunarrProject_select`()
BEGIN

  SELECT id, name, status
  FROM comunarrProject;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `comunarrProject_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `comunarrProject_update`(
	IN p_id INT,
	IN p_name VARCHAR(255),
    IN p_status BOOL,
    IN p_idUser INT
)
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;

  IF (SELECT validateComunarrProject (p_id, p_name, p_idUser)) = 0 

	 THEN SELECT 0 AS 'SUCCESS';
    
  ELSE

	  UPDATE comunarrProject SET 
			name = p_name,
			status = p_status
	  WHERE id = p_id;
		
	  SELECT 1 AS 'SUCCESS';
  
  END IF;
  
COMMIT;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `contentType_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `contentType_insert`(
	IN p_name VARCHAR(255),
    IN p_idUser INT
)
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;

  IF (SELECT validateContentType (NULL, p_name, p_idUser)) = 0 

	 THEN SELECT 0 AS 'SUCCESS';
    
  ELSE

	  INSERT INTO contentType (name)
	  VALUES (p_name);
		
	  SELECT 1 AS 'SUCCESS';
  
  END IF;
  
COMMIT;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `contentType_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `contentType_select`()
BEGIN

  SELECT id, name, status
  FROM contentType;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `contentType_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `contentType_update`(
	IN p_id INT,
	IN p_name VARCHAR(255),
    IN p_status BOOL,
    IN p_idUser INT
)
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;

  IF (SELECT validateContentType (p_id, p_name, p_idUser)) = 0 

	 THEN SELECT 0 AS 'SUCCESS';
    
  ELSE

	  UPDATE contentType SET 
			name = p_name,
			status = p_status
	  WHERE id = p_id;
    
	  SELECT 1 AS 'SUCCESS';
  
  END IF;

COMMIT;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fileType_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `fileType_select`()
BEGIN

  SELECT id, name
  FROM comunarr.fileType;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `file_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `file_delete`(	
	IN p_id INT,
    IN p_idUser INT
)
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;

	IF (SELECT validateFile(p_id, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
		NULL, NULL, NULL, NULL, NULL, p_idUser, NULL, NULL, 4)) = 0 
	THEN

		SELECT 0 AS 'SUCCESS';
    
	ELSE
    
		# Delete the file's key words relations
        DELETE FROM comunarr.keyWord_file WHERE idFile = p_id;
        
        # Delete the file register
        DELETE FROM comunarr.file WHERE id = p_id;
        
        SELECT 1 AS 'SUCCESS';
        
    END IF;

COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `file_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `file_insert`(
	IN p_name VARCHAR(200),
    IN p_author VARCHAR(255),
    IN p_place VARCHAR(255),
    IN p_relatedDate DATE,
    IN p_idCollective INT,
	IN p_idComunarrProject INT,
	IN p_idGeneralTopic INT,
	IN p_idSpecificTopic INT,
    IN p_idPrivacyType INT,
    IN p_idContentType INT,
    IN p_fileType VARCHAR(5), 
    IN p_updateDate DATE, 
    IN p_idUser INT,
    IN p_timestamp TIMESTAMP,
    IN p_arraykeyWords VARCHAR(1000)
)
BEGIN

DECLARE idFileType INT;
DECLARE idFile INT;

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;
    
	# Remove blank spaces from string parameters
	SET p_name = LTRIM(RTRIM(p_name));
	SET p_author = LTRIM(RTRIM(p_author));
	SET p_place = LTRIM(RTRIM(p_place));
	SET p_fileType = LTRIM(RTRIM(p_fileType));   
    
	IF (SELECT validateFile(NULL, p_name, p_author, p_place, p_relatedDate, p_idCollective, p_idComunarrProject, p_idGeneralTopic,
		p_idSpecificTopic, p_idPrivacyType, p_idContentType, p_fileType, p_updateDate, p_idUser, p_timestamp, p_arraykeyWords, 2)) = 0 
	THEN

		SELECT 0 AS 'SUCCESS';
    
	ELSE
        
		# Assign the file type id
		SET idFileType = (SELECT id FROM fileType WHERE name = p_fileType);
		
		IF (idFileType IS NULL) THEN 
		
			INSERT INTO fileType (name) VALUES (p_fileType); 
			SET idFileType = LAST_INSERT_ID();
			
		END IF;
        
        # Insert the file information
        INSERT INTO comunarr.file (name, author, place, relatedDate, idCollective, idComunarrProject, idGeneralTopic, 
			idSpecificTopic, idPrivacyType, idContentType, idFileType, updateDate, idUser, timestamp)
        VALUES (p_name, p_author, p_place, p_relatedDate, p_idCollective, p_idComunarrProject, p_idGeneralTopic, 
			p_idSpecificTopic, p_idPrivacyType, p_idContentType, idFileType, p_updateDate, p_idUser, p_timestamp);
        
        # Insert key words
		IF p_arrayKeyWords IS NOT NULL 
        THEN 
            
			SET idFile = LAST_INSERT_ID();
            
            CALL keyWord_insert(idFile, p_arraykeyWords);
			
		END IF;
        
        SELECT 1 AS 'SUCCESS';
        
	END IF;
    
COMMIT;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `file_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `file_select`(
	IN p_id INT,
    IN p_idUser INT
)
BEGIN

	IF (SELECT validateFile(p_id, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
		NULL, NULL, NULL, NULL, p_idUser, NULL, NULL, 1)) = 1
	THEN
    
        SELECT F.id, F.name, F.author, F.place, F.relatedDate, 
			F.idCollective, C.name AS 'colletive', 
			F.idComunarrProject, CP.name AS  'comunarrProject',
            F.idGeneralTopic, GT.name AS 'generalTopic',
            F.idSpecificTopic, ST.name AS 'specificTopic',
            F.idPrivacyType, PT.name AS 'privacyType',
            F.idContentType, CT.name AS 'contentType',
            FT.name AS 'fileType', F.updateDate, U.name AS 'uploadedBy',
            F.idUser
        FROM comunarr.file AS F
        INNER JOIN comunarr.collective AS C ON F.idCollective = C.id
        INNER JOIN comunarr.comunarrProject AS CP ON F.idComunarrProject = CP.id
        INNER JOIN comunarr.generalTopic AS GT ON F.idGeneralTopic = GT.id
        INNER JOIN comunarr.specificTopic AS ST ON F.idSpecificTopic = ST.id
        INNER JOIN comunarr.privacyType AS PT ON F.idPrivacyType = PT.id
        INNER JOIN comunarr.contentType AS CT ON F.idContentType = CT.id
        INNER JOIN comunarr.fileType AS FT ON F.idFileType = FT.id
        INNER JOIN comunarr.user AS U ON F.idUser = U.id
        WHERE F.id = p_id;
        
        SELECT idKeyWord
        FROM comunarr.keyWord_file
        WHERE idFile = p_id;
    
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `file_selectSimpleSearch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `file_selectSimpleSearch`(
	IN p_name VARCHAR(255),
    IN p_author VARCHAR(255),
    IN p_idComunarrProject INT,
    IN p_idCollective INT,
    IN p_idGeneralTopic INT,
    IN p_uploadedByMe TINYINT(1),
    IN p_idUser INT
)
BEGIN

	DECLARE idFile INT;
    DECLARE cursor_finished INT DEFAULT 0;
    
    IF (SELECT validateFile(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
		NULL, NULL, NULL, NULL, p_idUser, NULL, NULL, 1)) = 1 
	THEN
		BEGIN
        
		DECLARE file_cursor CURSOR FOR
			SELECT id 
			FROM comunarr.file
			WHERE (p_name IS NULL OR name LIKE CONCAT('%', p_name, '%'))
			AND (p_author IS NULL OR author LIKE CONCAT('%', p_author, '%'))
			AND (p_idComunarrProject IS NULL OR idComunarrProject = p_idComunarrProject)
			AND (p_idCollective IS NULL OR idCollective = p_idCollective)
			AND (p_idGeneralTopic IS NULL OR idGeneralTopic = p_idGeneralTopic)
			AND (p_uploadedByMe = 0 OR idUser = p_idUser)
            AND (SELECT userCanAccessTheFile(p_idUser, id)) = 1;
            
        DECLARE CONTINUE HANDLER FOR
        NOT FOUND SET cursor_finished = 1;    
            
		OPEN file_cursor;
        
        FETCH file_cursor INTO idFile;
        
        get_file: LOOP
	 
			SELECT F.id, F.name, F.author, F.place, F.relatedDate, 
			F.idCollective, C.name AS 'colletive', 
			F.idComunarrProject, CP.name AS  'comunarrProject',
            F.idGeneralTopic, GT.name AS 'generalTopic',
            F.idSpecificTopic, ST.name AS 'specificTopic',
            F.idPrivacyType, PT.name AS 'privacyType',
            F.idContentType, CT.name AS 'contentType',
            FT.name AS 'fileType', F.updateDate, U.name AS 'uploadedBy',
            F.idUser
			FROM comunarr.file AS F
			INNER JOIN comunarr.collective AS C ON F.idCollective = C.id
			INNER JOIN comunarr.comunarrProject AS CP ON F.idComunarrProject = CP.id
			INNER JOIN comunarr.generalTopic AS GT ON F.idGeneralTopic = GT.id
			INNER JOIN comunarr.specificTopic AS ST ON F.idSpecificTopic = ST.id
			INNER JOIN comunarr.privacyType AS PT ON F.idPrivacyType = PT.id
			INNER JOIN comunarr.contentType AS CT ON F.idContentType = CT.id
			INNER JOIN comunarr.fileType AS FT ON F.idFileType = FT.id
			INNER JOIN comunarr.user AS U ON F.idUser = U.id
			WHERE F.id = idFile;
			
			SELECT idKeyWord
			FROM comunarr.keyWord_file AS KF
			WHERE KF.idFile = idFile;
            
            FETCH file_cursor INTO idFile;
            
            IF cursor_finished = 1 
            THEN 
				LEAVE get_file;
			END IF;
            
        END LOOP get_file;
		CLOSE file_cursor;
		END;
        
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `file_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `file_update`(
	IN p_id INT,
	IN p_name VARCHAR(200),
    IN p_author VARCHAR(255),
    IN p_place VARCHAR(255),
    IN p_relatedDate DATE,
    IN p_idCollective INT,
	IN p_idComunarrProject INT,
	IN p_idGeneralTopic INT,
	IN p_idSpecificTopic INT,
    IN p_idPrivacyType INT,
    IN p_idContentType INT,
    IN p_fileType VARCHAR(5), 
    IN p_updateDate DATE, 
    IN p_idUser INT,
    IN p_timestamp TIMESTAMP,
    IN p_arraykeyWords VARCHAR(1000)
)
BEGIN

DECLARE idFileType INT;

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;
    
	# Remove blank spaces from string parameters
	SET p_name = LTRIM(RTRIM(p_name));
	SET p_author = LTRIM(RTRIM(p_author));
	SET p_place = LTRIM(RTRIM(p_place));
	SET p_fileType = LTRIM(RTRIM(p_fileType));   
    
	IF (SELECT validateFile(p_id, p_name, p_author, p_place, p_relatedDate, p_idCollective, p_idComunarrProject, p_idGeneralTopic,
		p_idSpecificTopic, p_idPrivacyType, p_idContentType, p_fileType, p_updateDate, p_idUser, p_timestamp, p_arraykeyWords, 3)) = 0 
	THEN

		SELECT 0 AS 'SUCCESS';
    
	ELSE
        
		# Assign the file type id
		SET idFileType = (SELECT id FROM fileType WHERE name = p_fileType);
		
		IF (idFileType IS NULL) THEN 
		
			INSERT INTO fileType (name) VALUES (p_fileType); 
			SET idFileType = LAST_INSERT_ID();
			
		END IF;
        
        # Update the file information
        UPDATE comunarr.file SET
			name = p_name, 
            author = p_author, 
            place = p_place, 
            relatedDate = p_relatedDate, 
            idCollective = p_idCollective, 
            idComunarrProject = p_idComunarrProject,
            idGeneralTopic = p_idGeneralTopic, 
			idSpecificTopic = p_idSpecificTopic, 
            idPrivacyType = p_idPrivacyType, 
            idContentType = p_idContentType, 
            idFileType = idFileType, 
            updateDate = p_updateDate, 
            idUser = p_idUser, 
            timestamp = p_timestamp
		WHERE id = p_id;
        
        # Update key words
        IF p_arrayKeyWords IS NULL
        THEN
			DELETE FROM keyWord_file WHERE idFile = p_id;
        ELSE
            CALL saveKeyWords(p_id);
		END IF;
        
        SELECT 1 AS 'SUCCESS';
        
	END IF;
    
COMMIT;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generalTopic_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `generalTopic_insert`(
	IN p_name VARCHAR(255),
    IN p_idUser INT
)
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;

  IF (SELECT validateGeneralTopic (NULL, p_name, p_idUser)) = 0 

	 THEN SELECT 0 AS 'SUCCESS';
    
  ELSE

	  INSERT INTO generalTopic (name)
	  VALUES (p_name);
	  
	  SELECT 1 AS 'SUCCESS';
  
  END IF;
  
COMMIT;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generalTopic_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `generalTopic_select`()
BEGIN

  SELECT id, name, status
  FROM generalTopic;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generalTopic_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `generalTopic_update`(
	IN p_id INT,
	IN p_name VARCHAR(255),
    IN p_status BOOL,
    IN p_idUser INT
)
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;

  IF (SELECT validateGeneralTopic (p_id, p_name, p_idUser)) = 0 

	 THEN SELECT 0 AS 'SUCCESS';
    
  ELSE

	  UPDATE generalTopic SET 
			name = p_name,
			status = p_status
	  WHERE id = p_id;
		
	  SELECT 1 AS 'SUCCESS';
  
  END IF;
  
COMMIT;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `keyWord_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `keyWord_insert`(
	IN p_idFile INT,
    IN p_arrayKeyWords VARCHAR(1000)
)
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;

	IF p_arrayKeyWords IS NOT NULL
    THEN
    
		CALL splitStringArray(p_arrayKeyWords);

		IF EXISTS(SELECT * FROM temporaryStringTable)
		THEN
			
		  CREATE TEMPORARY TABLE IF NOT EXISTS temporaryIdTable(id INT);
		  TRUNCATE TABLE temporaryIdTable;
		  
		  # Save new key words
		  INSERT INTO comunarr.keyWord (name) 
		  SELECT stringValue
		  FROM temporaryStringTable AS T
		  LEFT JOIN comunarr.keyWord  AS K ON T.stringValue = K.name
		  WHERE id IS NULL;
		  
		  # Select the key word's ids
		  INSERT INTO temporaryIdTable (id)
		  SELECT Id
		  FROM temporaryStringTable AS T
		  LEFT JOIN comunarr.keyWord  AS K ON T.stringValue = K.name;
		  
		  # Delete the old relations
		  DELETE FROM keyWord_file WHERE idFile = p_idFile;
		  
		  # Save the new relations
		  INSERT INTO keyWord_file (idKeyWord, idFile) 
		  SELECT id, p_idFile
		  FROM temporaryIdTable;
		  
		  # Delete temporary tables
		  DROP TEMPORARY TABLE IF EXISTS temporaryIdTable;
		  DROP TEMPORARY TABLE IF EXISTS temporaryStringTable;

		END IF;
	
    END IF;

COMMIT;
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `keyWord_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `keyWord_select`()
BEGIN

  SELECT id, name
  FROM comunarr.keyWord;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `privacyType_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `privacyType_select`()
BEGIN

  SELECT id, name
  FROM comunarr.privacyType;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `saveKeyWords` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `saveKeyWords`(
	IN p_idFile INT,
    IN p_arrayKeyWords VARCHAR(1000)
)
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;

	IF p_arrayKeyWords IS NOT NULL
    THEN
    
		CALL splitStringArray(p_arrayKeyWords);

		IF EXISTS(SELECT * FROM temporaryStringTable)
		THEN
			
		  CREATE TEMPORARY TABLE IF NOT EXISTS temporaryIdTable(id INT);
		  TRUNCATE TABLE temporaryIdTable;
		  
		  # Save new key words
		  INSERT INTO comunarr.keyWord (name) 
		  SELECT stringValue
		  FROM temporaryStringTable AS T
		  LEFT JOIN comunarr.keyWord  AS K ON T.stringValue = K.name
		  WHERE id IS NULL;
		  
		  # Select the key word's ids
		  INSERT INTO temporaryIdTable (id)
		  SELECT Id
		  FROM temporaryStringTable AS T
		  LEFT JOIN comunarr.keyWord  AS K ON T.stringValue = K.name;
		  
		  # Delete the old relations
		  DELETE FROM keyWord_file WHERE idFile = p_idFile;
		  
		  # Save the new relations
		  INSERT INTO keyWord_file (idKeyWord, idFile) 
		  SELECT id, p_idFile
		  FROM temporaryIdTable;
		  
		  # Delete temporary tables
		  DROP TEMPORARY TABLE IF EXISTS temporaryIdTable;
		  DROP TEMPORARY TABLE IF EXISTS temporaryStringTable;

		END IF;
	
    END IF;
   
COMMIT;   
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `specificTopic_generalTopic_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `specificTopic_generalTopic_select`()
BEGIN

  SELECT idSpecificTopic, idGeneralTopic
  FROM specificTopic_generalTopic;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `specificTopic_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `specificTopic_insert`(
	IN p_name VARCHAR(255),
    IN p_arrayIdGeneralTopic VARCHAR(1000),
    IN p_idUser INT
)
BEGIN

DECLARE insertedId INT;

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;
    
	IF p_arrayIdGeneralTopic IS NOT NULL THEN CALL splitArray(p_arrayIdGeneralTopic);
	END IF;

  IF (SELECT validateSpecificTopic (NULL, p_name, p_idUser)) = 0 

	 THEN SELECT 0 AS 'SUCCESS';
    
  ELSE

	  INSERT INTO specificTopic (name)
	  VALUES (p_name);
		
      SET insertedId = LAST_INSERT_ID();
	  
      INSERT INTO specificTopic_generalTopic (idSpecificTopic, idGeneralTopic)
      SELECT insertedId, id
      FROM temporaryIdTable;  
        
	  SELECT 1 AS 'SUCCESS';
      
	END IF;

COMMIT;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `specificTopic_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `specificTopic_select`()
BEGIN

  SELECT id, name, status
  FROM specificTopic;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `specificTopic_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `specificTopic_update`(
	IN p_id INT,
	IN p_name VARCHAR(255),
    IN p_arrayIdGeneralTopic VARCHAR(1000),
    IN p_status BOOL,
    IN p_idUser INT
)
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;

  IF p_arrayIdGeneralTopic IS NOT NULL THEN CALL splitArray(p_arrayIdGeneralTopic);
  END IF;

  IF (SELECT validateSpecificTopic (p_id, p_name, p_idUser)) = 0 

	 THEN SELECT 0 AS 'SUCCESS';
    
  ELSE

	  UPDATE specificTopic SET 
			name = p_name,
			status = p_status
	  WHERE id = p_id;
      
	 DELETE 
     FROM specificTopic_generalTopic
     WHERE idSpecificTopic = p_id;
  
	  INSERT INTO specificTopic_generalTopic (idSpecificTopic, idGeneralTopic)
      SELECT p_id, id
      FROM temporaryIdTable;
		
	  SELECT 1 AS 'SUCCESS';
      
	END IF;
    
	DROP TEMPORARY TABLE IF EXISTS temporaryIdTable;
  
COMMIT;  
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `splitArray` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `splitArray`(
	IN array VARCHAR(1000)
)
BEGIN

DECLARE i INT Default 0;
DECLARE value VARCHAR(255);
DECLARE id INT;

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;
      
      CREATE TEMPORARY TABLE IF NOT EXISTS temporaryIdTable(id INT);
      TRUNCATE TABLE temporaryIdTable;
      
      split_id_loop: LOOP
      
         SET i = i +1;
         SET value = split_str(array, ",", i);
         
		 IF value = '' THEN
         
           LEAVE split_id_loop;
		 
         END IF;
         
        SET id = CAST(value AS SIGNED); 
        INSERT INTO temporaryIdTable VALUES (id);
         
   END LOOP split_id_loop;
   
COMMIT;
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `splitStringArray` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `splitStringArray`(
	IN array VARCHAR(1000)
)
BEGIN

DECLARE i INT Default 0;
DECLARE value VARCHAR(255);

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;
      
      CREATE TEMPORARY TABLE IF NOT EXISTS temporaryStringTable(stringValue VARCHAR(255));
      TRUNCATE TABLE temporaryStringTable;
      
      split_string_loop: LOOP
      
         SET i = i +1;
         SET value = split_str(array, ",", i);
         
		 IF value = '' THEN
         
           LEAVE split_string_loop;
		 
         END IF;
         
		SET value = RTRIM(LTRIM(LOWER(value)));
        INSERT INTO temporaryStringTable (stringValue) VALUES (value);
         
   END LOOP split_string_loop;
   
COMMIT;
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_authenticate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ozkrpp`@`%` PROCEDURE `user_authenticate`(IN userName CHAR(255), IN password CHAR(255))
BEGIN    
	DECLARE idUser INT;

    SET idUser = (SELECT Id FROM comunarr.user AS U WHERE U.userName 
		LIKE userName AND U.password = password
        AND U.status = 1);
    
	IF (idUser is not NULL)
	THEN
		SELECT 1 AS Exito, id, name, idUserType FROM comunarr.user WHERE Id = idUser;
    ELSE
		SELECT 0 AS Exito;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `user_insert`(
	IN p_name VARCHAR(255),
    IN p_password VARCHAR(255),
    IN p_userName VARCHAR(255),
    IN p_idUserType INT(11),
    IN p_idUser INT
)
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;

	IF (SELECT validateUser(NULL, p_name, p_password, TRUE, p_userName, p_idUserType, p_idUser, 2)) = 0
    THEN
    
		SELECT 0 AS 'SUCCESS';
        
	ELSE
		
		INSERT INTO comunarr.user (name, password, status, userName, idUserType)
        VALUES (p_name, p_password, 1, p_userName, p_idUserType);
        
        SELECT 1 AS 'SUCCESS';
		
	END IF;
    
COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `user_select`()
BEGIN

	SELECT id, name, status, userName, idUserType
    FROM comunarr.user;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `user_update`(
	IN p_id INT,
	IN p_name VARCHAR(255),
    IN p_status TINYINT(1),
    IN p_userName VARCHAR(255),
    IN p_idUserType INT(11),
    IN p_idUser INT
)
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;

	IF (SELECT validateUser(p_id, p_name, NULL, p_status, p_userName, p_idUserType, p_idUser, 3)) = 0
    THEN
    
		SELECT 0 AS 'SUCCESS';
        
	ELSE
		
		UPDATE comunarr.user SET 
			name = p_name,
            status = p_status,
            userName = p_userName,
            idUserType = p_idUserType
		WHERE id = p_id;
			
        SELECT 1 AS 'SUCCESS';
		
	END IF;
    
COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_updatePassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ari`@`%` PROCEDURE `user_updatePassword`(
	IN p_id INT,
	IN p_password VARCHAR(255),
    IN p_newPassword VARCHAR(255),
    IN p_confirmPassword VARCHAR(255),
    IN p_idUser INT
)
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;

	IF (SELECT validateUserPassword(p_id, p_password, p_newPassword, p_confirmPassword, p_idUser)) = 0
    THEN
		SELECT 0 AS 'SUCCESS';
	ELSE
		
        UPDATE comunarr.user SET 
			password = p_newPassword
		WHERE id = p_id;
        
        SELECT 1 AS 'SUCCESS';
        
    END IF;
    
COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-10 18:35:25

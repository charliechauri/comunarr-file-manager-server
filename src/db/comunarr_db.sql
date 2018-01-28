CREATE DATABASE  IF NOT EXISTS `comunarr` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `comunarr`;
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
-- Table structure for table `collective`
--

DROP TABLE IF EXISTS `collective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collective` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collective_comunarrProject`
--

DROP TABLE IF EXISTS `collective_comunarrProject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collective_comunarrProject` (
  `idCollective` int(11) NOT NULL,
  `idComunarrProject` int(11) NOT NULL,
  KEY `idCollective_idx` (`idCollective`),
  KEY `idComunarrProject_idx` (`idComunarrProject`),
  CONSTRAINT `collective` FOREIGN KEY (`idCollective`) REFERENCES `collective` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `comunarrProject` FOREIGN KEY (`idComunarrProject`) REFERENCES `comunarrProject` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comunarrProject`
--

DROP TABLE IF EXISTS `comunarrProject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comunarrProject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contentType`
--

DROP TABLE IF EXISTS `contentType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentType` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `author` varchar(255) NOT NULL,
  `place` varchar(255) DEFAULT NULL,
  `relatedDate` date DEFAULT NULL,
  `idCollective` int(11) NOT NULL,
  `idComunarrProject` int(11) NOT NULL,
  `idGeneralTopic` int(11) NOT NULL,
  `idSpecificTopic` int(11) DEFAULT NULL,
  `idPrivacyType` int(11) NOT NULL,
  `idContentType` int(11) NOT NULL,
  `idFileType` int(11) NOT NULL,
  `updateDate` date NOT NULL,
  `idUser` int(11) NOT NULL,
  `timestamp` varchar(50) NOT NULL,
  `size` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idCollective_idx` (`idCollective`),
  KEY `idComunarrProject_idx` (`idComunarrProject`),
  KEY `idGeneralTopic_idx` (`idGeneralTopic`),
  KEY `idSpecificTopic_idx` (`idSpecificTopic`),
  KEY `idPrivacyType_idx` (`idPrivacyType`),
  KEY `idContentType_idx` (`idContentType`),
  KEY `idFileType_idx` (`idFileType`),
  KEY `idUser_idx` (`idUser`),
  CONSTRAINT `idCollective` FOREIGN KEY (`idCollective`) REFERENCES `collective` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idComunarrProject` FOREIGN KEY (`idComunarrProject`) REFERENCES `comunarrProject` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idContentType` FOREIGN KEY (`idContentType`) REFERENCES `contentType` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idFileType` FOREIGN KEY (`idFileType`) REFERENCES `fileType` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idGeneralTopic` FOREIGN KEY (`idGeneralTopic`) REFERENCES `generalTopic` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idPrivacyType` FOREIGN KEY (`idPrivacyType`) REFERENCES `privacyType` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idSpecificTopic` FOREIGN KEY (`idSpecificTopic`) REFERENCES `specificTopic` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idUser` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fileType`
--

DROP TABLE IF EXISTS `fileType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fileType` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `generalTopic`
--

DROP TABLE IF EXISTS `generalTopic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generalTopic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `institution`
--

DROP TABLE IF EXISTS `institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keyWord`
--

DROP TABLE IF EXISTS `keyWord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyWord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keyWord_file`
--

DROP TABLE IF EXISTS `keyWord_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyWord_file` (
  `idKeyWord` int(11) NOT NULL,
  `idFile` int(11) NOT NULL,
  KEY `idKeyWord_idx` (`idKeyWord`),
  KEY `idFile_idx` (`idFile`),
  CONSTRAINT `idFile` FOREIGN KEY (`idFile`) REFERENCES `file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idKeyWord` FOREIGN KEY (`idKeyWord`) REFERENCES `keyWord` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `privacyType`
--

DROP TABLE IF EXISTS `privacyType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privacyType` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `specificTopic`
--

DROP TABLE IF EXISTS `specificTopic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specificTopic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `specificTopic_generalTopic`
--

DROP TABLE IF EXISTS `specificTopic_generalTopic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specificTopic_generalTopic` (
  `idSpecificTopic` int(11) NOT NULL,
  `idGeneralTopic` int(11) NOT NULL,
  KEY `specificTopic_idx` (`idSpecificTopic`),
  KEY `generalTopic_idx` (`idGeneralTopic`),
  CONSTRAINT `generalTopic` FOREIGN KEY (`idGeneralTopic`) REFERENCES `generalTopic` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `specificTopic` FOREIGN KEY (`idSpecificTopic`) REFERENCES `specificTopic` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `userName` varchar(255) NOT NULL,
  `idUserType` tinyint(1) NOT NULL,
  `idInstitution` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_userType_idx` (`idUserType`),
  KEY `user_ibfk_1` (`idInstitution`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`idInstitution`) REFERENCES `institution` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userToken`
--

DROP TABLE IF EXISTS `userToken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userToken` (
  `idUser` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `expirationDate` varchar(32) NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `idUser_UNIQUE` (`idUser`),
  CONSTRAINT `userToken_user` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userType`
--

DROP TABLE IF EXISTS `userType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userType` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
CREATE FUNCTION `split_str`(
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
CREATE FUNCTION `userCanAccessTheFile`(
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
	ELSEIF (SELECT idUserType FROM comunarr.user WHERE id = p_idUser) <=
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
CREATE FUNCTION `userIsActive`(
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
CREATE FUNCTION `userIsAdmin`(
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
CREATE FUNCTION `validateCollective`(
	p_id INT,
    p_name VARCHAR(255),
    p_idUser INT
) RETURNS tinyint(1)
BEGIN

	# Validate:
    # The collective is related to comunarr projects
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

	# The collective is related with at least one comunarr project with active status
    ELSEIF NOT EXISTS
    (
		SELECT * 
        FROM temporaryIdTable 
		LEFT OUTER JOIN comunarr.comunarrProject 
		ON (temporaryIdTable.id = comunarr.comunarrProject.id)
		WHERE comunarr.comunarrProject.status = 1
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
CREATE FUNCTION `validateComunarrProject`(
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
CREATE FUNCTION `validateContentType`(
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
CREATE FUNCTION `validateFile`(
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
    p_idUser INT,
    p_timestamp VARCHAR(50),
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
            OR p_idUser IS NULL
            OR p_timestamp IS NULL)
		THEN
			RETURN 0;
		# Title is not repeated
		ELSEIF EXISTS(SELECT * FROM comunarr.file WHERE name = TRIM(p_name) AND (p_id IS NULL OR (p_id IS NOT NULL AND id != p_id)))
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
		# The dependient catalogs elements exist
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
CREATE FUNCTION `validateGeneralTopic`(
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
/*!50003 DROP FUNCTION IF EXISTS `validateInstitution` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `validateInstitution`(
	p_id INT,
    p_name VARCHAR(255),
    p_idUser INT
) RETURNS tinyint(1)
BEGIN

	# Validate:
    # The user is admin
    IF (SELECT userIsAdmin(p_idUser)) = 0
	THEN 
		RETURN 0;
        
	# Values length
    ELSEIF LENGTH(TRIM(p_name)) = 0 
    THEN
		RETURN 0;
    
	# The institution is not repeated
    ELSEIF EXISTS
    (
		SELECT * 
        FROM comunarr.institution 
        WHERE UPPER(name) = UPPER(p_name) 
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
CREATE FUNCTION `validateSpecificTopic`(
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
    
	# The specific topic is related with at least one general topic with active status
    ELSEIF NOT EXISTS
    (
		SELECT * 
        FROM   temporaryIdTable 
		LEFT OUTER JOIN comunarr.generalTopic 
		ON (temporaryIdTable.id = comunarr.generalTopic.id)
		WHERE comunarr.generalTopic.status = 1
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
CREATE FUNCTION `validateUser`(
	p_id INT,
    p_name VARCHAR(255),
    p_password VARCHAR(255),
    p_status TINYINT(1),
    p_userName VARCHAR(255),
    p_idUserType INT(11),
    p_idInstitution INT,
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
		IF (p_name IS NULL OR LENGTH(TRIM(p_name)) < 4
            OR p_status IS NULL 
            OR p_userName IS NULL OR LENGTH(TRIM(p_userName)) < 4 OR (p_userName LIKE '% %')
            OR p_idUserType IS NULL
            OR p_idInstitution IS NULL)
		THEN
			RETURN 0;
		# The user name is not repeated
        ELSEIF EXISTS(SELECT * FROM comunarr.user WHERE userName = TRIM(p_userName) AND (p_id IS NULL OR id != p_id))
        THEN
			RETURN 0;
		# IdInstitution exists
        ELSEIF NOT EXISTS(SELECT * FROM comunarr.institution WHERE id = p_idInstitution AND status = 1)
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
CREATE FUNCTION `validateUserPassword`(
	p_id INT,
	p_password VARCHAR(255),
    p_newPassword VARCHAR(255),
    p_confirmPassword VARCHAR(255),
    p_idUser INT
) RETURNS tinyint(1)
BEGIN

	# The user is the passwords owner or the admin
    IF (p_id != p_idUser) AND (SELECT userIsAdmin(p_idUser)) = 0
    THEN
		RETURN 0;
	END IF;
    
    # If the user is the passwords owner
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
CREATE PROCEDURE `collective_comunarrProject_select`()
BEGIN

	SELECT idCollective, idComunarrProject
	FROM collective_comunarrProject AS CC
	INNER JOIN comunarr.comunarrProject AS C ON CC.idComunarrProject = C.id AND C.status = 1;

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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE PROCEDURE `collective_insert`(
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
    
	  INSERT INTO comunarr.collective (name)
	  VALUES (p_name);
      
	  SET insertedId = LAST_INSERT_ID();
	  
      INSERT INTO comunarr.collective_comunarrProject (idCollective, idComunarrProject)
      SELECT insertedId, id
      FROM temporaryIdTable;
      
      # Return inserted object
	  SELECT id, name, status
      FROM comunarr.collective
      WHERE id = insertedId;
      
      SELECT idCollective, idComunarrProject
      FROM comunarr.collective_comunarrProject
      WHERE idCollective = insertedId;
  
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
CREATE PROCEDURE `collective_select`()
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
CREATE PROCEDURE `collective_update`(
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
     FROM comunarr.collective_comunarrProject 
     WHERE idCollective = p_id;
  
	 INSERT INTO collective_comunarrProject (idCollective, idComunarrProject)
      SELECT p_id, id
      FROM temporaryIdTable;
  
	  # Return updated object
	  SELECT id, name, status
      FROM comunarr.collective
      WHERE id = p_id;
      
      SELECT idCollective, idComunarrProject
      FROM comunarr.collective_comunarrProject
      WHERE idCollective = p_id;
      
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE PROCEDURE `comunarrProject_insert`(
	IN p_name VARCHAR(255),
    IN p_idUser INT
)
BEGIN

DECLARE insertedId INT;

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;

  IF (SELECT validateComunarrProject (NULL, p_name, p_idUser)) = 0 

		THEN SELECT 0 AS 'SUCCESS';
    
  ELSE
      
	  INSERT INTO comunarr.comunarrProject (name)
	  VALUES (p_name);
      
      SET insertedId = LAST_INSERT_ID();
	
	  # Return inserted object	
	  SELECT id, name, status
      FROM comunarr.comunarrProject
      WHERE id = insertedId;
  
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
CREATE PROCEDURE `comunarrProject_select`()
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE PROCEDURE `comunarrProject_update`(
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

	  UPDATE comunarr.comunarrProject SET 
			name = p_name,
			status = p_status
	  WHERE id = p_id;
		
	  # Return updated object
      SELECT id, name, status
      FROM comunarr.comunarrProject 
      WHERE id = p_id;
  
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE PROCEDURE `contentType_insert`(
	IN p_name VARCHAR(255),
    IN p_idUser INT
)
BEGIN

DECLARE insertedId INT;

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;

  IF (SELECT validateContentType (NULL, p_name, p_idUser)) = 0 

	 THEN SELECT 0 AS 'SUCCESS';
    
  ELSE

	  INSERT INTO contentType (name)
	  VALUES (p_name);
	
	  # Return the inserted object
	  SET insertedId = LAST_INSERT_ID();
      
      SELECT id, name, status
      FROM comunarr.contentType
      WHERE id = insertedId;
  
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
CREATE PROCEDURE `contentType_select`()
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE PROCEDURE `contentType_update`(
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

	  UPDATE comunarr.contentType SET 
			name = p_name,
			status = p_status
	  WHERE id = p_id;
    
	  # Return the updated object
	  SELECT id, name, status
      FROM comunarr.contentType
      WHERE id = p_id;
  
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
CREATE PROCEDURE `fileType_select`()
BEGIN

  SELECT DISTINCT id, name
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
CREATE PROCEDURE `file_delete`(	
	IN p_id INT,
    IN p_idUser INT
)
BEGIN

DECLARE timestamp VARCHAR(50);
DECLARE fileType VARCHAR(5);

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;

	IF (SELECT validateFile(p_id, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
		NULL, NULL, NULL, NULL, p_idUser, NULL, NULL, 4)) = 0 
	THEN

		SELECT 0 AS 'SUCCESS';
    
	ELSE
    
		# Save values 
        SELECT F.timestamp, FT.name
        INTO timestamp, fileType
        FROM comunarr.file AS F
        INNER JOIN comunarr.fileType AS FT ON F.idFileType = FT.id
        WHERE F.id = p_id;
    
		# Delete the files key words relations
        DELETE FROM comunarr.keyWord_file WHERE idFile = p_id;
        
        # Delete the file register
        DELETE FROM comunarr.file WHERE id = p_id;
        
        # Select deleted values
        SELECT timestamp, fileType;
        
        # Select deleted file id
        SELECT p_id AS 'id';
        
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
CREATE PROCEDURE `file_insert`(
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
    IN p_idUser INT,
    IN p_timestamp VARCHAR(50),
    IN p_arraykeyWords VARCHAR(1000),
    IN p_size INT
)
BEGIN

DECLARE idFileType INT;
DECLARE insertedId INT;

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;
    
	# Remove blank spaces from string parameters
	SET p_name = LTRIM(RTRIM(p_name));
	SET p_author = LTRIM(RTRIM(p_author));
	SET p_place = LTRIM(RTRIM(p_place));
	SET p_fileType = LOWER(LTRIM(RTRIM(p_fileType)));   
    
	IF (SELECT validateFile(NULL, p_name, p_author, p_place, p_relatedDate, p_idCollective, p_idComunarrProject, p_idGeneralTopic,
		p_idSpecificTopic, p_idPrivacyType, p_idContentType, p_fileType, p_idUser, p_timestamp, p_arraykeyWords, 2)) = 0 
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
			idSpecificTopic, idPrivacyType, idContentType, idFileType, updateDate, idUser, timestamp, size)
        VALUES (p_name, p_author, p_place, p_relatedDate, p_idCollective, p_idComunarrProject, p_idGeneralTopic, 
			p_idSpecificTopic, p_idPrivacyType, p_idContentType, idFileType, CURDATE(), p_idUser, p_timestamp, p_size);
        
        # Insert key words
		IF p_arrayKeyWords IS NOT NULL 
        THEN 
            
			SET insertedId = LAST_INSERT_ID();
            
            CALL keyWord_insert(insertedId, p_arraykeyWords);
			
		END IF;
        
		# Return inserted object
	    SELECT id, name, author, place, relatedDate, idCollective, idComunarrProject, 
			idGeneralTopic, idSpecificTopic, idPrivacyType, idContentType, idFileType, 
            updateDate, idUser, timestamp, size
	    FROM comunarr.file
	    WHERE id = insertedId;
	  
	    SELECT idKeyWord, idFile
	    FROM comunarr.keyWord_file
	    WHERE idFile = insertedId;
        
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
CREATE PROCEDURE `file_select`(
	IN p_id INT,
    IN p_idUser INT
)
BEGIN

	IF (SELECT validateFile(p_id, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
		NULL, NULL, NULL, p_idUser, NULL, NULL, 1)) = 1
	THEN
    
        SELECT F.id, F.name, F.author, F.place, F.relatedDate, 
			F.idCollective, C.name AS 'collective', 
			F.idComunarrProject, CP.name AS  'comunarrProject',
            F.idGeneralTopic, GT.name AS 'generalTopic',
            F.idSpecificTopic, ST.name AS 'specificTopic',
            F.idPrivacyType, PT.name AS 'privacyType',
            F.idContentType, CT.name AS 'contentType',
            FT.name AS 'fileType', F.updateDate, U.name AS 'uploadedBy',
            F.idUser, F.timestamp, F.size
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
CREATE PROCEDURE `file_selectSimpleSearch`(
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
    DECLARE done TINYINT(1) DEFAULT FALSE;
    
    IF (SELECT validateFile(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
		NULL, NULL, NULL, p_idUser, NULL, NULL, 1)) = 1 
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
            AND (SELECT userCanAccessTheFile(p_idUser, id)) = 1
            ORDER BY id;
		
        DECLARE CONTINUE HANDLER FOR
        NOT FOUND SET done = TRUE;    
            
		OPEN file_cursor;
        
        get_file: LOOP
        
			FETCH file_cursor INTO idFile;
            
			IF done  
			THEN
				LEAVE get_file;
			END IF;
        
			SELECT F.id, F.name, F.author, F.place, F.relatedDate, 
			F.idCollective, C.name AS 'collective', 
			F.idComunarrProject, CP.name AS  'comunarrProject',
            F.idGeneralTopic, GT.name AS 'generalTopic',
            F.idSpecificTopic, ST.name AS 'specificTopic',
            F.idPrivacyType, PT.name AS 'privacyType',
            F.idContentType, CT.name AS 'contentType',
            FT.name AS 'fileType', F.updateDate, U.name AS 'uploadedBy',
            F.idUser, F.timestamp, F.size
			FROM comunarr.file AS F
			INNER JOIN comunarr.collective AS C ON F.idCollective = C.id
			INNER JOIN comunarr.comunarrProject AS CP ON F.idComunarrProject = CP.id
			INNER JOIN comunarr.generalTopic AS GT ON F.idGeneralTopic = GT.id
			LEFT JOIN comunarr.specificTopic AS ST ON F.idSpecificTopic = ST.id
			INNER JOIN comunarr.privacyType AS PT ON F.idPrivacyType = PT.id
			INNER JOIN comunarr.contentType AS CT ON F.idContentType = CT.id
			INNER JOIN comunarr.fileType AS FT ON F.idFileType = FT.id
			INNER JOIN comunarr.user AS U ON F.idUser = U.id
			WHERE F.id = idFile;
			
			SELECT idKeyWord
			FROM comunarr.keyWord_file AS KF
			WHERE KF.idFile = idFile;
            
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
/*!50003 DROP PROCEDURE IF EXISTS `file_selectSpecificSearch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `file_selectSpecificSearch`(
	IN p_filters VARCHAR(5000),
    IN p_idUser INT
)
BEGIN

DECLARE idFile INT;
DECLARE done TINYINT(1) DEFAULT FALSE;

DECLARE file_cursor CURSOR FOR
SELECT id 
FROM temporaryIdTable;

DECLARE CONTINUE HANDLER FOR
NOT FOUND SET done = TRUE;  

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;

	CREATE TEMPORARY TABLE IF NOT EXISTS temporaryIdTable(id INT);
	TRUNCATE TABLE temporaryIdTable;
      
    SET @query = CONCAT('INSERT INTO temporaryIdTable(id)
				  SELECT id 	
                  FROM comunarr.file
                  WHERE (SELECT userCanAccessTheFile(', p_idUser, ', id)) = 1
                  AND ', p_filters);
	
	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
    
	OPEN file_cursor;
    
    get_file: LOOP
		FETCH file_cursor INTO idFile;

		IF done  
		THEN
			LEAVE get_file;
		END IF;
	
		SELECT F.id, F.name, F.author, F.place, F.relatedDate, 
		F.idCollective, C.name AS 'collective', 
		F.idComunarrProject, CP.name AS  'comunarrProject',
		F.idGeneralTopic, GT.name AS 'generalTopic',
		F.idSpecificTopic, ST.name AS 'specificTopic',
		F.idPrivacyType, PT.name AS 'privacyType',
		F.idContentType, CT.name AS 'contentType',
		FT.name AS 'fileType', F.updateDate, U.name AS 'uploadedBy',
		F.idUser, F.timestamp, F.size
		FROM comunarr.file AS F
		INNER JOIN comunarr.collective AS C ON F.idCollective = C.id
		INNER JOIN comunarr.comunarrProject AS CP ON F.idComunarrProject = CP.id
		INNER JOIN comunarr.generalTopic AS GT ON F.idGeneralTopic = GT.id
		LEFT JOIN comunarr.specificTopic AS ST ON F.idSpecificTopic = ST.id
		INNER JOIN comunarr.privacyType AS PT ON F.idPrivacyType = PT.id
		INNER JOIN comunarr.contentType AS CT ON F.idContentType = CT.id
		INNER JOIN comunarr.fileType AS FT ON F.idFileType = FT.id
		INNER JOIN comunarr.user AS U ON F.idUser = U.id
		WHERE F.id = idFile;
		
		SELECT idKeyWord
		FROM comunarr.keyWord_file AS KF
		WHERE KF.idFile = idFile;
		
	END LOOP get_file;
	CLOSE file_cursor;
    
	# Delete temporary tables
	DROP TEMPORARY TABLE IF EXISTS temporaryIdTable;

COMMIT;
    
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
CREATE PROCEDURE `file_update`(
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
    IN p_idUser INT,
    IN p_timestamp VARCHAR(50),
    IN p_arraykeyWords VARCHAR(1000),
    IN p_size INT
)
BEGIN

DECLARE idFileType INT;
DECLARE old_timestamp VARCHAR(50);
DECLARE old_fileType VARCHAR(5);

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;
    
   
	# Remove blank spaces from string parameters
	SET p_name = LTRIM(RTRIM(p_name));
	SET p_author = LTRIM(RTRIM(p_author));
	SET p_place = LTRIM(RTRIM(p_place));
	SET p_fileType = LTRIM(RTRIM(p_fileType));   
    
	IF (SELECT validateFile(p_id, p_name, p_author, p_place, p_relatedDate, p_idCollective, p_idComunarrProject, p_idGeneralTopic,
		p_idSpecificTopic, p_idPrivacyType, p_idContentType, p_fileType, p_idUser, p_timestamp, p_arraykeyWords, 3)) = 0 
	THEN

		SELECT 0 AS 'SUCCESS';
    
	ELSE
    
		# Save old values 
        SELECT F.timestamp, FT.name
        INTO old_timestamp, old_fileType
        FROM comunarr.file AS F
        INNER JOIN comunarr.fileType AS FT ON F.idFileType = FT.id
        WHERE F.id = p_id;
        
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
            updateDate = CURDATE(), 
            idUser = p_idUser, 
            timestamp = p_timestamp,
            size = p_size
		WHERE id = p_id;
        
        # Update key words
        IF p_arrayKeyWords IS NULL
        THEN
			DELETE FROM keyWord_file WHERE idFile = p_id;
        ELSE
            CALL saveKeyWords(p_id, p_arraykeyWords);
		END IF;
        
        # Return old timestamp and file type values
        SELECT old_timestamp AS 'timestamp', old_fileType AS 'fileType';
        
		# Return inserted object
	    SELECT id, name, author, place, relatedDate, idCollective, idComunarrProject, 
			idGeneralTopic, idSpecificTopic, idPrivacyType, idContentType, idFileType, 
            updateDate, idUser, timestamp, size
	    FROM comunarr.file
	    WHERE id = p_id;
	  
	    SELECT idKeyWord, idFile
	    FROM comunarr.keyWord_file
	    WHERE idFile = p_id;
        
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE PROCEDURE `generalTopic_insert`(
	IN p_name VARCHAR(255),
    IN p_idUser INT
)
BEGIN

DECLARE insertedId INT;

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;

  IF (SELECT validateGeneralTopic (NULL, p_name, p_idUser)) = 0 

	 THEN SELECT 0 AS 'SUCCESS';
    
  ELSE

	  INSERT INTO generalTopic (name)
	  VALUES (p_name);
      
	  SET insertedId = LAST_INSERT_ID();
	  
      # Return inserted object
	  SELECT id, name, status
      FROM comunarr.generalTopic
      WHERE id = insertedId;
  
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
CREATE PROCEDURE `generalTopic_select`()
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE PROCEDURE `generalTopic_update`(
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
		
	  # Return updated object
	  SELECT id, name, status
      FROM comunarr.generalTopic
      WHERE id = p_id;
  
  END IF;
  
COMMIT;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `institution_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `institution_insert`(
	IN p_name VARCHAR(255),
    IN p_idUser INT
)
BEGIN

DECLARE insertedId INT;
 
DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;

  IF (SELECT validateInstitution (NULL, p_name, p_idUser)) = 0 

	 THEN SELECT 0 AS 'SUCCESS';
    
  ELSE
    
	  INSERT INTO comunarr.institution (name)
	  VALUES (p_name);
      
	  SET insertedId = LAST_INSERT_ID();

      # Return inserted object
	  SELECT id, name, status
      FROM comunarr.institution
      WHERE id = insertedId;
  
  END IF;
  
COMMIT;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `institution_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `institution_select`()
BEGIN

  SELECT id, name, status
  FROM comunarr.institution;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `institution_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `institution_update`(
	IN p_id INT,
	IN p_name VARCHAR(255),
    IN p_status BOOL,
    IN p_idUser INT
)
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;

  IF (SELECT validateInstitution (p_id, p_name, p_idUser)) = 0 

	 THEN SELECT 0 AS 'SUCCESS';
    
  ELSE

	  UPDATE comunarr.institution SET 
			name = p_name,
			status = p_status
	  WHERE id = p_id;
  
	  # Return updated object
	  SELECT id, name, status
      FROM comunarr.institution
      WHERE id = p_id;
      
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
CREATE PROCEDURE `keyWord_insert`(
	IN p_idFile INT,
    IN p_arrayKeyWords VARCHAR(1000)
)
BEGIN

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
		  
		  # Select the key words ids
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
CREATE PROCEDURE `keyWord_select`()
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
CREATE PROCEDURE `privacyType_select`()
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
CREATE PROCEDURE `saveKeyWords`(
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
		  
		  # Select the key words ids
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
CREATE PROCEDURE `specificTopic_generalTopic_select`()
BEGIN

	SELECT idSpecificTopic,idGeneralTopic
	FROM specificTopic_generalTopic AS SG
	INNER JOIN comunarr.generalTopic AS G ON SG.idGeneralTopic = G.id AND G.status = 1;
  
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE PROCEDURE `specificTopic_insert`(
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
        
	  # Return inserted object
	  SELECT id, name, status
      FROM comunarr.specificTopic
      WHERE id = insertedId;
      
      SELECT idSpecificTopic, idGeneralTopic
      FROM comunarr.specificTopic_generalTopic
      WHERE idSpecificTopic = insertedId;
      
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
CREATE PROCEDURE `specificTopic_select`()
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
CREATE PROCEDURE `specificTopic_update`(
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
		
	  # Return updated object
	  SELECT id, name, status
      FROM comunarr.specificTopic
      WHERE id = p_id;
      
      SELECT idSpecificTopic, idGeneralTopic
      FROM comunarr.specificTopic_generalTopic
      WHERE idSpecificTopic = p_id;
      
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
CREATE PROCEDURE `splitArray`(
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
CREATE PROCEDURE `splitStringArray`(
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
CREATE PROCEDURE `user_authenticate`(IN userName CHAR(255), IN password CHAR(255))
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
CREATE PROCEDURE `user_insert`(
	IN p_name VARCHAR(255),
    IN p_password VARCHAR(255),
    IN p_userName VARCHAR(255),
    IN p_idUserType INT(11),
    IN p_idInstitution INT,
    IN p_idUser INT
)
BEGIN

DECLARE insertedId INT;

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;

	IF (SELECT validateUser(NULL, p_name, p_password, TRUE, p_userName, p_idUserType, p_idInstitution, p_idUser, 2)) = 0
    THEN
    
		SELECT 0 AS 'SUCCESS';
        
	ELSE
		
		INSERT INTO comunarr.user (name, password, status, userName, idUserType, idInstitution)
        VALUES (p_name, p_password, 1, p_userName, p_idUserType, p_idInstitution);
        
		SET insertedId = LAST_INSERT_ID();
        
        # Return inserted object
        SELECT id, name, status, userName, idUserType, idInstitution
        FROM comunarr.user
        WHERE id = insertedId;
		
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
CREATE PROCEDURE `user_select`()
BEGIN

	SELECT id, name, status, userName, idUserType, idInstitution
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
CREATE PROCEDURE `user_update`(
	IN p_id INT,
	IN p_name VARCHAR(255),
    IN p_status TINYINT(1),
    IN p_userName VARCHAR(255),
    IN p_idUserType INT(11),
    IN p_idInstitution INT,
    IN p_idUser INT
)
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

START TRANSACTION;

	IF (SELECT validateUser(p_id, p_name, NULL, p_status, p_userName, p_idUserType, p_idInstitution, p_idUser, 3)) = 0
    THEN
    
		SELECT 0 AS 'SUCCESS';
        
	ELSE
		
		UPDATE comunarr.user SET 
			name = p_name,
            status = p_status,
            userName = p_userName,
            idUserType = p_idUserType,
            idInstitution = p_idInstitution
		WHERE id = p_id;
			
        # Return updated object
        SELECT id, name, status, userName, idUserType, idInstitution
        FROM comunarr.user
        WHERE id = p_id;
		
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
CREATE PROCEDURE `user_updatePassword`(
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

-- Dump completed on 2018-01-28  0:35:02


/*DEFAULT DATA*/
/*Default institution*/
INSERT INTO `institution` (`id`, `name`, `status`) VALUES (1, 'SINÉ-COMUNARR', 1);

/*User types*/
INSERT INTO `userType` (`Id`,`Nombre`) VALUES (1,'Administrador');
INSERT INTO `userType` (`Id`,`Nombre`) VALUES (2,'Miembro de equipo');
INSERT INTO `userType` (`Id`,`Nombre`) VALUES (3,'Usuario');

/*Admin user*/
INSERT INTO `user` (`id`,`name`,`password`,`status`,`userName`,`idUserType`,`idInstitution`) VALUES (1,'SINÉ-COMUNARR','comunarr',1,'comunarr',1,1);

/*Privacy type*/
INSERT INTO `privacyType` (`id`,`name`) VALUES (1,'Sólo yo');
INSERT INTO `privacyType` (`id`,`name`) VALUES (2,'Miembros del equipo');
INSERT INTO `privacyType` (`id`,`name`) VALUES (3,'Todos');




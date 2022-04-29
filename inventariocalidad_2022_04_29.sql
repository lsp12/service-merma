-- MariaDB dump 10.19  Distrib 10.4.22-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: inventariocalidad
-- ------------------------------------------------------
-- Server version	10.4.22-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ranchIdHaciendad` int(11) DEFAULT NULL,
  `userIdUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_a831661be5a418d5a609650f26d` (`ranchIdHaciendad`),
  KEY `FK_6716f09408e29bd6d3477a0121e` (`userIdUsuario`),
  CONSTRAINT `FK_6716f09408e29bd6d3477a0121e` FOREIGN KEY (`userIdUsuario`) REFERENCES `user` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_a831661be5a418d5a609650f26d` FOREIGN KEY (`ranchIdHaciendad`) REFERENCES `ranch` (`idHaciendad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (3,6,21),(4,6,14);
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caja`
--

DROP TABLE IF EXISTS `caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skuId` int(11) DEFAULT NULL,
  `mermaId` int(11) DEFAULT NULL,
  `cantidad` double NOT NULL,
  `cantidadR` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6ffafad3a52074d3c1c5d6e6030` (`skuId`),
  KEY `FK_682624e5e5e4001e61c73ee65ae` (`mermaId`),
  CONSTRAINT `FK_682624e5e5e4001e61c73ee65ae` FOREIGN KEY (`mermaId`) REFERENCES `merma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_6ffafad3a52074d3c1c5d6e6030` FOREIGN KEY (`skuId`) REFERENCES `sku` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caja`
--

LOCK TABLES `caja` WRITE;
/*!40000 ALTER TABLE `caja` DISABLE KEYS */;
INSERT INTO `caja` VALUES (34,2,12,1080,4),(35,3,12,216,3),(36,4,12,54,2),(37,1,13,1080,4),(38,3,13,216,3),(39,4,13,54,2),(43,8,15,1280,1),(44,4,15,20,2),(47,2,18,1050,20),(48,4,19,1000,5),(49,5,19,100,6),(56,2,27,1098,10),(57,2,28,1098,10),(64,1,32,1200,3),(65,2,33,864,3),(66,4,33,216,3),(67,5,33,108,3),(72,15,35,270,3),(73,2,35,702,3),(74,8,35,162,3),(75,4,35,108,3),(81,2,37,162,3),(82,4,37,216,3),(83,5,37,54,0),(84,8,37,54,0),(85,6,37,1098,3),(86,4,38,162,3),(87,16,38,1163,3),(96,1,43,1200,3),(97,7,43,100,3),(98,4,44,54,3),(99,8,44,162,3),(100,2,44,1134,3),(101,5,44,54,3),(102,4,45,216,3),(103,16,45,1404,3),(104,1,47,1250,0),(105,5,47,50,0),(108,1,NULL,1230,0),(109,1,NULL,1230,0),(110,1,NULL,1230,0),(111,1,NULL,1230,0),(112,1,NULL,1230,0),(113,1,NULL,1230,0),(115,1,54,1230,0);
/*!40000 ALTER TABLE `caja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calibracion`
--

DROP TABLE IF EXISTS `calibracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calibracion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numMano` int(11) NOT NULL,
  `calibracion` double NOT NULL,
  `perfilRacimoId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7787a6ab9bbea7c572a207065e4` (`perfilRacimoId`),
  CONSTRAINT `FK_7787a6ab9bbea7c572a207065e4` FOREIGN KEY (`perfilRacimoId`) REFERENCES `perfil_racimo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calibracion`
--

LOCK TABLES `calibracion` WRITE;
/*!40000 ALTER TABLE `calibracion` DISABLE KEYS */;
INSERT INTO `calibracion` VALUES (1,1,44,1),(2,2,44,1),(3,3,43,1),(4,4,44,1),(5,5,41,1),(6,6,40,1),(7,7,39,1),(8,8,39,1),(9,9,38,1),(10,1,44,2),(11,2,44,2),(12,3,42,2),(13,4,42,2),(14,5,40,2),(15,6,39,2),(16,7,39,2),(17,8,38,2),(18,9,47,2),(19,1,43,3),(20,2,44,3),(21,3,42,3),(22,4,42,3),(23,5,41,3),(24,6,40,3),(25,7,39,3),(26,8,39,3),(27,9,38,3),(28,1,43,4),(29,2,44,4),(30,3,43,4),(31,4,41,4),(32,5,40,4),(33,6,39,4),(34,7,38,4),(35,8,37,4),(36,9,37,4),(52,1,43,15),(53,2,44,15),(54,3,42,15),(55,4,42,15),(56,5,41,15),(57,6,40,15),(58,7,39,15),(59,8,39,15),(60,9,38,15),(61,1,43,16),(62,2,44,16),(63,3,42,16),(64,4,42,16),(65,5,41,16),(66,6,40,16),(67,7,39,16),(68,8,39,16),(69,9,38,16),(70,1,45,17),(71,2,43,17),(72,3,42,17),(73,4,43,17),(74,5,43,17),(75,6,43,17),(76,7,42,17),(77,8,42,17),(78,9,42,17),(79,10,41,17),(80,1,12,22),(81,2,32,22),(82,3,32,22),(83,4,12,22),(84,5,12,22),(85,6,32,22),(86,7,32,22),(87,8,12,22),(88,9,12,22),(89,10,32,22),(90,11,12,22),(91,12,32,22),(92,1,45,23),(93,2,45,23),(94,3,45,23),(95,4,40,23),(96,5,40,23),(97,6,40,23),(98,7,40,23),(99,8,40,23),(100,9,40,23),(101,10,40,23),(102,1,45,24),(103,2,45,24),(104,3,45,24),(105,4,44,24),(106,5,43,24),(107,6,42,24),(108,7,42,24),(109,1,45,25),(110,2,45,25),(111,3,45,25),(112,4,45,25),(113,5,44,25),(114,6,43,25),(115,7,43,25),(116,8,42,25),(117,1,43,26),(118,2,42,26),(119,3,42,26),(120,4,41,26),(121,5,40,26),(122,6,39,26),(123,7,39,26),(124,1,42,27),(125,2,42,27),(126,3,41,27),(127,4,41,27),(128,5,39,27),(129,6,39,27),(130,7,39,27),(131,8,38,27),(132,9,38,27),(133,1,43,28),(134,2,43,28),(135,3,42,28),(136,4,42,28),(137,5,39,28),(138,6,39,28),(139,7,39,28),(140,8,38,28),(141,9,38,28),(142,1,42,29),(143,2,42,29),(144,3,40,29),(145,4,40,29),(146,5,40,29),(147,6,39,29),(148,7,39,29),(149,8,3838,29),(150,9,38,29),(151,10,37,29),(152,11,37,29),(153,1,42,30),(154,2,42,30),(155,3,42,30),(156,4,41,30),(157,5,41,30),(158,6,41,30),(159,7,39,30),(160,8,39,30),(161,9,38,30),(162,10,38,30),(163,1,42,31),(164,2,40,31),(165,3,42,31),(166,4,42,31),(167,5,40,31),(168,6,40,31),(169,7,39,31),(170,8,39,31),(171,9,38,31),(172,10,38,31),(173,1,43,32),(174,2,41,32),(175,3,42,32),(176,4,41,32),(177,5,39,32),(178,6,40,32),(179,7,38,32),(180,8,38,32),(181,1,40,33),(182,2,42,33),(183,3,41,33),(184,4,40,33),(185,5,40,33),(186,6,39,33),(187,7,39,33),(188,8,38,33),(189,9,37,33),(190,1,42,34),(191,2,42,34),(192,3,41,34),(193,4,39,34),(194,5,39,34),(195,6,38,34),(196,7,37,34),(197,1,43,35),(198,2,42,35),(199,3,41,35),(200,4,41,35),(201,5,40,35),(202,6,39,35),(203,7,39,35),(204,8,38,35),(205,9,38,35),(206,10,37,35),(207,1,43,36),(208,2,43,36),(209,3,42,36),(210,4,42,36),(211,5,41,36),(212,6,39,36),(213,7,38,36),(214,8,38,36),(215,9,37,36),(216,1,43,37),(217,2,42,37),(218,3,42,37),(219,4,42,37),(220,5,40,37),(221,6,40,37),(222,7,40,37),(223,8,38,37),(224,1,43,38),(225,2,44,38),(226,3,43,38),(227,4,43,38),(228,5,43,38),(229,6,41,38),(230,7,41,38),(231,8,40,38),(232,9,39,38),(233,1,43,39),(234,2,44,39),(235,3,44,39),(236,4,43,39),(237,5,42,39),(238,6,40,39),(239,7,40,39),(240,8,40,39),(241,9,39,39),(242,10,38,39),(243,1,41,40),(244,2,43,40),(245,3,43,40),(246,4,42,40),(247,5,42,40),(248,6,40,40),(249,7,39,40),(250,1,42,41),(251,2,41,41),(252,3,42,41),(253,4,40,41),(254,5,40,41),(255,6,40,41),(256,7,38,41),(257,1,45,42),(258,2,44,42),(259,3,45,42),(260,4,43,42),(261,5,43,42),(262,6,43,42),(263,7,42,42),(264,8,39,42),(265,1,44,43),(266,2,44,43),(267,3,42,43),(268,4,41,43),(269,5,40,43),(270,6,40,43),(271,7,38,43),(272,8,38,43),(273,9,38,43),(274,10,38,43),(275,1,43,44),(276,2,43,44),(277,3,40,44),(278,4,40,44),(279,5,38,44),(280,6,38,44),(281,7,38,44),(282,8,37,44),(283,9,36,44),(284,1,44,45),(285,2,42,45),(286,3,42,45),(287,4,42,45),(288,5,40,45),(289,6,39,45),(290,7,39,45),(291,8,38,45),(292,9,38,45),(293,10,38,45),(294,1,43,46),(295,2,43,46),(296,3,40,46),(297,4,41,46),(298,5,40,46),(299,6,40,46),(300,7,39,46),(301,8,39,46),(302,9,38,46),(303,10,38,46),(304,1,45,47),(305,2,45,47),(306,3,43,47),(307,4,43,47),(308,5,40,47),(309,6,40,47),(310,7,40,47),(311,8,39,47),(312,9,39,47),(313,10,38,47),(314,1,45,48),(315,2,43,48),(316,3,43,48),(317,4,40,48),(318,5,40,48),(319,6,38,48),(320,7,38,48),(321,8,38,48),(322,9,38,48),(323,10,37,48),(324,11,37,48),(325,1,45,49),(326,2,43,49),(327,3,40,49),(328,4,40,49),(329,5,40,49),(330,6,40,49),(331,7,40,49),(332,8,38,49),(333,9,38,49),(334,10,38,49),(335,11,37,49),(338,1,4,52),(339,1,4,53),(340,2,4,53);
/*!40000 ALTER TABLE `calibracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (29,'HERRAMIENTAS'),(30,'LIMPIEZA'),(31,'LABORATORIO'),(32,'EQUIPO DE PROTECCION');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(255) NOT NULL,
  `semana` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'amarillo',8),(2,'verde',1),(3,'azul',2),(4,'blanco',3),(5,'negro',4),(6,'lila',5),(7,'rojo',6),(8,'cafe',7);
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colored_bunch`
--

DROP TABLE IF EXISTS `colored_bunch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colored_bunch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `edadSemana` int(11) NOT NULL,
  `colorId` int(11) DEFAULT NULL,
  `mermaId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_842c750f88cc17525a2adc6bbcd` (`colorId`),
  KEY `FK_cb9f55171f08d4ae096decaaea0` (`mermaId`),
  CONSTRAINT `FK_842c750f88cc17525a2adc6bbcd` FOREIGN KEY (`colorId`) REFERENCES `color` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_cb9f55171f08d4ae096decaaea0` FOREIGN KEY (`mermaId`) REFERENCES `merma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colored_bunch`
--

LOCK TABLES `colored_bunch` WRITE;
/*!40000 ALTER TABLE `colored_bunch` DISABLE KEYS */;
INSERT INTO `colored_bunch` VALUES (11,1234,12,5,32),(12,220,11,6,33),(13,714,10,7,33),(14,209,9,8,33),(20,329,12,5,35),(21,278,11,6,35),(22,255,10,7,35),(23,302,9,8,35),(28,210,12,5,37),(29,863,11,6,37),(30,433,10,7,37),(31,12,9,8,37),(32,461,12,5,38),(33,518,11,6,38),(34,587,10,7,38),(35,43,9,8,38),(44,1234,12,5,43),(45,12,11,6,43),(46,256,12,5,44),(47,465,11,6,44),(48,736,10,7,44),(49,213,12,6,45),(50,899,11,7,45),(51,195,10,8,45),(52,1234,12,6,47),(53,12,11,7,47),(54,12,10,8,47),(61,1239,12,6,NULL),(62,12,11,7,NULL),(63,10,10,8,NULL),(64,1239,12,6,NULL),(65,12,11,7,NULL),(66,10,10,8,NULL),(67,1239,12,6,NULL),(68,12,11,7,NULL),(69,10,10,8,NULL),(70,1239,12,6,NULL),(71,12,11,7,NULL),(72,10,10,8,NULL),(73,1239,12,6,NULL),(74,12,11,7,NULL),(75,10,10,8,NULL),(76,1239,12,6,NULL),(77,12,11,7,NULL),(78,10,10,8,NULL),(82,1239,12,6,54),(83,12,11,7,54),(84,10,10,8,54);
/*!40000 ALTER TABLE `colored_bunch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defecto`
--

DROP TABLE IF EXISTS `defecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `defecto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `tipoDefectoId` int(11) DEFAULT NULL,
  `siglas` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_8f08c2eced4a6bfdfabec0a1664` (`tipoDefectoId`),
  CONSTRAINT `FK_8f08c2eced4a6bfdfabec0a1664` FOREIGN KEY (`tipoDefectoId`) REFERENCES `tipo_defecto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defecto`
--

LOCK TABLES `defecto` WRITE;
/*!40000 ALTER TABLE `defecto` DISABLE KEYS */;
INSERT INTO `defecto` VALUES (1,'Estropeo de campo',1,'SR'),(2,'Sobre grado',1,'OG'),(3,'Bajo grado',1,'UG'),(4,'Daño de pulpa',1,'BR'),(5,'Daño de piel',1,'DP'),(6,'Estropeo por palillo',1,'SP'),(7,'Cuello roto',1,'NI'),(8,'Corte de cuchareta',2,'CH'),(9,'Corte de cuchillo',2,'CT'),(10,'Estropeo de tina',2,'SRT'),(11,'Daño de punta',2,'PS'),(12,'Dedos buenos no salvables',3,'BNS'),(13,'Cicatriz de crecimiento',4,'CC'),(14,'Latex seco',4,'LS'),(15,'Cicatriz de hoja',4,'CHO'),(16,'Dedo corto',10,'TS'),(17,'Falta de peso (no clasifica para sku)',10,'NA'),(18,'Mancha roja',4,'RR'),(19,'Rasguño de animal',4,'SC'),(20,'Specklin',4,'SK'),(21,'Daño de insecto',4,'BM'),(22,'Moquillo',4,'TC'),(23,'Jhonston o Muñeca',4,'PD'),(24,'Caterpillar',4,'CS'),(25,'Colaspis',4,'BM'),(26,'Trips',4,'TH'),(27,'Almendra crema',4,'AB'),(28,'Daño de corona',4,'CD'),(29,'Mellizos',4,'FF'),(30,'Mal formados',5,'ML'),(31,'Cascara y dedos rajados',5,'SP'),(32,'Chimera',5,'CH'),(33,'Pacha',5,'FF'),(34,'Decoloración de la cascara',5,'UD'),(35,'Mancha de madurez',5,'RR'),(40,'Suciedad de brácteas',4,'SB'),(41,'Quema de sol',4,'SU');
/*!40000 ALTER TABLE `defecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `desgloce_mano`
--

DROP TABLE IF EXISTS `desgloce_mano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desgloce_mano` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numManosPr` int(11) NOT NULL,
  `numManosUl` int(11) NOT NULL,
  `defectoId` int(11) DEFAULT NULL,
  `perfilRacimoId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6c725222d84cc26c68a6e45bffb` (`defectoId`),
  KEY `FK_044232eee1739b8b1fe24698efc` (`perfilRacimoId`),
  CONSTRAINT `FK_044232eee1739b8b1fe24698efc` FOREIGN KEY (`perfilRacimoId`) REFERENCES `merma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_6c725222d84cc26c68a6e45bffb` FOREIGN KEY (`defectoId`) REFERENCES `defecto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desgloce_mano`
--

LOCK TABLES `desgloce_mano` WRITE;
/*!40000 ALTER TABLE `desgloce_mano` DISABLE KEYS */;
INSERT INTO `desgloce_mano` VALUES (1,0,41,3,44),(2,26,0,17,44),(3,26,0,17,44),(4,26,0,30,44),(5,0,0,NULL,45),(6,6,4,16,47),(9,3,1,4,NULL),(10,2,0,5,NULL),(11,3,1,4,NULL),(12,2,0,5,NULL),(13,3,1,4,NULL),(14,2,0,5,NULL),(15,3,1,4,NULL),(16,2,0,5,NULL),(17,3,1,4,NULL),(18,2,0,5,NULL),(19,3,1,4,NULL),(20,2,0,5,NULL),(23,3,1,4,54),(24,2,0,5,54);
/*!40000 ALTER TABLE `desgloce_mano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `desgloce_merma`
--

DROP TABLE IF EXISTS `desgloce_merma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desgloce_merma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `perfilRacimoId` int(11) DEFAULT NULL,
  `defectoId` int(11) DEFAULT NULL,
  `peso` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5a56b5c5217dceb4b292b227e8d` (`perfilRacimoId`),
  KEY `FK_69606fd1faa0ac27dd4ecf7ceb2` (`defectoId`),
  CONSTRAINT `FK_5a56b5c5217dceb4b292b227e8d` FOREIGN KEY (`perfilRacimoId`) REFERENCES `perfil_racimo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_69606fd1faa0ac27dd4ecf7ceb2` FOREIGN KEY (`defectoId`) REFERENCES `defecto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desgloce_merma`
--

LOCK TABLES `desgloce_merma` WRITE;
/*!40000 ALTER TABLE `desgloce_merma` DISABLE KEYS */;
INSERT INTO `desgloce_merma` VALUES (1,3,1,1,0),(2,15,1,12,0),(3,5,1,22,0),(4,20,1,30,0),(5,3,2,1,395),(6,12,2,12,1985),(7,5,2,13,740),(8,2,2,29,410),(9,14,2,30,2370),(10,1,3,1,170),(11,11,3,12,1815),(12,2,3,13,380),(13,4,3,22,575),(14,9,3,30,1570),(15,4,4,7,635),(16,7,4,12,950),(17,2,4,9,970),(18,2,4,13,280),(19,2,4,7,180),(20,2,4,29,230),(21,3,4,30,180),(22,2,4,35,180),(23,1,4,3,395),(28,42,15,2,625),(29,30,15,3,220),(30,10,15,4,25),(31,10,15,6,80),(32,12,15,8,25),(33,15,15,10,122),(34,42,16,2,625),(35,30,16,3,220),(36,10,16,4,25),(37,10,16,6,80),(38,12,16,8,25),(39,15,16,10,122),(40,9,17,2,3000),(41,5,17,4,132),(42,8,17,5,120),(43,10,17,6,1500),(44,30,17,9,1300),(45,45,17,12,1200),(49,6,20,1,5),(50,12,20,3,12),(51,21,21,1,122),(52,12,22,3,123),(53,20,22,4,1234),(54,12,22,5,421),(55,15,22,6,123),(56,60,22,9,0),(57,30,23,1,12),(58,20,23,2,12),(59,10,23,3,32),(60,4,23,4,234),(61,10,23,5,234),(62,12,24,1,123),(63,20,24,12,123),(64,20,24,17,123),(65,12,24,16,412),(66,8,24,22,412),(67,40,25,31,123),(68,30,25,30,0),(69,4,26,7,1),(70,2,26,18,1),(71,5,26,20,2),(72,10,27,1,1),(73,6,27,7,1),(74,5,27,30,1),(75,3,28,1,1),(76,2,28,7,1),(77,5,28,21,1),(81,17,29,12,623),(82,8,29,13,68),(83,3,29,15,148),(84,5,29,30,240),(85,10,30,12,464),(86,1,30,15,63),(87,6,30,35,213),(88,3,31,7,116),(89,7,31,12,211),(90,5,31,30,208),(91,8,32,12,380),(92,3,32,29,118),(93,6,32,30,210),(94,9,33,12,370),(95,5,33,30,206),(96,5,34,12,111),(97,2,34,15,12),(98,2,34,18,13),(99,8,34,30,350),(100,2,35,1,13),(101,6,35,12,272),(102,2,35,30,94),(103,7,36,12,214),(104,7,36,30,334),(105,2,37,7,46),(106,7,37,12,302),(107,5,37,18,224),(108,6,37,30,252),(109,4,38,1,118),(110,2,38,12,78),(111,3,38,18,148),(112,3,38,30,158),(113,12,39,12,315),(114,5,40,12,111),(115,5,40,30,202),(116,4,41,9,111),(117,7,41,18,390),(118,9,41,30,312),(119,10,42,1,430),(120,5,42,12,184),(121,2,42,19,13),(122,3,42,30,15),(123,5,43,12,545),(124,3,43,15,410),(125,3,43,30,373),(126,4,44,12,670),(127,2,44,29,340),(128,4,44,30,545),(129,3,45,12,410),(130,4,45,30,645),(131,5,46,7,475),(132,3,46,12,410),(133,2,46,15,275),(134,5,46,30,740),(135,2,47,7,215),(136,5,47,30,840),(137,3,47,21,445),(138,2,48,12,275),(139,1,48,11,125),(140,4,48,14,410),(141,4,48,30,545),(142,3,49,7,485),(143,5,49,12,675),(144,2,49,30,240),(147,1,52,1,12),(148,3,52,4,13),(149,3,53,13,3),(150,5,53,12,51);
/*!40000 ALTER TABLE `desgloce_merma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc`
--

DROP TABLE IF EXISTS `doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departamento` varchar(255) NOT NULL,
  `nSemanas` int(11) NOT NULL,
  `filePath` varchar(255) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `path` varchar(255) NOT NULL,
  `originalname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc`
--

LOCK TABLES `doc` WRITE;
/*!40000 ALTER TABLE `doc` DISABLE KEYS */;
INSERT INTO `doc` VALUES (1,'mantenimiento',2,'HOJA DE VIDA COMPLETA Ing-b649.pdf','2022-02-09 14:13:47.301998','files\\Reportmantenimiento\\HOJA DE VIDA COMPLETA Ing-b649.pdf','HOJA DE VIDA COMPLETA Ing. Martin Sanchez Jorgge.pdf'),(2,'mantenimiento',2,'HOJA DE VIDA COMPLETA Ing-7e94.pdf','2022-02-09 14:17:49.722336','files\\Reportmantenimiento\\HOJA DE VIDA COMPLETA Ing-7e94.pdf','HOJA DE VIDA COMPLETA Ing. Martin Sanchez Jorgge.pdf'),(3,'mantenimiento',5,'HOJA DE VIDA COMPLETA Ing-b649-61fc.pdf','2022-02-10 10:54:45.487753','files\\Reportmantenimiento\\HOJA DE VIDA COMPLETA Ing-b649-61fc.pdf','HOJA DE VIDA COMPLETA Ing-b649.pdf'),(4,'mantenimiento',22,'HOJA DE VIDA COMPLETA Ing-cf99.pdf','2022-02-10 11:06:16.534605','files\\Reportmantenimiento\\HOJA DE VIDA COMPLETA Ing-cf99.pdf','HOJA DE VIDA COMPLETA Ing. Martin Sanchez Jorgge.pdf');
/*!40000 ALTER TABLE `doc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `idHistorial` int(11) NOT NULL AUTO_INCREMENT,
  `inventarioIdInventario` int(11) DEFAULT NULL,
  `userIdUsuario` int(11) DEFAULT NULL,
  `ranchIdHaciendad` int(11) DEFAULT NULL,
  `fechaMovimiento` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idHistorial`),
  KEY `FK_03454677604b068634e7d2bd077` (`inventarioIdInventario`),
  KEY `FK_4a9ad6789bd3e18242521774ff8` (`userIdUsuario`),
  KEY `FK_03e56b7f190a6a45229277f9a7b` (`ranchIdHaciendad`),
  CONSTRAINT `FK_03454677604b068634e7d2bd077` FOREIGN KEY (`inventarioIdInventario`) REFERENCES `inventory` (`idInventario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_03e56b7f190a6a45229277f9a7b` FOREIGN KEY (`ranchIdHaciendad`) REFERENCES `ranch` (`idHaciendad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_4a9ad6789bd3e18242521774ff8` FOREIGN KEY (`userIdUsuario`) REFERENCES `user` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (18,8,1,6,'2022-02-21 15:48:14'),(19,12,14,6,'2022-03-12 13:08:15'),(20,20,15,6,'2022-03-12 13:29:44'),(21,26,16,13,'2022-03-12 13:32:32'),(22,14,16,13,'2022-03-12 13:33:14'),(23,27,17,18,'2022-03-12 13:34:45'),(24,9,16,13,'2022-03-12 13:36:19'),(25,24,15,6,'2022-03-12 13:36:21'),(26,38,15,6,'2022-03-12 13:36:48'),(27,17,17,18,'2022-03-12 13:38:29'),(28,19,17,18,'2022-03-12 13:39:10'),(29,28,19,25,'2022-03-12 13:49:46'),(30,70,19,25,'2022-03-12 13:50:15'),(31,39,18,12,'2022-03-12 13:55:31'),(32,18,18,12,'2022-03-12 13:56:05'),(33,44,20,6,'2022-03-12 13:58:36'),(34,15,20,6,'2022-03-12 13:59:10'),(35,49,1,6,'2022-04-14 17:46:49');
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `idInventario` int(11) NOT NULL AUTO_INCREMENT,
  `numSerie` varchar(255) NOT NULL,
  `nombreProducto` varchar(255) NOT NULL,
  `mantenimieto` tinyint(4) NOT NULL DEFAULT 0,
  `categoryIdCategoria` int(11) DEFAULT NULL,
  `unitMdIdUnidadMedida` int(11) DEFAULT NULL,
  `providerIdProvedor` int(11) DEFAULT NULL,
  `createdAt` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `inUse` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idInventario`),
  KEY `FK_8dd2318c078d937c6999cf85884` (`categoryIdCategoria`),
  KEY `FK_f2bf055afafeec6b9e8aad5fd6d` (`unitMdIdUnidadMedida`),
  KEY `FK_f21ac8fd1de7cb0241ff0fe8e59` (`providerIdProvedor`),
  CONSTRAINT `FK_8dd2318c078d937c6999cf85884` FOREIGN KEY (`categoryIdCategoria`) REFERENCES `category` (`idCategoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_f21ac8fd1de7cb0241ff0fe8e59` FOREIGN KEY (`providerIdProvedor`) REFERENCES `provider` (`idProvedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_f2bf055afafeec6b9e8aad5fd6d` FOREIGN KEY (`unitMdIdUnidadMedida`) REFERENCES `unit_md` (`idUnidadMedida`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (8,'1010018','BALANZA ELECTRONICA  CASIO  30 KG',1,29,3,3,'2022-02-17 16:55:58.980035',1),(9,'1010112','SELLADORA DE BOLSAS 3M M',0,29,3,3,'2022-02-17 16:56:23.325160',1),(10,'1270042','SOPLADORA/ASPIRADORA',0,29,3,3,'2022-02-17 16:56:47.617899',1),(11,'1270023','TIJERA PARA EMPAQUE',0,29,3,3,'2022-02-17 16:57:18.069148',1),(12,'1030069','TABLA DE EMBALAR 2.5CMS',0,29,3,3,'2022-02-17 16:57:59.168877',1),(13,'1030064','RADIO DE 21*46* E. 1.75\"',0,29,3,3,'2022-02-17 16:59:36.111010',0),(14,'1030063','RADIO DE 21*46* E. 1.25\"',0,29,3,3,'2022-02-17 16:59:56.061044',0),(15,'1030034','TABLA DE PICAR SANEO 50*70*3 CM',0,29,3,3,'2022-02-17 17:00:11.451813',1),(16,'1010100','BALANZA ELECTRONICA DE PISO',0,29,3,3,'2022-02-17 17:00:27.921336',1),(17,'1010042','BALANZA ELECTRONICA GRAMERA',0,29,3,3,'2022-02-17 17:00:58.839550',1),(18,'1010109','BALANZA COLGANTE 110 LBS',0,29,3,3,'2022-02-17 17:01:16.979406',1),(19,'1270012','BANDEJAS VERDES 3 DIVISIONES 45 PERFORACIONES 86 X 68 X 7 CM',0,29,3,3,'2022-02-17 17:01:35.806296',1),(20,'1270011','BANDEJAS NEGRA 3 DIVISIONES 21 PERFORACIONES 91 X 71 X 11.5 CM',0,29,3,3,'2022-02-17 17:01:51.856223',1),(21,'1010090','BANDEJAS NARANJA 3 DIVISIONES 21 PERFORACIONES 91 X 71 X 11.5 CM',0,29,3,3,'2022-02-17 17:02:08.660182',0),(23,'1360035','CLARIFICADOR DE AGUA PRP 8000',0,30,2,3,'2022-02-21 18:33:32.680640',0),(24,'1030033','DETERGENTE INDUSTRIAL 1 KG',0,30,2,3,'2022-02-21 18:33:58.529219',1),(25,'1010047','DIOXIDO DE CLORO AL 18% CANECA 30 LTS',0,30,5,3,'2022-02-21 18:34:17.473310',0),(26,'1010046','DIOXIDO DE CLORO AL 18% TANQUE 220LTS',0,30,5,3,'2022-02-21 18:34:34.473149',1),(27,'1150007','ESCOBA DE MADERA PARA LIMPIEZA',0,30,3,3,'2022-02-21 18:36:36.787314',1),(28,'1150003','ESCOBILLON 60CM M/T CERDAS DURAS',0,30,3,3,'2022-02-21 18:36:55.308261',1),(29,'1150004','ESPONJA SALVA UÑAS SOLEX',0,30,3,3,'2022-02-21 18:37:10.115167',0),(30,'1150008','ESTROPAJO DE ALUMINIO INDUSTRIAL',0,30,3,3,'2022-02-21 18:37:27.076570',0),(31,'1030025','LIMPIADOR BANALATEX HUMEDO',0,30,7,3,'2022-02-21 18:37:48.344569',0),(32,'1380014','LIMPIADOR BANALATEX SECO',0,30,7,3,'2022-02-21 18:38:21.694185',0),(33,'1030027','SACO DE ACIDO CITRICO 25 KG',0,30,2,3,'2022-02-21 18:38:41.476629',0),(34,'1150010','SANIT MASTER (AMONIO CUATERNARIO)',0,30,5,3,'2022-02-21 18:39:21.408242',0),(35,'1030047','TACHO DE CLORO GRANULADO 45 KILOS',0,30,2,3,'2022-02-21 18:39:41.005593',0),(36,'1170119','PROTEC K  (CONTROL COCHINILLA)',0,30,5,3,'2022-02-21 18:40:00.841897',0),(37,'1210003','NP-CONTROL (COCHINILLA) CANECA X20LTS',0,30,5,3,'2022-02-21 18:40:17.445223',0),(38,'1380053','TARJETA PLASTIFICADA P/IDENTIFICACION DE EMPAQUE',0,31,3,3,'2022-02-21 18:42:04.255294',1),(39,'1120289','BOQUILLA 8002',0,31,3,3,'2022-02-21 18:42:32.114621',1),(40,'1360067','TINTA SELLO COLOR ROJO FRASCO PEQUEÑO',0,31,3,3,'2022-02-21 18:42:49.694110',0),(41,'1360067','TINTA SELLO COLOR ROJO FRASCO PEQUEÑO',0,31,3,3,'2022-02-21 18:44:10.819658',0),(42,'1360064','TIZA BLANCA (CAJA 144 UND)',0,31,3,3,'2022-02-21 18:44:32.320822',0),(43,'1010125','SELLO 26P CON CIRCULO ',0,31,3,3,'2022-02-21 18:47:14.524918',0),(44,'1010124','SELLO 26PN',0,31,3,3,'2022-02-21 18:47:32.801226',1),(45,'1010123','SELLO 26P3',0,31,3,3,'2022-02-21 18:47:52.661606',0),(46,'1010122','SELLO HA31P',0,31,3,3,'2022-02-21 18:48:13.163693',0),(47,'1010121','SELLO NUMERADOR T-15912 12',0,31,3,3,'2022-02-21 18:48:32.648994',0),(48,'1360021','RODILLO DE FELPA 4\"',0,31,3,3,'2022-02-21 18:49:00.457915',0),(49,'1010051','PROBETA PLASTICA 1000ML',0,31,3,3,'2022-02-21 18:49:31.237099',1),(50,'1360016','RODILLO ESPONJA PARA GOMA 4\"',0,31,3,3,'2022-02-21 18:49:48.252871',0),(51,'1360015','LIENZO ESTRELLA (PARA REMOJAR ALUMBRE)',0,31,4,3,'2022-02-21 18:50:02.293228',0),(52,'1360013','CORTINA DE TELA PARA CONTENEDOR',0,31,3,3,'2022-02-21 18:50:22.026400',0),(53,'1270018','TANQUE TIPO BOTELLA PEMD AZUL DE 250 LIT',0,31,3,3,'2022-02-21 18:51:10.460461',0),(54,'1160003','TINTA SELLO COLOR NEGRO FRASCO DE 500CC',0,31,3,3,'2022-02-21 18:51:25.017738',0),(55,'1030044','BALDE 10 LTS',0,31,3,3,'2022-02-21 18:51:42.059860',0),(56,'1030029','CANECA DE GOMA 5 GLN',0,31,7,3,'2022-02-21 18:51:58.479851',0),(57,'1030028','SACO DE ALUMBRE 25 KG',0,31,2,3,'2022-02-21 18:52:28.407399',0),(58,'1030020','CINTA DE MEDIR PH',0,31,3,3,'2022-02-21 18:53:02.060112',0),(59,'1030019','CINTA DE MEDIR BANANO',0,31,3,3,'2022-02-21 18:54:11.377445',0),(60,'1030007','BROCHA NATURAL 2\"',0,31,3,3,'2022-02-21 18:54:29.767103',0),(61,'1010102','GOMA AKZONOBEL CANECA 5 GLN',0,31,7,3,'2022-02-21 18:54:48.453807',0),(62,'1010089','PROTECTOR DE BANDEJA NARANJA 76CM X 75CM X 3MM',0,31,3,3,'2022-02-21 18:55:08.457192',0),(63,'1010078','PROTECTORES DE BANDEJAS NEGROS 75CMS X 77CMS X 0.3 PERFORADOS',0,31,3,3,'2022-02-21 18:55:30.449620',0),(64,'1010077','PROTECTOR DE BANDEJA VERDE 75CM X 77CM X 0.3CM PERFORADO',0,31,3,3,'2022-02-21 18:55:56.198382',0),(65,'1010064','SELLO NUMERADOR T-15910 10 DIGITOS 9MM',0,31,3,3,'2022-02-21 18:56:26.919749',0),(66,'1010053','TIRAS PARA DIOXIDO DE CLORO (FRASCO IT 481028 CON 50 TIRAS)',0,31,3,3,'2022-02-21 18:58:05.737833',0),(67,'1010044','CRAYON JUMBO  CAJA X12',0,31,3,3,'2022-02-21 18:58:21.509074',0),(68,'1010039','BOLILLOS METO 8.22',0,31,3,3,'2022-02-21 18:58:35.466712',0),(69,'1010038','ETIQUETADORA DE 1 LINEA 8 DIGITOS METO 8.22',0,31,3,3,'2022-02-21 18:58:51.699639',0),(70,'1260030','BOTA CAUCHO AMARILLA TALLA# 37',0,32,3,3,'2022-02-21 18:59:18.014746',1);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `longitud_dedos`
--

DROP TABLE IF EXISTS `longitud_dedos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `longitud_dedos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numMano` int(11) NOT NULL,
  `longitudDedos` double NOT NULL,
  `perfilRacimoId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cd08169a2abc6774f28e228cfee` (`perfilRacimoId`),
  CONSTRAINT `FK_cd08169a2abc6774f28e228cfee` FOREIGN KEY (`perfilRacimoId`) REFERENCES `perfil_racimo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `longitud_dedos`
--

LOCK TABLES `longitud_dedos` WRITE;
/*!40000 ALTER TABLE `longitud_dedos` DISABLE KEYS */;
INSERT INTO `longitud_dedos` VALUES (1,1,10,1),(2,2,10,1),(3,3,9.75,1),(4,4,9.5,1),(5,5,9.5,1),(6,7,9,1),(7,8,8.75,1),(8,9,8,1),(9,1,9.5,2),(10,2,9.5,2),(11,3,9.25,2),(12,4,9,2),(13,5,8.75,2),(14,6,8.5,2),(15,7,8.5,2),(16,8,8.5,2),(17,9,7.5,2),(18,1,10.25,3),(19,2,9.75,3),(20,3,9.5,3),(21,4,9.25,3),(22,5,9,3),(23,6,8.75,3),(24,7,8,3),(25,8,8.25,3),(26,9,7.5,3),(27,1,10.5,4),(28,2,9.75,4),(29,3,9.75,4),(30,4,9.5,4),(31,5,9,4),(32,6,8.5,4),(33,7,8.25,4),(34,8,8,4),(35,9,7,4),(51,1,10.25,15),(52,2,9.75,15),(53,3,9.5,15),(54,4,9.25,15),(55,5,9,15),(56,6,8.75,15),(57,7,8,15),(58,8,8.25,15),(59,9,7.25,15),(60,1,10.25,16),(61,2,9.75,16),(62,3,9.5,16),(63,4,9.25,16),(64,5,9,16),(65,6,8.75,16),(66,7,8,16),(67,8,8.25,16),(68,9,7.25,16),(69,1,10,17),(70,2,10,17),(71,3,9,17),(72,4,10,17),(73,5,9,17),(74,6,9,17),(75,7,8,17),(76,8,8,17),(77,9,7,17),(78,10,8,17),(79,1,9,22),(80,2,8,22),(81,3,9,22),(82,4,8,22),(83,5,9,22),(84,6,8,22),(85,7,9,22),(86,8,8,22),(87,9,8,22),(88,10,8,22),(89,11,9,22),(90,12,9,22),(91,1,10,23),(92,2,10,23),(93,3,10,23),(94,4,10,23),(95,5,9,23),(96,6,9,23),(97,7,9,23),(98,8,9,23),(99,9,9,23),(100,10,9,23),(101,1,10,24),(102,2,10,24),(103,3,10,24),(104,4,9,24),(105,5,8,24),(106,6,8,24),(107,7,8,24),(108,1,310,25),(109,2,10,25),(110,3,9,25),(111,4,9,25),(112,5,9,25),(113,6,8,25),(114,7,8,25),(115,8,8,25),(116,1,10,26),(117,2,9.5,26),(118,3,9.5,26),(119,4,9.25,26),(120,5,9,26),(121,6,8.5,26),(122,7,8,26),(123,1,10,27),(124,2,9.5,27),(125,3,9.25,27),(126,4,9,27),(127,5,8.5,27),(128,6,8.25,27),(129,7,8,27),(130,8,7.5,27),(131,9,7.25,27),(132,1,9.75,28),(133,2,9.5,28),(134,3,9.25,28),(135,4,9,28),(136,5,8.5,28),(137,6,8.25,28),(138,7,8,28),(139,8,7.5,28),(140,9,7.25,28),(141,1,9.75,29),(142,2,9.5,29),(143,3,9.5,29),(144,4,9.25,29),(145,5,9.25,29),(146,6,9,29),(147,7,8.75,29),(148,8,8.5,29),(149,9,8,29),(150,10,8.25,29),(151,11,8,29),(152,1,9.75,30),(153,2,9.5,30),(154,3,9.75,30),(155,4,9.75,30),(156,5,9.25,30),(157,6,9,30),(158,7,8.75,30),(159,8,8,30),(160,9,7.5,30),(161,10,7.25,30),(162,1,9,31),(163,2,9,31),(164,3,8.75,31),(165,4,9.5,31),(166,5,8.75,31),(167,6,9.25,31),(168,7,8.25,31),(169,8,7.5,31),(170,9,7,31),(171,10,6.75,31),(172,1,9.5,32),(173,2,9.75,32),(174,3,9.5,32),(175,4,9.5,32),(176,5,8.5,32),(177,6,8.5,32),(178,7,8.25,32),(179,8,7.5,32),(180,1,9.5,33),(181,2,9.5,33),(182,3,9.25,33),(183,4,9.25,33),(184,5,9,33),(185,6,8.25,33),(186,7,7.75,33),(187,8,7.25,33),(188,9,5,33),(189,1,9.75,34),(190,2,9.5,34),(191,3,9,34),(192,4,8,34),(193,5,7.75,34),(194,6,7.5,34),(195,7,7,34),(196,1,9.75,35),(197,2,9.5,35),(198,3,8.75,35),(199,4,8.75,35),(200,5,8,35),(201,6,7.75,35),(202,7,7.5,35),(203,8,7.5,35),(204,9,7.25,35),(205,10,7,35),(206,1,9.5,36),(207,2,9.5,36),(208,3,9.5,36),(209,4,9.5,36),(210,5,9,36),(211,6,8.5,36),(212,7,8,36),(213,8,7.25,36),(214,9,7,36),(215,1,10,37),(216,2,9.75,37),(217,3,9.5,37),(218,4,9,37),(219,5,9,37),(220,6,8.25,37),(221,7,7.75,37),(222,8,7.5,37),(223,1,10,38),(224,2,9.75,38),(225,3,9.5,38),(226,4,9.5,38),(227,5,9.5,38),(228,6,9,38),(229,7,8.75,38),(230,8,8.5,38),(231,9,7,38),(232,1,9.5,39),(233,2,9.5,39),(234,3,9,39),(235,4,9,39),(236,5,8.75,39),(237,6,8.25,39),(238,7,8.25,39),(239,8,7.75,39),(240,9,7.5,39),(241,10,7,39),(242,1,9.5,40),(243,2,9.5,40),(244,3,9.5,40),(245,4,8.5,40),(246,5,8.5,40),(247,6,8.5,40),(248,7,7.25,40),(249,1,8.5,41),(250,2,8.5,41),(251,3,8.75,41),(252,4,8,41),(253,5,7.75,41),(254,6,7.5,41),(255,7,7,41),(256,1,10,42),(257,2,9.75,42),(258,3,10,42),(259,4,9,42),(260,5,8.5,42),(261,6,7.75,42),(262,7,7.5,42),(263,8,7.25,42),(264,1,9.75,43),(265,2,9.5,43),(266,3,9.5,43),(267,4,9.5,43),(268,5,9,43),(269,6,9,43),(270,7,8.75,43),(271,8,8.5,43),(272,9,8,43),(273,10,8,43),(274,1,9.5,44),(275,2,9.5,44),(276,3,9,44),(277,4,9,44),(278,5,9.25,44),(279,6,8.75,44),(280,7,8.5,44),(281,8,8,44),(282,9,8,44),(283,1,10,45),(284,2,9.75,45),(285,3,9.5,45),(286,4,9.5,45),(287,5,9,45),(288,6,9.25,45),(289,7,9.25,45),(290,8,9.25,45),(291,9,8.75,45),(292,10,8.5,45),(293,1,9.75,46),(294,2,9.5,46),(295,3,9,46),(296,4,9.25,46),(297,5,9.5,46),(298,6,9.25,46),(299,7,9.25,46),(300,8,8.75,46),(301,9,8.5,46),(302,10,8.5,46),(303,1,9.75,47),(304,2,9.5,47),(305,3,9.5,47),(306,4,9.5,47),(307,5,9,47),(308,6,9,47),(309,7,8.75,47),(310,8,8.5,47),(311,9,8.25,47),(312,10,8.5,47),(313,1,10.25,48),(314,2,10.5,48),(315,3,10,48),(316,4,9.75,48),(317,5,9.25,48),(318,6,9.5,48),(319,7,9.5,48),(320,8,9,48),(321,9,9,48),(322,10,8.75,48),(323,11,8.5,48),(324,1,10,49),(325,2,10,49),(326,3,9.75,49),(327,4,9.5,49),(328,5,95,49),(329,6,9,49),(330,7,9,49),(331,8,8.75,49),(332,9,8.5,49),(333,10,8,49),(334,11,8,49),(337,1,4,52),(338,1,4,53),(339,2,5,53);
/*!40000 ALTER TABLE `longitud_dedos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance` (
  `idMantenimiento` int(11) NOT NULL AUTO_INCREMENT,
  `numMantenimiento` int(11) NOT NULL DEFAULT 1,
  `motivo` varchar(255) NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 0,
  `fechaInicio` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `fechaFin` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `responsableIdResponsable` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMantenimiento`),
  KEY `FK_771719a9a0575e191079462f811` (`responsableIdResponsable`),
  CONSTRAINT `FK_771719a9a0575e191079462f811` FOREIGN KEY (`responsableIdResponsable`) REFERENCES `responsable` (`idResponsable`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance`
--

LOCK TABLES `maintenance` WRITE;
/*!40000 ALTER TABLE `maintenance` DISABLE KEYS */;
INSERT INTO `maintenance` VALUES (33,1,'estado en mantenimiento',0,'2022-03-12 13:08:45.205938','2022-03-12 13:08:45.205938',13),(34,1,'v<veria',1,'2022-03-12 13:38:34.788472','2022-03-12 13:39:12.000000',14),(35,3,'averia',1,'2022-03-12 13:39:48.470650','2022-03-12 13:40:04.000000',14),(36,1,'materiales mojados',1,'2022-03-12 13:40:57.895265','2022-03-12 13:41:10.000000',21),(37,1,'cantidad innecesaria',1,'2022-03-12 13:41:02.078297','2022-03-12 13:41:39.000000',16),(38,1,'se mojo',1,'2022-03-12 13:51:59.009377','2022-03-12 13:52:14.000000',24),(39,1,'inventario de material',1,'2022-03-12 14:02:47.276188','2022-03-12 14:03:08.000000',15),(40,3,'daño',1,'2022-03-12 14:03:44.307111','2022-03-12 14:04:18.000000',15),(41,5,'cualquiera',1,'2022-04-14 17:48:20.969368','2022-04-14 17:49:12.000000',14);
/*!40000 ALTER TABLE `maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mandated`
--

DROP TABLE IF EXISTS `mandated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mandated` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `role` enum('JefePlanta','InspectorPlanta','Calidad','Ninguno') NOT NULL DEFAULT 'Ninguno',
  `ranchIdHaciendad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_f434e2241eed8687d13300a8e3f` (`ranchIdHaciendad`),
  CONSTRAINT `FK_f434e2241eed8687d13300a8e3f` FOREIGN KEY (`ranchIdHaciendad`) REFERENCES `ranch` (`idHaciendad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mandated`
--

LOCK TABLES `mandated` WRITE;
/*!40000 ALTER TABLE `mandated` DISABLE KEYS */;
INSERT INTO `mandated` VALUES (1,'carlos','leon','0968838669','JefePlanta',18);
/*!40000 ALTER TABLE `mandated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merma`
--

DROP TABLE IF EXISTS `merma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ranchIdHaciendad` int(11) DEFAULT NULL,
  `rCortado` double NOT NULL,
  `rProcesado` double NOT NULL,
  `rRechazados` double NOT NULL,
  `pesoFruta` double NOT NULL,
  `pesoRacimo` double NOT NULL,
  `pesoTallo` double NOT NULL,
  `edad` double NOT NULL,
  `calibracion` double NOT NULL,
  `nManos` double NOT NULL,
  `lDedoSegunda` double NOT NULL,
  `lDedoUltima` double NOT NULL,
  `mermaProcesada` double NOT NULL,
  `mermaCortada` double NOT NULL,
  `totalCajas` double NOT NULL,
  `numManosVotadasP` double NOT NULL,
  `numManosVotadasU` double NOT NULL,
  `ratioC` double NOT NULL,
  `ratioP` double NOT NULL,
  `pesoCaja` double NOT NULL,
  `fecha` date DEFAULT NULL,
  `createdAt` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `calibracionUltima` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_8c3698e7482b626ca1dc656b633` (`ranchIdHaciendad`),
  CONSTRAINT `FK_8c3698e7482b626ca1dc656b633` FOREIGN KEY (`ranchIdHaciendad`) REFERENCES `ranch` (`idHaciendad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merma`
--

LOCK TABLES `merma` WRITE;
/*!40000 ALTER TABLE `merma` DISABLE KEYS */;
INSERT INTO `merma` VALUES (12,19,67708.90000000001,66923.3,785.6000000000058,49.1,55.2,6,11,43.2,9.4,9.5,7.5,7523.300000000003,8308.900000000009,1414.2857142857142,0,0,1.025587900134673,1.0376270831149774,59400,'2022-03-18','2022-03-21 16:45:22.524491',0),(13,19,68260.5,67468.5,792,49.5,55.2,6,10.5,43.2,9.4,9.5,8.5,8743.5,9535.5,1398.2142857142858,0,0,1.0139334921785974,1.0258358662613982,58725,'2022-03-21','2022-03-21 16:45:22.524491',0),(15,11,75000,65000,10000,50,60,10,11,45,9,10,8,8450,18450,56550,9,120,0.8976190476190475,1.0357142857142856,56550,'2022-03-28','2022-03-28 15:54:51.683825',0),(18,8,52287.39,51537.75,749.6399999999994,62.47,70,12,11,45,10,9.5,9,5862.75,6612.389999999999,45675,10,15,1.299283154121864,1.3181818181818181,45675,'2022-04-06','2022-04-06 16:07:53.934264',42),(19,6,60000,57500,2500,50,60,10,11,45,11,10,9,9650,12150,47850,30,10,0.9494047619047619,0.9906832298136645,47850,'2022-04-07','2022-04-07 13:52:42.889978',42),(27,6,52287.39,51537.75,749.6399999999994,62.47,142.47,80,11,45,10,10,9,3774.75,4524.389999999999,47763,10,11,1.358678955453149,1.3784415584415586,47763,'2022-04-08','2022-04-08 20:26:35.025880',42),(28,6,52287.39,51537.75,749.6399999999994,62.47,142.47,80,11,45,10,10,9,3774.75,4524.389999999999,47763,10,11,1.358678955453149,1.3784415584415586,47763,'2022-04-11','2022-04-11 13:06:35.465376',42),(32,8,55530,54675,855,45,55,10,12,45,12,10,9,2475,3330,52200,12,13,1.0071775874044917,1.0229276895943562,52200,'2022-04-18','2022-04-18 13:18:17.191035',42),(33,19,61722,61344,378,54,61,7,10,44,9,10,9,9666,10044,51678,1,1,1.076490438695163,1.0831237424547282,51678,'2022-04-18','2022-04-18 20:13:47.365923',42),(35,25,62530.08,61187.08,1343,53.72,61.72,8,10,44,9,9,8,7295.080000000002,8638.080000000002,53892,3,3,1.102356406480118,1.1265521133826664,53892,'2022-04-18','2022-04-18 20:38:40.737736',42),(37,7,91793.45999999999,89677.01,2116.449999999997,60.47,68.47,8,10,43,9,10,8,20773.009999999995,22889.459999999992,68904,3,3,1.0807453416149069,1.1062518061843754,68904,'2022-04-18','2022-04-18 20:49:45.642393',42),(38,20,83989.8,81849.6,2140.199999999997,52.2,58.2,6,10,41,9,10,9,24793.600000000006,26933.800000000003,57056,0,833,0.8442984403208144,0.8663751214771622,57056,'2022-04-18','2022-04-18 20:58:10.473998',40),(43,20,74760,72000,2760,60,67,7,10,45,9,10,8,15450,18210,56550,1,1,1.0806007796376977,1.1220238095238095,56550,'2022-04-20','2022-04-20 15:43:19.105703',42),(44,6,80717.8,73903.59999999999,6814.200000000012,55.4,63.3,7.9,11,43.42,9.46,9.9,8.5,12829.599999999991,19643.800000000003,61074,0,0,0.9980390234336699,1.0900621118012421,61074,'2022-04-22','2022-04-22 16:25:07.458992',40),(45,12,79204.2,78295.2,909,60.6,68,7.4,11,42.7,9.3,9.6,8,8527.199999999997,9436.199999999997,69768,0,0,1.2709585747076182,1.2857142857142856,69768,'2022-04-25','2022-04-25 15:06:03.899091',39),(47,9,69190,66000,3190,55,120,65,11,45,9,9,8,9450,12640,56550,0,0,1.0702929820576879,1.1220238095238095,56550,'2022-04-26','2022-04-26 16:53:56.221259',41),(54,6,69355,67650,1705,55,63,8,11,45,9,9,8,14145,15850,53505,0,0,1.0102526339639741,1.0357142857142856,53505,'2022-04-29','2022-04-29 17:55:55.059193',39);
/*!40000 ALTER TABLE `merma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numero_dedos`
--

DROP TABLE IF EXISTS `numero_dedos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numero_dedos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numMano` int(11) NOT NULL,
  `numDedos` int(11) NOT NULL,
  `perfilRacimoId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_685856195c273d4965d075a3664` (`perfilRacimoId`),
  CONSTRAINT `FK_685856195c273d4965d075a3664` FOREIGN KEY (`perfilRacimoId`) REFERENCES `perfil_racimo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=347 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numero_dedos`
--

LOCK TABLES `numero_dedos` WRITE;
/*!40000 ALTER TABLE `numero_dedos` DISABLE KEYS */;
INSERT INTO `numero_dedos` VALUES (1,1,25,1),(2,2,23,1),(3,3,23,1),(4,4,21,1),(5,5,22,1),(6,6,20,1),(7,7,18,1),(8,8,18,1),(9,9,16,1),(10,1,24,2),(11,2,25,2),(12,3,22,2),(13,4,22,2),(14,5,20,2),(15,6,20,2),(16,7,18,2),(17,8,18,2),(18,9,16,2),(19,1,20,3),(20,2,22,3),(21,3,20,3),(22,4,20,3),(23,5,19,3),(24,6,19,3),(25,7,18,3),(26,8,18,3),(27,9,18,3),(28,1,23,4),(29,2,22,4),(30,3,21,4),(31,4,21,4),(32,5,20,4),(33,6,19,4),(34,7,19,4),(35,8,18,4),(36,9,18,4),(58,1,20,15),(59,2,22,15),(60,3,20,15),(61,4,20,15),(62,5,19,15),(63,6,19,15),(64,7,18,15),(65,8,18,15),(66,9,18,15),(67,1,20,16),(68,2,22,16),(69,3,20,16),(70,4,20,16),(71,5,19,16),(72,6,19,16),(73,7,18,16),(74,8,18,16),(75,9,18,16),(76,1,30,17),(77,2,28,17),(78,3,27,17),(79,4,28,17),(80,5,27,17),(81,6,26,17),(82,7,20,17),(83,8,15,17),(84,9,16,17),(85,10,15,17),(86,1,12,22),(87,2,32,22),(88,3,12,22),(89,4,32,22),(90,5,32232,22),(91,6,12,22),(92,7,32,22),(93,8,12,22),(94,9,32,22),(95,10,12,22),(96,11,32,22),(97,12,12,22),(98,1,30,23),(99,2,30,23),(100,3,29,23),(101,4,25,23),(102,5,25,23),(103,6,25,23),(104,7,20,23),(105,8,20,23),(106,9,15,23),(107,10,15,23),(108,1,30,24),(109,2,30,24),(110,3,30,24),(111,4,25,24),(112,5,25,24),(113,6,25,24),(114,7,20,24),(115,1,30,25),(116,2,30,25),(117,3,30,25),(118,4,25,25),(119,5,25,25),(120,6,25,25),(121,7,20,25),(122,8,20,25),(123,1,24,26),(124,2,22,26),(125,3,20,26),(126,4,19,26),(127,5,18,26),(128,6,17,26),(129,7,16,26),(130,1,23,27),(131,2,22,27),(132,3,20,27),(133,4,19,27),(134,5,18,27),(135,6,18,27),(136,7,17,27),(137,8,16,27),(138,9,15,27),(139,1,25,28),(140,2,24,28),(141,3,23,28),(142,4,22,28),(143,5,20,28),(144,6,19,28),(145,7,18,28),(146,8,17,28),(147,9,16,28),(148,1,32,29),(149,2,21,29),(150,3,20,29),(151,4,18,29),(152,5,22,29),(153,6,18,29),(154,7,16,29),(155,8,15,29),(156,9,14,29),(157,10,13,29),(158,11,12,29),(159,1,21,30),(160,2,18,30),(161,3,18,30),(162,4,16,30),(163,5,16,30),(164,6,15,30),(165,7,17,30),(166,8,12,30),(167,9,14,30),(168,10,14,30),(169,1,18,31),(170,2,22,31),(171,3,17,31),(172,4,18,31),(173,5,20,31),(174,6,13,31),(175,7,13,31),(176,8,14,31),(177,9,13,31),(178,10,13,31),(179,1,16,32),(180,2,30,32),(181,3,18,32),(182,4,15,32),(183,5,15,32),(184,6,13,32),(185,7,12,32),(186,8,12,32),(187,1,21,33),(188,2,19,33),(189,3,18,33),(190,4,18,33),(191,5,15,33),(192,6,15,33),(193,7,12,33),(194,8,13,33),(195,9,11,33),(196,1,25,34),(197,2,19,34),(198,3,19,34),(199,4,16,34),(200,5,14,34),(201,6,13,34),(202,7,12,34),(203,1,24,35),(204,2,30,35),(205,3,17,35),(206,4,18,35),(207,5,17,35),(208,6,16,35),(209,7,14,35),(210,8,14,35),(211,9,14,35),(212,10,14,35),(213,1,26,36),(214,2,19,36),(215,3,17,36),(216,4,17,36),(217,5,16,36),(218,6,14,36),(219,7,13,36),(220,8,13,36),(221,9,13,36),(222,1,24,37),(223,2,18,37),(224,3,16,37),(225,4,14,37),(226,5,14,37),(227,6,12,37),(228,7,12,37),(229,8,10,37),(230,1,25,38),(231,2,22,38),(232,3,20,38),(233,4,16,38),(234,5,14,38),(235,6,15,38),(236,7,14,38),(237,8,14,38),(238,9,13,38),(239,1,24,39),(240,2,20,39),(241,3,19,39),(242,4,17,39),(243,5,16,39),(244,6,16,39),(245,7,14,39),(246,8,13,39),(247,9,14,39),(248,10,13,39),(249,1,22,40),(250,2,15,40),(251,3,14,40),(252,4,14,40),(253,5,11,40),(254,6,11,40),(255,7,11,40),(256,1,16,41),(257,2,18,41),(258,3,16,41),(259,4,14,41),(260,5,13,41),(261,6,13,41),(262,7,13,41),(263,1,18,42),(264,2,18,42),(265,3,14,42),(266,4,14,42),(267,5,15,42),(268,6,14,42),(269,7,12,42),(270,8,14,42),(271,1,27,43),(272,2,27,43),(273,3,26,43),(274,4,25,43),(275,5,26,43),(276,6,25,43),(277,7,22,43),(278,8,22,43),(279,9,20,43),(280,10,20,43),(281,1,28,44),(282,2,27,44),(283,3,27,44),(284,4,26,44),(285,5,26,44),(286,6,25,44),(287,7,25,44),(288,8,25,44),(289,9,20,44),(290,1,26,45),(291,2,26,45),(292,3,25,45),(293,4,25,45),(294,5,25,45),(295,6,23,45),(296,7,23,45),(297,8,20,45),(298,9,20,45),(299,10,18,45),(300,1,25,46),(301,2,25,46),(302,3,25,46),(303,4,26,46),(304,5,26,46),(305,6,23,46),(306,7,23,46),(307,8,20,46),(308,9,20,46),(309,10,20,46),(310,1,24,47),(311,2,24,47),(312,3,21,47),(313,4,21,47),(314,5,21,47),(315,6,20,47),(316,7,18,47),(317,8,18,47),(318,9,18,47),(319,10,18,47),(320,1,27,48),(321,2,27,48),(322,3,27,48),(323,4,20,48),(324,5,20,48),(325,6,20,48),(326,7,18,48),(327,8,18,48),(328,9,18,48),(329,10,18,48),(330,11,16,48),(331,1,26,49),(332,2,26,49),(333,3,24,49),(334,4,24,49),(335,5,21,49),(336,6,21,49),(337,7,20,49),(338,8,20,49),(339,9,20,49),(340,10,18,49),(341,11,18,49),(344,1,4,52),(345,1,4,53),(346,2,4,53);
/*!40000 ALTER TABLE `numero_dedos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil_racimo`
--

DROP TABLE IF EXISTS `perfil_racimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil_racimo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pesoTallo` double NOT NULL,
  `nRacimo` int(11) NOT NULL,
  `mermaId` int(11) DEFAULT NULL,
  `colorId` int(11) DEFAULT NULL,
  `defectosY` tinyint(4) NOT NULL DEFAULT 0,
  `lote` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ea728f93fbb88daf29f46ca2d1b` (`colorId`),
  KEY `FK_1b19437883f2dfca02dde1fccb7` (`mermaId`),
  CONSTRAINT `FK_1b19437883f2dfca02dde1fccb7` FOREIGN KEY (`mermaId`) REFERENCES `merma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ea728f93fbb88daf29f46ca2d1b` FOREIGN KEY (`colorId`) REFERENCES `color` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil_racimo`
--

LOCK TABLES `perfil_racimo` WRITE;
/*!40000 ALTER TABLE `perfil_racimo` DISABLE KEYS */;
INSERT INTO `perfil_racimo` VALUES (1,8.4,1,13,1,1,1),(2,4000,2,13,8,1,3),(3,4000,1,12,1,0,9),(4,4000,2,12,2,0,12),(15,5,1,18,NULL,0,0),(16,5,1,18,NULL,0,0),(17,15,1,28,2,0,11),(20,5,6,28,2,0,7),(21,5,6,28,2,0,7),(22,10,1,32,2,0,1),(23,123,12,32,2,0,10),(24,27,2,32,1,0,8),(25,2,2,32,1,0,3),(26,4.23,1,38,4,0,23),(27,5.75,2,38,5,0,24),(28,6.52,3,38,6,0,25),(29,2939,1,44,5,0,10),(30,1780,2,44,7,0,10),(31,1450,3,44,5,0,8),(32,1565,4,44,7,0,8),(33,1475,5,44,6,0,3),(34,1755,6,44,6,0,3),(35,2345,7,44,6,0,3),(36,1258,8,44,6,0,3),(37,1340,9,44,6,0,3),(38,1245,10,44,6,0,11),(39,1450,11,44,6,0,11),(40,945,12,44,6,0,2),(41,1965,13,44,7,0,11),(42,1465,14,44,5,0,2),(43,4570,1,45,5,0,4),(44,3040,2,45,6,0,7),(45,5015,3,45,4,0,6),(46,5580,4,45,5,0,3),(47,4510,5,45,5,0,1),(48,5515,6822,45,4,0,2),(49,6822,7,45,4,0,5),(52,1,1,54,1,0,1),(53,2,2,54,2,0,1);
/*!40000 ALTER TABLE `perfil_racimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peso_mano`
--

DROP TABLE IF EXISTS `peso_mano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peso_mano` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numMano` int(11) NOT NULL,
  `perfilRacimoId` int(11) DEFAULT NULL,
  `pesoMano` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_a2a5eb30f54f84c9618411e38d3` (`perfilRacimoId`),
  CONSTRAINT `FK_a2a5eb30f54f84c9618411e38d3` FOREIGN KEY (`perfilRacimoId`) REFERENCES `perfil_racimo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=347 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peso_mano`
--

LOCK TABLES `peso_mano` WRITE;
/*!40000 ALTER TABLE `peso_mano` DISABLE KEYS */;
INSERT INTO `peso_mano` VALUES (1,1,1,5180),(2,2,1,5065),(3,3,1,4875),(4,4,1,4665),(5,5,1,4410),(6,6,1,4160),(7,7,1,3970),(8,8,1,3810),(9,9,1,3500),(10,1,2,4810),(11,2,2,5009),(12,3,2,4715),(13,4,2,4585),(14,5,2,4010),(15,6,2,3885),(16,7,2,3710),(17,8,2,3580),(18,9,2,3345),(19,1,3,4327),(20,2,3,3822),(21,3,3,3544),(22,4,3,3028),(23,5,3,2842),(24,6,3,2630),(25,7,3,2318),(26,8,3,2002),(27,9,3,1812),(28,1,4,3948),(29,2,4,3627),(30,3,4,3085),(31,4,4,2772),(32,5,4,2541),(33,6,4,2372),(34,7,4,2008),(35,8,4,1971),(36,9,4,1900),(58,1,15,4327),(59,2,15,3822),(60,3,15,3544),(61,4,15,3028),(62,5,15,2842),(63,6,15,2630),(64,7,15,2318),(65,8,15,2002),(66,9,15,1812),(67,1,16,4327),(68,2,16,3822),(69,3,16,3544),(70,4,16,3028),(71,5,16,2842),(72,6,16,2630),(73,7,16,2318),(74,8,16,2002),(75,9,16,1812),(76,1,17,3080),(77,2,17,3080),(78,3,17,3900),(79,4,17,2004),(80,5,17,1999),(81,6,17,1800),(82,7,17,1700),(83,8,17,1700),(84,9,17,1600),(85,10,17,1360),(86,1,22,2345),(87,2,22,2345),(88,3,22,2142),(89,4,22,4362),(90,5,22,1232),(91,6,22,321),(92,7,22,12),(93,8,22,32),(94,9,22,12),(95,10,22,12),(96,11,22,12),(97,12,22,32),(98,1,23,123),(99,2,23,123),(100,3,23,123),(101,4,23,234),(102,5,23,0),(103,6,23,23),(104,7,23,23),(105,8,23,43),(106,9,23,23),(107,10,23,43),(108,1,24,12),(109,2,24,123),(110,3,24,32),(111,4,24,123),(112,5,24,234),(113,6,24,43),(114,7,24,234),(115,1,25,123),(116,2,25,123),(117,3,25,123),(118,4,25,123),(119,5,25,123),(120,6,25,123),(121,7,25,123),(122,8,25,12),(123,1,26,3075),(124,2,26,2541),(125,3,26,2371),(126,4,26,2017),(127,5,26,1985),(128,6,26,1756),(129,7,26,1563),(130,1,27,3375),(131,2,27,3154),(132,3,27,2875),(133,4,27,2156),(134,5,27,2018),(135,6,27,1985),(136,7,27,1928),(137,8,27,1743),(138,9,27,1650),(139,1,28,4685),(140,2,28,3542),(141,3,28,2985),(142,4,28,2744),(143,5,28,2189),(144,6,28,1985),(145,7,28,1766),(146,8,28,1423),(147,9,28,1389),(148,1,29,6115),(149,2,29,3780),(150,3,29,3760),(151,4,29,3195),(152,5,29,3385),(153,6,29,2950),(154,7,29,2240),(155,8,29,2120),(156,9,29,1755),(157,10,29,1735),(158,11,29,1455),(159,1,30,4935),(160,2,30,3465),(161,3,30,3780),(162,4,30,3130),(163,5,30,2995),(164,6,30,2445),(165,7,30,2250),(166,8,30,1985),(167,9,30,1880),(168,10,30,1755),(169,1,31,3625),(170,2,31,4140),(171,3,31,3020),(172,4,31,2845),(173,5,31,2540),(174,6,31,1990),(175,7,31,1640),(176,8,31,1512),(177,9,31,1325),(178,10,31,1235),(179,1,32,2770),(180,2,32,3995),(181,3,32,2810),(182,4,32,2645),(183,5,32,2065),(184,6,32,1855),(185,7,32,1495),(186,8,32,1455),(187,1,33,3120),(188,2,33,3060),(189,3,33,2610),(190,4,33,2115),(191,5,33,1940),(192,6,33,1790),(193,7,33,1345),(194,8,33,1510),(195,9,33,1125),(196,1,34,4730),(197,2,34,3055),(198,3,34,2920),(199,4,34,1595),(200,5,34,2500),(201,6,34,1810),(202,7,34,1910),(203,1,35,4060),(204,2,35,4525),(205,3,35,2845),(206,4,35,3160),(207,5,35,2405),(208,6,35,2775),(209,7,35,2220),(210,8,35,1818),(211,9,35,1455),(212,10,35,1365),(213,1,36,4690),(214,2,36,3345),(215,3,36,3080),(216,4,36,2935),(217,5,36,2645),(218,6,36,2095),(219,7,36,1845),(220,8,36,1465),(221,9,36,1620),(222,1,37,4645),(223,2,37,3345),(224,3,37,2865),(225,4,37,2795),(226,5,37,2530),(227,6,37,1825),(228,7,37,1645),(229,8,37,1698),(230,1,38,5285),(231,2,38,3905),(232,3,38,2335),(233,4,38,2865),(234,5,38,2570),(235,6,38,2415),(236,7,38,1950),(237,8,38,1865),(238,9,38,1605),(239,1,39,4105),(240,2,39,2680),(241,3,39,3516),(242,4,39,2940),(243,5,39,2695),(244,6,39,2420),(245,7,39,2078),(246,8,39,1785),(247,9,39,1608),(248,10,39,1460),(249,1,40,4036),(250,2,40,2680),(251,3,40,2620),(252,4,40,2400),(253,5,40,1720),(254,6,40,1515),(255,7,40,1345),(256,1,41,2665),(257,2,41,2900),(258,3,41,2790),(259,4,41,2145),(260,5,41,1845),(261,6,41,1840),(262,7,41,1570),(263,1,42,4400),(264,2,42,3665),(265,3,42,3080),(266,4,42,2045),(267,5,42,2615),(268,6,42,1848),(269,7,42,1660),(270,8,42,1765),(271,1,43,6845),(272,2,43,6566),(273,3,43,6375),(274,4,43,6340),(275,5,43,6010),(276,6,43,5880),(277,7,43,5335),(278,8,43,5035),(279,9,43,4950),(280,10,43,4775),(281,1,44,5610),(282,2,44,5435),(283,3,44,5185),(284,4,44,5022),(285,5,44,4838),(286,6,44,4580),(287,7,44,4334),(288,8,44,4020),(289,9,44,3818),(290,1,45,5375),(291,2,45,5130),(292,3,45,5020),(293,4,45,4850),(294,5,45,4660),(295,6,45,4475),(296,7,45,4130),(297,8,45,4055),(298,9,45,3925),(299,10,45,3855),(300,1,46,5866),(301,2,46,5740),(302,3,46,5675),(303,4,46,5422),(304,5,46,5160),(305,6,46,5010),(306,7,46,4974),(307,8,46,4710),(308,9,46,4445),(309,10,46,4110),(310,1,47,6315),(311,2,47,6122),(312,3,47,6055),(313,4,47,5710),(314,5,47,5510),(315,6,47,5340),(316,7,47,5025),(317,8,47,4975),(318,9,47,4780),(319,10,47,4410),(320,1,48,6825),(321,2,48,6410),(322,3,48,6380),(323,4,48,6045),(324,5,48,5855),(325,6,48,5650),(326,7,48,5455),(327,8,48,5135),(328,9,48,5010),(329,10,48,4940),(330,11,48,4822),(331,1,49,6510),(332,2,49,6300),(333,3,49,6122),(334,4,49,6075),(335,5,49,5810),(336,6,49,5740),(337,7,49,5580),(338,8,49,5315),(339,9,49,5125),(340,10,49,4980),(341,11,49,4744),(344,1,52,4),(345,1,53,4),(346,2,53,4);
/*!40000 ALTER TABLE `peso_mano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider` (
  `idProvedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL DEFAULT '0',
  `telefono` varchar(255) NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idProvedor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES (1,'Contructor SA','barreiro','0292898','yopmai@sd.com'),(2,'Spacex','EEUU','9208928','escp@ds.com'),(3,'sumifru','5 de marzo del 200','2121','sumifru@hg.com');
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query-result-cache`
--

DROP TABLE IF EXISTS `query-result-cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `query-result-cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) DEFAULT NULL,
  `time` bigint(20) NOT NULL,
  `duration` int(11) NOT NULL,
  `query` text NOT NULL,
  `result` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query-result-cache`
--

LOCK TABLES `query-result-cache` WRITE;
/*!40000 ALTER TABLE `query-result-cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `query-result-cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ranch`
--

DROP TABLE IF EXISTS `ranch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ranch` (
  `idHaciendad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `condigoHacienda` varchar(255) NOT NULL,
  `zonaIdZona` int(11) DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idHaciendad`),
  KEY `FK_d0795734dc7fa25daffbffef978` (`zonaIdZona`),
  CONSTRAINT `FK_d0795734dc7fa25daffbffef978` FOREIGN KEY (`zonaIdZona`) REFERENCES `zona` (`idZona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranch`
--

LOCK TABLES `ranch` WRITE;
/*!40000 ALTER TABLE `ranch` DISABLE KEYS */;
INSERT INTO `ranch` VALUES (6,'la suerte 1','2173-1',1,1),(7,'la suerte 2','2173-2',1,1),(8,'San Marco 1','2169-3',1,1),(9,'San Marco 2','2169-4',1,1),(10,'Doña Laura','2172',2,1),(11,'La Delicia','2177',2,1),(12,'Las Mercedes','2170',2,1),(13,'Mano de Dios','2168',2,1),(14,'Matilde 1','1863',2,1),(15,'Monte Grande','1864',2,1),(16,'Triple A','2113',2,1),(17,'Carolina','2176',3,1),(18,'San Luis 1','2171',3,1),(19,'San Luis 2','2174',3,1),(20,'Sigal','2167',3,1),(21,'Soledad','1827',3,1),(22,'Vizcaya','3672',3,1),(23,'Claudia Maria','1874',4,1),(24,'Clemencia','1877',4,1),(25,'Doña Luisa','2116',4,1),(26,'Maria Fernanda','1968',4,1),(27,'Mercedes Corp','1872',4,1),(28,'San Jorge','1893',4,1);
/*!40000 ALTER TABLE `ranch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rejected_bunch`
--

DROP TABLE IF EXISTS `rejected_bunch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rejected_bunch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `lote` int(11) NOT NULL,
  `defectoId` int(11) DEFAULT NULL,
  `mermaId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_4ef37273624ef0caf00821edf83` (`defectoId`),
  KEY `FK_c89d8c6b61c3f438e6d1f761009` (`mermaId`),
  CONSTRAINT `FK_4ef37273624ef0caf00821edf83` FOREIGN KEY (`defectoId`) REFERENCES `defecto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_c89d8c6b61c3f438e6d1f761009` FOREIGN KEY (`mermaId`) REFERENCES `merma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rejected_bunch`
--

LOCK TABLES `rejected_bunch` WRITE;
/*!40000 ALTER TABLE `rejected_bunch` DISABLE KEYS */;
INSERT INTO `rejected_bunch` VALUES (1,12,2,2,47),(2,1,3,3,47),(5,3,1,1,NULL),(6,3,2,5,NULL),(7,3,1,1,NULL),(8,3,2,5,NULL),(9,3,1,1,NULL),(10,3,2,5,NULL),(11,3,1,1,NULL),(12,3,2,5,NULL),(13,3,1,1,NULL),(14,3,2,5,NULL),(15,3,1,1,NULL),(16,3,2,5,NULL),(19,3,1,1,54),(20,3,2,5,54);
/*!40000 ALTER TABLE `rejected_bunch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporte`
--

DROP TABLE IF EXISTS `reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporte` (
  `idReporte` int(11) NOT NULL AUTO_INCREMENT,
  `reporte` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `fechaIngreso` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `inventoryIdInventario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idReporte`),
  KEY `FK_7f86ec35f67c59319ed3dab908d` (`inventoryIdInventario`),
  CONSTRAINT `FK_7f86ec35f67c59319ed3dab908d` FOREIGN KEY (`inventoryIdInventario`) REFERENCES `inventory` (`idInventario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte`
--

LOCK TABLES `reporte` WRITE;
/*!40000 ALTER TABLE `reporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsable`
--

DROP TABLE IF EXISTS `responsable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `responsable` (
  `idResponsable` int(11) NOT NULL AUTO_INCREMENT,
  `fechaIngreso` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `ranchIdHaciendad` int(11) DEFAULT NULL,
  `inventoryIdInventario` int(11) DEFAULT NULL,
  `userIdUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idResponsable`),
  UNIQUE KEY `REL_016b50f7b944bdc1ec84096725` (`inventoryIdInventario`),
  KEY `FK_a7258b11a80eff17bf7e82432b6` (`ranchIdHaciendad`),
  KEY `FK_64edd6c045dc19d59323ae8f1b0` (`userIdUsuario`),
  CONSTRAINT `FK_016b50f7b944bdc1ec84096725f` FOREIGN KEY (`inventoryIdInventario`) REFERENCES `inventory` (`idInventario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_64edd6c045dc19d59323ae8f1b0` FOREIGN KEY (`userIdUsuario`) REFERENCES `user` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_a7258b11a80eff17bf7e82432b6` FOREIGN KEY (`ranchIdHaciendad`) REFERENCES `ranch` (`idHaciendad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsable`
--

LOCK TABLES `responsable` WRITE;
/*!40000 ALTER TABLE `responsable` DISABLE KEYS */;
INSERT INTO `responsable` VALUES (13,'2022-02-21 15:48:14.412345',6,8,1),(14,'2022-03-12 13:08:15.377322',6,12,14),(15,'2022-03-12 13:29:44.129312',6,20,15),(16,'2022-03-12 13:32:32.196419',13,14,16),(17,'2022-03-12 13:34:45.568543',18,27,17),(18,'2022-03-12 13:36:19.661383',13,9,16),(19,'2022-03-12 13:36:21.626110',6,24,15),(20,'2022-03-12 13:36:48.640474',6,38,15),(21,'2022-03-12 13:38:29.070700',18,17,17),(22,'2022-03-12 13:39:10.220442',18,19,17),(23,'2022-03-12 13:49:46.034670',25,28,19),(24,'2022-03-12 13:50:15.269118',25,70,19),(25,'2022-03-12 13:55:31.052499',12,39,18),(27,'2022-03-12 13:56:04.961927',12,18,18),(28,'2022-03-12 13:58:36.347179',6,44,20),(29,'2022-03-12 13:59:10.851409',6,15,20),(30,'2022-04-14 17:46:49.812556',6,49,1);
/*!40000 ALTER TABLE `responsable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin'),(2,'supervisor'),(3,'jfplanta'),(4,'calidad');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sku`
--

DROP TABLE IF EXISTS `sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(255) NOT NULL,
  `empresa` varchar(255) DEFAULT NULL,
  `peso` double NOT NULL,
  `clusters` double NOT NULL DEFAULT 0,
  `dedosMin` double NOT NULL DEFAULT 0,
  `dedosMax` double NOT NULL DEFAULT 0,
  `pesoFrutaFundaMin` double NOT NULL DEFAULT 0,
  `pesoFrutaFundaMax` double NOT NULL DEFAULT 0,
  `calibracionMin` double NOT NULL DEFAULT 0,
  `calibracionMax` double NOT NULL DEFAULT 0,
  `largoDedoMin` double NOT NULL DEFAULT 0,
  `largoDedoMax` double NOT NULL DEFAULT 0,
  `tercero` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sku`
--

LOCK TABLES `sku` WRITE;
/*!40000 ALTER TABLE `sku` DISABLE KEYS */;
INSERT INTO `sku` VALUES (1,'26pn','SUMIFRU JAPON',43.5,0,4,6,655,850,39,45,8,9.5,0),(2,'26p','SUMIFRU JAPON',43.5,0,4,6,655,850,39,45,8,9.5,0),(3,'29p','SUMIFRU JAPON',43.5,0,4,6,605,750,37,45,7,9,0),(4,'33p','SUMIFRU JAPON',43.5,0,4,6,505,650,37,45,7,9,0),(5,'26p3','SUMIFRU JAPON',43.5,0,4,6,660,0,39,45,9.5,0,0),(6,'25p','FARMIND JAPON',43.5,0,0,0,655,850,39,45,8,9.5,0),(7,'32p','FARMIND JAPON',43.5,0,0,0,505,650,37,45,7,9,0),(8,'HA31P','SUMIFRU',43.5,31,4,6,555,700,37,39,7,8,0),(9,'26C','SUMIFRU',43.5,26,4,6,655,850,39,45,7,9.5,0),(10,'25PN','FARMIND JAPON',43.5,26,4,6,655,850,39,45,7,9.5,0),(11,'Sharbatly','Hilldale',31,0,0,0,0,0,0,0,0,0,1),(12,'Lefruit','Hilldale',44,0,0,0,0,0,0,0,0,0,1),(13,'Supreme','Hilldale',44,0,0,0,0,0,0,0,0,0,1),(14,'Yellow','Asoproagrinero',41,0,0,0,0,0,0,0,0,0,1),(15,'Toco','Asoproagrinero',43,0,0,0,0,0,0,0,0,0,1),(16,'Tropical','Tropical',43,0,0,0,0,0,0,0,0,0,1),(17,'OK Premiun','OK',52,0,0,0,0,0,0,0,0,0,1),(18,'Bananzor','Pacifico Export',47,0,0,0,0,0,0,0,0,0,1),(19,'Mir','Pacifico Export',45,0,0,0,0,0,0,0,0,0,1),(20,'Berfin','Pacifico Export',46,0,0,0,0,0,0,0,0,0,1),(21,'Bonanza\r\n','Fanalba',47,0,0,0,0,0,0,0,0,0,1),(22,'Estelar','Fanalba',44,0,0,0,0,0,0,0,0,0,1),(23,'Bagno','Bagno',44,0,0,0,0,0,0,0,0,0,1),(24,'Ginafruit','Ginafruit',33.5,0,0,0,0,0,0,0,0,0,1),(25,'Ginafruit','Ginafruit',43,0,0,0,0,0,0,0,0,0,1),(26,'Extraban','Mendoexport',44,0,0,0,0,0,0,0,0,0,1),(27,'Gonzalito','Exportgonza',52,0,0,0,0,0,0,0,0,0,1),(28,'Interbanana','Interbanana',43,0,0,0,0,0,0,0,0,0,1),(29,'Bonita','Interbanana',43,0,0,0,0,0,0,0,0,0,1),(30,'Battaglio','Luderson',44,0,0,0,0,0,0,0,0,0,1),(31,'38PFluta','sumpreme furtas',32.5,50,0,0,0,0,0,0,0,0,1);
/*!40000 ALTER TABLE `sku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_defecto`
--

DROP TABLE IF EXISTS `tipo_defecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_defecto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_defecto`
--

LOCK TABLES `tipo_defecto` WRITE;
/*!40000 ALTER TABLE `tipo_defecto` DISABLE KEYS */;
INSERT INTO `tipo_defecto` VALUES (1,'Cosecha'),(2,'Empaque'),(3,'Cut Waste'),(4,'Practicas agrícolas'),(5,'Fisiológicos'),(10,'Falta de mercado');
/*!40000 ALTER TABLE `tipo_defecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit_md`
--

DROP TABLE IF EXISTS `unit_md`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit_md` (
  `idUnidadMedida` int(11) NOT NULL AUTO_INCREMENT,
  `tipoUnida` varchar(255) NOT NULL,
  PRIMARY KEY (`idUnidadMedida`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_md`
--

LOCK TABLES `unit_md` WRITE;
/*!40000 ALTER TABLE `unit_md` DISABLE KEYS */;
INSERT INTO `unit_md` VALUES (1,'Metros(m)'),(2,'Kilogramos(Kg)'),(3,'Unidad(UND)'),(4,'metros cubicos'),(5,'litro(L)'),(6,'juego(JGO)'),(7,'Galon(GAL)'),(8,'Frasco'),(9,'Cajas'),(10,'Par'),(11,'metros');
/*!40000 ALTER TABLE `unit_md` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `contraseña` varchar(255) NOT NULL DEFAULT '0',
  `createdAt` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `numCedula` varchar(255) NOT NULL,
  `roleId` int(11) DEFAULT NULL,
  `isActive` tinyint(4) NOT NULL DEFAULT 1,
  `fullAccess` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idUsuario`),
  KEY `FK_c28e52f758e7bbc53828db92194` (`roleId`),
  CONSTRAINT `FK_c28e52f758e7bbc53828db92194` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'jonathan','$2b$10$AH/WuLldBcIbwkGKFi4gz.8/DaUqCv2fCY29fzmoYvYP6TOMaUPFG','2022-02-04 13:31:52.152950','2022-03-14 14:58:06.248905','1207207752',1,0,1),(14,'parra','$2b$10$w3gGLeF7VnlSfPpMu.sal.cvZSGJT0aKjzuGN2yOW5qpKUvEPMUFK','2022-03-12 13:01:16.909801','2022-03-15 19:21:00.632420','120',4,0,0),(15,'Parrales','$2b$10$1/rHs.Ozw2nLNzFRBn5k2.yjpK1tMI79BBU44QpMJRjSJZbl/BbHe','2022-03-12 13:25:05.418177','2022-03-12 13:25:05.418177','1204367971',2,0,0),(16,'Sanchez','$2b$10$ijZnd1pSLkEtabHtci.kJuzXw8ZkcSeLt3qAh6RNVQLTYgcS0obM.','2022-03-12 13:27:29.068484','2022-03-12 13:27:29.068484','1207716992',2,0,0),(17,'Leon','$2b$10$ULdmFLe9cAWqBpYk6gtwauWl75R4h.mEIxfBsa8thKEG6NCzFB9E.','2022-03-12 13:32:24.675008','2022-03-12 13:32:24.675008','1207091313',2,0,0),(18,'Olvera','$2b$10$RABi3pZL3xcJnRFAFwAVcO1uDuy79WoWq1sNvf3CJoFXrkEMhkQD2','2022-03-12 13:46:01.265763','2022-03-12 13:46:01.265763','1205651910',2,0,0),(19,'Zamora','$2b$10$MoFB.paQGXJiUTSNr87HP.rEtqkWVbNPPspifyD.DM5N9j3H72byG','2022-03-12 13:46:24.929841','2022-03-12 13:46:24.929841','1206915298',2,0,0),(20,'Cando','$2b$10$uTXPKbD6D8NErAj9QyD3teNLq.aisCIjujtJP4rJSKfMg6Kjpnfi.','2022-03-12 13:56:46.528001','2022-03-12 13:56:46.528001','1250153341',2,0,0),(21,'prueba','$2b$10$HNFhZGjPdEMANcVZJGTCFOpL9I9pHkJFdwY5LuesFE0P3AHOT2V8e','2022-03-14 16:18:09.856288','2022-03-14 16:18:09.856288','123456',3,1,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zona`
--

DROP TABLE IF EXISTS `zona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zona` (
  `idZona` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `usersIdUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idZona`),
  KEY `FK_0ab1c1845a1ad20e0e6cce3ee24` (`usersIdUsuario`),
  CONSTRAINT `FK_0ab1c1845a1ad20e0e6cce3ee24` FOREIGN KEY (`usersIdUsuario`) REFERENCES `user` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zona`
--

LOCK TABLES `zona` WRITE;
/*!40000 ALTER TABLE `zona` DISABLE KEYS */;
INSERT INTO `zona` VALUES (1,'zona 1',17),(2,'zona 2',NULL),(3,'zona 3',NULL),(4,'zona 4',NULL);
/*!40000 ALTER TABLE `zona` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-29 14:51:13

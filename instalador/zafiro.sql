-- MySQL dump 10.13  Distrib 5.1.63, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: zafiro
-- ------------------------------------------------------
-- Server version	5.1.63-0+squeeze1

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
-- Table structure for table `acciones`
--

DROP TABLE IF EXISTS `acciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acciones` (
  `accionesid` int(10) unsigned DEFAULT '0',
  `accionesval` int(10) unsigned DEFAULT '0',
  `accionesdes` char(200) DEFAULT '',
  `accionescom` char(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acciones`
--

LOCK TABLES `acciones` WRITE;
/*!40000 ALTER TABLE `acciones` DISABLE KEYS */;
INSERT INTO `acciones` VALUES (1,0,'Apaga el sistema','shutdown -h now'),(2,0,'Reinicia el servidor','reboot'),(4,1,'Ejecutar Zafiro','');
/*!40000 ALTER TABLE `acciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canales`
--

DROP TABLE IF EXISTS `canales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canales` (
  `canalesid` int(10) unsigned NOT NULL DEFAULT '0',
  `canalessub` int(10) unsigned NOT NULL DEFAULT '0',
  `canalesbaj` int(10) unsigned NOT NULL DEFAULT '0',
  `canalesest` int(10) unsigned NOT NULL DEFAULT '0',
  `canalesnom` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`canalesid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canales`
--

LOCK TABLES `canales` WRITE;
/*!40000 ALTER TABLE `canales` DISABLE KEYS */;
INSERT INTO `canales` VALUES (1,20,60,0,'CALL'),(2,256,256,0,'LIBRE'),(3,5,10,2,'S5/B10'),(4,10,20,0,'S10/B20'),(5,5,10,0,'LIMITACION ABSOLUTA'),(6,40,120,0,'S40/B120');
/*!40000 ALTER TABLE `canales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `clientesid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `clientesdes` varchar(255) NOT NULL DEFAULT '',
  `clientesmac` varchar(45) NOT NULL DEFAULT '',
  `clientesper` int(10) unsigned NOT NULL DEFAULT '0',
  `clientesest` int(10) unsigned NOT NULL DEFAULT '0',
  `clientesip` int(10) unsigned NOT NULL DEFAULT '0',
  `clientesfecalt` int(10) unsigned NOT NULL DEFAULT '0',
  `clientesfecbaj` int(10) unsigned DEFAULT NULL,
  `clientespla` int(10) unsigned NOT NULL DEFAULT '0',
  `clientesnom` varchar(45) NOT NULL DEFAULT '',
  `clientesdir` varchar(45) DEFAULT NULL,
  `clientestel` varchar(45) DEFAULT NULL,
  `clientescui` varchar(45) DEFAULT NULL,
  `clientesema` varchar(45) DEFAULT NULL,
  `clientespro` int(11) DEFAULT NULL,
  `clientessal` int(11) DEFAULT NULL,
  PRIMARY KEY (`clientesid`)
) ENGINE=MyISAM AUTO_INCREMENT=389 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Ubuntu','00:0B:6A:BF:A5:EB',0,2,118,0,0,2,'puesto 118','','','','',0,0),(2,'Desktop','00:19:66:46:EF:10',0,2,10,0,0,2,'Pablo','','','','',0,0),(3,'Desktop','00:1C:C0:38:21:62',0,0,107,20121010,0,2,'PC 7','','','','',1,1),(43,'Desktop','00:16:EC:AB:9B:10',0,2,112,0,0,2,'Puesto 112','','','','',0,0),(4,'Gateway VoIP','00:0B:82:14:DC:57',0,2,250,0,0,2,'Recepcion Call Center','','','','',0,0),(5,'Gateway Gradstream','00:0B:82:11:B9:55',0,2,201,0,0,2,'Recepcion Caballito','','','','',0,0),(6,'Pc Escritorio','00:E0:7D:D7:60:B5',0,2,135,0,0,2,'Puesto 135','','','','',0,0),(7,'Gateway VoIP','00:0B:82:14:DC:57',0,2,235,0,0,2,'Puesto 135','','','','',0,0),(8,'Pc Escritorio','00:19:0C:20:00:CC',0,2,108,0,0,2,'Puesto 108','','','','',0,0),(9,'Servidor Terminal Server','00:11:2F:87:3D:39',0,2,34,0,0,2,'Carloncho','','','','',0,0),(10,'Pc Escritorio','00:11:2F:27:E0:65',0,2,113,0,0,2,'Puesto 113','','','','',0,0),(11,'Gateway VoIP','00:0B:82:11:B9:49',0,2,213,0,0,2,'Puesto 113','','','','',0,0),(12,'Gateway VoIP','00:0B:82:17:57:43',0,2,217,0,0,2,'Puesto 117','','','','',0,0),(13,'Pc Escritorio','00:16:EC:5E:CF:D9',0,2,117,0,0,2,'Puesto 117','','','','',0,0),(14,'Pc Escritorio','00:0B:6A:BF:A5:C1',0,2,119,0,0,2,'Puesto 119','','','','',0,0),(15,'Pc Escritorio','00:19:0C:5F:03:27',0,2,111,0,0,2,'Puesto 111','','','','',0,0),(16,'Gateway Grandstream','00:0B:82:17:57:7B',0,2,227,0,0,2,'Computadora 3','','','','',0,0),(17,'Gateway VoIP','00:0B:82:17:57:49',0,2,209,0,0,2,'Puesto 109','','','','',0,0),(18,'Pc Escritorio','00:0B:6A:BF:A1:4A',0,2,109,0,0,2,'Puesto 109','','','','',0,0),(19,'Pc Escritorio','00:0D:87:94:AF:61',0,2,114,0,0,2,'Puesto 114','','','','',0,0),(20,'Gateway VoIP','00:0B:82:17:57:47',0,2,214,0,0,2,'Puesto 114','','','','',0,0),(21,'Notebook','00:90:F5:59:35:32',0,2,249,0,0,2,'Pablo','','','','',0,1),(22,'Notebook','00:21:70:D6:2A:B3',0,0,20,20121002,0,7,'Onell Lanfranco','','','','',1,1),(23,'Gateway VoIP','00:0B:82:11:B9:27',0,2,235,0,0,2,'Puesto 135','','','','',0,0),(24,'Gateway VoIP','00:0B:82:11:B9:23',0,2,231,0,0,2,'Puesto 131','','','','',0,0),(25,'Desktop','00:0B:6A:BE:93:6E',0,2,131,0,0,2,'Puesto 131','','','','',0,0),(26,'Gateway VoIP','00:0B:82:14:DC:55',0,2,232,0,0,2,'Puesto 132','','','','',0,0),(27,'Desktop','00:11:09:C4:BD:58',0,2,132,0,0,2,'Puesto 132','','','','',0,0),(28,'Gateway VoIP','00:0B:82:11:B9:2D',0,2,233,0,0,2,'Puesto 133','','','','',0,0),(29,'Desktop','00:16:EC:5E:D2:39',0,2,133,0,0,2,'Puesto 133','','','','',0,0),(30,'Desktop','00:0B:6A:BF:79:58',0,2,118,0,0,2,'Puesto 118','','','','',0,0),(31,'Gateway VoIP','00:0B:82:11:B9:33',0,2,218,0,0,2,'Puesto 118','','','','',0,0),(32,'Gateway VoIP','00:0B:82:0F:50:5C',0,2,216,0,0,2,'Puesto 116','','','','',0,0),(33,'Gateway VoIP','00:0B:82:14:DC:4F',0,2,218,0,0,2,'Puesto 118','','','','',0,0),(34,'Desktop','00:19:0C:20:03:50',0,2,116,0,0,2,'Puesto 116','','','','',0,0),(35,'Gateway VoIP','00:0B:82:11:B9:3D',0,2,215,0,0,2,'Puesto 115','','','','',0,0),(36,'Desktop','00:0B:6A:A8:A9:24',0,2,115,0,0,2,'Puesto 115','','','','',0,0),(37,'Desktop','00:E0:7D:A7:E0:0F',0,2,118,0,0,2,'Puesto 118','','','','',0,0),(38,'Gateway VoIP','00:0B:82:14:DC:47',0,2,206,0,0,2,'Puesto 106','','','','',0,0),(39,'Gateway VoIP','00:0B:82:17:57:63',0,2,207,0,0,2,'Puesto 107','','','','',0,0),(40,'Desktop','00:0C:6E:EF:64:30',0,2,107,0,0,2,'Puesto 107','','','','',0,0),(41,'Gateway VoIP','00:0B:82:14:DC:59',0,2,208,0,0,2,'Puesto 108','','','','',0,0),(42,'Desktop','00:08:54:1F:58:1B',0,2,108,0,0,2,'Puesto 108','','','','',0,0),(44,'Gateway Voip','00:0B:82:14:DC:43',0,2,212,0,0,2,'Puesto 112','','','','',0,0),(114,'Ubuntu','00:0B:6A:C6:54:06',0,2,130,0,0,2,'Instalacion ','','','','',0,1),(45,'Desktop','00:0B:6A:C6:53:DF',0,2,107,0,0,2,'Puesto 107','','','','',0,1),(46,'Desktop','00:0C:6E:EF:64:30',0,2,100,0,0,3,'Recepcion Caballito','','','','',0,1),(47,'Gateway VoIP','00:0B:82:14:DC:43',0,2,209,0,0,2,'Puesto 109','','','','',0,0),(48,'Gateway VoIP','00:0B:82:17:57:49',0,2,212,0,0,2,'Puesto 112','','','','',0,0),(49,'Desktop','00:0A:E6:B4:A8:87',0,2,132,0,0,2,'Puesto 132','','','','',0,0),(50,'Desktop','00:0C:6E:EF:64:30',0,2,100,0,0,2,'Recepcion','','','','',0,0),(51,'VoiP','00:0B:82:11:B9:59',0,2,180,0,0,2,'Onell','','','','',0,0),(52,'Encore','00:BA:D0:0B:AD:00',0,2,118,0,0,2,'Puesto 118','','','','',0,0),(53,'Gateway VoIP','00:0B:82:14:DC:5C',0,2,250,0,0,2,'Recepcion Call Center','','','','',0,0),(54,'Encore','00:19:0C:20:02:16',0,2,107,0,0,2,'Puesto 107','','','','',0,0),(55,'Desktop','00:0B:6A:BF:79:58',0,2,111,0,0,2,'Puesto 111','','','','',0,0),(56,'Desktop','00:11:09:C4:BD:58',0,2,115,0,0,2,'Puesto 115','','','','',0,0),(57,'Desktop','00:0B:6A:A8:A9:24',0,2,200,0,0,2,'Recepcion Caballito','','','','',0,0),(58,'Gateway VoIP','00:0B:82:14:DC:59',0,2,219,0,0,2,'Puesto 119','','','','',0,0),(59,'Gateway VoIP','00:0B:82:17:57:63',0,2,210,0,0,2,'Puesto 110','','','','',0,0),(60,'Gateway Grandstream','00:0B:82:11:B9:5F',0,2,217,0,0,2,'Puesto 117','','','','',0,0),(61,'Gateway Grandstream','00:0B:82:11:B9:33',0,2,212,0,0,2,'Puesto 112','','','','',0,0),(62,'encore','00:19:0C:5F:03:27',0,2,106,0,0,2,'Puesto 106','','','','',0,0),(63,'Encore','00:BA:D0:0B:AD:00',0,2,105,0,0,2,'Puesto 105','','','','',0,0),(64,'Pc desktop','00:08:54:1F:58:1B',0,2,119,0,0,2,'Puesto 119','','','','',0,0),(65,'Gateway Grandstream','00:0B:82:11:B9:5B',0,2,180,0,0,2,'Onell','','','','',0,0),(66,'Edixmax','00:00:B4:CB:6A:F1',0,2,245,0,0,2,'Print Server','','','','',0,1),(67,'Gateway Granstream','00:0B:82:14:DC:4F',0,2,218,0,0,3,'Puesto 118','','','','',0,0),(68,'Gateway Granstream','00:0B:6A:BF:A5:C1',0,2,108,0,0,2,'Puesto 108','','','','',0,0),(69,'Gateway Granstream','00:0B:82:14:DC:4F',0,2,218,0,0,2,'Puesto 118','','','','',0,0),(70,'Desktop','00:0B:6A:BF:A5:C1',0,2,12,0,0,2,'Puesto 108','','','','',0,0),(71,'Encore','00:19:0C:20:00:CC',0,2,119,0,0,2,'Puesto 119','','','','',0,0),(72,'Encore','00:19:0C:20:01:9A',0,2,135,0,0,2,'Puesto 135','','','','',0,0),(73,'Gateway Grandstream','00:0B:82:14:DC:59',0,2,219,0,0,2,'Puesto 119','','','','',0,0),(74,'Gateway Grandstream','00:0B:82:11:BD:8D',0,2,231,0,0,2,'Puesto 131','','','','',0,0),(75,'Gateway Grandstream','00:0B:82:14:DC:47',0,2,235,0,0,2,'Puesto 135','','','','',0,0),(76,'Servidor Asterisk','00:E0:7D:A9:DA:8B',0,2,2,0,0,3,'VoipNuevo','','','','',0,0),(77,'Central VoIP','70:71:bc:71:98:2a',0,0,2,0,0,3,'Asterisk','','','','',0,1),(78,'Desktop','00:0B:6A:C6:54:06',0,2,108,0,0,3,'Cecilia','','','','',0,0),(79,'Voip','00:0B:82:11:B9:35',0,2,175,0,0,2,'Onell','','','','',0,0),(80,'Desktop','00:0B:6A:BF:9D:71',0,2,62,0,0,2,'Cecilia','','','','',0,1),(81,'Desktop','00:17:31:18:54:2C',0,2,75,20091116,0,2,'Gisel','','','','',0,1),(82,'Desktop','00:1F:C6:B5:54:AF',0,2,25,0,0,2,'Pablo','','','','',0,1),(83,'Desktop','00:0E:A6:A9:EF:34',0,2,129,0,0,2,'Agente de venta 5','','','','',0,0),(88,'Voip','00:0B:82:0F:50:4F',0,2,208,0,0,2,'Cecilia','','','','',0,0),(84,'Desktop','00:19:66:76:5B:91',0,2,70,0,0,2,'Carlos Rodriguez','','','','',0,1),(85,'Kozumi','08:10:74:38:15:A7',0,2,5,0,0,2,'Router Wireless','','','','',0,1),(86,'Desktop','00:19:66:64:53:E3',0,2,71,0,0,2,'Erika','','','','',0,1),(87,'Gateway Grandstream','00:0B:82:17:57:43',0,2,161,0,0,2,'Gisel Dalfonso','','','','',0,0),(89,'Desktop','00:0B:6A:BF:A5:C1',0,2,115,0,0,2,'Puesto 115','','','','',0,0),(90,'Desktop','00:16:EC:AB:9B:10',0,2,120,0,0,2,'Puesto 120','','','','',0,0),(91,'Gateway','00:0B:82:11:B9:33',0,2,220,0,0,2,'Puesto 120','','','','',0,0),(92,'Gateway Gradstream','00:0B:82:14:DC:51',0,2,170,0,0,2,'Carlos Rodriguez','','','','',0,0),(93,'Desktop','00:0B:6A:BF:79:58',0,2,113,0,0,3,'Puesto 113','','','','',0,1),(94,'Desktop','00:11:09:C4:BD:58',0,2,114,0,0,2,'Puesto 114','','','','',0,0),(95,'Gateway Gradstream','00:0B:82:17:57:63',0,2,226,0,0,2,'Agente de venta 1','','','','',0,0),(96,'al terminal','00:16:EC:5E:D2:39',0,2,126,0,0,2,'Agente de venta 2','','','','',0,0),(97,'al terminal','00:0A:E6:B4:A8:87',0,2,156,0,0,2,'Agente de venta 20','','','','',0,0),(98,'Gateway Gradstream','00:0B:82:14:DC:47',0,2,228,0,0,2,'Agente de venta 4','','','','',0,0),(99,'al terminal','00:19:0C:20:01:9A',0,2,128,0,0,2,'Agente de venta 4','','','','',0,0),(100,'Gateway Grandstream','00:0B:82:11:b9:5f',0,2,171,0,0,2,'Erika Mirkouski','','','','',0,0),(101,'Grandstream','00:0B:82:11:B9:2D',0,2,209,0,0,2,'Puesto 109','','','','',0,0),(102,'Despues de instalar borrar','00:48:54:87:97:1A',0,2,230,0,0,2,'Instalacion ','','','','',0,1),(103,'Desktop','00:19:66:29:8D:E6',0,2,145,0,0,2,'Futura instalacion','','','','',0,0),(104,'Ubuntu','00:0B:6A:BE:93:79',0,2,115,0,0,2,'Puesto 115','','','','',0,0),(105,'Notebook','00:90:F5:5E:5E:81',0,2,3,0,0,3,'Jose Lopez','','','','',0,0),(106,'Ubuntu','00:0B:6A:BF:A5:C1',0,2,120,0,0,2,'Puesto 120','','','','',0,0),(107,'Zafiro','00:0B:6A:BF:79:58',0,2,230,0,0,3,'Zafiro bodylight','','','','',0,1),(108,'Gateway Gradstream','00:0B:82:14:DC:55',0,2,208,0,0,2,'Cecilia','','','','',0,0),(109,'ubuntu','00:11:09:C4:BD:58',0,2,108,0,0,2,'Sonia','','','','',0,1),(110,'billing','00:0B:6A:BF:A1:4A',0,2,60,0,0,3,'Zafiro','','','','',0,1),(111,'Ubuntu','00:0B:6A:BE:93:6E',0,2,61,0,0,2,'Gisel','','','','',0,1),(112,'Desktop','00:17:31:18:54:2C',0,2,150,0,0,2,'Recepcion callcenter','','','','',0,1),(113,'Desktop','00:0B:6A:BF:A5:CD',0,2,130,0,0,2,'Agente de venta 5','','','','',0,0),(115,'.','00:0B:6A:C6:53:DF',0,2,56,0,0,2,'Instalacion ','','','','',0,1),(116,'Desktop','00:0B:6A:BF:AA:5E',0,0,105,20121010,0,2,'PC 5','','','','',1,1),(119,'Vent hp5580','00:E0:4C:91:C0:04',0,2,246,0,0,2,'Print Server','','','','',0,1),(117,'Winme','00:50:04:8A:CB:9F',0,2,80,0,0,2,'Notebook Ibm 2626','','','','',0,0),(118,'Notebook','00:21:70:D6:2A:25',0,2,15,0,0,2,'Ricado','','','','',0,1),(121,'ubuntu','00:0B:6A:C6:53:DF',0,2,115,0,0,2,'Puesto 115','','','','',0,0),(120,'asas','00:1E:EC:ED:29:36',0,2,10,0,0,3,'Ignacio','','','','',0,1),(122,'Desktop','00:0B:6A:BF:A5:EB',0,2,107,0,0,2,'Call 107','','','','',0,0),(123,'Desktop','00:0B:6A:C6:53:DF',0,0,108,20121010,0,2,'PC 8','','','','',1,1),(124,'Desktop','00:0B:6A:BE:93:79',0,0,103,20121010,0,2,'PC 3','','','','',1,0),(125,'Desktop','00:0B:6A:BF:9F:FA',0,2,106,0,0,2,'Call 106','','','','',0,0),(126,'Desktop','00:0B:6A:BF:A3:40',0,2,63,0,0,2,'Dario','','','','',0,1),(127,'Juajau','00:0B:6A:BF:A5:C1',0,2,61,0,0,2,'Jujuju','','','','',0,0),(128,'Notebook','00:90:F5:96:C9:F1',0,2,249,0,0,7,'Pablo','','','','',0,0),(129,'Desktop','00:27:0E:16:27:B3',0,2,65,0,0,2,'Marketing','','','','',0,1),(130,'asas','00:11:2F:27:E0:65',0,2,20,0,0,3,'Futura instalacion','','','','',0,1),(131,'borar','00:11:09:C4:BD:64',0,2,4,0,0,3,'Futura instalacion1','','','','',0,1),(132,'asas','00:0B:6A:BF:88:85',0,2,10,0,0,3,'Futura instalacion2','','','','',0,1),(133,'Desktop','00:27:0e:16:27:b3',0,0,71,20120618,0,8,'Manuela Gaitto','','','','',1,1),(134,'Desktop','00:0B:6A:BF:A5:C1',0,2,100,0,0,2,'Call 100','','','','',0,0),(135,'asasas','00:17:31:1F:D2:87',0,2,11,0,0,3,'Escrit onell','','','','',0,1),(136,'Desktop','00:0B:6A:BF:94:26',0,0,112,20121005,0,2,'PC12','','','','',1,1),(137,'Desktop','00:0B:6A:C6:5E:8F',0,2,121,0,0,2,'Call instalacion','','','','',0,0),(138,'Desktop','00:27:0E:16:AC:39',0,0,56,20121002,0,8,'Carlos Rodriguez','','','','',1,1),(139,'Desktop','00:0B:6A:BF:88:59',0,2,129,0,0,2,'Agente de venta 4','','','','',0,0),(140,'Gateway Gradstream','00:0B:82:11:B9:2D',0,2,225,0,0,2,'Agente de venta ','','','','',0,0),(146,'Desktop','00:19:66:76:5B:91',0,2,125,0,0,2,'Agente de venta','','','','',0,1),(141,'Desktop','00:0B:6A:C6:5E:8F',0,0,104,20120831,0,8,'PC 4','','','','',1,1),(142,'Gateway Grandstream','00:0B:82:11:B9:33',0,2,164,0,0,2,'Manuela Gaitto','','','','',0,0),(143,'Gateway Gradstream','00:0B:82:14:DC:55',0,2,162,0,0,2,'Cecilia','','','','',0,0),(144,'ubuntu','00:0B:6A:BF:A5:EB',0,2,200,0,0,2,'Recepcion Caballito','','','','',0,1),(145,'Gateway Grandstream','00:0B:82:11:B9:35',0,2,170,0,0,2,'Carlos Rodriguez','','','','default',0,0),(147,'Desktop','00:27:0E:15:9D:38',0,2,150,0,0,3,'Erika','','','','',0,1),(148,'Desktop','00:27:0E:15:9D:38',0,2,71,0,0,7,'Erika','','','','',0,1),(149,'Ubuntu','00:27:0E:15:9D:53',0,2,61,0,0,2,'Gisel','','','','',0,1),(150,'al terminal','00:19:0C:20:02:16',0,2,126,0,0,2,'Agente de venta 1','','','','',0,0),(151,'Desktop','8E:00:00:00:8E:8E',0,2,61,0,0,7,'Gisel Dalfonso','','','','',0,1),(152,'Desktop','00:08:54:11:26:3d',0,2,65,20120925,0,2,'Agustina Moreno','','','','',0,0),(153,'Desktop','00:0E:A6:A9:EF:34',0,0,115,20121005,0,2,'PC15','','','','',1,1),(154,'asasas','00:19:66:64:53:E3',0,2,147,0,0,3,'Call instalacion','','','','',0,1),(155,'Desktop','00:0B:6A:BE:93:6E',0,2,18,0,0,2,'Backup 2','','','','',0,0),(156,'Desktop','00:0B:6A:A8:A9:24',0,0,114,20121005,0,2,'PC14','','','','',1,0),(157,'Desktop','00:27:0E:1C:28:AC',0,2,63,0,0,6,'Dario Juarez','','','','',0,0),(158,'Desktop','00:11:d8:f9:fd:73',0,1,190,20121002,0,2,'Servidor caballito','','','','',0,0),(159,'Desktop','10:78:d2:8a:2a:1a',0,0,109,20120730,0,2,'PC 9','','','','',1,1),(160,'Desktop','00:1C:C0:B1:3B:F3',0,0,10,20120703,0,8,'Depilight TV','','','','',1,1),(161,'Desktop','00:0B:6A:BF:A3:40',0,0,113,20121003,0,2,'PC13','','','','',1,1),(162,'Gateway Grandstream','00:0B:82:11:B9:49',0,2,228,0,0,2,'Agente de Venta 4','','','','',0,0),(163,'Desktop','00:11:09:C4:BD:58',0,2,128,0,0,2,'Agente de venta 3','','','','',0,0),(164,'Desktop','00:19:66:46:ef:10',0,0,116,20121010,0,2,'PC16','','','','',1,1),(165,'borar cuando este todo bien','00:0B:6A:BE:93:96',0,2,135,0,0,3,'Instalacion viamonte','','','','',0,1),(166,'Desktop','00:0B:6A:BF:88:85',0,2,130,0,0,2,'Agente de venta 5','','','','',0,0),(167,'Desktop','00:0B:6A:BF:A5:CD',0,0,117,20121005,0,2,'PC17','','','','',1,0),(168,'Desktop','00:0B:6A:BF:88:85',0,0,102,20121010,0,2,'PC 2','','','','',1,0),(169,'Desktop','00:0B:6A:BF:A5:C1',0,0,106,20121010,0,2,'PC 6','','','','',1,0),(170,'Desktop','00:0B:6A:BF:88:59',0,0,101,20121010,0,2,'PC 1','','','','',1,0),(171,'Desktop','00:0B:6A:BF:9F:FA',0,2,248,0,0,3,'Recepcion nueva ','','','','',0,0),(172,'Gateway Grandstream','00:0B:82:11:B9:49',0,2,216,0,0,2,'Call 106','','','','',0,0),(173,'Desktop','00:11:09:c4:bd:58',0,0,60,20121002,0,8,'Mercedes Magallanes','','','','',1,1),(175,'Gateway Grandstream','00:0B:82:17:57:63',0,0,50,20121002,0,7,'Mercedes Magallanes','','','','',1,1),(174,'asasas','00:16:EC:5E:D2:39',0,2,13,0,0,3,'CUALQUIERA','','','','',0,1),(176,'gh','48:5B:39:A3:68:82',0,2,12,0,0,3,'Chechu','','','','',0,1),(177,'Desktop','48:5B:39:A3:67:8D',0,0,122,20121010,0,2,'PC22','','','','',1,0),(178,'Gabinete una unidad','00:16:EC:5E:D2:39',0,2,127,0,0,2,'Server Desarrollo','','','','',0,1),(179,'Gateway Grandstream','00:0B:82:11:B9:49',0,0,28,20121002,0,7,'Dario Juarez','','','','',0,1),(180,'Desktop','10:78:d2:1b:9b:c3',0,0,79,20120712,0,2,'Sala de Reuniones','','','','',1,1),(181,'Grandstream','00:0B:82:14:DC:43',0,2,67,0,0,3,'Asesora tel','','','','',0,0),(182,'Desktop','00:27:0E:2A:C4:56',0,2,241,0,0,7,'Repuesto2','','','','',0,1),(183,'as','00:08:54:a4:19:01',0,2,231,0,0,3,'Marco','','','','',0,1),(184,'Desktop','00:A1:B0:0B:2A:90',0,2,65,20120704,0,8,'Erika Mirkouski','','','','',1,1),(185,'Desktop Sonia','10:78:D2:8A:43:EF',0,0,126,20121005,0,2,'PC26','','','','',1,1),(186,'Desktop','70:71:BC:72:72:C6',0,2,3,0,0,8,'Jose Lopez','','','','',0,1),(187,'Gateway Grandstream','00:0B:82:14:DC:4F',0,0,74,20121002,0,7,'Manuela Gaitto','','','','',0,1),(188,'Desktop','48:5B:39:A3:68:82',0,0,66,20121002,0,8,'Tamara Perez','','','','',1,1),(189,'Central telefonica nueva','70:71:BC:71:98:2A',0,2,210,0,0,3,'Androide','','','','',0,1),(190,'Gotheil','1C:6F:65:4D:7E:B5',0,2,58,0,0,8,'ABELEDO','','','','',0,1),(191,'Desktop','48:5B:39:C9:D8:54',0,2,5,0,0,3,'Jose Lopez','','','','',0,1),(192,'Servidor','70:71:BC:72:72:C6',0,2,3,0,0,3,'Nuevo Vader','','','','',0,1),(198,'Notebook','00:24:54:6E:26:E2',0,0,243,0,0,2,'Sonia Toconas','','','','',0,0),(193,'OOOO','00:08:54:A4:19:01',0,2,10,0,0,8,'MARCOOOOO','','','','',0,1),(194,'VirtualBox','08:00:27:FA:81:81',0,2,23,0,0,8,'Jose Lopez','','','','',0,0),(195,'1','00:6B:58:2C:2C:55',0,2,7,0,0,8,'Camara','','','','',0,1),(196,'Desktop','00:19:66:29:8D:E6',0,0,125,20121005,0,2,'PC25','','','','',1,1),(197,'debian','00:19:21:19:3D:7E',0,2,10,0,0,3,'Nuevo Zafiro','','','','',0,1),(199,'Dell','00:25:64:70:72:a9',0,2,7,0,0,8,'Jose Lopez','','','','',0,1),(200,'Camara Seguridad 2','00:6b:58:2c:2c:55',0,0,8,0,0,8,'DVR 2','','','','',0,1),(201,'Camara Seguridad 1','00:5e:09:07:fc:0a',0,0,9,0,0,8,'DVR 1','','','','',0,1),(202,'Netbook LAN','00:26:b9:d3:27:e9',0,1,48,20121002,0,8,'Onell Lanfranco','','','','',0,0),(203,'Gateway Grandstream','00:0b:82:11:b9:23',0,2,52,0,0,8,'Onell Lanfranco','','','','',0,1),(204,'Gateway Grandstream','00:0b:82:14:dc:5c',0,2,52,0,0,8,'Onell Lanfranco','','','','',0,1),(205,'Gateway Grandstream','00:0b:82:11:b9:55',0,0,58,20121002,0,7,'Tamara Perez','','','','',0,0),(206,'Desktop','44:87:fc:ef:f1:0c',0,0,119,20121005,0,2,'PC19','','','','',1,1),(207,'Desktop','44:87:fc:ef:f3:72',0,0,110,20121002,0,2,'PC10','','','','',1,0),(208,'Desktop','44:87:fc:ef:f3:73',0,0,124,20121003,0,2,'PC24','','','','',1,1),(209,'Desktop','44:87:fc:ef:f1:e1',0,0,123,20121005,0,2,'PC23','','','','',1,0),(210,'Desktop','44:87:fc:ef:f2:b4',0,0,120,20121005,0,2,'PC20','','','','',1,1),(211,'Onell','00:40:01:2e:15:55',0,2,53,0,0,2,'PrintServer','','','','',0,0),(212,'GrandStrean','00:0b:82:14:dc:55',0,2,67,0,0,8,'Onell Lanfranco','','','','',0,0),(213,'GrandStrean','00:0b:82:11:b9:2d',0,2,52,0,0,8,'Onell Lanfranco','','','','',0,0),(214,'Linksys Wirelles','00:1c:c0:37:40:b7',0,2,54,0,0,8,'Router Onell','','','','',0,1),(215,'Router Wireless','00:25:9c:f5:ad:71',0,2,220,0,0,8,'WRT120N','','','','',0,0),(216,'Gateway Grandstream','00:0b:82:11:b9:3d',0,2,90,0,0,7,'Luciano Fazio','','','','',0,0),(217,'Gateway Grandstream','00:0b:82:11:b9:2d',0,2,201,0,0,7,'Agustina Moreno','','','','',0,0),(218,'GrandStream','00:0b:82:14:dc:5c',0,2,99,0,0,2,'Jose Lopez','','','','',0,0),(219,'Desktop','44:87:fc:ef:f0:f9',0,0,121,20120920,0,2,'PC21','','','','',1,1),(220,'Sistema Puertas','00:30:4f:79:29:f9',0,0,22,20120713,0,8,'ICS-100 Call Center','','','','',0,1),(221,'Equipo telular 8 bocas','00:03:7e:00:c4:ae',0,0,3,0,0,8,'Telular 1','','','','',0,1),(222,'Sistema Puertas','00:30:4f:79:2a:a7',0,1,22,20120713,0,8,'ICS-100 Call Center','','','','',0,1),(223,'Desktop','44:87:fc:eb:77:12',0,0,111,20120920,0,2,'PC11','','','','',1,1),(224,'Print Server','00:40:01:2e:15:55',0,0,40,20121005,0,8,'Onell Lanfranco','','','','',1,1),(225,'Desktop','44:87:fc:eb:8d:49',0,0,75,20120625,0,2,'Asesora','','','','',1,0),(226,'Desktop','44:87:fc:eb:8f:6f',0,0,144,20121002,0,7,'PC44','','','','',1,0),(227,'Gateway Grandstream','00:0b:82:14:dc:59',0,0,78,20121002,0,7,'Recepcion Vicente Lopez','','','','',0,0),(228,'Desktop','00:11:2f:87:3d:39',0,2,99,20110321,0,2,'usuario','','','','',0,0),(229,'Desktop','00:50:04:8a:cb:9f',0,2,81,20110328,0,2,'noteibm','','','','',0,0),(230,'Notebook','a4:ba:db:dd:5c:3b',0,2,130,20110404,0,2,'Agustina Moreno','','','','',0,0),(231,'Desktop','00:e0:4c:91:c0:04',0,0,57,20110407,0,8,'Backup 1','','','','',1,0),(232,'Notebook','00:24:be:eb:9f:57',0,2,7,0,0,8,'Jose Lopez','','','','',0,0),(233,'desktop','00:0b:6a:c6:5e:8f',0,2,12,20110420,0,8,'jlombardi','','','','',0,0),(234,'desktop','00:0b:6a:c6:5e:8f',0,2,132,20110420,0,2,'jlombardi','','','','',0,0),(235,'desktop','00:0b:6a:c6:5e:8f',0,2,150,20110420,0,2,'jlombardi','','','','',0,0),(236,'desktop','00:0b:6a:c6:5e:8f',0,2,72,20110420,0,2,'jlombardi','','','','',0,0),(237,'Desktop','00:0b:6a:c6:5e:8f',0,2,99,20110420,0,8,'jlombardi','','','','',0,0),(243,'Desktop','10:78:d2:8a:45:71',0,0,131,20121010,0,2,'PC31','','','','',1,0),(238,'Desktop','00:0b:6a:bf:9f:fa',0,2,99,20110427,0,2,'PC18','','','','',0,0),(239,'Desktop','00:11:2f:87:3d:39',0,2,12,20110428,0,8,'BACKUP','','','','',0,0),(240,'Servidor De Desarrollo','00:1c:c0:37:40:b7',0,2,4,0,0,8,'La Cerda','','','','',0,1),(241,'Gateway Grandstream','00:0b:82:14:dc:55',0,2,13,0,0,8,'Jose Lopez','','','','',0,0),(242,'Gateway Granstream','00:0b:82:0f:50:5c',0,2,13,0,0,7,'Jose Lopez','','','','',0,1),(269,'Desktop','10:78:d2:17:3a:85',0,0,139,20121002,0,2,'PC39','','','','',1,1),(244,'Desktop','10:78:d2:8a:2b:fe',0,0,127,20121002,0,2,'PC27','','','','',1,0),(245,'Desktop','10:78:d2:8a:79:5c',0,0,140,20121002,0,2,'PC40','','','','',1,0),(251,'Desktop','00:0B:6A:BF:A5:EB',0,0,132,20121003,0,2,'PC32','','','','',1,1),(246,'Desktop','10:78:d2:8a:44:07',0,0,128,20121002,0,2,'PC28','','','','',1,0),(247,'Desktop','10:78:d2:8a:44:e1',0,0,133,20121003,0,2,'PC33','','','','',1,1),(248,'Desktop','10:78:d2:8a:44:48',0,0,130,20121002,0,2,'PC30','','','','',1,0),(249,'Desktop','10:78:d2:8a:44:e1',0,2,31,0,0,2,'PC31','','','','',0,0),(250,'Desktop','00:0b:6a:bf:9d:71',0,0,129,20121002,0,2,'PC29','','','','',1,1),(252,'Desktop','10:78:d2:1b:9a:ca',0,0,118,20120920,0,2,'PC18','','','','',1,1),(253,'Bangho','00:90:f5:6f:ef:7f',0,2,20,0,0,8,'Usuario','','','','',0,0),(254,'Notebook LAN','00:23:5a:b4:7f:30',0,0,81,20120618,0,8,'Luciano Fazio','','','','',1,1),(255,'notebook','00:00:00:00:00:e0',0,2,80,0,0,8,'note compaq','','','','',0,1),(256,'Notebook','00:23:5a:b4:7f:30',0,2,80,0,0,8,'Guillermo Ferrari','','','','',0,0),(257,'Notebook Wireless','00:13:ce:20:4c:c3',0,1,24,20121002,0,7,'Luciano Fazio','','','','',0,1),(258,'Blackberry','3c:74:37:10:9b:67',0,2,25,0,0,8,'Jose Lopez','','','','',0,0),(259,'Notebook HP','00:26:82:05:cd:35',0,2,10,20121002,0,8,'Guillermo Ferrari','','','','',0,1),(260,'Notebook','0c:ee:e6:c5:09:6b',0,0,220,20121002,0,7,'Belen Demaio','','','','',0,0),(261,'Sony Vaio','78:dd:08:e9:cf:a8',0,0,36,20121002,0,3,'Jose Lopez','','','','',1,1),(262,'Motorola Backflip','a4:ed:4e:30:ea:2d',0,2,27,0,0,8,'Jose Lopez','','','','',0,1),(263,'Amazon Kindle','28:ef:01:5e:cc:46',0,2,34,0,0,8,'Guillermo Ferrari','','','','',0,1),(264,'Notebook','78:dd:08:be:7c:63',0,2,28,0,0,6,'Gisel Dalfonso','','','','',0,1),(265,'Desktop','00:11:09:c4:ba:e7',0,0,134,20121010,0,8,'PC34','','','','',1,0),(266,'Tablet','a0:0b:ba:18:c8:82',0,2,35,0,0,8,'Guillermo Ferrari','','','','',0,0),(288,'Virtual','52:54:00:56:c4:fb',0,2,12,0,0,3,'ObiWan','','','','',0,1),(267,'Notebook Samsung','c4:46:19:28:7b:49',0,2,39,0,0,7,'Denise Cohen','','','','',0,0),(268,'Tablet','00:e0:4c:a9:14:40',0,2,4,0,0,8,'Jose Lopez','','','','',0,1),(270,'Desktop','10:78:d2:1b:9b:c8',0,2,138,0,0,2,'pc38','','','','',0,0),(271,'Desktop','10:78:d2:1b:9b:c8',0,0,138,20120918,0,2,'PC38','','','','',1,0),(272,'Desktop','10:78:d2:1b:9b:ef',0,0,135,20121002,0,2,'PC35','','','','',1,1),(273,'Desktop','10:78:d2:1b:9b:9c',0,0,137,20121002,0,2,'PC37','','','','',1,1),(274,'Desktop','10:78:d2:1b:9b:96',0,0,136,20121002,0,2,'PC36','','','','',1,0),(275,'Blackberry Torch','e8:3e:b6:5c:11:01',0,2,18,0,0,7,'Onell Lanfranco','','','','',0,0),(276,'Sistema de backup','00:08:54:a5:f0:8c',0,2,12,0,0,8,'Backup Encore','','','','',0,0),(277,'Desktop','00:0b:6a:bf:9f:fa',0,2,131,0,0,8,'AAA','','','','',0,1),(278,'AAAA','00:0b:82:0f:50:42',0,2,18,0,0,2,'AAAA','','','','',0,0),(279,'3881','48:5B:39:C9:D8:54',0,2,14,0,0,8,'Obi Wan','','','','',0,1),(280,'3879','00:19:21:19:4d:2f',0,2,17,0,0,8,'ex homero','','','','',0,1),(281,'Switch','00:11:3b:18:87:57',0,0,4,0,0,8,'Micronet','','','','',0,1),(282,'Equipo telular 8 bocas','00:03:7e:00:7e:38',0,0,6,0,0,8,'Telular 2','','','','',0,1),(326,'Telefono','c8:aa:21:c5:74:85',0,2,130,0,0,8,'Federico Rodriguez','','','','',0,0),(283,'AAAA','e8:11:32:65:5c:2e',0,2,12,0,0,8,'AAAA','','','','',0,1),(284,'Desktop','48:5b:39:c9:d8:54',0,2,5,0,0,8,'Jose Lopez','','','','',0,1),(285,'Notebook Sony','78:dd:08:e9:b7:f6',0,2,83,20121004,0,8,'Esteban Barbaran','','','','',0,1),(286,'Notebook Sony Ethernet','00:24:be:eb:9f:57',0,0,33,20121002,0,8,'Jose Lopez','','','','',1,1),(287,'Virtual','52:54:00:00:3f:84',0,2,7,20121002,0,8,'Anakin','','','','',0,0),(289,'Virtual','52:54:00:36:ef:9e',0,2,14,20121002,0,7,'Windows XP','','','','',0,1),(290,'Desktop','00:11:d8:f9:fd:73',0,2,191,0,0,8,'Servidor caballito 2','','','','',0,1),(291,'Desktop','00:e0:52:b3:41:67',0,1,191,20121002,0,8,'Servidor caballito 2','','','','',0,0),(292,'Desktop','44:87:fc:eb:77:12',0,2,16,0,0,8,'AAA','','','','',0,0),(322,'Iconia Tab','CC:AF:78:6e:67:6d',0,2,28,20120824,0,8,'Guillermo Gerrari','','','','',0,0),(293,'gateway','00:0b:82:11:b9:3f',0,2,150,0,0,8,'telefono mariela','','','','',0,0),(294,'AAAA','00:0b:82:11:b9:3f',0,2,167,0,0,8,'AAAA','','','','',0,0),(295,'Desktop','00:19:66:64:53:e3',0,0,141,20121010,0,2,'pc41','','','','',1,0),(296,'Desktop','00:1f:c6:b5:54:af',0,2,16,0,0,8,'Jose Lopez','','','','',0,1),(297,'Desktop','00:0b:6a:bf:9f:fa',0,2,16,0,0,8,'Prueba','','','','',0,0),(298,'Desktop','00:11:09:c4:bd:64',0,0,55,20121001,0,8,'Backup 2','','','','',1,1),(299,'Kindle','28:ef:01:f5:3b:b4',0,0,23,0,0,7,'Onell Lanfranco','','','','',0,1),(300,'Kindle','f0:a2:25:7d:e8:6b',0,2,39,20120824,0,7,'Guillermo Ferrari','','','','',0,0),(301,'Desktop','00:0b:6a:bf:9f:fa',0,2,16,0,0,8,'Prueba','','','','',0,0),(302,'Iphone','60:FA:CD:6E:AD:F5',0,0,27,20121002,0,8,'Onell Lanfranco','','','','',1,1),(303,'Milestone 2','c8:aa:21:df:3c:8d',0,2,18,0,0,8,'Jose Lopez','','','','',0,1),(304,'Servidor VoIP De pruieba','00:1f:c6:b5:54:af',0,2,25,20120925,0,8,'AAA','','','','',0,0),(305,'Gateway Grandstream','00:0b:82:11:b9:5f',0,2,172,0,0,2,'Erika Mirkouski','','','','',0,0),(306,'Gateway Grandstream','00:0b:82:11:b9:5f',0,2,127,0,0,8,'Erika Mirkouski','','','','',0,0),(307,'Gateway Grandstream','00:0b:82:11:b9:5f',0,2,171,0,0,2,'Erika Mirkouski','','','','',0,0),(308,'AAA','00:0b:82:11:b9:23',0,2,28,0,0,8,'AAA','','','','',0,0),(309,'Gateway Grandstream','00:0b:82:11:b9:5f',0,2,171,0,0,8,'Erika Mirkouski','','','','',0,0),(310,'Gateway Grandstream','00:0b:82:11:b9:5f',0,2,171,0,0,8,'Erika Mirkouski','','','','',0,0),(311,'Gateway Grandstream','00:0b:82:11:b9:5f',0,2,28,0,0,7,'Erika Mirkouski','','','','',0,0),(312,'Gateway Grandstream','00:0b:82:17:57:7b',0,0,59,20120821,0,7,'Carlos Rodriguez','','','','',0,0),(313,'Gateway Grandstream','00:0b:82:14:dc:5c',0,2,127,0,0,2,'Agustina Moreno','','','','',0,0),(314,'Gateway Grandstream','00:0b:82:0f:50:42',0,2,127,0,0,8,'Agustina Moreno','','','','',0,0),(315,'Gateway Grandstream','00:0b:82:14:dc:5c',0,2,127,0,0,8,'Agustina Moreno','','','','',0,0),(316,'Gateway Grandstream','00:0b:82:14:dc:5c',0,2,143,0,0,8,'Agustina Moreno','','','','',0,0),(317,'Gateway Grandstream','00:0b:82:11:b9:23',0,2,127,0,0,8,'Agustina Moreno','','','','',0,0),(318,'Gateway Grandstream','00:0b:82:14:dc:5c',0,2,127,0,0,8,'Agustina Moreno','','','','',0,0),(319,'Gateway Grandstream','00:0b:82:14:dc:5c',0,2,127,20120807,0,7,'RRHH','','','','',0,0),(320,'Linksys wrt54g','00:1e:e5:34:b3:a8',0,2,13,0,0,8,'Router Wifi','','','','',0,0),(321,'Linksys wrt54g','00:1e:e5:34:b3:a8',0,0,7,20121002,0,8,'Router Wifi','','','','',0,1),(323,'Desktop','00:1c:c0:37:40:b7',0,0,73,20121002,0,8,'Lucia RRHH','','','','',1,1),(325,'Sony Vaio 2 W','00:0e:35:e3:28:d5',0,2,35,0,0,8,'Jose Lopez','','','','',0,1),(324,'Sony Vaio 2','08:00:46:f4:f1:95',0,2,34,0,0,8,'Jose Lopez','','','','',0,1),(327,'OOO','f0:4d:a2:4b:a1:ad',0,2,55,0,0,8,'OOO','','','','',0,0),(338,'IPhone','00:f4:b9:39:4f:e1',0,0,37,20121002,0,8,'Jose Lopez','','','','',1,1),(328,'OOO','f0:4d:a2:4b:a1:ad',0,2,53,0,0,8,'OOO','','','','',0,1),(329,'Desktop','00:0b:82:11:b9:2d',0,2,14,0,0,8,'Backup 3','','','','',0,0),(330,'Desktop','00:0b:6a:bf:a3:3f',0,0,67,20121002,0,8,'Backup 3','','','','',1,0),(331,'Gateway Grandstream','00:0b:82:11:b9:35',0,0,72,20121002,0,8,'Onell Lanfranco','','','','',1,1),(332,'BBB','80:ee:73:22:8a:78',0,2,12,0,0,8,'BBB','','','','',0,0),(333,'TEST JL','00:23:5a:53:ae:76',0,2,43,0,0,3,'TEST JL','','','','',0,1),(334,'servidor 3880','00:0b:82:11:b9:2d',0,2,16,0,0,8,'AAA','','','','',0,1),(335,'servidor 3880','70:71:bc:72:72:c6',0,0,12,20120925,0,8,'servidor','','','','',1,1),(336,'TEST JL2','00:e0:4c:53:44:58',0,2,47,0,0,8,'TEST JL2','','','','',0,1),(337,'Temporal','c0:cb:38:0a:a2:27',0,2,16,0,0,8,'Flor','','','','',0,0),(339,'Desktop','48:5b:39:c9:d8:54',0,0,21,20121002,0,8,'Dario Juarez','','','','',1,1),(340,'Notebook','0c:ee:e6:d0:b4:7d',0,0,41,20121005,0,8,'RC','','','','',1,1),(341,'Desktop','00:0b:6a:c6:54:05',0,0,142,20120816,0,2,'pc42','','','','',1,0),(342,'Kindle','28:ef:01:bd:84:53',0,0,25,20121005,0,8,'Jose Lopez','','','','',1,1),(343,'Desktop','00:0b:6a:bf:a7:71',0,0,143,20120625,0,8,'pc43','','','','',1,0),(344,'servidor 3879','00:19:21:19:4d:2f',0,1,56,20120925,0,8,'Futuro zafiro','','','','',0,1),(345,'Gateway Grandstream','00:0b:82:11:b9:3d',0,2,29,0,0,8,'RRHH','','','','',0,1),(346,'Gateway Grandstream','00:0b:82:11:b9:2d',0,2,29,0,0,8,'RRHH','','','','',0,0),(347,'ssss','00:0b:82:11:b9:2d',0,2,34,0,0,8,'ssss','','','','',0,0),(348,'Gateway Grandstream','00:0b:82:11:b9:2d',0,0,80,20121002,0,7,'Sala de Reuniones','','','','',1,1),(349,'Gateway Grandstream','00:0b:82:11:b9:23',0,2,29,20120618,0,7,'Onell Lanfranco','','','','',1,1),(350,'Notebook','00:23:5a:b4:7f:30',0,2,34,20120627,0,8,'Manuela Gaitto','','','','',1,1),(351,'OOO','00:11:11:77:4b:75',0,2,42,20120629,0,8,'OOO','','','','',0,0),(352,'Temporal','00:1c:c0:b1:3b:f3',0,2,11,20120703,0,8,'Onell','','','','',0,1),(353,'Desktop','00:80:ad:b0:4c:47',0,0,19,20120705,0,8,'Backup 4','','','','',1,0),(354,'Gateway Grandstream','00:0b:82:11:b9:3d',0,2,38,20120711,0,8,'RRHH','','','','',0,0),(355,'Gateway Grandstream','00:0b:82:11:b9:3f',0,2,127,20120807,0,8,'Asesora Vte Lopez 2','','','','',0,0),(356,'Gateway Grandstream','00:0b:82:11:b9:3d',0,2,127,20120807,0,8,'Asesora Vte Lopez 2','','','','',0,1),(357,'EEE','10:78:d2:01:d8:c9',0,2,21,20120810,0,8,'EEE','','','','',0,1),(358,'Notebook','f0:de:f1:87:cb:2c',0,0,62,20120821,0,8,'Hector Pousa','','','','',1,1),(359,'Gateway Grandstream','00:0b:82:11:b9:3f',0,0,63,20120821,0,8,'Hector Pousa','','','','',1,1),(360,'Gateway Grandstream','00:0b:82:11:b9:23',0,2,37,20120821,0,8,'Erika Mirkouski','','','','',0,1),(361,'Gateway Grandstream','00:0b:82:11:b9:3d',0,2,37,20120821,0,8,'Erika Mirkouski','','','','',0,1),(362,'Gateway Grandstream','00:0b:82:11:b9:3d',0,2,80,20120821,0,8,'Erika Mirkouski','','','','',0,0),(363,'Gateway Grandstream','00:0b:82:11:b9:3d',0,2,37,20120821,0,8,'Erika Mirkouski','','','','',0,0),(364,'Gateway Grandstream','00:0b:82:11:b9:3d',0,0,68,20120821,0,7,'Erika Mirkouski','','','','',0,1),(365,'Desktop','00:0b:6a:bf:79:6d',0,0,145,20120905,0,2,'pc45','','','','',1,0),(366,'Netbook LAN','2c:76:8a:df:23:5d',0,0,76,20120927,0,8,'Alfonsina Ricotti','','','','',1,1),(367,'Netbook','2c:76:8a:da:c8:da',0,0,53,20120927,0,8,'Florencia Svirsky','','','','',0,0),(368,'Cisco Linksys wrt120n','00:25:9c:f5:ad:71',0,0,11,20121003,0,8,'Router Wireless Vte.Lopez','','','','',0,1),(369,'Cisco Linksys wrt120n','00:25:9c:f5:ad:70',0,2,12,20121003,0,8,'Router Wireless Vte.Lopez','','','','',0,1),(370,'Router Wireless 2','00:25:9c:f5:ad:70',0,0,5,20121003,0,2,'WiFi Vicente Lopez','','','','',0,0),(371,'Celular','04:18:0f:3a:a5:6d',0,0,18,20121003,0,2,'Luciano Fazio','','','','',1,1),(372,'Netbook HP mini','e0:2a:82:e5:0e:46',0,0,70,20121003,0,2,'Alfonsina Ricotti','','','','',1,0),(373,'prueba Lucho','88:ae:1d:dc:6d:f6',0,2,12,20121003,0,8,'AAA','','','','',0,0),(388,'Notebook Kanji','c8:9c:dc:10:00:6c',0,0,77,20130214,0,2,'Carlos Rodriguez','','','','',0,0),(374,'Desktop ','00:27:0e:15:9d:38',0,0,61,20121015,0,2,'Erika','','','','',1,1),(375,'Servidor','00:19:21:19:3d:7e',0,0,13,20121102,0,8,'Zafiro Backup','','','','',0,1),(376,'AAA','00:25:22:84:63:cd',0,2,14,20121106,0,2,'AAA','','','','',0,1),(377,'wrt54g v8','00:1a:70:46:21:b3',0,0,15,20121107,0,8,'Router Linksys Wifi','','','','',0,1),(378,'Notebook nueva','00:24:e8:84:06:21',0,0,16,20121108,0,8,'Onell Lanfranco','','','','',0,1),(379,'Netbook','48:5d:60:dc:7d:37',0,0,24,20121109,0,8,'Dario Juarez','','','','',0,1),(380,'TP-LINK tl-mr3420','54:e6:fc:bc:1e:39',0,0,17,20121120,0,8,'Router wi-fi','','','','',0,1),(381,'AAA','e8:03:9a:58:8f:ce',0,2,26,20121121,0,8,'AAA','','','','',0,1),(382,'AAA','80:c1:6e:5a:c7:84',0,2,14,20121129,0,8,'AAA','','','','',0,1),(383,'PowerBook G4','00:0d:93:c8:a0:88',0,0,31,20121130,0,2,'Jose Lopez','','','','',0,1),(384,'Desktop','00:0b:6a:bf:9f:fa',0,0,146,20121203,0,2,'PC46','','','','',1,0),(385,'TEMPORAL','00:1a:97:01:10:17',0,0,47,20121211,0,3,'Camara WIRELESS Bill','','','','',0,1),(386,'AAA','00:19:0c:20:85:62',0,2,14,20121211,0,8,'AAA','','','','',0,1),(387,'Gateway Grandstream','00:0b:82:14:dc:4f',0,2,77,20121226,0,8,'Manuela Gaitto','','','','',0,1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracion`
--

DROP TABLE IF EXISTS `configuracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuracion` (
  `configuracioncliente` varchar(45) DEFAULT NULL,
  `configuracionprioctpri` int(10) unsigned NOT NULL DEFAULT '0',
  `configuracionsegoctpri` int(10) unsigned NOT NULL DEFAULT '0',
  `configuracionteroctpri` int(10) unsigned NOT NULL DEFAULT '0',
  `configuracionbitred` int(10) unsigned NOT NULL DEFAULT '0',
  `configuraciondevpri` varchar(45) NOT NULL DEFAULT '',
  `configuraciondevpub` varchar(45) NOT NULL DEFAULT '',
  `configuracionprioctpub` int(10) unsigned NOT NULL DEFAULT '0',
  `configuracionsegoctpub` int(10) unsigned NOT NULL DEFAULT '0',
  `configuracionteroctpub` int(10) unsigned NOT NULL DEFAULT '0',
  `configuracioncuaoctpub` int(10) unsigned NOT NULL DEFAULT '0',
  `configuracioncuaoctpri` int(10) unsigned NOT NULL DEFAULT '0',
  `configuraciondnspri` varchar(45) NOT NULL DEFAULT '',
  `configuraciondnssec` varchar(45) NOT NULL DEFAULT '',
  `configuraciondnster` varchar(45) NOT NULL DEFAULT '',
  `configuracionextpin` int(10) unsigned NOT NULL DEFAULT '1',
  `configuracionintpin` int(10) unsigned NOT NULL DEFAULT '1',
  `configuracionadsusu` varchar(45) NOT NULL DEFAULT '',
  `configuracionadspas` varchar(45) NOT NULL DEFAULT '',
  `configuraciondevenm` varchar(45) NOT NULL DEFAULT '',
  `configuraciongw` varchar(15) DEFAULT NULL,
  `configuracionbw` int(10) unsigned DEFAULT '0',
  `configuracionmax` int(11) DEFAULT NULL,
  `configuracionocu` int(11) DEFAULT NULL,
  `configuracionacc` int(11) DEFAULT NULL,
  `configuracionocuoct` int(11) DEFAULT NULL,
  `wanbroadcast` char(15) DEFAULT NULL,
  `wannetwork` char(15) DEFAULT NULL,
  `lanbroadcast` char(15) DEFAULT NULL,
  `lannetwork` char(15) DEFAULT NULL,
  `configuracionwanmask` char(15) DEFAULT NULL,
  `configuracionlanmask` char(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracion`
--

LOCK TABLES `configuracion` WRITE;
/*!40000 ALTER TABLE `configuracion` DISABLE KEYS */;
INSERT INTO `configuracion` VALUES ('Florida',172,16,50,24,'eth0','eth1',200,61,168,217,38,'200.69.193.2','200.69.193.1','200.69.193.3',0,0,'','','eth1','200.61.168.218',64,240,0,0,0,'200.61.168.219','200.61.168.216','172.16.50.255','172.16.50.0','255.255.255.252','255.255.255.0');
/*!40000 ALTER TABLE `configuracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filtros`
--

DROP TABLE IF EXISTS `filtros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filtros` (
  `id` int(11) DEFAULT NULL,
  `nombre` char(255) DEFAULT NULL,
  `tipo` char(10) DEFAULT NULL,
  `ipsource` char(15) DEFAULT NULL,
  `ipdestino` char(15) DEFAULT NULL,
  `puertosource` char(255) DEFAULT NULL,
  `puertodestino` char(255) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `interfaceentrada` char(20) DEFAULT NULL,
  `interfacesalida` char(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filtros`
--

LOCK TABLES `filtros` WRITE;
/*!40000 ALTER TABLE `filtros` DISABLE KEYS */;
INSERT INTO `filtros` VALUES (1,'FIltro P2P','TCP','172.16.50.1','190.2.45.229','1863-1000','',2,'eth0','eth0'),(2,'caca','UDP','192.168.10.1','0.0.0.0','','',2,'eth0','eth1');
/*!40000 ALTER TABLE `filtros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firewall`
--

DROP TABLE IF EXISTS `firewall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `firewall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comando` char(255) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `comentario` char(255) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firewall`
--

LOCK TABLES `firewall` WRITE;
/*!40000 ALTER TABLE `firewall` DISABLE KEYS */;
INSERT INTO `firewall` VALUES (1,'23',2,'acaca',1),(2,'-A INPUT -p tcp --dport 3784 -j ACCEPT',2,'Ventrilo',1),(3,'-A OUTPUT -p tcp --sport 3784 -j ACCEPT',2,'Ventrilo Out',2),(4,'iptables -A INPUT -p udp --dport 3784 -j ACCEPT',2,'Ventrilo IN UDP',3),(5,'iptables iptables -A OUTPUT -p udp --sport 3784 -j ACCEPT',2,'Ventrilo OUT UDP',4),(6,'-A FORWARD -s 172.16.50.1 -j LOG --log-prefix \'JOE-------\'',2,'probando',1),(7,'-A INPUT -s 201.216.237.165 -p tcp --sport 800 -j ACCEPT',0,'AGA',2),(8,'-A OUTPUT -d 201.216.237.165 -p tcp --dport 800 -j ACCEPT',0,'AGA',2),(9,'-t nat -A PREROUTING -p tcp --dport 8923 -j DNAT --to 172.16.0.4:22',2,'SSH a la cerda',1),(10,'-A OUTPUT -p 443 -d sps.decidir.com -j ACCEPT',2,'SPS',4),(11,'-A FORWARD -d sps.decidir.com -j ACCEPT',2,'SPS OUT',6),(12,'-A FORWARD -s sps.decidir.com -j ACCEPT',2,'SPS IN',7),(13,'-A FORWARD -d 200.80.194.18 -p udp -j ACCEPT',0,'DNS SPS 1/4',5),(14,'-A FORWARD -s 200.80.194.18 -p udp -j ACCEPT',0,'DNS SPS 2/4',5),(15,'-A FORWARD -d 200.80.194.18 -p tcp -j ACCEPT',0,'DNS SPS 3/4',5),(16,'-A FORWARD -s 200.80.194.18 -p tcp -j ACCEPT',0,'DNS SPS 4/4',5),(17,'-P INPUT ACCEPT',2,'FIX TEMPORAL',0),(18,'-P OUTPUT ACCEPT',2,'FIX TEMPORAL 2',0),(19,'-A FORWARD -d 200.69.248.13 -j ACCEPT',0,'sps.decidir.com IP 1 OUT',1),(20,'-A FORWARD -s 200.69.248.13 -j ACCEPT',0,'sps.decidir.com IP 1 IN',1),(21,'-A FORWARD -s 190.221.46.236 -j ACCEPT',0,'sps.decidir.com IP 2 IN',1),(22,'-A FORWARD -d 190.221.46.236 -j ACCEPT',0,'sps.decidir.com IP 2 OUT',1),(23,'-A FORWARD -s 200.80.195.18 -p udp -j ACCEPT',0,'DNS SPS 5/6',7),(24,'-A FORWARD -d 200.80.195.18 -p udp -j ACCEPT',0,'DNS SPS 6/6',7),(25,'-A FORWARD -d 190.221.46.236 -j ACCEPT',0,'SPS IP2 OUT',1),(26,'-A OUTPUT -o eth0 -p tcp --sport 3128 -j ACCEPT',0,'PROXY OUT',10),(27,'-A INPUT -i eth0 -p tcp --dport 3128 -j ACCEPT',0,'PROXY IN',10),(28,'-A FORWARD -d 190.2.45.229 -j ACCEPT',0,'www.depilight.com/O',10),(29,'-A FORWARD -s 190.2.45.229 -j ACCEPT',0,'www.depilight.com/I',10),(30,'-t nat -A PREROUTING -i eth0 -p tcp --dport 80 -s 172.16.0.33 -j REDIRECT --to-port 3128',1,'LUCHO PROXY TEST',9),(31,'-A OUTPUT -o eth1 -p tcp --sport 3128 -j ACCEPT',2,'DAN PROXY OUT',15),(32,'-A INPUT -i eth1 -p tcp --dport 3128 -j ACCEPT',2,'DAN PROXY IN',15);
/*!40000 ALTER TABLE `firewall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forwardeos`
--

DROP TABLE IF EXISTS `forwardeos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forwardeos` (
  `forwardeosid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `forwardeospuesrc` int(10) unsigned NOT NULL DEFAULT '0',
  `forwardeospuedst` int(10) unsigned NOT NULL DEFAULT '0',
  `forwardeosipdst` varchar(45) NOT NULL DEFAULT '',
  `forwardeosest` int(10) unsigned NOT NULL DEFAULT '0',
  `forwardeosipsrc` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`forwardeosid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forwardeos`
--

LOCK TABLES `forwardeos` WRITE;
/*!40000 ALTER TABLE `forwardeos` DISABLE KEYS */;
INSERT INTO `forwardeos` VALUES (3,8945,22,'172.16.45.2',2,'0.0.0.0'),(4,8946,22,'172.16.45.2',2,'190.55.122.129'),(5,8947,80,'172.16.45.2',2,'190.55.122.129'),(6,8948,443,'172.16.45.2',2,'190.55.122.129'),(7,8949,80,'172.16.45.2',2,'190.190.176.45'),(8,9856,80,'172.16.0.37',2,'0.0.0.0');
/*!40000 ALTER TABLE `forwardeos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interfacesvirtuales`
--

DROP TABLE IF EXISTS `interfacesvirtuales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interfacesvirtuales` (
  `interfacesvirtualesint` varchar(7) DEFAULT NULL,
  `interfacesvirtualesest` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interfacesvirtuales`
--

LOCK TABLES `interfacesvirtuales` WRITE;
/*!40000 ALTER TABLE `interfacesvirtuales` DISABLE KEYS */;
INSERT INTO `interfacesvirtuales` VALUES ('eth3',0),('eth4',0),('eth5',0),('eth6',0),('eth7',0),('eth8',0),('eth9',0),('eth10',1),('eth11',0),('eth12',0),('eth13',0),('eth14',0),('eth15',0),('eth16',0),('eth17',0),('eth18',0),('eth19',0),('eth20',0),('eth21',0),('eth22',0),('eth23',0),('eth24',0),('eth25',0),('eth26',0),('eth27',0),('eth28',0),('eth29',0),('eth30',0),('eth31',0),('eth32',0),('eth33',0),('eth34',0),('eth35',0),('eth36',0),('eth37',0),('eth38',0),('eth39',0),('eth40',0),('eth41',0),('eth42',0),('eth43',0),('eth44',0),('eth45',0),('eth46',0),('eth47',0),('eth48',0),('eth49',0),('eth50',0),('eth51',0),('eth52',0),('eth53',0),('eth54',0),('eth55',0),('eth56',0),('eth57',0),('eth58',0),('eth59',0),('eth60',0),('eth61',0),('eth62',0),('eth63',0),('eth64',0),('eth65',0),('eth66',0),('eth67',0),('eth68',0),('eth69',0),('eth70',0),('eth71',0),('eth72',0),('eth73',0),('eth74',0),('eth75',0),('eth76',0),('eth77',0),('eth78',0),('eth79',0),('eth80',0),('eth81',0),('eth82',0),('eth83',0),('eth84',0),('eth85',0),('eth86',0),('eth87',0),('eth88',0),('eth89',0),('eth90',0),('eth91',0),('eth92',0),('eth93',0),('eth94',0),('eth95',0),('eth96',0),('eth97',0),('eth98',0),('eth99',0),('eth100',0),('eth101',0),('eth102',0),('eth103',0),('eth104',0),('eth105',0),('eth106',0),('eth107',0),('eth108',0),('eth109',0),('eth110',0),('eth111',0),('eth112',0),('eth113',0),('eth114',0),('eth115',0),('eth116',0),('eth117',0),('eth118',0),('eth119',0),('eth120',0),('eth121',0),('eth122',0),('eth123',0),('eth124',0),('eth125',0),('eth126',0),('eth127',0),('eth128',0),('eth129',0),('eth130',0),('eth131',0),('eth132',0),('eth133',0),('eth134',0),('eth135',0),('eth136',0),('eth137',0),('eth138',0),('eth139',0),('eth140',0),('eth141',0),('eth142',0),('eth143',0),('eth144',0),('eth145',0),('eth146',0),('eth147',0),('eth148',0),('eth149',0),('eth150',0),('eth151',0),('eth152',0),('eth153',0),('eth154',0),('eth155',0),('eth156',0),('eth157',0),('eth158',0),('eth159',0),('eth160',0),('eth161',0),('eth162',0),('eth163',0),('eth164',0),('eth165',0),('eth166',0),('eth167',0),('eth168',0),('eth169',0),('eth170',0),('eth171',0),('eth172',0),('eth173',0),('eth174',0),('eth175',0),('eth176',0),('eth177',0),('eth178',0),('eth179',0),('eth180',0),('eth181',0),('eth182',0),('eth183',0),('eth184',0),('eth185',0),('eth186',0),('eth187',0),('eth188',0),('eth189',0),('eth190',0),('eth191',0),('eth192',0),('eth193',0),('eth194',0),('eth195',0),('eth196',0),('eth197',0),('eth198',0),('eth199',0),('eth200',0),('eth201',0),('eth202',0),('eth203',0),('eth204',0),('eth205',0),('eth206',0),('eth207',0),('eth208',0),('eth209',0),('eth210',0),('eth211',0),('eth212',0),('eth213',0),('eth214',0),('eth215',0),('eth216',0),('eth217',0),('eth218',0),('eth219',0),('eth220',0),('eth221',0),('eth222',0),('eth223',0),('eth224',0),('eth225',0),('eth226',0),('eth227',0),('eth228',0),('eth229',0),('eth230',0),('eth231',0),('eth232',0),('eth233',0),('eth234',0),('eth235',0),('eth236',0),('eth237',0),('eth238',0),('eth239',0),('eth240',0),('eth241',0),('eth242',0),('eth243',0),('eth244',0),('eth245',0),('eth246',0),('eth247',0),('eth248',0),('eth249',0),('eth250',0),('eth251',0),('eth252',0),('eth253',0),('eth254',0);
/*!40000 ALTER TABLE `interfacesvirtuales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ips`
--

DROP TABLE IF EXISTS `ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ips` (
  `ip` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ips`
--

LOCK TABLES `ips` WRITE;
/*!40000 ALTER TABLE `ips` DISABLE KEYS */;
INSERT INTO `ips` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),(63),(64),(65),(66),(67),(68),(69),(70),(71),(72),(73),(74),(75),(76),(77),(78),(79),(80),(81),(82),(83),(84),(85),(86),(87),(88),(89),(90),(91),(92),(93),(94),(95),(96),(97),(98),(99),(100),(101),(102),(103),(104),(105),(106),(107),(108),(109),(110),(111),(112),(113),(114),(115),(116),(117),(118),(119),(120),(121),(122),(123),(124),(125),(126),(127),(128),(129),(130),(131),(132),(133),(134),(135),(136),(137),(138),(139),(140),(141),(142),(143),(144),(145),(146),(147),(148),(149),(150),(151),(152),(153),(154),(155),(156),(157),(158),(159),(160),(161),(162),(163),(164),(165),(166),(167),(168),(169),(170),(171),(172),(173),(174),(175),(176),(177),(178),(179),(180),(181),(182),(183),(184),(185),(186),(187),(188),(189),(190),(191),(192),(193),(194),(195),(196),(197),(198),(199),(200),(201),(202),(203),(204),(205),(206),(207),(208),(209),(210),(211),(212),(213),(214),(215),(216),(217),(218),(219),(220),(221),(222),(223),(224),(225),(226),(227),(228),(229),(230),(231),(232),(233),(234),(235),(236),(237),(238),(239),(240),(241),(242),(243),(244),(245),(246),(247),(248),(249),(250),(251),(252),(253),(254);
/*!40000 ALTER TABLE `ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipsfijas`
--

DROP TABLE IF EXISTS `ipsfijas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipsfijas` (
  `ipsfijasid` int(10) unsigned NOT NULL DEFAULT '0',
  `ipsfijasip` varchar(45) NOT NULL DEFAULT '',
  `ipsfijasest` int(10) unsigned NOT NULL DEFAULT '0',
  `ipsfijascli` int(10) unsigned NOT NULL DEFAULT '0',
  `ipsfijasint` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`ipsfijasid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipsfijas`
--

LOCK TABLES `ipsfijas` WRITE;
/*!40000 ALTER TABLE `ipsfijas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipsfijas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipspublicas`
--

DROP TABLE IF EXISTS `ipspublicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipspublicas` (
  `ipspublicasid` int(11) DEFAULT NULL,
  `ipspublicasip` char(10) DEFAULT NULL,
  `ipspublicasest` int(11) DEFAULT NULL,
  `ipspublicasint` char(5) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipspublicas`
--

LOCK TABLES `ipspublicas` WRITE;
/*!40000 ALTER TABLE `ipspublicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipspublicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivelesusuario`
--

DROP TABLE IF EXISTS `nivelesusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nivelesusuario` (
  `nivelesusuarioid` int(11) DEFAULT NULL,
  `nivelesusuarionom` char(45) DEFAULT NULL,
  `nivelesusuarioest` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivelesusuario`
--

LOCK TABLES `nivelesusuario` WRITE;
/*!40000 ALTER TABLE `nivelesusuario` DISABLE KEYS */;
INSERT INTO `nivelesusuario` VALUES (1,'Administrador',0),(2,'Operador',0),(3,'Usuario',0);
/*!40000 ALTER TABLE `nivelesusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planes`
--

DROP TABLE IF EXISTS `planes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planes` (
  `planesid` int(10) unsigned NOT NULL DEFAULT '0',
  `planesdia` int(10) unsigned NOT NULL DEFAULT '0',
  `planeshor` int(10) unsigned NOT NULL DEFAULT '0',
  `planescan` int(10) unsigned NOT NULL DEFAULT '0',
  `planesest` int(10) unsigned NOT NULL DEFAULT '0',
  `planesnom` varchar(45) NOT NULL DEFAULT '',
  `valor` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planes`
--

LOCK TABLES `planes` WRITE;
/*!40000 ALTER TABLE `planes` DISABLE KEYS */;
INSERT INTO `planes` VALUES (4,4,23,5,2,'123123',0),(4,3,23,5,2,'123123',0),(4,2,23,5,2,'123123',0),(4,1,23,5,2,'123123',0),(4,7,22,5,2,'123123',0),(4,6,22,5,2,'123123',0),(4,5,22,5,2,'123123',0),(4,4,22,5,2,'123123',0),(4,3,22,5,2,'123123',0),(4,2,22,5,2,'123123',0),(4,1,22,5,2,'123123',0),(4,7,21,5,2,'123123',0),(4,6,21,5,2,'123123',0),(4,5,21,5,2,'123123',0),(4,4,21,5,2,'123123',0),(4,3,21,5,2,'123123',0),(4,2,21,5,2,'123123',0),(4,1,21,5,2,'123123',0),(4,7,20,5,2,'123123',0),(4,6,20,5,2,'123123',0),(4,5,20,5,2,'123123',0),(4,4,20,5,2,'123123',0),(4,3,20,5,2,'123123',0),(4,2,20,5,2,'123123',0),(4,1,20,5,2,'123123',0),(4,7,19,5,2,'123123',0),(4,6,19,5,2,'123123',0),(4,5,19,5,2,'123123',0),(4,4,19,5,2,'123123',0),(4,3,19,5,2,'123123',0),(4,2,19,5,2,'123123',0),(4,1,19,5,2,'123123',0),(4,7,18,5,2,'123123',0),(4,6,18,5,2,'123123',0),(4,5,18,5,2,'123123',0),(4,4,18,5,2,'123123',0),(4,3,18,5,2,'123123',0),(4,2,18,5,2,'123123',0),(4,1,18,5,2,'123123',0),(4,7,17,5,2,'123123',0),(4,6,17,5,2,'123123',0),(4,5,17,5,2,'123123',0),(4,4,17,5,2,'123123',0),(4,3,17,5,2,'123123',0),(4,2,17,5,2,'123123',0),(4,1,17,5,2,'123123',0),(4,7,16,5,2,'123123',0),(4,6,16,5,2,'123123',0),(4,5,16,5,2,'123123',0),(4,4,16,5,2,'123123',0),(4,3,16,5,2,'123123',0),(4,2,16,5,2,'123123',0),(4,1,16,5,2,'123123',0),(4,7,15,5,2,'123123',0),(4,6,15,5,2,'123123',0),(4,5,15,5,2,'123123',0),(4,4,15,5,2,'123123',0),(4,3,15,5,2,'123123',0),(4,2,15,5,2,'123123',0),(4,1,15,5,2,'123123',0),(4,7,14,5,2,'123123',0),(4,6,14,5,2,'123123',0),(4,5,14,5,2,'123123',0),(4,4,14,5,2,'123123',0),(4,3,14,5,2,'123123',0),(4,2,14,5,2,'123123',0),(4,1,14,5,2,'123123',0),(4,7,13,5,2,'123123',0),(4,6,13,5,2,'123123',0),(4,5,13,5,2,'123123',0),(4,4,13,5,2,'123123',0),(4,3,13,5,2,'123123',0),(4,2,13,5,2,'123123',0),(4,1,13,5,2,'123123',0),(4,7,12,5,2,'123123',0),(4,6,12,5,2,'123123',0),(4,5,12,5,2,'123123',0),(4,4,12,5,2,'123123',0),(4,3,12,5,2,'123123',0),(4,2,12,5,2,'123123',0),(4,1,12,5,2,'123123',0),(4,7,11,5,2,'123123',0),(4,6,11,5,2,'123123',0),(4,5,11,5,2,'123123',0),(4,4,11,5,2,'123123',0),(4,3,11,5,2,'123123',0),(4,2,11,5,2,'123123',0),(4,1,11,5,2,'123123',0),(4,7,10,5,2,'123123',0),(4,6,10,5,2,'123123',0),(4,5,10,5,2,'123123',0),(4,4,10,5,2,'123123',0),(4,3,10,5,2,'123123',0),(4,2,10,5,2,'123123',0),(4,1,10,5,2,'123123',0),(4,7,9,5,2,'123123',0),(4,6,9,5,2,'123123',0),(4,5,9,5,2,'123123',0),(4,4,9,5,2,'123123',0),(4,3,9,5,2,'123123',0),(4,2,9,5,2,'123123',0),(4,1,9,5,2,'123123',0),(4,7,8,5,2,'123123',0),(4,6,8,5,2,'123123',0),(4,5,8,5,2,'123123',0),(4,4,8,5,2,'123123',0),(4,3,8,5,2,'123123',0),(4,2,8,5,2,'123123',0),(4,1,8,5,2,'123123',0),(4,7,7,5,2,'123123',0),(4,6,7,5,2,'123123',0),(4,5,7,5,2,'123123',0),(4,4,7,5,2,'123123',0),(4,3,7,5,2,'123123',0),(4,2,7,5,2,'123123',0),(4,1,7,5,2,'123123',0),(4,7,6,5,2,'123123',0),(4,6,6,5,2,'123123',0),(4,5,6,5,2,'123123',0),(4,4,6,5,2,'123123',0),(4,3,6,5,2,'123123',0),(4,2,6,5,2,'123123',0),(4,1,6,5,2,'123123',0),(4,7,5,5,2,'123123',0),(4,6,5,5,2,'123123',0),(4,5,5,5,2,'123123',0),(4,4,5,5,2,'123123',0),(4,3,5,5,2,'123123',0),(4,2,5,5,2,'123123',0),(4,1,5,5,2,'123123',0),(4,7,4,5,2,'123123',0),(4,6,4,5,2,'123123',0),(4,5,4,5,2,'123123',0),(4,4,4,5,2,'123123',0),(4,3,4,5,2,'123123',0),(4,2,4,5,2,'123123',0),(4,1,4,5,2,'123123',0),(4,7,3,5,2,'123123',0),(4,6,3,5,2,'123123',0),(4,5,3,5,2,'123123',0),(4,4,3,5,2,'123123',0),(4,3,3,5,2,'123123',0),(4,2,3,5,2,'123123',0),(4,1,3,5,2,'123123',0),(4,7,2,5,2,'123123',0),(4,6,2,5,2,'123123',0),(4,5,2,5,2,'123123',0),(4,4,2,5,2,'123123',0),(4,3,2,5,2,'123123',0),(4,2,2,5,2,'123123',0),(4,1,2,5,2,'123123',0),(4,7,1,5,2,'123123',0),(4,6,1,5,2,'123123',0),(4,5,1,5,2,'123123',0),(4,4,1,5,2,'123123',0),(4,3,1,5,2,'123123',0),(4,2,1,5,2,'123123',0),(4,1,1,5,2,'123123',0),(4,7,0,5,2,'123123',0),(4,6,0,5,2,'123123',0),(4,5,0,5,2,'123123',0),(4,4,0,5,2,'123123',0),(4,3,0,5,2,'123123',0),(4,2,0,5,2,'123123',0),(4,1,0,5,2,'123123',0),(2,1,0,1,0,'CALL CENTER',0),(2,2,0,1,0,'CALL CENTER',0),(2,3,0,1,0,'CALL CENTER',0),(2,4,0,1,0,'CALL CENTER',0),(2,5,0,1,0,'CALL CENTER',0),(2,6,0,1,0,'CALL CENTER',0),(2,7,0,1,0,'CALL CENTER',0),(2,1,1,1,0,'CALL CENTER',0),(2,2,1,1,0,'CALL CENTER',0),(2,3,1,1,0,'CALL CENTER',0),(2,4,1,1,0,'CALL CENTER',0),(2,5,1,1,0,'CALL CENTER',0),(2,6,1,1,0,'CALL CENTER',0),(2,7,1,1,0,'CALL CENTER',0),(2,1,2,1,0,'CALL CENTER',0),(2,2,2,1,0,'CALL CENTER',0),(2,3,2,1,0,'CALL CENTER',0),(2,4,2,1,0,'CALL CENTER',0),(2,5,2,1,0,'CALL CENTER',0),(2,6,2,1,0,'CALL CENTER',0),(2,7,2,1,0,'CALL CENTER',0),(2,1,3,1,0,'CALL CENTER',0),(2,2,3,1,0,'CALL CENTER',0),(2,3,3,1,0,'CALL CENTER',0),(2,4,3,1,0,'CALL CENTER',0),(2,5,3,1,0,'CALL CENTER',0),(2,6,3,1,0,'CALL CENTER',0),(2,7,3,1,0,'CALL CENTER',0),(2,1,4,1,0,'CALL CENTER',0),(2,2,4,1,0,'CALL CENTER',0),(2,3,4,1,0,'CALL CENTER',0),(2,4,4,1,0,'CALL CENTER',0),(2,5,4,1,0,'CALL CENTER',0),(2,6,4,1,0,'CALL CENTER',0),(2,7,4,1,0,'CALL CENTER',0),(2,1,5,1,0,'CALL CENTER',0),(2,2,5,1,0,'CALL CENTER',0),(2,3,5,1,0,'CALL CENTER',0),(2,4,5,1,0,'CALL CENTER',0),(2,5,5,1,0,'CALL CENTER',0),(2,6,5,1,0,'CALL CENTER',0),(2,7,5,1,0,'CALL CENTER',0),(2,1,6,1,0,'CALL CENTER',0),(2,2,6,1,0,'CALL CENTER',0),(2,3,6,1,0,'CALL CENTER',0),(2,4,6,1,0,'CALL CENTER',0),(2,5,6,1,0,'CALL CENTER',0),(2,6,6,1,0,'CALL CENTER',0),(2,7,6,1,0,'CALL CENTER',0),(2,1,7,1,0,'CALL CENTER',0),(2,2,7,1,0,'CALL CENTER',0),(2,3,7,1,0,'CALL CENTER',0),(2,4,7,1,0,'CALL CENTER',0),(2,5,7,1,0,'CALL CENTER',0),(2,6,7,1,0,'CALL CENTER',0),(2,7,7,1,0,'CALL CENTER',0),(2,1,8,1,0,'CALL CENTER',0),(2,2,8,1,0,'CALL CENTER',0),(2,3,8,1,0,'CALL CENTER',0),(2,4,8,1,0,'CALL CENTER',0),(2,5,8,1,0,'CALL CENTER',0),(2,6,8,1,0,'CALL CENTER',0),(2,7,8,1,0,'CALL CENTER',0),(2,1,9,1,0,'CALL CENTER',0),(2,2,9,1,0,'CALL CENTER',0),(2,3,9,1,0,'CALL CENTER',0),(2,4,9,1,0,'CALL CENTER',0),(2,5,9,1,0,'CALL CENTER',0),(2,6,9,1,0,'CALL CENTER',0),(2,7,9,1,0,'CALL CENTER',0),(2,1,10,1,0,'CALL CENTER',0),(2,2,10,1,0,'CALL CENTER',0),(2,3,10,1,0,'CALL CENTER',0),(2,4,10,1,0,'CALL CENTER',0),(2,5,10,1,0,'CALL CENTER',0),(2,6,10,1,0,'CALL CENTER',0),(2,7,10,1,0,'CALL CENTER',0),(2,1,11,1,0,'CALL CENTER',0),(2,2,11,1,0,'CALL CENTER',0),(2,3,11,1,0,'CALL CENTER',0),(2,4,11,1,0,'CALL CENTER',0),(2,5,11,1,0,'CALL CENTER',0),(2,6,11,1,0,'CALL CENTER',0),(2,7,11,1,0,'CALL CENTER',0),(2,1,12,1,0,'CALL CENTER',0),(2,2,12,1,0,'CALL CENTER',0),(2,3,12,1,0,'CALL CENTER',0),(2,4,12,1,0,'CALL CENTER',0),(2,5,12,1,0,'CALL CENTER',0),(2,6,12,1,0,'CALL CENTER',0),(2,7,12,1,0,'CALL CENTER',0),(2,1,13,1,0,'CALL CENTER',0),(2,2,13,1,0,'CALL CENTER',0),(2,3,13,1,0,'CALL CENTER',0),(2,4,13,1,0,'CALL CENTER',0),(2,5,13,1,0,'CALL CENTER',0),(2,6,13,1,0,'CALL CENTER',0),(2,7,13,1,0,'CALL CENTER',0),(2,1,14,1,0,'CALL CENTER',0),(2,2,14,1,0,'CALL CENTER',0),(2,3,14,1,0,'CALL CENTER',0),(2,4,14,1,0,'CALL CENTER',0),(2,5,14,1,0,'CALL CENTER',0),(2,6,14,1,0,'CALL CENTER',0),(2,7,14,1,0,'CALL CENTER',0),(2,1,15,1,0,'CALL CENTER',0),(2,2,15,1,0,'CALL CENTER',0),(2,3,15,1,0,'CALL CENTER',0),(2,4,15,1,0,'CALL CENTER',0),(2,5,15,1,0,'CALL CENTER',0),(2,6,15,1,0,'CALL CENTER',0),(2,7,15,1,0,'CALL CENTER',0),(2,1,16,1,0,'CALL CENTER',0),(2,2,16,1,0,'CALL CENTER',0),(2,3,16,1,0,'CALL CENTER',0),(2,4,16,1,0,'CALL CENTER',0),(2,5,16,1,0,'CALL CENTER',0),(2,6,16,1,0,'CALL CENTER',0),(2,7,16,1,0,'CALL CENTER',0),(2,1,17,1,0,'CALL CENTER',0),(2,2,17,1,0,'CALL CENTER',0),(2,3,17,1,0,'CALL CENTER',0),(2,4,17,1,0,'CALL CENTER',0),(2,5,17,1,0,'CALL CENTER',0),(2,6,17,1,0,'CALL CENTER',0),(2,7,17,1,0,'CALL CENTER',0),(2,1,18,1,0,'CALL CENTER',0),(2,2,18,1,0,'CALL CENTER',0),(2,3,18,1,0,'CALL CENTER',0),(2,4,18,1,0,'CALL CENTER',0),(2,5,18,1,0,'CALL CENTER',0),(2,6,18,1,0,'CALL CENTER',0),(2,7,18,1,0,'CALL CENTER',0),(2,1,19,1,0,'CALL CENTER',0),(2,2,19,1,0,'CALL CENTER',0),(2,3,19,1,0,'CALL CENTER',0),(2,4,19,1,0,'CALL CENTER',0),(2,5,19,1,0,'CALL CENTER',0),(2,6,19,1,0,'CALL CENTER',0),(2,7,19,1,0,'CALL CENTER',0),(2,1,20,1,0,'CALL CENTER',0),(2,2,20,1,0,'CALL CENTER',0),(2,3,20,1,0,'CALL CENTER',0),(2,4,20,1,0,'CALL CENTER',0),(2,5,20,1,0,'CALL CENTER',0),(2,6,20,1,0,'CALL CENTER',0),(2,7,20,1,0,'CALL CENTER',0),(2,1,21,1,0,'CALL CENTER',0),(2,2,21,1,0,'CALL CENTER',0),(2,3,21,1,0,'CALL CENTER',0),(2,4,21,1,0,'CALL CENTER',0),(2,5,21,1,0,'CALL CENTER',0),(2,6,21,1,0,'CALL CENTER',0),(2,7,21,1,0,'CALL CENTER',0),(2,1,22,1,0,'CALL CENTER',0),(2,2,22,1,0,'CALL CENTER',0),(2,3,22,1,0,'CALL CENTER',0),(2,4,22,1,0,'CALL CENTER',0),(2,5,22,1,0,'CALL CENTER',0),(2,6,22,1,0,'CALL CENTER',0),(2,7,22,1,0,'CALL CENTER',0),(2,1,23,1,0,'CALL CENTER',0),(2,2,23,1,0,'CALL CENTER',0),(2,3,23,1,0,'CALL CENTER',0),(2,4,23,1,0,'CALL CENTER',0),(2,5,23,1,0,'CALL CENTER',0),(2,6,23,1,0,'CALL CENTER',0),(2,7,23,1,0,'CALL CENTER',0),(3,1,0,2,0,'LIBRE',NULL),(3,2,0,2,0,'LIBRE',NULL),(3,3,0,2,0,'LIBRE',NULL),(3,4,0,2,0,'LIBRE',NULL),(3,5,0,2,0,'LIBRE',NULL),(3,6,0,2,0,'LIBRE',NULL),(3,7,0,2,0,'LIBRE',NULL),(3,1,1,2,0,'LIBRE',NULL),(3,2,1,2,0,'LIBRE',NULL),(3,3,1,2,0,'LIBRE',NULL),(3,4,1,2,0,'LIBRE',NULL),(3,5,1,2,0,'LIBRE',NULL),(3,6,1,2,0,'LIBRE',NULL),(3,7,1,2,0,'LIBRE',NULL),(3,1,2,2,0,'LIBRE',NULL),(3,2,2,2,0,'LIBRE',NULL),(3,3,2,2,0,'LIBRE',NULL),(3,4,2,2,0,'LIBRE',NULL),(3,5,2,2,0,'LIBRE',NULL),(3,6,2,2,0,'LIBRE',NULL),(3,7,2,2,0,'LIBRE',NULL),(3,1,3,2,0,'LIBRE',NULL),(3,2,3,2,0,'LIBRE',NULL),(3,3,3,2,0,'LIBRE',NULL),(3,4,3,2,0,'LIBRE',NULL),(3,5,3,2,0,'LIBRE',NULL),(3,6,3,2,0,'LIBRE',NULL),(3,7,3,2,0,'LIBRE',NULL),(3,1,4,2,0,'LIBRE',NULL),(3,2,4,2,0,'LIBRE',NULL),(3,3,4,2,0,'LIBRE',NULL),(3,4,4,2,0,'LIBRE',NULL),(3,5,4,2,0,'LIBRE',NULL),(3,6,4,2,0,'LIBRE',NULL),(3,7,4,2,0,'LIBRE',NULL),(3,1,5,2,0,'LIBRE',NULL),(3,2,5,2,0,'LIBRE',NULL),(3,3,5,2,0,'LIBRE',NULL),(3,4,5,2,0,'LIBRE',NULL),(3,5,5,2,0,'LIBRE',NULL),(3,6,5,2,0,'LIBRE',NULL),(3,7,5,2,0,'LIBRE',NULL),(3,1,6,2,0,'LIBRE',NULL),(3,2,6,2,0,'LIBRE',NULL),(3,3,6,2,0,'LIBRE',NULL),(3,4,6,2,0,'LIBRE',NULL),(3,5,6,2,0,'LIBRE',NULL),(3,6,6,2,0,'LIBRE',NULL),(3,7,6,2,0,'LIBRE',NULL),(3,1,7,2,0,'LIBRE',NULL),(3,2,7,2,0,'LIBRE',NULL),(3,3,7,2,0,'LIBRE',NULL),(3,4,7,2,0,'LIBRE',NULL),(3,5,7,2,0,'LIBRE',NULL),(3,6,7,2,0,'LIBRE',NULL),(3,7,7,2,0,'LIBRE',NULL),(3,1,8,2,0,'LIBRE',NULL),(3,2,8,2,0,'LIBRE',NULL),(3,3,8,2,0,'LIBRE',NULL),(3,4,8,2,0,'LIBRE',NULL),(3,5,8,2,0,'LIBRE',NULL),(3,6,8,2,0,'LIBRE',NULL),(3,7,8,2,0,'LIBRE',NULL),(3,1,9,2,0,'LIBRE',NULL),(3,2,9,2,0,'LIBRE',NULL),(3,3,9,2,0,'LIBRE',NULL),(3,4,9,2,0,'LIBRE',NULL),(3,5,9,2,0,'LIBRE',NULL),(3,6,9,2,0,'LIBRE',NULL),(3,7,9,2,0,'LIBRE',NULL),(3,1,10,2,0,'LIBRE',NULL),(3,2,10,2,0,'LIBRE',NULL),(3,3,10,2,0,'LIBRE',NULL),(3,4,10,2,0,'LIBRE',NULL),(3,5,10,2,0,'LIBRE',NULL),(3,6,10,2,0,'LIBRE',NULL),(3,7,10,2,0,'LIBRE',NULL),(3,1,11,2,0,'LIBRE',NULL),(3,2,11,2,0,'LIBRE',NULL),(3,3,11,2,0,'LIBRE',NULL),(3,4,11,2,0,'LIBRE',NULL),(3,5,11,2,0,'LIBRE',NULL),(3,6,11,2,0,'LIBRE',NULL),(3,7,11,2,0,'LIBRE',NULL),(3,1,12,2,0,'LIBRE',NULL),(3,2,12,2,0,'LIBRE',NULL),(3,3,12,2,0,'LIBRE',NULL),(3,4,12,2,0,'LIBRE',NULL),(3,5,12,2,0,'LIBRE',NULL),(3,6,12,2,0,'LIBRE',NULL),(3,7,12,2,0,'LIBRE',NULL),(3,1,13,2,0,'LIBRE',NULL),(3,2,13,2,0,'LIBRE',NULL),(3,3,13,2,0,'LIBRE',NULL),(3,4,13,2,0,'LIBRE',NULL),(3,5,13,2,0,'LIBRE',NULL),(3,6,13,2,0,'LIBRE',NULL),(3,7,13,2,0,'LIBRE',NULL),(3,1,14,2,0,'LIBRE',NULL),(3,2,14,2,0,'LIBRE',NULL),(3,3,14,2,0,'LIBRE',NULL),(3,4,14,2,0,'LIBRE',NULL),(3,5,14,2,0,'LIBRE',NULL),(3,6,14,2,0,'LIBRE',NULL),(3,7,14,2,0,'LIBRE',NULL),(3,1,15,2,0,'LIBRE',NULL),(3,2,15,2,0,'LIBRE',NULL),(3,3,15,2,0,'LIBRE',NULL),(3,4,15,2,0,'LIBRE',NULL),(3,5,15,2,0,'LIBRE',NULL),(3,6,15,2,0,'LIBRE',NULL),(3,7,15,2,0,'LIBRE',NULL),(3,1,16,2,0,'LIBRE',NULL),(3,2,16,2,0,'LIBRE',NULL),(3,3,16,2,0,'LIBRE',NULL),(3,4,16,2,0,'LIBRE',NULL),(3,5,16,2,0,'LIBRE',NULL),(3,6,16,2,0,'LIBRE',NULL),(3,7,16,2,0,'LIBRE',NULL),(3,1,17,2,0,'LIBRE',NULL),(3,2,17,2,0,'LIBRE',NULL),(3,3,17,2,0,'LIBRE',NULL),(3,4,17,2,0,'LIBRE',NULL),(3,5,17,2,0,'LIBRE',NULL),(3,6,17,2,0,'LIBRE',NULL),(3,7,17,2,0,'LIBRE',NULL),(3,1,18,2,0,'LIBRE',NULL),(3,2,18,2,0,'LIBRE',NULL),(3,3,18,2,0,'LIBRE',NULL),(3,4,18,2,0,'LIBRE',NULL),(3,5,18,2,0,'LIBRE',NULL),(3,6,18,2,0,'LIBRE',NULL),(3,7,18,2,0,'LIBRE',NULL),(3,1,19,2,0,'LIBRE',NULL),(3,2,19,2,0,'LIBRE',NULL),(3,3,19,2,0,'LIBRE',NULL),(3,4,19,2,0,'LIBRE',NULL),(3,5,19,2,0,'LIBRE',NULL),(3,6,19,2,0,'LIBRE',NULL),(3,7,19,2,0,'LIBRE',NULL),(3,1,20,2,0,'LIBRE',NULL),(3,2,20,2,0,'LIBRE',NULL),(3,3,20,2,0,'LIBRE',NULL),(3,4,20,2,0,'LIBRE',NULL),(3,5,20,2,0,'LIBRE',NULL),(3,6,20,2,0,'LIBRE',NULL),(3,7,20,2,0,'LIBRE',NULL),(3,1,21,2,0,'LIBRE',NULL),(3,2,21,2,0,'LIBRE',NULL),(3,3,21,2,0,'LIBRE',NULL),(3,4,21,2,0,'LIBRE',NULL),(3,5,21,2,0,'LIBRE',NULL),(3,6,21,2,0,'LIBRE',NULL),(3,7,21,2,0,'LIBRE',NULL),(3,1,22,2,0,'LIBRE',NULL),(3,2,22,2,0,'LIBRE',NULL),(3,3,22,2,0,'LIBRE',NULL),(3,4,22,2,0,'LIBRE',NULL),(3,5,22,2,0,'LIBRE',NULL),(3,6,22,2,0,'LIBRE',NULL),(3,7,22,2,0,'LIBRE',NULL),(3,1,23,2,0,'LIBRE',NULL),(3,2,23,2,0,'LIBRE',NULL),(3,3,23,2,0,'LIBRE',NULL),(3,4,23,2,0,'LIBRE',NULL),(3,5,23,2,0,'LIBRE',NULL),(3,6,23,2,0,'LIBRE',NULL),(3,7,23,2,0,'LIBRE',NULL),(4,7,23,5,2,'123123',0),(4,6,23,5,2,'123123',0),(4,5,23,5,2,'123123',0),(5,1,0,5,2,'123',1),(5,2,0,5,2,'123',1),(5,3,0,5,2,'123',1),(5,4,0,5,2,'123',1),(5,5,0,5,2,'123',1),(5,6,0,5,2,'123',1),(5,7,0,5,2,'123',1),(5,1,1,5,2,'123',1),(5,2,1,5,2,'123',1),(5,3,1,5,2,'123',1),(5,4,1,5,2,'123',1),(5,5,1,5,2,'123',1),(5,6,1,5,2,'123',1),(5,7,1,5,2,'123',1),(5,1,2,5,2,'123',1),(5,2,2,5,2,'123',1),(5,3,2,5,2,'123',1),(5,4,2,5,2,'123',1),(5,5,2,5,2,'123',1),(5,6,2,5,2,'123',1),(5,7,2,5,2,'123',1),(5,1,3,5,2,'123',1),(5,2,3,5,2,'123',1),(5,3,3,5,2,'123',1),(5,4,3,5,2,'123',1),(5,5,3,5,2,'123',1),(5,6,3,5,2,'123',1),(5,7,3,5,2,'123',1),(5,1,4,5,2,'123',1),(5,2,4,5,2,'123',1),(5,3,4,5,2,'123',1),(5,4,4,5,2,'123',1),(5,5,4,5,2,'123',1),(5,6,4,5,2,'123',1),(5,7,4,5,2,'123',1),(5,1,5,5,2,'123',1),(5,2,5,5,2,'123',1),(5,3,5,5,2,'123',1),(5,4,5,5,2,'123',1),(5,5,5,5,2,'123',1),(5,6,5,5,2,'123',1),(5,7,5,5,2,'123',1),(5,1,6,5,2,'123',1),(5,2,6,5,2,'123',1),(5,3,6,5,2,'123',1),(5,4,6,5,2,'123',1),(5,5,6,5,2,'123',1),(5,6,6,5,2,'123',1),(5,7,6,5,2,'123',1),(5,1,7,5,2,'123',1),(5,2,7,5,2,'123',1),(5,3,7,5,2,'123',1),(5,4,7,5,2,'123',1),(5,5,7,5,2,'123',1),(5,6,7,5,2,'123',1),(5,7,7,5,2,'123',1),(5,1,8,5,2,'123',1),(5,2,8,5,2,'123',1),(5,3,8,5,2,'123',1),(5,4,8,5,2,'123',1),(5,5,8,5,2,'123',1),(5,6,8,5,2,'123',1),(5,7,8,5,2,'123',1),(5,1,9,5,2,'123',1),(5,2,9,5,2,'123',1),(5,3,9,5,2,'123',1),(5,4,9,5,2,'123',1),(5,5,9,5,2,'123',1),(5,6,9,5,2,'123',1),(5,7,9,5,2,'123',1),(5,1,10,5,2,'123',1),(5,2,10,5,2,'123',1),(5,3,10,5,2,'123',1),(5,4,10,5,2,'123',1),(5,5,10,5,2,'123',1),(5,6,10,5,2,'123',1),(5,7,10,5,2,'123',1),(5,1,11,5,2,'123',1),(5,2,11,5,2,'123',1),(5,3,11,5,2,'123',1),(5,4,11,5,2,'123',1),(5,5,11,5,2,'123',1),(5,6,11,5,2,'123',1),(5,7,11,5,2,'123',1),(5,1,12,5,2,'123',1),(5,2,12,5,2,'123',1),(5,3,12,5,2,'123',1),(5,4,12,5,2,'123',1),(5,5,12,5,2,'123',1),(5,6,12,5,2,'123',1),(5,7,12,5,2,'123',1),(5,1,13,5,2,'123',1),(5,2,13,5,2,'123',1),(5,3,13,5,2,'123',1),(5,4,13,5,2,'123',1),(5,5,13,5,2,'123',1),(5,6,13,5,2,'123',1),(5,7,13,5,2,'123',1),(5,1,14,5,2,'123',1),(5,2,14,5,2,'123',1),(5,3,14,5,2,'123',1),(5,4,14,5,2,'123',1),(5,5,14,5,2,'123',1),(5,6,14,5,2,'123',1),(5,7,14,5,2,'123',1),(5,1,15,5,2,'123',1),(5,2,15,5,2,'123',1),(5,3,15,5,2,'123',1),(5,4,15,5,2,'123',1),(5,5,15,5,2,'123',1),(5,6,15,5,2,'123',1),(5,7,15,5,2,'123',1),(5,1,16,5,2,'123',1),(5,2,16,5,2,'123',1),(5,3,16,5,2,'123',1),(5,4,16,5,2,'123',1),(5,5,16,5,2,'123',1),(5,6,16,5,2,'123',1),(5,7,16,5,2,'123',1),(5,1,17,5,2,'123',1),(5,2,17,5,2,'123',1),(5,3,17,5,2,'123',1),(5,4,17,5,2,'123',1),(5,5,17,5,2,'123',1),(5,6,17,5,2,'123',1),(5,7,17,5,2,'123',1),(5,1,18,5,2,'123',1),(5,2,18,5,2,'123',1),(5,3,18,5,2,'123',1),(5,4,18,5,2,'123',1),(5,5,18,5,2,'123',1),(5,6,18,5,2,'123',1),(5,7,18,5,2,'123',1),(5,1,19,5,2,'123',1),(5,2,19,5,2,'123',1),(5,3,19,5,2,'123',1),(5,4,19,5,2,'123',1),(5,5,19,5,2,'123',1),(5,6,19,5,2,'123',1),(5,7,19,5,2,'123',1),(5,1,20,5,2,'123',1),(5,2,20,5,2,'123',1),(5,3,20,5,2,'123',1),(5,4,20,5,2,'123',1),(5,5,20,5,2,'123',1),(5,6,20,5,2,'123',1),(5,7,20,5,2,'123',1),(5,1,21,5,2,'123',1),(5,2,21,5,2,'123',1),(5,3,21,5,2,'123',1),(5,4,21,5,2,'123',1),(5,5,21,5,2,'123',1),(5,6,21,5,2,'123',1),(5,7,21,5,2,'123',1),(5,1,22,5,2,'123',1),(5,2,22,5,2,'123',1),(5,3,22,5,2,'123',1),(5,4,22,5,2,'123',1),(5,5,22,5,2,'123',1),(5,6,22,5,2,'123',1),(5,7,22,5,2,'123',1),(5,1,23,5,2,'123',1),(5,2,23,5,2,'123',1),(5,3,23,5,2,'123',1),(5,4,23,5,2,'123',1),(5,5,23,5,2,'123',1),(5,6,23,5,2,'123',1),(5,7,23,5,2,'123',1),(6,1,0,4,1,'S10/B20',0),(6,2,0,4,1,'S10/B20',0),(6,3,0,4,1,'S10/B20',0),(6,4,0,4,1,'S10/B20',0),(6,5,0,4,1,'S10/B20',0),(6,6,0,4,1,'S10/B20',0),(6,7,0,4,1,'S10/B20',0),(6,1,1,4,1,'S10/B20',0),(6,2,1,4,1,'S10/B20',0),(6,3,1,4,1,'S10/B20',0),(6,4,1,4,1,'S10/B20',0),(6,5,1,4,1,'S10/B20',0),(6,6,1,4,1,'S10/B20',0),(6,7,1,4,1,'S10/B20',0),(6,1,2,4,1,'S10/B20',0),(6,2,2,4,1,'S10/B20',0),(6,3,2,4,1,'S10/B20',0),(6,4,2,4,1,'S10/B20',0),(6,5,2,4,1,'S10/B20',0),(6,6,2,4,1,'S10/B20',0),(6,7,2,4,1,'S10/B20',0),(6,1,3,4,1,'S10/B20',0),(6,2,3,4,1,'S10/B20',0),(6,3,3,4,1,'S10/B20',0),(6,4,3,4,1,'S10/B20',0),(6,5,3,4,1,'S10/B20',0),(6,6,3,4,1,'S10/B20',0),(6,7,3,4,1,'S10/B20',0),(6,1,4,4,1,'S10/B20',0),(6,2,4,4,1,'S10/B20',0),(6,3,4,4,1,'S10/B20',0),(6,4,4,4,1,'S10/B20',0),(6,5,4,4,1,'S10/B20',0),(6,6,4,4,1,'S10/B20',0),(6,7,4,4,1,'S10/B20',0),(6,1,5,4,1,'S10/B20',0),(6,2,5,4,1,'S10/B20',0),(6,3,5,4,1,'S10/B20',0),(6,4,5,4,1,'S10/B20',0),(6,5,5,4,1,'S10/B20',0),(6,6,5,4,1,'S10/B20',0),(6,7,5,4,1,'S10/B20',0),(6,1,6,4,1,'S10/B20',0),(6,2,6,4,1,'S10/B20',0),(6,3,6,4,1,'S10/B20',0),(6,4,6,4,1,'S10/B20',0),(6,5,6,4,1,'S10/B20',0),(6,6,6,4,1,'S10/B20',0),(6,7,6,4,1,'S10/B20',0),(6,1,7,4,1,'S10/B20',0),(6,2,7,4,1,'S10/B20',0),(6,3,7,4,1,'S10/B20',0),(6,4,7,4,1,'S10/B20',0),(6,5,7,4,1,'S10/B20',0),(6,6,7,4,1,'S10/B20',0),(6,7,7,4,1,'S10/B20',0),(6,1,8,4,1,'S10/B20',0),(6,2,8,4,1,'S10/B20',0),(6,3,8,4,1,'S10/B20',0),(6,4,8,4,1,'S10/B20',0),(6,5,8,4,1,'S10/B20',0),(6,6,8,4,1,'S10/B20',0),(6,7,8,4,1,'S10/B20',0),(6,1,9,4,1,'S10/B20',0),(6,2,9,4,1,'S10/B20',0),(6,3,9,4,1,'S10/B20',0),(6,4,9,4,1,'S10/B20',0),(6,5,9,4,1,'S10/B20',0),(6,6,9,4,1,'S10/B20',0),(6,7,9,4,1,'S10/B20',0),(6,1,10,4,1,'S10/B20',0),(6,2,10,4,1,'S10/B20',0),(6,3,10,4,1,'S10/B20',0),(6,4,10,4,1,'S10/B20',0),(6,5,10,4,1,'S10/B20',0),(6,6,10,4,1,'S10/B20',0),(6,7,10,4,1,'S10/B20',0),(6,1,11,4,1,'S10/B20',0),(6,2,11,4,1,'S10/B20',0),(6,3,11,4,1,'S10/B20',0),(6,4,11,4,1,'S10/B20',0),(6,5,11,4,1,'S10/B20',0),(6,6,11,4,1,'S10/B20',0),(6,7,11,4,1,'S10/B20',0),(6,1,12,4,1,'S10/B20',0),(6,2,12,4,1,'S10/B20',0),(6,3,12,4,1,'S10/B20',0),(6,4,12,4,1,'S10/B20',0),(6,5,12,4,1,'S10/B20',0),(6,6,12,4,1,'S10/B20',0),(6,7,12,4,1,'S10/B20',0),(6,1,13,4,1,'S10/B20',0),(6,2,13,4,1,'S10/B20',0),(6,3,13,4,1,'S10/B20',0),(6,4,13,4,1,'S10/B20',0),(6,5,13,4,1,'S10/B20',0),(6,6,13,4,1,'S10/B20',0),(6,7,13,4,1,'S10/B20',0),(6,1,14,4,1,'S10/B20',0),(6,2,14,4,1,'S10/B20',0),(6,3,14,4,1,'S10/B20',0),(6,4,14,4,1,'S10/B20',0),(6,5,14,4,1,'S10/B20',0),(6,6,14,4,1,'S10/B20',0),(6,7,14,4,1,'S10/B20',0),(6,1,15,4,1,'S10/B20',0),(6,2,15,4,1,'S10/B20',0),(6,3,15,4,1,'S10/B20',0),(6,4,15,4,1,'S10/B20',0),(6,5,15,4,1,'S10/B20',0),(6,6,15,4,1,'S10/B20',0),(6,7,15,4,1,'S10/B20',0),(6,1,16,4,1,'S10/B20',0),(6,2,16,4,1,'S10/B20',0),(6,3,16,4,1,'S10/B20',0),(6,4,16,4,1,'S10/B20',0),(6,5,16,4,1,'S10/B20',0),(6,6,16,4,1,'S10/B20',0),(6,7,16,4,1,'S10/B20',0),(6,1,17,4,1,'S10/B20',0),(6,2,17,4,1,'S10/B20',0),(6,3,17,4,1,'S10/B20',0),(6,4,17,4,1,'S10/B20',0),(6,5,17,4,1,'S10/B20',0),(6,6,17,4,1,'S10/B20',0),(6,7,17,4,1,'S10/B20',0),(6,1,18,4,1,'S10/B20',0),(6,2,18,4,1,'S10/B20',0),(6,3,18,4,1,'S10/B20',0),(6,4,18,4,1,'S10/B20',0),(6,5,18,4,1,'S10/B20',0),(6,6,18,4,1,'S10/B20',0),(6,7,18,4,1,'S10/B20',0),(6,1,19,4,1,'S10/B20',0),(6,2,19,4,1,'S10/B20',0),(6,3,19,4,1,'S10/B20',0),(6,4,19,4,1,'S10/B20',0),(6,5,19,4,1,'S10/B20',0),(6,6,19,4,1,'S10/B20',0),(6,7,19,4,1,'S10/B20',0),(6,1,20,4,1,'S10/B20',0),(6,2,20,4,1,'S10/B20',0),(6,3,20,4,1,'S10/B20',0),(6,4,20,4,1,'S10/B20',0),(6,5,20,4,1,'S10/B20',0),(6,6,20,4,1,'S10/B20',0),(6,7,20,4,1,'S10/B20',0),(6,1,21,4,1,'S10/B20',0),(6,2,21,4,1,'S10/B20',0),(6,3,21,4,1,'S10/B20',0),(6,4,21,4,1,'S10/B20',0),(6,5,21,4,1,'S10/B20',0),(6,6,21,4,1,'S10/B20',0),(6,7,21,4,1,'S10/B20',0),(6,1,22,4,1,'S10/B20',0),(6,2,22,4,1,'S10/B20',0),(6,3,22,4,1,'S10/B20',0),(6,4,22,4,1,'S10/B20',0),(6,5,22,4,1,'S10/B20',0),(6,6,22,4,1,'S10/B20',0),(6,7,22,4,1,'S10/B20',0),(6,1,23,4,1,'S10/B20',0),(6,2,23,4,1,'S10/B20',0),(6,3,23,4,1,'S10/B20',0),(6,4,23,4,1,'S10/B20',0),(6,5,23,4,1,'S10/B20',0),(6,6,23,4,1,'S10/B20',0),(6,7,23,4,1,'S10/B20',0),(7,1,0,1,0,'S15/B30',0),(7,2,0,1,0,'S15/B30',0),(7,3,0,1,0,'S15/B30',0),(7,4,0,1,0,'S15/B30',0),(7,5,0,1,0,'S15/B30',0),(7,6,0,1,0,'S15/B30',0),(7,7,0,1,0,'S15/B30',0),(7,1,1,1,0,'S15/B30',0),(7,2,1,1,0,'S15/B30',0),(7,3,1,1,0,'S15/B30',0),(7,4,1,1,0,'S15/B30',0),(7,5,1,1,0,'S15/B30',0),(7,6,1,1,0,'S15/B30',0),(7,7,1,1,0,'S15/B30',0),(7,1,2,1,0,'S15/B30',0),(7,2,2,1,0,'S15/B30',0),(7,3,2,1,0,'S15/B30',0),(7,4,2,1,0,'S15/B30',0),(7,5,2,1,0,'S15/B30',0),(7,6,2,1,0,'S15/B30',0),(7,7,2,1,0,'S15/B30',0),(7,1,3,1,0,'S15/B30',0),(7,2,3,1,0,'S15/B30',0),(7,3,3,1,0,'S15/B30',0),(7,4,3,1,0,'S15/B30',0),(7,5,3,1,0,'S15/B30',0),(7,6,3,1,0,'S15/B30',0),(7,7,3,1,0,'S15/B30',0),(7,1,4,1,0,'S15/B30',0),(7,2,4,1,0,'S15/B30',0),(7,3,4,1,0,'S15/B30',0),(7,4,4,1,0,'S15/B30',0),(7,5,4,1,0,'S15/B30',0),(7,6,4,1,0,'S15/B30',0),(7,7,4,1,0,'S15/B30',0),(7,1,5,1,0,'S15/B30',0),(7,2,5,1,0,'S15/B30',0),(7,3,5,1,0,'S15/B30',0),(7,4,5,1,0,'S15/B30',0),(7,5,5,1,0,'S15/B30',0),(7,6,5,1,0,'S15/B30',0),(7,7,5,1,0,'S15/B30',0),(7,1,6,1,0,'S15/B30',0),(7,2,6,1,0,'S15/B30',0),(7,3,6,1,0,'S15/B30',0),(7,4,6,1,0,'S15/B30',0),(7,5,6,1,0,'S15/B30',0),(7,6,6,1,0,'S15/B30',0),(7,7,6,1,0,'S15/B30',0),(7,1,7,1,0,'S15/B30',0),(7,2,7,1,0,'S15/B30',0),(7,3,7,1,0,'S15/B30',0),(7,4,7,1,0,'S15/B30',0),(7,5,7,1,0,'S15/B30',0),(7,6,7,1,0,'S15/B30',0),(7,7,7,1,0,'S15/B30',0),(7,1,8,1,0,'S15/B30',0),(7,2,8,1,0,'S15/B30',0),(7,3,8,1,0,'S15/B30',0),(7,4,8,1,0,'S15/B30',0),(7,5,8,1,0,'S15/B30',0),(7,6,8,1,0,'S15/B30',0),(7,7,8,1,0,'S15/B30',0),(7,1,9,1,0,'S15/B30',0),(7,2,9,1,0,'S15/B30',0),(7,3,9,1,0,'S15/B30',0),(7,4,9,1,0,'S15/B30',0),(7,5,9,1,0,'S15/B30',0),(7,6,9,1,0,'S15/B30',0),(7,7,9,1,0,'S15/B30',0),(7,1,10,1,0,'S15/B30',0),(7,2,10,1,0,'S15/B30',0),(7,3,10,1,0,'S15/B30',0),(7,4,10,1,0,'S15/B30',0),(7,5,10,1,0,'S15/B30',0),(7,6,10,1,0,'S15/B30',0),(7,7,10,1,0,'S15/B30',0),(7,1,11,1,0,'S15/B30',0),(7,2,11,1,0,'S15/B30',0),(7,3,11,1,0,'S15/B30',0),(7,4,11,1,0,'S15/B30',0),(7,5,11,1,0,'S15/B30',0),(7,6,11,1,0,'S15/B30',0),(7,7,11,1,0,'S15/B30',0),(7,1,12,1,0,'S15/B30',0),(7,2,12,1,0,'S15/B30',0),(7,3,12,1,0,'S15/B30',0),(7,4,12,1,0,'S15/B30',0),(7,5,12,1,0,'S15/B30',0),(7,6,12,1,0,'S15/B30',0),(7,7,12,1,0,'S15/B30',0),(7,1,13,1,0,'S15/B30',0),(7,2,13,1,0,'S15/B30',0),(7,3,13,1,0,'S15/B30',0),(7,4,13,1,0,'S15/B30',0),(7,5,13,1,0,'S15/B30',0),(7,6,13,1,0,'S15/B30',0),(7,7,13,1,0,'S15/B30',0),(7,1,14,1,0,'S15/B30',0),(7,2,14,1,0,'S15/B30',0),(7,3,14,1,0,'S15/B30',0),(7,4,14,1,0,'S15/B30',0),(7,5,14,1,0,'S15/B30',0),(7,6,14,1,0,'S15/B30',0),(7,7,14,1,0,'S15/B30',0),(7,1,15,1,0,'S15/B30',0),(7,2,15,1,0,'S15/B30',0),(7,3,15,1,0,'S15/B30',0),(7,4,15,1,0,'S15/B30',0),(7,5,15,1,0,'S15/B30',0),(7,6,15,1,0,'S15/B30',0),(7,7,15,1,0,'S15/B30',0),(7,1,16,1,0,'S15/B30',0),(7,2,16,1,0,'S15/B30',0),(7,3,16,1,0,'S15/B30',0),(7,4,16,1,0,'S15/B30',0),(7,5,16,1,0,'S15/B30',0),(7,6,16,1,0,'S15/B30',0),(7,7,16,1,0,'S15/B30',0),(7,1,17,1,0,'S15/B30',0),(7,2,17,1,0,'S15/B30',0),(7,3,17,1,0,'S15/B30',0),(7,4,17,1,0,'S15/B30',0),(7,5,17,1,0,'S15/B30',0),(7,6,17,1,0,'S15/B30',0),(7,7,17,1,0,'S15/B30',0),(7,1,18,1,0,'S15/B30',0),(7,2,18,1,0,'S15/B30',0),(7,3,18,1,0,'S15/B30',0),(7,4,18,1,0,'S15/B30',0),(7,5,18,1,0,'S15/B30',0),(7,6,18,1,0,'S15/B30',0),(7,7,18,1,0,'S15/B30',0),(7,1,19,1,0,'S15/B30',0),(7,2,19,1,0,'S15/B30',0),(7,3,19,1,0,'S15/B30',0),(7,4,19,1,0,'S15/B30',0),(7,5,19,1,0,'S15/B30',0),(7,6,19,1,0,'S15/B30',0),(7,7,19,1,0,'S15/B30',0),(7,1,20,1,0,'S15/B30',0),(7,2,20,1,0,'S15/B30',0),(7,3,20,1,0,'S15/B30',0),(7,4,20,1,0,'S15/B30',0),(7,5,20,1,0,'S15/B30',0),(7,6,20,1,0,'S15/B30',0),(7,7,20,1,0,'S15/B30',0),(7,1,21,1,0,'S15/B30',0),(7,2,21,1,0,'S15/B30',0),(7,3,21,1,0,'S15/B30',0),(7,4,21,1,0,'S15/B30',0),(7,5,21,1,0,'S15/B30',0),(7,6,21,1,0,'S15/B30',0),(7,7,21,1,0,'S15/B30',0),(7,1,22,1,0,'S15/B30',0),(7,2,22,1,0,'S15/B30',0),(7,3,22,1,0,'S15/B30',0),(7,4,22,1,0,'S15/B30',0),(7,5,22,1,0,'S15/B30',0),(7,6,22,1,0,'S15/B30',0),(7,7,22,1,0,'S15/B30',0),(7,1,23,1,0,'S15/B30',0),(7,2,23,1,0,'S15/B30',0),(7,3,23,1,0,'S15/B30',0),(7,4,23,1,0,'S15/B30',0),(7,5,23,1,0,'S15/B30',0),(7,6,23,1,0,'S15/B30',0),(7,7,23,1,0,'S15/B30',0),(8,1,0,2,0,'Standard',0),(8,2,0,2,0,'Standard',0),(8,3,0,2,0,'Standard',0),(8,4,0,2,0,'Standard',0),(8,5,0,2,0,'Standard',0),(8,6,0,2,0,'Standard',0),(8,7,0,2,0,'Standard',0),(8,1,1,2,0,'Standard',0),(8,2,1,2,0,'Standard',0),(8,3,1,2,0,'Standard',0),(8,4,1,2,0,'Standard',0),(8,5,1,2,0,'Standard',0),(8,6,1,2,0,'Standard',0),(8,7,1,2,0,'Standard',0),(8,1,2,2,0,'Standard',0),(8,2,2,2,0,'Standard',0),(8,3,2,2,0,'Standard',0),(8,4,2,2,0,'Standard',0),(8,5,2,2,0,'Standard',0),(8,6,2,2,0,'Standard',0),(8,7,2,2,0,'Standard',0),(8,1,3,2,0,'Standard',0),(8,2,3,2,0,'Standard',0),(8,3,3,2,0,'Standard',0),(8,4,3,2,0,'Standard',0),(8,5,3,2,0,'Standard',0),(8,6,3,2,0,'Standard',0),(8,7,3,2,0,'Standard',0),(8,1,4,2,0,'Standard',0),(8,2,4,2,0,'Standard',0),(8,3,4,2,0,'Standard',0),(8,4,4,2,0,'Standard',0),(8,5,4,2,0,'Standard',0),(8,6,4,2,0,'Standard',0),(8,7,4,2,0,'Standard',0),(8,1,5,2,0,'Standard',0),(8,2,5,2,0,'Standard',0),(8,3,5,2,0,'Standard',0),(8,4,5,2,0,'Standard',0),(8,5,5,2,0,'Standard',0),(8,6,5,2,0,'Standard',0),(8,7,5,2,0,'Standard',0),(8,1,6,2,0,'Standard',0),(8,2,6,2,0,'Standard',0),(8,3,6,2,0,'Standard',0),(8,4,6,2,0,'Standard',0),(8,5,6,2,0,'Standard',0),(8,6,6,2,0,'Standard',0),(8,7,6,2,0,'Standard',0),(8,1,7,6,0,'Standard',0),(8,2,7,6,0,'Standard',0),(8,3,7,6,0,'Standard',0),(8,4,7,6,0,'Standard',0),(8,5,7,6,0,'Standard',0),(8,6,7,6,0,'Standard',0),(8,7,7,6,0,'Standard',0),(8,1,8,6,0,'Standard',0),(8,2,8,6,0,'Standard',0),(8,3,8,6,0,'Standard',0),(8,4,8,6,0,'Standard',0),(8,5,8,6,0,'Standard',0),(8,6,8,6,0,'Standard',0),(8,7,8,6,0,'Standard',0),(8,1,9,6,0,'Standard',0),(8,2,9,6,0,'Standard',0),(8,3,9,6,0,'Standard',0),(8,4,9,6,0,'Standard',0),(8,5,9,6,0,'Standard',0),(8,6,9,6,0,'Standard',0),(8,7,9,6,0,'Standard',0),(8,1,10,6,0,'Standard',0),(8,2,10,6,0,'Standard',0),(8,3,10,6,0,'Standard',0),(8,4,10,6,0,'Standard',0),(8,5,10,6,0,'Standard',0),(8,6,10,6,0,'Standard',0),(8,7,10,6,0,'Standard',0),(8,1,11,6,0,'Standard',0),(8,2,11,6,0,'Standard',0),(8,3,11,6,0,'Standard',0),(8,4,11,6,0,'Standard',0),(8,5,11,6,0,'Standard',0),(8,6,11,6,0,'Standard',0),(8,7,11,6,0,'Standard',0),(8,1,12,6,0,'Standard',0),(8,2,12,6,0,'Standard',0),(8,3,12,6,0,'Standard',0),(8,4,12,6,0,'Standard',0),(8,5,12,6,0,'Standard',0),(8,6,12,6,0,'Standard',0),(8,7,12,6,0,'Standard',0),(8,1,13,6,0,'Standard',0),(8,2,13,6,0,'Standard',0),(8,3,13,6,0,'Standard',0),(8,4,13,6,0,'Standard',0),(8,5,13,6,0,'Standard',0),(8,6,13,6,0,'Standard',0),(8,7,13,6,0,'Standard',0),(8,1,14,6,0,'Standard',0),(8,2,14,6,0,'Standard',0),(8,3,14,6,0,'Standard',0),(8,4,14,6,0,'Standard',0),(8,5,14,6,0,'Standard',0),(8,6,14,6,0,'Standard',0),(8,7,14,6,0,'Standard',0),(8,1,15,6,0,'Standard',0),(8,2,15,6,0,'Standard',0),(8,3,15,6,0,'Standard',0),(8,4,15,6,0,'Standard',0),(8,5,15,6,0,'Standard',0),(8,6,15,6,0,'Standard',0),(8,7,15,6,0,'Standard',0),(8,1,16,6,0,'Standard',0),(8,2,16,6,0,'Standard',0),(8,3,16,6,0,'Standard',0),(8,4,16,6,0,'Standard',0),(8,5,16,6,0,'Standard',0),(8,6,16,6,0,'Standard',0),(8,7,16,6,0,'Standard',0),(8,1,17,6,0,'Standard',0),(8,2,17,6,0,'Standard',0),(8,3,17,6,0,'Standard',0),(8,4,17,6,0,'Standard',0),(8,5,17,6,0,'Standard',0),(8,6,17,6,0,'Standard',0),(8,7,17,6,0,'Standard',0),(8,1,18,6,0,'Standard',0),(8,2,18,6,0,'Standard',0),(8,3,18,6,0,'Standard',0),(8,4,18,6,0,'Standard',0),(8,5,18,6,0,'Standard',0),(8,6,18,6,0,'Standard',0),(8,7,18,6,0,'Standard',0),(8,1,19,6,0,'Standard',0),(8,2,19,6,0,'Standard',0),(8,3,19,6,0,'Standard',0),(8,4,19,6,0,'Standard',0),(8,5,19,6,0,'Standard',0),(8,6,19,6,0,'Standard',0),(8,7,19,6,0,'Standard',0),(8,1,20,6,0,'Standard',0),(8,2,20,6,0,'Standard',0),(8,3,20,6,0,'Standard',0),(8,4,20,6,0,'Standard',0),(8,5,20,6,0,'Standard',0),(8,6,20,6,0,'Standard',0),(8,7,20,6,0,'Standard',0),(8,1,21,6,0,'Standard',0),(8,2,21,6,0,'Standard',0),(8,3,21,6,0,'Standard',0),(8,4,21,6,0,'Standard',0),(8,5,21,6,0,'Standard',0),(8,6,21,6,0,'Standard',0),(8,7,21,6,0,'Standard',0),(8,1,22,2,0,'Standard',0),(8,2,22,2,0,'Standard',0),(8,3,22,2,0,'Standard',0),(8,4,22,2,0,'Standard',0),(8,5,22,2,0,'Standard',0),(8,6,22,2,0,'Standard',0),(8,7,22,2,0,'Standard',0),(8,1,23,2,0,'Standard',0),(8,2,23,2,0,'Standard',0),(8,3,23,2,0,'Standard',0),(8,4,23,2,0,'Standard',0),(8,5,23,2,0,'Standard',0),(8,6,23,2,0,'Standard',0),(8,7,23,2,0,'Standard',0);
/*!40000 ALTER TABLE `planes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `usuariosid` int(10) unsigned NOT NULL DEFAULT '0',
  `usuariosnom` char(20) NOT NULL DEFAULT '',
  `usuariospas` char(20) NOT NULL DEFAULT '',
  `usuariosest` int(1) unsigned NOT NULL DEFAULT '0',
  `usuariosniv` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','s4lch1ch0n',0,1),(2,'admin','s4lch1ch0n',0,2);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-02-19  9:05:03

-- MySQL dump 10.11
--
-- Host: localhost    Database: crm
-- ------------------------------------------------------
-- Server version	5.0.32-Debian_7etch5-log

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
-- Current Database: `crm`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `crm` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `crm`;

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
CREATE TABLE `areas` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` char(255) NOT NULL,
  `borrado` tinyint(1) NOT NULL default '0',
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES (1,'TÃ©cnica',0,'2009-10-07 20:48:33'),(2,'Administrativa',0,'2009-10-07 20:48:38'),(3,'Comercial',0,'2009-10-07 20:48:42');
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
CREATE TABLE `estados` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` char(255) default NULL,
  `borrado` tinyint(1) default NULL,
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadosadministrativos`
--

DROP TABLE IF EXISTS `estadosadministrativos`;
CREATE TABLE `estadosadministrativos` (
  `id` int(11) NOT NULL auto_increment,
  `estado` char(255) NOT NULL,
  `borrado` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estadosadministrativos`
--

LOCK TABLES `estadosadministrativos` WRITE;
/*!40000 ALTER TABLE `estadosadministrativos` DISABLE KEYS */;
INSERT INTO `estadosadministrativos` VALUES (1,'Pendiente',0),(2,'En proceso',0),(3,'Derivado al Ã¡rea tÃ©cnica',0),(4,'Baja del cliente',0),(5,'Alta del cliente',0),(6,'Finalizado',0);
/*!40000 ALTER TABLE `estadosadministrativos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadostecnicos`
--

DROP TABLE IF EXISTS `estadostecnicos`;
CREATE TABLE `estadostecnicos` (
  `id` int(11) NOT NULL auto_increment,
  `estado` char(255) NOT NULL,
  `borrado` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estadostecnicos`
--

LOCK TABLES `estadostecnicos` WRITE;
/*!40000 ALTER TABLE `estadostecnicos` DISABLE KEYS */;
INSERT INTO `estadostecnicos` VALUES (1,'Pendiente',0),(2,'En proceso',0),(3,'Volver a comunicarse',0),(4,'Derivado a Ã¡rea administrativa',0),(5,'Alta tÃ©cnica',0);
/*!40000 ALTER TABLE `estadostecnicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
CREATE TABLE `eventos` (
  `id` int(11) NOT NULL auto_increment,
  `ticket` mediumtext NOT NULL,
  `fecha` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `comentario` text NOT NULL,
  `estadotecnico` int(11) default NULL,
  `estadoadministrativo` int(11) default NULL,
  `borrado` tinyint(1) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (16,'80','2009-10-26 18:18:39',1,'en gr',1,2,0),(17,'81','2009-10-26 18:19:28',1,'asdfasdf',3,5,0),(18,'79','2009-10-26 18:21:04',1,'asdfasdfasdf',6,6,0),(19,'81','2009-10-26 21:11:04',1,'asdfasdf',5,6,0),(20,'81','2009-10-26 21:21:05',1,'asdasd',2,3,0),(21,'80','2009-10-26 21:26:03',1,'asdf',1,2,0),(22,'80','2009-10-26 21:26:42',1,'asdfasdf',4,3,0),(23,'80','2009-10-26 21:27:53',1,'asdfasdf',4,3,0),(24,'79','2009-10-26 21:28:10',1,'asdfasdf',2,1,0),(25,'79','2009-10-26 21:28:43',1,'asdfasdf',1,1,0),(26,'79','2009-10-26 21:28:55',1,'asdfasdf',1,1,0),(27,'79','2009-10-26 21:29:12',1,'asdfasdf',4,5,0),(28,'79','2009-10-26 21:30:01',1,'asdfasdf',2,0,0),(29,'81','2009-10-27 16:47:07',1,'asdf',5,0,0),(30,'81','2009-10-27 16:49:36',1,'asdfasdf',0,6,0),(31,'81','2009-10-27 16:49:59',1,'asdfasfasdf',0,3,0),(32,'81','2009-10-27 16:50:53',1,'adsf',0,0,0),(33,'80','2009-10-27 16:51:13',1,'asdf',3,3,0),(34,'81','2009-10-27 16:54:49',1,'asdfasdf',5,1,0),(35,'81','2009-10-27 16:56:11',1,'asdf',2,3,0),(36,'82','2009-10-27 17:27:49',1,'por comenzar',1,1,0),(37,'80','2009-10-27 18:38:55',1,'asdfasdf ',2,0,0),(38,'79','2009-10-27 18:39:13',1,'asdf ',4,0,0);
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` char(255) default NULL,
  `borrado` tinyint(1) default '0',
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Servicio Internet 512Kb',0,'2009-10-07 20:50:22'),(2,'Servicio Internet 1Mbit',0,'2009-10-07 20:50:22'),(3,'Servicio Internet 256Kb',0,'2009-10-07 20:50:22');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reclamostandard`
--

DROP TABLE IF EXISTS `reclamostandard`;
CREATE TABLE `reclamostandard` (
  `id` int(11) NOT NULL auto_increment,
  `reclamo` char(255) NOT NULL,
  `descripcion` text,
  `borrado` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reclamostandard`
--

LOCK TABLES `reclamostandard` WRITE;
/*!40000 ALTER TABLE `reclamostandard` DISABLE KEYS */;
INSERT INTO `reclamostandard` VALUES (1,'Sin Servicio','El cliente indica no tener servicio',0);
/*!40000 ALTER TABLE `reclamostandard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servidores`
--

DROP TABLE IF EXISTS `servidores`;
CREATE TABLE `servidores` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` char(255) NOT NULL,
  `usuariomysql` char(255) default NULL,
  `passwordmysql` char(255) default NULL,
  `ip` char(15) default NULL,
  `borrado` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `servidores`
--

LOCK TABLES `servidores` WRITE;
/*!40000 ALTER TABLE `servidores` DISABLE KEYS */;
INSERT INTO `servidores` VALUES (1,'Local','root','','127.0.0.1',0),(2,'Tucuman','crm','chupacabras','190.220.133.98',0);
/*!40000 ALTER TABLE `servidores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE `tickets` (
  `id` int(11) NOT NULL auto_increment,
  `ingresado` datetime default NULL,
  `servidor` int(11) default '0',
  `producto` int(11) default '0',
  `cliente` varchar(255) default NULL,
  `fechora` datetime NOT NULL,
  `reclamostandard` int(11) default '0',
  `descripcion` text,
  `usuario` int(11) NOT NULL,
  `tipoticket` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `estadotecnico` int(11) default '0',
  `estadoadministrativo` int(11) default '0',
  `borrado` tinyint(1) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (79,'2009-10-27 14:25:54',1,1,'7-Viviana','0000-00-00 00:00:00',0,'asdfasdf',1,2,'2009-10-27 18:39:13',4,0,0),(80,'2009-10-27 14:25:54',2,2,'5-Esteban','0000-00-00 00:00:00',0,'asdf',1,4,'2009-10-27 18:38:55',2,0,0),(81,'2009-10-27 14:25:54',2,2,'1-Esteban','0000-00-00 00:00:00',0,'asdfasdf',1,2,'2009-10-27 17:25:54',2,3,0),(82,'2009-10-27 14:27:17',2,2,'2-Pablo','0000-00-00 00:00:00',0,'sdfasdfa asdf asdf ',1,3,'2009-10-27 17:27:49',1,1,0);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipotickets`
--

DROP TABLE IF EXISTS `tipotickets`;
CREATE TABLE `tipotickets` (
  `id` int(11) NOT NULL auto_increment,
  `tipo` varchar(255) NOT NULL,
  `borrado` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipotickets`
--

LOCK TABLES `tipotickets` WRITE;
/*!40000 ALTER TABLE `tipotickets` DISABLE KEYS */;
INSERT INTO `tipotickets` VALUES (1,'Alta de producto',0),(2,'Reclamo tÃ©cnico',0),(3,'Reclamo administrativo',0),(4,'Otro',0);
/*!40000 ALTER TABLE `tipotickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` char(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `area` int(11) NOT NULL,
  `borrado` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Administrador','admin','21232f297a57a5a743894a0e4a801fc3',1,0);
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

-- Dump completed on 2009-10-29 15:21:35

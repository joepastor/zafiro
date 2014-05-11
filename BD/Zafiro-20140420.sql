CREATE DATABASE  IF NOT EXISTS `zafiro` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `zafiro`;
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.6 (i386)
--
-- Host: 127.0.0.1    Database: zafiro
-- ------------------------------------------------------
-- Server version	5.6.17

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valor` int(10) unsigned DEFAULT '0',
  `descripcion` char(200) DEFAULT '',
  `comando` char(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acciones`
--

LOCK TABLES `acciones` WRITE;
/*!40000 ALTER TABLE `acciones` DISABLE KEYS */;
INSERT INTO `acciones` VALUES (1,0,'Apaga el sistema','shutdown -h now'),(2,0,'Reinicia el servidor','reboot'),(3,0,'Reiniciar servicio de red','/etc/init.d/networking restart'),(4,0,'Reiniciar VPN','/etc/init.d/openvpn restart'),(5,0,'DHCP','/etc/init.d/isc-dhcp-server restart'),(6,0,'Ejecutar Zafiro',NULL);
/*!40000 ALTER TABLE `acciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canales`
--

DROP TABLE IF EXISTS `canales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canales` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `subida` int(10) unsigned NOT NULL DEFAULT '0',
  `bajada` int(10) unsigned NOT NULL DEFAULT '0',
  `estado` int(10) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canales`
--

LOCK TABLES `canales` WRITE;
/*!40000 ALTER TABLE `canales` DISABLE KEYS */;
INSERT INTO `canales` VALUES (1,256,256,2,'256Kbps'),(2,2048,2048,0,'2Mbps'),(3,5,10,2,'S5/B10'),(4,256,256,0,'256Kbps'),(5,128,128,0,'128Kbps'),(6,512,512,0,'512Kbps'),(0,1024,1024,0,'1Mbps');
/*!40000 ALTER TABLE `canales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `descripcion` varchar(255) NOT NULL DEFAULT '',
  `macaddress` varchar(45) NOT NULL DEFAULT '',
  `clientesper` int(10) unsigned NOT NULL DEFAULT '0',
  `estado` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` int(10) unsigned NOT NULL DEFAULT '0',
  `fecha_alta` int(10) unsigned NOT NULL DEFAULT '0',
  `fecha_baja` int(10) unsigned DEFAULT NULL,
  `plan` int(10) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(45) NOT NULL DEFAULT '',
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `cuit` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `enruta_proxy` int(11) DEFAULT NULL,
  `salida_habilitada` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=479 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (3,'Desktop','00:1C:C0:38:21:62',0,0,107,20121010,0,2,'PC07','','','','',1,0),(77,'Central VoIP','70:71:bc:71:98:2a',0,0,2,0,0,3,'Asterisk','','','','',0,1),(116,'Desktop','00:0B:6A:BF:AA:5E',0,0,105,20121010,0,2,'PC05','','','','',1,0),(123,'Desktop','00:0B:6A:C6:53:DF',0,0,108,20121010,0,2,'PC08','','','','',1,0),(124,'Desktop','00:0B:6A:BE:93:79',0,0,103,20121010,0,2,'PC03','','','','',1,0),(133,'Desktop','00:27:0e:16:27:b3',0,0,71,20120618,0,2,'Backup','','','','',1,1),(136,'Desktop','00:0B:6A:BF:94:26',0,0,112,20121005,0,8,'PC12','','','','',1,0),(138,'Desktop','00:27:0E:16:AC:39',0,0,56,20121002,0,8,'Carlos Rodriguez','','','','',1,1),(141,'Desktop','00:0B:6A:C6:5E:8F',0,0,104,20120831,0,2,'PC04','','','','',1,0),(153,'Desktop','00:0E:A6:A9:EF:34',0,0,115,20121005,0,2,'PC15','','','','',1,0),(156,'Desktop','00:0B:6A:A8:A9:24',0,0,114,20121005,0,2,'PC14','','','','',1,0),(159,'Desktop','10:78:d2:8a:2a:1a',0,0,109,20120730,0,2,'PC09','','','','',1,0),(160,'Desktop en Data center','00:1C:C0:B1:3B:F3',0,0,10,20120703,0,8,'Backup 1','','','','',1,1),(161,'Desktop','00:0B:6A:BF:A3:40',0,0,113,20121003,0,2,'PC13','','','','',1,0),(164,'Desktop','00:19:66:46:ef:10',0,0,116,20121010,0,2,'PC16','','','','',1,0),(167,'Desktop','00:0B:6A:BF:A5:CD',0,0,117,20121005,0,2,'PC17','','','','',1,0),(168,'Desktop','00:0B:6A:BF:88:85',0,0,102,20121010,0,2,'PC02','','','','',1,0),(169,'Desktop','00:0B:6A:BF:A5:C1',0,0,106,20121010,0,2,'PC06','','','','',1,0),(170,'Desktop','00:0B:6A:BF:88:59',0,0,101,20121010,0,2,'PC01','','','','',1,0),(177,'Desktop Recepcion Vte. Lopez','48:5B:39:A3:67:8D',0,0,122,20121010,0,2,'PC22','','','','',1,0),(180,'Desktop - Sala Reunion','10:78:d2:1b:9b:c3',0,0,151,20120712,0,2,'PC51','','','','',1,0),(467,'Notebook Ethernet','00:24:e8:84:06:21',0,0,24,20131127,0,2,'Sistemas','','','','',0,1),(185,'Desktop','10:78:D2:8A:43:EF',0,0,100,20121005,0,2,'Sonia Toconas','','','','',1,1),(198,'Notebook','00:24:54:6E:26:E2',0,2,243,20130411,0,2,'Sonia Toconas','','','','',1,1),(470,'SERVER MASTER','00:25:90:d8:e5:ac',0,0,7,20131210,0,3,'SERVER MASTER','','','','',0,1),(196,'Desktop','00:19:66:29:8D:E6',0,0,125,20121005,0,2,'PC25','','','','',1,0),(200,'Camara Seguridad 2','00:6b:58:2c:2c:55',0,0,8,20131101,0,3,'DVR 2','','','','',0,1),(201,'Camara Seguridad 1','00:5e:09:07:fc:0a',0,0,9,20131101,0,3,'DVR 1','','','','',0,1),(206,'Desktop','44:87:fc:ef:f1:0c',0,0,119,20121005,0,2,'PC19','','','','',1,0),(207,'Desktop','44:87:fc:ef:f3:72',0,0,110,20121002,0,2,'PC10','','','','',1,0),(208,'Desktop','44:87:fc:ef:f3:73',0,2,124,20121003,0,2,'PC en REPARACION','','','','',1,0),(209,'Desktop','44:87:fc:ef:f1:e1',0,0,123,20121005,0,2,'PC23','','','','',1,0),(210,'Desktop','44:87:fc:ef:f2:b4',0,0,120,20121005,0,2,'PC20','','','','',1,0),(219,'Desktop','44:87:fc:ef:f0:f9',0,0,121,20120920,0,2,'PC21','','','','',1,0),(220,'Sistema Puertas','00:30:4f:79:29:f9',0,0,22,20120713,0,8,'ICS-100 Call Center','','','','',0,1),(221,'Equipo telular 8 bocas','00:03:7e:00:c4:ae',0,0,3,20130807,0,3,'Telular 1','','','','',1,1),(222,'Sistema Puertas','00:30:4f:79:2a:a7',0,1,22,20120713,0,8,'ICS-100 Call Center','','','','',0,1),(223,'Desktop','44:87:fc:eb:77:12',0,0,111,20120920,0,2,'PC11','','','','',1,0),(224,'Print Server','00:40:01:2e:15:55',0,0,40,20121005,0,8,'Office','','','','',1,1),(225,'Desktop Asesora Vte. Lopez','44:87:fc:eb:8d:49',0,0,150,20120625,0,2,'PC50','','','','',1,0),(226,'Desktop','44:87:fc:eb:8f:6f',0,0,144,20121002,0,2,'PC44','','','','',1,0),(231,'Desktop','00:e0:4c:91:c0:04',0,0,57,20110407,0,2,'Controlador Fiscal 1','','','','',1,0),(243,'Desktop','10:78:d2:8a:45:71',0,0,131,20121010,0,2,'PC31','','','','',1,0),(269,'Desktop','10:78:d2:17:3a:85',0,0,139,20121002,0,2,'PC39','','','','',1,0),(244,'Desktop','10:78:d2:8a:2b:fe',0,0,127,20121002,0,2,'PC27','','','','',1,0),(245,'Desktop','10:78:d2:8a:79:5c',0,0,140,20121002,0,2,'PC40','','','','',1,0),(251,'Desktop','00:0B:6A:BF:A5:EB',0,0,132,20121003,0,2,'PC32','','','','',1,0),(246,'Desktop','10:78:d2:8a:44:07',0,0,128,20121002,0,2,'PC28','','','','',1,0),(247,'Desktop','10:78:d2:8a:44:e1',0,0,133,20121003,0,2,'PC33','','','','',1,0),(248,'Desktop','10:78:d2:8a:44:48',0,0,130,20121002,0,2,'PC30','','','','',1,0),(250,'Desktop','00:0b:6a:bf:9d:71',0,0,129,20121002,0,2,'PC29','','','','',1,0),(252,'Desktop','10:78:d2:1b:9a:ca',0,0,118,20120920,0,2,'PC18','','','','',1,0),(261,'Vostro Wireless','e0:06:e6:07:3c:87',0,0,36,20121002,0,3,'Jose Lopez','','','','',0,1),(265,'Desktop','00:11:09:c4:ba:e7',0,0,134,20121010,0,2,'PC34','','','','',1,0),(271,'Desktop','10:78:d2:1b:9b:c8',0,0,138,20120918,0,2,'PC38','','','','',1,0),(272,'Desktop','10:78:d2:1b:9b:ef',0,0,135,20121002,0,2,'PC35','','','','',1,0),(273,'Desktop','10:78:d2:1b:9b:9c',0,0,137,20121002,0,2,'PC37','','','','',1,0),(274,'Desktop','10:78:d2:1b:9b:96',0,0,136,20121002,0,2,'PC36','','','','',1,0),(281,'Switch','00:11:3b:18:87:57',0,0,4,0,0,8,'Micronet','','','','',1,1),(282,'Equipo telular 8 bocas','00:03:7e:00:7e:38',0,0,6,20130807,0,8,'Telular 2','','','','',1,1),(462,'NO TOCAR','FF:FF:FA:FF:FF:F0',0,2,1,20131101,0,2,'NO UTILIZAR','','','','',0,0),(286,'Vostro Ethernet','24:b6:fd:4d:ba:bc',0,0,33,20121002,0,3,'Jose Lopez','','','','',1,1),(291,'Desktop','00:e0:52:b3:41:67',0,2,191,20121002,0,8,'Servidor caballito 2','','','','',0,0),(472,'Samsung','98:0c:82:cf:59:fa',0,0,12,20131218,0,8,'Celular','','','','',1,1),(473,'asd','00:80:f0:d1:d1:2a',0,1,42,20131230,0,8,'telefono belgrano','','','','',0,0),(295,'Desktop','00:19:66:64:53:e3',0,0,141,20121010,0,2,'PC41','','','','',1,0),(298,'Desktop','00:11:09:c4:bd:64',0,0,152,20121001,0,2,'PC52','','','','',1,0),(321,'Linksys wrt54g','00:1e:e5:34:b3:a8',0,2,7,20121002,0,8,'Router Wifi','','','','',0,1),(323,'Desktop','00:1c:c0:37:40:b7',0,0,73,20121002,0,8,'Mariela Rossetti','','','','',1,1),(330,'Desktop','00:0b:6a:bf:a3:3f',0,0,67,20121002,0,2,'Controlador Fiscal 2','','','','',1,0),(341,'Desktop','00:0b:6a:c6:54:05',0,0,148,20120816,0,2,'PC48','','','','',1,0),(343,'Desktop','00:0b:6a:bf:a7:71',0,0,143,20120625,0,2,'PC43','','','','',1,0),(348,'Gateway Grandstream','00:0b:82:11:b9:2d',0,0,80,20121002,0,2,'Sala de Reuniones','','','','',1,1),(353,'Desktop','00:80:ad:b0:4c:47',0,0,147,20120705,0,2,'PC47','','','','',1,0),(358,'Notebook Ethernet','f0:de:f1:87:cb:2c',0,0,62,20120821,0,7,'Alejandro Rogers','','','','',1,1),(475,'.','70:71:bc:72:72:c6',0,0,14,20140115,0,3,'Servidor virtualizado','','','','',0,1),(476,'Notebook Samsung','18:67:b0:66:5c:8b',0,0,49,20140117,0,7,'Alejandro Rogers','','','','',1,1),(477,'Backup','00:08:54:a5:f0:8c',0,0,18,20140120,0,3,'I-Drive','','','','',0,1),(478,'Notebook Samsung Ethernet','e8:03:9a:53:01:65',0,0,19,20140124,0,7,'Alejandro Rogers','','','','',1,1),(365,'Desktop','00:0b:6a:bf:79:6d',0,0,145,20120905,0,2,'PC45','','','','',1,0),(446,'Notebook Lenovo WIFI','00:21:6b:ca:89:d0',0,0,72,20130911,0,7,'Manuela Gaitto','','','','',1,1),(471,'cel','98:0c:82:cf:59:fa',0,1,89,20131218,0,8,'Ce','','','','',0,0),(466,'Lenovo WIFI','00:1c:25:9f:e2:82',0,0,60,20131127,0,2,'Claudia Mattiussi','','','','',0,1),(394,'Desktop','00:11:09:c4:bd:58',0,0,142,20130423,0,2,'PC42','','','','',1,0),(370,'Router Wireless 2','00:25:9c:f5:ad:70',0,1,5,20121003,0,2,'WiFi Vicente Lopez','','','','',0,0),(469,'Television','48:02:2a:b4:ee:e1',0,0,5,20131202,0,3,'Android TV','','','','',1,1),(464,'Desktop','00:e0:52:b2:62:55',0,0,153,20131106,0,2,'PC53','','','','',1,0),(474,'Notebook','74:de:2b:d2:2b:cf',0,0,34,20140114,0,8,'Carlos','','','','',1,1),(468,'servidor temporal','00:11:d8:f9:fd:73',0,0,21,20131128,0,7,'Servidor temporal','','','','',0,1),(374,'Desktop ','00:27:0e:15:9d:38',0,0,61,20121015,0,7,'Erica Mirkouski','','','','',1,1),(412,'Notebook WIFI','78:dd:08:e0:20:c6',0,2,49,20130607,0,8,'Manuela Gaitto','','','','',1,1),(375,'Servidor','00:19:21:19:3d:7e',0,0,13,20121102,0,8,'Zafiro Backup','','','','',0,1),(414,'Notebook WIFI','e4:d5:3d:12:3a:db',0,0,26,20130611,0,7,'Dan Wyrytowski','','','','',1,1),(379,'Netbook','48:5d:60:dc:7d:37',0,2,24,20121109,0,8,'Dario Juarez','','','','',0,0),(380,'TP-LINK tl-mr3420','54:e6:fc:bc:1e:39',0,2,17,20121120,0,8,'Router wi-fi','','','','',0,1),(384,'Desktop','00:0b:6a:bf:9f:fa',0,0,146,20121203,0,2,'PC46','','','','',1,0),(395,'Notebook WIFI','00:26:82:05:cd:35',0,0,206,20130426,0,8,'Asesora Vicente Lopez','','','','',1,0),(389,'Notebook Ethernet','80:c1:6e:59:1b:df',0,2,82,20130311,0,8,'Manuela Gaitto','','','','',1,1),(390,'Multifuncion HP 3050','ec:9a:74:69:ef:66',0,0,30,20130325,0,2,'Impresora Reuniones','','','','',0,0),(391,'Linksys wrt54g','00:1e:e5:34:b3:a7',0,2,14,20130416,0,3,'Router Vte Lopez','','','','',0,1),(392,'Netbook HP mini','c0:18:85:6e:df:6a',0,0,205,20130416,0,8,'Asesora Lucia Barrios','','','','',1,0),(465,'Tablet','4c:bc:a5:47:e4:3a',0,0,97,20131107,0,8,'Claudia Mattiussi','','','','',1,1),(396,'Notebook WIFI','78:e4:00:d3:ee:d5',0,0,38,20130429,0,8,'Sistemas','','','','',1,1),(398,'Desktop ','00:0b:6a:74:88:6a',0,0,124,20130507,0,2,'PC24','','','','',1,0),(400,'Impresora Tesoreria','28:92:4a:a6:11:7a',0,0,32,20130517,0,8,'HPDESKJET3050','','','','',1,1),(402,'Desktop','00:27:0e:1c:28:ac',0,0,35,20130522,0,2,'Onell Lanfranco','','','','',1,1),(403,'MacbookPro WIFI','4c:8d:79:e9:51:36',0,0,39,20130522,0,7,'Onell Lanfranco','','','','',1,1),(404,'Telefono Cisco','00:0d:28:8f:9e:6f',0,0,45,20130522,0,8,'Cinthia Cabrino','','','','',0,1),(405,'Telefono IP Panasonic','00:80:f0:d1:ce:23',0,0,44,20130524,0,8,'Onell Lanfranco','','','','',0,1),(406,'Telefono IP Panasonic','00:80:f0:d1:cd:dc',0,0,202,20130527,0,8,'Dario Juarez','','','','',1,1),(408,'Telefono IP Panasonic','00:80:f0:d1:d5:4e',0,0,201,20130528,0,2,'Sistemas','','','','',1,1),(409,'Telefono IP Panasonic','00:80:f0:d1:d5:46',0,0,203,20130528,0,8,'Vicente López Recepción','','','','',1,1),(410,'Telefono IP Panasonic','00:80:f0:d1:d1:9f',0,0,200,20130529,0,8,'Erica Mirkouski','','','','',1,1),(411,'Gateway Grandstream','00:0b:82:14:dc:47',0,0,46,20130530,0,8,'Mariela Rossetti','','','','',0,1),(415,'Carlos Rodriguez','00:80:f0:d1:d1:dd',0,0,204,20130614,0,8,'Telefono IP Panasonic','','','','',1,1),(417,'Impresora Wireleess','00:15:99:ac:98:99',0,0,31,20130619,0,2,'Impresora Onell','','','','',0,1),(418,'Notebook WIFI','94:39:e5:0e:73:15',0,0,29,20130619,0,7,'Alejandro Rogers','','','','',1,1),(422,'iPhone','c8:6f:1d:0b:3e:66',0,0,37,20130711,0,7,'Onell Lanfranco','','','','',1,1),(423,'iPad','9c:04:eb:e9:b5:3a',0,0,50,20130715,0,8,'Jose Lopez','','','','',1,1),(433,'MacbookPro Ethernet','10:dd:b1:aa:09:3a',0,0,48,20130802,0,3,'Onell Lanfranco','','','','',1,1),(434,'Notebook WIFI','b8:03:05:4e:e1:43',0,0,54,20130802,0,2,'Sonia Toconas','','','','',1,1),(463,'Telefono Sony Ericsson','30:39:26:65:8b:8e',0,0,90,20131106,0,8,'Claudia Mattiussi','','','','',1,1),(435,'Desktop','44:87:fc:ef:f3:73',0,0,149,20130807,0,2,'PC49','','','','',1,0),(438,'Desktop','00:0b:6a:bf:79:58',0,0,16,20130814,0,8,'Depilight TV','','','','',1,1),(444,'Notebook Lenovo WIFI','00:22:fa:2d:c8:a6',0,0,17,20130910,0,7,'Claudia Mattiussi','','','','',1,1),(445,'Notebook Lenovo WIFI','00:26:c6:c6:7e:c4',0,0,43,20130910,0,7,'Dario Juarez','','','','',1,1),(447,'Notebook Lenovo LAN','00:22:68:19:c9:96',0,0,99,20130913,0,8,'Dario Juarez','','','','',1,1),(451,'Notebook Lenovo WIFI','00:1c:25:9f:e2:82',0,2,25,20130923,0,7,'Claudia Mattiussi ','','','','',1,1),(452,'ROTA QUE SE APAGA','00:26:9e:d9:f6:fc',0,0,51,20130924,0,8,'Toshiba Satellite','','','','',1,1),(453,'Blackberry Bold','40:6f:2a:da:1c:01',0,0,11,20130925,0,8,'Jose Lopez','','','','',1,1),(454,'Desktop ','00:1b:b9:e2:51:7e',0,0,15,20131002,0,8,'Alejandro Rogers','','','','',1,1),(456,'Telefono Motorola','80:96:b1:df:d1:77',0,0,59,20131009,0,8,'Dario Juarez','','','','',0,1),(457,'Recepcion Billing','00:0b:6a:bf:a7:70',0,2,19,20131011,0,8,'Desktop XUBUNTU','','','','',1,1),(458,'iPad','bc:3b:af:c3:21:0e',0,0,98,20131018,0,8,'Alejandro Rogers','','','','',1,1),(459,'Desktop','00:0b:6a:c6:5e:6f',0,2,153,20131018,0,2,'PC53','','','','',1,0),(460,'Desktop','00:19:d1:20:e2:0a',0,0,154,20131029,0,2,'PC54','','','','',1,0),(461,'Apple TV','f4:f9:51:c8:db:ed',0,0,47,20131029,0,7,'Onell Lanfranco','','','','',1,1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filtros`
--

DROP TABLE IF EXISTS `filtros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filtros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(255) DEFAULT NULL,
  `tipo` char(10) DEFAULT NULL,
  `ipsource` char(15) DEFAULT NULL,
  `ipdestino` char(15) DEFAULT NULL,
  `puertosource` char(255) DEFAULT NULL,
  `puertodestino` char(255) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `interfaceentrada` char(20) DEFAULT NULL,
  `interfacesalida` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
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
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firewall`
--

LOCK TABLES `firewall` WRITE;
/*!40000 ALTER TABLE `firewall` DISABLE KEYS */;
INSERT INTO `firewall` VALUES (1,'23',2,'acaca',1),(2,'-A INPUT -p tcp --dport 3784 -j ACCEPT',2,'Ventrilo',1),(3,'-A OUTPUT -p tcp --sport 3784 -j ACCEPT',2,'Ventrilo Out',2),(4,'iptables -A INPUT -p udp --dport 3784 -j ACCEPT',2,'Ventrilo IN UDP',3),(5,'iptables iptables -A OUTPUT -p udp --sport 3784 -j ACCEPT',2,'Ventrilo OUT UDP',4),(6,'-A FORWARD -s 172.16.50.1 -j LOG --log-prefix \'JOE-------\'',2,'probando',1),(7,'-A INPUT -s 201.216.237.165 -p tcp --sport 800 -j ACCEPT',2,'AGA',2),(8,'-A OUTPUT -d 201.216.237.165 -p tcp --dport 800 -j ACCEPT',2,'AGA',2),(9,'-t nat -A PREROUTING -p tcp --dport 8923 -j DNAT --to 172.16.0.4:22',2,'SSH a la cerda',1),(10,'-A OUTPUT -p 443 -d sps.decidir.com -j ACCEPT',2,'SPS',4),(11,'-A FORWARD -d sps.decidir.com -j ACCEPT',2,'SPS OUT',6),(12,'-A FORWARD -s sps.decidir.com -j ACCEPT',2,'SPS IN',7),(13,'-A FORWARD -d 200.80.194.18 -p udp -j ACCEPT',0,'DNS SPS 1/4',5),(14,'-A FORWARD -s 200.80.194.18 -p udp -j ACCEPT',0,'DNS SPS 2/4',5),(15,'-A FORWARD -d 200.80.194.18 -p tcp -j ACCEPT',0,'DNS SPS 3/4',5),(16,'-A FORWARD -s 200.80.194.18 -p tcp -j ACCEPT',0,'DNS SPS 4/4',5),(17,'-P INPUT ACCEPT',2,'FIX TEMPORAL',0),(18,'-P OUTPUT ACCEPT',2,'FIX TEMPORAL 2',0),(19,'-A FORWARD -d 200.69.248.13 -j ACCEPT',0,'sps.decidir.com IP 1 OUT',1),(20,'-A FORWARD -s 200.69.248.13 -j ACCEPT',0,'sps.decidir.com IP 1 IN',1),(21,'-A FORWARD -s 190.221.46.236 -j ACCEPT',0,'sps.decidir.com IP 2 IN',1),(22,'-A FORWARD -d 190.221.46.236 -j ACCEPT',0,'sps.decidir.com IP 2 OUT',1),(23,'-A FORWARD -s 200.80.195.18 -p udp -j ACCEPT',0,'DNS SPS 5/6',7),(24,'-A FORWARD -d 200.80.195.18 -p udp -j ACCEPT',0,'DNS SPS 6/6',7),(25,'-A FORWARD -d 190.221.46.236 -j ACCEPT',0,'SPS IP2 OUT',1),(26,'-A OUTPUT -o eth0 -p tcp --sport 3128 -j ACCEPT',0,'PROXY OUT',10),(27,'-A INPUT -i eth0 -p tcp --dport 3128 -j ACCEPT',0,'PROXY IN',10),(28,'-A FORWARD -d 190.2.45.229 -j ACCEPT',0,'www.depilight.com/O',10),(29,'-A FORWARD -s 190.2.45.229 -j ACCEPT',0,'www.depilight.com/I',10),(30,'-t nat -A PREROUTING -i eth0 -p tcp --dport 80 -s 172.16.0.33 -j REDIRECT --to-port 3128',2,'LUCHO PROXY TEST',9),(31,'-A OUTPUT -o eth1 -p tcp --sport 3128 -j ACCEPT',2,'DAN PROXY OUT',15),(32,'-A INPUT -i eth1 -p tcp --dport 3128 -j ACCEPT',2,'DAN PROXY IN',15),(33,'-A FORWARD -d 190.2.29.105 -j ACCEPT',0,'TELEFONOS DESDE AFUERA OUT',10),(34,'-A FORWARD -s 190.2.29.105 -j ACCEPT',0,'TELEFONOS DESDE AFUERA IN',11),(35,'-t nat -A PREROUTING -i eth1 -p udp -s 0.0.0.0/0 --dport 4097 -j DNAT --to 172.16.0.36:4097',2,'virloc',10);
/*!40000 ALTER TABLE `firewall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forwardeos`
--

DROP TABLE IF EXISTS `forwardeos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forwardeos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `puesrc` int(10) unsigned NOT NULL DEFAULT '0',
  `puedst` int(10) unsigned NOT NULL DEFAULT '0',
  `ipdst` varchar(45) NOT NULL DEFAULT '',
  `estado` int(10) unsigned NOT NULL DEFAULT '0',
  `ipsrc` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forwardeos`
--

LOCK TABLES `forwardeos` WRITE;
/*!40000 ALTER TABLE `forwardeos` DISABLE KEYS */;
INSERT INTO `forwardeos` VALUES (3,8945,22,'172.16.45.2',2,'0.0.0.0'),(4,8946,22,'172.16.45.2',2,'190.55.122.129'),(5,8947,80,'172.16.45.2',2,'190.55.122.129'),(6,8948,443,'172.16.45.2',2,'190.55.122.129'),(7,8949,80,'172.16.45.2',0,'190.190.176.45'),(8,9856,80,'172.16.0.37',1,'0.0.0.0'),(9,4097,4097,'172.16.0.36',0,'0.0.0.0');
/*!40000 ALTER TABLE `forwardeos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interfaces`
--

DROP TABLE IF EXISTS `interfaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interfaces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device` varchar(7) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `netmask` varchar(15) NOT NULL,
  `network` varchar(15) NOT NULL,
  `broadcast` varchar(15) NOT NULL,
  `gateway` varchar(15) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interfaces`
--

LOCK TABLES `interfaces` WRITE;
/*!40000 ALTER TABLE `interfaces` DISABLE KEYS */;
INSERT INTO `interfaces` VALUES (1,'eth0','LAN','192.168.0.1','255.255.255.0','192.168.0.0','192.168.0.255','192.168.0.20',1),(2,'eth1','WAN','','255.255.255.0','1.1.1.0','1.1.1.255',NULL,1);
/*!40000 ALTER TABLE `interfaces` ENABLE KEYS */;
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(45) NOT NULL DEFAULT '',
  `estado` int(10) unsigned NOT NULL DEFAULT '0',
  `cliente` int(10) unsigned NOT NULL DEFAULT '0',
  `interface` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
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
-- Table structure for table `planes`
--

DROP TABLE IF EXISTS `planes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planes` (
  `id` int(10) unsigned NOT NULL,
  `dia` int(10) unsigned NOT NULL DEFAULT '0',
  `hora` int(10) unsigned NOT NULL DEFAULT '0',
  `canal` int(10) unsigned NOT NULL DEFAULT '0',
  `estado` int(10) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(45) NOT NULL DEFAULT '',
  `valor` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planes`
--

LOCK TABLES `planes` WRITE;
/*!40000 ALTER TABLE `planes` DISABLE KEYS */;
INSERT INTO `planes` VALUES (4,4,23,5,2,'123123',0),(4,3,23,5,2,'123123',0),(4,2,23,5,2,'123123',0),(4,1,23,5,2,'123123',0),(4,7,22,5,2,'123123',0),(4,6,22,5,2,'123123',0),(4,5,22,5,2,'123123',0),(4,4,22,5,2,'123123',0),(4,3,22,5,2,'123123',0),(4,2,22,5,2,'123123',0),(4,1,22,5,2,'123123',0),(4,7,21,5,2,'123123',0),(4,6,21,5,2,'123123',0),(4,5,21,5,2,'123123',0),(4,4,21,5,2,'123123',0),(4,3,21,5,2,'123123',0),(4,2,21,5,2,'123123',0),(4,1,21,5,2,'123123',0),(4,7,20,5,2,'123123',0),(4,6,20,5,2,'123123',0),(4,5,20,5,2,'123123',0),(4,4,20,5,2,'123123',0),(4,3,20,5,2,'123123',0),(4,2,20,5,2,'123123',0),(4,1,20,5,2,'123123',0),(4,7,19,5,2,'123123',0),(4,6,19,5,2,'123123',0),(4,5,19,5,2,'123123',0),(4,4,19,5,2,'123123',0),(4,3,19,5,2,'123123',0),(4,2,19,5,2,'123123',0),(4,1,19,5,2,'123123',0),(4,7,18,5,2,'123123',0),(4,6,18,5,2,'123123',0),(4,5,18,5,2,'123123',0),(4,4,18,5,2,'123123',0),(4,3,18,5,2,'123123',0),(4,2,18,5,2,'123123',0),(4,1,18,5,2,'123123',0),(4,7,17,5,2,'123123',0),(4,6,17,5,2,'123123',0),(4,5,17,5,2,'123123',0),(4,4,17,5,2,'123123',0),(4,3,17,5,2,'123123',0),(4,2,17,5,2,'123123',0),(4,1,17,5,2,'123123',0),(4,7,16,5,2,'123123',0),(4,6,16,5,2,'123123',0),(4,5,16,5,2,'123123',0),(4,4,16,5,2,'123123',0),(4,3,16,5,2,'123123',0),(4,2,16,5,2,'123123',0),(4,1,16,5,2,'123123',0),(4,7,15,5,2,'123123',0),(4,6,15,5,2,'123123',0),(4,5,15,5,2,'123123',0),(4,4,15,5,2,'123123',0),(4,3,15,5,2,'123123',0),(4,2,15,5,2,'123123',0),(4,1,15,5,2,'123123',0),(4,7,14,5,2,'123123',0),(4,6,14,5,2,'123123',0),(4,5,14,5,2,'123123',0),(4,4,14,5,2,'123123',0),(4,3,14,5,2,'123123',0),(4,2,14,5,2,'123123',0),(4,1,14,5,2,'123123',0),(4,7,13,5,2,'123123',0),(4,6,13,5,2,'123123',0),(4,5,13,5,2,'123123',0),(4,4,13,5,2,'123123',0),(4,3,13,5,2,'123123',0),(4,2,13,5,2,'123123',0),(4,1,13,5,2,'123123',0),(4,7,12,5,2,'123123',0),(4,6,12,5,2,'123123',0),(4,5,12,5,2,'123123',0),(4,4,12,5,2,'123123',0),(4,3,12,5,2,'123123',0),(4,2,12,5,2,'123123',0),(4,1,12,5,2,'123123',0),(4,7,11,5,2,'123123',0),(4,6,11,5,2,'123123',0),(4,5,11,5,2,'123123',0),(4,4,11,5,2,'123123',0),(4,3,11,5,2,'123123',0),(4,2,11,5,2,'123123',0),(4,1,11,5,2,'123123',0),(4,7,10,5,2,'123123',0),(4,6,10,5,2,'123123',0),(4,5,10,5,2,'123123',0),(4,4,10,5,2,'123123',0),(4,3,10,5,2,'123123',0),(4,2,10,5,2,'123123',0),(4,1,10,5,2,'123123',0),(4,7,9,5,2,'123123',0),(4,6,9,5,2,'123123',0),(4,5,9,5,2,'123123',0),(4,4,9,5,2,'123123',0),(4,3,9,5,2,'123123',0),(4,2,9,5,2,'123123',0),(4,1,9,5,2,'123123',0),(4,7,8,5,2,'123123',0),(4,6,8,5,2,'123123',0),(4,5,8,5,2,'123123',0),(4,4,8,5,2,'123123',0),(4,3,8,5,2,'123123',0),(4,2,8,5,2,'123123',0),(4,1,8,5,2,'123123',0),(4,7,7,5,2,'123123',0),(4,6,7,5,2,'123123',0),(4,5,7,5,2,'123123',0),(4,4,7,5,2,'123123',0),(4,3,7,5,2,'123123',0),(4,2,7,5,2,'123123',0),(4,1,7,5,2,'123123',0),(4,7,6,5,2,'123123',0),(4,6,6,5,2,'123123',0),(4,5,6,5,2,'123123',0),(4,4,6,5,2,'123123',0),(4,3,6,5,2,'123123',0),(4,2,6,5,2,'123123',0),(4,1,6,5,2,'123123',0),(4,7,5,5,2,'123123',0),(4,6,5,5,2,'123123',0),(4,5,5,5,2,'123123',0),(4,4,5,5,2,'123123',0),(4,3,5,5,2,'123123',0),(4,2,5,5,2,'123123',0),(4,1,5,5,2,'123123',0),(4,7,4,5,2,'123123',0),(4,6,4,5,2,'123123',0),(4,5,4,5,2,'123123',0),(4,4,4,5,2,'123123',0),(4,3,4,5,2,'123123',0),(4,2,4,5,2,'123123',0),(4,1,4,5,2,'123123',0),(4,7,3,5,2,'123123',0),(4,6,3,5,2,'123123',0),(4,5,3,5,2,'123123',0),(4,4,3,5,2,'123123',0),(4,3,3,5,2,'123123',0),(4,2,3,5,2,'123123',0),(4,1,3,5,2,'123123',0),(4,7,2,5,2,'123123',0),(4,6,2,5,2,'123123',0),(4,5,2,5,2,'123123',0),(4,4,2,5,2,'123123',0),(4,3,2,5,2,'123123',0),(4,2,2,5,2,'123123',0),(4,1,2,5,2,'123123',0),(4,7,1,5,2,'123123',0),(4,6,1,5,2,'123123',0),(4,5,1,5,2,'123123',0),(4,4,1,5,2,'123123',0),(4,3,1,5,2,'123123',0),(4,2,1,5,2,'123123',0),(4,1,1,5,2,'123123',0),(4,7,0,5,2,'123123',0),(4,6,0,5,2,'123123',0),(4,5,0,5,2,'123123',0),(4,4,0,5,2,'123123',0),(4,3,0,5,2,'123123',0),(4,2,0,5,2,'123123',0),(4,1,0,5,2,'123123',0),(2,1,0,1,0,'CALL CENTER',0),(2,2,0,1,0,'CALL CENTER',0),(2,3,0,1,0,'CALL CENTER',0),(2,4,0,1,0,'CALL CENTER',0),(2,5,0,1,0,'CALL CENTER',0),(2,6,0,1,0,'CALL CENTER',0),(2,7,0,1,0,'CALL CENTER',0),(2,1,1,1,0,'CALL CENTER',0),(2,2,1,1,0,'CALL CENTER',0),(2,3,1,1,0,'CALL CENTER',0),(2,4,1,1,0,'CALL CENTER',0),(2,5,1,1,0,'CALL CENTER',0),(2,6,1,1,0,'CALL CENTER',0),(2,7,1,1,0,'CALL CENTER',0),(2,1,2,1,0,'CALL CENTER',0),(2,2,2,1,0,'CALL CENTER',0),(2,3,2,1,0,'CALL CENTER',0),(2,4,2,1,0,'CALL CENTER',0),(2,5,2,1,0,'CALL CENTER',0),(2,6,2,1,0,'CALL CENTER',0),(2,7,2,1,0,'CALL CENTER',0),(2,1,3,1,0,'CALL CENTER',0),(2,2,3,1,0,'CALL CENTER',0),(2,3,3,1,0,'CALL CENTER',0),(2,4,3,1,0,'CALL CENTER',0),(2,5,3,1,0,'CALL CENTER',0),(2,6,3,1,0,'CALL CENTER',0),(2,7,3,1,0,'CALL CENTER',0),(2,1,4,1,0,'CALL CENTER',0),(2,2,4,1,0,'CALL CENTER',0),(2,3,4,1,0,'CALL CENTER',0),(2,4,4,1,0,'CALL CENTER',0),(2,5,4,1,0,'CALL CENTER',0),(2,6,4,1,0,'CALL CENTER',0),(2,7,4,1,0,'CALL CENTER',0),(2,1,5,1,0,'CALL CENTER',0),(2,2,5,1,0,'CALL CENTER',0),(2,3,5,1,0,'CALL CENTER',0),(2,4,5,1,0,'CALL CENTER',0),(2,5,5,1,0,'CALL CENTER',0),(2,6,5,1,0,'CALL CENTER',0),(2,7,5,1,0,'CALL CENTER',0),(2,1,6,1,0,'CALL CENTER',0),(2,2,6,1,0,'CALL CENTER',0),(2,3,6,1,0,'CALL CENTER',0),(2,4,6,1,0,'CALL CENTER',0),(2,5,6,1,0,'CALL CENTER',0),(2,6,6,1,0,'CALL CENTER',0),(2,7,6,1,0,'CALL CENTER',0),(2,1,7,1,0,'CALL CENTER',0),(2,2,7,1,0,'CALL CENTER',0),(2,3,7,1,0,'CALL CENTER',0),(2,4,7,1,0,'CALL CENTER',0),(2,5,7,1,0,'CALL CENTER',0),(2,6,7,1,0,'CALL CENTER',0),(2,7,7,1,0,'CALL CENTER',0),(2,1,8,1,0,'CALL CENTER',0),(2,2,8,1,0,'CALL CENTER',0),(2,3,8,1,0,'CALL CENTER',0),(2,4,8,1,0,'CALL CENTER',0),(2,5,8,1,0,'CALL CENTER',0),(2,6,8,1,0,'CALL CENTER',0),(2,7,8,1,0,'CALL CENTER',0),(2,1,9,1,0,'CALL CENTER',0),(2,2,9,1,0,'CALL CENTER',0),(2,3,9,1,0,'CALL CENTER',0),(2,4,9,1,0,'CALL CENTER',0),(2,5,9,1,0,'CALL CENTER',0),(2,6,9,1,0,'CALL CENTER',0),(2,7,9,1,0,'CALL CENTER',0),(2,1,10,1,0,'CALL CENTER',0),(2,2,10,1,0,'CALL CENTER',0),(2,3,10,1,0,'CALL CENTER',0),(2,4,10,1,0,'CALL CENTER',0),(2,5,10,1,0,'CALL CENTER',0),(2,6,10,1,0,'CALL CENTER',0),(2,7,10,1,0,'CALL CENTER',0),(2,1,11,1,0,'CALL CENTER',0),(2,2,11,1,0,'CALL CENTER',0),(2,3,11,1,0,'CALL CENTER',0),(2,4,11,1,0,'CALL CENTER',0),(2,5,11,1,0,'CALL CENTER',0),(2,6,11,1,0,'CALL CENTER',0),(2,7,11,1,0,'CALL CENTER',0),(2,1,12,1,0,'CALL CENTER',0),(2,2,12,1,0,'CALL CENTER',0),(2,3,12,1,0,'CALL CENTER',0),(2,4,12,1,0,'CALL CENTER',0),(2,5,12,1,0,'CALL CENTER',0),(2,6,12,1,0,'CALL CENTER',0),(2,7,12,1,0,'CALL CENTER',0),(2,1,13,1,0,'CALL CENTER',0),(2,2,13,1,0,'CALL CENTER',0),(2,3,13,1,0,'CALL CENTER',0),(2,4,13,1,0,'CALL CENTER',0),(2,5,13,1,0,'CALL CENTER',0),(2,6,13,1,0,'CALL CENTER',0),(2,7,13,1,0,'CALL CENTER',0),(2,1,14,1,0,'CALL CENTER',0),(2,2,14,1,0,'CALL CENTER',0),(2,3,14,1,0,'CALL CENTER',0),(2,4,14,1,0,'CALL CENTER',0),(2,5,14,1,0,'CALL CENTER',0),(2,6,14,1,0,'CALL CENTER',0),(2,7,14,1,0,'CALL CENTER',0),(2,1,15,1,0,'CALL CENTER',0),(2,2,15,1,0,'CALL CENTER',0),(2,3,15,1,0,'CALL CENTER',0),(2,4,15,1,0,'CALL CENTER',0),(2,5,15,1,0,'CALL CENTER',0),(2,6,15,1,0,'CALL CENTER',0),(2,7,15,1,0,'CALL CENTER',0),(2,1,16,1,0,'CALL CENTER',0),(2,2,16,1,0,'CALL CENTER',0),(2,3,16,1,0,'CALL CENTER',0),(2,4,16,1,0,'CALL CENTER',0),(2,5,16,1,0,'CALL CENTER',0),(2,6,16,1,0,'CALL CENTER',0),(2,7,16,1,0,'CALL CENTER',0),(2,1,17,1,0,'CALL CENTER',0),(2,2,17,1,0,'CALL CENTER',0),(2,3,17,1,0,'CALL CENTER',0),(2,4,17,1,0,'CALL CENTER',0),(2,5,17,1,0,'CALL CENTER',0),(2,6,17,1,0,'CALL CENTER',0),(2,7,17,1,0,'CALL CENTER',0),(2,1,18,1,0,'CALL CENTER',0),(2,2,18,1,0,'CALL CENTER',0),(2,3,18,1,0,'CALL CENTER',0),(2,4,18,1,0,'CALL CENTER',0),(2,5,18,1,0,'CALL CENTER',0),(2,6,18,1,0,'CALL CENTER',0),(2,7,18,1,0,'CALL CENTER',0),(2,1,19,1,0,'CALL CENTER',0),(2,2,19,1,0,'CALL CENTER',0),(2,3,19,1,0,'CALL CENTER',0),(2,4,19,1,0,'CALL CENTER',0),(2,5,19,1,0,'CALL CENTER',0),(2,6,19,1,0,'CALL CENTER',0),(2,7,19,1,0,'CALL CENTER',0),(2,1,20,1,0,'CALL CENTER',0),(2,2,20,1,0,'CALL CENTER',0),(2,3,20,1,0,'CALL CENTER',0),(2,4,20,1,0,'CALL CENTER',0),(2,5,20,1,0,'CALL CENTER',0),(2,6,20,1,0,'CALL CENTER',0),(2,7,20,1,0,'CALL CENTER',0),(2,1,21,1,0,'CALL CENTER',0),(2,2,21,1,0,'CALL CENTER',0),(2,3,21,1,0,'CALL CENTER',0),(2,4,21,1,0,'CALL CENTER',0),(2,5,21,1,0,'CALL CENTER',0),(2,6,21,1,0,'CALL CENTER',0),(2,7,21,1,0,'CALL CENTER',0),(2,1,22,1,0,'CALL CENTER',0),(2,2,22,1,0,'CALL CENTER',0),(2,3,22,1,0,'CALL CENTER',0),(2,4,22,1,0,'CALL CENTER',0),(2,5,22,1,0,'CALL CENTER',0),(2,6,22,1,0,'CALL CENTER',0),(2,7,22,1,0,'CALL CENTER',0),(2,1,23,1,0,'CALL CENTER',0),(2,2,23,1,0,'CALL CENTER',0),(2,3,23,1,0,'CALL CENTER',0),(2,4,23,1,0,'CALL CENTER',0),(2,5,23,1,0,'CALL CENTER',0),(2,6,23,1,0,'CALL CENTER',0),(2,7,23,1,0,'CALL CENTER',0),(3,1,0,2,0,'LIBRE',NULL),(3,2,0,2,0,'LIBRE',NULL),(3,3,0,2,0,'LIBRE',NULL),(3,4,0,2,0,'LIBRE',NULL),(3,5,0,2,0,'LIBRE',NULL),(3,6,0,2,0,'LIBRE',NULL),(3,7,0,2,0,'LIBRE',NULL),(3,1,1,2,0,'LIBRE',NULL),(3,2,1,2,0,'LIBRE',NULL),(3,3,1,2,0,'LIBRE',NULL),(3,4,1,2,0,'LIBRE',NULL),(3,5,1,2,0,'LIBRE',NULL),(3,6,1,2,0,'LIBRE',NULL),(3,7,1,2,0,'LIBRE',NULL),(3,1,2,2,0,'LIBRE',NULL),(3,2,2,2,0,'LIBRE',NULL),(3,3,2,2,0,'LIBRE',NULL),(3,4,2,2,0,'LIBRE',NULL),(3,5,2,2,0,'LIBRE',NULL),(3,6,2,2,0,'LIBRE',NULL),(3,7,2,2,0,'LIBRE',NULL),(3,1,3,2,0,'LIBRE',NULL),(3,2,3,2,0,'LIBRE',NULL),(3,3,3,2,0,'LIBRE',NULL),(3,4,3,2,0,'LIBRE',NULL),(3,5,3,2,0,'LIBRE',NULL),(3,6,3,2,0,'LIBRE',NULL),(3,7,3,2,0,'LIBRE',NULL),(3,1,4,2,0,'LIBRE',NULL),(3,2,4,2,0,'LIBRE',NULL),(3,3,4,2,0,'LIBRE',NULL),(3,4,4,2,0,'LIBRE',NULL),(3,5,4,2,0,'LIBRE',NULL),(3,6,4,2,0,'LIBRE',NULL),(3,7,4,2,0,'LIBRE',NULL),(3,1,5,2,0,'LIBRE',NULL),(3,2,5,2,0,'LIBRE',NULL),(3,3,5,2,0,'LIBRE',NULL),(3,4,5,2,0,'LIBRE',NULL),(3,5,5,2,0,'LIBRE',NULL),(3,6,5,2,0,'LIBRE',NULL),(3,7,5,2,0,'LIBRE',NULL),(3,1,6,2,0,'LIBRE',NULL),(3,2,6,2,0,'LIBRE',NULL),(3,3,6,2,0,'LIBRE',NULL),(3,4,6,2,0,'LIBRE',NULL),(3,5,6,2,0,'LIBRE',NULL),(3,6,6,2,0,'LIBRE',NULL),(3,7,6,2,0,'LIBRE',NULL),(3,1,7,2,0,'LIBRE',NULL),(3,2,7,2,0,'LIBRE',NULL),(3,3,7,2,0,'LIBRE',NULL),(3,4,7,2,0,'LIBRE',NULL),(3,5,7,2,0,'LIBRE',NULL),(3,6,7,2,0,'LIBRE',NULL),(3,7,7,2,0,'LIBRE',NULL),(3,1,8,2,0,'LIBRE',NULL),(3,2,8,2,0,'LIBRE',NULL),(3,3,8,2,0,'LIBRE',NULL),(3,4,8,2,0,'LIBRE',NULL),(3,5,8,2,0,'LIBRE',NULL),(3,6,8,2,0,'LIBRE',NULL),(3,7,8,2,0,'LIBRE',NULL),(3,1,9,2,0,'LIBRE',NULL),(3,2,9,2,0,'LIBRE',NULL),(3,3,9,2,0,'LIBRE',NULL),(3,4,9,2,0,'LIBRE',NULL),(3,5,9,2,0,'LIBRE',NULL),(3,6,9,2,0,'LIBRE',NULL),(3,7,9,2,0,'LIBRE',NULL),(3,1,10,2,0,'LIBRE',NULL),(3,2,10,2,0,'LIBRE',NULL),(3,3,10,2,0,'LIBRE',NULL),(3,4,10,2,0,'LIBRE',NULL),(3,5,10,2,0,'LIBRE',NULL),(3,6,10,2,0,'LIBRE',NULL),(3,7,10,2,0,'LIBRE',NULL),(3,1,11,2,0,'LIBRE',NULL),(3,2,11,2,0,'LIBRE',NULL),(3,3,11,2,0,'LIBRE',NULL),(3,4,11,2,0,'LIBRE',NULL),(3,5,11,2,0,'LIBRE',NULL),(3,6,11,2,0,'LIBRE',NULL),(3,7,11,2,0,'LIBRE',NULL),(3,1,12,2,0,'LIBRE',NULL),(3,2,12,2,0,'LIBRE',NULL),(3,3,12,2,0,'LIBRE',NULL),(3,4,12,2,0,'LIBRE',NULL),(3,5,12,2,0,'LIBRE',NULL),(3,6,12,2,0,'LIBRE',NULL),(3,7,12,2,0,'LIBRE',NULL),(3,1,13,2,0,'LIBRE',NULL),(3,2,13,2,0,'LIBRE',NULL),(3,3,13,2,0,'LIBRE',NULL),(3,4,13,2,0,'LIBRE',NULL),(3,5,13,2,0,'LIBRE',NULL),(3,6,13,2,0,'LIBRE',NULL),(3,7,13,2,0,'LIBRE',NULL),(3,1,14,2,0,'LIBRE',NULL),(3,2,14,2,0,'LIBRE',NULL),(3,3,14,2,0,'LIBRE',NULL),(3,4,14,2,0,'LIBRE',NULL),(3,5,14,2,0,'LIBRE',NULL),(3,6,14,2,0,'LIBRE',NULL),(3,7,14,2,0,'LIBRE',NULL),(3,1,15,2,0,'LIBRE',NULL),(3,2,15,2,0,'LIBRE',NULL),(3,3,15,2,0,'LIBRE',NULL),(3,4,15,2,0,'LIBRE',NULL),(3,5,15,2,0,'LIBRE',NULL),(3,6,15,2,0,'LIBRE',NULL),(3,7,15,2,0,'LIBRE',NULL),(3,1,16,2,0,'LIBRE',NULL),(3,2,16,2,0,'LIBRE',NULL),(3,3,16,2,0,'LIBRE',NULL),(3,4,16,2,0,'LIBRE',NULL),(3,5,16,2,0,'LIBRE',NULL),(3,6,16,2,0,'LIBRE',NULL),(3,7,16,2,0,'LIBRE',NULL),(3,1,17,2,0,'LIBRE',NULL),(3,2,17,2,0,'LIBRE',NULL),(3,3,17,2,0,'LIBRE',NULL),(3,4,17,2,0,'LIBRE',NULL),(3,5,17,2,0,'LIBRE',NULL),(3,6,17,2,0,'LIBRE',NULL),(3,7,17,2,0,'LIBRE',NULL),(3,1,18,2,0,'LIBRE',NULL),(3,2,18,2,0,'LIBRE',NULL),(3,3,18,2,0,'LIBRE',NULL),(3,4,18,2,0,'LIBRE',NULL),(3,5,18,2,0,'LIBRE',NULL),(3,6,18,2,0,'LIBRE',NULL),(3,7,18,2,0,'LIBRE',NULL),(3,1,19,2,0,'LIBRE',NULL),(3,2,19,2,0,'LIBRE',NULL),(3,3,19,2,0,'LIBRE',NULL),(3,4,19,2,0,'LIBRE',NULL),(3,5,19,2,0,'LIBRE',NULL),(3,6,19,2,0,'LIBRE',NULL),(3,7,19,2,0,'LIBRE',NULL),(3,1,20,2,0,'LIBRE',NULL),(3,2,20,2,0,'LIBRE',NULL),(3,3,20,2,0,'LIBRE',NULL),(3,4,20,2,0,'LIBRE',NULL),(3,5,20,2,0,'LIBRE',NULL),(3,6,20,2,0,'LIBRE',NULL),(3,7,20,2,0,'LIBRE',NULL),(3,1,21,2,0,'LIBRE',NULL),(3,2,21,2,0,'LIBRE',NULL),(3,3,21,2,0,'LIBRE',NULL),(3,4,21,2,0,'LIBRE',NULL),(3,5,21,2,0,'LIBRE',NULL),(3,6,21,2,0,'LIBRE',NULL),(3,7,21,2,0,'LIBRE',NULL),(3,1,22,2,0,'LIBRE',NULL),(3,2,22,2,0,'LIBRE',NULL),(3,3,22,2,0,'LIBRE',NULL),(3,4,22,2,0,'LIBRE',NULL),(3,5,22,2,0,'LIBRE',NULL),(3,6,22,2,0,'LIBRE',NULL),(3,7,22,2,0,'LIBRE',NULL),(3,1,23,2,0,'LIBRE',NULL),(3,2,23,2,0,'LIBRE',NULL),(3,3,23,2,0,'LIBRE',NULL),(3,4,23,2,0,'LIBRE',NULL),(3,5,23,2,0,'LIBRE',NULL),(3,6,23,2,0,'LIBRE',NULL),(3,7,23,2,0,'LIBRE',NULL),(4,7,23,5,2,'123123',0),(4,6,23,5,2,'123123',0),(4,5,23,5,2,'123123',0),(5,1,0,5,2,'123',1),(5,2,0,5,2,'123',1),(5,3,0,5,2,'123',1),(5,4,0,5,2,'123',1),(5,5,0,5,2,'123',1),(5,6,0,5,2,'123',1),(5,7,0,5,2,'123',1),(5,1,1,5,2,'123',1),(5,2,1,5,2,'123',1),(5,3,1,5,2,'123',1),(5,4,1,5,2,'123',1),(5,5,1,5,2,'123',1),(5,6,1,5,2,'123',1),(5,7,1,5,2,'123',1),(5,1,2,5,2,'123',1),(5,2,2,5,2,'123',1),(5,3,2,5,2,'123',1),(5,4,2,5,2,'123',1),(5,5,2,5,2,'123',1),(5,6,2,5,2,'123',1),(5,7,2,5,2,'123',1),(5,1,3,5,2,'123',1),(5,2,3,5,2,'123',1),(5,3,3,5,2,'123',1),(5,4,3,5,2,'123',1),(5,5,3,5,2,'123',1),(5,6,3,5,2,'123',1),(5,7,3,5,2,'123',1),(5,1,4,5,2,'123',1),(5,2,4,5,2,'123',1),(5,3,4,5,2,'123',1),(5,4,4,5,2,'123',1),(5,5,4,5,2,'123',1),(5,6,4,5,2,'123',1),(5,7,4,5,2,'123',1),(5,1,5,5,2,'123',1),(5,2,5,5,2,'123',1),(5,3,5,5,2,'123',1),(5,4,5,5,2,'123',1),(5,5,5,5,2,'123',1),(5,6,5,5,2,'123',1),(5,7,5,5,2,'123',1),(5,1,6,5,2,'123',1),(5,2,6,5,2,'123',1),(5,3,6,5,2,'123',1),(5,4,6,5,2,'123',1),(5,5,6,5,2,'123',1),(5,6,6,5,2,'123',1),(5,7,6,5,2,'123',1),(5,1,7,5,2,'123',1),(5,2,7,5,2,'123',1),(5,3,7,5,2,'123',1),(5,4,7,5,2,'123',1),(5,5,7,5,2,'123',1),(5,6,7,5,2,'123',1),(5,7,7,5,2,'123',1),(5,1,8,5,2,'123',1),(5,2,8,5,2,'123',1),(5,3,8,5,2,'123',1),(5,4,8,5,2,'123',1),(5,5,8,5,2,'123',1),(5,6,8,5,2,'123',1),(5,7,8,5,2,'123',1),(5,1,9,5,2,'123',1),(5,2,9,5,2,'123',1),(5,3,9,5,2,'123',1),(5,4,9,5,2,'123',1),(5,5,9,5,2,'123',1),(5,6,9,5,2,'123',1),(5,7,9,5,2,'123',1),(5,1,10,5,2,'123',1),(5,2,10,5,2,'123',1),(5,3,10,5,2,'123',1),(5,4,10,5,2,'123',1),(5,5,10,5,2,'123',1),(5,6,10,5,2,'123',1),(5,7,10,5,2,'123',1),(5,1,11,5,2,'123',1),(5,2,11,5,2,'123',1),(5,3,11,5,2,'123',1),(5,4,11,5,2,'123',1),(5,5,11,5,2,'123',1),(5,6,11,5,2,'123',1),(5,7,11,5,2,'123',1),(5,1,12,5,2,'123',1),(5,2,12,5,2,'123',1),(5,3,12,5,2,'123',1),(5,4,12,5,2,'123',1),(5,5,12,5,2,'123',1),(5,6,12,5,2,'123',1),(5,7,12,5,2,'123',1),(5,1,13,5,2,'123',1),(5,2,13,5,2,'123',1),(5,3,13,5,2,'123',1),(5,4,13,5,2,'123',1),(5,5,13,5,2,'123',1),(5,6,13,5,2,'123',1),(5,7,13,5,2,'123',1),(5,1,14,5,2,'123',1),(5,2,14,5,2,'123',1),(5,3,14,5,2,'123',1),(5,4,14,5,2,'123',1),(5,5,14,5,2,'123',1),(5,6,14,5,2,'123',1),(5,7,14,5,2,'123',1),(5,1,15,5,2,'123',1),(5,2,15,5,2,'123',1),(5,3,15,5,2,'123',1),(5,4,15,5,2,'123',1),(5,5,15,5,2,'123',1),(5,6,15,5,2,'123',1),(5,7,15,5,2,'123',1),(5,1,16,5,2,'123',1),(5,2,16,5,2,'123',1),(5,3,16,5,2,'123',1),(5,4,16,5,2,'123',1),(5,5,16,5,2,'123',1),(5,6,16,5,2,'123',1),(5,7,16,5,2,'123',1),(5,1,17,5,2,'123',1),(5,2,17,5,2,'123',1),(5,3,17,5,2,'123',1),(5,4,17,5,2,'123',1),(5,5,17,5,2,'123',1),(5,6,17,5,2,'123',1),(5,7,17,5,2,'123',1),(5,1,18,5,2,'123',1),(5,2,18,5,2,'123',1),(5,3,18,5,2,'123',1),(5,4,18,5,2,'123',1),(5,5,18,5,2,'123',1),(5,6,18,5,2,'123',1),(5,7,18,5,2,'123',1),(5,1,19,5,2,'123',1),(5,2,19,5,2,'123',1),(5,3,19,5,2,'123',1),(5,4,19,5,2,'123',1),(5,5,19,5,2,'123',1),(5,6,19,5,2,'123',1),(5,7,19,5,2,'123',1),(5,1,20,5,2,'123',1),(5,2,20,5,2,'123',1),(5,3,20,5,2,'123',1),(5,4,20,5,2,'123',1),(5,5,20,5,2,'123',1),(5,6,20,5,2,'123',1),(5,7,20,5,2,'123',1),(5,1,21,5,2,'123',1),(5,2,21,5,2,'123',1),(5,3,21,5,2,'123',1),(5,4,21,5,2,'123',1),(5,5,21,5,2,'123',1),(5,6,21,5,2,'123',1),(5,7,21,5,2,'123',1),(5,1,22,5,2,'123',1),(5,2,22,5,2,'123',1),(5,3,22,5,2,'123',1),(5,4,22,5,2,'123',1),(5,5,22,5,2,'123',1),(5,6,22,5,2,'123',1),(5,7,22,5,2,'123',1),(5,1,23,5,2,'123',1),(5,2,23,5,2,'123',1),(5,3,23,5,2,'123',1),(5,4,23,5,2,'123',1),(5,5,23,5,2,'123',1),(5,6,23,5,2,'123',1),(5,7,23,5,2,'123',1),(6,1,0,4,1,'S10/B20',0),(6,2,0,4,1,'S10/B20',0),(6,3,0,4,1,'S10/B20',0),(6,4,0,4,1,'S10/B20',0),(6,5,0,4,1,'S10/B20',0),(6,6,0,4,1,'S10/B20',0),(6,7,0,4,1,'S10/B20',0),(6,1,1,4,1,'S10/B20',0),(6,2,1,4,1,'S10/B20',0),(6,3,1,4,1,'S10/B20',0),(6,4,1,4,1,'S10/B20',0),(6,5,1,4,1,'S10/B20',0),(6,6,1,4,1,'S10/B20',0),(6,7,1,4,1,'S10/B20',0),(6,1,2,4,1,'S10/B20',0),(6,2,2,4,1,'S10/B20',0),(6,3,2,4,1,'S10/B20',0),(6,4,2,4,1,'S10/B20',0),(6,5,2,4,1,'S10/B20',0),(6,6,2,4,1,'S10/B20',0),(6,7,2,4,1,'S10/B20',0),(6,1,3,4,1,'S10/B20',0),(6,2,3,4,1,'S10/B20',0),(6,3,3,4,1,'S10/B20',0),(6,4,3,4,1,'S10/B20',0),(6,5,3,4,1,'S10/B20',0),(6,6,3,4,1,'S10/B20',0),(6,7,3,4,1,'S10/B20',0),(6,1,4,4,1,'S10/B20',0),(6,2,4,4,1,'S10/B20',0),(6,3,4,4,1,'S10/B20',0),(6,4,4,4,1,'S10/B20',0),(6,5,4,4,1,'S10/B20',0),(6,6,4,4,1,'S10/B20',0),(6,7,4,4,1,'S10/B20',0),(6,1,5,4,1,'S10/B20',0),(6,2,5,4,1,'S10/B20',0),(6,3,5,4,1,'S10/B20',0),(6,4,5,4,1,'S10/B20',0),(6,5,5,4,1,'S10/B20',0),(6,6,5,4,1,'S10/B20',0),(6,7,5,4,1,'S10/B20',0),(6,1,6,4,1,'S10/B20',0),(6,2,6,4,1,'S10/B20',0),(6,3,6,4,1,'S10/B20',0),(6,4,6,4,1,'S10/B20',0),(6,5,6,4,1,'S10/B20',0),(6,6,6,4,1,'S10/B20',0),(6,7,6,4,1,'S10/B20',0),(6,1,7,4,1,'S10/B20',0),(6,2,7,4,1,'S10/B20',0),(6,3,7,4,1,'S10/B20',0),(6,4,7,4,1,'S10/B20',0),(6,5,7,4,1,'S10/B20',0),(6,6,7,4,1,'S10/B20',0),(6,7,7,4,1,'S10/B20',0),(6,1,8,4,1,'S10/B20',0),(6,2,8,4,1,'S10/B20',0),(6,3,8,4,1,'S10/B20',0),(6,4,8,4,1,'S10/B20',0),(6,5,8,4,1,'S10/B20',0),(6,6,8,4,1,'S10/B20',0),(6,7,8,4,1,'S10/B20',0),(6,1,9,4,1,'S10/B20',0),(6,2,9,4,1,'S10/B20',0),(6,3,9,4,1,'S10/B20',0),(6,4,9,4,1,'S10/B20',0),(6,5,9,4,1,'S10/B20',0),(6,6,9,4,1,'S10/B20',0),(6,7,9,4,1,'S10/B20',0),(6,1,10,4,1,'S10/B20',0),(6,2,10,4,1,'S10/B20',0),(6,3,10,4,1,'S10/B20',0),(6,4,10,4,1,'S10/B20',0),(6,5,10,4,1,'S10/B20',0),(6,6,10,4,1,'S10/B20',0),(6,7,10,4,1,'S10/B20',0),(6,1,11,4,1,'S10/B20',0),(6,2,11,4,1,'S10/B20',0),(6,3,11,4,1,'S10/B20',0),(6,4,11,4,1,'S10/B20',0),(6,5,11,4,1,'S10/B20',0),(6,6,11,4,1,'S10/B20',0),(6,7,11,4,1,'S10/B20',0),(6,1,12,4,1,'S10/B20',0),(6,2,12,4,1,'S10/B20',0),(6,3,12,4,1,'S10/B20',0),(6,4,12,4,1,'S10/B20',0),(6,5,12,4,1,'S10/B20',0),(6,6,12,4,1,'S10/B20',0),(6,7,12,4,1,'S10/B20',0),(6,1,13,4,1,'S10/B20',0),(6,2,13,4,1,'S10/B20',0),(6,3,13,4,1,'S10/B20',0),(6,4,13,4,1,'S10/B20',0),(6,5,13,4,1,'S10/B20',0),(6,6,13,4,1,'S10/B20',0),(6,7,13,4,1,'S10/B20',0),(6,1,14,4,1,'S10/B20',0),(6,2,14,4,1,'S10/B20',0),(6,3,14,4,1,'S10/B20',0),(6,4,14,4,1,'S10/B20',0),(6,5,14,4,1,'S10/B20',0),(6,6,14,4,1,'S10/B20',0),(6,7,14,4,1,'S10/B20',0),(6,1,15,4,1,'S10/B20',0),(6,2,15,4,1,'S10/B20',0),(6,3,15,4,1,'S10/B20',0),(6,4,15,4,1,'S10/B20',0),(6,5,15,4,1,'S10/B20',0),(6,6,15,4,1,'S10/B20',0),(6,7,15,4,1,'S10/B20',0),(6,1,16,4,1,'S10/B20',0),(6,2,16,4,1,'S10/B20',0),(6,3,16,4,1,'S10/B20',0),(6,4,16,4,1,'S10/B20',0),(6,5,16,4,1,'S10/B20',0),(6,6,16,4,1,'S10/B20',0),(6,7,16,4,1,'S10/B20',0),(6,1,17,4,1,'S10/B20',0),(6,2,17,4,1,'S10/B20',0),(6,3,17,4,1,'S10/B20',0),(6,4,17,4,1,'S10/B20',0),(6,5,17,4,1,'S10/B20',0),(6,6,17,4,1,'S10/B20',0),(6,7,17,4,1,'S10/B20',0),(6,1,18,4,1,'S10/B20',0),(6,2,18,4,1,'S10/B20',0),(6,3,18,4,1,'S10/B20',0),(6,4,18,4,1,'S10/B20',0),(6,5,18,4,1,'S10/B20',0),(6,6,18,4,1,'S10/B20',0),(6,7,18,4,1,'S10/B20',0),(6,1,19,4,1,'S10/B20',0),(6,2,19,4,1,'S10/B20',0),(6,3,19,4,1,'S10/B20',0),(6,4,19,4,1,'S10/B20',0),(6,5,19,4,1,'S10/B20',0),(6,6,19,4,1,'S10/B20',0),(6,7,19,4,1,'S10/B20',0),(6,1,20,4,1,'S10/B20',0),(6,2,20,4,1,'S10/B20',0),(6,3,20,4,1,'S10/B20',0),(6,4,20,4,1,'S10/B20',0),(6,5,20,4,1,'S10/B20',0),(6,6,20,4,1,'S10/B20',0),(6,7,20,4,1,'S10/B20',0),(6,1,21,4,1,'S10/B20',0),(6,2,21,4,1,'S10/B20',0),(6,3,21,4,1,'S10/B20',0),(6,4,21,4,1,'S10/B20',0),(6,5,21,4,1,'S10/B20',0),(6,6,21,4,1,'S10/B20',0),(6,7,21,4,1,'S10/B20',0),(6,1,22,4,1,'S10/B20',0),(6,2,22,4,1,'S10/B20',0),(6,3,22,4,1,'S10/B20',0),(6,4,22,4,1,'S10/B20',0),(6,5,22,4,1,'S10/B20',0),(6,6,22,4,1,'S10/B20',0),(6,7,22,4,1,'S10/B20',0),(6,1,23,4,1,'S10/B20',0),(6,2,23,4,1,'S10/B20',0),(6,3,23,4,1,'S10/B20',0),(6,4,23,4,1,'S10/B20',0),(6,5,23,4,1,'S10/B20',0),(6,6,23,4,1,'S10/B20',0),(6,7,23,4,1,'S10/B20',0),(7,1,0,0,0,'Ejecutivo',0),(7,2,0,0,0,'Ejecutivo',0),(7,3,0,0,0,'Ejecutivo',0),(7,4,0,0,0,'Ejecutivo',0),(7,5,0,0,0,'Ejecutivo',0),(7,6,0,0,0,'Ejecutivo',0),(7,7,0,0,0,'Ejecutivo',0),(7,1,1,0,0,'Ejecutivo',0),(7,2,1,0,0,'Ejecutivo',0),(7,3,1,0,0,'Ejecutivo',0),(7,4,1,0,0,'Ejecutivo',0),(7,5,1,0,0,'Ejecutivo',0),(7,6,1,0,0,'Ejecutivo',0),(7,7,1,0,0,'Ejecutivo',0),(7,1,2,0,0,'Ejecutivo',0),(7,2,2,0,0,'Ejecutivo',0),(7,3,2,0,0,'Ejecutivo',0),(7,4,2,0,0,'Ejecutivo',0),(7,5,2,0,0,'Ejecutivo',0),(7,6,2,0,0,'Ejecutivo',0),(7,7,2,0,0,'Ejecutivo',0),(7,1,3,0,0,'Ejecutivo',0),(7,2,3,0,0,'Ejecutivo',0),(7,3,3,0,0,'Ejecutivo',0),(7,4,3,0,0,'Ejecutivo',0),(7,5,3,0,0,'Ejecutivo',0),(7,6,3,0,0,'Ejecutivo',0),(7,7,3,0,0,'Ejecutivo',0),(7,1,4,0,0,'Ejecutivo',0),(7,2,4,0,0,'Ejecutivo',0),(7,3,4,0,0,'Ejecutivo',0),(7,4,4,0,0,'Ejecutivo',0),(7,5,4,0,0,'Ejecutivo',0),(7,6,4,0,0,'Ejecutivo',0),(7,7,4,0,0,'Ejecutivo',0),(7,1,5,0,0,'Ejecutivo',0),(7,2,5,0,0,'Ejecutivo',0),(7,3,5,0,0,'Ejecutivo',0),(7,4,5,0,0,'Ejecutivo',0),(7,5,5,0,0,'Ejecutivo',0),(7,6,5,0,0,'Ejecutivo',0),(7,7,5,0,0,'Ejecutivo',0),(7,1,6,0,0,'Ejecutivo',0),(7,2,6,0,0,'Ejecutivo',0),(7,3,6,0,0,'Ejecutivo',0),(7,4,6,0,0,'Ejecutivo',0),(7,5,6,0,0,'Ejecutivo',0),(7,6,6,0,0,'Ejecutivo',0),(7,7,6,0,0,'Ejecutivo',0),(7,1,7,0,0,'Ejecutivo',0),(7,2,7,0,0,'Ejecutivo',0),(7,3,7,0,0,'Ejecutivo',0),(7,4,7,0,0,'Ejecutivo',0),(7,5,7,0,0,'Ejecutivo',0),(7,6,7,0,0,'Ejecutivo',0),(7,7,7,0,0,'Ejecutivo',0),(7,1,8,0,0,'Ejecutivo',0),(7,2,8,0,0,'Ejecutivo',0),(7,3,8,0,0,'Ejecutivo',0),(7,4,8,0,0,'Ejecutivo',0),(7,5,8,0,0,'Ejecutivo',0),(7,6,8,0,0,'Ejecutivo',0),(7,7,8,0,0,'Ejecutivo',0),(7,1,9,0,0,'Ejecutivo',0),(7,2,9,0,0,'Ejecutivo',0),(7,3,9,0,0,'Ejecutivo',0),(7,4,9,0,0,'Ejecutivo',0),(7,5,9,0,0,'Ejecutivo',0),(7,6,9,0,0,'Ejecutivo',0),(7,7,9,0,0,'Ejecutivo',0),(7,1,10,0,0,'Ejecutivo',0),(7,2,10,0,0,'Ejecutivo',0),(7,3,10,0,0,'Ejecutivo',0),(7,4,10,0,0,'Ejecutivo',0),(7,5,10,0,0,'Ejecutivo',0),(7,6,10,0,0,'Ejecutivo',0),(7,7,10,0,0,'Ejecutivo',0),(7,1,11,0,0,'Ejecutivo',0),(7,2,11,0,0,'Ejecutivo',0),(7,3,11,0,0,'Ejecutivo',0),(7,4,11,0,0,'Ejecutivo',0),(7,5,11,0,0,'Ejecutivo',0),(7,6,11,0,0,'Ejecutivo',0),(7,7,11,0,0,'Ejecutivo',0),(7,1,12,0,0,'Ejecutivo',0),(7,2,12,0,0,'Ejecutivo',0),(7,3,12,0,0,'Ejecutivo',0),(7,4,12,0,0,'Ejecutivo',0),(7,5,12,0,0,'Ejecutivo',0),(7,6,12,0,0,'Ejecutivo',0),(7,7,12,0,0,'Ejecutivo',0),(7,1,13,0,0,'Ejecutivo',0),(7,2,13,0,0,'Ejecutivo',0),(7,3,13,0,0,'Ejecutivo',0),(7,4,13,0,0,'Ejecutivo',0),(7,5,13,0,0,'Ejecutivo',0),(7,6,13,0,0,'Ejecutivo',0),(7,7,13,0,0,'Ejecutivo',0),(7,1,14,0,0,'Ejecutivo',0),(7,2,14,0,0,'Ejecutivo',0),(7,3,14,0,0,'Ejecutivo',0),(7,4,14,0,0,'Ejecutivo',0),(7,5,14,0,0,'Ejecutivo',0),(7,6,14,0,0,'Ejecutivo',0),(7,7,14,0,0,'Ejecutivo',0),(7,1,15,0,0,'Ejecutivo',0),(7,2,15,0,0,'Ejecutivo',0),(7,3,15,0,0,'Ejecutivo',0),(7,4,15,0,0,'Ejecutivo',0),(7,5,15,0,0,'Ejecutivo',0),(7,6,15,0,0,'Ejecutivo',0),(7,7,15,0,0,'Ejecutivo',0),(7,1,16,0,0,'Ejecutivo',0),(7,2,16,0,0,'Ejecutivo',0),(7,3,16,0,0,'Ejecutivo',0),(7,4,16,0,0,'Ejecutivo',0),(7,5,16,0,0,'Ejecutivo',0),(7,6,16,0,0,'Ejecutivo',0),(7,7,16,0,0,'Ejecutivo',0),(7,1,17,0,0,'Ejecutivo',0),(7,2,17,0,0,'Ejecutivo',0),(7,3,17,0,0,'Ejecutivo',0),(7,4,17,0,0,'Ejecutivo',0),(7,5,17,0,0,'Ejecutivo',0),(7,6,17,0,0,'Ejecutivo',0),(7,7,17,0,0,'Ejecutivo',0),(7,1,18,0,0,'Ejecutivo',0),(7,2,18,0,0,'Ejecutivo',0),(7,3,18,0,0,'Ejecutivo',0),(7,4,18,0,0,'Ejecutivo',0),(7,5,18,0,0,'Ejecutivo',0),(7,6,18,0,0,'Ejecutivo',0),(7,7,18,0,0,'Ejecutivo',0),(7,1,19,0,0,'Ejecutivo',0),(7,2,19,0,0,'Ejecutivo',0),(7,3,19,0,0,'Ejecutivo',0),(7,4,19,0,0,'Ejecutivo',0),(7,5,19,0,0,'Ejecutivo',0),(7,6,19,0,0,'Ejecutivo',0),(7,7,19,0,0,'Ejecutivo',0),(7,1,20,0,0,'Ejecutivo',0),(7,2,20,0,0,'Ejecutivo',0),(7,3,20,0,0,'Ejecutivo',0),(7,4,20,0,0,'Ejecutivo',0),(7,5,20,0,0,'Ejecutivo',0),(7,6,20,0,0,'Ejecutivo',0),(7,7,20,0,0,'Ejecutivo',0),(7,1,21,0,0,'Ejecutivo',0),(7,2,21,0,0,'Ejecutivo',0),(7,3,21,0,0,'Ejecutivo',0),(7,4,21,0,0,'Ejecutivo',0),(7,5,21,0,0,'Ejecutivo',0),(7,6,21,0,0,'Ejecutivo',0),(7,7,21,0,0,'Ejecutivo',0),(7,1,22,0,0,'Ejecutivo',0),(7,2,22,0,0,'Ejecutivo',0),(7,3,22,0,0,'Ejecutivo',0),(7,4,22,0,0,'Ejecutivo',0),(7,5,22,0,0,'Ejecutivo',0),(7,6,22,0,0,'Ejecutivo',0),(7,7,22,0,0,'Ejecutivo',0),(7,1,23,0,0,'Ejecutivo',0),(7,2,23,0,0,'Ejecutivo',0),(7,3,23,0,0,'Ejecutivo',0),(7,4,23,0,0,'Ejecutivo',0),(7,5,23,0,0,'Ejecutivo',0),(7,6,23,0,0,'Ejecutivo',0),(7,7,23,0,0,'Ejecutivo',0),(8,1,0,2,0,'Standard',0),(8,2,0,2,0,'Standard',0),(8,3,0,2,0,'Standard',0),(8,4,0,2,0,'Standard',0),(8,5,0,2,0,'Standard',0),(8,6,0,2,0,'Standard',0),(8,7,0,2,0,'Standard',0),(8,1,1,2,0,'Standard',0),(8,2,1,2,0,'Standard',0),(8,3,1,2,0,'Standard',0),(8,4,1,2,0,'Standard',0),(8,5,1,2,0,'Standard',0),(8,6,1,2,0,'Standard',0),(8,7,1,2,0,'Standard',0),(8,1,2,2,0,'Standard',0),(8,2,2,2,0,'Standard',0),(8,3,2,2,0,'Standard',0),(8,4,2,2,0,'Standard',0),(8,5,2,2,0,'Standard',0),(8,6,2,2,0,'Standard',0),(8,7,2,2,0,'Standard',0),(8,1,3,2,0,'Standard',0),(8,2,3,2,0,'Standard',0),(8,3,3,2,0,'Standard',0),(8,4,3,2,0,'Standard',0),(8,5,3,2,0,'Standard',0),(8,6,3,2,0,'Standard',0),(8,7,3,2,0,'Standard',0),(8,1,4,2,0,'Standard',0),(8,2,4,2,0,'Standard',0),(8,3,4,2,0,'Standard',0),(8,4,4,2,0,'Standard',0),(8,5,4,2,0,'Standard',0),(8,6,4,2,0,'Standard',0),(8,7,4,2,0,'Standard',0),(8,1,5,2,0,'Standard',0),(8,2,5,2,0,'Standard',0),(8,3,5,2,0,'Standard',0),(8,4,5,2,0,'Standard',0),(8,5,5,2,0,'Standard',0),(8,6,5,2,0,'Standard',0),(8,7,5,2,0,'Standard',0),(8,1,6,2,0,'Standard',0),(8,2,6,2,0,'Standard',0),(8,3,6,2,0,'Standard',0),(8,4,6,2,0,'Standard',0),(8,5,6,2,0,'Standard',0),(8,6,6,2,0,'Standard',0),(8,7,6,2,0,'Standard',0),(8,1,7,6,0,'Standard',0),(8,2,7,6,0,'Standard',0),(8,3,7,6,0,'Standard',0),(8,4,7,6,0,'Standard',0),(8,5,7,6,0,'Standard',0),(8,6,7,2,0,'Standard',0),(8,7,7,2,0,'Standard',0),(8,1,8,6,0,'Standard',0),(8,2,8,6,0,'Standard',0),(8,3,8,6,0,'Standard',0),(8,4,8,6,0,'Standard',0),(8,5,8,6,0,'Standard',0),(8,6,8,2,0,'Standard',0),(8,7,8,2,0,'Standard',0),(8,1,9,6,0,'Standard',0),(8,2,9,6,0,'Standard',0),(8,3,9,6,0,'Standard',0),(8,4,9,6,0,'Standard',0),(8,5,9,6,0,'Standard',0),(8,6,9,2,0,'Standard',0),(8,7,9,2,0,'Standard',0),(8,1,10,6,0,'Standard',0),(8,2,10,6,0,'Standard',0),(8,3,10,6,0,'Standard',0),(8,4,10,6,0,'Standard',0),(8,5,10,6,0,'Standard',0),(8,6,10,2,0,'Standard',0),(8,7,10,2,0,'Standard',0),(8,1,11,6,0,'Standard',0),(8,2,11,6,0,'Standard',0),(8,3,11,6,0,'Standard',0),(8,4,11,6,0,'Standard',0),(8,5,11,6,0,'Standard',0),(8,6,11,2,0,'Standard',0),(8,7,11,2,0,'Standard',0),(8,1,12,6,0,'Standard',0),(8,2,12,6,0,'Standard',0),(8,3,12,6,0,'Standard',0),(8,4,12,6,0,'Standard',0),(8,5,12,6,0,'Standard',0),(8,6,12,2,0,'Standard',0),(8,7,12,2,0,'Standard',0),(8,1,13,6,0,'Standard',0),(8,2,13,6,0,'Standard',0),(8,3,13,6,0,'Standard',0),(8,4,13,6,0,'Standard',0),(8,5,13,6,0,'Standard',0),(8,6,13,2,0,'Standard',0),(8,7,13,2,0,'Standard',0),(8,1,14,6,0,'Standard',0),(8,2,14,6,0,'Standard',0),(8,3,14,6,0,'Standard',0),(8,4,14,6,0,'Standard',0),(8,5,14,6,0,'Standard',0),(8,6,14,2,0,'Standard',0),(8,7,14,2,0,'Standard',0),(8,1,15,6,0,'Standard',0),(8,2,15,6,0,'Standard',0),(8,3,15,6,0,'Standard',0),(8,4,15,6,0,'Standard',0),(8,5,15,6,0,'Standard',0),(8,6,15,2,0,'Standard',0),(8,7,15,2,0,'Standard',0),(8,1,16,6,0,'Standard',0),(8,2,16,6,0,'Standard',0),(8,3,16,6,0,'Standard',0),(8,4,16,6,0,'Standard',0),(8,5,16,6,0,'Standard',0),(8,6,16,2,0,'Standard',0),(8,7,16,2,0,'Standard',0),(8,1,17,6,0,'Standard',0),(8,2,17,6,0,'Standard',0),(8,3,17,6,0,'Standard',0),(8,4,17,6,0,'Standard',0),(8,5,17,6,0,'Standard',0),(8,6,17,2,0,'Standard',0),(8,7,17,2,0,'Standard',0),(8,1,18,6,0,'Standard',0),(8,2,18,6,0,'Standard',0),(8,3,18,6,0,'Standard',0),(8,4,18,6,0,'Standard',0),(8,5,18,6,0,'Standard',0),(8,6,18,2,0,'Standard',0),(8,7,18,2,0,'Standard',0),(8,1,19,6,0,'Standard',0),(8,2,19,6,0,'Standard',0),(8,3,19,6,0,'Standard',0),(8,4,19,6,0,'Standard',0),(8,5,19,6,0,'Standard',0),(8,6,19,2,0,'Standard',0),(8,7,19,2,0,'Standard',0),(8,1,20,6,0,'Standard',0),(8,2,20,6,0,'Standard',0),(8,3,20,6,0,'Standard',0),(8,4,20,6,0,'Standard',0),(8,5,20,6,0,'Standard',0),(8,6,20,2,0,'Standard',0),(8,7,20,2,0,'Standard',0),(8,1,21,6,0,'Standard',0),(8,2,21,6,0,'Standard',0),(8,3,21,6,0,'Standard',0),(8,4,21,6,0,'Standard',0),(8,5,21,6,0,'Standard',0),(8,6,21,2,0,'Standard',0),(8,7,21,2,0,'Standard',0),(8,1,22,2,0,'Standard',0),(8,2,22,2,0,'Standard',0),(8,3,22,2,0,'Standard',0),(8,4,22,2,0,'Standard',0),(8,5,22,2,0,'Standard',0),(8,6,22,2,0,'Standard',0),(8,7,22,2,0,'Standard',0),(8,1,23,2,0,'Standard',0),(8,2,23,2,0,'Standard',0),(8,3,23,2,0,'Standard',0),(8,4,23,2,0,'Standard',0),(8,5,23,2,0,'Standard',0),(8,6,23,2,0,'Standard',0),(8,7,23,2,0,'Standard',0),(9,1,0,5,0,'Castigo',1),(9,2,0,5,0,'Castigo',1),(9,3,0,5,0,'Castigo',1),(9,4,0,5,0,'Castigo',1),(9,5,0,5,0,'Castigo',1),(9,6,0,5,0,'Castigo',1),(9,7,0,5,0,'Castigo',1),(9,1,1,5,0,'Castigo',1),(9,2,1,5,0,'Castigo',1),(9,3,1,5,0,'Castigo',1),(9,4,1,5,0,'Castigo',1),(9,5,1,5,0,'Castigo',1),(9,6,1,5,0,'Castigo',1),(9,7,1,5,0,'Castigo',1),(9,1,2,5,0,'Castigo',1),(9,2,2,5,0,'Castigo',1),(9,3,2,5,0,'Castigo',1),(9,4,2,5,0,'Castigo',1),(9,5,2,5,0,'Castigo',1),(9,6,2,5,0,'Castigo',1),(9,7,2,5,0,'Castigo',1),(9,1,3,5,0,'Castigo',1),(9,2,3,5,0,'Castigo',1),(9,3,3,5,0,'Castigo',1),(9,4,3,5,0,'Castigo',1),(9,5,3,5,0,'Castigo',1),(9,6,3,5,0,'Castigo',1),(9,7,3,5,0,'Castigo',1),(9,1,4,5,0,'Castigo',1),(9,2,4,5,0,'Castigo',1),(9,3,4,5,0,'Castigo',1),(9,4,4,5,0,'Castigo',1),(9,5,4,5,0,'Castigo',1),(9,6,4,5,0,'Castigo',1),(9,7,4,5,0,'Castigo',1),(9,1,5,5,0,'Castigo',1),(9,2,5,5,0,'Castigo',1),(9,3,5,5,0,'Castigo',1),(9,4,5,5,0,'Castigo',1),(9,5,5,5,0,'Castigo',1),(9,6,5,5,0,'Castigo',1),(9,7,5,5,0,'Castigo',1),(9,1,6,5,0,'Castigo',1),(9,2,6,5,0,'Castigo',1),(9,3,6,5,0,'Castigo',1),(9,4,6,5,0,'Castigo',1),(9,5,6,5,0,'Castigo',1),(9,6,6,5,0,'Castigo',1),(9,7,6,5,0,'Castigo',1),(9,1,7,5,0,'Castigo',1),(9,2,7,5,0,'Castigo',1),(9,3,7,5,0,'Castigo',1),(9,4,7,5,0,'Castigo',1),(9,5,7,5,0,'Castigo',1),(9,6,7,5,0,'Castigo',1),(9,7,7,5,0,'Castigo',1),(9,1,8,5,0,'Castigo',1),(9,2,8,5,0,'Castigo',1),(9,3,8,5,0,'Castigo',1),(9,4,8,5,0,'Castigo',1),(9,5,8,5,0,'Castigo',1),(9,6,8,5,0,'Castigo',1),(9,7,8,5,0,'Castigo',1),(9,1,9,5,0,'Castigo',1),(9,2,9,5,0,'Castigo',1),(9,3,9,5,0,'Castigo',1),(9,4,9,5,0,'Castigo',1),(9,5,9,5,0,'Castigo',1),(9,6,9,5,0,'Castigo',1),(9,7,9,5,0,'Castigo',1),(9,1,10,5,0,'Castigo',1),(9,2,10,5,0,'Castigo',1),(9,3,10,5,0,'Castigo',1),(9,4,10,5,0,'Castigo',1),(9,5,10,5,0,'Castigo',1),(9,6,10,5,0,'Castigo',1),(9,7,10,5,0,'Castigo',1),(9,1,11,5,0,'Castigo',1),(9,2,11,5,0,'Castigo',1),(9,3,11,5,0,'Castigo',1),(9,4,11,5,0,'Castigo',1),(9,5,11,5,0,'Castigo',1),(9,6,11,5,0,'Castigo',1),(9,7,11,5,0,'Castigo',1),(9,1,12,5,0,'Castigo',1),(9,2,12,5,0,'Castigo',1),(9,3,12,5,0,'Castigo',1),(9,4,12,5,0,'Castigo',1),(9,5,12,5,0,'Castigo',1),(9,6,12,5,0,'Castigo',1),(9,7,12,5,0,'Castigo',1),(9,1,13,5,0,'Castigo',1),(9,2,13,5,0,'Castigo',1),(9,3,13,5,0,'Castigo',1),(9,4,13,5,0,'Castigo',1),(9,5,13,5,0,'Castigo',1),(9,6,13,5,0,'Castigo',1),(9,7,13,5,0,'Castigo',1),(9,1,14,5,0,'Castigo',1),(9,2,14,5,0,'Castigo',1),(9,3,14,5,0,'Castigo',1),(9,4,14,5,0,'Castigo',1),(9,5,14,5,0,'Castigo',1),(9,6,14,5,0,'Castigo',1),(9,7,14,5,0,'Castigo',1),(9,1,15,5,0,'Castigo',1),(9,2,15,5,0,'Castigo',1),(9,3,15,5,0,'Castigo',1),(9,4,15,5,0,'Castigo',1),(9,5,15,5,0,'Castigo',1),(9,6,15,5,0,'Castigo',1),(9,7,15,5,0,'Castigo',1),(9,1,16,5,0,'Castigo',1),(9,2,16,5,0,'Castigo',1),(9,3,16,5,0,'Castigo',1),(9,4,16,5,0,'Castigo',1),(9,5,16,5,0,'Castigo',1),(9,6,16,5,0,'Castigo',1),(9,7,16,5,0,'Castigo',1),(9,1,17,5,0,'Castigo',1),(9,2,17,5,0,'Castigo',1),(9,3,17,5,0,'Castigo',1),(9,4,17,5,0,'Castigo',1),(9,5,17,5,0,'Castigo',1),(9,6,17,5,0,'Castigo',1),(9,7,17,5,0,'Castigo',1),(9,1,18,5,0,'Castigo',1),(9,2,18,5,0,'Castigo',1),(9,3,18,5,0,'Castigo',1),(9,4,18,5,0,'Castigo',1),(9,5,18,5,0,'Castigo',1),(9,6,18,5,0,'Castigo',1),(9,7,18,5,0,'Castigo',1),(9,1,19,5,0,'Castigo',1),(9,2,19,5,0,'Castigo',1),(9,3,19,5,0,'Castigo',1),(9,4,19,5,0,'Castigo',1),(9,5,19,5,0,'Castigo',1),(9,6,19,5,0,'Castigo',1),(9,7,19,5,0,'Castigo',1),(9,1,20,5,0,'Castigo',1),(9,2,20,5,0,'Castigo',1),(9,3,20,5,0,'Castigo',1),(9,4,20,5,0,'Castigo',1),(9,5,20,5,0,'Castigo',1),(9,6,20,5,0,'Castigo',1),(9,7,20,5,0,'Castigo',1),(9,1,21,5,0,'Castigo',1),(9,2,21,5,0,'Castigo',1),(9,3,21,5,0,'Castigo',1),(9,4,21,5,0,'Castigo',1),(9,5,21,5,0,'Castigo',1),(9,6,21,5,0,'Castigo',1),(9,7,21,5,0,'Castigo',1),(9,1,22,5,0,'Castigo',1),(9,2,22,5,0,'Castigo',1),(9,3,22,5,0,'Castigo',1),(9,4,22,5,0,'Castigo',1),(9,5,22,5,0,'Castigo',1),(9,6,22,5,0,'Castigo',1),(9,7,22,5,0,'Castigo',1),(9,1,23,5,0,'Castigo',1),(9,2,23,5,0,'Castigo',1),(9,3,23,5,0,'Castigo',1),(9,4,23,5,0,'Castigo',1),(9,5,23,5,0,'Castigo',1),(9,6,23,5,0,'Castigo',1),(9,7,23,5,0,'Castigo',1);
/*!40000 ALTER TABLE `planes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `llave` varchar(45) NOT NULL,
  `valor` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'salida','1'),(2,'limitacion','1'),(3,'ping_ignore','0');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` char(20) NOT NULL DEFAULT '',
  `password` char(20) NOT NULL DEFAULT '',
  `estado` int(1) unsigned NOT NULL DEFAULT '0',
  `nivel` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','tr0nch4',0,1),(2,'admin','tr0nch4',1,2);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'zafiro'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-20 15:25:45

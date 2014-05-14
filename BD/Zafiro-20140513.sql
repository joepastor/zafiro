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
INSERT INTO `acciones` VALUES (1,1,'Apaga el sistema','shutdown -h now'),(2,0,'Reinicia el servidor','reboot'),(3,1,'Reiniciar servicio de red','/etc/init.d/networking restart'),(4,1,'Reiniciar VPN','/etc/init.d/openvpn restart'),(5,1,'DHCP','/etc/init.d/isc-dhcp-server restart'),(6,1,'Ejecutar Zafiro',NULL);
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
INSERT INTO `clientes` VALUES (3,'Desktop SOBALA','00:1C:C0:38:21:62',0,0,107,20121010,0,794,'PC07',NULL,NULL,NULL,NULL,1,0),(77,'Central VoIP','70:71:bc:71:98:2a',0,0,2,0,0,3,'Asterisk','','','','',0,1),(116,'Desktop','00:0B:6A:BF:AA:5E',0,0,105,20121010,0,2,'PC05',NULL,NULL,NULL,NULL,1,0),(123,'Desktop','00:0B:6A:C6:53:DF',0,0,108,20121010,0,2,'PC08','','','','',1,1),(124,'Desktop','00:0B:6A:BE:93:79',0,0,103,20121010,0,2,'PC03','','','','',1,0),(133,'Desktop','00:27:0e:16:27:b3',0,0,71,20120618,0,2,'Backup','','','','',1,1),(136,'Desktop','00:0B:6A:BF:94:26',0,0,112,20121005,0,8,'PC12','','','','',1,0),(138,'Desktop','00:27:0E:16:AC:39',0,0,56,20121002,0,8,'Carlos Rodriguez','','','','',1,1),(141,'Desktop','00:0B:6A:C6:5E:8F',0,0,104,20120831,0,2,'PC04','','','','',1,0),(153,'Desktop','00:0E:A6:A9:EF:34',0,0,115,20121005,0,2,'PC15','','','','',1,0),(156,'Desktop','00:0B:6A:A8:A9:24',0,0,114,20121005,0,2,'PC14','','','','',1,0),(159,'Desktop','10:78:d2:8a:2a:1a',0,0,109,20120730,0,2,'PC09','','','','',1,0),(160,'Desktop en Data center','00:1C:C0:B1:3B:F3',0,0,10,20120703,0,8,'Backup 1','','','','',1,1),(161,'Desktop','00:0B:6A:BF:A3:40',0,0,113,20121003,0,2,'PC13','','','','',1,0),(164,'Desktop','00:19:66:46:ef:10',0,0,116,20121010,0,2,'PC16','','','','',1,0),(167,'Desktop','00:0B:6A:BF:A5:CD',0,0,117,20121005,0,2,'PC17','','','','',1,0),(168,'Desktop','00:0B:6A:BF:88:85',0,0,102,20121010,0,2,'PC02','','','','',1,0),(169,'Desktop','00:0B:6A:BF:A5:C1',0,0,106,20121010,0,2,'PC06','','','','',1,0),(170,'Desktop','00:0B:6A:BF:88:59',0,0,101,20121010,0,2,'PC01','','','','',1,0),(177,'Desktop Recepcion Vte. Lopez','48:5B:39:A3:67:8D',0,0,122,20121010,0,2,'PC22','','','','',1,0),(180,'Desktop - Sala Reunion','10:78:d2:1b:9b:c3',0,0,151,20120712,0,2,'PC51','','','','',1,0),(467,'Notebook Ethernet','00:24:e8:84:06:21',0,0,24,20131127,0,2,'Sistemas','','','','',0,1),(185,'Desktop','10:78:D2:8A:43:EF',0,0,100,20121005,0,2,'Sonia Toconas','','','','',1,1),(198,'Notebook','00:24:54:6E:26:E2',0,2,243,20130411,0,2,'Sonia Toconas','','','','',1,1),(470,'SERVER MASTER','00:25:90:d8:e5:ac',0,0,7,20131210,0,3,'SERVER MASTER','','','','',0,1),(196,'Desktop','00:19:66:29:8D:E6',0,0,125,20121005,0,2,'PC25','','','','',1,0),(200,'Camara Seguridad 2','00:6b:58:2c:2c:55',0,0,8,20131101,0,3,'DVR 2','','','','',0,1),(201,'Camara Seguridad 1','00:5e:09:07:fc:0a',0,0,9,20131101,0,3,'DVR 1','','','','',0,1),(206,'Desktop','44:87:fc:ef:f1:0c',0,0,119,20121005,0,2,'PC19','','','','',1,0),(207,'Desktop','44:87:fc:ef:f3:72',0,0,110,20121002,0,2,'PC10','','','','',1,0),(208,'Desktop','44:87:fc:ef:f3:73',0,2,124,20121003,0,2,'PC en REPARACION','','','','',1,0),(209,'Desktop','44:87:fc:ef:f1:e1',0,0,123,20121005,0,2,'PC23','','','','',1,0),(210,'Desktop','44:87:fc:ef:f2:b4',0,0,120,20121005,0,2,'PC20','','','','',1,0),(219,'Desktop','44:87:fc:ef:f0:f9',0,0,121,20120920,0,2,'PC21','','','','',1,0),(220,'Sistema Puertas','00:30:4f:79:29:f9',0,0,22,20120713,0,8,'ICS-100 Call Center','','','','',0,1),(221,'Equipo telular 8 bocas','00:03:7e:00:c4:ae',0,0,3,20130807,0,3,'Telular 1','','','','',1,1),(222,'Sistema Puertas','00:30:4f:79:2a:a7',0,1,22,20120713,0,8,'ICS-100 Call Center','','','','',0,1),(223,'Desktop','44:87:fc:eb:77:12',0,0,111,20120920,0,2,'PC11','','','','',1,0),(224,'Print Server','00:40:01:2e:15:55',0,0,40,20121005,0,8,'Office','','','','',1,1),(225,'Desktop Asesora Vte. Lopez','44:87:fc:eb:8d:49',0,0,150,20120625,0,2,'PC50','','','','',1,0),(226,'Desktop','44:87:fc:eb:8f:6f',0,0,144,20121002,0,2,'PC44','','','','',1,0),(231,'Desktop','00:e0:4c:91:c0:04',0,0,57,20110407,0,2,'Controlador Fiscal 1','','','','',1,0),(243,'Desktop','10:78:d2:8a:45:71',0,0,131,20121010,0,2,'PC31','','','','',1,0),(269,'Desktop','10:78:d2:17:3a:85',0,0,139,20121002,0,2,'PC39','','','','',1,0),(244,'Desktop','10:78:d2:8a:2b:fe',0,0,127,20121002,0,2,'PC27','','','','',1,0),(245,'Desktop','10:78:d2:8a:79:5c',0,0,140,20121002,0,2,'PC40','','','','',1,0),(251,'Desktop','00:0B:6A:BF:A5:EB',0,0,132,20121003,0,2,'PC32','','','','',1,0),(246,'Desktop','10:78:d2:8a:44:07',0,0,128,20121002,0,2,'PC28','','','','',1,0),(247,'Desktop','10:78:d2:8a:44:e1',0,0,133,20121003,0,2,'PC33','','','','',1,0),(248,'Desktop','10:78:d2:8a:44:48',0,0,130,20121002,0,2,'PC30','','','','',1,0),(250,'Desktop','00:0b:6a:bf:9d:71',0,0,129,20121002,0,2,'PC29','','','','',1,0),(252,'Desktop','10:78:d2:1b:9a:ca',0,0,118,20120920,0,2,'PC18','','','','',1,0),(261,'Vostro Wireless','e0:06:e6:07:3c:87',0,0,36,20121002,0,3,'Jose Lopez','','','','',0,1),(265,'Desktop','00:11:09:c4:ba:e7',0,0,134,20121010,0,2,'PC34','','','','',1,0),(271,'Desktop','10:78:d2:1b:9b:c8',0,0,138,20120918,0,2,'PC38','','','','',1,0),(272,'Desktop','10:78:d2:1b:9b:ef',0,0,135,20121002,0,2,'PC35','','','','',1,0),(273,'Desktop','10:78:d2:1b:9b:9c',0,0,137,20121002,0,2,'PC37','','','','',1,0),(274,'Desktop','10:78:d2:1b:9b:96',0,0,136,20121002,0,2,'PC36','','','','',1,0),(281,'Switch','00:11:3b:18:87:57',0,0,4,0,0,8,'Micronet','','','','',1,1),(282,'Equipo telular 8 bocas','00:03:7e:00:7e:38',0,0,6,20130807,0,8,'Telular 2','','','','',1,1),(462,'NO TOCAR','FF:FF:FA:FF:FF:F0',0,2,1,20131101,0,2,'NO UTILIZAR','','','','',0,0),(286,'Vostro Ethernet','24:b6:fd:4d:ba:bc',0,0,33,20121002,0,3,'Jose Lopez','','','','',1,1),(291,'Desktop','00:e0:52:b3:41:67',0,2,191,20121002,0,8,'Servidor caballito 2','','','','',0,0),(472,'Samsung','98:0c:82:cf:59:fa',0,0,12,20131218,0,8,'Celular','','','','',1,1),(473,'asd','00:80:f0:d1:d1:2a',0,1,42,20131230,0,8,'telefono belgrano','','','','',0,0),(295,'Desktop','00:19:66:64:53:e3',0,0,141,20121010,0,2,'PC41','','','','',1,0),(298,'Desktop','00:11:09:c4:bd:64',0,0,152,20121001,0,2,'PC52','','','','',1,0),(321,'Linksys wrt54g','00:1e:e5:34:b3:a8',0,2,7,20121002,0,8,'Router Wifi','','','','',0,1),(323,'Desktop','00:1c:c0:37:40:b7',0,0,73,20121002,0,8,'Mariela Rossetti','','','','',1,1),(330,'Desktop','00:0b:6a:bf:a3:3f',0,0,67,20121002,0,2,'Controlador Fiscal 2','','','','',1,0),(341,'Desktop','00:0b:6a:c6:54:05',0,0,148,20120816,0,2,'PC48','','','','',1,0),(343,'Desktop','00:0b:6a:bf:a7:71',0,0,143,20120625,0,2,'PC43','','','','',1,0),(348,'Gateway Grandstream','00:0b:82:11:b9:2d',0,0,80,20121002,0,2,'Sala de Reuniones','','','','',1,1),(353,'Desktop','00:80:ad:b0:4c:47',0,0,147,20120705,0,2,'PC47','','','','',1,0),(358,'Notebook Ethernet','f0:de:f1:87:cb:2c',0,0,62,20120821,0,7,'Alejandro Rogers','','','','',1,1),(475,'.','70:71:bc:72:72:c6',0,0,14,20140115,0,3,'Servidor virtualizado','','','','',0,1),(476,'Notebook Samsung','18:67:b0:66:5c:8b',0,0,49,20140117,0,7,'Alejandro Rogers','','','','',1,1),(477,'Backup','00:08:54:a5:f0:8c',0,0,18,20140120,0,3,'I-Drive','','','','',0,1),(478,'Notebook Samsung Ethernet','e8:03:9a:53:01:65',0,0,19,20140124,0,7,'Alejandro Rogers','','','','',1,1),(365,'Desktop','00:0b:6a:bf:79:6d',0,0,145,20120905,0,2,'PC45','','','','',1,0),(446,'Notebook Lenovo WIFI','00:21:6b:ca:89:d0',0,0,72,20130911,0,7,'Manuela Gaitto','','','','',1,1),(471,'cel','98:0c:82:cf:59:fa',0,1,89,20131218,0,8,'Ce','','','','',0,0),(466,'Lenovo WIFI','00:1c:25:9f:e2:82',0,0,60,20131127,0,2,'Claudia Mattiussi','','','','',0,1),(394,'Desktop','00:11:09:c4:bd:58',0,0,142,20130423,0,2,'PC42','','','','',1,0),(370,'Router Wireless 2','00:25:9c:f5:ad:70',0,1,5,20121003,0,2,'WiFi Vicente Lopez','','','','',0,0),(469,'Television','48:02:2a:b4:ee:e1',0,0,5,20131202,0,3,'Android TV','','','','',1,1),(464,'Desktop','00:e0:52:b2:62:55',0,0,153,20131106,0,2,'PC53','','','','',1,0),(474,'Notebook','74:de:2b:d2:2b:cf',0,0,34,20140114,0,8,'Carlos','','','','',1,1),(468,'servidor temporal','00:11:d8:f9:fd:73',0,0,21,20131128,0,7,'Servidor temporal','','','','',0,1),(374,'Desktop ','00:27:0e:15:9d:38',0,0,61,20121015,0,7,'Erica Mirkouski','','','','',1,1),(412,'Notebook WIFI','78:dd:08:e0:20:c6',0,2,49,20130607,0,8,'Manuela Gaitto','','','','',1,1),(375,'Servidor','00:19:21:19:3d:7e',0,0,13,20121102,0,8,'Zafiro Backup','','','','',0,1),(414,'Notebook WIFI','e4:d5:3d:12:3a:db',0,0,26,20130611,0,7,'Dan Wyrytowski','','','','',1,1),(379,'Netbook','48:5d:60:dc:7d:37',0,2,24,20121109,0,8,'Dario Juarez','','','','',0,0),(380,'TP-LINK tl-mr3420','54:e6:fc:bc:1e:39',0,2,17,20121120,0,8,'Router wi-fi','','','','',0,1),(384,'Desktop','00:0b:6a:bf:9f:fa',0,0,146,20121203,0,2,'PC46','','','','',1,0),(395,'Notebook WIFI','00:26:82:05:cd:35',0,0,206,20130426,0,8,'Asesora Vicente Lopez','','','','',1,0),(389,'Notebook Ethernet','80:c1:6e:59:1b:df',0,2,82,20130311,0,8,'Manuela Gaitto','','','','',1,1),(390,'Multifuncion HP 3050','ec:9a:74:69:ef:66',0,0,30,20130325,0,2,'Impresora Reuniones','','','','',0,0),(391,'Linksys wrt54g','00:1e:e5:34:b3:a7',0,2,14,20130416,0,3,'Router Vte Lopez','','','','',0,1),(392,'Netbook HP mini','c0:18:85:6e:df:6a',0,0,205,20130416,0,8,'Asesora Lucia Barrios','','','','',1,0),(465,'Tablet','4c:bc:a5:47:e4:3a',0,0,97,20131107,0,8,'Claudia Mattiussi','','','','',1,1),(396,'Notebook WIFI','78:e4:00:d3:ee:d5',0,0,38,20130429,0,8,'Sistemas','','','','',1,1),(398,'Desktop ','00:0b:6a:74:88:6a',0,0,124,20130507,0,2,'PC24','','','','',1,0),(400,'Impresora Tesoreria','28:92:4a:a6:11:7a',0,0,32,20130517,0,8,'HPDESKJET3050','','','','',1,1),(402,'Desktop','00:27:0e:1c:28:ac',0,0,35,20130522,0,2,'Onell Lanfranco','','','','',1,1),(403,'MacbookPro WIFI','4c:8d:79:e9:51:36',0,0,39,20130522,0,7,'Onell Lanfranco','','','','',1,1),(404,'Telefono Cisco','00:0d:28:8f:9e:6f',0,0,45,20130522,0,8,'Cinthia Cabrino','','','','',0,1),(405,'Telefono IP Panasonic','00:80:f0:d1:ce:23',0,0,44,20130524,0,8,'Onell Lanfranco','','','','',0,1),(406,'Telefono IP Panasonic','00:80:f0:d1:cd:dc',0,0,202,20130527,0,8,'Dario Juarez','','','','',1,1),(408,'Telefono IP Panasonic','00:80:f0:d1:d5:4e',0,0,201,20130528,0,2,'Sistemas','','','','',1,1),(409,'Telefono IP Panasonic','00:80:f0:d1:d5:46',0,0,203,20130528,0,8,'Vicente López Recepción','','','','',1,1),(410,'Telefono IP Panasonic','00:80:f0:d1:d1:9f',0,0,200,20130529,0,8,'Erica Mirkouski','','','','',1,1),(411,'Gateway Grandstream','00:0b:82:14:dc:47',0,0,46,20130530,0,8,'Mariela Rossetti','','','','',0,1),(415,'Carlos Rodriguez','00:80:f0:d1:d1:dd',0,0,204,20130614,0,8,'Telefono IP Panasonic','','','','',1,1),(417,'Impresora Wireleess','00:15:99:ac:98:99',0,0,31,20130619,0,2,'Impresora Onell','','','','',0,1),(418,'Notebook WIFI','94:39:e5:0e:73:15',0,0,29,20130619,0,7,'Alejandro Rogers','','','','',1,1),(422,'iPhone','c8:6f:1d:0b:3e:66',0,0,37,20130711,0,7,'Onell Lanfranco','','','','',1,1),(423,'iPad','9c:04:eb:e9:b5:3a',0,0,50,20130715,0,8,'Jose Lopez','','','','',1,1),(433,'MacbookPro Ethernet','10:dd:b1:aa:09:3a',0,0,48,20130802,0,3,'Onell Lanfranco','','','','',1,1),(434,'Notebook WIFI','b8:03:05:4e:e1:43',0,0,54,20130802,0,2,'Sonia Toconas','','','','',1,1),(463,'Telefono Sony Ericsson','30:39:26:65:8b:8e',0,0,90,20131106,0,8,'Claudia Mattiussi','','','','',1,1),(435,'Desktop','44:87:fc:ef:f3:73',0,0,149,20130807,0,2,'PC49','','','','',1,0),(438,'Desktop','00:0b:6a:bf:79:58',0,0,16,20130814,0,8,'Depilight TV','','','','',1,1),(444,'Notebook Lenovo WIFI','00:22:fa:2d:c8:a6',0,0,17,20130910,0,7,'Claudia Mattiussi','','','','',1,1),(445,'Notebook Lenovo WIFI','00:26:c6:c6:7e:c4',0,0,43,20130910,0,7,'Dario Juarez','','','','',1,1),(447,'Notebook Lenovo LAN','00:22:68:19:c9:96',0,0,99,20130913,0,8,'Dario Juarez','','','','',1,1),(451,'Notebook Lenovo WIFI','00:1c:25:9f:e2:82',0,2,25,20130923,0,7,'Claudia Mattiussi ','','','','',1,1),(452,'ROTA QUE SE APAGA','00:26:9e:d9:f6:fc',0,0,51,20130924,0,8,'Toshiba Satellite','','','','',1,1),(453,'Blackberry Bold','40:6f:2a:da:1c:01',0,0,11,20130925,0,8,'Jose Lopez','','','','',1,1),(454,'Desktop ','00:1b:b9:e2:51:7e',0,0,15,20131002,0,8,'Alejandro Rogers','','','','',1,1),(456,'Telefono Motorola','80:96:b1:df:d1:77',0,0,59,20131009,0,8,'Dario Juarez','','','','',0,1),(457,'Recepcion Billing','00:0b:6a:bf:a7:70',0,2,19,20131011,0,8,'Desktop XUBUNTU','','','','',1,1),(458,'iPad','bc:3b:af:c3:21:0e',0,0,98,20131018,0,8,'Alejandro Rogers','','','','',1,1),(459,'Desktop','00:0b:6a:c6:5e:6f',0,2,153,20131018,0,2,'PC53','','','','',1,0),(460,'Desktop','00:19:d1:20:e2:0a',0,0,154,20131029,0,2,'PC54','','','','',1,0),(461,'Apple TV','f4:f9:51:c8:db:ed',0,0,47,20131029,0,7,'Onell Lanfranco',NULL,NULL,NULL,NULL,1,1);
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
INSERT INTO `firewall` VALUES (3,'-A OUTPUT -p tcp --sport 3784 -j ACCEPT',2,'Ventrilo Out',2),(4,'iptables -A INPUT -p udp --dport 3784 -j ACCEPT',2,'Ventrilo IN UDP',3),(5,'iptables iptables -A OUTPUT -p udp --sport 3784 -j ACCEPT',2,'Ventrilo OUT UDP',4),(6,'-A FORWARD -s 172.16.50.1 -j LOG --log-prefix \'JOE-------\'',2,'probando',1),(7,'-A INPUT -s 201.216.237.165 -p tcp --sport 800 -j ACCEPT',2,'AGA',2),(8,'-A OUTPUT -d 201.216.237.165 -p tcp --dport 800 -j ACCEPT',2,'AGA',2),(9,'-t nat -A PREROUTING -p tcp --dport 8923 -j DNAT --to 172.16.0.4:22',2,'SSH a la cerda',1),(10,'-A OUTPUT -p 443 -d sps.decidir.com -j ACCEPT',2,'SPS',4),(11,'-A FORWARD -d sps.decidir.com -j ACCEPT',2,'SPS OUT',6),(12,'-A FORWARD -s sps.decidir.com -j ACCEPT',2,'SPS IN',7),(13,'-A FORWARD -d 200.80.194.18 -p udp -j ACCEPT',0,'DNS SPS 1/4',5),(14,'-A FORWARD -s 200.80.194.18 -p udp -j ACCEPT',0,'DNS SPS 2/4',5),(15,'-A FORWARD -d 200.80.194.18 -p tcp -j ACCEPT',0,'DNS SPS 3/4',5),(16,'-A FORWARD -s 200.80.194.18 -p tcp -j ACCEPT',0,'DNS SPS 4/4',5),(17,'-P INPUT ACCEPT',2,'FIX TEMPORAL',0),(18,'-P OUTPUT ACCEPT',2,'FIX TEMPORAL 2',0),(19,'-A FORWARD -d 200.69.248.13 -j ACCEPT',0,'sps.decidir.com IP 1 OUT',1),(20,'-A FORWARD -s 200.69.248.13 -j ACCEPT',0,'sps.decidir.com IP 1 IN',1),(21,'-A FORWARD -s 190.221.46.236 -j ACCEPT',0,'sps.decidir.com IP 2 IN',1),(22,'-A FORWARD -d 190.221.46.236 -j ACCEPT',0,'sps.decidir.com IP 2 OUT',1),(23,'-A FORWARD -s 200.80.195.18 -p udp -j ACCEPT',0,'DNS SPS 5/6',7),(24,'-A FORWARD -d 200.80.195.18 -p udp -j ACCEPT',0,'DNS SPS 6/6',7),(25,'-A FORWARD -d 190.221.46.236 -j ACCEPT',0,'SPS IP2 OUT',1),(26,'-A OUTPUT -o eth0 -p tcp --sport 3128 -j ACCEPT',0,'PROXY OUT',10),(27,'-A INPUT -i eth0 -p tcp --dport 3128 -j ACCEPT',0,'PROXY IN',10),(28,'-A FORWARD -d 190.2.45.229 -j ACCEPT',0,'www.depilight.com/O',10),(29,'-A FORWARD -s 190.2.45.229 -j ACCEPT',0,'www.depilight.com/I',10),(30,'-t nat -A PREROUTING -i eth0 -p tcp --dport 80 -s 172.16.0.33 -j REDIRECT --to-port 3128',2,'LUCHO PROXY TEST',9),(31,'-A OUTPUT -o eth1 -p tcp --sport 3128 -j ACCEPT',2,'DAN PROXY OUT',15),(32,'-A INPUT -i eth1 -p tcp --dport 3128 -j ACCEPT',2,'DAN PROXY IN',15),(33,'-A FORWARD -d 190.2.29.105 -j ACCEPT',0,'TELEFONOS DESDE AFUERA OUT',10),(34,'-A FORWARD -s 190.2.29.105 -j ACCEPT',0,'TELEFONOS DESDE AFUERA IN',11),(35,'-t nat -A PREROUTING -i eth1 -p udp -s 0.0.0.0/0 --dport 4097 -j DNAT --to 172.16.0.36:4097',2,'virloc',10);
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interfacesvirtualesint` varchar(7) DEFAULT NULL,
  `interfacesvirtualesest` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=253 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interfacesvirtuales`
--

LOCK TABLES `interfacesvirtuales` WRITE;
/*!40000 ALTER TABLE `interfacesvirtuales` DISABLE KEYS */;
INSERT INTO `interfacesvirtuales` VALUES (1,'eth3',0),(2,'eth4',0),(3,'eth5',0),(4,'eth6',0),(5,'eth7',0),(6,'eth8',0),(7,'eth9',0),(8,'eth10',1),(9,'eth11',0),(10,'eth12',0),(11,'eth13',0),(12,'eth14',0),(13,'eth15',0),(14,'eth16',0),(15,'eth17',0),(16,'eth18',0),(17,'eth19',0),(18,'eth20',0),(19,'eth21',0),(20,'eth22',0),(21,'eth23',0),(22,'eth24',0),(23,'eth25',0),(24,'eth26',0),(25,'eth27',0),(26,'eth28',0),(27,'eth29',0),(28,'eth30',0),(29,'eth31',0),(30,'eth32',0),(31,'eth33',0),(32,'eth34',0),(33,'eth35',0),(34,'eth36',0),(35,'eth37',0),(36,'eth38',0),(37,'eth39',0),(38,'eth40',0),(39,'eth41',0),(40,'eth42',0),(41,'eth43',0),(42,'eth44',0),(43,'eth45',0),(44,'eth46',0),(45,'eth47',0),(46,'eth48',0),(47,'eth49',0),(48,'eth50',0),(49,'eth51',0),(50,'eth52',0),(51,'eth53',0),(52,'eth54',0),(53,'eth55',0),(54,'eth56',0),(55,'eth57',0),(56,'eth58',0),(57,'eth59',0),(58,'eth60',0),(59,'eth61',0),(60,'eth62',0),(61,'eth63',0),(62,'eth64',0),(63,'eth65',0),(64,'eth66',0),(65,'eth67',0),(66,'eth68',0),(67,'eth69',0),(68,'eth70',0),(69,'eth71',0),(70,'eth72',0),(71,'eth73',0),(72,'eth74',0),(73,'eth75',0),(74,'eth76',0),(75,'eth77',0),(76,'eth78',0),(77,'eth79',0),(78,'eth80',0),(79,'eth81',0),(80,'eth82',0),(81,'eth83',0),(82,'eth84',0),(83,'eth85',0),(84,'eth86',0),(85,'eth87',0),(86,'eth88',0),(87,'eth89',0),(88,'eth90',0),(89,'eth91',0),(90,'eth92',0),(91,'eth93',0),(92,'eth94',0),(93,'eth95',0),(94,'eth96',0),(95,'eth97',0),(96,'eth98',0),(97,'eth99',0),(98,'eth100',0),(99,'eth101',0),(100,'eth102',0),(101,'eth103',0),(102,'eth104',0),(103,'eth105',0),(104,'eth106',0),(105,'eth107',0),(106,'eth108',0),(107,'eth109',0),(108,'eth110',0),(109,'eth111',0),(110,'eth112',0),(111,'eth113',0),(112,'eth114',0),(113,'eth115',0),(114,'eth116',0),(115,'eth117',0),(116,'eth118',0),(117,'eth119',0),(118,'eth120',0),(119,'eth121',0),(120,'eth122',0),(121,'eth123',0),(122,'eth124',0),(123,'eth125',0),(124,'eth126',0),(125,'eth127',0),(126,'eth128',0),(127,'eth129',0),(128,'eth130',0),(129,'eth131',0),(130,'eth132',0),(131,'eth133',0),(132,'eth134',0),(133,'eth135',0),(134,'eth136',0),(135,'eth137',0),(136,'eth138',0),(137,'eth139',0),(138,'eth140',0),(139,'eth141',0),(140,'eth142',0),(141,'eth143',0),(142,'eth144',0),(143,'eth145',0),(144,'eth146',0),(145,'eth147',0),(146,'eth148',0),(147,'eth149',0),(148,'eth150',0),(149,'eth151',0),(150,'eth152',0),(151,'eth153',0),(152,'eth154',0),(153,'eth155',0),(154,'eth156',0),(155,'eth157',0),(156,'eth158',0),(157,'eth159',0),(158,'eth160',0),(159,'eth161',0),(160,'eth162',0),(161,'eth163',0),(162,'eth164',0),(163,'eth165',0),(164,'eth166',0),(165,'eth167',0),(166,'eth168',0),(167,'eth169',0),(168,'eth170',0),(169,'eth171',0),(170,'eth172',0),(171,'eth173',0),(172,'eth174',0),(173,'eth175',0),(174,'eth176',0),(175,'eth177',0),(176,'eth178',0),(177,'eth179',0),(178,'eth180',0),(179,'eth181',0),(180,'eth182',0),(181,'eth183',0),(182,'eth184',0),(183,'eth185',0),(184,'eth186',0),(185,'eth187',0),(186,'eth188',0),(187,'eth189',0),(188,'eth190',0),(189,'eth191',0),(190,'eth192',0),(191,'eth193',0),(192,'eth194',0),(193,'eth195',0),(194,'eth196',0),(195,'eth197',0),(196,'eth198',0),(197,'eth199',0),(198,'eth200',0),(199,'eth201',0),(200,'eth202',0),(201,'eth203',0),(202,'eth204',0),(203,'eth205',0),(204,'eth206',0),(205,'eth207',0),(206,'eth208',0),(207,'eth209',0),(208,'eth210',0),(209,'eth211',0),(210,'eth212',0),(211,'eth213',0),(212,'eth214',0),(213,'eth215',0),(214,'eth216',0),(215,'eth217',0),(216,'eth218',0),(217,'eth219',0),(218,'eth220',0),(219,'eth221',0),(220,'eth222',0),(221,'eth223',0),(222,'eth224',0),(223,'eth225',0),(224,'eth226',0),(225,'eth227',0),(226,'eth228',0),(227,'eth229',0),(228,'eth230',0),(229,'eth231',0),(230,'eth232',0),(231,'eth233',0),(232,'eth234',0),(233,'eth235',0),(234,'eth236',0),(235,'eth237',0),(236,'eth238',0),(237,'eth239',0),(238,'eth240',0),(239,'eth241',0),(240,'eth242',0),(241,'eth243',0),(242,'eth244',0),(243,'eth245',0),(244,'eth246',0),(245,'eth247',0),(246,'eth248',0),(247,'eth249',0),(248,'eth250',0),(249,'eth251',0),(250,'eth252',0),(251,'eth253',0),(252,'eth254',0);
/*!40000 ALTER TABLE `interfacesvirtuales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ips`
--

DROP TABLE IF EXISTS `ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=255 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ips`
--

LOCK TABLES `ips` WRITE;
/*!40000 ALTER TABLE `ips` DISABLE KEYS */;
INSERT INTO `ips` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40),(41,41),(42,42),(43,43),(44,44),(45,45),(46,46),(47,47),(48,48),(49,49),(50,50),(51,51),(52,52),(53,53),(54,54),(55,55),(56,56),(57,57),(58,58),(59,59),(60,60),(61,61),(62,62),(63,63),(64,64),(65,65),(66,66),(67,67),(68,68),(69,69),(70,70),(71,71),(72,72),(73,73),(74,74),(75,75),(76,76),(77,77),(78,78),(79,79),(80,80),(81,81),(82,82),(83,83),(84,84),(85,85),(86,86),(87,87),(88,88),(89,89),(90,90),(91,91),(92,92),(93,93),(94,94),(95,95),(96,96),(97,97),(98,98),(99,99),(100,100),(101,101),(102,102),(103,103),(104,104),(105,105),(106,106),(107,107),(108,108),(109,109),(110,110),(111,111),(112,112),(113,113),(114,114),(115,115),(116,116),(117,117),(118,118),(119,119),(120,120),(121,121),(122,122),(123,123),(124,124),(125,125),(126,126),(127,127),(128,128),(129,129),(130,130),(131,131),(132,132),(133,133),(134,134),(135,135),(136,136),(137,137),(138,138),(139,139),(140,140),(141,141),(142,142),(143,143),(144,144),(145,145),(146,146),(147,147),(148,148),(149,149),(150,150),(151,151),(152,152),(153,153),(154,154),(155,155),(156,156),(157,157),(158,158),(159,159),(160,160),(161,161),(162,162),(163,163),(164,164),(165,165),(166,166),(167,167),(168,168),(169,169),(170,170),(171,171),(172,172),(173,173),(174,174),(175,175),(176,176),(177,177),(178,178),(179,179),(180,180),(181,181),(182,182),(183,183),(184,184),(185,185),(186,186),(187,187),(188,188),(189,189),(190,190),(191,191),(192,192),(193,193),(194,194),(195,195),(196,196),(197,197),(198,198),(199,199),(200,200),(201,201),(202,202),(203,203),(204,204),(205,205),(206,206),(207,207),(208,208),(209,209),(210,210),(211,211),(212,212),(213,213),(214,214),(215,215),(216,216),(217,217),(218,218),(219,219),(220,220),(221,221),(222,222),(223,223),(224,224),(225,225),(226,226),(227,227),(228,228),(229,229),(230,230),(231,231),(232,232),(233,233),(234,234),(235,235),(236,236),(237,237),(238,238),(239,239),(240,240),(241,241),(242,242),(243,243),(244,244),(245,245),(246,246),(247,247),(248,248),(249,249),(250,250),(251,251),(252,252),(253,253),(254,254);
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
  `plan` int(11) NOT NULL,
  `dia` int(10) unsigned NOT NULL DEFAULT '0',
  `hora` int(10) unsigned NOT NULL DEFAULT '0',
  `canal` int(10) unsigned NOT NULL DEFAULT '0',
  `estado` int(10) unsigned NOT NULL DEFAULT '0',
  `nombre` varchar(45) NOT NULL DEFAULT '',
  `valor` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1345 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planes`
--

LOCK TABLES `planes` WRITE;
/*!40000 ALTER TABLE `planes` DISABLE KEYS */;
INSERT INTO `planes` VALUES (1,4,23,5,2,'123123',0,1),(1,3,23,5,2,'123123',0,2),(1,2,23,5,2,'123123',0,3),(1,1,23,5,2,'123123',0,4),(0,7,22,5,2,'123123',0,5),(0,6,22,5,2,'123123',0,6),(0,5,22,5,2,'123123',0,7),(0,4,22,5,2,'123123',0,8),(0,3,22,5,2,'123123',0,9),(0,2,22,5,2,'123123',0,10),(0,1,22,5,2,'123123',0,11),(0,7,21,5,2,'123123',0,12),(0,6,21,5,2,'123123',0,13),(0,5,21,5,2,'123123',0,14),(0,4,21,5,2,'123123',0,15),(0,3,21,5,2,'123123',0,16),(0,2,21,5,2,'123123',0,17),(0,1,21,5,2,'123123',0,18),(0,7,20,5,2,'123123',0,19),(0,6,20,5,2,'123123',0,20),(0,5,20,5,2,'123123',0,21),(0,4,20,5,2,'123123',0,22),(0,3,20,5,2,'123123',0,23),(0,2,20,5,2,'123123',0,24),(0,1,20,5,2,'123123',0,25),(0,7,19,5,2,'123123',0,26),(0,6,19,5,2,'123123',0,27),(0,5,19,5,2,'123123',0,28),(0,4,19,5,2,'123123',0,29),(0,3,19,5,2,'123123',0,30),(0,2,19,5,2,'123123',0,31),(0,1,19,5,2,'123123',0,32),(0,7,18,5,2,'123123',0,33),(0,6,18,5,2,'123123',0,34),(0,5,18,5,2,'123123',0,35),(0,4,18,5,2,'123123',0,36),(0,3,18,5,2,'123123',0,37),(0,2,18,5,2,'123123',0,38),(0,1,18,5,2,'123123',0,39),(0,7,17,5,2,'123123',0,40),(0,6,17,5,2,'123123',0,41),(0,5,17,5,2,'123123',0,42),(0,4,17,5,2,'123123',0,43),(0,3,17,5,2,'123123',0,44),(0,2,17,5,2,'123123',0,45),(0,1,17,5,2,'123123',0,46),(0,7,16,5,2,'123123',0,47),(0,6,16,5,2,'123123',0,48),(0,5,16,5,2,'123123',0,49),(0,4,16,5,2,'123123',0,50),(0,3,16,5,2,'123123',0,51),(0,2,16,5,2,'123123',0,52),(0,1,16,5,2,'123123',0,53),(0,7,15,5,2,'123123',0,54),(0,6,15,5,2,'123123',0,55),(0,5,15,5,2,'123123',0,56),(0,4,15,5,2,'123123',0,57),(0,3,15,5,2,'123123',0,58),(0,2,15,5,2,'123123',0,59),(0,1,15,5,2,'123123',0,60),(0,7,14,5,2,'123123',0,61),(0,6,14,5,2,'123123',0,62),(0,5,14,5,2,'123123',0,63),(0,4,14,5,2,'123123',0,64),(0,3,14,5,2,'123123',0,65),(0,2,14,5,2,'123123',0,66),(0,1,14,5,2,'123123',0,67),(0,7,13,5,2,'123123',0,68),(0,6,13,5,2,'123123',0,69),(0,5,13,5,2,'123123',0,70),(0,4,13,5,2,'123123',0,71),(0,3,13,5,2,'123123',0,72),(0,2,13,5,2,'123123',0,73),(0,1,13,5,2,'123123',0,74),(0,7,12,5,2,'123123',0,75),(0,6,12,5,2,'123123',0,76),(0,5,12,5,2,'123123',0,77),(0,4,12,5,2,'123123',0,78),(0,3,12,5,2,'123123',0,79),(0,2,12,5,2,'123123',0,80),(0,1,12,5,2,'123123',0,81),(0,7,11,5,2,'123123',0,82),(0,6,11,5,2,'123123',0,83),(0,5,11,5,2,'123123',0,84),(0,4,11,5,2,'123123',0,85),(0,3,11,5,2,'123123',0,86),(0,2,11,5,2,'123123',0,87),(0,1,11,5,2,'123123',0,88),(0,7,10,5,2,'123123',0,89),(0,6,10,5,2,'123123',0,90),(0,5,10,5,2,'123123',0,91),(0,4,10,5,2,'123123',0,92),(0,3,10,5,2,'123123',0,93),(0,2,10,5,2,'123123',0,94),(0,1,10,5,2,'123123',0,95),(0,7,9,5,2,'123123',0,96),(0,6,9,5,2,'123123',0,97),(0,5,9,5,2,'123123',0,98),(0,4,9,5,2,'123123',0,99),(0,3,9,5,2,'123123',0,100),(0,2,9,5,2,'123123',0,101),(0,1,9,5,2,'123123',0,102),(0,7,8,5,2,'123123',0,103),(0,6,8,5,2,'123123',0,104),(0,5,8,5,2,'123123',0,105),(0,4,8,5,2,'123123',0,106),(0,3,8,5,2,'123123',0,107),(0,2,8,5,2,'123123',0,108),(0,1,8,5,2,'123123',0,109),(0,7,7,5,2,'123123',0,110),(0,6,7,5,2,'123123',0,111),(0,5,7,5,2,'123123',0,112),(0,4,7,5,2,'123123',0,113),(0,3,7,5,2,'123123',0,114),(0,2,7,5,2,'123123',0,115),(0,1,7,5,2,'123123',0,116),(0,7,6,5,2,'123123',0,117),(0,6,6,5,2,'123123',0,118),(0,5,6,5,2,'123123',0,119),(0,4,6,5,2,'123123',0,120),(0,3,6,5,2,'123123',0,121),(0,2,6,5,2,'123123',0,122),(0,1,6,5,2,'123123',0,123),(0,7,5,5,2,'123123',0,124),(0,6,5,5,2,'123123',0,125),(0,5,5,5,2,'123123',0,126),(0,4,5,5,2,'123123',0,127),(0,3,5,5,2,'123123',0,128),(0,2,5,5,2,'123123',0,129),(0,1,5,5,2,'123123',0,130),(0,7,4,5,2,'123123',0,131),(0,6,4,5,2,'123123',0,132),(0,5,4,5,2,'123123',0,133),(0,4,4,5,2,'123123',0,134),(0,3,4,5,2,'123123',0,135),(0,2,4,5,2,'123123',0,136),(0,1,4,5,2,'123123',0,137),(0,7,3,5,2,'123123',0,138),(0,6,3,5,2,'123123',0,139),(0,5,3,5,2,'123123',0,140),(0,4,3,5,2,'123123',0,141),(0,3,3,5,2,'123123',0,142),(0,2,3,5,2,'123123',0,143),(0,1,3,5,2,'123123',0,144),(0,7,2,5,2,'123123',0,145),(0,6,2,5,2,'123123',0,146),(0,5,2,5,2,'123123',0,147),(0,4,2,5,2,'123123',0,148),(0,3,2,5,2,'123123',0,149),(0,2,2,5,2,'123123',0,150),(0,1,2,5,2,'123123',0,151),(0,7,1,5,2,'123123',0,152),(0,6,1,5,2,'123123',0,153),(0,5,1,5,2,'123123',0,154),(0,4,1,5,2,'123123',0,155),(0,3,1,5,2,'123123',0,156),(0,2,1,5,2,'123123',0,157),(0,1,1,5,2,'123123',0,158),(0,7,0,5,2,'123123',0,159),(0,6,0,5,2,'123123',0,160),(0,5,0,5,2,'123123',0,161),(0,4,0,5,2,'123123',0,162),(0,3,0,5,2,'123123',0,163),(0,2,0,5,2,'123123',0,164),(0,1,0,5,2,'123123',0,165),(0,1,0,1,0,'CALL CENTER',0,166),(0,2,0,1,0,'CALL CENTER',0,167),(0,3,0,1,0,'CALL CENTER',0,168),(0,4,0,1,0,'CALL CENTER',0,169),(0,5,0,1,0,'CALL CENTER',0,170),(0,6,0,1,0,'CALL CENTER',0,171),(0,7,0,1,0,'CALL CENTER',0,172),(0,1,1,1,0,'CALL CENTER',0,173),(0,2,1,1,0,'CALL CENTER',0,174),(0,3,1,1,0,'CALL CENTER',0,175),(0,4,1,1,0,'CALL CENTER',0,176),(0,5,1,1,0,'CALL CENTER',0,177),(0,6,1,1,0,'CALL CENTER',0,178),(0,7,1,1,0,'CALL CENTER',0,179),(0,1,2,1,0,'CALL CENTER',0,180),(0,2,2,1,0,'CALL CENTER',0,181),(0,3,2,1,0,'CALL CENTER',0,182),(0,4,2,1,0,'CALL CENTER',0,183),(0,5,2,1,0,'CALL CENTER',0,184),(0,6,2,1,0,'CALL CENTER',0,185),(0,7,2,1,0,'CALL CENTER',0,186),(0,1,3,1,0,'CALL CENTER',0,187),(0,2,3,1,0,'CALL CENTER',0,188),(0,3,3,1,0,'CALL CENTER',0,189),(0,4,3,1,0,'CALL CENTER',0,190),(0,5,3,1,0,'CALL CENTER',0,191),(0,6,3,1,0,'CALL CENTER',0,192),(0,7,3,1,0,'CALL CENTER',0,193),(0,1,4,1,0,'CALL CENTER',0,194),(0,2,4,1,0,'CALL CENTER',0,195),(0,3,4,1,0,'CALL CENTER',0,196),(0,4,4,1,0,'CALL CENTER',0,197),(0,5,4,1,0,'CALL CENTER',0,198),(0,6,4,1,0,'CALL CENTER',0,199),(0,7,4,1,0,'CALL CENTER',0,200),(0,1,5,1,0,'CALL CENTER',0,201),(0,2,5,1,0,'CALL CENTER',0,202),(0,3,5,1,0,'CALL CENTER',0,203),(0,4,5,1,0,'CALL CENTER',0,204),(0,5,5,1,0,'CALL CENTER',0,205),(0,6,5,1,0,'CALL CENTER',0,206),(0,7,5,1,0,'CALL CENTER',0,207),(0,1,6,1,0,'CALL CENTER',0,208),(0,2,6,1,0,'CALL CENTER',0,209),(0,3,6,1,0,'CALL CENTER',0,210),(0,4,6,1,0,'CALL CENTER',0,211),(0,5,6,1,0,'CALL CENTER',0,212),(0,6,6,1,0,'CALL CENTER',0,213),(0,7,6,1,0,'CALL CENTER',0,214),(0,1,7,1,0,'CALL CENTER',0,215),(0,2,7,1,0,'CALL CENTER',0,216),(0,3,7,1,0,'CALL CENTER',0,217),(0,4,7,1,0,'CALL CENTER',0,218),(0,5,7,1,0,'CALL CENTER',0,219),(0,6,7,1,0,'CALL CENTER',0,220),(0,7,7,1,0,'CALL CENTER',0,221),(0,1,8,1,0,'CALL CENTER',0,222),(0,2,8,1,0,'CALL CENTER',0,223),(0,3,8,1,0,'CALL CENTER',0,224),(0,4,8,1,0,'CALL CENTER',0,225),(0,5,8,1,0,'CALL CENTER',0,226),(0,6,8,1,0,'CALL CENTER',0,227),(0,7,8,1,0,'CALL CENTER',0,228),(0,1,9,1,0,'CALL CENTER',0,229),(0,2,9,1,0,'CALL CENTER',0,230),(0,3,9,1,0,'CALL CENTER',0,231),(0,4,9,1,0,'CALL CENTER',0,232),(0,5,9,1,0,'CALL CENTER',0,233),(0,6,9,1,0,'CALL CENTER',0,234),(0,7,9,1,0,'CALL CENTER',0,235),(0,1,10,1,0,'CALL CENTER',0,236),(0,2,10,1,0,'CALL CENTER',0,237),(0,3,10,1,0,'CALL CENTER',0,238),(0,4,10,1,0,'CALL CENTER',0,239),(0,5,10,1,0,'CALL CENTER',0,240),(0,6,10,1,0,'CALL CENTER',0,241),(0,7,10,1,0,'CALL CENTER',0,242),(0,1,11,1,0,'CALL CENTER',0,243),(0,2,11,1,0,'CALL CENTER',0,244),(0,3,11,1,0,'CALL CENTER',0,245),(0,4,11,1,0,'CALL CENTER',0,246),(0,5,11,1,0,'CALL CENTER',0,247),(0,6,11,1,0,'CALL CENTER',0,248),(0,7,11,1,0,'CALL CENTER',0,249),(0,1,12,1,0,'CALL CENTER',0,250),(0,2,12,1,0,'CALL CENTER',0,251),(0,3,12,1,0,'CALL CENTER',0,252),(0,4,12,1,0,'CALL CENTER',0,253),(0,5,12,1,0,'CALL CENTER',0,254),(0,6,12,1,0,'CALL CENTER',0,255),(0,7,12,1,0,'CALL CENTER',0,256),(0,1,13,1,0,'CALL CENTER',0,257),(0,2,13,1,0,'CALL CENTER',0,258),(0,3,13,1,0,'CALL CENTER',0,259),(0,4,13,1,0,'CALL CENTER',0,260),(0,5,13,1,0,'CALL CENTER',0,261),(0,6,13,1,0,'CALL CENTER',0,262),(0,7,13,1,0,'CALL CENTER',0,263),(0,1,14,1,0,'CALL CENTER',0,264),(0,2,14,1,0,'CALL CENTER',0,265),(0,3,14,1,0,'CALL CENTER',0,266),(0,4,14,1,0,'CALL CENTER',0,267),(0,5,14,1,0,'CALL CENTER',0,268),(0,6,14,1,0,'CALL CENTER',0,269),(0,7,14,1,0,'CALL CENTER',0,270),(0,1,15,1,0,'CALL CENTER',0,271),(0,2,15,1,0,'CALL CENTER',0,272),(0,3,15,1,0,'CALL CENTER',0,273),(0,4,15,1,0,'CALL CENTER',0,274),(0,5,15,1,0,'CALL CENTER',0,275),(0,6,15,1,0,'CALL CENTER',0,276),(0,7,15,1,0,'CALL CENTER',0,277),(0,1,16,1,0,'CALL CENTER',0,278),(0,2,16,1,0,'CALL CENTER',0,279),(0,3,16,1,0,'CALL CENTER',0,280),(0,4,16,1,0,'CALL CENTER',0,281),(0,5,16,1,0,'CALL CENTER',0,282),(0,6,16,1,0,'CALL CENTER',0,283),(0,7,16,1,0,'CALL CENTER',0,284),(0,1,17,1,0,'CALL CENTER',0,285),(0,2,17,1,0,'CALL CENTER',0,286),(0,3,17,1,0,'CALL CENTER',0,287),(0,4,17,1,0,'CALL CENTER',0,288),(0,5,17,1,0,'CALL CENTER',0,289),(0,6,17,1,0,'CALL CENTER',0,290),(0,7,17,1,0,'CALL CENTER',0,291),(0,1,18,1,0,'CALL CENTER',0,292),(0,2,18,1,0,'CALL CENTER',0,293),(0,3,18,1,0,'CALL CENTER',0,294),(0,4,18,1,0,'CALL CENTER',0,295),(0,5,18,1,0,'CALL CENTER',0,296),(0,6,18,1,0,'CALL CENTER',0,297),(0,7,18,1,0,'CALL CENTER',0,298),(0,1,19,1,0,'CALL CENTER',0,299),(0,2,19,1,0,'CALL CENTER',0,300),(0,3,19,1,0,'CALL CENTER',0,301),(0,4,19,1,0,'CALL CENTER',0,302),(0,5,19,1,0,'CALL CENTER',0,303),(0,6,19,1,0,'CALL CENTER',0,304),(0,7,19,1,0,'CALL CENTER',0,305),(0,1,20,1,0,'CALL CENTER',0,306),(0,2,20,1,0,'CALL CENTER',0,307),(0,3,20,1,0,'CALL CENTER',0,308),(0,4,20,1,0,'CALL CENTER',0,309),(0,5,20,1,0,'CALL CENTER',0,310),(0,6,20,1,0,'CALL CENTER',0,311),(0,7,20,1,0,'CALL CENTER',0,312),(0,1,21,1,0,'CALL CENTER',0,313),(0,2,21,1,0,'CALL CENTER',0,314),(0,3,21,1,0,'CALL CENTER',0,315),(0,4,21,1,0,'CALL CENTER',0,316),(0,5,21,1,0,'CALL CENTER',0,317),(0,6,21,1,0,'CALL CENTER',0,318),(0,7,21,1,0,'CALL CENTER',0,319),(0,1,22,1,0,'CALL CENTER',0,320),(0,2,22,1,0,'CALL CENTER',0,321),(0,3,22,1,0,'CALL CENTER',0,322),(0,4,22,1,0,'CALL CENTER',0,323),(0,5,22,1,0,'CALL CENTER',0,324),(0,6,22,1,0,'CALL CENTER',0,325),(0,7,22,1,0,'CALL CENTER',0,326),(0,1,23,1,0,'CALL CENTER',0,327),(0,2,23,1,0,'CALL CENTER',0,328),(0,3,23,1,0,'CALL CENTER',0,329),(0,4,23,1,0,'CALL CENTER',0,330),(0,5,23,1,0,'CALL CENTER',0,331),(0,6,23,1,0,'CALL CENTER',0,332),(0,7,23,1,0,'CALL CENTER',0,333),(0,1,0,2,0,'LIBRE',NULL,334),(0,2,0,2,0,'LIBRE',NULL,335),(0,3,0,2,0,'LIBRE',NULL,336),(0,4,0,2,0,'LIBRE',NULL,337),(0,5,0,2,0,'LIBRE',NULL,338),(0,6,0,2,0,'LIBRE',NULL,339),(0,7,0,2,0,'LIBRE',NULL,340),(0,1,1,2,0,'LIBRE',NULL,341),(0,2,1,2,0,'LIBRE',NULL,342),(0,3,1,2,0,'LIBRE',NULL,343),(0,4,1,2,0,'LIBRE',NULL,344),(0,5,1,2,0,'LIBRE',NULL,345),(0,6,1,2,0,'LIBRE',NULL,346),(0,7,1,2,0,'LIBRE',NULL,347),(0,1,2,2,0,'LIBRE',NULL,348),(0,2,2,2,0,'LIBRE',NULL,349),(0,3,2,2,0,'LIBRE',NULL,350),(0,4,2,2,0,'LIBRE',NULL,351),(0,5,2,2,0,'LIBRE',NULL,352),(0,6,2,2,0,'LIBRE',NULL,353),(0,7,2,2,0,'LIBRE',NULL,354),(0,1,3,2,0,'LIBRE',NULL,355),(0,2,3,2,0,'LIBRE',NULL,356),(0,3,3,2,0,'LIBRE',NULL,357),(0,4,3,2,0,'LIBRE',NULL,358),(0,5,3,2,0,'LIBRE',NULL,359),(0,6,3,2,0,'LIBRE',NULL,360),(0,7,3,2,0,'LIBRE',NULL,361),(0,1,4,2,0,'LIBRE',NULL,362),(0,2,4,2,0,'LIBRE',NULL,363),(0,3,4,2,0,'LIBRE',NULL,364),(0,4,4,2,0,'LIBRE',NULL,365),(0,5,4,2,0,'LIBRE',NULL,366),(0,6,4,2,0,'LIBRE',NULL,367),(0,7,4,2,0,'LIBRE',NULL,368),(0,1,5,2,0,'LIBRE',NULL,369),(0,2,5,2,0,'LIBRE',NULL,370),(0,3,5,2,0,'LIBRE',NULL,371),(0,4,5,2,0,'LIBRE',NULL,372),(0,5,5,2,0,'LIBRE',NULL,373),(0,6,5,2,0,'LIBRE',NULL,374),(0,7,5,2,0,'LIBRE',NULL,375),(0,1,6,2,0,'LIBRE',NULL,376),(0,2,6,2,0,'LIBRE',NULL,377),(0,3,6,2,0,'LIBRE',NULL,378),(0,4,6,2,0,'LIBRE',NULL,379),(0,5,6,2,0,'LIBRE',NULL,380),(0,6,6,2,0,'LIBRE',NULL,381),(0,7,6,2,0,'LIBRE',NULL,382),(0,1,7,2,0,'LIBRE',NULL,383),(0,2,7,2,0,'LIBRE',NULL,384),(0,3,7,2,0,'LIBRE',NULL,385),(0,4,7,2,0,'LIBRE',NULL,386),(0,5,7,2,0,'LIBRE',NULL,387),(0,6,7,2,0,'LIBRE',NULL,388),(0,7,7,2,0,'LIBRE',NULL,389),(0,1,8,2,0,'LIBRE',NULL,390),(0,2,8,2,0,'LIBRE',NULL,391),(0,3,8,2,0,'LIBRE',NULL,392),(0,4,8,2,0,'LIBRE',NULL,393),(0,5,8,2,0,'LIBRE',NULL,394),(0,6,8,2,0,'LIBRE',NULL,395),(0,7,8,2,0,'LIBRE',NULL,396),(0,1,9,2,0,'LIBRE',NULL,397),(0,2,9,2,0,'LIBRE',NULL,398),(0,3,9,2,0,'LIBRE',NULL,399),(0,4,9,2,0,'LIBRE',NULL,400),(0,5,9,2,0,'LIBRE',NULL,401),(0,6,9,2,0,'LIBRE',NULL,402),(0,7,9,2,0,'LIBRE',NULL,403),(0,1,10,2,0,'LIBRE',NULL,404),(0,2,10,2,0,'LIBRE',NULL,405),(0,3,10,2,0,'LIBRE',NULL,406),(0,4,10,2,0,'LIBRE',NULL,407),(0,5,10,2,0,'LIBRE',NULL,408),(0,6,10,2,0,'LIBRE',NULL,409),(0,7,10,2,0,'LIBRE',NULL,410),(0,1,11,2,0,'LIBRE',NULL,411),(0,2,11,2,0,'LIBRE',NULL,412),(0,3,11,2,0,'LIBRE',NULL,413),(0,4,11,2,0,'LIBRE',NULL,414),(0,5,11,2,0,'LIBRE',NULL,415),(0,6,11,2,0,'LIBRE',NULL,416),(0,7,11,2,0,'LIBRE',NULL,417),(0,1,12,2,0,'LIBRE',NULL,418),(0,2,12,2,0,'LIBRE',NULL,419),(0,3,12,2,0,'LIBRE',NULL,420),(0,4,12,2,0,'LIBRE',NULL,421),(0,5,12,2,0,'LIBRE',NULL,422),(0,6,12,2,0,'LIBRE',NULL,423),(0,7,12,2,0,'LIBRE',NULL,424),(0,1,13,2,0,'LIBRE',NULL,425),(0,2,13,2,0,'LIBRE',NULL,426),(0,3,13,2,0,'LIBRE',NULL,427),(0,4,13,2,0,'LIBRE',NULL,428),(0,5,13,2,0,'LIBRE',NULL,429),(0,6,13,2,0,'LIBRE',NULL,430),(0,7,13,2,0,'LIBRE',NULL,431),(0,1,14,2,0,'LIBRE',NULL,432),(0,2,14,2,0,'LIBRE',NULL,433),(0,3,14,2,0,'LIBRE',NULL,434),(0,4,14,2,0,'LIBRE',NULL,435),(0,5,14,2,0,'LIBRE',NULL,436),(0,6,14,2,0,'LIBRE',NULL,437),(0,7,14,2,0,'LIBRE',NULL,438),(0,1,15,2,0,'LIBRE',NULL,439),(0,2,15,2,0,'LIBRE',NULL,440),(0,3,15,2,0,'LIBRE',NULL,441),(0,4,15,2,0,'LIBRE',NULL,442),(0,5,15,2,0,'LIBRE',NULL,443),(0,6,15,2,0,'LIBRE',NULL,444),(0,7,15,2,0,'LIBRE',NULL,445),(0,1,16,2,0,'LIBRE',NULL,446),(0,2,16,2,0,'LIBRE',NULL,447),(0,3,16,2,0,'LIBRE',NULL,448),(0,4,16,2,0,'LIBRE',NULL,449),(0,5,16,2,0,'LIBRE',NULL,450),(0,6,16,2,0,'LIBRE',NULL,451),(0,7,16,2,0,'LIBRE',NULL,452),(0,1,17,2,0,'LIBRE',NULL,453),(0,2,17,2,0,'LIBRE',NULL,454),(0,3,17,2,0,'LIBRE',NULL,455),(0,4,17,2,0,'LIBRE',NULL,456),(0,5,17,2,0,'LIBRE',NULL,457),(0,6,17,2,0,'LIBRE',NULL,458),(0,7,17,2,0,'LIBRE',NULL,459),(0,1,18,2,0,'LIBRE',NULL,460),(0,2,18,2,0,'LIBRE',NULL,461),(0,3,18,2,0,'LIBRE',NULL,462),(0,4,18,2,0,'LIBRE',NULL,463),(0,5,18,2,0,'LIBRE',NULL,464),(0,6,18,2,0,'LIBRE',NULL,465),(0,7,18,2,0,'LIBRE',NULL,466),(0,1,19,2,0,'LIBRE',NULL,467),(0,2,19,2,0,'LIBRE',NULL,468),(0,3,19,2,0,'LIBRE',NULL,469),(0,4,19,2,0,'LIBRE',NULL,470),(0,5,19,2,0,'LIBRE',NULL,471),(0,6,19,2,0,'LIBRE',NULL,472),(0,7,19,2,0,'LIBRE',NULL,473),(0,1,20,2,0,'LIBRE',NULL,474),(0,2,20,2,0,'LIBRE',NULL,475),(0,3,20,2,0,'LIBRE',NULL,476),(0,4,20,2,0,'LIBRE',NULL,477),(0,5,20,2,0,'LIBRE',NULL,478),(0,6,20,2,0,'LIBRE',NULL,479),(0,7,20,2,0,'LIBRE',NULL,480),(0,1,21,2,0,'LIBRE',NULL,481),(0,2,21,2,0,'LIBRE',NULL,482),(0,3,21,2,0,'LIBRE',NULL,483),(0,4,21,2,0,'LIBRE',NULL,484),(0,5,21,2,0,'LIBRE',NULL,485),(0,6,21,2,0,'LIBRE',NULL,486),(0,7,21,2,0,'LIBRE',NULL,487),(0,1,22,2,0,'LIBRE',NULL,488),(0,2,22,2,0,'LIBRE',NULL,489),(0,3,22,2,0,'LIBRE',NULL,490),(0,4,22,2,0,'LIBRE',NULL,491),(0,5,22,2,0,'LIBRE',NULL,492),(0,6,22,2,0,'LIBRE',NULL,493),(0,7,22,2,0,'LIBRE',NULL,494),(0,1,23,2,0,'LIBRE',NULL,495),(0,2,23,2,0,'LIBRE',NULL,496),(0,3,23,2,0,'LIBRE',NULL,497),(0,4,23,2,0,'LIBRE',NULL,498),(0,5,23,2,0,'LIBRE',NULL,499),(0,6,23,2,0,'LIBRE',NULL,500),(0,7,23,2,0,'LIBRE',NULL,501),(0,7,23,5,2,'123123',0,502),(0,6,23,5,2,'123123',0,503),(0,5,23,5,2,'123123',0,504),(0,1,0,5,2,'123',1,505),(0,2,0,5,2,'123',1,506),(0,3,0,5,2,'123',1,507),(0,4,0,5,2,'123',1,508),(0,5,0,5,2,'123',1,509),(0,6,0,5,2,'123',1,510),(0,7,0,5,2,'123',1,511),(0,1,1,5,2,'123',1,512),(0,2,1,5,2,'123',1,513),(0,3,1,5,2,'123',1,514),(0,4,1,5,2,'123',1,515),(0,5,1,5,2,'123',1,516),(0,6,1,5,2,'123',1,517),(0,7,1,5,2,'123',1,518),(0,1,2,5,2,'123',1,519),(0,2,2,5,2,'123',1,520),(0,3,2,5,2,'123',1,521),(0,4,2,5,2,'123',1,522),(0,5,2,5,2,'123',1,523),(0,6,2,5,2,'123',1,524),(0,7,2,5,2,'123',1,525),(0,1,3,5,2,'123',1,526),(0,2,3,5,2,'123',1,527),(0,3,3,5,2,'123',1,528),(0,4,3,5,2,'123',1,529),(0,5,3,5,2,'123',1,530),(0,6,3,5,2,'123',1,531),(0,7,3,5,2,'123',1,532),(0,1,4,5,2,'123',1,533),(0,2,4,5,2,'123',1,534),(0,3,4,5,2,'123',1,535),(0,4,4,5,2,'123',1,536),(0,5,4,5,2,'123',1,537),(0,6,4,5,2,'123',1,538),(0,7,4,5,2,'123',1,539),(0,1,5,5,2,'123',1,540),(0,2,5,5,2,'123',1,541),(0,3,5,5,2,'123',1,542),(0,4,5,5,2,'123',1,543),(0,5,5,5,2,'123',1,544),(0,6,5,5,2,'123',1,545),(0,7,5,5,2,'123',1,546),(0,1,6,5,2,'123',1,547),(0,2,6,5,2,'123',1,548),(0,3,6,5,2,'123',1,549),(0,4,6,5,2,'123',1,550),(0,5,6,5,2,'123',1,551),(0,6,6,5,2,'123',1,552),(0,7,6,5,2,'123',1,553),(0,1,7,5,2,'123',1,554),(0,2,7,5,2,'123',1,555),(0,3,7,5,2,'123',1,556),(0,4,7,5,2,'123',1,557),(0,5,7,5,2,'123',1,558),(0,6,7,5,2,'123',1,559),(0,7,7,5,2,'123',1,560),(0,1,8,5,2,'123',1,561),(0,2,8,5,2,'123',1,562),(0,3,8,5,2,'123',1,563),(0,4,8,5,2,'123',1,564),(0,5,8,5,2,'123',1,565),(0,6,8,5,2,'123',1,566),(0,7,8,5,2,'123',1,567),(0,1,9,5,2,'123',1,568),(0,2,9,5,2,'123',1,569),(0,3,9,5,2,'123',1,570),(0,4,9,5,2,'123',1,571),(0,5,9,5,2,'123',1,572),(0,6,9,5,2,'123',1,573),(0,7,9,5,2,'123',1,574),(0,1,10,5,2,'123',1,575),(0,2,10,5,2,'123',1,576),(0,3,10,5,2,'123',1,577),(0,4,10,5,2,'123',1,578),(0,5,10,5,2,'123',1,579),(0,6,10,5,2,'123',1,580),(0,7,10,5,2,'123',1,581),(0,1,11,5,2,'123',1,582),(0,2,11,5,2,'123',1,583),(0,3,11,5,2,'123',1,584),(0,4,11,5,2,'123',1,585),(0,5,11,5,2,'123',1,586),(0,6,11,5,2,'123',1,587),(0,7,11,5,2,'123',1,588),(0,1,12,5,2,'123',1,589),(0,2,12,5,2,'123',1,590),(0,3,12,5,2,'123',1,591),(0,4,12,5,2,'123',1,592),(0,5,12,5,2,'123',1,593),(0,6,12,5,2,'123',1,594),(0,7,12,5,2,'123',1,595),(0,1,13,5,2,'123',1,596),(0,2,13,5,2,'123',1,597),(0,3,13,5,2,'123',1,598),(0,4,13,5,2,'123',1,599),(0,5,13,5,2,'123',1,600),(0,6,13,5,2,'123',1,601),(0,7,13,5,2,'123',1,602),(0,1,14,5,2,'123',1,603),(0,2,14,5,2,'123',1,604),(0,3,14,5,2,'123',1,605),(0,4,14,5,2,'123',1,606),(0,5,14,5,2,'123',1,607),(0,6,14,5,2,'123',1,608),(0,7,14,5,2,'123',1,609),(0,1,15,5,2,'123',1,610),(0,2,15,5,2,'123',1,611),(0,3,15,5,2,'123',1,612),(0,4,15,5,2,'123',1,613),(0,5,15,5,2,'123',1,614),(0,6,15,5,2,'123',1,615),(0,7,15,5,2,'123',1,616),(0,1,16,5,2,'123',1,617),(0,2,16,5,2,'123',1,618),(0,3,16,5,2,'123',1,619),(0,4,16,5,2,'123',1,620),(0,5,16,5,2,'123',1,621),(0,6,16,5,2,'123',1,622),(0,7,16,5,2,'123',1,623),(0,1,17,5,2,'123',1,624),(0,2,17,5,2,'123',1,625),(0,3,17,5,2,'123',1,626),(0,4,17,5,2,'123',1,627),(0,5,17,5,2,'123',1,628),(0,6,17,5,2,'123',1,629),(0,7,17,5,2,'123',1,630),(0,1,18,5,2,'123',1,631),(0,2,18,5,2,'123',1,632),(0,3,18,5,2,'123',1,633),(0,4,18,5,2,'123',1,634),(0,5,18,5,2,'123',1,635),(0,6,18,5,2,'123',1,636),(0,7,18,5,2,'123',1,637),(0,1,19,5,2,'123',1,638),(0,2,19,5,2,'123',1,639),(0,3,19,5,2,'123',1,640),(0,4,19,5,2,'123',1,641),(0,5,19,5,2,'123',1,642),(0,6,19,5,2,'123',1,643),(0,7,19,5,2,'123',1,644),(0,1,20,5,2,'123',1,645),(0,2,20,5,2,'123',1,646),(0,3,20,5,2,'123',1,647),(0,4,20,5,2,'123',1,648),(0,5,20,5,2,'123',1,649),(0,6,20,5,2,'123',1,650),(0,7,20,5,2,'123',1,651),(0,1,21,5,2,'123',1,652),(0,2,21,5,2,'123',1,653),(0,3,21,5,2,'123',1,654),(0,4,21,5,2,'123',1,655),(0,5,21,5,2,'123',1,656),(0,6,21,5,2,'123',1,657),(0,7,21,5,2,'123',1,658),(0,1,22,5,2,'123',1,659),(0,2,22,5,2,'123',1,660),(0,3,22,5,2,'123',1,661),(0,4,22,5,2,'123',1,662),(0,5,22,5,2,'123',1,663),(0,6,22,5,2,'123',1,664),(0,7,22,5,2,'123',1,665),(0,1,23,5,2,'123',1,666),(0,2,23,5,2,'123',1,667),(0,3,23,5,2,'123',1,668),(0,4,23,5,2,'123',1,669),(0,5,23,5,2,'123',1,670),(0,6,23,5,2,'123',1,671),(0,7,23,5,2,'123',1,672),(0,1,0,4,1,'S10/B20',0,673),(0,2,0,4,1,'S10/B20',0,674),(0,3,0,4,1,'S10/B20',0,675),(0,4,0,4,1,'S10/B20',0,676),(0,5,0,4,1,'S10/B20',0,677),(0,6,0,4,1,'S10/B20',0,678),(0,7,0,4,1,'S10/B20',0,679),(0,1,1,4,1,'S10/B20',0,680),(0,2,1,4,1,'S10/B20',0,681),(0,3,1,4,1,'S10/B20',0,682),(0,4,1,4,1,'S10/B20',0,683),(0,5,1,4,1,'S10/B20',0,684),(0,6,1,4,1,'S10/B20',0,685),(0,7,1,4,1,'S10/B20',0,686),(0,1,2,4,1,'S10/B20',0,687),(0,2,2,4,1,'S10/B20',0,688),(0,3,2,4,1,'S10/B20',0,689),(0,4,2,4,1,'S10/B20',0,690),(0,5,2,4,1,'S10/B20',0,691),(0,6,2,4,1,'S10/B20',0,692),(0,7,2,4,1,'S10/B20',0,693),(0,1,3,4,1,'S10/B20',0,694),(0,2,3,4,1,'S10/B20',0,695),(0,3,3,4,1,'S10/B20',0,696),(0,4,3,4,1,'S10/B20',0,697),(0,5,3,4,1,'S10/B20',0,698),(0,6,3,4,1,'S10/B20',0,699),(0,7,3,4,1,'S10/B20',0,700),(0,1,4,4,1,'S10/B20',0,701),(0,2,4,4,1,'S10/B20',0,702),(0,3,4,4,1,'S10/B20',0,703),(0,4,4,4,1,'S10/B20',0,704),(0,5,4,4,1,'S10/B20',0,705),(0,6,4,4,1,'S10/B20',0,706),(0,7,4,4,1,'S10/B20',0,707),(0,1,5,4,1,'S10/B20',0,708),(0,2,5,4,1,'S10/B20',0,709),(0,3,5,4,1,'S10/B20',0,710),(0,4,5,4,1,'S10/B20',0,711),(0,5,5,4,1,'S10/B20',0,712),(0,6,5,4,1,'S10/B20',0,713),(0,7,5,4,1,'S10/B20',0,714),(0,1,6,4,1,'S10/B20',0,715),(0,2,6,4,1,'S10/B20',0,716),(0,3,6,4,1,'S10/B20',0,717),(0,4,6,4,1,'S10/B20',0,718),(0,5,6,4,1,'S10/B20',0,719),(0,6,6,4,1,'S10/B20',0,720),(0,7,6,4,1,'S10/B20',0,721),(0,1,7,4,1,'S10/B20',0,722),(0,2,7,4,1,'S10/B20',0,723),(0,3,7,4,1,'S10/B20',0,724),(0,4,7,4,1,'S10/B20',0,725),(0,5,7,4,1,'S10/B20',0,726),(0,6,7,4,1,'S10/B20',0,727),(0,7,7,4,1,'S10/B20',0,728),(0,1,8,4,1,'S10/B20',0,729),(0,2,8,4,1,'S10/B20',0,730),(0,3,8,4,1,'S10/B20',0,731),(0,4,8,4,1,'S10/B20',0,732),(0,5,8,4,1,'S10/B20',0,733),(0,6,8,4,1,'S10/B20',0,734),(0,7,8,4,1,'S10/B20',0,735),(0,1,9,4,1,'S10/B20',0,736),(0,2,9,4,1,'S10/B20',0,737),(0,3,9,4,1,'S10/B20',0,738),(0,4,9,4,1,'S10/B20',0,739),(0,5,9,4,1,'S10/B20',0,740),(0,6,9,4,1,'S10/B20',0,741),(0,7,9,4,1,'S10/B20',0,742),(0,1,10,4,1,'S10/B20',0,743),(0,2,10,4,1,'S10/B20',0,744),(0,3,10,4,1,'S10/B20',0,745),(0,4,10,4,1,'S10/B20',0,746),(0,5,10,4,1,'S10/B20',0,747),(0,6,10,4,1,'S10/B20',0,748),(0,7,10,4,1,'S10/B20',0,749),(0,1,11,4,1,'S10/B20',0,750),(0,2,11,4,1,'S10/B20',0,751),(0,3,11,4,1,'S10/B20',0,752),(0,4,11,4,1,'S10/B20',0,753),(0,5,11,4,1,'S10/B20',0,754),(0,6,11,4,1,'S10/B20',0,755),(0,7,11,4,1,'S10/B20',0,756),(0,1,12,4,1,'S10/B20',0,757),(0,2,12,4,1,'S10/B20',0,758),(0,3,12,4,1,'S10/B20',0,759),(0,4,12,4,1,'S10/B20',0,760),(0,5,12,4,1,'S10/B20',0,761),(0,6,12,4,1,'S10/B20',0,762),(0,7,12,4,1,'S10/B20',0,763),(0,1,13,4,1,'S10/B20',0,764),(0,2,13,4,1,'S10/B20',0,765),(0,3,13,4,1,'S10/B20',0,766),(0,4,13,4,1,'S10/B20',0,767),(0,5,13,4,1,'S10/B20',0,768),(0,6,13,4,1,'S10/B20',0,769),(0,7,13,4,1,'S10/B20',0,770),(0,1,14,4,1,'S10/B20',0,771),(0,2,14,4,1,'S10/B20',0,772),(0,3,14,4,1,'S10/B20',0,773),(0,4,14,4,1,'S10/B20',0,774),(0,5,14,4,1,'S10/B20',0,775),(0,6,14,4,1,'S10/B20',0,776),(0,7,14,4,1,'S10/B20',0,777),(0,1,15,4,1,'S10/B20',0,778),(0,2,15,4,1,'S10/B20',0,779),(0,3,15,4,1,'S10/B20',0,780),(0,4,15,4,1,'S10/B20',0,781),(0,5,15,4,1,'S10/B20',0,782),(0,6,15,4,1,'S10/B20',0,783),(0,7,15,4,1,'S10/B20',0,784),(0,1,16,4,1,'S10/B20',0,785),(0,2,16,4,1,'S10/B20',0,786),(0,3,16,4,1,'S10/B20',0,787),(0,4,16,4,1,'S10/B20',0,788),(0,5,16,4,1,'S10/B20',0,789),(0,6,16,4,1,'S10/B20',0,790),(0,7,16,4,1,'S10/B20',0,791),(0,1,17,4,1,'S10/B20',0,792),(0,2,17,4,1,'S10/B20',0,793),(0,3,17,4,1,'S10/B20',0,794),(0,4,17,4,1,'S10/B20',0,795),(0,5,17,4,1,'S10/B20',0,796),(0,6,17,4,1,'S10/B20',0,797),(0,7,17,4,1,'S10/B20',0,798),(0,1,18,4,1,'S10/B20',0,799),(0,2,18,4,1,'S10/B20',0,800),(0,3,18,4,1,'S10/B20',0,801),(0,4,18,4,1,'S10/B20',0,802),(0,5,18,4,1,'S10/B20',0,803),(0,6,18,4,1,'S10/B20',0,804),(0,7,18,4,1,'S10/B20',0,805),(0,1,19,4,1,'S10/B20',0,806),(0,2,19,4,1,'S10/B20',0,807),(0,3,19,4,1,'S10/B20',0,808),(0,4,19,4,1,'S10/B20',0,809),(0,5,19,4,1,'S10/B20',0,810),(0,6,19,4,1,'S10/B20',0,811),(0,7,19,4,1,'S10/B20',0,812),(0,1,20,4,1,'S10/B20',0,813),(0,2,20,4,1,'S10/B20',0,814),(0,3,20,4,1,'S10/B20',0,815),(0,4,20,4,1,'S10/B20',0,816),(0,5,20,4,1,'S10/B20',0,817),(0,6,20,4,1,'S10/B20',0,818),(0,7,20,4,1,'S10/B20',0,819),(0,1,21,4,1,'S10/B20',0,820),(0,2,21,4,1,'S10/B20',0,821),(0,3,21,4,1,'S10/B20',0,822),(0,4,21,4,1,'S10/B20',0,823),(0,5,21,4,1,'S10/B20',0,824),(0,6,21,4,1,'S10/B20',0,825),(0,7,21,4,1,'S10/B20',0,826),(0,1,22,4,1,'S10/B20',0,827),(0,2,22,4,1,'S10/B20',0,828),(0,3,22,4,1,'S10/B20',0,829),(0,4,22,4,1,'S10/B20',0,830),(0,5,22,4,1,'S10/B20',0,831),(0,6,22,4,1,'S10/B20',0,832),(0,7,22,4,1,'S10/B20',0,833),(0,1,23,4,1,'S10/B20',0,834),(0,2,23,4,1,'S10/B20',0,835),(0,3,23,4,1,'S10/B20',0,836),(0,4,23,4,1,'S10/B20',0,837),(0,5,23,4,1,'S10/B20',0,838),(0,6,23,4,1,'S10/B20',0,839),(0,7,23,4,1,'S10/B20',0,840),(0,1,0,0,0,'Ejecutivo',0,841),(0,2,0,0,0,'Ejecutivo',0,842),(0,3,0,0,0,'Ejecutivo',0,843),(0,4,0,0,0,'Ejecutivo',0,844),(0,5,0,0,0,'Ejecutivo',0,845),(0,6,0,0,0,'Ejecutivo',0,846),(0,7,0,0,0,'Ejecutivo',0,847),(0,1,1,0,0,'Ejecutivo',0,848),(0,2,1,0,0,'Ejecutivo',0,849),(0,3,1,0,0,'Ejecutivo',0,850),(0,4,1,0,0,'Ejecutivo',0,851),(0,5,1,0,0,'Ejecutivo',0,852),(0,6,1,0,0,'Ejecutivo',0,853),(0,7,1,0,0,'Ejecutivo',0,854),(0,1,2,0,0,'Ejecutivo',0,855),(0,2,2,0,0,'Ejecutivo',0,856),(0,3,2,0,0,'Ejecutivo',0,857),(0,4,2,0,0,'Ejecutivo',0,858),(0,5,2,0,0,'Ejecutivo',0,859),(0,6,2,0,0,'Ejecutivo',0,860),(0,7,2,0,0,'Ejecutivo',0,861),(0,1,3,0,0,'Ejecutivo',0,862),(0,2,3,0,0,'Ejecutivo',0,863),(0,3,3,0,0,'Ejecutivo',0,864),(0,4,3,0,0,'Ejecutivo',0,865),(0,5,3,0,0,'Ejecutivo',0,866),(0,6,3,0,0,'Ejecutivo',0,867),(0,7,3,0,0,'Ejecutivo',0,868),(0,1,4,0,0,'Ejecutivo',0,869),(0,2,4,0,0,'Ejecutivo',0,870),(0,3,4,0,0,'Ejecutivo',0,871),(0,4,4,0,0,'Ejecutivo',0,872),(0,5,4,0,0,'Ejecutivo',0,873),(0,6,4,0,0,'Ejecutivo',0,874),(0,7,4,0,0,'Ejecutivo',0,875),(0,1,5,0,0,'Ejecutivo',0,876),(0,2,5,0,0,'Ejecutivo',0,877),(0,3,5,0,0,'Ejecutivo',0,878),(0,4,5,0,0,'Ejecutivo',0,879),(0,5,5,0,0,'Ejecutivo',0,880),(0,6,5,0,0,'Ejecutivo',0,881),(0,7,5,0,0,'Ejecutivo',0,882),(0,1,6,0,0,'Ejecutivo',0,883),(0,2,6,0,0,'Ejecutivo',0,884),(0,3,6,0,0,'Ejecutivo',0,885),(0,4,6,0,0,'Ejecutivo',0,886),(0,5,6,0,0,'Ejecutivo',0,887),(0,6,6,0,0,'Ejecutivo',0,888),(0,7,6,0,0,'Ejecutivo',0,889),(0,1,7,0,0,'Ejecutivo',0,890),(0,2,7,0,0,'Ejecutivo',0,891),(0,3,7,0,0,'Ejecutivo',0,892),(0,4,7,0,0,'Ejecutivo',0,893),(0,5,7,0,0,'Ejecutivo',0,894),(0,6,7,0,0,'Ejecutivo',0,895),(0,7,7,0,0,'Ejecutivo',0,896),(0,1,8,0,0,'Ejecutivo',0,897),(0,2,8,0,0,'Ejecutivo',0,898),(0,3,8,0,0,'Ejecutivo',0,899),(0,4,8,0,0,'Ejecutivo',0,900),(0,5,8,0,0,'Ejecutivo',0,901),(0,6,8,0,0,'Ejecutivo',0,902),(0,7,8,0,0,'Ejecutivo',0,903),(0,1,9,0,0,'Ejecutivo',0,904),(0,2,9,0,0,'Ejecutivo',0,905),(0,3,9,0,0,'Ejecutivo',0,906),(0,4,9,0,0,'Ejecutivo',0,907),(0,5,9,0,0,'Ejecutivo',0,908),(0,6,9,0,0,'Ejecutivo',0,909),(0,7,9,0,0,'Ejecutivo',0,910),(0,1,10,0,0,'Ejecutivo',0,911),(0,2,10,0,0,'Ejecutivo',0,912),(0,3,10,0,0,'Ejecutivo',0,913),(0,4,10,0,0,'Ejecutivo',0,914),(0,5,10,0,0,'Ejecutivo',0,915),(0,6,10,0,0,'Ejecutivo',0,916),(0,7,10,0,0,'Ejecutivo',0,917),(0,1,11,0,0,'Ejecutivo',0,918),(0,2,11,0,0,'Ejecutivo',0,919),(0,3,11,0,0,'Ejecutivo',0,920),(0,4,11,0,0,'Ejecutivo',0,921),(0,5,11,0,0,'Ejecutivo',0,922),(0,6,11,0,0,'Ejecutivo',0,923),(0,7,11,0,0,'Ejecutivo',0,924),(0,1,12,0,0,'Ejecutivo',0,925),(0,2,12,0,0,'Ejecutivo',0,926),(0,3,12,0,0,'Ejecutivo',0,927),(0,4,12,0,0,'Ejecutivo',0,928),(0,5,12,0,0,'Ejecutivo',0,929),(0,6,12,0,0,'Ejecutivo',0,930),(0,7,12,0,0,'Ejecutivo',0,931),(0,1,13,0,0,'Ejecutivo',0,932),(0,2,13,0,0,'Ejecutivo',0,933),(0,3,13,0,0,'Ejecutivo',0,934),(0,4,13,0,0,'Ejecutivo',0,935),(0,5,13,0,0,'Ejecutivo',0,936),(0,6,13,0,0,'Ejecutivo',0,937),(0,7,13,0,0,'Ejecutivo',0,938),(0,1,14,0,0,'Ejecutivo',0,939),(0,2,14,0,0,'Ejecutivo',0,940),(0,3,14,0,0,'Ejecutivo',0,941),(0,4,14,0,0,'Ejecutivo',0,942),(0,5,14,0,0,'Ejecutivo',0,943),(0,6,14,0,0,'Ejecutivo',0,944),(0,7,14,0,0,'Ejecutivo',0,945),(0,1,15,0,0,'Ejecutivo',0,946),(0,2,15,0,0,'Ejecutivo',0,947),(0,3,15,0,0,'Ejecutivo',0,948),(0,4,15,0,0,'Ejecutivo',0,949),(0,5,15,0,0,'Ejecutivo',0,950),(0,6,15,0,0,'Ejecutivo',0,951),(0,7,15,0,0,'Ejecutivo',0,952),(0,1,16,0,0,'Ejecutivo',0,953),(0,2,16,0,0,'Ejecutivo',0,954),(0,3,16,0,0,'Ejecutivo',0,955),(0,4,16,0,0,'Ejecutivo',0,956),(0,5,16,0,0,'Ejecutivo',0,957),(0,6,16,0,0,'Ejecutivo',0,958),(0,7,16,0,0,'Ejecutivo',0,959),(0,1,17,0,0,'Ejecutivo',0,960),(0,2,17,0,0,'Ejecutivo',0,961),(0,3,17,0,0,'Ejecutivo',0,962),(0,4,17,0,0,'Ejecutivo',0,963),(0,5,17,0,0,'Ejecutivo',0,964),(0,6,17,0,0,'Ejecutivo',0,965),(0,7,17,0,0,'Ejecutivo',0,966),(0,1,18,0,0,'Ejecutivo',0,967),(0,2,18,0,0,'Ejecutivo',0,968),(0,3,18,0,0,'Ejecutivo',0,969),(0,4,18,0,0,'Ejecutivo',0,970),(0,5,18,0,0,'Ejecutivo',0,971),(0,6,18,0,0,'Ejecutivo',0,972),(0,7,18,0,0,'Ejecutivo',0,973),(0,1,19,0,0,'Ejecutivo',0,974),(0,2,19,0,0,'Ejecutivo',0,975),(0,3,19,0,0,'Ejecutivo',0,976),(0,4,19,0,0,'Ejecutivo',0,977),(0,5,19,0,0,'Ejecutivo',0,978),(0,6,19,0,0,'Ejecutivo',0,979),(0,7,19,0,0,'Ejecutivo',0,980),(0,1,20,0,0,'Ejecutivo',0,981),(0,2,20,0,0,'Ejecutivo',0,982),(0,3,20,0,0,'Ejecutivo',0,983),(0,4,20,0,0,'Ejecutivo',0,984),(0,5,20,0,0,'Ejecutivo',0,985),(0,6,20,0,0,'Ejecutivo',0,986),(0,7,20,0,0,'Ejecutivo',0,987),(0,1,21,0,0,'Ejecutivo',0,988),(0,2,21,0,0,'Ejecutivo',0,989),(0,3,21,0,0,'Ejecutivo',0,990),(0,4,21,0,0,'Ejecutivo',0,991),(0,5,21,0,0,'Ejecutivo',0,992),(0,6,21,0,0,'Ejecutivo',0,993),(0,7,21,0,0,'Ejecutivo',0,994),(0,1,22,0,0,'Ejecutivo',0,995),(0,2,22,0,0,'Ejecutivo',0,996),(0,3,22,0,0,'Ejecutivo',0,997),(0,4,22,0,0,'Ejecutivo',0,998),(0,5,22,0,0,'Ejecutivo',0,999),(0,6,22,0,0,'Ejecutivo',0,1000),(0,7,22,0,0,'Ejecutivo',0,1001),(0,1,23,0,0,'Ejecutivo',0,1002),(0,2,23,0,0,'Ejecutivo',0,1003),(0,3,23,0,0,'Ejecutivo',0,1004),(0,4,23,0,0,'Ejecutivo',0,1005),(0,5,23,0,0,'Ejecutivo',0,1006),(0,6,23,0,0,'Ejecutivo',0,1007),(0,7,23,0,0,'Ejecutivo',0,1008),(0,1,0,2,0,'Standard',0,1009),(0,2,0,2,0,'Standard',0,1010),(0,3,0,2,0,'Standard',0,1011),(0,4,0,2,0,'Standard',0,1012),(0,5,0,2,0,'Standard',0,1013),(0,6,0,2,0,'Standard',0,1014),(0,7,0,2,0,'Standard',0,1015),(0,1,1,2,0,'Standard',0,1016),(0,2,1,2,0,'Standard',0,1017),(0,3,1,2,0,'Standard',0,1018),(0,4,1,2,0,'Standard',0,1019),(0,5,1,2,0,'Standard',0,1020),(0,6,1,2,0,'Standard',0,1021),(0,7,1,2,0,'Standard',0,1022),(0,1,2,2,0,'Standard',0,1023),(0,2,2,2,0,'Standard',0,1024),(0,3,2,2,0,'Standard',0,1025),(0,4,2,2,0,'Standard',0,1026),(0,5,2,2,0,'Standard',0,1027),(0,6,2,2,0,'Standard',0,1028),(0,7,2,2,0,'Standard',0,1029),(0,1,3,2,0,'Standard',0,1030),(0,2,3,2,0,'Standard',0,1031),(0,3,3,2,0,'Standard',0,1032),(0,4,3,2,0,'Standard',0,1033),(0,5,3,2,0,'Standard',0,1034),(0,6,3,2,0,'Standard',0,1035),(0,7,3,2,0,'Standard',0,1036),(0,1,4,2,0,'Standard',0,1037),(0,2,4,2,0,'Standard',0,1038),(0,3,4,2,0,'Standard',0,1039),(0,4,4,2,0,'Standard',0,1040),(0,5,4,2,0,'Standard',0,1041),(0,6,4,2,0,'Standard',0,1042),(0,7,4,2,0,'Standard',0,1043),(0,1,5,2,0,'Standard',0,1044),(0,2,5,2,0,'Standard',0,1045),(0,3,5,2,0,'Standard',0,1046),(0,4,5,2,0,'Standard',0,1047),(0,5,5,2,0,'Standard',0,1048),(0,6,5,2,0,'Standard',0,1049),(0,7,5,2,0,'Standard',0,1050),(0,1,6,2,0,'Standard',0,1051),(0,2,6,2,0,'Standard',0,1052),(0,3,6,2,0,'Standard',0,1053),(0,4,6,2,0,'Standard',0,1054),(0,5,6,2,0,'Standard',0,1055),(0,6,6,2,0,'Standard',0,1056),(0,7,6,2,0,'Standard',0,1057),(0,1,7,6,0,'Standard',0,1058),(0,2,7,6,0,'Standard',0,1059),(0,3,7,6,0,'Standard',0,1060),(0,4,7,6,0,'Standard',0,1061),(0,5,7,6,0,'Standard',0,1062),(0,6,7,2,0,'Standard',0,1063),(0,7,7,2,0,'Standard',0,1064),(0,1,8,6,0,'Standard',0,1065),(0,2,8,6,0,'Standard',0,1066),(0,3,8,6,0,'Standard',0,1067),(0,4,8,6,0,'Standard',0,1068),(0,5,8,6,0,'Standard',0,1069),(0,6,8,2,0,'Standard',0,1070),(0,7,8,2,0,'Standard',0,1071),(0,1,9,6,0,'Standard',0,1072),(0,2,9,6,0,'Standard',0,1073),(0,3,9,6,0,'Standard',0,1074),(0,4,9,6,0,'Standard',0,1075),(0,5,9,6,0,'Standard',0,1076),(0,6,9,2,0,'Standard',0,1077),(0,7,9,2,0,'Standard',0,1078),(0,1,10,6,0,'Standard',0,1079),(0,2,10,6,0,'Standard',0,1080),(0,3,10,6,0,'Standard',0,1081),(0,4,10,6,0,'Standard',0,1082),(0,5,10,6,0,'Standard',0,1083),(0,6,10,2,0,'Standard',0,1084),(0,7,10,2,0,'Standard',0,1085),(0,1,11,6,0,'Standard',0,1086),(0,2,11,6,0,'Standard',0,1087),(0,3,11,6,0,'Standard',0,1088),(0,4,11,6,0,'Standard',0,1089),(0,5,11,6,0,'Standard',0,1090),(0,6,11,2,0,'Standard',0,1091),(0,7,11,2,0,'Standard',0,1092),(0,1,12,6,0,'Standard',0,1093),(0,2,12,6,0,'Standard',0,1094),(0,3,12,6,0,'Standard',0,1095),(0,4,12,6,0,'Standard',0,1096),(0,5,12,6,0,'Standard',0,1097),(0,6,12,2,0,'Standard',0,1098),(0,7,12,2,0,'Standard',0,1099),(0,1,13,6,0,'Standard',0,1100),(0,2,13,6,0,'Standard',0,1101),(0,3,13,6,0,'Standard',0,1102),(0,4,13,6,0,'Standard',0,1103),(0,5,13,6,0,'Standard',0,1104),(0,6,13,2,0,'Standard',0,1105),(0,7,13,2,0,'Standard',0,1106),(0,1,14,6,0,'Standard',0,1107),(0,2,14,6,0,'Standard',0,1108),(0,3,14,6,0,'Standard',0,1109),(0,4,14,6,0,'Standard',0,1110),(0,5,14,6,0,'Standard',0,1111),(0,6,14,2,0,'Standard',0,1112),(0,7,14,2,0,'Standard',0,1113),(0,1,15,6,0,'Standard',0,1114),(0,2,15,6,0,'Standard',0,1115),(0,3,15,6,0,'Standard',0,1116),(0,4,15,6,0,'Standard',0,1117),(0,5,15,6,0,'Standard',0,1118),(0,6,15,2,0,'Standard',0,1119),(0,7,15,2,0,'Standard',0,1120),(0,1,16,6,0,'Standard',0,1121),(0,2,16,6,0,'Standard',0,1122),(0,3,16,6,0,'Standard',0,1123),(0,4,16,6,0,'Standard',0,1124),(0,5,16,6,0,'Standard',0,1125),(0,6,16,2,0,'Standard',0,1126),(0,7,16,2,0,'Standard',0,1127),(0,1,17,6,0,'Standard',0,1128),(0,2,17,6,0,'Standard',0,1129),(0,3,17,6,0,'Standard',0,1130),(0,4,17,6,0,'Standard',0,1131),(0,5,17,6,0,'Standard',0,1132),(0,6,17,2,0,'Standard',0,1133),(0,7,17,2,0,'Standard',0,1134),(0,1,18,6,0,'Standard',0,1135),(0,2,18,6,0,'Standard',0,1136),(0,3,18,6,0,'Standard',0,1137),(0,4,18,6,0,'Standard',0,1138),(0,5,18,6,0,'Standard',0,1139),(0,6,18,2,0,'Standard',0,1140),(0,7,18,2,0,'Standard',0,1141),(0,1,19,6,0,'Standard',0,1142),(0,2,19,6,0,'Standard',0,1143),(0,3,19,6,0,'Standard',0,1144),(0,4,19,6,0,'Standard',0,1145),(0,5,19,6,0,'Standard',0,1146),(0,6,19,2,0,'Standard',0,1147),(0,7,19,2,0,'Standard',0,1148),(0,1,20,6,0,'Standard',0,1149),(0,2,20,6,0,'Standard',0,1150),(0,3,20,6,0,'Standard',0,1151),(0,4,20,6,0,'Standard',0,1152),(0,5,20,6,0,'Standard',0,1153),(0,6,20,2,0,'Standard',0,1154),(0,7,20,2,0,'Standard',0,1155),(0,1,21,6,0,'Standard',0,1156),(0,2,21,6,0,'Standard',0,1157),(0,3,21,6,0,'Standard',0,1158),(0,4,21,6,0,'Standard',0,1159),(0,5,21,6,0,'Standard',0,1160),(0,6,21,2,0,'Standard',0,1161),(0,7,21,2,0,'Standard',0,1162),(0,1,22,2,0,'Standard',0,1163),(0,2,22,2,0,'Standard',0,1164),(0,3,22,2,0,'Standard',0,1165),(0,4,22,2,0,'Standard',0,1166),(0,5,22,2,0,'Standard',0,1167),(0,6,22,2,0,'Standard',0,1168),(0,7,22,2,0,'Standard',0,1169),(0,1,23,2,0,'Standard',0,1170),(0,2,23,2,0,'Standard',0,1171),(0,3,23,2,0,'Standard',0,1172),(0,4,23,2,0,'Standard',0,1173),(0,5,23,2,0,'Standard',0,1174),(0,6,23,2,0,'Standard',0,1175),(0,7,23,2,0,'Standard',0,1176),(0,1,0,5,0,'Castigo',1,1177),(0,2,0,5,0,'Castigo',1,1178),(0,3,0,5,0,'Castigo',1,1179),(0,4,0,5,0,'Castigo',1,1180),(0,5,0,5,0,'Castigo',1,1181),(0,6,0,5,0,'Castigo',1,1182),(0,7,0,5,0,'Castigo',1,1183),(0,1,1,5,0,'Castigo',1,1184),(0,2,1,5,0,'Castigo',1,1185),(0,3,1,5,0,'Castigo',1,1186),(0,4,1,5,0,'Castigo',1,1187),(0,5,1,5,0,'Castigo',1,1188),(0,6,1,5,0,'Castigo',1,1189),(0,7,1,5,0,'Castigo',1,1190),(0,1,2,5,0,'Castigo',1,1191),(0,2,2,5,0,'Castigo',1,1192),(0,3,2,5,0,'Castigo',1,1193),(0,4,2,5,0,'Castigo',1,1194),(0,5,2,5,0,'Castigo',1,1195),(0,6,2,5,0,'Castigo',1,1196),(0,7,2,5,0,'Castigo',1,1197),(0,1,3,5,0,'Castigo',1,1198),(0,2,3,5,0,'Castigo',1,1199),(0,3,3,5,0,'Castigo',1,1200),(0,4,3,5,0,'Castigo',1,1201),(0,5,3,5,0,'Castigo',1,1202),(0,6,3,5,0,'Castigo',1,1203),(0,7,3,5,0,'Castigo',1,1204),(0,1,4,5,0,'Castigo',1,1205),(0,2,4,5,0,'Castigo',1,1206),(0,3,4,5,0,'Castigo',1,1207),(0,4,4,5,0,'Castigo',1,1208),(0,5,4,5,0,'Castigo',1,1209),(0,6,4,5,0,'Castigo',1,1210),(0,7,4,5,0,'Castigo',1,1211),(0,1,5,5,0,'Castigo',1,1212),(0,2,5,5,0,'Castigo',1,1213),(0,3,5,5,0,'Castigo',1,1214),(0,4,5,5,0,'Castigo',1,1215),(0,5,5,5,0,'Castigo',1,1216),(0,6,5,5,0,'Castigo',1,1217),(0,7,5,5,0,'Castigo',1,1218),(0,1,6,5,0,'Castigo',1,1219),(0,2,6,5,0,'Castigo',1,1220),(0,3,6,5,0,'Castigo',1,1221),(0,4,6,5,0,'Castigo',1,1222),(0,5,6,5,0,'Castigo',1,1223),(0,6,6,5,0,'Castigo',1,1224),(0,7,6,5,0,'Castigo',1,1225),(0,1,7,5,0,'Castigo',1,1226),(0,2,7,5,0,'Castigo',1,1227),(0,3,7,5,0,'Castigo',1,1228),(0,4,7,5,0,'Castigo',1,1229),(0,5,7,5,0,'Castigo',1,1230),(0,6,7,5,0,'Castigo',1,1231),(0,7,7,5,0,'Castigo',1,1232),(0,1,8,5,0,'Castigo',1,1233),(0,2,8,5,0,'Castigo',1,1234),(0,3,8,5,0,'Castigo',1,1235),(0,4,8,5,0,'Castigo',1,1236),(0,5,8,5,0,'Castigo',1,1237),(0,6,8,5,0,'Castigo',1,1238),(0,7,8,5,0,'Castigo',1,1239),(0,1,9,5,0,'Castigo',1,1240),(0,2,9,5,0,'Castigo',1,1241),(0,3,9,5,0,'Castigo',1,1242),(0,4,9,5,0,'Castigo',1,1243),(0,5,9,5,0,'Castigo',1,1244),(0,6,9,5,0,'Castigo',1,1245),(0,7,9,5,0,'Castigo',1,1246),(0,1,10,5,0,'Castigo',1,1247),(0,2,10,5,0,'Castigo',1,1248),(0,3,10,5,0,'Castigo',1,1249),(0,4,10,5,0,'Castigo',1,1250),(0,5,10,5,0,'Castigo',1,1251),(0,6,10,5,0,'Castigo',1,1252),(0,7,10,5,0,'Castigo',1,1253),(0,1,11,5,0,'Castigo',1,1254),(0,2,11,5,0,'Castigo',1,1255),(0,3,11,5,0,'Castigo',1,1256),(0,4,11,5,0,'Castigo',1,1257),(0,5,11,5,0,'Castigo',1,1258),(0,6,11,5,0,'Castigo',1,1259),(0,7,11,5,0,'Castigo',1,1260),(0,1,12,5,0,'Castigo',1,1261),(0,2,12,5,0,'Castigo',1,1262),(0,3,12,5,0,'Castigo',1,1263),(0,4,12,5,0,'Castigo',1,1264),(0,5,12,5,0,'Castigo',1,1265),(0,6,12,5,0,'Castigo',1,1266),(0,7,12,5,0,'Castigo',1,1267),(0,1,13,5,0,'Castigo',1,1268),(0,2,13,5,0,'Castigo',1,1269),(0,3,13,5,0,'Castigo',1,1270),(0,4,13,5,0,'Castigo',1,1271),(0,5,13,5,0,'Castigo',1,1272),(0,6,13,5,0,'Castigo',1,1273),(0,7,13,5,0,'Castigo',1,1274),(0,1,14,5,0,'Castigo',1,1275),(0,2,14,5,0,'Castigo',1,1276),(0,3,14,5,0,'Castigo',1,1277),(0,4,14,5,0,'Castigo',1,1278),(0,5,14,5,0,'Castigo',1,1279),(0,6,14,5,0,'Castigo',1,1280),(0,7,14,5,0,'Castigo',1,1281),(0,1,15,5,0,'Castigo',1,1282),(0,2,15,5,0,'Castigo',1,1283),(0,3,15,5,0,'Castigo',1,1284),(0,4,15,5,0,'Castigo',1,1285),(0,5,15,5,0,'Castigo',1,1286),(0,6,15,5,0,'Castigo',1,1287),(0,7,15,5,0,'Castigo',1,1288),(0,1,16,5,0,'Castigo',1,1289),(0,2,16,5,0,'Castigo',1,1290),(0,3,16,5,0,'Castigo',1,1291),(0,4,16,5,0,'Castigo',1,1292),(0,5,16,5,0,'Castigo',1,1293),(0,6,16,5,0,'Castigo',1,1294),(0,7,16,5,0,'Castigo',1,1295),(0,1,17,5,0,'Castigo',1,1296),(0,2,17,5,0,'Castigo',1,1297),(0,3,17,5,0,'Castigo',1,1298),(0,4,17,5,0,'Castigo',1,1299),(0,5,17,5,0,'Castigo',1,1300),(0,6,17,5,0,'Castigo',1,1301),(0,7,17,5,0,'Castigo',1,1302),(0,1,18,5,0,'Castigo',1,1303),(0,2,18,5,0,'Castigo',1,1304),(0,3,18,5,0,'Castigo',1,1305),(0,4,18,5,0,'Castigo',1,1306),(0,5,18,5,0,'Castigo',1,1307),(0,6,18,5,0,'Castigo',1,1308),(0,7,18,5,0,'Castigo',1,1309),(0,1,19,5,0,'Castigo',1,1310),(0,2,19,5,0,'Castigo',1,1311),(0,3,19,5,0,'Castigo',1,1312),(0,4,19,5,0,'Castigo',1,1313),(0,5,19,5,0,'Castigo',1,1314),(0,6,19,5,0,'Castigo',1,1315),(0,7,19,5,0,'Castigo',1,1316),(0,1,20,5,0,'Castigo',1,1317),(0,2,20,5,0,'Castigo',1,1318),(0,3,20,5,0,'Castigo',1,1319),(0,4,20,5,0,'Castigo',1,1320),(0,5,20,5,0,'Castigo',1,1321),(0,6,20,5,0,'Castigo',1,1322),(0,7,20,5,0,'Castigo',1,1323),(0,1,21,5,0,'Castigo',1,1324),(0,2,21,5,0,'Castigo',1,1325),(0,3,21,5,0,'Castigo',1,1326),(0,4,21,5,0,'Castigo',1,1327),(0,5,21,5,0,'Castigo',1,1328),(0,6,21,5,0,'Castigo',1,1329),(0,7,21,5,0,'Castigo',1,1330),(0,1,22,5,0,'Castigo',1,1331),(0,2,22,5,0,'Castigo',1,1332),(0,3,22,5,0,'Castigo',1,1333),(0,4,22,5,0,'Castigo',1,1334),(0,5,22,5,0,'Castigo',1,1335),(0,6,22,5,0,'Castigo',1,1336),(0,7,22,5,0,'Castigo',1,1337),(0,1,23,5,0,'Castigo',1,1338),(0,2,23,5,0,'Castigo',1,1339),(0,3,23,5,0,'Castigo',1,1340),(0,4,23,5,0,'Castigo',1,1341),(0,5,23,5,0,'Castigo',1,1342),(0,6,23,5,0,'Castigo',1,1343),(0,7,23,5,0,'Castigo',1,1344);
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

-- Dump completed on 2014-05-13 21:17:15

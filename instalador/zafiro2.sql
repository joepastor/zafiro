-- MySQL dump 10.13  Distrib 5.5.33, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: zafiro
-- ------------------------------------------------------
-- Server version	5.5.33-1

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` int(11) DEFAULT NULL,
  `descripcion` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comando` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subida` int(11) NOT NULL,
  `bajada` int(11) NOT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canales`
--

LOCK TABLES `canales` WRITE;
/*!40000 ALTER TABLE `canales` DISABLE KEYS */;
INSERT INTO `canales` VALUES (1,128,256,1,'256Kbps'),(2,256,512,1,'512Kbps'),(3,512,1024,1,'1Mb'),(4,1024,2048,1,'2Mbits'),(5,2048,4096,1,'4Mbits');
/*!40000 ALTER TABLE `canales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `macaddress` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `estado` int(11) NOT NULL,
  `ip` int(11) NOT NULL,
  `fecha_alta` int(11) NOT NULL,
  `fecha_baja` int(11) DEFAULT NULL,
  `nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cuit` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enruta_proxy` tinyint(1) DEFAULT NULL,
  `salida_habilitada` tinyint(1) DEFAULT NULL,
  `interface` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_50FE07D7DD5A5B7D` (`plan`),
  KEY `IDX_50FE07D734F4ECDD` (`interface`),
  CONSTRAINT `FK_50FE07D734F4ECDD` FOREIGN KEY (`interface`) REFERENCES `interfaces` (`id`),
  CONSTRAINT `FK_50FE07D7DD5A5B7D` FOREIGN KEY (`plan`) REFERENCES `planes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=502 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (3,1,'Desktop','00:1C:C0:38:21:62',1,107,20121010,0,'PC07','','','','',1,0,NULL),(77,1,'Central VoIP','70:71:bc:71:98:2a',1,2,0,0,'Asterisk',NULL,NULL,NULL,NULL,0,1,NULL),(116,1,'Desktop','00:0B:6A:BF:AA:5E',1,105,20121010,0,'PC05','','','','',1,0,NULL),(123,1,'Desktop','00:0B:6A:C6:53:DF',1,108,20121010,0,'PC08','','','','',1,0,NULL),(124,1,'Desktop','00:0B:6A:BE:93:79',1,103,20121010,0,'PC03','','','','',1,0,NULL),(133,1,'Desktop','00:27:0e:16:27:b3',1,71,20120618,0,'Cintia Cabrino','','','','',1,1,NULL),(136,1,'Desktop','00:0B:6A:BF:94:26',1,112,20121005,0,'PC12','','','','',1,0,NULL),(138,1,'Desktop','00:27:0E:16:AC:39',1,56,20121002,0,'Carlos Rodriguez','','','','',1,1,NULL),(141,1,'Desktop','00:0B:6A:C6:5E:8F',1,104,20120831,0,'PC04','','','','',1,0,NULL),(153,1,'Desktop','00:0E:A6:A9:EF:34',1,115,20121005,0,'PC15','','','','',1,0,NULL),(156,1,'Desktop','00:0B:6A:A8:A9:24',1,114,20121005,0,'PC14','','','','',1,0,NULL),(159,1,'Desktop','10:78:d2:8a:2a:1a',1,109,20120730,0,'PC09','','','','',1,0,NULL),(160,1,'Desktop en Data center','00:1C:C0:B1:3B:F3',1,10,20120703,0,'Backup 1','','','','',1,1,NULL),(161,1,'Desktop','00:0B:6A:BF:A3:40',1,113,20121003,0,'PC13','','','','',1,0,NULL),(164,1,'Desktop','00:19:66:46:ef:10',1,116,20121010,0,'PC16','','','','',1,0,NULL),(167,1,'Desktop','00:0B:6A:BF:A5:CD',1,117,20121005,0,'PC17','','','','',1,0,NULL),(168,1,'Desktop','00:0B:6A:BF:88:85',1,102,20121010,0,'PC02','','','','',1,0,NULL),(169,1,'Desktop','00:0B:6A:BF:A5:C1',1,106,20121010,0,'PC06','','','','',1,0,NULL),(170,1,'Desktop','00:0B:6A:BF:88:59',1,101,20121010,0,'PC01','','','','',1,0,NULL),(177,1,'Desktop Recepcion Vte. Lopez','48:5B:39:A3:67:8D',1,122,20121010,0,'PC22','','','','',1,0,NULL),(180,1,'Desktop - Sala Reunion','10:78:d2:1b:9b:c3',1,151,20120712,0,'PC51','','','','',1,0,NULL),(185,1,'Desktop','10:78:D2:8A:43:EF',1,100,20121005,0,'Sonia Toconas','','','','',1,1,NULL),(196,1,'Desktop','00:19:66:29:8D:E6',1,125,20121005,0,'PC25','','','','',1,0,NULL),(198,1,'Notebook','00:24:54:6E:26:E2',0,243,20130411,0,'Sonia Toconas','','','','',1,1,NULL),(200,1,'Camara Seguridad 2','00:6b:58:2c:2c:55',1,8,20131101,0,'DVR 2','','','','',0,1,NULL),(201,1,'Camara Seguridad 1','00:5e:09:07:fc:0a',1,9,20131101,0,'DVR 1','','','','',0,1,NULL),(206,1,'Desktop','44:87:fc:ef:f1:0c',1,119,20121005,0,'PC19','','','','',1,0,NULL),(207,1,'Desktop','44:87:fc:ef:f3:72',1,110,20121002,0,'PC10','','','','',0,1,NULL),(208,1,'Desktop','44:87:fc:ef:f3:73',0,124,20121003,0,'PC en REPARACION','','','','',1,0,NULL),(209,1,'Desktop','44:87:fc:ef:f1:e1',1,123,20121005,0,'PC23','','','','',1,0,NULL),(210,1,'Desktop','44:87:fc:ef:f2:b4',1,120,20121005,0,'PC20','','','','',1,0,NULL),(219,1,'Desktop','44:87:fc:ef:f0:f9',1,121,20120920,0,'PC21','','','','',1,0,NULL),(220,1,'Sistema Puertas','00:30:4f:79:29:f9',1,22,20120713,0,'ICS-100 Call Center','','','','',0,1,NULL),(221,1,'Equipo telular 8 bocas','00:03:7e:00:c4:ae',1,3,20130807,0,'Telular 1','','','','',1,1,NULL),(222,1,'Sistema Puertas','00:30:4f:79:2a:a7',0,22,20120713,0,'ICS-100 Call Center','','','','',0,1,NULL),(223,1,'Desktop','44:87:fc:eb:77:12',1,111,20120920,0,'PC11','','','','',1,0,NULL),(224,1,'Print Server','00:40:01:2e:15:55',1,40,20121005,0,'Office','','','','',1,1,NULL),(225,1,'Desktop Asesora Vte. Lopez','44:87:fc:eb:8d:49',1,150,20120625,0,'PC50','','','','',1,0,NULL),(226,1,'Desktop','44:87:fc:eb:8f:6f',1,144,20121002,0,'PC44','','','','',0,1,NULL),(231,1,'Desktop','00:e0:4c:91:c0:04',1,57,20110407,0,'Controlador Fiscal 1','','','','',1,0,NULL),(243,1,'Desktop','10:78:d2:8a:45:71',1,131,20121010,0,'PC31','','','','',1,0,NULL),(244,1,'Desktop','10:78:d2:8a:2b:fe',1,127,20121002,0,'PC27','','','','',1,0,NULL),(245,1,'Desktop','10:78:d2:8a:79:5c',1,140,20121002,0,'PC40','','','','',1,0,NULL),(246,1,'Desktop','10:78:d2:8a:44:07',1,128,20121002,0,'PC28','','','','',1,0,NULL),(247,1,'Desktop','10:78:d2:8a:44:e1',1,133,20121003,0,'PC33','','','','',1,0,NULL),(248,1,'Desktop','10:78:d2:8a:44:48',1,130,20121002,0,'PC30','','','','',1,0,NULL),(250,1,'Desktop','00:0b:6a:bf:9d:71',1,129,20121002,0,'PC29','','','','',1,0,NULL),(251,1,'Desktop','00:0B:6A:BF:A5:EB',1,132,20121003,0,'PC32','','','','',1,0,NULL),(252,1,'Desktop','10:78:d2:1b:9a:ca',1,118,20120920,0,'PC18','','','','',1,0,NULL),(261,4,'Vostro Wireless','e0:06:e6:07:3c:87',1,36,20121002,0,'Jose Lopez',NULL,NULL,NULL,NULL,1,1,NULL),(265,1,'Desktop','00:11:09:c4:ba:e7',1,134,20121010,0,'PC34','','','','',1,0,NULL),(269,1,'Desktop','10:78:d2:17:3a:85',1,139,20121002,0,'PC39','','','','',1,0,NULL),(271,1,'Desktop','10:78:d2:1b:9b:c8',1,138,20120918,0,'PC38','','','','',1,0,NULL),(272,1,'Desktop','10:78:d2:1b:9b:ef',1,135,20121002,0,'PC35','','','','',1,0,NULL),(273,1,'Desktop','10:78:d2:1b:9b:9c',1,137,20121002,0,'PC37','','','','',1,0,NULL),(274,1,'Desktop','10:78:d2:1b:9b:96',1,136,20121002,0,'PC36','','','','',1,0,NULL),(281,1,'Switch','00:11:3b:18:87:57',1,4,0,0,'Micronet','','','','',1,1,NULL),(282,1,'Equipo telular 8 bocas','00:03:7e:00:7e:38',1,6,20130807,0,'Telular 2','','','','',1,1,NULL),(286,1,'Vostro Ethernet','24:b6:fd:4d:ba:bc',1,33,20121002,0,'Jose Lopez','','','','',1,1,NULL),(291,1,'Desktop','00:e0:52:b3:41:67',0,191,20121002,0,'Servidor caballito 2','','','','',0,0,NULL),(295,1,'Desktop','00:19:66:64:53:e3',1,141,20121010,0,'PC41','','','','',1,0,NULL),(298,1,'Desktop','00:11:09:c4:bd:64',1,152,20121001,0,'PC52','','','','',1,0,NULL),(321,1,'Linksys wrt54g','00:1e:e5:34:b3:a8',0,7,20121002,0,'Router Wifi','','','','',0,1,NULL),(323,1,'Desktop','00:1c:c0:37:40:b7',1,73,20121002,0,'Mariela Rossetti','','','','',1,1,NULL),(330,1,'Desktop','00:0b:6a:bf:a3:3f',1,67,20121002,0,'Controlador Fiscal 2','','','','',1,0,NULL),(341,1,'Desktop','00:0b:6a:c6:54:05',1,148,20120816,0,'PC48','','','','',1,0,NULL),(343,1,'Desktop','00:0b:6a:bf:a7:71',1,143,20120625,0,'PC43','','','','',1,0,NULL),(348,1,'Gateway Grandstream','00:0b:82:11:b9:2d',1,80,20121002,0,'Sala de Reuniones','','','','',1,1,NULL),(353,1,'Desktop','00:80:ad:b0:4c:47',1,147,20120705,0,'PC47','','','','',1,0,NULL),(358,1,'Notebook Ethernet','f0:de:f1:87:cb:2c',1,62,20120821,0,'Alejandro Rogers','','','','',1,1,NULL),(365,1,'Desktop','00:0b:6a:bf:79:6d',1,145,20120905,0,'PC45','','','','',1,0,NULL),(370,1,'Router Wireless 2','00:25:9c:f5:ad:70',0,5,20121003,0,'WiFi Vicente Lopez','','','','',0,0,NULL),(374,1,'Desktop ','00:27:0e:15:9d:38',1,61,20121015,0,'Erica Mirkouski','','','','',1,1,NULL),(375,1,'Servidor','00:19:21:19:3d:7e',1,13,20121102,0,'Zafiro Backup','','','','',0,1,NULL),(379,1,'Netbook','48:5d:60:dc:7d:37',0,24,20121109,0,'Dario Juarez','','','','',0,0,NULL),(380,1,'TP-LINK tl-mr3420','54:e6:fc:bc:1e:39',0,17,20121120,0,'Router wi-fi','','','','',0,1,NULL),(384,1,'Desktop','00:0b:6a:bf:9f:fa',1,146,20121203,0,'PC46','','','','',1,0,NULL),(389,1,'Notebook Ethernet','80:c1:6e:59:1b:df',0,82,20130311,0,'Manuela Gaitto','','','','',1,1,NULL),(390,1,'Multifuncion HP 3050','ec:9a:74:69:ef:66',1,30,20130325,0,'Impresora Reuniones','','','','',0,0,NULL),(391,1,'Linksys wrt54g','00:1e:e5:34:b3:a7',0,14,20130416,0,'Router Vte Lopez','','','','',0,1,NULL),(392,1,'Netbook HP mini','c0:18:85:6e:df:6a',1,205,20130416,0,'Asesora Lucia Barrios','','','','',1,0,NULL),(394,1,'Desktop','00:11:09:c4:bd:58',1,142,20130423,0,'PC42','','','','',1,0,NULL),(395,1,'Notebook WIFI','00:26:82:05:cd:35',1,206,20130426,0,'Asesora Vicente Lopez','','','','',1,0,NULL),(396,1,'Dell Studio WIFI','78:e4:00:d3:ee:d5',1,38,20130429,0,'Sistemas','','','','',1,1,NULL),(398,1,'Desktop ','00:0b:6a:74:88:6a',1,124,20130507,0,'PC24','','','','',1,0,NULL),(400,1,'Impresora Tesoreria','28:92:4a:a6:11:7a',1,32,20130517,0,'HPDESKJET3050','','','','',1,1,NULL),(402,1,'Desktop','00:27:0e:1c:28:ac',1,35,20130522,0,'Onell Lanfranco','','','','',1,1,NULL),(403,4,'MacbookPro WIFI','4c:8d:79:e9:51:36',1,39,20130522,0,'Onell Lanfranco',NULL,NULL,NULL,NULL,1,1,NULL),(404,1,'Telefono Cisco','00:0d:28:8f:9e:6f',1,45,20130522,0,'Cinthia Cabrino','','','','',0,1,NULL),(405,1,'Telefono IP Panasonic','00:80:f0:d1:ce:23',1,44,20130524,0,'Onell Lanfranco','','','','',0,1,NULL),(406,1,'Telefono IP Panasonic','00:80:f0:d1:cd:dc',1,202,20130527,0,'Dario Juarez','','','','',1,1,NULL),(408,1,'Telefono IP Panasonic','00:80:f0:d1:d5:4e',1,201,20130528,0,'Sistemas','','','','',1,1,NULL),(409,1,'Telefono IP Panasonic','00:80:f0:d1:d5:46',1,203,20130528,0,'Vicente López Recepción','','','','',1,1,NULL),(410,1,'Telefono IP Panasonic','00:80:f0:d1:d1:9f',1,200,20130529,0,'Erica Mirkouski','','','','',1,1,NULL),(411,1,'Gateway Grandstream','00:0b:82:14:dc:47',1,46,20130530,0,'Mariela Rossetti','','','','',0,1,NULL),(412,1,'Notebook WIFI','78:dd:08:e0:20:c6',0,49,20130607,0,'Manuela Gaitto','','','','',1,1,NULL),(414,1,'Notebook WIFI','e4:d5:3d:12:3a:db',1,26,20130611,0,'Dan Wyrytowski','','','','',1,1,NULL),(415,1,'Carlos Rodriguez','00:80:f0:d1:d1:dd',1,204,20130614,0,'Telefono IP Panasonic','','','','',1,1,NULL),(417,1,'Impresora Wireleess','00:15:99:ac:98:99',1,31,20130619,0,'Impresora Onell','','','','',0,1,NULL),(418,1,'Notebook WIFI','94:39:e5:0e:73:15',1,29,20130619,0,'Alejandro Rogers','','','','',1,1,NULL),(422,1,'iPhone','c8:6f:1d:0b:3e:66',0,37,20130711,0,'Onell Lanfranco','','','','',1,1,NULL),(423,1,'iPad','9c:04:eb:e9:b5:3a',0,50,20130715,0,'Jose Lopez','','','','',1,1,NULL),(433,1,'MacbookPro Ethernet','10:dd:b1:aa:09:3a',1,48,20130802,0,'Onell Lanfranco','','','','',1,1,NULL),(434,1,'Notebook WIFI','b8:03:05:4e:e1:43',1,54,20130802,0,'Sonia Toconas','','','','',1,1,NULL),(435,1,'Desktop','44:87:fc:ef:f3:73',1,149,20130807,0,'PC49','','','','',1,0,NULL),(438,1,'Desktop','00:0b:6a:bf:79:58',1,16,20130814,0,'Depilight TV','','','','',1,1,NULL),(444,1,'Notebook Lenovo WIFI','00:22:fa:2d:c8:a6',1,17,20130910,0,'Claudia Mattiussi','','','','',1,1,NULL),(445,1,'Notebook Lenovo WIFI','00:26:c6:c6:7e:c4',1,43,20130910,0,'Dario Juarez','','','','',1,1,NULL),(446,1,'Notebook Lenovo WIFI','00:21:6b:ca:89:d0',1,72,20130911,0,'Manuela Gaitto','','','','',1,1,NULL),(447,1,'Notebook Lenovo LAN','00:22:68:19:c9:96',1,99,20130913,0,'Dario Juarez','','','','',1,1,NULL),(451,1,'Notebook Lenovo WIFI','00:1c:25:9f:e2:82',0,25,20130923,0,'Claudia Mattiussi ','','','','',1,1,NULL),(452,1,'ROTA QUE SE APAGA','00:26:9e:d9:f6:fc',1,51,20130924,0,'Toshiba Satellite','','','','',1,1,NULL),(453,1,'Blackberry Bold','40:6f:2a:da:1c:01',0,11,20130925,0,'Jose Lopez','','','','',1,1,NULL),(454,1,'Desktop ','00:1b:b9:e2:51:7e',1,15,20131002,0,'Alejandro Rogers','','','','',1,1,NULL),(456,1,'Telefono Motorola','80:96:b1:df:d1:77',1,59,20131009,0,'Dario Juarez','','','','',0,1,NULL),(457,1,'Recepcion Billing','00:0b:6a:bf:a7:70',0,19,20131011,0,'Desktop XUBUNTU','','','','',1,1,NULL),(458,1,'iPad','bc:3b:af:c3:21:0e',1,98,20131018,0,'Alejandro Rogers','','','','',1,1,NULL),(459,1,'Desktop','00:0b:6a:c6:5e:6f',0,153,20131018,0,'PC53','','','','',1,0,NULL),(460,1,'Desktop','00:19:d1:20:e2:0a',1,154,20131029,0,'PC54','','','','',1,0,NULL),(461,1,'Apple TV','f4:f9:51:c8:db:ed',1,47,20131029,0,'Onell Lanfranco','','','','',1,1,NULL),(462,1,'NO TOCAR','FF:FF:FA:FF:FF:F0',0,1,20131101,0,'NO UTILIZAR','','','','',0,0,NULL),(463,1,'Telefono Sony Ericsson','30:39:26:65:8b:8e',1,90,20131106,0,'Claudia Mattiussi','','','','',1,1,NULL),(464,1,'Desktop','00:e0:52:b2:62:55',1,153,20131106,0,'PC53','','','','',1,0,NULL),(465,1,'Tablet','4c:bc:a5:47:e4:3a',0,97,20131107,0,'Claudia Mattiussi','','','','',1,1,NULL),(466,1,'Lenovo Ethernet','00:1c:25:9f:e2:82',1,60,20131127,0,'Claudia Mattiussi','','','','',1,1,NULL),(467,1,'Dell Studio Ethernet','00:24:e8:84:06:21',1,24,20131127,0,'Sistemas','','','','',1,1,NULL),(468,1,'servidor temporal','00:11:d8:f9:fd:73',1,21,20131128,0,'Servidor temporal','','','','',0,1,NULL),(469,1,'Television','48:02:2a:b4:ee:e1',1,5,20131202,0,'Android TV','','','','',1,1,NULL),(470,1,'SERVER MASTER','00:25:90:d8:e5:ac',1,7,20131210,0,'SERVER MASTER','','','','',0,1,NULL),(471,1,'cel','98:0c:82:cf:59:fa',0,89,20131218,0,'Ce','','','','',0,0,NULL),(472,1,'Samsung','98:0c:82:cf:59:fa',1,12,20131218,0,'Celular','','','','',1,1,NULL),(473,1,'asd','00:80:f0:d1:d1:2a',0,42,20131230,0,'telefono belgrano','','','','',0,0,NULL),(474,1,'Notebook','74:de:2b:d2:2b:cf',1,34,20140114,0,'Carlos','','','','',1,1,NULL),(475,1,'.','70:71:bc:72:72:c6',1,14,20140115,0,'Servidor virtualizado','','','','',0,1,NULL),(476,1,'Notebook Samsung','18:67:b0:66:5c:8b',1,49,20140117,0,'Alejandro Rogers','','','','',1,1,NULL),(477,1,'Backup','00:08:54:a5:f0:8c',1,18,20140120,0,'I-Drive','','','','',0,1,NULL),(478,1,'Notebook Samsung Ethernet','e8:03:9a:53:01:65',1,19,20140124,0,'Alejandro Rogers','','','','',1,1,NULL),(479,1,'Macbook Pro Retina','60:03:08:9e:91:36',1,20,20140205,0,'Onell Lanfranco','','','','',1,1,NULL),(480,1,'iPhone 5S','84:8e:0c:09:37:5e',1,23,20140206,0,'Onell Lanfranco','','','','',1,1,NULL),(481,1,'Notebook WIFI Sony Vaio','78:dd:08:be:7c:63',1,25,20140207,0,'Gisel DAlfonso','','','','',1,1,NULL),(482,1,'Samsung Omnia II','00:21:19:e5:91:09',1,27,20140207,0,'Gisel DAlfonso','','','','',1,1,NULL),(483,1,'Prueba','00:0b:82:11:b9:3f',1,28,20140213,0,'GatewayPrueba','','','','',1,1,NULL),(484,1,'Palermo','00:12:3f:f6:ab:ee',0,37,20140220,0,'Dell ','','','','',1,1,NULL),(485,1,'Palermo asesora','00:13:ce:20:4c:c3',1,41,20140220,0,'Dell','','','','',1,1,NULL),(486,1,'Macbook WIFI','54:26:96:d4:71:f5',1,37,20140225,0,'Jose Lopez','','','','',1,1,NULL),(487,1,'Tablet','e0:b2:f1:a2:03:40',1,42,20140225,0,'Tablet sistemas','','','','',1,1,NULL),(488,1,'PC 2k14','00:19:d1:10:7a:b8',0,52,20140317,0,'Arogers','','','','',1,1,NULL),(489,1,'2k14','00:19:d1:10:7a:b8',0,53,20140317,0,'arogerspc','','','','',0,1,NULL),(490,1,'2k14','00:19:d1:10:7a:b8',0,52,20140317,0,'arogerspc','','','','',1,1,NULL),(491,1,'PC 2k14','00:19:d1:10:7a:b8',1,52,20140317,0,'Arogers','','','','',1,1,NULL),(492,1,'viamoooooonte','00:80:f0:d1:d1:7b',1,53,20140326,0,'telefono ','','','','',1,1,NULL),(493,1,'iPhone','84:8e:0c:68:dc:00',1,55,20140404,0,'Jose Lopez','','','','',0,1,NULL),(494,1,'VIamonte','00:80:f0:d1:d2:3b',1,11,20140404,0,'Recepcion','','','','',1,1,NULL),(495,1,'notebook asus','dc:85:de:5b:13:e1',1,50,20140407,0,'Slofler','','','','',1,1,NULL),(496,1,'iPad Mini','f0:f6:1c:eb:51:a2',1,58,20140408,0,'Jose Lopez','','','','',0,1,NULL),(497,1,'6009','00:0b:82:11:b9:33',1,63,20140415,0,'interno','','','','',0,1,NULL),(498,1,'6009','00:0b:82:11:b9:33',1,64,20140415,0,'interno Mariela','','','','',0,1,NULL),(499,1,'Server','52:54:00:7f:34:d5',1,65,20140421,0,'Paytoo','','','','',0,1,NULL),(500,1,'placa1','00:0b:6a:c6:5e:6f',1,66,20140508,0,'pc53','','','','',1,0,NULL),(501,1,'TEST','52:54:00:c3:33:cc',1,68,20140515,0,'Zafiro TEST','','','','',0,1,NULL);
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
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipo` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ipsource` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ipdestino` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `puertosource` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `puertodestino` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `interfaceentrada` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `interfacesalida` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filtros`
--

LOCK TABLES `filtros` WRITE;
/*!40000 ALTER TABLE `filtros` DISABLE KEYS */;
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
  `comando` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `comentario` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firewall`
--

LOCK TABLES `firewall` WRITE;
/*!40000 ALTER TABLE `firewall` DISABLE KEYS */;
INSERT INTO `firewall` VALUES (1,'23',0,'acaca',1),(2,'-A INPUT -p tcp --dport 3784 -j ACCEPT',0,'Ventrilo',1),(3,'-A OUTPUT -p tcp --sport 3784 -j ACCEPT',0,'Ventrilo Out',2),(4,'iptables -A INPUT -p udp --dport 3784 -j ACCEPT',0,'Ventrilo IN UDP',3),(5,'iptables iptables -A OUTPUT -p udp --sport 3784 -j ACCEPT',0,'Ventrilo OUT UDP',4),(6,'-A FORWARD -s 172.16.50.1 -j LOG --log-prefix \'JOE-------\'',0,'probando',1),(7,'-A INPUT -s 201.216.237.165 -p tcp --sport 800 -j ACCEPT',0,'AGA',2),(8,'-A OUTPUT -d 201.216.237.165 -p tcp --dport 800 -j ACCEPT',0,'AGA',2),(9,'-t nat -A PREROUTING -p tcp --dport 8923 -j DNAT --to 172.16.0.4:22',0,'SSH a la cerda',1),(10,'-A OUTPUT -p 443 -d sps.decidir.com -j ACCEPT',0,'SPS',4),(11,'-A FORWARD -d sps.decidir.com -j ACCEPT',0,'SPS OUT',6),(12,'-A FORWARD -s sps.decidir.com -j ACCEPT',0,'SPS IN',7),(13,'-A FORWARD -d 200.80.194.18 -p udp -j ACCEPT',1,'DNS SPS 1/4',5),(14,'-A FORWARD -s 200.80.194.18 -p udp -j ACCEPT',1,'DNS SPS 2/4',5),(15,'-A FORWARD -d 200.80.194.18 -p tcp -j ACCEPT',1,'DNS SPS 3/4',5),(16,'-A FORWARD -s 200.80.194.18 -p tcp -j ACCEPT',1,'DNS SPS 4/4',5),(17,'-P INPUT ACCEPT',0,'FIX TEMPORAL',0),(18,'-P OUTPUT ACCEPT',0,'FIX TEMPORAL 2',0),(19,'-A FORWARD -d 200.69.248.13 -j ACCEPT',1,'sps.decidir.com IP 1 OUT',1),(20,'-A FORWARD -s 200.69.248.13 -j ACCEPT',1,'sps.decidir.com IP 1 IN',1),(21,'-A FORWARD -s 190.221.46.236 -j ACCEPT',1,'sps.decidir.com IP 2 IN',1),(22,'-A FORWARD -d 190.221.46.236 -j ACCEPT',1,'sps.decidir.com IP 2 OUT',1),(23,'-A FORWARD -s 200.80.195.18 -p udp -j ACCEPT',1,'DNS SPS 5/6',7),(24,'-A FORWARD -d 200.80.195.18 -p udp -j ACCEPT',1,'DNS SPS 6/6',7),(25,'-A FORWARD -d 190.221.46.236 -j ACCEPT',1,'SPS IP2 OUT',1),(26,'-A OUTPUT -o eth0 -p tcp --sport 3128 -j ACCEPT',1,'PROXY OUT',10),(27,'-A INPUT -i eth0 -p tcp --dport 3128 -j ACCEPT',1,'PROXY IN',10),(28,'-A FORWARD -d 190.2.45.229 -j ACCEPT',1,'www.depilight.com/O',10),(29,'-A FORWARD -s 190.2.45.229 -j ACCEPT',1,'www.depilight.com/I',10),(30,'-t nat -A PREROUTING -i eth0 -p tcp --dport 80 -s 172.16.0.33 -j REDIRECT --to-port 3128',0,'LUCHO PROXY TEST',9),(31,'-A OUTPUT -o eth1 -p tcp --sport 3128 -j ACCEPT',0,'DAN PROXY OUT',15),(32,'-A INPUT -i eth1 -p tcp --dport 3128 -j ACCEPT',0,'DAN PROXY IN',15),(33,'-A FORWARD -d 190.2.29.105 -j ACCEPT',1,'TELEFONOS DESDE AFUERA OUT',10),(34,'-A FORWARD -s 190.2.29.105 -j ACCEPT',1,'TELEFONOS DESDE AFUERA IN',11),(35,'-t nat -A PREROUTING -i eth1 -p udp -s 0.0.0.0/0 --dport 4097 -j DNAT --to 172.16.0.36:4097',0,'virloc',10);
/*!40000 ALTER TABLE `firewall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forwardeos`
--

DROP TABLE IF EXISTS `forwardeos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forwardeos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `puesrc` int(11) NOT NULL,
  `puedst` int(11) NOT NULL,
  `ipdst` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `ipsrc` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forwardeos`
--

LOCK TABLES `forwardeos` WRITE;
/*!40000 ALTER TABLE `forwardeos` DISABLE KEYS */;
INSERT INTO `forwardeos` VALUES (1,4097,4097,'172.16.0.65',1,'0.0.0.0'),(2,8888,80,'172.16.0.65',1,'0.0.0.0');
/*!40000 ALTER TABLE `forwardeos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fos_user`
--

DROP TABLE IF EXISTS `fos_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fos_user`
--

LOCK TABLES `fos_user` WRITE;
/*!40000 ALTER TABLE `fos_user` DISABLE KEYS */;
INSERT INTO `fos_user` VALUES (1,'administrador','administrador','admin@admin.com','admin@admin.com',1,'9m90efi35wso0kg4c48cwwoc8kgwgwc','8WbaKlDKFK/NOmrPo1+s4lQDBrr5xp8tGIVBykSOO6Xxl1vSwpOXm+e/TSXiwAKx0WPxkfk74gg6619qzNWmsQ==','2014-05-22 15:17:34',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL);
/*!40000 ALTER TABLE `fos_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interfaces`
--

DROP TABLE IF EXISTS `interfaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interfaces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `netmask` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `network` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `broadcast` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `gateway` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interfaces`
--

LOCK TABLES `interfaces` WRITE;
/*!40000 ALTER TABLE `interfaces` DISABLE KEYS */;
INSERT INTO `interfaces` VALUES (1,'eth0','WAN-Telmex','190.221.138.58','255.255.255.248','190.221.138.56','190.221.138.63','190.221.138.57',1),(2,'br2','LAN-Virtualizada','172.16.0.1','255.255.255.0','172.16.0.0','172.16.0.255',NULL,1);
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
  `interfacesvirtualesint` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interfacesvirtualesest` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interfacesvirtuales`
--

LOCK TABLES `interfacesvirtuales` WRITE;
/*!40000 ALTER TABLE `interfacesvirtuales` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ips`
--

LOCK TABLES `ips` WRITE;
/*!40000 ALTER TABLE `ips` DISABLE KEYS */;
/*!40000 ALTER TABLE `ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipsfijas`
--

DROP TABLE IF EXISTS `ipsfijas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipsfijas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `estado` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `interface` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(1) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `valor` int(11) DEFAULT NULL,
  `d0h00` int(11) DEFAULT NULL,
  `d0h01` int(11) DEFAULT NULL,
  `d0h02` int(11) DEFAULT NULL,
  `d0h03` int(11) DEFAULT NULL,
  `d0h04` int(11) DEFAULT NULL,
  `d0h05` int(11) DEFAULT NULL,
  `d0h06` int(11) DEFAULT NULL,
  `d0h07` int(11) DEFAULT NULL,
  `d0h08` int(11) DEFAULT NULL,
  `d0h09` int(11) DEFAULT NULL,
  `d0h10` int(11) DEFAULT NULL,
  `d0h11` int(11) DEFAULT NULL,
  `d0h12` int(11) DEFAULT NULL,
  `d0h13` int(11) DEFAULT NULL,
  `d0h14` int(11) DEFAULT NULL,
  `d0h15` int(11) DEFAULT NULL,
  `d0h16` int(11) DEFAULT NULL,
  `d0h17` int(11) DEFAULT NULL,
  `d0h18` int(11) DEFAULT NULL,
  `d0h19` int(11) DEFAULT NULL,
  `d0h20` int(11) DEFAULT NULL,
  `d0h21` int(11) DEFAULT NULL,
  `d0h22` int(11) DEFAULT NULL,
  `d0h23` int(11) DEFAULT NULL,
  `d1h00` int(11) DEFAULT NULL,
  `d1h01` int(11) DEFAULT NULL,
  `d1h02` int(11) DEFAULT NULL,
  `d1h03` int(11) DEFAULT NULL,
  `d1h04` int(11) DEFAULT NULL,
  `d1h05` int(11) DEFAULT NULL,
  `d1h06` int(11) DEFAULT NULL,
  `d1h07` int(11) DEFAULT NULL,
  `d1h08` int(11) DEFAULT NULL,
  `d1h09` int(11) DEFAULT NULL,
  `d1h10` int(11) DEFAULT NULL,
  `d1h11` int(11) DEFAULT NULL,
  `d1h12` int(11) DEFAULT NULL,
  `d1h13` int(11) DEFAULT NULL,
  `d1h14` int(11) DEFAULT NULL,
  `d1h15` int(11) DEFAULT NULL,
  `d1h16` int(11) DEFAULT NULL,
  `d1h17` int(11) DEFAULT NULL,
  `d1h18` int(11) DEFAULT NULL,
  `d1h19` int(11) DEFAULT NULL,
  `d1h20` int(11) DEFAULT NULL,
  `d1h21` int(11) DEFAULT NULL,
  `d1h22` int(11) DEFAULT NULL,
  `d1h23` int(11) DEFAULT NULL,
  `d2h00` int(11) DEFAULT NULL,
  `d2h01` int(11) DEFAULT NULL,
  `d2h02` int(11) DEFAULT NULL,
  `d2h03` int(11) DEFAULT NULL,
  `d2h04` int(11) DEFAULT NULL,
  `d2h05` int(11) DEFAULT NULL,
  `d2h06` int(11) DEFAULT NULL,
  `d2h07` int(11) DEFAULT NULL,
  `d2h08` int(11) DEFAULT NULL,
  `d2h09` int(11) DEFAULT NULL,
  `d2h10` int(11) DEFAULT NULL,
  `d2h11` int(11) DEFAULT NULL,
  `d2h12` int(11) DEFAULT NULL,
  `d2h13` int(11) DEFAULT NULL,
  `d2h14` int(11) DEFAULT NULL,
  `d2h15` int(11) DEFAULT NULL,
  `d2h16` int(11) DEFAULT NULL,
  `d2h17` int(11) DEFAULT NULL,
  `d2h18` int(11) DEFAULT NULL,
  `d2h19` int(11) DEFAULT NULL,
  `d2h20` int(11) DEFAULT NULL,
  `d2h21` int(11) DEFAULT NULL,
  `d2h22` int(11) DEFAULT NULL,
  `d2h23` int(11) DEFAULT NULL,
  `d3h00` int(11) DEFAULT NULL,
  `d3h01` int(11) DEFAULT NULL,
  `d3h02` int(11) DEFAULT NULL,
  `d3h03` int(11) DEFAULT NULL,
  `d3h04` int(11) DEFAULT NULL,
  `d3h05` int(11) DEFAULT NULL,
  `d3h06` int(11) DEFAULT NULL,
  `d3h07` int(11) DEFAULT NULL,
  `d3h08` int(11) DEFAULT NULL,
  `d3h09` int(11) DEFAULT NULL,
  `d3h10` int(11) DEFAULT NULL,
  `d3h11` int(11) DEFAULT NULL,
  `d3h12` int(11) DEFAULT NULL,
  `d3h13` int(11) DEFAULT NULL,
  `d3h14` int(11) DEFAULT NULL,
  `d3h15` int(11) DEFAULT NULL,
  `d3h16` int(11) DEFAULT NULL,
  `d3h17` int(11) DEFAULT NULL,
  `d3h18` int(11) DEFAULT NULL,
  `d3h19` int(11) DEFAULT NULL,
  `d3h20` int(11) DEFAULT NULL,
  `d3h21` int(11) DEFAULT NULL,
  `d3h22` int(11) DEFAULT NULL,
  `d3h23` int(11) DEFAULT NULL,
  `d4h00` int(11) DEFAULT NULL,
  `d4h01` int(11) DEFAULT NULL,
  `d4h02` int(11) DEFAULT NULL,
  `d4h03` int(11) DEFAULT NULL,
  `d4h04` int(11) DEFAULT NULL,
  `d4h05` int(11) DEFAULT NULL,
  `d4h06` int(11) DEFAULT NULL,
  `d4h07` int(11) DEFAULT NULL,
  `d4h08` int(11) DEFAULT NULL,
  `d4h09` int(11) DEFAULT NULL,
  `d4h10` int(11) DEFAULT NULL,
  `d4h11` int(11) DEFAULT NULL,
  `d4h12` int(11) DEFAULT NULL,
  `d4h13` int(11) DEFAULT NULL,
  `d4h14` int(11) DEFAULT NULL,
  `d4h15` int(11) DEFAULT NULL,
  `d4h16` int(11) DEFAULT NULL,
  `d4h17` int(11) DEFAULT NULL,
  `d4h18` int(11) DEFAULT NULL,
  `d4h19` int(11) DEFAULT NULL,
  `d4h20` int(11) DEFAULT NULL,
  `d4h21` int(11) DEFAULT NULL,
  `d4h22` int(11) DEFAULT NULL,
  `d4h23` int(11) DEFAULT NULL,
  `d5h00` int(11) DEFAULT NULL,
  `d5h01` int(11) DEFAULT NULL,
  `d5h02` int(11) DEFAULT NULL,
  `d5h03` int(11) DEFAULT NULL,
  `d5h04` int(11) DEFAULT NULL,
  `d5h05` int(11) DEFAULT NULL,
  `d5h06` int(11) DEFAULT NULL,
  `d5h07` int(11) DEFAULT NULL,
  `d5h08` int(11) DEFAULT NULL,
  `d5h09` int(11) DEFAULT NULL,
  `d5h10` int(11) DEFAULT NULL,
  `d5h11` int(11) DEFAULT NULL,
  `d5h12` int(11) DEFAULT NULL,
  `d5h13` int(11) DEFAULT NULL,
  `d5h14` int(11) DEFAULT NULL,
  `d5h15` int(11) DEFAULT NULL,
  `d5h16` int(11) DEFAULT NULL,
  `d5h17` int(11) DEFAULT NULL,
  `d5h18` int(11) DEFAULT NULL,
  `d5h19` int(11) DEFAULT NULL,
  `d5h20` int(11) DEFAULT NULL,
  `d5h21` int(11) DEFAULT NULL,
  `d5h22` int(11) DEFAULT NULL,
  `d5h23` int(11) DEFAULT NULL,
  `d6h00` int(11) DEFAULT NULL,
  `d6h01` int(11) DEFAULT NULL,
  `d6h02` int(11) DEFAULT NULL,
  `d6h03` int(11) DEFAULT NULL,
  `d6h04` int(11) DEFAULT NULL,
  `d6h05` int(11) DEFAULT NULL,
  `d6h06` int(11) DEFAULT NULL,
  `d6h07` int(11) DEFAULT NULL,
  `d6h08` int(11) DEFAULT NULL,
  `d6h09` int(11) DEFAULT NULL,
  `d6h10` int(11) DEFAULT NULL,
  `d6h11` int(11) DEFAULT NULL,
  `d6h12` int(11) DEFAULT NULL,
  `d6h13` int(11) DEFAULT NULL,
  `d6h14` int(11) DEFAULT NULL,
  `d6h15` int(11) DEFAULT NULL,
  `d6h16` int(11) DEFAULT NULL,
  `d6h17` int(11) DEFAULT NULL,
  `d6h18` int(11) DEFAULT NULL,
  `d6h19` int(11) DEFAULT NULL,
  `d6h20` int(11) DEFAULT NULL,
  `d6h21` int(11) DEFAULT NULL,
  `d6h22` int(11) DEFAULT NULL,
  `d6h23` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planes`
--

LOCK TABLES `planes` WRITE;
/*!40000 ALTER TABLE `planes` DISABLE KEYS */;
INSERT INTO `planes` VALUES (1,1,'Plan 256',0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(2,1,'Plan 512',0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),(3,1,'Plan 1MB',0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3),(4,1,'Plan 2MB',0,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4);
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
  `llave` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `valor` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'limitacion','1');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `estado` int(11) NOT NULL,
  `nivel` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
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

-- Dump completed on 2014-05-22 15:49:02

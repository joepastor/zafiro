-- MySQL dump 10.13  Distrib 5.1.54, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: zafiro
-- ------------------------------------------------------
-- Server version	5.1.54-1ubuntu4

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
INSERT INTO `canales` VALUES (1,21,3,0,'Canal');
/*!40000 ALTER TABLE `canales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `clientesid` int(10) unsigned NOT NULL DEFAULT '0',
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'asdfadsf','00:00:00:00:00:00',0,0,1,0,0,1,'Pepe','','','','',0,0),(2,'098m098k','09:09:98:09:09:98',0,0,2,20111006,0,1,'09809809','','','','',0,0),(3,'89u98u98u','98:79:98:87:87:87',0,0,3,20111006,0,1,'asdoij0','','','','',0,0),(4,'09i09id09','12:09:80:09:80:09',0,0,4,20111006,0,1,'afj09','','','','',0,0),(5,'23452345','23:23:23:23:23:23',0,0,5,20111006,0,1,'52345234','','','','',0,0),(6,'0909i0','09:09:80:09:98:09',0,0,6,20111006,0,1,'0909jk','','','','',0,0),(7,'Amazon Kindle','00:00:00:00:00:00',0,0,7,20111006,0,1,'aasasasasas','','','','',0,0);
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filtros`
--

LOCK TABLES `filtros` WRITE;
/*!40000 ALTER TABLE `filtros` DISABLE KEYS */;
INSERT INTO `filtros` VALUES (1,'asdfasdf','ICMP','10.10.10.1','10.10.10.1','10.10.10.1','10.10.10.1',0,'eth0','eth0'),(2,'asdfasdf','UDP','10.10.10.1','10.10.10.1','10.10.10.1','10.10.10.1',0,'eth0','eth0'),(3,'sdfgsdfg','TCP','123.123.123.123','123.123.123.123','10.10.10.1','123.123.123.123',0,'eth0','eth0');
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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firewall`
--

LOCK TABLES `firewall` WRITE;
/*!40000 ALTER TABLE `firewall` DISABLE KEYS */;
INSERT INTO `firewall` VALUES (1,'23',2,'acaca',1),(2,'-A INPUT -p tcp --dport 3784 -j ACCEPT',2,'Ventrilo',2),(3,'-A OUTPUT -p tcp --sport 3784 -j ACCEPT',2,'Ventrilo Out',2),(4,'iptables -A INPUT -p udp --dport 3784 -j ACCEPT',2,'Ventrilo IN UDP',3),(5,'iptables iptables -A OUTPUT -p udp --sport 3784 -j ACCEPT',2,'Ventrilo OUT UDP',4),(6,'-A FORWARD -s 172.16.50.1 -j LOG --log-prefix \'JOE-------\'',2,'probando',1),(7,'-t nat -A PREROUTING -i eth0 -s 172.16.41.0/24 -d ! 172.16.0.0/16 -p tcp --dport 80 -j REDIRECT --to-port 3128',2,'Squid - Sin cachear red interna',1),(8,'-t nat -A PREROUTING -i eth0 -s 172.16.41.0/24 -p tcp --dport 80 -j REDIRECT --to-port 3128',0,'Squid - Cacheando red interna',2),(9,'-t nat -A PREROUTING -i eth0 -p tcp --dport 80 -s 172.16.41.125 -j DNAT --to 74.55.55.242',2,'Internet',1),(10,'af 34f23 42r wef',1,'asdfasdf asdfsdf sdf sdf',4);
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forwardeos`
--

LOCK TABLES `forwardeos` WRITE;
/*!40000 ALTER TABLE `forwardeos` DISABLE KEYS */;
INSERT INTO `forwardeos` VALUES (3,5678,2801,'172.16.41.250',0,'0.0.0.0'),(4,23,444,'1.23.3.4',0,'10.12.3.2');
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
INSERT INTO `interfacesvirtuales` VALUES ('eth3',0),('eth4',0),('eth5',0),('eth6',0),('eth7',0),('eth8',0),('eth9',0),('eth10',1),('eth11',0),('eth12',0),('eth13',0),('eth14',0),('eth15',0),('eth16',0),('eth17',0),('eth18',0),('eth19',0),('eth20',0),('eth21',0),('eth22',0),('eth23',0),('eth24',0),('eth25',0),('eth26',0),('eth27',0),('eth28',0),('eth29',0),('eth30',0),('eth31',0),('eth32',0),('eth33',0),('eth34',0),('eth35',0),('eth36',0),('eth37',0),('eth38',0),('eth39',0),('eth40',0),('eth41',0),('eth42',0),('eth43',0),('eth44',0),('eth45',0),('eth46',0),('eth47',0),('eth48',0),('eth49',0),('eth50',0),('eth51',0),('eth52',0),('eth53',0),('eth54',0),('eth55',0),('eth56',0),('eth57',0),('eth58',0),('eth59',0),('eth60',0),('eth61',0),('eth62',0),('eth63',0),('eth64',0),('eth65',0),('eth66',0),('eth67',0),('eth68',0),('eth69',0),('eth70',0),('eth71',0),('eth72',0),('eth73',0),('eth74',0),('eth75',0),('eth76',0),('eth77',0),('eth78',0),('eth79',0),('eth80',0),('eth81',0),('eth82',0),('eth83',0),('eth84',0),('eth85',0),('eth86',0),('eth87',0),('eth88',0),('eth89',0),('eth90',0),('eth91',0),('eth92',0),('eth93',0),('eth94',0),('eth95',0),('eth96',0),('eth97',0),('eth98',0),('eth99',0),('eth100',1),('eth101',1),('eth102',1),('eth103',0),('eth104',0),('eth105',0),('eth106',0),('eth107',0),('eth108',0),('eth109',0),('eth110',0),('eth111',0),('eth112',0),('eth113',0),('eth114',0),('eth115',0),('eth116',0),('eth117',0),('eth118',0),('eth119',0),('eth120',0),('eth121',0),('eth122',0),('eth123',0),('eth124',0),('eth125',0),('eth126',0),('eth127',0),('eth128',0),('eth129',0),('eth130',0),('eth131',0),('eth132',0),('eth133',0),('eth134',0),('eth135',0),('eth136',0),('eth137',0),('eth138',0),('eth139',0),('eth140',0),('eth141',0),('eth142',0),('eth143',0),('eth144',0),('eth145',0),('eth146',0),('eth147',0),('eth148',0),('eth149',0),('eth150',0),('eth151',0),('eth152',0),('eth153',0),('eth154',0),('eth155',0),('eth156',0),('eth157',0),('eth158',0),('eth159',0),('eth160',0),('eth161',0),('eth162',0),('eth163',0),('eth164',0),('eth165',0),('eth166',0),('eth167',0),('eth168',0),('eth169',0),('eth170',0),('eth171',0),('eth172',0),('eth173',0),('eth174',0),('eth175',0),('eth176',0),('eth177',0),('eth178',0),('eth179',0),('eth180',0),('eth181',0),('eth182',0),('eth183',0),('eth184',0),('eth185',0),('eth186',0),('eth187',0),('eth188',0),('eth189',0),('eth190',0),('eth191',0),('eth192',0),('eth193',0),('eth194',0),('eth195',0),('eth196',0),('eth197',0),('eth198',0),('eth199',0),('eth200',0),('eth201',0),('eth202',0),('eth203',0),('eth204',0),('eth205',0),('eth206',0),('eth207',0),('eth208',0),('eth209',0),('eth210',0),('eth211',0),('eth212',0),('eth213',0),('eth214',0),('eth215',0),('eth216',0),('eth217',0),('eth218',0),('eth219',0),('eth220',0),('eth221',0),('eth222',0),('eth223',0),('eth224',0),('eth225',0),('eth226',0),('eth227',0),('eth228',0),('eth229',0),('eth230',0),('eth231',0),('eth232',0),('eth233',0),('eth234',0),('eth235',0),('eth236',0),('eth237',0),('eth238',0),('eth239',0),('eth240',0),('eth241',0),('eth242',0),('eth243',0),('eth244',0),('eth245',0),('eth246',0),('eth247',0),('eth248',0),('eth249',0),('eth250',0),('eth251',0),('eth252',0),('eth253',0),('eth254',0);
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
  `ipsfijasid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ipsfijasip` varchar(45) NOT NULL DEFAULT '',
  `ipsfijasest` int(10) unsigned NOT NULL DEFAULT '0',
  `ipsfijascli` int(10) unsigned NOT NULL DEFAULT '0',
  `ipsfijasint` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ipsfijasid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipsfijas`
--

LOCK TABLES `ipsfijas` WRITE;
/*!40000 ALTER TABLE `ipsfijas` DISABLE KEYS */;
INSERT INTO `ipsfijas` VALUES (4,'4.3.2.3',0,6,'eth10'),(5,'4.4.4.4',0,6,'eth10'),(6,'4.3.4.3',0,6,'eth10'),(7,'4.3.4.3',0,7,'eth102');
/*!40000 ALTER TABLE `ipsfijas` ENABLE KEYS */;
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
  `planesid` int(10) unsigned NOT NULL,
  `planesdia` int(10) unsigned NOT NULL DEFAULT '0',
  `planeshor` int(10) unsigned NOT NULL DEFAULT '0',
  `planescan` int(10) unsigned NOT NULL DEFAULT '0',
  `planesest` int(10) unsigned NOT NULL DEFAULT '0',
  `planesnom` varchar(45) NOT NULL DEFAULT '',
  `valor` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2017 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planes`
--

LOCK TABLES `planes` WRITE;
/*!40000 ALTER TABLE `planes` DISABLE KEYS */;
INSERT INTO `planes` VALUES (1,1,0,1,0,'345',345),(1,2,0,1,0,'345',345),(1,3,0,1,0,'345',345),(1,4,0,1,0,'345',345),(1,5,0,1,0,'345',345),(1,6,0,1,0,'345',345),(1,7,0,1,0,'345',345),(1,1,1,1,0,'345',345),(1,2,1,1,0,'345',345),(1,3,1,1,0,'345',345),(1,4,1,1,0,'345',345),(1,5,1,1,0,'345',345),(1,6,1,1,0,'345',345),(1,7,1,1,0,'345',345),(1,1,2,1,0,'345',345),(1,2,2,1,0,'345',345),(1,3,2,1,0,'345',345),(1,4,2,1,0,'345',345),(1,5,2,1,0,'345',345),(1,6,2,1,0,'345',345),(1,7,2,1,0,'345',345),(1,1,3,1,0,'345',345),(1,2,3,1,0,'345',345),(1,3,3,1,0,'345',345),(1,4,3,1,0,'345',345),(1,5,3,1,0,'345',345),(1,6,3,1,0,'345',345),(1,7,3,1,0,'345',345),(1,1,4,1,0,'345',345),(1,2,4,1,0,'345',345),(1,3,4,1,0,'345',345),(1,4,4,1,0,'345',345),(1,5,4,1,0,'345',345),(1,6,4,1,0,'345',345),(1,7,4,1,0,'345',345),(1,1,5,1,0,'345',345),(1,2,5,1,0,'345',345),(1,3,5,1,0,'345',345),(1,4,5,1,0,'345',345),(1,5,5,1,0,'345',345),(1,6,5,1,0,'345',345),(1,7,5,1,0,'345',345),(1,1,6,1,0,'345',345),(1,2,6,1,0,'345',345),(1,3,6,1,0,'345',345),(1,4,6,1,0,'345',345),(1,5,6,1,0,'345',345),(1,6,6,1,0,'345',345),(1,7,6,1,0,'345',345),(1,1,7,1,0,'345',345),(1,2,7,1,0,'345',345),(1,3,7,1,0,'345',345),(1,4,7,1,0,'345',345),(1,5,7,1,0,'345',345),(1,6,7,1,0,'345',345),(1,7,7,1,0,'345',345),(1,1,8,1,0,'345',345),(1,2,8,1,0,'345',345),(1,3,8,1,0,'345',345),(1,4,8,1,0,'345',345),(1,5,8,1,0,'345',345),(1,6,8,1,0,'345',345),(1,7,8,1,0,'345',345),(1,1,9,1,0,'345',345),(1,2,9,1,0,'345',345),(1,3,9,1,0,'345',345),(1,4,9,1,0,'345',345),(1,5,9,1,0,'345',345),(1,6,9,1,0,'345',345),(1,7,9,1,0,'345',345),(1,1,10,1,0,'345',345),(1,2,10,1,0,'345',345),(1,3,10,1,0,'345',345),(1,4,10,1,0,'345',345),(1,5,10,1,0,'345',345),(1,6,10,1,0,'345',345),(1,7,10,1,0,'345',345),(1,1,11,1,0,'345',345),(1,2,11,1,0,'345',345),(1,3,11,1,0,'345',345),(1,4,11,1,0,'345',345),(1,5,11,1,0,'345',345),(1,6,11,1,0,'345',345),(1,7,11,1,0,'345',345),(1,1,12,1,0,'345',345),(1,2,12,1,0,'345',345),(1,3,12,1,0,'345',345),(1,4,12,1,0,'345',345),(1,5,12,1,0,'345',345),(1,6,12,1,0,'345',345),(1,7,12,1,0,'345',345),(1,1,13,1,0,'345',345),(1,2,13,1,0,'345',345),(1,3,13,1,0,'345',345),(1,4,13,1,0,'345',345),(1,5,13,1,0,'345',345),(1,6,13,1,0,'345',345),(1,7,13,1,0,'345',345),(1,1,14,1,0,'345',345),(1,2,14,1,0,'345',345),(1,3,14,1,0,'345',345),(1,4,14,1,0,'345',345),(1,5,14,1,0,'345',345),(1,6,14,1,0,'345',345),(1,7,14,1,0,'345',345),(1,1,15,1,0,'345',345),(1,2,15,1,0,'345',345),(1,3,15,1,0,'345',345),(1,4,15,1,0,'345',345),(1,5,15,1,0,'345',345),(1,6,15,1,0,'345',345),(1,7,15,1,0,'345',345),(1,1,16,1,0,'345',345),(1,2,16,1,0,'345',345),(1,3,16,1,0,'345',345),(1,4,16,1,0,'345',345),(1,5,16,1,0,'345',345),(1,6,16,1,0,'345',345),(1,7,16,1,0,'345',345),(1,1,17,1,0,'345',345),(1,2,17,1,0,'345',345),(1,3,17,1,0,'345',345),(1,4,17,1,0,'345',345),(1,5,17,1,0,'345',345),(1,6,17,1,0,'345',345),(1,7,17,1,0,'345',345),(1,1,18,1,0,'345',345),(1,2,18,1,0,'345',345),(1,3,18,1,0,'345',345),(1,4,18,1,0,'345',345),(1,5,18,1,0,'345',345),(1,6,18,1,0,'345',345),(1,7,18,1,0,'345',345),(1,1,19,1,0,'345',345),(1,2,19,1,0,'345',345),(1,3,19,1,0,'345',345),(1,4,19,1,0,'345',345),(1,5,19,1,0,'345',345),(1,6,19,1,0,'345',345),(1,7,19,1,0,'345',345),(1,1,20,1,0,'345',345),(1,2,20,1,0,'345',345),(1,3,20,1,0,'345',345),(1,4,20,1,0,'345',345),(1,5,20,1,0,'345',345),(1,6,20,1,0,'345',345),(1,7,20,1,0,'345',345),(1,1,21,1,0,'345',345),(1,2,21,1,0,'345',345),(1,3,21,1,0,'345',345),(1,4,21,1,0,'345',345),(1,5,21,1,0,'345',345),(1,6,21,1,0,'345',345),(1,7,21,1,0,'345',345),(1,1,22,1,0,'345',345),(1,2,22,1,0,'345',345),(1,3,22,1,0,'345',345),(1,4,22,1,0,'345',345),(1,5,22,1,0,'345',345),(1,6,22,1,0,'345',345),(1,7,22,1,0,'345',345),(1,1,23,1,0,'345',345),(1,2,23,1,0,'345',345),(1,3,23,1,0,'345',345),(1,4,23,1,0,'345',345),(1,5,23,1,0,'345',345),(1,6,23,1,0,'345',345),(1,7,23,1,0,'345',345);
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
INSERT INTO `usuarios` VALUES (1,'admin','admin',0,1);
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

-- Dump completed on 2011-10-07 21:52:14

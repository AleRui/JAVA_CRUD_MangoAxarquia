-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mangos
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `comprador`
--

DROP TABLE IF EXISTS `comprador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comprador` (
  `idComprador` int(11) NOT NULL,
  `nombreComp` varchar(120) NOT NULL,
  `NIFComp` varchar(9) NOT NULL,
  `tipoComp` varchar(45) NOT NULL,
  `dirEnvioComp` varchar(200) DEFAULT NULL,
  `emailComp` varchar(180) NOT NULL,
  `tlfComp` varchar(9) NOT NULL,
  PRIMARY KEY (`idComprador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprador`
--

LOCK TABLES `comprador` WRITE;
/*!40000 ALTER TABLE `comprador` DISABLE KEYS */;
INSERT INTO `comprador` VALUES (1,'Eva Mª Perales Belizón','11112222A','empresa','C/ Marie Curie Nº 10. PTA Málaga','eva@empresa.com','611222333'),(2,'Luis José Sánchez González','B33334444','particular','C/ MArie Curie Nº 10. PTA Málaga','luis@particular.com','644555666'),(3,'sofia martín','99987789L','Particular','calle prueba','sofia@martin.com','636636636');
/*!40000 ALTER TABLE `comprador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `det_fact`
--

DROP TABLE IF EXISTS `det_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `det_fact` (
  `codDetFact` int(11) NOT NULL,
  `idMangos` int(11) NOT NULL,
  `numFact` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `precio` float NOT NULL,
  PRIMARY KEY (`codDetFact`,`numFact`),
  KEY `fk_MANGOS_has_FACTURA_MANGOS1` (`idMangos`),
  KEY `fk_MANGOS_has_FACTURA_FACTURA1` (`numFact`),
  CONSTRAINT `fk_MANGOS_has_FACTURA_FACTURA1` FOREIGN KEY (`numFact`) REFERENCES `factura` (`numFact`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MANGOS_has_FACTURA_MANGOS1` FOREIGN KEY (`idMangos`) REFERENCES `variedad` (`idMangos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `det_fact`
--

LOCK TABLES `det_fact` WRITE;
/*!40000 ALTER TABLE `det_fact` DISABLE KEYS */;
INSERT INTO `det_fact` VALUES (1,101,1,78,1.2),(1,104,2,50,1.8),(1,101,3,150,1.2),(1,103,4,785,0.85),(2,103,1,100,0.85),(2,102,2,75,1.2),(2,105,4,85,0.8);
/*!40000 ALTER TABLE `det_fact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura` (
  `numFact` int(11) NOT NULL,
  `fechaFact` date NOT NULL,
  `idComprador` int(11) NOT NULL,
  PRIMARY KEY (`numFact`),
  KEY `fk_FACTURA_COMPRADOR` (`idComprador`),
  CONSTRAINT `fk_FACTURA_COMPRADOR` FOREIGN KEY (`idComprador`) REFERENCES `comprador` (`idComprador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,'2018-05-12',1),(2,'2018-05-12',2),(3,'2018-05-12',3),(4,'2018-05-12',1);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variedad`
--

DROP TABLE IF EXISTS `variedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variedad` (
  `idMangos` int(11) NOT NULL,
  `nombreVar` varchar(80) NOT NULL,
  `peso` float DEFAULT NULL,
  `fechaIniAprox` date DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `stock` float DEFAULT NULL,
  PRIMARY KEY (`idMangos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variedad`
--

LOCK TABLES `variedad` WRITE;
/*!40000 ALTER TABLE `variedad` DISABLE KEYS */;
INSERT INTO `variedad` VALUES (101,'Osteen',0.53,'2018-09-14',1.2,20000),(102,'Kent',0.48,'2018-09-21',1.2,23000),(103,'Tommy Atkins',0.48,'2018-08-21',0.85,45000),(104,'Ataulfo',0.48,'2018-09-21',1.8,2000),(105,'Keit',0.48,'2018-10-14',0.8,42000);
/*!40000 ALTER TABLE `variedad` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-12 12:54:38

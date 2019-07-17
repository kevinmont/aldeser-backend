-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: aldeser
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tcontacto`
--

DROP TABLE IF EXISTS `tcontacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `tcontacto` (
  `id_contacto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  PRIMARY KEY (`id_contacto`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcontacto`
--

LOCK TABLES `tcontacto` WRITE;
/*!40000 ALTER TABLE `tcontacto` DISABLE KEYS */;
INSERT INTO `tcontacto` VALUES (1,'test 35','Prueba servidor','andre91c_y884i@umail2.com'),(2,'test 37','Prueba servidor','andre91c_y884i@umail2.com'),(3,'test 37','Prueba servidor','andre91c_y884i@umail2.com'),(4,'test 38','Prueba servidor','andre91c_y884i@umail2.com'),(5,'test 38','Prueba servidor','andre91c_y884i@umail2.com'),(6,'test 39','Prueba servidor','andre91c_y884i@umail2.com'),(7,'test 39','Prueba servidor','andre91c_y884i@umail2.com'),(8,'test 39','Prueba servidor','andre91c_y884i@umail2.com'),(9,'test 39','Prueba servidor','andre91c_y884i@umail2.com'),(10,'test 40','Prueba servidor','andre91c_y884i@umail2.com'),(11,'test 40','Prueba servidor','andre91c_y884i@umail2.com');
/*!40000 ALTER TABLE `tcontacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tdescarga`
--

DROP TABLE IF EXISTS `tdescarga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8;
CREATE TABLE `tdescarga` (
  `id_descarga` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `enlace` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_descarga`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tdescarga`
--

LOCK TABLES `tdescarga` WRITE;
/*!40000 ALTER TABLE `tdescarga` DISABLE KEYS */;
INSERT INTO `tdescarga` VALUES (1,'Energia sustentable','media/energia','https://test.com'),(2,'Energia sustentable 2','media/energia2.png','https://test.com');
/*!40000 ALTER TABLE `tdescarga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tdocumentos`
--

DROP TABLE IF EXISTS `tdocumentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `tdocumentos` (
  `id_doc` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `id_evento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_doc`),
  KEY `id_evento` (`id_evento`),
  CONSTRAINT `tdocumentos_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `teventos` (`id_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tdocumentos`
--

LOCK TABLES `tdocumentos` WRITE;
/*!40000 ALTER TABLE `tdocumentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tdocumentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teventos`
--

DROP TABLE IF EXISTS `teventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `teventos` (
  `id_evento` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `imagenportada` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fechapub` date DEFAULT NULL,
  `descripcionbreve` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_evento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teventos`
--

LOCK TABLES `teventos` WRITE;
/*!40000 ALTER TABLE `teventos` DISABLE KEYS */;
INSERT INTO `teventos` VALUES (1,'Energia sustentable 2','media/energia2.png','este es un texto donde se pueden agregar las cosas en el interior del evento','2019-06-23','Esta es la descripcion breve que se tiene que ingresar para todo'),(2,'Energia sustentable 2','media/energia2.png','este es un texto donde se pueden agregar las cosas en el interior del evento','2019-06-23','Esta es la descripcion breve que se tiene que ingresar para todo'),(3,'Energia sustentable 2','media/energia2.png','este es un texto donde se pueden agregar las cosas en el interior del evento','2019-06-23','Esta es la descripcion breve que se tiene que ingresar para todo');
/*!40000 ALTER TABLE `teventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teventosgaleria`
--

DROP TABLE IF EXISTS `teventosgaleria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `teventosgaleria` (
  `id_galeria` int(11) NOT NULL AUTO_INCREMENT,
  `imagen` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `id_evento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_galeria`),
  KEY `id_evento` (`id_evento`),
  CONSTRAINT `teventosgaleria_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `teventos` (`id_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teventosgaleria`
--

LOCK TABLES `teventosgaleria` WRITE;
/*!40000 ALTER TABLE `teventosgaleria` DISABLE KEYS */;
/*!40000 ALTER TABLE `teventosgaleria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timageninicio`
--

DROP TABLE IF EXISTS `timageninicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `timageninicio` (
  `id_imagen` int(11) NOT NULL AUTO_INCREMENT,
  `imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_imagen`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timageninicio`
--

LOCK TABLES `timageninicio` WRITE;
/*!40000 ALTER TABLE `timageninicio` DISABLE KEYS */;
INSERT INTO `timageninicio` VALUES (1,'/media/test.png'),(2,'/media/test2.png');
/*!40000 ALTER TABLE `timageninicio` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-23 19:06:29

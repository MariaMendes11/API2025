CREATE DATABASE  IF NOT EXISTS `vio_maria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `vio_maria`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: vio_maria
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `data_compra` datetime NOT NULL,
  `fk_id_usuario` int NOT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `fk_id_usuario` (`fk_id_usuario`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`fk_id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,'2024-11-14 19:04:00',1),(2,'2024-11-13 17:00:00',1),(3,'2024-11-12 15:30:00',2),(4,'2024-11-11 14:20:00',2),(5,'2024-11-14 19:04:00',1),(6,'2024-11-13 17:00:00',1),(7,'2024-11-12 15:30:00',2),(8,'2024-11-11 14:20:00',2),(9,'2024-11-14 19:04:00',1),(10,'2024-11-13 17:00:00',1),(11,'2024-11-12 15:30:00',2),(12,'2024-11-11 14:20:00',2),(13,'2024-11-14 19:04:00',1),(14,'2024-11-13 17:00:00',1),(15,'2024-11-12 15:30:00',2),(16,'2024-11-11 14:20:00',2),(17,'2024-11-14 19:04:00',1),(18,'2024-11-13 17:00:00',1),(19,'2024-11-12 15:30:00',2),(20,'2024-11-11 14:20:00',2),(21,'2024-11-14 19:04:00',1),(22,'2024-11-13 17:00:00',1),(23,'2024-11-12 15:30:00',2),(24,'2024-11-11 14:20:00',2),(25,'2024-11-14 19:04:00',1),(26,'2024-11-13 17:00:00',1),(27,'2024-11-12 15:30:00',2),(28,'2024-11-11 14:20:00',2),(29,'2024-11-14 19:04:00',1),(30,'2024-11-13 17:00:00',1),(31,'2024-11-12 15:30:00',2),(32,'2024-11-11 14:20:00',2),(33,'2024-11-14 19:04:00',1),(34,'2024-11-13 17:00:00',1),(35,'2024-11-12 15:30:00',2),(36,'2024-11-11 14:20:00',2);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento` (
  `id_evento` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `data_hora` datetime NOT NULL,
  `local` varchar(255) NOT NULL,
  `fk_id_organizador` int NOT NULL,
  PRIMARY KEY (`id_evento`),
  KEY `fk_id_organizador` (`fk_id_organizador`),
  CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`fk_id_organizador`) REFERENCES `organizador` (`id_organizador`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,'Festival de Verão','evento de verao','2024-12-15 00:00:00','Praia Central',1),(2,'Congresso de Tecnologia','Evento de tecnologia','2024-11-20 00:00:00','Centro de convencoes',2),(3,'Show Internacional','Evento internacional','2024-10-30 00:00:00','Arena Principal',3),(4,'Festival de Verão','evento de verao','2024-12-15 00:00:00','Praia Central',1),(5,'Congresso de Tecnologia','Evento de tecnologia','2024-11-20 00:00:00','Centro de convencoes',2),(6,'Show Internacional','Evento internacional','2024-10-30 00:00:00','Arena Principal',3),(7,'Festival de Verão','evento de verao','2024-12-15 00:00:00','Praia Central',1),(8,'Congresso de Tecnologia','Evento de tecnologia','2024-11-20 00:00:00','Centro de convencoes',2),(9,'Show Internacional','Evento internacional','2024-10-30 00:00:00','Arena Principal',3),(10,'Festival de Verão','evento de verao','2024-12-15 00:00:00','Praia Central',1),(11,'Congresso de Tecnologia','Evento de tecnologia','2024-11-20 00:00:00','Centro de convencoes',2),(12,'Show Internacional','Evento internacional','2024-10-30 00:00:00','Arena Principal',3),(13,'Festival de Verão','evento de verao','2024-12-15 00:00:00','Praia Central',1),(14,'Congresso de Tecnologia','Evento de tecnologia','2024-11-20 00:00:00','Centro de convencoes',2),(15,'Show Internacional','Evento internacional','2024-10-30 00:00:00','Arena Principal',3),(16,'Festival de Verão','evento de verao','2024-12-15 00:00:00','Praia Central',1),(17,'Congresso de Tecnologia','Evento de tecnologia','2024-11-20 00:00:00','Centro de convencoes',2),(18,'Show Internacional','Evento internacional','2024-10-30 00:00:00','Arena Principal',3),(19,'Festival de Verão','evento de verao','2024-12-15 00:00:00','Praia Central',1),(20,'Congresso de Tecnologia','Evento de tecnologia','2024-11-20 00:00:00','Centro de convencoes',2),(21,'Show Internacional','Evento internacional','2024-10-30 00:00:00','Arena Principal',3),(22,'Festival de Verão','evento de verao','2024-12-15 00:00:00','Praia Central',1),(23,'Congresso de Tecnologia','Evento de tecnologia','2024-11-20 00:00:00','Centro de convencoes',2),(24,'Show Internacional','Evento internacional','2024-10-30 00:00:00','Arena Principal',3),(25,'Festival de Verão','evento de verao','2024-12-15 00:00:00','Praia Central',1),(26,'Congresso de Tecnologia','Evento de tecnologia','2024-11-20 00:00:00','Centro de convencoes',2),(27,'Show Internacional','Evento internacional','2024-10-30 00:00:00','Arena Principal',3);
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingresso`
--

DROP TABLE IF EXISTS `ingresso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingresso` (
  `id_ingresso` int NOT NULL AUTO_INCREMENT,
  `preco` decimal(5,2) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `fk_id_evento` int NOT NULL,
  PRIMARY KEY (`id_ingresso`),
  KEY `fk_id_evento` (`fk_id_evento`),
  CONSTRAINT `ingresso_ibfk_1` FOREIGN KEY (`fk_id_evento`) REFERENCES `evento` (`id_evento`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresso`
--

LOCK TABLES `ingresso` WRITE;
/*!40000 ALTER TABLE `ingresso` DISABLE KEYS */;
INSERT INTO `ingresso` VALUES (1,500.00,'vip',1),(2,150.00,'pista',1),(3,200.00,'pista',2),(4,600.00,'vip',3),(5,250.00,'pista',3),(6,500.00,'vip',1),(7,150.00,'pista',1),(8,200.00,'pista',2),(9,600.00,'vip',3),(10,250.00,'pista',3),(11,500.00,'vip',1),(12,150.00,'pista',1),(13,200.00,'pista',2),(14,600.00,'vip',3),(15,250.00,'pista',3),(16,500.00,'vip',1),(17,150.00,'pista',1),(18,200.00,'pista',2),(19,600.00,'vip',3),(20,250.00,'pista',3),(21,500.00,'vip',1),(22,150.00,'pista',1),(23,200.00,'pista',2),(24,600.00,'vip',3),(25,250.00,'pista',3),(26,500.00,'vip',1),(27,150.00,'pista',1),(28,200.00,'pista',2),(29,600.00,'vip',3),(30,250.00,'pista',3),(31,500.00,'vip',1),(32,150.00,'pista',1),(33,200.00,'pista',2),(34,600.00,'vip',3),(35,250.00,'pista',3),(36,500.00,'vip',1),(37,150.00,'pista',1),(38,200.00,'pista',2),(39,600.00,'vip',3),(40,250.00,'pista',3),(41,500.00,'vip',1),(42,150.00,'pista',1),(43,200.00,'pista',2),(44,600.00,'vip',3),(45,250.00,'pista',3);
/*!40000 ALTER TABLE `ingresso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingresso_compra`
--

DROP TABLE IF EXISTS `ingresso_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingresso_compra` (
  `id_ingresso_compra` int NOT NULL AUTO_INCREMENT,
  `quantidade` int NOT NULL,
  `fk_id_ingresso` int NOT NULL,
  `fk_id_compra` int NOT NULL,
  PRIMARY KEY (`id_ingresso_compra`),
  KEY `fk_id_ingresso` (`fk_id_ingresso`),
  KEY `fk_id_compra` (`fk_id_compra`),
  CONSTRAINT `ingresso_compra_ibfk_1` FOREIGN KEY (`fk_id_ingresso`) REFERENCES `ingresso` (`id_ingresso`),
  CONSTRAINT `ingresso_compra_ibfk_2` FOREIGN KEY (`fk_id_compra`) REFERENCES `compra` (`id_compra`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresso_compra`
--

LOCK TABLES `ingresso_compra` WRITE;
/*!40000 ALTER TABLE `ingresso_compra` DISABLE KEYS */;
INSERT INTO `ingresso_compra` VALUES (1,5,4,1),(2,2,5,1),(3,1,1,2),(4,2,2,2),(5,5,4,1),(6,2,5,1),(7,1,1,2),(8,2,2,2),(9,5,4,1),(10,2,5,1),(11,1,1,2),(12,2,2,2),(13,5,4,1),(14,2,5,1),(15,1,1,2),(16,2,2,2),(17,5,4,1),(18,2,5,1),(19,1,1,2),(20,2,2,2),(21,5,4,1),(22,2,5,1),(23,1,1,2),(24,2,2,2),(25,5,4,1),(26,2,5,1),(27,1,1,2),(28,2,2,2),(29,5,4,1),(30,2,5,1),(31,1,1,2),(32,2,2,2),(33,5,4,1),(34,2,5,1),(35,1,1,2),(36,2,2,2);
/*!40000 ALTER TABLE `ingresso_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizador`
--

DROP TABLE IF EXISTS `organizador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizador` (
  `id_organizador` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `telefone` char(11) NOT NULL,
  PRIMARY KEY (`id_organizador`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizador`
--

LOCK TABLES `organizador` WRITE;
/*!40000 ALTER TABLE `organizador` DISABLE KEYS */;
INSERT INTO `organizador` VALUES (1,'Organização ABC','contato@abc.com','senha123','11111222333'),(2,'Eventos XYZ','info@xyz.com','senha123','11222333444'),(3,'Festivais BR','contato@festbr.com','senha123','11333444555'),(4,'Eventos GL','support@gl.com','senha123','11444555666'),(5,'Eventos JQ','contact@jq.com','senha123','11555666777');
/*!40000 ALTER TABLE `organizador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presenca`
--

DROP TABLE IF EXISTS `presenca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presenca` (
  `id_presenca` int NOT NULL AUTO_INCREMENT,
  `data_hora_checkin` datetime DEFAULT NULL,
  `fk_id_evento` int NOT NULL,
  `fk_id_compra` int NOT NULL,
  PRIMARY KEY (`id_presenca`),
  KEY `fk_id_evento` (`fk_id_evento`),
  KEY `fk_id_compra` (`fk_id_compra`),
  CONSTRAINT `presenca_ibfk_1` FOREIGN KEY (`fk_id_evento`) REFERENCES `evento` (`id_evento`),
  CONSTRAINT `presenca_ibfk_2` FOREIGN KEY (`fk_id_compra`) REFERENCES `compra` (`id_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presenca`
--

LOCK TABLES `presenca` WRITE;
/*!40000 ALTER TABLE `presenca` DISABLE KEYS */;
/*!40000 ALTER TABLE `presenca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `cpf` char(11) NOT NULL,
  `data_nascimento` date NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'João Silva','joao.silva@example.com','senha123','16123456789','1990-01-15'),(2,'Maria Oliveira','maria.oliveira@example.com','senha123','16987654321','1985-06-23'),(3,'Carlos Pereira','carlos.pereira@example.com','senha123','16123987456','1992-11-30'),(4,'Ana Souza','ana.souza@example.com','senha123','16456123789','1987-04-18'),(5,'Pedro Costa','pedro.costa@example.com','senha123','16789123456','1995-08-22'),(6,'Laura Lima','laura.lima@example.com','senha123','16321654987','1998-09-09'),(7,'Lucas Alves','lucas.alves@example.com','senha123','16654321987','1993-12-01'),(8,'Fernanda Rocha','fernanda.rocha@example.com','senha123','16741852963','1991-07-07'),(9,'Rafael Martins','rafael.martins@example.com','senha123','16369258147','1994-03-27'),(10,'Juliana Nunes','juliana.nunes@example.com','senha123','16258147369','1986-05-15'),(11,'Paulo Araujo','paulo.araujo@example.com','senha123','16159753486','1997-10-12'),(12,'Beatriz Melo','beatriz.melo@example.com','senha123','16486159753','1990-02-28'),(13,'Renato Dias','renato.dias@example.com','senha123','16753486159','1996-11-11'),(14,'Camila Ribeiro','camila.ribeiro@example.com','senha123','16963852741','1989-08-03'),(15,'Thiago Teixeira','thiago.teixeira@example.com','senha123','16852741963','1992-12-24'),(16,'Patrícia Fernandes','patricia.fernandes@example.com','senha123','16741963852','1991-01-10'),(17,'Rodrigo Gomes','rodrigo.gomes@example.com','senha123','16963741852','1987-06-30'),(18,'Mariana Batista','mariana.batista@example.com','senha123','16147258369','1998-09-22'),(19,'Fábio Freitas','fabio.freitas@example.com','senha123','16369147258','1994-04-16'),(20,'Isabela Cardoso','isabela.cardoso@example.com','senha123','16258369147','1985-11-08'),(43,'Maria Clara','mary2@exemplo.com','ssssss','16123456788','2025-02-12'),(44,'Euller','mary@werg.com','EUller#$%¨&HHH','09876543200','1999-01-07'),(107,'MAROA','ma@ma.com','senha123','12345678911','2007-10-31'),(110,'MAROA','ma@maS.com','senha123','12345678901','2000-10-25'),(114,'MAROA','ma@mS.com','senha123','12345678980','2000-10-25');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'vio_maria'
--

--
-- Dumping routines for database 'vio_maria'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-10 10:58:48

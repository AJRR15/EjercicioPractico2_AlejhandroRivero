CREATE DATABASE  IF NOT EXISTS `a` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `a`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: a
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `cargo` varchar(100) NOT NULL,
  `hotel_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id` (`hotel_id`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hoteles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Juan Pérez','Gerente General',1),(2,'María González','Recepcionista',1),(3,'Pedro Sánchez','Chef',2),(4,'Ana Ramírez','Limpieza',3);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoteles`
--

DROP TABLE IF EXISTS `hoteles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoteles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `ubicacion` varchar(100) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoteles`
--

LOCK TABLES `hoteles` WRITE;
/*!40000 ALTER TABLE `hoteles` DISABLE KEYS */;
INSERT INTO `hoteles` VALUES (1,'Hotel Conchal','Playa Conchal, Guanacaste','Un hermoso hotel ubicado en la playa Conchal.'),(2,'Hotel Avellanas','Playa Avellanas, Guanacaste','Un acogedor hotel ubicado en la playa Avellanas.'),(3,'Hotel Gregorio','Playa Gregorio, Guanacaste','Un exclusivo hotel ubicado en la playa Gregorio.');
/*!40000 ALTER TABLE `hoteles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente_nombre` varchar(100) NOT NULL,
  `num_huespedes` int NOT NULL,
  `fecha_ingreso` varchar(100) NOT NULL,
  `fecha_salida` varchar(100) NOT NULL,
  `hotel_id` int NOT NULL,
  `user` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reservas_idx` (`user`),
  KEY `hotel` (`hotel_id`),
  CONSTRAINT `hotel` FOREIGN KEY (`hotel_id`) REFERENCES `hoteles` (`id`),
  CONSTRAINT `user` FOREIGN KEY (`user`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (1,'Carlos García',2,'2024-04-15','2024-04-20',1,1),(2,'Laura Martínez',1,'2024-05-10','2024-05-15',2,2),(3,'Roberto Jiménez',4,'2024-06-20','2024-06-25',3,3),(5,'Jose,Jose Garcia',3,'2024-04-18','2024-04-20',1,1),(6,'Jose',2,'2024-04-18','2024-04-25',1,1);
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_rol`),
  KEY `idUser_idx` (`id_usuario`),
  CONSTRAINT `idUser` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (15,'ROLE_ADMIN',1),(16,'ROLE_USER',1),(17,'ROLE_USER',2),(18,'ROLE_USER',3),(19,'ROLE_USER',4),(20,'ROLE_USER',5),(21,'ROLE_USER',6),(22,'ROLE_USER',7),(23,'ROLE_USER',9),(24,'ROLE_USER',NULL),(25,'ROLE_USER',NULL),(26,'ROLE_USER',11),(27,'ROLE_USER',12);
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(512) DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellidos` varchar(30) DEFAULT NULL,
  `correo` varchar(25) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `ruta_imagen` varchar(1024) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'juan','$2a$10$P1.w58XvnaYQUQgZUCk4aO/RTRl8EValluCqB3S2VMLTbRt.tlre.','Juan','Castro Mora','jcastro@gmail.com','4556-8978','https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Juan_Diego_Madrigal.jpg/250px-Juan_Diego_Madrigal.jpg',1),(2,'rebeca','$2a$10$GkEj.ZzmQa/aEfDmtLIh3udIH5fMphx/35d0EYeqZL5uzgCJ0lQRi','Rebeca','Contreras Mora','acontreras@gmail.com','5456-8789','https://upload.wikimedia.org/wikipedia/commons/0/06/Photo_of_Rebeca_Arthur.jpg',1),(3,'pedro','$2a$10$koGR7eS22Pv5KdaVJKDcge04ZB53iMiw76.UjHPY.XyVYlYqXnPbO','Pedro','Mena Loria','lmena@gmail.com','7898-8936','https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Eduardo_de_Pedro_2019.jpg/480px-Eduardo_de_Pedro_2019.jpg?20200109230854',1),(4,'hhernan','D7+XKTc-82lUdmhwHp65p6FUHwd6N+L7fokk+83L','hector','hernandez','hector@gmail.com',NULL,NULL,0),(5,'Ale','$2a$10$QCprk1vR556qlajP5FxKNeuM17g2/lMuV69IhVUH8Ap0a9540rZHe','Ale','Rivero','a@gmail.com','89812230',NULL,0),(6,'a','$2a$10$7sqaymrHd.3QJFXvkafKHO4Pn9ZWBmKEgXSKpzYth07WWxXyWHF0.','a','a','a@gma','61166561',NULL,0),(7,'Tata','$2a$10$2RpfT.qPexvcQO3Q0G/3/ODMBTWUsPOMuRmafibLO5Q1mLVM27CSS','a','a','alexa@gmail.com','61166561',NULL,0),(9,'Diego','D5w6-6Hfv8Df-Ya57Ak0Meqkb5x40ZCzuMu0zTSB','Diego','tt','Diegott@gmail.com',NULL,NULL,1),(11,'1','$2a$10$TE5/Vi3ZxTgvl0c1WMEm6.fee4p8l.JOgVyQCCVR4aE8AcgugYPFC','1','1','1@gmail.com','89812230',NULL,1),(12,'karen','$2a$10$laRNx90YYRS1B2VQlqvKMuK0a1w019vUBqNChmR7wiepRPmqi8gZS','karen','kk','kk@gmail.com','65789012',NULL,1);
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

-- Dump completed on 2024-04-17 20:42:09

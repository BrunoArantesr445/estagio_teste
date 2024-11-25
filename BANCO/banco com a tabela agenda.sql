CREATE DATABASE  IF NOT EXISTS `controle_estagios_3` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `controle_estagios_3`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: controle_estagios_3
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `agenda`
--

DROP TABLE IF EXISTS `agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agenda` (
  `id` int NOT NULL AUTO_INCREMENT,
  `supervisor_id` int DEFAULT NULL,
  `aluno_id` int DEFAULT NULL,
  `local_id` int DEFAULT NULL,
  `horario` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supervisor_id` (`supervisor_id`),
  KEY `aluno_id` (`aluno_id`),
  KEY `local_id` (`local_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda`
--

LOCK TABLES `agenda` WRITE;
/*!40000 ALTER TABLE `agenda` DISABLE KEYS */;
INSERT INTO `agenda` VALUES (1,1,1,1,'0000-00-00 00:00:00','Ativo'),(2,2,2,2,'0000-00-00 00:00:00','Pendente'),(3,3,3,3,'0000-00-00 00:00:00','Desativo');
/*!40000 ALTER TABLE `agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alocacoes`
--

DROP TABLE IF EXISTS `alocacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alocacoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `alunos_id` int NOT NULL,
  `locais_estagio_id` int NOT NULL,
  `supervisores_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_alocacoes_alunos1_idx` (`alunos_id`),
  KEY `fk_alocacoes_locais_estagio1_idx` (`locais_estagio_id`),
  KEY `fk_alocacoes_supervisores1_idx` (`supervisores_id`),
  CONSTRAINT `fk_alocacoes_alunos1` FOREIGN KEY (`alunos_id`) REFERENCES `alunos` (`id`),
  CONSTRAINT `fk_alocacoes_locais_estagio1` FOREIGN KEY (`locais_estagio_id`) REFERENCES `locais_estagio` (`id`),
  CONSTRAINT `fk_alocacoes_supervisores1` FOREIGN KEY (`supervisores_id`) REFERENCES `supervisores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alocacoes`
--

LOCK TABLES `alocacoes` WRITE;
/*!40000 ALTER TABLE `alocacoes` DISABLE KEYS */;
INSERT INTO `alocacoes` VALUES (1,0,0,0),(2,0,0,0),(3,0,0,0),(4,0,0,0);
/*!40000 ALTER TABLE `alocacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alunos`
--

DROP TABLE IF EXISTS `alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alunos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `disponibilidade_horario` enum('Manhã','Tarde','Noite','Manhã e Tarde','Manhã e Noite','Tarde e Noite') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fase_estagio` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `cpf` varchar(45) DEFAULT NULL,
  `turma` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `carga_horaria` varchar(45) DEFAULT NULL COMMENT 'status - ativo, pendente, concluido',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alunos`
--

LOCK TABLES `alunos` WRITE;
/*!40000 ALTER TABLE `alunos` DISABLE KEYS */;
INSERT INTO `alunos` VALUES (1,'teste2111','Manhã','1ª Fase','teste2111@teste.com','3622-0685','123456789','Tec Enfermagem','xxx','60h'),(2,'MARCELO','Tarde','UC10','MARCELO@MARCELO.COM','456789132','05805210510','ADM DADOS','ATIVO','50H'),(3,'bia marijuana','Manhã e Tarde','UC17','bia@erva.com','456789','080645123','tec info','ativassa','100'),(4,'marcelo21','Noite','UC10','marcelo21@marcelo.com','54864321','864651684','tec','ativo','1100'),(5,'x','Noite','UC4','y@y.com','864654','21321','ADM DADOS','ATIVO','60h'),(6,'x','Manhã','UC7','joao@joao.com','3622-0685','05805210510','ADM DADOS','ATIVO','60h');
/*!40000 ALTER TABLE `alunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escala`
--

DROP TABLE IF EXISTS `escala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escala` (
  `idescala` int NOT NULL,
  `data_inicio` varchar(45) DEFAULT NULL,
  `data_fim` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idescala`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escala`
--

LOCK TABLES `escala` WRITE;
/*!40000 ALTER TABLE `escala` DISABLE KEYS */;
/*!40000 ALTER TABLE `escala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fases`
--

DROP TABLE IF EXISTS `fases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fases`
--

LOCK TABLES `fases` WRITE;
/*!40000 ALTER TABLE `fases` DISABLE KEYS */;
/*!40000 ALTER TABLE `fases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locais_estagio`
--

DROP TABLE IF EXISTS `locais_estagio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locais_estagio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `local` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `departamento` varchar(100) NOT NULL,
  `limite_vagas` int NOT NULL,
  `horario_disponivel` enum('Manhã','Tarde','Noite','Manhã e Tarde','Manhã e Noite','Tarde e Noite') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `especialidade` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fase_estagio` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `supervisores_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_locais_estagio_supervisores_idx` (`supervisores_id`),
  CONSTRAINT `fk_locais_estagio_supervisores` FOREIGN KEY (`supervisores_id`) REFERENCES `supervisores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locais_estagio`
--

LOCK TABLES `locais_estagio` WRITE;
/*!40000 ALTER TABLE `locais_estagio` DISABLE KEYS */;
/*!40000 ALTER TABLE `locais_estagio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `local`
--

DROP TABLE IF EXISTS `local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `local` (
  `id` int NOT NULL AUTO_INCREMENT,
  `instituicao` varchar(100) NOT NULL,
  `especialidade` varchar(45) DEFAULT NULL,
  `departamento` varchar(45) DEFAULT NULL,
  `turno` varchar(45) DEFAULT NULL,
  `disponibilidade` varchar(45) DEFAULT NULL,
  `observacao` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local`
--

LOCK TABLES `local` WRITE;
/*!40000 ALTER TABLE `local` DISABLE KEYS */;
INSERT INTO `local` VALUES (1,'Brisa','jovens superdotados','Senac','integral','total','Teste2211'),(2,'Bia Brisa','jovens superdotados','NA','integral','total','Só por hoje!'),(3,'Arantes','Atormentar a Brisa','xmen revolution','integral','total','Show!');
/*!40000 ALTER TABLE `local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisores`
--

DROP TABLE IF EXISTS `supervisores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supervisores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `disponibilidade_horario` enum('Manhã','Tarde','Noite','Manhã e Tarde','Manhã e Noite','Tarde e Noite') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `especialidade` varchar(100) NOT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `carga_horaria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisores`
--

LOCK TABLES `supervisores` WRITE;
/*!40000 ALTER TABLE `supervisores` DISABLE KEYS */;
INSERT INTO `supervisores` VALUES (1,'marcelocss','Noite','atasanar','3622-0685','atasanar'),(2,'teste final','Noite','jovens superdotados','3622-0685','jovens superdotados'),(3,'y','Noite','jovens superdotados','456789','jovens superdotados');
/*!40000 ALTER TABLE `supervisores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-23 17:09:16

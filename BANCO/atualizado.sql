CREATE DATABASE  IF NOT EXISTS `controle_estagios_3` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `controle_estagios_3`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 172.16.42.54    Database: controle_estagios_3
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Temporary view structure for view `agenda_dia`
--

DROP TABLE IF EXISTS `agenda_dia`;
/*!50001 DROP VIEW IF EXISTS `agenda_dia`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `agenda_dia` AS SELECT 
 1 AS `id`,
 1 AS `inicio`,
 1 AS `local`,
 1 AS `fim`,
 1 AS `turno`,
 1 AS `empresa`,
 1 AS `supervisor_id`,
 1 AS `total_alunos`,
 1 AS `qtd_dia`,
 1 AS `carga_horaria`,
 1 AS `data_hora`,
 1 AS `UC`,
 1 AS `id_locais_estagio`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `alunos`
--

DROP TABLE IF EXISTS `alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alunos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `cpf` varchar(45) DEFAULT NULL,
  `fase_estagio` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `turno_disponivel` enum('Manhã','Tarde','Noite','Manhã e Tarde','Manhã e Noite','Tarde e Noite') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `carga_horaria` varchar(45) DEFAULT NULL COMMENT 'status - ativo, pendente, concluido',
  `turma` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alunos`
--

LOCK TABLES `alunos` WRITE;
/*!40000 ALTER TABLE `alunos` DISABLE KEYS */;
INSERT INTO `alunos` VALUES (1,'kaua','kaua@exemplo.com','525625814','14125311','uc4','Manhã','ativo','30','12'),(2,'samul','samul@exemplo.com','6454545666','4864686666','uc4','Manhã','ativo','30','10'),(3,'julia','julia@exemplo.com','1614551452','154545211','uc4','Tarde','ativo','60','10'),(9,'João Silva','joao@example.com','123456789','123.456.789-00','uc4','Manhã','Ativo','30h','Turma A'),(10,'Maria Oliveira','maria@example.com','987654321','987.654.321-00','uc7','Tarde','Ativo','20h','Turma B'),(11,'Carlos Pereira','carlos@example.com','123123123','321.654.987-00','uc7','Manhã e Tarde','Pendente','40h','Turma C'),(12,'Ana Costa','ana@example.com','456456456','654.321.987-00','uc11','Noite','Concluído','30h','Turma D'),(13,'Lucas Martins','lucas@example.com','654654654','987.123.456-00','uc11','Manhã','Ativo','15h','Turma A'),(14,'Fernanda Lima','fernanda@example.com','789789789','456.789.123-00','uc17','Tarde','Ativo','25h','Turma B'),(15,'Pedro Santos','pedro@example.com','321321321','789.123.456-00','uc17','Noite','Pendente','35h','Turma C'),(16,'Juliana Rocha','juliana@example.com','654123987','123.987.654-00','uc11','Manhã e Noite','Ativo','45h','Turma D'),(17,'Roberto Almeida','roberto@example.com','987321456','654.321.987-00','uc7','Tarde','Concluído','20h','Turma A'),(18,'Tatiane Ferreira','tatiane@example.com','147258369','789.654.321-00','uc17','Manhã','Ativo','30h','Turma B'),(19,'João Silva','joao.silva@example.com','99999-0001','123.456.789-00','uc7','Manhã','ativo','20h','Turma A'),(20,'Maria Oliveira','maria.oliveira@example.com','99999-0002','987.654.321-00','uc17','Tarde','pendente','30h','Turma B'),(21,'Carlos Souza','carlos.souza@example.com','99999-0003','456.789.123-00','uc17','Noite','concluido','40h','Turma C'),(22,'Ana Costa','ana.costa@example.com','99999-0004','321.654.987-00','uc11','Manhã e Tarde','ativo','25h','Turma D'),(23,'Rafael Lima','rafael.lima@example.com','99999-0005','159.753.852-00','uc17','Manhã e Noite','pendente','30h','Turma E'),(24,'Fernanda Mendes','fernanda.mendes@example.com','99999-0006','258.369.147-00','uc7','Tarde e Noite','concluido','35h','Turma F'),(25,'Pedro Alves','pedro.alves@example.com','99999-0007','357.951.654-00','uc17','Manhã','ativo','20h','Turma G'),(26,'Juliana Santos','juliana.santos@example.com','99999-0008','654.789.321-00','uc4','Tarde','pendente','25h','Turma H'),(27,'Bruno Ferreira','bruno.ferreira@example.com','99999-0009','159.753.852-01','uc4','Noite','concluido','40h','Turma I'),(28,'Mariana Carvalho','mariana.carvalho@example.com','99999-0010','963.852.741-00','uc7','Manhã e Tarde','ativo','30h','Turma J'),(29,'sdfsdf',NULL,NULL,NULL,'uc4','Manhã',NULL,NULL,NULL),(30,'bia',NULL,NULL,NULL,'uc7','Manhã',NULL,NULL,NULL),(31,'jose',NULL,NULL,NULL,'uc7','Manhã',NULL,NULL,NULL),(32,'rob',NULL,NULL,NULL,'uc7','Manhã',NULL,NULL,NULL),(34,'roy','roy.gmail.com','99999-0110','357.151.654-00','uc7','Tarde e Noite','ativo','25h','Turma H');
/*!40000 ALTER TABLE `alunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escala`
--

DROP TABLE IF EXISTS `escala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escala` (
  `id` int NOT NULL AUTO_INCREMENT,
  `inicio` varchar(45) DEFAULT NULL,
  `local` varchar(45) DEFAULT NULL,
  `fim` varchar(45) DEFAULT NULL,
  `turno` varchar(45) DEFAULT NULL,
  `empresa` varchar(45) DEFAULT NULL,
  `supervisor_id` int NOT NULL,
  `total_alunos` varchar(45) DEFAULT NULL,
  `qtd_dia` varchar(45) DEFAULT NULL,
  `carga_horaria` varchar(45) DEFAULT NULL,
  `data_hora` varchar(45) DEFAULT NULL,
  `UC` varchar(45) DEFAULT NULL,
  `id_locais_estagio` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_escala_supervisor1_idx` (`supervisor_id`),
  KEY `id_local_estagio_idx` (`id_locais_estagio`),
  CONSTRAINT `fk_escala_supervisor1` FOREIGN KEY (`supervisor_id`) REFERENCES `supervisor` (`id`),
  CONSTRAINT `id_local_estagio` FOREIGN KEY (`id_locais_estagio`) REFERENCES `locais_estagio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escala`
--

LOCK TABLES `escala` WRITE;
/*!40000 ALTER TABLE `escala` DISABLE KEYS */;
INSERT INTO `escala` VALUES (1,'2024-02-05','santa casa','24-12-24','manha','santa casa',1,'13','1','42','06:00-13:00','uc4',1);
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
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fases`
--

LOCK TABLES `fases` WRITE;
/*!40000 ALTER TABLE `fases` DISABLE KEYS */;
INSERT INTO `fases` VALUES (1,'uc4'),(2,'uc7'),(3,'uc4'),(5,'UC4'),(6,'UC7'),(7,'UC10'),(8,'UC17'),(9,'UC1'),(10,'UC2'),(11,'UC3'),(12,'UC5'),(13,'UC6'),(14,'UC8'),(15,'Inicial'),(16,'Intermediária'),(17,'Final'),(18,'Concluída'),(19,'Pendente');
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
  `turno` enum('Manhã','Tarde','Noite','Manhã e Tarde','Manhã e Noite','Tarde e Noite') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `especialidade` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fase_estagio` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locais_estagio`
--

LOCK TABLES `locais_estagio` WRITE;
/*!40000 ALTER TABLE `locais_estagio` DISABLE KEYS */;
INSERT INTO `locais_estagio` VALUES (1,'HCI','pronto atendimentoo',9,'Manhã','pronto atendimento','uc4'),(2,'HCI','UTI',4,'Manhã','urgencias','uc7'),(3,'HCI','Tecnologia',3,'Manhã','Gestão de Pessoas','UC4'),(4,'HCI','Saúde',4,'Manhã','Desenvolvimento','UC7'),(5,'HCI','Administração',5,'Manhã','Marketing Digital','UC10'),(6,'HCI','Engenharia',6,'Manhã','Gestão Empresarial','UC17'),(7,'HCI','Design',7,'Manhã','Administração Hospitalar','UC1'),(8,'HCI','Educação',8,'Manhã','Ensino','UC2'),(9,'HCI','Direito',9,'Manhã','Engenharia Civil','UC3'),(10,'HCI','Saúde',10,'Manhã','Design Gráfico','UC5'),(11,'HCI','Gastronomia',11,'Manhã','Logística Empresarial','UC6'),(12,'HCI','Marketing',12,'Manhã','Gestão Financeira','UC8'),(13,'Hospital São José','Pediatria',5,'Manhã','Medicina','Inicial'),(14,'Clínica Saúde Total','Fisioterapia',3,'Tarde','Fisioterapia','Intermediária'),(15,'Escola Municipal ABC','Educação',2,'Noite','Pedagogia','Final'),(16,'Universidade Federal','Pesquisa',4,'Manhã e Tarde','Biologia','Inicial'),(17,'Centro Tecnológico','Engenharia',6,'Manhã e Noite','Engenharia Civil','Intermediária'),(18,'Clínica Bem Viver','Psicologia',3,'Tarde e Noite','Psicologia','Final'),(19,'Laboratório XYZ','Análises Clínicas',4,'Manhã','Farmácia','Inicial'),(20,'Escola Estadual DEF','Ensino Médio',2,'Tarde','Educação Física','Intermediária'),(21,'Instituto de Pesquisa','Ciência',5,'Noite','Química','Final'),(22,'Hospital Geral','Urgência',6,'Manhã e Tarde','Enfermagem','Inicial');
/*!40000 ALTER TABLE `locais_estagio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nova_alocacoes`
--

DROP TABLE IF EXISTS `nova_alocacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nova_alocacoes` (
  `idnova_alocacoes` int NOT NULL AUTO_INCREMENT,
  `alunos_id` int NOT NULL,
  `locais_estagio_id` int NOT NULL,
  `supervisor_id1` int NOT NULL,
  PRIMARY KEY (`idnova_alocacoes`),
  UNIQUE KEY `idnova_alocacoes_UNIQUE` (`idnova_alocacoes`),
  KEY `fk_nova_alocacoes_alunos1_idx` (`alunos_id`),
  KEY `fk_nova_alocacoes_locais_estagio1_idx` (`locais_estagio_id`),
  KEY `fk_nova_alocacoes_supervisor1_idx1` (`supervisor_id1`),
  CONSTRAINT `fk_nova_alocacoes_alunos1` FOREIGN KEY (`alunos_id`) REFERENCES `alunos` (`id`),
  CONSTRAINT `fk_nova_alocacoes_locais_estagio1` FOREIGN KEY (`locais_estagio_id`) REFERENCES `locais_estagio` (`id`),
  CONSTRAINT `fk_nova_alocacoes_supervisor1` FOREIGN KEY (`supervisor_id1`) REFERENCES `supervisor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nova_alocacoes`
--

LOCK TABLES `nova_alocacoes` WRITE;
/*!40000 ALTER TABLE `nova_alocacoes` DISABLE KEYS */;
INSERT INTO `nova_alocacoes` VALUES (1,1,1,0),(2,24,18,0),(3,2,4,0),(4,26,20,0),(5,2,1,0),(6,2,20,0);
/*!40000 ALTER TABLE `nova_alocacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `id` int NOT NULL AUTO_INCREMENT,
  `escala_id` int NOT NULL,
  `data` varchar(45) DEFAULT NULL,
  `alunos_id` int NOT NULL,
  `supervisor_id` int NOT NULL,
  `fatla` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_reserva_escala1_idx` (`escala_id`),
  KEY `fk_reserva_alunos1_idx` (`alunos_id`),
  KEY `fk_reserva_supervisor1_idx` (`supervisor_id`),
  CONSTRAINT `fk_reserva_alunos1` FOREIGN KEY (`alunos_id`) REFERENCES `alunos` (`id`),
  CONSTRAINT `fk_reserva_escala1` FOREIGN KEY (`escala_id`) REFERENCES `escala` (`id`),
  CONSTRAINT `fk_reserva_supervisor1` FOREIGN KEY (`supervisor_id`) REFERENCES `supervisor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id` int NOT NULL,
  `id_aluno` int NOT NULL,
  `horas_cumpridas` varchar(45) DEFAULT NULL,
  `horas_faltada` varchar(45) DEFAULT NULL,
  `horas_repostas` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_idx` (`id_aluno`),
  CONSTRAINT `id_aluno` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisor`
--

DROP TABLE IF EXISTS `supervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supervisor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `disponibilidade_horario` enum('Manhã','Tarde','Noite','Manhã e Tarde','Manhã e Noite','Tarde e Noite') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `especialidade` varchar(100) NOT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `carga_horaria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisor`
--

LOCK TABLES `supervisor` WRITE;
/*!40000 ALTER TABLE `supervisor` DISABLE KEYS */;
INSERT INTO `supervisor` VALUES (1,'igor','Manhã','uc4','216354532','30'),(2,'fabio','Tarde','uc7','35412135','20'),(3,'fabio','Tarde','uc11','888999001','20h'),(4,'Professor A','Manhã','uc17','111222333','20h'),(5,'Professor B','Tarde','uc17','444555666','30h'),(6,'Professor C','Noite','uc7','777888999','25h'),(7,'Professor D','Manhã e Tarde','uc7','000111222','40h'),(8,'Professor E','Tarde','uc17','333444555','15h'),(9,'Professor F','Manhã','uc17','666777888','35h'),(10,'Professor G','Noite','uc7','999000111','30h'),(11,'Professor H','Manhã e Tarde','uc7','222333444','20h'),(12,'Professor I','Tarde','uc17','555666777','25h'),(13,'Professor J','Noite','uc17','888999000','30h'),(14,'Prof. André Silva','Manhã','uc17','98888-1111','40h'),(15,'Prof. Beatriz Souza','Tarde','uc4','98888-2222','30h'),(16,'Prof. Carlos Santos','Noite','uc4','98888-3333','20h'),(17,'Prof. Daniela Almeida','Manhã e Tarde','uc4','98888-4444','35h'),(18,'Prof. Eduardo Gomes','Manhã e Noite','uc11','98888-5555','30h'),(19,'Prof. Fernanda Rocha','Tarde e Noite','uc4','98888-6666','40h'),(20,'Prof. Gustavo Martins','Manhã','uc4','98888-7777','25h'),(21,'Prof. Helena Oliveira','Tarde','uc4','98888-8888','20h'),(22,'Prof. Igor Correia','Noite','uc11','98888-9999','30h'),(23,'Prof. Júlia Nascimento','Manhã e Tarde','uc7','98888-0000','35h'),(24,'teteu','Manhã','uc7',NULL,NULL),(25,'igor2','Manhã','med ','1489652','12');
/*!40000 ALTER TABLE `supervisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `agenda_dia`
--

/*!50001 DROP VIEW IF EXISTS `agenda_dia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`administrador`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `agenda_dia` AS select `escala`.`id` AS `id`,`escala`.`inicio` AS `inicio`,`escala`.`local` AS `local`,`escala`.`fim` AS `fim`,`escala`.`turno` AS `turno`,`escala`.`empresa` AS `empresa`,`escala`.`supervisor_id` AS `supervisor_id`,`escala`.`total_alunos` AS `total_alunos`,`escala`.`qtd_dia` AS `qtd_dia`,`escala`.`carga_horaria` AS `carga_horaria`,`escala`.`data_hora` AS `data_hora`,`escala`.`UC` AS `UC`,`escala`.`id_locais_estagio` AS `id_locais_estagio` from `escala` where (`escala`.`inicio` = '2024-02-05') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-25 10:54:54

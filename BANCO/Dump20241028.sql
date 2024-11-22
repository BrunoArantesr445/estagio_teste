CREATE DATABASE  IF NOT EXISTS `controle_estagios_3` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `controle_estagios_3`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: controle_estagios_3
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
-- Table structure for table `alocacoes`
--

DROP TABLE IF EXISTS `alocacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alocacoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `local` varchar(45) DEFAULT NULL,
  `departamento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alocacoes`
--

LOCK TABLES `alocacoes` WRITE;
/*!40000 ALTER TABLE `alocacoes` DISABLE KEYS */;
INSERT INTO `alocacoes` VALUES (1,NULL,NULL,NULL),(2,NULL,NULL,NULL),(6,'arantes','hci','pediatria'),(7,'igor','senac','ti'),(8,'elaine','senac','ti');
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alunos`
--

LOCK TABLES `alunos` WRITE;
/*!40000 ALTER TABLE `alunos` DISABLE KEYS */;
INSERT INTO `alunos` VALUES (1,'kaua','Manhã','uc4','kaua@exemplo.com','525625814','14125311','12','ativo','30'),(2,'samuel','Noite','uc7','samuel@exemplo.com','645454566','4864686876','12','pendente','45'),(3,'julia','Tarde','uc4','julia@exemplo.com','1614551452','154545211','10','ativo','60'),(9,'João Silva','Manhã','1º Semestre','joao@example.com','123456789','123.456.789-00','Turma A','Ativo','30h'),(10,'Maria Oliveira','Tarde','2º Semestre','maria@example.com','987654321','987.654.321-00','Turma B','Ativo','20h'),(11,'Carlos Pereira','Manhã e Tarde','3º Semestre','carlos@example.com','123123123','321.654.987-00','Turma C','Pendente','40h'),(12,'Ana Costa','Noite','4º Semestre','ana@example.com','456456456','654.321.987-00','Turma D','Concluído','30h'),(13,'Lucas Martins','Manhã','1º Semestre','lucas@example.com','654654654','987.123.456-00','Turma A','Ativo','15h'),(14,'Fernanda Lima','Tarde','2º Semestre','fernanda@example.com','789789789','456.789.123-00','Turma B','Ativo','25h'),(15,'Pedro Santos','Noite','3º Semestre','pedro@example.com','321321321','789.123.456-00','Turma C','Pendente','35h'),(16,'Juliana Rocha','Manhã e Noite','4º Semestre','juliana@example.com','654123987','123.987.654-00','Turma D','Ativo','45h'),(17,'Roberto Almeida','Tarde','1º Semestre','roberto@example.com','987321456','654.321.987-00','Turma A','Concluído','20h'),(18,'Tatiane Ferreira','Manhã','2º Semestre','tatiane@example.com','147258369','789.654.321-00','Turma B','Ativo','30h'),(19,'João Silva','Manhã','Inicial','joao.silva@example.com','99999-0001','123.456.789-00','Turma A','ativo','20h'),(20,'Maria Oliveira','Tarde','Intermediária','maria.oliveira@example.com','99999-0002','987.654.321-00','Turma B','pendente','30h'),(21,'Carlos Souza','Noite','Final','carlos.souza@example.com','99999-0003','456.789.123-00','Turma C','concluido','40h'),(22,'Ana Costa','Manhã e Tarde','Inicial','ana.costa@example.com','99999-0004','321.654.987-00','Turma D','ativo','25h'),(23,'Rafael Lima','Manhã e Noite','Intermediária','rafael.lima@example.com','99999-0005','159.753.852-00','Turma E','pendente','30h'),(24,'Fernanda Mendes','Tarde e Noite','Final','fernanda.mendes@example.com','99999-0006','258.369.147-00','Turma F','concluido','35h'),(25,'Pedro Alves','Manhã','Inicial','pedro.alves@example.com','99999-0007','357.951.654-00','Turma G','ativo','20h'),(26,'Juliana Santos','Tarde','Intermediária','juliana.santos@example.com','99999-0008','654.789.321-00','Turma H','pendente','25h'),(27,'Bruno Ferreira','Noite','Final','bruno.ferreira@example.com','99999-0009','789.654.321-00','Turma I','concluido','40h'),(28,'Mariana Carvalho','Manhã e Tarde','Inicial','mariana.carvalho@example.com','99999-0010','963.852.741-00','Turma J','ativo','30h'),(29,'sdfsdf','Manhã','1',NULL,NULL,NULL,NULL,NULL,NULL),(30,'bia','Manhã','1',NULL,NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `escala` VALUES (1,'30/10/24','30/12/24'),(2,'30/12/24','30/02/25'),(3,'2024-01-01','2024-01-31'),(4,'2024-02-01','2024-02-28'),(5,'2024-03-01','2024-03-31'),(6,'2024-04-01','2024-04-30'),(7,'2024-05-01','2024-05-31'),(8,'2024-06-01','2024-06-30'),(9,'2024-07-01','2024-07-31'),(10,'2024-08-01','2024-08-31'),(11,'2024-09-01','2024-09-30'),(12,'2024-10-01','2024-10-31');
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
  `horario_disponivel` enum('Manhã','Tarde','Noite','Manhã e Tarde','Manhã e Noite','Tarde e Noite') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
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
INSERT INTO `locais_estagio` VALUES (1,'HCI','pronto atendimentoo',9,'Manhã','pronto atendimento','uc4'),(2,'HCI','UTI',4,'Manhã','urgencias','uc7'),(3,'HCI','Tecnologia',3,'Manhã','Gestão de Pessoas','UC4'),(4,'HCI','Saúde',4,'Manhã','Desenvolvimento','UC7'),(5,'HCI','Administração',5,'Manhã','Marketing Digital','UC10'),(6,'HCI','Engenharia',6,'Manhã','Gestão Empresarial','UC17'),(7,'HCI','Design',7,'Manhã','Administração Hospitalar','UC1'),(8,'HCI','Educação',8,'Manhã','Ensino','UC2'),(9,'HCI','Direito',9,'Manhã','Engenharia Civil','UC3'),(10,'HCI','Saúde',10,'Manhã','Design Gráfico','UC5'),(11,'HCI','Gastronomia',11,'Manhã','Logística Empresarial','UC6'),(12,'HCI','Marketing',12,'Manhã','Gestão Financeira','UC8'),(127,'Hospital São José','Pediatria',5,'Manhã','Medicina','Inicial'),(128,'Clínica Saúde Total','Fisioterapia',3,'Tarde','Fisioterapia','Intermediária'),(129,'Escola Municipal ABC','Educação',2,'Noite','Pedagogia','Final'),(130,'Universidade Federal','Pesquisa',4,'Manhã e Tarde','Biologia','Inicial'),(131,'Centro Tecnológico','Engenharia',6,'Manhã e Noite','Engenharia Civil','Intermediária'),(132,'Clínica Bem Viver','Psicologia',3,'Tarde e Noite','Psicologia','Final'),(133,'Laboratório XYZ','Análises Clínicas',4,'Manhã','Farmácia','Inicial'),(134,'Escola Estadual DEF','Ensino Médio',2,'Tarde','Educação Física','Intermediária'),(135,'Instituto de Pesquisa','Ciência',5,'Noite','Química','Final'),(136,'Hospital Geral','Urgência',6,'Manhã e Tarde','Enfermagem','Inicial');
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
  `observacao` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `especialidade` varchar(45) DEFAULT NULL,
  `departamento` varchar(45) DEFAULT NULL,
  `turno` varchar(45) DEFAULT NULL,
  `disponibilidade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local`
--

LOCK TABLES `local` WRITE;
/*!40000 ALTER TABLE `local` DISABLE KEYS */;
INSERT INTO `local` VALUES (1,'HCI','.','pronto atendimento','pronto socorro','manha/tarde','7 a 5'),(2,'HCI','.','UTI','emergencias','noite','6 a 12'),(3,'santa casa','.','pronto atendimento','pronto socorro','tarde','12 a 5'),(6,'Instituto A','Curso de Tecnologias','TI','Tecnologia','Manhã','Disponível'),(7,'Instituto B','Curso de Saúde','Enfermagem','Saúde','Tarde','Disponível'),(8,'Instituto C','Curso de Administração','Gestão','Administração','Noite','Disponível'),(9,'Instituto D','Curso de Engenharia','Civil','Engenharia','Manhã e Tarde','Disponível'),(10,'Instituto E','Curso de Design','Gráfico','Design','Tarde','Disponível'),(11,'Instituto F','Curso de Educação','Ensino','Educação','Noite','Disponível'),(12,'Instituto G','Curso de Direito','Jurídico','Direito','Manhã','Disponível'),(13,'Instituto H','Curso de Psicologia','Psicologia','Saúde','Tarde','Disponível'),(14,'Instituto I','Curso de Gastronomia','Culinária','Gastronomia','Noite','Disponível'),(15,'Instituto J','Curso de Marketing','Digital','Marketing','Manhã e Tarde','Disponível'),(16,'Hospital Santa Maria','Hospital de grande porte com especialidade em cardiologia.','Cardiologia','Saúde','Manhã','Segunda a Sexta'),(17,'Clínica Vida Saudável','Clínica de atendimento ambulatorial com foco em ortopedia.','Ortopedia','Clínica','Tarde','Segunda a Sábado'),(18,'Escola Técnica Profissional','Instituição de ensino técnico com foco em informática.','Informática','Educação','Noite','Segunda a Sexta'),(19,'Universidade Estadual','Instituição de ensino superior com cursos em diversas áreas.','Biologia','Ciências','Manhã e Tarde','Segunda a Sábado'),(20,'Laboratório Análises XYZ','Laboratório especializado em análises clínicas.','Análises Clínicas','Saúde','Manhã','Segunda a Sexta'),(21,'Centro de Reabilitação Física','Centro de fisioterapia especializado em reabilitação motora.','Fisioterapia','Reabilitação','Tarde','Segunda a Sábado'),(22,'Escola Municipal da Paz','Escola de ensino fundamental com especialização em educação física.','Educação Física','Educação','Noite','Segunda a Sexta'),(23,'Hospital Central','Hospital de urgência e emergência com plantões 24 horas.','Urgência e Emergência','Saúde','Manhã e Noite','Todos os dias'),(24,'Centro de Pesquisa Avançada','Centro especializado em pesquisa em química.','Química','Ciências Exatas','Tarde','Segunda a Sexta'),(25,'Escola Estadual Nova Era','Escola de ensino médio com foco em artes e cultura.','Artes','Educação','Manhã e Tarde','Segunda a Sexta'),(26,'teste','testando',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professores`
--

DROP TABLE IF EXISTS `professores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `disponibilidade_horario` enum('Manhã','Tarde','Noite','Manhã e Tarde','Manhã e Noite','Tarde e Noite') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `especialidade` varchar(100) NOT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `carga_horaria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professores`
--

LOCK TABLES `professores` WRITE;
/*!40000 ALTER TABLE `professores` DISABLE KEYS */;
INSERT INTO `professores` VALUES (1,'igor','Manhã','pronto socorro','216354532','30'),(2,'fabio','Tarde','Urgencias','35412135','20'),(3,'fabio','Tarde','Direito','888999001','20h'),(4,'Professor A','Manhã','Gestão','111222333','20h'),(5,'Professor B','Tarde','Engenharia','444555666','30h'),(6,'Professor C','Noite','Marketing','777888999','25h'),(7,'Professor D','Manhã e Tarde','Saúde','000111222','40h'),(8,'Professor E','Tarde','Educação','333444555','15h'),(9,'Professor F','Manhã','TI','666777888','35h'),(10,'Professor G','Noite','Design','999000111','30h'),(11,'Professor H','Manhã e Tarde','Gastronomia','222333444','20h'),(12,'Professor I','Tarde','Direito','555666777','25h'),(13,'Professor J','Noite','Psicologia','888999000','30h'),(14,'Prof. André Silva','Manhã','Matemática','98888-1111','40h'),(15,'Prof. Beatriz Souza','Tarde','Português','98888-2222','30h'),(16,'Prof. Carlos Santos','Noite','Física','98888-3333','20h'),(17,'Prof. Daniela Almeida','Manhã e Tarde','Química','98888-4444','35h'),(18,'Prof. Eduardo Gomes','Manhã e Noite','Biologia','98888-5555','30h'),(19,'Prof. Fernanda Rocha','Tarde e Noite','Geografia','98888-6666','40h'),(20,'Prof. Gustavo Martins','Manhã','História','98888-7777','25h'),(21,'Prof. Helena Oliveira','Tarde','Inglês','98888-8888','20h'),(22,'Prof. Igor Correia','Noite','Educação Física','98888-9999','30h'),(23,'Prof. Júlia Nascimento','Manhã e Tarde','Artes','98888-0000','35h'),(24,'teteu','Manhã','pediatria',NULL,NULL);
/*!40000 ALTER TABLE `professores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-28 10:15:11

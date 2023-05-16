-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mercado
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Higiene Pessoal'),(2,'Limpeza'),(3,'Cama, mesa e banho'),(4,'Frios e Laticinios'),(5,'Carnes');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `data_venda`
--

DROP TABLE IF EXISTS `data_venda`;
/*!50001 DROP VIEW IF EXISTS `data_venda`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `data_venda` AS SELECT 
 1 AS `data_venda`,
 1 AS `descricao`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `idproduto` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  `preco` decimal(5,2) DEFAULT NULL,
  `idcategoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`idproduto`),
  KEY `fkcategoria` (`idcategoria`),
  CONSTRAINT `fkcategoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Escova dental',3.50,1),(2,'Creme dental',2.90,1),(3,'Presunto',4.99,4),(4,'Lençol 180 fios',85.80,3),(5,'Desinfetante',6.99,2);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `quantidade_de_vendas`
--

DROP TABLE IF EXISTS `quantidade_de_vendas`;
/*!50001 DROP VIEW IF EXISTS `quantidade_de_vendas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `quantidade_de_vendas` AS SELECT 
 1 AS `Quant_vendas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `total_de_vendas_por_produto`
--

DROP TABLE IF EXISTS `total_de_vendas_por_produto`;
/*!50001 DROP VIEW IF EXISTS `total_de_vendas_por_produto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `total_de_vendas_por_produto` AS SELECT 
 1 AS `Id_Produto`,
 1 AS `Descricao`,
 1 AS `Total_Itens_vendidos`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas` (
  `idvenda` int(11) NOT NULL AUTO_INCREMENT,
  `data_venda` date DEFAULT NULL,
  PRIMARY KEY (`idvenda`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
INSERT INTO `vendas` VALUES (1,'2021-01-23'),(2,'2021-11-04'),(3,'2021-07-07'),(4,'2021-07-08'),(5,'2021-07-09'),(6,'2021-07-10');
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas_has_produto`
--

DROP TABLE IF EXISTS `vendas_has_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas_has_produto` (
  `idvenda` int(11) NOT NULL,
  `idproduto` int(11) NOT NULL,
  `quantidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`idvenda`,`idproduto`),
  KEY `fkproduto` (`idproduto`),
  CONSTRAINT `fkproduto` FOREIGN KEY (`idproduto`) REFERENCES `produto` (`idproduto`),
  CONSTRAINT `fkvenda` FOREIGN KEY (`idvenda`) REFERENCES `vendas` (`idvenda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas_has_produto`
--

LOCK TABLES `vendas_has_produto` WRITE;
/*!40000 ALTER TABLE `vendas_has_produto` DISABLE KEYS */;
INSERT INTO `vendas_has_produto` VALUES (1,1,5),(1,2,2),(1,4,6),(2,1,2),(3,1,4),(3,4,1),(4,1,3),(4,2,2),(5,4,4),(6,2,1);
/*!40000 ALTER TABLE `vendas_has_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mercado'
--

--
-- Dumping routines for database 'mercado'
--

--
-- Final view structure for view `data_venda`
--

/*!50001 DROP VIEW IF EXISTS `data_venda`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `data_venda` AS select `v`.`data_venda` AS `data_venda`,`p`.`descricao` AS `descricao` from ((`vendas` `v` join `vendas_has_produto` `vp` on((`v`.`idvenda` = `vp`.`idvenda`))) join `produto` `p` on((`vp`.`idproduto` = `p`.`idproduto`))) order by `v`.`data_venda` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `quantidade_de_vendas`
--

/*!50001 DROP VIEW IF EXISTS `quantidade_de_vendas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `quantidade_de_vendas` AS select sum(`vp`.`quantidade`) AS `Quant_vendas` from `vendas_has_produto` `vp` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total_de_vendas_por_produto`
--

/*!50001 DROP VIEW IF EXISTS `total_de_vendas_por_produto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total_de_vendas_por_produto` AS select `p`.`idproduto` AS `Id_Produto`,`p`.`descricao` AS `Descricao`,sum(`vp`.`quantidade`) AS `Total_Itens_vendidos` from (`vendas_has_produto` `vp` join `produto` `p` on((`vp`.`idproduto` = `p`.`idproduto`))) group by `p`.`idproduto` */;
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

-- Dump completed on 2023-05-16 18:37:34
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: agenda
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `id_evento` int(11) NOT NULL AUTO_INCREMENT,
  `nome_evento` varchar(45) DEFAULT NULL,
  `data_evento` date DEFAULT NULL,
  `descricao_evento` varchar(200) DEFAULT NULL,
  `status_evento` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id_evento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (1,'Inicio do Ano Letivo','0000-00-00','\nO início do ano letivo para os estudantes\ndo Ensino Fundamental e Educação de\nJovens e Adultos (EJA) matriculados na\nrede municipal de ensino será no dia 7\nde fevereiro.','Realizado'),(2,'Paixão de Cristo','0000-00-00','A Paixão de Jesus Cristo é um dos ciclos\nda Sua vida, o último.','À Realiza'),(3,'Tiradentes','0000-00-00','A data do dia 21 de abril relembra o dia\nda morte de Joaquim José da Silva Xavier','À Realizar'),(4,'Dia do Trabalho','0000-00-00','Data foi criada em lembrança a\ntrabalhadores estadunidenses mortos durante manifestação pela redução de jornada.','\nÀ Realizar'),(5,'Corpus Christi','0000-00-00','Corpus Christi é uma data comemorativa\nque faz parte do calendário católico em\nhomenagem ao sacramento da\neucaristia.','\nÀ Realizar');
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'agenda'
--

--
-- Dumping routines for database 'agenda'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-16 18:37:34

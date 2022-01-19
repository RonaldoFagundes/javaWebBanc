-- MySQL dump 10.13  Distrib 5.7.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_web_bussines_banc
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.38-MariaDB

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
-- Table structure for table `tb_contas`
--

DROP TABLE IF EXISTS `tb_contas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_contas` (
  `id_cnt` int(11) NOT NULL AUTO_INCREMENT,
  `numero_cnt` varchar(20) NOT NULL,
  `saldo_cnt` decimal(10,2) DEFAULT '0.00',
  `tipo_cnt` enum('001','002','003') DEFAULT NULL,
  `id_user_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cnt`),
  KEY `id_user_fk` (`id_user_fk`),
  CONSTRAINT `tb_contas_ibfk_1` FOREIGN KEY (`id_user_fk`) REFERENCES `tb_users` (`id_use`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_movimentacao`
--

DROP TABLE IF EXISTS `tb_movimentacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_movimentacao` (
  `id_mov` int(11) NOT NULL AUTO_INCREMENT,
  `data_mov` date NOT NULL,
  `tipo_mov` varchar(20) NOT NULL,
  `cod_mov` varchar(30) DEFAULT NULL,
  `valor_mov` decimal(10,2) NOT NULL DEFAULT '0.00',
  `mov_conta_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_mov`),
  KEY `mov_conta_fk` (`mov_conta_fk`),
  CONSTRAINT `tb_movimentacao_ibfk_1` FOREIGN KEY (`mov_conta_fk`) REFERENCES `tb_contas` (`id_cnt`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`RFagundes`@`localhost`*/ /*!50003 trigger trig_update_contas after insert on tb_movimentacao
for each row 
begin  

  declare tipo varchar(20); 
  
   set tipo = new.tipo_mov ;  
  
   /*select tipo_mov into tipo from tb_movimentacao where id_mov = new.mov_conta_fk ;*/
   
     if (tipo = 'saida' )then
      update tb_contas set saldo_cnt = saldo_cnt - new.valor_mov where id_cnt = new.mov_conta_fk ;
      else 
       update tb_contas set saldo_cnt = saldo_cnt + new.valor_mov where id_cnt = new.mov_conta_fk ;
     end if ;
   
 end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_users`
--

DROP TABLE IF EXISTS `tb_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_users` (
  `id_use` int(11) NOT NULL AUTO_INCREMENT,
  `name_use` varchar(30) NOT NULL,
  `email_use` varchar(30) NOT NULL,
  `user_use` varchar(30) NOT NULL,
  `password_use` varchar(30) NOT NULL,
  PRIMARY KEY (`id_use`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `view_contas`
--

DROP TABLE IF EXISTS `view_contas`;
/*!50001 DROP VIEW IF EXISTS `view_contas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_contas` AS SELECT 
 1 AS `conta_numero`,
 1 AS `id_usuario`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_id_conta`
--

DROP TABLE IF EXISTS `view_id_conta`;
/*!50001 DROP VIEW IF EXISTS `view_id_conta`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_id_conta` AS SELECT 
 1 AS `id`,
 1 AS `numero_cnt`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_logar`
--

DROP TABLE IF EXISTS `view_logar`;
/*!50001 DROP VIEW IF EXISTS `view_logar`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_logar` AS SELECT 
 1 AS `id`,
 1 AS `nome`,
 1 AS `usuario`,
 1 AS `senha`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_movimentacao`
--

DROP TABLE IF EXISTS `view_movimentacao`;
/*!50001 DROP VIEW IF EXISTS `view_movimentacao`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_movimentacao` AS SELECT 
 1 AS `id_mov`,
 1 AS `numero_cnt`,
 1 AS `data_mov`,
 1 AS `tipo_mov`,
 1 AS `cod_mov`,
 1 AS `valor_mov`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_saldo`
--

DROP TABLE IF EXISTS `view_saldo`;
/*!50001 DROP VIEW IF EXISTS `view_saldo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_saldo` AS SELECT 
 1 AS `numero_cnt`,
 1 AS `valor`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'db_web_bussines_banc'
--
/*!50003 DROP PROCEDURE IF EXISTS `pro_cad_conta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`RFagundes`@`localhost` PROCEDURE `pro_cad_conta`(numero_cnt varchar(20) , tipo_cnt enum ('001','002','003'), id_user_fk int(11))
begin
  insert into tb_contas values (null,numero_cnt,0.00,tipo_cnt,id_user_fk);
   select concat(' Conta ',numero_cnt,' cadastrada com sucesso !')as result;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_cad_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`RFagundes`@`localhost` PROCEDURE `pro_cad_user`( name_use varchar(30),email_use varchar(30),user_use varchar(30),password_use varchar(30))
begin
  insert into tb_users values(null,name_use,email_use,user_use,password_use);
   select concat(' Usuário ',name_use,' cadastrado com sucesso !')as result;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_lancar_movi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`RFagundes`@`localhost` PROCEDURE `pro_lancar_movi`(data_mov date,tipo_mov varchar(20) ,cod_mov varchar(30),valor_mov decimal(10,2),mov_conta_fk int(11))
begin
  insert into tb_movimentacao values (null, data_mov,tipo_mov,cod_mov,valor_mov,mov_conta_fk);  
    select concat(' Movimentação do tipo  ',tipo_mov,' cadastrada com sucesso !')as result;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_contas`
--

/*!50001 DROP VIEW IF EXISTS `view_contas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`RFagundes`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_contas` AS select distinct `tb_contas`.`numero_cnt` AS `conta_numero`,`tb_contas`.`id_user_fk` AS `id_usuario` from `tb_contas` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_id_conta`
--

/*!50001 DROP VIEW IF EXISTS `view_id_conta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`RFagundes`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_id_conta` AS select `tb_contas`.`id_cnt` AS `id`,`tb_contas`.`numero_cnt` AS `numero_cnt` from `tb_contas` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_logar`
--

/*!50001 DROP VIEW IF EXISTS `view_logar`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`RFagundes`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_logar` AS select `tb_users`.`id_use` AS `id`,`tb_users`.`name_use` AS `nome`,`tb_users`.`user_use` AS `usuario`,`tb_users`.`password_use` AS `senha` from `tb_users` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_movimentacao`
--

/*!50001 DROP VIEW IF EXISTS `view_movimentacao`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`RFagundes`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_movimentacao` AS select `tb_movimentacao`.`id_mov` AS `id_mov`,`tb_contas`.`numero_cnt` AS `numero_cnt`,`tb_movimentacao`.`data_mov` AS `data_mov`,`tb_movimentacao`.`tipo_mov` AS `tipo_mov`,`tb_movimentacao`.`cod_mov` AS `cod_mov`,`tb_movimentacao`.`valor_mov` AS `valor_mov` from (`tb_movimentacao` join `tb_contas` on((`tb_movimentacao`.`mov_conta_fk` = `tb_contas`.`id_cnt`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_saldo`
--

/*!50001 DROP VIEW IF EXISTS `view_saldo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`RFagundes`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_saldo` AS select `tb_contas`.`numero_cnt` AS `numero_cnt`,`tb_contas`.`saldo_cnt` AS `valor` from `tb_contas` */;
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

-- Dump completed on 2022-01-12 22:16:01

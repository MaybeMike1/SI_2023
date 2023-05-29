-- MySQL dump 10.13  Distrib 8.0.32, for macos13.0 (arm64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `audit_log`
--

DROP TABLE IF EXISTS `audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timeStamp` date NOT NULL,
  `exceptionMessage` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_log`
--

LOCK TABLES `audit_log` WRITE;
/*!40000 ALTER TABLE `audit_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_matches`
--

DROP TABLE IF EXISTS `audit_matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_matches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `matches_played` int NOT NULL,
  `day` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_matches`
--

LOCK TABLES `audit_matches` WRITE;
/*!40000 ALTER TABLE `audit_matches` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `champions`
--

DROP TABLE IF EXISTS `champions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `champions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `champions`
--

LOCK TABLES `champions` WRITE;
/*!40000 ALTER TABLE `champions` DISABLE KEYS */;
/*!40000 ALTER TABLE `champions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisions`
--

DROP TABLE IF EXISTS `divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisions`
--

LOCK TABLES `divisions` WRITE;
/*!40000 ALTER TABLE `divisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `divisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gamemodes`
--

DROP TABLE IF EXISTS `gamemodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gamemodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gamemodes`
--

LOCK TABLES `gamemodes` WRITE;
/*!40000 ALTER TABLE `gamemodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `gamemodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `masteries`
--

DROP TABLE IF EXISTS `masteries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `masteries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `level` int DEFAULT NULL,
  `championsPoints` int DEFAULT NULL,
  `lastPlayed` datetime DEFAULT NULL,
  `summoners_id` int NOT NULL,
  `summoners_ranks_id` int NOT NULL,
  `champions_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_masteries_summoners1_idx` (`summoners_id`,`summoners_ranks_id`),
  KEY `fk_masteries_champions1_idx` (`champions_id`),
  CONSTRAINT `fk_masteries_champions1` FOREIGN KEY (`champions_id`) REFERENCES `champions` (`id`),
  CONSTRAINT `fk_masteries_summoners1` FOREIGN KEY (`summoners_id`, `summoners_ranks_id`) REFERENCES `summoners` (`id`, `ranks_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `masteries`
--

LOCK TABLES `masteries` WRITE;
/*!40000 ALTER TABLE `masteries` DISABLE KEYS */;
/*!40000 ALTER TABLE `masteries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `duration` int DEFAULT NULL,
  `gamemodes_id` int NOT NULL,
  `game_creation` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_matches_gamemodes_idx` (`gamemodes_id`),
  CONSTRAINT `fk_matches_gamemodes` FOREIGN KEY (`gamemodes_id`) REFERENCES `gamemodes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participants`
--

DROP TABLE IF EXISTS `participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assists` int DEFAULT NULL,
  `deaths` int DEFAULT NULL,
  `kills` int DEFAULT NULL,
  `baronkills` int DEFAULT NULL,
  `consumablePurchased` int DEFAULT NULL,
  `damageDealtToBuildings` int DEFAULT NULL,
  `damageDealtToObjectives` int DEFAULT NULL,
  `damageDealtToTurrets` int DEFAULT NULL,
  `damageSelfMitigated` int DEFAULT NULL,
  `doubleKills` int DEFAULT NULL,
  `tripleKills` int DEFAULT NULL,
  `quadraKills` int DEFAULT NULL,
  `pentaKills` int DEFAULT NULL,
  `teams_id` int NOT NULL,
  `summoners_id` int NOT NULL,
  `positions_id` int NOT NULL,
  `champions_id` int NOT NULL,
  PRIMARY KEY (`id`,`teams_id`),
  KEY `fk_participants_teams1_idx` (`teams_id`),
  KEY `fk_participants_summoners1_idx` (`summoners_id`),
  KEY `fk_participants_positions1_idx` (`positions_id`),
  KEY `fk_participants_champions1_idx` (`champions_id`),
  CONSTRAINT `fk_participants_champions1` FOREIGN KEY (`champions_id`) REFERENCES `champions` (`id`),
  CONSTRAINT `fk_participants_positions1` FOREIGN KEY (`positions_id`) REFERENCES `positions` (`id`),
  CONSTRAINT `fk_participants_summoners1` FOREIGN KEY (`summoners_id`) REFERENCES `summoners` (`id`),
  CONSTRAINT `fk_participants_teams1` FOREIGN KEY (`teams_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participants`
--

LOCK TABLES `participants` WRITE;
/*!40000 ALTER TABLE `participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ranks`
--

DROP TABLE IF EXISTS `ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ranks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lp` int DEFAULT NULL,
  `divisions_id` int NOT NULL,
  `tiers_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ranks_divisions1_idx` (`divisions_id`),
  KEY `fk_ranks_tiers1_idx` (`tiers_id`),
  CONSTRAINT `fk_ranks_divisions1` FOREIGN KEY (`divisions_id`) REFERENCES `divisions` (`id`),
  CONSTRAINT `fk_ranks_tiers1` FOREIGN KEY (`tiers_id`) REFERENCES `tiers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranks`
--

LOCK TABLES `ranks` WRITE;
/*!40000 ALTER TABLE `ranks` DISABLE KEYS */;
/*!40000 ALTER TABLE `ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summoners`
--

DROP TABLE IF EXISTS `summoners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `summoners` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `level` int DEFAULT NULL,
  `icon` int DEFAULT NULL,
  `regions_id` int NOT NULL,
  `ranks_id` int NOT NULL,
  PRIMARY KEY (`id`,`ranks_id`),
  KEY `fk_summoners_regions1_idx` (`regions_id`),
  KEY `fk_summoners_ranks1_idx` (`ranks_id`),
  CONSTRAINT `fk_summoners_ranks1` FOREIGN KEY (`ranks_id`) REFERENCES `ranks` (`id`),
  CONSTRAINT `fk_summoners_regions1` FOREIGN KEY (`regions_id`) REFERENCES `regions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summoners`
--

LOCK TABLES `summoners` WRITE;
/*!40000 ALTER TABLE `summoners` DISABLE KEYS */;
/*!40000 ALTER TABLE `summoners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` int NOT NULL AUTO_INCREMENT,
  `matchWon` tinyint(1) DEFAULT NULL,
  `matches_id` int NOT NULL,
  PRIMARY KEY (`id`,`matches_id`),
  KEY `fk_teams_matches1_idx` (`matches_id`),
  CONSTRAINT `fk_teams_matches1` FOREIGN KEY (`matches_id`) REFERENCES `matches` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_bans_champions`
--

DROP TABLE IF EXISTS `teams_bans_champions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams_bans_champions` (
  `teams_id` int NOT NULL,
  `teams_matches_id` int NOT NULL,
  `champions_id` int NOT NULL,
  PRIMARY KEY (`teams_id`,`teams_matches_id`,`champions_id`),
  KEY `fk_teams_has_champions_champions1_idx` (`champions_id`),
  KEY `fk_teams_has_champions_teams1_idx` (`teams_id`,`teams_matches_id`),
  CONSTRAINT `fk_teams_has_champions_champions1` FOREIGN KEY (`champions_id`) REFERENCES `champions` (`id`),
  CONSTRAINT `fk_teams_has_champions_teams1` FOREIGN KEY (`teams_id`, `teams_matches_id`) REFERENCES `teams` (`id`, `matches_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_bans_champions`
--

LOCK TABLES `teams_bans_champions` WRITE;
/*!40000 ALTER TABLE `teams_bans_champions` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams_bans_champions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiers`
--

DROP TABLE IF EXISTS `tiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `value_UNIQUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiers`
--

LOCK TABLES `tiers` WRITE;
/*!40000 ALTER TABLE `tiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-15 14:49:09

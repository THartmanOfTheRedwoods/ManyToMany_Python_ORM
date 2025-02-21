-- MySQL dump 10.13  Distrib 9.0.1, for macos14.4 (x86_64)
--
-- Host: 127.0.0.1    Database: PasswordManager
-- ------------------------------------------------------
-- Server version	8.4.3

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
-- Table structure for table `ACCESS_LOG`
--

DROP TABLE IF EXISTS `ACCESS_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACCESS_LOG` (
  `logId` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `resourceId` int DEFAULT NULL,
  `accessedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`logId`),
  KEY `userId` (`userId`),
  KEY `resourceId` (`resourceId`),
  CONSTRAINT `access_log_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `USER` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `access_log_ibfk_2` FOREIGN KEY (`resourceId`) REFERENCES `RESOURCE` (`resourceId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACCESS_LOG`
--

LOCK TABLES `ACCESS_LOG` WRITE;
/*!40000 ALTER TABLE `ACCESS_LOG` DISABLE KEYS */;
INSERT INTO `ACCESS_LOG` VALUES (1,1,1,'2025-02-20 20:54:48'),(2,2,2,'2025-02-20 20:54:48');
/*!40000 ALTER TABLE `ACCESS_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACCESS_REQUEST`
--

DROP TABLE IF EXISTS `ACCESS_REQUEST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACCESS_REQUEST` (
  `requestId` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `resourceId` int DEFAULT NULL,
  `requestType` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `requestedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`requestId`),
  KEY `userId` (`userId`),
  KEY `resourceId` (`resourceId`),
  CONSTRAINT `access_request_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `USER` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `access_request_ibfk_2` FOREIGN KEY (`resourceId`) REFERENCES `RESOURCE` (`resourceId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACCESS_REQUEST`
--

LOCK TABLES `ACCESS_REQUEST` WRITE;
/*!40000 ALTER TABLE `ACCESS_REQUEST` DISABLE KEYS */;
INSERT INTO `ACCESS_REQUEST` VALUES (1,1,1,'ACCESS','PENDING','2025-02-20 20:54:48'),(2,2,2,'MODIFY','APPROVED','2025-02-20 20:54:48');
/*!40000 ALTER TABLE `ACCESS_REQUEST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `APPLICATION`
--

DROP TABLE IF EXISTS `APPLICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `APPLICATION` (
  `applicationId` int NOT NULL AUTO_INCREMENT,
  `resourceId` int DEFAULT NULL,
  `applicationName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`applicationId`),
  UNIQUE KEY `resourceId` (`resourceId`),
  CONSTRAINT `application_ibfk_1` FOREIGN KEY (`resourceId`) REFERENCES `RESOURCE` (`resourceId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `APPLICATION`
--

LOCK TABLES `APPLICATION` WRITE;
/*!40000 ALTER TABLE `APPLICATION` DISABLE KEYS */;
INSERT INTO `APPLICATION` VALUES (1,3,'HR Management System');
/*!40000 ALTER TABLE `APPLICATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `APPROVAL`
--

DROP TABLE IF EXISTS `APPROVAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `APPROVAL` (
  `approvalId` int NOT NULL AUTO_INCREMENT,
  `requestId` int DEFAULT NULL,
  `approvedBy` int DEFAULT NULL,
  `approvedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`approvalId`),
  KEY `requestId` (`requestId`),
  KEY `approvedBy` (`approvedBy`),
  CONSTRAINT `approval_ibfk_1` FOREIGN KEY (`requestId`) REFERENCES `ACCESS_REQUEST` (`requestId`) ON DELETE CASCADE,
  CONSTRAINT `approval_ibfk_2` FOREIGN KEY (`approvedBy`) REFERENCES `USER` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `APPROVAL`
--

LOCK TABLES `APPROVAL` WRITE;
/*!40000 ALTER TABLE `APPROVAL` DISABLE KEYS */;
INSERT INTO `APPROVAL` VALUES (1,1,2,'2025-02-20 20:54:48'),(2,2,3,'2025-02-20 20:54:48');
/*!40000 ALTER TABLE `APPROVAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `APPROVAL_PERMISSION`
--

DROP TABLE IF EXISTS `APPROVAL_PERMISSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `APPROVAL_PERMISSION` (
  `approvalPermissionId` int NOT NULL AUTO_INCREMENT,
  `approvalId` int DEFAULT NULL,
  `resourcePermissionId` int DEFAULT NULL,
  PRIMARY KEY (`approvalPermissionId`),
  KEY `approvalId` (`approvalId`),
  KEY `resourcePermissionId` (`resourcePermissionId`),
  CONSTRAINT `approval_permission_ibfk_1` FOREIGN KEY (`approvalId`) REFERENCES `APPROVAL` (`approvalId`) ON DELETE CASCADE,
  CONSTRAINT `approval_permission_ibfk_2` FOREIGN KEY (`resourcePermissionId`) REFERENCES `RESOURCE_PERMISSION` (`resourcePermissionId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `APPROVAL_PERMISSION`
--

LOCK TABLES `APPROVAL_PERMISSION` WRITE;
/*!40000 ALTER TABLE `APPROVAL_PERMISSION` DISABLE KEYS */;
INSERT INTO `APPROVAL_PERMISSION` VALUES (1,1,1),(2,2,2);
/*!40000 ALTER TABLE `APPROVAL_PERMISSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEVICE`
--

DROP TABLE IF EXISTS `DEVICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEVICE` (
  `deviceId` int NOT NULL AUTO_INCREMENT,
  `resourceId` int DEFAULT NULL,
  `deviceName` varchar(255) DEFAULT NULL,
  `deviceType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`deviceId`),
  UNIQUE KEY `resourceId` (`resourceId`),
  CONSTRAINT `device_ibfk_1` FOREIGN KEY (`resourceId`) REFERENCES `RESOURCE` (`resourceId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEVICE`
--

LOCK TABLES `DEVICE` WRITE;
/*!40000 ALTER TABLE `DEVICE` DISABLE KEYS */;
INSERT INTO `DEVICE` VALUES (1,1,'Dell XPS','Laptop');
/*!40000 ALTER TABLE `DEVICE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_PERMISSION`
--

DROP TABLE IF EXISTS `GROUP_PERMISSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_PERMISSION` (
  `groupPermissionId` int NOT NULL AUTO_INCREMENT,
  `groupId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `permissionId` int DEFAULT NULL,
  PRIMARY KEY (`groupPermissionId`),
  KEY `groupId` (`groupId`),
  KEY `userId` (`userId`),
  KEY `permissionId` (`permissionId`),
  CONSTRAINT `group_permission_ibfk_1` FOREIGN KEY (`groupId`) REFERENCES `USER_GROUP` (`groupId`) ON DELETE CASCADE,
  CONSTRAINT `group_permission_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `USER` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `group_permission_ibfk_3` FOREIGN KEY (`permissionId`) REFERENCES `PERMISSION` (`permissionId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_PERMISSION`
--

LOCK TABLES `GROUP_PERMISSION` WRITE;
/*!40000 ALTER TABLE `GROUP_PERMISSION` DISABLE KEYS */;
INSERT INTO `GROUP_PERMISSION` VALUES (1,1,1,1),(2,2,2,2),(3,3,3,3);
/*!40000 ALTER TABLE `GROUP_PERMISSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PASSWORD`
--

DROP TABLE IF EXISTS `PASSWORD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PASSWORD` (
  `passwordId` int NOT NULL AUTO_INCREMENT,
  `resourceId` int DEFAULT NULL,
  `encryptedPassword` text,
  PRIMARY KEY (`passwordId`),
  UNIQUE KEY `resourceId` (`resourceId`),
  CONSTRAINT `password_ibfk_1` FOREIGN KEY (`resourceId`) REFERENCES `RESOURCE` (`resourceId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PASSWORD`
--

LOCK TABLES `PASSWORD` WRITE;
/*!40000 ALTER TABLE `PASSWORD` DISABLE KEYS */;
INSERT INTO `PASSWORD` VALUES (1,3,'encryptedpassword123');
/*!40000 ALTER TABLE `PASSWORD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERMISSION`
--

DROP TABLE IF EXISTS `PERMISSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PERMISSION` (
  `permissionId` int NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(255) NOT NULL,
  PRIMARY KEY (`permissionId`),
  UNIQUE KEY `permissionName` (`permissionName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERMISSION`
--

LOCK TABLES `PERMISSION` WRITE;
/*!40000 ALTER TABLE `PERMISSION` DISABLE KEYS */;
INSERT INTO `PERMISSION` VALUES (3,'DELETE'),(1,'READ'),(2,'WRITE');
/*!40000 ALTER TABLE `PERMISSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUESTED_PERMISSION`
--

DROP TABLE IF EXISTS `REQUESTED_PERMISSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUESTED_PERMISSION` (
  `requestedPermissionId` int NOT NULL AUTO_INCREMENT,
  `requestId` int DEFAULT NULL,
  `resourcePermissionId` int DEFAULT NULL,
  PRIMARY KEY (`requestedPermissionId`),
  KEY `requestId` (`requestId`),
  KEY `resourcePermissionId` (`resourcePermissionId`),
  CONSTRAINT `requested_permission_ibfk_1` FOREIGN KEY (`requestId`) REFERENCES `ACCESS_REQUEST` (`requestId`) ON DELETE CASCADE,
  CONSTRAINT `requested_permission_ibfk_2` FOREIGN KEY (`resourcePermissionId`) REFERENCES `RESOURCE_PERMISSION` (`resourcePermissionId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUESTED_PERMISSION`
--

LOCK TABLES `REQUESTED_PERMISSION` WRITE;
/*!40000 ALTER TABLE `REQUESTED_PERMISSION` DISABLE KEYS */;
INSERT INTO `REQUESTED_PERMISSION` VALUES (1,1,1),(2,2,2);
/*!40000 ALTER TABLE `REQUESTED_PERMISSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE` (
  `resourceId` int NOT NULL AUTO_INCREMENT,
  `resourceType` enum('PASSWORD','DEVICE','URL','APPLICATION') NOT NULL,
  `description` text,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`resourceId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE`
--

LOCK TABLES `RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE` DISABLE KEYS */;
INSERT INTO `RESOURCE` VALUES (1,'DEVICE','Company Laptop','2025-02-20 20:54:48','2025-02-20 20:54:48'),(2,'URL','Intranet Portal','2025-02-20 20:54:48','2025-02-20 20:54:48'),(3,'APPLICATION','HR System','2025-02-20 20:54:48','2025-02-20 20:54:48');
/*!40000 ALTER TABLE `RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ASSOCIATION`
--

DROP TABLE IF EXISTS `RESOURCE_ASSOCIATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_ASSOCIATION` (
  `associationId` int NOT NULL AUTO_INCREMENT,
  `parentResourceId` int DEFAULT NULL,
  `childResourceId` int DEFAULT NULL,
  PRIMARY KEY (`associationId`),
  KEY `parentResourceId` (`parentResourceId`),
  KEY `childResourceId` (`childResourceId`),
  CONSTRAINT `resource_association_ibfk_1` FOREIGN KEY (`parentResourceId`) REFERENCES `RESOURCE` (`resourceId`) ON DELETE CASCADE,
  CONSTRAINT `resource_association_ibfk_2` FOREIGN KEY (`childResourceId`) REFERENCES `RESOURCE` (`resourceId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ASSOCIATION`
--

LOCK TABLES `RESOURCE_ASSOCIATION` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ASSOCIATION` DISABLE KEYS */;
INSERT INTO `RESOURCE_ASSOCIATION` VALUES (1,1,2),(2,2,3);
/*!40000 ALTER TABLE `RESOURCE_ASSOCIATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_HISTORY`
--

DROP TABLE IF EXISTS `RESOURCE_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_HISTORY` (
  `historyId` int NOT NULL AUTO_INCREMENT,
  `resourceId` int DEFAULT NULL,
  `data` json NOT NULL,
  `is_encrypted` tinyint(1) DEFAULT '0',
  `changedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `expiresAt` datetime DEFAULT NULL,
  PRIMARY KEY (`historyId`),
  KEY `resourceId` (`resourceId`),
  CONSTRAINT `resource_history_ibfk_1` FOREIGN KEY (`resourceId`) REFERENCES `RESOURCE` (`resourceId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_HISTORY`
--

LOCK TABLES `RESOURCE_HISTORY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_HISTORY` DISABLE KEYS */;
INSERT INTO `RESOURCE_HISTORY` VALUES (1,1,'{\"change\": \"Updated security settings\"}',1,'2025-02-20 20:54:48','2025-03-22 20:54:48'),(2,2,'{\"change\": \"Added new URL\"}',0,'2025-02-20 20:54:48','2025-04-21 20:54:48');
/*!40000 ALTER TABLE `RESOURCE_HISTORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_PERMISSION`
--

DROP TABLE IF EXISTS `RESOURCE_PERMISSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_PERMISSION` (
  `resourcePermissionId` int NOT NULL AUTO_INCREMENT,
  `resourceId` int DEFAULT NULL,
  `subtype` enum('USER','GROUP') NOT NULL,
  `permissionId` int DEFAULT NULL,
  PRIMARY KEY (`resourcePermissionId`),
  KEY `resourceId` (`resourceId`),
  KEY `permissionId` (`permissionId`),
  CONSTRAINT `resource_permission_ibfk_1` FOREIGN KEY (`resourceId`) REFERENCES `RESOURCE` (`resourceId`) ON DELETE CASCADE,
  CONSTRAINT `resource_permission_ibfk_2` FOREIGN KEY (`permissionId`) REFERENCES `PERMISSION` (`permissionId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_PERMISSION`
--

LOCK TABLES `RESOURCE_PERMISSION` WRITE;
/*!40000 ALTER TABLE `RESOURCE_PERMISSION` DISABLE KEYS */;
INSERT INTO `RESOURCE_PERMISSION` VALUES (1,1,'USER',1),(2,2,'GROUP',2),(3,3,'USER',3);
/*!40000 ALTER TABLE `RESOURCE_PERMISSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_PERMISSION_GROUP`
--

DROP TABLE IF EXISTS `RESOURCE_PERMISSION_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_PERMISSION_GROUP` (
  `resourcePermissionId` int NOT NULL,
  `groupId` int NOT NULL,
  PRIMARY KEY (`resourcePermissionId`,`groupId`),
  KEY `groupId` (`groupId`),
  CONSTRAINT `resource_permission_group_ibfk_1` FOREIGN KEY (`resourcePermissionId`) REFERENCES `RESOURCE_PERMISSION` (`resourcePermissionId`) ON DELETE CASCADE,
  CONSTRAINT `resource_permission_group_ibfk_2` FOREIGN KEY (`groupId`) REFERENCES `USER_GROUP` (`groupId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_PERMISSION_GROUP`
--

LOCK TABLES `RESOURCE_PERMISSION_GROUP` WRITE;
/*!40000 ALTER TABLE `RESOURCE_PERMISSION_GROUP` DISABLE KEYS */;
INSERT INTO `RESOURCE_PERMISSION_GROUP` VALUES (2,2);
/*!40000 ALTER TABLE `RESOURCE_PERMISSION_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_PERMISSION_USER`
--

DROP TABLE IF EXISTS `RESOURCE_PERMISSION_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_PERMISSION_USER` (
  `resourcePermissionId` int NOT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`resourcePermissionId`,`userId`),
  KEY `userId` (`userId`),
  CONSTRAINT `resource_permission_user_ibfk_1` FOREIGN KEY (`resourcePermissionId`) REFERENCES `RESOURCE_PERMISSION` (`resourcePermissionId`) ON DELETE CASCADE,
  CONSTRAINT `resource_permission_user_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `USER` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_PERMISSION_USER`
--

LOCK TABLES `RESOURCE_PERMISSION_USER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_PERMISSION_USER` DISABLE KEYS */;
INSERT INTO `RESOURCE_PERMISSION_USER` VALUES (1,1),(3,3);
/*!40000 ALTER TABLE `RESOURCE_PERMISSION_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_TAG`
--

DROP TABLE IF EXISTS `RESOURCE_TAG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_TAG` (
  `resourceId` int NOT NULL,
  `tagId` int NOT NULL,
  PRIMARY KEY (`resourceId`,`tagId`),
  KEY `tagId` (`tagId`),
  CONSTRAINT `resource_tag_ibfk_1` FOREIGN KEY (`resourceId`) REFERENCES `RESOURCE` (`resourceId`) ON DELETE CASCADE,
  CONSTRAINT `resource_tag_ibfk_2` FOREIGN KEY (`tagId`) REFERENCES `TAG` (`tagId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_TAG`
--

LOCK TABLES `RESOURCE_TAG` WRITE;
/*!40000 ALTER TABLE `RESOURCE_TAG` DISABLE KEYS */;
INSERT INTO `RESOURCE_TAG` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `RESOURCE_TAG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TAG`
--

DROP TABLE IF EXISTS `TAG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TAG` (
  `tagId` int NOT NULL AUTO_INCREMENT,
  `tagName` varchar(255) NOT NULL,
  PRIMARY KEY (`tagId`),
  UNIQUE KEY `tagName` (`tagName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TAG`
--

LOCK TABLES `TAG` WRITE;
/*!40000 ALTER TABLE `TAG` DISABLE KEYS */;
INSERT INTO `TAG` VALUES (1,'Confidential'),(2,'Public'),(3,'Restricted');
/*!40000 ALTER TABLE `TAG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `URL`
--

DROP TABLE IF EXISTS `URL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `URL` (
  `urlId` int NOT NULL AUTO_INCREMENT,
  `resourceId` int DEFAULT NULL,
  `url` text,
  PRIMARY KEY (`urlId`),
  UNIQUE KEY `resourceId` (`resourceId`),
  CONSTRAINT `url_ibfk_1` FOREIGN KEY (`resourceId`) REFERENCES `RESOURCE` (`resourceId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `URL`
--

LOCK TABLES `URL` WRITE;
/*!40000 ALTER TABLE `URL` DISABLE KEYS */;
INSERT INTO `URL` VALUES (1,2,'https://intranet.company.com');
/*!40000 ALTER TABLE `URL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `passwordHash` varchar(255) NOT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES (1,'alice','alice@example.com','hashedpassword1','2025-02-20 20:54:48'),(2,'bob','bob@example.com','hashedpassword2','2025-02-20 20:54:48'),(3,'charlie','charlie@example.com','hashedpassword3','2025-02-20 20:54:48');
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP`
--

DROP TABLE IF EXISTS `USER_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_GROUP` (
  `groupId` int NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) NOT NULL,
  `createdBy` int DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`groupId`),
  UNIQUE KEY `groupName` (`groupName`),
  KEY `createdBy` (`createdBy`),
  CONSTRAINT `user_group_ibfk_1` FOREIGN KEY (`createdBy`) REFERENCES `USER` (`userId`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP`
--

LOCK TABLES `USER_GROUP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP` DISABLE KEYS */;
INSERT INTO `USER_GROUP` VALUES (1,'Admins',1,'2025-02-20 20:54:48'),(2,'Editors',2,'2025-02-20 20:54:48'),(3,'Viewers',3,'2025-02-20 20:54:48');
/*!40000 ALTER TABLE `USER_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `userId` int NOT NULL,
  `groupId` int NOT NULL,
  `joinedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userId`,`groupId`),
  KEY `groupId` (`groupId`),
  CONSTRAINT `user_group_membership_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `USER` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `user_group_membership_ibfk_2` FOREIGN KEY (`groupId`) REFERENCES `USER_GROUP` (`groupId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
INSERT INTO `USER_GROUP_MEMBERSHIP` VALUES (1,1,'2025-02-20 20:54:48'),(2,2,'2025-02-20 20:54:48'),(2,3,'2025-02-20 20:54:48'),(3,3,'2025-02-20 20:54:48');
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'PasswordManager'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-20 19:17:32

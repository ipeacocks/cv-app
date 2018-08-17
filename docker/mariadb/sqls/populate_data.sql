-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: my_cv_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.3.8-MariaDB-1:10.3.8+maria~bionic

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
-- Current Database: `my_cv_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `my_cv_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `my_cv_db`;

--
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experience` (
  `experience_id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(100) NOT NULL,
  `time` varchar(32) NOT NULL,
  `site` varchar(64) NOT NULL,
  `experience` varchar(1000) NOT NULL,
  PRIMARY KEY (`experience_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience`
--

LOCK TABLES `experience` WRITE;
/*!40000 ALTER TABLE `experience` DISABLE KEYS */;
INSERT INTO `experience` VALUES (1,'Devops at Kaaiot','February 2017 - Present','https://kaaiot.io','Installation/configuration/support of Kubernetes Clusters (AWS/Bare-metal); AWS network designing with Terraform;Containerization of services with Docker; Writing Ansible code for automatic deployment of OpenLDAP/Jenkins/GitLab servers; CI/CD work with Jenkins (Groovy pipelines);Backup automatization with Python (boto + AWS Lambda)'),(2,'SRE / DevOps at Playtech','February 2017 - February 2018','https://playtech.com','Working on migration of company\'s clients from Cloud Foundry DEA to Diego; Writing Ansible code for automatic deployment of Cloud Foundry; Configuring monitoring for already working instances;Migration to OpenShift (RedHat Kubernetes distro);Support developers in their activities, daily tasks');
/*!40000 ALTER TABLE `experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knowledge`
--

DROP TABLE IF EXISTS `knowledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `knowledge` (
  `knowledge_id` int(11) NOT NULL AUTO_INCREMENT,
  `knowledge` varchar(1000) NOT NULL,
  PRIMARY KEY (`knowledge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knowledge`
--

LOCK TABLES `knowledge` WRITE;
/*!40000 ALTER TABLE `knowledge` DISABLE KEYS */;
INSERT INTO `knowledge` VALUES (1,'OS: Linux (admin level, Debian and RedHat derivatives)'),(2,'Web: Apache, Nginx, Php-Fpm, Varnish, Memcache, etc.'),(3,'Search platforms: Elasticsearch'),(4,'Mail: Postfix, Exim, Dovecot'),(5,'DBs: MySQL, MongoDB, Cassandra, Redis'),(6,'Messaging Systems: Kafka, RabbitMQ'),(7,'Distributed directory information services: OpenLDAP'),(8,'Linux HA: Pacemaker/Corosync, HAProxy'),(9,'VPN: OpenVPN'),(10,'Scripts languages: Bash, Python (Flask)'),(11,'Monitoring systems: Cacti, Graphite/Grafana, Nagios (Nagiosgraph), Sensu, ELK stack'),(12,'Virtualization/containerization: KVM, XEN, LXC, OpenVZ, Docker'),(13,'Server virtualization management: Proxmox'),(14,'Container orchestration systems: Mesos/Marathon, Cloud Foundry/Bosh, Kubernetes/OpenShift'),(15,'Cloud Platforms: Amazon Web Services'),(16,'Configuration management tools: Puppet (Foreman), Ansible (Tower), Terraform'),(17,'Distributed revision control and source code management systems: Git (GitLab), Svn'),(18,'CI/CD tools: Jenkins (Groovy pipeplines), Rundeck'),(19,'Storage/FS: LVM, hardware/software RAID, NFS, GlusterFS, ZFS');
/*!40000 ALTER TABLE `knowledge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `skype` varchar(32) NOT NULL,
  `address` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `skype` (`skype`),
  UNIQUE KEY `address` (`address`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Bruce Willis','+380.68.808.45.74','ipeacocks@example.com','ipeacocks','Kyiv, Ukraine');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-18  1:29:39

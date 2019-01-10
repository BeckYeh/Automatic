-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: web_school
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add classes to student',6,'add_classestostudent'),(17,'Can change classes to student',6,'change_classestostudent'),(18,'Can delete classes to student',6,'delete_classestostudent'),(19,'Can add class to teacher',7,'add_classtoteacher'),(20,'Can change class to teacher',7,'change_classtoteacher'),(21,'Can delete class to teacher',7,'delete_classtoteacher'),(22,'Can add school',8,'add_school'),(23,'Can change school',8,'change_school'),(24,'Can delete school',8,'delete_school'),(25,'Can add course',9,'add_course'),(26,'Can change course',9,'change_course'),(27,'Can delete course',9,'delete_course'),(28,'Can add classes',10,'add_classes'),(29,'Can change classes',10,'change_classes'),(30,'Can delete classes',10,'delete_classes'),(31,'Can add user',11,'add_user'),(32,'Can change user',11,'change_user'),(33,'Can delete user',11,'delete_user');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_person_system_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_person_system_user_id` FOREIGN KEY (`user_id`) REFERENCES `person_system_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-12-19 14:07:48.773531','1','葉科貝',2,'[{\"changed\": {\"fields\": [\"last_login\", \"birthday\", \"address\", \"is_student\"]}}]',11,1),(2,'2018-12-19 14:10:05.120765','1','新北分校',1,'[{\"added\": {}}]',8,1),(3,'2018-12-19 14:13:38.280397','2','吳老師',1,'[{\"added\": {}}]',11,1),(4,'2018-12-19 14:14:16.611068','2','吳老師',2,'[]',11,1),(5,'2018-12-19 14:27:11.123216','1','Python',1,'[{\"added\": {}}]',9,1),(6,'2018-12-19 14:27:44.144104','1','Python 一期',1,'[{\"added\": {}}]',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(10,'person_system','classes'),(6,'person_system','classestostudent'),(7,'person_system','classtoteacher'),(9,'person_system','course'),(8,'person_system','school'),(11,'person_system','user'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-12-18 14:15:31.442499'),(2,'contenttypes','0002_remove_content_type_name','2018-12-18 14:15:31.534809'),(3,'auth','0001_initial','2018-12-18 14:15:31.862410'),(4,'auth','0002_alter_permission_name_max_length','2018-12-18 14:15:31.930184'),(5,'auth','0003_alter_user_email_max_length','2018-12-18 14:15:31.938536'),(6,'auth','0004_alter_user_username_opts','2018-12-18 14:15:31.958138'),(7,'auth','0005_alter_user_last_login_null','2018-12-18 14:15:31.966797'),(8,'auth','0006_require_contenttypes_0002','2018-12-18 14:15:31.972421'),(9,'auth','0007_alter_validators_add_error_messages','2018-12-18 14:15:31.981685'),(10,'auth','0008_alter_user_username_max_length','2018-12-18 14:15:31.990813'),(11,'person_system','0001_initial','2018-12-18 14:15:32.616482'),(12,'admin','0001_initial','2018-12-18 14:15:32.774272'),(13,'admin','0002_logentry_remove_auto_add','2018-12-18 14:15:32.795643'),(14,'sessions','0001_initial','2018-12-18 14:15:32.850553'),(15,'person_system','0002_auto_20181219_2202','2018-12-19 14:02:37.650050'),(16,'person_system','0003_auto_20181219_2206','2018-12-19 14:06:49.753206'),(17,'person_system','0004_classes_teacher','2018-12-19 14:32:05.767425'),(18,'person_system','0005_auto_20190103_1940','2019-01-03 11:40:26.232197');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('bcy98m6wvmkpstw9wyu6slbualar887i','YzJjNmE4ZmI3MDA5ZDM1NjkyYjdkMjA3ZDMzZTNjZDBjNmM1M2ZmYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNDA3MWU3Nzg1NzY3MmVlMmY1M2FhZWMyZjRlYzA3MGIyMDlkNWM3In0=','2019-01-02 14:03:02.049840'),('v0gu8z35e8w1vgk10hvs69ad76kedfpp','YzJjNmE4ZmI3MDA5ZDM1NjkyYjdkMjA3ZDMzZTNjZDBjNmM1M2ZmYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNDA3MWU3Nzg1NzY3MmVlMmY1M2FhZWMyZjRlYzA3MGIyMDlkNWM3In0=','2019-01-17 11:37:00.353476');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_system_classes`
--

DROP TABLE IF EXISTS `person_system_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_system_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` date NOT NULL,
  `course_id` int(11) NOT NULL,
  `teacher_id` int(11),
  PRIMARY KEY (`id`),
  KEY `person_system_clas_course_id_21812c63_fk_person_system_course_id` (`course_id`),
  KEY `person_system_class_teacher_id_c3ea07ca_fk_person_system_user_id` (`teacher_id`),
  CONSTRAINT `person_system_clas_course_id_21812c63_fk_person_system_course_id` FOREIGN KEY (`course_id`) REFERENCES `person_system_course` (`id`),
  CONSTRAINT `person_system_class_teacher_id_c3ea07ca_fk_person_system_user_id` FOREIGN KEY (`teacher_id`) REFERENCES `person_system_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_system_classes`
--

LOCK TABLES `person_system_classes` WRITE;
/*!40000 ALTER TABLE `person_system_classes` DISABLE KEYS */;
INSERT INTO `person_system_classes` VALUES (1,'Python 一期','2018-12-19',1,NULL);
/*!40000 ALTER TABLE `person_system_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_system_classestostudent`
--

DROP TABLE IF EXISTS `person_system_classestostudent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_system_classestostudent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id_id` int(11) NOT NULL,
  `student_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `person_system_classestostudent_class_id_id_0b28f0f6_uniq` (`class_id_id`),
  KEY `person_system_classestostudent_student_id_id_651b514e_uniq` (`student_id_id`),
  CONSTRAINT `person_system_c_class_id_id_0b28f0f6_fk_person_system_classes_id` FOREIGN KEY (`class_id_id`) REFERENCES `person_system_classes` (`id`),
  CONSTRAINT `person_system_cl_student_id_id_651b514e_fk_person_system_user_id` FOREIGN KEY (`student_id_id`) REFERENCES `person_system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_system_classestostudent`
--

LOCK TABLES `person_system_classestostudent` WRITE;
/*!40000 ALTER TABLE `person_system_classestostudent` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_system_classestostudent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_system_classtoteacher`
--

DROP TABLE IF EXISTS `person_system_classtoteacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_system_classtoteacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id_id` int(11) NOT NULL,
  `teacher_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `person_system_classtoteacher_class_id_id_1fa2ece9_uniq` (`class_id_id`),
  KEY `person_system_classtoteacher_teacher_id_id_70646491_uniq` (`teacher_id_id`),
  CONSTRAINT `person_system_c_class_id_id_1fa2ece9_fk_person_system_classes_id` FOREIGN KEY (`class_id_id`) REFERENCES `person_system_classes` (`id`),
  CONSTRAINT `person_system_cl_teacher_id_id_70646491_fk_person_system_user_id` FOREIGN KEY (`teacher_id_id`) REFERENCES `person_system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_system_classtoteacher`
--

LOCK TABLES `person_system_classtoteacher` WRITE;
/*!40000 ALTER TABLE `person_system_classtoteacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_system_classtoteacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_system_course`
--

DROP TABLE IF EXISTS `person_system_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_system_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `outline` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_system_course`
--

LOCK TABLES `person_system_course` WRITE;
/*!40000 ALTER TABLE `person_system_course` DISABLE KEYS */;
INSERT INTO `person_system_course` VALUES (1,'Python',30000,1764000000000);
/*!40000 ALTER TABLE `person_system_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_system_school`
--

DROP TABLE IF EXISTS `person_system_school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_system_school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_system_school`
--

LOCK TABLES `person_system_school` WRITE;
/*!40000 ALTER TABLE `person_system_school` DISABLE KEYS */;
INSERT INTO `person_system_school` VALUES (1,'新北分校','新北市三重區永安北路一段37巷2弄7號3F','新北市');
/*!40000 ALTER TABLE `person_system_school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_system_user`
--

DROP TABLE IF EXISTS `person_system_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_system_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_student` tinyint(1) NOT NULL,
  `is_teacher` tinyint(1) NOT NULL,
  `address` varchar(256) COLLATE utf8mb4_unicode_ci,
  `birthday` date,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_system_user`
--

LOCK TABLES `person_system_user` WRITE;
/*!40000 ALTER TABLE `person_system_user` DISABLE KEYS */;
INSERT INTO `person_system_user` VALUES (1,'pbkdf2_sha256$30000$fAvZkN9lIqlh$hWwkPabhrRpqAQNhKOE6uvAs1/TOxWwxvAHlFUKaM7k=','2019-01-03 11:37:00.347846',1,'a23165beck','科貝','葉','a23165beck@gmail.com',1,1,'2018-12-19 14:02:00.000000',0,0,'新北市三重區永安北路一段37巷2弄7號3F','1991-09-16'),(2,'pbkdf2_sha256$30000$98EPVkOe0exH$Cqv754iq0jQAedCoExT6N7QkBzcMyPRaT8c1h2bDPA4=','2018-12-19 14:11:00.000000',0,'teacher1','老師','吳','aaa@noc.tw',0,1,'2018-12-19 14:11:00.000000',0,1,'新北市中和區中正路 866-11 號 12 樓','2018-12-19');
/*!40000 ALTER TABLE `person_system_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_system_user_groups`
--

DROP TABLE IF EXISTS `person_system_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_system_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `person_system_user_groups_user_id_eaefe56d_uniq` (`user_id`,`group_id`),
  KEY `person_system_user_groups_group_id_d7de7254_fk_auth_group_id` (`group_id`),
  CONSTRAINT `person_system_user_gro_user_id_4e74cbef_fk_person_system_user_id` FOREIGN KEY (`user_id`) REFERENCES `person_system_user` (`id`),
  CONSTRAINT `person_system_user_groups_group_id_d7de7254_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_system_user_groups`
--

LOCK TABLES `person_system_user_groups` WRITE;
/*!40000 ALTER TABLE `person_system_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_system_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_system_user_user_permissions`
--

DROP TABLE IF EXISTS `person_system_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_system_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `person_system_user_user_permissions_user_id_aaeffb4b_uniq` (`user_id`,`permission_id`),
  KEY `person_system_user__permission_id_6d8310b5_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `person_system_user__permission_id_6d8310b5_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `person_system_user_use_user_id_4ae33672_fk_person_system_user_id` FOREIGN KEY (`user_id`) REFERENCES `person_system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_system_user_user_permissions`
--

LOCK TABLES `person_system_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `person_system_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_system_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-10 21:42:03

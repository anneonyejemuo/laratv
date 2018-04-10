# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Hôte: localhost (MySQL 5.6.35)
# Base de données: videotube
# Temps de génération: 2017-08-30 19:25:06 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Affichage de la table 2d_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `2d_categories`;

CREATE TABLE `2d_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `id_relation` int(11) DEFAULT '0',
  `image` varchar(200) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `title_UNIQUE` (`title`),
  UNIQUE KEY `url_UNIQUE` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `2d_categories` WRITE;
/*!40000 ALTER TABLE `2d_categories` DISABLE KEYS */;

INSERT INTO `2d_categories` (`id`, `title`, `url`, `id_relation`, `image`, `date_created`, `date_modified`)
VALUES
	(1,'Animation','animation',0,'http://www.videotube.dev/uploads/images/categories/470750641_1280x720.jpg',NULL,NULL),
	(4,'Action','action',0,'http://www.videotube.dev/uploads/images/categories/t.png',NULL,NULL),
	(5,'Science fiction','science-fiction',0,'http://www.videotube.dev/uploads/images/categories/t1.png',NULL,NULL),
	(6,'Documentary','documentary',0,NULL,NULL,NULL),
	(7,'Horror','horror',0,'http://www.videotube.dev/uploads/images/categories/Cult-of-Chucky1.jpg',NULL,NULL),
	(8,'Nouvelle cat','nouvelle-cat',0,NULL,NULL,NULL),
	(9,'Fdsfdsf','fdsfdsf',0,NULL,NULL,NULL),
	(10,'Sdfsdf','sdfsdf',0,NULL,NULL,NULL),
	(11,'Xfsdfd','xfsdfd',0,NULL,NULL,NULL),
	(12,'Series','series',0,NULL,NULL,NULL);

/*!40000 ALTER TABLE `2d_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table 2d_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `2d_comments`;

CREATE TABLE `2d_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(100) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_video` int(11) DEFAULT NULL,
  `id_relation` int(11) DEFAULT '0',
  `score` int(11) DEFAULT '0',
  `ip` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `2d_comments` WRITE;
/*!40000 ALTER TABLE `2d_comments` DISABLE KEYS */;

INSERT INTO `2d_comments` (`id`, `comment`, `id_user`, `id_video`, `id_relation`, `score`, `ip`, `status`, `date_created`, `date_modified`)
VALUES
	(2,'Really nice',1,5,0,1,'127.0.0.1',3,'2017-07-04 15:37:47',NULL),
	(7,'My really first response to \"Really nice\"',1,5,2,0,'127.0.0.1',1,'2017-07-04 17:59:16',NULL),
	(10,'test 2\r\n',1,5,9,0,'127.0.0.1',3,'2017-07-04 18:27:49',NULL),
	(11,'test',1,5,0,0,'127.0.0.1',2,'2017-07-04 18:31:58',NULL),
	(12,'try',1,5,4,0,'127.0.0.1',1,'2017-07-04 18:42:55',NULL),
	(13,'retry',1,5,12,0,'127.0.0.1',2,'2017-07-04 18:43:10',NULL),
	(14,'Test comment',1,3,0,1,'127.0.0.1',3,'2017-07-04 19:25:28',NULL),
	(15,'My really first response to \"Really nice\"',1,3,0,0,'127.0.0.1',3,'2017-07-04 19:25:28',NULL),
	(16,'Test comment',1,3,0,0,'127.0.0.1',3,'2017-07-04 19:25:28',NULL),
	(17,'My really first response to \"Really nice\"',1,3,0,0,'127.0.0.1',2,'2017-07-04 19:25:28',NULL),
	(18,'My really first response to \"Really nice\"',1,3,0,1,'127.0.0.1',3,'2017-07-04 19:25:28',NULL),
	(19,'Test comment',1,3,0,0,'127.0.0.1',2,'2017-07-04 19:25:28',NULL),
	(20,'My really first response to \"Really nice\"',1,3,0,0,'127.0.0.1',1,'2017-07-04 19:25:28',NULL),
	(21,'Hello',1,3,0,0,'::1',1,'2017-08-08 01:34:31',NULL),
	(22,'test',1,3,0,-1,'::1',3,'2017-08-08 01:38:40',NULL),
	(23,'test',1,3,0,0,'::1',1,'2017-08-08 01:40:41',NULL),
	(24,'tesst',1,3,0,0,'::1',1,'2017-08-08 01:42:08',NULL),
	(25,'tesst',1,3,0,0,'::1',1,'2017-08-08 01:42:46',NULL),
	(26,'tesst',1,3,0,0,'::1',1,'2017-08-08 01:43:08',NULL),
	(27,'tesst',1,3,0,0,'::1',1,'2017-08-08 01:43:38',NULL),
	(28,'test',1,3,0,0,'::1',1,'2017-08-08 01:45:47',NULL),
	(29,'Nice',1,12,0,1,'127.0.0.1',3,'2017-08-15 23:08:50',NULL),
	(30,'test',1,13,0,0,'127.0.0.1',1,'2017-08-21 17:03:28',NULL),
	(31,'test',1,3,22,1,'127.0.0.1',3,'2017-08-23 20:28:33',NULL),
	(32,'test',1,5,0,0,'127.0.0.1',NULL,'2017-08-23 21:36:25',NULL),
	(33,'test',1,5,0,0,'127.0.0.1',NULL,'2017-08-23 21:37:16',NULL),
	(34,'test',1,5,0,0,'127.0.0.1',NULL,'2017-08-23 21:38:06',NULL),
	(35,'rrrr',1,5,0,0,'127.0.0.1',2,'2017-08-23 21:43:30','2017-08-23 21:43:30'),
	(36,'rrrr',1,5,0,0,'127.0.0.1',2,'2017-08-23 21:44:42','2017-08-23 21:44:42'),
	(37,'rrrr',1,5,0,0,'127.0.0.1',2,'2017-08-23 21:59:35','2017-08-23 21:59:35');

/*!40000 ALTER TABLE `2d_comments` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table 2d_favorites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `2d_favorites`;

CREATE TABLE `2d_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_video` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `2d_favorites` WRITE;
/*!40000 ALTER TABLE `2d_favorites` DISABLE KEYS */;

INSERT INTO `2d_favorites` (`id`, `id_user`, `id_video`, `date_created`, `date_modified`)
VALUES
	(16,1,3,'2017-08-08 01:34:09',NULL),
	(17,1,11,'2017-08-15 21:30:06',NULL),
	(18,1,10,'2017-08-15 21:39:17',NULL),
	(19,1,9,'2017-08-15 21:39:37',NULL),
	(20,1,12,'2017-08-15 22:00:53',NULL),
	(21,1,13,'2017-08-15 22:06:22',NULL),
	(22,1,15,'2017-08-17 12:37:54',NULL),
	(23,1,18,'2017-08-23 20:46:27',NULL),
	(24,11,3,'2017-08-24 19:39:21',NULL),
	(25,1,5,'2017-08-24 22:19:44',NULL);

/*!40000 ALTER TABLE `2d_favorites` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table 2d_keywords
# ------------------------------------------------------------

DROP TABLE IF EXISTS `2d_keywords`;

CREATE TABLE `2d_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `image` varchar(200) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id2d_keywords_UNIQUE` (`id`),
  UNIQUE KEY `title_UNIQUE` (`title`),
  UNIQUE KEY `url_UNIQUE` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `2d_keywords` WRITE;
/*!40000 ALTER TABLE `2d_keywords` DISABLE KEYS */;

INSERT INTO `2d_keywords` (`id`, `title`, `url`, `image`, `date_created`, `date_modified`)
VALUES
	(2,'2017','2017','http://www.videotube.dev/uploads/images/keywords/470750641_1280x720.jpg','2017-08-15 21:02:40',NULL),
	(3,'2016','2016',NULL,'2017-08-15 21:02:45',NULL),
	(4,'2015','2015',NULL,'2017-08-15 21:02:49',NULL),
	(5,'New movie','new-movie',NULL,'2017-08-15 21:03:01',NULL),
	(6,'Kid','kid',NULL,'2017-08-15 21:04:01',NULL),
	(7,'YouTube','youtube',NULL,'2017-08-15 21:15:46',NULL),
	(8,'Vimeo','vimeo',NULL,'2017-08-15 21:15:51',NULL);

/*!40000 ALTER TABLE `2d_keywords` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table 2d_likes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `2d_likes`;

CREATE TABLE `2d_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_com` int(11) DEFAULT NULL,
  `nb_like` int(11) DEFAULT '0',
  `nb_unlike` int(11) DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `2d_likes` WRITE;
/*!40000 ALTER TABLE `2d_likes` DISABLE KEYS */;

INSERT INTO `2d_likes` (`id`, `id_user`, `id_com`, `nb_like`, `nb_unlike`, `date_created`, `date_modified`)
VALUES
	(1,1,1,1,0,'2017-07-03 00:29:34',NULL),
	(2,1,2,1,0,'2017-07-04 15:37:53',NULL),
	(3,1,4,0,0,'2017-07-04 17:36:56',NULL),
	(4,1,12,0,0,'2017-07-04 18:44:10',NULL),
	(5,1,14,1,0,'2017-07-10 02:40:04',NULL),
	(6,1,22,0,1,'2017-08-11 23:33:17',NULL),
	(7,1,29,1,0,'2017-08-15 23:09:21',NULL),
	(8,1,31,1,0,'2017-08-23 20:29:25',NULL),
	(9,1,18,1,0,'2017-08-23 20:29:52',NULL);

/*!40000 ALTER TABLE `2d_likes` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table 2d_menus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `2d_menus`;

CREATE TABLE `2d_menus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `ids_menu` varchar(300) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `2d_menus` WRITE;
/*!40000 ALTER TABLE `2d_menus` DISABLE KEYS */;

INSERT INTO `2d_menus` (`id`, `title`, `ids_menu`, `date_created`, `date_modified`)
VALUES
	(93,'Main menu','d:1,d:2,d:3,d:4,d:5','2017-07-12 20:15:06','2017-08-29 15:11:27'),
	(94,'Widget 3','p:4,p:6,p:2,p:3,d:4','2017-07-26 22:07:54','2017-08-16 22:43:07'),
	(95,'Second Menu','c:4,c:1,c:6,c:7,c:5','2017-07-26 23:04:29','2017-08-15 21:00:26'),
	(96,'Widget 2','d:1','2017-08-15 22:29:01','2017-08-15 22:29:02'),
	(97,'Widget 1','c:4,c:1,c:6,c:7,c:5','2017-08-15 22:29:07','2017-08-15 22:38:47');

/*!40000 ALTER TABLE `2d_menus` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table 2d_newsletter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `2d_newsletter`;

CREATE TABLE `2d_newsletter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(45) DEFAULT NULL,
  `is_member` tinyint(1) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `2d_newsletter` WRITE;
/*!40000 ALTER TABLE `2d_newsletter` DISABLE KEYS */;

INSERT INTO `2d_newsletter` (`id`, `email`, `is_member`, `status`, `ip`, `date_created`, `date_modified`)
VALUES
	(4,'admin@coffeetheme.com',1,0,'192.168.1.1','2017-07-30 01:32:30','2017-07-30 01:32:30'),
	(12,'grimnicolas@hotmail.fr',1,1,'192.168.1.1','2017-07-30 05:40:56','2017-07-30 05:40:56'),
	(13,'grimnicolas@gmail.com',1,1,'192.168.1.1','2017-07-30 05:42:24','2017-07-30 05:42:24'),
	(15,'grimnicolas@ddrrd.com',0,1,'192.168.1.1','2017-07-30 05:43:45','2017-07-30 05:43:45'),
	(16,'grimnicolas@gmail.net',0,1,'192.168.1.1','2017-07-30 05:44:01','2017-07-30 05:44:01'),
	(17,'mymail@teoc.com',0,1,'192.168.1.1','2017-08-10 21:14:53','2017-08-10 21:14:53'),
	(18,'customerservice@partylights.com',0,1,'192.168.1.1','2017-08-10 21:15:32','2017-08-10 21:15:32'),
	(19,'support@coffeetheme.com',0,1,'192.168.1.1','2017-08-10 21:16:34','2017-08-10 21:16:34'),
	(20,'fsefwe@tenf.com',0,1,'192.168.1.1','2017-08-10 21:18:41','2017-08-10 21:18:41'),
	(21,'cap@tavanoteam.com',1,1,'192.168.1.1','2017-08-26 01:07:11','2017-08-26 01:07:11');

/*!40000 ALTER TABLE `2d_newsletter` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table 2d_notes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `2d_notes`;

CREATE TABLE `2d_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_video` int(11) DEFAULT NULL,
  `note` float DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `2d_notes` WRITE;
/*!40000 ALTER TABLE `2d_notes` DISABLE KEYS */;

INSERT INTO `2d_notes` (`id`, `id_user`, `id_video`, `note`, `date_created`, `date_modified`)
VALUES
	(1,1,1,5,'2017-08-21 22:21:38',NULL),
	(2,1,5,4,'2017-08-14 21:12:40',NULL),
	(3,1,3,5,'2017-08-08 01:45:59',NULL),
	(4,1,11,5,'2017-08-15 21:30:12',NULL),
	(5,1,10,3.5,'2017-08-15 21:39:15',NULL),
	(6,1,9,4.5,'2017-08-15 21:39:34',NULL),
	(7,1,12,4.5,'2017-08-15 22:00:50',NULL),
	(8,1,13,4,'2017-08-15 22:06:20',NULL),
	(9,1,17,4,'2017-08-16 00:54:11',NULL),
	(10,1,16,4.5,'2017-08-16 20:28:16',NULL),
	(11,1,15,5,'2017-08-18 13:42:05',NULL),
	(12,1,18,4,'2017-08-23 20:46:25',NULL),
	(13,1,14,5,'2017-08-30 02:00:11',NULL);

/*!40000 ALTER TABLE `2d_notes` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table 2d_notifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `2d_notifications`;

CREATE TABLE `2d_notifications` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `new` tinyint(1) DEFAULT NULL,
  `id_relation` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `2d_notifications` WRITE;
/*!40000 ALTER TABLE `2d_notifications` DISABLE KEYS */;

INSERT INTO `2d_notifications` (`id`, `type`, `new`, `id_relation`, `date_created`, `date_modified`)
VALUES
	(1,0,0,NULL,'2017-07-04 19:24:52','2017-07-04 19:24:52'),
	(2,0,0,NULL,'2017-07-04 19:24:52','2017-07-04 19:24:52'),
	(3,0,0,NULL,'2017-07-30 05:43:45','2017-07-30 05:43:45'),
	(4,0,0,NULL,'2017-07-30 05:44:01','2017-07-30 05:44:01'),
	(5,0,0,NULL,'2017-07-30 05:44:16','2017-07-30 05:44:16'),
	(6,0,0,NULL,'2017-07-30 22:52:26','2017-07-30 22:52:26'),
	(7,0,0,NULL,'2017-07-30 22:52:33','2017-07-30 22:52:33'),
	(8,1,0,1,'2017-08-02 13:29:50','2017-08-02 13:29:50'),
	(9,1,0,1,'2017-08-02 13:45:35','2017-08-02 13:45:35'),
	(10,1,0,1,'2017-08-02 13:45:45','2017-08-02 13:45:45'),
	(11,1,0,1,'2017-08-02 19:47:05','2017-08-02 19:47:05'),
	(12,0,0,NULL,'2017-08-02 20:29:26','2017-08-02 20:29:26'),
	(13,0,0,NULL,'2017-08-10 21:14:54','2017-08-10 21:14:54'),
	(14,0,0,NULL,'2017-08-10 21:15:32','2017-08-10 21:15:32'),
	(15,0,0,NULL,'2017-08-10 21:16:35','2017-08-10 21:16:35'),
	(16,0,0,NULL,'2017-08-10 21:19:44','2017-08-10 21:19:44'),
	(17,1,0,5,'2017-08-21 16:06:36','2017-08-21 16:06:36'),
	(18,2,0,NULL,'2017-08-21 16:47:45','2017-08-21 16:47:45'),
	(19,5,0,NULL,'2017-08-21 17:03:28','2017-08-21 17:03:28'),
	(20,3,0,NULL,'2017-08-21 17:04:13','2017-08-21 17:04:13'),
	(21,4,0,NULL,'2017-08-21 17:04:13','2017-08-21 17:04:13'),
	(22,5,0,NULL,'2017-08-23 20:28:33','2017-08-23 20:28:33'),
	(23,1,0,3,'2017-08-23 20:30:17','2017-08-23 20:30:17'),
	(24,3,0,NULL,'2017-08-24 11:49:21','2017-08-24 11:49:21'),
	(25,0,0,NULL,'2017-08-26 01:07:13','2017-08-26 01:07:13'),
	(26,3,0,NULL,'2017-08-27 16:52:46','2017-08-27 16:52:46'),
	(27,4,0,NULL,'2017-08-27 16:52:46','2017-08-27 16:52:46'),
	(28,3,0,NULL,'2017-08-27 17:00:59','2017-08-27 17:00:59'),
	(29,4,0,NULL,'2017-08-27 17:00:59','2017-08-27 17:00:59'),
	(30,3,0,NULL,'2017-08-27 17:02:06','2017-08-27 17:02:06'),
	(31,4,0,NULL,'2017-08-27 17:02:06','2017-08-27 17:02:06'),
	(32,3,0,NULL,'2017-08-27 17:06:17','2017-08-27 17:06:17'),
	(33,4,0,NULL,'2017-08-27 17:06:17','2017-08-27 17:06:17'),
	(34,3,0,NULL,'2017-08-27 17:08:12','2017-08-27 17:08:12'),
	(35,4,0,NULL,'2017-08-27 17:08:12','2017-08-27 17:08:12'),
	(36,1,0,5,'2017-08-29 01:04:38','2017-08-29 01:04:38');

/*!40000 ALTER TABLE `2d_notifications` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table 2d_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `2d_pages`;

CREATE TABLE `2d_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `content` mediumtext,
  `sub_page` int(11) DEFAULT '0',
  `layout` tinyint(1) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `title_UNIQUE` (`title`),
  UNIQUE KEY `url_UNIQUE` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `2d_pages` WRITE;
/*!40000 ALTER TABLE `2d_pages` DISABLE KEYS */;

INSERT INTO `2d_pages` (`id`, `title`, `url`, `content`, `sub_page`, `layout`, `date_created`, `date_modified`)
VALUES
	(2,'Privacy Policy','privacy-policy','<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-9\">\r\n<p>CodeGrape has developed this Privacy Policy (\"Policy\") to inform you about how we deal with privacy issues in relation to our website. Your privacy is very important to us and you must agree to the terms of this Policy before becoming a CodeGrape member and/or using the site covered by two domains located at ww (\"the Site\").</p>\r\n<p>This Policy governs the information we collect about you and your use of information we provide to you. By accepting this Policy and the Website Terms of Access Agreement, you expressly consent to our use and disclosure of your personal information in a manner prescribed in this Policy. You acknowledge this by using the Site.</p>\r\n<h3>Information about children</h3>\r\n<p>Children (persons under the age of 18 years) are not eligible to use our services unsupervised and we ask that children not submit any personal information to us. If you are under the age of 18 years, you can browse the Site only in conjunction with and under the supervision of your parents or guardians. If you are under 18 years of age you cannot use the Membership Section of the Site.</p>\r\n<p>It is the responsibility of parents to monitor their children\'s use of our Site.</p>\r\n<h3>Information collection</h3>\r\n<p><strong>PART A - The Public Generally</strong></p>\r\n<p>Our primary purpose in collecting personal information is to provide you with a safer trading experience and encourage commerce between buyers and sellers using the Site as a venue. We only collect personal information about you that we consider necessary for this purpose and to achieve this goal.</p>\r\n<p>You are under no obligation to provide us with this information and can access many aspects of the Site without providing us any personal information.</p>\r\n<p>When you visit this website, we can record certain information in relation to your visit such as:</p>\r\n<ul>\r\n<li>Your IP or proxy server IP;</li>\r\n<li>Basic domain information;</li>\r\n<li>Your Internet service provider is sometimes captured depending on the configuration of your ISP connection;</li>\r\n<li>The date and time of your visit to the website;</li>\r\n<li>The length of your session;</li>\r\n<li>The pages which you have accessed;</li>\r\n<li>The number of times you access our site within any month;</li>\r\n<li>The size of file you look at;</li>\r\n<li>The website which referred you to our website; and</li>\r\n<li>The operating system which your computer uses.</li>\r\n</ul>\r\n<p>This information is only used for statistical and website development purposes.</p>\r\n<p>Various pages on this Site invite you to provide us your name and contact details, for example, to go onto our mailing list for our newsletter enter competitions, or to enable us to provide you with site related services such as notifications.</p>\r\n<p>If you use our Site\'s feedback and support forms, you are asked to provide your name, organisation, title, address, email address and telephone number. CodeGrape will not otherwise collect information from you through this Site unless you knowingly provide it to us.</p>\r\n<p>By voluntarily providing information to us when using the Site, you are consenting to the collection and use of your personal information by us.</p>\r\n<p>The Site uses session cookies, which are used only during a browsing session, and expire when you quit your browser. Upon closing your browser, the session cookie set by this Site is destroyed and no personal information is maintained which might identify you should you visit our Site at a later date.</p>\r\n<p>If you choose to buy or sell on our Site, we collect information about your buying and selling behaviour. This information is only used for statistical and website development purposes.</p>\r\n<p>Please note that when you voluntarily disclose information on the bulletin boards or in the forum or in the chat areas of the Site or in member profile pages, your personal and other information disclosed in your communication shall become public information and can be collected and used by other parties. We cannot control what third parties in the bulletin board or chatroom do with your personal information.</p>\r\n<p><strong>PART B - Members </strong></p>\r\n<p>We collect information from people who use the Membership Section of our Site (\"Members\"). This information may be used:</p>\r\n<ol>\r\n<li>to send news, information about our activities and general promotional material which we believe may be useful to you or us;</li>\r\n<li>to monitor who is accessing the membership section of the Site or using services offered on the Site; and</li>\r\n<li>to profile the type of people accessing the Site.</li>\r\n</ol>\r\n<p>If you choose to buy or sell on our Site we collect information about your buying and selling behaviour.</p>\r\n<p>If you use a payment facilitator on the Site, we collect additional necessary information, including but not limited to billing address, credit card number and credit card expiry date.</p>\r\n<h3>Use of information and disclosure</h3>\r\n<p>CodeGrape will only use the information it collects through the Site for the following purposes:</p>\r\n<ul>\r\n<li>Forwarding important information relating to CodeGrape activities and other requested information;</li>\r\n<li>Contacting you in response to your feedback or query to discuss our services;</li>\r\n<li>Monitoring Site performance;</li>\r\n<li>Improving our Site and services to you;</li>\r\n<li>Internal administration; and</li>\r\n<li>Other purposes that are in accordance with your instructions.</li>\r\n</ul>\r\n<p>CodeGrape will not give, sell, trade or otherwise disclose any personal information about you to a third party unless:</p>\r\n<ul>\r\n<li>You have provided us with your consent; or</li>\r\n<li>We are required to do so by law.</li>\r\n</ul>\r\n<h3>Access and/or correction of your details</h3>\r\n<p>You may request access to your personal information and can ask us to correct your personal information.</p>\r\n<p>You can do this by emailing <a href=\"mailto:legal@codegrape.com\">legal@codegrape.com</a></p>\r\n<h3>Disclaimer</h3>\r\n<p>This Site contains links to other sites. CodeGrape is not responsible for the privacy practices of linked sites. Underlined words and phrases are click-through links or hyperlinks to pages and websites. CodeGrape strongly recommends that you read the Privacy Policy of the linked websites as they may contain further terms and conditions which apply to you</p>\r\n<h3>Security</h3>\r\n<p>This Site has security measures in place to protect the loss or misuse of, or alteration or unauthorised access to, information under our control. However, if you send information from this Site, it will not be encrypted unless we expressly tell you it is.</p>\r\n<h3>Amendments to the privacy policy</h3>\r\n<p>We may change this Policy. Such changes will be effective when a notice of the change is made available on the Site. We will provide you with thirty (30) days notice to allow you the opportunity to notify CodeGrape if you do not agree to such changes.</p>\r\n<h3>Opt - out provision</h3>\r\n<p>To protect you from unwanted email communications, CodeGrape adopts an opt-out facility for marketing communication. If you decide you no longer would like to receive marketing communications from us, please advise us by sending an email to <a href=\"mailto:legal@codegrape.com\">legal@codegrape.com</a> or follow the instructions in the \"Opt-Out\" section of the email you have received.</p>\r\n<p>If you request us not to use personal information in a particular manner or at all, we will adopt all reasonable measures to observe your request but we may still use or disclose that information if:</p>\r\n<ol>\r\n<li>\r\n<ol>\r\n<li>we subsequently notify you of the intended use or disclosure and you do not object to that use or disclosure;</li>\r\n<li>we believe that the use or disclosure is reasonably necessary to assist a law enforcement agency or an agency responsible for governmental or public security in the performance of their functions; or</li>\r\n<li>we are required by law to disclosure the information.</li>\r\n</ol>\r\n</li>\r\n</ol>\r\n<h3>International transfer of information</h3>\r\n<p>Because our server and information processing equipment is located in Netherlands, the information collected from you will be stored there. By voluntarily providing information to us when using the Site, you are consenting to the collection and use of your personal information by us.</p>\r\n<h3>Further information</h3>\r\n<p>For further information about CodeGrape\'s privacy policy, please email us at <a href=\"mailto:legal@codegrape.com\">legal@codegrape.com</a></p>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<ul class=\"sidebar-nav\">\r\n<li><a href=\"https://www.codegrape.com/legal-information/website-terms-of-access\"> Website Terms of Access</a></li>\r\n<li><a href=\"https://www.codegrape.com/legal-information/membership-agreement\"> Membership Agreement</a></li>\r\n<li class=\"active\"><a class=\"active\" href=\"https://www.codegrape.com/legal-information/privacy-policy\"> Privacy Policy</a></li>\r\n<li><a href=\"https://www.codegrape.com/legal-information/pricing-licensing\"> Pricing & Licensing</a></li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>',NULL,NULL,'2017-07-26 21:58:58','2017-07-27 00:17:12'),
	(3,'Terms of Access','terms-of-access','<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-9\">\r\n<h3 class=\"pt-0\">1. The Aggreement</h3>\r\n<p>1.1 These terms and conditions in this Agreement ( \"the Agreement\" ) apply to the use of this web site located at <a href=\"https://www.codegrape.com/\">https://www.codegrape.com/</a> ( \"the Site\" ). When using this Site, you agree to be bound by this Agreement.</p>\r\n<p>1.2 If you do not accept the terms and conditions in this Agreement, you must refrain from using the Site immediately.</p>\r\n<p>1.3 The Agreement must be used and accepted in conjunction with the Privacy Statement, Membership Agreement and if applicable, the Exclusive Distribution Agreemenasd fasdt, Pricing & Licensing and any other applicable terms and conditions governing the use of the Site.</p>\r\n<p>1.4 You can only use this Site if you are 18 years or over. If you are under 18 years of age you must refrain from using the Site immediately.</p>\r\n<h3>2. Definitions</h3>\r\n<p>In this Agreement, the expressions \"we, \"us\" and \"our\" are a reference to CodeGrape and the expressions \"you\" and \"your\" are a reference to the Website User or people on behalf of the Website user who agree to the terms and conditions of this Agreement.</p>\r\n<dl>\r\n<dt>Consumer:</dt>\r\n<dd>\r\n<p>means any person capable of purchasing a Product.</p>\r\n</dd>\r\n<dt>GST Law:</dt>\r\n<dd>\r\n<p>means the same as \"GST law\" in <em>A New Tax System &#40;Goods and Services Tax&#41; Act 1999</em> Cth.</p>\r\n</dd>\r\n<dt>Hyperlinks:</dt>\r\n<dd>\r\n<p>means link(s) on the Site that click-through or re-direct you to another website.</p>\r\n</dd>\r\n<dt>Intellectual Property:</dt>\r\n<dd>\r\n<p>means copyright, trade mark, design, patent, semiconductor or circuit layout rights.</p>\r\n</dd>\r\n<dt>Intellectual Property Rights:</dt>\r\n<dd>\r\n<p>means rights in respect of copyright, trade mark, design, patent, semiconductor or circuit layout rights.</p>\r\n</dd>\r\n<dt>Members:</dt>\r\n<dd>\r\n<p>means a person or a person on behalf of an entity that has agreed to the terms and conditions of the Membership Agreement and are current Members or persons who use the membership section of the Site.</p>\r\n</dd>\r\n<dt>Moral Rights:</dt>\r\n<dd>\r\n<p>means the right of integrity of authorship, the right of attribution of authorship and the right not to have authorship falsely attributed, more particularly as conferred by the <em>Copyright Act 1968</em> (Cth), and rights of a similar nature anywhere in the world whether existing presently or which may in the future come into existence.</p>\r\n</dd>\r\n<dt>Product:</dt>\r\n<dd>\r\n<p>means HTML files, Video files, Audio files, Font Files, or any other goods, services, or material that you are uploading or downloading on the Site, together with any accompanying material such as product descriptions, and the associated Intellectual Property rights.</p>\r\n</dd>\r\n<dt>Purchaser:</dt>\r\n<dd>\r\n<p>means a person or person with authority to act for another person or entity that has the intention to purchase a Product pursuant to this Agreement or any Agreement governing this Site.</p>\r\n</dd>\r\n<dt>Site:</dt>\r\n<dd>\r\n<p>is the website located over one domain at <a href=\"https://www.codegrape.com/.\" target=\"_blank\">https://www.codegrape.com/.</a></p>\r\n</dd>\r\n<dt>Supplier:</dt>\r\n<dd>\r\n<p>means a person or person with authority to act for another person or entity that has the intention to supply a Product pursuant to this Agreement or any Agreement governing this Site.</p>\r\n</dd>\r\n<dt>Users:</dt>\r\n<dd>\r\n<p>means a person that may use the Product.</p>\r\n</dd>\r\n</dl>\r\n<h3>3. CodeGrape\'s role</h3>\r\n<p>3.1 Our Site acts as a venue to allow members to offer, sell, and buy products available on our Site. Other than a venue, we are not involved in any transaction between the buyer and seller using our Site.</p>\r\n<p>3.2 We have no control and are not responsible for the quality, safety or legality of the Products or Product Descriptions uploaded by users on the Site.</p>\r\n<p>3.3 We also have no control and are not responsible for the truth or accuracy of the Products, Product Descriptions or Content uploaded by users on the Site.</p>\r\n<p>3.4 We cannot ensure and do not guarantee that a buyer or seller will actually complete a transaction or act lawfully in using our Site.</p>\r\n<h3>4. Duration</h3>\r\n<p>4.1 Without limiting the generality of any other clause of this Agreement, this Agreement will remain in force as long as you continue to use the Site for any purpose.</p>\r\n<h3>5. You aggree to release us from liability</h3>\r\n<p>In the event that you have a dispute or breach of agreement with one or more Users, you release us (and our officers, directors, agents, affiliates, subsidiaries and employees) from claims, demands and damages of every kind and nature, known or unknown, suspected or unsuspected, disclosed or undisclosed, arising out of or in any way connected with such disputes or breaches.</p>\r\n<h3>6. You agree to indemnify us</h3>\r\n<p>You agree to indemnify and hold us and our parent, subsidiaries, affiliates, officers, directors, agents, and employees (as applicable) harmless from and against any claims, damages, proceedings, losses and damages of very kind and nature, including solicitors’ fees, made by any third party due to or arising out of your breach of this Agreement or the terms and policies it incorporates by reference, or your violation of any laws or the rights of third parties.</p>\r\n<h3>7. Amendments to terms and conditions</h3>\r\n<p>7.1 We reserve the right to amend this Agreement from time to time. Amendments will be effective immediately upon notification on the Site.</p>\r\n<p>7.2 Your continued use of the Site following such notification will represent an agreement by you to be bound by the Agreement as amended.</p>\r\n<h3>8. Disclaimer</h3>\r\n<p>8.1 We do not accept responsibility for any loss damage, however caused (including through negligence), which you may directly or indirectly suffer in connection with your use of this Site or any linked website, nor do we accept any responsibility for any such loss arising out of your use of or reliance on information contained on or accessed through this Site.</p>\r\n<p>8.2 To the extent permitted by law, any condition or warranty which would otherwise be implied into this Agreement is hereby excluded. Where legislation implies any condition or warranty, and that legislation prohibits us from excluding or modifying the application of, or our liability under, any such condition or warranty, that condition or warranty will be deemed included but our liability will be limited for a breach of that condition or warranty to one or more of the following:</p>\r\n<ol type=\"a\">\r\n<li>if the breach relates to goods:\r\n<ol type=\"i\">\r\n<li>the replacement of the goods or the supply of equivalent goods;</li>\r\n<li>the repair of such goods;</li>\r\n<li>the payment of the cost of replacing the goods or of acquiring equivalent goods; or</li>\r\n<li>the payment of the cost of having the goods repaired; and</li>\r\n</ol>\r\n</li>\r\n<li>if the breach relates to services:\r\n<ol type=\"i\">\r\n<li>the supplying of the services again; or</li>\r\n<li>the payment of the cost of having the services supplied again.</li>\r\n</ol>\r\n</li>\r\n</ol>\r\n<p>8.3 Except in relation to liability for personal injury (including sickness and death), and except as otherwise stipulated in these terms and conditions, we will not accept liability to you in respect of any loss or damage (including indirect, special, or consequential loss or damage) which may be suffered or incurred by you or which may arise directly or indirectly in respect of goods or services supplied pursuant to an order placed on this Site or in respect of any failure or omission on our part to comply with our obligations as set out in this Agreement.</p>\r\n<h3>9. Specific warnings that we do not guarantee</h3>\r\n<p>9.1 You must ensure that your access to this Site is not illegal or prohibited by laws which apply to you.</p>\r\n<p>9.2 You must take your own precautions to ensure that the process which you employ for accessing this Site does not expose you to the risk of viruses, malicious computer code or other forms of interference which may damage your own computer system. We do not accept responsibility for any interference or damage to your own computer system which arises in connection with your use of this Site or any linked web site.</p>\r\n<p>9.3 Whilst we have no reason to believe that any information contained on this Site is inaccurate, we do not warrant the accuracy, adequacy or completeness of such information, nor do we undertake to keep this Site updated. We do not accept responsibility for loss suffered as a result of reliance by you upon the accuracy or currency of information contained on this Site.</p>\r\n<p>9.4 Responsibility for the content of Hyperlinks or advertisements appearing on this Site rests solely with the website operator of the hyperlink or the advertisers. The placement of such advertisements does not constitute a recommendation or endorsement by us of the advertisers\' products and each advertiser is solely responsible for any representations made in connection with its advertisement.</p>\r\n<p>9.5 We make no warranty that goods or services acquired from us over this Site will meet your requirements.</p>\r\n<p>9.6 Details contained on this Site relating to goods or services have been prepared in accordance with Turkish law and may not satisfy the laws of any other country. We do not warrant that the details on this Site concerning those goods or services will satisfy the laws of any other country. It is your responsibility to determine whether these details satisfy the laws of the jurisdiction where you reside (if that jurisdiction is outside Turkey) and if the details do not satisfy the laws of your jurisdiction, you may not order any goods or services from this Site.</p>\r\n<p>9.7 You acknowledge that despite all reasonable precautions on our part, there is a risk of unauthorised access to or alteration of your transmissions or data or of information contained on your computer system or on this Site. We do not accept responsibility or liability of any nature for any such losses which you may sustain as a result of such activity.</p>\r\n<h3>10. Copyright</h3>\r\n<p>Copyright in this Site (including text, graphics, logos, icons, sound recordings and software) is owned or licensed by us or by our Members. Other than for the purposes of, and subject to the conditions prescribed under, the <em>Copyright Act 1968 (Cth)</em> and similar legislation which applies in  your location, and except as expressly authorised by the Agreement, you may not in any form or by any means:   </p>\r\n<ul>\r\n<li>adapt, reproduce, store, distribute, print, display, perform, publish or create derivative works from any part of this Site; or</li>\r\n<li>commercialise any information, Products or services obtained from any part of this Site;</li>\r\n</ul>\r\n<p>without our written permission.</p>\r\n<h3>11. Trade marks</h3>\r\n<p>Except where otherwise specified, any word or device to which is attached the <em>TM</em> or <em>R</em> symbol is a registered trade mark. Some trade marks may not display these symbols, but nevertheless, are registered or unregistered trade marks.</p>\r\n<p>You must not use any of the trade marks displayed on the Site:</p>\r\n<ul>\r\n<li>in or as the whole or part of your own trade marks or trade marks visible on the Site;</li>\r\n<li>in connection with activities, products or services which are not ours;</li>\r\n<li>in a manner which may be confusing, misleading or deceptive;</li>\r\n<li>in a manner that disparages us or our information, products or services (including this Site).</li>\r\n</ul>\r\n<h3>12. Restricted use</h3>\r\n<p>Unless we agree otherwise in writing, you are provided with access to this Site only for your personal use. Without limiting the foregoing, you may not without our written permission on-sell information obtained from this Site.</p>\r\n<h3>13. Hyperlinked or linked web sites</h3>\r\n<p>13.1 This Site may contain links to other web sites ( \"linked web sites\" ). Those links are provided for convenience only and may not remain current or be maintained.</p>\r\n<p>13.2 We are not responsible for the content or privacy practises associated with linked web sites.</p>\r\n<p>13.3 Our links with linked web sites should not be construed as an endorsement, approval or recommendation by us of the owners or operators of those linked web sites, or of any information, graphics, materials, products or services referred to or contained on those linked web sites, unless and to the extent stipulated to the contrary.</p>\r\n<h3>14. Privacy policy</h3>\r\n<p>We undertake to comply with the terms of our privacy policy which is annexed to this Agreement.</p>\r\n<h3>15. Security of information</h3>\r\n<p>Unfortunately, no data transmission over the Internet can be guaranteed as totally secure. Whilst we have taken precautions to protect such information, we do not warrant and cannot ensure the security of any information which you transmit to us. Accordingly, any information which you transmit to us is transmitted at your own risk. Nevertheless, once we receive your transmission, we will take reasonable steps to preserve the security of such information.</p>\r\n<h3>16. Termination of access</h3>\r\n<p>Access to this Site may be terminated at any time by us without notice. Our disclaimer will nevertheless survive any such termination.</p>\r\n<h3>17. E-mails</h3>\r\n<p>We will preserve the content of any e-mail you send us if we believe we have the legal requirement to do so. Your e-mail message content may be monitored by us for trouble-shooting or maintenance purposes or if any form of e-mail abuse is suspected.</p>\r\n<h3>18. Alertanive dispute resolution</h3>\r\n<p>18.1 Any dispute arising in connection with this Agreement which cannot be settled by negotiation between the Parties or their representatives may be submitted at our sole discretion to arbitration. During such arbitration, both Parties may at our sole discretion be legally represented.</p>\r\n<p>18.2 Prior to referring a matter to arbitration pursuant to subclause 26.1, the Parties will, at our sole discretion, in good faith explore the prospect of mediation.</p>\r\n<p>18.3 Nothing in this clause will prevent a Party from seeking urgent equitable relief before an appropriate court.</p>\r\n<h3>19. General</h3>\r\n<p>19.1 We accept no liability for any failure to comply with this Agreement where such failure is due to circumstance beyond our reasonable control.</p>\r\n<p>19.2 If we waive any rights available to us under this Agreement on one occasion, this does not mean that those rights will automatically be waived on any other occasion.</p>\r\n<p>19.3 If any of the terms and conditions in the Agreement are held to be invalid, unenforceable or illegal for any reason, the remaining terms and conditions shall nevertheless continue in full force.</p>\r\n<p>19.4 This Agreement shall be construed according to the laws of Turkey.</p>\r\n<p>19.5 Any notice, given under this Agreement shall be in writing and shall be delivered to CodeGrape.</p>\r\n<h3>20. Acknowledgement</h3>\r\n<p>20.1 You acknowledge that you have read the complete statement of this Agreement, understand it, and agree to be bound by its terms and conditions.</p>\r\n<p>20.2 Your further agree that you have read the CodeGrape Privacy Statement and if applicable the CodeGrape Membership Agreement and the CodeGrape Exclusive Distribution Agreement, understand them, and agree to be bound by their terms and conditions.</p>\r\n<p>20.3 To the extent of any inconsistencies that may arise between the Agreements referred to in subclause 20.2, this Agreement will prevail.</p>\r\n<p>20.4 To return to the Site, click where indicated. By doing so, you acknowledge that you have read, understood and accept the above terms of use.</p>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<ul class=\"sidebar-nav\">\r\n<li class=\"active\"><a class=\"active\" href=\"https://www.codegrape.com/legal-information/website-terms-of-access\"> Website Terms of Access</a></li>\r\n<li><a href=\"https://www.codegrape.com/legal-information/membership-agreement\"> Membership Agreement</a></li>\r\n<li><a href=\"https://www.codegrape.com/legal-information/privacy-policy\"> Privacy Policy</a></li>\r\n<li><a href=\"https://www.codegrape.com/legal-information/pricing-licensing\"> Pricing & Licensing</a></li>\r\n</ul>\r\n<div class=\"empty-h\"> </div>\r\n</div>\r\n</div>\r\n</div>',NULL,NULL,'2017-07-26 22:07:35','2017-07-26 22:07:35'),
	(4,'General','faqs','<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-9\">\r\n<h3 class=\"pt-0\">Select a question to begin:</h3>\r\n<ul>\r\n<li><a href=\"#question1\" rel=\"nofollow\">How does CodeGrape work?</a></li>\r\n<li><a href=\"#question2\" rel=\"nofollow\">How long will it take Support to answer my support ticket?</a></li>\r\n</ul>\r\n<h3><a rel=\"nofollow\" name=\"question1\"></a>How does CodeGrape work?</h3>\r\n<p>CodeGrape allows you to buy royalty-free scripts, themes, plugins, print, graphics and mobile apps from independent authors.</p>\r\n<p>Because files are generally priced quite cheaply we use a system of depositing cash so that you don\'t need to keep running credit card transactions for each item. This is particularly useful for items priced around $1 where credit card fees would cost up to 50% of the purchase price.</p>\r\n<p>You can find what you need by searching or browsing. For more, see out <a href=\"https://www.codegrape.com/faqs/purchasing\">FAQ on Purchasing</a>.</p>\r\n<p>You can also sell items on CodeGrape. Upload scripts, themes, plugins, print, graphics and mobile apps and reap the rewards. For more on selling on CodeGrape, see our <a href=\"https://www.codegrape.com/faqs/selling\">FAQ on Selling</a>.</p>\r\n<h3><a rel=\"nofollow\" name=\"question2\"></a>How long will it take Support to answer my support ticket?</h3>\r\n<p>Support is open everyday.</p>\r\n<p>Support tickets are generally answered within two working days, however complex support tickets may take longer.</p>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<ul class=\"sidebar-nav\">\r\n<li class=\"active\"><a class=\"active\" href=\"../../../../page/faqs/\"> General</a></li>\r\n<li><a href=\"../../../page/subscription/\"> Subscription</a></li>\r\n<li><a href=\"../../../page/site-usage/\"> Site Usage</a></li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>',4,0,'2017-07-26 22:12:39','2017-08-24 22:41:43'),
	(6,'API','api','<div class=\"container\">\r\n<div id=\"row\">\r\n<div class=\"col-sm-9\">\r\n<h3>Welcome developers</h3>\r\n<p>This is the home for CodeGrape API. You can find all the documentation needed for connecting your site and systems to CodeGrape Market.</p>\r\n<p>In most cases, this API is tailored for selling on CodeGrape and includes tools for support, purchase notifications and much more.</p>\r\n<p>You can access account data (such as verify purchase, new files, active threads) via outside applications and without the use of your CodeGrape account password.</p>\r\n<h3>How do I use the API?</h3>\r\n<p>If you\'re a developer and would like to use the CodeGrape Market API for an application you\'re developing, you can <a href=\"https://www.codegrape.com/api/documentation\">access all the documentation here</a>.</p>\r\n<p>You can look at <a href=\"https://www.codegrape.com/api/applications\">applications here</a>.</p>\r\n<h3>Why do I need an API key?</h3>\r\n<p>Your API key gives outside applications permission to access your information inside the CodeGrape Market without needing to know your password. We will never ask you for your password. Do not ever give your password to anyone.</p>\r\n<h3>Locate your API Key</h3>\r\n<p>To get an API key, select <em>Settings</em> from the account dropdown, then navigate to the <em>API Key</em> tab.</p>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<ul class=\"sidebar-nav\">\r\n<li class=\"active\"><a class=\"active\" href=\"https://www.codegrape.com/api/general\"> General</a></li>\r\n<li><a href=\"https://www.codegrape.com/api/documentation\"> Documentation</a></li>\r\n<li><a href=\"https://www.codegrape.com/api/applications\"> Applications</a></li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>',2,NULL,'2017-07-26 22:18:46','2017-07-27 01:07:28'),
	(7,'Subscription','subscription','<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-9\">\r\n<h3 class=\"pt-0\">Select a question to begin:</h3>\r\n<ul>\r\n<li><a href=\"#question1\" rel=\"nofollow\">How does CodeGrape work?</a></li>\r\n<li><a href=\"#question2\" rel=\"nofollow\">How long will it take Support to answer my support ticket?</a></li>\r\n</ul>\r\n<h3><a rel=\"nofollow\" name=\"question1\"></a>How does CodeGrape work?</h3>\r\n<p>CodeGrape allows you to buy royalty-free scripts, themes, plugins, print, graphics and mobile apps from independent authors.</p>\r\n<p>Because files are generally priced quite cheaply we use a system of depositing cash so that you don\'t need to keep running credit card transactions for each item. This is particularly useful for items priced around $1 where credit card fees would cost up to 50% of the purchase price.</p>\r\n<p>You can find what you need by searching or browsing. For more, see out <a href=\"https://www.codegrape.com/faqs/purchasing\">FAQ on Purchasing</a>.</p>\r\n<p>You can also sell items on CodeGrape. Upload scripts, themes, plugins, print, graphics and mobile apps and reap the rewards. For more on selling on CodeGrape, see our <a href=\"https://www.codegrape.com/faqs/selling\">FAQ on Selling</a>.</p>\r\n<h3><a rel=\"nofollow\" name=\"question2\"></a>How long will it take Support to answer my support ticket?</h3>\r\n<p>Support is open everyday.</p>\r\n<p>Support tickets are generally answered within two working days, however complex support tickets may take longer.</p>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<ul class=\"sidebar-nav\">\r\n<li><a href=\"../../../../page/faqs/\"> General</a></li>\r\n<li class=\"active\"><a class=\"active\" href=\"../../../page/subscription/\"> Subscription</a></li>\r\n<li><a href=\"../../../page/site-usage/\"> Site Usage</a></li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>',4,0,'2017-08-24 22:32:44','2017-08-24 22:40:58'),
	(8,'Site Usage','site-usage','<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-sm-9\">\r\n<h3 class=\"pt-0\">Select a question to begin:</h3>\r\n<ul>\r\n<li><a href=\"#question1\" rel=\"nofollow\">How does CodeGrape work?</a></li>\r\n<li><a href=\"#question2\" rel=\"nofollow\">How long will it take Support to answer my support ticket?</a></li>\r\n</ul>\r\n<h3><a rel=\"nofollow\" name=\"question1\"></a>How does CodeGrape work?</h3>\r\n<p>CodeGrape allows you to buy royalty-free scripts, themes, plugins, print, graphics and mobile apps from independent authors.</p>\r\n<p>Because files are generally priced quite cheaply we use a system of depositing cash so that you don\'t need to keep running credit card transactions for each item. This is particularly useful for items priced around $1 where credit card fees would cost up to 50% of the purchase price.</p>\r\n<p>You can find what you need by searching or browsing. For more, see out <a href=\"https://www.codegrape.com/faqs/purchasing\">FAQ on Purchasing</a>.</p>\r\n<p>You can also sell items on CodeGrape. Upload scripts, themes, plugins, print, graphics and mobile apps and reap the rewards. For more on selling on CodeGrape, see our <a href=\"https://www.codegrape.com/faqs/selling\">FAQ on Selling</a>.</p>\r\n<h3><a rel=\"nofollow\" name=\"question2\"></a>How long will it take Support to answer my support ticket?</h3>\r\n<p>Support is open everyday.</p>\r\n<p>Support tickets are generally answered within two working days, however complex support tickets may take longer.</p>\r\n</div>\r\n<div class=\"col-sm-3\">\r\n<ul class=\"sidebar-nav\">\r\n<li><a href=\"../../../../page/faqs/\"> General</a></li>\r\n<li><a href=\"../../../page/subscription/\"> Subscription</a></li>\r\n<li class=\"active\"><a class=\"active\" href=\"../../../page/site-usage/\"> Site Usage</a></li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>',4,0,'2017-08-24 22:35:59','2017-08-24 22:41:27');

/*!40000 ALTER TABLE `2d_pages` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table 2d_payments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `2d_payments`;

CREATE TABLE `2d_payments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `subscription_id` varchar(35) DEFAULT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  `currency` varchar(5) DEFAULT '',
  `status` tinytext,
  `ip` varchar(45) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `date_end` timestamp NULL DEFAULT NULL,
  `trial_start` timestamp NULL DEFAULT NULL,
  `trial_end` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `2d_payments` WRITE;
/*!40000 ALTER TABLE `2d_payments` DISABLE KEYS */;

INSERT INTO `2d_payments` (`id`, `id_user`, `type`, `subscription_id`, `price`, `currency`, `status`, `ip`, `date_created`, `date_modified`, `date_end`, `trial_start`, `trial_end`)
VALUES
	(2,1,1,'sub_BFoHUNLTmN4CXo',19.99,'USD','trialing','127.0.0.1','2017-08-21 13:21:50','2017-08-21 13:21:50','2017-09-05 13:21:50',NULL,NULL),
	(3,1,1,'sub_BFrrsGtTEuj0Vq',19.99,'USD','canceled','127.0.0.1','2017-08-21 17:04:13','2017-08-23 20:48:01','2017-09-05 17:04:12',NULL,NULL),
	(4,1,0,'ch_1AuMe4J1NbQkyZJ2dH3aff2E',29.99,'USD','succeeded','127.0.0.1','2017-08-24 11:49:21','2017-08-24 11:49:21','2017-09-03 11:49:21',NULL,NULL),
	(5,1,1,'sub_BI72JjGzPG17VE',29.99,'USD','trialing','127.0.0.1','2017-08-27 16:52:46','2017-08-27 16:52:46','2017-09-11 16:52:46',NULL,NULL),
	(6,1,1,'sub_BI7A5znsJ9001G',29.99,'USD','trialing','127.0.0.1','2017-08-27 17:00:59','2017-08-27 17:00:59','2017-09-11 17:00:58',NULL,NULL),
	(7,1,1,'sub_BI7B3MygF6A1vS',29.99,'USD','trialing','127.0.0.1','2017-08-27 17:02:06','2017-08-27 17:02:06','2017-09-11 17:02:05',NULL,NULL),
	(8,1,1,'sub_BI7FPKuMzhn4mA',29.99,'USD','trialing','127.0.0.1','2017-08-27 17:06:17','2017-08-27 17:06:17','2017-09-11 17:06:16',NULL,NULL),
	(9,1,1,'sub_BI7H99SmDEyBza',29.99,'USD','active','127.0.0.1','2017-08-27 17:08:12','2017-08-27 17:08:12','2017-09-27 17:08:11',NULL,NULL);

/*!40000 ALTER TABLE `2d_payments` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table 2d_playlists
# ------------------------------------------------------------

DROP TABLE IF EXISTS `2d_playlists`;

CREATE TABLE `2d_playlists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `ids_videos` varchar(200) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `2d_playlists` WRITE;
/*!40000 ALTER TABLE `2d_playlists` DISABLE KEYS */;

INSERT INTO `2d_playlists` (`id`, `title`, `id_user`, `ids_videos`, `date_created`, `date_modified`)
VALUES
	(4,'See Later',1,'12','2017-08-16 20:34:50','2017-08-23 20:46:51'),
	(5,'tes',1,'3','2017-08-21 21:39:23','2017-08-23 20:46:51'),
	(6,'test',1,'18','2017-08-23 20:46:43','2017-08-23 20:46:51');

/*!40000 ALTER TABLE `2d_playlists` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table 2d_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `2d_posts`;

CREATE TABLE `2d_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `ids_keywords` varchar(100) DEFAULT NULL,
  `content` mediumtext,
  `image` varchar(200) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `title_UNIQUE` (`title`),
  UNIQUE KEY `url_UNIQUE` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `2d_posts` WRITE;
/*!40000 ALTER TABLE `2d_posts` DISABLE KEYS */;

INSERT INTO `2d_posts` (`id`, `title`, `url`, `id_category`, `ids_keywords`, `content`, `image`, `status`, `author`, `date_created`, `date_modified`)
VALUES
	(1,'First post in this category','first-post-in-this-category',1,'\"1\",\"2\"','<h2>Why Store Data Online?</h2>\r\n<h3>The false comparison</h3>\r\n<p><a href=\"https://greedeals.com/deal/zoolz-cloud-storage-lifetime/?ref=codegrape\" target=\"_blank\" rel=\"noopener noreferrer\">Zoolz cloud storage enables you to store data online.</a> But why would you want to do that? Well, there’s an analogy that people sometimes use. And it’s wrong. So let’s get that out of the way first.</p>\r\n<p>The analogy that you sometimes hear compares cloud storage with those windowless buildings you see on the outskirts of most American cities. They are there for storage. People who, temporarily or permanently, have more stuff than their home has room for, rent space in one of those buildings to store it. It might be excess furniture that they could sell one day but might need if they move home. It might be pushchairs and small bicycles with trainer wheels; they haven’t decided whether or not to have another baby, so they don’t want to get rid of it permanently.</p>\r\n<p><a href=\"https://greedeals.com/deal/zoolz-cloud-storage-lifetime/?ref=codegrape\" target=\"_blank\" rel=\"noopener noreferrer\">What some people will tell you is that Zoolz cloud storage is like that – it’s where you store files that you don’t currently have room for. </a>And that is very misleading. Why? Because there’s a fundamental difference between your home and your computer. Homes don’t crash. Computers do.</p>\r\n<p>Oh, sure, a house fire can send all your furniture, clothes and personal belongings up in smoke. That’s what you have insurance for. The insurance company gives you the money to replace everything that was damaged or lost. That doesn’t work with computer data. If you are running any business on your computer – or if you just keep personal information and your tax returns on there – when data is gone thanks to a computer crash, it’s gone. And if it’s business information, chances are your business is gone, too.</p>\r\n<p>So, the difference between those storage depots that hold your furniture and online storage is simple. In the storage depot, you keep only those things you don’t want at home right now. In online storage, you keep everything. EVERYTHING. Because, if you only have it in one place, then if anything happens to it you will never recover.</p>\r\n<h3>What can cloud storage do for you?</h3>\r\n<p><img class=\"size-full wp-image-8633 aligncenter\" src=\"https://d1hdzr4c6m1vlb.cloudfront.net/wp-content/uploads/2017/06/12091610/cloud-computing-2116773_1920.jpg\" alt=\"cloud storage\" width=\"1920\" height=\"1280\"></p>\r\n<p>That word “cloud” can be confusing. It makes it sound as though cloud storage is somehow “up there.” Out in space. Insubstantial. Lacking solidity. And, of course, that’s not how it is. Everything in the “cloud” is, in fact, right here on earth. Except that “right here” is misleading because the servers on which your files are stored can be anywhere. They might be in the same city as you, and they might be on another continent. In fact, they may be both, because of redundancy – but we’ll get to that in a moment. The servers on which Zoolz cloud storage keeps your data belong to AWS (Amazon Web Services). You can’t get more secure than that.</p>\r\n<h3>The best cloud storage services</h3>\r\n<p>It isn’t difficult to see what makes a cloud storage service the best. You need:</p>\r\n<ul>\r\n<li>Absolute security, through encryption and redundancy</li>\r\n<li>Differentiated cold storage (archival) and instant storage (backup) services</li>\r\n<li>Speed and power</li>\r\n<li>Ability to handle unlimited external and network drives</li>\r\n</ul>\r\n<h3>Why is cloud storage best suited for every concern?</h3>\r\n<h4>What’s the difference between cold storage and instant storage?</h4>\r\n<p>Whoever you are, you have two kinds of data. <a href=\"https://greedeals.com/deal/zoolz-cloud-storage-lifetime/?ref=codegrape\" target=\"_blank\" rel=\"noopener noreferrer\">That’s why Zoolz cloud storage comes in two flavors: cold storage, and instant storage.</a> The difference is simple. Some of your stored data is data and applications that, if you lost them, you would need to replace instantly. Those files need what is known as “backup,” an expression that has been around a long time and of which we are sure you know the meaning. Zoolz cloud storage keeps that data in instant storage which means it can be back on your disk virtually instantaneously. Something went wrong, you lost data, it could have been a huge blow to your business, but it wasn’t because you recovered it immediately.</p>\r\n<p>But then there is other data that you won’t need urgently, and you may never need at all. Copies of photographs. Past financial reports, that in most cases are never looked at again, but that you just might need to lay hands on. Old product files – not needed now, but the law says you must hold them for seven years. And so on. Most people and most companies have masses of stuff like that. It can choke your computer. So, you store it in Zoolz cold storage. Information stored there may take a few hours to recover, so be sure to differentiate between backup data that you may need instantly and other files that you must keep but may never need.</p>\r\n<h4>It isn’t that simple, though. The difference between backup and storage</h4>\r\n<p>It’s easy to confuse these two terms, but getting them wrong can be fatal. When you store files in Zoolz cold storage, they stay there until you, take steps to remove them. That way, you are protected against accidental loss of a file that, perhaps for regulatory purposes, you must always be able to retrieve if it is called for.</p>\r\n<p>On the other hand,<a href=\"https://greedeals.com/deal/zoolz-cloud-storage-lifetime/?ref=codegrape\"> when you use Zoolz </a>cloud storage for instant recovery, chances are it’s for backup purposes. What that means is that, when you create a new file on your system, you want a copy of that file to be created in the cloud. When you modify or delete files on your own system, you want the corresponding files in the cloud also to be amended or deleted. In other words, you want the files in the cloud to be a mirror image of the files on your system. That’s how backup works – it mirrors in the cloud everything you do on your system.</p>\r\n<p>What you must never lose sight of is: you need both. You want a backup, and you want file storage. They do different jobs. Just imagine deciding that you’re going to store in the cloud files that you must keep but don’t look at from one year’s end to the next. You upload them to the cloud – but as backup files when you should have uploaded them to storage. Then you delete them on your computer. Well, that was the point of the exercise, wasn’t it? But now, because you tagged them as a backup and not storage, next time backup runs it thinks, ‘Oh, they don’t want these files anymore’ – and deletes them in the cloud. Disaster! Fortunately, Zoolz cloud storage knows that to err is human, and so it gives you 30 days in which you can recover the data you should never have deleted.</p>\r\n<h4>Redundancy</h4>\r\n<p>If something can go wrong with your computer, it can go wrong with somebody else’s. Like the server on which your cloud data is being held. They are very well looked after and protected, those servers, but a huge data surge, a flood, or a lightning strike can wreck any data center. And so we have redundancy: all of your files stored simultaneously on some servers in completely different places. It’s belt and braces carried to extremes. The purpose is to make sure that your data is never lost. Isn’t that why you signed up to the service?</p>\r\n<h4>Encryption</h4>\r\n<p>You meet some very nice people on the Internet. There are a few of the other kind, too. Individuals who would like nothing better than to hack your data and either blackmail you with it or sell it to your competitors. Encryption is what prevents that. Even if someone managed to get at your data, they couldn’t do anything with it, because they couldn’t read it.</p>\r\n<h2><a href=\"https://greedeals.com/deal/zoolz-cloud-storage-lifetime/?ref=codegrape\">The Zoolz cloud storage deal</a></h2>\r\n<p><img class=\"size-full wp-image-8634 aligncenter\" src=\"https://d1hdzr4c6m1vlb.cloudfront.net/wp-content/uploads/2017/06/12091714/1-TB-Cloud-Storage-for-LIFETIME.png\" alt=\"\" width=\"800\" height=\"500\"></p>\r\n<p>For a short time, we are offering <a href=\"https://greedeals.com/deal/zoolz-cloud-storage-lifetime/?ref=codegrape\">a very special deal</a>. For a shade under $40, you can have one terabyte of lifetime cloud storage. You’ll have absolute security, your data will be logically structured and stored, and it doesn’t matter whether you use Windows or a Mac – you’re covered.</p>\r\n<ul>\r\n<li>Security the same as the US Government uses</li>\r\n<li>Your data stored, using Amazon Web Services, at multiple locations and, in each location, on multiple devices</li>\r\n<li>Cold storage and instant storage, so that your archival and backup needs are fully catered for</li>\r\n<li>Schedule backup to suit your needs</li>\r\n<li>And – it’s yours for a lifetime!</li>\r\n</ul>\r\n<p>Greedeals exists to bring our customers the very best deals available. By partnering with some of the best third parties around – in this case, Zoolz – we can offer prices that just can’t be beaten. They’re all time-limited, though, because that’s what our partners demand. So, please: don’t look at this and think, “Oh, it sounds interesting. I must take another look at that when I’m less busy.” Because chances are, it won’t still be there. <a href=\"https://greedeals.com/deal/zoolz-cloud-storage-lifetime/?ref=codegrape\">Click now</a> and get this brilliant deal before it disappears.</p>','http://www.videotube.dev/uploads/images/posts/cloud-storage-service1.png',1,1,'2017-07-02 22:23:32',NULL),
	(2,'First post in this ca sdkfh kjsdnf kjhsdf knksdf lksdf tegory hdf dfhf jdsfk lsdkjflskdjf jd sdkfjs','first-post-in-this-categoryfirst-post-in-this-category',1,'\"1\",\"2\"','<h2>Why Store Data Online?</h2>\r\n<h3>The false comparison</h3>\r\n<p><a href=\"https://greedeals.com/deal/zoolz-cloud-storage-lifetime/?ref=codegrape\" target=\"_blank\" rel=\"noopener noreferrer\">Zoolz cloud storage enables you to store data online.</a> But why would you want to do that? Well, there’s an analogy that people sometimes use. And it’s wrong. So let’s get that out of the way first.</p>\r\n<p>The analogy that you sometimes hear compares cloud storage with those windowless buildings you see on the outskirts of most American cities. They are there for storage. People who, temporarily or permanently, have more stuff than their home has room for, rent space in one of those buildings to store it. It might be excess furniture that they could sell one day but might need if they move home. It might be pushchairs and small bicycles with trainer wheels; they haven’t decided whether or not to have another baby, so they don’t want to get rid of it permanently.</p>\r\n<p><a href=\"https://greedeals.com/deal/zoolz-cloud-storage-lifetime/?ref=codegrape\" target=\"_blank\" rel=\"noopener noreferrer\">What some people will tell you is that Zoolz cloud storage is like that – it’s where you store files that you don’t currently have room for. </a>And that is very misleading. Why? Because there’s a fundamental difference between your home and your computer. Homes don’t crash. Computers do.</p>\r\n<p>Oh, sure, a house fire can send all your furniture, clothes and personal belongings up in smoke. That’s what you have insurance for. The insurance company gives you the money to replace everything that was damaged or lost. That doesn’t work with computer data. If you are running any business on your computer – or if you just keep personal information and your tax returns on there – when data is gone thanks to a computer crash, it’s gone. And if it’s business information, chances are your business is gone, too.</p>\r\n<p>So, the difference between those storage depots that hold your furniture and online storage is simple. In the storage depot, you keep only those things you don’t want at home right now. In online storage, you keep everything. EVERYTHING. Because, if you only have it in one place, then if anything happens to it you will never recover.</p>\r\n<h3>What can cloud storage do for you?</h3>\r\n<p><img class=\"size-full wp-image-8633 aligncenter\" src=\"https://d1hdzr4c6m1vlb.cloudfront.net/wp-content/uploads/2017/06/12091610/cloud-computing-2116773_1920.jpg\" alt=\"cloud storage\" width=\"1920\" height=\"1280\"></p>\r\n<p>That word “cloud” can be confusing. It makes it sound as though cloud storage is somehow “up there.” Out in space. Insubstantial. Lacking solidity. And, of course, that’s not how it is. Everything in the “cloud” is, in fact, right here on earth. Except that “right here” is misleading because the servers on which your files are stored can be anywhere. They might be in the same city as you, and they might be on another continent. In fact, they may be both, because of redundancy – but we’ll get to that in a moment. The servers on which Zoolz cloud storage keeps your data belong to AWS (Amazon Web Services). You can’t get more secure than that.</p>\r\n<h3>The best cloud storage services</h3>\r\n<p>It isn’t difficult to see what makes a cloud storage service the best. You need:</p>\r\n<ul>\r\n<li>Absolute security, through encryption and redundancy</li>\r\n<li>Differentiated cold storage (archival) and instant storage (backup) services</li>\r\n<li>Speed and power</li>\r\n<li>Ability to handle unlimited external and network drives</li>\r\n</ul>\r\n<h3>Why is cloud storage best suited for every concern?</h3>\r\n<h4>What’s the difference between cold storage and instant storage?</h4>\r\n<p>Whoever you are, you have two kinds of data. <a href=\"https://greedeals.com/deal/zoolz-cloud-storage-lifetime/?ref=codegrape\" target=\"_blank\" rel=\"noopener noreferrer\">That’s why Zoolz cloud storage comes in two flavors: cold storage, and instant storage.</a> The difference is simple. Some of your stored data is data and applications that, if you lost them, you would need to replace instantly. Those files need what is known as “backup,” an expression that has been around a long time and of which we are sure you know the meaning. Zoolz cloud storage keeps that data in instant storage which means it can be back on your disk virtually instantaneously. Something went wrong, you lost data, it could have been a huge blow to your business, but it wasn’t because you recovered it immediately.</p>\r\n<p>But then there is other data that you won’t need urgently, and you may never need at all. Copies of photographs. Past financial reports, that in most cases are never looked at again, but that you just might need to lay hands on. Old product files – not needed now, but the law says you must hold them for seven years. And so on. Most people and most companies have masses of stuff like that. It can choke your computer. So, you store it in Zoolz cold storage. Information stored there may take a few hours to recover, so be sure to differentiate between backup data that you may need instantly and other files that you must keep but may never need.</p>\r\n<h4>It isn’t that simple, though. The difference between backup and storage</h4>\r\n<p>It’s easy to confuse these two terms, but getting them wrong can be fatal. When you store files in Zoolz cold storage, they stay there until you, take steps to remove them. That way, you are protected against accidental loss of a file that, perhaps for regulatory purposes, you must always be able to retrieve if it is called for.</p>\r\n<p>On the other hand,<a href=\"https://greedeals.com/deal/zoolz-cloud-storage-lifetime/?ref=codegrape\"> when you use Zoolz </a>cloud storage for instant recovery, chances are it’s for backup purposes. What that means is that, when you create a new file on your system, you want a copy of that file to be created in the cloud. When you modify or delete files on your own system, you want the corresponding files in the cloud also to be amended or deleted. In other words, you want the files in the cloud to be a mirror image of the files on your system. That’s how backup works – it mirrors in the cloud everything you do on your system.</p>\r\n<p>What you must never lose sight of is: you need both. You want a backup, and you want file storage. They do different jobs. Just imagine deciding that you’re going to store in the cloud files that you must keep but don’t look at from one year’s end to the next. You upload them to the cloud – but as backup files when you should have uploaded them to storage. Then you delete them on your computer. Well, that was the point of the exercise, wasn’t it? But now, because you tagged them as a backup and not storage, next time backup runs it thinks, ‘Oh, they don’t want these files anymore’ – and deletes them in the cloud. Disaster! Fortunately, Zoolz cloud storage knows that to err is human, and so it gives you 30 days in which you can recover the data you should never have deleted.</p>\r\n<h4>Redundancy</h4>\r\n<p>If something can go wrong with your computer, it can go wrong with somebody else’s. Like the server on which your cloud data is being held. They are very well looked after and protected, those servers, but a huge data surge, a flood, or a lightning strike can wreck any data center. And so we have redundancy: all of your files stored simultaneously on some servers in completely different places. It’s belt and braces carried to extremes. The purpose is to make sure that your data is never lost. Isn’t that why you signed up to the service?</p>\r\n<h4>Encryption</h4>\r\n<p>You meet some very nice people on the Internet. There are a few of the other kind, too. Individuals who would like nothing better than to hack your data and either blackmail you with it or sell it to your competitors. Encryption is what prevents that. Even if someone managed to get at your data, they couldn’t do anything with it, because they couldn’t read it.</p>\r\n<h2><a href=\"https://greedeals.com/deal/zoolz-cloud-storage-lifetime/?ref=codegrape\">The Zoolz cloud storage deal</a></h2>\r\n<p><img class=\"size-full wp-image-8634 aligncenter\" src=\"https://d1hdzr4c6m1vlb.cloudfront.net/wp-content/uploads/2017/06/12091714/1-TB-Cloud-Storage-for-LIFETIME.png\" alt=\"\" width=\"800\" height=\"500\"></p>\r\n<p>For a short time, we are offering <a href=\"https://greedeals.com/deal/zoolz-cloud-storage-lifetime/?ref=codegrape\">a very special deal</a>. For a shade under $40, you can have one terabyte of lifetime cloud storage. You’ll have absolute security, your data will be logically structured and stored, and it doesn’t matter whether you use Windows or a Mac – you’re covered.</p>\r\n<ul>\r\n<li>Security the same as the US Government uses</li>\r\n<li>Your data stored, using Amazon Web Services, at multiple locations and, in each location, on multiple devices</li>\r\n<li>Cold storage and instant storage, so that your archival and backup needs are fully catered for</li>\r\n<li>Schedule backup to suit your needs</li>\r\n<li>And – it’s yours for a lifetime!</li>\r\n</ul>\r\n<p>Greedeals exists to bring our customers the very best deals available. By partnering with some of the best third parties around – in this case, Zoolz – we can offer prices that just can’t be beaten. They’re all time-limited, though, because that’s what our partners demand. So, please: don’t look at this and think, “Oh, it sounds interesting. I must take another look at that when I’m less busy.” Because chances are, it won’t still be there. <a href=\"https://greedeals.com/deal/zoolz-cloud-storage-lifetime/?ref=codegrape\">Click now</a> and get this brilliant deal before it disappears.</p>','http://www.videotube.dev/uploads/images/posts/cloud-storage-service1.png',1,1,'2017-07-02 22:23:32',NULL),
	(3,'New exemple Post','new-exemple-post',2,'\"1\"','<p>try new post with other category</p>','http://www.videotube.dev/uploads/images/posts/inside-out-medium1.jpg',1,1,'2017-07-13 18:17:34',NULL),
	(4,'Exemple Post','exemple-post',1,'\"1\"','',NULL,1,1,'2017-08-17 13:19:45',NULL),
	(5,'exemple Post 2','exemple-post-2',1,'\"1\"','',NULL,1,1,'2017-08-17 13:19:53',NULL),
	(6,'Exemple Post 3','exemple-post-3',1,'\"1\"','',NULL,1,1,'2017-08-17 13:19:59',NULL),
	(7,'sdfdsf','sdfdsf',2,NULL,'<p>dsfdsf</p>',NULL,0,1,'2017-08-23 21:00:28',NULL),
	(8,'sdfsd','sdfsd',2,'2','<p>sdf</p>',NULL,1,1,'2017-08-23 21:04:12',NULL),
	(9,'ffff','ffff',2,'2','<p>fff</p>',NULL,0,1,'2017-08-23 21:19:57',NULL);

/*!40000 ALTER TABLE `2d_posts` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table 2d_posts_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `2d_posts_categories`;

CREATE TABLE `2d_posts_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `id_relation` int(11) DEFAULT '0',
  `description` varchar(200) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `title_UNIQUE` (`title`),
  UNIQUE KEY `url_UNIQUE` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `2d_posts_categories` WRITE;
/*!40000 ALTER TABLE `2d_posts_categories` DISABLE KEYS */;

INSERT INTO `2d_posts_categories` (`id`, `title`, `url`, `id_relation`, `description`, `image`, `date_created`, `date_modified`)
VALUES
	(1,'Science fiction','science-fiction',0,'<p>description ici...</p>',NULL,NULL,NULL),
	(2,'Second Category','second-category',0,'<p>My own description</p>',NULL,NULL,NULL);

/*!40000 ALTER TABLE `2d_posts_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table 2d_posts_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `2d_posts_comments`;

CREATE TABLE `2d_posts_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(100) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_post` int(11) DEFAULT NULL,
  `id_relation` int(11) DEFAULT '0',
  `score` int(11) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `2d_posts_comments` WRITE;
/*!40000 ALTER TABLE `2d_posts_comments` DISABLE KEYS */;

INSERT INTO `2d_posts_comments` (`id`, `comment`, `id_user`, `id_post`, `id_relation`, `score`, `ip`, `status`, `date_created`, `date_modified`)
VALUES
	(1,'first comment',1,1,0,NULL,'127.0.0.1',NULL,'2017-07-03 20:16:03',NULL),
	(2,'Responce :)',1,1,1,NULL,'127.0.0.1',NULL,'2017-07-04 20:08:20',NULL),
	(3,'test',1,6,0,NULL,'127.0.0.1',3,'2017-08-17 19:32:28',NULL);

/*!40000 ALTER TABLE `2d_posts_comments` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table 2d_posts_keywords
# ------------------------------------------------------------

DROP TABLE IF EXISTS `2d_posts_keywords`;

CREATE TABLE `2d_posts_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(200) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `title_UNIQUE` (`title`),
  UNIQUE KEY `url_UNIQUE` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `2d_posts_keywords` WRITE;
/*!40000 ALTER TABLE `2d_posts_keywords` DISABLE KEYS */;

INSERT INTO `2d_posts_keywords` (`id`, `title`, `url`, `description`, `image`, `date_created`, `date_modified`)
VALUES
	(1,'Cinema','cinema','<p>ffff</p>',NULL,'2017-07-02 22:20:54',NULL),
	(2,'Horreur','horreur',NULL,NULL,'2017-07-02 22:20:59',NULL);

/*!40000 ALTER TABLE `2d_posts_keywords` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table 2d_posts_likes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `2d_posts_likes`;

CREATE TABLE `2d_posts_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_com` int(11) DEFAULT NULL,
  `nb_like` int(11) DEFAULT '0',
  `nb_unlike` int(11) DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `2d_posts_likes` WRITE;
/*!40000 ALTER TABLE `2d_posts_likes` DISABLE KEYS */;

INSERT INTO `2d_posts_likes` (`id`, `id_user`, `id_com`, `nb_like`, `nb_unlike`, `date_created`, `date_modified`)
VALUES
	(1,1,5,1,0,'2017-08-02 22:03:23',NULL);

/*!40000 ALTER TABLE `2d_posts_likes` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table 2d_profiles_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `2d_profiles_comments`;

CREATE TABLE `2d_profiles_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(100) DEFAULT NULL,
  `id_user_page` int(11) DEFAULT NULL,
  `id_user_member` int(11) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `2d_profiles_comments` WRITE;
/*!40000 ALTER TABLE `2d_profiles_comments` DISABLE KEYS */;

INSERT INTO `2d_profiles_comments` (`id`, `comment`, `id_user_page`, `id_user_member`, `ip`, `date_created`, `date_modified`)
VALUES
	(1,'test',1,1,'127.0.0.1','2017-07-16 16:35:50',NULL),
	(2,'test',1,1,'127.0.0.1','2017-07-16 16:36:18',NULL),
	(3,'testtt',1,1,'127.0.0.1','2017-07-16 16:51:22',NULL);

/*!40000 ALTER TABLE `2d_profiles_comments` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table 2d_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `2d_sessions`;

CREATE TABLE `2d_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `2d_sessions` WRITE;
/*!40000 ALTER TABLE `2d_sessions` DISABLE KEYS */;

INSERT INTO `2d_sessions` (`id`, `ip_address`, `timestamp`, `data`)
VALUES
	('6faba99faadaa0b2b4e1963d990e45da3962209f','::1',1504056478,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343035363437383B'),
	('a8c1dd7bccf04a3224ac89c393a7f5e147a572dc','::1',1504057132,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343035373133323B4642524C485F73746174657C733A33323A223565373636316538336665326136343566666265356363376361643461646338223B746F6B656E7C733A32373A22594B6B5665774141414141413175764841414142586A44444B5751223B746F6B656E5F7365637265747C733A33323A223764676F4B4C3535445A716A6F7955676F47334772456467384E684662397459223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('5924a277ca55c0558f9738d863664ce01ff6a565','::1',1504057522,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343035373532323B4642524C485F73746174657C733A33323A223565373636316538336665326136343566666265356363376361643461646338223B746F6B656E7C733A32373A22594B6B5665774141414141413175764841414142586A44444B5751223B746F6B656E5F7365637265747C733A33323A223764676F4B4C3535445A716A6F7955676F47334772456467384E684662397459223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('fb19f86a909441c7c2b118230d8aa94f3954afd5','::1',1504057912,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343035373931323B4642524C485F73746174657C733A33323A223565373636316538336665326136343566666265356363376361643461646338223B746F6B656E7C733A32373A22594B6B5665774141414141413175764841414142586A44444B5751223B746F6B656E5F7365637265747C733A33323A223764676F4B4C3535445A716A6F7955676F47334772456467384E684662397459223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('825d4099c6f90fb5616a23b30df2408eff91c895','::1',1504058324,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343035383332343B4642524C485F73746174657C733A33323A223565373636316538336665326136343566666265356363376361643461646338223B746F6B656E7C733A32373A22594B6B5665774141414141413175764841414142586A44444B5751223B746F6B656E5F7365637265747C733A33323A223764676F4B4C3535445A716A6F7955676F47334772456467384E684662397459223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('fa8e56ff9ef7cf66435204c77555e84c20a4a163','::1',1504058752,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343035383735323B4642524C485F73746174657C733A33323A223565373636316538336665326136343566666265356363376361643461646338223B746F6B656E7C733A32373A22594B6B5665774141414141413175764841414142586A44444B5751223B746F6B656E5F7365637265747C733A33323A223764676F4B4C3535445A716A6F7955676F47334772456467384E684662397459223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('e75295c3a9f45fb9ba067623130db0801018c932','::1',1504059068,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343035393036383B4642524C485F73746174657C733A33323A223565373636316538336665326136343566666265356363376361643461646338223B746F6B656E7C733A32373A22594B6B5665774141414141413175764841414142586A44444B5751223B746F6B656E5F7365637265747C733A33323A223764676F4B4C3535445A716A6F7955676F47334772456467384E684662397459223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('0dd541d238bb2cb319ff89725d1af47700d1ba7e','::1',1504059728,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343035393732383B4642524C485F73746174657C733A33323A223565373636316538336665326136343566666265356363376361643461646338223B746F6B656E7C733A32373A22594B6B5665774141414141413175764841414142586A44444B5751223B746F6B656E5F7365637265747C733A33323A223764676F4B4C3535445A716A6F7955676F47334772456467384E684662397459223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('fe54189d8c6d43868b747520bb7caa2cd131ce8c','::1',1504060041,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036303034313B4642524C485F73746174657C733A33323A223565373636316538336665326136343566666265356363376361643461646338223B746F6B656E7C733A32373A22594B6B5665774141414141413175764841414142586A44444B5751223B746F6B656E5F7365637265747C733A33323A223764676F4B4C3535445A716A6F7955676F47334772456467384E684662397459223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('873b7c72eb69295d14388b0ba9f432ec6efe58ef','::1',1504060426,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036303432363B4642524C485F73746174657C733A33323A223565373636316538336665326136343566666265356363376361643461646338223B746F6B656E7C733A32373A22594B6B5665774141414141413175764841414142586A44444B5751223B746F6B656E5F7365637265747C733A33323A223764676F4B4C3535445A716A6F7955676F47334772456467384E684662397459223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('ddc2a80affa9baf2c829d10a4581cc95cb7f595a','::1',1504060795,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036303739353B4642524C485F73746174657C733A33323A223565373636316538336665326136343566666265356363376361643461646338223B746F6B656E7C733A32373A22594B6B5665774141414141413175764841414142586A44444B5751223B746F6B656E5F7365637265747C733A33323A223764676F4B4C3535445A716A6F7955676F47334772456467384E684662397459223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('d62ca267d45fed37fa2e795f1086675888a8327b','::1',1504061116,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036313131363B4642524C485F73746174657C733A33323A223565373636316538336665326136343566666265356363376361643461646338223B746F6B656E7C733A32373A22594B6B5665774141414141413175764841414142586A44444B5751223B746F6B656E5F7365637265747C733A33323A223764676F4B4C3535445A716A6F7955676F47334772456467384E684662397459223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('2140bdb628efb29e54e5ee0805bc3b309379bd67','::1',1504061444,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036313434343B4642524C485F73746174657C733A33323A223565373636316538336665326136343566666265356363376361643461646338223B746F6B656E7C733A32373A22594B6B5665774141414141413175764841414142586A44444B5751223B746F6B656E5F7365637265747C733A33323A223764676F4B4C3535445A716A6F7955676F47334772456467384E684662397459223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('2d6626909696b6c0796cc61d321288c529f34bcd','::1',1504061755,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036313735353B4642524C485F73746174657C733A33323A223565373636316538336665326136343566666265356363376361643461646338223B746F6B656E7C733A32373A22594B6B5665774141414141413175764841414142586A44444B5751223B746F6B656E5F7365637265747C733A33323A223764676F4B4C3535445A716A6F7955676F47334772456467384E684662397459223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('d8100ef34eee9fab6a654799f277ad2ac86fc471','::1',1504062169,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036323136393B4642524C485F73746174657C733A33323A223565373636316538336665326136343566666265356363376361643461646338223B746F6B656E7C733A32373A22594B6B5665774141414141413175764841414142586A44444B5751223B746F6B656E5F7365637265747C733A33323A223764676F4B4C3535445A716A6F7955676F47334772456467384E684662397459223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('44076a2a2ecf51710b512ef12a239d2a27797cae','::1',1504062558,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036323535383B4642524C485F73746174657C733A33323A223565373636316538336665326136343566666265356363376361643461646338223B746F6B656E7C733A32373A22594B6B5665774141414141413175764841414142586A44444B5751223B746F6B656E5F7365637265747C733A33323A223764676F4B4C3535445A716A6F7955676F47334772456467384E684662397459223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('23c69f5e349b1089ae4f7bec09c63d7a1ec39072','::1',1504062960,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036323936303B4642524C485F73746174657C733A33323A223565373636316538336665326136343566666265356363376361643461646338223B746F6B656E7C733A32373A22594B6B5665774141414141413175764841414142586A44444B5751223B746F6B656E5F7365637265747C733A33323A223764676F4B4C3535445A716A6F7955676F47334772456467384E684662397459223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('dc1239992885127de34712d683075e051f7d4684','::1',1504063296,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036333239363B4642524C485F73746174657C733A33323A223565373636316538336665326136343566666265356363376361643461646338223B746F6B656E7C733A32373A22594B6B5665774141414141413175764841414142586A44444B5751223B746F6B656E5F7365637265747C733A33323A223764676F4B4C3535445A716A6F7955676F47334772456467384E684662397459223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('72eef978c80fe5af9c072890fbe5ae66d23ce481','::1',1504063641,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036333634313B4642524C485F73746174657C733A33323A223565373636316538336665326136343566666265356363376361643461646338223B746F6B656E7C733A32373A22594B6B5665774141414141413175764841414142586A44444B5751223B746F6B656E5F7365637265747C733A33323A223764676F4B4C3535445A716A6F7955676F47334772456467384E684662397459223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('ba2aa71ec647af958ca461d752396e92ba4f12bc','::1',1504063989,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036333938393B4642524C485F73746174657C733A33323A223565373636316538336665326136343566666265356363376361643461646338223B746F6B656E7C733A32373A22594B6B5665774141414141413175764841414142586A44444B5751223B746F6B656E5F7365637265747C733A33323A223764676F4B4C3535445A716A6F7955676F47334772456467384E684662397459223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('e119d64fbf9c26cb4be77292d8d5cf7ea043d5fe','::1',1504064290,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036343239303B4642524C485F73746174657C733A33323A223565373636316538336665326136343566666265356363376361643461646338223B746F6B656E7C733A32373A22594B6B5665774141414141413175764841414142586A44444B5751223B746F6B656E5F7365637265747C733A33323A223764676F4B4C3535445A716A6F7955676F47334772456467384E684662397459223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('e96fedbab191b668f8e28accf90ecfb21ca24b32','::1',1504064802,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036343830323B4642524C485F73746174657C733A33323A226131633339623230356162633631336264343438326135353930353738633461223B746F6B656E7C733A32373A224535733036774141414141413175764841414142586A45365F5730223B746F6B656E5F7365637265747C733A33323A2256564F33336C6E5A5A756E68627745464D414E674E634271474443666B683074223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('fa79b5f1cc81deeabeacce98d35d8c8e819d36d3','::1',1504064450,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036343434393B'),
	('6eb40f00b2970933bee1e93f33fcb633880fe02e','::1',1504065114,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036353131343B4642524C485F73746174657C733A33323A226131633339623230356162633631336264343438326135353930353738633461223B746F6B656E7C733A32373A224535733036774141414141413175764841414142586A45365F5730223B746F6B656E5F7365637265747C733A33323A2256564F33336C6E5A5A756E68627745464D414E674E634271474443666B683074223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('3c20ec1475f492f175faaffd71e1a24a1e1dc992','::1',1504065529,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036353532393B4642524C485F73746174657C733A33323A226131633339623230356162633631336264343438326135353930353738633461223B746F6B656E7C733A32373A224535733036774141414141413175764841414142586A45365F5730223B746F6B656E5F7365637265747C733A33323A2256564F33336C6E5A5A756E68627745464D414E674E634271474443666B683074223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('c3ed11faa02a4eafe7fd724585a4daa2d445e487','::1',1504065909,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036353930393B4642524C485F73746174657C733A33323A226131633339623230356162633631336264343438326135353930353738633461223B746F6B656E7C733A32373A224535733036774141414141413175764841414142586A45365F5730223B746F6B656E5F7365637265747C733A33323A2256564F33336C6E5A5A756E68627745464D414E674E634271474443666B683074223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('3408b53048f3457868ad65102c39ba553a719aba','::1',1504066287,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036363238373B4642524C485F73746174657C733A33323A226131633339623230356162633631336264343438326135353930353738633461223B746F6B656E7C733A32373A224535733036774141414141413175764841414142586A45365F5730223B746F6B656E5F7365637265747C733A33323A2256564F33336C6E5A5A756E68627745464D414E674E634271474443666B683074223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('a2ee99d57868ba376282414a9be049187c4dbeb1','::1',1504066621,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036363632313B4642524C485F73746174657C733A33323A226131633339623230356162633631336264343438326135353930353738633461223B746F6B656E7C733A32373A224535733036774141414141413175764841414142586A45365F5730223B746F6B656E5F7365637265747C733A33323A2256564F33336C6E5A5A756E68627745464D414E674E634271474443666B683074223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('716bcc6b898a24bd27914b5aeaef29921a4cc262','::1',1504066928,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036363932383B4642524C485F73746174657C733A33323A226131633339623230356162633631336264343438326135353930353738633461223B746F6B656E7C733A32373A224535733036774141414141413175764841414142586A45365F5730223B746F6B656E5F7365637265747C733A33323A2256564F33336C6E5A5A756E68627745464D414E674E634271474443666B683074223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('438d0f8b6f52270201228f9b898ea448198d7f67','::1',1504067725,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036373732353B4642524C485F73746174657C733A33323A226131633339623230356162633631336264343438326135353930353738633461223B746F6B656E7C733A32373A224535733036774141414141413175764841414142586A45365F5730223B746F6B656E5F7365637265747C733A33323A2256564F33336C6E5A5A756E68627745464D414E674E634271474443666B683074223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B736974655F6C616E677C733A363A226672656E6368223B'),
	('2438d3164974465c9e797a90f216d3b8a5a18c36','::1',1504068286,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036383238363B4642524C485F73746174657C733A33323A223065353938633637666430393336656435333163646261646434306135326561223B746F6B656E7C733A32373A2264546D7A4F774141414141413175764841414142586A4676624D77223B746F6B656E5F7365637265747C733A33323A226D3972573149594630796441416563793847547A674A78466939475237794C72223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('a38e98504f7572c0155c20d095fc532290f3a167','::1',1504067905,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036373930353B'),
	('b10461f3e99f941773fb758d761ca42610db8b60','::1',1504068591,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036383539313B4642524C485F73746174657C733A33323A223065353938633637666430393336656435333163646261646434306135326561223B746F6B656E7C733A32373A2264546D7A4F774141414141413175764841414142586A4676624D77223B746F6B656E5F7365637265747C733A33323A226D3972573149594630796441416563793847547A674A78466939475237794C72223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('4add34aaa2e944ae418aa194fe6be358151eddc8','::1',1504068907,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036383930373B4642524C485F73746174657C733A33323A223065353938633637666430393336656435333163646261646434306135326561223B746F6B656E7C733A32373A2264546D7A4F774141414141413175764841414142586A4676624D77223B746F6B656E5F7365637265747C733A33323A226D3972573149594630796441416563793847547A674A78466939475237794C72223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B'),
	('03e090126f8b4369b79218c65636a03b37339b91','::1',1504069235,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036393233353B4642524C485F73746174657C733A33323A223065353938633637666430393336656435333163646261646434306135326561223B746F6B656E7C733A32373A2264546D7A4F774141414141413175764841414142586A4676624D77223B746F6B656E5F7365637265747C733A33323A226D3972573149594630796441416563793847547A674A78466939475237794C72223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B736974655F6C616E677C733A363A226672656E6368223B'),
	('4ce3af92b81525e7caff0037c955daa98bfb5087','::1',1504069608,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036393630383B4642524C485F73746174657C733A33323A223065353938633637666430393336656435333163646261646434306135326561223B746F6B656E7C733A32373A2264546D7A4F774141414141413175764841414142586A4676624D77223B746F6B656E5F7365637265747C733A33323A226D3972573149594630796441416563793847547A674A78466939475237794C72223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B736974655F6C616E677C733A363A226672656E6368223B'),
	('a2acf138b23652f094970718a7f7c0e103b7ac55','::1',1504069947,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036393934373B4642524C485F73746174657C733A33323A223065353938633637666430393336656435333163646261646434306135326561223B746F6B656E7C733A32373A2264546D7A4F774141414141413175764841414142586A4676624D77223B746F6B656E5F7365637265747C733A33323A226D3972573149594630796441416563793847547A674A78466939475237794C72223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B736974655F6C616E677C733A363A226672656E6368223B'),
	('d48baf5ce0b9d4e22a2022d5f0dc4340b494450b','::1',1504070027,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343036393934373B4642524C485F73746174657C733A33323A223065353938633637666430393336656435333163646261646434306135326561223B746F6B656E7C733A32373A2264546D7A4F774141414141413175764841414142586A4676624D77223B746F6B656E5F7365637265747C733A33323A226D3972573149594630796441416563793847547A674A78466939475237794C72223B69647C733A313A2231223B757365726E616D657C733A353A2241646D696E223B75726C7C733A353A2261646D696E223B737562736372696265727C623A313B61646D696E7C733A313A2231223B736974655F6C616E677C733A363A226672656E6368223B'),
	('7a0efafa581d07c562b5d058ae540c48ada5334f','::1',1504106520,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343130363532303B'),
	('e8c75216fd44473e00c8a97cb22fb392efa7b211','::1',1504107004,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343130373030333B'),
	('1e6945393535b1edaaa135340d7a3c3dad4f68c3','::1',1504107003,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343130373030333B'),
	('61107b3af7743868d72b7f0be4e3c2f2153cd5cc','::1',1504120902,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343132303930323B'),
	('9c13a50c7960b6f96ecd77cb681be11d0787723f','::1',1504120914,X'5F5F63695F6C6173745F726567656E65726174657C693A313530343132303930323B');

/*!40000 ALTER TABLE `2d_sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table 2d_stats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `2d_stats`;

CREATE TABLE `2d_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribut` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `2d_stats` WRITE;
/*!40000 ALTER TABLE `2d_stats` DISABLE KEYS */;

INSERT INTO `2d_stats` (`id`, `attribut`, `value`, `date_created`)
VALUES
	(1,5,11,'2017-08-21'),
	(2,1,3,'2017-08-21'),
	(3,4,1,'2017-08-21'),
	(4,2,3,'2017-08-21'),
	(5,5,4,'2017-08-23'),
	(6,4,1,'2017-08-23'),
	(7,2,1,'2017-08-23'),
	(8,3,1,'2017-08-23'),
	(9,5,15,'2017-08-24'),
	(10,0,1,'2017-08-24'),
	(11,3,2,'2017-08-24'),
	(12,5,5,'2017-08-25'),
	(13,2,6,'2017-08-27'),
	(14,1,1,'2017-08-26'),
	(15,0,3,'2017-08-27'),
	(16,5,3,'2017-08-27'),
	(17,5,35,'2017-08-28'),
	(18,5,4,'2017-08-29'),
	(19,5,26,'2017-08-30'),
	(20,2,1,'2017-08-30');

/*!40000 ALTER TABLE `2d_stats` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table 2d_stats_cron
# ------------------------------------------------------------

DROP TABLE IF EXISTS `2d_stats_cron`;

CREATE TABLE `2d_stats_cron` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `message` varchar(200) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `2d_stats_cron` WRITE;
/*!40000 ALTER TABLE `2d_stats_cron` DISABLE KEYS */;

INSERT INTO `2d_stats_cron` (`id`, `message`, `date_created`)
VALUES
	(7,'1 invoices updated','2017-08-11 02:14:13'),
	(8,'2 invoices updated','2017-08-11 02:14:15'),
	(9,'0 invoices updated','2017-08-11 02:18:40'),
	(10,'3 invoices updated','2017-08-11 02:19:36'),
	(11,'2 invoices updated','2017-08-11 02:23:11'),
	(12,'1 invoices canceled','2017-08-11 02:23:11'),
	(13,'0 invoices updated','2017-08-11 02:31:05'),
	(14,'0 invoices canceled','2017-08-11 02:31:05'),
	(15,'0 invoices updated','2017-08-11 18:04:48'),
	(16,'0 invoices canceled','2017-08-11 18:04:48'),
	(17,'0 invoices updated','2017-08-11 18:09:41'),
	(18,'0 invoices canceled','2017-08-11 18:09:41'),
	(19,'0 invoices updated','2017-08-16 22:41:41'),
	(20,'0 invoices canceled','2017-08-16 22:41:41'),
	(21,'0 invoices updated','2017-08-23 15:26:02'),
	(22,'0 invoices canceled','2017-08-23 15:26:02'),
	(23,'0 invoices updated','2017-08-23 15:26:08'),
	(24,'0 invoices canceled','2017-08-23 15:26:08'),
	(25,'0 invoices updated','2017-08-23 15:26:15'),
	(26,'0 invoices canceled','2017-08-23 15:26:15'),
	(27,'0 invoices updated','2017-08-23 15:26:18'),
	(28,'0 invoices canceled','2017-08-23 15:26:18');

/*!40000 ALTER TABLE `2d_stats_cron` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table 2d_stats_location
# ------------------------------------------------------------

DROP TABLE IF EXISTS `2d_stats_location`;

CREATE TABLE `2d_stats_location` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `country_code` varchar(11) DEFAULT NULL,
  `country_name` varchar(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `2d_stats_location` WRITE;
/*!40000 ALTER TABLE `2d_stats_location` DISABLE KEYS */;

INSERT INTO `2d_stats_location` (`id`, `country_code`, `country_name`, `value`, `date_created`)
VALUES
	(12,'IN','India',1,'2017-08-07'),
	(13,'BE','Belgium',1,'2017-08-06'),
	(14,'FR','France',1,'2017-07-07'),
	(15,'ES','Spain',1,'2017-08-07'),
	(16,'UY','Uruguay',2,'2017-08-07'),
	(21,'UY','Uruguay',1,'2016-08-07');

/*!40000 ALTER TABLE `2d_stats_location` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table 2d_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `2d_users`;

CREATE TABLE `2d_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `passkey` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `subscriber` tinyint(1) DEFAULT NULL,
  `badge` varchar(45) DEFAULT NULL,
  `customer_id` varchar(45) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `profile_image` varchar(100) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `facebook` varchar(45) DEFAULT NULL,
  `twitter` varchar(45) DEFAULT NULL,
  `google` varchar(45) DEFAULT NULL,
  `linkedin` varchar(45) DEFAULT NULL,
  `location` tinytext,
  `about` tinytext,
  `auth_coms` tinyint(1) DEFAULT '0',
  `playlist_profile` varchar(11) DEFAULT NULL,
  `nb_favs` int(11) DEFAULT '0',
  `nb_notes` int(11) DEFAULT '0',
  `nb_coms` int(11) DEFAULT '0',
  `oauth_provider` varchar(255) DEFAULT '',
  `oauth_uid` varchar(255) DEFAULT '',
  `country_code` varchar(45) DEFAULT NULL,
  `country_name` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `url_UNIQUE` (`url`),
  UNIQUE KEY `mail_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `2d_users` WRITE;
/*!40000 ALTER TABLE `2d_users` DISABLE KEYS */;

INSERT INTO `2d_users` (`id`, `url`, `username`, `email`, `password`, `passkey`, `role`, `subscriber`, `badge`, `customer_id`, `status`, `image`, `profile_image`, `ip`, `facebook`, `twitter`, `google`, `linkedin`, `location`, `about`, `auth_coms`, `playlist_profile`, `nb_favs`, `nb_notes`, `nb_coms`, `oauth_provider`, `oauth_uid`, `country_code`, `country_name`, `city`, `date_created`, `date_modified`)
VALUES
	(1,'admin','Admin','admin@coffeetheme.com','password','gj6hvh642g76jhg','1',1,'Subscriber','cus_Az5S7e1YC3lg8R',1,NULL,'470750641_1280x720.jpg',NULL,NULL,NULL,NULL,NULL,'Miami','Welcome to my profile',1,'4',9,13,30,'','','UY',NULL,'Montevideo','2017-07-02 23:46:08','2017-07-02 23:46:08'),
	(11,'nicogrim4','NicoGrim4','grimnicolas@hotmail.fr',NULL,'2ue1ppv3dian8l8jugd3','0',NULL,NULL,NULL,1,'',NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,0,0,'facebook','10214340030440364','UY','Uruguay','Montevideo','2017-08-21 16:47:45','2017-08-21 16:47:45');

/*!40000 ALTER TABLE `2d_users` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table 2d_videos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `2d_videos`;

CREATE TABLE `2d_videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `ids_keywords` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `note` float DEFAULT '0',
  `played` int(11) DEFAULT '0',
  `nb_favs` int(11) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '1',
  `file` varchar(200) DEFAULT NULL,
  `embed` varchar(200) DEFAULT NULL,
  `subscription` tinyint(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `title_UNIQUE` (`title`),
  UNIQUE KEY `url_UNIQUE` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `2d_videos` WRITE;
/*!40000 ALTER TABLE `2d_videos` DISABLE KEYS */;

INSERT INTO `2d_videos` (`id`, `title`, `url`, `id_category`, `ids_keywords`, `description`, `note`, `played`, `nb_favs`, `image`, `type`, `file`, `embed`, `subscription`, `status`, `date_created`, `date_modified`)
VALUES
	(1,'Star Wars - The Force Awakens','star-wars-the-force-awakens',5,NULL,'<p>Thirty years after the defeat of the Galactic Empire, the galaxy faces a new threat from the evil Kylo Ren (Adam Driver) and the First Order. When a defector named Finn crash-lands on a desert planet, he meets Rey (Daisy Ridley), a tough scavenger whose droid contains a top-secret map. Together, the<span class=\"_dgc\"> young duo joins forces with Han Solo (Harrison Ford) to make sure the Resistance receives the intelligence concerning the whereabouts of Luke Skywalker (Mark Hamill), the last of the Jedi Knights.</span></p>',5,112,0,'http://www.videotube.dev/uploads/images/videos/kylo-ren-medium1.jpg',0,NULL,'https://player.vimeo.com/video/4749536',1,1,'2017-07-02 23:46:08','2017-07-02 23:46:08'),
	(3,'Big Buck Bunny','big-buck-bunny',1,NULL,'<p>The plot follows a day of the life of Big Buck Bunny when he meets three bullying rodents, Frank (the leader of the rodents), Rinky and Gamera. The rodents amuse themselves by harassing helpless creatures of the forest by throwing fruits, nuts and rocks at them.</p>\r\n<p>After the deaths of two of Bunny\'s favorite butterflies and an offensive attack on Bunny himself, Bunny sets aside his gentle nature and orchestrates a complex plan to avenge the two butterflies.</p>\r\n<p>Checkout the original page here: <a href=\"https://peach.blender.org/\">https://peach.blender.org/</a></p>\r\n<p>And find out more on their IMDB page here: <a href=\"http://www.imdb.com/title/tt1254207/\">http://www.imdb.com/title/tt1254207/</a></p>',5,212,2,'http://www.videotube.dev/uploads/images/videos/johnny-express-medium1.jpg',0,NULL,'https://player.vimeo.com/video/4749536',1,1,'2017-07-03 21:39:23','2017-07-03 21:39:23'),
	(5,'Alma','alma',1,NULL,'<p>On a snowy day in Barcelona, a girl named Alma is wandering a street. Encountering a chalkboard inscribed with the countless given names of various children, she includes her own name. Before continuing her stroll, where she is suddenly captivated by a toy store overflowing with dolls across from the chalkboard. Taking notice of a doll physically identical to her through a window that resembles the mouth of a monster, she tries to enter the vacant, deserted, silent shop to retrieve the toy for herself. But the front door is locked. After giving up trying to open it, Alma begins to walk away, only for the door to mysteriously open. She returns and enters the store.</p>\r\n<p><img title=\"Alma\" src=\"http://app.hellovideoapp.com/content/uploads/images/January2015/FILE-20150103-16126JMX6QC73F42.jpg\" alt=\"\" width=\"500\" height=\"251\"></p>',4,410,1,'http://www.videotube.dev/uploads/images/videos/alma-short-film-medium2.jpg',1,'http://www.videotube.dev/uploads/files/videos/David_Zowie_-_House_Every_Weekend3.mp4','https://youtu.be/iHc5nMf5TLw',0,1,'2017-07-03 21:40:16','2017-08-28 23:28:10'),
	(8,'Blade Runner','blade-runner',4,'\"2\",\"7\"','',0,9,NULL,'http://www.videotube.dev/uploads/images/videos/maxresdefault_(1).jpg',0,NULL,'https://www.youtube.com/embed/qoEyZoOTtss',0,1,'2017-08-15 21:20:50','2017-08-15 21:20:50'),
	(9,'Transformers: The Last Knight – Trailer (2017) ','transformers-the-last-knight-trailer-2017',5,'\"2\",\"7\"','',4.5,6,1,'http://www.videotube.dev/uploads/images/videos/t.png',0,NULL,'https://www.youtube.com/embed/6Vtf0MszgP8',0,1,'2017-08-15 21:24:15','2017-08-15 21:24:15'),
	(10,'AQUAMAN - Official Trailer - Fanmade (2018)','aquaman-official-trailer-fanmade-2018',4,'\"7\"','',3.5,9,1,'http://www.videotube.dev/uploads/images/videos/aquamanjpg-c73cab-1280w-1489697257059_1280w.jpg',0,NULL,'https://www.youtube.com/embed/hHh5Rs--DAE',0,1,'2017-08-15 21:25:44','2017-08-15 21:25:44'),
	(11,'Pirates of the caribbean 5 (2017)','pirates-of-the-caribbean-5-2017',5,'\"2\",\"5\",\"7\"','<p>Johnny Depp returns to the big screen as the iconic, swashbuckling anti-hero Jack Sparrow in the all-new “Pirates of the Caribbean: Dead Men Tell No Tales.” The rip-roaring adventure finds down-on-his-luck Captain Jack feeling the winds of ill-fortune blowing strongly his way when deadly ghost sailors, led by the terrifying Captain Salazar (Javier Bardem), escape from the Devil\'s Triangle bent on killing every pirate at sea—notably Jack. Jack\'s only hope of survival lies in the legendary Trident of Poseidon, but to find it he must forge an uneasy alliance with Carina Smyth (Kaya Scodelario), a brilliant and beautiful astronomer, and Henry (Brenton Thwaites), a headstrong young sailor in the Royal Navy. At the helm of the Dying Gull, his pitifully small and shabby ship, Captain Jack seeks not only to reverse his recent spate of ill fortune, but to save his very life from the most formidable and malicious foe he has ever faced.</p>',5,13,1,'http://www.videotube.dev/uploads/images/videos/johnny-depp-to-miss-several-weeks-of-filming-pirat_h8zy_1920.jpg',0,NULL,'https://www.youtube.com/embed/ZgQkEf3dQ08',0,1,'2017-08-15 21:26:32','2017-08-15 21:26:32'),
	(12,'Tant de Forêts','tant-de-forets',1,'\"4\",\"6\",\"8\"','<p class=\"first\">Trailer of our short film based on a poem of Jacques Prévert \"Tant de forêts\".<br>The poem speaks of the irony of the fact that newspapers warn us about deforestation although they are made of paper themselves.</p>\r\n<p>Cristal for a TV production - Annecy animation festival 2014</p>\r\n<p>Producer : Tant mieux prod<br>Music : Nathanël Bergèse<br>Broadcast on France 3</p>',4.5,26,1,'http://www.videotube.dev/uploads/images/videos/470750641_1280x720.jpg',0,NULL,'https://player.vimeo.com/video/91410682',0,1,'2017-08-15 21:58:57','2017-08-15 21:58:57'),
	(13,'2½ Bodies','2-bodies',1,'\"6\",\"8\"','<p class=\"first\">2½ Bodies<br>Absurd psycho-triller by Tatu Pohjavirta<br>Feature puppet animation in development</p>\r\n<p>TRAILER CREDITS<br>Director: Tatu Pohjavirta<br>Producer: Jyrki Kaipainen<br>cinematographer: Anu Keränen<br>animation: Jan Andersson<br>set design: Milja Aho<br>character design: Antti Kemppainen<br>sets and props: Leevi Lankinen, Heta Jäälinoja, Emmi Heimonen, Jyrki Kanto<br>music: Stakula<br>sound: Svante Colerus<br>puppet makers: Agnieszka Mikolajczyk, Agnieszka Smolarek, Dariusz Kalita, Marcin Zalewski, Piotr Knabe, Justyna Rochala, Katarzyna Piastka<br>puppet hair & costumes: Anna Szczesniak, Justyna Rochala<br>compositing, lighting, special effects: Mario Kalogjera<br>3D animation: Kristijan Dulic<br>3D modeling: Goran Mitrovic<br>thank you: Adam Ptak, Vanja Andrijevic, Katarzyna Gromadzka<br>production support:<br>Finnish Film Foundation / Jukka Asikainen</p>\r\n<p>Production company: Indie Films Oy, indiefilms.fi</p>',4,16,1,'http://www.videotube.dev/uploads/images/videos/Capture_d’écran_2017-08-15_à_23_23_041.png',0,NULL,'https://player.vimeo.com/video/36752049',0,1,'2017-08-15 22:03:29','2017-08-15 22:03:29'),
	(14,'UP','up',1,'\"6\"','<p>\"Up\" is a wonderful film, with characters who are as believable as any characters can be who spend much of their time floating above the rain forests of Venezuela. They have tempers, problems and obsessions. They are cute and goofy, but they aren\'t cute in the treacly way of little cartoon animals. They\'re cute in the human way of the animation master <a href=\"http://www.rogerebert.com/cast-and-crew/hayao-miyazaki\">Hayao Miyazaki</a>. Two of the three central characters are cranky old men, which is a wonder in this youth-obsessed era. \"Up\" doesn\'t think all heroes must be young or sweet, although the third important character is a nervy kid.</p>\r\n<p>This is another masterwork from Pixar, which is leading the charge in modern animation. The movie was directed by <a href=\"http://www.rogerebert.com/cast-and-crew/pete-docter\">Pete Docter</a>, who also directed \"<a href=\"http://www.rogerebert.com/reviews/monsters-inc-2001\">Monsters, Inc.</a>,\" wrote \"<a href=\"http://www.rogerebert.com/re',5,10,NULL,'http://www.videotube.dev/uploads/images/videos/maxresdefault_(2).jpg',0,NULL,'https://www.youtube.com/embed/pkqzFUhGPJg',0,1,'2017-08-15 23:14:38','2017-08-15 23:14:38'),
	(15,'Snowden','snowden',4,'\"3\",\"7\"','<p>Academy Award®-winning director Oliver Stone, who brought Platoon, Born on the Fourth of July, Wall Street and JFK to the big screen, tackles the most important and fascinating true story of the 21st century. Snowden, the politically-charged, pulse-pounding thriller starring Joseph Gordon-Levitt and Shailene Woodley, reveals the incredible untold personal story of Edward Snowden, the polarizing figure who exposed shocking illegal surveillance activities by the NSA and became one of the most wanted men in the world. He is considered a hero by some, and a traitor by others. No matter which you believe, the epic story of why he did it, who he left behind, and how he pulled it off makes for one of the most compelling films of the year.</p>',5,23,1,'http://www.videotube.dev/uploads/images/videos/Blu-Ray-News-Snowden.jpg',0,NULL,'https://www.youtube.com/embed/QlSAiI3xMh4',0,1,'2017-08-16 00:00:32','2017-08-16 00:00:32'),
	(16,'The Mummy','the-mummy',7,NULL,'<p>Thought safely entombed in a crypt deep beneath the unforgiving desert, an ancient queen (Sofia Boutella) whose destiny was unjustly taken from her is awakened in our current day, bringing with her malevolence grown over millennia and terrors that defy human comprehension. From the sweeping sands of the Middle East through hidden labyrinths under modern-day London, The Mummy brings a surprising intensity and balance of wonder and thrills in an imaginative new take that ushers in a new world of gods and monsters.</p>',4.5,11,NULL,'http://www.videotube.dev/uploads/images/videos/the_mummy_1496843414296_9911188_ver1_0.JPG',0,NULL,'https://www.youtube.com/embed/ngNLw24D3p0',0,1,'2017-08-16 00:17:24','2017-08-16 00:17:24'),
	(17,'Escape Room','escape-room',7,'\"2\"','<ul class=\"zebraList\">\r\n<li class=\"odd\">\r\n<p class=\"plotSummary\">four friends who partake in a popular Los Angeles escape room, owned by Brice (Ulrich), and find themselves stuck with a demonically possessed killer. Sean Young plays the keeper of a box containing an evil demon. The friends have less than an hour to solve the puzzles needed to escape the room alive</p>\r\n<span class=\"nobr\">- <em>Written by <a href=\"http://www.imdb.com/search/title?plot_author=simeon anderson&view=simple&sort=alpha&ref_=ttpl_pl_1\">simeon anderson</a></em></span></li>\r\n</ul>\r\n<h4 class=\"dataHeaderWithBorder\">Synopsis</h4>\r\n<div id=\"no_content\" class=\"list\">\r\n<div class=\"soda even\">It looks like we don\'t have any Synopsis for this title yet.\r\n<p>Be the first to contribute! Just click the \"Edit page\" button at the bottom of the page or learn more in the <a href=\"http://www.imdb.com/swiki/special?SynopsisHelp\">Synopsis submission guide.</a></p>\r\n</div>\r\n</div>',4,11,NULL,'http://www.videotube.dev/uploads/images/videos/maxresdefault_(4)1.jpg',0,NULL,'https://www.youtube.com/embed/OIBqv_FNn-w',0,1,'2017-08-16 00:34:46','2017-08-16 00:34:46'),
	(18,'Cult of Chucky','cult-of-chucky',7,'\"2\"','<p>Chucky returns after the events of Curse of Chucky to continue terrorizing his wheelchair-bound victim, Nica. Meanwhile, the killer doll has some scores to settle with his old enemies, with the help of his former wife.</p>',4,9,1,'http://www.videotube.dev/uploads/images/videos/Cult-of-Chucky.jpg',0,NULL,'https://www.youtube.com/embed/p3a_-qpInyw',0,1,'2017-08-16 00:55:02','2017-08-16 00:55:02'),
	(22,'sdfsdf','sdfsdf',4,NULL,'<p>sdfsd</p>',0,0,NULL,NULL,1,NULL,NULL,NULL,0,'2017-08-23 21:04:39','2017-08-23 21:04:39'),
	(23,'dsfds','dsfds',7,'\"2\",\"5\"','',0,0,NULL,NULL,0,NULL,'',0,0,'2017-08-23 21:19:25','2017-08-23 21:19:25');

/*!40000 ALTER TABLE `2d_videos` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

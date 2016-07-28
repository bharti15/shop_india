-- MySQL dump 10.13  Distrib 5.5.3-m3, for Win32 (x86)
--
-- Host: localhost    Database: shopindia
-- ------------------------------------------------------
-- Server version	5.5.3-m3-community

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` char(20) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Mobiles & Tablets'),(2,'Home & Kitchen'),(3,'Mens Fashion'),(4,'Womens Fashion'),(5,'Toys &Baby Products');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dorders`
--

DROP TABLE IF EXISTS `dorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dorders` (
  `order_id` int(11) NOT NULL,
  `user` char(10) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dorders`
--

LOCK TABLES `dorders` WRITE;
/*!40000 ALTER TABLE `dorders` DISABLE KEYS */;
INSERT INTO `dorders` VALUES (1,'kamal',71849);
/*!40000 ALTER TABLE `dorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dorders_det`
--

DROP TABLE IF EXISTS `dorders_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dorders_det` (
  `order_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dorders_det`
--

LOCK TABLES `dorders_det` WRITE;
/*!40000 ALTER TABLE `dorders_det` DISABLE KEYS */;
INSERT INTO `dorders_det` VALUES (1,1,1,44978,44978);
/*!40000 ALTER TABLE `dorders_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbox`
--

DROP TABLE IF EXISTS `inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbox` (
  `mail_id` varchar(40) DEFAULT NULL,
  `query` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL DEFAULT '0',
  `response` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbox`
--

LOCK TABLES `inbox` WRITE;
/*!40000 ALTER TABLE `inbox` DISABLE KEYS */;
INSERT INTO `inbox` VALUES ('matrix.computers@ymail.com','goods found defective',1,'query solved'),('matrix.computers@ymail.com','aa',2,'bb'),('matrix.computers@ymail.com','aaaa',3,NULL);
/*!40000 ALTER TABLE `inbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `subcat_id` int(11) DEFAULT NULL,
  `item_name` char(20) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` char(20) DEFAULT NULL,
  `stock` int(11) DEFAULT '0',
  `details` char(255) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,1,1,'iphn6 16GB',44978,'1.jpg',18,'1 Year Brand Warranty Screen Size : 17.78 cm (7) RAM : 1 GB Storage : 8GB Voice Call : YES Android 4.2 (Jellybean) 2 MP Primary Camera 1.2GHz dual-core processor Wi-Fi Bluetooth Expandable Memory 32 GB 3600 mAh Battery SUPC: SDL020679214'),(2,1,1,'iphone 6 plus',54172,'2.jpg',23,'1 Year Brand Warranty Screen Size : 17.78 cm (7) RAM : 1 GB Storage : 8GB Voice Call : YES Android 4.2 (Jellybean) 2 MP Primary Camera 1.2GHz dual-core processor Wi-Fi Bluetooth Expandable Memory 32 GB 3600 mAh Battery SUPC: SDL020679214'),(3,1,2,'ipadMini2',9680,'3.jpg',33,'1 Year Brand Warranty Screen Size : 17.78 cm (7) RAM : 1 GB Storage : 8GB Voice Call : YES Android 4.2 (Jellybean) 2 MP Primary Camera 1.2GHz dual-core processor Wi-Fi Bluetooth Expandable Memory 32 GB 3600 mAh Battery SUPC: SDL020679214'),(4,1,2,'SamsungGalaxyTab3Neo',8441,'4.jpg',12,'1 Year Brand Warranty Screen Size : 17.78 cm (7) RAM : 1 GB Storage : 8GB Voice Call : YES Android 4.2 (Jellybean) 2 MP Primary Camera 1.2GHz dual-core processor Wi-Fi Bluetooth Expandable Memory 32 GB 3600 mAh Battery SUPC: SDL020679214'),(6,2,3,'WallClocks-499',499,'6.jpg',5,'1 Year Brand Warranty Screen Size : 17.78 cm (7) RAM : 1 GB Storage : 8GB Voice Call : YES Android 4.2 (Jellybean) 2 MP Primary Camera 1.2GHz dual-core processor Wi-Fi Bluetooth Expandable Memory 32 GB 3600 mAh Battery SUPC: SDL020679214'),(7,2,3,'WallClocks-399',399,'7.jpg',9,'1 Year Brand Warranty Screen Size : 17.78 cm (7) RAM : 1 GB Storage : 8GB Voice Call : YES Android 4.2 (Jellybean) 2 MP Primary Camera 1.2GHz dual-core processor Wi-Fi Bluetooth Expandable Memory 32 GB 3600 mAh Battery SUPC: SDL020679214'),(8,2,3,'WallClocks-599',599,'8.jpg',5,'1 Year Brand Warranty Screen Size : 17.78 cm (7) RAM : 1 GB Storage : 8GB Voice Call : YES Android 4.2 (Jellybean) 2 MP Primary Camera 1.2GHz dual-core processor Wi-Fi Bluetooth Expandable Memory 32 GB 3600 mAh Battery SUPC: SDL020679214'),(9,2,4,'Curtain',896,'9.jpg',18,'Set Contents : Door Curtain Quantity (No Of Units) : 3 curtains Product Fabric : Polyester Des7'),(10,2,4,'Blanket',452,'10.jpg',45,''),(11,3,6,'Casual',7854,'11.jpg',12,''),(12,3,6,'Formal shoes',4852,'12.jpg',56,''),(13,3,6,'Loafers',4596,'13.jpg',12,''),(14,3,5,'HenleyTshirts',452,'14.jpg',12,''),(15,3,5,'V-neck',800,'15.jpg',56,''),(16,3,7,'Fossil',4785,'16.jpg',8,''),(17,3,7,'Exotica',7458,'17.jpg',30,''),(18,4,9,'Remanika',5236,'18.jpg',7,''),(19,4,9,'Wills-LifeStyle',1200,'19.jpg',45,''),(20,4,8,'Alice-Designer',4562,'20.jpg',20,''),(21,4,8,'BlackBag',7145,'21.jpg',55,''),(22,5,10,'Baby Carriers',8523,'22.jpg',5,''),(23,5,10,'Baby keeper',412,'23.jpg',8,'');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `porders`
--

DROP TABLE IF EXISTS `porders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `porders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user` char(10) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `porders`
--

LOCK TABLES `porders` WRITE;
/*!40000 ALTER TABLE `porders` DISABLE KEYS */;
INSERT INTO `porders` VALUES (1,'kamal',55170),(2,'kamal',44978),(3,'kamal',44978);
/*!40000 ALTER TABLE `porders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `porders_det`
--

DROP TABLE IF EXISTS `porders_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `porders_det` (
  `order_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `porders_det`
--

LOCK TABLES `porders_det` WRITE;
/*!40000 ALTER TABLE `porders_det` DISABLE KEYS */;
INSERT INTO `porders_det` VALUES (1,2,1,54172,54172),(1,7,1,399,399),(1,8,1,599,599),(2,1,1,44978,44978),(3,1,1,44978,44978);
/*!40000 ALTER TABLE `porders_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategory` (
  `subcat_id` int(11) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `subcat_name` char(20) DEFAULT NULL,
  PRIMARY KEY (`subcat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory`
--

LOCK TABLES `subcategory` WRITE;
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `subcategory` VALUES (1,1,'Mobiles'),(2,1,'Tablets'),(3,2,'Home Decor'),(4,2,'Home Furnishing'),(5,3,'Clothing'),(6,3,'Footwear'),(7,3,'Watches'),(8,4,'Handbags'),(9,4,'Western Wear'),(10,5,'Prams & Cycles');
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` char(10) DEFAULT NULL,
  `password` char(10) DEFAULT NULL,
  `usertype` enum('admin','customer') DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `contact` varchar(40) DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','admin','admin','','',''),('kamal','12345','customer','matrix.computers@ymail.com','12345','12345');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-09  9:49:45

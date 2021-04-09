-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: fit_shop
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` int unsigned NOT NULL AUTO_INCREMENT,
  `voucher_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `order_date` date NOT NULL,
  `status` varchar(25) NOT NULL,
  `payment_mode` varchar(25) NOT NULL,
  `total` float NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `FK_CartVoucher` (`voucher_id`),
  KEY `FK_CartUser` (`user_id`),
  CONSTRAINT `FK_CartUser` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_CartVoucher` FOREIGN KEY (`voucher_id`) REFERENCES `voucher` (`voucher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (100000,100001,100001,'2021-03-12','pending','COD',100);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartline`
--

DROP TABLE IF EXISTS `cartline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartline` (
  `cartline_id` int unsigned NOT NULL AUTO_INCREMENT,
  `cart_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` float NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cartline_id`),
  KEY `FK_CartlineCart` (`cart_id`),
  KEY `FK_CartlineProduct` (`product_id`),
  CONSTRAINT `FK_CartlineCart` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CartlineProduct` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartline`
--

LOCK TABLES `cartline` WRITE;
/*!40000 ALTER TABLE `cartline` DISABLE KEYS */;
INSERT INTO `cartline` VALUES (100000,100000,100000,2,100,'2021-03-12 15:36:58');
/*!40000 ALTER TABLE `cartline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(25) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=100003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (100000,'Home & Kitchen','2021-03-12 13:52:29'),(100001,'Electronics','2021-03-12 13:52:29'),(100002,'Clothing, Shoes & Jewelry','2021-03-12 13:52:29');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_img` varchar(2000) NOT NULL,
  `product_price` float NOT NULL,
  `instock` int NOT NULL,
  `product_description` varchar(2000) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`),
  KEY `FK_ProductCategory` (`category_id`),
  CONSTRAINT `FK_ProductCategory` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (100000,100001,'Nintendo Switch Pro Controller','https://images-na.ssl-images-amazon.com/images/I/61drpi3cYUL._SL1258_.jpg',52.98,30,'Handheld Nintendo Switch gaming at a great price ','2021-03-12 14:50:39');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(25) NOT NULL,
  `user_password` varchar(25) NOT NULL,
  `user_fullname` varchar(30) NOT NULL,
  `user_phone` varchar(10) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_address` varchar(200) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `user_dob` date NOT NULL,
  `role_id` int NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_phone` (`user_phone`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=100003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (100000,'huubanghanu','123456789','Nguyen Huu Bang','0357767156','huubang.hanu@gmail.com','Ninh Binh','Male','2000-04-05',1,'2021-03-12 09:44:04'),(100001,'dunghoang','123456789','Hoang Tien Dung','0357767157','dunghoang.hanu@gmail.com','Hai Duong','Male','2000-04-05',0,'2021-03-12 09:44:04'),(100002,'trantu','123456789','Tran Anh Tu','0357767196','tutran.hanu@gmail.com','Hanoi','Male','2000-04-05',0,'2021-03-12 09:45:06');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher`
--

DROP TABLE IF EXISTS `voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voucher` (
  `voucher_id` int unsigned NOT NULL AUTO_INCREMENT,
  `voucher_code` varchar(10) NOT NULL,
  `discount_percent` int NOT NULL,
  `expire_date` date NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`voucher_id`),
  UNIQUE KEY `voucher_code` (`voucher_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100006 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher`
--

LOCK TABLES `voucher` WRITE;
/*!40000 ALTER TABLE `voucher` DISABLE KEYS */;
INSERT INTO `voucher` VALUES (100000,'FIT-HANU',30,'2021-03-20','2021-03-12 14:57:30'),(100001,'SE24FEE',30,'2021-03-20','2021-03-12 14:57:56'),(100003,'SE24FREE',35,'2021-03-20','2021-03-12 14:58:14'),(100005,'SE14FREE',35,'2021-03-20','2021-03-12 14:58:57');
/*!40000 ALTER TABLE `voucher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-12 22:38:54

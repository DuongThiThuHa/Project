-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: fashion-shop
-- ------------------------------------------------------
-- Server version	8.0.36
create database FashionShop;
drop database FashionShop;
use FashionShop;


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
-- Table structure for table `app_role`
--

DROP TABLE IF EXISTS `app_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(30) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `APP_ROLE_UK` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_role`
--

LOCK TABLES `app_role` WRITE;
/*!40000 ALTER TABLE `app_role` DISABLE KEYS */;
INSERT INTO `app_role` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_MANAGER'),(3,'ROLE_SALESMAN'),(4,'ROLE_WAREHOUSE');
/*!40000 ALTER TABLE `app_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_user`
--

DROP TABLE IF EXISTS `app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `account_non_expired` bit(1) DEFAULT NULL,
  `account_non_locked` bit(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `background_image` varchar(255) DEFAULT NULL,
  `credentials_non_expired` bit(1) DEFAULT NULL,
  `date_create` date DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `encrypted_password` varchar(128) DEFAULT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `user_code` varchar(255) DEFAULT NULL,
  `user_name` varchar(36) DEFAULT NULL,
  `role_id` bigint DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `APP_USER_UK` (`user_name`),
  UNIQUE KEY `APP_USER_CODE_UK` (`user_code`),
  KEY `FKn1w45cvkd2bdpvu78k056mckg` (`role_id`),
  CONSTRAINT `FKn1w45cvkd2bdpvu78k056mckg` FOREIGN KEY (`role_id`) REFERENCES `app_role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user`
--

LOCK TABLES `app_user` WRITE;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
INSERT INTO `app_user` VALUES (1,_binary '',_binary '',NULL,NULL,NULL,_binary '',NULL,NULL,NULL,_binary '','$2a$10$SiXSUkOzKtXLJS8u60S1xOiAg7B8vfH7X0wXq8S2w8.1y3eYBRZM6',NULL,NULL,NULL,NULL,'admin',1),(2,_binary '',_binary '','Đà Nẵng','https://firebasestorage.googleapis.com/v0/b/imageuploaddb-4f4f5.appspot.com/o/multipleImages%2Fblazer1.jfif?alt=media&token=237805e6-daf2-401f-8ac2-e84b8d1009f1','https://firebasestorage.googleapis.com/v0/b/imageuploaddb-4f4f5.appspot.com/o/multipleImages%2Fsm3.jfif?alt=media&token=90e811c9-3a52-4d22-b038-20c87cc17289',_binary '','2024-07-22','1111-11-11','dvkhang49@gmail.com',_binary '','$2a$10$pDz9MYtWrGcKXst9eC0bAurc44c8UMCQtL7NjnapT3EWY6d154bTS','Đinh Văn Khang',0,'0363574636','EMP001','vankhang49',2),(3,_binary '',_binary '','Đà Nẵng',NULL,NULL,_binary '',NULL,'2024-07-02','nva@gmail.com',_binary '','$2a$10$xjEL0f2yMIMg7YZZnTQ5PuOWUo81v7VPBjQ9rw/Ih/FfjmbY5I6Oy','Nguyễn Văn A',0,'0123456789','EMP002','employee1',3),(4,_binary '',_binary '','Đà Nẵng',NULL,NULL,_binary '','2024-07-02','2024-07-02','nvb@gmail.com',_binary '','$2a$10$xjEL0f2yMIMg7YZZnTQ5PuOWUo81v7VPBjQ9rw/Ih/FfjmbY5I6Oy','Nguyễn Văn B',0,'0123456789','EMP004','employee2',4),(5,_binary '',_binary '','Đà Nẵng',NULL,NULL,_binary '','2024-07-02','2024-07-02','btm@gmail.com',_binary '','$2a$10$oJWPgsu67XGsTjWrTJyB1e9/TvwmNyGxUphMSonGDmkmdG1HYRhGy','Bùi Thị M',1,'0987654321','EMP003','employee3',3),(7,_binary '',_binary '','Đà Nẵng',NULL,NULL,_binary '','2024-07-08','1111-11-11','nvw@gmail.com',_binary '','$2a$10$3yQUyhhjdBigXypqCyw3tOyiFgU84/yGrtNNLZp6HapfeVzad.0NG','Nguyễn Văn W',0,'0909999999','NV0005','employee5',3);
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_items`
--

DROP TABLE IF EXISTS `bill_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_items` (
  `item_id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `bill_id` bigint DEFAULT NULL,
  `pricing_id` bigint DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `FKj9o7g8krc56gf6t6f0sy4ic5p` (`bill_id`),
  KEY `FKge2mnl60evekhwchofnoxy11u` (`pricing_id`),
  CONSTRAINT `FKge2mnl60evekhwchofnoxy11u` FOREIGN KEY (`pricing_id`) REFERENCES `pricings` (`pricing_id`),
  CONSTRAINT `FKj9o7g8krc56gf6t6f0sy4ic5p` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_items`
--

LOCK TABLES `bill_items` WRITE;
/*!40000 ALTER TABLE `bill_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `bill_id` bigint NOT NULL AUTO_INCREMENT,
  `bill_code` varchar(255) NOT NULL,
  `date_create` date NOT NULL,
  `promotion_code` varchar(255) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `customer_id` bigint NOT NULL,
  PRIMARY KEY (`bill_id`),
  UNIQUE KEY `UK8li8r7cktrea79tpv6ewf9oc9` (`bill_code`),
  KEY `FKkdf2l2f68fhui9cqkawpv9pos` (`user_id`),
  KEY `FKoy9sc2dmxj2qwjeiiilf3yuxp` (`customer_id`),
  CONSTRAINT `FKkdf2l2f68fhui9cqkawpv9pos` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`user_id`),
  CONSTRAINT `FKoy9sc2dmxj2qwjeiiilf3yuxp` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Nữ'),(2,'Nam'),(3,'Trẻ em nữ'),(4,'Trẻ em nam');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colories`
--

DROP TABLE IF EXISTS `colories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colories` (
  `color_id` int NOT NULL AUTO_INCREMENT,
  `color_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`color_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colories`
--

LOCK TABLES `colories` WRITE;
/*!40000 ALTER TABLE `colories` DISABLE KEYS */;
INSERT INTO `colories` VALUES (1,'green'),(2,'red'),(3,'yellow'),(4,'red'),(5,'purple'),(6,'violet'),(7,'blue'),(8,'white'),(9,'pink'),(10,'black');
/*!40000 ALTER TABLE `colories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_types`
--

DROP TABLE IF EXISTS `customer_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_types` (
  `type_id` bigint NOT NULL AUTO_INCREMENT,
  `discount` double DEFAULT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`),
  CONSTRAINT `customer_types_chk_1` CHECK (((`discount` <= 1) and (`discount` >= 0)))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_types`
--

LOCK TABLES `customer_types` WRITE;
/*!40000 ALTER TABLE `customer_types` DISABLE KEYS */;
INSERT INTO `customer_types` VALUES (1,0.3,'VIP'),(2,0.1,'Platinum'),(3,0.05,'Gold'),(4,0.02,'Silver'),(5,0,'Nomarl');
/*!40000 ALTER TABLE `customer_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` bigint NOT NULL AUTO_INCREMENT,
  `accumulated_points` int DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `customer_code` varchar(255) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `date_register` date DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `gender` int NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `type_id` bigint DEFAULT NULL,
  `enabled` bigint DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `UKiqv746oh5t5is1vr4p2nl79r6` (`customer_code`),
  UNIQUE KEY `UKrfbvkrffamfql7cjmen8v976v` (`email`),
  KEY `FKmbwe1ydi5m9broqrrf28c9io3` (`type_id`),
  CONSTRAINT `FKmbwe1ydi5m9broqrrf28c9io3` FOREIGN KEY (`type_id`) REFERENCES `customer_types` (`type_id`),
  CONSTRAINT `customers_chk_1` CHECK ((`accumulated_points` >= 0)),
  CONSTRAINT `customers_chk_2` CHECK (((`gender` <= 2) and (`gender` >= 0)))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,2,'123 Đường ABC, Quận XYZ, Thành phố HCM','CUST001','Nguyễn Văn A','1990-05-15','2023-06-29','nguyenvana@example.com',1,'0901234567',5),(2,0,'456 Đường XYZ, Quận ABC, Thành phố HCM','CUST002','Trần Thị B','1985-10-20','2023-06-30','tranthib@example.com',0,'0912345678',5),(3,747,'789 Đường XYZ, Quận DEF, Thành phố HCM','CUST003','Lê Văn C','1988-12-05','2023-07-01','levanc@example.com',1,'0976543210',5),(4,0,'321 Đường ABC, Quận UVW, Thành phố HCM','CUST004','Phạm Thị D','1995-08-25','2023-07-02','phamthid@example.com',0,'0987654321',5),(5,0,'555 Đường UVW, Quận XYZ, Thành phố HCM','CUST005','Hoàng Văn E','1983-04-10','2023-07-03','hoangvane@example.com',1,'0911112222',5),(6,0,'999 Đường UVW, Quận HIJ, Thành phố HCM','CUST006','Nguyễn Thị F','1992-11-15','2023-07-04','nguyenthif@example.com',0,'0933334444',5),(7,0,'777 Đường HIJ, Quận KLM, Thành phố HCM','CUST007','Trần Văn G','1980-07-20','2023-07-05','tranvang@example.com',1,'0966667777',5),(8,0,'888 Đường KLM, Quận NOP, Thành phố HCM','CUST008','Lê Thị H','1987-03-30','2023-07-06','lethih@example.com',0,'0944445555',5),(9,0,'222 Đường NOP, Quận QRS, Thành phố HCM','CUST009','Phan Văn I','1986-01-05','2023-07-07','phanvani@example.com',1,'0988889999',5),(10,0,'444 Đường QRS, Quận TUV, Thành phố HCM','CUST010','Nguyễn Thành J','1998-09-10','2023-07-08','nguyenthanhj@example.com',0,'0999990000',5),(11,0,'Đà Nẵng','KH-7562','Đinh Văn Khang','2000-11-11','2024-07-17','dvkhang49@gmail.com',0,'0564321372',1);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventories`
--

DROP TABLE IF EXISTS `inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventories` (
  `inventory_id` bigint NOT NULL AUTO_INCREMENT,
  `date_create` date DEFAULT NULL,
  `ticket_code` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`inventory_id`),
  KEY `FKirtf354l1odgtsv399vrk0gra` (`user_id`),
  CONSTRAINT `FKirtf354l1odgtsv399vrk0gra` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventories`
--

LOCK TABLES `inventories` WRITE;
/*!40000 ALTER TABLE `inventories` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `news_id` bigint NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `date_create` date DEFAULT NULL,
  `news_description` varchar(255) NOT NULL,
  `news_img_url` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`news_id`),
  KEY `FKcb9hy2rjh9epmj9l0wedyg12i` (`user_id`),
  CONSTRAINT `FKcb9hy2rjh9epmj9l0wedyg12i` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `notif_id` bigint NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  `topic` varchar(255) NOT NULL,
  PRIMARY KEY (`notif_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pricings`
--

DROP TABLE IF EXISTS `pricings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pricings` (
  `pricing_id` bigint NOT NULL AUTO_INCREMENT,
  `enabled` bit(1) NOT NULL,
  `price` double NOT NULL,
  `pricing_code` varchar(255) NOT NULL,
  `pricing_image` varchar(255) NOT NULL,
  `pricing_name` varchar(50) NOT NULL,
  `qr_code` varchar(255) DEFAULT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `size` varchar(255) NOT NULL,
  `color_id` int NOT NULL,
  `inventory_id` bigint DEFAULT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`pricing_id`),
  UNIQUE KEY `UKb3s1lfxqf54yjs8xmoaaailj3` (`pricing_code`),
  KEY `FKoj3468wa826ov0fa4ix0brgvj` (`color_id`),
  KEY `FKkg2rtlk76hyg6gcg7dtaa56nv` (`inventory_id`),
  KEY `FKdigni9pij9tjxgdkj3tbv1mgp` (`product_id`),
  CONSTRAINT `FKdigni9pij9tjxgdkj3tbv1mgp` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `FKkg2rtlk76hyg6gcg7dtaa56nv` FOREIGN KEY (`inventory_id`) REFERENCES `inventories` (`inventory_id`),
  CONSTRAINT `FKoj3468wa826ov0fa4ix0brgvj` FOREIGN KEY (`color_id`) REFERENCES `colories` (`color_id`),
  CONSTRAINT `pricings_chk_1` CHECK ((`price` >= 0)),
  CONSTRAINT `pricings_chk_2` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricings`
--

LOCK TABLES `pricings` WRITE;
/*!40000 ALTER TABLE `pricings` DISABLE KEYS */;
/*!40000 ALTER TABLE `pricings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `image_id` bigint NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  KEY `FKqnq71xsohugpqwf3c9gxmsuy` (`product_id`),
  CONSTRAINT `FKqnq71xsohugpqwf3c9gxmsuy` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_types`
--

DROP TABLE IF EXISTS `product_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_types` (
  `type_id` bigint NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`type_id`),
  KEY `FKa7yy714aqb81yhfjpselilofs` (`category_id`),
  CONSTRAINT `FKa7yy714aqb81yhfjpselilofs` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_types`
--

LOCK TABLES `product_types` WRITE;
/*!40000 ALTER TABLE `product_types` DISABLE KEYS */;
INSERT INTO `product_types` VALUES (1,'Quần Legging',1),(5,'Váy đầm',1),(6,'Chân váy',1),(7,'Quần Short',1),(8,'Quần Kaki',2),(9,'Quần Jean',2),(10,'Quần Tây',2),(11,'Aó thun',1),(12,'Váy Babydoll',1),(13,'Váy Maxi',1),(14,'Váy Ôm',1),(15,'Aó Croptop',1),(16,'Aó Polo',2),(17,'Aó len',1),(18,'Quần váy',1),(19,'Aó dài',1),(20,'Yếm',3),(21,'Chân váy xếp ly',1),(22,'Chân váy dáng suông',1),(23,'Chân váy dáng ôm',1),(24,'Chân váy dáng xòe',1),(25,'Aó khoác jeans',2),(26,'Aó khoác chống nắng',1),(27,'Aó khoác măng tô',1),(28,'Aó khoác nỉ',1),(29,'Aó khoác Blazer',1),(30,'Set váy',3),(31,'Set quần',4),(32,'Quần vải',2);
/*!40000 ALTER TABLE `product_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` bigint NOT NULL AUTO_INCREMENT,
  `product_desc` text NOT NULL,
  `enabled` bit(1) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `type_id` bigint NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `UK922x4t23nx64422orei4meb2y` (`product_code`),
  KEY `FK98l10qwb1l2ywp1d24x1d3ef2` (`type_id`),
  CONSTRAINT `FK98l10qwb1l2ywp1d24x1d3ef2` FOREIGN KEY (`type_id`) REFERENCES `product_types` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Áo thun hè năng động',_binary '','P403367','Áo thun thời trang trẻ',11),(2,'Áo Polo luôn vui tươi',_binary '','P720371','Make by Louis Vuitton',16),(3,'Set váy bé gái',_binary '','P428688','aaaaaaaaaaaaaaaa',30),(4,'Áo thun thời trang trẻ',_binary '','P428689','Áo thun nam nữ unisex tay lỡ ',16),(7,'Áo thun nam nữ unisex tay lỡ A.R.0.1, áo phông cotton form rộng oversize streetwear Trend 2022',_binary '','false','k',17),(8,'huật may: Đường ma CAM KẾT ',_binary '','P213886','Áo khoác Blazer Nam Form rộng dài tay unisex basic',25);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotions` (
  `promotion_id` bigint NOT NULL AUTO_INCREMENT,
  `discount` double DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `end_day` date DEFAULT NULL,
  `promotion_code` varchar(255) DEFAULT NULL,
  `promotion_name` varchar(255) NOT NULL,
  `quantity` int DEFAULT NULL,
  `start_day` date DEFAULT NULL,
  PRIMARY KEY (`promotion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions`
--

LOCK TABLES `promotions` WRITE;
/*!40000 ALTER TABLE `promotions` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requied_bill`
--

DROP TABLE IF EXISTS `requied_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requied_bill` (
  `type_id` bigint NOT NULL AUTO_INCREMENT,
  `type_price` double DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requied_bill`
--

LOCK TABLES `requied_bill` WRITE;
/*!40000 ALTER TABLE `requied_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `requied_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_notification`
--

DROP TABLE IF EXISTS `user_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status_read` bit(1) NOT NULL,
  `notif_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnpoekprect3y3plgckttxfc3q` (`notif_id`),
  KEY `FK62vfdtp3uff720hr41o0iqipb` (`user_id`),
  CONSTRAINT `FK62vfdtp3uff720hr41o0iqipb` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`user_id`),
  CONSTRAINT `FKnpoekprect3y3plgckttxfc3q` FOREIGN KEY (`notif_id`) REFERENCES `notification` (`notif_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_notification`
--

LOCK TABLES `user_notification` WRITE;
/*!40000 ALTER TABLE `user_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'fashion-shop'
--

--
-- Dumping routines for database 'fashion-shop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-22 19:16:08

-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 25.14.125.37    Database: floristeria_margarita
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `arreglo_personalizado`
--

DROP TABLE IF EXISTS `arreglo_personalizado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arreglo_personalizado` (
  `id_arreglo` int NOT NULL AUTO_INCREMENT,
  `id_tipo_arreglo` int NOT NULL,
  `motivo` tinytext NOT NULL,
  `descripcion` tinytext NOT NULL,
  `tamano` enum('pequeño','mediano','grande') NOT NULL,
  `valor_unit_final` decimal(10,2) NOT NULL,
  `id_cliente` int NOT NULL,
  `id_empleado` int NOT NULL,
  PRIMARY KEY (`id_arreglo`),
  KEY `id_tipo_arreglo` (`id_tipo_arreglo`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `arreglo_personalizado_ibfk_1` FOREIGN KEY (`id_tipo_arreglo`) REFERENCES `tipo_arreglo` (`id_tipo_arreglo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `arreglo_personalizado_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `arreglo_personalizado_ibfk_3` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arreglo_personalizado`
--

LOCK TABLES `arreglo_personalizado` WRITE;
/*!40000 ALTER TABLE `arreglo_personalizado` DISABLE KEYS */;
INSERT INTO `arreglo_personalizado` VALUES (1,1,'Aniversario','Arreglo con rosas rojas y chocolates','grande',3500.00,1,1),(2,2,'Cumpleaños','Arreglo alegre con girasoles','mediano',2200.00,2,1),(3,3,'Condolencias','Arreglo floral blanco elegante','grande',4200.00,3,1),(4,4,'Graduacion','Arreglo moderno con peluche','mediano',2800.00,4,1),(5,5,'Evento especial','Arreglo decorativo premium','grande',5000.00,5,1),(6,1,'cumpleaños','que este bonito','mediano',12000.00,1,2);
/*!40000 ALTER TABLE `arreglo_personalizado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_stock`
--

DROP TABLE IF EXISTS `auditoria_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_stock` (
  `id_sucursal` int NOT NULL,
  `id_producto` int NOT NULL,
  `stock_viejo` int NOT NULL,
  `stock_nuevo` int NOT NULL,
  `fecha_actu` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_stock`
--

LOCK TABLES `auditoria_stock` WRITE;
/*!40000 ALTER TABLE `auditoria_stock` DISABLE KEYS */;
INSERT INTO `auditoria_stock` VALUES (0,0,60,80,'2026-05-22 09:25:18'),(1,1,80,100,'2026-05-22 09:26:41'),(1,1,100,130,'2026-05-22 09:27:57'),(1,2,20,40,'2026-05-22 09:29:05');
/*!40000 ALTER TABLE `auditoria_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `id_cliente` int NOT NULL,
  `id_producto` int DEFAULT NULL,
  `id_arreglo` int DEFAULT NULL,
  `cantidad` int NOT NULL,
  KEY `id_producto` (`id_producto`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_arreglo` (`id_arreglo`),
  CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `carrito_ibfk_3` FOREIGN KEY (`id_arreglo`) REFERENCES `arreglo_personalizado` (`id_arreglo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Antho`@`%`*/ /*!50003 TRIGGER `tr_BI_carrito` BEFORE INSERT ON `carrito` FOR EACH ROW begin if new.id_producto is null and new.id_arreglo is null then signal sqlstate '45000' set message_text='Solo se puede insetar un producto o un arreglo'; end if; if new.id_producto is not null and new.id_arreglo is not null then signal sqlstate'45000' set message_text='Solo se puede insetar un producto o un arreglo'; end if;  end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Antho`@`%`*/ /*!50003 TRIGGER `tr_BI_carrito_cantidad` BEFORE INSERT ON `carrito` FOR EACH ROW begin if new.cantidad<=0 then signal sqlstate '45000' set message_text='La cantidad de productos/arreglos debe ser mayor a cero'; end if; end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `descripcion` tinytext NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Flores','Productos florales'),(2,'Peluches','Peluches decorativos'),(3,'Globos','Globos para regalo'),(4,'Chocolates','Dulces y chocolatosos'),(5,'Decoraciones','Accesorios decorativos'),(6,'Arreglos','Arreglos florales prediseñados por la floristeria');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `id_ciudad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `provincia` varchar(50) NOT NULL,
  `codigo_postal` int NOT NULL,
  PRIMARY KEY (`id_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'Santiago','Santiago',51000),(2,'Santo Domingo','Santo Domingo',10100),(3,'La Vega','La Vega',41000),(4,'Puerto Plata','Puerto Plata',57000),(5,'San Francisco de Macorís','Duarte',31000);
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `id_tercero` int NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `id_tercero` (`id_tercero`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_tercero`) REFERENCES `tercero` (`id_tercero`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,1,'activo'),(2,6,'activo'),(3,11,'inactivo'),(4,16,'activo'),(5,21,'activo'),(6,26,'activo'),(7,31,'inactivo'),(8,36,'activo');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprobante`
--

DROP TABLE IF EXISTS `comprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprobante` (
  `NFC_cliente_empresa` varchar(13) NOT NULL,
  `id_factura` int NOT NULL,
  `RNC_cliente` varchar(11) NOT NULL,
  PRIMARY KEY (`NFC_cliente_empresa`),
  KEY `id_factura` (`id_factura`),
  CONSTRAINT `comprobante_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprobante`
--

LOCK TABLES `comprobante` WRITE;
/*!40000 ALTER TABLE `comprobante` DISABLE KEYS */;
INSERT INTO `comprobante` VALUES ('B01000000004',4,'134789123'),('B01000000005',5,'135891234');
/*!40000 ALTER TABLE `comprobante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `id_delivery` int NOT NULL AUTO_INCREMENT,
  `id_tercero` int NOT NULL,
  `RNC_empresa` int NOT NULL,
  PRIMARY KEY (`id_delivery`),
  KEY `id_tercero` (`id_tercero`),
  CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`id_tercero`) REFERENCES `tercero` (`id_tercero`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,4,130999991),(2,9,130999991),(3,14,130999991),(4,19,130999991),(5,24,130999991);
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_arreglo_pedido`
--

DROP TABLE IF EXISTS `detalle_arreglo_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_arreglo_pedido` (
  `id_pedido_cliente` int NOT NULL,
  `id_arreglo` int NOT NULL,
  `cantidad_arreglo` int NOT NULL,
  KEY `id_arreglo` (`id_arreglo`),
  KEY `id_pedido_cliente` (`id_pedido_cliente`),
  CONSTRAINT `detalle_arreglo_pedido_ibfk_1` FOREIGN KEY (`id_arreglo`) REFERENCES `arreglo_personalizado` (`id_arreglo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detalle_arreglo_pedido_ibfk_2` FOREIGN KEY (`id_pedido_cliente`) REFERENCES `pedido_domicilio` (`id_pedido_cliente`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_arreglo_pedido`
--

LOCK TABLES `detalle_arreglo_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_arreglo_pedido` DISABLE KEYS */;
INSERT INTO `detalle_arreglo_pedido` VALUES (1,1,1),(2,2,2),(3,3,1),(4,4,3),(5,5,2);
/*!40000 ALTER TABLE `detalle_arreglo_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_entrega_pedido_proveedor`
--

DROP TABLE IF EXISTS `detalle_entrega_pedido_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_entrega_pedido_proveedor` (
  `id_sucursal` int NOT NULL,
  `id_entrega_proveedor` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad_solicitada` int NOT NULL,
  `estado_encuentro` enum('completo','dañado','incompleto','rechazado','incorrecto') NOT NULL,
  KEY `id_producto` (`id_producto`),
  KEY `id_entrega_proveedor` (`id_entrega_proveedor`),
  KEY `id_sucursal` (`id_sucursal`),
  CONSTRAINT `detalle_entrega_pedido_proveedor_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detalle_entrega_pedido_proveedor_ibfk_2` FOREIGN KEY (`id_entrega_proveedor`) REFERENCES `entrega_pedido_proveedor` (`id_entrega_proveedor`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detalle_entrega_pedido_proveedor_ibfk_3` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_entrega_pedido_proveedor`
--

LOCK TABLES `detalle_entrega_pedido_proveedor` WRITE;
/*!40000 ALTER TABLE `detalle_entrega_pedido_proveedor` DISABLE KEYS */;
INSERT INTO `detalle_entrega_pedido_proveedor` VALUES (1,1,1,50,'completo'),(1,1,2,30,'completo'),(2,2,3,15,'incompleto'),(2,2,4,15,'completo'),(1,3,5,100,'completo'),(1,3,1,60,'completo'),(1,4,2,20,'dañado'),(1,4,3,35,'incorrecto'),(2,5,4,70,'completo'),(2,5,5,80,'completo'),(1,5,1,10,'completo'),(2,4,4,10,'incompleto'),(1,1,1,20,'completo'),(1,2,1,20,'completo'),(1,1,1,30,'completo'),(1,4,2,20,'completo');
/*!40000 ALTER TABLE `detalle_entrega_pedido_proveedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Antho`@`%`*/ /*!50003 TRIGGER `tr_AI_stock` AFTER INSERT ON `detalle_entrega_pedido_proveedor` FOR EACH ROW begin if new.estado_encuentro='completo' then update detalle_sucursal set stock=stock+new.cantidad_solicitada, fecha_act=now() where id_producto=new.id_producto and id_sucursal=new.id_sucursal; end if; end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `detalle_pedido_proveedor`
--

DROP TABLE IF EXISTS `detalle_pedido_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedido_proveedor` (
  `id_pedido_proveedor` int NOT NULL,
  `id_proveedor` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad_solicitada` int NOT NULL,
  `precio_unit_compra` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  KEY `id_proveedor` (`id_proveedor`),
  KEY `id_pedido_proveedor` (`id_pedido_proveedor`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_pedido_proveedor_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detalle_pedido_proveedor_ibfk_2` FOREIGN KEY (`id_pedido_proveedor`) REFERENCES `pedido_proveedor` (`id_pedido_proveedor`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detalle_pedido_proveedor_ibfk_3` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido_proveedor`
--

LOCK TABLES `detalle_pedido_proveedor` WRITE;
/*!40000 ALTER TABLE `detalle_pedido_proveedor` DISABLE KEYS */;
INSERT INTO `detalle_pedido_proveedor` VALUES (1,1,1,50,100.00,5000.00),(1,1,2,30,150.00,4500.00),(2,2,3,20,200.00,4000.00),(2,2,4,15,180.00,2700.00),(3,3,5,100,120.00,12000.00),(3,3,1,60,100.00,6000.00),(4,4,2,40,150.00,6000.00),(4,4,3,35,200.00,7000.00),(5,5,4,70,180.00,12600.00),(5,5,5,80,120.00,9600.00),(6,1,1,10,500.00,5000.00);
/*!40000 ALTER TABLE `detalle_pedido_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_producto`
--

DROP TABLE IF EXISTS `detalle_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_producto` (
  `id_arreglo` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad_prod_arreglo` int NOT NULL,
  KEY `id_producto` (`id_producto`),
  KEY `id_arreglo` (`id_arreglo`),
  CONSTRAINT `detalle_producto_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detalle_producto_ibfk_2` FOREIGN KEY (`id_arreglo`) REFERENCES `arreglo_personalizado` (`id_arreglo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_producto`
--

LOCK TABLES `detalle_producto` WRITE;
/*!40000 ALTER TABLE `detalle_producto` DISABLE KEYS */;
INSERT INTO `detalle_producto` VALUES (1,1,20),(1,5,2),(2,2,15),(2,4,1),(3,1,25),(3,3,2),(4,2,12),(4,4,1),(5,1,30),(5,3,4),(6,4,10);
/*!40000 ALTER TABLE `detalle_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_producto_pedido_domicilio`
--

DROP TABLE IF EXISTS `detalle_producto_pedido_domicilio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_producto_pedido_domicilio` (
  `id_producto` int NOT NULL,
  `id_pedido_cliente` int NOT NULL,
  `cantidad_producto` int NOT NULL,
  KEY `id_producto` (`id_producto`),
  KEY `id_pedido_cliente` (`id_pedido_cliente`),
  CONSTRAINT `detalle_producto_pedido_domicilio_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detalle_producto_pedido_domicilio_ibfk_2` FOREIGN KEY (`id_pedido_cliente`) REFERENCES `pedido_domicilio` (`id_pedido_cliente`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_producto_pedido_domicilio`
--

LOCK TABLES `detalle_producto_pedido_domicilio` WRITE;
/*!40000 ALTER TABLE `detalle_producto_pedido_domicilio` DISABLE KEYS */;
INSERT INTO `detalle_producto_pedido_domicilio` VALUES (1,1,6),(2,2,3),(3,3,2),(4,4,1),(5,5,5);
/*!40000 ALTER TABLE `detalle_producto_pedido_domicilio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_sucursal`
--

DROP TABLE IF EXISTS `detalle_sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_sucursal` (
  `id_sucursal` int NOT NULL,
  `id_producto` int NOT NULL,
  `stock` int NOT NULL,
  `fecha_act` datetime NOT NULL,
  KEY `id_sucursal` (`id_sucursal`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_sucursal_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detalle_sucursal_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_sucursal`
--

LOCK TABLES `detalle_sucursal` WRITE;
/*!40000 ALTER TABLE `detalle_sucursal` DISABLE KEYS */;
INSERT INTO `detalle_sucursal` VALUES (1,1,130,'2026-05-22 09:27:57'),(1,2,40,'2026-05-22 09:29:05'),(2,3,35,'2026-05-20 23:41:47'),(2,4,15,'2026-05-20 23:41:47'),(1,5,40,'2026-05-20 23:41:47');
/*!40000 ALTER TABLE `detalle_sucursal` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Antho`@`%`*/ /*!50003 TRIGGER `tr_BU_stock_negativo` BEFORE UPDATE ON `detalle_sucursal` FOR EACH ROW begin if new.stock<0 then signal sqlstate '45000' set message_text='No se puede tener el stock en negativo'; end if; end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `id_sucursal` int NOT NULL,
  `id_tercero` int NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `area` varchar(30) NOT NULL,
  `num_casa` int NOT NULL,
  `calle` varchar(100) NOT NULL,
  `id_ciudad` int NOT NULL,
  `id_sector` int NOT NULL,
  `estado` enum('activo','inactivo','despedido','renuncio','suspendido') NOT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `id_ciudad` (`id_ciudad`),
  KEY `id_sector` (`id_sector`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`id_sector`) REFERENCES `sector` (`id_sector`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,2,1,25000.00,'Ventas',12,'Calle A',1,1,'activo'),(2,2,7,28000.00,'Floristeria',15,'Calle B',2,2,'activo'),(3,2,12,22000.00,'Floristeria',18,'Calle C',3,3,'activo'),(4,1,17,26000.00,'Caja',10,'Calle D',4,4,'activo'),(5,1,22,30000.00,'Caja',8,'Calle E',5,5,'activo');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa_delivery`
--

DROP TABLE IF EXISTS `empresa_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa_delivery` (
  `RNC` int NOT NULL,
  `nom_empresa` varchar(50) NOT NULL,
  `calle` varchar(100) NOT NULL,
  `num_departamento` varchar(30) NOT NULL,
  `id_ciudad` varchar(50) NOT NULL,
  `id_sector` int NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `tipo_servicio` varchar(100) NOT NULL,
  `id_metodo_pago` int NOT NULL,
  `costo_envio` decimal(10,2) NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL,
  PRIMARY KEY (`RNC`),
  KEY `id_metodo_pago` (`id_metodo_pago`),
  CONSTRAINT `empresa_delivery_ibfk_1` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id_metodo_pago`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa_delivery`
--

LOCK TABLES `empresa_delivery` WRITE;
/*!40000 ALTER TABLE `empresa_delivery` DISABLE KEYS */;
INSERT INTO `empresa_delivery` VALUES (130999991,'Team Canino','Av. Estrella Sadhala','Local 1','1',1,'8095551001','teamcanino@gmail.com','Envios Nacionales',2,150.00,'activo');
/*!40000 ALTER TABLE `empresa_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrega`
--

DROP TABLE IF EXISTS `entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrega` (
  `id_entrega` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `id_delivery` int NOT NULL,
  `id_cliente` int NOT NULL,
  `fecha_entrega` datetime NOT NULL,
  PRIMARY KEY (`id_entrega`),
  KEY `id_venta` (`id_venta`),
  KEY `id_delivery` (`id_delivery`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `entrega_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `entrega_ibfk_2` FOREIGN KEY (`id_delivery`) REFERENCES `delivery` (`id_delivery`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `entrega_ibfk_3` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrega`
--

LOCK TABLES `entrega` WRITE;
/*!40000 ALTER TABLE `entrega` DISABLE KEYS */;
INSERT INTO `entrega` VALUES (1,1,1,1,'2026-05-22 10:00:00'),(2,2,2,2,'2026-05-22 11:15:00'),(3,3,3,3,'2026-05-22 12:30:00'),(4,4,4,4,'2026-05-22 14:00:00'),(5,5,5,5,'2026-05-22 15:45:00'),(6,1,3,1,'2026-05-21 23:00:29');
/*!40000 ALTER TABLE `entrega` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Antho`@`%`*/ /*!50003 TRIGGER `tr_AI_venta_entrega` AFTER INSERT ON `entrega` FOR EACH ROW begin update venta set estado='finalizada' where id_venta=new.id_venta; end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `entrega_pedido_proveedor`
--

DROP TABLE IF EXISTS `entrega_pedido_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrega_pedido_proveedor` (
  `id_entrega_proveedor` int NOT NULL AUTO_INCREMENT,
  `id_pedido_proveedor` int NOT NULL,
  `id_empleado` int NOT NULL,
  `id_proveedor` int NOT NULL,
  `observaciones` mediumtext NOT NULL,
  `estado_entrega_proveedor` enum('recibida','cancelada','rechazada','incompleta','pendiente') NOT NULL,
  `fecha_entrega_proveedor` datetime NOT NULL,
  PRIMARY KEY (`id_entrega_proveedor`),
  KEY `id_pedido_proveedor` (`id_pedido_proveedor`),
  KEY `id_empleado` (`id_empleado`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `entrega_pedido_proveedor_ibfk_1` FOREIGN KEY (`id_pedido_proveedor`) REFERENCES `pedido_proveedor` (`id_pedido_proveedor`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `entrega_pedido_proveedor_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `entrega_pedido_proveedor_ibfk_3` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrega_pedido_proveedor`
--

LOCK TABLES `entrega_pedido_proveedor` WRITE;
/*!40000 ALTER TABLE `entrega_pedido_proveedor` DISABLE KEYS */;
INSERT INTO `entrega_pedido_proveedor` VALUES (1,1,1,1,'Entrega recibida correctamente','recibida','2026-05-22 10:15:00'),(2,2,1,2,'Faltaron algunos productos','incompleta','2026-05-22 15:20:00'),(3,3,1,3,'Entrega en perfecto estado','recibida','2026-05-25 09:30:00'),(4,4,1,4,'Productos dañados durante transporte','rechazada','2026-05-24 13:10:00'),(5,5,1,5,'Pendiente de revisión','pendiente','2026-05-27 11:30:00');
/*!40000 ALTER TABLE `entrega_pedido_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `id_pago` int NOT NULL,
  `ITBIS` decimal(10,2) NOT NULL,
  `subtotal_factura` decimal(10,2) NOT NULL,
  `transporte` decimal(10,2) NOT NULL,
  `total_factura` decimal(10,2) NOT NULL,
  `fecha_factura` datetime DEFAULT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `id_venta` (`id_venta`),
  KEY `id_pago` (`id_pago`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`id_pago`) REFERENCES `pago` (`id_pago`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,1,1,450.00,2500.00,100.00,3150.00,'2026-05-21 00:11:27'),(2,2,2,630.00,3500.00,100.00,4380.00,'2026-05-21 00:11:27'),(3,3,3,756.00,4200.00,100.00,5256.00,'2026-05-21 00:11:27'),(4,4,4,324.00,1800.00,100.00,2274.00,'2026-05-21 00:11:27'),(5,5,5,900.00,5000.00,100.00,6250.00,'2026-05-21 00:11:27'),(6,6,6,3141.00,17450.00,100.00,20691.00,'2026-05-22 02:16:06');
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `floristero`
--

DROP TABLE IF EXISTS `floristero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `floristero` (
  `id_floristero` int NOT NULL AUTO_INCREMENT,
  `id_empleado` int NOT NULL,
  `especialidad_floral` varchar(50) NOT NULL,
  `anios_experiencia` int NOT NULL,
  PRIMARY KEY (`id_floristero`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `floristero_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `floristero`
--

LOCK TABLES `floristero` WRITE;
/*!40000 ALTER TABLE `floristero` DISABLE KEYS */;
INSERT INTO `floristero` VALUES (1,2,'Ramos romanticos',5),(2,3,'Decoracion floral',4);
/*!40000 ALTER TABLE `floristero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo_pago`
--

DROP TABLE IF EXISTS `metodo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo_pago` (
  `id_metodo_pago` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_metodo_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_pago`
--

LOCK TABLES `metodo_pago` WRITE;
/*!40000 ALTER TABLE `metodo_pago` DISABLE KEYS */;
INSERT INTO `metodo_pago` VALUES (1,'Efectivo'),(2,'Tarjeta'),(3,'Transferencia'),(4,'PayPal'),(5,'Pago móvil');
/*!40000 ALTER TABLE `metodo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota_credito`
--

DROP TABLE IF EXISTS `nota_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nota_credito` (
  `id_nota_credito` int NOT NULL AUTO_INCREMENT,
  `id_factura` int NOT NULL,
  `motivo` tinytext NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` enum('pendiente','aprobada','rechazada') NOT NULL,
  PRIMARY KEY (`id_nota_credito`),
  KEY `id_factura` (`id_factura`),
  CONSTRAINT `nota_credito_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_credito`
--

LOCK TABLES `nota_credito` WRITE;
/*!40000 ALTER TABLE `nota_credito` DISABLE KEYS */;
INSERT INTO `nota_credito` VALUES (1,1,'Producto dañado en entrega','2026-05-22 09:00:00','aprobada'),(2,2,'Producto dañado en entrega','2026-05-22 10:15:00','pendiente'),(3,5,'Producto dañado en entrega','2026-05-22 11:30:00','aprobada');
/*!40000 ALTER TABLE `nota_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `id_metodo_pago` int NOT NULL,
  `id_venta` int NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha_pago` datetime NOT NULL,
  `numero_referencia` int DEFAULT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `id_metodo_pago` (`id_metodo_pago`),
  CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id_metodo_pago`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,1,1,2500.00,'2026-05-21 00:09:54',NULL),(2,2,2,3500.00,'2026-05-21 00:09:54',NULL),(3,3,3,4200.00,'2026-05-21 00:09:54',10003),(4,4,4,1800.00,'2026-05-21 00:09:54',NULL),(5,5,5,5000.00,'2026-05-21 00:09:54',NULL),(6,2,6,20691.00,'2026-05-22 02:16:06',NULL);
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Antho`@`%`*/ /*!50003 TRIGGER `tr_BI_pago_negativo` BEFORE INSERT ON `pago` FOR EACH ROW begin if new.monto<0 then signal sqlstate '45000' set message_text='El monto no puede ser menor a cero'; end if; end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pedido_domicilio`
--

DROP TABLE IF EXISTS `pedido_domicilio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_domicilio` (
  `id_pedido_cliente` int NOT NULL,
  `id_cliente` int NOT NULL,
  `fecha_pedido` datetime NOT NULL,
  `fecha_entrega` datetime NOT NULL,
  `calle` varchar(100) NOT NULL,
  `num_casa` int NOT NULL,
  `id_ciudad` int NOT NULL,
  `id_sector` int NOT NULL,
  `via` varchar(50) NOT NULL,
  `descripcion` mediumtext NOT NULL,
  PRIMARY KEY (`id_pedido_cliente`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_ciudad` (`id_ciudad`),
  KEY `id_sector` (`id_sector`),
  CONSTRAINT `pedido_domicilio_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pedido_domicilio_ibfk_2` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pedido_domicilio_ibfk_3` FOREIGN KEY (`id_sector`) REFERENCES `sector` (`id_sector`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_domicilio`
--

LOCK TABLES `pedido_domicilio` WRITE;
/*!40000 ALTER TABLE `pedido_domicilio` DISABLE KEYS */;
INSERT INTO `pedido_domicilio` VALUES (1,1,'2026-05-20 23:55:47','2026-05-20 23:55:47','Calle Proyecto',10,1,1,'Web','Pedido romántico'),(2,2,'2026-05-20 23:55:47','2026-05-20 23:55:47','Calle Central',12,2,2,'App','Pedido cumpleaños'),(3,3,'2026-05-20 23:55:47','2026-05-20 23:55:47','Calle Flores',14,3,3,'WhatsApp','Pedido especial'),(4,4,'2026-05-20 23:55:47','2026-05-20 23:55:47','Calle Jardín',16,4,4,'Instagram','Pedido aniversario'),(5,5,'2026-05-20 23:55:47','2026-05-20 23:55:47','Calle Primavera',18,5,5,'Web','Pedido premium');
/*!40000 ALTER TABLE `pedido_domicilio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_proveedor`
--

DROP TABLE IF EXISTS `pedido_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_proveedor` (
  `id_pedido_proveedor` int NOT NULL AUTO_INCREMENT,
  `id_sucursal` int NOT NULL,
  `fecha_pedido_proveedor` datetime NOT NULL,
  `tipo_compra` varchar(30) NOT NULL,
  `id_metodo_pago` int NOT NULL,
  `transporte` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `entrega_estimada` datetime NOT NULL,
  PRIMARY KEY (`id_pedido_proveedor`),
  KEY `id_sucursal` (`id_sucursal`),
  KEY `id_metodo_pago` (`id_metodo_pago`),
  CONSTRAINT `pedido_proveedor_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pedido_proveedor_ibfk_2` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id_metodo_pago`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_proveedor`
--

LOCK TABLES `pedido_proveedor` WRITE;
/*!40000 ALTER TABLE `pedido_proveedor` DISABLE KEYS */;
INSERT INTO `pedido_proveedor` VALUES (1,1,'2026-05-20 08:00:00','Compra semanal',2,500.00,15000.00,'2026-05-22 10:00:00'),(2,1,'2026-05-21 09:30:00','Compra urgente',1,300.00,8500.00,'2026-05-22 15:00:00'),(3,1,'2026-05-22 11:00:00','Compra mensual',3,700.00,25000.00,'2026-05-25 09:00:00'),(4,2,'2026-05-23 14:20:00','Reposición inventario',2,450.00,12000.00,'2026-05-24 13:00:00'),(5,2,'2026-05-24 16:45:00','Compra especial',1,600.00,18000.00,'2026-05-27 11:00:00'),(6,1,'2026-05-22 03:52:26','Compra urgente',2,200.00,5200.00,'2026-05-28 10:00:00');
/*!40000 ALTER TABLE `pedido_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL,
  `id_categoria` int NOT NULL,
  `nombre_prod` varchar(50) NOT NULL,
  `descripcion` tinytext NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `descuento` decimal(10,2) NOT NULL,
  `valor_unit` decimal(10,2) NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,1,'Rosas Rojas','Ramo de rosas rojas','Flor Natural',0.00,1500.00,'activo'),(2,2,'Oso Peluche','Peluche mediano','Accesorio',0.00,800.00,'activo'),(3,3,'Globos Corazón','Globos decorativos','Decoración',0.00,300.00,'activo'),(4,4,'Caja Chocolates','Caja premium chocolates','Dulce',0.00,1200.00,'activo'),(5,5,'Cinta Decorativa','Cinta para arreglos','Decoración',0.00,150.00,'activo'),(6,6,'Arreglo Romantico','Arreglo floral realizado por 10 rosas','Romantico',0.00,2000.00,'activo');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `id_tercero` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `id_ciudad` int NOT NULL,
  `id_sector` int NOT NULL,
  `calle_proveedor` varchar(50) NOT NULL,
  `num_departamento` varchar(30) NOT NULL,
  `correo_proveedor` varchar(255) NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL,
  PRIMARY KEY (`id_proveedor`),
  KEY `id_tercero` (`id_tercero`),
  CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`id_tercero`) REFERENCES `tercero` (`id_tercero`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,14,'Lays','Flores Naturales',1,1,'Calle Flores #12','Local A','proveedor1@gmail.com','activo'),(2,15,'MacetsMax','Macetas Decorativas',1,2,'Av. Central #45','Suite 2','proveedor2@gmail.com','activo'),(3,16,'FloraAcces','Accesorios Florales',2,1,'Calle Comercio #78','Local 5','proveedor3@gmail.com','activo'),(4,17,'Produta','Productos Artificiales',2,2,'Av. Independencia #33','Piso 1','proveedor4@gmail.com','inactivo'),(5,18,'Express','Empaques y Cintas',1,1,'Calle Principal #90','Modulo 4','proveedor5@gmail.com','activo'),(6,49,'FlorasPro','Flores Naturales',1,1,'Calle 67','Local 2','proveedorej@gmail.com','activo'),(7,50,'Maceticas','Macetas Decorativas',2,2,'Calle 12','Modulo 67','proveedor7@gmail.com','activo');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `representante`
--

DROP TABLE IF EXISTS `representante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `representante` (
  `id_representante` int NOT NULL AUTO_INCREMENT,
  `id_tercero` int NOT NULL,
  `ocupacion` varchar(50) NOT NULL,
  `RNC_empresa` int NOT NULL,
  PRIMARY KEY (`id_representante`),
  KEY `RNC_empresa` (`RNC_empresa`),
  CONSTRAINT `representante_ibfk_1` FOREIGN KEY (`RNC_empresa`) REFERENCES `empresa_delivery` (`RNC`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `representante`
--

LOCK TABLES `representante` WRITE;
/*!40000 ALTER TABLE `representante` DISABLE KEYS */;
INSERT INTO `representante` VALUES (1,5,'Gerente General',130999991);
/*!40000 ALTER TABLE `representante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `descripcion` tinytext NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador','Control total del sistema','activo'),(2,'Cliente','Realiza pedidos de productos o arreglos','activo'),(3,'Empleado','Puede realizar consultas de informaciones','activo');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sector`
--

DROP TABLE IF EXISTS `sector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sector` (
  `id_sector` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `tipo_sector` varchar(30) NOT NULL,
  PRIMARY KEY (`id_sector`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sector`
--

LOCK TABLES `sector` WRITE;
/*!40000 ALTER TABLE `sector` DISABLE KEYS */;
INSERT INTO `sector` VALUES (1,'Villa Olga','Residencial'),(2,'Los Jardines','Residencial'),(3,'Centro Ciudad','Comercial'),(4,'Pueblo Nuevo','Urbano'),(5,'Bella Vista','Residencial');
/*!40000 ALTER TABLE `sector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio_cliente`
--

DROP TABLE IF EXISTS `servicio_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio_cliente` (
  `id_servicio_cliente` int NOT NULL AUTO_INCREMENT,
  `id_empleado` int NOT NULL,
  `experiencia_manejo_sistema` varchar(50) NOT NULL,
  `habilidad_comunicacion` varchar(50) NOT NULL,
  PRIMARY KEY (`id_servicio_cliente`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `servicio_cliente_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio_cliente`
--

LOCK TABLES `servicio_cliente` WRITE;
/*!40000 ALTER TABLE `servicio_cliente` DISABLE KEYS */;
INSERT INTO `servicio_cliente` VALUES (1,1,'Avanzado','Excelente'),(2,1,'Intermedio','Muy buena'),(3,1,'Avanzado','Excelente'),(4,1,'Basico','Buena'),(5,1,'Intermedio','Muy buena');
/*!40000 ALTER TABLE `servicio_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sin_comprobante`
--

DROP TABLE IF EXISTS `sin_comprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sin_comprobante` (
  `NFC_consumidor_final` varchar(13) NOT NULL,
  `id_factura` int NOT NULL,
  PRIMARY KEY (`NFC_consumidor_final`),
  KEY `id_factura` (`id_factura`),
  CONSTRAINT `sin_comprobante_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sin_comprobante`
--

LOCK TABLES `sin_comprobante` WRITE;
/*!40000 ALTER TABLE `sin_comprobante` DISABLE KEYS */;
INSERT INTO `sin_comprobante` VALUES ('B0200000001',1),('B0200000002',2),('B0200000003',3);
/*!40000 ALTER TABLE `sin_comprobante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal` (
  `id_sucursal` int NOT NULL AUTO_INCREMENT,
  `RNC` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `id_tercero` int NOT NULL,
  `horario_apertura` time NOT NULL,
  `horario_cierre` time NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `id_ciudad` int NOT NULL,
  `id_sector` int NOT NULL,
  `calle` varchar(100) NOT NULL,
  `num_departamento` varchar(100) NOT NULL,
  `instagram` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `descripcion` tinytext NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL,
  PRIMARY KEY (`id_sucursal`),
  KEY `id_ciudad` (`id_ciudad`),
  KEY `id_sector` (`id_sector`),
  KEY `id_tercero` (`id_tercero`),
  CONSTRAINT `sucursal_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `sucursal_ibfk_2` FOREIGN KEY (`id_sector`) REFERENCES `sector` (`id_sector`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `sucursal_ibfk_3` FOREIGN KEY (`id_tercero`) REFERENCES `tercero` (`id_tercero`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,273738928,'Sucursal Pekin',41,'08:00:00','18:00:00','8090000001',1,1,'Avenida los jazmines','0803','floristeria_la_margarita','floristeriamargarita1@gmail.com','Primera sucursal de la Floristeria la Margarita','activo'),(2,273738929,'Sucursal La calle del sol',42,'08:00:00','18:00:00','8090000002',1,2,'Sánchez #35','35','la_margarita_floristeria','floristeriamargarita2@gmail.com','Segunda sucursal de la Floristeria la Margarita','activo');
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tercero`
--

DROP TABLE IF EXISTS `tercero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tercero` (
  `id_tercero` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido_paterno` varchar(50) NOT NULL,
  `apellido_materno` varchar(50) DEFAULT NULL,
  `sexo` enum('masculino','femenino') NOT NULL,
  `id_tipo` int NOT NULL,
  `telefono` varchar(15) NOT NULL,
  PRIMARY KEY (`id_tercero`),
  KEY `id_tipo` (`id_tipo`),
  CONSTRAINT `tercero_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_tercero` (`id_tipo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tercero`
--

LOCK TABLES `tercero` WRITE;
/*!40000 ALTER TABLE `tercero` DISABLE KEYS */;
INSERT INTO `tercero` VALUES (1,'Anthony','Diaz','Rodriguez','masculino',1,'8095551001'),(2,'Dameyris','Rodriguez','Suriel','femenino',2,'8095551002'),(3,'Carlos','Fernandez','Gomez','masculino',3,'8095551003'),(4,'Luisa','Martinez','Santos','femenino',4,'8095551004'),(5,'Jose','Ramirez','Diaz','masculino',5,'8095551005'),(6,'Laura','Castillo','Mendez','femenino',1,'8095551006'),(7,'Miguel','Torres','Reyes','masculino',2,'8095551007'),(8,'Daniela','Vargas','Nuñez','femenino',3,'8095551008'),(9,'Pedro','Almonte','Sosa','masculino',4,'8095551009'),(10,'Camila','Herrera','Pichardo','femenino',5,'8095551010'),(11,'Roberto','Cruz','Fernandez','masculino',1,'8095551011'),(12,'Andrea','Morales','Gil','femenino',2,'8095551012'),(13,'Samuel','Peralta','Jimenez','masculino',3,'8095551013'),(14,'Paola','Rojas','Acosta','femenino',4,'8095551014'),(15,'Javier','Molina','Castro','masculino',5,'8095551015'),(16,'Valentina','Sanchez','Lora','femenino',1,'8095551016'),(17,'Eduardo','Guzman','Mejia','masculino',2,'8095551017'),(18,'Natalia','Diaz','Rosario','femenino',3,'8095551018'),(19,'Fernando','Cuevas','Polanco','masculino',4,'8095551019'),(20,'Melissa','Taveras','Reynoso','femenino',5,'8095551020'),(21,'Ricardo','Espinal','Lopez','masculino',1,'8095551021'),(22,'Patricia','Mendez','Santos','femenino',2,'8095551022'),(23,'Kevin','Rodriguez','Torres','masculino',3,'8095551023'),(24,'Sofia','Jimenez','Cabrera','femenino',4,'8095551024'),(25,'Luis','Alvarez','Perdomo','masculino',5,'8095551025'),(26,'Carolina','Pena','Garcia','femenino',1,'8095551026'),(27,'Angel','Fernandez','Ruiz','masculino',2,'8095551027'),(28,'Bianca','Nunez','Morillo','femenino',3,'8095551028'),(29,'Hector','Santos','Rivas','masculino',4,'8095551029'),(30,'Tatiana','De La Cruz','Mora','femenino',5,'8095551030'),(31,'Cristian','Valdez','Matos','masculino',1,'8095551031'),(32,'Gabriela','Acosta','Pena','femenino',2,'8095551032'),(33,'Manuel','Reyes','Lopez','masculino',3,'8095551033'),(34,'Isabella','Ortiz','Tejada','femenino',4,'8095551034'),(35,'Raul','Vasquez','Diaz','masculino',5,'8095551035'),(36,'Nicole','Castro','Sanchez','femenino',1,'8095551036'),(37,'Victor','Mendoza','Perez','masculino',2,'8095551037'),(38,'Alejandra','Lora','Ramirez','femenino',3,'8095551038'),(39,'Esteban','Martinez','Nuñez','masculino',4,'8095551039'),(40,'Daniel','Gil','Rosario','masculino',5,'8095551040'),(41,'Antho','Diaz','Rodriguez','masculino',6,'8293770172'),(42,'Damey','Rodriguez','Suriel','femenino',6,'8292585241'),(43,'Pepe','Diaz','Fernandez','masculino',3,'8290120392'),(44,'Ana','Rodriguez','Zuriel','femenino',3,'8238568393'),(45,'Ana','Rodriguez','Zuriel','femenino',3,'8238568393'),(46,'Rafa','Rodriguez','Zuriel','femenino',3,'8238568393'),(47,'Rafaelina','Rodriguez','Zuriel','femenino',3,'8238568393'),(48,'Rafaelina','Rodriguez','Zuriel','femenino',3,'8238568393'),(49,'carlos','Rodriguez','Zuriel','masculino',3,'8238568393'),(50,'Juana','Rosario','Hernandez','femenino',3,'80977657867');
/*!40000 ALTER TABLE `tercero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_arreglo`
--

DROP TABLE IF EXISTS `tipo_arreglo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_arreglo` (
  `id_tipo_arreglo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `descripcion` tinytext NOT NULL,
  PRIMARY KEY (`id_tipo_arreglo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_arreglo`
--

LOCK TABLES `tipo_arreglo` WRITE;
/*!40000 ALTER TABLE `tipo_arreglo` DISABLE KEYS */;
INSERT INTO `tipo_arreglo` VALUES (1,'Romántico','Arreglo para parejas'),(2,'Cumpleaños','Arreglo para cumpleaños'),(3,'Funeral','Arreglo de condolencias'),(4,'Graduación','Arreglo para graduación'),(5,'Aniversario','Arreglo para aniversarios');
/*!40000 ALTER TABLE `tipo_arreglo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_tercero`
--

DROP TABLE IF EXISTS `tipo_tercero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_tercero` (
  `id_tipo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `descripcion` tinytext NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_tercero`
--

LOCK TABLES `tipo_tercero` WRITE;
/*!40000 ALTER TABLE `tipo_tercero` DISABLE KEYS */;
INSERT INTO `tipo_tercero` VALUES (1,'Cliente','Persona que realiza compras'),(2,'Empleado','Trabajador de la empresa'),(3,'Proveedor','Persona que suministra productos a las sucursales'),(4,'Delivery','Encargado de entregas'),(5,'Representante','Representante de la empresa'),(6,'Administrador','Persona la cual tiene control total del sistema');
/*!40000 ALTER TABLE `tipo_tercero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `id_tercero` int NOT NULL,
  `id_rol` int NOT NULL,
  `correo` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_tercero` (`id_tercero`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_tercero`) REFERENCES `tercero` (`id_tercero`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,7,3,'miguel@gmail.com','abc123456','activo'),(2,2,3,'dameyris@gmail.com','abc123456','activo'),(3,17,3,'eduardo@gmail.com','abc123456','activo'),(4,4,1,'admin1@gmail.com','140520','activo'),(5,5,1,'admin2@gmail.com','140510','activo');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `id_pedido_cliente` int NOT NULL,
  `id_empleado` int NOT NULL,
  `id_sucursal` int NOT NULL,
  `fecha_venta` datetime NOT NULL,
  `tipos_venta` varchar(30) NOT NULL,
  `estado` enum('cancelada','pendiente','confirmada','en producciòn','finalizada') DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_empleado` (`id_empleado`),
  KEY `id_sucursal` (`id_sucursal`),
  KEY `id_pedido_cliente` (`id_pedido_cliente`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`id_pedido_cliente`) REFERENCES `pedido_domicilio` (`id_pedido_cliente`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,1,1,1,'2026-05-21 00:03:20','Online','finalizada'),(2,2,2,2,'2026-05-21 00:03:20','Presencial','confirmada'),(3,3,3,1,'2026-05-21 00:03:20','Online','pendiente'),(4,4,4,1,'2026-05-21 00:03:20','Presencial','en producciòn'),(5,5,5,2,'2026-05-21 00:03:20','Online','cancelada'),(6,1,1,1,'2026-05-22 02:16:06','Online','confirmada');
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vs_compra_proveedor`
--

DROP TABLE IF EXISTS `vs_compra_proveedor`;
/*!50001 DROP VIEW IF EXISTS `vs_compra_proveedor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vs_compra_proveedor` AS SELECT 
 1 AS `id_proveedor`,
 1 AS `nombre_prov`,
 1 AS `id_producto`,
 1 AS `nombre_prod`,
 1 AS `cantidad_solicitada`,
 1 AS `precio_unit_compra`,
 1 AS `total`,
 1 AS `id_sucursal`,
 1 AS `nombre`,
 1 AS `fecha_pedido_proveedor`,
 1 AS `entrega_estimada`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vs_historial_compra_cliente`
--

DROP TABLE IF EXISTS `vs_historial_compra_cliente`;
/*!50001 DROP VIEW IF EXISTS `vs_historial_compra_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vs_historial_compra_cliente` AS SELECT 
 1 AS `id_cliente`,
 1 AS `nombre`,
 1 AS `id_pedido_cliente`,
 1 AS `fecha_pedido`,
 1 AS `fecha_entrega`,
 1 AS `id_producto`,
 1 AS `nombre_prod`,
 1 AS `cantidad_producto`,
 1 AS `id_arreglo`,
 1 AS `cantidad_arreglo`,
 1 AS `total_factura`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vs_inventario_producto_sucursal`
--

DROP TABLE IF EXISTS `vs_inventario_producto_sucursal`;
/*!50001 DROP VIEW IF EXISTS `vs_inventario_producto_sucursal`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vs_inventario_producto_sucursal` AS SELECT 
 1 AS `id_sucursal`,
 1 AS `nombre`,
 1 AS `id_producto`,
 1 AS `nombre_prod`,
 1 AS `nombre_cat`,
 1 AS `stock`,
 1 AS `fecha_act`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vs_producto_arreglo`
--

DROP TABLE IF EXISTS `vs_producto_arreglo`;
/*!50001 DROP VIEW IF EXISTS `vs_producto_arreglo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vs_producto_arreglo` AS SELECT 
 1 AS `id_producto`,
 1 AS `id_categoria`,
 1 AS `nombre_prod`,
 1 AS `descripcion`,
 1 AS `tipo`,
 1 AS `descuento`,
 1 AS `valor_unit`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vs_compra_proveedor`
--

/*!50001 DROP VIEW IF EXISTS `vs_compra_proveedor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Antho`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vs_compra_proveedor` AS select `prov`.`id_proveedor` AS `id_proveedor`,`prov`.`nombre` AS `nombre_prov`,`prod`.`id_producto` AS `id_producto`,`prod`.`nombre_prod` AS `nombre_prod`,`dtpp`.`cantidad_solicitada` AS `cantidad_solicitada`,`dtpp`.`precio_unit_compra` AS `precio_unit_compra`,`pv`.`total` AS `total`,`s`.`id_sucursal` AS `id_sucursal`,`s`.`nombre` AS `nombre`,`pv`.`fecha_pedido_proveedor` AS `fecha_pedido_proveedor`,`pv`.`entrega_estimada` AS `entrega_estimada` from ((((`proveedor` `prov` join `detalle_pedido_proveedor` `dtpp` on((`prov`.`id_proveedor` = `dtpp`.`id_proveedor`))) join `producto` `prod` on((`dtpp`.`id_producto` = `prod`.`id_producto`))) join `pedido_proveedor` `pv` on((`dtpp`.`id_pedido_proveedor` = `pv`.`id_pedido_proveedor`))) join `sucursal` `s` on((`pv`.`id_sucursal` = `s`.`id_sucursal`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vs_historial_compra_cliente`
--

/*!50001 DROP VIEW IF EXISTS `vs_historial_compra_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Antho`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vs_historial_compra_cliente` AS select `c`.`id_cliente` AS `id_cliente`,`t`.`nombre` AS `nombre`,`p`.`id_pedido_cliente` AS `id_pedido_cliente`,`p`.`fecha_pedido` AS `fecha_pedido`,`p`.`fecha_entrega` AS `fecha_entrega`,`pr`.`id_producto` AS `id_producto`,`pr`.`nombre_prod` AS `nombre_prod`,`dtp`.`cantidad_producto` AS `cantidad_producto`,`dtap`.`id_arreglo` AS `id_arreglo`,`dtap`.`cantidad_arreglo` AS `cantidad_arreglo`,`f`.`total_factura` AS `total_factura`,`v`.`estado` AS `estado` from (((((((`tercero` `t` join `cliente` `c` on((`t`.`id_tercero` = `c`.`id_tercero`))) join `pedido_domicilio` `p` on((`c`.`id_cliente` = `p`.`id_cliente`))) join `detalle_producto_pedido_domicilio` `dtp` on((`p`.`id_pedido_cliente` = `dtp`.`id_pedido_cliente`))) join `producto` `pr` on((`dtp`.`id_producto` = `pr`.`id_producto`))) join `detalle_arreglo_pedido` `dtap` on((`dtap`.`id_pedido_cliente` = `p`.`id_pedido_cliente`))) join `venta` `v` on((`p`.`id_pedido_cliente` = `v`.`id_pedido_cliente`))) join `factura` `f` on((`v`.`id_venta` = `f`.`id_venta`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vs_inventario_producto_sucursal`
--

/*!50001 DROP VIEW IF EXISTS `vs_inventario_producto_sucursal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Antho`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vs_inventario_producto_sucursal` AS select `s`.`id_sucursal` AS `id_sucursal`,`s`.`nombre` AS `nombre`,`pr`.`id_producto` AS `id_producto`,`pr`.`nombre_prod` AS `nombre_prod`,`c`.`nombre` AS `nombre_cat`,`dts`.`stock` AS `stock`,`dts`.`fecha_act` AS `fecha_act`,`pr`.`estado` AS `estado` from (((`categoria` `c` join `producto` `pr` on((`c`.`id_categoria` = `pr`.`id_categoria`))) join `detalle_sucursal` `dts` on((`pr`.`id_producto` = `dts`.`id_producto`))) join `sucursal` `s` on((`dts`.`id_sucursal` = `s`.`id_sucursal`))) order by `dts`.`stock` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vs_producto_arreglo`
--

/*!50001 DROP VIEW IF EXISTS `vs_producto_arreglo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Antho`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vs_producto_arreglo` AS select `producto`.`id_producto` AS `id_producto`,`producto`.`id_categoria` AS `id_categoria`,`producto`.`nombre_prod` AS `nombre_prod`,`producto`.`descripcion` AS `descripcion`,`producto`.`tipo` AS `tipo`,`producto`.`descuento` AS `descuento`,`producto`.`valor_unit` AS `valor_unit`,`producto`.`estado` AS `estado` from `producto` where (`producto`.`id_categoria` = (select `categoria`.`id_categoria` from `categoria` where (`categoria`.`nombre` = 'Arreglos'))) */;
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

-- Dump completed on 2026-05-25  8:14:05

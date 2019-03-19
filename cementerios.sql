/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 100138
 Source Host           : localhost:3306
 Source Schema         : cementerios

 Target Server Type    : MySQL
 Target Server Version : 100138
 File Encoding         : 65001

 Date: 18/03/2019 08:41:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bovedas
-- ----------------------------
DROP TABLE IF EXISTS `bovedas`;
CREATE TABLE `bovedas`  (
  `idboveda` int(11) NOT NULL AUTO_INCREMENT,
  `numeracion` int(11) NULL DEFAULT NULL COMMENT 'numero de boveda',
  `fk_idpanteon` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idboveda`) USING BTREE,
  INDEX `fk_idpanteon`(`fk_idpanteon`) USING BTREE,
  CONSTRAINT `bovedas_ibfk_1` FOREIGN KEY (`fk_idpanteon`) REFERENCES `panteones` (`idpanteon`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cementerios
-- ----------------------------
DROP TABLE IF EXISTS `cementerios`;
CREATE TABLE `cementerios`  (
  `cod_cem` int(11) NOT NULL AUTO_INCREMENT,
  `nom_cem` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'nombre cementerio',
  `dir_cem` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'direccion del cementerio',
  `telefono1` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'telefono contacto cementerio',
  `fk_idparroquia` int(11) NULL DEFAULT NULL,
  `telefono2` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cod_cem`) USING BTREE,
  INDEX `fk_idparroquia`(`fk_idparroquia`) USING BTREE,
  CONSTRAINT `cementerios_ibfk_1` FOREIGN KEY (`fk_idparroquia`) REFERENCES `parroquias` (`idparroquia`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for contratos
-- ----------------------------
DROP TABLE IF EXISTS `contratos`;
CREATE TABLE `contratos`  (
  `idcontrato` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicio_contrato` date NULL DEFAULT NULL COMMENT 'fecha contrato',
  `valor_contrato` float NOT NULL,
  `fk_idsepultura` int(11) NULL DEFAULT NULL COMMENT 'tipo de servicio',
  `lapida` bit(1) NULL DEFAULT NULL COMMENT 'lapida contrato 1 si 0 no',
  `fk_iddifunto` int(11) NULL DEFAULT NULL,
  `fk_idpariente` int(11) NULL DEFAULT NULL,
  `fk_boveda` int(11) NULL DEFAULT NULL COMMENT 'boveda que ocupa el difunto',
  `plazo` int(11) NULL DEFAULT NULL COMMENT 'plazo para desocupar la boveda',
  `tipocontrato` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'T-tumba///E-exhumacion',
  `fecha_fin_contrato` date NULL DEFAULT NULL,
  `observacion` int(11) NULL DEFAULT NULL,
  `contratotumba` int(11) NULL DEFAULT NULL COMMENT 'el numero de contrato de la tumba, solo se usa en caso de ser contrato de exhumacion',
  PRIMARY KEY (`idcontrato`) USING BTREE,
  INDEX `fk_iddifunto`(`fk_iddifunto`) USING BTREE,
  INDEX `fk_idpariente`(`fk_idpariente`) USING BTREE,
  INDEX `fk_boveda`(`fk_boveda`) USING BTREE,
  INDEX `fk_idsepultura`(`fk_idsepultura`) USING BTREE,
  CONSTRAINT `contratos_ibfk_1` FOREIGN KEY (`fk_iddifunto`) REFERENCES `difuntos` (`iddifunto`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `contratos_ibfk_2` FOREIGN KEY (`fk_idpariente`) REFERENCES `parientes` (`idpariente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `contratos_ibfk_3` FOREIGN KEY (`fk_boveda`) REFERENCES `bovedas` (`idboveda`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `contratos_ibfk_4` FOREIGN KEY (`fk_idsepultura`) REFERENCES `sepulturas` (`idsepultura`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for difuntos
-- ----------------------------
DROP TABLE IF EXISTS `difuntos`;
CREATE TABLE `difuntos`  (
  `iddifunto` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `apellidos` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tipo_documento` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `documento` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fecha_nacimiento` date NULL DEFAULT NULL,
  `fecha_defuncion` date NULL DEFAULT NULL,
  PRIMARY KEY (`iddifunto`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for exhumaciones
-- ----------------------------
DROP TABLE IF EXISTS `exhumaciones`;
CREATE TABLE `exhumaciones`  (
  `idexhumacion` int(11) NOT NULL AUTO_INCREMENT,
  `fk_idcontrato` int(11) NULL DEFAULT NULL,
  `fk_idboveda` int(11) NULL DEFAULT NULL,
  `valor` float(11, 0) NULL DEFAULT NULL COMMENT 'cementerio recepcion',
  `fecha` date NULL DEFAULT NULL COMMENT 'tipo de sepultura a donde se envia',
  PRIMARY KEY (`idexhumacion`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pagos
-- ----------------------------
DROP TABLE IF EXISTS `pagos`;
CREATE TABLE `pagos`  (
  `idpago` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` int(11) NULL DEFAULT NULL,
  `valor_mantenimiento` int(11) NULL DEFAULT NULL,
  `fk_idcontrato` int(11) NULL DEFAULT NULL,
  `observacion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`idpago`) USING BTREE,
  INDEX `fk_idcontrato`(`fk_idcontrato`) USING BTREE,
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`fk_idcontrato`) REFERENCES `contratos` (`idcontrato`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for panteones
-- ----------------------------
DROP TABLE IF EXISTS `panteones`;
CREATE TABLE `panteones`  (
  `idpanteon` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` int(120) NULL DEFAULT NULL,
  `fk_idparroquia` int(11) NULL DEFAULT NULL,
  `minimo` int(11) NULL DEFAULT NULL COMMENT 'minimo numero de la boveda',
  `maximo` int(11) NULL DEFAULT NULL COMMENT 'maximo numero de la boveda',
  `osarios` bit(1) NULL DEFAULT NULL,
  `cenizarios` bit(1) NULL DEFAULT NULL,
  `tumbas` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`idpanteon`) USING BTREE,
  INDEX `fk_idparroquia`(`fk_idparroquia`) USING BTREE,
  CONSTRAINT `panteones_ibfk_1` FOREIGN KEY (`fk_idparroquia`) REFERENCES `parroquias` (`idparroquia`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for parientes
-- ----------------------------
DROP TABLE IF EXISTS `parientes`;
CREATE TABLE `parientes`  (
  `idpariente` int(11) NOT NULL,
  `nombres` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `apellidos` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tipo_documento` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `documento` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentezco` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idpariente`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for parroquias
-- ----------------------------
DROP TABLE IF EXISTS `parroquias`;
CREATE TABLE `parroquias`  (
  `idparroquia` int(11) NOT NULL,
  `nom_par` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nom_pco_par` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel_par` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dir_par` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cod_cem_par` int(20) NULL DEFAULT NULL,
  `osario` bit(1) NULL DEFAULT NULL,
  `cenizarios` bit(1) NULL DEFAULT NULL,
  `cementerio` bit(1) NULL DEFAULT NULL,
  `nit_parroquia` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`idparroquia`) USING BTREE,
  INDEX `parroquia_cementerio`(`cod_cem_par`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for precios
-- ----------------------------
DROP TABLE IF EXISTS `precios`;
CREATE TABLE `precios`  (
  `idprecio` int(11) NULL DEFAULT NULL,
  `fk_idsepultura` int(11) NULL DEFAULT NULL,
  `fk_idparroquia` int(11) NULL DEFAULT NULL,
  `precio_palida` float NULL DEFAULT NULL COMMENT 'precio con lapida',
  `precio_sin_lapida` int(11) NULL DEFAULT NULL COMMENT 'precio_sin_lapida',
  INDEX `fk_idsepultura`(`fk_idsepultura`) USING BTREE,
  INDEX `fk_idparroquia`(`fk_idparroquia`) USING BTREE,
  CONSTRAINT `precios_ibfk_1` FOREIGN KEY (`fk_idsepultura`) REFERENCES `sepulturas` (`idsepultura`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `precios_ibfk_2` FOREIGN KEY (`fk_idparroquia`) REFERENCES `parroquias` (`idparroquia`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sepulturas
-- ----------------------------
DROP TABLE IF EXISTS `sepulturas`;
CREATE TABLE `sepulturas`  (
  `idsepultura` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `estado` bit(1) NULL DEFAULT NULL COMMENT '1-activo///0-inactivo',
  PRIMARY KEY (`idsepultura`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `idusuario` int(11) NOT NULL,
  `usuario` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clave` varchar(72) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `documento` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nombres` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `apellidos` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `celular1` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `celular2` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`idusuario`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES (1, 'ADMIN', '$2y$10$X0HrZkkqTrYC9IKAOXQRNOlli/CykOCiYhbKO4EtMJPZz8NmMBAie', '1100970715', 'FERNANDO', 'MONSALVE RANGEL', 'FMR970214@GMAIL.COM', '3213748082', NULL);

SET FOREIGN_KEY_CHECKS = 1;

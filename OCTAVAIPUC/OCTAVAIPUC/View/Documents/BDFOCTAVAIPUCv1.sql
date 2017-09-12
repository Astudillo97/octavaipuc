-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.19-log - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para octavaipuc
CREATE DATABASE IF NOT EXISTS `octavaipuc` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `octavaipuc`;

-- Volcando estructura para tabla octavaipuc.cargo
CREATE TABLE IF NOT EXISTS `cargo` (
  `IDCARGO` int(11) NOT NULL AUTO_INCREMENT,
  `CAR_DETALLE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDCARGO`),
  UNIQUE KEY `CAR_DETALLE_UNIQUE` (`CAR_DETALLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla octavaipuc.cargo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;

-- Volcando estructura para tabla octavaipuc.celular
CREATE TABLE IF NOT EXISTS `celular` (
  `IDCELULAR` int(11) NOT NULL AUTO_INCREMENT,
  `CEL_IDPERSONA` int(11) NOT NULL,
  `CEL_NUMERO` varchar(20) NOT NULL,
  PRIMARY KEY (`IDCELULAR`),
  UNIQUE KEY `tele_id_UNIQUE` (`IDCELULAR`),
  KEY `fk_Telefono_Persona1_idx` (`CEL_IDPERSONA`),
  CONSTRAINT `fk_Telefono_Persona1` FOREIGN KEY (`CEL_IDPERSONA`) REFERENCES `persona` (`IDPERSONA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla octavaipuc.celular: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `celular` DISABLE KEYS */;
/*!40000 ALTER TABLE `celular` ENABLE KEYS */;

-- Volcando estructura para tabla octavaipuc.departamento
CREATE TABLE IF NOT EXISTS `departamento` (
  `IDDEPARTAMENTO` int(11) NOT NULL AUTO_INCREMENT,
  `DEP_DETALLE` varchar(50) NOT NULL,
  PRIMARY KEY (`IDDEPARTAMENTO`),
  UNIQUE KEY `depa_id_UNIQUE` (`IDDEPARTAMENTO`),
  UNIQUE KEY `depa_departamento_UNIQUE` (`DEP_DETALLE`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla octavaipuc.departamento: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` (`IDDEPARTAMENTO`, `DEP_DETALLE`) VALUES
	(1, 'Caquetá'),
	(2, 'Huila');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;

-- Volcando estructura para tabla octavaipuc.direccion
CREATE TABLE IF NOT EXISTS `direccion` (
  `IDDIRECCION` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `DIR_DETALLE` varchar(100) NOT NULL,
  `DIR_IDPERSONA` int(11) NOT NULL,
  `DIR_IDMUNICIPIO` int(11) NOT NULL,
  PRIMARY KEY (`IDDIRECCION`),
  KEY `DIR_IDMUNICIPIO` (`DIR_IDMUNICIPIO`),
  KEY `DIR_IDPERSONA` (`DIR_IDPERSONA`),
  CONSTRAINT `FK_direccion_municipio` FOREIGN KEY (`DIR_IDMUNICIPIO`) REFERENCES `municipio` (`IDMUNICIPIO`),
  CONSTRAINT `FK_direccion_persona` FOREIGN KEY (`DIR_IDPERSONA`) REFERENCES `persona` (`IDPERSONA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla octavaipuc.direccion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;

-- Volcando estructura para tabla octavaipuc.estado
CREATE TABLE IF NOT EXISTS `estado` (
  `IDESTADO` int(11) NOT NULL,
  `EST_DETALLE` varchar(45) NOT NULL,
  PRIMARY KEY (`IDESTADO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla octavaipuc.estado: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` (`IDESTADO`, `EST_DETALLE`) VALUES
	(1, 'Activo'),
	(2, 'Inactivo');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;

-- Volcando estructura para tabla octavaipuc.imagen
CREATE TABLE IF NOT EXISTS `imagen` (
  `IDIMAGEN` int(11) NOT NULL AUTO_INCREMENT,
  `IMG_URL` varchar(100) DEFAULT NULL,
  `IMG_PRIVACIDAD` varchar(45) DEFAULT NULL,
  `USU_IDUSUARIO` int(11) NOT NULL,
  PRIMARY KEY (`IDIMAGEN`),
  KEY `fk_IMAGEN_usuario1_idx` (`USU_IDUSUARIO`),
  CONSTRAINT `fk_IMAGEN_usuario1` FOREIGN KEY (`USU_IDUSUARIO`) REFERENCES `usuario` (`IDUSUARIO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla octavaipuc.imagen: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `imagen` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagen` ENABLE KEYS */;

-- Volcando estructura para tabla octavaipuc.infocargo
CREATE TABLE IF NOT EXISTS `infocargo` (
  `IDINFOCARGO` int(11) NOT NULL AUTO_INCREMENT,
  `INF_IDINFORMACION` int(11) NOT NULL,
  `CAR_IDCARGO` int(11) NOT NULL,
  PRIMARY KEY (`IDINFOCARGO`),
  KEY `fk_INFOCARGO_INFORMACION1_idx` (`INF_IDINFORMACION`),
  KEY `fk_INFOCARGO_CARGO1_idx` (`CAR_IDCARGO`),
  CONSTRAINT `fk_INFOCARGO_CARGO1` FOREIGN KEY (`CAR_IDCARGO`) REFERENCES `cargo` (`IDCARGO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_INFOCARGO_INFORMACION1` FOREIGN KEY (`INF_IDINFORMACION`) REFERENCES `informacion` (`IDINFORMACION`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla octavaipuc.infocargo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `infocargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `infocargo` ENABLE KEYS */;

-- Volcando estructura para tabla octavaipuc.informacion
CREATE TABLE IF NOT EXISTS `informacion` (
  `IDINFORMACION` int(11) NOT NULL AUTO_INCREMENT,
  `INF_NACIMIENTO` date DEFAULT NULL,
  `INF_BAUTISMO` date DEFAULT NULL,
  `INF_PROMESADO` tinyint(1) DEFAULT NULL,
  `PER_IDPERSONA` int(11) NOT NULL,
  PRIMARY KEY (`IDINFORMACION`),
  KEY `fk_FECHAS_persona1_idx` (`PER_IDPERSONA`),
  CONSTRAINT `fk_FECHAS_persona1` FOREIGN KEY (`PER_IDPERSONA`) REFERENCES `persona` (`IDPERSONA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla octavaipuc.informacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `informacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `informacion` ENABLE KEYS */;

-- Volcando estructura para tabla octavaipuc.mensajeria
CREATE TABLE IF NOT EXISTS `mensajeria` (
  `IDMENSAJERIA` int(11) NOT NULL AUTO_INCREMENT,
  `MENS_REMITENTE` int(11) NOT NULL,
  `MENS_DESTINATARIO` int(11) NOT NULL,
  `MENS_FECHA` datetime NOT NULL,
  PRIMARY KEY (`IDMENSAJERIA`),
  UNIQUE KEY `IDMENSAJERIA_UNIQUE` (`IDMENSAJERIA`),
  KEY `fk_MENSAJERIA_USUARIO1_idx` (`MENS_REMITENTE`),
  KEY `fk_MENSAJERIA_USUARIO2_idx` (`MENS_DESTINATARIO`),
  CONSTRAINT `fk_MENSAJERIA_USUARIO1` FOREIGN KEY (`MENS_REMITENTE`) REFERENCES `usuario` (`IDUSUARIO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MENSAJERIA_USUARIO2` FOREIGN KEY (`MENS_DESTINATARIO`) REFERENCES `usuario` (`IDUSUARIO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla octavaipuc.mensajeria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mensajeria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensajeria` ENABLE KEYS */;

-- Volcando estructura para tabla octavaipuc.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `IDMENU` int(11) NOT NULL AUTO_INCREMENT,
  `MEN_DETALLE` varchar(50) DEFAULT NULL,
  `MEN_URL` varchar(100) DEFAULT NULL,
  `MEN_ICON` varchar(45) DEFAULT NULL,
  `MEN_IDMENU` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDMENU`),
  KEY `fk_MENU_MENU1_idx` (`MEN_IDMENU`),
  CONSTRAINT `fk_MENU_MENU1` FOREIGN KEY (`MEN_IDMENU`) REFERENCES `menu` (`IDMENU`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla octavaipuc.menu: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`IDMENU`, `MEN_DETALLE`, `MEN_URL`, `MEN_ICON`, `MEN_IDMENU`) VALUES
	(1, 'Persona', NULL, 'icon s-4 icon-account', NULL),
	(2, 'Registrar', 'Persona_Registrar.aspx', NULL, 1);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

-- Volcando estructura para tabla octavaipuc.municipio
CREATE TABLE IF NOT EXISTS `municipio` (
  `IDMUNICIPIO` int(11) NOT NULL AUTO_INCREMENT,
  `MUN_DETALLE` varchar(50) NOT NULL,
  `MUN_IDDEPARTAMENTO` int(11) NOT NULL,
  PRIMARY KEY (`IDMUNICIPIO`),
  UNIQUE KEY `muni_id_UNIQUE` (`IDMUNICIPIO`),
  KEY `fk_Municipio_Departamento_idx` (`MUN_IDDEPARTAMENTO`),
  CONSTRAINT `fk_Municipio_Departamento` FOREIGN KEY (`MUN_IDDEPARTAMENTO`) REFERENCES `departamento` (`IDDEPARTAMENTO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla octavaipuc.municipio: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
INSERT INTO `municipio` (`IDMUNICIPIO`, `MUN_DETALLE`, `MUN_IDDEPARTAMENTO`) VALUES
	(1, 'Florenica', 1),
	(2, 'Morelia', 1),
	(3, 'Neiva', 2);
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;

-- Volcando estructura para tabla octavaipuc.permiso
CREATE TABLE IF NOT EXISTS `permiso` (
  `IDPERMISO` int(11) NOT NULL AUTO_INCREMENT,
  `PERM_IDROL` int(11) NOT NULL,
  `PERM_IDMENU` int(11) NOT NULL,
  PRIMARY KEY (`IDPERMISO`),
  KEY `fk_PERMISO_ROL1_idx` (`PERM_IDROL`),
  KEY `fk_PERMISO_MENU1_idx` (`PERM_IDMENU`),
  CONSTRAINT `fk_PERMISO_MENU1` FOREIGN KEY (`PERM_IDMENU`) REFERENCES `menu` (`IDMENU`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PERMISO_ROL1` FOREIGN KEY (`PERM_IDROL`) REFERENCES `rol` (`IDROL`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla octavaipuc.permiso: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
INSERT INTO `permiso` (`IDPERMISO`, `PERM_IDROL`, `PERM_IDMENU`) VALUES
	(1, 5, 1);
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;

-- Volcando estructura para tabla octavaipuc.perpro
CREATE TABLE IF NOT EXISTS `perpro` (
  `IDPERPRO` int(11) NOT NULL AUTO_INCREMENT,
  `PER_IDPERSONA` int(11) NOT NULL,
  `PRO_IDPROFESION` int(11) NOT NULL,
  PRIMARY KEY (`IDPERPRO`),
  KEY `fk_PERPRO_persona1_idx` (`PER_IDPERSONA`),
  KEY `fk_PERPRO_Profesion1_idx` (`PRO_IDPROFESION`),
  CONSTRAINT `fk_PERPRO_Profesion1` FOREIGN KEY (`PRO_IDPROFESION`) REFERENCES `profesion` (`IDPROFESION`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PERPRO_persona1` FOREIGN KEY (`PER_IDPERSONA`) REFERENCES `persona` (`IDPERSONA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla octavaipuc.perpro: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `perpro` DISABLE KEYS */;
/*!40000 ALTER TABLE `perpro` ENABLE KEYS */;

-- Volcando estructura para tabla octavaipuc.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `IDPERSONA` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la entidad',
  `PER_IDENTIFICACION` varchar(12) NOT NULL COMMENT 'Registra la identificaciÃ³n de una persona',
  `PER_NOMBRE` varchar(50) NOT NULL COMMENT 'Registra los nombres de una persona',
  `PER_APELLIDO` varchar(50) NOT NULL COMMENT 'Registra los apellidos de una persona',
  `PER_IDTIDENTIFICACION` int(11) NOT NULL,
  `PER_CORREO` varchar(100) DEFAULT NULL,
  `PER_IDESTADO` int(11) NOT NULL,
  PRIMARY KEY (`IDPERSONA`),
  UNIQUE KEY `pers_id_UNIQUE` (`IDPERSONA`),
  UNIQUE KEY `PER_IDENTIFICACION` (`PER_IDENTIFICACION`),
  KEY `fk_Persona_Tipo_Identificacion1_idx` (`PER_IDTIDENTIFICACION`),
  KEY `fk_PERSONA_ESTADO1_idx` (`PER_IDESTADO`),
  CONSTRAINT `fk_PERSONA_ESTADO1` FOREIGN KEY (`PER_IDESTADO`) REFERENCES `estado` (`IDESTADO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_Tipo_Identificacion1` FOREIGN KEY (`PER_IDTIDENTIFICACION`) REFERENCES `tidentificacion` (`IDTIDENTIFICACION`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla octavaipuc.persona: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` (`IDPERSONA`, `PER_IDENTIFICACION`, `PER_NOMBRE`, `PER_APELLIDO`, `PER_IDTIDENTIFICACION`, `PER_CORREO`, `PER_IDESTADO`) VALUES
	(21, '1006955451', 'Yeferson', 'Astudillo Briñez', 5, NULL, 1),
	(25, '106955451', 'YEFERSON', 'ASTUDILLO', 5, 'jab291214@gmail.com', 1);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;

-- Volcando estructura para tabla octavaipuc.profesion
CREATE TABLE IF NOT EXISTS `profesion` (
  `IDPROFESION` int(11) NOT NULL AUTO_INCREMENT,
  `PRO_DETALLE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDPROFESION`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla octavaipuc.profesion: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `profesion` DISABLE KEYS */;
INSERT INTO `profesion` (`IDPROFESION`, `PRO_DETALLE`) VALUES
	(1, 'Ingeniero Sistemas'),
	(2, 'Administrador Empresas');
/*!40000 ALTER TABLE `profesion` ENABLE KEYS */;

-- Volcando estructura para procedimiento octavaipuc.PR_CELULAR_REGISTRAR
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_CELULAR_REGISTRAR`(
	IN `identificacion` VARCHAR(50),
	IN `numero` VARCHAR(50)


)
BEGIN
INSERT INTO `OCTAVAIPUC`.`celular` 
(`CEL_IDPERSONA`, `CEL_NUMERO`) 
VALUES
((select IDPERSONA from persona where PER_IDENTIFICACION=identificacion), numero);
END//
DELIMITER ;

-- Volcando estructura para procedimiento octavaipuc.PR_DEPARTAMENTO_CONSULTAR_G
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_DEPARTAMENTO_CONSULTAR_G`()
BEGIN
select * from departamento;
END//
DELIMITER ;

-- Volcando estructura para procedimiento octavaipuc.PR_DIRECCION_REGISTRAR
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_DIRECCION_REGISTRAR`(
	IN `detalle` VARCHAR(50),
	IN `identificacion` VARCHAR(50),
	IN `idmunicipio` INT



)
BEGIN
INSERT INTO `OCTAVAIPUC`.`direccion` 
(`DIR_DETALLE`, `DIR_IDPERSONA`, `DIR_IDMUNICIPIO`) 
VALUES (detalle, (select IDPERSONA from persona where PER_IDENTIFICACION=identificacion), idmunicipio);
END//
DELIMITER ;

-- Volcando estructura para procedimiento octavaipuc.PR_ESTADO_CONSULTAR_PERSONA
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_ESTADO_CONSULTAR_PERSONA`()
BEGIN
select * from estado where IDESTADO=1 or IDESTADO=2;
END//
DELIMITER ;

-- Volcando estructura para procedimiento octavaipuc.PR_IMAGEN_REGISTRAR
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_IMAGEN_REGISTRAR`(
	IN `url` VARCHAR(100),
	IN `privacidad` VARCHAR(45),
	IN `idpersona` INT
)
BEGIN
insert into imagen values (default, url,privacidad,idpersona);
END//
DELIMITER ;

-- Volcando estructura para procedimiento octavaipuc.PR_MUNICIPIO_CONSULTAR
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_MUNICIPIO_CONSULTAR`(
	IN `var_departamento` INT

)
BEGIN
select * from municipio where MUN_IDDEPARTAMENTO=var_departamento;
END//
DELIMITER ;

-- Volcando estructura para procedimiento octavaipuc.PR_PERSONA_CONSULTAR_ID
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_PERSONA_CONSULTAR_ID`(
	IN `id` INT

)
BEGIN
select * from persona where IDPERSONA=id;
END//
DELIMITER ;

-- Volcando estructura para procedimiento octavaipuc.PR_PERSONA_CONSULTAR_IDENTIFICACION
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_PERSONA_CONSULTAR_IDENTIFICACION`(
	IN `identificacion` VARCHAR(50)

)
BEGIN
select * from persona where PER_IDENTIFICACION=identificacion;
END//
DELIMITER ;

-- Volcando estructura para procedimiento octavaipuc.PR_PERSONA_MODIFICAR
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_PERSONA_MODIFICAR`(
	IN `id` INT,
	IN `identificacion` VARCHAR(50),
	IN `nombre` VARCHAR(50),
	IN `apellido` VARCHAR(50),
	IN `tid` VARCHAR(50),
	IN `correo` VARCHAR(100),
	IN `est` INT

)
BEGIN
UPDATE `mercam`.`persona` SET 
`PER_IDENTIFICACION`=identificacion, 
`PER_NOMBRE`=upper(nombre), 
`PER_APELLIDO`=upper(apellido), 
`PER_IDTIDENTIFICACION`=tid, 
`PER_CORREO`=correo, 
`PER_IDESTADO`=est 
WHERE  `IDPERSONA`=id;
END//
DELIMITER ;

-- Volcando estructura para procedimiento octavaipuc.PR_PERSONA_REGISTRAR
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_PERSONA_REGISTRAR`(
	IN `iden` INT
,
	IN `nombre` VARCHAR(50),
	IN `apellido` VARCHAR(50),
	IN `tiden` INT,
	IN `correo` VARCHAR(100)




)
BEGIN
INSERT INTO `OCTAVAIPUC`.`persona` 
(`PER_IDENTIFICACION`, `PER_NOMBRE`, `PER_APELLIDO`, `PER_IDTIDENTIFICACION`, `PER_CORREO`, `PER_IDESTADO`) 
VALUES 
(iden, upper(nombre), upper(apellido), tiden, correo, '1');
END//
DELIMITER ;

-- Volcando estructura para procedimiento octavaipuc.PR_PROFESION_CONSULTAR
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_PROFESION_CONSULTAR`()
BEGIN
SELECT * FROM profesion;
END//
DELIMITER ;

-- Volcando estructura para procedimiento octavaipuc.PR_ROL_CONSULTAR_G
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_ROL_CONSULTAR_G`()
BEGIN
select * from rol;
END//
DELIMITER ;

-- Volcando estructura para procedimiento octavaipuc.PR_TIDENTIFICACION_CONSULTA_G
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_TIDENTIFICACION_CONSULTA_G`()
BEGIN
select * from tidentificacion order by idtidentificacion;
END//
DELIMITER ;

-- Volcando estructura para procedimiento octavaipuc.PR_USUARIO_CONSULTAR_USERNAME
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_USUARIO_CONSULTAR_USERNAME`(
	IN `user_name` VARCHAR(50)






)
BEGIN
select IDUSUARIO,USU_USER,USU_IDPERSONA,USU_IDROL from usuario where USU_USER=user_name;
END//
DELIMITER ;

-- Volcando estructura para procedimiento octavaipuc.PR_USUARIO_REGISTRAR
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_USUARIO_REGISTRAR`(
	IN `user_name` VARCHAR(50),
	IN `pass` VARCHAR(50),
	IN `identificacion` VARCHAR(50),
	IN `roles` VARCHAR(50)



)
BEGIN
INSERT INTO `OCTAVAIPUC`.`usuario`
 (`USU_USER`, `USU_PASS`, `USU_IDPERSONA`, `USU_IDROL`) 
VALUES 
(user_name, md5(pass), (select IDPERSONA from persona where PER_IDENTIFICACION=identificacion), roles);
END//
DELIMITER ;

-- Volcando estructura para procedimiento octavaipuc.PR_USUARIO_VALIDAR
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_USUARIO_VALIDAR`(
	IN `user_name` VARCHAR(50),
	IN `user_pass` VARCHAR(50)





)
BEGIN
select * from usuario where USU_USER=user_name and USU_PASS=md5(user_pass);
END//
DELIMITER ;

-- Volcando estructura para tabla octavaipuc.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `IDROL` int(11) NOT NULL AUTO_INCREMENT,
  `ROL_DETALLE` varchar(45) NOT NULL,
  PRIMARY KEY (`IDROL`),
  UNIQUE KEY `rol_id_UNIQUE` (`IDROL`),
  UNIQUE KEY `rol_nombre_UNIQUE` (`ROL_DETALLE`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla octavaipuc.rol: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` (`IDROL`, `ROL_DETALLE`) VALUES
	(5, 'Administrador'),
	(7, 'Encargado'),
	(6, 'Usuario');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;

-- Volcando estructura para tabla octavaipuc.tidentificacion
CREATE TABLE IF NOT EXISTS `tidentificacion` (
  `IDTIDENTIFICACION` int(11) NOT NULL AUTO_INCREMENT,
  `TID_DETALLE` varchar(50) NOT NULL,
  PRIMARY KEY (`IDTIDENTIFICACION`),
  UNIQUE KEY `tpid_id_UNIQUE` (`IDTIDENTIFICACION`),
  UNIQUE KEY `tpid_tipo_UNIQUE` (`TID_DETALLE`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla octavaipuc.tidentificacion: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `tidentificacion` DISABLE KEYS */;
INSERT INTO `tidentificacion` (`IDTIDENTIFICACION`, `TID_DETALLE`) VALUES
	(5, 'Cedula'),
	(7, 'Registro Civil'),
	(0, 'Selecione'),
	(6, 'Targeta Identidad');
/*!40000 ALTER TABLE `tidentificacion` ENABLE KEYS */;

-- Volcando estructura para tabla octavaipuc.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `IDUSUARIO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la entidad',
  `USU_USER` varchar(50) NOT NULL,
  `USU_PASS` varchar(100) NOT NULL,
  `USU_IDPERSONA` int(11) NOT NULL,
  `USU_IDROL` int(11) NOT NULL,
  PRIMARY KEY (`IDUSUARIO`),
  UNIQUE KEY `usua_id_UNIQUE` (`IDUSUARIO`),
  UNIQUE KEY `usua_usuario_UNIQUE` (`USU_USER`),
  KEY `fk_Usuario_Persona1_idx` (`USU_IDPERSONA`),
  KEY `fk_USUARIO_Rol1_idx` (`USU_IDROL`),
  CONSTRAINT `fk_USUARIO_Rol1` FOREIGN KEY (`USU_IDROL`) REFERENCES `rol` (`IDROL`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Persona1` FOREIGN KEY (`USU_IDPERSONA`) REFERENCES `persona` (`IDPERSONA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla octavaipuc.usuario: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`IDUSUARIO`, `USU_USER`, `USU_PASS`, `USU_IDPERSONA`, `USU_IDROL`) VALUES
	(18, 'hola', '4d186321c1a7f0f354b297e8914ab240', 21, 6),
	(21, 'y.astudillo', '81dc9bdb52d04dc20036dbd8313ed055', 21, 5);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

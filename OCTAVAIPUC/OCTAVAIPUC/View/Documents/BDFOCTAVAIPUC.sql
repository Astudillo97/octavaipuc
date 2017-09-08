-- MySQL Script generated by MySQL Workbench
-- Tue Sep  5 22:05:08 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema OCTAVAIPUC
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema OCTAVAIPUC
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `OCTAVAIPUC` DEFAULT CHARACTER SET utf8 ;
USE `OCTAVAIPUC` ;

-- -----------------------------------------------------
-- Table `OCTAVAIPUC`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCTAVAIPUC`.`estado` (
  `IDESTADO` INT(11) NOT NULL,
  `EST_DETALLE` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IDESTADO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `OCTAVAIPUC`.`tidentificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCTAVAIPUC`.`tidentificacion` (
  `IDTIDENTIFICACION` INT(11) NOT NULL AUTO_INCREMENT,
  `TID_DETALLE` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`IDTIDENTIFICACION`),
  UNIQUE INDEX `tpid_id_UNIQUE` (`IDTIDENTIFICACION` ASC),
  UNIQUE INDEX `tpid_tipo_UNIQUE` (`TID_DETALLE` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `OCTAVAIPUC`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCTAVAIPUC`.`persona` (
  `IDPERSONA` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la entidad',
  `PER_IDENTIFICACION` VARCHAR(12) NOT NULL COMMENT 'Registra la identificaciÃ³n de una persona',
  `PER_NOMBRE` VARCHAR(50) NOT NULL COMMENT 'Registra los nombres de una persona',
  `PER_APELLIDO` VARCHAR(50) NOT NULL COMMENT 'Registra los apellidos de una persona',
  `PER_IDTIDENTIFICACION` INT(11) NOT NULL,
  `PER_CORREO` VARCHAR(100) NOT NULL,
  `PER_IDESTADO` INT(11) NOT NULL,
  PRIMARY KEY (`IDPERSONA`),
  UNIQUE INDEX `pers_id_UNIQUE` (`IDPERSONA` ASC),
  UNIQUE INDEX `PER_IDENTIFICACION` (`PER_IDENTIFICACION` ASC),
  INDEX `fk_Persona_Tipo_Identificacion1_idx` (`PER_IDTIDENTIFICACION` ASC),
  INDEX `fk_PERSONA_ESTADO1_idx` (`PER_IDESTADO` ASC),
  CONSTRAINT `fk_PERSONA_ESTADO1`
    FOREIGN KEY (`PER_IDESTADO`)
    REFERENCES `OCTAVAIPUC`.`estado` (`IDESTADO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_Tipo_Identificacion1`
    FOREIGN KEY (`PER_IDTIDENTIFICACION`)
    REFERENCES `OCTAVAIPUC`.`tidentificacion` (`IDTIDENTIFICACION`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `OCTAVAIPUC`.`celular`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCTAVAIPUC`.`celular` (
  `IDCELULAR` INT(11) NOT NULL AUTO_INCREMENT,
  `CEL_IDPERSONA` INT(11) NOT NULL,
  `CEL_NUMERO` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`IDCELULAR`),
  UNIQUE INDEX `tele_id_UNIQUE` (`IDCELULAR` ASC),
  INDEX `fk_Telefono_Persona1_idx` (`CEL_IDPERSONA` ASC),
  CONSTRAINT `fk_Telefono_Persona1`
    FOREIGN KEY (`CEL_IDPERSONA`)
    REFERENCES `OCTAVAIPUC`.`persona` (`IDPERSONA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `OCTAVAIPUC`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCTAVAIPUC`.`departamento` (
  `IDDEPARTAMENTO` INT(11) NOT NULL AUTO_INCREMENT,
  `DEP_DETALLE` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`IDDEPARTAMENTO`),
  UNIQUE INDEX `depa_id_UNIQUE` (`IDDEPARTAMENTO` ASC),
  UNIQUE INDEX `depa_departamento_UNIQUE` (`DEP_DETALLE` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 33
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `OCTAVAIPUC`.`municipio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCTAVAIPUC`.`municipio` (
  `IDMUNICIPIO` INT(11) NOT NULL AUTO_INCREMENT,
  `MUN_DETALLE` VARCHAR(50) NOT NULL,
  `MUN_IDDEPARTAMENTO` INT(11) NOT NULL,
  PRIMARY KEY (`IDMUNICIPIO`),
  UNIQUE INDEX `muni_id_UNIQUE` (`IDMUNICIPIO` ASC),
  INDEX `fk_Municipio_Departamento_idx` (`MUN_IDDEPARTAMENTO` ASC),
  CONSTRAINT `fk_Municipio_Departamento`
    FOREIGN KEY (`MUN_IDDEPARTAMENTO`)
    REFERENCES `OCTAVAIPUC`.`departamento` (`IDDEPARTAMENTO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1113
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `OCTAVAIPUC`.`direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCTAVAIPUC`.`direccion` (
  `IDDIRECCION` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `DIR_DETALLE` VARCHAR(100) NOT NULL,
  `DIR_IDPERSONA` INT(11) NOT NULL,
  `DIR_IDMUNICIPIO` INT(11) NOT NULL,
  PRIMARY KEY (`IDDIRECCION`),
  INDEX `DIR_IDMUNICIPIO` (`DIR_IDMUNICIPIO` ASC),
  INDEX `DIR_IDPERSONA` (`DIR_IDPERSONA` ASC),
  CONSTRAINT `FK_direccion_municipio`
    FOREIGN KEY (`DIR_IDMUNICIPIO`)
    REFERENCES `OCTAVAIPUC`.`municipio` (`IDMUNICIPIO`),
  CONSTRAINT `FK_direccion_persona`
    FOREIGN KEY (`DIR_IDPERSONA`)
    REFERENCES `OCTAVAIPUC`.`persona` (`IDPERSONA`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `OCTAVAIPUC`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCTAVAIPUC`.`rol` (
  `IDROL` INT(11) NOT NULL AUTO_INCREMENT,
  `ROL_DETALLE` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IDROL`),
  UNIQUE INDEX `rol_id_UNIQUE` (`IDROL` ASC),
  UNIQUE INDEX `rol_nombre_UNIQUE` (`ROL_DETALLE` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `OCTAVAIPUC`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCTAVAIPUC`.`usuario` (
  `IDUSUARIO` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la entidad',
  `USU_USER` VARCHAR(50) NOT NULL,
  `USU_PASS` VARCHAR(100) NOT NULL,
  `USU_IDPERSONA` INT(11) NOT NULL,
  `USU_IDROL` INT(11) NOT NULL,
  PRIMARY KEY (`IDUSUARIO`),
  UNIQUE INDEX `usua_id_UNIQUE` (`IDUSUARIO` ASC),
  UNIQUE INDEX `usua_usuario_UNIQUE` (`USU_USER` ASC),
  INDEX `fk_Usuario_Persona1_idx` (`USU_IDPERSONA` ASC),
  INDEX `fk_USUARIO_Rol1_idx` (`USU_IDROL` ASC),
  CONSTRAINT `fk_USUARIO_Rol1`
    FOREIGN KEY (`USU_IDROL`)
    REFERENCES `OCTAVAIPUC`.`rol` (`IDROL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Persona1`
    FOREIGN KEY (`USU_IDPERSONA`)
    REFERENCES `OCTAVAIPUC`.`persona` (`IDPERSONA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `OCTAVAIPUC`.`mensajeria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCTAVAIPUC`.`mensajeria` (
  `IDMENSAJERIA` INT(11) NOT NULL AUTO_INCREMENT,
  `MENS_REMITENTE` INT(11) NOT NULL,
  `MENS_DESTINATARIO` INT(11) NOT NULL,
  `MENS_FECHA` DATETIME NOT NULL,
  PRIMARY KEY (`IDMENSAJERIA`),
  UNIQUE INDEX `IDMENSAJERIA_UNIQUE` (`IDMENSAJERIA` ASC),
  INDEX `fk_MENSAJERIA_USUARIO1_idx` (`MENS_REMITENTE` ASC),
  INDEX `fk_MENSAJERIA_USUARIO2_idx` (`MENS_DESTINATARIO` ASC),
  CONSTRAINT `fk_MENSAJERIA_USUARIO1`
    FOREIGN KEY (`MENS_REMITENTE`)
    REFERENCES `OCTAVAIPUC`.`usuario` (`IDUSUARIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MENSAJERIA_USUARIO2`
    FOREIGN KEY (`MENS_DESTINATARIO`)
    REFERENCES `OCTAVAIPUC`.`usuario` (`IDUSUARIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `OCTAVAIPUC`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCTAVAIPUC`.`menu` (
  `IDMENU` INT(11) NOT NULL AUTO_INCREMENT,
  `MEN_DETALLE` VARCHAR(50) NULL,
  `MEN_URL` VARCHAR(100) NULL,
  `MEN_ICON` VARCHAR(45) NULL DEFAULT NULL,
  `MEN_IDMENU` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`IDMENU`),
  INDEX `fk_MENU_MENU1_idx` (`MEN_IDMENU` ASC),
  CONSTRAINT `fk_MENU_MENU1`
    FOREIGN KEY (`MEN_IDMENU`)
    REFERENCES `OCTAVAIPUC`.`menu` (`IDMENU`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `OCTAVAIPUC`.`permiso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCTAVAIPUC`.`permiso` (
  `IDPERMISO` INT(11) NOT NULL AUTO_INCREMENT,
  `PERM_IDROL` INT(11) NOT NULL,
  `PERM_IDMENU` INT(11) NOT NULL,
  PRIMARY KEY (`IDPERMISO`),
  INDEX `fk_PERMISO_ROL1_idx` (`PERM_IDROL` ASC),
  INDEX `fk_PERMISO_MENU1_idx` (`PERM_IDMENU` ASC),
  CONSTRAINT `fk_PERMISO_MENU1`
    FOREIGN KEY (`PERM_IDMENU`)
    REFERENCES `OCTAVAIPUC`.`menu` (`IDMENU`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PERMISO_ROL1`
    FOREIGN KEY (`PERM_IDROL`)
    REFERENCES `OCTAVAIPUC`.`rol` (`IDROL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `OCTAVAIPUC`.`Profesion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCTAVAIPUC`.`Profesion` (
  `IDPROFESION` INT NOT NULL AUTO_INCREMENT,
  `PRO_DETALLE` VARCHAR(45) NULL,
  PRIMARY KEY (`IDPROFESION`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OCTAVAIPUC`.`PERPRO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCTAVAIPUC`.`PERPRO` (
  `IDPERPRO` INT NOT NULL AUTO_INCREMENT,
  `PER_IDPERSONA` INT(11) NOT NULL,
  `PRO_IDPROFESION` INT NOT NULL,
  PRIMARY KEY (`IDPERPRO`),
  INDEX `fk_PERPRO_persona1_idx` (`PER_IDPERSONA` ASC),
  INDEX `fk_PERPRO_Profesion1_idx` (`PRO_IDPROFESION` ASC),
  CONSTRAINT `fk_PERPRO_persona1`
    FOREIGN KEY (`PER_IDPERSONA`)
    REFERENCES `OCTAVAIPUC`.`persona` (`IDPERSONA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PERPRO_Profesion1`
    FOREIGN KEY (`PRO_IDPROFESION`)
    REFERENCES `OCTAVAIPUC`.`Profesion` (`IDPROFESION`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OCTAVAIPUC`.`INFORMACION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCTAVAIPUC`.`INFORMACION` (
  `IDINFORMACION` INT NOT NULL AUTO_INCREMENT,
  `INF_NACIMIENTO` DATE NULL,
  `INF_BAUTISMO` DATE NULL,
  `INF_PROMESADO` TINYINT(1) NULL,
  `PER_IDPERSONA` INT(11) NOT NULL,
  PRIMARY KEY (`IDINFORMACION`),
  INDEX `fk_FECHAS_persona1_idx` (`PER_IDPERSONA` ASC),
  CONSTRAINT `fk_FECHAS_persona1`
    FOREIGN KEY (`PER_IDPERSONA`)
    REFERENCES `OCTAVAIPUC`.`persona` (`IDPERSONA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OCTAVAIPUC`.`CARGO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCTAVAIPUC`.`CARGO` (
  `IDCARGO` INT NOT NULL AUTO_INCREMENT,
  `CAR_DETALLE` VARCHAR(45) NULL,
  PRIMARY KEY (`IDCARGO`),
  UNIQUE INDEX `CAR_DETALLE_UNIQUE` (`CAR_DETALLE` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OCTAVAIPUC`.`INFOCARGO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCTAVAIPUC`.`INFOCARGO` (
  `IDINFOCARGO` INT NOT NULL AUTO_INCREMENT,
  `INF_IDINFORMACION` INT NOT NULL,
  `CAR_IDCARGO` INT NOT NULL,
  PRIMARY KEY (`IDINFOCARGO`),
  INDEX `fk_INFOCARGO_INFORMACION1_idx` (`INF_IDINFORMACION` ASC),
  INDEX `fk_INFOCARGO_CARGO1_idx` (`CAR_IDCARGO` ASC),
  CONSTRAINT `fk_INFOCARGO_INFORMACION1`
    FOREIGN KEY (`INF_IDINFORMACION`)
    REFERENCES `OCTAVAIPUC`.`INFORMACION` (`IDINFORMACION`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_INFOCARGO_CARGO1`
    FOREIGN KEY (`CAR_IDCARGO`)
    REFERENCES `OCTAVAIPUC`.`CARGO` (`IDCARGO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OCTAVAIPUC`.`IMAGEN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCTAVAIPUC`.`IMAGEN` (
  `IDIMAGEN` INT NOT NULL AUTO_INCREMENT,
  `IMG_URL` VARCHAR(100) NULL,
  `IMG_PRIVACIDAD` VARCHAR(45) NULL,
  `USU_IDUSUARIO` INT(11) NOT NULL,
  PRIMARY KEY (`IDIMAGEN`),
  INDEX `fk_IMAGEN_usuario1_idx` (`USU_IDUSUARIO` ASC),
  CONSTRAINT `fk_IMAGEN_usuario1`
    FOREIGN KEY (`USU_IDUSUARIO`)
    REFERENCES `OCTAVAIPUC`.`usuario` (`IDUSUARIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `OCTAVAIPUC` ;

-- -----------------------------------------------------
-- procedure PR_ALMACEN_CONSULTAR
-- -----------------------------------------------------

DELIMITER $$
USE `OCTAVAIPUC`$$
CREATE DEFINER=`user_mercam`@`%` PROCEDURE `PR_ALMACEN_CONSULTAR`()
BEGIN
select IDALMACEN as 'Cod. Alamcen' ,PROD_NOMBRE as Prodcuto,ALM_CANTIDAD as Cantidad ,UNI_DETALLE as Unidad,PER_NOMBRE as Nombre,PER_APELLIDO as Apellido,ALM_FECHA as Fecha,EST_DETALLE as Estado 
from almacen 
inner join usuario on usuario.IDUSUARIO = almacen.ALM_IDUSUARIO 
inner join persona on usuario.USU_IDPERSONA = persona.IDPERSONA
inner join estado on estado.IDESTADO = almacen.ALM_IDESTADO
inner join producto on ALM_IDPRODUCTO=IDPRODUCTO
inner join unidad on IDUNIDAD =PROD_IDUNIDAD; 
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PR_ALMACEN_CONSULTAR_ID
-- -----------------------------------------------------

DELIMITER $$
USE `OCTAVAIPUC`$$
CREATE DEFINER=`user_mercam`@`%` PROCEDURE `PR_ALMACEN_CONSULTAR_ID`(
	IN `id` INT
)
BEGIN
select IDALMACEN as id ,PROD_NOMBRE as Prodcuto,ALM_CANTIDAD as Cantidad ,UNI_DETALLE as Unidad,PER_NOMBRE as Nombre,PER_APELLIDO as Apellido,ALM_FECHA as Fecha,EST_DETALLE as Estado 
from almacen 
inner join usuario on usuario.IDUSUARIO = almacen.ALM_IDUSUARIO 
inner join persona on usuario.USU_IDPERSONA = persona.IDPERSONA
inner join estado on estado.IDESTADO = almacen.ALM_IDESTADO
inner join producto on ALM_IDPRODUCTO=IDPRODUCTO
inner join unidad on IDUNIDAD =PROD_IDUNIDAD
where IDALMACEN = id; 
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PR_ALMACEN_INSERTAR
-- -----------------------------------------------------

DELIMITER $$
USE `OCTAVAIPUC`$$
CREATE DEFINER=`user_mercam`@`%` PROCEDURE `PR_ALMACEN_INSERTAR`(
	IN `cant` INT,
	IN `idusu` INT,
	IN `idpro` INT,
	IN `idest` INT
)
BEGIN

INSERT INTO mercam.almacen(ALM_CANTIDAD,ALM_FECHA,ALM_IDUSUARIO,ALM_IDPRODUCTO,ALM_IDESTADO)
VALUES (cant,now(),idusu,idpro,idest);

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PR_ALMACEN_MODIFICAR
-- -----------------------------------------------------

DELIMITER $$
USE `OCTAVAIPUC`$$
CREATE DEFINER=`user_mercam`@`%` PROCEDURE `PR_ALMACEN_MODIFICAR`(
	IN `ALM_CANTIDAD` INT,
	IN `FECHA` INT,
	IN `IDUSUARIO` INT,
	IN `IDPRODUCTOS` INT,
	IN `IDESTADO` INT
)
BEGIN
UPDATE `mercam`.`almacen`
SET
`ALM_CANTIDAD` = ALM_CANTIDAD,
`ALM_FECHA` = FECHA,
`ALM_IDUSUARIO` = IDUSUARIO,
`ALM_IDPRODUCTO` = (select producto.IDPRODUCTO from producto where producto.PROD_NOMBRE =IDPRODUCTOS),
`ALM_IDESTADO` = (SELECT estado.IDESTADO FROM estado where estado.EST_DETALLE = IDESTADO)
WHERE `IDALMACEN` = ID;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PR_CATEGORIA_CONSULTAR
-- -----------------------------------------------------

DELIMITER $$
USE `OCTAVAIPUC`$$
CREATE DEFINER=`user_mercam`@`%` PROCEDURE `PR_CATEGORIA_CONSULTAR`()
BEGIN
SELECT categoria.CAT_DETALLE, categoria.CAT_DESCRIPCION FROM categoria;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PR_CELULAR_REGISTRAR
-- -----------------------------------------------------

DELIMITER $$
USE `OCTAVAIPUC`$$
CREATE DEFINER=`user_mercam`@`%` PROCEDURE `PR_CELULAR_REGISTRAR`(
	IN `identificacion` VARCHAR(50),
	IN `numero` VARCHAR(50)
)
BEGIN
INSERT INTO `mercam`.`celular` 
(`CEL_IDPERSONA`, `CEL_NUMERO`) 
VALUES
((select IDPERSONA from persona where PER_IDENTIFICACION=identificacion), numero);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PR_COOPERATIVA_CONSULTAR
-- -----------------------------------------------------

DELIMITER $$
USE `OCTAVAIPUC`$$
CREATE DEFINER=`user_mercam`@`%` PROCEDURE `PR_COOPERATIVA_CONSULTAR`()
    COMMENT 'Procemiento que hace una consulta y devuelve la infromación de la cooperativa'
BEGIN
SELECT * FROM cooperativa;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PR_DEPARTAMENTO_CONSULTAR_G
-- -----------------------------------------------------

DELIMITER $$
USE `OCTAVAIPUC`$$
CREATE DEFINER=`user_mercam`@`%` PROCEDURE `PR_DEPARTAMENTO_CONSULTAR_G`()
BEGIN
select * from departamento;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PR_DIRECCION_REGISTRAR
-- -----------------------------------------------------

DELIMITER $$
USE `OCTAVAIPUC`$$
CREATE DEFINER=`user_mercam`@`%` PROCEDURE `PR_DIRECCION_REGISTRAR`(
	IN `detalle` VARCHAR(50),
	IN `identificacion` VARCHAR(50),
	IN `idmunicipio` INT

)
BEGIN
INSERT INTO `mercam`.`direccion` 
(`DIR_DETALLE`, `DIR_IDPERSONA`, `DIR_IDMUNICIPIO`) 
VALUES (detalle, (select IDPERSONA from persona where PER_IDENTIFICACION=identificacion), idmunicipio);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PR_ESTADO_CONSULTAR_PERSONA
-- -----------------------------------------------------

DELIMITER $$
USE `OCTAVAIPUC`$$
CREATE DEFINER=`user_mercam`@`%` PROCEDURE `PR_ESTADO_CONSULTAR_PERSONA`()
BEGIN
select * from estado where IDESTADO=1 or IDESTADO=2;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PR_MUNICIPIO_CONSULTAR
-- -----------------------------------------------------

DELIMITER $$
USE `OCTAVAIPUC`$$
CREATE DEFINER=`user_mercam`@`%` PROCEDURE `PR_MUNICIPIO_CONSULTAR`(
	IN `var_departamento` INT
)
BEGIN
select * from municipio where MUN_IDDEPARTAMENTO=var_departamento;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PR_PEDET_CONSULTAR
-- -----------------------------------------------------

DELIMITER $$
USE `OCTAVAIPUC`$$
CREATE DEFINER=`user_mercam`@`%` PROCEDURE `PR_PEDET_CONSULTAR`(pedidoVAR int )
BEGIN
SELECT count(IDPEDIDODETALLE),PROD_NOMBRE,PEDET_CANTIDA FROM mercam.pedidodetalle
INNER JOIN producto ON PEDET_IDPRODUCTO= IDPRODUCTO WHERE PEDET_IDPEDIDO =pedidoVAR
;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PR_PEDET_INSERTAR
-- -----------------------------------------------------

DELIMITER $$
USE `OCTAVAIPUC`$$
CREATE DEFINER=`user_mercam`@`%` PROCEDURE `PR_PEDET_INSERTAR`(idped int,idalm int,prod int,cant int )
BEGIN
INSERT INTO `mercam`.`pedidodetalle`
(`PEDET_IDPEDIDO`,
`PEDET_IDALMACEN`,
`PEDET_IDPRODUCTO`,
`PEDET_CANTIDA`)
VALUES
(idped
,0
,prod
,cant
);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PR_PEDET_MODIFICAR
-- -----------------------------------------------------

DELIMITER $$
USE `OCTAVAIPUC`$$
CREATE DEFINER=`user_mercam`@`%` PROCEDURE `PR_PEDET_MODIFICAR`(idVAR INT,almVAR INT,cantVAR INT ,prodVAR int )
BEGIN
UPDATE `mercam`.`pedidodetalle`
SET
`PEDET_IDALMACEN` = almVAR,
`PEDET_CANTIDA` = cantVAR,
`PEDET_IDPRODUCTO` = prodVAR
WHERE `IDPEDIDODETALLE` = idVAR;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PR_PEDIDOS_CONSULTAR_ESTADO
-- -----------------------------------------------------

DELIMITER $$
USE `OCTAVAIPUC`$$
CREATE DEFINER=`user_mercam`@`%` PROCEDURE `PR_PEDIDOS_CONSULTAR_ESTADO`(estadoVAR varchar(45))
BEGIN
SELECT IDPEDIDO,PED_FECHA,PER_NOMBRE,PER_APELLIDO,PED_FECHA,EST_DETALLE FROM mercam.pedido
INNER JOIN usuario on PED_IDUSUARIO = IDUSUARIO
INNER JOIN persona on USU_IDPERSONA = IDPERSONA
INNER JOIN estado on PED_IDESTADO = IDESTADO
WHERE EST_DETALLE = estadoVAR
;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PR_PEDIDOS_CONSULTAR_USUARIO
-- -----------------------------------------------------

DELIMITER $$
USE `OCTAVAIPUC`$$
CREATE DEFINER=`user_mercam`@`%` PROCEDURE `PR_PEDIDOS_CONSULTAR_USUARIO`(usuarioVAR varchar(45))
BEGIN
SELECT IDPEDIDO,PED_FECHA,PER_NOMBRE,PER_APELLIDO,PED_FECHA,EST_DETALLE FROM mercam.pedido
INNER JOIN usuario on PED_IDUSUARIO = IDUSUARIO
INNER JOIN persona on USU_IDPERSONA = IDPERSONA
INNER JOIN estado on PED_IDESTADO = IDESTADO
WHERE IDUSUARIO = usuarioVAR
;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PR_PEDIDOS_INSERTAR
-- -----------------------------------------------------

DELIMITER $$
USE `OCTAVAIPUC`$$
CREATE DEFINER=`user_mercam`@`%` PROCEDURE `PR_PEDIDOS_INSERTAR`(ID INT ,IDALMACEN VARCHAR(100),IDUSUARIO INT,ANTIDAD INT,IDESTADO VARCHAR (100))
BEGIN
INSERT INTO `mercam`.`pedido`
(`IDPEDIDO`,
`PED_IDUSUARIO`,
`PED_IDESTADO`,
`PED_FECHA`)
VALUES
(ID,
(SELECT `almacen`.`IDALMACEN` FROM `mercam`.`almacen`where `almacen`.`IDALMACEN`=IDALMACEN ),
PED_IDUSUARIO,
CANTIDAD,
(SELECT estado.IDESTADO FROM estado where estado.EST_DETALLE = IDESTADO),
NOW());
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PR_PEDIDOS_MODIFICAR
-- -----------------------------------------------------

DELIMITER $$
USE `OCTAVAIPUC`$$
CREATE DEFINER=`user_mercam`@`%` PROCEDURE `PR_PEDIDOS_MODIFICAR`(id int,usu int, estadovar varchar(45))
BEGIN
UPDATE `mercam`.`pedido`
SET
`IDPEDIDO` = id,
`PED_IDUSUARIO` = usu,
`PED_IDESTADO` = (select IDESTADO FROM estado where EST_DETALLE = estadovar)
WHERE `IDPEDIDO` = id;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PR_PEDIDO_CONTAR_ACTIVOS
-- -----------------------------------------------------

DELIMITER $$
USE `OCTAVAIPUC`$$
CREATE DEFINER=`user_mercam`@`%` PROCEDURE `PR_PEDIDO_CONTAR_ACTIVOS`(
	IN `detalle` VARCHAR(20)
)
BEGIN
select count(e.EST_DETALLE) as contador from pedido p inner join estado e on p.PED_IDESTADO=e.IDESTADO where e.EST_DETALLE=detalle;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PR_PERSONA_CONSULTAR_ID
-- -----------------------------------------------------

DELIMITER $$
USE `OCTAVAIPUC`$$
CREATE DEFINER=`user_mercam`@`%` PROCEDURE `PR_PERSONA_CONSULTAR_ID`(
	IN `id` INT
)
BEGIN
select * from persona where IDPERSONA=id;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PR_PERSONA_CONSULTAR_IDENTIFICACION
-- -----------------------------------------------------

DELIMITER $$
USE `OCTAVAIPUC`$$
CREATE DEFINER=`user_mercam`@`%` PROCEDURE `PR_PERSONA_CONSULTAR_IDENTIFICACION`(
	IN `identificacion` VARCHAR(50)
)
BEGIN
select * from persona where PER_IDENTIFICACION=identificacion;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PR_PERSONA_MODIFICAR
-- -----------------------------------------------------

DELIMITER $$
USE `OCTAVAIPUC`$$
CREATE DEFINER=`user_mercam`@`%` PROCEDURE `PR_PERSONA_MODIFICAR`(
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
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PR_PERSONA_REGISTRAR
-- -----------------------------------------------------

DELIMITER $$
USE `OCTAVAIPUC`$$
CREATE DEFINER=`user_mercam`@`%` PROCEDURE `PR_PERSONA_REGISTRAR`(
	IN `iden` INT
,
	IN `nombre` VARCHAR(50),
	IN `apellido` VARCHAR(50),
	IN `tiden` INT,
	IN `correo` VARCHAR(100)


)
BEGIN
INSERT INTO `mercam`.`persona` 
(`PER_IDENTIFICACION`, `PER_NOMBRE`, `PER_APELLIDO`, `PER_IDTIDENTIFICACION`, `PER_CORREO`, `PER_IDESTADO`) 
VALUES 
(iden, upper(nombre), upper(apellido), tiden, correo, '1');
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PR_ROL_CONSULTAR_G
-- -----------------------------------------------------

DELIMITER $$
USE `OCTAVAIPUC`$$
CREATE DEFINER=`user_mercam`@`%` PROCEDURE `PR_ROL_CONSULTAR_G`()
BEGIN
select * from rol;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PR_TIDENTIFICACION_CONSULTA_G
-- -----------------------------------------------------

DELIMITER $$
USE `OCTAVAIPUC`$$
CREATE DEFINER=`user_mercam`@`%` PROCEDURE `PR_TIDENTIFICACION_CONSULTA_G`()
BEGIN
select * from tidentificacion;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PR_UNIDAD_CONSULTAR
-- -----------------------------------------------------

DELIMITER $$
USE `OCTAVAIPUC`$$
CREATE DEFINER=`user_mercam`@`%` PROCEDURE `PR_UNIDAD_CONSULTAR`()
BEGIN
SELECT IDUNIDAD,UNI_DETALLE FROM mercam.unidad;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PR_USUARIO_CONSULTAR_USERNAME
-- -----------------------------------------------------

DELIMITER $$
USE `OCTAVAIPUC`$$
CREATE DEFINER=`user_mercam`@`%` PROCEDURE `PR_USUARIO_CONSULTAR_USERNAME`(
	IN `user_name` VARCHAR(50)




)
BEGIN
select IDUSUARIO,USU_USER,USU_IDPERSONA,USU_IDROL from usuario where USU_USER=user_name;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PR_USUARIO_REGISTRAR
-- -----------------------------------------------------

DELIMITER $$
USE `OCTAVAIPUC`$$
CREATE DEFINER=`user_mercam`@`%` PROCEDURE `PR_USUARIO_REGISTRAR`(
	IN `user_name` VARCHAR(50),
	IN `pass` VARCHAR(50),
	IN `identificacion` VARCHAR(50),
	IN `roles` VARCHAR(50)

)
BEGIN
INSERT INTO `mercam`.`usuario`
 (`USU_USER`, `USU_PASS`, `USU_IDPERSONA`, `USU_IDROL`) 
VALUES 
(user_name, md5(pass), (select IDPERSONA from persona where PER_IDENTIFICACION=identificacion), roles);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PR_USUARIO_VALIDAR
-- -----------------------------------------------------

DELIMITER $$
USE `OCTAVAIPUC`$$
CREATE DEFINER=`user_mercam`@`%` PROCEDURE `PR_USUARIO_VALIDAR`(
	IN `user_name` VARCHAR(50),
	IN `user_pass` VARCHAR(50)




)
BEGIN
select * from usuario where USU_USER=user_name and USU_PASS=md5(user_pass);
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

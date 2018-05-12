-- MySQL Workbench Forward Engineering

SET
  @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS,
  UNIQUE_CHECKS = 0;
SET
  @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS,
  FOREIGN_KEY_CHECKS = 0;
SET
  @OLD_SQL_MODE = @@SQL_MODE,
  SQL_MODE = 'TRADITIONAL,ALLOW_INVALID_DATES';



-- -----------------------------------------------------
-- Schema mangos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mangos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mangos` DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;


-- -----------------------------------------------------
-- Schema sys
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sys
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sys` DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
USE
  `mangos`;



-- -----------------------------------------------------
-- Table `mangos`.`MANGOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mangos`.`MANGOS`(
  `idMangos` INT NOT NULL,
  `nombreVar` VARCHAR(80) NOT NULL,
  `peso` FLOAT NULL,
  `fechaIniAprox` DATE NOT NULL,
  `precio` FLOAT NULL,
  `stock` FLOAT NULL,
  PRIMARY KEY(`idMangos`)
) ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `mangos`.`COMPRADOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mangos`.`COMPRADOR`(
  `idComprador` INT NOT NULL,
  `nombreComp` VARCHAR(120) NOT NULL,
  `NIFComp` VARCHAR(9) NOT NULL,
  `tipoComp` VARCHAR(45) NOT NULL,
  `dirEnvioComp` VARCHAR(200) NULL,
  `emailComp` VARCHAR(180) NOT NULL,
  `tlfComp` VARCHAR(9) NOT NULL,
  PRIMARY KEY(`idComprador`)
) ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `mangos`.`FACTURA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mangos`.`FACTURA`(
  `numFact` INT NOT NULL,
  `fechaFact` DATE NOT NULL,
  `idComprador` INT NOT NULL,
  PRIMARY KEY(`numFact`),
  CONSTRAINT `fk_FACTURA_COMPRADOR` FOREIGN KEY(`idComprador`) REFERENCES `mangos`.`COMPRADOR`(`idComprador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `mangos`.`DET_FACT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mangos`.`DET_FACT`(
  `codDetFact` INT NOT NULL,
  `idMangos` INT NOT NULL,
  `numFact` INT NOT NULL,
  `cantidad` FLOAT NOT NULL,
  PRIMARY KEY(`codDetFact`),
  CONSTRAINT `fk_MANGOS_has_FACTURA_MANGOS1` FOREIGN KEY(`idMangos`) REFERENCES `mangos`.`MANGOS`(`idMangos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MANGOS_has_FACTURA_FACTURA1` FOREIGN KEY(`numFact`) REFERENCES `mangos`.`FACTURA`(`numFact`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;
USE
  `sys`;



-- -----------------------------------------------------
-- Table `sys`.`sys_config`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sys`.`sys_config`(
  `variable` VARCHAR(128) NOT NULL,
  `value` VARCHAR(128) NULL DEFAULT NULL,
  `set_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `set_by` VARCHAR(128) NULL DEFAULT NULL,
  PRIMARY KEY(`variable`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
USE
  `sys`;
DELIMITER $$
USE
  `sys` $$
CREATE DEFINER = `mysql.sys`@`localhost` TRIGGER `sys`.`sys_config_insert_set_user` BEFORE
INSERT ON
  `sys`.`sys_config` FOR EACH ROW
BEGIN
  IF
    @sys.ignore_sys_config_triggers != TRUE AND NEW.set_by IS NULL THEN
  SET NEW
    .set_by = USER()
    END IF
END $$
USE
  `sys` $$
CREATE DEFINER = `mysql.sys`@`localhost` TRIGGER `sys`.`sys_config_update_set_user` BEFORE
UPDATE ON
  `sys`.`sys_config` FOR EACH ROW
BEGIN
  IF
    @sys.ignore_sys_config_triggers != TRUE AND NEW.set_by IS NULL THEN
  SET NEW
    .set_by = USER()
    END IF
END $$
DELIMITER ;
SET
  SQL_MODE = @OLD_SQL_MODE;
SET
  FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET
  UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;
-- MySQL Script generated by MySQL Workbench
-- Mon Jun 22 16:16:01 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema empresa_xyz
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema empresa_xyz
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `empresa_xyz` DEFAULT CHARACTER SET utf8 ;
USE `empresa_xyz` ;

-- -----------------------------------------------------
-- Table `empresa_xyz`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresa_xyz`.`estado` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `empresa_xyz`.`cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresa_xyz`.`cidade` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_estado` INT(11) NOT NULL,
  `cidade` VARCHAR(45) NULL DEFAULT NULL,
  `estado_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `estado_id`),
  INDEX `fk_cidade_estado1_idx` (`estado_id` ASC) VISIBLE,
  CONSTRAINT `fk_cidade_estado1`
    FOREIGN KEY (`estado_id`)
    REFERENCES `empresa_xyz`.`estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `empresa_xyz`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresa_xyz`.`cliente` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `numero` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `cidade_id` INT(11) NOT NULL,
  `cidade_estado_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `cidade_id`, `cidade_estado_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_cliente_cidade1_idx` (`cidade_id` ASC, `cidade_estado_id` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_cidade1`
    FOREIGN KEY (`cidade_id` , `cidade_estado_id`)
    REFERENCES `empresa_xyz`.`cidade` (`id` , `estado_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `empresa_xyz`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresa_xyz`.`status` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `empresa_xyz`.`pacote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresa_xyz`.`pacote` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `data_entrada` DATETIME NULL DEFAULT NULL,
  `data_entrega` DATETIME NULL DEFAULT NULL,
  `peso` FLOAT NOT NULL,
  `largura` INT(11) NOT NULL,
  `altura` INT(11) NOT NULL,
  `profundidade` INT(11) NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `numero` VARCHAR(45) NOT NULL,
  `id_cliente` INT(11) NOT NULL,
  `status_id` INT(11) NOT NULL,
  `cidade_id` INT(11) NOT NULL,
  `cidade_estado_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `status_id`, `cidade_id`, `cidade_estado_id`),
  INDEX `fk_pacote_status1_idx` (`status_id` ASC) VISIBLE,
  INDEX `fk_pacote_cidade1_idx` (`cidade_id` ASC, `cidade_estado_id` ASC) VISIBLE,
  CONSTRAINT `fk_pacote_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `empresa_xyz`.`status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pacote_cidade1`
    FOREIGN KEY (`cidade_id` , `cidade_estado_id`)
    REFERENCES `empresa_xyz`.`cidade` (`id` , `estado_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `empresa_xyz`.`cliente_has_pacote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresa_xyz`.`cliente_has_pacote` (
  `cliente_id` INT(11) NOT NULL,
  `pacote_id` INT(11) NOT NULL,
  PRIMARY KEY (`cliente_id`, `pacote_id`),
  INDEX `fk_cliente_has_pacote_pacote1_idx` (`pacote_id` ASC) VISIBLE,
  INDEX `fk_cliente_has_pacote_cliente_idx` (`cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_has_pacote_cliente`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `empresa_xyz`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_has_pacote_pacote1`
    FOREIGN KEY (`pacote_id`)
    REFERENCES `empresa_xyz`.`pacote` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
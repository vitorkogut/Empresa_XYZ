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
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `empresa_xyz`.`cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresa_xyz`.`cidade` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `cidade` VARCHAR(45) NULL DEFAULT NULL,
  `estado_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `estado_id`),
  INDEX `fk_cidade_estado1_idx` (`estado_id` ASC),
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
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_cliente_cidade1_idx` (`cidade_id` ASC, `cidade_estado_id` ASC),
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
  `data_entrada` VARCHAR(12) NULL DEFAULT NULL,
  `data_entrega` VARCHAR(12) NULL DEFAULT NULL,
  `peso` FLOAT NOT NULL,
  `largura` INT(11) NOT NULL,
  `altura` INT(11) NOT NULL,
  `profundidade` INT(11) NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `numero` VARCHAR(45) NOT NULL,
  `status_id` INT(11) NOT NULL,
  `cidade_id` INT(11) NOT NULL,
  `cidade_estado_id` INT(11) NOT NULL,
  `cliente_id` INT(11) NOT NULL,
  `cliente_cidade_id` INT(11) NOT NULL,
  `cliente_cidade_estado_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `status_id`, `cidade_id`, `cidade_estado_id`, `cliente_id`, `cliente_cidade_id`, `cliente_cidade_estado_id`),
  INDEX `fk_pacote_status1_idx` (`status_id` ASC) ,
  INDEX `fk_pacote_cidade1_idx` (`cidade_id` ASC, `cidade_estado_id` ASC) ,
  INDEX `fk_pacote_cliente1_idx` (`cliente_id` ASC, `cliente_cidade_id` ASC, `cliente_cidade_estado_id` ASC),
  CONSTRAINT `fk_pacote_cidade1`
    FOREIGN KEY (`cidade_id` , `cidade_estado_id`)
    REFERENCES `empresa_xyz`.`cidade` (`id` , `estado_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pacote_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `empresa_xyz`.`status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pacote_cliente1`
    FOREIGN KEY (`cliente_id` , `cliente_cidade_id` , `cliente_cidade_estado_id`)
    REFERENCES `empresa_xyz`.`cliente` (`id` , `cidade_id` , `cidade_estado_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `damp` ;
CREATE SCHEMA IF NOT EXISTS `damp` DEFAULT CHARACTER SET utf8 ;
USE `damp` ;

-- -----------------------------------------------------
-- Table `damp`.`supplier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `damp`.`supplier` ;

CREATE TABLE IF NOT EXISTS `damp`.`supplier` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `goods` VARCHAR(45) NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `referred_as` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `damp`.`title`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `damp`.`title` ;

CREATE TABLE IF NOT EXISTS `damp`.`title` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `referred_as` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `damp`.`driver`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `damp`.`driver` ;

CREATE TABLE IF NOT EXISTS `damp`.`driver` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title_id` INT NOT NULL,
  `drivername` VARCHAR(45) NOT NULL,
  `supplier_id` INT NOT NULL,
  `referred_as` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `title_id`, `supplier_id`),
  INDEX `fk_driver_title1_idx` (`title_id` ASC),
  INDEX `fk_driver_supplier1_idx` (`supplier_id` ASC),
  CONSTRAINT `fk_driver_title1`
    FOREIGN KEY (`title_id`)
    REFERENCES `damp`.`title` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_driver_supplier1`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `damp`.`supplier` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `damp`.`vehicle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `damp`.`vehicle` ;

CREATE TABLE IF NOT EXISTS `damp`.`vehicle` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `regNo` VARCHAR(45) NOT NULL,
  `make` VARCHAR(45) NULL DEFAULT NULL,
  `model` VARCHAR(45) NULL DEFAULT NULL,
  `supplier_id` INT NOT NULL,
  `referred_as` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `supplier_id`),
  INDEX `fk_vehicle_supplier_idx` (`supplier_id` ASC),
  CONSTRAINT `fk_vehicle_supplier`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `damp`.`supplier` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `damp`.`venue`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `damp`.`venue` ;

CREATE TABLE IF NOT EXISTS `damp`.`venue` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `stadiumname` VARCHAR(45) NOT NULL,
  `town` VARCHAR(45) NOT NULL,
  `referred_as` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `damp`.`state`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `damp`.`state` ;

CREATE TABLE IF NOT EXISTS `damp`.`state` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `referred_as` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `damp`.`card`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `damp`.`card` ;

CREATE TABLE IF NOT EXISTS `damp`.`card` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `driver_id` INT NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `state_id` INT NOT NULL,
  `referred_as` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `driver_id`, `state_id`),
  INDEX `fk_card_state1_idx` (`state_id` ASC),
  INDEX `fk_card_driver1_idx` (`driver_id` ASC),
  UNIQUE INDEX `driver_id_UNIQUE` (`driver_id` ASC),
  CONSTRAINT `fk_card_state1`
    FOREIGN KEY (`state_id`)
    REFERENCES `damp`.`state` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_card_driver1`
    FOREIGN KEY (`driver_id`)
    REFERENCES `damp`.`driver` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `damp`.`login`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `damp`.`login` ;

CREATE TABLE IF NOT EXISTS `damp`.`login` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `damp`.`delivery`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `damp`.`delivery` ;

CREATE TABLE IF NOT EXISTS `damp`.`delivery` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `vehicle_id` INT NOT NULL,
  `driver_id` INT NOT NULL,
  `venue_id` INT NOT NULL,
  `delivery_date` DATE NOT NULL,
  `referred_as` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `vehicle_id`, `driver_id`, `venue_id`),
  INDEX `fk_delivery_vehicle1_idx` (`vehicle_id` ASC),
  INDEX `fk_delivery_driver1_idx` (`driver_id` ASC),
  INDEX `fk_delivery_venue1_idx` (`venue_id` ASC),
  CONSTRAINT `fk_delivery_vehicle1`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `damp`.`vehicle` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_driver1`
    FOREIGN KEY (`driver_id`)
    REFERENCES `damp`.`driver` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_venue1`
    FOREIGN KEY (`venue_id`)
    REFERENCES `damp`.`venue` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `damp`.`enter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `damp`.`enter` ;

CREATE TABLE IF NOT EXISTS `damp`.`enter` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `referred_as` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `damp`.`entrylog`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `damp`.`entrylog` ;

CREATE TABLE IF NOT EXISTS `damp`.`entrylog` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `delivery_id` INT NOT NULL,
  `delivery_venue_id` INT NOT NULL,
  `delivery_vehicle_id` INT NOT NULL,
  `delivery_driver_id` INT NOT NULL,
  `enter_id` INT NOT NULL,
  `referred_as` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `delivery_id`, `delivery_venue_id`, `delivery_vehicle_id`, `delivery_driver_id`, `enter_id`),
  INDEX `fk_entry_log_delivery1_idx` (`delivery_id` ASC, `delivery_venue_id` ASC, `delivery_vehicle_id` ASC, `delivery_driver_id` ASC),
  INDEX `fk_entry_log_enter1_idx` (`enter_id` ASC),
  CONSTRAINT `fk_entrylog_delivery1`
    FOREIGN KEY (`delivery_id`)
    REFERENCES `damp`.`delivery` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_entrylog_enter1`
    FOREIGN KEY (`enter_id`)
    REFERENCES `damp`.`enter` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `damp`.`allow`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `damp`.`allow` ;

CREATE TABLE IF NOT EXISTS `damp`.`allow` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `referred_as` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `damp`.`supplier`
-- -----------------------------------------------------
START TRANSACTION;
USE `damp`;
INSERT INTO `damp`.`supplier` (`id`, `name`, `goods`, `location`, `referred_as`) VALUES (NULL, 'Brenny Cola', 'Drinks', 'Rio de Janero', 'Brenny Cola - RdJ');
INSERT INTO `damp`.`supplier` (`id`, `name`, `goods`, `location`, `referred_as`) VALUES (NULL, 'Micro Zoft', 'IT Services', 'Rio de Janero', 'Micro Zoft - Rdj');
INSERT INTO `damp`.`supplier` (`id`, `name`, `goods`, `location`, `referred_as`) VALUES (NULL, 'Food Stuff', 'Catering', 'Santa Cruz', 'Food Stuff - SC');
INSERT INTO `damp`.`supplier` (`id`, `name`, `goods`, `location`, `referred_as`) VALUES (NULL, 'Muscletone', 'Gym Equipment', 'Santos', 'Muscletone - ST');
INSERT INTO `damp`.`supplier` (`id`, `name`, `goods`, `location`, `referred_as`) VALUES (NULL, 'Uframed', 'CCTV', 'Curitiba', 'Uframed - CT');

COMMIT;


-- -----------------------------------------------------
-- Data for table `damp`.`title`
-- -----------------------------------------------------
START TRANSACTION;
USE `damp`;
INSERT INTO `damp`.`title` (`id`, `referred_as`) VALUES (NULL, 'Mr');
INSERT INTO `damp`.`title` (`id`, `referred_as`) VALUES (NULL, 'Ms');
INSERT INTO `damp`.`title` (`id`, `referred_as`) VALUES (NULL, 'Dr');

COMMIT;


-- -----------------------------------------------------
-- Data for table `damp`.`driver`
-- -----------------------------------------------------
START TRANSACTION;
USE `damp`;
INSERT INTO `damp`.`driver` (`id`, `title_id`, `drivername`, `supplier_id`, `referred_as`) VALUES (NULL, 2, 'Carmen Miranda', 1, 'Ms Carmen Miranda - Brenny Cola');
INSERT INTO `damp`.`driver` (`id`, `title_id`, `drivername`, `supplier_id`, `referred_as`) VALUES (NULL, 1, 'Dani Marinio', 1, 'Mr Danio Marinio - Brenny Cola');
INSERT INTO `damp`.`driver` (`id`, `title_id`, `drivername`, `supplier_id`, `referred_as`) VALUES (NULL, 1, 'Jose Alves', 2, 'Mr Jose Alves - Micro Zoft');
INSERT INTO `damp`.`driver` (`id`, `title_id`, `drivername`, `supplier_id`, `referred_as`) VALUES (NULL, 2, 'Maria Silva', 2, 'Ms Maria Silva - Micro Zoft');
INSERT INTO `damp`.`driver` (`id`, `title_id`, `drivername`, `supplier_id`, `referred_as`) VALUES (NULL, 3, 'Inez Thiago', 2, 'Dr Inez Thiago - Micro Zoft');
INSERT INTO `damp`.`driver` (`id`, `title_id`, `drivername`, `supplier_id`, `referred_as`) VALUES (NULL, 3, 'Vito Gelato', 3, 'Dr Vito Gelato - Food Stuff');
INSERT INTO `damp`.`driver` (`id`, `title_id`, `drivername`, `supplier_id`, `referred_as`) VALUES (NULL, 1, 'David César', 3, 'Mr David César - Food Stuff');
INSERT INTO `damp`.`driver` (`id`, `title_id`, `drivername`, `supplier_id`, `referred_as`) VALUES (NULL, 1, 'Júlio Luiz', 3, 'Mr Júlio Luiz - Food Stuff');
INSERT INTO `damp`.`driver` (`id`, `title_id`, `drivername`, `supplier_id`, `referred_as`) VALUES (NULL, 1, 'Diego Rocha', 4, 'Mr Diego Rocha - Muscletone');
INSERT INTO `damp`.`driver` (`id`, `title_id`, `drivername`, `supplier_id`, `referred_as`) VALUES (NULL, 1, 'Marcos Alves', 5, 'Mr Marcos Alves - Uframes');
INSERT INTO `damp`.`driver` (`id`, `title_id`, `drivername`, `supplier_id`, `referred_as`) VALUES (NULL, 1, 'Robinho', 5, 'Mr Robinho - Uframed');

COMMIT;


-- -----------------------------------------------------
-- Data for table `damp`.`vehicle`
-- -----------------------------------------------------
START TRANSACTION;
USE `damp`;
INSERT INTO `damp`.`vehicle` (`id`, `regNo`, `make`, `model`, `supplier_id`, `referred_as`) VALUES (NULL, 'A02 TLC', 'Renault', 'master', 1, 'A02 TLC - Brenny Cola');
INSERT INTO `damp`.`vehicle` (`id`, `regNo`, `make`, `model`, `supplier_id`, `referred_as`) VALUES (NULL, 'B03 PPD', 'Renault', 'Kangoo', 1, 'B03 PPD - Brenny Cola');
INSERT INTO `damp`.`vehicle` (`id`, `regNo`, `make`, `model`, `supplier_id`, `referred_as`) VALUES (NULL, 'C04 DFD', 'Vauxhall', 'Vivaro', 2, 'C04 DFD - Micro Zoft');
INSERT INTO `damp`.`vehicle` (`id`, `regNo`, `make`, `model`, `supplier_id`, `referred_as`) VALUES (NULL, 'D05 RAM', 'Ford', 'Transit', 3, 'D05 RAM - Food Stuff');
INSERT INTO `damp`.`vehicle` (`id`, `regNo`, `make`, `model`, `supplier_id`, `referred_as`) VALUES (NULL, 'E06 ROM', 'Ford', 'Transit', 3, 'E06 ROM - Food Stuff');
INSERT INTO `damp`.`vehicle` (`id`, `regNo`, `make`, `model`, `supplier_id`, `referred_as`) VALUES (NULL, 'F07 CPU', 'Ford', 'Transit', 3, 'F07 CPU - Food Stuff');
INSERT INTO `damp`.`vehicle` (`id`, `regNo`, `make`, `model`, `supplier_id`, `referred_as`) VALUES (NULL, 'G08 PHP', 'Vauxhall', 'Vivaro', 4, 'G08 PHP - Muscletone');
INSERT INTO `damp`.`vehicle` (`id`, `regNo`, `make`, `model`, `supplier_id`, `referred_as`) VALUES (NULL, 'H09 UML', 'Vauxhall', 'Vivaro', 5, 'H09 UML - Uframes');

COMMIT;


-- -----------------------------------------------------
-- Data for table `damp`.`venue`
-- -----------------------------------------------------
START TRANSACTION;
USE `damp`;
INSERT INTO `damp`.`venue` (`id`, `stadiumname`, `town`, `referred_as`) VALUES (NULL, 'Arena da Sao Paulo', 'São Paulo', 'Arena da Sao Paulo - São Paulo');
INSERT INTO `damp`.`venue` (`id`, `stadiumname`, `town`, `referred_as`) VALUES (NULL, 'Estádio do Maracanã', 'Rio de Janeiro', 'Estádio do Maracanã - Rio de Janeiro');
INSERT INTO `damp`.`venue` (`id`, `stadiumname`, `town`, `referred_as`) VALUES (NULL, 'Arena da Baixada', 'Curituba', 'Arena da Baixada - Curituba');
INSERT INTO `damp`.`venue` (`id`, `stadiumname`, `town`, `referred_as`) VALUES (NULL, 'Estádio Beira-Rio', 'Porto Alegre', 'Estádio Beira-Rio - Porto Alegre');

COMMIT;


-- -----------------------------------------------------
-- Data for table `damp`.`state`
-- -----------------------------------------------------
START TRANSACTION;
USE `damp`;
INSERT INTO `damp`.`state` (`id`, `referred_as`) VALUES (NULL, 'Valid');
INSERT INTO `damp`.`state` (`id`, `referred_as`) VALUES (NULL, 'Cancelled');
INSERT INTO `damp`.`state` (`id`, `referred_as`) VALUES (NULL, 'Expired');

COMMIT;


-- -----------------------------------------------------
-- Data for table `damp`.`login`
-- -----------------------------------------------------
START TRANSACTION;
USE `damp`;
INSERT INTO `damp`.`login` (`id`, `username`, `password`) VALUES (NULL, 'admin', 'password');

COMMIT;


-- -----------------------------------------------------
-- Data for table `damp`.`delivery`
-- -----------------------------------------------------
START TRANSACTION;
USE `damp`;
INSERT INTO `damp`.`delivery` (`id`, `vehicle_id`, `driver_id`, `venue_id`, `delivery_date`, `referred_as`) VALUES (NULL, 4, 5, 1, '2014-06-12', 'D05 RAM - Vito Gelato - Arena da Sao Paulo');
INSERT INTO `damp`.`delivery` (`id`, `vehicle_id`, `driver_id`, `venue_id`, `delivery_date`, `referred_as`) VALUES (NULL, 5, 8, 3, '2014-06-12', 'E06 ROM - David Csar - Arena da Baixada');
INSERT INTO `damp`.`delivery` (`id`, `vehicle_id`, `driver_id`, `venue_id`, `delivery_date`, `referred_as`) VALUES (NULL, 2, 2, 3, '2014-06-12', 'B03 PPD - Dani Marinio - Arena da Baixada');
INSERT INTO `damp`.`delivery` (`id`, `vehicle_id`, `driver_id`, `venue_id`, `delivery_date`, `referred_as`) VALUES (NULL, 8, 10, 2, '2014-06-15', 'H09 UML - Marcos Alves - Estádio do Maracanã');
INSERT INTO `damp`.`delivery` (`id`, `vehicle_id`, `driver_id`, `venue_id`, `delivery_date`, `referred_as`) VALUES (NULL, 5, 7, 1, '2014-06-15', 'E06 ROM - David César - Arena da Sao Paulo');
INSERT INTO `damp`.`delivery` (`id`, `vehicle_id`, `driver_id`, `venue_id`, `delivery_date`, `referred_as`) VALUES (NULL, 6, 8, 1, '2014-06-18', 'F07 CPU - Júlio Luiz - Arena da Baixada');
INSERT INTO `damp`.`delivery` (`id`, `vehicle_id`, `driver_id`, `venue_id`, `delivery_date`, `referred_as`) VALUES (NULL, 1, 10, 2, '2014-06-20', 'A02 TLC - Dani Marinio - Estádio Beira-Rio');
INSERT INTO `damp`.`delivery` (`id`, `vehicle_id`, `driver_id`, `venue_id`, `delivery_date`, `referred_as`) VALUES (NULL, 4, 5, 1, '2014-06-24', 'D05 RAM - Vito Gelato - Arena da Sao Paulo');

COMMIT;


-- -----------------------------------------------------
-- Data for table `damp`.`allow`
-- -----------------------------------------------------
START TRANSACTION;
USE `damp`;
INSERT INTO `damp`.`allow` (`id`, `referred_as`) VALUES (1, 'Y');
INSERT INTO `damp`.`allow` (`id`, `referred_as`) VALUES (2, 'N');

COMMIT;


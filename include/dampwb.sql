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
-- Table `damp`.`allow`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `damp`.`allow` ;

CREATE TABLE IF NOT EXISTS `damp`.`allow` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `referred_as` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `damp`.`authorisation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `damp`.`authorisation` ;

CREATE TABLE IF NOT EXISTS `damp`.`authorisation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `venue_id` INT NOT NULL,
  `vehicle_id` INT NOT NULL,
  `driver_id` INT NOT NULL,
  `allow_id` INT NOT NULL,
  `referred_as` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `venue_id`, `vehicle_id`, `driver_id`, `allow_id`),
  INDEX `fk_authorisation_venue1` (`venue_id` ASC),
  INDEX `fk_authorisation_vehicle1` (`vehicle_id` ASC),
  INDEX `fk_authorisation_driver1` (`driver_id` ASC),
  INDEX `fk_authorisation_allow1_idx` (`allow_id` ASC),
  CONSTRAINT `fk_authorisation_venue1`
    FOREIGN KEY (`venue_id`)
    REFERENCES `damp`.`venue` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_authorisation_vehicle1`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `damp`.`vehicle` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_authorisation_driver1`
    FOREIGN KEY (`driver_id`)
    REFERENCES `damp`.`driver` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_authorisation_allow1`
    FOREIGN KEY (`allow_id`)
    REFERENCES `damp`.`allow` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `damp`.`delivery`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `damp`.`delivery` ;

CREATE TABLE IF NOT EXISTS `damp`.`delivery` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `authorisation_id` INT NULL,
  `authorisation_venue_id` INT NOT NULL,
  `authorisation_vehicle_id` INT NOT NULL,
  `authorisation_driver_id` INT NOT NULL,
  `authorisation_allow_id` INT NOT NULL,
  `referred_as` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `authorisation_id`, `authorisation_venue_id`, `authorisation_vehicle_id`, `authorisation_driver_id`, `authorisation_allow_id`),
  INDEX `fk_delivery_authorisation1_idx` (`authorisation_id` ASC, `authorisation_venue_id` ASC, `authorisation_vehicle_id` ASC, `authorisation_driver_id` ASC, `authorisation_allow_id` ASC),
  UNIQUE INDEX `authorisation_id_UNIQUE` (`authorisation_id` ASC),
  CONSTRAINT `fk_delivery_authorisation1`
    FOREIGN KEY (`authorisation_id` , `authorisation_venue_id` , `authorisation_vehicle_id` , `authorisation_driver_id` , `authorisation_allow_id`)
    REFERENCES `damp`.`authorisation` (`id` , `venue_id` , `vehicle_id` , `driver_id` , `allow_id`)
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


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

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
-- Data for table `damp`.`allow`
-- -----------------------------------------------------
START TRANSACTION;
USE `damp`;
INSERT INTO `damp`.`allow` (`id`, `referred_as`) VALUES (1, 'Y');
INSERT INTO `damp`.`allow` (`id`, `referred_as`) VALUES (2, 'N');

COMMIT;


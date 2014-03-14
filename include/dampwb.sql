SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `damp` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
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
  `drivername` VARCHAR(45) NOT NULL,
  `referred_as` VARCHAR(45) NOT NULL,
  `title_id` INT NOT NULL,
  `supplier_id` INT NOT NULL,
  PRIMARY KEY (`id`, `title_id`, `supplier_id`),
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

CREATE INDEX `fk_driver_title1_idx` ON `damp`.`driver` (`title_id` ASC);

CREATE INDEX `fk_driver_supplier1_idx` ON `damp`.`driver` (`supplier_id` ASC);


-- -----------------------------------------------------
-- Table `damp`.`vehicle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `damp`.`vehicle` ;

CREATE TABLE IF NOT EXISTS `damp`.`vehicle` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `regNo` VARCHAR(45) NOT NULL,
  `make` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `supplier_id` INT NOT NULL,
  `referred_as` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `supplier_id`),
  CONSTRAINT `fk_vehicle_supplier`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `damp`.`supplier` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_vehicle_supplier_idx` ON `damp`.`vehicle` (`supplier_id` ASC);


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
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `referred_as` VARCHAR(45) NOT NULL,
  `state_id` INT NOT NULL,
  PRIMARY KEY (`id`, `state_id`),
  CONSTRAINT `fk_card_state1`
    FOREIGN KEY (`state_id`)
    REFERENCES `damp`.`state` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_card_state1_idx` ON `damp`.`card` (`state_id` ASC);


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
  `id` INT NOT NULL,
  `referred_as` INT NULL,
  `venue_id` INT NOT NULL,
  `vehicle_id` INT NOT NULL,
  `driver_id` INT NOT NULL,
  PRIMARY KEY (`id`, `venue_id`, `vehicle_id`, `driver_id`),
  CONSTRAINT `fk_delivery_venue1`
    FOREIGN KEY (`venue_id`)
    REFERENCES `damp`.`venue` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_vehicle1`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `damp`.`vehicle` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_driver1`
    FOREIGN KEY (`driver_id`)
    REFERENCES `damp`.`driver` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `damp`.`delivery`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `damp`.`delivery` ;

CREATE TABLE IF NOT EXISTS `damp`.`delivery` (
  `id` INT NOT NULL,
  `referred_as` INT NULL,
  `venue_id` INT NOT NULL,
  `vehicle_id` INT NOT NULL,
  `driver_id` INT NOT NULL,
  PRIMARY KEY (`id`, `venue_id`, `vehicle_id`, `driver_id`),
  CONSTRAINT `fk_delivery_venue1`
    FOREIGN KEY (`venue_id`)
    REFERENCES `damp`.`venue` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_vehicle1`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `damp`.`vehicle` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_driver1`
    FOREIGN KEY (`driver_id`)
    REFERENCES `damp`.`driver` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_delivery_venue1_idx` ON `damp`.`delivery` (`venue_id` ASC);

CREATE INDEX `fk_delivery_vehicle1_idx` ON `damp`.`delivery` (`vehicle_id` ASC);

CREATE INDEX `fk_delivery_driver1_idx` ON `damp`.`delivery` (`driver_id` ASC);


-- -----------------------------------------------------
-- Table `damp`.`enter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `damp`.`enter` ;

CREATE TABLE IF NOT EXISTS `damp`.`enter` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `referred_as` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `damp`.`entry_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `damp`.`entry_log` ;

CREATE TABLE IF NOT EXISTS `damp`.`entry_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `delivery_id` INT NOT NULL,
  `delivery_venue_id` INT NOT NULL,
  `delivery_vehicle_id` INT NOT NULL,
  `delivery_driver_id` INT NOT NULL,
  `referred_as` VARCHAR(45) NOT NULL,
  `enter_id` INT NOT NULL,
  PRIMARY KEY (`id`, `delivery_id`, `delivery_venue_id`, `delivery_vehicle_id`, `delivery_driver_id`, `enter_id`),
  CONSTRAINT `fk_entry_log_delivery1`
    FOREIGN KEY (`delivery_id` , `delivery_venue_id` , `delivery_vehicle_id` , `delivery_driver_id`)
    REFERENCES `damp`.`delivery` (`id` , `venue_id` , `vehicle_id` , `driver_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_entry_log_enter1`
    FOREIGN KEY (`enter_id`)
    REFERENCES `damp`.`enter` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_entry_log_delivery1_idx` ON `damp`.`entry_log` (`delivery_id` ASC, `delivery_venue_id` ASC, `delivery_vehicle_id` ASC, `delivery_driver_id` ASC);

CREATE INDEX `fk_entry_log_enter1_idx` ON `damp`.`entry_log` (`enter_id` ASC);


-- -----------------------------------------------------
-- Table `damp`.`card_driver`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `damp`.`card_driver` ;

CREATE TABLE IF NOT EXISTS `damp`.`card_driver` (
  `card_id` INT NOT NULL,
  `driver_id` INT NOT NULL,
  PRIMARY KEY (`card_id`, `driver_id`),
  CONSTRAINT `fk_card_driver_card1`
    FOREIGN KEY (`card_id`)
    REFERENCES `damp`.`card` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_card_driver_driver1`
    FOREIGN KEY (`driver_id`)
    REFERENCES `damp`.`driver` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_card_has_driver_driver1_idx` ON `damp`.`card_driver` (`driver_id` ASC);

CREATE INDEX `fk_card_has_driver_card1_idx` ON `damp`.`card_driver` (`card_id` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `damp`.`supplier`
-- -----------------------------------------------------
START TRANSACTION;
USE `damp`;
INSERT INTO `damp`.`supplier` (`id`, `name`, `goods`, `location`, `referred_as`) VALUES (NULL, 'Brenny Cola', 'Drinks', 'Rio de Janeiro', 'Brenny Cola - RdJ');
INSERT INTO `damp`.`supplier` (`id`, `name`, `goods`, `location`, `referred_as`) VALUES (NULL, 'Micro Zoft', 'IT Services', 'Rio de Janerio', 'Micro Zoft - Rdj');
INSERT INTO `damp`.`supplier` (`id`, `name`, `goods`, `location`, `referred_as`) VALUES (NULL, 'Food Stuff', 'Catering', 'Santa Cruz', 'Food Stuff - SC');
INSERT INTO `damp`.`supplier` (`id`, `name`, `goods`, `location`, `referred_as`) VALUES (NULL, 'Muscletone', 'Gym Equipment', 'Santos', 'Muscletone - SO');
INSERT INTO `damp`.`supplier` (`id`, `name`, `goods`, `location`, `referred_as`) VALUES (NULL, 'Uframes', 'CCTV', 'Curitiba', 'Uframed - CT');

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
INSERT INTO `damp`.`driver` (`id`, `drivername`, `referred_as`, `title_id`, `supplier_id`) VALUES (NULL, 'Carmen Miranda', 'Carmen Miranda', 2, 1);
INSERT INTO `damp`.`driver` (`id`, `drivername`, `referred_as`, `title_id`, `supplier_id`) VALUES (NULL, 'Dani Marinio', 'Dani Marinio', 1, 1);
INSERT INTO `damp`.`driver` (`id`, `drivername`, `referred_as`, `title_id`, `supplier_id`) VALUES (NULL, 'Jose Alves', 'Jose Alves', 1, 2);
INSERT INTO `damp`.`driver` (`id`, `drivername`, `referred_as`, `title_id`, `supplier_id`) VALUES (NULL, 'Maria Silva', 'Maria Silva', 2, 2);
INSERT INTO `damp`.`driver` (`id`, `drivername`, `referred_as`, `title_id`, `supplier_id`) VALUES (NULL, 'Inez Thiago', 'Inez Thiago', 3, 2);
INSERT INTO `damp`.`driver` (`id`, `drivername`, `referred_as`, `title_id`, `supplier_id`) VALUES (NULL, 'Vito Gelato', 'Vito Gelato', 3, 3);
INSERT INTO `damp`.`driver` (`id`, `drivername`, `referred_as`, `title_id`, `supplier_id`) VALUES (NULL, 'David César', 'David César', 1, 3);
INSERT INTO `damp`.`driver` (`id`, `drivername`, `referred_as`, `title_id`, `supplier_id`) VALUES (NULL, 'Júlio Luiz', 'Júlio Luiz', 1, 3);
INSERT INTO `damp`.`driver` (`id`, `drivername`, `referred_as`, `title_id`, `supplier_id`) VALUES (NULL, 'Deigo Rocha', 'Deigo Rocha', 1, 4);
INSERT INTO `damp`.`driver` (`id`, `drivername`, `referred_as`, `title_id`, `supplier_id`) VALUES (NULL, 'Marcos Alves', 'Marcos Alves', 1, 5);
INSERT INTO `damp`.`driver` (`id`, `drivername`, `referred_as`, `title_id`, `supplier_id`) VALUES (NULL, 'Robinho', 'Robinho', 1, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `damp`.`vehicle`
-- -----------------------------------------------------
START TRANSACTION;
USE `damp`;
INSERT INTO `damp`.`vehicle` (`id`, `regNo`, `make`, `model`, `supplier_id`, `referred_as`) VALUES (NULL, 'A02 TLC', 'Renault', 'Master', 1, 'A02 TLC - Brenny Cola');
INSERT INTO `damp`.`vehicle` (`id`, `regNo`, `make`, `model`, `supplier_id`, `referred_as`) VALUES (NULL, 'B03 PPD', 'Renault', 'Kangoo', 1, 'B03 PPD - Brenny Cola');
INSERT INTO `damp`.`vehicle` (`id`, `regNo`, `make`, `model`, `supplier_id`, `referred_as`) VALUES (NULL, 'C04 DFD', 'Vauxhall', 'Vivaro', 2, 'C04 DFD - Micro Zoft');
INSERT INTO `damp`.`vehicle` (`id`, `regNo`, `make`, `model`, `supplier_id`, `referred_as`) VALUES (NULL, 'D05 RAM', 'Ford', 'Transit', 3, 'D05 RAM - Food Stuff');
INSERT INTO `damp`.`vehicle` (`id`, `regNo`, `make`, `model`, `supplier_id`, `referred_as`) VALUES (NULL, 'E06 ROM', 'Ford', 'Transit', 3, 'E06 ROM - Food Stuff');
INSERT INTO `damp`.`vehicle` (`id`, `regNo`, `make`, `model`, `supplier_id`, `referred_as`) VALUES (NULL, 'F07 CPU', 'Ford', 'Transit', 3, 'F07 CPU - Food Stuff');
INSERT INTO `damp`.`vehicle` (`id`, `regNo`, `make`, `model`, `supplier_id`, `referred_as`) VALUES (NULL, 'G08 PHP', 'Vauxhall', 'Vivaro', 4, 'G08 PHP - Muscletone');
INSERT INTO `damp`.`vehicle` (`id`, `regNo`, `make`, `model`, `supplier_id`, `referred_as`) VALUES (NULL, 'H09 UML', 'Vauxhall', 'Vivaro', 5, 'H09 UML - Uframed');

COMMIT;


-- -----------------------------------------------------
-- Data for table `damp`.`venue`
-- -----------------------------------------------------
START TRANSACTION;
USE `damp`;
INSERT INTO `damp`.`venue` (`id`, `stadiumname`, `town`, `referred_as`) VALUES (NULL, 'Arena da Sao Paulo', 'São Paulo', 'Arena da Sao Paulo - SP');
INSERT INTO `damp`.`venue` (`id`, `stadiumname`, `town`, `referred_as`) VALUES (NULL, 'Estádio do Maracanã', 'Rio de Janeiro', 'Estádio do Maracanã - RdJ');
INSERT INTO `damp`.`venue` (`id`, `stadiumname`, `town`, `referred_as`) VALUES (NULL, 'Arena da Baixada', 'Curituba', 'Arena da Baixada - CT');
INSERT INTO `damp`.`venue` (`id`, `stadiumname`, `town`, `referred_as`) VALUES (NULL, 'Estádio Beira-Rio', 'Porto Alegre', 'Estádio Beira-Rio - PA');

COMMIT;


-- -----------------------------------------------------
-- Data for table `damp`.`state`
-- -----------------------------------------------------
START TRANSACTION;
USE `damp`;
INSERT INTO `damp`.`state` (`id`, `referred_as`) VALUES (NULL, 'valid');
INSERT INTO `damp`.`state` (`id`, `referred_as`) VALUES (NULL, 'cancelled');
INSERT INTO `damp`.`state` (`id`, `referred_as`) VALUES (NULL, 'expired');

COMMIT;


-- -----------------------------------------------------
-- Data for table `damp`.`login`
-- -----------------------------------------------------
START TRANSACTION;
USE `damp`;
INSERT INTO `damp`.`login` (`id`, `username`, `password`) VALUES (NULL, 'admin', 'password');

COMMIT;


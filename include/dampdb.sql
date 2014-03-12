-- phpMyAdmin SQL Dump
-- version 2.11.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 30, 2010 at 09:43 PM
-- Server version: 5.0.67
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dams`
--
DROP TABLE IF EXISTS `delivery`;
CREATE TABLE IF NOT EXISTS `delivery`
(
`id` int(10) NOT NULL auto_increment,
`authorisation_id` varchar(40) NOT NULL,
`referred_as` varchar(40) NOT NULL,
PRIMARY KEY(`id`)
) 
ENGINE =InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;


DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status`
(
`id` int(10) NOT NULL auto_increment,
`referred_as` varchar(40) NOT NULL,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

INSERT INTO `status` (`id`, `referred_as`) VALUES
(1, 'Delivered'),
(2, 'In Transit'),
(3, 'Not Delivered');



DROP TABLE IF EXISTS `supplier`;
CREATE TABLE IF NOT EXISTS `supplier`
(
`id` int(10) NOT NULL auto_increment,
`name` varchar(40) default NULL,
`goods` varchar(40) default NULL,
`location` varchar(40) default NULL,
`referred_as` varchar(40) NOT NULL,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

INSERT INTO `supplier` (`id`, `name`, `goods`, `location`, `referred_as`) VALUES
(1, 'Brenny Cola', 'Drinks', 'Rio de Janeiro', 'Brenny Cola - RdJ'),
(2, 'Micro Zoft', 'IT Services', 'Rio de Janeiro', 'Micro Zoft - Rdj'),
(3, 'Food Stuff', 'Catering', 'Santa Cruz', 'Food Stuff - SC'),
(4, 'Muscletone', 'Gym equipment', 'Santos', 'Muscletone - SO'),
(5, 'Uframed', 'CCTV', 'Curitiba', 'Uframed - CT');



DROP TABLE IF EXISTS `vehicle`;
CREATE TABLE IF NOT EXISTS `vehicle`
(
`id` int(10) NOT NULL auto_increment,
`regNo` varchar(40) default NULL, 
`make` varchar(40) default NULL,
`model` varchar(40) default NULL,
`supplier_id` int(10) NOT NULL,
`referred_as` varchar(40) NOT NULL,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

INSERT INTO `vehicle` (`id`, `regNo`, `make`, `model`, `supplier_id`, `referred_as`) VALUES
(1, 'A02 TLC', 'Renault', 'Master', 1, 'A02 TLC - Brenny Cola'),
(2, 'B03 PPD', 'Renault', 'Kangoo', 1, 'B03 PPD - Brenny Cola'),
(3, 'C04 DFD', 'Vauxhall', 'Vivaro', 2, 'C04 DFD - Micro Zoft'),
(4, 'D05 RAM', 'Ford', 'Transit', 3, 'D05 RAM - Food Stuff'),
(5, 'E06 ROM', 'Ford', 'Transit', 3, 'E06 ROM - Food Stuff'),
(6, 'F07 CPU', 'Ford', 'Transit', 3, 'F07 CPU - Food Stuff'),
(7, 'G08 PHP', 'Vauxhall', 'Vivaro', 4, 'G08 PHP - Muscletone'),
(8, 'H09 UML', 'Vauxhall', 'Vivaro', 5, 'H09 UML - Uframed');


DROP TABLE IF EXISTS `venue`;
CREATE TABLE IF NOT EXISTS `venue`
(
  `id` int(10) NOT NULL auto_increment,
  `stadiumname` varchar(40) NOT NULL,
  `town` varchar(40) NOT NULL,
  `referred_as` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

INSERT INTO `venue` (`id`, `stadiumname`, `town`, `referred_as`) VALUES
(1, 'Arena da Sao Paulo', 'São Paulo', 'Arena da Sao Paulo - SP'),
(2, 'Estádio do Maracanã', 'Rio de Janeiro', 'Estádio do Maracanã - RdJ'),
(3, 'Arena da Baixada', 'Curituba', 'Arena da Baixada - CT'),
(4, 'Estádio Beira-Rio', 'Porto Alegre', 'Estádio Beira-Rio - PA');




DROP TABLE IF EXISTS `driver`;
CREATE TABLE IF NOT EXISTS `driver`
(
  `id` int(10) NOT NULL auto_increment,
  `drivername` varchar(40) NOT NULL,
  `title_id` varchar(40) NOT NULL,
  `supplier_id` varchar(40) NOT NULL,
  `referred_as` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

INSERT INTO `driver` (`id`, `drivername`, `title_id`, `supplier_id`, `referred_as`) VALUES
(1, 'Carmen Miranda', 2, 'Brenny Cola', 'Carmen Miranda'),
(2, 'Dani Marinio', 1, 'Brenny Cola', 'Dani Marinio'),
(3, 'Jose Alves', 1,  'Micro Zoft', 'Jose Alves'),
(4, 'Maria Silva', 2, 'Micro Zoft', 'Maria Silva'),
(5, 'Inez Thiago', 3, 'Micro Zoft', 'Inez Thiago'),
(6, 'Vito Gelato', 3, 'Food Stuff', 'Vito Gelato'),
(7, 'David César', 1, 'Food Stuff', 'David César'),
(8, 'Júlio Luiz', 1, 'Food Stuff', 'Júlio Luiz'),
(9, 'Deigo Rocha', 1, 'Muscletone', 'Deigo Rocha'),
(10, 'Marcos Alves', 1, 'Uframed', 'Marchos Alves'),
(11, 'Robinho', 1, 'Uframed', 'Robinho');


DROP TABLE IF EXISTS `title`;
CREATE TABLE IF NOT EXISTS `title`
(
	`id` int(10) NOT NULL auto_increment,
	`referred_as` varchar(40) NOT NULL,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;
INSERT INTO `title` (`id`, `referred_as`) VALUES
(1, 'Mr'),
(2, 'Ms'),
(3, 'Dr');


DROP TABLE IF EXISTS `state`;
CREATE TABLE IF NOT EXISTS `state`
(
  `id` int(10) NOT NULL auto_increment,
  `referred_as` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

INSERT INTO `state` (`id`, `referred_as`) VALUES
(1, 'valid'),
(2, 'expired'),
(3, 'cancelled');



DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login`
(
  `id` int(10) NOT NULL auto_increment,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

INSERT INTO `login` (`id`, `username`, `password`) VALUES
(1, 'admin', 'password');



DROP TABLE IF EXISTS `card`;
CREATE TABLE IF NOT EXISTS `card`
(
`id` int(10) NOT NULL auto_increment,
`driver_id` varchar(40) NOT NULL,
`start_date` date NOT NULL,
`end_date` date NOT NULL,
`state_id` varchar(40) NOT NULL,
`referred_as` varchar(40) NOT NULL,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

INSERT INTO `card` (`id`, `driver_id`, `start_date`, `end_date`, `state_id`, `referred_as`) VALUES
(1, 1, '2014-06-10', '2014-07-28', 1, 'Carmen Miranda Card-V'),
(2, 2, '2014-06-10', '2014-07-28', 1, 'Dani Merinio Card-V'),
(3, 3, '2014-06-10', '2014-07-28', 1, 'Jose Alves Card-V'),
(4, 4, '2014-06-10', '2014-07-28', 1, 'Maria Silva Card-V'),
(5, 5, '2014-06-10', '2014-07-28', 1, 'Inez Thiago Card-V'),
(6, 6, '2014-06-10', '2014-07-28', 1, 'Vito Gelato Card-V'),
(7, 7, '2014-06-10', '2014-07-28', 1, 'David César Card-V'),
(8, 8, '2014-06-10', '2014-07-28', 1, 'Júlio Luiz Card-V'),
(9, 9, '2014-06-10', '2014-07-28', 1, 'Diego Rocha Card-V'),
(10, 10, '2014-06-10', '2014-07-28', 1, 'Marcos Alves Card-V'),
(11, 11, '2014-06-10', '2014-07-28', 1, 'Robinho Card-V');


DROP TABLE IF EXISTS `authorisation`;
CREATE TABLE IF NOT EXISTS `authorisation`
(
	`id` int(10) NOT NULL auto_increment,
	`vehicle_id` varchar(40) NOT NULL,
	`driver_id` varchar(40) NOT NULL,
	`venue_id` varchar(40) NOT NULL,
	`referred_as` varchar(40) NOT NULL,
	PRIMARY KEY (`id`)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

INSERT INTO `authorisation` (`id`, `vehicle_id`, `driver_id`, `venue_id`, `referred_as`) VALUES
()
()
()
()

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
`vehicle_id` int(10) NOT NULL,
`venue_id` int(10) NOT NULL,
`date` date NOT NULL,
`status_id` int(10) NOT NULL,
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


DROP TABLE IF EXISTS `driver`;
CREATE NEW TABLE IF NOT EXISTS `driver`
(
`id` int(10) NOT NULL auto_increment,
`drivername` varchar(40) NOT NULL,
`supplier_id` int(10) NOT NULL,
`referred_as` varchar(40) NOT NULL,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;







-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 01, 2021 at 04:15 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `intercollegiate_athletic`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `custno` varchar(11) NOT NULL,
  `custname` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `Internal` char(1) NOT NULL,
  `contact` varchar(30) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zip` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`custno`, `custname`, `address`, `Internal`, `contact`, `phone`, `city`, `state`, `zip`) VALUES
('C100', 'Football', 'Box 352200', 'Y', 'Mary Manager', '6857100', 'Boulder', 'CO', '80309'),
('C101`', 'Men\'s Basketball', 'Box 352400', 'Y', 'Sally Supervisor', '5431700', 'Boulder', 'CO', '80309'),
('C103', 'Baseball', 'Box 352020', 'Y', 'Bill Baseball', '5431234', 'Boulder', 'CO', '80309'),
('C104', 'Women\'s Softball', 'Box 351200', 'Y', 'Sue Softball', '5434321', 'Boulder', 'CO', '80309'),
('C105', 'High School Football', '123 AnyStreet', 'N', 'Coach Bob', '4441234', 'Louisville', 'CO', '80027');

-- --------------------------------------------------------

--
-- Table structure for table `facility`
--

CREATE TABLE `facility` (
  `facno` varchar(11) NOT NULL,
  `facname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facility`
--

INSERT INTO `facility` (`facno`, `facname`) VALUES
('F102', 'Baseball field'),
('F101', 'Basketball arena'),
('F100', 'Football stadium'),
('F103', 'Recreation room');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `locno` varchar(11) NOT NULL,
  `facno` varchar(11) NOT NULL,
  `locname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`locno`, `facno`, `locname`) VALUES
('L100', 'F100', 'Locker room'),
('L101', 'F100', 'Plaza'),
('L102', 'F100', 'Vehicle gate'),
('L103', 'F101', 'Locker room'),
('L104', 'F100', 'Ticket Booth'),
('L105', 'F101', 'Gate'),
('L106', 'F100', 'Pedestrian gate');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`custno`);

--
-- Indexes for table `facility`
--
ALTER TABLE `facility`
  ADD PRIMARY KEY (`facno`),
  ADD UNIQUE KEY `FacName_Unique` (`facname`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`locno`),
  ADD KEY `FacNo_Fk` (`facno`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `FacNo_Fk` FOREIGN KEY (`facno`) REFERENCES `facility` (`facno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

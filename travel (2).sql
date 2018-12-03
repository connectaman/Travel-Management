-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 18, 2018 at 12:24 PM
-- Server version: 5.6.34-log
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travel`
--

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `Bus_Id` int(11) NOT NULL,
  `Bus_Name` varchar(200) NOT NULL,
  `From` varchar(200) NOT NULL,
  `To` varchar(200) NOT NULL,
  `Seats` int(11) NOT NULL,
  `Rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`Bus_Id`, `Bus_Name`, `From`, `To`, `Seats`, `Rate`) VALUES
(1287, 'ababa', 'delhi', 'bagalore', 23, 1299),
(1290, 'SLR', 'BLR', 'HYD', 49, 265),
(93847, 'fgfg', 'fgfg', 'fgfg', 34, 34);

--
-- Triggers `bus`
--
DELIMITER $$
CREATE TRIGGER `Bus_insert` AFTER INSERT ON `bus` FOR EACH ROW BEGIN
insert into bus_backup values(NEW.Bus_Id,NEW.Bus_Name,NEW.From,NEW.To,NEW.Seats,NEW.Rate);
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `bgh` AFTER DELETE ON `bus` FOR EACH ROW BEGIN
insert into bus_backup values(OLD.Bus_Id,OLD.Bus_Name,OLD.From,OLD.To,OLD.Seats,OLD.Rate);
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `gg` AFTER UPDATE ON `bus` FOR EACH ROW BEGIN
insert into bus_backup values(NEW.Bus_Id,NEW.Bus_Name,NEW.From,NEW.To,NEW.Seats,NEW.Rate);
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bus_backup`
--

CREATE TABLE `bus_backup` (
  `Bus_Id` int(11) NOT NULL,
  `Bus_Name` varchar(200) NOT NULL,
  `From` varchar(200) NOT NULL,
  `To` varchar(200) NOT NULL,
  `Seats` int(11) NOT NULL,
  `Rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bus_backup`
--

INSERT INTO `bus_backup` (`Bus_Id`, `Bus_Name`, `From`, `To`, `Seats`, `Rate`) VALUES
(5, 'wer', 'fdg', 'dfg', 3, 5),
(9, '36', 'gd', 'ljh', 7, 8),
(52, 'asd', '', '', 41, 0),
(1290, 'SLR', 'BLR', 'HYD', 49, 265),
(93847, 'fgfg', 'fgfg', 'fgfg', 34, 34);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Name` varchar(200) NOT NULL,
  `Age` int(11) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Phone` int(11) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `State` varchar(200) NOT NULL,
  `Mode of Travel` varchar(200) NOT NULL,
  `From` varchar(200) NOT NULL,
  `To` varchar(200) NOT NULL,
  `Date of Journey` varchar(200) NOT NULL,
  `Seats Booked` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Name`, `Age`, `Gender`, `Phone`, `Email`, `State`, `Mode of Travel`, `From`, `To`, `Date of Journey`, `Seats Booked`) VALUES
('aman', 20, 'M', 4545, 'sdsd', 'karnataka', 'Train', 'blr', 'pt', '12/12/2018', '2'),
('asdf', 45, 'M', 45454, 'dsfdf', 'dsfdf', 'Bus', 'dfdf', 'dfdf', '324324', '2'),
('dfgbdfg', 45, 'F', 657657, 'dfgfgfg', 'dsgffgfg', 'Bus', 'gvhdfgh', 'rfgdfhg', '4364356', '1');

-- --------------------------------------------------------

--
-- Table structure for table `train`
--

CREATE TABLE `train` (
  `Train_Id` int(11) NOT NULL,
  `Train_Name` varchar(200) NOT NULL,
  `From` varchar(200) NOT NULL,
  `To` varchar(200) NOT NULL,
  `Seats` int(11) NOT NULL,
  `Rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`Bus_Id`);

--
-- Indexes for table `bus_backup`
--
ALTER TABLE `bus_backup`
  ADD PRIMARY KEY (`Bus_Id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Name`),
  ADD UNIQUE KEY `u` (`Phone`);

--
-- Indexes for table `train`
--
ALTER TABLE `train`
  ADD PRIMARY KEY (`Train_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

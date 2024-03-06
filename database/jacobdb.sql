-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2024 at 09:57 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jacobdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `adds_on`
--

CREATE TABLE `adds_on` (
  `ADDSONID` varchar(40) NOT NULL,
  `ITEM` varchar(40) NOT NULL,
  `AMOUNT` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adds_on`
--

INSERT INTO `adds_on` (`ADDSONID`, `ITEM`, `AMOUNT`) VALUES
('ID-00001', 'bed', '100');

-- --------------------------------------------------------

--
-- Table structure for table `daily`
--

CREATE TABLE `daily` (
  `RESERVATIONID` varchar(20) NOT NULL,
  `GUESTID` varchar(11) NOT NULL,
  `BOOKDATE` date NOT NULL,
  `ROOMNUMBER` int(11) NOT NULL,
  `CHECKIN` datetime(6) NOT NULL,
  `CHECKOUT` datetime(6) DEFAULT NULL,
  `STATUS` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `GUESTID` varchar(100) NOT NULL,
  `FIRSTNAME` varchar(100) NOT NULL,
  `MIDDLEINITIAL` varchar(100) NOT NULL,
  `LASTNAME` varchar(100) NOT NULL,
  `PHONENUMBER` int(100) NOT NULL,
  `STATUS` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guest`
--

INSERT INTO `guest` (`GUESTID`, `FIRSTNAME`, `MIDDLEINITIAL`, `LASTNAME`, `PHONENUMBER`, `STATUS`) VALUES
('GUE-00001', 'zeus', 'l', 'lana', 1023232, 'Check-out'),
('GUE-00002', 'sasda', 'a', 'sdasda', 2434, 'Check-in');

-- --------------------------------------------------------

--
-- Table structure for table `guest_addson`
--

CREATE TABLE `guest_addson` (
  `RESERVATIONID` varchar(20) NOT NULL,
  `GUESTID` varchar(100) NOT NULL,
  `BOOKDATE` date NOT NULL,
  `ADDSONID` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guest_addson`
--

INSERT INTO `guest_addson` (`RESERVATIONID`, `GUESTID`, `BOOKDATE`, `ADDSONID`) VALUES
('RES-20240214091636', 'GUE-00001', '2024-02-14', NULL),
('RES-20240214091636', 'GUE-00001', '2024-02-14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`) VALUES
('Teresa', 'Jacob'),
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `overnight`
--

CREATE TABLE `overnight` (
  `RESERVATIONID` varchar(20) NOT NULL,
  `GUESTID` varchar(10) NOT NULL,
  `BOOKDATE` date NOT NULL,
  `ROOMNUMBER` int(10) NOT NULL,
  `CHECKIN` datetime(6) NOT NULL,
  `CHECKOUT` datetime(6) DEFAULT NULL,
  `STATUS` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PAYMENTID` varchar(20) NOT NULL,
  `TRANSDATE` date NOT NULL,
  `GUESTID` varchar(10) DEFAULT NULL,
  `PRICE` int(10) NOT NULL,
  `STATUS` varchar(20) NOT NULL,
  `TENDERED` int(10) NOT NULL,
  `CHANGED` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PAYMENTID`, `TRANSDATE`, `GUESTID`, `PRICE`, `STATUS`, `TENDERED`, `CHANGED`) VALUES
('PAY-00001', '2024-02-16', 'GUE-00002', 250, 'Paid', 1000, 750);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `ROOMNUMBER` int(10) NOT NULL,
  `ROOMTYPE` varchar(20) NOT NULL,
  `STATUS` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`ROOMNUMBER`, `ROOMTYPE`, `STATUS`) VALUES
(2, 'Standard Room', 'Available'),
(3, 'Ordinary Room', 'Occupied'),
(4, 'Ordinary Room', 'Occupied'),
(5, 'Standard Room', 'Available'),
(6, 'Standard Room', 'Available'),
(7, 'Ordinary Room', 'Occupied'),
(8, 'Ordinary Room', 'Occupied'),
(9, 'Ordinary Room', 'Available'),
(10, 'Ordinary Room', 'Occupied'),
(11, 'Ordinary Room', 'Available'),
(12, 'Ordinary Room', 'Available'),
(14, 'Standard Room', 'Available'),
(15, 'Ordinary Room', 'Available'),
(16, 'Standard Room', 'Available'),
(17, 'Ordinary Room', 'Available'),
(18, 'Ordinary Room', 'Available'),
(20, 'Standard Room', 'Available'),
(21, 'Suite Room', 'Available'),
(22, 'Suite Room', 'Available'),
(23, 'Suite Room', 'Available'),
(24, 'Suite Room', 'Available'),
(25, 'Suite Room', 'Available'),
(26, 'Suite Room', 'Available'),
(191, 'Ordinary Room', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `shortime`
--

CREATE TABLE `shortime` (
  `RESERVATIONID` varchar(20) NOT NULL,
  `GUESTID` varchar(100) NOT NULL,
  `ROOMNUMBER` int(10) NOT NULL,
  `CHECKIN` datetime(6) NOT NULL,
  `CHECKOUT` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shortime`
--

INSERT INTO `shortime` (`RESERVATIONID`, `GUESTID`, `ROOMNUMBER`, `CHECKIN`, `CHECKOUT`) VALUES
('BK-20240216010617', 'GUE-00002', 10, '2024-02-16 13:05:13.388625', NULL),
('RES-20240216095653', 'GUE-00001', 9, '2024-02-16 09:56:07.811525', '2024-02-16');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `StaffName` varchar(100) NOT NULL,
  `PhoneNumber` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`StaffName`, `PhoneNumber`) VALUES
('Teresa Jacob', 123);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adds_on`
--
ALTER TABLE `adds_on`
  ADD PRIMARY KEY (`ADDSONID`);

--
-- Indexes for table `daily`
--
ALTER TABLE `daily`
  ADD PRIMARY KEY (`RESERVATIONID`),
  ADD KEY `FK_Daily_RoomNum` (`ROOMNUMBER`),
  ADD KEY `GUESTID` (`GUESTID`) USING BTREE;

--
-- Indexes for table `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`GUESTID`);

--
-- Indexes for table `guest_addson`
--
ALTER TABLE `guest_addson`
  ADD KEY `GUESTID` (`GUESTID`) USING BTREE,
  ADD KEY `ADDSONID` (`ADDSONID`) USING BTREE,
  ADD KEY `BOOKDATE` (`BOOKDATE`) USING BTREE,
  ADD KEY `RESERVATIONID` (`RESERVATIONID`) USING BTREE;

--
-- Indexes for table `overnight`
--
ALTER TABLE `overnight`
  ADD PRIMARY KEY (`RESERVATIONID`),
  ADD KEY `GUESTID` (`GUESTID`) USING BTREE;

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PAYMENTID`),
  ADD KEY `GUESTID` (`GUESTID`) USING BTREE;

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`ROOMNUMBER`);

--
-- Indexes for table `shortime`
--
ALTER TABLE `shortime`
  ADD PRIMARY KEY (`RESERVATIONID`),
  ADD KEY `FK_Shortime_GuestID` (`GUESTID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffName`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daily`
--
ALTER TABLE `daily`
  ADD CONSTRAINT `FK_Daily_GuestID` FOREIGN KEY (`GUESTID`) REFERENCES `guest` (`GUESTID`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Daily_RoomNum` FOREIGN KEY (`ROOMNUMBER`) REFERENCES `room` (`ROOMNUMBER`);

--
-- Constraints for table `guest_addson`
--
ALTER TABLE `guest_addson`
  ADD CONSTRAINT `FK_GuestAddsOn_AddsOnID` FOREIGN KEY (`ADDSONID`) REFERENCES `adds_on` (`ADDSONID`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `overnight`
--
ALTER TABLE `overnight`
  ADD CONSTRAINT `FK_Overnight_GuestID` FOREIGN KEY (`GUESTID`) REFERENCES `guest` (`GUESTID`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Overnight_RoomNum` FOREIGN KEY (`ROOMNUMBER`) REFERENCES `room` (`ROOMNUMBER`) ON DELETE CASCADE;

--
-- Constraints for table `shortime`
--
ALTER TABLE `shortime`
  ADD CONSTRAINT `FK_ShortTime_RoomNum` FOREIGN KEY (`ROOMNUMBER`) REFERENCES `room` (`ROOMNUMBER`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

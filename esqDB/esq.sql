-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 27, 2021 at 04:25 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `esq`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_booking`
--

CREATE TABLE `tbl_booking` (
  `bookingid` varchar(20) NOT NULL,
  `bookingroomnum` int(11) NOT NULL,
  `bookingguestid` varchar(50) NOT NULL,
  `bookingdate` date NOT NULL,
  `bookingcheckin` date NOT NULL,
  `bookingcheckout` date NOT NULL,
  `bookingstatus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_departments`
--

CREATE TABLE `tbl_departments` (
  `departmentid` varchar(20) NOT NULL,
  `departmentname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employees`
--

CREATE TABLE `tbl_employees` (
  `employeeid` varchar(20) NOT NULL,
  `employeename` varchar(50) NOT NULL,
  `employeetype` varchar(50) NOT NULL,
  `employeedept` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_guest`
--

CREATE TABLE `tbl_guest` (
  `guestid` varchar(20) NOT NULL,
  `guestname` varchar(50) NOT NULL,
  `guestage` int(11) NOT NULL,
  `guestgender` varchar(10) NOT NULL,
  `guestorigin` varchar(50) NOT NULL,
  `guestdestination` varchar(50) NOT NULL,
  `guestcontact` varchar(20) NOT NULL,
  `guestvisitpurpose` varchar(50) NOT NULL,
  `guestotdheretails` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_images`
--

CREATE TABLE `tbl_images` (
  `imageid` int(11) NOT NULL,
  `imageitem` varchar(50) NOT NULL,
  `imageroom` int(11) NOT NULL,
  `imagepath` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_items`
--

CREATE TABLE `tbl_items` (
  `itemid` varchar(20) NOT NULL,
  `itemtype` varchar(50) NOT NULL,
  `itemname` varchar(50) NOT NULL,
  `itemcost` float NOT NULL,
  `itemdetails` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `loginid` int(11) NOT NULL,
  `employeeid` varchar(50) NOT NULL,
  `loginuser` varchar(50) NOT NULL,
  `loginpass` varchar(50) NOT NULL,
  `loginrole` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders`
--

CREATE TABLE `tbl_orders` (
  `orderid` int(11) NOT NULL,
  `orderdesc` int(11) NOT NULL,
  `orderroom` int(11) NOT NULL,
  `orderitemid` varchar(20) NOT NULL,
  `orderdate` int(11) NOT NULL,
  `orderguest` int(11) NOT NULL,
  `orderquantity` int(11) NOT NULL,
  `ordercost` int(11) NOT NULL,
  `orderstatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payments`
--

CREATE TABLE `tbl_payments` (
  `paymentid` int(11) NOT NULL,
  `paymentorder` int(11) NOT NULL,
  `paymentdetails` varchar(50) NOT NULL,
  `paymenttype` varchar(50) NOT NULL,
  `paymentstatus` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reminder`
--

CREATE TABLE `tbl_reminder` (
  `reminderid` varchar(20) NOT NULL,
  `remindertype` varchar(50) NOT NULL,
  `reminderdetails` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rooms`
--

CREATE TABLE `tbl_rooms` (
  `roomnumber` int(11) NOT NULL,
  `roomtype` varchar(50) NOT NULL,
  `roomstatus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_roomtypes`
--

CREATE TABLE `tbl_roomtypes` (
  `roomtypeid` varchar(20) NOT NULL,
  `roomtypename` varchar(50) NOT NULL,
  `roomtypedesc` varchar(1000) NOT NULL,
  `roomtypecost` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  ADD PRIMARY KEY (`bookingid`),
  ADD KEY `tbl_booking_GFK` (`bookingguestid`),
  ADD KEY `tbl_booking_RFK` (`bookingroomnum`);

--
-- Indexes for table `tbl_departments`
--
ALTER TABLE `tbl_departments`
  ADD PRIMARY KEY (`departmentid`);

--
-- Indexes for table `tbl_employees`
--
ALTER TABLE `tbl_employees`
  ADD PRIMARY KEY (`employeeid`),
  ADD KEY `tbl_employees_FK` (`employeedept`);

--
-- Indexes for table `tbl_guest`
--
ALTER TABLE `tbl_guest`
  ADD PRIMARY KEY (`guestid`);

--
-- Indexes for table `tbl_images`
--
ALTER TABLE `tbl_images`
  ADD PRIMARY KEY (`imageid`),
  ADD KEY `tbl_images_FK` (`imageitem`),
  ADD KEY `tbl_images_FK_1` (`imageroom`);

--
-- Indexes for table `tbl_items`
--
ALTER TABLE `tbl_items`
  ADD PRIMARY KEY (`itemid`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`loginid`),
  ADD KEY `tbl_login_FK` (`employeeid`);

--
-- Indexes for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`orderid`),
  ADD KEY `tbl_orders_FK` (`orderroom`),
  ADD KEY `tbl_orders_FK_1` (`orderitemid`);

--
-- Indexes for table `tbl_payments`
--
ALTER TABLE `tbl_payments`
  ADD PRIMARY KEY (`paymentid`),
  ADD KEY `tbl_payments_FK` (`paymentorder`);

--
-- Indexes for table `tbl_rooms`
--
ALTER TABLE `tbl_rooms`
  ADD PRIMARY KEY (`roomnumber`),
  ADD KEY `tbl_rooms_FK` (`roomtype`);

--
-- Indexes for table `tbl_roomtypes`
--
ALTER TABLE `tbl_roomtypes`
  ADD PRIMARY KEY (`roomtypeid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_images`
--
ALTER TABLE `tbl_images`
  MODIFY `imageid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `loginid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_payments`
--
ALTER TABLE `tbl_payments`
  MODIFY `paymentid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  ADD CONSTRAINT `tbl_booking_FK` FOREIGN KEY (`bookingguestid`) REFERENCES `tbl_guest` (`guestid`),
  ADD CONSTRAINT `tbl_booking_GFK` FOREIGN KEY (`bookingguestid`) REFERENCES `tbl_guest` (`guestid`),
  ADD CONSTRAINT `tbl_booking_RFK` FOREIGN KEY (`bookingroomnum`) REFERENCES `tbl_rooms` (`roomnumber`);

--
-- Constraints for table `tbl_employees`
--
ALTER TABLE `tbl_employees`
  ADD CONSTRAINT `tbl_employees_FK` FOREIGN KEY (`employeedept`) REFERENCES `tbl_departments` (`departmentid`);

--
-- Constraints for table `tbl_images`
--
ALTER TABLE `tbl_images`
  ADD CONSTRAINT `tbl_images_FK` FOREIGN KEY (`imageitem`) REFERENCES `tbl_items` (`itemid`),
  ADD CONSTRAINT `tbl_images_FK_1` FOREIGN KEY (`imageroom`) REFERENCES `tbl_rooms` (`roomnumber`);

--
-- Constraints for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD CONSTRAINT `tbl_login_FK` FOREIGN KEY (`employeeid`) REFERENCES `tbl_employees` (`employeeid`);

--
-- Constraints for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD CONSTRAINT `tbl_orders_FK` FOREIGN KEY (`orderroom`) REFERENCES `tbl_rooms` (`roomnumber`),
  ADD CONSTRAINT `tbl_orders_FK_1` FOREIGN KEY (`orderitemid`) REFERENCES `tbl_items` (`itemid`);

--
-- Constraints for table `tbl_payments`
--
ALTER TABLE `tbl_payments`
  ADD CONSTRAINT `tbl_payments_FK` FOREIGN KEY (`paymentorder`) REFERENCES `tbl_orders` (`orderid`);

--
-- Constraints for table `tbl_rooms`
--
ALTER TABLE `tbl_rooms`
  ADD CONSTRAINT `tbl_rooms_FK` FOREIGN KEY (`roomtype`) REFERENCES `tbl_roomtypes` (`roomtypeid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

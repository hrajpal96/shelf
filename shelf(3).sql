-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2018 at 06:35 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.0.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shelf`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `bookID` bigint(20) NOT NULL,
  `bookName` varchar(150) NOT NULL,
  `author` varchar(50) NOT NULL,
  `publication` varchar(50) DEFAULT NULL,
  `preferenceID` int(11) DEFAULT NULL,
  `averageRating` float(10,0) NOT NULL,
  `coverPath` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `copies`
--

CREATE TABLE `copies` (
  `copyID` bigint(20) NOT NULL,
  `bookID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `issuecart`
--

CREATE TABLE `issuecart` (
  `copyID` bigint(20) NOT NULL,
  `isIssued` tinyint(1) NOT NULL DEFAULT '0',
  `uid` bigint(20) NOT NULL,
  `issuingTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `preferencetypes`
--

CREATE TABLE `preferencetypes` (
  `preferenceID` int(11) NOT NULL,
  `preferenceName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `taste_preferences`
--

CREATE TABLE `taste_preferences` (
  `user_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `preference` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` bigint(20) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `emailID` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `contactNumber` bigint(10) NOT NULL,
  `isValid` tinyint(1) NOT NULL DEFAULT '0',
  `verification_key` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userpreferences`
--

CREATE TABLE `userpreferences` (
  `uid` bigint(20) NOT NULL,
  `preferenceID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`bookID`),
  ADD UNIQUE KEY `coverPath` (`coverPath`),
  ADD KEY `preferenceID` (`preferenceID`);

--
-- Indexes for table `copies`
--
ALTER TABLE `copies`
  ADD PRIMARY KEY (`copyID`),
  ADD KEY `CopyReference` (`bookID`);

--
-- Indexes for table `issuecart`
--
ALTER TABLE `issuecart`
  ADD KEY `USERID_CONSTRAINT` (`uid`),
  ADD KEY `copyID` (`copyID`);

--
-- Indexes for table `preferencetypes`
--
ALTER TABLE `preferencetypes`
  ADD PRIMARY KEY (`preferenceID`);

--
-- Indexes for table `taste_preferences`
--
ALTER TABLE `taste_preferences`
  ADD PRIMARY KEY (`user_id`,`item_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `emailID` (`emailID`),
  ADD UNIQUE KEY `contactNumber` (`contactNumber`);

--
-- Indexes for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD KEY `uid` (`uid`),
  ADD KEY `preferenceID` (`preferenceID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `bookID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10008;

--
-- AUTO_INCREMENT for table `preferencetypes`
--
ALTER TABLE `preferencetypes`
  MODIFY `preferenceID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `copies`
--
ALTER TABLE `copies`
  ADD CONSTRAINT `CopyReference` FOREIGN KEY (`bookID`) REFERENCES `book` (`bookID`);

--
-- Constraints for table `issuecart`
--
ALTER TABLE `issuecart`
  ADD CONSTRAINT `USERID_CONSTRAINT` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  ADD CONSTRAINT `issuecart_ibfk_1` FOREIGN KEY (`copyID`) REFERENCES `copies` (`copyID`);

--
-- Constraints for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD CONSTRAINT `userpreferences_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  ADD CONSTRAINT `userpreferences_ibfk_2` FOREIGN KEY (`preferenceID`) REFERENCES `preferencetypes` (`preferenceID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

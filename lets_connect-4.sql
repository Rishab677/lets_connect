-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 21, 2025 at 08:36 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lets_connect`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `UserID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`UserID`, `ProductID`) VALUES
(0, 22),
(0, 22),
(0, 22),
(0, 27),
(0, 22),
(0, 27),
(5, 25),
(1, 15),
(1, 17),
(1, 22),
(1, 22),
(2, 22),
(3, 17),
(3, 17),
(3, 21),
(3, 22),
(3, 17),
(3, 22),
(3, 22),
(3, 27),
(3, 23),
(3, 28),
(3, 28),
(1, 33),
(3, 31),
(3, 30),
(3, 29),
(3, 29);

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `DeliveryID` int(11) NOT NULL,
  `delivery_agency` varchar(100) DEFAULT NULL,
  `delivery_state` varchar(255) DEFAULT NULL,
  `delivery_location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`DeliveryID`, `delivery_agency`, `delivery_state`, `delivery_location`) VALUES
(3, 'yxz', 'yzx', 'xycvx'),
(4, 'gfdsa', 'asdfgh', 'hgrew'),
(5, 'gfdsa', 'asdfgh', 'hgrew');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `OrderID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Total_price` float DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `DeliveryID` int(11) DEFAULT NULL,
  `PaymentID` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`OrderID`, `Quantity`, `Total_price`, `location`, `DeliveryID`, `PaymentID`, `status`) VALUES
(2, 1, 200000, 'sdfghj', 4, 3, 'Complete'),
(3, 1, 200000, 'sdfghj', 5, 4, 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL,
  `Payment_method` varchar(100) DEFAULT NULL,
  `payment_Invoice` varchar(255) DEFAULT NULL,
  `payment_verification` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentID`, `Payment_method`, `payment_Invoice`, `payment_verification`) VALUES
(2, 'esewa', 'INV20250518084119', 'complete'),
(3, 'esewa', 'INV20250520233258', 'complete'),
(4, 'esewa', 'INV20250520233258', 'complete');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_brand` varchar(100) DEFAULT NULL,
  `product_price` float DEFAULT NULL,
  `product_specifications` text DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `product_name`, `product_brand`, `product_price`, `product_specifications`, `product_image`) VALUES
(28, 'aaaa', 'vvvv', 123, 'dadadad', 'Resources/Image/About.jpg'),
(29, 'Redmi', 'Redmi', 6534, 'grfvcdsxaz', 'Resources/Image/Redmi .jpg'),
(30, 'ttt', 'vbnm', 45678, 'dfgbn', 'Resources/Image/Iphonemobile.png'),
(31, 'ttt', 'test', 12000, 'dfghj', 'Resources/Image/oppomobile.png'),
(32, 'efghj', 'ertyu', 3456, 'sdfgh', 'Resources/Image/Samsungmobile.png'),
(33, 'ttt', 'test', 12000, 'dfghjk', 'Resources/Image/onepluse.jpg'),
(34, 'yre', 'xcvbn', 4567, 'tdfghb', 'Resources/Image/redmi.png'),
(35, 'ertyu', 'dfghj', 4567, 'erfghj', 'Resources/Image/Error.png'),
(36, 'weqdsa', 'cawdc', 3222, 'wfda', 'Resources/Image/oppomobile.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(10) DEFAULT 'customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `gender`, `username`, `province`, `city`, `password`, `role`) VALUES
(1, 'rishab', 'Aryal', 'test5@gmil.com', '9824057605', 'Male', 'test1', 'jhapa', 'Damak', 'Test123@', 'Admin'),
(2, 'rishab', 'Acharya', 'test2@gmail.com', '9824057605', 'Male', 'test2', 'Jhapa', 'Damak', 'Messi10@', 'customer'),
(4, 'rishab', 'Acharya', 'test4@gmail.com', '9824057605', 'Male', 'test4', 'Jhapa', 'Damak', 'Messi10@', 'customer'),
(5, 'rishab', 'acharya', 'test43@gmail.com', '9824057605', 'Male', 'Test6', 'jhapa', 'Damak', 'Messi10@', 'customer'),
(6, 'rishab', 'acharya', 'test377@gmail.com', '9824057605', 'Male', 'Test99', 'jhapa', 'damak', '5c4rBOPMByQtQ8Lga/5OvX59X3P7/G811JcI9Pf87fo66MTrCpA5bjE4ONVTvkBe', 'customer'),
(8, 'rishab', 'Aryal', 'test123@gmil.com', '9819043005', 'Male', 'test1676', 'jhapa', 'Damak', 'Messi10@', 'customer'),
(9, 'rishab', 'Aryal', 'test123gres@gmil.com', '0987654321', 'Male', 'test345454', 'jhapa', 'Damak', 'Messi10@', 'customer'),
(10, 'rishab', 'acharya', 'rtrtest123@gmail.com', '9824057605', 'Male', 'test367', 'jhapa', 'Damak', 'Messi10@', 'customer'),
(11, 'rishab', 'acharya', 'test1rtyu23@gmail.com', '9824057605', 'Male', 'test3343', 'jhapa', 'Damak', 'Messi10@', 'customer'),
(12, 'rishab', 'acharya', 'test18989@gmail.com', '9824057605', 'Male', 'test39898', 'jhapa', 'Naxal', 'Messi10@', 'customer'),
(13, 'rishab', 'asdasds', 'as@gmail.com', '9824057605', 'Female', 'test100', 'asdasdsadas', 'zfsdfsd', 'Messi10@', 'customer'),
(14, 'rishab', 'acharya', 'test1fgfdd23@gmail.com', '9824057605', 'Male', 'test3sdfg', 'jhapa', 'Damak', 'Messi10@', 'customer'),
(15, 'rishab', 'acharya', 'test20@gmail.com', '9824057605', 'Male', 'test30', 'jhapa', 'Damak', 'Messi10@', 'customer'),
(16, 'rishab', 'acharya', 'test1230@gmil.com', '9824057605', 'Male', 'test300', 'jhapa', 'Damak', 'Messi10@', 'customer'),
(17, 'Rishab', 'Acharya', 'test123232@gmail.com', '9819043005', 'Male', 'test3', 'jhapa', 'Damak', 'Messi10@', 'customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`DeliveryID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `DeliveryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

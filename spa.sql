-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 20, 2022 at 07:16 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spa`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `customer_id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`customer_id`, `username`, `password`, `access_token`, `is_banned`, `created_at`, `updated_at`) VALUES
(1, 'NDK', '$2y$10$qdNpFCDEjVlmERD1BZP1iucjrB/OpctsxJ6BOp43zndyi5bhcf6xK', 'yqQ456b9JbA8ITqqtZ88mAAhBBKgRMwEW66ZkS6MUtbpbh6jN4', 0, '2022-08-12 17:09:24', '2022-08-19 20:44:35'),
(2, 'ndk2509', '$2y$10$JW65jmLyj1NKKh2mmQCxluS2/fZ2R1SMEPo.UHKOeVLdzsSkp9p2W', 'jfBcxmhyUiewahBUGJjJIsH0h6CV6Fx6moHRdh6xqEaZPSMoGf', 0, '2022-08-17 16:49:37', '2022-08-17 16:49:55');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `username` varchar(50) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `OTP` varchar(6) DEFAULT NULL,
  `OTP_expired` datetime DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`username`, `password`, `OTP`, `OTP_expired`, `access_token`, `created_at`, `updated_at`) VALUES
('admin', '$2y$10$kiGbiMyA0RTCO2zcKM4AU.i2Ia/sTE67fuhd2mfQC9GljxZqDC/oa', NULL, NULL, 'zPKvmSD92IvLcwCFxWXCpU5KdmCrOY', '2022-07-22 15:51:25', '2022-08-02 22:44:43');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `booking_date` datetime DEFAULT NULL,
  `expected_date` date DEFAULT NULL,
  `expected_time` time DEFAULT NULL,
  `cus_qty` int(11) DEFAULT NULL,
  `is_payed` tinyint(1) DEFAULT NULL,
  `payment_method` enum('cash','ATM card') DEFAULT NULL,
  `payed_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `customer_id`, `service_id`, `booking_date`, `expected_date`, `expected_time`, `cus_qty`, `is_payed`, `payment_method`, `payed_date`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2022-08-16 17:35:53', '2022-08-18', '00:23:00', NULL, NULL, NULL, NULL, '2022-08-16 17:35:53', '2022-08-16 17:35:53');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`) VALUES
(1, 'Body & Foot', 'Massage-toan-than.jpg'),
(2, 'Facial massage', 'facial-massage.jpg'),
(3, 'Điều trị dược mĩ phẩm', 'nan-mun.jpg'),
(4, 'Combo', 'combo.jpg'),
(5, 'Triệt lông', 'triet-long.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` enum('Male','Female','Others') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone_number`, `address`, `gender`, `created_at`, `updated_at`) VALUES
(1, 'Ky Nguyen', 'ky.nguyen23@student.passerellesnumeriques.org', '0123456789', 'Le Huu Trac, Da Nang', 'Male', '2022-08-12 17:09:24', '2022-08-19 20:59:08'),
(2, 'Nguyen Dang Ky', 'dangkyqt2509@gmail.com', '0987654321', 'Le Huu Trac', 'Male', '2022-08-17 16:49:37', '2022-08-17 16:49:37');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `OTP`
--

CREATE TABLE `OTP` (
  `email` varchar(255) NOT NULL,
  `OTP` varchar(10) DEFAULT NULL,
  `OTP_expired` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `OTP`
--

INSERT INTO `OTP` (`email`, `OTP`, `OTP_expired`, `created_at`, `updated_at`) VALUES
('dangkyqt2509@gmail.com', '', '2022-08-17 16:53:35', '2022-08-17 16:24:57', '2022-08-17 16:49:37'),
('ky.nguyen23@student.passerellesnumeriques.org', NULL, '2022-08-17 18:34:57', '2022-08-10 09:24:56', '2022-08-17 18:30:39');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` float DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `is_displayed` tinyint(1) DEFAULT NULL,
  `display_at_home` tinyint(1) NOT NULL DEFAULT 1,
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `image`, `description`, `price`, `duration`, `is_displayed`, `display_at_home`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Body massage 60 phút', '', '', 200000, 60, 1, 1, 1, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(2, 'Body massage 90 phút', '', '', 260000, 90, 1, 0, 1, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(3, 'Foot massage 60 phút', '', '', 200000, 60, 1, 1, 1, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(4, 'Foot massage 90 phút', '', '', 240000, 90, 1, 0, 1, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(5, 'Massage cổ vai gáy 30 phút', '', '', 250000, 30, 1, 1, 1, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(6, 'Massage cổ vai gáy 60 phút', '', '', 200000, 60, 1, 0, 1, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(7, 'Massage mẹ bầu 60 phút', '', '', 200000, 60, 1, 1, 1, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(8, 'Massage mẹ bầu 90 phút', '', '', 260000, 90, 1, 0, 1, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(9, 'Massage kid', '', '', 150000, 30, 1, 1, 1, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(10, 'Tắm tẩy da chết', '', '', 250000, 30, 1, 0, 1, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(11, 'Massage cơ bản', '', '', 200000, 30, 1, 1, 2, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(12, 'Facial massage', '', '', 300000, 60, 1, 0, 2, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(13, 'Detoxici pro', '', '', 450000, 60, 1, 1, 2, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(14, 'Hydra booster', '', '', 450000, 60, 1, 0, 2, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(15, 'Herbal shine', '', '', 500000, 60, 1, 1, 2, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(16, 'VIP gold therapy', '', '', 850000, 60, 1, 0, 2, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(17, 'VIP black therapy', '', '', 850000, 60, 1, 1, 2, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(18, 'Nặn mụn y khoa', '', '', 300000, 60, 1, 0, 3, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(19, 'Mun detoxic', '', '', 500000, 60, 1, 1, 3, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(20, 'Gangnam peel', '', '', 1550000, 60, 1, 0, 3, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(21, 'Combo 1', '', '', 300000, 60, 1, 1, 4, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(22, 'Combo 2', '', '', 350000, 60, 1, 0, 4, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(23, 'Combo 3', '', '', 400000, 60, 1, 1, 4, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(24, 'Combo 4', '', '', 500000, 60, 1, 0, 4, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(25, 'Xông hơi và ngâm chân', '', '', 100000, 60, 1, 1, 4, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(26, 'nách', '', '', 120000, 60, 1, 0, 5, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(27, 'bụng', '', '', 150000, 60, 1, 1, 5, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(28, 'lưng', '', '', 160000, 60, 1, 0, 5, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(29, '1/2 tay', '', '', 200000, 60, 1, 1, 5, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(30, 'full tay', '', '', 350000, 60, 1, 0, 5, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(31, '1/2 chân', '', '', 250000, 60, 1, 1, 5, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(32, 'full chân', '', '', 400000, 60, 1, 0, 5, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(33, 'bikini', '', '', 400000, 60, 1, 1, 5, '2022-08-03 07:30:53', '2022-08-03 07:30:53'),
(34, 'toàn thân', '', '', 750000, 60, 1, 0, 5, '2022-08-03 07:30:53', '2022-08-03 07:30:53');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `gender` enum('Male','Female','Others') DEFAULT NULL,
  `position` enum('Chủ Spa','Nhân viên') NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `name`, `image`, `gender`, `position`, `created_at`, `updated_at`) VALUES
(1, 'Trần Thị Anh Thi', 'chi-Thi.jpg', 'Female', 'Chủ Spa', '2022-08-20 11:35:14', NULL),
(2, 'Hồ Thị Thanh Ngân', 'chi-Ngan.jpg', 'Female', 'Nhân viên', '2022-08-20 11:37:05', NULL),
(3, 'Nguyễn Bích Hữu', 'chi-Huu.jpg', 'Female', 'Nhân viên', '2022-08-20 11:37:05', NULL),
(4, 'Võ Thanh Thái', 'chi-Thai.jpg', 'Female', 'Nhân viên', '2022-08-20 11:38:09', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `OTP`
--
ALTER TABLE `OTP`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`);

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

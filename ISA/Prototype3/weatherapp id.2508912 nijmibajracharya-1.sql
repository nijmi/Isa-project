-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql107.infinityfree.com
-- Generation Time: Feb 11, 2025 at 11:32 PM
-- Server version: 10.6.19-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_38247584_nijmi`
--

-- --------------------------------------------------------

--
-- Table structure for table `weather`
--

CREATE TABLE `weather` (
  `id` int(11) NOT NULL,
  `city_name` varchar(255) NOT NULL,
  `temperature` float NOT NULL,
  `feels_like` float NOT NULL,
  `pressure` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `humidity` int(11) NOT NULL,
  `wind_speed` float NOT NULL,
  `recorded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `weather`
--

INSERT INTO `weather` (`id`, `city_name`, `temperature`, `feels_like`, `pressure`, `description`, `humidity`, `wind_speed`, `recorded_at`) VALUES
(1, 'Edinburgh', 3.56, -1, 1027, 'scattered clouds', 87, 6.17, '2025-02-05 07:20:21'),
(2, 'Edinburgh', 7.31, 4.17, 1034, 'light rain', 77, 5.14, '2025-02-05 13:14:07'),
(3, 'Edinburgh', 7.31, 4.17, 1034, 'light rain', 77, 5.14, '2025-02-05 13:16:25'),
(4, 'Edinburgh', 5.12, 0.78, 1026, 'overcast clouds', 87, 6.69, '2025-02-11 13:07:21'),
(5, 'Kathmandu', 10.24, 8.6, 1013, 'clear sky', 49, 2.19, '2025-02-11 13:07:26'),
(6, 'Edinburgh', 5.12, 0.78, 1026, 'overcast clouds', 87, 6.69, '2025-02-11 13:11:58'),
(7, 'Edinburgh', 5.12, 0.78, 1026, 'overcast clouds', 87, 6.69, '2025-02-11 13:12:46'),
(8, 'Edinburgh', 5.12, 0.78, 1026, 'overcast clouds', 87, 6.69, '2025-02-11 13:19:15'),
(9, 'Edinburgh', 5.12, 0.78, 1026, 'overcast clouds', 87, 6.69, '2025-02-11 13:23:46'),
(10, 'Edinburgh', 5.12, 0.78, 1026, 'overcast clouds', 87, 6.69, '2025-02-11 13:27:04'),
(11, 'Edinburgh', 5.12, 0.78, 1026, 'overcast clouds', 87, 6.69, '2025-02-11 13:28:55'),
(12, 'Edinburgh', 5.04, 1.09, 1026, 'overcast clouds', 86, 5.66, '2025-02-11 13:48:14'),
(13, 'Edinburgh', 5.12, 1.19, 1026, 'overcast clouds', 87, 5.66, '2025-02-11 13:49:09'),
(14, 'Edinburgh', 5.12, 1.19, 1026, 'overcast clouds', 87, 5.66, '2025-02-11 13:50:05'),
(15, 'Edinburgh', 5.12, 1.19, 1026, 'overcast clouds', 87, 5.66, '2025-02-11 13:50:38'),
(16, 'Edinburgh', 5.12, 1.19, 1026, 'overcast clouds', 87, 5.66, '2025-02-11 13:51:56'),
(17, 'Edinburgh', 5.12, 1.19, 1026, 'overcast clouds', 87, 5.66, '2025-02-11 13:52:27'),
(18, 'Edinburgh', 5.05, 1.1, 1026, 'overcast clouds', 86, 5.66, '2025-02-11 13:53:45'),
(19, 'Edinburgh', 5.05, 1.1, 1026, 'overcast clouds', 86, 5.66, '2025-02-11 13:56:11'),
(20, 'Edinburgh', 5.05, 1.1, 1026, 'overcast clouds', 86, 5.66, '2025-02-11 14:00:16'),
(21, 'Edinburgh', 5.05, 1.1, 1026, 'overcast clouds', 86, 5.66, '2025-02-11 14:00:24'),
(22, 'Edinburgh', 5.05, 1.1, 1026, 'overcast clouds', 86, 5.66, '2025-02-11 14:06:22'),
(23, 'Edinburgh', 5.05, 0.69, 1026, 'overcast clouds', 86, 6.69, '2025-02-11 14:11:40'),
(24, 'Edinburgh', 5.05, 0.69, 1026, 'overcast clouds', 86, 6.69, '2025-02-11 14:23:51'),
(25, 'Edinburgh', 5.04, 0.68, 1026, 'overcast clouds', 84, 6.69, '2025-02-11 14:37:00'),
(26, 'Edinburgh', 5.04, 0.68, 1026, 'overcast clouds', 84, 6.69, '2025-02-11 14:37:12'),
(27, 'Edinburgh', 5.04, 0.68, 1026, 'overcast clouds', 84, 6.69, '2025-02-11 14:42:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `weather`
--
ALTER TABLE `weather`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `weather`
--
ALTER TABLE `weather`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

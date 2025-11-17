-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2025 at 12:24 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `weather`
--

-- --------------------------------------------------------

--
-- Table structure for table `weather`
--

CREATE TABLE `weather` (
  `city_name` varchar(60) NOT NULL,
  `temperature` float NOT NULL,
  `feels_like` float NOT NULL,
  `pressure` float NOT NULL,
  `description` varchar(60) DEFAULT NULL,
  `humidity` float NOT NULL,
  `wind_speed` float NOT NULL,
  `recorded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `weather`
--

INSERT INTO `weather` (`city_name`, `temperature`, `feels_like`, `pressure`, `description`, `humidity`, `wind_speed`, `recorded_at`) VALUES
('Edinburgh', 275.99, 269.25, 987, 'broken clouds', 82, 12.35, '2025-01-24 22:52:40'),
('Edinburgh', 2.84, -3.9, 987, 'broken clouds', 82, 12.35, '2025-01-24 22:52:49'),
('Nepal', 7.96, 7.96, 1012, 'clear sky', 55, 1.15, '2025-01-24 22:52:57'),
('Edinburgh', 2.84, -3.9, 987, 'broken clouds', 82, 12.35, '2025-01-24 22:54:09'),
('Edinburgh', 2.84, -3.9, 987, 'broken clouds', 82, 12.35, '2025-01-24 22:54:29'),
('Edinburgh', 3, -3.68, 987, 'light rain', 82, 12.35, '2025-01-24 22:54:36'),
('Edinburgh', 3, -3.68, 987, 'light rain', 82, 12.35, '2025-01-24 22:54:51'),
('Edinburgh', 3, -3.68, 987, 'light rain', 82, 12.35, '2025-01-24 22:56:19'),
('Edinburgh', 3, -3.68, 987, 'light rain', 82, 12.35, '2025-01-24 23:04:29'),
('Edinburgh', 3, -3.68, 987, 'light rain', 82, 12.35, '2025-01-24 23:04:37'),
('Edinburgh', 3, -2.68, 987, 'moderate rain', 84, 8.75, '2025-01-24 23:07:28'),
('Edinburgh', 3, -2.68, 987, 'moderate rain', 84, 8.75, '2025-01-24 23:07:35'),
('Edinburgh', 3, -2.68, 987, 'moderate rain', 84, 8.75, '2025-01-24 23:07:40'),
('Nepal', 7.96, 7.96, 1012, 'clear sky', 55, 1.15, '2025-01-24 23:07:46'),
('Edinburgh', 3, -2.68, 987, 'moderate rain', 84, 8.75, '2025-01-24 23:10:33'),
('Pokhara', 10.8, 8.95, 1013, 'clear sky', 39, 2.03, '2025-01-24 23:10:39'),
('Edinburgh', 2.91, -2.8, 987, 'broken clouds', 83, 8.75, '2025-01-24 23:15:04'),
('Edinburgh', 2.91, -2.8, 987, 'broken clouds', 83, 8.75, '2025-01-24 23:15:10'),
('Edinburgh', 2.91, -2.8, 987, 'broken clouds', 83, 8.75, '2025-01-24 23:23:11'),
('Nepal', 7.96, 7.96, 1012, 'clear sky', 55, 1.15, '2025-01-24 23:23:16'),
('Edinburgh', 2.91, -2.8, 987, 'broken clouds', 83, 8.75, '2025-01-24 23:23:22');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

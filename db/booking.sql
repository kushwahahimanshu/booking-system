-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2022 at 09:51 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2022_09_15_001417_create_seats_table', 1),
(5, '2022_10_14_015158_create_rows_table', 2),
(6, '2022_10_14_022007_add_foreign_key_seats', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rows`
--

CREATE TABLE `rows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `available_qty` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rows`
--

INSERT INTO `rows` (`id`, `available_qty`, `created_at`, `updated_at`) VALUES
(1, 7, '2022-10-13 21:02:01', '2022-10-15 08:14:56'),
(2, 7, '2022-10-13 21:02:01', '2022-10-15 08:15:19'),
(3, 7, '2022-10-13 21:02:01', '2022-10-15 08:15:56'),
(4, 7, '2022-10-13 21:02:01', '2022-10-15 08:17:10'),
(5, 7, '2022-10-13 21:02:01', '2022-10-13 21:02:01'),
(6, 7, '2022-10-13 21:02:01', '2022-10-13 21:02:01'),
(7, 7, '2022-10-13 21:02:01', '2022-10-13 21:02:01'),
(8, 7, '2022-10-13 21:02:01', '2022-10-13 21:02:01'),
(9, 7, '2022-10-13 21:02:01', '2022-10-13 21:02:01'),
(10, 7, '2022-10-13 21:02:01', '2022-10-13 21:02:01'),
(11, 7, '2022-10-13 21:02:01', '2022-10-13 21:02:01'),
(12, 3, '2022-10-13 21:02:01', '2022-10-16 14:04:17');

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `row_id` bigint(20) UNSIGNED DEFAULT NULL,
  `seat_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `booking_status` tinyint(1) DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`id`, `row_id`, `seat_name`, `booking_status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'S1', 0, NULL, '2022-09-22 11:28:56', '2022-10-15 08:14:32'),
(2, 1, 'S2', 0, NULL, '2022-09-22 11:28:56', '2022-10-15 08:14:32'),
(3, 1, 'S3', 0, NULL, '2022-09-22 11:28:56', '2022-10-15 08:14:32'),
(4, 1, 'S4', 0, NULL, '2022-09-22 11:28:56', '2022-10-15 08:14:32'),
(5, 1, 'S5', 0, NULL, '2022-09-22 11:28:56', '2022-10-15 08:14:32'),
(6, 1, 'S6', 0, NULL, '2022-09-22 11:28:56', '2022-10-15 08:14:56'),
(7, 1, 'S7', 0, NULL, '2022-09-22 11:28:56', '2022-10-15 08:14:56'),
(8, 2, 'S8', 0, NULL, '2022-09-22 11:28:56', '2022-10-15 08:15:19'),
(9, 2, 'S9', 0, NULL, '2022-09-22 11:28:56', '2022-10-15 08:15:19'),
(10, 2, 'S10', 0, NULL, '2022-09-22 11:28:56', '2022-10-15 08:15:19'),
(11, 2, 'S11', 0, NULL, '2022-09-22 11:28:56', '2022-10-15 08:15:19'),
(12, 2, 'S12', 0, NULL, '2022-09-22 11:28:57', '2022-10-15 08:15:19'),
(13, 2, 'S13', 0, NULL, '2022-09-22 11:28:57', '2022-10-15 08:15:19'),
(14, 2, 'S14', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(15, 3, 'S15', 0, NULL, '2022-09-22 11:28:57', '2022-10-15 08:15:56'),
(16, 3, 'S16', 0, NULL, '2022-09-22 11:28:57', '2022-10-15 08:15:56'),
(17, 3, 'S17', 0, NULL, '2022-09-22 11:28:57', '2022-10-15 08:15:56'),
(18, 3, 'S18', 0, NULL, '2022-09-22 11:28:57', '2022-10-15 08:15:56'),
(19, 3, 'S19', 0, NULL, '2022-09-22 11:28:57', '2022-10-15 08:15:56'),
(20, 3, 'S20', 0, NULL, '2022-09-22 11:28:57', '2022-10-15 08:15:56'),
(21, 3, 'S21', 0, NULL, '2022-09-22 11:28:57', '2022-10-15 08:15:56'),
(22, 4, 'S22', 0, NULL, '2022-09-22 11:28:57', '2022-10-15 08:17:10'),
(23, 4, 'S23', 0, NULL, '2022-09-22 11:28:57', '2022-10-15 08:17:10'),
(24, 4, 'S24', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(25, 4, 'S25', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(26, 4, 'S26', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(27, 4, 'S27', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(28, 4, 'S28', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(29, 5, 'S29', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(30, 5, 'S30', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(31, 5, 'S31', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(32, 5, 'S32', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(33, 5, 'S33', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(34, 5, 'S34', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(35, 5, 'S35', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(36, 6, 'S36', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(37, 6, 'S37', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(38, 6, 'S38', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(39, 6, 'S39', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(40, 6, 'S40', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(41, 6, 'S41', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(42, 6, 'S42', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(43, 7, 'S43', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(44, 7, 'S44', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(45, 7, 'S45', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(46, 7, 'S46', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(47, 7, 'S47', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(48, 7, 'S48', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(49, 7, 'S49', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(50, 8, 'S50', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(51, 8, 'S51', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(52, 8, 'S52', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(53, 8, 'S53', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(54, 8, 'S54', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(55, 8, 'S55', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(56, 8, 'S56', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(57, 9, 'S57', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(58, 9, 'S58', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(59, 9, 'S59', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(60, 9, 'S60', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(61, 9, 'S61', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(62, 9, 'S62', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(63, 9, 'S63', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(64, 10, 'S64', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(65, 10, 'S65', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(66, 10, 'S66', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(67, 10, 'S67', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(68, 10, 'S68', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(69, 10, 'S69', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(70, 10, 'S70', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(71, 11, 'S71', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(72, 11, 'S72', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(73, 11, 'S73', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(74, 11, 'S74', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(75, 11, 'S75', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(76, 11, 'S76', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(77, 11, 'S77', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41'),
(78, 12, 'S78', 0, NULL, '2022-09-22 11:28:57', '2022-10-16 14:04:17'),
(79, 12, 'S79', 0, NULL, '2022-09-22 11:28:57', '2022-10-16 14:04:17'),
(80, 12, 'S80', 0, NULL, '2022-09-22 11:28:57', '2022-10-13 21:14:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `rows`
--
ALTER TABLE `rows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seats_row_id_foreign` (`row_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rows`
--
ALTER TABLE `rows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `seats`
--
ALTER TABLE `seats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_row_id_foreign` FOREIGN KEY (`row_id`) REFERENCES `rows` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

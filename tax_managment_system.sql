-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2018 at 06:03 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.1.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tax_managment_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `basic_units`
--

CREATE TABLE `basic_units` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `basic_units`
--

INSERT INTO `basic_units` (`id`, `name`, `unit`, `created_at`, `updated_at`) VALUES
(1, 'Residential', 10, NULL, NULL),
(2, 'Commercial', 20, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `complains`
--

CREATE TABLE `complains` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `complain` longtext COLLATE utf8mb4_unicode_ci,
  `response` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `seen` int(11) NOT NULL DEFAULT '0' COMMENT '0 for not seen,1 for admin seen,2 for citizen seen',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `complains`
--

INSERT INTO `complains` (`id`, `user_id`, `complain`, `response`, `status`, `seen`, `created_at`, `updated_at`) VALUES
(1, 2, 'This is my first complaint.', NULL, 0, 0, '2018-05-02 22:49:43', '2018-05-02 22:49:43');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `tax`, `created_at`, `updated_at`) VALUES
(1, 'Sui Nathern Gas', 15, NULL, NULL),
(2, 'Water', 20, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(94, '2014_10_12_000000_create_users_table', 1),
(95, '2014_10_12_100000_create_password_resets_table', 1),
(96, '2018_04_18_075946_create_basic_units_table', 1),
(97, '2018_04_18_093855_create_properties_table', 1),
(98, '2018_04_24_031719_create_departments_table', 1),
(99, '2018_04_26_055709_create_property_departments_table', 1),
(100, '2018_04_26_080813_create_payments_table', 1),
(101, '2018_05_01_054030_create_complains_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `citizen_id` int(11) DEFAULT NULL,
  `account_number` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `type` enum('Credit','Printout') COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_slip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Pending','Completed','Rejected') COLLATE utf8mb4_unicode_ci NOT NULL,
  `seen` int(11) NOT NULL DEFAULT '0' COMMENT '0 for not seen,1 for admin seen,2 for citizen seen',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `citizen_id`, `account_number`, `amount`, `type`, `payment_slip`, `date`, `status`, `seen`, `created_at`, `updated_at`) VALUES
(1, 2, 5896483, 12000, 'Credit', NULL, '2018-05-02', 'Completed', 0, '2018-05-02 22:54:14', '2018-05-02 22:54:14');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `property_area_id` int(11) NOT NULL,
  `type` enum('self','rent') COLLATE utf8mb4_unicode_ci NOT NULL,
  `marla` enum('less than 10','10 to 20','greater than 20') COLLATE utf8mb4_unicode_ci NOT NULL,
  `house_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `user_id`, `property_area_id`, `type`, `marla`, `house_no`, `address`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 'rent', '10 to 20', 'J1234', 'Johor Town', NULL, NULL),
(2, 2, 1, 'self', '10 to 20', 'y934', 'Model Town', NULL, NULL),
(5, 2, 1, 'rent', 'greater than 20', 'Z1786', 'Liberty', '2018-05-02 13:16:14', '2018-05-02 13:16:30');

-- --------------------------------------------------------

--
-- Table structure for table `property_departments`
--

CREATE TABLE `property_departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `property_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_departments`
--

INSERT INTO `property_departments` (`id`, `property_id`, `department_id`, `created_at`, `updated_at`) VALUES
(1, 4, 1, '2018-05-02 13:08:01', '2018-05-02 13:08:01'),
(2, 4, 2, '2018-05-02 13:08:01', '2018-05-02 13:08:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `annual_income` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Business Man','Job Holder','Labour') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Business Man',
  `role` enum('Admin','Citizen') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Citizen',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `address`, `phone`, `annual_income`, `image`, `type`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@admin.com', '$2y$10$v5yL84xWn1K.6f549srPUuY0HmkSpH2btZb1bwzQ.tbGV3ZwqRwQK', NULL, NULL, NULL, NULL, 'Business Man', 'Admin', 'iNQNNXkY58hH3Wjc0QnpPX3mDcl7UGQ2bpSpEO89QQhohtMpFZW56mR2qSHy', NULL, NULL),
(2, 'Client', 'client@client.com', '$2y$10$uqm6307hg3LF4nyU.Nu03u91C7en.w1r0sapw0FUY5V6ePPhWFjGm', NULL, NULL, NULL, NULL, 'Business Man', 'Citizen', 'eqdBDsj5FcS5Filv5ocVft2Zo7kZGJruR1HndLKLr59cjwAnCzl2GKzdA5DK', NULL, NULL),
(3, 'faisal abbas', 'faisalabbas@client.com', '$2y$10$ihQh2JgK/O13rFTBTq0HFuynMHAjrZIOGpkwXG2YT57z/oGEQ34HK', NULL, NULL, NULL, NULL, 'Business Man', 'Citizen', 'CIV4nQGgdd1fWRg06wq1xhDuCR8dDl2tzgA3jOVT4DaOzjCQbpL3pIaOoO3Q', '2018-05-03 00:06:25', '2018-05-03 00:06:25'),
(4, 'Asim', 'asim@admin.com', '$2y$10$hloBMTQfdQBbdJCIodR8b.7CzHlj7DY9oYnaUVx4cytnj8DXp65Lq', NULL, NULL, NULL, NULL, 'Business Man', 'Citizen', 'rx05gdpqo1JapVclerePlZL6mWNuxEh200lMyOoNmGasUem0XzRxM2j0Vlm0', '2018-05-03 00:10:11', '2018-05-03 00:10:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `basic_units`
--
ALTER TABLE `basic_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complains`
--
ALTER TABLE `complains`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_departments`
--
ALTER TABLE `property_departments`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `basic_units`
--
ALTER TABLE `basic_units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `complains`
--
ALTER TABLE `complains`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `property_departments`
--
ALTER TABLE `property_departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 28, 2020 at 03:59 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sipilma`
--

-- --------------------------------------------------------

--
-- Table structure for table `alternatives`
--

DROP TABLE IF EXISTS `alternatives`;
CREATE TABLE IF NOT EXISTS `alternatives` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alternatives_code_unique` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alternative_comparisons`
--

DROP TABLE IF EXISTS `alternative_comparisons`;
CREATE TABLE IF NOT EXISTS `alternative_comparisons` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `criteria_id` int(10) UNSIGNED NOT NULL,
  `x_alternative_id` int(10) UNSIGNED NOT NULL,
  `y_alternative_id` int(10) UNSIGNED NOT NULL,
  `value` double(8,5) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alternative_comparisons_criteria_id_foreign` (`criteria_id`),
  KEY `alternative_comparisons_x_alternative_id_foreign` (`x_alternative_id`),
  KEY `alternative_comparisons_y_alternative_id_foreign` (`y_alternative_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alternative_details`
--

DROP TABLE IF EXISTS `alternative_details`;
CREATE TABLE IF NOT EXISTS `alternative_details` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `alternative_id` int(10) UNSIGNED NOT NULL,
  `criteria_id` int(10) UNSIGNED NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alternative_details_alternative_id_foreign` (`alternative_id`),
  KEY `alternative_details_criteria_id_foreign` (`criteria_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alternative_normalizations`
--

DROP TABLE IF EXISTS `alternative_normalizations`;
CREATE TABLE IF NOT EXISTS `alternative_normalizations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comparison_id` int(10) UNSIGNED NOT NULL,
  `value` double(8,5) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alternative_normalizations_comparison_id_foreign` (`comparison_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alternative_priorities`
--

DROP TABLE IF EXISTS `alternative_priorities`;
CREATE TABLE IF NOT EXISTS `alternative_priorities` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `criteria_id` int(10) UNSIGNED NOT NULL,
  `alternative_id` int(10) UNSIGNED NOT NULL,
  `value` double(8,5) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alternative_priorities_criteria_id_foreign` (`criteria_id`),
  KEY `alternative_priorities_alternative_id_foreign` (`alternative_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `criterias`
--

DROP TABLE IF EXISTS `criterias`;
CREATE TABLE IF NOT EXISTS `criterias` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `criterias_code_unique` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `criterias`
--

INSERT INTO `criterias` (`id`, `code`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'C1', 'Tarif', '2020-01-27 20:49:37', '2020-01-27 20:49:37', NULL),
(2, 'C2', 'Fasilitas', '2020-01-27 20:49:37', '2020-01-27 20:49:37', NULL),
(3, 'C3', 'Luas', '2020-01-27 20:49:37', '2020-01-27 20:49:37', NULL),
(4, 'C4', 'Parkir Area', '2020-01-27 20:49:37', '2020-01-27 20:49:37', NULL),
(5, 'C5', 'Security', '2020-01-27 20:49:37', '2020-01-27 20:49:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `criteria_comparisons`
--

DROP TABLE IF EXISTS `criteria_comparisons`;
CREATE TABLE IF NOT EXISTS `criteria_comparisons` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_criteria_id` int(10) UNSIGNED NOT NULL,
  `value` double(8,2) NOT NULL,
  `second_criteria_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `criteria_comparisons_first_criteria_id_foreign` (`first_criteria_id`),
  KEY `criteria_comparisons_second_criteria_id_foreign` (`second_criteria_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `criteria_comparisons`
--

INSERT INTO `criteria_comparisons` (`id`, `first_criteria_id`, `value`, `second_criteria_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1.00, 1, '2020-01-27 20:49:37', '2020-01-27 20:49:37'),
(2, 2, 1.00, 2, '2020-01-27 20:49:37', '2020-01-27 20:49:37'),
(3, 3, 1.00, 3, '2020-01-27 20:49:37', '2020-01-27 20:49:37'),
(4, 4, 1.00, 4, '2020-01-27 20:49:37', '2020-01-27 20:49:37'),
(5, 5, 1.00, 5, '2020-01-27 20:49:37', '2020-01-27 20:49:37');

-- --------------------------------------------------------

--
-- Table structure for table `criteria_normalizations`
--

DROP TABLE IF EXISTS `criteria_normalizations`;
CREATE TABLE IF NOT EXISTS `criteria_normalizations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comparison_id` int(10) UNSIGNED NOT NULL,
  `value` double(8,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `criteria_normalizations_comparison_id_foreign` (`comparison_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `criteria_priorities`
--

DROP TABLE IF EXISTS `criteria_priorities`;
CREATE TABLE IF NOT EXISTS `criteria_priorities` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `criteria_id` int(10) UNSIGNED NOT NULL,
  `value` double(8,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `criteria_priorities_criteria_id_foreign` (`criteria_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `index_random`
--

DROP TABLE IF EXISTS `index_random`;
CREATE TABLE IF NOT EXISTS `index_random` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `n` tinyint(3) UNSIGNED NOT NULL,
  `IR` double(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `index_random`
--

INSERT INTO `index_random` (`id`, `n`, `IR`, `created_at`, `updated_at`) VALUES
(1, 1, 0.00, NULL, NULL),
(2, 2, 0.00, NULL, NULL),
(3, 3, 0.58, NULL, NULL),
(4, 4, 0.90, NULL, NULL),
(5, 5, 1.12, NULL, NULL),
(6, 6, 1.24, NULL, NULL),
(7, 7, 1.32, NULL, NULL),
(8, 8, 1.41, NULL, NULL),
(9, 9, 1.45, NULL, NULL),
(10, 10, 1.49, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2018_11_27_001124_create_roles_table', 1),
(3, '2018_11_27_001516_create_role_user_table', 1),
(4, '2018_11_27_082023_create_criterias_table', 1),
(5, '2018_11_27_082143_create_alternatives_table', 1),
(6, '2018_11_27_083235_create_alternative_details_table', 1),
(7, '2018_12_03_132203_create_criteria_comparisons_table', 1),
(8, '2018_12_04_062859_create_rating_scales_table', 1),
(9, '2018_12_05_011024_create_criteria_normalizations_table', 1),
(10, '2018_12_05_045538_create_criteria_priorities_table', 1),
(11, '2018_12_16_031947_create_alternative_comparisons_table', 1),
(12, '2018_12_16_105826_create_alternative_normalizations_table', 1),
(13, '2018_12_16_131631_create_alternative_priorities_table', 1),
(14, '2018_12_18_103508_create_index_randoms_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rating_scales`
--

DROP TABLE IF EXISTS `rating_scales`;
CREATE TABLE IF NOT EXISTS `rating_scales` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` int(10) UNSIGNED NOT NULL,
  `caption` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `detail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rating_scales`
--

INSERT INTO `rating_scales` (`id`, `value`, `caption`, `detail`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sama pentingnya', 'Kedua elemen mempunyai pengaruh yang sama.', NULL, NULL),
(2, 2, 'Rata-rata', 'Nilai-nilai antara dua nilai pertimbangan-pertimbangan yang berdekatan, Nilai ini diberikan bila ada dua kompromi di antara 2 pilihan.', NULL, NULL),
(3, 3, 'Sedikit lebih penting', 'Pengalaman dan penilaian sangat memihak satu elemen dibandingkan dengan pasangannya.', NULL, NULL),
(4, 4, 'Rata-rata', 'Nilai-nilai antara dua nilai pertimbangan-pertimbangan yang berdekatan, Nilai ini diberikan bila ada dua kompromi di antara 2 pilihan.', NULL, NULL),
(5, 5, 'Lebih Penting', 'Satu elemen sangat disukai dan secara praktis dominasinya sangat nyata, dibandingkan dengan elemen pasangannya.', NULL, NULL),
(6, 6, 'Rata-rata', 'Nilai-nilai antara dua nilai pertimbangan-pertimbangan yang berdekatan, Nilai ini diberikan bila ada dua kompromi di antara 2 pilihan.', NULL, NULL),
(7, 7, 'Sangat penting', 'Satu elemen terbukti sangat disukai dan secara praktis dominasinya sangat, dibandingkan dengan elemen pasangannya.', NULL, NULL),
(8, 8, 'Rata-rata', 'Nilai-nilai antara dua nilai pertimbangan-pertimbangan yang berdekatan, Nilai ini diberikan bila ada dua kompromi di antara 2 pilihan.', NULL, NULL),
(9, 9, 'Mutlak lebih penting', 'Satu elemen mutlak lebih disukai dibandingkan dengan pasangannya, pada tingkat keyakinan tertinggi', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'superadmin', 'Superadmin', NULL, NULL, NULL),
(2, 'admin', 'Administrator', NULL, NULL, NULL),
(3, 'user', 'User', NULL, NULL, NULL),
(4, 'superadmin', 'Superadmin', NULL, NULL, NULL),
(5, 'admin', 'Administrator', NULL, NULL, NULL),
(6, 'user', 'User', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE IF NOT EXISTS `role_user` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_user_id_foreign` (`user_id`),
  KEY `role_user_role_id_foreign` (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Caesar Ali L.', 'caesarali', 'caesaralilamondo@gmail.com', NULL, '$2y$10$95blKqHr1U/5aAgGHhZJ1ulZv5jbx7xoEjgs7qgMAGHO0qLCy6fRW', 'bhLOitINxsa6YMd3yJnan9fPdhw6JK5F6wzNT5UpyLJuoOXw4WW1AwCkABYF', '2020-01-27 20:52:23', '2020-01-27 20:52:23', NULL),
(2, 'User STMIK AKBA', 'stmikakba', 'stmikakba@sipilma', NULL, '$2y$10$PXiQBY338E83e71vkUaz0O78y4.bqKOccKEvGv1B6ns/jvAOOzsWu', 'EegeHscQrTL635W5bx3w8HpduudsYGOMgdWvayzYKAv7zgwO4lqmeJUE4duF', '2020-01-27 20:52:23', '2020-01-27 20:52:23', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

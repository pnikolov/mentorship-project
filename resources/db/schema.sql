-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 10 май 2018 в 10:34
-- Версия на сървъра: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_petdiary`
--

-- --------------------------------------------------------

--
-- Структура на таблица `animals`
--

CREATE TABLE `animals` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `breed` int(10) UNSIGNED NOT NULL,
  `food` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `owner` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `birth` date NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `coloring` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `traits` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `qr_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `breeds`
--

CREATE TABLE `breeds` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `checkups`
--

CREATE TABLE `checkups` (
  `id` int(10) UNSIGNED NOT NULL,
  `animal` int(10) UNSIGNED NOT NULL,
  `doctor` int(10) UNSIGNED NOT NULL,
  `checkup_date` date NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `clinics`
--

CREATE TABLE `clinics` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `diary`
--

CREATE TABLE `diary` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `animal` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `doctors`
--

CREATE TABLE `doctors` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `clinic` int(10) UNSIGNED NOT NULL,
  `phone` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `friendships`
--

CREATE TABLE `friendships` (
  `id` int(10) UNSIGNED NOT NULL,
  `animal_one` int(10) UNSIGNED NOT NULL,
  `animal_two` int(10) UNSIGNED NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `images`
--

CREATE TABLE `images` (
  `id` int(10) UNSIGNED NOT NULL,
  `animal_id` int(10) UNSIGNED NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `reg_date` datetime NOT NULL,
  `last_login` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `animals`
--
ALTER TABLE `animals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner` (`owner`) USING BTREE,
  ADD KEY `animals_breeds` (`breed`);

--
-- Indexes for table `breeds`
--
ALTER TABLE `breeds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `checkups`
--
ALTER TABLE `checkups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `animal` (`animal`),
  ADD KEY `doctor` (`doctor`);

--
-- Indexes for table `clinics`
--
ALTER TABLE `clinics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diary`
--
ALTER TABLE `diary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `animal` (`animal`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clinic` (`clinic`);

--
-- Indexes for table `friendships`
--
ALTER TABLE `friendships`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `animal_one` (`animal_one`),
  ADD UNIQUE KEY `animal_two` (`animal_two`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `animal_id` (`animal_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `animals`
--
ALTER TABLE `animals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `breeds`
--
ALTER TABLE `breeds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `checkups`
--
ALTER TABLE `checkups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clinics`
--
ALTER TABLE `clinics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `diary`
--
ALTER TABLE `diary`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `friendships`
--
ALTER TABLE `friendships`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ограничения за дъмпнати таблици
--

--
-- Ограничения за таблица `animals`
--
ALTER TABLE `animals`
  ADD CONSTRAINT `animals_breeds` FOREIGN KEY (`breed`) REFERENCES `breeds` (`id`),
  ADD CONSTRAINT `animals_users` FOREIGN KEY (`owner`) REFERENCES `users` (`id`);

--
-- Ограничения за таблица `checkups`
--
ALTER TABLE `checkups`
  ADD CONSTRAINT `checkups_animal` FOREIGN KEY (`animal`) REFERENCES `animals` (`id`),
  ADD CONSTRAINT `checkups_doctor` FOREIGN KEY (`doctor`) REFERENCES `doctors` (`id`);

--
-- Ограничения за таблица `diary`
--
ALTER TABLE `diary`
  ADD CONSTRAINT `animal` FOREIGN KEY (`animal`) REFERENCES `animals` (`id`);

--
-- Ограничения за таблица `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_clinic` FOREIGN KEY (`clinic`) REFERENCES `clinics` (`id`);

--
-- Ограничения за таблица `friendships`
--
ALTER TABLE `friendships`
  ADD CONSTRAINT `animal_one` FOREIGN KEY (`animal_one`) REFERENCES `animals` (`id`),
  ADD CONSTRAINT `animal_two` FOREIGN KEY (`animal_two`) REFERENCES `animals` (`id`);

--
-- Ограничения за таблица `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `animal_id` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

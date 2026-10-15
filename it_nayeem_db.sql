-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 10, 2025 at 06:22 PM
-- Server version: 10.11.10-MariaDB
-- PHP Version: 8.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `it_nayeem_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT 0,
  `photo` varchar(191) DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone`, `role_id`, `photo`, `password`, `status`, `remember_token`, `created_at`, `updated_at`, `shop_name`) VALUES
(1, 'Daraz', 'support@itnayeem.com.bd', '+8801511777744', 0, '1709010579daraz-logo-AA537DF718-seeklogo.com.png', '$2y$10$1tp35HjMLVdnTzv2epfAiOayKOXXjkFwmE6DLZ/Te6p1GwuZ0AOPK', 1, 'BP0Hh35d8N1P8PpU6wqkXshR0G1kCxe2YklXQRQ9XTTmxW4Fq0VSVvWNYjbx', '2018-02-28 23:27:08', '2025-02-09 15:24:53', 'Daraz');

-- --------------------------------------------------------

--
-- Table structure for table `admin_languages`
--

CREATE TABLE `admin_languages` (
  `id` int(11) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rtl` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_languages`
--

INSERT INTO `admin_languages` (`id`, `is_default`, `language`, `file`, `name`, `rtl`) VALUES
(1, 1, 'English', '1567232745AoOcvCtY.json', '1567232745AoOcvCtY', 0);

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_conversations`
--

CREATE TABLE `admin_user_conversations` (
  `id` int(11) NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` enum('Ticket','Dispute') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_user_conversations`
--

INSERT INTO `admin_user_conversations` (`id`, `subject`, `user_id`, `message`, `created_at`, `updated_at`, `type`, `order_number`) VALUES
(1, 'Est voluptatum qui d', 51, 'Repudiandae enim exp', '2024-04-25 12:06:51', '2024-04-25 12:06:51', 'Ticket', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_messages`
--

CREATE TABLE `admin_user_messages` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_user_messages`
--

INSERT INTO `admin_user_messages` (`id`, `conversation_id`, `message`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Repudiandae enim exp', 51, '2024-04-25 12:06:51', '2024-04-25 12:06:51');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `attributable_id` int(11) DEFAULT NULL,
  `attributable_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `input_name` varchar(255) DEFAULT NULL,
  `price_status` int(11) NOT NULL DEFAULT 1 COMMENT '0 - hide, 1- show	',
  `details_status` int(11) NOT NULL DEFAULT 1 COMMENT '0 - hide, 1- show	',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `attributable_id`, `attributable_type`, `name`, `input_name`, `price_status`, `details_status`, `created_at`, `updated_at`) VALUES
(14, 5, 'App\\Models\\Category', 'Warranty Type', 'warranty_type', 1, 1, '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(20, 4, 'App\\Models\\Category', 'Warranty Type', 'warranty_type', 1, 1, '2019-09-24 00:41:46', '2019-10-03 00:18:54'),
(21, 4, 'App\\Models\\Category', 'Brand', 'brand', 1, 1, '2019-09-24 00:44:13', '2019-10-03 00:19:13'),
(22, 2, 'App\\Models\\Subcategory', 'Color Family', 'color_family', 1, 1, '2019-09-24 00:45:45', '2019-09-24 00:45:45'),
(24, 1, 'App\\Models\\Childcategory', 'Display Size', 'display_size', 1, 1, '2019-09-24 00:54:17', '2019-09-24 00:54:17'),
(25, 12, 'App\\Models\\Subcategory', 'demo', 'demo', 1, 1, '2019-09-24 01:26:47', '2019-09-24 01:26:47'),
(30, 3, 'App\\Models\\Subcategory', 'Interior Color', 'interior_color', 1, 1, '2019-09-24 04:31:44', '2019-09-24 04:31:44'),
(31, 8, 'App\\Models\\Childcategory', 'Temperature', 'temperature', 1, 1, '2019-09-24 04:34:35', '2019-09-24 04:34:35'),
(32, 18, 'App\\Models\\Category', 'Demo', 'demo', 1, 1, '2019-10-02 23:39:12', '2019-10-02 23:39:12'),
(33, 4, 'App\\Models\\Category', 'RAM', 'ram', 1, 1, '2019-10-12 03:22:03', '2019-10-12 23:30:39');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_options`
--

CREATE TABLE `attribute_options` (
  `id` int(11) NOT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `attribute_options`
--

INSERT INTO `attribute_options` (`id`, `attribute_id`, `name`, `created_at`, `updated_at`) VALUES
(107, 14, 'No Warranty', '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(108, 14, 'Local seller Warranty', '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(109, 14, 'Non local warranty', '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(110, 14, 'International Manufacturer Warranty', '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(111, 14, 'International Seller Warranty', '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(157, 22, 'Black', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(158, 22, 'White', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(159, 22, 'Sliver', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(160, 22, 'Red', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(161, 22, 'Dark Grey', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(162, 22, 'Dark Blue', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(163, 22, 'Brown', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(172, 24, '40', '2019-09-24 01:25:32', '2019-09-24 01:25:32'),
(173, 24, '22', '2019-09-24 01:25:32', '2019-09-24 01:25:32'),
(174, 24, '24', '2019-09-24 01:25:32', '2019-09-24 01:25:32'),
(175, 24, '32', '2019-09-24 01:25:32', '2019-09-24 01:25:32'),
(176, 24, '21', '2019-09-24 01:25:32', '2019-09-24 01:25:32'),
(177, 25, 'demo 1', '2019-09-24 01:26:47', '2019-09-24 01:26:47'),
(178, 25, 'demo 2', '2019-09-24 01:26:47', '2019-09-24 01:26:47'),
(187, 30, 'Yellow', '2019-09-24 04:31:44', '2019-09-24 04:31:44'),
(188, 30, 'White', '2019-09-24 04:31:44', '2019-09-24 04:31:44'),
(189, 31, '22', '2019-09-24 04:34:35', '2019-09-24 04:34:35'),
(190, 31, '34', '2019-09-24 04:34:35', '2019-09-24 04:34:35'),
(191, 31, '45', '2019-09-24 04:34:35', '2019-09-24 04:34:35'),
(195, 20, 'Local seller warranty', '2019-10-03 00:18:54', '2019-10-03 00:18:54'),
(196, 20, 'No warranty', '2019-10-03 00:18:54', '2019-10-03 00:18:54'),
(197, 20, 'international manufacturer warranty', '2019-10-03 00:18:54', '2019-10-03 00:18:54'),
(198, 20, 'Non-local warranty', '2019-10-03 00:18:54', '2019-10-03 00:18:54'),
(199, 21, 'Symphony', '2019-10-03 00:19:13', '2019-10-03 00:19:13'),
(200, 21, 'Oppo', '2019-10-03 00:19:13', '2019-10-03 00:19:13'),
(201, 21, 'EStore', '2019-10-03 00:19:13', '2019-10-03 00:19:13'),
(202, 21, 'Infinix', '2019-10-03 00:19:13', '2019-10-03 00:19:13'),
(203, 21, 'Apple', '2019-10-03 00:19:13', '2019-10-03 00:19:13'),
(243, 33, '1 GB', '2019-10-12 23:30:39', '2019-10-12 23:30:39'),
(244, 33, '2 GB', '2019-10-12 23:30:39', '2019-10-12 23:30:39'),
(245, 33, '3 GB', '2019-10-12 23:30:39', '2019-10-12 23:30:39'),
(253, 32, 'demo 1', '2019-10-13 03:18:04', '2019-10-13 03:18:04'),
(254, 32, 'demo 2', '2019-10-13 03:18:04', '2019-10-13 03:18:04'),
(255, 32, 'demo 3', '2019-10-13 03:18:04', '2019-10-13 03:18:04');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Large','TopSmall','BottomSmall') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `link`, `type`) VALUES
(1, '1739138150chaldalbkash2024.png', 'https://www.google.com/', 'TopSmall'),
(2, '1739138143chaldalucboffer.png', NULL, 'TopSmall'),
(3, '1739138031aSsQbiCEfTO54DI4whMLqeBXc1BTiX7waEYuU4v3(1).png', 'https://www.google.com/', 'Large'),
(4, '17391378801.jpg', 'https://www.google.com/', 'BottomSmall'),
(5, '17391378732.png', 'https://www.google.com/', 'BottomSmall'),
(6, '17391378653.jpg', 'https://www.google.com/', 'BottomSmall');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `details` text NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `source` varchar(191) NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `meta_tag` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `category_id`, `title`, `details`, `photo`, `source`, `views`, `status`, `meta_tag`, `meta_description`, `tags`, `created_at`) VALUES
(9, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '15542700986-min.jpg', 'www.geniusocean.com', 49, 1, 'b1,b2,b3', 'Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level.', 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-02-06 09:53:41'),
(10, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '15542700902-min.jpg', 'www.geniusocean.com', 20, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-03-06 09:54:21'),
(12, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '15542700821-min.jpg', 'www.geniusocean.com', 25, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-04-06 22:04:20'),
(13, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '15542700676-min.jpg', 'www.geniusocean.com', 63, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-05-06 22:04:36'),
(14, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700595-min.jpg', 'www.geniusocean.com', 9, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-06-03 06:02:30'),
(15, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700464-min.jpg', 'www.geniusocean.com', 12, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-07-03 06:02:53'),
(16, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700383-min.jpg', 'www.geniusocean.com', 12, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-08-03 06:03:14'),
(17, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700322-min.jpg', 'www.geniusocean.com', 57, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:37'),
(18, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '173913653415542699136-min.jpg', 'www.geniusocean.com', 163, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:59'),
(20, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542699136-min.jpg', 'www.geniusocean.com', 17, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-08-03 06:03:14'),
(21, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542699045-min.jpg', 'www.geniusocean.com', 43, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:37'),
(22, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542698954-min.jpg', 'www.geniusocean.com', 79, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:59'),
(23, 7, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542698893-min.jpg', 'www.geniusocean.com', 12, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-08-03 06:03:14'),
(24, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542698832-min.jpg', 'www.geniusocean.com', 41, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:37');
INSERT INTO `blogs` (`id`, `category_id`, `title`, `details`, `photo`, `source`, `views`, `status`, `meta_tag`, `meta_description`, `tags`, `created_at`) VALUES
(25, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '173913654215542699136-min.jpg', 'www.geniusocean.com', 50, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:59');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`) VALUES
(2, 'Oil & gas', 'oil-and-gas'),
(3, 'Manufacturing', 'manufacturing'),
(4, 'Chemical Research', 'chemical_research'),
(5, 'Agriculture', 'agriculture'),
(6, 'Mechanical', 'mechanical'),
(7, 'Entrepreneurs', 'entrepreneurs'),
(8, 'Technology', 'technology');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `status`, `photo`, `is_featured`, `image`) VALUES
(4, 'Electronic', 'electric', 1, '1557807287light.png', 1, '1568709131f6.jpg'),
(5, 'Fashion & Beauty', 'fashion-and-Beauty', 1, '1557807279fashion.png', 1, '1568709123f1.jpg'),
(6, 'Camera & Photo', 'camera-and-photo', 1, '1557807264camera.png', 1, '1568709110f2.jpg'),
(7, 'Smart Phone & Table', 'smart-phone-and-table', 1, '1557377810mobile.png', 1, '1568709597f4.jpg'),
(8, 'Sport & Outdoor', 'sport-and-Outdoor', 1, '1557807258sports.png', 1, '1568709577f8.jpg'),
(9, 'Jewelry & Watches', 'jewelry-and-watches', 1, '1557807252furniture.png', 1, '1568709077f7.jpg'),
(10, 'Health & Beauty', 'health-and-beauty', 1, '1557807228trends.png', 1, '1568709067f3.jpg'),
(11, 'Books & Office', 'books-and-office', 1, '1557377917bags.png', 1, '1568709050f8.jpg'),
(12, 'Toys & Hobbies', 'toys-and-hobbies', 1, '1557807214sports.png', 1, '1568709042f9.jpg'),
(13, 'Books', 'books', 1, '1557807208bags.png', 1, '1568709037f10.jpg'),
(15, 'Automobiles & Motorcycles', 'automobiles-and-motorcycles', 1, '1568708648motor.car.png', 1, '1568709031f11.jpg'),
(16, 'Home decoration & Appliance', 'Home-decoration-and-Appliance', 1, '1568708757home.png', 1, '1568709027f12.jpg'),
(17, 'Portable & Personal Electronics', 'portable-and-personal-electronics', 1, '1568878538electronic.jpg', 0, NULL),
(18, 'Outdoor, Recreation & Fitness', 'Outdoor-Recreation-and-Fitness', 1, '1568878596home.jpg', 0, NULL),
(19, 'Surveillance Safety & Security', 'Surveillance-Safety-and-Security', 1, NULL, 0, NULL),
(20, 'Demo', 'Demo', 1, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `childcategories`
--

CREATE TABLE `childcategories` (
  `id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `childcategories`
--

INSERT INTO `childcategories` (`id`, `subcategory_id`, `name`, `slug`, `status`) VALUES
(1, 2, 'LCD TV', 'lcd-tv', 1),
(2, 2, 'LED TV', 'led-tv', 1),
(3, 2, 'Curved TV', 'curved-tv', 1),
(4, 2, 'Plasma TV', 'plasma-tv', 1),
(5, 3, 'Top Freezer', 'top-freezer', 1),
(6, 3, 'Side-by-Side', 'side-by-side', 1),
(7, 3, 'Counter-Depth', 'counter-depth', 1),
(8, 3, 'Mini Fridge', 'mini-fridge', 1),
(9, 4, 'Front Loading', 'front-loading', 1),
(10, 4, 'Top Loading', 'top-loading', 1),
(11, 4, 'Washer Dryer Combo', 'washer-dryer-combo', 1),
(12, 4, 'Laundry Center', 'laundry-center', 1),
(13, 5, 'Central Air', 'central-air', 1),
(14, 5, 'Window Air', 'window-air', 1),
(15, 5, 'Portable Air', 'portable-air', 1),
(16, 5, 'Hybrid Air', 'hybrid-air', 1),
(17, 18, 'Demo2', 'demo2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(11) NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_user` int(11) NOT NULL,
  `recieved_user` int(11) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `subject`, `sent_user`, `recieved_user`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Hi', 36, 13, 'Hi', '2022-10-06 19:11:23', '2022-10-06 19:11:23');

-- --------------------------------------------------------

--
-- Table structure for table `counters`
--

CREATE TABLE `counters` (
  `id` int(11) NOT NULL,
  `type` enum('referral','browser') NOT NULL DEFAULT 'referral',
  `referral` varchar(255) DEFAULT NULL,
  `total_count` int(11) NOT NULL DEFAULT 0,
  `todays_count` int(11) NOT NULL DEFAULT 0,
  `today` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `counters`
--

INSERT INTO `counters` (`id`, `type`, `referral`, `total_count`, `todays_count`, `today`) VALUES
(1, 'referral', 'www.facebook.com', 16, 0, NULL),
(2, 'referral', 'geniusocean.com', 2, 0, NULL),
(3, 'browser', 'Windows 10', 1923, 0, NULL),
(4, 'browser', 'Linux', 399, 0, NULL),
(5, 'browser', 'Unknown OS Platform', 4205, 0, NULL),
(6, 'browser', 'Windows 7', 522, 0, NULL),
(7, 'referral', 'yandex.ru', 22, 0, NULL),
(8, 'browser', 'Windows 8.1', 547, 0, NULL),
(9, 'referral', 'www.google.com', 56, 0, NULL),
(10, 'browser', 'Android', 2059, 0, NULL),
(11, 'browser', 'Mac OS X', 705, 0, NULL),
(12, 'referral', 'l.facebook.com', 438, 0, NULL),
(13, 'referral', 'codecanyon.net', 6, 0, NULL),
(14, 'browser', 'Windows XP', 5, 0, NULL),
(15, 'browser', 'Windows 8', 3, 0, NULL),
(16, 'browser', 'iPad', 6, 0, NULL),
(17, 'browser', 'Ubuntu', 43, 0, NULL),
(18, 'browser', 'iPhone', 134, 0, NULL),
(19, 'referral', 'm.facebook.com', 786, 0, NULL),
(20, 'referral', 'lm.facebook.com', 18, 0, NULL),
(21, 'referral', 'itnayeem.com.bd', 1, 0, NULL),
(22, 'referral', 'org.telegram.messenger', 2, 0, NULL),
(23, 'referral', 'facebook.com', 2, 0, NULL),
(24, 'referral', 'com.google.android.googlequicksearchbox', 1, 0, NULL),
(25, 'referral', 'oninhost.com', 2, 0, NULL),
(26, 'referral', NULL, 1, 0, NULL),
(27, 'browser', 'Windows Vista', 1, 0, NULL),
(28, 'referral', 'shadhinchatbot.com', 1, 0, NULL),
(29, 'referral', 'mail.google.com', 1, 0, NULL),
(30, 'referral', 'itnayeem.com.bd', 1, 0, NULL),
(31, 'referral', 'www.messenger.com', 3, 0, NULL),
(32, 'referral', 'www.localhost', 3, 0, NULL),
(33, 'referral', 'l.messenger.com', 3, 0, NULL),
(34, 'referral', 'www.google.ie', 1, 0, NULL),
(35, 'referral', 'web.whatsapp.com', 2, 0, NULL),
(36, 'referral', 'server.blazingserver.cyou', 8, 0, NULL),
(37, 'referral', '5.9.227.66', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country_name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AL', 'Albania'),
(3, 'DZ', 'Algeria'),
(4, 'DS', 'American Samoa'),
(5, 'AD', 'Andorra'),
(6, 'AO', 'Angola'),
(7, 'AI', 'Anguilla'),
(8, 'AQ', 'Antarctica'),
(9, 'AG', 'Antigua and Barbuda'),
(10, 'AR', 'Argentina'),
(11, 'AM', 'Armenia'),
(12, 'AW', 'Aruba'),
(13, 'AU', 'Australia'),
(14, 'AT', 'Austria'),
(15, 'AZ', 'Azerbaijan'),
(16, 'BS', 'Bahamas'),
(17, 'BH', 'Bahrain'),
(18, 'BD', 'Bangladesh'),
(19, 'BB', 'Barbados'),
(20, 'BY', 'Belarus'),
(21, 'BE', 'Belgium'),
(22, 'BZ', 'Belize'),
(23, 'BJ', 'Benin'),
(24, 'BM', 'Bermuda'),
(25, 'BT', 'Bhutan'),
(26, 'BO', 'Bolivia'),
(27, 'BA', 'Bosnia and Herzegovina'),
(28, 'BW', 'Botswana'),
(29, 'BV', 'Bouvet Island'),
(30, 'BR', 'Brazil'),
(31, 'IO', 'British Indian Ocean Territory'),
(32, 'BN', 'Brunei Darussalam'),
(33, 'BG', 'Bulgaria'),
(34, 'BF', 'Burkina Faso'),
(35, 'BI', 'Burundi'),
(36, 'KH', 'Cambodia'),
(37, 'CM', 'Cameroon'),
(38, 'CA', 'Canada'),
(39, 'CV', 'Cape Verde'),
(40, 'KY', 'Cayman Islands'),
(41, 'CF', 'Central African Republic'),
(42, 'TD', 'Chad'),
(43, 'CL', 'Chile'),
(44, 'CN', 'China'),
(45, 'CX', 'Christmas Island'),
(46, 'CC', 'Cocos (Keeling) Islands'),
(47, 'CO', 'Colombia'),
(48, 'KM', 'Comoros'),
(49, 'CD', 'Democratic Republic of the Congo'),
(50, 'CG', 'Republic of Congo'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'HR', 'Croatia (Hrvatska)'),
(54, 'CU', 'Cuba'),
(55, 'CY', 'Cyprus'),
(56, 'CZ', 'Czech Republic'),
(57, 'DK', 'Denmark'),
(58, 'DJ', 'Djibouti'),
(59, 'DM', 'Dominica'),
(60, 'DO', 'Dominican Republic'),
(61, 'TP', 'East Timor'),
(62, 'EC', 'Ecuador'),
(63, 'EG', 'Egypt'),
(64, 'SV', 'El Salvador'),
(65, 'GQ', 'Equatorial Guinea'),
(66, 'ER', 'Eritrea'),
(67, 'EE', 'Estonia'),
(68, 'ET', 'Ethiopia'),
(69, 'FK', 'Falkland Islands (Malvinas)'),
(70, 'FO', 'Faroe Islands'),
(71, 'FJ', 'Fiji'),
(72, 'FI', 'Finland'),
(73, 'FR', 'France'),
(74, 'FX', 'France, Metropolitan'),
(75, 'GF', 'French Guiana'),
(76, 'PF', 'French Polynesia'),
(77, 'TF', 'French Southern Territories'),
(78, 'GA', 'Gabon'),
(79, 'GM', 'Gambia'),
(80, 'GE', 'Georgia'),
(81, 'DE', 'Germany'),
(82, 'GH', 'Ghana'),
(83, 'GI', 'Gibraltar'),
(84, 'GK', 'Guernsey'),
(85, 'GR', 'Greece'),
(86, 'GL', 'Greenland'),
(87, 'GD', 'Grenada'),
(88, 'GP', 'Guadeloupe'),
(89, 'GU', 'Guam'),
(90, 'GT', 'Guatemala'),
(91, 'GN', 'Guinea'),
(92, 'GW', 'Guinea-Bissau'),
(93, 'GY', 'Guyana'),
(94, 'HT', 'Haiti'),
(95, 'HM', 'Heard and Mc Donald Islands'),
(96, 'HN', 'Honduras'),
(97, 'HK', 'Hong Kong'),
(98, 'HU', 'Hungary'),
(99, 'IS', 'Iceland'),
(100, 'IN', 'India'),
(101, 'IM', 'Isle of Man'),
(102, 'ID', 'Indonesia'),
(103, 'IR', 'Iran (Islamic Republic of)'),
(104, 'IQ', 'Iraq'),
(105, 'IE', 'Ireland'),
(106, 'IL', 'Israel'),
(107, 'IT', 'Italy'),
(108, 'CI', 'Ivory Coast'),
(109, 'JE', 'Jersey'),
(110, 'JM', 'Jamaica'),
(111, 'JP', 'Japan'),
(112, 'JO', 'Jordan'),
(113, 'KZ', 'Kazakhstan'),
(114, 'KE', 'Kenya'),
(115, 'KI', 'Kiribati'),
(116, 'KP', 'Korea, Democratic People\'s Republic of'),
(117, 'KR', 'Korea, Republic of'),
(118, 'XK', 'Kosovo'),
(119, 'KW', 'Kuwait'),
(120, 'KG', 'Kyrgyzstan'),
(121, 'LA', 'Lao People\'s Democratic Republic'),
(122, 'LV', 'Latvia'),
(123, 'LB', 'Lebanon'),
(124, 'LS', 'Lesotho'),
(125, 'LR', 'Liberia'),
(126, 'LY', 'Libyan Arab Jamahiriya'),
(127, 'LI', 'Liechtenstein'),
(128, 'LT', 'Lithuania'),
(129, 'LU', 'Luxembourg'),
(130, 'MO', 'Macau'),
(131, 'MK', 'North Macedonia'),
(132, 'MG', 'Madagascar'),
(133, 'MW', 'Malawi'),
(134, 'MY', 'Malaysia'),
(135, 'MV', 'Maldives'),
(136, 'ML', 'Mali'),
(137, 'MT', 'Malta'),
(138, 'MH', 'Marshall Islands'),
(139, 'MQ', 'Martinique'),
(140, 'MR', 'Mauritania'),
(141, 'MU', 'Mauritius'),
(142, 'TY', 'Mayotte'),
(143, 'MX', 'Mexico'),
(144, 'FM', 'Micronesia, Federated States of'),
(145, 'MD', 'Moldova, Republic of'),
(146, 'MC', 'Monaco'),
(147, 'MN', 'Mongolia'),
(148, 'ME', 'Montenegro'),
(149, 'MS', 'Montserrat'),
(150, 'MA', 'Morocco'),
(151, 'MZ', 'Mozambique'),
(152, 'MM', 'Myanmar'),
(153, 'NA', 'Namibia'),
(154, 'NR', 'Nauru'),
(155, 'NP', 'Nepal'),
(156, 'NL', 'Netherlands'),
(157, 'AN', 'Netherlands Antilles'),
(158, 'NC', 'New Caledonia'),
(159, 'NZ', 'New Zealand'),
(160, 'NI', 'Nicaragua'),
(161, 'NE', 'Niger'),
(162, 'NG', 'Nigeria'),
(163, 'NU', 'Niue'),
(164, 'NF', 'Norfolk Island'),
(165, 'MP', 'Northern Mariana Islands'),
(166, 'NO', 'Norway'),
(167, 'OM', 'Oman'),
(168, 'PK', 'Pakistan'),
(169, 'PW', 'Palau'),
(170, 'PS', 'Palestine'),
(171, 'PA', 'Panama'),
(172, 'PG', 'Papua New Guinea'),
(173, 'PY', 'Paraguay'),
(174, 'PE', 'Peru'),
(175, 'PH', 'Philippines'),
(176, 'PN', 'Pitcairn'),
(177, 'PL', 'Poland'),
(178, 'PT', 'Portugal'),
(179, 'PR', 'Puerto Rico'),
(180, 'QA', 'Qatar'),
(181, 'RE', 'Reunion'),
(182, 'RO', 'Romania'),
(183, 'RU', 'Russian Federation'),
(184, 'RW', 'Rwanda'),
(185, 'KN', 'Saint Kitts and Nevis'),
(186, 'LC', 'Saint Lucia'),
(187, 'VC', 'Saint Vincent and the Grenadines'),
(188, 'WS', 'Samoa'),
(189, 'SM', 'San Marino'),
(190, 'ST', 'Sao Tome and Principe'),
(191, 'SA', 'Saudi Arabia'),
(192, 'SN', 'Senegal'),
(193, 'RS', 'Serbia'),
(194, 'SC', 'Seychelles'),
(195, 'SL', 'Sierra Leone'),
(196, 'SG', 'Singapore'),
(197, 'SK', 'Slovakia'),
(198, 'SI', 'Slovenia'),
(199, 'SB', 'Solomon Islands'),
(200, 'SO', 'Somalia'),
(201, 'ZA', 'South Africa'),
(202, 'GS', 'South Georgia South Sandwich Islands'),
(203, 'SS', 'South Sudan'),
(204, 'ES', 'Spain'),
(205, 'LK', 'Sri Lanka'),
(206, 'SH', 'St. Helena'),
(207, 'PM', 'St. Pierre and Miquelon'),
(208, 'SD', 'Sudan'),
(209, 'SR', 'Suriname'),
(210, 'SJ', 'Svalbard and Jan Mayen Islands'),
(211, 'SZ', 'Swaziland'),
(212, 'SE', 'Sweden'),
(213, 'CH', 'Switzerland'),
(214, 'SY', 'Syrian Arab Republic'),
(215, 'TW', 'Taiwan'),
(216, 'TJ', 'Tajikistan'),
(217, 'TZ', 'Tanzania, United Republic of'),
(218, 'TH', 'Thailand'),
(219, 'TG', 'Togo'),
(220, 'TK', 'Tokelau'),
(221, 'TO', 'Tonga'),
(222, 'TT', 'Trinidad and Tobago'),
(223, 'TN', 'Tunisia'),
(224, 'TR', 'Turkey'),
(225, 'TM', 'Turkmenistan'),
(226, 'TC', 'Turks and Caicos Islands'),
(227, 'TV', 'Tuvalu'),
(228, 'UG', 'Uganda'),
(229, 'UA', 'Ukraine'),
(230, 'AE', 'United Arab Emirates'),
(231, 'GB', 'United Kingdom'),
(232, 'US', 'United States'),
(233, 'UM', 'United States minor outlying islands'),
(234, 'UY', 'Uruguay'),
(235, 'UZ', 'Uzbekistan'),
(236, 'VU', 'Vanuatu'),
(237, 'VA', 'Vatican City State'),
(238, 'VE', 'Venezuela'),
(239, 'VN', 'Vietnam'),
(240, 'VG', 'Virgin Islands (British)'),
(241, 'VI', 'Virgin Islands (U.S.)'),
(242, 'WF', 'Wallis and Futuna Islands'),
(243, 'EH', 'Western Sahara'),
(244, 'YE', 'Yemen'),
(245, 'ZM', 'Zambia'),
(246, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `price` double NOT NULL,
  `times` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `used` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `price`, `times`, `used`, `status`, `start_date`, `end_date`) VALUES
(1, 'eqwe', 1, 12.22, '990', 18, 1, '2019-01-15', '2026-08-20'),
(2, 'sdsdsasd', 0, 11, NULL, 2, 1, '2019-05-23', '2022-05-26'),
(3, 'werwd', 0, 22, NULL, 3, 1, '2019-05-23', '2023-06-08'),
(4, 'asdasd', 1, 23.5, NULL, 1, 1, '2019-05-23', '2020-05-28'),
(5, 'kopakopakopa', 0, 40, NULL, 3, 1, '2019-05-23', '2032-05-20'),
(6, 'rererere', 1, 9, '665', 1, 1, '2019-05-23', '2022-05-26'),
(7, 'Ed offer', 0, 10, '10', 0, 1, '2024-03-18', '2024-03-25');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sign` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `sign`, `value`, `is_default`) VALUES
(1, 'USD', '$', 1, 0),
(4, 'BDT', '৳', 85, 1);

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `currency` blob DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT 0,
  `currency_value` double DEFAULT 0,
  `method` varchar(255) DEFAULT NULL,
  `txnid` varchar(255) DEFAULT NULL,
  `flutter_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `currency`, `currency_code`, `amount`, `currency_value`, `method`, `txnid`, `flutter_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 22, 0x5224, 'BRL', 2.4875621890547, 4.02, 'MercadoPago', '1235324161', NULL, 1, '2021-04-01 05:00:42', '2021-04-01 05:00:42'),
(2, 13, 0x24, 'USD', 10, 1, 'Molly Payment', 'tr_g3Kc3sHWwb', NULL, 1, '2021-04-03 03:00:17', '2021-04-03 03:00:17'),
(3, 13, 0xe282a6, 'NGN', 0.02747864222533, 363.919, 'Paystack', '245249284', NULL, 1, '2021-04-03 03:01:03', '2021-04-03 03:01:03'),
(4, 13, 0x24, 'USD', 10, 1, 'Flutterwave', NULL, 'i16r1617440896', 0, '2021-04-03 03:08:16', '2021-04-03 03:08:16'),
(5, 13, 0x24, 'USD', 10, 1, 'Flutterwave', '2004551', 'Niim1617441161', 1, '2021-04-03 03:12:41', '2021-04-03 03:13:22'),
(6, 30, 0xe0a7b3, 'BDT', 5.8823529411765, 85, 'SSLCommerz', 'SSLCZ_TXN_626a60c1b5b64', NULL, 0, '2022-04-28 09:39:13', '2022-04-28 09:39:13'),
(7, 33, 0xe0a7b3, 'BDT', 1.1764705882353, 85, 'SSLCommerz', 'SSLCZ_TXN_6314ae0467e9f', NULL, 0, '2022-09-04 17:54:12', '2022-09-04 17:54:12'),
(8, 41, 0xe0a7b3, 'BDT', 5.8823529411765, 85, 'SSLCommerz', 'SSLCZ_TXN_6431c9e5761b6', NULL, 0, '2023-04-09 00:09:09', '2023-04-09 00:09:09');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `email_type` varchar(255) DEFAULT NULL,
  `email_subject` mediumtext DEFAULT NULL,
  `email_body` longtext DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `email_type`, `email_subject`, `email_body`, `status`) VALUES
(1, 'new_order', 'Your Order Placed Successfully', '<p>Hello {customer_name},<br>Your Order Number is {order_number}<br>Your order has been placed successfully</p>', 1),
(2, 'new_registration', 'Welcome To Royal Commerce', '<p>Hello {customer_name},<br>You have successfully registered to {website_title}, We wish you will have a wonderful experience using our service.</p><p>Thank You<br></p>', 1),
(3, 'vendor_accept', 'Your Vendor Account Activated', '<p>Hello {customer_name},<br>Your Vendor Account Activated Successfully. Please Login to your account and build your own shop.</p><p>Thank You<br></p>', 1),
(4, 'subscription_warning', 'Your subscrption plan will end after five days', '<p>Hello {customer_name},<br>Your subscription plan duration will end after five days. Please renew your plan otherwise all of your products will be deactivated.</p><p>Thank You<br></p>', 1),
(5, 'vendor_verification', 'Request for verification.', '<p>Hello {customer_name},<br>You are requested verify your account. Please send us photo of your passport.</p><p>Thank You<br></p>', 1),
(6, 'wallet_deposit', 'Balance Added to Your Account.', '<p>Hello {customer_name},<br>${deposit_amount} has been deposited in your account. Your current balance is ${wallet_balance}</p><p>Thank You<br></p>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `details` text NOT NULL,
  `status` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `title`, `details`, `status`) VALUES
(1, 'Right my front it wound cause fully', '<span style=\"color: rgb(70, 85, 65); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 1),
(3, 'Man particular insensible celebrated', '<span style=\"color: rgb(70, 85, 65); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 1),
(4, 'Civilly why how end viewing related', '<span style=\"color: rgb(70, 85, 65); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 0),
(5, 'Six started far placing saw respect', '<span style=\"color: rgb(70, 85, 65); font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 0),
(6, 'She jointure goodness interest debat', '<div style=\"text-align: center;\"><div style=\"text-align: center;\"><br></div></div><div style=\"text-align: center;\"><span style=\"color: rgb(70, 85, 65); font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.<br></span></div>', 0);

-- --------------------------------------------------------

--
-- Table structure for table `favorite_sellers`
--

CREATE TABLE `favorite_sellers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `favorite_sellers`
--

INSERT INTO `favorite_sellers` (`id`, `user_id`, `vendor_id`) VALUES
(1, 22, 13),
(2, 41, 13);

-- --------------------------------------------------------

--
-- Table structure for table `featured_banners`
--

CREATE TABLE `featured_banners` (
  `id` int(11) NOT NULL,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `featured_links`
--

CREATE TABLE `featured_links` (
  `id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `featured_links`
--

INSERT INTO `featured_links` (`id`, `name`, `link`, `photo`) VALUES
(12, 'Electronic', 'https://itnayeem.com.bd/category/electric', '16458755691557807287light.png'),
(13, 'Fashion and Beauty', 'https://itnayeem.com.bd/category/fashion-and-Beauty', '16458756581557807279fashion.png'),
(14, 'Camera and Photo', 'https://itnayeem.com.bd/category/camera-and-photo', '16458757291557807264camera.png'),
(15, 'Smart and Phone', 'https://itnayeem.com.bd/category/smart-phone-and-table', '1571287404flink.png'),
(16, 'Sports and Oudoor', 'https://itnayeem.com.bd/category/sport-and-Outdoor', '16458758561557807258sports.png'),
(17, 'Jewelery and Watch', 'https://itnayeem.com.bd/category/jewelry-and-watches', '16458759681557807252furniture.png'),
(18, 'Kids and Toys', 'https://itnayeem.com.bd/category/toys-and-hobbies', '16458760351557807258sports.png'),
(19, 'Book and Offices', 'https://itnayeem.com.bd/category/books-and-office', '16458761151557377917bags.png'),
(20, 'Auto Mobile & Motor Bike', 'https://itnayeem.com.bd/category/automobiles-and-motorcycles', '16458762261568708648motor.car.png'),
(21, 'Home & Decor', 'https://itnayeem.com.bd/category/Home-decoration-and-Appliance', '16458763151568708648motor.car.png');

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `product_id`, `photo`) VALUES
(6, 93, '156801646314-min.jpg'),
(7, 93, '156801646315-min.jpg'),
(8, 93, '156801646316-min.jpg'),
(22, 129, '15680254328Ei8T0MB.jpg'),
(23, 129, '1568025432wRmpve8d.jpg'),
(24, 129, '1568025432kkRYzLsF.jpg'),
(25, 129, '1568025432zxQBe6Gk.jpg'),
(26, 128, '1568025537sJbDPnFk.jpg'),
(27, 128, '1568025537NBmHxJOz.jpg'),
(28, 128, '1568025537hxqeFbS8.jpg'),
(29, 128, '1568025538zK3tJpmL.jpg'),
(34, 126, '1568025693kKLReNYO.jpg'),
(35, 126, '1568025694Iv3pkz1q.jpg'),
(36, 126, '1568025694T8HhdLVS.jpg'),
(37, 126, '1568025695vTdg7ndt.jpg'),
(38, 125, '15680257894Waz2tuN.jpg'),
(39, 125, '1568025789vd0P4TBv.jpg'),
(40, 125, '15680257899bih5sGh.jpg'),
(41, 125, '156802578924sLIgzl.jpg'),
(42, 124, '1568025825cC2Pmuit.jpg'),
(43, 124, '1568025825EACzLFld.jpg'),
(44, 124, '1568025825MfCyCqtD.jpg'),
(45, 124, '15680258252yabMeAz.jpg'),
(46, 123, '15680258512fKQla5g.jpg'),
(47, 123, '1568025851pIjl0mWp.jpg'),
(48, 123, '1568025851tQw7JXXG.jpg'),
(49, 123, '1568025851ewjtSDkZ.jpg'),
(50, 96, '1568025891wWAAbOjc.jpg'),
(51, 96, '1568025891fyMNeXRy.jpg'),
(52, 96, '1568025891OdV64Tw1.jpg'),
(53, 96, '1568025891xQF7Zufe.jpg'),
(58, 102, '1568026307THs0VQQU.jpg'),
(59, 102, '1568026307jvCscHth.jpg'),
(60, 102, '1568026307g5xMFdx3.jpg'),
(61, 102, '1568026307Z3at0HEM.jpg'),
(62, 101, '1568026331Y6UMgMcI.jpg'),
(63, 101, '1568026331xZbT4OWG.jpg'),
(64, 101, '1568026331y7eIFJXZ.jpg'),
(65, 101, '1568026331i2wH8RI0.jpg'),
(66, 100, '1568026374xCTjQYZ8.jpg'),
(67, 100, '1568026374DzmvqA9d.jpg'),
(68, 100, '1568026374OEH73u5X.jpg'),
(69, 100, '1568026374vZhqRv8c.jpg'),
(70, 99, '15680264120LdBSU1v.jpg'),
(71, 99, '1568026412eMjsI940.jpg'),
(72, 99, '1568026412GFjvHiZv.jpg'),
(73, 99, '15680264122fwGi20d.jpg'),
(78, 97, '1568026469hSlmBpzE.jpg'),
(79, 97, '15680264697AI8LicQ.jpg'),
(80, 97, '15680264691xyFt5Y6.jpg'),
(81, 97, '1568026469dC3hrMz0.jpg'),
(86, 109, '1568026737EBGSE78G.jpg'),
(87, 109, '1568026737B8hO1RRr.jpg'),
(88, 109, '1568026737tf0rwVoz.jpg'),
(89, 109, '1568026737GGIPSqYo.jpg'),
(95, 107, '1568026797FFNrNPxK.jpg'),
(96, 107, '1568026797UwY9ZLfQ.jpg'),
(97, 107, '1568026797Kl6eZLx5.jpg'),
(98, 107, '1568026797h3R48VaO.jpg'),
(99, 107, '15680267989kXwH40I.jpg'),
(100, 106, '1568026836ErM5FJxg.jpg'),
(101, 106, '1568026836VLrxIk0u.jpg'),
(102, 106, '1568026836lgLuMV6p.jpg'),
(103, 106, '1568026836JBUTQX8v.jpg'),
(104, 105, '1568026861YorsLvUa.jpg'),
(105, 105, '1568026861PikoX1Qb.jpg'),
(106, 105, '1568026861SBJqjw66.jpg'),
(107, 105, '1568026861WYh54Arp.jpg'),
(108, 104, '1568026885rmo0LDoo.jpg'),
(109, 104, '15680268851m939o7O.jpg'),
(110, 104, '1568026885fVXYCGKu.jpg'),
(111, 104, '1568026885GDRL3thY.jpg'),
(112, 103, '1568026903LbVQUxIr.jpg'),
(113, 103, '1568026914IpRVYDV4.jpg'),
(114, 103, '15680269141gKO8x5X.jpg'),
(115, 103, '1568026914Q938xXM2.jpg'),
(116, 93, '1568026950y7ihS4wE.jpg'),
(125, 122, '1568027503rFK94cnU.jpg'),
(126, 122, '1568027503i1X2FtIi.jpg'),
(127, 122, '156802750316jxawoZ.jpg'),
(128, 122, '1568027503QRBf290F.jpg'),
(129, 121, '1568027539SQqUc8Bu.jpg'),
(130, 121, '1568027539Zs5OTzjq.jpg'),
(131, 121, '1568027539C45VRZq1.jpg'),
(132, 121, '15680275398ovCzFnJ.jpg'),
(133, 120, '1568027565bJgX744G.jpg'),
(134, 120, '1568027565j0RPFUgX.jpg'),
(135, 120, '1568027565QGi6Lhyo.jpg'),
(136, 120, '15680275658MAY3VKp.jpg'),
(137, 119, '1568027610p9R6ivC6.jpg'),
(138, 119, '1568027610t2Aq7E5D.jpg'),
(139, 119, '1568027611ikz4n0fx.jpg'),
(140, 119, '15680276117BLgrCub.jpg'),
(141, 118, '156802763634t0c8tG.jpg'),
(142, 118, '1568027636fuJplSf3.jpg'),
(143, 118, '1568027636MXcgCQHU.jpg'),
(144, 118, '1568027636lfexGTpt.jpg'),
(145, 117, '1568027665rFHWlsAJ.jpg'),
(146, 117, '15680276655LPktA9k.jpg'),
(147, 117, '1568027665vcNWWq3u.jpg'),
(148, 117, '1568027665gQnqKhCw.jpg'),
(149, 116, '1568027692FPQpwtWN.jpg'),
(150, 116, '1568027692zBaGjOIC.jpg'),
(151, 116, '1568027692UXpDx63F.jpg'),
(152, 116, '1568027692KdIWbIGK.jpg'),
(153, 95, '1568027743xS8gHocM.jpg'),
(154, 95, '1568027743aVUOljdD.jpg'),
(155, 95, '156802774327OOA1Zj.jpg'),
(156, 95, '1568027743kGBx6mxa.jpg'),
(172, 130, '1568029084hQT5ZO0j.jpg'),
(173, 130, '1568029084ncGXxQzN.jpg'),
(174, 130, '1568029084b0OonKFy.jpg'),
(175, 130, '15680290857TD4iOWP.jpg'),
(180, 114, '1568029158brS7xQCe.jpg'),
(181, 114, '1568029158QlC0tg5a.jpg'),
(182, 114, '1568029158RrN4AEtQ.jpg'),
(187, 112, '1568029210JSAwjRPr.jpg'),
(188, 112, '1568029210EiVUkcK6.jpg'),
(189, 112, '1568029210fJSo5hya.jpg'),
(190, 112, '15680292101vCcGfq8.jpg'),
(191, 111, '1568029272lB0JETcn.jpg'),
(192, 111, '1568029272wF3ldKgv.jpg'),
(193, 111, '1568029272NI33ExCu.jpg'),
(194, 111, '15680292724TXrpokz.jpg'),
(199, 135, '15698200931.jpg'),
(201, 182, '17391370463BUbU16l.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `generalsettings`
--

CREATE TABLE `generalsettings` (
  `id` int(11) NOT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `favicon` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `header_email` text DEFAULT NULL,
  `header_phone` text DEFAULT NULL,
  `footer` text NOT NULL,
  `copyright` text NOT NULL,
  `colors` varchar(191) DEFAULT NULL,
  `loader` varchar(191) NOT NULL,
  `admin_loader` varchar(191) DEFAULT NULL,
  `is_talkto` tinyint(1) NOT NULL DEFAULT 1,
  `talkto` text DEFAULT NULL,
  `is_language` tinyint(1) NOT NULL DEFAULT 1,
  `is_loader` tinyint(1) NOT NULL DEFAULT 1,
  `map_key` text DEFAULT NULL,
  `is_disqus` tinyint(1) NOT NULL DEFAULT 0,
  `disqus` longtext DEFAULT NULL,
  `is_contact` tinyint(1) NOT NULL DEFAULT 0,
  `is_faq` tinyint(1) NOT NULL DEFAULT 0,
  `guest_checkout` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_check` tinyint(1) NOT NULL DEFAULT 0,
  `cod_check` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_key` text DEFAULT NULL,
  `stripe_secret` text DEFAULT NULL,
  `currency_format` tinyint(1) NOT NULL DEFAULT 0,
  `withdraw_fee` double NOT NULL DEFAULT 0,
  `withdraw_charge` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `shipping_cost` double NOT NULL DEFAULT 0,
  `mail_engine` varchar(191) DEFAULT NULL,
  `smtp_host` varchar(191) DEFAULT NULL,
  `smtp_port` varchar(191) DEFAULT NULL,
  `smtp_user` varchar(191) DEFAULT NULL,
  `smtp_pass` varchar(191) DEFAULT NULL,
  `from_email` varchar(191) DEFAULT NULL,
  `from_name` varchar(191) DEFAULT NULL,
  `is_smtp` tinyint(1) NOT NULL DEFAULT 0,
  `is_comment` tinyint(1) NOT NULL DEFAULT 1,
  `is_currency` tinyint(1) NOT NULL DEFAULT 1,
  `add_cart` text DEFAULT NULL,
  `out_stock` text DEFAULT NULL,
  `add_wish` text DEFAULT NULL,
  `already_wish` text DEFAULT NULL,
  `wish_remove` text DEFAULT NULL,
  `add_compare` text DEFAULT NULL,
  `already_compare` text DEFAULT NULL,
  `compare_remove` text DEFAULT NULL,
  `color_change` text DEFAULT NULL,
  `coupon_found` text DEFAULT NULL,
  `no_coupon` text DEFAULT NULL,
  `already_coupon` text DEFAULT NULL,
  `order_title` text DEFAULT NULL,
  `order_text` text DEFAULT NULL,
  `is_affilate` tinyint(1) NOT NULL DEFAULT 1,
  `affilate_charge` int(11) NOT NULL DEFAULT 0,
  `affilate_banner` text DEFAULT NULL,
  `already_cart` text DEFAULT NULL,
  `fixed_commission` double NOT NULL DEFAULT 0,
  `percentage_commission` double NOT NULL DEFAULT 0,
  `multiple_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `multiple_packaging` tinyint(4) NOT NULL DEFAULT 0,
  `vendor_ship_info` tinyint(1) NOT NULL DEFAULT 0,
  `reg_vendor` tinyint(1) NOT NULL DEFAULT 0,
  `cod_text` text DEFAULT NULL,
  `paypal_text` text DEFAULT NULL,
  `stripe_text` text DEFAULT NULL,
  `header_color` varchar(191) DEFAULT NULL,
  `footer_color` varchar(191) DEFAULT NULL,
  `copyright_color` varchar(191) DEFAULT NULL,
  `is_admin_loader` tinyint(1) NOT NULL DEFAULT 0,
  `menu_color` varchar(191) DEFAULT NULL,
  `menu_hover_color` varchar(191) DEFAULT NULL,
  `is_home` tinyint(1) NOT NULL DEFAULT 0,
  `is_verification_email` tinyint(1) NOT NULL DEFAULT 0,
  `instamojo_key` varchar(191) DEFAULT NULL,
  `instamojo_token` varchar(191) DEFAULT NULL,
  `instamojo_text` text DEFAULT NULL,
  `is_instamojo` tinyint(1) NOT NULL DEFAULT 0,
  `instamojo_sandbox` tinyint(1) NOT NULL DEFAULT 0,
  `is_paystack` tinyint(1) NOT NULL DEFAULT 0,
  `paystack_key` text DEFAULT NULL,
  `paystack_email` text DEFAULT NULL,
  `paystack_text` text DEFAULT NULL,
  `wholesell` int(11) NOT NULL DEFAULT 0,
  `is_capcha` tinyint(1) NOT NULL DEFAULT 0,
  `error_banner` varchar(191) DEFAULT NULL,
  `is_popup` tinyint(1) NOT NULL DEFAULT 0,
  `popup_title` text DEFAULT NULL,
  `popup_text` text DEFAULT NULL,
  `popup_background` text DEFAULT NULL,
  `invoice_logo` varchar(191) DEFAULT NULL,
  `user_image` varchar(191) DEFAULT NULL,
  `vendor_color` varchar(191) DEFAULT NULL,
  `is_secure` tinyint(1) NOT NULL DEFAULT 0,
  `is_report` tinyint(1) NOT NULL,
  `paypal_check` tinyint(1) DEFAULT 0,
  `paypal_client_id` text DEFAULT NULL,
  `paypal_client_secret` text DEFAULT NULL,
  `paypal_sandbox_check` tinyint(4) DEFAULT 2,
  `footer_logo` text DEFAULT NULL,
  `email_encryption` varchar(191) DEFAULT NULL,
  `paytm_merchant` text DEFAULT NULL,
  `paytm_secret` text DEFAULT NULL,
  `paytm_website` text DEFAULT NULL,
  `paytm_industry` text DEFAULT NULL,
  `is_paytm` int(11) NOT NULL DEFAULT 1,
  `paytm_text` text DEFAULT NULL,
  `paytm_mode` enum('sandbox','live') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `is_molly` tinyint(1) NOT NULL DEFAULT 0,
  `molly_key` text DEFAULT NULL,
  `molly_text` text DEFAULT NULL,
  `is_razorpay` int(11) NOT NULL DEFAULT 1,
  `razorpay_key` text DEFAULT NULL,
  `razorpay_secret` text DEFAULT NULL,
  `razorpay_text` text DEFAULT NULL,
  `show_stock` tinyint(1) NOT NULL DEFAULT 0,
  `is_maintain` tinyint(1) NOT NULL DEFAULT 0,
  `maintain_text` text DEFAULT NULL,
  `is_authorize` tinyint(4) NOT NULL,
  `authorize_login_id` text NOT NULL,
  `authorize_txn_key` text NOT NULL,
  `authorize_text` text NOT NULL,
  `authorize_mode` enum('PRODUCTION','SANDBOX') NOT NULL,
  `is_mercado` tinyint(4) NOT NULL,
  `mercado_token` text NOT NULL,
  `mercado_publish_key` varchar(255) DEFAULT NULL,
  `mercado_text` text NOT NULL,
  `mercadopago_sandbox_check` tinyint(1) NOT NULL DEFAULT 1,
  `is_buy_now` tinyint(4) NOT NULL,
  `is_flutter` tinyint(4) NOT NULL DEFAULT 1,
  `flutter_public_key` text DEFAULT NULL,
  `flutter_text` text DEFAULT NULL,
  `flutter_secret` text DEFAULT NULL,
  `is_twocheckout` tinyint(1) NOT NULL DEFAULT 1,
  `twocheckout_private_key` text DEFAULT NULL,
  `twocheckout_seller_id` text DEFAULT NULL,
  `twocheckout_public_key` text DEFAULT NULL,
  `twocheckout_sandbox_check` tinyint(1) NOT NULL DEFAULT 1,
  `twocheckout_text` text DEFAULT NULL,
  `is_ssl` tinyint(1) NOT NULL DEFAULT 1,
  `ssl_sandbox_check` tinyint(1) NOT NULL DEFAULT 1,
  `ssl_store_id` text DEFAULT NULL,
  `ssl_store_password` text DEFAULT NULL,
  `ssl_text` text DEFAULT NULL,
  `is_voguepay` tinyint(1) NOT NULL DEFAULT 1,
  `vougepay_merchant_id` text DEFAULT NULL,
  `vougepay_developer_code` text DEFAULT NULL,
  `voguepay_text` text DEFAULT NULL,
  `version` varchar(40) DEFAULT NULL,
  `affilate_product` tinyint(1) NOT NULL DEFAULT 1,
  `decimal_separator` varchar(191) DEFAULT NULL,
  `thousand_separator` varchar(191) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `generalsettings`
--

INSERT INTO `generalsettings` (`id`, `logo`, `favicon`, `title`, `header_email`, `header_phone`, `footer`, `copyright`, `colors`, `loader`, `admin_loader`, `is_talkto`, `talkto`, `is_language`, `is_loader`, `map_key`, `is_disqus`, `disqus`, `is_contact`, `is_faq`, `guest_checkout`, `stripe_check`, `cod_check`, `stripe_key`, `stripe_secret`, `currency_format`, `withdraw_fee`, `withdraw_charge`, `tax`, `shipping_cost`, `mail_engine`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`, `from_email`, `from_name`, `is_smtp`, `is_comment`, `is_currency`, `add_cart`, `out_stock`, `add_wish`, `already_wish`, `wish_remove`, `add_compare`, `already_compare`, `compare_remove`, `color_change`, `coupon_found`, `no_coupon`, `already_coupon`, `order_title`, `order_text`, `is_affilate`, `affilate_charge`, `affilate_banner`, `already_cart`, `fixed_commission`, `percentage_commission`, `multiple_shipping`, `multiple_packaging`, `vendor_ship_info`, `reg_vendor`, `cod_text`, `paypal_text`, `stripe_text`, `header_color`, `footer_color`, `copyright_color`, `is_admin_loader`, `menu_color`, `menu_hover_color`, `is_home`, `is_verification_email`, `instamojo_key`, `instamojo_token`, `instamojo_text`, `is_instamojo`, `instamojo_sandbox`, `is_paystack`, `paystack_key`, `paystack_email`, `paystack_text`, `wholesell`, `is_capcha`, `error_banner`, `is_popup`, `popup_title`, `popup_text`, `popup_background`, `invoice_logo`, `user_image`, `vendor_color`, `is_secure`, `is_report`, `paypal_check`, `paypal_client_id`, `paypal_client_secret`, `paypal_sandbox_check`, `footer_logo`, `email_encryption`, `paytm_merchant`, `paytm_secret`, `paytm_website`, `paytm_industry`, `is_paytm`, `paytm_text`, `paytm_mode`, `is_molly`, `molly_key`, `molly_text`, `is_razorpay`, `razorpay_key`, `razorpay_secret`, `razorpay_text`, `show_stock`, `is_maintain`, `maintain_text`, `is_authorize`, `authorize_login_id`, `authorize_txn_key`, `authorize_text`, `authorize_mode`, `is_mercado`, `mercado_token`, `mercado_publish_key`, `mercado_text`, `mercadopago_sandbox_check`, `is_buy_now`, `is_flutter`, `flutter_public_key`, `flutter_text`, `flutter_secret`, `is_twocheckout`, `twocheckout_private_key`, `twocheckout_seller_id`, `twocheckout_public_key`, `twocheckout_sandbox_check`, `twocheckout_text`, `is_ssl`, `ssl_sandbox_check`, `ssl_store_id`, `ssl_store_password`, `ssl_text`, `is_voguepay`, `vougepay_merchant_id`, `vougepay_developer_code`, `voguepay_text`, `version`, `affilate_product`, `decimal_separator`, `thousand_separator`) VALUES
(1, '1709010995logo-all.png', '1709010696daraz-logo-AA537DF718-seeklogo.com.png', 'Daraz.com.bd', 'Info@example.com', '0123 456789', 'Daraz.com.bd  is a trusted virtual e-commerce marketplace. It is an online retailer that sells various products online from anywhere in Bangladesh. We have more than 25000 products. We sell them online. We have 30 days money-back guarantee service. We always work with fidelity. Thanks for staying with us.', 'COPYRIGHT © 2026 IT NAYEEM. All rights reserved. | Website Designed by: <a href=\"https://itnayeem.com.bd/\" target=\"_blank\">IT Nayeem</a>', '#ff6700', '1645870113animated.gif', '1645870116animated.gif', 0, NULL, 1, 0, 'AIzaSyDemoPlaceholderKey1234567890', 0, NULL, 1, 1, 1, 0, 1, 'pk_test_demo_placeholder_stripe_key', 'sk_test_demo_placeholder_stripe_secret', 0, 5, 5, 0, 5, 'smtp', NULL, NULL, NULL, NULL, 'geniustest11@gmail.com', 'GeniusTest', 1, 1, 1, 'Successfully Added To Cart', 'Out Of Stock', 'Add To Wishlist', 'Already Added To Wishlist', 'Successfully Removed From The Wishlist', 'Successfully Added To Compare', 'Already Added To Compare', 'Successfully Removed From The Compare', 'Successfully Changed The Color', 'Coupon Found', 'No Coupon Found', 'Coupon Already Applied', 'THANK YOU FOR YOUR PURCHASE.', 'We\'ll email you an order confirmation with details and tracking info.', 1, 8, '15587771131554048228onepiece.jpeg', 'Already Added To Cart', 5, 5, 1, 1, 1, 0, 'Pay with cash upon delivery.', 'Pay via your PayPal account.', 'Pay via your Credit Card.', '#ffffff', '#040404', '#442e93', 0, '#ff5500', '#02020c', 1, 0, 'test_172371aa837ae5cad6047dc3052', 'test_4ac5a785e25fc596b67dbc5c267', 'Pay via your Instamojo account.', 0, 0, 0, 'pk_test_162a56d42131cbb01932ed0d2c48f9cb99d8e8e2', 'junnuns@gmail.com', 'Pay via your Paystack account.', 6, 0, '1566878455404.png', 0, 'NEWSLETTER', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Expedita porro ipsa nulla, alias, ab minus.', '1578998786adv-banner.jpg', '1709011004logo-all.png', '1567655174profile.jpg', '#666666', 1, 1, 1, 'AcWYnysKa_elsQIAnlfsJXokR64Z31CeCbpis9G3msDC-BvgcbAwbacfDfEGSP-9Dp9fZaGgD05pX5Qi', 'EGZXTq6d6vBPq8kysVx8WQA5NpavMpDzOLVOb9u75UfsJ-cFzn6aeBXIMyJW2lN1UZtJg5iDPNL9ocYE', 0, '1709010999logo-all.png', NULL, 'tkogux49985047638244', 'LhNGUUKE9xCQ9xY8', 'WEBSTAGING', 'Retail', 0, 'Pay via your Paytm account.', 'live', 0, 'test_5HcWVs9qc5pzy36H9Tu9mwAyats33J', 'Pay with Molly Payment.', 0, 'rzp_test_xDH74d48cwl8DF', 'cr0H1BiQ20hVzhpHfHuNbGri', 'Pay via your Razorpay account.', 1, 0, '<div style=\"text-align: center;\"><font size=\"5\"><br></font></div><h1 style=\"text-align: center;\"><font size=\"6\">UNDER MAINTENANCE</font></h1>', 0, '76zu9VgUSxrJ', '2Vj62a6skSrP5U3X', 'Pay Via Authorize.Net', 'PRODUCTION', 0, 'TEST-6068652511264159-022306-e78da379f3963916b1c7130ff2906826-529753482', 'TEST-6f72a502-51c8-4e9a-8ca3-cb7fa0addad8', 'Pay Via MarcadoPago', 0, 1, 0, 'FLWPUBK_TEST-demo_placeholder_flutterwave_public', 'Pay via your Flutter Wave account.', 'FLWSECK_TEST-demo_placeholder_flutterwave_secret', 1, '9668BB2D-C246-4175-8F5B-CB72F655097B', '901417869', '2C2879C4-9F81-47D5-89F3-863F4CF0E7A3', 0, 'Pay Via 2Checkout', 1, 1, 'demo', 'demo', 'Pay on SSL Commerz', 0, 'demo', '5a61be72ab323', 'Pay Via Voguepay', '4.1', 1, '.', '.');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `is_default`, `language`, `file`) VALUES
(11, 1, 'English', '1579775344B7uQhhvr.json');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_user` int(11) DEFAULT NULL,
  `recieved_user` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `conversation_id`, `message`, `sent_user`, `recieved_user`, `created_at`, `updated_at`) VALUES
(1, 1, 'Hi', 36, NULL, '2022-10-06 19:11:23', '2022-10-06 19:11:23');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `conversation_id` int(11) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `order_id`, `user_id`, `vendor_id`, `product_id`, `conversation_id`, `is_read`, `created_at`, `updated_at`) VALUES
(1, NULL, 29, NULL, NULL, NULL, 1, '2022-04-21 10:58:55', '2022-04-26 09:48:54'),
(4, NULL, 30, NULL, NULL, NULL, 1, '2022-04-28 09:36:59', '2022-04-28 09:55:38'),
(6, NULL, 31, NULL, NULL, NULL, 1, '2022-08-17 17:03:49', '2022-08-18 20:33:25'),
(7, NULL, 32, NULL, NULL, NULL, 1, '2022-08-19 13:34:48', '2022-08-22 02:16:26'),
(8, NULL, 33, NULL, NULL, NULL, 1, '2022-09-04 17:53:40', '2022-09-04 20:01:19'),
(10, NULL, 34, NULL, NULL, NULL, 1, '2022-09-06 07:59:09', '2022-09-06 10:29:27'),
(12, 7, NULL, NULL, NULL, NULL, 1, '2022-09-06 14:59:02', '2022-10-06 11:54:40'),
(13, NULL, 35, NULL, NULL, NULL, 1, '2022-09-06 15:02:32', '2022-10-06 11:53:59'),
(14, 10, NULL, NULL, NULL, NULL, 1, '2022-10-06 04:00:39', '2022-10-06 11:54:40'),
(15, NULL, 36, NULL, NULL, NULL, 1, '2022-10-06 19:07:51', '2022-10-06 19:11:47'),
(16, NULL, 37, NULL, NULL, NULL, 1, '2022-10-07 03:55:32', '2022-11-26 10:50:51'),
(17, NULL, 38, NULL, NULL, NULL, 1, '2022-11-27 16:02:41', '2022-11-27 18:25:02'),
(18, NULL, 39, NULL, NULL, NULL, 1, '2022-12-27 06:42:49', '2023-05-19 14:43:34'),
(19, NULL, 40, NULL, NULL, NULL, 1, '2023-04-02 22:21:21', '2023-05-19 14:43:34'),
(20, NULL, 41, NULL, NULL, NULL, 1, '2023-04-08 23:47:49', '2023-05-19 14:43:34'),
(21, 14, NULL, NULL, NULL, NULL, 1, '2023-04-08 23:50:13', '2023-05-19 14:43:31'),
(22, 16, NULL, NULL, NULL, NULL, 1, '2023-05-03 08:27:51', '2023-05-19 14:43:31'),
(23, NULL, 42, NULL, NULL, NULL, 1, '2023-05-14 10:50:14', '2023-05-19 14:43:34'),
(24, NULL, 43, NULL, NULL, NULL, 1, '2023-05-18 22:46:46', '2023-05-19 14:43:34'),
(25, NULL, 44, NULL, NULL, NULL, 1, '2023-05-24 18:08:17', '2023-05-24 18:18:40'),
(26, 20, NULL, NULL, NULL, NULL, 1, '2023-05-24 18:12:06', '2024-03-03 18:46:53'),
(27, 21, NULL, NULL, NULL, NULL, 1, '2024-02-27 08:48:10', '2024-03-03 18:46:53'),
(28, 22, NULL, NULL, NULL, NULL, 1, '2024-02-27 08:54:52', '2024-03-03 18:46:53'),
(29, 23, NULL, NULL, NULL, NULL, 1, '2024-02-27 13:05:08', '2024-03-03 18:46:53'),
(30, 24, NULL, NULL, NULL, NULL, 1, '2024-02-28 12:48:18', '2024-03-03 18:46:53'),
(31, NULL, 45, NULL, NULL, NULL, 1, '2024-02-29 10:35:56', '2024-03-29 04:35:52'),
(32, 27, NULL, NULL, NULL, NULL, 1, '2024-03-02 12:38:08', '2024-03-03 18:46:53'),
(33, NULL, 46, NULL, NULL, NULL, 1, '2024-03-19 05:06:42', '2024-03-29 04:35:52'),
(34, NULL, 47, NULL, NULL, NULL, 1, '2024-03-25 15:57:24', '2024-03-29 04:35:52'),
(35, NULL, 48, NULL, NULL, NULL, 1, '2024-04-08 20:00:38', '2024-04-17 11:40:08'),
(36, NULL, 49, NULL, NULL, NULL, 1, '2024-04-20 17:32:23', '2024-04-26 20:24:17'),
(37, NULL, 50, NULL, NULL, NULL, 1, '2024-04-21 15:45:41', '2024-04-26 20:24:17'),
(38, NULL, 51, NULL, NULL, NULL, 1, '2024-04-25 12:05:59', '2024-04-26 20:24:17'),
(39, NULL, NULL, NULL, NULL, 1, 1, '2024-04-25 12:06:51', '2024-04-26 20:23:51');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cart` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalQty` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_amount` float NOT NULL,
  `txnid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_number` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `customer_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `customer_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `customer_city` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `customer_zip` varchar(255) DEFAULT NULL,
  `shipping_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `shipping_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `shipping_phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `shipping_zip` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `order_note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_discount` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','processing','completed','declined','on delivery') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `affilate_user` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affilate_charge` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_sign` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_value` double NOT NULL,
  `shipping_cost` double NOT NULL,
  `packing_cost` double NOT NULL DEFAULT 0,
  `tax` int(11) NOT NULL,
  `dp` tinyint(1) NOT NULL DEFAULT 0,
  `pay_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_shipping_id` int(11) NOT NULL DEFAULT 0,
  `vendor_packing_id` int(11) NOT NULL DEFAULT 0,
  `wallet_price` double NOT NULL DEFAULT 0,
  `shipping_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `packing_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whole_discount` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `cart`, `method`, `shipping`, `pickup_location`, `totalQty`, `pay_amount`, `txnid`, `charge_id`, `order_number`, `payment_status`, `customer_email`, `customer_name`, `customer_country`, `customer_phone`, `customer_address`, `customer_city`, `customer_zip`, `shipping_name`, `shipping_country`, `shipping_email`, `shipping_phone`, `shipping_address`, `shipping_city`, `shipping_zip`, `order_note`, `coupon_code`, `coupon_discount`, `status`, `created_at`, `updated_at`, `affilate_user`, `affilate_charge`, `currency_sign`, `currency_value`, `shipping_cost`, `packing_cost`, `tax`, `dp`, `pay_id`, `vendor_shipping_id`, `vendor_packing_id`, `wallet_price`, `shipping_title`, `packing_title`, `customer_state`, `shipping_state`, `whole_discount`) VALUES
(1, NULL, 'BZh91AY&SYêÔõ\0¨_@\0Pÿø/ïÿ¿ÿÿú`=÷CQµc;ÐAª~¤f¦&¢2 24Ð0¡12IF¡ê\r4\0\0\0\0\0`20110LÓLÔôD&¡£A OPõ4h`20110LÓLÐM`M4d4iõ4Ð=CJ$! ä9ÎCQ¬å\rÄê=ÐD7$µäù|¤±B£%¯ÄBñ ºdâ2CúàÂsäWFÛì¥ædÝg)C-ÊwKÝ8CXÂWªLß&ªÕ³ËÉÕ¡R¶ ¶cO?ÈÐ·àI;~Â/~VoÌrôçx07ÙÖbx\"£ÞyÌwrö\nb[i°YB^¾7É_d^}°M`%	,FÇ$F0àÆ2ªÉÏ£>ÒVC¨È«fT2kÕ5|¬h´A\0±¾8eX_)AQ.4¡U0/íW¿ÌÂ)K^ö²c	%PCaI­÷ÍÇ¨ÜI¬e6`Ô¹»x¶|CÌ´ÊF0¨³3xÏi¢BMJ2ÄT±q!y$%U\n.j¨lVr\nL1rÆí°TØa+	Ì+	nIUÎQDvAAðb¤i (2°æRöDà§L0Â#( [0¨CCjTQ1$1od\0Ô34BD©%Æ6\ZÇ³6$°HJ\Z@Æi¥i¶¿#<+j°AD¨t·ÆýQÚgm5ÝÁ¶Ê*%e\nBKQz52+K¦\nR_RÊãÚîó&ÚJ¸áh¡±09´Q}ì³¸ä³-¦²Æ£Înà6è9N¹ÎQã>&âÇIÙ7&ÓÈ~O¹Àm	6cýpè>xÓé5!\\ \"csó¬7¡\"«p¾#(F¾I!_|Â&¬À`î1aÎA*Í¿Ìí:çÔd¾$ìlàA°xP àdIâE÷J\"Lª¤j8¾¦úª\rÆc.Zöå¼\reÁÔj\Z+ú/iî Ì¼üµÐYq¬Ã0©¼yI´ IÈÅ< Úàw\r÷\rFÂ.Õü\Z`I¼ZØgþ!kÀ§ ¦8szV×Ã%)2Ö¹R³ènK\nvn¢Ãí_]âCLÅ	$pa&zC$¥XðXØ:ÐeãéÄ¸¶ê½A7rà~þC_+¹®=djÀÁÝ°ê=uªRAÛ¬j10<Î\'x´4Wø0ô\0Ø9	z0bcûîÒãu9,PÔoíî3(r)xP¢«Ya[}H-é*ªØò5F3w\"×m:ÙóõhÇ2Æ]ÑDyýcqÐÄ2oéØ)¬CÐqÇ#K1ÂJLÍ¤a92¨¬«\\\nÐ/R°\"F@±[QÄò4í¢ßady5bqÿJù\r3#Ö1g³tibzp}%¸Ú|ËÒö¬1¦Óc¨á¯<²ªUa!ÁY=(S¢Ú;¯ÈÚ`k¸d	KBÀeaL¢p>	Rv+Q×%å:v6YpX\0D/2TÁD`ÂJ@A,\n65+·¥J$ê¦õ¡\0	&Éã*¨¡B!tÝa¥YpIìuÃÓ\n^ZôÐ±Z(\ZdËã(YX/B¸¨ZÂÉÃÒÍzù9ë;­s;;î,¬dÅr)µûÌäfD «£.o§´Kv\rýrN© qñø (((Sþ.äp¡!Õ©ê', 'Cash On Delivery', 'shipto', 'Azampur', '2', 320, NULL, NULL, 'i2kY1650989847', 'Completed', 'mdrobin4941757@gmail.com', 'md Robin', 'Bangladesh', 'r797974974974974', 'vb gf', 'zc', '2021', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'completed', '2022-04-26 16:17:27', '2023-05-02 18:47:55', NULL, NULL, '৳', 85, 0, 0, 0, 0, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'xxfcv', NULL, 0),
(2, NULL, 'BZh91AY&SYÚ*×\0åßP\0Xø;ü¿ÿÿú`]÷@°h\01Í10\0\0\0À\0LL¢\'¨\0\0\0\0\0\0sLL\0&\0&\00\0I\"Aé!ê`\rdÓMÔz@sLL\0&\0&\00\0C&ý©¦ÒmL¦i©aRñSv\Z¨!þ/zi?&\Z©qxÉkä1·~d¤|HeþIfÔÖÜe0sRrÔ´	«á3O¬\'ãfDÒC¾ÖµcnJ*ÏB06¼ÄÈÌËý±ä2ûÇýø§,¶ó4Õdm\"Ç¢HæXÐùóÜoÅ¡°ÍÄa!ì*<MaO¸ èHKÚûJ#Ðb]É .Àeå	m¾JZ,;L7RNÃ´ähAÝ4	Ph í56$FÓ\Zh\ZÎ Õí[P0eÍá¡¢e\"TÒ°3 KËJNqÔÌ¬&Ú2O©\Zm;ã9W)Ã*,J#M]2ÛrHm´Ñj¾¡®ºç!$î*\n:\n¦³\"ëq-Ài6Â¸LÚ·O\Z²±\06\rw17Ì0aiÎs\rêeÄk\Z©FDTZªÁKæóHÂ8ÄPá¡ÆF%6R%PÛV)HÐzgÐ)T[¤F3Ë¬HKtyÕÛ£Y$áªÕiHd!Â4]\rD¥÷\Z­áwC²¶ø¥Ea@¥.µUÔÂDEDlÑ{ZÅ üaJB $B°a(@`-JÑ!	±±uÎD8pãÅ^]µQL$ÎD¹u1Çf³7ªßvÌ­Ç7PPÕ1¦ôÛ´Á¶´:50»Xä(R»K\ZVfÔ&ùTo±\n^M,ÍôC9;Þ.iU-C°}¹Aäì³ÒA¨w({N#\\æ¾c,åÄvËûIN\'%vËÉ=mÊÙ»ZI!Z=$·ÃùUa Û)9¸ûÎä fßô;§æf¾$ðlÈ Þ<hwîiÀäQI½TNAéSºªÃ ÌÜ3ìqð,ÆÃE¾$î?Á©cïß@~Ò\0Ü\\¹¡±ÀÏP©úÁÄ&\ZÉdpm\rzE3â5pà01c¥Êp6±£Àg0þy^úcò±va1RÚæ$Ç ½\Z2j¢Ç%ÿúÞvi IMK1SÌ© ÷É# ÍÃ.>-ÂP\r¹v/ÜkÚQ³©å*nÌÍáÀÂJH:ÉrÁËPóPr{E¡Ñ[î õ4	ns<ñbcúÏ9áCqÙãähPò)°P¢«Zc[J_ØUT)pú_Ín;;Ì°â}õÜ@0*yrÌhÆ#O«SV·wÐ°Ëà)èSxfS¦¤o¹CI¸B©RIÊF«(k°¥#°4`%pDd»Á 7>\"É\r2ÄÔ9åÛû:«fb4ÏÀÐ¡ðá\\þ×Ì²U7ô}H_ÁÞzi°v$kÚm®µU`s(\Z²a.O¡Ä¶°Ë/HIb2°¦R,FB¨Ò°worXüþÞêÛ:_ÜÌÅï4BJ)Â$\"%d\r(`0i&Àæ`p4;õ9ò,;¥u2óe°@\"ã\'ºUQBBõ;øÉ¡¶. rà!ât¶T±{&Ù@Ó )66~IØ	10,9:BI&êõh/¸gÃ c§P9¥Ç¯ÛQ\"ÊÁAÐQCâwàýGÐæ8 ä&¿©£2â¹é!vØ|1+¥PÍ	@\n)÷rE8PÚ*×', 'Cash On Delivery', 'shipto', 'Azampur', '1', 130, NULL, NULL, 'A38C1651029832', 'Pending', 'abul@gmail.com', 'Md abul', 'Bangladesh', '01956048448', '35/3/1', 'Dhaka', '1216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-04-27 03:23:52', '2022-04-27 03:23:52', NULL, NULL, '৳', 85, 0, 0, 0, 0, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'Kafrul', NULL, 0),
(3, NULL, 'BZh91AY&SY\\X®F\0ç_PXø//ü¿ïÿú`}4hAc4\0$*9M0	À\0L\0\0(G¨\0hÐ\r\r\09M0	À\0L\0\0\0¨¤Ú=O(\r224\0hh\0æ4À&C\00L\0\0È@FS\n6(`O)£òSq$n¤æØê=®ü!÷=|#öús¹¹·ZH£ªhQO0åÃ}E4Üî:ÁÃÜ29rpÔ´	xÝ§Ë+	Ó¦D´¤ÙZ±·%NgNªåB©¶ëxÌ\rbÄHÍæÿØö`È?^9Ê8ÖLf²4Çz##ÐN$v§yÎó9S[b«-VÙ\nWÄ ð$%÷¬1.IYËJÖ¿ÒJg)ñ\'\'3b>#õ0 \ZIPhän<8¨ Ó\Zh\Zßo|/¿)H¤Eä°R@d!s´>ÚPÁHM°ÿ#\r£\Z°ài´ïÎ¹Í³õ4>â¨¸Ò²mcHm´ÑiÒ/1¨7+°aQQB02­lbe­Ì¡ÐeFhl)Y^ó0¨Ë`Ù]ÄÚa$GTDRê#j®R!QnîâkaLoÑ$)Æ$ÁC21(J<Õ¥¥ ZvxÅFÂa.sH<g,æ+ é	IËÍÐ>	¬ÁD¡WV$2\náb¢Ck42U\nn_D%½4H cI1 fðL3ë¦J´\\ÆXµ4èJ­4hÅ«zÉ\n²Y*Å¤¨±¦I1b*É]VÕ×µ®¤õQ7nßÞ¯Ê.®(Î¦g18¨}úlÚ«I¶Ï­](l¢¨]1ISjmê`ÕØèÔÂë¡J:êXµfkÛ9ÍQ¶S3,Nz!9;c+UL)ÄtõqÈsç)\'ô,2ã>iÕýæÃãgVæ`»söÛ¡é¨Úó¾Å,¤Qó/ÏáªÃd-¹À±£(A\nÍ¿cø8ÏÐÍ~¤ïlý\rãÅãCä;ð:RhoU#aÐ>5;ª¨\\8²ÛÃI m{ÓbÆ¯Dñ©­ºômÜ\rÿc¸\\ÔÚp4Ø ^°q IÇY§¤C`hÈ)sÏ#¡°àE¶í  ¹$2Àm1ÑØgx|y¡õÄc¦EÙkaA!_+$$~Y(ÑÛU3X>jA¥wÌÚfh$Gä×i)h2JPÅÁî/&	múÔË}¡66wr?ú5ÀäQ~\'¸òN¤nÐÑÛZQ) ÷ÉsRáÒù(=Öá¼Lq¿Ç$$qô	JMêcéæXåO\0Þ2ho9ùú\Z=\nm\nUka®+qkRûÊª.\ZÒ]\r;Ë×yÙ]§=	ëâc½Üä*èTµÀ«[ºPÈLeì)wdô{¬IäªTfo#	Ñ\nzAV¹¢Ü;°ÁÀ\"F@¾ãUÌaìmkÈZ!Ød²ôÓ3»Ø©îWÔÀÓ?©¨#Sûq¿±º>ÅÒ©À¨½F½¤\"é´Ø:%¯´Û®¶,¬Àô*/t|UDFZg|!%2àd(<ÆAÐ\":éöv§lëïGè©ËËnVH¥X«¨«$bÉjBÔ(¥Z;N»¨îìwdVæ(¨{ËÎKp@\"ã\'¤ª¢áÆ\r\rp©çX{1Läkb¦@Yfg=\"§P*a`.Pf£;b¡F+êÐ_pÏÃ¨cM§ÇÇí¨ÈÆñÀÛiÕ¼KÀß\\¡§3wË{uo3 jô_AÜú]ø??D\r`èÊ\\ñw$S	Åä`', 'Cash On Delivery', 'shipto', 'Azampur', '1', 130, NULL, NULL, 'JNS21659374548', 'Pending', 'test@test.com', 'Extra Virgin olive oil', 'Bangladesh', '07865424567', 'hbgtyhrtfj', 'hfyj', '12123', NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, 'jku', NULL, NULL, 'pending', '2022-08-01 21:22:28', '2022-08-01 21:22:28', NULL, NULL, '৳', 85, 0, 0, 0, 0, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'hjyjyr', NULL, 0),
(4, 31, 'BZh91AY&SYÍ¦\0_@\0Psø?Kô¿ïÿú`=0\n\0@`\0&\00\0\0) H¦ @\0\0£ÔÓ@9L\0\0À\0L\0))A£\'¨4\r\Zh\0\Zhõ\0\09L\0\0À\0L\0¦h)ÒIêmFM2ÒziL9Â§¼ö³¹ í ÃI<$þOßi%ÞvýG. ÀDøÝ.Ò`¥·8Aw]<ß2Üª¸ã§ÑÓ³cLFAßT.ÝÑGÂ;ýCé$Î;`5ô0LbïÀHÈÀä$LF6o({Ãæu1ïê{ÒFÔGv8Ê¯®RjÂÅ¢ÏyÜ	)\ZBcGrD¤³3vÓM(0CHU÷r8	&W¹±yDzhÔÉ d&a$1Q/Ú	|÷f9{=Á\"((p¡I0HÐTLÍnÆSH6wfµ°²FÃ\"êg1îàr+»¹«Ñ\Z9Øå(¡Äiid;55t&ë ÃtãÆÖ-kÚÙ\\¶g\"yÇo\r-°ÕÈ¬°«äSÃ//\r.Â	6Ê²CIA<õEû?Ò1!Ì3v±K0É)ÓÆ#Z4aGZ1ÈLB `\"ä	Å	6bKSioí7á]àWl »#Éä©óO3s­,çU\'ïª¾dÆu¤sµßnávìtt\"»9)¹ÔÁËs{qs¢K9O£2[·9Í±º%Ë³ý«G¡WN_mâÍI¡Ùç<|§Ö|Ey\'ÂbT±ýP¸¡÷>+&¥?ë«úíÐ÷GÉÔmyí.í£µ¤¢Í×íV\\`ð¹@¯ fßØýsó2_ÜÏ`ÈµøMì;29R}ê¤m9Æ§*ª Ìßø©ùFÑ£Ôv04,|µÀS3CRúHÚ\rÁLÈvAtòchl\rÁ\rõ<LÍ¤a¢ÐHøXGþLÍGØÔdô<¼¡åx¿+³\"ø¥NH½þºT7\\n£eyO`ÈÀm¦dI$p^M6c$¥âþÐÈÔf£1ZßG°\'oNGüú\r{½\ZåØ.ðÔ­(y±52bX8txÂà-%o¸z¶G[DAëÇÔóì`}±ã@ÜÄ{¼Í¥-BZÚiÜËl¶Ä~&bÁ`û]á³zøóSÓdû¼Ëí;)Q$ú\n¹0Ä\nµ¯ZÆc¦IÔ2\'ÉëIØU*Bÿc¡JMäaõ)±Æ3¸¢Þ;K\0Á,Á2±q{\Zñð|\Ze¨tË#±S²¶eÆùA¡úo¬Ä¼RÉTÜT>^Ç2#\Zm6:DK_¦Ò©UaäsY°£¬%7ÐÞxðgêÐ®2°¥JPeq ì4¬79,G<ýzS½QÜèùÐÜ%$W¦1 &H\"Â\Z)W   9ÍGI)R:s²`mÆUQBBæ·ÁlÅÀ¤\\D<Nö^ø¦+b¦@`²21S©@©upÄ4ÀU(¸³aø%÷hÇQ@¾{Â9#Ã·z¡Ä$Ì<	Þþ#ò9\0ý¤P).d(} y#XÕ|Sdò>© ïßÄXÿÅÜN$3ia', 'SSLCommerz', 'shipto', 'Azampur', '1', 57.5, 'SSLCZ_TXN_62fce7b186651', NULL, '2kWo1660741553', 'Pending', 'techlockbd@gmail.com', 'TechLock Gps', 'Bangladesh', '01705090630', 'gangail', 'Kishorganj', '2200', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'completed', '2022-08-17 17:05:53', '2022-08-17 17:05:53', NULL, NULL, '৳', 85, 0, 0, 0, 1, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'Ff', NULL, 0),
(5, 33, 'BZh91AY&SYe?_\0ðßP\0Xø/Oý¿ïÿú`\0ô åÀÓ@ AM44Ð@\0\0\0\0 M2*A \0hh\0\0\0s\0ÉÂ`C\0F\0¥$6¨Ñê\Z\0\0\0\0À2`0&À#Di~£$4zjz&ô£zQ\"H¨2Cæs@ö_?r¾éúX¹B£%¯ ÄBáó$½$è2C8ýdzRZiû3\"KÔÖÕ\nøßJ,«[NPà_\\á+ªLÞMkV6ä¢©Èí÷*-S~Ã2\ZËHÍÆ>£Þyòå©þÊsÏ¼ÓU¾<ôEÏp` ô.hzï6Å¡Àà@Ïb¡÷°ß\npu$%«æQ+ K±4BZWã%>0qÞa¸9¡ÌÕädB@Õß$Ðâ7ãA6ÄÈ5Â àö¶{P,Íù44L fJ+04<·Rsn¡¡YM´Ba\05QÀÓjàÛ¦»Úé¿¨j{MÀÑÌêÆ5Úhµ\'eú&¥j4ãAÆyÒµ¤ìuRm\r+3jÞp0²±\06\r{Þ»[IÂf/J_kr w½íJß3\"Ì©R`\n,H\\Y²ÊI£;ÐeV*¦2\nLå%&qrÃÅÛ9S`é	N·ÆdMÁ&«39¢8FAÖ*ºÐº¨SÍz!.+êI\ZI9álÓÌøéRYIC£ó¦IÅ¤d&	!ËJ0iá\"D±Î7ãÚÌh7ï¤ñ¦8¹¢<ïCgZ*×*WÃ¦¢÷3½5ÜìqCj ÊeÂÙzÄ\ZÎGFT9\n£®°ÆU³	»»7¢«ÄMây!9Õ­åU)8¿@så=ä£Ò@¦E=hÓ:\'ùùNÁK±Óðux;q¸àÑã`3+/BMmjMM£â)0Á¡A¿9[v¡+6ýO¡Î~¦kó\'fÏA°ò AÌÜÐy\n)48ª¼èNêªÃQ\\9níøãxÑ}ÇÌ ½ã\rKÓ\0:|ð0jp9µ\n/X;a îiîchl\rÁò;B2W;N$[~òC,ó+#:ØgÉîðßeÝr´aÃ!Y¢Ç9w6\ZCbª¦ÖÖgä¤g©]Ó2ãm3?!BRk±)h2JPÏ\0øLFpqøÔ¿*=l §Dtô¢H-)9\\$/ÍØXc!î	#Óxy(9>ájx+ü?ðy Höàê&yäÄÆ1ûO/qc:CÙîò4(yÞ(ªÖ¦WÒ¤ü\nª0$¹­FÎ=Æ+±ÞÏMHOonâzøF}XÑFÁ>Ñ[A-kn,&3É;dô{X9¸B©RIÂîe2v¢à;EÉ`# Y®Á© pîB¡!2áK<ó;}J\nú\r3î4h~<c|N×ÐºU6*/ÜkÌèB0M©æDµï5±§­ÕØÌ!Ìà¨r\"-¡Èì8ØdÎY¬)°I°i\\9qr\\»¼»öv*8ö÷SØÉ\"²1H &H\"TÂZ(W  MýNã¬ÝR:yºÞ$ÀÉç*¨¡B!tãã\\8TËH¬=r¥Ì]4,Öªeó@©È1­vÅC<Å¹ñ_f|z[· w#o}D«QGBvaõ;\0uÖ5+§	ãS	àØÿÙÍ\rÜjþNNÊAcÿrE8Pe?_', 'Bkash Payment', 'pickup', 'Kazipara', '1', 130, '9I41X20PGZ', NULL, 'jYqx1662299794', 'Pending', 'didarcoxmedia0@gmail.com', 'vcvcv', 'Antarctica', '01950090011', 'xcxcx', 'cvcvc', '1212', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-09-04 17:56:34', '2022-09-04 17:56:34', NULL, NULL, '৳', 85, 0, 0, 0, 0, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'cxcxc', NULL, 0),
(6, 34, 'BZh91AY&SYS÷­\0ÔßP\0Xø+ö¿ïÿú`hÄ@\0RSÔÒ=MÓÈB\0ÐhÐ\0\r\055PÉ¡ \0\0\0\0Ì\0\0\0\0\0\0\0Ì\0\0\0\0\0\0\0Ì\0\0\0\0\0\0\0\02#M0¥=&Ô=&Ù©4D(DBSÍØðI©îïMìõpBµ	~Ã\Zë\'ð}´Å\n¶Za2I¨ÉcI%ÒJg³1$µM0¬PV¾´¢dÍ>2°ÒíÎÊ§1C»±y¸È½øwè[fvÄõ4ªÕò9	,xè$3<}y¼c¡°ÎÓræf5¶Ü«\'Q}2r/ñ²ß41¯	sBÅÌe	wgÆL>9ýÍ©¹zÉahEè4\ZBÀÚ4 ÓHkXW¶íÛ¨3ìIJ¸ffd,SbfC\"^u¤åcS\"«À`H\rd8\ZmbCÊiST1(X`HÊ¦Ø&4ÛM´Òl>ÆÅJ `Ø³ReïThl\"³8^ó&Ä0¨ÊUQ®.&èQÄuDE%ê&¨dEEª©§,cª1ÒëHÂbK(p±ÆN¤H5\0ºv{ÕFÒi.rxÌg5XtyºÓ¤ÖAD¡¬.®­Hd!Â,ÕÔHh-ÖB¢â·¯áÜÐ1¤R Gë0ÚA\r\r©PU1$1v²\0d1! cL`@ÐÆÐÉi(\ZÆ7¦ãF$®^\0ðNNI~hÎk\Z%]ê	4QÆæg\"uPüÜ6ÝVølÊØâíPeBé7M³88¶,V¦¤£/Å«3%Âo3)(ß)¬2Y7:êE­ëôªS¾}¹Náæð\ZMCTèúOS«cå{¡Zdô¥e×mn[Ýr¨Úô¾ÊÚ;ZI!Z ÿl·ÏïV,p6ÊEn<(A*Í¾GqþOØï¯ý5_ð\r¡ç@©úæÇBLÎ\n¤jtþ0:,LC¨Ì+jÒ¸YrW)hIjP§É4X¶Ý*LCJ&F\ZÊ)£\\Ûfêh%\r¼	¡°ò>xMÌÇ0ÝÌr\\Æ&áÈÍçàæ2BFxûÌ½lç³JU6-)«Ñ/ÈTY\rº,\'ÑzÜbpÓi IÉ¦Ä¥É)CÜGA°úT¶ú=p5ãÀúÿñ«R«Å®<ÈÛ0Íá¼s¥¡2\\â\\gÌ5SÔÀt>\"Øê¯ùÁïC`{®tô®LLcéàXãN¡¼47þ~¡Q6\nUkSLkqh_äUT)pìIw­FÎÎEë¼ñg´0*y÷fO_#P4e$ù¹0¸kw}Âb¡¦A¡±ù×Ç6öHÀã»ã£(k\"FÃVq`²X(27à0üíì¶HiÅÂ~vÎ>Æ¾CLù?@Ø}ª6ãéÞúJ¦ò¡÷\ZüWÓi±ÔøI£^ómuª*ÅàPÍfÂ^%hQ*ÚD[C´àv`2ÏBÄeaA-(2ædA*pÒ¸wv¹.GM=:ÓÜÛ:ÞÇö÷10M¡þLÐÐÆ¤Ø l@CI6BÇa×SÒE©DCÔÀ/H[$¸Éã*¨¡B!s]fkw\09pIît®4±{&Éj i,§Tñ<J*\"ÔgX e´aðGÕ¥}ã?Ç@Ç=ÃÇÖ¢ £N÷ì>xàg10f@ß&Ì\ZÄÄÇñãTÝ$^^hÁ°!ý¹\"(H)ûÖ', 'Cash On Delivery', 'shipto', 'Azampur', '1', 110, NULL, NULL, 'Zf6d1662436824', 'Pending', 'support@itnayeem.com.bd', 'Suyel Haque', 'Bangladesh', '+8801722597565', 'support@itnayeem.com.bd', 'Ggg', 'Gu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-09-06 08:00:24', '2022-09-06 08:00:24', NULL, NULL, '৳', 85, 0, 0, 0, 0, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'Vgg', NULL, 0),
(7, NULL, 'BZh91AY&SYØÜ\"+\0ðßP\0Xø/Oý¿ïÿú`wÀzPe@Ó@ AM44Ð@\0\0\0\0 2*A \0 44\0s\0ÉÂ`C\0F\0¥$6¨Ñê\Z\0\0\0\0À2`0&À#B\nziGé6¤zF\'©¦ô¡è\"!\"\'dùt¸q\"|PýÌròÉ¾cæIzI\'ÌdqúI,ö¤´.:(ÓõfD©­«ñ¾YV¶¡À¾ÂWT¼Ö¬mÉESÙä¨PµMø[Èk,#67úy¨È?:ì§f{üÍ5Yã¼ê¹ä#ÄI{4=Sí6Å¡Àà@Ïb¡ð´ß\npu$%«èQ+ Kh02´¯¬õó\rÁÈæj¦¨ø#$Ø`º¬.ù&¸ç\Z	´&&A®µ³ÚfoÈa¡¢e2T	X Qåº[pPÈÐ¬¦Ú!0\Z¨àiÍÁ·MwµÓ]Oi±àb#yXÆ bRM¤â¿CÄÔ±mF1Ð\\h!Ï:Q´Æ]TCaJÌÚ·,¬A@\rd^÷¥nÂåÖÄ`°¥¤ÒÄZÜ%&ï{R·âÈ!\'ó*T$¦$Vl²¥RhÎôUÅbi%9II¹DañvÎTØ:a)Ò-ã2NMà«39¢ACÈ1RF\ZÅCwZU\nz/d%Å}) cI1 g<1M`91K0É(tpÞb4ÐÐÂ8£Á$\"`YbIBM1\\$H9ÆâáÜpÂ»P;F~úO\Zc(cÎô0`±u¢­r¥q8~ÜÎô×s±Å\r¨*,RÜ¶ËÔ`Ör:4°º¡Ì(Jº2¬Í&îîdÞ)W\\2n(giÈÝZÞURc¶stG>G©ù>ÃúqÙ æl~óêhzaî%}Ý\'È;q¸àÑã`3+/BMmjMM£â)0Á¡A¿9[v!+6þ§Ìí¡üÙ³ð6T;MÇ÷=È×Ð¢C©Î÷Tîª¡æj2Ë-Òp>òáÜo\Z/¸üÊÞ0Ô¹òá@\0à|L\ZFíB¤ë2h;¥{ Úp~`SAÊçq©ÄoÞ@AHeÞeq£Äg@ýyï}ùF]×)IF2,pö¿°Ö\rª&¶³?#>¥v;Ë´ÌüÆ\nI®Ä¥ É)C<âb	2(9ÀeÇãRü¨ô	°ÓÐ2P1 ´¤åp¾7bx	a\"P¸&LMáè0 äøSÁ_âAû¢,DÁBLÆ?#ÏÜXåN¡ÀdÐàs÷y<Êo\nUkSL«iR}ÅUB\r]«Q³qìw³ÛRSË³q=|O3>¬hÎ#`![A-kn,&3É;dô{X9¸B©RIÂîe2s)EÀwÀ\"F@³\\ÆS@6à-ÜC4BeÂÜó;>¥O}ð4h}üc|NÇÐºU6*/ü5èt!M¦ÁÔô\"Z÷ØÓÄÖêì\nEfæIðT9Ðäs8ØdÒY¬)°IØ4®¤\\#®ï>ý=½ÔöCßÅrH¬R	$bH0\nÈ%fBÇC¿S¸ë\"·4©DC¼ÄÝoA`döÊª(P]8Á¸× rà!àë\\©sM5ª¦@Yfg=±SÀ(2Y05 ÎÁX¨g·0þ+öh1Àg¯PËvóÄämãï¨up0ê(èNÏöS¸pQÈMcRºpn50\røÐÝÆ¯áPääì¡AA@d?ñw$S	\rÂ\"°', 'Cash On Delivery', 'shipto', 'Azampur', '1', 130, NULL, NULL, 'KZqe1662461942', 'Pending', 'mdakbaralibd98@gmail.com', 'Md Akbar Ali', 'Bangladesh', '01941118331', 'palash,Narsingdi', 'dhaka', '1610', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-09-06 14:59:02', '2022-09-06 14:59:02', NULL, NULL, '৳', 85, 0, 0, 0, 0, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'palash', NULL, 0),
(8, NULL, 'BZh91AY&SYÎ\0åßP\0Xø;ü¿ÿÿú`]÷@°\0\n4Ç4ÄÀ``\0\00J2L \0\0 Í10\0\0\0À\0L$¦eL¤&L\04ÈÁ=@sLL\0&\0&\00\0#&ÔÔzm)¦Ò¦iz¥K1¬ÞAð²õ¦Ãñàk×´h0.2ZùD-ß%©$1GýYµ 5¡aÂ7:9©:-jøâ&iñülÈHwÓÖ¬mÉESË²¡CBÞbBÆäHÍæeþ£ØÔdï÷?áNü¶ûM5YGSª\"Ç´G°I}\ZCà{Íã´6¸ØHy\nóXSï:Ãº¾âôzh°yB[eðÓ\rÔÜs4G î\ZÀ(4HÐw\Z#@i4\rgjöÃ-¨2æðÐÑ2*`f#A£ËJNqÂ©XM´d¤i´ïå\\§±%¢jéØ+BCm¦*÷\ruÊqNâ `£¨ªk2!IÎR£\r&ÐØW	Vóô\"VV  Á±®æ&ù-:#a¡QL¸cU(ÈUSX)crIRÇÊ48ÈÄ¦ÊRD¢*jÅ)\ZoLñz*rÒÓSÃÆc9ué	n: {trk$P¼5Z­\"8F¢a¨°Ô¾á¹ÜEÝ|Ê\"°CPRZªíµ0%QQ$4]-bÅ|°¥!PJ!ÀX0 0H¥h\rFdÛÌÛºPí\"|pü\"ø+Â2¶ ²Ê3iÈ.¦8lÖfõ[îÙ¸âê*\Z¦0RTÞs66ÖF¦k\nQ×icJÌÚß3*ö!KÉ£%y±cg\'{ÅÍ*¥¨sü¤òváê Ú>ªéÈxeæEìNc\"üäÏ9³=ÃÕ\\òä§NålÝ­$­[ãÿ¢UXc(6ÊEn?½%Y·Àýùú¯<27\ZægøÍ8Ê)37ª©Ì=*wÕP¸q4ÛrÜ|Ky°Ño\"ûÏ´Ô±øo Oq\0n.\\ÐØàg¨Tq I²Y\'C`fÈ)sî±ÌÔàFl@ArHf\0jleq£Äg@þy~0úãó±va1RÚæ%ÄäÈ4á\"HÜqÉÄélCö_Qæ24DÌI$É¦Ä¥É)æTË{ÌdÈÐfá\náG¨NÜûî5Äî(¿#±å*$nÌÍáÀÆJH;ÉrÁÏPóPr{¡Õ[ï õ4	®t<ñbcûg´ÀãN¸dÐÜröù\Z<l(ªÖ¦ÖâÒ¤û\nª.SKüá³Oc=w\n\\ó\'ÇÚcÕÄp	òs*ap*Öï\n|2}JoÊuÔ÷(i7U*@I39HÂue2r)Eì\r	\\# Y.CäÐÅdbj2ÈîýÊ³1\ZgâhÐøð®OsèY*Êú?òx£$Úl\"Z÷k­UX\n¤,K¤â¨q\"-¡ÄäeÈ¤$±XS)A#!AØiX;È7¹,GwZvmoïGæbøBJ\Z!%B\0HEa²\nÄ04`t08\Z\ZÏ	¥u2óe°@\"ã\'¾UQBBõ<8É¡¶. rà!âu¶T±{&Ù@Ó )66~³IÌb`Xq\nuD0MÔ<IêÐ_pÏPÇ=NÀtKoº¢E¨¢Èð+Áú©ÐpQÈMRV\"&d\rÇÞC\rÐòb®ÅCÖ H@ÿÅÜN$3¦À¥\0', 'SSLCommerz', 'shipto', 'Azampur', '1', 130, 'SSLCZ_TXN_63172831c1211', NULL, 'NUrF1662462001', 'Pending', 'mdakbaralibd98@gmail.com', 'Md Akbar Ali', 'Bangladesh', '01941118331', 'palash,Narsingdi', 'dhaka', '1610', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-09-06 15:00:01', '2022-09-06 15:00:01', NULL, NULL, '৳', 85, 0, 0, 0, 0, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'palash', NULL, 0),
(9, NULL, 'BZh91AY&SY¶ÚV\0¨_@\0Pÿø/ïÿ¿ÿÿú`?\0\r(*²\0\0\0\05 ÓA¡§© 4\0@\r&\Z%\0\0\0\0\0\0\0Ì`&F\0F&&	\ZbiÌ`&F\0F&&	\ZbiÌ`&F\0F&&	\Zbi ÄÐIè§<SjyOI§©êzjiå¤	\"HÌñ?3Äæt=#;úî|ÆSäIþ¨³éô\n¾cäAiOÉ£÷Y­ 5¡qÑFVdIzÚ±L4b6R*ÖÓ8ñ%uIÉ²µc¤-f§arvm*WÔaù}\r¦<å	\'´?AÀä ù\'2:øt3<ÇÐ°Ø|O)ô:ùûE¬K­&±ÊÊös¼öÀEÆEÜ`!	,ÆÆcFcBc¦¬Dygt2¦isPQzÒoÅè0Lp\Zm;^q|M° !0aÃ`Òm4Iiµ\"ÖýAA¦Ä\rµ©F^üI(\"B\nLÍoy±ê:7ÀÆÀl$Ì¼K0F¢\"P;Ã¤Ð0P2%~c\\\rÊ f	 ©ÄÉ!*¨*1æ\\<)¸<V\'¸2Ö1&ë^eXXÈdh©¬É\\-\"¦¦©ARÂ¸A¤X¨`.ëBê¡Mâ¾«øD 4&4iý&C!¡µ*\n&2d.¶@vA `Á&&14h\Z)	(\ZÆ7®ãV$²HJ\Z@Èc6í­8=²jáEìâxtlØ4àNYM\Z!¥ÁÊ³KF³­ïÇçê\r\Zð´qQXL&f¤apô\"aS°V0:ç´ÆNømcæIÐ¡Ìõ^£ô=¨ùaù\\¼o;ÈÁÒùàê8B\nSçCôe­$EA²±LhXÀ±N$¨yäøõC$O¸4¶¼B¼Aú²ÿ/Ö&¬È`íse£V±ÞvÏ¨Ñ|ÉÞÙÄxò AÄÐäF\rzE&R6ãS®ª¨Ôeî\Zu¸°y\rEÁ\"÷\rKßu\08°7457j:ÉÚNLÐxFié\0ÆÐØÈ:ÜÀuØâl7mSi!&DËir?ñpÉ	Þ2xõÃìÊ2ãsµ£\'r1xÈïÈ1FCn¢Ë%î_Ø®óbCLÍ	$pe&»IKAR0ð`Þ:Ú2ãéÈ±ª½76óâ~ÿa¯y+Á®]¤lÈÉÛyä=µªRAß¸j32]Ì-¦Õ9ø#»11BÆ>ãÃ¼±ÕNÁF\n¾ÿR2\nUkSL«uÔª¡Mé/±°ä1\\Ì[ÚÏÇ¬h<¼¸îð4èÆâ#Ê*yMJÀÜBáÓ!XfwÉ¸¦´§m´g7U*@I38èÊÂ²2­q+@¸4T*2ÞzDØÚ.®ëÀ´CL¹5frÿ¥Njú\r3CÖ1§³ª6à_C¬p?Ò÷!`cM¦ÇQÃ^s]4ªUa!Åa=å(S¢à;_CºÃ Lô´,VÊ Ï#ùJ¼i`<#¾~Êw6ÎÌq$ô øÐÆýL\r41¡1¡%@Ø6¡Á¤§M3¤ÝiR:ÄÝm Î0hRª\"N¨5\r¸p eeÁ$CÁÛnT¹¦Ú iYÏ(©CpÐÞAä0-o=	~\Z2Þ3×Øë¸îäpÔîóXHÂÀA v\n$æSø°æjD âo5z/xÊm7tI}ÒAááå@Ø6\r/þ.äp¡ ;m´¬', 'SSLCommerz', 'pickup', 'Azampur', '1', 320, 'SSLCZ_TXN_631728864822c', NULL, 'NEN11662462086', 'Pending', 'mdakbaralibd98@gmail.com', 'Md Akbar Ali', 'Bangladesh', '01941118331', 'Palash', 'Palash', '1610', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-09-06 15:01:26', '2022-09-06 15:01:26', NULL, NULL, '৳', 85, 0, 0, 0, 0, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'palash', NULL, 0),
(10, NULL, 'BZh91AY&SY}½Ê\0åßP\0Xø;ü¿ÿÿú`]÷@6Ða\0\01Í10\0\0\0À\0LL¢\'¨ \0\0\0h\0sLL\0&\0&\00\0I&ÙS\'ê! ÀL@Ó@4zPÇ4ÄÀ``\0\00H2i1Iúm)¦Òf¦êl©aRâ¦AÔk7ÐCô_ªl?¦½xFÆK_!»ô$µ$ä2C(ÿÒK6¤´,8FâçS5\'B¥ M_BdÍ>2°IúsZÕ¹(ªp9{\nXÀÚó7\"Fo3/ôÇÈ?çô~Å9å·#MVFÑÔê±â#Ø$>eï=ÆñZÜAì$<Oq¬)÷I	aÙ_iDzKµ4Ø¼¡-²÷ÉK@EiêIÈì9#ÐwB`\Z$h;\rM 4Æ³5{aÔrxhhPÈÐ`\\a Qå¥\'8ÃLêfVm\'ÔÁ6ñï±Ï\"ÉêaI$QE)$Ln÷\ruÊqNâ `£¨ªk2!IÎR£\r&ÐØW	Vóó\"VV  Á±®æ&ù-:#a¡QL¸cU(ÈUSX)crIRÇÊ48ÈÄ¦ÊRD¢*jÅ)\ZoLñz*rÒÓSÃÆc9ué	n: {trk$P¼5Z­\"8F¢a¨°Ô¾ÓpÃ¥ÜEÞ{RÊ\"°Ct)L-BÕvZH¨¨\r.Â±b>8R¨%	`,A$KR´DHEé¡6ô6à®¤;?¾\nð¢í¨,²Úa&r%Ë©5½Vû¶en8¡ºÊ©7¦ÜÍ¦\rµ¡Ñ©ÚÇ!BuÚXÒ³6¡7ÌÊ£}RòhÉdÞlg¢ÙÉÞñsJ©jÇ?!é<££¸z1>*ùÆx{ÌË;ùFeúÉ¦f-uË<·+fíi$hôßæ%U8Bl¤Xæãï;PU|úvÏÌÍ|IàÙA¼xÐ í3?ØîiÀæQI½TNaéS¶ªÃ ÌÜ3äãàX;M|IÜRÇß¾=¤¸¹sCc¡RõL4É<àÚ0üNAKef§0ÛbC0Sc+ã:ô3Èdóï×Ç³°^×1$$~9èÑÛU9,OÍHÏ©]çaa¶	$Áy4Ø³%<Êby:Ü2ãáRÜ(õ	ÀÛaòýÆ¸âxR©ÞFìÌÞûéD¤À&KzÂÚ-ªßq¨y Hð¹ÐL óÅcð>Ï:áCqËÇÈÐ¡äS`¡EVµ4Æ· ¿ØUT)pú_Ñn9waÄö3×q\0À©åÏ2{üLz±£>B®eL.ZÝÝBÂc/¦O¡MáNº¾å\r&á\n¥H	&g)N¬ RQ®E(±£\0Á+$d%Èaü\ZÃx³â,Ó,MC¦Y¹SÁ[3¦~Úä÷v>©¼¨¿£êBþãÐdM±$K^Ómuª«¡@Ô	t{Õ$E´8°ô#+\ne(2Äd(<´{Äwgöõ§lër?@c¾PÑ	*¤bB+EP6$¡Á¤¡ÀÐîÔæwH°ä(¨y-D=²ª\"©ÝÆM\r±p©¬=²¥Ù4,ÖÊI±³õN`ÃSª$n¡âOVû|:9êxÑ.>mD+QEÜWõS à£þæ¤>¬DLÈ¨ÁâÉ]77¥	@\n)ïrE8P}½Ê', 'Cash On Delivery', 'shipto', 'Azampur', '1', 130, NULL, NULL, 'Y1BC1665028839', 'Pending', 'erikwinkeell@gmail.com', 'Abu Tayef', 'Bangladesh', '01571021921', 'Basundhara', 'Dhaka', '1400', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-10-06 04:00:39', '2022-10-06 04:00:39', NULL, NULL, '৳', 85, 0, 0, 0, 0, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'Dhaka', NULL, 0),
(11, 36, 'BZh91AY&SYÍ\0_@\0Psø/ü$¿ïÿú`÷AU6 \0r55G¨Ädi¦4Ä=#LbdÄÐÄP%MCF\0&0	\0\0\0	\0%(C#@õ\0\r\0hz@s\00\0	\0\0	ÐM0E=¢14Óib*sOã:gi\071îHù[ÑõØ~dP¨Ékõ_¡¦I?QÚIf°ÁÚÅn¾\nhåÉÚ©hó²!6fYXOãÕ&o&êÕµSvÄ²$¹¸ËÐ8|ÉÜg\Z>#±ï;#`gOOPêzÌzê|T#M#àÀgIBVá¬0¹x»Áêv$I)\ZBcG©âP¦¬âÞë­ÌÜâ¨Ò2·°øÕ°:  *(¨ª4÷Võrp!(`Òm4E)KV-}$_Ü¨À`£(«÷-îÄ¬±[1T$jE&i{ÍâÄc`6\r¸¡O¼Ã\nS*\"ñª»Qnî¢o°SF4ps0¦1&8Xã\"JHçN]`+[>e¥Æ&%ÎÒ#¬æV¤&:N¼Ýã¤ÖÁD¡]]Z(È(CX1L5³¤}H:¹à #)¬Às>ZÆ)lÃ$§NhÑÄ#!1-¡8¡!&Ì@ÂP1¤Îñë¼Õ,J/Ìc6Ú´ãLíØÑ,s \n7n«[p÷Ìzªá×OÎpÇ/¥2Øá=9\nÈsi©Þ)Rl³º½Ü\'[»)×S6¨Ùn§zgWY«xª§úOÈ~G¢E=äROq¦7âê 9TX<`¯]aÃ¥Â®÷HW?&_ñùÄÕ;FÙÀ±£(A+&ßÜ~yÿýÁìAÞ<H°Iâh~cÁ\\Ê)?© ûªrª¡x\Z²ÛÞáÌØh·rESBÇøÚ Ø3461 TofcºXO86ÀÞbáÂ§¡±Õj@A$2Àjbçô%t!#<Bów{ÚÛÜ³ªmsÀk\r |<\rcn¢ÏÍ~ÅwË\r´ÌÐI$I®Ä¥ É)C±¼Ê	Fl3!ô©~x	±»#åûBïæBçÔÒ`Ã¾ò>´¢RAÝS&Ç j0 äôã¢¿êÛ\"D ôÉcìy÷,|ç+u\'Ä¹À?a±C2xP¢«[\ZûLín±=æae`®gàrIt[ÆÏÏ±¹±^§»¦¤û=¦<ÅQÄp«¡RÙV·÷¡q1XS$ïÉì÷Ø$În(U ©+ýJRq#	ÕèVFU®eh¸ iX,`Õ{NdÌÞ/kâ-Ó.MC¶_2§±_CLÐþÃj}¾³2\'¿7ÜºU8ú5üHYi´Øêw\"Zøë­R«	%ÔÉ=Õ$E´8üI{BÌe¡L¥ Ò¸s0à´tîoùxöwê8ú>=áÂREzãd!! BPÀ`Ð©c©ÛqÐí\"·$©DCÔÊn!IÉç*¨¡B!tã»\'\n9pIò;CÝfÉ4)[\r2Ë39ç<Ê0°£<ERF¾o÷õi¸óÉ~úW3¢àu+àþìuØrVh&ú±A©ÄÌ¬ª¾£)Çd1Ì¨mÛâBÈ,âîH§\n`¹²`', 'SSLCommerz', 'shipto', 'Azampur', '1', 57.5, 'SSLCZ_TXN_633f27e68d1aa', NULL, 'Pj4B1665083366', 'Pending', 'mmhminhaj532@gmail.com', 'Md Minhazul Haque', 'Bangladesh', '01816985847', 'mohadevpur', 'Rajshahi', '6530', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'completed', '2022-10-06 19:09:26', '2022-10-06 19:09:26', NULL, NULL, '৳', 85, 0, 0, 0, 1, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'Dhaka', NULL, 0),
(12, NULL, 'BZh91AY&SYnU8\0âßP\0Xø;ü¿ÿÿú`_{£\0ZaÝÅqØd8¦Ø5=HÔò4õ4hM\0\Zh\0j$JQåP\0\0ê4Í10\0\0\0À\0Lêi¡Fô§¨Þ¡Ò\0ÐhsLL\0&\0&\00\0¤¢iéÓ4ÈmLi ÐI$ïµòw|ËÉñ£óý_/æl2QMvD_E\rE(0z).®âÃ¹?>hÂ\rQÒéämo²e²ªã8ßÏÍ¦AÙTÔu=oKÑg¡Û©¶lxÔäß©\\*Yñíû_&8ðÛØ×iÁºÞg½Hô$>lÞ/ì{ÝRjä§5Ï[&O{kKúS<äGx@h`3E!-uQu¡lÕíUîÓ¸´ïmiR Ä Â¢êsg%Ñ©R*8ÚÍ«î°n¦f­e0pË\Z¨fSz¡hÊ¸k1ËßNhä§d2±4\0	e¼+¾0,D²m²6ÇI&L]Få÷~\'BäL\"À¬ÉVxwg,C$2AWªÜaæ<´ÚqÜ!÷ºßháÛ©hhLÌÜÎ±îÐìÉÝÔÕàv}89FË 4@ìå1MÌËÐgZÓÄñ EÙ¸6ËmªËfr\'1àÕàCKn\Z²+V¸h*ò)á«ÕéÒì 	Ð9»*^Ê\rI¦£é´IÒ~±y!JR¡NÂÒ1{$µºê&6!\Z(^Ê¢1ndHkR,*Q%%)*BH¨½¤TE*Jv9«^mi$Ò~*.X¿Lo¹D³¡q©6l³8©j¬wSÝÃìÎnùåó/ 1«sR9·äÎ*N5¢íÅÆÈ%¢æ¾¥§Ì9ào*Ì§nkcÅçW;ÅI¶Äóí>£æø#ë$³ífã|bQx8\nò¦­>Û\03Q}Bß+]EiÂ{²ì0Ñ6ê¡a£zR³o£ñwßæã?úU8v+~;Ü_íZ5èò±.âì-³Ê|2wå0Ðíj¦éË§Ãîfw¹*3üOsØ±³7ùìÀuúÖÚ4jäèã°¼ýÃ\"	0Ö;%©<q hm(Ø½Æã\Z7LÞVÎnåÉbÍZÎN\Z*<ä{Aþòþ.¼1ó¿FÑvh\rõ³§Ü¦8MCg\rÞÐ#ú+©ì\ZL æàéè!OÀQÆêd)ÐCApº`Ê? ¢¨Q¬JÄB®ÔÕ­níYJôc]g{´fuä{TaW{WgïYýØHñÑàPZÝô¥+Åìõ7;qÔæ¥ðæîõzÚ°õ±ÈÃ*5ß®K4ö2ÐýÝ$ñÖsU;¼7v½þù¬P£Ë¿<}&x!1ýÁCW%°)7o·&B7cD¢z$øv×d#`íEDG!}©S;ÄÞ¬ÊÆé4\"êY8NåF£§bqíNR¯×ödôÌø·ªSîjF¯¿¥¹h¿º³\'c$þÂÓèð|ªUë^§Öå¶ÙL¨u`ÙiÂÖ.¿`ÈÚÌÆ­ ¸D/©(jÀdPæ\ZV\rä;î6ws6Ìôô£¬ÅÕQ¡ÆDÒLhcB ÒlHU$¡EI*VçF¯\rWÓwtÄxt\ZjËh@D%\ZFVúW¢ââEÜqåF³n/ éÂqíÕu6MµA¦@¶àâ;Þp$(ÆÀØtìD`Ü øÛþPÓßÇg¤u·ÓíÉ#9gÌÃâð/â}ÃÌñè*ÿaCalD21 Ö.qX$¿ ççè@Ø6\r8¿âîH§\n\rÊ§\0', 'SSLCommerz', 'shipto', 'Dhaka', '1', 131.41, 'SSLCZ_TXN_6383a31eccc8b', NULL, 'iWqi1669571358', 'Pending', 'abir34t@gmail.com', 'md Abir', 'Bangladesh', '01614690745', 'Surjo Bosh bari, dhiur, arialoy', 'Rangamati', '1587', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-11-27 16:49:18', '2022-11-27 16:49:18', NULL, NULL, '৳', 85, 0, 120, 0, 0, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'dhaka', NULL, 0),
(13, NULL, 'BZh91AY&SYS÷­\0ÔßP\0Xø+ö¿ïÿú`hÄ@\0RSÔÒ=MÓÈB\0ÐhÐ\0\r\055PÉ¡ \0\0\0\0Ì\0\0\0\0\0\0\0Ì\0\0\0\0\0\0\0Ì\0\0\0\0\0\0\0\02#M0¥=&Ô=&Ù©4D(DBSÍØðI©îïMìõpBµ	~Ã\Zë\'ð}´Å\n¶Za2I¨ÉcI%ÒJg³1$µM0¬PV¾´¢dÍ>2°ÒíÎÊ§1C»±y¸È½øwè[fvÄõ4ªÕò9	,xè$3<}y¼c¡°ÎÓræf5¶Ü«\'Q}2r/ñ²ß41¯	sBÅÌe	wgÆL>9ýÍ©¹zÉahEè4\ZBÀÚ4 ÓHkXW¶íÛ¨3ìIJ¸ffd,SbfC\"^u¤åcS\"«À`H\rd8\ZmbCÊiST1(X`HÊ¦Ø&4ÛM´Òl>ÆÅJ `Ø³ReïThl\"³8^ó&Ä0¨ÊUQ®.&èQÄuDE%ê&¨dEEª©§,cª1ÒëHÂbK(p±ÆN¤H5\0ºv{ÕFÒi.rxÌg5XtyºÓ¤ÖAD¡¬.®­Hd!Â,ÕÔHh-ÖB¢â·¯áÜÐ1¤R Gë0ÚA\r\r©PU1$1v²\0d1! cL`@ÐÆÐÉi(\ZÆ7¦ãF$®^\0ðNNI~hÎk\Z%]ê	4QÆæg\"uPüÜ6ÝVølÊØâíPeBé7M³88¶,V¦¤£/Å«3%Âo3)(ß)¬2Y7:êE­ëôªS¾}¹Náæð\ZMCTèúOS«cå{¡Zdô¥e×mn[Ýr¨Úô¾ÊÚ;ZI!Z ÿl·ÏïV,p6ÊEn<(A*Í¾GqþOØï¯ý5_ð\r¡ç@©úæÇBLÎ\n¤jtþ0:,LC¨Ì+jÒ¸YrW)hIjP§É4X¶Ý*LCJ&F\ZÊ)£\\Ûfêh%\r¼	¡°ò>xMÌÇ0ÝÌr\\Æ&áÈÍçàæ2BFxûÌ½lç³JU6-)«Ñ/ÈTY\rº,\'ÑzÜbpÓi IÉ¦Ä¥É)CÜGA°úT¶ú=p5ãÀúÿñ«R«Å®<ÈÛ0Íá¼s¥¡2\\â\\gÌ5SÔÀt>\"Øê¯ùÁïC`{®tô®LLcéàXãN¡¼47þ~¡Q6\nUkSLkqh_äUT)pìIw­FÎÎEë¼ñg´0*y÷fO_#P4e$ù¹0¸kw}Âb¡¦A¡±ù×Ç6öHÀã»ã£(k\"FÃVq`²X(27à0üíì¶HiÅÂ~vÎ>Æ¾CLù?@Ø}ª6ãéÞúJ¦ò¡÷\ZüWÓi±ÔøI£^ómuª*ÅàPÍfÂ^%hQ*ÚD[C´àv`2ÏBÄeaA-(2ædA*pÒ¸wv¹.GM=:ÓÜÛ:ÞÇö÷10M¡þLÐÐÆ¤Ø l@CI6BÇa×SÒE©DCÔÀ/H[$¸Éã*¨¡B!s]fkw\09pIît®4±{&Éj i,§Tñ<J*\"ÔgX e´aðGÕ¥}ã?Ç@Ç=ÃÇÖ¢ £N÷ì>xàg10f@ß&Ì\ZÄÄÇñãTÝ$^^hÁ°!ý¹\"(H)ûÖ', 'SSLCommerz', 'pickup', 'Azampur', '1', 110, 'SSLCZ_TXN_642c0e1d4c02c', NULL, 'XAwV1680608797', 'Pending', 'csa', 'sds', 'Afghanistan', 'sda', 'ds', 'a', '2333', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-04-04 15:46:37', '2023-04-04 15:46:37', NULL, NULL, '৳', 85, 0, 0, 0, 0, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'd', NULL, 0),
(14, 41, 'BZh91AY&SY©ð7\0ðßP\0Xø/Oý¿ïÿú`}ñ@ FÔ	`\00\0L`À@&ESL\0\0\0\0\0\0\0&L\0&Â0\0$&zQ@ \r\09dÀa0L!#\0	&L4Í(ýFICM4ÞoQ$$ÄP¶ä=Ã±-û\'ø==(/¿!·âIzI\'ä2C8üäzÒZ\\¢z~È·±­íUiã(²­m9C}3®©3y5­XÛ§3³êT(Z§-Æd5\ntÓ0È<5õbk«·x¿¨«-³\Z\"ñFA$Aê\\Ðõ>GØn1Ccbx û0§y!,-_B\\±]@aÉ%¥~R|å¯HngCPí5GÄy Fã¤i,°Ñ#AÐØÜÓ@ÖÑ=íôVg]3CDÊd¨\0¸3! QçÂÂ-PÈÐm¢ªNñreýÊM1Md	¶	!¶ÓE©8¤c/Ìò5,[Q Ìd´\Zf3Îe­J7ÐeÕI´6´Í«yÀÂÊÄD\0Ø6EïzVì.]nI&\nZI½)|E­ÌRiÞ÷µ+~@Ì6$$û f	 ©ÄÉ!AU,©T3½Ub ñXV\0b J)+=Aj¤Q1@)1JÒ½¬EmF2/kÚé¥ÂX­\"ÅCwZU\nz/T%É}) cI1 g\")0\n#ýL&6CCbM$65Q)\rC4Á&\Z\Z@Á1\r\rcIMÂ\0GhÐqãIåLrsE&/CgZ*×&y\\»¤ÄF.Q ÀÁd-(sÀ«»ÚÁI!ÞB0 Énê,hf,UT@ÅÃxèXy§¢êGV3)@P{dsA1ë&xgjA°kÒÎ_8ivZK¯¼·Ü>ëÓï:¯~6WÑÞòI\nñøIçíªÂª!AmrV8Â¨mþeÒÒV´Ölì7T;Nàz¯3©E&%R8Cí©ÝUCÐÔeÜøHv±ó.Ç¢üÄ ¾\rK~Ô\0ëñ \rScÃP©ö¡L4ÒÍ>m\rÀ?©ØÁs¹Üjr\"Üx``8\\hòÔ?ac\'»ÆQuÌ2ÖÉA!pÅðdH|ÊçÀ3£G¶ª,ø,Ïð¤g±]ÎÃ2ãm3?1BRk¹)h2JPÏ\0ùLFl2ãò©~tz¨-Ú¸õú\ZÀa&\\¦SvJmÂ5l,t` f2O:R ÷ÉëÄ=Xµ<Uþ$¸z H÷`ï=2bcýÇ¼±Îá°É¡±ÓßæhPó)Ä(QU­M2®¥H1öU\n`7Iv­FÎ]Æ+¹àÏ]HOwg{ü3>ö4g¸O¸VÐeKdZß­	Å2Ná=^ö$ÎnªTfp¤a<@¤£]\nQl;EÉ`# Y®c@7Ø\\9hË,¹æv{<Uô2\ZgÖhÐùò0`}{RéTÜ¨¿Q¯C©ÆÓ`êz-|\rliäkuvª³s$øªÈhs:¬2ÏFÊÂKÀÈP}CJáÚAÉÉr1Y»l³<î1qBJ\ZÜ20\ZhcBcC\ZH¤Ø6$¡Á¤©c¡á©ÜwÈ­Ñ*Q\'Pð17\\BD=²ª\"^Pp5ÃEH¸$x;áë.bé¡fµP4È,Ìç¶*xr¥PSHÕñEA8WX¬aÀ¬\nuFgÄpâyÜü¾.®fâ¤îÿa÷Ã;Ç!5fC}ÌD5z/Üe8Þ	/¢H2åÌ°l8_âîH§\n>ð ', 'Cash On Delivery', 'shipto', 'Azampur', '3', 260, NULL, NULL, 'y4mG1680983413', 'Pending', 'sascorporationltd@gmail.com', 'rajan', 'Bangladesh', '01911812221', 'Dhaka', 'Dhaka', '1200', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-04-08 23:50:13', '2023-04-08 23:50:13', NULL, NULL, '৳', 85, 0, 0, 0, 0, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'Dhaka', NULL, 0),
(15, NULL, 'BZh91AY&SY=Ëùü\0êßPXø//ü¿ïÿú`}4 Ác\rm@PB`Ld0\0À\0\0J\0©ê\0\0\0\0444\0æ4À&C\00L\0\0¢RTü£Õ?M¥OQ´ÄÔhh\'¤\0æ4À&C\00L\0\0È@Õ6	ÚM4dÈ\Z?E6$©#y¬s=n§D!ü©?hþÞïwvÖâ	uM\n ÉÃráÇ>\ZnWOÄ0qAbÂ7;î¦G.N*/q	|²°ÚdKJLå&êÕ¹*u6ø+-\n¦û®#05#8ÿcÞ} þÜò?RÓºLôW5yÞÈøØ1àÜàð}Î×TàâªÇSCÒÐúOt)_ ¼Ju¯©EÄº¦%v/(Ku~rSHÈyL7¤ÎÆä|ì`@²I±c3W&æ,«,,×1­ånheÊ\Z\Z&P0?Ð²Xh!xÒ[J)	¶¨Ãpä¬8\Zm;âs®slý½jzFI¶	!¶ÓFS8¤c?A¨8+¼aQQB02­lbe­Ô¡°Ê&ÐØR³6½ç1FX£]ÜM¨YÒbÉÕºÆ\Z«Ö@ä\"*-ÝÜMlS#ÁÍHÂbL8Xã#R%IMZRQ§gX)TaÌ&ç4ÃÆrÎb²t¼ÝáÐÌJÉuuh¢C ¡`Æ(j$0ëC%P§û¡.+âi&4âM0úd«EÌeSIUi£F-Xç¬YQ°«)%¬Y\nJ\Zd\"¬ÉªðÕÂ¤(Þ(|pü#áEÕÁÔÂLæ\'ÃM;ªÒoo­](mDPºc\"¦é¶gS®ÇF¦X\nQ×RÅ«3\\&óÕÑ\nc3FescNNñÍª¦îÜóÚzCö|Oaú$Wø	\\té¿CÒ?U;¸âKÚÝ¸ã%·ÉË÷ùÒT3J2qéÎ×9â6Û×{Oå¾{Zrµúä¾=<ûÍyRhqU#q°|ªwUP¸s5e¿¯Ñ¸ò8¬nö´O­N\r¯Ã]Ñè`âìP¹©¼äi¸*@½ æ@$³OH6ÀÐ?¡Ð)s×#cqÈoÞ@ArHeÞc!£Àg¸?1c\'o}±Û\"ìµ° È/Ì?,ÃhÌmª¬¢ÅxÌÚfh$Gä×y)h2JPÅÁð/&	oûTË¡67wt?×ý\Zät(¿ï<¥S±44vä@ÇÚJH=á2\\Ô¸mðPz>¤àê½v?ã¶;<n¥núcéæXéNðâ2hq:ùú\Z=\no\nUkq®+qkRúU\n\\48¤¶P6r÷¯Á]Ä§]	íâcÜÆDp	òt*ZàU®PÈLeì)xdìøX9È!T©$ÌÞF£(ö$­t+EÀwa%D|MWQÐÞ>B× ´C°È2)eÛLÎï¡SÞ¯©¦PF§ßÎ7ÿ<6~Ò©È¨½¾btÚlO¸kí7ë­+0=\n½fÂ$C¡§C©ÊÃ _t$°2°¦R<ÒÈ6 æäÈÚ}óm¯ù¨ü=8L±VådQe±*²F,¤-I2Y%£­¹Îæy¸½Çiº¥J$ê¥ç%À Iq´ª¢ßÎ\r\r×p©çh{±Läkr¦@Yfg;EO TÂÀ\\ ÍFw\nÅC<WÕ ¿`ÆÏ6G?¶¢FK#ÎÏ+NWç^Bàé]\r;q½o£Ø³Å²JÙ©Ë¡×$ë|$ÏôBÒÒÑ¹?ñw$S	Ü¿À', 'SSLCommerz', 'shipto', 'Azampur', '1', 130, 'SSLCZ_TXN_6442443b4bb1d', NULL, 'grmF1682064443', 'Pending', 'bnvbn', 'b vnvbn', 'Vanuatu', 'bnvbn', 'vbn', 'vbnvbn', 'vnvbn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-04-21 12:07:23', '2023-04-21 12:07:23', NULL, NULL, '৳', 85, 0, 0, 0, 0, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'bnvbnvb', NULL, 0),
(16, NULL, 'BZh91AY&SYDÚ\0îßP\0Xø+Ûü$¿ïÿú`}÷M¨#aµ\0\0	9M0	À\0L\0\0(Ê*m&h\0\0\0 Ó\0\0Á0\0\0jD&¦M©´46¡¦6 i£¦Ó\0\0Á0\0\0\"&	¡ 5M<S&i4Ú	µ=KC3H!ò9Î:lXv³§§\"åFK_ÄBßùZI É£ôYûRZ¹ßu0sRqT´	«á3O¬\'ãfDÒC½¤ÖµcnJ*Nÿb¡C¡o.B¾$HÌHô= ùo±ó)ßÞ´<&qÔèòÄð$\'ºu	ÌrÂ$Ý7ã(ñÓz#hSö\nX·­êTKhXÆPüýòSß¦ÖNF§CUd ÐLJF\ZF-\rJÈ\ZcMZD\Z=pËZø43L dJÌ`Xq UåZNQt.Rm\Z\'Q©ä\r67Vóa`Æ(KEB# «c®\Zó°nI;\n¢©¬È\'ã4T`Ü pµ±Ã+h,QÈ&PÈ¡@PTkºµD¤³å#*\")zÕµW)ÀñJ\"¢æeÄç!ÒâÜpr	$aKbK(pÐã$(Ð\nC\"¡¶¨Räí+@¥QnZZjrxÌg.°!-ÒqçTnRäJ«U¤Q!PÐ1tL5ÉÂæS\0¿¦uÂN	ÙI\"0*Bö ]¨Áª)Ò\"%¬X¡\'\nTRB!di1\r	(\ZÆ7MÅ\0!ò~H¾ExFQvÔYFm09uÉ³Yìk[îÛm­(n 2¡ªc	czmÌÚ`ÛZ\Z]¬r)G]¥+3&¡7ÌÊ£}RòhÉdÞlg¢ÙÉÞñsJ©jvNn3ÎrÅGÄú\r²ù÷Ø:Í%ç3¸¿8êÔ÷jïØÿ£kÓ´v´B´~[üýÑ*¬/(7e$ÏKZá¦*÷»öimõ>Føî\\?$ÍOÄw7q:RhoU#qÐ?µNuT1ãA-Üsïcï,ÍÃE¿\"Eð?RRÇß¾~±í1568î\n/¤Ä	0ÐvK$óchm/ôÄä¹s±ÔÜq#\r¶  Ä8X\ræXC;ôî=<¡øÞ/ÖÆ,Ã]HXÐeñ¹!#öæ£FcmTY~Æ#² ÏäÃqÈÌ°ÛLÍHàÆMv%,ÆIJÄó.Hè3aKp£Ð\'^ð5Üqn*¾$`Æv¢7è\Z<81øRIèIæ¡sé°z(9>Áx­ï úª<NÂ`À!­ØÆ?aéè`q§PØdÐØîôò4 ¡èFà¡EVµ4½q ÇâUT)oIrZ9×yÙ]HO>üÉëâ_£\Z/°O«S@«[s¡a1à)væöÀ)°B©R3ä^\nhÊ e\ZgqJ#aâ\r¸\"F@³]Ã¡¨7>\"ÉFAbYdwý\n\nÙ\ZgÚhÐþü#v$õï}K%Syc#_C¡ºm6ÀkÐ×]jªÀæ®ÂÉ=F\'@½a%q2\\d(<F¸{Åx´òq_È©Å£Ñ\"NZSZJA#a\n (H4`t08\Zu9dXw%J$êÓ²Ü$ÄdòTP¡ºp3\\\\*@åÁ$CÄë[ÒÆ6M%ª¦@`²2QSÀ(.®;ÅR{6åÿvñýNÁ :#»ËÝQ\"ÊÁaØQÔä>ÇAÀ!?32êÄAâp3$jõ_QÞcÉ)üÍx\n\n\n Ôÿ¹\"(H\0¢Dí\0', 'Cash On Delivery', 'shipto', 'Azampur', '1', 130, NULL, NULL, 'hM981683088070', 'Pending', 'thenmcltd1@gmail.com', 'V', 'Anguilla', '01', 'F', 'R', '8140', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-05-03 08:27:50', '2023-05-03 08:27:50', NULL, NULL, '৳', 85, 0, 0, 0, 0, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'F', NULL, 0),
(17, 43, 'BZh91AY&SY*ËN«\0©@\0\0Pø/ßõ¿ïÿú`=÷@ÛAe hÑ d*9¦&\0\0\0\0\0	P	RdÐ\0\0\0jb`00\0	\0$ÔTmTôj ÏQP\0M=A iÀÀ\0&\0`	 L#%&ýD4ÂzÄÒÉ! Ù¸á<@>äýÑ:úÙø7nå\n¿qúZd÷!{¤iHH4,#q÷S5\'%K@¾BdÍ>2°²&\n8I²µc¤\ZMN\'\"å,\Zí!`;bHÉ;S?QïÿÆQÜö7ÎÌèè$J.n3$äq5<và ð%¼M\"¬VP¾ÚÖFàÐÈ=RA)\ZÑA0±1ygt2\0©PiB,ë&Ñl(¶@À\ZÅ¯bòÆ¢æÀÃIÒFAV*Ú¬ÁNAJÁFQTÖdB1@ÈM\rLÍ-iEch¨`ªMUDÔ\ZM¸ÈhTt¡\nTJª¶ªíB\"¢Þf5ËV71Ààç0¥1%8hqbMHºH7rE´³Ýèª-ËKMNR#åÖé	n: {tÈ(/\rV«H¢C ¡ bèj*h`ªî-¨KÜ¿J\0cBc@ã!uA*¾wQª)Ëhe#Ø)!RD$B2\Zh\Z&wH i3q´zm4bKPO¢¼±ñ|ú\Z%Ü\"©7¹¬Ô??>÷³Zc{Ùnk@eôÆÉáÍ*fáÈ0V¦6(æåôÆ©8Ìº¡NcæKq63Ô;b¸¼]ZªmOäòmÇÌzJ;©î032>ääþsÙGùõ~÷ù³xÛ^ÇH³Í¬Ôã[YeLU_Â¯Jj´-rcÐí¿õÎãbüIÞØÍÃÆBäÏ¼w+©Ì¢ÞpU#aÐ>ÊUT.\rYk¿? 6FÈÔh·àH³*}ÚàT©C3S¤ßópH3ÑyÀ1´6à\rõ8\ZH¶Í$r\\a^ÆÃû%t!#=Opùq|°.Ë<nIuKR5fAööUI6ÐO1Õ2,6Ó1A$81MIHÌd¡ÁØÚ^$£5qô©ê<BllåÄý¢£^]ÒåÝµ c])D¤Ì&KF>aØaA³i5Ìl@	!Pý	<º\"1úû)Ð6\Z{w4(w\nj(ªÖÃOÊØb±>\nª18$¹­FÎN¦6àz|µ$`Tõç¡=»ùQ¸QW2¥®\"­nëC1Bs8l~Êów\rq1#@äDnF\njÊ`eZæRxÕÁ¢Ád2ÌÕÆh¼¸NBÍ\r3js±ÓâXõWÌÈi>>`øF¬¹=¹>Æ	TÜT=ã_©\nã\Zm6:\Zõ3Ï:¢¬\\\nÍdÂZ¬¨¨o\"0ÌÞp7Xd	[BÄeaL¢±\nÃK\0ò ÞäÀ¹úô§£lé \"DÁÚ0FHÈ )\0XH0fGxÐë°æu[E(¨|åÒ\0ø ÛCÎUQBBëÂ\r[¸2²à!Üó®4À¾	¡dµP4È,§TðP©¸h3¬P1ÄY°ö£ûi_hÏ³Ì1ÏS¸º#b`(Þ2Veì£Äp6=Æ(ê4~lP1\r\ZÌÎ«ä2¼;$¿ÙñIÄ\n\n\n Ôÿ¹\"(He§U', 'SSLCommerz', 'shipto', 'Azampur', '1', 89, 'SSLCZ_TXN_646673026b5d0', NULL, 'VxYM1684435714', 'Pending', 'Rayidfashion@gmail.com', 'Jubair Bin Hossain', 'Bangladesh', '01771487674', 'Mirpur-1,Dhaka-1216', 'Dhaka, Bangladesh', '1216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'completed', '2023-05-18 22:48:34', '2023-05-18 22:48:34', NULL, NULL, '৳', 85, 0, 0, 0, 1, NULL, 0, 0, 0, 'Free Shipping', 'Default Packaging', 'Dhaka', NULL, 0),
(18, 34, 'BZh91AY&SY¸]«`\0¨_@\0Pÿø/ïÿ¿ÿÿú`?\0\r(*²\0\0\0\05 ÓA¡§© 4\0@\r&%\0\0\0\0\0\0\0Ì`&F\0F&&	\ZbiÌ`&F\0F&&	\ZbiÌ`&F\0F&&	\Zbi ÄÐI¦É<jzLz§¦¦Qê@($ÏAø¡ÔõíBæ/©ù¡>gÀýPÿgËå&\n-|F\"ÀÓ$Gï$³Z@kBã¢>lÈõ5µbhÄl¥U­§(p/ã8Jê7ejÇHZÍNÒäìÚT®1¨Ã3îùLyÌx~$]ú³Z¿9Ð@#ÐzOH2;øwGÈ©°ý¸ÏOÄP{¸¤Ò5`2²½¼ï%¸È»!%ÐÒLhï\Z¬\r4\rb ÃË<³ Y\r4ÛHú\"ÊP;Öx¶(gDÁ¤1\Zm;^q|M° !0aÃ`Òm4Iiµ\"ÖýAA¦Ä\rµ©F^ü(\"B\nLÍoy±ë8nØ6dõJÔÄE`ªÊî|ÑEb´D2´`f6o*T$¦$ª ¨Çrð¦àñX^àËXÄXW®VJ	Z£A/@!)JR48	(Lô¡ÃððV!)!K±ZEî´.ªÑ.HKæ¿J\0cBc@Æ0@(Êa1´8\ZR ¢c&I bìd\0Ègh4	ÆbcH&¢¡i3y¸zî5bK$¡¤	|3nÚÓÎLV1yPÂC»)3R´º¦Mä%`ïÎªäÓFibðf2¬ÒÑ,ëC;ÁqÅ yÀ`)°»H,\"ªap¶LâËhì:ç´ÆNømcâIÔ¡Ðö>\'ä{OYð=FÃð ¹xÞw#	¤%óÁÔp§ÎèË 9ZHebÐ±bIPóÉñê& I\"pim/y$xõeþ¬MYÁÚ6çËG:¡¬6ÿcÀîY¢ø½³ñå@¡\'À\Zñ9DHØsÒ§eUQ[¸iØâÁæ6\rÿÜ~d\Z?¾ê\0r`n,hjn2Ô*v/¤ ðÓÒ¡°:qsÙc°ÞE¶|Í¤C.-¦xÌÿÄ-Ã$$gÉåÙ·(ËÌ2ÖÊÅýã#Ã Å\ZY\rº,g¹b»ÎFe\r34$Áí%-IJÀ;Áxè3hË¯2Æ8Õì	¹·§#÷ú\r{É^-sî#fFNÛÏ0Éî­R\rÃT¡sí9Tm6«ù`ô\0Øø:	z2bcûÏÇ\Zv0PØvxx:¸P¢«Ze\\²¤ûÊª7¤¾ÃÆqèbÜæ}½@±ççÈÔ§§V4gqSÎjT¶\0¶â¹\nÃ3¸¦MÅ0Å;¬E 9¸B©RIÄ\'FP6kZÁ¢¡T°,ÖóÖs$>Ñqà.ÌD4ËPë¦g?úTè¯¡Ó4=j{xÆÜ×ês0Øº^âÄ,i´Øê8kÈ×M*XHrXayJê¸×Ðàdn°È=M!23ÈþD¤ð\ZX1&é¯m;Ûgn9}è?@cÚß­¦4&41¤ hÐ04`P¡ÀÔë°èu[±*Q\'Pò17[H\0òI4O9UE\n¯5\r¸p eeÁ$CÁÝnT¹¦Ú iYÏ8©CpÐÞAæ0-o>ô¾ÍoìíõÜwr8jwúl$a` Ð;Et)Áþcí:\Z($\"Å ¸æÅâ¤\r^Þ2MÝR_TxøùÐ6\r`Cÿ¹\"(H\\.Õ°\0', 'SSLCommerz', 'shipto', 'Azampur', '1', 321.41, 'SSLCZ_TXN_646a4afa08101', NULL, 't77u1684687610', 'Pending', 'support@itnayeem.com.bd', 'Suyel Haque', 'Bangladesh', '+8801722597565', 'support@itnayeem.com.bd', 'Dhaka', '4578', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-05-21 20:46:50', '2023-05-21 20:46:50', NULL, NULL, '৳', 85, 120, 0, 0, 0, NULL, 0, 0, 0, 'SA Paribahan', 'Default Packaging', 'Dhaka', NULL, 0),
(19, 44, 'BZh91AY&SYá¦R\0_@\0Psø/ô¿ïÿú`ð .\0$je&ª1hi£Fi \0d\Z©Òz)£@\r\Z\ri¦i \0æ\0\0\0\0\0\0\0\0*%\0õ\Zhm5\0Ð\r@\0\0\0\0\0\0\0\" !	©á4!ª~©´4Ñ§éOSbLI	#àæmèOÛÛÎÅèV¦¯»ë¤(TdµûD-H-2IûÌzÉ,ÚP¸è£_£2IzZ±A_©EÖÓp/®Õ&o&êÕ¶q.Svò¥lIµÍMyG\råäÉæi\Z¾g1 GSÌïFK2Ã¶ÆÖMïfý¢:òX´W{H~dàÂåâîæO2w$!dæAÐ@i j±¯m6Úf`É\ZP:Þhµþ¥J$0\ZcM§kÎ/¶*JØÂSl\ZCm¦­\"¶ÜkJ``d1~ùÍ*ë³I(  (2¤Á#PÂ)3KÞvp\Z¸Á°èñ\\bÅÎ$0XVhLÅiLæ-fBM;ZÕ¥m ÜHIüÊ f	 ©ÄÉ!*ªh5¥î\\ÃÆ.³,b,+×6J	¦sbÙ	TX\\Ío`J­³BÅQµítÅHC\nHRá,Vb¡»­ª<ÒÿKÕ}E)XaVFÌøé­ËÍ&5ZhÑUw+!YQ¤¤Uä,É\nK\Zä²d®ÓöàlÄA%³%þFß4§\ZcÈ¥`Ó	\nÅ$\\\"bÖ-HÇLÌ-­p\0ëÁ¡]d£YÒfÐdqht$e ³$ÍbeÍïE®sXfºf3k¬k\\6¨ë¤×wÃjYâzð>\'¸©ù;,|ðþÐô«Á¡Ò,<	/·2Òl*6d$F@Ôb	»ñÍY´oÒ\\sBWmýÏÔç?CEúÜ÷@¸2(9àx6ÉÐ¢ìw*¸êÒ§Jªa°Ë-üuäûñ¢ß©\"©©cå¾ Ë\Z\ZÌê _h8	3Aü%¢zÀÚ¸\"æNFÇ-¹n  Á$2Àn3sø%v!#<O>ø}ùô¹ZÑ0N/CJ\"¤yj\ZQ¥¨Û¨µÑh~Ü¯q3BÃm3DI#2mÀµ%.TÒ÷$7¸ûT¿\Z=loëÌõýÆ¡{ZçØ°aÛyjQ) ñ`ÔÁ&.¡î)ªèåN³lÿ­8ö6¤d7pÔª£ð<¼Køñ>\'KøÐÁÄo¸àPÔ¢î\nUk·¥²-Ö ÏÀÐ,¬Ðäï[ÆÎ}Wx³×yÀ©ïé©>^ã>\"Ì(àO¼UÔ©lV¸v¡úÍÅ2OpjOgÝ`Y¸¡T©ý)9îeùk¡Z.#À4¬K@Dlº>æð9{¯1hrjúhuû<Uõ24ÍOÄ>1½3%<º?	TâT?è×ØìBÀÆM§×änÛó7Y+0 vF!Ìä¨r\"-±Èæq°È94,¬) ÒH%Aí\ZW\\#¶¾ö¶Î>L9Ê©IlU¼Õ¥X«¬UC-!le±-KM\rÇS´Ü¥|¡a0C8IÒUQBBëì`ß\n9pIðv¿4Ð0g	¡JÜ iZ\ZOH©äP©Àl3 ªP3jÃàá£|øÃM·@uG//JW5ÂIîö:\0ì9	«2&ú±A¡ÀÐ¬U)ÃÁ%ùd{ýþhKFRäÿ¹\"(HCpÓ)\0', 'SSLCommerz', 'shipto', 'Azampur', '1', 57.5, 'SSLCZ_TXN_646e1ad54793f', NULL, 'e4l11684937429', 'Pending', 'sawonbhi754@gmail.com', 'Sawonbhi', 'Bangladesh', '01799234635', 'Ghhv', 'Chandpur', '3600', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'completed', '2023-05-24 18:10:29', '2023-05-24 18:10:29', NULL, NULL, '৳', 85, 0, 0, 0, 1, NULL, 0, 0, 0, 'SA Paribahan', 'Default Packaging', 'Chandpur', NULL, 0),
(20, 44, 'BZh91AY&SY½Î\0ðßP\0Xø/Oý¿ïÿú`\0L]M\0\r5=#CM=@\0\0\0\04Èª& ÈÁ\0Ì\0&\0	a\0I©*z¨\0\0\0\0\0\0\0À2`0&À !iGé6¤dzÊz&ò£b$#!s>gZ¸|Rù#ø+è~¿­*2ZúD-ß2KÒI>$3ÚIg¥ 5¡qÑF»2$½MmX ¯´¢Êµ´åë%uIÉ­jÆÜU8MI%dÖëpÌ\rcHÍÆf=G©íéÃSþêÏo¦«3lv!<w\"Bæ¡æ~ñZÄî 7x~Û\npt$%«äQ+ Kh02´¯óó\rÁÄäjf¨ø#$Þ0JFÉ1+\r4ÆòD`\ZcM[¢\rÏ}³ß@³6ä0ÐÑ2*¬ÀÐB(òÙIÎ-²Fe6Ñ	\0ÕGMÇ¯ºûaßt¼í.º2øªhµ\'eûæ¥j4ãAÆyÒµ¤ä2ê¤$Ú\nVfÕ¼àaeb\"\0l\"÷½+v.·IÂf/J_kq w½íJß3\"\rÄÔ©R`\n,H\\Y²ÊI£;ÐeV*¦.\nDä¤¦/PÃÚ© t²K¥éïBñV ºF#Q,È(YÂØ&Ù ¨`.ëBê¡O%è¸/TJHÒLhÀ*C\nÔ«ÆÕ`ÕÁIiEÑÖ,P£ä©¤`#1Ä4L$ hC\ZLÞnÂ\0GXÐmÛIáLpsEyÞ2Î´U®T®-GÙËIZÖZª48¡¥eCÅ\n]MCh¬ÞÆqÑ¡ÌYBuÍØÂ³6,ª¨Y,¤Õà«²jò3Áf2åõ4µTß>þÏyæ|Ãûqá äo>óæhyaì%zzÈ¶PnqûtÑm62øI²Í­P¡	©±Ct|E&m\n\r¹È²Øã©!Y·õ>\\ú¯;Û>!ñå@¬ØÐxÊ)48*´æNÊªF£,·qÙ!Ôãó.Ñ¢ûA{\Z?-Ô\0çð \rÇÀÁ©¸âlÔ*@¾°r IºY§²¡°6Äê\n`È8Üì58m»H0I°L®4wæa#\'³ºnQeÌ)HÃq%Åóè3eCBª¥ÄÎ\'è¤gÔ®ó¨Ì¸ÛLÏÄ`P¡AÁï%-IJàIAÈÍÃ.>úãG M´èBx±\"ÒÕÂC\0äDðÃD¡a2d`9í!\'¼ZÊÿ¸y HðÁÐL òÉcð<}¥4èM\rÇ/o¡CÄ¦Ð¡EVµ4Ê¸ ÇâUT)ÞëZ;WyÚÏMHO­ôï<Lú1£8á>¶*[ *Öþt,&3É;Ã2y½ö$ÎnªTfp¤a;@¤£\\QnÁ¢Ád°,×!ÔÐ\rû³¨fL¸RÁ×gWÔ©Ü¯¡Ó=æÏmçÔùJ¦ò¢þ¼d#	´Ø:DK^ã[\ZwÝ]@æ¬ÂÉ=Ê\"ÚNGyBK!2	3 ö\r+Y%Èé³Ç¶ÅML°ìI¿RJ`IR 10Á!C\"J@A(Ë\rÝNÃ¤Ü¥uÓu´ I×*¨¡B!sáÃ\\8TËH¤=r¥Ì]4,ÖªeõÅNà TÉdÀÖ:b¡bØÃù¯³AÃ<ú[6àv#º¢EÕÂÃ £;ßØ}ÁÀ!5fC}D\Z½Üe6îÔªH<<=¨j¹\"(HLÞç@', 'Nogod', 'shipto', 'Azampur', '1', 131.41, 'Ghhvccxh', NULL, 'uidO1684937525', 'Pending', 'sawonbhi754@gmail.com', 'Sawonbhi', 'Bangladesh', '01799234635', 'Ghhv', 'Fgg', '3600', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-05-24 18:12:05', '2023-05-24 18:12:05', NULL, NULL, '৳', 85, 120, 0, 0, 0, NULL, 0, 0, 0, 'SA Paribahan', 'Default Packaging', 'Gv', NULL, 0),
(21, NULL, 'BZh91AY&SY§k¾\0	ßPXø/oý¿ïÿú`\nÞ|\0\0\n\0\"\0BTs	L\0L&\0\0Lhæ\00M0\0\04Ð1Ì&0a0`\02i cL`Âa4À\0dÓ@Â(B£M4{P¦@0\Z¤&DÓ)M¥<~SQ6©§X¢\0eH2fài1_!ëG@Ð¯è<O[\Z°ÒÌiitDXQÁ©y8Yù®]GèÂÒta©XK9¿²Ë²thÊÌ#ZSgs&ìÌ´]ºÊXW$Õ0ºíW:2ÊR=GÓïªªÉªÓC«tï(à¤á¤²åNó³êú¬ìu(±ù=Næïìeä»ªï½ÑÜV}ÓÚ!=\"O©©ÐúCâu(¢s:º(»í.;?É?ªÉsqcØ]J\Z²ùF¦Dx¥I&ÊIEîèËè¼Ï%OÝ±fXYJs¹ê<K§Ü?~ªY\\8H<!.TÄ©RÊ#ÖwÐÙ*(¤¤*w¬³½Oì&w)9Ò¦ÔàÄ³è¤MÒÐ¬¬ÑÍÜhæúLæ¥ÍKÊNR¬¦	I±K¤§K´eÉvK~®Gþ?¹F²¢ÑJPRE)JJElÂÎYÃô|KK¼\r\rJSÈà£5\nBÊ4pá4hõ0{\nm)¡I)P¥´]v¬¶]ÁCI¤´±h°R(³V­Xeª­e=eË\ZBê*lÕ\Z¶Y£GÚÊbf%%6lÙ³´sKNÒæ\rZ²Ã{FZ·¶´22LBÊVRTjÊÍ\nhºË°Ù¨£FËÍdÕí	iv·²æÍ¦eÓ-×e«AvË£-°he75hÕ£T¢adPÂã\rEL°¶#aªbjw§÷Dw8]$¢¤wÅÂëIYùÝh¢JYieB\"òÌÅJ\\¹bR=J-{¤4¦$*BJT-IbQ\n¤)Z$±I\n*%§S·Gc¢¤G	zå$êêÂíXnïRì&Ô]ÃfMÍÍ&®`Î[°Ëf.ïp³cw&NNK¸á«Bò%eCVMÊ2£EÜ2ÁÃV¥ÒÍ)Ãbæ4QzW®j¥Y«É»ví\ZNN(Ù»-\rÙ²re±eÛë3uSæMÜ)ÃmTZÉ}ïVKÊ÷OÁÊ\\ñ¼as¡@Äö´9Ü¡÷¼Vü6¶èd}§QvfærChÊ$©ÎÉ«µ\\¹dÕgý®jÿÑeÓ*´ZX©Üábnä¥±%£JR´þ³Ô»ûÎùvR§ü;ÝiëuCCÂI¨äÙqlJ:Îa«&»ý¹Êëê:J4N¯%Ç:ÀÔy;¥CW\'óû&§ïubI<ß2ÁÖ|6\'Yá9:ËöZzPÚSTE9,RJrêxÉÆéàÖyN¾Y£¹ÜXXÚ\\²¦Üo©CíyÉÿE¼Õö7Y»É©²\Z7K\ZÉ³VÆåÇðbYèä8aHäR\'IÄüå´Ë´ñMJR§E&J´Ýs£´ºNr¥æ6ï6Yy¹W:Ê5)ö³5x0§9.Ðîy½sú¿úTw&ð>ãÑtÃíurÑÞX£ÿV{f%å§¼]syÑºy¬\">òt=©«üËñ\'È${ÛÏd$CäáD©E÷ÏÐÒz{b¥Ø§Ñðæ\'ÀÃ¸bb2¨èsnËbsfZlü&c)Ã²Iä)G{ÎlË´ö¨úºJd÷¼\\¥ÞÇº|>Ê(p²ÎÂïy4s)£pÊ³ÍBT£fºòîÃwKÎj,ºí¥å¹*`aú¯,eQã2Äv)´ÑBDÉÊ-zåÚw¼Þ$Ã,ÑRÓTËT²nN\'ö=É³¡º§ÎsÌ9MrNóQtÎAºÞ\\ÍAô£¸Êlª)IJÌù]IòÍÞ÷FÍeÁ¢=²Âòï¹0xË,ÕÒxÏYàÐ¢Ò)>t&ò¦V®eÎ-*Y,zJF©ç-«ÍeÞ×\'Åö°ôR{[?#æhÃ}bT`!a*)¥¥,TJQ!T, ¤¨ªIíÏ	Ò{Çì\\<RaÈ÷MkEZYy±Rï%ã(ÄÄ²Éö<-9N´ÉiK©båScÙe:7a«f±RGÒ-)(²iN.òYî¦ãfÊeNr\\fÃ=ÄÿMJ?{Ù&îN³ÜHï{dF©¨±Àû$Yç.ì§ºSì<¥-l  Ðè-%À %Øpe¼°|Ú0ê;<ÔÚý$Iï÷½\"T¨¥%( bCþ.äp¡ N×|', 'Cash On Delivery', 'shipto', 'Azampur', '4', 521.41, NULL, NULL, 'LHj01709023690', 'Pending', 'jakir01763@gmail.com', 'Pan Chasher Kutinati', 'Bangladesh', '01763383898', 'Horirampur Bazar, durgapur', 'Rajshahi', '5600', NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, 'jjjj', NULL, NULL, 'pending', '2024-02-27 08:48:10', '2024-02-27 08:48:10', NULL, NULL, '৳', 85, 120, 0, 0, 0, NULL, 0, 0, 0, 'SA Paribahan', 'Default Packaging', 'Kafrul', NULL, 0),
(22, NULL, 'BZh91AY&SYsoÕ\0êßPXø//ü¿ïÿú`}4 Á3\rmF9M0	À\0L\0\0(§z\04\0\0\r\r\09M0	À\0L\0\0\0¨¤?S?T{T~Jy¡¦4ah9M0	À\0L\0\0\"!4&OS%<¤Ó\ZC@ =BHéI\rÑÔõ¹8ÂÑêÛãßÞø|:ZH$QÕ4(\'aËú\n8i¹Üu?Áºº_u29rn©hñ¾!33OV£LiI$ÙZ±·%NF¼ÊSmÖñcb$fó2ÿÐö~½³²L³W4ó#©zHÃ½¥½ú¼-ª©j«L##°ò6Bäs$R«ì(°$Ä®Àeå	l¯ºJg	ó°âIÚlGüÌDMR}ÍìÔYVXY»n»í»}Ì¹CÉhhPÈ~á¡\\ÐB(òÒ[JÛÃhä¬8\Zm;ã9W)¶^fg°ª.4¬`Òm4ZfôãÔj\rÅJìTTPFU  ÐC-4£-nE\rFTi6Âµï9*2Ä\0Ø5\ZîâmBÎ1,QK¨aª½B\"¢ÝÝÄÖÂà89¢ISIdbSJRD¢))«JJ1@´ìñ*9Â\\æxÎYÌVAÒ |:YC.®­Hd!Â,Å\rDÝh`ªÜ¿Ä%½zÑ $ÆÂ)0\n#á0Ø Å*\n¦2dË++EYI,bÈRTXËL,EY+{rç¹I5@¢oßÂ1Á^]\\0QL$ÎbqPü4Ø3µVmZºPÙDPºc\"¦ÔÛÔÁ«±Ñ©Ö!BuÔ±jÌ×	¶s£m¦34fY6ôC\ZrvÆW6ªSèâ=Ç¤æ9Ïi\'¬êXeÆ~ÍûÍºÏVæbNcÝ¹ü¶æuÁdUNLnKÙnÜqÛËøyÒT3J2oÓ	\"6ß£âáÍ²{oµûo]z:Þîw4àjQI½T¡åS¶ªÃ°ÐeÞÈqÆ­µcO¹~Jféy·h>6×jÍ\r§=RçaL.<É<àÚ0ûÎ!K,\rM-·iÉ!iGxÎàüÆzN½ðúcëvZØ¨$0Þ/{AT4*ªHÒdåGþÄq,m¦dI$p^M6c$¥nqy1$t´féS\rôzØÙÛÄø£\\%Ü}ªt#vfnÜúRIÐ%Í°ñLÜ¦×üx¡#·[îJPÄ<[*Q~\'_Ac9ñCyËÑÔÐ¡Ô¦Ð¡EV¶\Zc[J_ØUT)pÌÞÕ@ÙÃ¸½wìùì <yfOOæ4c¸\'ÄUÌ©kV·kC1°¦IÜ«ÝbL§\0R¤3yNl SÌ\nµÄ­áÜ, õ.C´ÎÓ³C°È0)e×<¿£¡Ù5fÖ²¼¬ÈÍæá¾ö¶|o6©:S¡?Ñ¯Ð]6SÚDµê6é¥+0:5t|$F\ZNG{a%ÊÂJ\rÕrÉ¤âÃÉ¥^Ãëk¯kóaU<&,U¸¬H¥X«¨«$adµ!jI)dm.§f×qÒEnIR:°¼à· .2uTP¡¹öA²î rà!Üéf4À¾	¡d¶(\ZdFS¬Tð\nLV!r4Ú+ql<Í ¾áþ{O\05Ggª¢F\0 æ(î\'{ð3QÀÇ!?Áh2îb!½±´O´n7ñss|¤wwRââîH§\nmú°`', 'Cash On Delivery', 'shipto', 'Azampur', '1', 131.41, NULL, NULL, 'iSoV1709024092', 'Pending', 'teletel_pabx@yahoo.com', 'JNANA PRADIP CHAKMA', 'Bangladesh', '01763383898', 'It Bhaban, Badamtoli Circle, Agrabad', 'Chattogram', '5600', NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2024-02-27 08:54:52', '2024-02-27 08:54:52', NULL, NULL, '৳', 85, 120, 0, 0, 0, NULL, 0, 0, 0, 'SA Paribahan', 'Default Packaging', 'Kafrul', NULL, 0),
(23, NULL, 'BZh91AY&SYtð.x\0ðßP\0Xø/Oý¿ïÿú`\0ô¡Å@Ó@ AM44Ð@\0\0\0\0 2*L\0\0Ä\0\00\0L\0L&	0`\nRCj¡ hh\0\0\0\0Ì\0&\0	a\0H24FL~ý$dzÊzJ6\"H¨2Cæs@õ_$~Å}Ëò±rFK_AÃæIzI\'ÐdqùÉ,ô¤´.:(ÓõfD©­«ñ¾YV¶¡À¾¹ÂWT¼Ö¬mÉESÛîT(Z¦ü-d5}G¼ñãËSô)Ï=þãMVføï=HÑ±$Aè\\Ðô>°Æ-wèføS©!,-_yD®X.ÄÐ`2e	i_ñó\rÁÈì5f¨óFH°Át$\rX]òM	#qÎ4hLL\\\"kgµÌßÃCDÊd¨°3A£Ëu\'8¶ê\ZÛFJTÕNmºé¿½®úê{MÀFó:±@Ä¥RÑjN)Ëó<\rKÔh3-Æó¥kYPì\'Q¤Ú\nVfÕ¼àaeb\"\0l\"÷½+v.¶$-$Ì^¾\"ÖäA)4ï{Ú¿fD		?±R¤Á$(Ã#BiILB\"¡¬àR ¡Rd§))3(>.ÙÊL%:E¼fAéÐ¼Bfg3Q0È(aÃ*HÃIPÀ]ÖÕBKÑ	q_TJHÒLhÏSfgÇLbÌ2J7440¢N(Å#!0IXPLW	%q¸¸w0®ÔÆ~úO\Zc(cÎô0`±u¢­r¥ql?OMEîgzk¹ØâÔAË)\nn[eê0k9\ZX]Pæ%G]CVfÎww2oF«.73É4än­o*©L1Â}ú#à|³üqå ì6?ø\ZX{_SïÊ8ÏÜphñ°¡&Ì6µB&¦Å\rÑñ`ehPoÎEç¨A\nÍ¿±ô9ÏÔÍ|Ù³âl<¨s7èô##^GBM*¤o:ÝSºª°Ôe[¤;@à~Ã¸Þ4_qó(/pÃRçßÂ<Èæ`Ôàr7j _h;a îiîchl\rÁñ;B2W;N$[~òC,ó+:î3Äd÷wÃõew\\¥&mpÈVh±ÃÔ`nîÃXT6*ª@Úf~*F}ìviø\n(82]KARxÄÄdPr3ËÂ¥ùQèb\ntGO@Ê!@8XÄÒÂBø|Ý 1à%0BhLÃÈaAÉï§z¿ðH=:\0Y11~ÃÇÚXåN¡ÀdÐàv{|M\n%7\n*µ©¦UÀ´©>âª¡LÉ.kQ³qìzé©\0À©ìíÜO_ÄÏ«\Z3Ø\'Ø+h2¥²­mÒÆbÂ\'`Ìkg7U*@I38R0Ì RQ®Â\\ph°Y,$d5Ø0û\Z·nä*¢.°sÏ3·ìTïWÐÈió@FáÆ7Áôí}¥Sb¢ý¼#	´Ø:DK^ã[\Zx\ZÝ]@è¬ÂÉ=ê\"\"ÚÃ@¼¡%ÊÂKÀÈPzÆÃ%Èë»ÇÕNÅGÞê{!ïâ¹$VF)É1$JKB\nä´BÇCÕ©Üu[±*Q\'Põ­á\0\"Lrª\"N0n5ÃEH¸$x:Ã×*\\ÅÓBÍj iYÏ8©Þ\n,\ZÐgh¬T3Ì[5û´à3áÔ2Ý¼ð¹x{ª$]\\ Ì::³ýÇÔîÔrVjWN\rÆ¦Á±ÿ³¸Õü*(((Çþ.äp¡ éà\\ð', 'Cash On Delivery', 'shipto', 'Azampur', '1', 131.41, NULL, NULL, '4EaK1709039108', 'Pending', 'support@itnayeem.com.bd', 'Test', 'Bangladesh', '25566699666', 'Ddjsjsj', 'Xnjxjx', '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2024-02-27 13:05:08', '2024-02-27 13:05:08', NULL, NULL, '৳', 85, 120, 0, 0, 0, NULL, 0, 0, 0, 'SA Paribahan', 'Default Packaging', 'Djdjjd', NULL, 0),
(24, NULL, 'BZh91AY&SY5ÂÒ\0ðßP\0Xø/Oý¿ïÿú`wÀzPe@Ó@ AM44Ð@\0\0\0\0 2*A \0 44\0s\0ÉÂ`C\0F\0¥$6¨Ñê\Z\0\0\0\0À2`0&À#BiGéOjG¤ha¢?JHâ\"\"!bvO×@@û\'ÅÙÇ/,0@Ékæ1¸~d¤|ÆHg´ÏZ@kBã¢?Û2$½MmX ¯ô¢Êµ´åôÎº¤ÍäÖµcnJ*Ï%BªoÂØfCY`±¸ÇÐ{Ï!~<µ?ÑNÜ÷ûÍ5YãÀï@\\÷ö	\"Ræ©èxbÐàp g±Pøò7ÂI	ajùJåæL¡-+é%= \"ã¼Ãpr9iª>#ÈÉ6.«¾I¡!Än9Æm	kAÁílö Yòhh@ÌV`h!yn¤çÝC#B²arH\rXp5M·]7÷µÓ]Oi±8ÞgV1¨ªM¤â¿cÄ©bÚc% ÀÐC-t£-i9éÔi6Âµo8YXÈ½ïJÝË­$ÁaKI3¥/µ¹JM;Þö¥oÄBOèT©0IL$.I\n\n¬ÙeJ¤Ñè2«ÄÓ&Jr1rÃâí©°tÂS¤[ÆdÁ$!Vfs9E1b¤5î´.ªó^¨Kú\"R@Æc@Îxb4Às>:caPèá¼Äi¡¡qF)	HDÀ²Ä$b¸H,sÅÃ¸áv výô4Ç4PÇè`Ác,ëEZåJâpý=5¹é®çcQT3,X¤)¹m¨Á¬ätiauCPueY8MÝÜÉ½R®$¸dÜPÏ&Óºµ¼ª¥0Çlæè|Cò({ìPeÆt±ûÏ¡¡ç¸ô;t8 îPqÆ~ã[GÌ¬½	6aµª!56(n¤ÃVüäYnqØ¬Ûú3¶~kò\'fÏÀ ØyP í7àõ##^GBM*¤o:ÝSºª¨Ë.·HvÀûËq¼h¾ãó(/xÃRçË\0:|Hñ0jp9µ\n/¬Èa îiîchl\rÁøL+Æ§-¿y	!yÆì3Èd÷xCïÊ2î¹JLÚ0á¬Ñc°ÀÝý°¨lUT5µø©õ+±Øf\\m¦gä0(P àÊMv%-IJàIAÈÎ.?\ZåG MèBp±¥\'+ðù»@cÀKa=Á2d`:o1\'ÀZ\nÿÜ<Ð${pu<òbcý§¸±ÊCÉ¡Àçîò4(yÞ(ªÖ¦WÒ¤ûª0$»V£gãØïg®¤§·³q=|O#>¬hÎ#`h­ ÊÈ\nµ·J\nd2z=¬IÜ!T©$ÌáHÂw2HF¹¢à;EÉ`# Y®c© pîB¡!2áKnyR§¾CLø\Z4>þ1¾§cè]*þ\Zó:&Ó`êy-{Íliâkuv¢³s$ø*hr9l2ç	,VÊX$ÎBØ4®¤\\#®ï.ý=½ÔöCßÅrH¬R	$bH0\nÈ%fBÇC¿S¸ë\"·4©DC¼ÄÝoA`döÊª(P]8Á¸× rà!àë\\©sM5ª¦@Yfg=±SÀ(2Y05 ÎÁX¨g·0þ+ìÐcÏN¡íçÈÛÇßQ\"êáaÔQÐØ}NáÀG!5JéÂa¸ÔÂx6?â6sCw\Z¿C²XÿÅÜN$\rdp´', 'Cash On Delivery', 'shipto', 'Azampur', '1', 131.41, NULL, NULL, 'chw51709124498', 'Pending', 'Habbsbaj', 'Gajsn', 'Bangladesh', 'Sjjsnnnskjj', 'Jajjb', 'Sjbs', 'Ksn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2024-02-28 12:48:18', '2024-02-28 12:48:18', NULL, NULL, '৳', 85, 120, 0, 0, 0, NULL, 0, 0, 0, 'SA Paribahan', 'Default Packaging', 'Jajbwn', NULL, 0);
INSERT INTO `orders` (`id`, `user_id`, `cart`, `method`, `shipping`, `pickup_location`, `totalQty`, `pay_amount`, `txnid`, `charge_id`, `order_number`, `payment_status`, `customer_email`, `customer_name`, `customer_country`, `customer_phone`, `customer_address`, `customer_city`, `customer_zip`, `shipping_name`, `shipping_country`, `shipping_email`, `shipping_phone`, `shipping_address`, `shipping_city`, `shipping_zip`, `order_note`, `coupon_code`, `coupon_discount`, `status`, `created_at`, `updated_at`, `affilate_user`, `affilate_charge`, `currency_sign`, `currency_value`, `shipping_cost`, `packing_cost`, `tax`, `dp`, `pay_id`, `vendor_shipping_id`, `vendor_packing_id`, `wallet_price`, `shipping_title`, `packing_title`, `customer_state`, `shipping_state`, `whole_discount`) VALUES
(25, NULL, 'BZh91AY&SYÖ]Mg\0êßPXø//ü¿ïÿú`}4 Ác\rm@PB`Ld0\0À\0\0J\0©ê\0\0\0\0444\0æ4À&C\00L\0\0¢RTöOSÅOÕM¥SÒhh\ZyG© `Ld0\0À\0\0HL	Õ6&ÓÚ\0\0?DÔ9FÃ|yÞÇ\'T!üØþß·ÃÃ¬ESB2pä¸qÏ £ÇSñPX°Îû©Ë¥ KÇBff,¬\'6Ò9IºµcnJ\r½åB©¾ëÌ\rbÄHÎ&ÿ¡ï=£ üû2?³ºLôW5YÜÈöÚ1äÖÚò}nöåTÚÜªÇ&­¡é=æèR¼BâE(aÒ¾eCèØ¼¡-ÕøIM #!å0ÞvÉ<ÖÆô{Çèf 1dRÆ):\\Dn,«,,áàù[*rà4,\ZE4¤çÒ\nBmð0Ü9«NøëÛ?CCÌª.4¬`Òm4ZfôãÈjJîTTP«AA [¥kt(l2£I´6¬Í¯yÌaQ  Á¨×wjtF²DuDE.¢1ªõ9ww[ÈÇÁÍHÂbL8Xã#R%IMZRQ§gX)TaÌ&ç4ÃÆrÎb²t¼ÝáÐÌJÉuuh¢C ¡`Æ(j$0ëC%P§þ!.+Üi&4âM0:d«EÌeSIUi£F-XãY\"²£aVRK%X²4É&,EY+zíÞÛRNxâ(|pü#áEÕÁÔÂLæ\'ÃM;ªÒoo­](mDPºc\"¦é¶gS®ÇF¦X\nQ×RÅ«3\\&óÕÑ\nc3FescNNñÍª¦îÜóÚzCö{\"Ã.3òH>Oë7<¸3è>Ç~}Ë\"ªwqÄµ»qÆKoïò³¤¨fdãÓ	®qdæ¶ÿ¯=íÜÓ¯ÌÇèÔc¥æ~s^FÅUHÜlúµT.£,·òÒCÞö5-Ë\ZýÍèSköïÔ^¦\rÎÕÎF¤ÒÂ\\y%z@1´6öÂ0267¶ýä$X\ræ2\Z;Æzðì;wÃëÆÙe­A|®`øæ£FcmTXÍ`üô+Àæfd6Ó3A$8/&»ÉKAR.y0Hè3xÌÖ¦\\hõ	±»·ûÿá®G2ì=gªu#ÜúÒI¬&K\r =£\nGÎ\\¦¿S¯øïÞZRC¿eJ1Äòö9Ó¸8NÏ#RMáB­n5Ån-jA2ª¡KÊÎ^¢õâw³å¸`Tñé¡=|zÑ>\"®K\\\nµÃj	½2O\0Ìg9* $ÈÂteU®eh¸àì0ad°/qªè0øÀìä-yD;\"P=´Ìíø=jú\ZgÐjÔú{#ê`§~Ï¼ºU9 ×ÄêB.M©ó-|Æýu±efQw,ØC¤à¨s\"2Ôæt9XdçVÊPlèVLw,Î¦8Ý\ZÙËÍéìÕÝmrçö¾ü©ëÂe·+$R,UTU1dµ!jIRÉ-n/;äÜõdVè(¨y\0D%ÆNÒª\"wd\Z®àR.	\"Î°÷bÉ4,ÖåL²ÌÎv@©¹Aí0-x/A~>¾¡7\0lÏ¢FK#´ÏCNå^·Ràë]\r<ØØ·ÑQ\rYÏª{Õ«yÃ©Ù$ì2C»»æ¥¥£)râîH§\n\ZË©¬à', 'SSLCommerz', 'shipto', 'Azampur', '1', 131.41, 'SSLCZ_TXN_65df4d2fef926', NULL, '0IEr1709133103', 'Pending', 'i@gmail.com', 'ismail', 'Bangladesh', '01621022754', 'd', 'f', '1744', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2024-02-28 15:11:43', '2024-02-28 15:11:43', NULL, NULL, '৳', 85, 120, 0, 0, 0, NULL, 0, 0, 0, 'SA Paribahan', 'Default Packaging', 'd', NULL, 0),
(26, 34, 'BZh91AY&SYÖ^Äþ\0©@\0\0Pø/ßõ¿ïÿú`=÷@ÓJbÆ`I9¦&\0\0\0\0\0	@E \0\0\0\0\0\0iÀÀ\0&\0`RSOU=<¨ò!´Ôm##M\r\0ÐôCb`00\0	\0$B&D#¤\r\0\Ziê4Ù\"ÄÌI\r3qÂxä~Ú|¢u9ÄüØý·I¿÷^dð!´|äp¨F\r1ìbqÛ)©ÞÐÅÐES:IÝk1Ô&ÇÐÁW\rø´òHÉ;CsoqòÿFaàìQÊx?#° G0y4`ï6$èx¼yÁðp$¢.Bi`2Ò4û(ûhi\Z<BKPù¤hcEA 4Ð5/]¶Úì¡HÔ(iB.í¥MâúPÙ\0hc8gµóÞÙï ´¸`^4¡U©ª/Là2ã22³Læ©ÌP2Ca3W¼¢ch¨`3ðÂKa°2RBLªH0II4ñæ1h¾cb ØbÅH,`¹!¡$\nÊ\ZXz*5ÅÀ8´N- Qb±KÔ VªE¤Åe\'¥yN%Zù¢å_KèªÂ¤+@-QrÁÑÚ½Å	|×â@hLhÈZ¨%WÚÕY\Z¢,´£4Dµ#Ô)!RD$B2ÀajQÆ PÈ#$h&Ð	qßz®UZV\\Q\rÖ¨×1w\\ìX-ïq2[ÞâÊ\'@!´ ¸|(*»(gA@Ò\\a]ÑXÖPL*­anZ¡E:aìaÁ½ÐF-G63+Þc¯QÈm43æx²æ&ñÓw¾3sêW@ïï½Ú·µÎà,ôdho{Ø±RõGÁ/ë÷U°M;ÂßXvq¡sRÃoê~Óûkæw/æO&Æw2$èlà¶çRÍXã°}Ö<l¨Às8ºßÞ q<M¡¸ÑäH¶,\rô,ÑÜÐ£cs:å#¼$IÕ= Ú¼\"ægîá#Ë;ÌØdô>aôðøèayÁ&`¦(¡ùê\ZÓÍuY>«è[àj\\m¦eHàÌ7%#aUÀ;LQGaÀûXÓ¾Bnwtð>ÿÄhè×b8`Ã¾äkµRRAæ&\r¨z(lm&F¹~ðÛ\"!²ç¨v	94$Dcô=½MuØ87<=}Á[¬×qÃô\Zß\"îW ÏÈ²°VNi.«q³äfüÏOý¹#Ç¿^úûóaGy>â¶ÅàEïò£A1¸¸EHjOgÇÐÐ£jÀB¹¡%Uk#ÅnË eêU.CXÒ5HÈStu}N\"ñðÙ\r3Bl[\\Ôíõ.{¬lj4ÌhÄ°î8Ý\'×£õ4JÇy`ìÚq<1bLÚc8C`ØuZ°­$ªTr\"4Øäs;î2ÏÜÐ²2Ð¦Q¹\nQ¥ xrrhG½ûW£lí´D/±*`(@R\0°a\rfs|àywO)ü*væ*\0ú ãFFOYVED/.pp\rðà@ËKHÎù­h«uLºÔÖzÅE©2:\når-~¤~m,q÷yvÜödsöùX	yp£x6µÔÿá\ZX6\rfnôu;PÀdPÌLpâaÁçsÒ@ååæ   R\rOø»)Â²ö\'ð', 'SSLCommerz', 'shipto', 'Azampur', '1', 89, 'SSLCZ_TXN_65df59bd1f30c', NULL, 'vQnM1709136317', 'Pending', 'ranafreelancer95@gmail.com', 'Rawnakul Islam', 'Bangladesh', '+8801752022195', 'Vill: East Shikder Mallik, P.O: Shikder Mallik-8500, PS: Pirojpur Sadar, Pirojpur', 'Pirojpur', '8500', NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'completed', '2024-02-28 16:05:17', '2024-02-28 16:05:17', NULL, NULL, '৳', 85, 0, 0, 0, 1, NULL, 0, 0, 0, 'SA Paribahan', 'Default Packaging', 'Barishal', NULL, 0),
(27, NULL, 'BZh91AY&SY¼ahÅ\0åßP\0Xø+ö¿ïÿú`¿b)\0ÛAQ$¨I§¨Ñ i 2\Z\Zhb@HHÉ\0Ñ \0Ñ£\0\0\0\0\0\0\0©¢z¡ `dÈÂhdÓ#L9\0\0\0\0\0\0\0\n¦¢¦S@ÔÐQµ6PÆRêªbª¦§èù¿7ùGèú¾K¾ÝçJËx3Ø1¶IüI~ãoeY×hÄBÉ&I:ÜvI,ëP+%\'Ïk6I:bâõÙT·wÜ8{ø²®fäì»c¨QES½ìpoâÍm.-3niæ{^æ|ö¶ç«Ñ»\Zß9¹©Jfõ)ÑUK6½ú½îHónpGk£¹½Í«a½ïv_qÉrðÃÚò õä	zÐ¶Àfå	y¹ð½PÝßÄêå^Á(Õ*ÜK\"ËS¹)LIR©+­ÂqåË}Wm/FmqCÓbg\"_7SÄc{,à¼ø\"kÀÓkd>&¸Ìã£d2Ól\ZCm¦ªãÚu,°ÀÈ6 mc5TÍj1GACTÐØEÌãZ:@ÂÆ`@Ø6Fk5yÀÉ°[Uâ/\0ÈM¡§bêñ&H<:x,$Ì$2I×Â°³ª5@õ1dYÞ»)mkÂPMoq&±°KR¯syÀN¥^7FF¶gÆSBTd ÖU,4wFUwÅ	y¹í!%	 cH¨O×ÚA3mBN/uÖEvÅZVIUu\"*P©TEDªJF,¤ASw±% IzZ/XÅÛÖçºµÝ*û<îÌ0wtºW|Uë<q\Z7Î1Ï½ë<>Z!£YÎq\Z7ÅÑÆ`Èã>4S(ÃQÅÉ4¹Þ÷|²­Þ\rÜ*åèÝÇNyß­¥(JMÇFÁc$hÏæ7HìT#b8ÜÔËåÕ±(Ë&!:	)@@9±(!ËüÃñuâE¾\\|\'JËoÎyÀö6{Íõû/Ý#ä³¹6àYäÞÿI£v½îkêÅmîåÿ:VUS¹½WÝß1ÙÍ9µ|QÕÚ×ö]]Ç?ÇoÅ©uÃ½ëldäðnàbÕu7q<jê¨­é­ªidII~O}»ËeÆÎ-r\Z.´d¦.ö®)tr{þË×¹F¾~ËNÛ_Úf1y(f³£d?Ý4¸v.8[?eécÅ«¹%IQ²®ºY­Û¸.6¢ì0k¡-ÄÓ«¦(àÓ¦,ùa7É¿Ã¹ôþ´v:±¯9^KpÚmrY¼°À]gR÷hðhÕe·EÁ\\kOÅ÷=ô¥=z:* X|ÓÑ²*\"\'±îõ3xaÔäEèí<~oIÐô0®¡E+k°é»Ò²\r}Å«0Ðìª¯\ZÞÙÍ¦;q÷ºÈ1{{ö¯×Ø×ç£\'æòYmvøÐdLf°)òW9\'Åù2IÌä!Yd3¹OFPT¦¸*Ôk Ñò¥´\"(òï!öpS·±[óVÊJ»C¹^vOUi¹±*4ýQTù¶­ÂÍ§èÎ«&ÒWÙÑjÁ$*DÅðu_	^÷\rûñ¦1^¦yW,%ì¸¢¦wèwç L>¦²1µYyUfÇbËÕ´ªÐñYÛ.Ñn½ÝpõÉtÍýîDT*JDZ©%JD¥D¤@²UHQ%P´%»:ïst½wUaTÄôdi«Â 42|%Z(¢!zWf,pD¸$¹>ËÝèÞ@p»\r2\'á|o6&K¶V\rªÞfÀÙ±[¡ø¤4äÏ¡®Þ59Ó»ÏÓ\ZUgYl:*ÞEùOºtx¥Él2à³bÉZµk|.µUýUQìö{hZÕÿÅÜN$/Z1@', 'Cash On Delivery', 'pickup', 'Dhaka', '5', 331.41, NULL, NULL, 'VQZ71709383088', 'Pending', 'yuiyuiyu', 'rtuiyui', 'Albania', 'yuii', 'tyuiytuiytui', 'yuiyuiyui', 'ytiuyi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yuiytui', NULL, NULL, 'pending', '2024-03-02 12:38:08', '2024-03-02 12:38:08', NULL, NULL, '৳', 85, 120, 0, 0, 0, NULL, 0, 0, 0, 'SA Paribahan', 'Default Packaging', 'ruiyuiyui', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_tracks`
--

CREATE TABLE `order_tracks` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_tracks`
--

INSERT INTO `order_tracks` (`id`, `order_id`, `title`, `text`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pending', 'You have successfully placed your order.', '2022-04-26 16:17:27', '2022-04-26 16:17:27'),
(2, 2, 'Pending', 'You have successfully placed your order.', '2022-04-27 03:23:52', '2022-04-27 03:23:52'),
(3, 3, 'Pending', 'You have successfully placed your order.', '2022-08-01 21:22:28', '2022-08-01 21:22:28'),
(4, 5, 'Pending', 'You have successfully placed your order.', '2022-09-04 17:56:34', '2022-09-04 17:56:34'),
(5, 6, 'Pending', 'You have successfully placed your order.', '2022-09-06 08:00:24', '2022-09-06 08:00:24'),
(6, 7, 'Pending', 'You have successfully placed your order.', '2022-09-06 14:59:02', '2022-09-06 14:59:02'),
(7, 10, 'Pending', 'You have successfully placed your order.', '2022-10-06 04:00:39', '2022-10-06 04:00:39'),
(8, 14, 'Pending', 'You have successfully placed your order.', '2023-04-08 23:50:13', '2023-04-08 23:50:13'),
(9, 16, 'Pending', 'You have successfully placed your order.', '2023-05-03 08:27:50', '2023-05-03 08:27:50'),
(10, 20, 'Pending', 'You have successfully placed your order.', '2023-05-24 18:12:05', '2023-05-24 18:12:05'),
(11, 21, 'Pending', 'You have successfully placed your order.', '2024-02-27 08:48:10', '2024-02-27 08:48:10'),
(12, 22, 'Pending', 'You have successfully placed your order.', '2024-02-27 08:54:52', '2024-02-27 08:54:52'),
(13, 23, 'Pending', 'You have successfully placed your order.', '2024-02-27 13:05:08', '2024-02-27 13:05:08'),
(14, 24, 'Pending', 'You have successfully placed your order.', '2024-02-28 12:48:18', '2024-02-28 12:48:18'),
(15, 27, 'Pending', 'You have successfully placed your order.', '2024-03-02 12:38:08', '2024-03-02 12:38:08');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `user_id`, `title`, `subtitle`, `price`) VALUES
(1, 0, 'Default Packaging', 'Default packaging by store', 0),
(2, 0, 'Gift Packaging', 'Exclusive Gift packaging', 1.4117647058824);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header` tinyint(1) NOT NULL DEFAULT 0,
  `footer` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `details`, `meta_tag`, `meta_description`, `header`, `footer`) VALUES
(1, 'About Us', 'about', '<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 1</font><br></h2><p><span style=\"font-weight: 700;\">Lorem Ipsum</span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 2</font><br></h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><br helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 3</font><br></h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p></div><h2 helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" line-height:=\"\" 1.1;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);=\"\" margin:=\"\" 0px=\"\" 15px;=\"\" font-size:=\"\" 30px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\" style=\"font-family: \" 51);\"=\"\"><font size=\"6\">Title number 9</font><br></h2><p helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', NULL, NULL, 1, 0),
(2, 'Privacy & Policy', 'privacy', '<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><img src=\"https://i.imgur.com/BobQuyA.jpg\" width=\"591\"></h2><h2><font size=\"6\">Title number 1</font></h2><p><span style=\"font-weight: 700;\">Lorem Ipsum</span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 2</font><br></h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><br helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 3</font><br></h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p></div><h2 helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" line-height:=\"\" 1.1;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);=\"\" margin:=\"\" 0px=\"\" 15px;=\"\" font-size:=\"\" 30px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\" 51);\"=\"\" style=\"font-family: \"><font size=\"6\">Title number 9</font><br></h2><p helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'test,test1,test2,test3', 'Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 0, 1),
(3, 'Terms & Condition', 'terms', '<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 1</font><br></h2><p><span style=\"font-weight: 700;\">Lorem Ipsum</span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 2</font><br></h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><br helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 3</font><br></h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p></div><h2 helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" line-height:=\"\" 1.1;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);=\"\" margin:=\"\" 0px=\"\" 15px;=\"\" font-size:=\"\" 30px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\" 51);\"=\"\" style=\"font-family: \"><font size=\"6\">Title number 9</font><br></h2><p helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 't1,t2,t3,t4', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pagesettings`
--

CREATE TABLE `pagesettings` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_success` varchar(191) NOT NULL,
  `contact_email` varchar(191) NOT NULL,
  `contact_title` text DEFAULT NULL,
  `contact_text` text DEFAULT NULL,
  `side_title` text DEFAULT NULL,
  `side_text` text DEFAULT NULL,
  `street` text DEFAULT NULL,
  `phone` text DEFAULT NULL,
  `fax` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `site` text DEFAULT NULL,
  `slider` tinyint(1) NOT NULL DEFAULT 1,
  `service` tinyint(1) NOT NULL DEFAULT 1,
  `featured` tinyint(1) NOT NULL DEFAULT 1,
  `small_banner` tinyint(1) NOT NULL DEFAULT 1,
  `best` tinyint(1) NOT NULL DEFAULT 1,
  `top_rated` tinyint(1) NOT NULL DEFAULT 1,
  `large_banner` tinyint(1) NOT NULL DEFAULT 1,
  `big` tinyint(1) NOT NULL DEFAULT 1,
  `hot_sale` tinyint(1) NOT NULL DEFAULT 1,
  `partners` tinyint(1) NOT NULL DEFAULT 0,
  `review_blog` tinyint(1) NOT NULL DEFAULT 1,
  `best_seller_banner` text DEFAULT NULL,
  `best_seller_banner_link` text DEFAULT NULL,
  `big_save_banner` text DEFAULT NULL,
  `big_save_banner_link` text DEFAULT NULL,
  `bottom_small` tinyint(1) NOT NULL DEFAULT 0,
  `flash_deal` tinyint(1) NOT NULL DEFAULT 0,
  `best_seller_banner1` text DEFAULT NULL,
  `best_seller_banner_link1` text DEFAULT NULL,
  `big_save_banner1` text DEFAULT NULL,
  `big_save_banner_link1` text DEFAULT NULL,
  `featured_category` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pagesettings`
--

INSERT INTO `pagesettings` (`id`, `contact_success`, `contact_email`, `contact_title`, `contact_text`, `side_title`, `side_text`, `street`, `phone`, `fax`, `email`, `site`, `slider`, `service`, `featured`, `small_banner`, `best`, `top_rated`, `large_banner`, `big`, `hot_sale`, `partners`, `review_blog`, `best_seller_banner`, `best_seller_banner_link`, `big_save_banner`, `big_save_banner_link`, `bottom_small`, `flash_deal`, `best_seller_banner1`, `best_seller_banner_link1`, `big_save_banner1`, `big_save_banner_link1`, `featured_category`) VALUES
(1, 'Success! Thanks for contacting us, we will get back to you shortly.', 'support@itnayeem.com.bd', '<h4 class=\"subtitle\" style=\"margin-bottom: 6px; font-weight: 600; line-height: 28px; font-size: 28px; text-transform: uppercase;\">WE\'D LOVE TO</h4><h2 class=\"title\" style=\"margin-bottom: 13px;font-weight: 600;line-height: 50px;font-size: 40px;color: #0f78f2;text-transform: uppercase;\">HEAR FROM YOU</h2>', '<span style=\"color: rgb(119, 119, 119);\">Send us a message and we\' ll respond as soon as possible</span><br>', '<h4 class=\"title\" style=\"margin-bottom: 10px; font-weight: 600; line-height: 28px; font-size: 28px;\">Let\'s Connect</h4>', '<span style=\"color: rgb(51, 51, 51);\">Get in touch with us</span>', 'Bhabarpara Mujibnagar, Bagoan, Mujib Nagar, 7102,Meherpur', '+8801511777744', '+8801511777744', 'support@itnayeem.com.bd', 'itnayeem.com.bd', 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, '17391381831.jpg', 'http://google.com', '17391382031.jpg', 'https://www.ecommerce2.designnetic.com/', 0, 1, '17391381832.png', 'http://google.com', '17391382033.jpg', 'https://www.ecommerce2.designnetic.com/', 1);

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` int(11) NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `photo`, `link`) VALUES
(7, '1571289583p1.jpg', 'https://www.google.com/'),
(8, '1571289601p2.jpg', 'https://www.google.com/'),
(9, '1571289608p3.jpg', 'https://www.google.com/'),
(10, '1571289614p4.jpg', 'https://www.google.com/'),
(11, '1571289621p5.jpg', 'https://www.google.com/'),
(12, '1571289627p6.jpg', 'https://www.google.com/'),
(13, '1571289634p7.jpg', 'https://www.google.com/'),
(14, '1571289642p8.jpg', 'https://www.google.com/'),
(15, '1571289650p9.jpg', 'https://www.google.com/'),
(16, '1571289657p10.jpg', 'https://www.google.com/'),
(17, '1571289663p11.jpg', 'https://www.google.com/'),
(18, '1571289669p12.jpg', 'https://www.google.com/'),
(19, '1571289675p13.jpg', 'https://www.google.com/'),
(20, '1571289680p14.jpg', 'https://www.google.com/');

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` int(11) NOT NULL,
  `subtitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `subtitle`, `title`, `details`, `status`) VALUES
(46, 'Make payment on Bkash', 'Bkash Payment', '<font size=\"3\"><b>Bkash Merchant Number: 017XXXXXXX</b></font>', 1),
(47, 'Ok', 'Nogod', '<br>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pickups`
--

CREATE TABLE `pickups` (
  `id` int(10) UNSIGNED NOT NULL,
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pickups`
--

INSERT INTO `pickups` (`id`, `location`) VALUES
(2, 'Azampur'),
(3, 'Dhaka'),
(4, 'Kazipara'),
(5, 'Kamarpara'),
(6, 'Uttara'),
(7, 'any');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `product_type` enum('normal','affiliate') NOT NULL DEFAULT 'normal',
  `affiliate_link` text DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `category_id` int(10) UNSIGNED NOT NULL,
  `subcategory_id` int(10) UNSIGNED DEFAULT NULL,
  `childcategory_id` int(10) UNSIGNED DEFAULT NULL,
  `attributes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_qty` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL,
  `previous_price` double DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `policy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tags` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `features` text DEFAULT NULL,
  `colors` text DEFAULT NULL,
  `product_condition` tinyint(1) NOT NULL DEFAULT 0,
  `ship` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_meta` tinyint(1) NOT NULL DEFAULT 0,
  `meta_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Physical','Digital','License') NOT NULL,
  `license` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_qty` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `licence_type` varchar(255) DEFAULT NULL,
  `measure` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `best` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `top` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `hot` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `latest` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `big` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `trending` tinyint(1) NOT NULL DEFAULT 0,
  `sale` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_discount` tinyint(1) NOT NULL DEFAULT 0,
  `discount_date` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whole_sell_qty` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whole_sell_discount` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_catalog` tinyint(1) NOT NULL DEFAULT 0,
  `catalog_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sku`, `product_type`, `affiliate_link`, `user_id`, `category_id`, `subcategory_id`, `childcategory_id`, `attributes`, `name`, `slug`, `photo`, `thumbnail`, `file`, `size`, `size_qty`, `size_price`, `color`, `price`, `previous_price`, `details`, `stock`, `policy`, `status`, `views`, `tags`, `features`, `colors`, `product_condition`, `ship`, `is_meta`, `meta_tag`, `meta_description`, `youtube`, `type`, `license`, `license_qty`, `link`, `platform`, `region`, `licence_type`, `measure`, `featured`, `best`, `top`, `hot`, `latest`, `big`, `trending`, `sale`, `created_at`, `updated_at`, `is_discount`, `discount_date`, `whole_sell_qty`, `whole_sell_discount`, `is_catalog`, `catalog_id`) VALUES
(93, NULL, 'normal', NULL, 0, 11, NULL, NULL, NULL, 'hero honda', 'digital-product-title-will-be-here-by-name-1-94l93dsn', '1645888813m0s3wgOG.png', '1645888813Z8wuuTpc.jpg', '1568016463minimal (16).zip', NULL, NULL, NULL, NULL, 50, 75, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 57, 'book,ebook', NULL, NULL, 0, NULL, 0, 'book,ebook', 'These are ebook from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Digital', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, '2019-09-09 07:07:43', '2024-04-20 16:28:07', 0, NULL, NULL, NULL, 0, 0),
(95, 'pr495jsv', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 95', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-1-pr495jsv', '1568027732dTwHda8l.png', '1568027751AidGUyJv.jpg', NULL, NULL, NULL, NULL, '#000000,#a33333,#d90b0b,#209125', 50, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 55555, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 65, 'watch', NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 1, '2019-09-09 07:36:06', '2024-04-25 10:27:16', 1, '09/08/2021', NULL, NULL, 0, 0),
(96, 'pr601jsv', 'normal', NULL, 13, 5, 6, NULL, NULL, 'Celeron N4020 HD Laptop', 'top-rated-product-title-will-be-here-according-to-your-wish-96-rdk96x5b', '1645888650VVRT95TW.png', '1645888650gKmgTXT6.jpg', NULL, NULL, NULL, NULL, '#000000,#15a0bf,#f5cf07,#2b4cc2,#247d32,#d62727', 100, 500, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 28, 'fashion', NULL, NULL, 2, '5-7 days', 0, 'fashion', 'Fashion meta tag from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 1, 0, 0, 1, '2019-09-09 08:00:05', '2024-04-08 07:01:06', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 0),
(97, 'pr602jsv', 'normal', NULL, 13, 5, 7, NULL, NULL, 'hero honda', 'physical-product-title-title-will-be-here-97-pr602jsv', '1645888575XTUPAnTl.png', '16458885752uoq3rDB.jpg', NULL, 'S,M,L', '2147483596,2147483597,2147483596', '20,30,40', '#000000,#851818,#ff0d0d,#1feb4c,#d620cf,#186ceb', 100, 200, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 96, 'clothing,bag', NULL, NULL, 2, '5-7 days', 0, 'clothing,bag', 'clothing, bag', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '2019-09-09 11:59:33', '2024-04-27 17:04:04', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 0),
(99, 'pr604jsv', 'normal', NULL, 13, 5, 7, NULL, NULL, 'Gaming Headphone', 'physical-product-title-title-will-be-here-99-hjm99shr', '1645888490o3nX2Mc0.png', '16458884909jf0XJbn.jpg', NULL, 'S', '2147483641', '20', '#000000,#851818,#ff0d0d,#1feb4c,#d620cf,#186ceb', 100, 200, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 50, 'clothing,bag', NULL, NULL, 2, '5-7 days', 0, 'clothing,bag', 'clothing, bag', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '2019-09-09 11:59:33', '2024-04-25 17:45:03', 0, NULL, '10,20,30,40', '5,10,15,20', 1, 0),
(100, 'pr605jsv', 'normal', NULL, 13, 5, 7, NULL, NULL, 'T35 22 Inch LED Monitor', 'physical-product-title-title-will-be-here-100-qqz100nzi', '1645888398x3pEs406.png', '1645888399DFLYIV9x.jpg', NULL, 'S', '55555555555555550', '20', '#000000,#851818,#ff0d0d,#1feb4c,#d620cf,#186ceb', 100, 200, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 79, 'clothing,bag', NULL, NULL, 2, '5-7 days', 0, 'clothing,bag', 'clothing, bag', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 1, 0, 1, 1, '2019-09-09 11:59:33', '2024-04-25 12:06:33', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 0),
(101, 'pr606jsv', 'normal', NULL, 13, 5, 7, NULL, NULL, 'Celeron N4020 HD Laptop', 'physical-product-title-title-will-be-here-101-8e1101lbq', '1645888309NAgW4NVS.png', '16458883098Cpf2qiO.jpg', NULL, 'S', '2147483634', '20', '#000000,#851818,#ff0d0d,#1feb4c,#d620cf,#186ceb', 100, 200, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 138, 'clothing,bag', NULL, NULL, 2, '5-7 days', 0, 'clothing,bag', 'clothing, bag', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '2019-09-09 11:59:33', '2024-04-27 17:04:38', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 0),
(102, 'pr607jsv', 'normal', NULL, 13, 5, 7, NULL, NULL, 'Blue Gixxer SF', 'physical-product-title-title-will-be-here-102-pr607jsv', '16458882370ca6vTpm.png', '1645888237pEbp27IR.jpg', NULL, 'S', '2147483620', '20', '#000000,#851818,#ff0d0d,#1feb4c,#d620cf,#186ceb', 100, 200, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 109, 'clothing,bag', NULL, NULL, 1, '5-7 days', 0, 'clothing,bag', 'clothing, bag', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '2019-09-09 11:59:33', '2024-04-27 12:33:58', 0, NULL, '10,20,30,40', '5,10,15,20', 1, 0),
(103, NULL, 'normal', NULL, 13, 11, NULL, NULL, NULL, 'DSL 450D', 'digital-product-title-will-be-here-by-name-1-laj1033wf', '1645888063d7IR94xA.png', '16458880639CB7WN0O.jpg', '1568016463minimal (16).zip', NULL, NULL, NULL, NULL, 50, 75, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 40, 'book,ebook', NULL, NULL, 0, NULL, 0, 'book,ebook', 'These are ebook from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Digital', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, '2019-09-09 12:07:43', '2024-04-23 09:18:33', 0, NULL, NULL, NULL, 0, 0),
(104, NULL, 'normal', NULL, 13, 11, NULL, NULL, NULL, 'D5600 DSLR Camera', 'digital-product-title-will-be-here-by-name-104-ffv1047iv', '1645887981YDoSri1k.png', '164588798188ascRxB.jpg', '1568016463minimal (16).zip', NULL, NULL, NULL, NULL, 50, 75, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 40, 'book,ebook', NULL, NULL, 0, NULL, 0, 'book,ebook', 'These are ebook from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Digital', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, '2019-09-09 12:07:43', '2024-04-21 04:37:08', 0, NULL, NULL, NULL, 0, 0),
(105, NULL, 'normal', NULL, 13, 11, NULL, NULL, NULL, 'marutti zigsr', 'digital-product-title-will-be-here-by-name-105-xpt105lfz', '1645887714GnHgikrH.png', '1645887714SqUaPeS2.jpg', '1568016463minimal (16).zip', NULL, NULL, NULL, NULL, 50, 75, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 25, 'book,ebook', NULL, NULL, 0, NULL, 0, 'book,ebook', 'These are ebook from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Digital', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, '2019-09-09 12:07:43', '2024-04-23 06:41:13', 0, NULL, NULL, NULL, 0, 0),
(106, NULL, 'normal', NULL, 13, 11, NULL, NULL, NULL, 'Digital Product Title will Be Here by Name 106', 'digital-product-title-will-be-here-by-name-106-iq4106dr3', '1645887438EnRurNWf.png', '1645887438l3ySPfkw.jpg', '1568016463minimal (16).zip', NULL, NULL, NULL, NULL, 50, 75, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 33, 'book,ebook', NULL, NULL, 0, NULL, 0, 'book,ebook', 'These are ebook from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Digital', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, '2019-09-09 12:07:43', '2024-04-23 08:27:47', 0, NULL, NULL, NULL, 0, 0),
(107, NULL, 'normal', NULL, 13, 11, NULL, NULL, NULL, 'Red Zigser', 'digital-product-title-will-be-here-by-name-107-4ll107cru', '1645887150ZPpDq2e8.png', '164588715049lH5LVS.jpg', '1568016463minimal (16).zip', NULL, NULL, NULL, NULL, 50, 75, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 43, 'book,ebook', NULL, NULL, 0, NULL, 0, 'book,ebook', 'These are ebook from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Digital', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, '2019-09-09 12:07:43', '2025-02-10 06:20:41', 0, NULL, NULL, NULL, 0, 0),
(109, NULL, 'normal', NULL, 13, 11, NULL, NULL, NULL, 'White Gixxer', 'digital-product-title-will-be-here-by-name-109-ext109m9m', '1645887081b20lIZug.png', '1645887081LlukKn3N.jpg', '1568016463minimal (16).zip', NULL, NULL, NULL, NULL, 50, 75, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 24, 'book,ebook', NULL, NULL, 0, NULL, 0, 'book,ebook', 'These are ebook from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Digital', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, '2019-09-09 12:07:43', '2024-04-27 12:01:28', 0, NULL, NULL, NULL, 0, 0);
INSERT INTO `products` (`id`, `sku`, `product_type`, `affiliate_link`, `user_id`, `category_id`, `subcategory_id`, `childcategory_id`, `attributes`, `name`, `slug`, `photo`, `thumbnail`, `file`, `size`, `size_qty`, `size_price`, `color`, `price`, `previous_price`, `details`, `stock`, `policy`, `status`, `views`, `tags`, `features`, `colors`, `product_condition`, `ship`, `is_meta`, `meta_tag`, `meta_description`, `youtube`, `type`, `license`, `license_qty`, `link`, `platform`, `region`, `licence_type`, `measure`, `featured`, `best`, `top`, `hot`, `latest`, `big`, `trending`, `sale`, `created_at`, `updated_at`, `is_discount`, `discount_date`, `whole_sell_qty`, `whole_sell_discount`, `is_catalog`, `catalog_id`) VALUES
(111, NULL, 'normal', NULL, 13, 8, NULL, NULL, NULL, 'WiFi Drone and HD camera', 'license-key-title-will-be-here-according-to-your-wish-111-wb3111ubd', '1645887013kfsh1iBP.png', '16458870138nVPz8vd.jpg', '156801752005.zip', NULL, NULL, NULL, NULL, 80, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 24, 'game', NULL, NULL, 0, NULL, 0, NULL, NULL, 'https://www.youtube.com/watch?v=HxNydN5tScI', 'License', '888888888888888888888888', '9999999999999999999999999', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, 1, 1, '2019-09-09 12:25:20', '2024-04-22 20:13:17', 0, NULL, NULL, NULL, 0, 0),
(112, NULL, 'normal', NULL, 13, 8, NULL, NULL, NULL, 'Ceiling fan white', 'license-key-title-will-be-here-according-to-your-wish-1-sct112k8z', '1645886919UQ9RHkVQ.png', '16458869191EeVvufo.jpg', '156801752005.zip', NULL, NULL, NULL, NULL, 80, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 28, 'game', 'Keyword 2,Keyword1', '#e80707,#113fe0', 0, NULL, 0, NULL, NULL, 'https://www.youtube.com/watch?v=HxNydN5tScI', 'License', '888888888888888888888888', '9999999999999999999999999', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, 1, 1, 1, '2019-09-09 12:25:20', '2024-04-22 21:40:39', 0, NULL, NULL, NULL, 0, 0),
(114, NULL, 'normal', NULL, 13, 8, NULL, NULL, NULL, 'yamaha gixer', 'license-key-title-will-be-here-according-to-your-wish-1-bbb114jm9', '1645886852IlpXklLo.png', '16458868540IJa4dgA.jpg', '156801752005.zip', NULL, NULL, NULL, NULL, 80, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 25, 'game', NULL, NULL, 0, NULL, 0, NULL, NULL, 'https://www.youtube.com/watch?v=HxNydN5tScI', 'License', '888888888888888888888888', '9999999999999999999999999', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, 1, 0, 1, '2019-09-09 12:25:20', '2024-04-23 08:06:29', 0, NULL, NULL, NULL, 0, 0),
(116, 'pr496jsv', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 116', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-1-pr495jsv', '1568027684whVhJDrR.png', '1568027717gm0tFzeb.jpg', NULL, NULL, NULL, NULL, '#000000,#a33333,#d90b0b,#209125', 50, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 55555, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 0, 'watch', 'Keyword1,Keyword 2', '#ff1a1a,#0fbcd4', 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-09 12:36:06', '2019-09-09 10:15:17', 1, '09/08/2021', NULL, NULL, 0, 0),
(117, 'pr497jsv', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 117', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-1-pr495jsv', '1568027658Up0FIXsW.png', '1568027670dTA7gQml.jpg', NULL, NULL, NULL, NULL, '#000000,#a33333,#d90b0b,#209125', 50, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 55555, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 0, 'watch', NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-09 12:36:06', '2019-09-09 10:14:30', 1, '09/08/2021', NULL, NULL, 0, 0),
(118, 'pr498jsv', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 118', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-1-pr495jsv', '1568027631cnmEylRa.png', '1568027643PgYviwVK.jpg', NULL, NULL, NULL, NULL, '#000000,#a33333,#d90b0b,#209125', 50, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 55555, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 0, 'watch', NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-09 12:36:06', '2019-09-09 10:14:03', 1, '09/08/2021', NULL, NULL, 0, 0),
(119, 'pr499jsv', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 1', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-1-pr495jsv', '1568027603i5UAZiKB.png', '1568027616O1coe3aV.jpg', NULL, NULL, NULL, NULL, '#000000,#a33333,#d90b0b,#209125', 50, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 55555, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 0, 'watch', NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-09 12:36:06', '2019-09-09 10:13:36', 1, '09/08/2021', NULL, NULL, 0, 0),
(120, 'pr500jsv', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 120', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-1-pr495jsv', '1568027558gLSECTIh.png', '1568027591b1oUIo7Q.jpg', NULL, NULL, NULL, NULL, '#000000,#a33333,#d90b0b,#209125', 50, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 55555, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 0, 'watch', NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 1, 0, '2019-09-09 12:36:06', '2019-09-09 10:53:33', 1, '09/08/2021', NULL, NULL, 0, 0),
(121, 'pr501jsv', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 121', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-1-pr495jsv', '1568027534O1QEBPpR.png', '1568027543P8eoamtf.jpg', NULL, NULL, NULL, NULL, '#000000,#a33333,#d90b0b,#209125', 50, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 55555, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 0, 'watch', NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-09 12:36:06', '2019-09-09 10:12:23', 1, '09/08/2021', NULL, NULL, 0, 0),
(122, 'pr502jsv', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 122', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-1-pr495jsv', '1568027493eLqHNoZP.png', '1568027517LGq90luX.jpg', NULL, NULL, NULL, NULL, '#000000,#a33333,#d90b0b,#209125', 50, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 55555, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 0, 'watch', NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-09 12:36:06', '2019-09-09 10:11:57', 1, '09/08/2021', NULL, NULL, 0, 0),
(123, 'pr608jsv', 'normal', NULL, 13, 5, 6, NULL, NULL, 'Top Rated product title will be here according to your wish 123', 'top-rated-product-title-will-be-here-according-to-your-wish-123-0af12392v', '1568025845ksCVo0hg.png', '1568025845bvB0Q0RE.jpg', NULL, NULL, NULL, NULL, '#000000,#15a0bf,#f5cf07,#2b4cc2,#247d32,#d62727', 100, 500, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 40, 'fashion', NULL, NULL, 2, '5-7 days', 0, 'fashion', 'Fashion meta tag from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 1, 0, 0, 1, '2019-09-09 13:00:05', '2024-04-26 04:08:09', 0, NULL, '10,20,30,40', '5,10,15,20', 1, 0),
(124, 'pr609jsv', 'normal', NULL, 13, 5, 6, NULL, NULL, 'Top Rated product title will be here according to your wish 124', 'top-rated-product-title-will-be-here-according-to-your-wish-124-hua12449x', '1568025818Iu033mHq.png', '1568025818tm9YHIHp.jpg', NULL, NULL, NULL, NULL, '#000000,#15a0bf,#f5cf07,#2b4cc2,#247d32,#d62727', 100, 500, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 27, 'fashion', NULL, NULL, 2, '5-7 days', 0, 'fashion', 'Fashion meta tag from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, 1, '2019-09-09 13:00:05', '2024-04-20 17:58:19', 0, NULL, '10,20,30,40', '5,10,15,20', 1, 0),
(125, 'pr610jsv', 'normal', NULL, 13, 5, 6, NULL, NULL, 'Top Rated product title will be here according to your wish 125', 'top-rated-product-title-will-be-here-according-to-your-wish-125-lbp125hto', '1568025774B3MU5tJK.png', '1568025774ZsBKNuio.jpg', NULL, NULL, NULL, NULL, '#000000,#15a0bf,#f5cf07,#2b4cc2,#247d32,#d62727', 100, 500, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 21, 'fashion', NULL, NULL, 2, '5-7 days', 0, 'fashion', 'Fashion meta tag from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 1, '2019-09-09 13:00:05', '2025-02-10 05:53:21', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 0);
INSERT INTO `products` (`id`, `sku`, `product_type`, `affiliate_link`, `user_id`, `category_id`, `subcategory_id`, `childcategory_id`, `attributes`, `name`, `slug`, `photo`, `thumbnail`, `file`, `size`, `size_qty`, `size_price`, `color`, `price`, `previous_price`, `details`, `stock`, `policy`, `status`, `views`, `tags`, `features`, `colors`, `product_condition`, `ship`, `is_meta`, `meta_tag`, `meta_description`, `youtube`, `type`, `license`, `license_qty`, `link`, `platform`, `region`, `licence_type`, `measure`, `featured`, `best`, `top`, `hot`, `latest`, `big`, `trending`, `sale`, `created_at`, `updated_at`, `is_discount`, `discount_date`, `whole_sell_qty`, `whole_sell_discount`, `is_catalog`, `catalog_id`) VALUES
(126, 'pr611jsv', 'normal', NULL, 13, 5, 6, NULL, NULL, 'Top Rated product title will be here according to your wish 1', 'top-rated-product-title-will-be-here-according-to-your-wish-1-7uo96fft', '1568025683HenL6lSt.png', '1568025683ZYvDAf0q.jpg', NULL, NULL, NULL, NULL, '#000000,#15a0bf,#f5cf07,#2b4cc2,#247d32,#d62727', 100, 500, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; padding: 0px; text-align: justify;\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; padding: 0px; text-align: justify;\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 43, 'fashion', NULL, NULL, 2, '5-7 days', 0, 'fashion', 'Fashion meta tag from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, '2019-09-09 13:00:05', '2024-04-23 09:32:17', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 0),
(128, 'pr613jsv', 'normal', NULL, 13, 5, 6, NULL, NULL, 'Top Rated product title will be here according to your wish 102', 'top-rated-product-title-will-be-here-according-to-your-wish-102-rgr128igz', '1568025531RbQwgMZ5.png', '1568025531ckSl3TVR.jpg', NULL, NULL, NULL, NULL, '#000000,#15a0bf,#f5cf07,#2b4cc2,#247d32,#d62727', 100, 500, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 37, 'fashion', 'Keyword1,Keyword 2', '#42c406,#f00505', 2, '5-7 days', 0, 'fashion', 'Fashion meta tag from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 1, 1, 0, 0, 1, '2019-09-09 13:00:05', '2024-04-22 18:27:59', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 0),
(129, 'pr614jsv', 'normal', NULL, 13, 5, 6, NULL, NULL, 'Top Rated product title will be here according to your wish 101', 'top-rated-product-title-will-be-here-according-to-your-wish-101-nls129ico', '1568025423UQNFrvNh.png', '15680254230iXcasMb.jpg', NULL, NULL, NULL, NULL, '#000000,#15a0bf,#f5cf07,#2b4cc2,#247d32,#d62727', 100, 500, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 43, 'fashion', NULL, NULL, 2, '5-7 days', 0, 'fashion', 'Fashion meta tag from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, 1, '2019-09-09 13:00:05', '2024-04-27 15:13:44', 0, NULL, '10,20,30,40', '5,10,15,20', 1, 0),
(130, NULL, 'normal', NULL, 13, 8, NULL, NULL, NULL, '4000D Dslr Camera', 'license-key-title-will-be-here-according-to-your-wish-130-nwn1300xx', '16458854327HGVJmma.png', '1645885433rbKYvsVN.jpg', '156801752005.zip', NULL, NULL, NULL, NULL, 80, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 52, 'game', NULL, NULL, 0, NULL, 0, NULL, NULL, 'https://www.youtube.com/watch?v=HxNydN5tScI', 'License', '888888888888888888888888', '997', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 1, 1, 1, 1, '2019-09-09 12:25:20', '2024-04-27 14:17:04', 0, NULL, NULL, NULL, 0, 0),
(134, 'OO42939gas', 'normal', NULL, 13, 4, 2, 1, NULL, 'Elite 24\'\' ELITE HD LED TV DN600D', 'elite-24-elite-hd-led-tv-dn600d-oo42939gas', '1570072567FiBwycha.png', '1570072567Cqr5iSzD.jpg', NULL, NULL, NULL, NULL, NULL, 300, 400, '<span style=\"color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" sans-serif;\"=\"\"><font size=\"3\">TVs always get the final say where the couch goes. We want to shake things up and give you the freedom to decorate the way you want to, not the way you have to. It’s fun, playful and unique, and it goes anywhere. It fits your lifestyle, not the other way around. Its smooth, clean design blends in anywhere, yet the playful color doesn’t get buried. Now, you have the freedom to tailor your TV to your own lifestyle. Finally, a TV that fits you. No messy wires. No unsightly air vents. Just one cord for a smooth back that looks great anywhere. This power consumption system will get 90% saving your electrical power.</font></span><br>', 992, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\"><font size=\"3\">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</font></span><br>', 1, 52, 'tv,television', NULL, NULL, 0, NULL, 0, NULL, NULL, 'https://www.youtube.com/watch?v=MIJBxqzazeM', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-25 00:33:22', '2024-04-22 15:19:48', 0, NULL, NULL, NULL, 1, 0),
(135, '3uZ9903ofs', 'normal', NULL, 13, 4, 2, 1, NULL, '32 \'\'NAPCO D/GLASS ULTRA SLIM HD lED TV ES700E', '32-napco-dglass-ultra-slim-hd-led-tv-es700e-3uz9903ofs', '1570072554QTCZrnNj.png', '1570072555mZv9XiNP.jpg', NULL, NULL, NULL, NULL, NULL, 300, 500, '<span style=\"color: rgb(0, 0, 0); font-family: calibri, sans-serif;\"><font size=\"4\">NAPCO TV always get the final say where the couch goes. We want to shake things up and give you the freedom to decorate the way you want to, not the way you have to. It’s fun, playful and unique, and it goes anywhere. It fits your lifestyle, not the other way around. Its smooth, clean design blends in anywhere, yet the playful color doesn’t get buried. Now, you have the freedom to tailor your TV to your own lifestyle. Finally, a TV that fits you. No messy wires. No unsightly air vents. Just one cord for a smooth back that looks great anywhere. This power consumption system will get 90% saving your electrical power.</font></span><br>', 396, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span><br>', 1, 83, 'lcd,tv,led', NULL, NULL, 0, NULL, 0, NULL, NULL, 'https://www.youtube.com/watch?v=LIqQNG_q2us', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-29 23:08:12', '2024-04-26 11:00:45', 0, NULL, NULL, NULL, 1, 0),
(144, 'vrX2915O5c', 'normal', NULL, 13, 4, 2, 1, NULL, '32 \'\'NAPCO D/GLASS ULTRA SLIM HD lED TV ES700E', '32-napco-dglass-ultra-slim-hd-led-tv-es700e-vrx2915o5c', '1570072918cZGfHP4L.jpg', '1570072918kGfglIIV.jpg', NULL, NULL, NULL, NULL, NULL, 300, 500, '<span style=\"color: rgb(0, 0, 0); font-family: calibri, sans-serif;\"><font size=\"4\">NAPCO TV always get the final say where the couch goes. We want to shake things up and give you the freedom to decorate the way you want to, not the way you have to. It’s fun, playful and unique, and it goes anywhere. It fits your lifestyle, not the other way around. Its smooth, clean design blends in anywhere, yet the playful color doesn’t get buried. Now, you have the freedom to tailor your TV to your own lifestyle. Finally, a TV that fits you. No messy wires. No unsightly air vents. Just one cord for a smooth back that looks great anywhere. This power consumption system will get 90% saving your electrical power.</font></span><br>', 388, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span><br>', 1, 56, 'lcd,tv,led', NULL, NULL, 0, NULL, 0, NULL, NULL, 'https://www.youtube.com/watch?v=LIqQNG_q2us', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-10-02 21:21:58', '2024-04-22 21:26:58', 0, NULL, NULL, NULL, 0, 135),
(169, 'TRg5938WNy', 'normal', NULL, 13, 5, 6, NULL, NULL, 'Top Rated product title will be here according to your wish 123', 'top-rated-product-title-will-be-here-according-to-your-wish-123-trg5938wny', '1570875978KD9cRleA.jpg', '15708759789N9Hm1QJ.jpg', NULL, NULL, NULL, NULL, 'Red,#000000,#15a0bf,#f5cf07,#2b4cc2,#247d32,#d62727', 100, 500, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 14, 'fashion', NULL, NULL, 2, '5-7 days', 0, 'fashion', 'Fashion meta tag from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-10-12 04:26:18', '2024-04-25 18:46:33', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 123),
(170, '6Vb6172gWR', 'normal', NULL, 13, 5, 6, NULL, '{\"warranty_type\":{\"values\":[\"No Warranty\",\"Local seller Warranty\",\"Non local warranty\",\"International Manufacturer Warranty\",\"International Seller Warranty\"],\"prices\":[1,2,3,4,5],\"details_status\":1}}', 'Yellow (VF1100C V65)', 'top-rated-product-title-will-be-here-according-to-your-wish-123-6vb6172gwr', '1645884041s7w7yks2.png', '1645884042MyUFYmva.jpg', NULL, 'S,M,L,XL,XXL', '100,100,100,100,100', '1,2,3,4,5', '#000000,#ff0000,#000000,#15a0bf,#f5cf07,#2b4cc2,#247d32,#d62727', 100, 500, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 15, 'fashion', NULL, NULL, 2, '5-7 days', 0, 'fashion', 'Fashion meta tag from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-10-12 04:29:55', '2024-04-08 07:01:35', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 123),
(171, 'zia62030Vj', 'normal', NULL, 13, 5, 6, NULL, NULL, 'Blue Gixxer SF', 'top-rated-product-title-will-be-here-according-to-your-wish-123-zia62030vj', '1645884108Bvg0PKv8.png', '1645884108s5cBf8O6.jpg', NULL, NULL, NULL, NULL, '#000000,#15a0bf,#f5cf07,#2b4cc2,#247d32,#d62727', 100, 500, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" padding:=\"\" 0px;=\"\" text-align:=\"\" justify;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 8, 'fashion', NULL, NULL, 2, '5-7 days', 0, 'fashion', 'Fashion meta tag from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-10-12 04:30:07', '2025-02-10 05:53:54', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 123),
(173, 'b2Q6258iDf', 'normal', NULL, 13, 5, NULL, NULL, NULL, 'Celeron N4020 HD Laptop', 'physical-product-title-title-will-be-here-0131-test-b2q6258idf', '1645884215UfnKybtU.png', '16458842164uiEZs1i.jpg', NULL, 'S', '2147483643', '20', '#ffffff,#ff0000,#000000,#851818,#ff0d0d,#1feb4c,#d620cf,#186ceb', 120, 200, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 8, 'clothing,bag', 'Keyword1,Keyword 2', '#cf1d1d,#c92be3', 2, '5-7 days', 0, 'clothing,bag', 'clothing, bag', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-10-12 04:31:21', '2024-04-25 08:30:58', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 131),
(174, 'bXf62830R9', 'normal', NULL, 13, 5, NULL, NULL, NULL, 'T35 22 Inch LED Monitor', 'physical-product-title-title-will-be-here-0131-test-bxf62830r9', '1645884381WX3v5sou.png', '1645884381OCVWbwFr.jpg', NULL, 'S', '2147483643', '20', '#ffffff,#000000,#000000,#851818,#ff0d0d,#1feb4c,#d620cf,#186ceb', 120, 200, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 7, 'clothing,bag', 'Keyword1,Keyword 2', '#cf1d1d,#c92be3', 2, '5-7 days', 0, 'clothing,bag', 'clothing, bag', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-10-12 04:31:43', '2024-04-25 14:42:55', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 131),
(175, '9gn6494iUN', 'normal', NULL, 13, 5, 7, NULL, NULL, 'White Gixxer', 'physical-product-title-title-will-be-here-102-9gn6494iun', '1645884488Vtw5xRGp.png', '1645884488YFCVV6Ah.jpg', NULL, 'S', '55555555555555555', '20', '#ffffff,#000000,#000000,#851818,#ff0d0d,#1feb4c,#d620cf,#186ceb', 100, 200, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 8, 'clothing,bag', NULL, NULL, 1, '5-7 days', 0, 'clothing,bag', 'clothing, bag', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-10-12 04:35:03', '2024-04-22 23:31:40', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 102),
(178, 'Tcv6794KXS', 'normal', NULL, 13, 5, 7, NULL, NULL, 'Sigma Blue Fan', 'physical-product-title-title-will-be-here-99-tcv6794kxs', '1645884617Q9Xxt9Av.png', '1645884617rQOdzTKo.jpg', NULL, 'S', '2147483644', '20', '#ffffff,#000000,#000000,#851818,#ff0d0d,#1feb4c,#d620cf,#186ceb', 100, 200, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 7, 'clothing,bag', NULL, NULL, 2, '5-7 days', 0, 'clothing,bag', 'clothing, bag', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-10-12 04:40:20', '2024-04-25 09:50:23', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 99),
(179, 'mf56823djs', 'normal', NULL, 13, 5, 7, NULL, NULL, 'Wireless Speaker', 'physical-product-title-title-will-be-here-99-mf56823djs', '1645884728JYcEYbPD.png', '1645884728MMTJgZrq.jpg', NULL, 'S', '2147483644', '20', '#ffffff,#ff0000,#000000,#851818,#ff0d0d,#1feb4c,#d620cf,#186ceb', 100, 200, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 12, 'clothing,bag', NULL, NULL, 2, '5-7 days', 0, 'clothing,bag', 'clothing, bag', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-10-12 04:45:27', '2024-04-25 22:02:09', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 99),
(180, 'myy7236gFD', 'normal', NULL, 13, 5, 7, NULL, NULL, 'Gaming Headphone', 'physical-product-title-title-will-be-here-99u-myy7236gfd', '1645884791QzYEJc8x.png', '16458847916QTfg26P.jpg', NULL, 'S', '2147483643', '20', '#ffffff,#ff0000,#000000,#851818,#ff0d0d,#1feb4c,#d620cf,#186ceb', 100, 200, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 21, 'clothing,bag', NULL, NULL, 2, '5-7 days', 0, 'clothing,bag', 'clothing, bag', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1, 0, 0, '2019-10-12 04:47:34', '2024-04-25 15:04:53', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 99);
INSERT INTO `products` (`id`, `sku`, `product_type`, `affiliate_link`, `user_id`, `category_id`, `subcategory_id`, `childcategory_id`, `attributes`, `name`, `slug`, `photo`, `thumbnail`, `file`, `size`, `size_qty`, `size_price`, `color`, `price`, `previous_price`, `details`, `stock`, `policy`, `status`, `views`, `tags`, `features`, `colors`, `product_condition`, `ship`, `is_meta`, `meta_tag`, `meta_description`, `youtube`, `type`, `license`, `license_qty`, `link`, `platform`, `region`, `licence_type`, `measure`, `featured`, `best`, `top`, `hot`, `latest`, `big`, `trending`, `sale`, `created_at`, `updated_at`, `is_discount`, `discount_date`, `whole_sell_qty`, `whole_sell_discount`, `is_catalog`, `catalog_id`) VALUES
(181, 'TJV7256rgp', 'normal', NULL, 13, 5, 7, NULL, NULL, 'Wireless Gaming Headphone', 'physical-product-title-title-will-be-here-99u-tjv7256rgp', '1645885005a9n7GyVe.png', '1645885006qLwu6qph.jpg', NULL, 'S', '2147483644', '20', '#000000,#851818,#ff0d0d,#1feb4c,#d620cf,#186ceb', 100, 200, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 25, 'clothing,bag', NULL, NULL, 2, '5-7 days', 0, 'clothing,bag', 'clothing, bag', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1, 0, 0, '2019-10-12 04:47:55', '2024-04-26 04:08:45', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 99),
(182, 'b017277kfm', 'normal', NULL, 13, 5, 7, NULL, NULL, 'D5600 DSLR Camera', 'physical-product-title-title-will-be-here-99u-b017277kfm', '17391370256q1IZ9WN.png', '1739137025fl6nZbJi.jpg', NULL, 'S', '2147483645', '20', '#000000,#851818,#ff0d0d,#1feb4c,#d620cf,#186ceb', 100, 200, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 21, 'clothing,bag', NULL, NULL, 2, '5-7 days', 0, 'clothing,bag,js,css,php', 'clothing, bag', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1, 0, 0, '2019-10-12 04:48:06', '2025-02-09 15:37:09', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 99);

-- --------------------------------------------------------

--
-- Table structure for table `product_clicks`
--

CREATE TABLE `product_clicks` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `product_clicks`
--

INSERT INTO `product_clicks` (`id`, `product_id`, `date`) VALUES
(4, 102, '2020-01-12'),
(5, 171, '2020-01-23'),
(6, 95, '2020-01-23'),
(7, 130, '2020-01-27'),
(8, 130, '2020-01-27'),
(9, 130, '2020-01-27'),
(10, 102, '2020-03-30'),
(11, 102, '2020-03-30'),
(12, 93, '2020-03-30'),
(13, 102, '2020-03-30'),
(14, 182, '2020-04-05'),
(15, 102, '2020-04-23'),
(16, 102, '2020-04-23'),
(17, 102, '2020-04-23'),
(18, 144, '2020-05-31'),
(19, 182, '2020-05-31'),
(20, 182, '2020-05-31'),
(21, 144, '2020-06-02'),
(22, 102, '2020-06-02'),
(23, 144, '2020-06-02'),
(24, 170, '2020-06-02'),
(25, 170, '2020-06-02'),
(26, 170, '2020-06-02'),
(27, 170, '2020-06-02'),
(28, 170, '2020-06-02'),
(29, 170, '2020-06-02'),
(30, 170, '2020-06-02'),
(31, 170, '2020-06-02'),
(32, 170, '2020-06-02'),
(33, 107, '2021-04-01'),
(34, 107, '2021-04-01'),
(35, 101, '2021-09-15'),
(36, 101, '2022-02-26'),
(37, 173, '2022-03-02'),
(38, 101, '2022-03-02'),
(39, 99, '2022-03-02'),
(40, 100, '2022-03-03'),
(41, 99, '2022-03-03'),
(42, 99, '2022-03-03'),
(43, 97, '2022-03-03'),
(44, 180, '2022-03-03'),
(45, 109, '2022-04-17'),
(46, 135, '2022-04-17'),
(47, 101, '2022-04-17'),
(48, 102, '2022-04-17'),
(49, 101, '2022-04-17'),
(50, 101, '2022-04-17'),
(51, 101, '2022-04-17'),
(52, 101, '2022-04-21'),
(53, 101, '2022-04-26'),
(54, 104, '2022-04-26'),
(55, 101, '2022-04-26'),
(56, 102, '2022-04-26'),
(57, 144, '2022-04-26'),
(58, 144, '2022-04-26'),
(59, 102, '2022-04-27'),
(60, 101, '2022-04-27'),
(61, 181, '2022-04-27'),
(62, 181, '2022-04-27'),
(63, 181, '2022-04-27'),
(64, 97, '2022-04-27'),
(65, 111, '2022-04-27'),
(66, 130, '2022-04-27'),
(67, 100, '2022-04-28'),
(68, 100, '2022-04-28'),
(69, 100, '2022-04-28'),
(70, 100, '2022-04-28'),
(71, 100, '2022-04-28'),
(72, 135, '2022-04-28'),
(73, 135, '2022-04-28'),
(74, 114, '2022-04-28'),
(75, 103, '2022-04-28'),
(76, 107, '2022-04-28'),
(77, 107, '2022-04-28'),
(78, 182, '2022-04-28'),
(79, 99, '2022-04-28'),
(80, 101, '2022-04-28'),
(81, 97, '2022-04-28'),
(82, 97, '2022-04-28'),
(83, 107, '2022-04-28'),
(84, 182, '2022-04-28'),
(85, 106, '2022-04-28'),
(86, 125, '2022-04-28'),
(87, 102, '2022-04-28'),
(88, 124, '2022-04-29'),
(89, 105, '2022-04-29'),
(90, 97, '2022-04-29'),
(91, 130, '2022-04-30'),
(92, 101, '2022-04-30'),
(93, 124, '2022-04-30'),
(94, 128, '2022-06-13'),
(95, 128, '2022-06-14'),
(96, 104, '2022-06-15'),
(97, 101, '2022-06-15'),
(98, 107, '2022-06-15'),
(99, 99, '2022-06-15'),
(100, 101, '2022-06-30'),
(101, 124, '2022-06-30'),
(102, 102, '2022-06-30'),
(103, 101, '2022-06-30'),
(104, 180, '2022-06-30'),
(105, 101, '2022-06-30'),
(106, 102, '2022-07-03'),
(107, 102, '2022-07-03'),
(108, 101, '2022-07-03'),
(109, 102, '2022-07-03'),
(110, 97, '2022-07-03'),
(111, 102, '2022-07-03'),
(112, 181, '2022-07-03'),
(113, 111, '2022-07-03'),
(114, 101, '2022-07-03'),
(115, 101, '2022-07-03'),
(116, 107, '2022-07-03'),
(117, 107, '2022-07-03'),
(118, 107, '2022-07-03'),
(119, 101, '2022-07-03'),
(120, 100, '2022-07-05'),
(121, 102, '2022-07-05'),
(122, 101, '2022-07-05'),
(123, 101, '2022-07-09'),
(124, 114, '2022-07-09'),
(125, 128, '2022-07-09'),
(126, 97, '2022-07-09'),
(127, 107, '2022-07-09'),
(128, 134, '2022-07-09'),
(129, 97, '2022-07-10'),
(130, 101, '2022-07-10'),
(131, 101, '2022-07-11'),
(132, 123, '2022-07-11'),
(133, 123, '2022-07-11'),
(134, 102, '2022-07-12'),
(135, 101, '2022-07-13'),
(136, 144, '2022-07-24'),
(137, 102, '2022-08-02'),
(138, 123, '2022-08-02'),
(139, 101, '2022-08-02'),
(140, 99, '2022-08-02'),
(141, 102, '2022-08-02'),
(142, 101, '2022-08-02'),
(143, 103, '2022-08-02'),
(144, 103, '2022-08-02'),
(145, 103, '2022-08-02'),
(146, 130, '2022-08-03'),
(147, 103, '2022-08-06'),
(148, 103, '2022-08-06'),
(149, 103, '2022-08-06'),
(150, 104, '2022-08-06'),
(151, 99, '2022-08-06'),
(152, 144, '2022-08-06'),
(153, 101, '2022-08-06'),
(154, 100, '2022-08-06'),
(155, 97, '2022-08-06'),
(156, 101, '2022-08-07'),
(157, 126, '2022-08-07'),
(158, 96, '2022-08-07'),
(159, 134, '2022-08-08'),
(160, 102, '2022-08-08'),
(161, 100, '2022-08-14'),
(162, 102, '2022-08-14'),
(163, 99, '2022-08-14'),
(164, 105, '2022-08-14'),
(165, 102, '2022-08-16'),
(166, 130, '2022-08-16'),
(167, 130, '2022-08-16'),
(168, 130, '2022-08-16'),
(169, 123, '2022-08-16'),
(170, 104, '2022-08-16'),
(171, 93, '2022-08-16'),
(172, 102, '2022-08-16'),
(173, 100, '2022-08-17'),
(174, 100, '2022-08-17'),
(175, 106, '2022-08-17'),
(176, 106, '2022-08-17'),
(177, 102, '2022-08-17'),
(178, 101, '2022-08-17'),
(179, 101, '2022-08-18'),
(180, 114, '2022-08-18'),
(181, 102, '2022-08-18'),
(182, 144, '2022-08-18'),
(183, 101, '2022-08-18'),
(184, 123, '2022-08-19'),
(185, 105, '2022-08-19'),
(186, 105, '2022-08-19'),
(187, 101, '2022-08-20'),
(188, 178, '2022-09-04'),
(189, 101, '2022-09-04'),
(190, 180, '2022-09-04'),
(191, 180, '2022-09-04'),
(192, 93, '2022-09-04'),
(193, 101, '2022-09-04'),
(194, 100, '2022-09-04'),
(195, 112, '2022-09-04'),
(196, 112, '2022-09-04'),
(197, 112, '2022-09-04'),
(198, 112, '2022-09-04'),
(199, 128, '2022-09-05'),
(200, 99, '2022-09-05'),
(201, 129, '2022-09-05'),
(202, 109, '2022-09-05'),
(203, 101, '2022-09-05'),
(204, 93, '2022-09-05'),
(205, 99, '2022-09-05'),
(206, 106, '2022-09-05'),
(207, 126, '2022-09-05'),
(208, 129, '2022-09-05'),
(209, 129, '2022-09-05'),
(210, 101, '2022-09-05'),
(211, 101, '2022-09-05'),
(212, 107, '2022-09-05'),
(213, 100, '2022-09-05'),
(214, 102, '2022-09-05'),
(215, 104, '2022-09-05'),
(216, 129, '2022-09-05'),
(217, 124, '2022-09-05'),
(218, 129, '2022-09-05'),
(219, 128, '2022-09-05'),
(220, 101, '2022-09-05'),
(221, 144, '2022-09-05'),
(222, 134, '2022-09-05'),
(223, 144, '2022-09-05'),
(224, 95, '2022-09-05'),
(225, 95, '2022-09-05'),
(226, 95, '2022-09-05'),
(227, 95, '2022-09-05'),
(228, 95, '2022-09-05'),
(229, 128, '2022-09-05'),
(230, 144, '2022-09-05'),
(231, 129, '2022-09-05'),
(232, 129, '2022-09-05'),
(233, 101, '2022-09-06'),
(234, 107, '2022-09-06'),
(235, 109, '2022-09-06'),
(236, 123, '2022-09-06'),
(237, 129, '2022-09-06'),
(238, 126, '2022-09-06'),
(239, 126, '2022-09-06'),
(240, 107, '2022-09-06'),
(241, 103, '2022-09-06'),
(242, 104, '2022-09-06'),
(243, 103, '2022-09-06'),
(244, 93, '2022-09-06'),
(245, 126, '2022-09-06'),
(246, 128, '2022-09-06'),
(247, 129, '2022-09-06'),
(248, 128, '2022-09-06'),
(249, 103, '2022-09-06'),
(250, 107, '2022-09-06'),
(251, 101, '2022-09-06'),
(252, 102, '2022-09-06'),
(253, 106, '2022-09-06'),
(254, 93, '2022-09-06'),
(255, 106, '2022-09-06'),
(256, 107, '2022-09-06'),
(257, 112, '2022-09-06'),
(258, 101, '2022-09-06'),
(259, 179, '2022-09-06'),
(260, 101, '2022-09-06'),
(261, 101, '2022-09-06'),
(262, 101, '2022-09-06'),
(263, 102, '2022-09-06'),
(264, 101, '2022-09-06'),
(265, 100, '2022-09-06'),
(266, 101, '2022-09-06'),
(267, 102, '2022-09-06'),
(268, 102, '2022-09-06'),
(269, 101, '2022-09-06'),
(270, 107, '2022-09-06'),
(271, 103, '2022-09-06'),
(272, 103, '2022-09-06'),
(273, 104, '2022-09-06'),
(274, 105, '2022-09-06'),
(275, 101, '2022-09-06'),
(276, 107, '2022-09-06'),
(277, 128, '2022-09-06'),
(278, 181, '2022-09-06'),
(279, 112, '2022-09-06'),
(280, 181, '2022-09-06'),
(281, 123, '2022-09-06'),
(282, 128, '2022-09-06'),
(283, 101, '2022-09-06'),
(284, 101, '2022-09-06'),
(285, 125, '2022-09-06'),
(286, 109, '2022-09-06'),
(287, 107, '2022-09-06'),
(288, 106, '2022-09-06'),
(289, 105, '2022-09-06'),
(290, 107, '2022-09-06'),
(291, 109, '2022-09-06'),
(292, 104, '2022-09-06'),
(293, 103, '2022-09-06'),
(294, 93, '2022-09-06'),
(295, 126, '2022-09-06'),
(296, 125, '2022-09-06'),
(297, 126, '2022-09-06'),
(298, 128, '2022-09-06'),
(299, 129, '2022-09-06'),
(300, 124, '2022-09-06'),
(301, 123, '2022-09-06'),
(302, 96, '2022-09-06'),
(303, 130, '2022-09-06'),
(304, 180, '2022-09-06'),
(305, 181, '2022-09-06'),
(306, 182, '2022-09-06'),
(307, 114, '2022-09-06'),
(308, 112, '2022-09-06'),
(309, 111, '2022-09-06'),
(310, 106, '2022-09-06'),
(311, 100, '2022-09-06'),
(312, 100, '2022-09-06'),
(313, 106, '2022-09-06'),
(314, 93, '2022-09-06'),
(315, 126, '2022-09-06'),
(316, 128, '2022-09-06'),
(317, 129, '2022-09-06'),
(318, 128, '2022-09-06'),
(319, 126, '2022-09-06'),
(320, 125, '2022-09-06'),
(321, 126, '2022-09-06'),
(322, 123, '2022-09-06'),
(323, 123, '2022-09-06'),
(324, 96, '2022-09-06'),
(325, 123, '2022-09-06'),
(326, 123, '2022-09-06'),
(327, 96, '2022-09-06'),
(328, 182, '2022-09-06'),
(329, 181, '2022-09-06'),
(330, 130, '2022-09-06'),
(331, 111, '2022-09-06'),
(332, 112, '2022-09-06'),
(333, 114, '2022-09-06'),
(334, 102, '2022-09-06'),
(335, 97, '2022-09-06'),
(336, 104, '2022-09-06'),
(337, 103, '2022-09-06'),
(338, 93, '2022-09-06'),
(339, 103, '2022-09-06'),
(340, 104, '2022-09-06'),
(341, 129, '2022-09-06'),
(342, 128, '2022-09-06'),
(343, 126, '2022-09-06'),
(344, 126, '2022-09-06'),
(345, 128, '2022-09-06'),
(346, 129, '2022-09-06'),
(347, 124, '2022-09-06'),
(348, 123, '2022-09-06'),
(349, 96, '2022-09-06'),
(350, 130, '2022-09-06'),
(351, 112, '2022-09-06'),
(352, 123, '2022-09-06'),
(353, 102, '2022-09-06'),
(354, 102, '2022-09-06'),
(355, 103, '2022-09-06'),
(356, 128, '2022-09-06'),
(357, 123, '2022-09-06'),
(358, 181, '2022-09-06'),
(359, 180, '2022-09-06'),
(360, 130, '2022-09-06'),
(361, 112, '2022-09-06'),
(362, 111, '2022-09-06'),
(363, 112, '2022-09-06'),
(364, 114, '2022-09-06'),
(365, 112, '2022-09-06'),
(366, 111, '2022-09-06'),
(367, 180, '2022-09-06'),
(368, 101, '2022-09-06'),
(369, 99, '2022-09-06'),
(370, 129, '2022-09-06'),
(371, 129, '2022-09-06'),
(372, 101, '2022-09-06'),
(373, 112, '2022-09-06'),
(374, 128, '2022-09-06'),
(375, 101, '2022-09-06'),
(376, 107, '2022-09-06'),
(377, 101, '2022-09-06'),
(378, 102, '2022-09-06'),
(379, 144, '2022-09-06'),
(380, 99, '2022-10-06'),
(381, 104, '2022-10-06'),
(382, 104, '2022-10-06'),
(383, 104, '2022-10-06'),
(384, 104, '2022-10-06'),
(385, 106, '2022-10-06'),
(386, 144, '2022-10-07'),
(387, 144, '2022-10-07'),
(388, 179, '2022-10-07'),
(389, 125, '2022-11-26'),
(390, 126, '2022-11-26'),
(391, 102, '2022-11-26'),
(392, 130, '2022-11-26'),
(393, 182, '2022-11-26'),
(394, 130, '2022-11-26'),
(395, 99, '2022-11-26'),
(396, 100, '2022-11-26'),
(397, 129, '2022-11-26'),
(398, 99, '2022-11-26'),
(399, 102, '2022-11-26'),
(400, 99, '2022-11-26'),
(401, 95, '2022-11-26'),
(402, 99, '2022-11-26'),
(403, 99, '2022-11-26'),
(404, 114, '2022-11-27'),
(405, 102, '2022-11-27'),
(406, 106, '2022-11-27'),
(407, 95, '2022-11-27'),
(408, 125, '2022-11-27'),
(409, 102, '2022-11-27'),
(410, 101, '2022-11-27'),
(411, 111, '2022-11-29'),
(412, 112, '2022-11-29'),
(413, 103, '2022-11-29'),
(414, 101, '2023-03-11'),
(415, 100, '2023-04-03'),
(416, 102, '2023-04-04'),
(417, 180, '2023-04-04'),
(418, 97, '2023-04-04'),
(419, 111, '2023-04-08'),
(420, 102, '2023-04-08'),
(421, 101, '2023-04-08'),
(422, 101, '2023-04-08'),
(423, 101, '2023-04-08'),
(424, 102, '2023-04-08'),
(425, 180, '2023-04-08'),
(426, 102, '2023-04-08'),
(427, 102, '2023-04-08'),
(428, 101, '2023-04-08'),
(429, 106, '2023-04-08'),
(430, 181, '2023-04-08'),
(431, 101, '2023-04-08'),
(432, 99, '2023-04-08'),
(433, 111, '2023-04-08'),
(434, 101, '2023-04-09'),
(435, 100, '2023-04-10'),
(436, 144, '2023-04-10'),
(437, 95, '2023-04-10'),
(438, 129, '2023-04-10'),
(439, 100, '2023-04-11'),
(440, 107, '2023-04-12'),
(441, 144, '2023-04-12'),
(442, 144, '2023-04-12'),
(443, 100, '2023-04-13'),
(444, 129, '2023-04-13'),
(445, 99, '2023-04-13'),
(446, 101, '2023-04-13'),
(447, 129, '2023-04-13'),
(448, 101, '2023-04-13'),
(449, 101, '2023-04-13'),
(450, 181, '2023-04-13'),
(451, 102, '2023-04-13'),
(452, 102, '2023-04-13'),
(453, 101, '2023-04-15'),
(454, 101, '2023-04-15'),
(455, 101, '2023-04-16'),
(456, 102, '2023-04-16'),
(457, 181, '2023-04-16'),
(458, 109, '2023-04-16'),
(459, 102, '2023-04-16'),
(460, 97, '2023-04-18'),
(461, 109, '2023-04-18'),
(462, 170, '2023-04-19'),
(463, 129, '2023-04-19'),
(464, 112, '2023-04-19'),
(465, 101, '2023-04-19'),
(466, 104, '2023-04-19'),
(467, 104, '2023-04-19'),
(468, 124, '2023-04-19'),
(469, 101, '2023-04-20'),
(470, 101, '2023-04-20'),
(471, 100, '2023-04-21'),
(472, 111, '2023-04-24'),
(473, 105, '2023-04-24'),
(474, 109, '2023-04-25'),
(475, 104, '2023-04-26'),
(476, 103, '2023-04-26'),
(477, 105, '2023-04-26'),
(478, 106, '2023-04-26'),
(479, 107, '2023-04-26'),
(480, 93, '2023-04-27'),
(481, 100, '2023-04-29'),
(482, 102, '2023-04-29'),
(483, 99, '2023-04-29'),
(484, 97, '2023-04-29'),
(485, 101, '2023-04-30'),
(486, 102, '2023-04-30'),
(487, 99, '2023-05-01'),
(488, 101, '2023-05-01'),
(489, 97, '2023-05-01'),
(490, 102, '2023-05-01'),
(491, 100, '2023-05-01'),
(492, 134, '2023-05-01'),
(493, 95, '2023-05-01'),
(494, 111, '2023-05-01'),
(495, 174, '2023-05-02'),
(496, 125, '2023-05-02'),
(497, 103, '2023-05-02'),
(498, 100, '2023-05-02'),
(499, 124, '2023-05-02'),
(500, 129, '2023-05-02'),
(501, 169, '2023-05-02'),
(502, 182, '2023-05-02'),
(503, 180, '2023-05-02'),
(504, 106, '2023-05-02'),
(505, 114, '2023-05-02'),
(506, 171, '2023-05-02'),
(507, 171, '2023-05-02'),
(508, 123, '2023-05-02'),
(509, 109, '2023-05-03'),
(510, 96, '2023-05-03'),
(511, 180, '2023-05-03'),
(512, 104, '2023-05-03'),
(513, 112, '2023-05-03'),
(514, 103, '2023-05-03'),
(515, 144, '2023-05-03'),
(516, 103, '2023-05-03'),
(517, 102, '2023-05-03'),
(518, 114, '2023-05-03'),
(519, 102, '2023-05-03'),
(520, 175, '2023-05-03'),
(521, 170, '2023-05-03'),
(522, 130, '2023-05-03'),
(523, 128, '2023-05-03'),
(524, 169, '2023-05-04'),
(525, 126, '2023-05-04'),
(526, 123, '2023-05-04'),
(527, 93, '2023-05-04'),
(528, 105, '2023-05-04'),
(529, 128, '2023-05-04'),
(530, 101, '2023-05-04'),
(531, 114, '2023-05-04'),
(532, 100, '2023-05-04'),
(533, 99, '2023-05-04'),
(534, 97, '2023-05-04'),
(535, 179, '2023-05-04'),
(536, 173, '2023-05-04'),
(537, 144, '2023-05-04'),
(538, 93, '2023-05-04'),
(539, 95, '2023-05-04'),
(540, 107, '2023-05-04'),
(541, 109, '2023-05-04'),
(542, 129, '2023-05-04'),
(543, 126, '2023-05-05'),
(544, 104, '2023-05-05'),
(545, 111, '2023-05-05'),
(546, 179, '2023-05-05'),
(547, 105, '2023-05-05'),
(548, 125, '2023-05-05'),
(549, 134, '2023-05-05'),
(550, 170, '2023-05-05'),
(551, 124, '2023-05-05'),
(552, 128, '2023-05-05'),
(553, 96, '2023-05-05'),
(554, 106, '2023-05-05'),
(555, 144, '2023-05-05'),
(556, 181, '2023-05-05'),
(557, 105, '2023-05-05'),
(558, 181, '2023-05-05'),
(559, 134, '2023-05-06'),
(560, 178, '2023-05-06'),
(561, 114, '2023-05-06'),
(562, 112, '2023-05-06'),
(563, 175, '2023-05-07'),
(564, 180, '2023-05-07'),
(565, 130, '2023-05-07'),
(566, 100, '2023-05-07'),
(567, 123, '2023-05-07'),
(568, 174, '2023-05-07'),
(569, 102, '2023-05-07'),
(570, 105, '2023-05-07'),
(571, 103, '2023-05-07'),
(572, 126, '2023-05-07'),
(573, 169, '2023-05-07'),
(574, 182, '2023-05-08'),
(575, 109, '2023-05-08'),
(576, 104, '2023-05-08'),
(577, 124, '2023-05-08'),
(578, 126, '2023-05-08'),
(579, 129, '2023-05-08'),
(580, 96, '2023-05-08'),
(581, 103, '2023-05-08'),
(582, 173, '2023-05-08'),
(583, 105, '2023-05-08'),
(584, 144, '2023-05-08'),
(585, 171, '2023-05-08'),
(586, 106, '2023-05-08'),
(587, 170, '2023-05-09'),
(588, 125, '2023-05-09'),
(589, 107, '2023-05-09'),
(590, 134, '2023-05-09'),
(591, 128, '2023-05-09'),
(592, 123, '2023-05-09'),
(593, 169, '2023-05-09'),
(594, 100, '2023-05-10'),
(595, 144, '2023-05-10'),
(596, 175, '2023-05-10'),
(597, 180, '2023-05-10'),
(598, 102, '2023-05-11'),
(599, 114, '2023-05-13'),
(600, 101, '2023-05-13'),
(601, 101, '2023-05-13'),
(602, 101, '2023-05-13'),
(603, 97, '2023-05-13'),
(604, 128, '2023-05-13'),
(605, 181, '2023-05-14'),
(606, 179, '2023-05-14'),
(607, 100, '2023-05-14'),
(608, 181, '2023-05-14'),
(609, 101, '2023-05-15'),
(610, 129, '2023-05-15'),
(611, 102, '2023-05-15'),
(612, 130, '2023-05-15'),
(613, 101, '2023-05-15'),
(614, 104, '2023-05-15'),
(615, 103, '2023-05-15'),
(616, 106, '2023-05-15'),
(617, 107, '2023-05-15'),
(618, 100, '2023-05-15'),
(619, 181, '2023-05-15'),
(620, 181, '2023-05-15'),
(621, 144, '2023-05-15'),
(622, 100, '2023-05-15'),
(623, 144, '2023-05-16'),
(624, 102, '2023-05-18'),
(625, 96, '2023-05-18'),
(626, 134, '2023-05-18'),
(627, 129, '2023-05-18'),
(628, 128, '2023-05-18'),
(629, 128, '2023-05-18'),
(630, 130, '2023-05-18'),
(631, 125, '2023-05-19'),
(632, 129, '2023-05-19'),
(633, 96, '2023-05-19'),
(634, 170, '2023-05-19'),
(635, 130, '2023-05-19'),
(636, 102, '2023-05-19'),
(637, 99, '2023-05-19'),
(638, 123, '2023-05-19'),
(639, 128, '2023-05-19'),
(640, 169, '2023-05-19'),
(641, 134, '2023-05-20'),
(642, 93, '2023-05-20'),
(643, 144, '2023-05-20'),
(644, 112, '2023-05-20'),
(645, 112, '2023-05-20'),
(646, 112, '2023-05-20'),
(647, 102, '2023-05-20'),
(648, 124, '2023-05-20'),
(649, 126, '2023-05-20'),
(650, 171, '2023-05-21'),
(651, 182, '2023-05-21'),
(652, 100, '2023-05-21'),
(653, 106, '2023-05-21'),
(654, 129, '2023-05-21'),
(655, 144, '2023-05-21'),
(656, 106, '2023-05-21'),
(657, 101, '2023-05-22'),
(658, 104, '2023-05-23'),
(659, 129, '2023-05-23'),
(660, 104, '2023-05-23'),
(661, 104, '2023-05-23'),
(662, 104, '2023-05-23'),
(663, 134, '2023-05-23'),
(664, 102, '2023-05-23'),
(665, 103, '2023-05-23'),
(666, 105, '2023-05-23'),
(667, 109, '2023-05-24'),
(668, 106, '2023-05-24'),
(669, 107, '2023-05-24'),
(670, 126, '2023-05-24'),
(671, 111, '2023-05-24'),
(672, 144, '2023-05-24'),
(673, 107, '2023-05-24'),
(674, 101, '2023-05-24'),
(675, 128, '2023-05-24'),
(676, 123, '2023-05-26'),
(677, 101, '2024-02-27'),
(678, 126, '2024-02-27'),
(679, 100, '2024-02-27'),
(680, 101, '2024-02-27'),
(681, 100, '2024-02-27'),
(682, 134, '2024-02-27'),
(683, 128, '2024-02-27'),
(684, 101, '2024-02-27'),
(685, 101, '2024-02-27'),
(686, 126, '2024-02-27'),
(687, 126, '2024-02-27'),
(688, 124, '2024-02-27'),
(689, 107, '2024-02-27'),
(690, 101, '2024-02-27'),
(691, 101, '2024-02-27'),
(692, 102, '2024-02-27'),
(693, 100, '2024-02-27'),
(694, 129, '2024-02-27'),
(695, 124, '2024-02-27'),
(696, 124, '2024-02-28'),
(697, 123, '2024-02-28'),
(698, 123, '2024-02-28'),
(699, 97, '2024-02-28'),
(700, 97, '2024-02-28'),
(701, 102, '2024-02-28'),
(702, 101, '2024-02-28'),
(703, 128, '2024-02-28'),
(704, 114, '2024-02-28'),
(705, 123, '2024-02-28'),
(706, 114, '2024-02-28'),
(707, 99, '2024-02-28'),
(708, 100, '2024-02-28'),
(709, 100, '2024-02-28'),
(710, 100, '2024-02-28'),
(711, 100, '2024-02-28'),
(712, 102, '2024-02-28'),
(713, 101, '2024-02-28'),
(714, 101, '2024-02-28'),
(715, 114, '2024-02-28'),
(716, 134, '2024-02-28'),
(717, 102, '2024-02-28'),
(718, 101, '2024-02-28'),
(719, 100, '2024-02-28'),
(720, 130, '2024-02-28'),
(721, 101, '2024-02-28'),
(722, 101, '2024-02-28'),
(723, 179, '2024-02-29'),
(724, 107, '2024-02-29'),
(725, 111, '2024-02-29'),
(726, 101, '2024-02-29'),
(727, 100, '2024-02-29'),
(728, 144, '2024-02-29'),
(729, 97, '2024-02-29'),
(730, 101, '2024-02-29'),
(731, 95, '2024-03-01'),
(732, 99, '2024-03-01'),
(733, 102, '2024-03-01'),
(734, 130, '2024-03-01'),
(735, 123, '2024-03-01'),
(736, 102, '2024-03-01'),
(737, 102, '2024-03-01'),
(738, 102, '2024-03-01'),
(739, 101, '2024-03-01'),
(740, 130, '2024-03-01'),
(741, 114, '2024-03-01'),
(742, 130, '2024-03-02'),
(743, 114, '2024-03-02'),
(744, 129, '2024-03-02'),
(745, 97, '2024-03-02'),
(746, 101, '2024-03-02'),
(747, 99, '2024-03-02'),
(748, 96, '2024-03-02'),
(749, 101, '2024-03-03'),
(750, 106, '2024-03-03'),
(751, 103, '2024-03-03'),
(752, 180, '2024-03-03'),
(753, 109, '2024-03-03'),
(754, 107, '2024-03-03'),
(755, 130, '2024-03-03'),
(756, 130, '2024-03-03'),
(757, 102, '2024-03-03'),
(758, 102, '2024-03-03'),
(759, 173, '2024-03-03'),
(760, 178, '2024-03-03'),
(761, 169, '2024-03-03'),
(762, 107, '2024-03-03'),
(763, 124, '2024-03-03'),
(764, 105, '2024-03-03'),
(765, 130, '2024-03-03'),
(766, 130, '2024-03-03'),
(767, 102, '2024-03-03'),
(768, 175, '2024-03-03'),
(769, 126, '2024-03-03'),
(770, 125, '2024-03-03'),
(771, 125, '2024-03-03'),
(772, 130, '2024-03-03'),
(773, 104, '2024-03-03'),
(774, 96, '2024-03-03'),
(775, 111, '2024-03-03'),
(776, 181, '2024-03-03'),
(777, 179, '2024-03-03'),
(778, 182, '2024-03-03'),
(779, 174, '2024-03-03'),
(780, 123, '2024-03-04'),
(781, 102, '2024-03-04'),
(782, 128, '2024-03-04'),
(783, 103, '2024-03-04'),
(784, 100, '2024-03-04'),
(785, 96, '2024-03-04'),
(786, 103, '2024-03-05'),
(787, 103, '2024-03-05'),
(788, 103, '2024-03-05'),
(789, 105, '2024-03-05'),
(790, 101, '2024-03-05'),
(791, 102, '2024-03-05'),
(792, 99, '2024-03-05'),
(793, 126, '2024-03-05'),
(794, 125, '2024-03-06'),
(795, 128, '2024-03-07'),
(796, 124, '2024-03-07'),
(797, 107, '2024-03-07'),
(798, 181, '2024-03-09'),
(799, 123, '2024-03-09'),
(800, 101, '2024-03-09'),
(801, 126, '2024-03-09'),
(802, 97, '2024-03-09'),
(803, 129, '2024-03-09'),
(804, 129, '2024-03-09'),
(805, 130, '2024-03-09'),
(806, 130, '2024-03-09'),
(807, 130, '2024-03-09'),
(808, 130, '2024-03-09'),
(809, 130, '2024-03-09'),
(810, 130, '2024-03-09'),
(811, 130, '2024-03-09'),
(812, 101, '2024-03-09'),
(813, 102, '2024-03-09'),
(814, 101, '2024-03-09'),
(815, 102, '2024-03-09'),
(816, 102, '2024-03-10'),
(817, 102, '2024-03-10'),
(818, 125, '2024-03-10'),
(819, 102, '2024-03-10'),
(820, 101, '2024-03-10'),
(821, 130, '2024-03-11'),
(822, 102, '2024-03-11'),
(823, 97, '2024-03-16'),
(824, 96, '2024-03-16'),
(825, 130, '2024-03-16'),
(826, 106, '2024-03-16'),
(827, 114, '2024-03-17'),
(828, 107, '2024-03-17'),
(829, 103, '2024-03-18'),
(830, 100, '2024-03-18'),
(831, 102, '2024-03-21'),
(832, 180, '2024-03-24'),
(833, 180, '2024-03-24'),
(834, 123, '2024-03-24'),
(835, 105, '2024-03-24'),
(836, 102, '2024-03-25'),
(837, 101, '2024-03-25'),
(838, 106, '2024-03-25'),
(839, 129, '2024-03-25'),
(840, 104, '2024-03-25'),
(841, 103, '2024-03-25'),
(842, 101, '2024-03-25'),
(843, 109, '2024-03-26'),
(844, 144, '2024-03-26'),
(845, 175, '2024-03-26'),
(846, 169, '2024-03-27'),
(847, 104, '2024-03-27'),
(848, 101, '2024-03-27'),
(849, 179, '2024-03-27'),
(850, 134, '2024-03-27'),
(851, 129, '2024-03-27'),
(852, 124, '2024-03-27'),
(853, 100, '2024-03-27'),
(854, 182, '2024-03-27'),
(855, 112, '2024-03-27'),
(856, 114, '2024-03-27'),
(857, 93, '2024-03-27'),
(858, 106, '2024-03-27'),
(859, 102, '2024-03-27'),
(860, 111, '2024-03-27'),
(861, 103, '2024-03-27'),
(862, 130, '2024-03-27'),
(863, 181, '2024-03-27'),
(864, 129, '2024-03-27'),
(865, 126, '2024-03-27'),
(866, 95, '2024-03-27'),
(867, 100, '2024-03-27'),
(868, 101, '2024-03-27'),
(869, 102, '2024-03-27'),
(870, 174, '2024-03-27'),
(871, 123, '2024-03-27'),
(872, 180, '2024-03-27'),
(873, 100, '2024-03-27'),
(874, 97, '2024-03-27'),
(875, 99, '2024-03-27'),
(876, 173, '2024-03-27'),
(877, 178, '2024-03-27'),
(878, 105, '2024-03-27'),
(879, 128, '2024-03-27'),
(880, 107, '2024-03-27'),
(881, 109, '2024-03-27'),
(882, 101, '2024-03-28'),
(883, 99, '2024-03-28'),
(884, 182, '2024-03-29'),
(885, 102, '2024-03-29'),
(886, 99, '2024-03-29'),
(887, 111, '2024-03-29'),
(888, 101, '2024-03-29'),
(889, 101, '2024-03-29'),
(890, 128, '2024-03-30'),
(891, 102, '2024-03-30'),
(892, 106, '2024-03-30'),
(893, 100, '2024-03-30'),
(894, 100, '2024-03-30'),
(895, 101, '2024-03-31'),
(896, 100, '2024-03-31'),
(897, 102, '2024-03-31'),
(898, 101, '2024-04-01'),
(899, 179, '2024-04-01'),
(900, 124, '2024-04-02'),
(901, 130, '2024-04-02'),
(902, 111, '2024-04-02'),
(903, 114, '2024-04-02'),
(904, 104, '2024-04-04'),
(905, 129, '2024-04-04'),
(906, 112, '2024-04-06'),
(907, 101, '2024-04-06'),
(908, 124, '2024-04-06'),
(909, 182, '2024-04-06'),
(910, 129, '2024-04-06'),
(911, 100, '2024-04-06'),
(912, 144, '2024-04-06'),
(913, 93, '2024-04-06'),
(914, 175, '2024-04-07'),
(915, 179, '2024-04-07'),
(916, 169, '2024-04-07'),
(917, 126, '2024-04-07'),
(918, 101, '2024-04-07'),
(919, 106, '2024-04-07'),
(920, 100, '2024-04-07'),
(921, 144, '2024-04-07'),
(922, 134, '2024-04-08'),
(923, 93, '2024-04-08'),
(924, 97, '2024-04-08'),
(925, 99, '2024-04-08'),
(926, 144, '2024-04-08'),
(927, 103, '2024-04-08'),
(928, 102, '2024-04-08'),
(929, 175, '2024-04-08'),
(930, 178, '2024-04-08'),
(931, 179, '2024-04-08'),
(932, 180, '2024-04-08'),
(933, 181, '2024-04-08'),
(934, 182, '2024-04-08'),
(935, 104, '2024-04-08'),
(936, 105, '2024-04-08'),
(937, 106, '2024-04-08'),
(938, 107, '2024-04-08'),
(939, 109, '2024-04-08'),
(940, 100, '2024-04-08'),
(941, 101, '2024-04-08'),
(942, 173, '2024-04-08'),
(943, 174, '2024-04-08'),
(944, 126, '2024-04-08'),
(945, 96, '2024-04-08'),
(946, 112, '2024-04-08'),
(947, 114, '2024-04-08'),
(948, 111, '2024-04-08'),
(949, 130, '2024-04-08'),
(950, 169, '2024-04-08'),
(951, 170, '2024-04-08'),
(952, 171, '2024-04-08'),
(953, 123, '2024-04-08'),
(954, 124, '2024-04-08'),
(955, 125, '2024-04-08'),
(956, 128, '2024-04-08'),
(957, 129, '2024-04-08'),
(958, 95, '2024-04-08'),
(959, 100, '2024-04-08'),
(960, 104, '2024-04-08'),
(961, 97, '2024-04-09'),
(962, 173, '2024-04-09'),
(963, 178, '2024-04-09'),
(964, 134, '2024-04-09'),
(965, 128, '2024-04-09'),
(966, 107, '2024-04-09'),
(967, 114, '2024-04-09'),
(968, 106, '2024-04-09'),
(969, 103, '2024-04-09'),
(970, 109, '2024-04-09'),
(971, 126, '2024-04-09'),
(972, 111, '2024-04-09'),
(973, 102, '2024-04-09'),
(974, 130, '2024-04-09'),
(975, 112, '2024-04-09'),
(976, 95, '2024-04-09'),
(977, 181, '2024-04-09'),
(978, 123, '2024-04-09'),
(979, 174, '2024-04-09'),
(980, 180, '2024-04-09'),
(981, 144, '2024-04-09'),
(982, 99, '2024-04-09'),
(983, 105, '2024-04-09'),
(984, 100, '2024-04-10'),
(985, 101, '2024-04-10'),
(986, 97, '2024-04-10'),
(987, 130, '2024-04-14'),
(988, 101, '2024-04-14'),
(989, 100, '2024-04-14'),
(990, 125, '2024-04-14'),
(991, 100, '2024-04-14'),
(992, 129, '2024-04-14'),
(993, 102, '2024-04-14'),
(994, 100, '2024-04-14'),
(995, 101, '2024-04-14'),
(996, 100, '2024-04-14'),
(997, 101, '2024-04-14'),
(998, 101, '2024-04-15'),
(999, 100, '2024-04-15'),
(1000, 102, '2024-04-15'),
(1001, 95, '2024-04-15'),
(1002, 95, '2024-04-15'),
(1003, 130, '2024-04-15'),
(1004, 100, '2024-04-15'),
(1005, 101, '2024-04-15'),
(1006, 125, '2024-04-15'),
(1007, 109, '2024-04-15'),
(1008, 126, '2024-04-16'),
(1009, 126, '2024-04-16'),
(1010, 124, '2024-04-16'),
(1011, 124, '2024-04-16'),
(1012, 124, '2024-04-16'),
(1013, 125, '2024-04-16'),
(1014, 109, '2024-04-16'),
(1015, 100, '2024-04-16'),
(1016, 101, '2024-04-16'),
(1017, 114, '2024-04-16'),
(1018, 144, '2024-04-16'),
(1019, 104, '2024-04-17'),
(1020, 106, '2024-04-17'),
(1021, 100, '2024-04-17'),
(1022, 101, '2024-04-17'),
(1023, 100, '2024-04-19'),
(1024, 101, '2024-04-19'),
(1025, 125, '2024-04-19'),
(1026, 100, '2024-04-19'),
(1027, 101, '2024-04-20'),
(1028, 100, '2024-04-20'),
(1029, 129, '2024-04-20'),
(1030, 93, '2024-04-20'),
(1031, 126, '2024-04-20'),
(1032, 124, '2024-04-20'),
(1033, 102, '2024-04-20'),
(1034, 99, '2024-04-21'),
(1035, 104, '2024-04-21'),
(1036, 105, '2024-04-21'),
(1037, 100, '2024-04-21'),
(1038, 134, '2024-04-22'),
(1039, 100, '2024-04-22'),
(1040, 128, '2024-04-22'),
(1041, 107, '2024-04-22'),
(1042, 130, '2024-04-22'),
(1043, 111, '2024-04-22'),
(1044, 144, '2024-04-22'),
(1045, 112, '2024-04-22'),
(1046, 175, '2024-04-22'),
(1047, 109, '2024-04-23'),
(1048, 101, '2024-04-23'),
(1049, 100, '2024-04-23'),
(1050, 182, '2024-04-23'),
(1051, 102, '2024-04-23'),
(1052, 105, '2024-04-23'),
(1053, 114, '2024-04-23'),
(1054, 106, '2024-04-23'),
(1055, 103, '2024-04-23'),
(1056, 126, '2024-04-23'),
(1057, 101, '2024-04-23'),
(1058, 100, '2024-04-24'),
(1059, 101, '2024-04-24'),
(1060, 130, '2024-04-24'),
(1061, 171, '2024-04-25'),
(1062, 102, '2024-04-25'),
(1063, 173, '2024-04-25'),
(1064, 123, '2024-04-25'),
(1065, 97, '2024-04-25'),
(1066, 178, '2024-04-25'),
(1067, 95, '2024-04-25'),
(1068, 100, '2024-04-25'),
(1069, 100, '2024-04-25'),
(1070, 102, '2024-04-25'),
(1071, 100, '2024-04-25'),
(1072, 101, '2024-04-25'),
(1073, 181, '2024-04-25'),
(1074, 174, '2024-04-25'),
(1075, 180, '2024-04-25'),
(1076, 99, '2024-04-25'),
(1077, 169, '2024-04-25'),
(1078, 179, '2024-04-25'),
(1079, 101, '2024-04-25'),
(1080, 123, '2024-04-26'),
(1081, 181, '2024-04-26'),
(1082, 102, '2024-04-26'),
(1083, 102, '2024-04-26'),
(1084, 107, '2024-04-26'),
(1085, 102, '2024-04-27'),
(1086, 109, '2024-04-27'),
(1087, 109, '2024-04-27'),
(1088, 109, '2024-04-27'),
(1089, 102, '2024-04-27'),
(1090, 101, '2024-04-27'),
(1091, 130, '2024-04-27'),
(1092, 129, '2024-04-27'),
(1093, 97, '2024-04-27'),
(1094, 101, '2024-04-27'),
(1095, 182, '2025-02-09'),
(1096, 182, '2025-02-09'),
(1097, 125, '2025-02-10'),
(1098, 171, '2025-02-10'),
(1099, 107, '2025-02-10');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` tinyint(4) NOT NULL,
  `review_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `comment_id` int(10) UNSIGNED NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `subtitle` text DEFAULT NULL,
  `details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `photo`, `title`, `subtitle`, `details`) VALUES
(4, '1557343012img.jpg', 'Jhon Smith', 'CEO & Founder', 'Lorem ipsum dolor sit amet, consectetur elitad adipiscing Cras non placerat mi.'),
(5, '1557343018img.jpg', 'Jhon Smith', 'CEO & Founder', 'Lorem ipsum dolor sit amet, consectetur elitad adipiscing Cras non placerat mi.'),
(6, '1557343024img.jpg', 'Jhon Smith', 'CEO & Founder', 'Lorem ipsum dolor sit amet, consectetur elitad adipiscing Cras non placerat mi.');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `section` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `section`) VALUES
(16, 'Manager', 'orders , products , affilate_products , customers , vendors , vendor_subscription_plans , categories , bulk_product_upload , product_discussion , set_coupons , blog , messages , general_settings , home_page_settings , menu_page_settings , emails_settings , payment_settings , social_settings , language_settings , seo_tools , subscribers'),
(17, 'Moderator', 'orders , products , customers , vendors , categories , blog , messages , home_page_settings , payment_settings , social_settings , language_settings , seo_tools , subscribers'),
(18, 'Staff', 'orders , products , vendors , vendor_subscription_plans , categories , blog , home_page_settings , menu_page_settings , language_settings , seo_tools , subscribers');

-- --------------------------------------------------------

--
-- Table structure for table `seotools`
--

CREATE TABLE `seotools` (
  `id` int(10) UNSIGNED NOT NULL,
  `google_analytics` text DEFAULT NULL,
  `meta_keys` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seotools`
--

INSERT INTO `seotools` (`id`, `google_analytics`, `meta_keys`) VALUES
(1, '<script>//Google Analytics Scriptfffffffffffffffffffffffssssfffffs</script>', 'Genius,Ocean,Sea,Etc,Genius,Ocean,SeaGenius,Ocean,Sea,Etc,Genius,Ocean,SeaGenius,Ocean,Sea,Etc,Genius,Ocean,Sea');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `user_id`, `title`, `details`, `photo`) VALUES
(2, 0, 'FREE SHIPPING', 'Free Shipping All Order', '1571288944s1.png'),
(3, 0, 'PAYMENT METHOD', 'Secure Payment', '1571288950s2.png'),
(4, 0, '30 DAY RETURNS', '30-Day Return Policy', '1571288955s3.png'),
(5, 0, 'HELP CENTER', '24/7 Support System', '1571288959s4.png'),
(6, 13, 'FREE SHIPPING', 'Free Shipping All Order', '1571457250s1.png'),
(7, 13, 'PAYMENT METHOD', 'Secure Payment', '1571457257s2.png'),
(8, 13, '30 DAY RETURNS', '30-Day Return Policy', '1571457261s3.png'),
(9, 13, 'HELP CENTER', '24/7 Support System', '1571457265s4.png');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `title` text DEFAULT NULL,
  `subtitle` text DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `user_id`, `title`, `subtitle`, `price`) VALUES
(3, 0, 'SA Paribahan', '3-4 Days', 1.4117647058824),
(4, 0, 'Sundorban Courier Service', '3-4 Days', 1.4117647058824),
(5, 0, 'Redex', '24 Hours', 0.70588235294118);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `subtitle_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_size` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_anime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_size` varchar(50) DEFAULT NULL,
  `title_color` varchar(50) DEFAULT NULL,
  `title_anime` varchar(50) DEFAULT NULL,
  `details_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details_size` varchar(50) DEFAULT NULL,
  `details_color` varchar(50) DEFAULT NULL,
  `details_anime` varchar(50) DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `subtitle_text`, `subtitle_size`, `subtitle_color`, `subtitle_anime`, `title_text`, `title_size`, `title_color`, `title_anime`, `details_text`, `details_size`, `details_color`, `details_anime`, `photo`, `position`, `link`) VALUES
(8, NULL, '24', '#ffffff', 'slideInUp', NULL, '50', '#ff812c', 'slideInDown', NULL, '16', '#ffffff', 'slideInRight', '1739137725baner1.png', 'slide-one', 'https://www.google.com/'),
(9, NULL, '24', '#ffffff', 'slideInUp', NULL, '50', '#ff812c', 'slideInDown', NULL, '16', '#ffffff', 'slideInDown', '1739137719baner1.png', 'slide-one', 'www.designnetic.com'),
(11, NULL, NULL, '#000000', 'fadeIn', NULL, NULL, NULL, 'fadeIn', NULL, '16', '#ffffff', 'fadeIn', '1739137608baner1.png', 'slide-one', 'https://itnayeem.com.bd/');

-- --------------------------------------------------------

--
-- Table structure for table `socialsettings`
--

CREATE TABLE `socialsettings` (
  `id` int(10) UNSIGNED NOT NULL,
  `facebook` varchar(191) NOT NULL,
  `gplus` varchar(191) NOT NULL,
  `twitter` varchar(191) NOT NULL,
  `linkedin` varchar(191) NOT NULL,
  `dribble` varchar(191) DEFAULT NULL,
  `f_status` tinyint(4) NOT NULL DEFAULT 1,
  `g_status` tinyint(4) NOT NULL DEFAULT 1,
  `t_status` tinyint(4) NOT NULL DEFAULT 1,
  `l_status` tinyint(4) NOT NULL DEFAULT 1,
  `d_status` tinyint(4) NOT NULL DEFAULT 1,
  `f_check` tinyint(4) DEFAULT NULL,
  `g_check` tinyint(4) DEFAULT NULL,
  `fclient_id` text DEFAULT NULL,
  `fclient_secret` text DEFAULT NULL,
  `fredirect` text DEFAULT NULL,
  `gclient_id` text DEFAULT NULL,
  `gclient_secret` text DEFAULT NULL,
  `gredirect` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `socialsettings`
--

INSERT INTO `socialsettings` (`id`, `facebook`, `gplus`, `twitter`, `linkedin`, `dribble`, `f_status`, `g_status`, `t_status`, `l_status`, `d_status`, `f_check`, `g_check`, `fclient_id`, `fclient_secret`, `fredirect`, `gclient_id`, `gclient_secret`, `gredirect`) VALUES
(1, 'https://www.facebook.com/', 'https://plus.google.com/', 'https://twitter.com/', 'https://www.linkedin.com/', 'https://dribbble.com/', 1, 1, 1, 1, 1, 1, 1, '503140663460329', 'f66cd670ec43d14209a2728af26dcc43', 'https://localhost/upgraded/kingcommerce-new/auth/facebook/callback', '904681031719-sh1aolu42k7l93ik0bkiddcboghbpcfi.apps.googleusercontent.com', 'yGBWmUpPtn5yWhDAsXnswEX3', 'http://localhost/upgraded/kingcommerce-new/auth/google/callback');

-- --------------------------------------------------------

--
-- Table structure for table `social_providers`
--

CREATE TABLE `social_providers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `provider_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `category_id`, `name`, `slug`, `status`) VALUES
(2, 4, 'TELEVISION', 'television', 1),
(3, 4, 'REFRIGERATOR', 'refrigerator', 1),
(4, 4, 'WASHING MACHINE', 'washing-machine', 1),
(5, 4, 'AIR CONDITIONERS', 'air-conditioners', 1),
(6, 5, 'ACCESSORIES', 'accessories', 1),
(7, 5, 'BAGS', 'bags', 1),
(8, 5, 'CLOTHINGS', 'clothings', 1),
(9, 5, 'SHOES', 'shoes', 1),
(10, 7, 'APPLE', 'apple', 1),
(11, 7, 'SAMSUNG', 'samsung', 1),
(12, 7, 'LG', 'lg', 1),
(13, 7, 'SONY', 'sony', 1),
(14, 6, 'DSLR', 'dslr', 1),
(15, 6, 'Camera Phone', 'camera-phone', 1),
(16, 6, 'Action Camera', 'animation-camera', 1),
(17, 6, 'Digital Camera', 'digital-camera', 1),
(18, 20, 'Demo1', 'Demo1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(11) NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `days` int(11) NOT NULL,
  `allowed_products` int(11) NOT NULL DEFAULT 0,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `title`, `currency`, `currency_code`, `price`, `days`, `allowed_products`, `details`) VALUES
(5, 'Standard', '৳', 'BDT', 60, 45, 16, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>'),
(6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>'),
(7, 'Unlimited', '৳', 'BDT', 11.764705882353, 30, 0, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>'),
(8, 'Basic', '৳', 'BDT', 0, 30, 0, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `txn_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double DEFAULT 0,
  `currency_sign` blob DEFAULT NULL,
  `currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_value` double NOT NULL DEFAULT 0,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txnid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'plus, minus',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `txn_number`, `amount`, `currency_sign`, `currency_code`, `currency_value`, `method`, `txnid`, `details`, `type`, `created_at`, `updated_at`) VALUES
(1, 22, 'SKk0774sN9', 320, 0x24, 'USD', 1, NULL, NULL, 'Payment Via Wallet', 'minus', '2020-05-31 04:26:14', '2020-05-31 04:26:14'),
(2, 22, 'nNI0989op1', 130, 0x24, 'USD', 1, NULL, NULL, 'Payment Via Wallet', 'minus', '2020-05-31 04:29:49', '2020-05-31 04:29:49'),
(3, 22, '7re14878jD', 130, 0x24, 'USD', 1, NULL, NULL, 'Payment Via Wallet', 'minus', '2020-05-31 04:38:07', '2020-05-31 04:38:07'),
(4, 22, 'BYr2053KuN', 1600, 0x24, 'USD', 1, NULL, NULL, 'Payment Via Wallet', 'minus', '2020-06-01 22:27:33', '2020-06-01 22:27:33'),
(5, 22, 'Ee648427Nl', 2.4875621890547, 0x5224, 'BRL', 4.02, 'MercadoPago', '1235324161', 'Payment Deposit', 'plus', '2021-04-01 05:00:42', '2021-04-01 05:00:42'),
(6, 13, 'k0g0417jXR', 10, 0x24, 'USD', 1, 'Molly Payment', 'tr_g3Kc3sHWwb', 'Payment Deposit', 'plus', '2021-04-03 03:00:17', '2021-04-03 03:00:17'),
(7, 13, 'cNR0463svz', 0.02747864222533, 0xe282a6, 'NGN', 363.919, 'Paystack', '245249284', 'Payment Deposit', 'plus', '2021-04-03 03:01:03', '2021-04-03 03:01:03'),
(8, 13, 'N561202Ssb', 10, 0x24, 'USD', 1, 'Flutterwave', '2004551', 'Payment Deposit', 'plus', '2021-04-03 03:13:22', '2021-04-03 03:13:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `zip` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `fax` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_provider` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `verification_link` text DEFAULT NULL,
  `email_verified` enum('Yes','No') NOT NULL DEFAULT 'No',
  `affilate_code` text DEFAULT NULL,
  `affilate_income` double NOT NULL DEFAULT 0,
  `shop_name` text DEFAULT NULL,
  `owner_name` text DEFAULT NULL,
  `shop_number` text DEFAULT NULL,
  `shop_address` text DEFAULT NULL,
  `reg_number` text DEFAULT NULL,
  `shop_message` text DEFAULT NULL,
  `shop_details` text DEFAULT NULL,
  `shop_image` varchar(191) DEFAULT NULL,
  `f_url` text DEFAULT NULL,
  `g_url` text DEFAULT NULL,
  `t_url` text DEFAULT NULL,
  `l_url` text DEFAULT NULL,
  `is_vendor` tinyint(1) NOT NULL DEFAULT 0,
  `f_check` tinyint(1) NOT NULL DEFAULT 0,
  `g_check` tinyint(1) NOT NULL DEFAULT 0,
  `t_check` tinyint(1) NOT NULL DEFAULT 0,
  `l_check` tinyint(1) NOT NULL DEFAULT 0,
  `mail_sent` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_cost` double NOT NULL DEFAULT 0,
  `current_balance` double NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `ban` tinyint(1) NOT NULL DEFAULT 0,
  `balance` decimal(11,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `photo`, `zip`, `city`, `country`, `state`, `address`, `phone`, `fax`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `is_provider`, `status`, `verification_link`, `email_verified`, `affilate_code`, `affilate_income`, `shop_name`, `owner_name`, `shop_number`, `shop_address`, `reg_number`, `shop_message`, `shop_details`, `shop_image`, `f_url`, `g_url`, `t_url`, `l_url`, `is_vendor`, `f_check`, `g_check`, `t_check`, `l_check`, `mail_sent`, `shipping_cost`, `current_balance`, `date`, `ban`, `balance`) VALUES
(13, 'Vendor', '1557677677bouquet_PNG62.png', '1234', NULL, 'Algeria', 'UN', NULL, '3453453345453411', '23123121', 'vendor@gmail.com', '$2y$10$.4NrvXAeyToa4x07EkFvS.XIUEc/aXGsxe1onkQ.Udms4Sl2W9ZYq', 'JKf1fVEBd1lMqPf0plI4qCpCZFDFi0Nu519MbWpsd1joyHlGXUAMDymwr9Vo', '2018-03-07 18:05:44', '2024-02-28 16:05:17', 0, 2, '$2y$10$oIf1at.0LwscVwaX/8h.WuSwMKEAAsn8EJ.9P7mWzNUFIcEBQs8ry', 'Yes', '$2y$10$oIf1at.0LwscVwaX/8h.WuSwMKEAAsn8EJ.9P7mWzNUFIcEBQs8rysdfsdfds', 5000, 'Test Stores', 'User', '43543534', 'Space Needle 400 Broad St, Seattles', 'asdasd', 'sdf', 'TEST DETAILS', '1579424193adv-banner.jpg', NULL, NULL, NULL, NULL, 2, 0, 0, 0, 0, 1, 0, 5878.52, '2021-09-30', 0, 119.82),
(22, 'User', NULL, '1231', 'Test City', 'United States', 'UN', 'Test Address', '34534534534', '34534534534', 'user@gmail.com', '$2y$10$.4NrvXAeyToa4x07EkFvS.XIUEc/aXGsxe1onkQ.Udms4Sl2W9ZYq', '8FYJ8gkV2fN8SApzPo4XB3WqxRmiyReibzK79hiSCvQe3JJKt0BB1ejxHVdA', '2019-06-20 12:26:24', '2021-04-01 05:00:42', 0, 0, '1edae93935fba69d9542192fb854a80a', 'Yes', '8f09b9691613ecb8c3f7e36e34b97b80', 4953.290000000001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1, 0, 0, NULL, 0, 127296.67),
(27, 'Test User', NULL, '1234', 'Test City', 'United Kingdom', 'UN', 'Space Needle 400 Broad St, Seattles', '34534534', '34534534', 'junajunnun@gmail.com', '$2y$10$pxNqceuvTvYLuwA.gZ15aejOTtXGHrDT7t2m8wfIZhNO1e52z7aLS', 'aS8LRQD0tB168exjfojY7o4K7D84AlFIcn7GbhOFm52ZyEmUHlTDHkyrVyh9', '2019-10-05 04:15:08', '2022-08-22 18:47:47', 0, 0, '0521bba4c819528b6a18a581a5842f17', 'Yes', 'bb9d23401cd70f11998fe36ea7677797', 0, 'Test Store', 'User', '01858989394', 'Space Needle 400 Broad St, Seattles', 'asdasd', 'ds', '<br>', NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, 0, 0, 0, 0, '2019-11-24', 0, 10000.00),
(28, 'User', NULL, '1234', 'Test City', 'Algeria', 'UN', NULL, '34534534', '034534534', 'junnun@gmail.com', '$2y$10$YDfElg7O3K6eQK5enu.TBOyo.8TIr6Ynf9hFQ8dsIDeWAfmmg6hA.', 'pNFebTvEQ3jRaky9p7XnCetHs9aNFFG7nqRFho0U7nWrgT7phS6MoX8f9EYz', '2019-10-13 05:39:13', '2020-01-12 01:36:05', 0, 0, '8036978c6d71501e893ba7d3f3ecc15d', 'Yes', '33899bafa30292165430cb90b545728a', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 9000.00),
(29, 'Md nayeem hossain', NULL, NULL, NULL, NULL, NULL, 'House:35/3/1', '01875952626', NULL, 'kutta7575@gmail.com', '$2y$10$dztMv/oHs8rOzgd0XaVXcuZYlRRX/RsCPMQjNfeIDbL3l4JqJuChq', NULL, '2022-04-21 10:58:55', '2022-04-21 10:58:55', 0, 0, '9a9567cbd282c4d3637b0c13c541a3f5', 'Yes', 'ed53710ddb24e164605f752aa9bd9fb1', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(30, 'md', NULL, NULL, NULL, NULL, NULL, 'ui', '0000000000', NULL, 'user30@itnayeem.com.bd', '$2y$10$aMlx34FizT8vLna76dkivOqxBCAGUDPvjIopadYLOmQEr9Dt0uG4K', NULL, '2022-04-28 09:36:59', '2022-04-28 09:36:59', 0, 0, '5de4b9406f3d8106786399dc00b735ae', 'Yes', '88bee4776f24ca6c6cc0f745d69d2e02', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(31, 'TechLock Gps', NULL, NULL, NULL, NULL, NULL, 'gangail', '01705090630', NULL, 'techlockbd@gmail.com', '$2y$10$UlNuYBdBbeYCJx7N6.0fseVmiTq7rXQnpji1E3ci3Fq9yH2KcIUSW', NULL, '2022-08-17 17:03:49', '2022-08-17 17:05:53', 0, 0, '887b2abcba68b586f268d6a7f798fe59', 'Yes', 'c7b4af58a1cf04f1c3db5cfac69548c8', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(32, 'SAIFUL ISLAM', NULL, NULL, NULL, NULL, NULL, 'Nobinogor housing, Mohammadpur, Dhaka', '01829368764', NULL, 'namiramart@gmail.com', '$2y$10$e/l57mA8g1cpE0fbWRKhnOBlTUHP00VErZnwU0h6m5aBIljqTK9HS', NULL, '2022-08-19 13:34:48', '2022-08-19 13:34:48', 0, 0, 'd0ad7fd4af5bd4f7fde197b6e32a49b3', 'Yes', 'a44b673255423bd5e71d0181019f2ee3', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(33, 'vcvcv', NULL, NULL, NULL, NULL, NULL, 'xcxcx', '01950090011', NULL, 'didarcoxmedia0@gmail.com', '$2y$10$5cKDTggq9XpfhWH2vbNuReOilzqpBdsCMlfeDMDmv6T5jvQOo0NOW', NULL, '2022-09-04 17:53:40', '2022-09-04 17:56:34', 0, 0, '2d4a6815671dd823e4317a03c14394f2', 'Yes', '42e73afba794a4597d68bac905e2b88d', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(34, 'Suyel Haque', NULL, NULL, NULL, NULL, NULL, 'support@itnayeem.com.bd', '+8801722597565', NULL, 'support@itnayeem.com.bd', '$2y$10$9TG3RzIU4CvbMKoufZjG2eSpyhIsIlDlzvW4oqUiDF8vnoe/KhOKG', NULL, '2022-09-06 07:59:09', '2024-02-28 16:05:17', 0, 0, '663d35a690e14620b531a5ca11a5c4ab', 'Yes', 'cd0c6ea07ec6831e38d55d3eec754ff7', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(35, 'Md Akbar Ali', NULL, NULL, NULL, NULL, NULL, 'Palash', '01941118331', NULL, 'mdakbaralibd98@gmail.com', '$2y$10$Wzw9Rnc5E4dXYXwyk6VwgeQPvcYJU26A8/T8trhmQi/t9hU2O0Eay', NULL, '2022-09-06 15:02:32', '2022-11-27 16:01:21', 0, 0, 'eb58cc8362db9b188c3952cce087fd19', 'Yes', 'bb3cea000c750bc0ed98d694a89a5066', 0, 'xdgtdr', 'dfsdfg', 'fdsfsfs', 'gdghd', 'fsdfsdgd', 'dfsdgf', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(36, 'Md Minhazul Haque', NULL, NULL, NULL, NULL, NULL, 'mohadevpur', '01816985847', NULL, 'mmhminhaj532@gmail.com', '$2y$10$Y9Fhga1c05zhEZGyTKQNTOZI/VAfVYqWN3ePaH9PN4Tj3B7Xfpi8O', NULL, '2022-10-06 19:07:51', '2022-10-06 19:09:26', 0, 0, 'cbba284435abe0881b7d270687191dfe', 'Yes', 'f80a56daf25103076e089d339355663a', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(37, 'Md Minhazul Haque', NULL, NULL, NULL, NULL, NULL, 'mohadevpur', '01816985847', NULL, 'mmhbdshop@gmail.com', '$2y$10$MX5ViDuu/TA.pxV5TfA5p.MEN3kiUS6mi6FhhgDpJPjdOVp4ftkWa', NULL, '2022-10-07 03:55:32', '2022-10-07 03:56:16', 0, 0, 'c6efe8785ffcbfebdc4820feb378cd7f', 'Yes', '6cdeef4c6e17202a58fe7b0b84f3d29d', 0, 'MMH BD Shop', 'Md Minhazul Haque', '1234567890', 'Mohadevpur', '1234567890', 'Demo', NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, 0, 1, 0, 0, '2022-11-06', 0, 0.00),
(38, 'Md Akbar Ali', NULL, NULL, NULL, NULL, NULL, 'Palash', '01941118331', NULL, 'info@oninhost.com', '$2y$10$Ky.2j2DigYMFA7y2t/cOQuqKILGxvFuesTWJhNOvrFVcC6OI/Xouu', NULL, '2022-11-27 16:02:41', '2022-11-27 16:02:41', 0, 0, '1bbabda73feb7e221b5c3a78c35a2fb5', 'Yes', '8e883dcd9fd97fa9dc85ec4f8280ea07', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(39, 'Md Minhazul Haque', NULL, NULL, NULL, NULL, NULL, 'হক', '+8801731860006', NULL, 'onticbd@gmail.com', '$2y$10$AMGRB5SziKGTxTJ0Pwk0X.5R1WmCVuv6GtOylc0VVOIgZXgYGuuDa', NULL, '2022-12-27 06:42:49', '2022-12-27 06:42:49', 0, 0, 'baeb53f3d4c8bb8f1b04c92ccf9001d8', 'Yes', 'fab19c270ebf16a59128bc1d8cb7547a', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(40, 'Md Abu Sayed', NULL, NULL, NULL, NULL, NULL, '35/3', '01778208785', NULL, 'user40@itnayeem.com.bd', '$2y$10$XuqU1IU8aCOJJSYzEzGcmuj0MSox/K8RsxFbE9U4UhMMlKTiZJmf6', NULL, '2023-04-02 22:21:21', '2023-04-02 22:21:21', 0, 0, '5524167019a14e5679c2a1a278f9ecea', 'Yes', 'a20ac60c2d22cc6b654268cb40e29a0f', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(41, 'rajan', NULL, NULL, NULL, NULL, NULL, 'Dhaka', '01911812221', NULL, 'sascorporationltd@gmail.com', '$2y$10$xDXgVa/ryIhx9CwbANkuVO6ofCrky3RHYmYl95A4kW.nyOVI/xDJK', NULL, '2023-04-08 23:47:49', '2023-04-08 23:50:13', 0, 0, '3f0886141727fa030fc59fa43283543e', 'Yes', '40c34344e26df8679b9148ac6fef46a2', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(42, 'aaaaa', NULL, NULL, NULL, NULL, NULL, 'dh', '01842336325', NULL, 'aaa@email.cv', '$2y$10$WkVCE4L0AOAZ0TcpTwEOhe1fB2Ids6HG2/yf6f6MIk783wjJgR4Z.', NULL, '2023-05-14 10:50:14', '2023-05-14 11:06:14', 0, 0, '2d1286cdb0acc4884eeb93c49970c271', 'Yes', 'b94263608f49e9a6447c71b2f5df5f75', 0, 'aaaa', 'aa', '123', 'ad', 'q', 'hi', NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, 0, 1, 0, 0, '2023-06-13', 0, 0.00),
(43, 'Jubair Bin Hossain', NULL, NULL, NULL, NULL, NULL, 'Mirpur-1,Dhaka-1216', '01771487674', NULL, 'shovonboss99@gmail.com', '$2y$10$tCIuv1ATtbs43qb6nwEEOOoOK54Hk.g7/BqVp/Uo3CB6euHbqEseS', NULL, '2023-05-18 22:46:46', '2023-05-18 22:48:34', 0, 0, '9f6395699f998ec4ea1552d0a4c95855', 'Yes', '430eabedce83b50e8dcdf4bed6878662', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(44, 'Sawonbhi', NULL, NULL, NULL, NULL, NULL, 'Ghhv', '01799234635', NULL, 'sawonbhi754@gmail.com', '$2y$10$5Pc0fNFdBJBXGaZlCKezMuBYa72E7frS7xFaOwlPSGf0GhN.jrKpm', NULL, '2023-05-24 18:08:17', '2023-05-24 18:12:05', 0, 0, '54239e4261a3fb2a31e0dcbcffaadeab', 'Yes', 'db3f310162be0d5bb10f898a9b5339d9', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(45, 'Mahade', NULL, NULL, NULL, NULL, NULL, 'Oman', '+441330801694', NULL, 'babulbapari073@gmail.com', '$2y$10$4MNQ06aSFSUXDiCwboFpm.3DjbN6WESD7L.lzIyU3n0gIfLHJkmwi', NULL, '2024-02-29 10:35:56', '2024-02-29 10:35:56', 0, 0, '02ce83eba17f9e2b35f29e0c6a0dda7a', 'Yes', 'ec587aebcccb3e263338912480d985c7', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(46, 'Burhanul Islam', NULL, NULL, NULL, NULL, NULL, '427,Road-30,Level-4,DOHS,Mohakhali,Dhaka', '+8801710084184', NULL, 'burhanislam009@gmail.com', '$2y$10$ExCsoL5.7JJwRbMYX9CNROYpY7lyy7hhHbO28LvjHYaGm0Iqzi.4e', NULL, '2024-03-19 05:06:42', '2024-03-19 05:06:42', 0, 0, 'd1affb08d27dc624a4d9809ef2696391', 'Yes', '0b16305ef83c8e7301c36ddbc2cd876e', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(47, 'Test', NULL, NULL, NULL, NULL, NULL, 'Dhaka', '013218746487', NULL, 'test@gmail.com', '$2y$10$sJz7/ISzF0UV/v40am7mQeIjkPsQPEp62/V5PdC1o4rb2g5UVLS3O', NULL, '2024-03-25 15:57:24', '2024-03-25 15:57:24', 0, 0, 'a9d4d4ce1bda52cd9efd72c85e15bc8b', 'Yes', '036b92a00c6c0265b8088096f5f70be5', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(48, 'Reed W', NULL, NULL, NULL, NULL, NULL, '4278 W Jolly Rd', '5172728648', NULL, 'revenue29@gmail.com', '$2y$10$IcriECDw5Wtt26K0TcWJe.hjhbw0hHno.KyWG1dbLSysgu8.Y8sYO', NULL, '2024-04-08 20:00:38', '2024-04-08 20:00:38', 0, 0, 'c6b6a55c2878e4a2f364d7569cb23b6f', 'Yes', '3654bc741e514c8c2e25e247c34122bd', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(49, 'MONIRUL ISLAM', NULL, NULL, NULL, NULL, NULL, 'Sanarpar,  demra, Dhaka', '01712235325', NULL, 'hmcbd001@gmail.com', '$2y$10$z9tWiCs0wdqZdUpDMSS.ru1z6OeYB5g4uC71BCFXGImvYjxVjyt3e', NULL, '2024-04-20 17:32:23', '2024-04-20 17:32:23', 0, 0, 'a288e0e43480d84907f304e0db42900d', 'Yes', 'bb5f1eca481dec337b2dd53c75bb4402', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(50, 'Bell Pratt', NULL, NULL, NULL, NULL, NULL, 'Quia veniam est nos', '+1 (176) 172-8337', NULL, 'cafotisu@mailinator.com', '$2y$10$2ahBgQ/CVmdZ4OdvpdtA7eIDMFTLLz0e6CPzyOumi.RupqYQbiSbS', NULL, '2024-04-21 15:45:41', '2024-04-21 15:45:41', 0, 0, '98cf3c0e847db25c7c48a087e54e5a7e', 'Yes', 'ef8b77adfa1839d6a2bd76fbf02c6c5f', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00),
(51, 'Tatyana Wilson', NULL, NULL, NULL, NULL, NULL, 'Eum nemo quia in qua', '+1 (357) 165-9369', NULL, 'sydam@mailinator.com', '$2y$10$/ChNAn76Pw/wyRitbGFH2edoLQe0SoJacXhMXtjeLNw7Gnxh5dUSG', NULL, '2024-04-25 12:05:59', '2024-04-25 12:05:59', 0, 0, '1b9c8751a9c14b19d27979dde8f8fcae', 'Yes', '4159cb117a63e6d207b599c0821b5cb2', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_notifications`
--

INSERT INTO `user_notifications` (`id`, `user_id`, `order_number`, `is_read`, `created_at`, `updated_at`) VALUES
(1, 13, 'i2kY1650989847', 0, '2022-04-26 16:17:27', '2022-04-26 16:17:27'),
(2, 13, 'A38C1651029832', 0, '2022-04-27 03:23:52', '2022-04-27 03:23:52'),
(3, 13, 'JNS21659374548', 0, '2022-08-01 21:22:29', '2022-08-01 21:22:29'),
(4, 13, '2kWo1660741553', 0, '2022-08-17 17:05:53', '2022-08-17 17:05:53'),
(5, 13, 'jYqx1662299794', 0, '2022-09-04 17:56:34', '2022-09-04 17:56:34'),
(6, 13, 'Zf6d1662436824', 0, '2022-09-06 08:00:24', '2022-09-06 08:00:24'),
(7, 13, 'KZqe1662461942', 0, '2022-09-06 14:59:02', '2022-09-06 14:59:02'),
(8, 13, 'NUrF1662462001', 0, '2022-09-06 15:00:01', '2022-09-06 15:00:01'),
(9, 13, 'NEN11662462086', 0, '2022-09-06 15:01:26', '2022-09-06 15:01:26'),
(10, 13, 'Y1BC1665028839', 0, '2022-10-06 04:00:39', '2022-10-06 04:00:39'),
(11, 13, 'Pj4B1665083366', 0, '2022-10-06 19:09:26', '2022-10-06 19:09:26'),
(12, 13, 'iWqi1669571358', 0, '2022-11-27 16:49:18', '2022-11-27 16:49:18'),
(13, 13, 'XAwV1680608797', 0, '2023-04-04 15:46:37', '2023-04-04 15:46:37'),
(14, 13, 'y4mG1680983413', 0, '2023-04-08 23:50:13', '2023-04-08 23:50:13'),
(15, 13, 'grmF1682064443', 0, '2023-04-21 12:07:23', '2023-04-21 12:07:23'),
(16, 13, 'hM981683088070', 0, '2023-05-03 08:27:51', '2023-05-03 08:27:51'),
(17, 13, 'VxYM1684435714', 0, '2023-05-18 22:48:34', '2023-05-18 22:48:34'),
(18, 13, 't77u1684687610', 0, '2023-05-21 20:46:50', '2023-05-21 20:46:50'),
(19, 13, 'e4l11684937429', 0, '2023-05-24 18:10:29', '2023-05-24 18:10:29'),
(20, 13, 'uidO1684937525', 0, '2023-05-24 18:12:06', '2023-05-24 18:12:06'),
(21, 13, 'LHj01709023690', 0, '2024-02-27 08:48:10', '2024-02-27 08:48:10'),
(22, 13, 'iSoV1709024092', 0, '2024-02-27 08:54:52', '2024-02-27 08:54:52'),
(23, 13, '4EaK1709039108', 0, '2024-02-27 13:05:08', '2024-02-27 13:05:08'),
(24, 13, 'chw51709124498', 0, '2024-02-28 12:48:18', '2024-02-28 12:48:18'),
(25, 13, '0IEr1709133103', 0, '2024-02-28 15:11:43', '2024-02-28 15:11:43'),
(26, 13, 'vQnM1709136317', 0, '2024-02-28 16:05:17', '2024-02-28 16:05:17'),
(27, 13, 'VQZ71709383088', 0, '2024-03-02 12:38:08', '2024-03-02 12:38:08');

-- --------------------------------------------------------

--
-- Table structure for table `user_subscriptions`
--

CREATE TABLE `user_subscriptions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subscription_id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `days` int(11) NOT NULL,
  `allowed_products` int(11) NOT NULL DEFAULT 0,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Free',
  `txnid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flutter_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `payment_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_subscriptions`
--

INSERT INTO `user_subscriptions` (`id`, `user_id`, `subscription_id`, `title`, `currency`, `currency_code`, `price`, `days`, `allowed_products`, `details`, `method`, `txnid`, `charge_id`, `flutter_id`, `created_at`, `updated_at`, `status`, `payment_number`) VALUES
(81, 27, 5, 'Standard', '$', 'NGN', 60, 45, 16, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>', 'Paystack', '688094995', NULL, NULL, '2019-10-09 21:32:57', '2023-05-14 10:55:29', 1, NULL),
(94, 13, 5, 'Standard', '$', 'USD', 60, 45, 16, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>', 'Voguepay', 'demo-5e1d577004e90', NULL, NULL, '2020-01-13 23:54:30', '2023-05-14 10:55:29', 1, NULL),
(95, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Stripe', 'txn_1IbOJiJlIV5dN9n733iPl3bf', 'ch_1IbOJiJlIV5dN9n78XPjQP8R', NULL, '2021-04-01 05:04:02', '2021-04-01 05:04:02', 1, NULL),
(96, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Molly', 'tr_VqBFPF2bxJ', NULL, NULL, '2021-04-03 01:38:06', '2021-04-03 01:38:06', 1, NULL),
(97, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Paytm', '20210403111212800110168189602520839', NULL, NULL, '2021-04-03 01:39:37', '2021-04-03 01:39:55', 1, NULL),
(98, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Flutterwave', NULL, NULL, 'UlIV1617435825', '2021-04-03 01:43:45', '2021-04-03 01:43:45', 0, NULL),
(99, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Paytm', '20210403111212800110168732702510494', NULL, NULL, '2021-04-03 01:44:25', '2021-04-03 01:44:42', 1, NULL),
(100, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Razorpay', NULL, NULL, NULL, '2021-04-03 01:45:06', '2021-04-03 01:45:06', 0, NULL),
(101, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Razorpay', NULL, NULL, NULL, '2021-04-03 01:48:12', '2021-04-03 01:48:12', 0, NULL),
(102, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Voguepay', 'demo-606827e13aeaf', NULL, NULL, '2021-04-03 02:32:28', '2021-04-03 02:32:28', 1, NULL),
(103, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'SSLCommerz', 'SSLCZ_TXN_606828350cde1', NULL, NULL, '2021-04-03 02:32:53', '2021-04-03 02:32:57', 1, NULL),
(104, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Flutterwave', NULL, NULL, 'KbDW1617438797', '2021-04-03 02:33:17', '2021-04-03 02:33:17', 0, NULL),
(105, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Razorpay', NULL, NULL, NULL, '2021-04-03 02:34:22', '2021-04-03 02:34:22', 0, NULL),
(106, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Paytm', '20210403111212800110168460302504788', NULL, NULL, '2021-04-03 02:34:31', '2021-04-03 02:34:52', 1, NULL),
(107, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Molly', 'tr_Pab6mUeUA5', NULL, NULL, '2021-04-03 02:35:23', '2021-04-03 02:35:23', 1, NULL),
(108, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Razorpay', NULL, NULL, NULL, '2021-04-03 02:38:34', '2021-04-03 02:38:34', 0, NULL),
(109, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Razorpay', 'pay_GuNyDg4A1IBj6c', NULL, NULL, '2021-04-03 02:39:38', '2021-04-03 02:40:53', 1, NULL),
(110, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Flutterwave', NULL, NULL, 'OLtG1617439285', '2021-04-03 02:41:25', '2021-04-03 02:41:25', 0, NULL),
(111, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Flutterwave', '2004501', NULL, 'ywWX1617439390', '2021-04-03 02:43:10', '2021-04-03 02:44:26', 1, NULL),
(112, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Paystack', '347943714', NULL, NULL, '2021-04-03 02:56:55', '2021-04-03 02:56:55', 1, NULL),
(113, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Razorpay', NULL, NULL, NULL, '2021-04-03 02:57:21', '2021-04-03 02:57:21', 0, NULL),
(114, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Authorize.net', '40062045020', NULL, NULL, '2021-04-03 02:58:10', '2021-04-03 02:58:10', 1, NULL),
(115, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Molly', 'tr_6CDckPKnW8', NULL, NULL, '2021-04-03 02:59:35', '2021-04-03 02:59:35', 1, NULL),
(116, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Flutterwave', '2004554', NULL, 'LGnk1617441223', '2021-04-03 03:13:43', '2021-04-03 03:15:14', 1, NULL),
(117, 13, 6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Molly', 'tr_N42VHc8WPr', NULL, NULL, '2021-04-03 03:16:13', '2021-04-03 03:16:13', 1, NULL),
(118, 35, 5, 'Standard', '৳', 'BDT', 60, 45, 16, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>', 'SSLCommerz', 'SSLCZ_TXN_631728f4c445c', NULL, NULL, '2022-09-06 15:03:16', '2023-05-14 10:55:29', 0, NULL),
(119, 35, 5, 'Standard', '৳', 'BDT', 60, 45, 16, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>', 'SSLCommerz', 'SSLCZ_TXN_6317290a9277a', NULL, NULL, '2022-09-06 15:03:38', '2023-05-14 10:55:29', 0, NULL),
(120, 35, 6, 'Premium', '৳', 'BDT', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'SSLCommerz', 'SSLCZ_TXN_6317291ad8e59', NULL, NULL, '2022-09-06 15:03:54', '2022-09-06 15:03:54', 0, NULL),
(121, 37, 8, 'Basic', '$', 'USD', 0, 30, 0, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>', 'Free', NULL, NULL, NULL, '2022-10-07 03:56:16', '2023-05-14 11:03:07', 1, NULL),
(122, 42, 5, 'Standard', '৳', 'BDT', 60, 45, 16, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>', 'SSLCommerz', 'SSLCZ_TXN_6460884005453', NULL, NULL, '2023-05-14 11:05:36', '2023-05-14 11:05:36', 0, NULL),
(123, 42, 8, 'Basic', '৳', 'BDT', 0, 30, 0, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>', 'Free', NULL, NULL, NULL, '2023-05-14 11:06:14', '2023-05-14 11:06:14', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_orders`
--

CREATE TABLE `vendor_orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` double NOT NULL,
  `order_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','processing','completed','declined','on delivery') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `vendor_orders`
--

INSERT INTO `vendor_orders` (`id`, `user_id`, `order_id`, `qty`, `price`, `order_number`, `status`) VALUES
(1, 13, 1, 1, 320, 'i2kY1650989847', 'completed'),
(2, 13, 2, 1, 130, 'A38C1651029832', 'pending'),
(3, 13, 3, 1, 130, 'JNS21659374548', 'pending'),
(4, 13, 4, 1, 57.5, '2kWo1660741553', 'pending'),
(5, 13, 5, 1, 130, 'jYqx1662299794', 'pending'),
(6, 13, 6, 1, 110, 'Zf6d1662436824', 'pending'),
(7, 13, 7, 1, 130, 'KZqe1662461942', 'pending'),
(8, 13, 8, 1, 130, 'NUrF1662462001', 'pending'),
(9, 13, 9, 1, 320, 'NEN11662462086', 'pending'),
(10, 13, 10, 1, 130, 'Y1BC1665028839', 'pending'),
(11, 13, 11, 1, 57.5, 'Pj4B1665083366', 'pending'),
(12, 13, 12, 1, 130, 'iWqi1669571358', 'pending'),
(13, 13, 13, 1, 110, 'XAwV1680608797', 'pending'),
(14, 13, 14, 2, 260, 'y4mG1680983413', 'pending'),
(15, 13, 15, 1, 130, 'grmF1682064443', 'pending'),
(16, 13, 16, 1, 130, 'hM981683088070', 'pending'),
(17, 13, 17, 1, 89, 'VxYM1684435714', 'pending'),
(18, 13, 18, 1, 320, 't77u1684687610', 'pending'),
(19, 13, 19, 1, 57.5, 'e4l11684937429', 'pending'),
(20, 13, 20, 1, 130, 'uidO1684937525', 'pending'),
(21, 13, 21, 1, 130, 'LHj01709023690', 'pending'),
(22, 13, 21, 3, 390, 'LHj01709023690', 'pending'),
(23, 13, 22, 1, 130, 'iSoV1709024092', 'pending'),
(24, 13, 23, 1, 130, '4EaK1709039108', 'pending'),
(25, 13, 24, 1, 130, 'chw51709124498', 'pending'),
(26, 13, 25, 1, 130, '0IEr1709133103', 'pending'),
(27, 13, 26, 1, 89, 'vQnM1709136317', 'pending'),
(28, 13, 27, 3, 330, 'VQZ71709383088', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `verifications`
--

CREATE TABLE `verifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `attachments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Pending','Verified','Declined') DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_warning` tinyint(1) NOT NULL DEFAULT 0,
  `warning_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `verifications`
--

INSERT INTO `verifications` (`id`, `user_id`, `attachments`, `status`, `text`, `admin_warning`, `warning_reason`, `created_at`, `updated_at`) VALUES
(4, 13, '1573723849Baby.tux-800x800.png,1573723849Baby.tux-800x800.png', 'Verified', 'TEst', 0, NULL, '2019-11-14 03:30:49', '2022-04-28 17:39:35'),
(5, 27, NULL, NULL, NULL, 1, 'Your phone number?', '2022-08-22 18:43:03', '2022-08-22 18:43:03');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`) VALUES
(1, 34, 129);

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acc_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acc_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `swift` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `fee` float DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` enum('pending','completed','rejected') NOT NULL DEFAULT 'pending',
  `type` enum('user','vendor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_languages`
--
ALTER TABLE `admin_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_user_conversations`
--
ALTER TABLE `admin_user_conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_user_messages`
--
ALTER TABLE `admin_user_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_options`
--
ALTER TABLE `attribute_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `childcategories`
--
ALTER TABLE `childcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `counters`
--
ALTER TABLE `counters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorite_sellers`
--
ALTER TABLE `favorite_sellers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `featured_banners`
--
ALTER TABLE `featured_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `featured_links`
--
ALTER TABLE `featured_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `generalsettings`
--
ALTER TABLE `generalsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_tracks`
--
ALTER TABLE `order_tracks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagesettings`
--
ALTER TABLE `pagesettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pickups`
--
ALTER TABLE `pickups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `products` ADD FULLTEXT KEY `name` (`name`);
ALTER TABLE `products` ADD FULLTEXT KEY `attributes` (`attributes`);

--
-- Indexes for table `product_clicks`
--
ALTER TABLE `product_clicks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seotools`
--
ALTER TABLE `seotools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socialsettings`
--
ALTER TABLE `socialsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_providers`
--
ALTER TABLE `social_providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_orders`
--
ALTER TABLE `vendor_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verifications`
--
ALTER TABLE `verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_languages`
--
ALTER TABLE `admin_languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_user_conversations`
--
ALTER TABLE `admin_user_conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_user_messages`
--
ALTER TABLE `admin_user_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `attribute_options`
--
ALTER TABLE `attribute_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `childcategories`
--
ALTER TABLE `childcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `counters`
--
ALTER TABLE `counters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `favorite_sellers`
--
ALTER TABLE `favorite_sellers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `featured_banners`
--
ALTER TABLE `featured_banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `featured_links`
--
ALTER TABLE `featured_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT for table `generalsettings`
--
ALTER TABLE `generalsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `order_tracks`
--
ALTER TABLE `order_tracks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pagesettings`
--
ALTER TABLE `pagesettings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `pickups`
--
ALTER TABLE `pickups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `product_clicks`
--
ALTER TABLE `product_clicks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1100;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `seotools`
--
ALTER TABLE `seotools`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `socialsettings`
--
ALTER TABLE `socialsettings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `social_providers`
--
ALTER TABLE `social_providers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `vendor_orders`
--
ALTER TABLE `vendor_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `verifications`
--
ALTER TABLE `verifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

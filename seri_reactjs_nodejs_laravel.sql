-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jul 11, 2023 at 03:25 PM
-- Server version: 5.7.34
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seri_reactjs_nodejs_laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` tinyint(4) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `phone`, `address`, `level`, `status`, `avatar`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'doantotnghiep@gmail.com', '$2y$10$BjD63c6fgdCMJlLPBtxdeud4DpHLnFpv9hPBsc7teaKSLkkDL/E4e', '0909888222', NULL, 1, 1, NULL, '2022-12-06 02:13:58', '2022-12-06 02:13:58');

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `a_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `a_slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `a_hot` tinyint(4) NOT NULL DEFAULT '0',
  `a_active` tinyint(4) NOT NULL DEFAULT '1',
  `a_menu_id` int(11) NOT NULL DEFAULT '0',
  `a_view` int(11) NOT NULL DEFAULT '0',
  `a_description` mediumtext COLLATE utf8mb4_unicode_ci,
  `a_avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `a_content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `a_name`, `a_slug`, `a_hot`, `a_active`, `a_menu_id`, `a_view`, `a_description`, `a_avatar`, `a_content`, `created_at`, `updated_at`) VALUES
(1, 'Tin khuyếnhihi 232', 'tin-khuyen-mai-2', 0, 1, 1, 0, 'Đang cập nhật', 'https://www.24h.com.vn/', 'Đang cập nhật', NULL, NULL),
(3, 'Tin khuyến mãi 3', 'tin-khuyen-mai-2', 0, 1, 1, 0, 'Đang cập nhật', 'https://www.24h.com.vn/', 'Đang cập nhật', NULL, NULL),
(4, 'Tin khuyến mãi 3 4', 'tin-khuyen-mai-2', 0, 1, 1, 0, 'Đang cập nhật', 'https://www.24h.com.vn/', 'Đang cập nhật', NULL, NULL),
(5, 'Sale hót, sale khủng nhân ngày 11-11-2022 với nhiều giá trị và mặt hàng hấp dẫn', 'sale-hot-sale-khung-nhan-ngay-11-11-2022-voi-nhieu-gia-tri-va-mat-hang-hap-dan', 0, 1, 1, 0, 'Đang cập nhật', 'https://www.24h.com.vn/', 'Đang cập nhật', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `articles_tags`
--

CREATE TABLE `articles_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `at_article_id` int(11) NOT NULL DEFAULT '0',
  `at_tag_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_parent_id` int(11) NOT NULL DEFAULT '0',
  `c_hot` tinyint(4) NOT NULL DEFAULT '0',
  `c_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `avatar`, `c_banner`, `description`, `c_parent_id`, `c_hot`, `c_status`, `created_at`, `updated_at`) VALUES
(11, 'Tẩy trang', 'tay-trang', 'https://theme.hstatic.net/200000551679/1000944132/14/coll_1.jpg?v=491', 'https://theme.hstatic.net/200000551679/1000944132/14/coll_1.jpg?v=491', 'Tẩy trangg', 0, 1, 1, NULL, NULL),
(12, 'Sữa rửa mặt', 'sua-rua-mat', 'https://theme.hstatic.net/200000551679/1000944132/14/coll_2.jpg?v=491', 'https://theme.hstatic.net/200000551679/1000944132/14/coll_2.jpg?v=491', 'Tẩy trang', 0, 1, 1, NULL, NULL),
(14, 'Mặt nạ', 'mat-na', 'https://theme.hstatic.net/200000551679/1000944132/14/coll_3.jpg?v=530', 'https://theme.hstatic.net/200000551679/1000944132/14/coll_2.jpg?v=491', 'Sữa tắm', 0, 1, 1, NULL, '2022-11-20 01:49:00'),
(18, 'Nước hoa hồng', 'nuoc-hoa-hong', 'https://theme.hstatic.net/200000551679/1000944132/14/coll_4.jpg?v=530', NULL, 'tttt', 0, 1, 1, '2022-11-20 01:49:20', NULL),
(19, 'Chăm sóc tóc', 'cham-soc-toc', 'https://theme.hstatic.net/200000551679/1000944132/14/coll_9.jpg?v=530', NULL, 'ttt', 0, 1, 0, '2022-11-20 01:50:12', NULL),
(22, 'Tính chất', 'tinh-chat', 'https://theme.hstatic.net/200000551679/1000944132/14/coll_5.jpg?v=533', NULL, NULL, 0, 1, 1, '2022-11-21 10:25:39', '2023-04-01 02:28:10'),
(23, 'Dưỡng ẩm', 'duong-am', 'https://theme.hstatic.net/200000551679/1000944132/14/coll_6.jpg?v=533', NULL, 'vxc', 0, 1, 1, '2022-11-21 10:26:13', NULL),
(24, 'Dưỡng thể', 'duong-the', 'https://theme.hstatic.net/200000551679/1000944132/14/coll_7.jpg?v=533', NULL, 'Mô tả', 0, 0, 0, '2022-11-21 10:27:18', NULL),
(25, 'Trang điểm', 'trang-diem', 'https://theme.hstatic.net/200000551679/1000944132/14/coll_8.jpg?v=533', NULL, 'ok', 0, 0, 0, '2022-11-21 10:27:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_user_id` int(11) NOT NULL DEFAULT '0',
  `c_vote_id` int(11) NOT NULL DEFAULT '0',
  `c_content` text COLLATE utf8mb4_unicode_ci,
  `c_product_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `name`, `c_user_id`, `c_vote_id`, `c_content`, `c_product_id`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 0, 87, 'Cảm ơn bạn đã ủng hộ chúng tôi', 208, '2023-02-19 09:51:43', '2023-02-19 09:51:43');

-- --------------------------------------------------------

--
-- Table structure for table `dealers`
--

CREATE TABLE `dealers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dealers`
--

INSERT INTO `dealers` (`id`, `name`, `email`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 'giang', 'sdfdfd@gmail.com', '0987654321', 'Ba Đình', '2022-12-11 00:23:05', '2022-12-27 02:20:18'),
(2, 'giang hoàng', 'ghghg@gmail.com', '0869736896', 'Thanh Xuân', '2022-12-11 00:44:46', '2022-12-27 02:20:46');

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `keywords`
--

CREATE TABLE `keywords` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `k_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `k_slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `k_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `k_hot` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logs_api`
--

CREATE TABLE `logs_api` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logs_response` text COLLATE utf8mb4_unicode_ci,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `logs_api`
--

INSERT INTO `logs_api` (`id`, `method`, `logs_response`, `path`, `status`, `created_at`, `updated_at`) VALUES
(18, 'GET', 'Request failed with status code 401', 'auth/profile', 401, '2023-04-01 09:07:33', NULL),
(19, 'GET', 'Request failed with status code 401', 'auth/profile', 401, '2023-04-01 09:13:44', NULL),
(21, 'GET', 'Request failed with status code 401', 'auth/profile', 401, '2023-04-01 09:14:17', NULL),
(22, 'GET', 'Request failed with status code 401', 'auth/profile', 401, '2023-04-01 09:30:06', NULL),
(23, 'GET', 'Request failed with status code 401', 'auth/profile', 401, '2023-04-01 09:30:07', NULL),
(24, 'GET', 'Request failed with status code 401', 'auth/profile', 401, '2023-04-01 09:30:53', NULL),
(25, 'GET', 'Request failed with status code 401', 'auth/profile', 401, '2023-04-01 09:31:26', NULL),
(26, 'GET', 'Request failed with status code 401', 'auth/profile', 401, '2023-04-01 09:32:00', NULL),
(27, 'GET', 'Request failed with status code 401', 'auth/profile', 401, '2023-04-01 11:20:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE `manufacturers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `m_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `m_slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `m_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `m_about` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mn_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mn_slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mn_avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mn_banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mn_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mn_hot` tinyint(4) NOT NULL DEFAULT '0',
  `mn_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `mn_name`, `mn_slug`, `mn_avatar`, `mn_banner`, `mn_description`, `mn_hot`, `mn_status`, `created_at`, `updated_at`) VALUES
(1, 'Tin khuyến mãi 3', 'tin-khuyen-mai-3', 'https://www.24h.com.vn/', NULL, 'Đang cập nhật', 0, 1, NULL, NULL),
(4, 'Tin khuyến mãi 2', 'tin-khuyen-mai-2', 'https://www.24h.com.vn/', NULL, 'Đang cập nhật', 0, 1, NULL, NULL);

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
(1, '2022_11_21_172253_create_dealers_table', 1),
(2, '2023_04_01_082948_create_logs_api_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `od_transaction_id` int(11) NOT NULL DEFAULT '0',
  `od_product_id` int(11) NOT NULL DEFAULT '0',
  `od_discount_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `od_discount_value` int(11) NOT NULL DEFAULT '0',
  `od_qty` tinyint(4) NOT NULL DEFAULT '0',
  `od_price` int(11) NOT NULL DEFAULT '0',
  `od_total_price` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `od_transaction_id`, `od_product_id`, `od_discount_type`, `od_discount_value`, `od_qty`, `od_price`, `od_total_price`, `created_at`, `updated_at`) VALUES
(67, 30, 217, 'money', 0, 1, 303000, 303000, NULL, NULL),
(68, 30, 214, 'money', 0, 1, 227000, 227000, NULL, NULL),
(69, 30, 212, 'money', 0, 1, 650300, 650300, NULL, NULL),
(70, 31, 33, 'money', 0, 1, 65200, 65200, NULL, NULL),
(75, 35, 217, 'money', 0, 1, 303000, 303000, NULL, NULL),
(76, 36, 218, 'money', 0, 1, 156000, 156000, NULL, NULL),
(77, 37, 218, 'money', 0, 4, 156000, 156000, NULL, NULL),
(78, 38, 218, 'money', 0, 3, 156000, 156000, NULL, NULL),
(80, 40, 218, 'money', 0, 1, 156000, 156000, NULL, NULL),
(81, 40, 219, 'money', 0, 3, 300000, 300000, NULL, NULL),
(82, 41, 218, 'money', 0, 1, 156000, 156000, NULL, NULL),
(83, 41, 212, 'money', 0, 3, 650300, 650300, NULL, NULL),
(84, 42, 218, 'money', 0, 1, 156000, 156000, NULL, NULL),
(85, 42, 10, 'money', 0, 1, 50000, 50000, NULL, NULL),
(86, 43, 218, 'money', 0, 1, 156000, 156000, NULL, NULL),
(87, 43, 212, 'money', 0, 2, 650300, 650300, NULL, NULL),
(88, 44, 218, 'money', 0, 1, 156000, 156000, NULL, NULL),
(89, 44, 217, 'money', 0, 1, 303000, 303000, NULL, NULL),
(90, 45, 2, 'money', 100000, 2, 250000, 200000, NULL, NULL),
(91, 46, 2, 'money', 100000, 2, 250000, 200000, NULL, NULL),
(92, 47, 2, 'money', 100000, 2, 250000, 200000, NULL, NULL),
(93, 48, 2, 'money', 100000, 2, 250000, 200000, NULL, NULL),
(94, 49, 2, 'money', 100000, 2, 250000, 200000, NULL, NULL),
(95, 50, 2, 'money', 100000, 2, 250000, 200000, NULL, NULL),
(96, 51, 2, 'money', 100000, 2, 250000, 200000, NULL, NULL),
(99, 54, 218, 'money', 0, 1, 156000, 156000, NULL, NULL),
(101, 56, 214, 'money', 0, 3, 227000, 227000, NULL, NULL),
(102, 56, 210, 'money', 0, 8, 171000, 171000, NULL, NULL),
(103, 57, 214, 'money', 0, 3, 227000, 227000, NULL, NULL),
(104, 57, 210, 'money', 0, 8, 171000, 171000, NULL, NULL),
(105, 58, 214, 'money', 0, 3, 227000, 227000, NULL, NULL),
(106, 58, 210, 'money', 0, 8, 171000, 171000, NULL, NULL),
(107, 59, 213, 'money', 0, 2, 165000, 165000, NULL, NULL),
(108, 60, 213, 'money', 0, 2, 165000, 165000, NULL, NULL),
(109, 61, 213, 'money', 0, 2, 165000, 165000, NULL, NULL),
(110, 62, 213, 'money', 0, 2, 165000, 165000, NULL, NULL),
(111, 63, 213, 'money', 0, 1, 165000, 165000, NULL, NULL),
(112, 64, 213, 'money', 0, 1, 165000, 165000, NULL, NULL),
(113, 65, 214, 'money', 0, 2, 227000, 227000, NULL, NULL),
(114, 66, 214, 'money', 0, 1, 227000, 227000, NULL, NULL),
(115, 67, 217, 'money', 0, 2, 303000, 303000, NULL, NULL),
(116, 68, 217, 'money', 0, 1, 303000, 303000, NULL, NULL),
(117, 69, 213, 'money', 0, 1, 165000, 165000, NULL, NULL),
(118, 70, 213, 'money', 0, 3, 165000, 165000, NULL, NULL),
(119, 71, 217, 'money', 0, 4, 303000, 303000, NULL, NULL),
(120, 72, 213, 'money', 0, 1, 165000, 165000, NULL, NULL),
(121, 73, 214, 'money', 0, 1, 227000, 227000, NULL, NULL),
(122, 74, 214, 'money', 0, 2, 227000, 227000, NULL, NULL),
(123, 75, 212, 'money', 0, 1, 650300, 650300, NULL, NULL),
(124, 76, 217, 'money', 0, 1, 303000, 303000, NULL, NULL),
(125, 77, 217, 'money', 0, 1, 303000, 303000, NULL, NULL),
(126, 78, 213, 'money', 0, 1, 165000, 165000, NULL, NULL),
(127, 79, 214, 'money', 0, 1, 227000, 227000, NULL, NULL),
(128, 80, 213, 'money', 0, 1, 165000, 165000, NULL, NULL),
(129, 81, 214, 'money', 0, 8, 227000, 227000, NULL, NULL),
(130, 81, 212, 'money', 0, 1, 650300, 650300, NULL, NULL),
(131, 82, 214, 'money', 0, 45, 227000, 227000, NULL, NULL),
(132, 82, 218, 'money', 0, 1, 156000, 156000, NULL, NULL),
(133, 83, 218, 'money', 0, 2, 156000, 156000, NULL, NULL),
(134, 83, 213, 'money', 0, 1, 165000, 165000, NULL, NULL),
(135, 84, 214, 'money', 0, 2, 227000, 227000, NULL, NULL),
(136, 84, 217, 'money', 0, 1, 303000, 303000, NULL, NULL),
(137, 84, 218, 'money', 0, 1, 156000, 156000, NULL, NULL),
(138, 84, 211, 'money', 0, 1, 165000, 165000, NULL, NULL),
(139, 85, 217, 'money', 0, 1, 303000, 303000, NULL, NULL),
(140, 86, 218, 'money', 0, 3, 156000, 156000, NULL, NULL),
(141, 86, 210, 'money', 0, 2, 171000, 171000, NULL, NULL),
(143, 88, 218, 'money', 0, 1, 156000, 156000, '2022-12-27 09:03:10', NULL),
(144, 89, 217, 'money', 0, 1, 303000, 303000, '2022-12-27 09:04:35', NULL),
(145, 90, 217, 'money', 0, 1, 303000, 303000, '2022-12-27 09:22:27', NULL),
(146, 91, 218, 'money', 0, 1, 156000, 156000, '2022-12-28 13:27:42', NULL),
(147, 91, 217, 'money', 0, 1, 303000, 303000, '2022-12-28 13:27:42', NULL),
(148, 91, 211, 'money', 0, 1, 165000, 165000, '2022-12-28 13:27:42', NULL),
(149, 91, 213, 'money', 0, 1, 165000, 165000, '2022-12-28 13:27:42', NULL),
(150, 92, 218, 'money', 0, 1, 156000, 156000, '2022-12-28 13:59:58', NULL),
(151, 93, 218, 'money', 0, 1, 156000, 156000, '2022-12-28 15:26:44', NULL),
(152, 93, 217, 'money', 0, 1, 303000, 303000, '2022-12-28 15:26:44', NULL),
(153, 94, 218, 'money', 0, 2, 156000, 156000, '2022-12-29 01:27:53', NULL),
(154, 94, 217, 'money', 0, 5, 303000, 303000, '2022-12-29 01:27:53', NULL),
(155, 95, 217, 'money', 0, 4, 303000, 303000, '2022-12-29 03:49:14', NULL),
(156, 96, 33, 'money', 0, 1, 65200, 65200, '2022-12-29 03:56:57', NULL),
(157, 96, 218, 'money', 0, 3, 156000, 156000, '2022-12-29 03:56:57', NULL),
(158, 97, 173, 'money', 0, 1, 32000, 32000, '2023-01-11 02:34:50', NULL),
(159, 98, 213, 'money', 0, 21, 165000, 165000, '2023-01-11 09:43:36', NULL),
(160, 98, 164, 'money', 0, 1, 237000, 237000, '2023-01-11 09:43:36', NULL),
(161, 98, 217, 'money', 0, 1, 303000, 303000, '2023-01-11 09:43:36', NULL),
(162, 98, 214, 'money', 0, 2, 227000, 227000, '2023-01-11 09:43:36', NULL),
(163, 98, 212, 'money', 0, 1, 650300, 650300, '2023-01-11 09:43:36', NULL),
(164, 99, 188, 'money', 0, 1, 267500, 267500, '2023-01-11 09:44:38', NULL),
(165, 99, 214, 'money', 0, 1, 227000, 227000, '2023-01-11 09:44:38', NULL),
(166, 99, 217, 'money', 0, 1, 303000, 303000, '2023-01-11 09:44:38', NULL),
(167, 99, 212, 'money', 0, 1, 650300, 650300, '2023-01-11 09:44:38', NULL),
(168, 100, 213, 'money', 0, 1, 165000, 165000, '2023-01-17 07:57:47', NULL),
(169, 101, 218, 'money', 0, 1, 156000, 156000, '2023-01-17 07:58:59', NULL),
(170, 102, 213, 'money', 0, 2, 165000, 165000, '2023-01-17 07:59:38', NULL),
(171, 103, 218, 'money', 0, 1, 156000, 156000, '2023-01-17 08:16:22', NULL),
(172, 104, 213, 'money', 0, 1, 165000, 165000, '2023-01-17 10:35:00', NULL),
(173, 104, 217, 'money', 0, 1, 303000, 303000, '2023-01-17 10:35:00', NULL),
(174, 105, 173, 'money', 0, 1, 32000, 32000, '2023-01-30 12:57:42', NULL),
(175, 106, 217, 'money', 0, 1, 303000, 303000, '2023-01-30 16:01:35', NULL),
(176, 107, 172, 'money', 0, 1, 125500, 125500, '2023-01-31 15:11:07', NULL),
(177, 108, 222, 'money', 0, 1, 30000, 30000, '2023-02-01 10:55:34', NULL),
(178, 109, 188, 'money', 0, 1, 267500, 267500, '2023-02-01 14:54:40', NULL),
(179, 110, 188, 'money', 0, 1, 267500, 267500, '2023-02-01 14:59:25', NULL),
(180, 111, 202, 'money', 0, 54, 314000, 314000, '2023-02-01 15:03:24', NULL),
(181, 112, 172, 'money', 0, 1, 125500, 125500, '2023-02-05 17:00:11', NULL),
(182, 113, 146, 'money', 0, 1, 650000, 650000, '2023-02-07 06:04:43', NULL),
(183, 113, 205, 'money', 0, 1, 164500, 164500, '2023-02-07 06:04:43', NULL),
(184, 114, 218, 'money', 0, 1, 156000, 156000, '2023-02-08 07:02:56', NULL),
(185, 115, 158, 'money', 0, 3, 41200, 41200, '2023-02-13 13:47:18', NULL),
(186, 116, 209, 'money', 0, 1, 320000, 320000, '2023-02-19 03:28:55', NULL),
(187, 116, 212, 'money', 0, 1, 650300, 650300, '2023-02-19 03:28:55', NULL),
(188, 117, 214, 'money', 0, 1, 227000, 227000, '2023-02-19 03:29:11', NULL),
(189, 118, 170, 'money', 0, 1, 251000, 251000, '2023-02-19 03:37:15', NULL),
(190, 119, 170, 'money', 0, 1, 251000, 251000, '2023-02-19 03:37:28', NULL),
(191, 120, 170, 'money', 0, 1, 251000, 251000, '2023-02-19 03:38:11', NULL),
(192, 121, 102, 'money', 0, 2, 235000, 235000, '2023-02-19 04:55:24', NULL),
(193, 122, 102, 'money', 0, 2, 235000, 235000, '2023-02-19 04:56:14', NULL),
(194, 123, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 05:04:58', NULL),
(195, 124, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 05:14:06', NULL),
(196, 125, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 05:23:29', NULL),
(197, 126, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 05:28:31', NULL),
(198, 127, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 06:00:32', NULL),
(199, 128, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 06:11:45', NULL),
(200, 129, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 06:15:48', NULL),
(201, 130, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 10:00:23', NULL),
(202, 131, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 10:06:51', NULL),
(203, 132, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 10:23:40', NULL),
(204, 133, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 10:29:43', NULL),
(205, 134, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 10:29:48', NULL),
(206, 135, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 10:34:20', NULL),
(207, 136, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 10:35:07', NULL),
(208, 137, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 10:35:21', NULL),
(209, 138, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 10:37:44', NULL),
(210, 139, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 10:37:57', NULL),
(211, 140, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 10:44:24', NULL),
(212, 141, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 10:44:42', NULL),
(213, 142, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 10:53:37', NULL),
(214, 143, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 10:54:54', NULL),
(215, 144, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 10:59:09', NULL),
(216, 145, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 11:02:47', NULL),
(217, 146, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 11:02:54', NULL),
(218, 147, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 11:06:56', NULL),
(219, 148, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 11:17:33', NULL),
(220, 149, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 12:00:00', NULL),
(221, 150, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 12:10:47', NULL),
(222, 151, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 12:11:06', NULL),
(223, 152, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 12:12:55', NULL),
(224, 153, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 12:13:02', NULL),
(225, 154, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 12:19:57', NULL),
(226, 155, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 12:20:01', NULL),
(227, 156, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 12:21:27', NULL),
(228, 157, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 12:21:31', NULL),
(229, 158, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 12:21:47', NULL),
(230, 159, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 12:24:13', NULL),
(231, 160, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 12:24:50', NULL),
(232, 161, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 12:29:55', NULL),
(233, 162, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 12:36:23', NULL),
(234, 163, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 12:36:28', NULL),
(235, 164, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 13:38:26', NULL),
(236, 165, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 13:45:11', NULL),
(237, 166, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 13:46:31', NULL),
(238, 167, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 13:49:39', NULL),
(239, 168, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 13:49:43', NULL),
(240, 169, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 13:52:03', NULL),
(241, 170, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 13:59:45', NULL),
(242, 171, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 14:15:30', NULL),
(243, 172, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 14:16:47', NULL),
(244, 173, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 14:17:07', NULL),
(245, 174, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 14:19:05', NULL),
(246, 175, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 14:19:09', NULL),
(247, 176, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 14:19:23', NULL),
(248, 177, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 17:24:41', NULL),
(249, 177, 214, 'money', 0, 1, 227000, 227000, '2023-02-19 17:24:41', NULL),
(250, 178, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 17:37:40', NULL),
(251, 178, 214, 'money', 0, 1, 227000, 227000, '2023-02-19 17:37:40', NULL),
(252, 179, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 17:37:55', NULL),
(253, 179, 214, 'money', 0, 1, 227000, 227000, '2023-02-19 17:37:55', NULL),
(254, 180, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 23:55:04', NULL),
(255, 180, 214, 'money', 0, 1, 227000, 227000, '2023-02-19 23:55:04', NULL),
(256, 181, 102, 'money', 0, 1, 235000, 235000, '2023-02-19 23:55:41', NULL),
(257, 181, 214, 'money', 0, 2, 227000, 227000, '2023-02-19 23:55:41', NULL),
(258, 182, 102, 'money', 0, 1, 235000, 235000, '2023-02-20 03:51:45', NULL),
(259, 182, 214, 'money', 0, 2, 227000, 227000, '2023-02-20 03:51:45', NULL),
(260, 182, 217, 'money', 0, 1, 303000, 303000, '2023-02-20 03:51:45', NULL),
(261, 183, 164, 'money', 0, 1, 237000, 237000, '2023-03-01 06:55:34', NULL),
(262, 183, 223, 'money', 0, 1, 257000, 257000, '2023-03-01 06:55:34', NULL),
(263, 183, 173, 'money', 0, 1, 32000, 32000, '2023-03-01 06:55:34', NULL),
(264, 184, 164, 'money', 0, 1, 237000, 237000, '2023-03-01 06:56:26', NULL),
(265, 184, 223, 'money', 0, 1, 257000, 257000, '2023-03-01 06:56:26', NULL),
(266, 184, 173, 'money', 0, 1, 32000, 32000, '2023-03-01 06:56:26', NULL),
(267, 185, 164, 'money', 0, 1, 237000, 237000, '2023-03-01 06:57:18', NULL),
(268, 185, 223, 'money', 0, 1, 257000, 257000, '2023-03-01 06:57:18', NULL),
(269, 185, 173, 'money', 0, 1, 32000, 32000, '2023-03-01 06:57:18', NULL),
(270, 186, 210, 'money', 0, 6, 171000, 171000, '2023-04-04 09:55:38', NULL),
(271, 187, 210, 'money', 0, 6, 171000, 171000, '2023-04-04 09:58:21', NULL),
(272, 188, 217, 'money', 0, 1, 303000, 303000, '2023-06-27 08:28:47', NULL),
(273, 189, 218, 'money', 0, 1, 156000, 156000, '2023-06-27 08:29:22', NULL),
(274, 189, 198, 'money', 0, 3, 140000, 140000, '2023-06-27 08:29:22', NULL),
(275, 190, 209, 'money', 0, 1, 320000, 320000, '2023-06-28 09:46:43', NULL),
(276, 190, 213, 'money', 0, 1, 165000, 165000, '2023-06-28 09:46:43', NULL),
(277, 191, 218, 'money', 0, 3, 156000, 156000, '2023-06-28 13:36:42', NULL),
(278, 191, 217, 'money', 0, 2, 303000, 303000, '2023-06-28 13:36:42', NULL),
(279, 192, 6, 'money', 0, 1, 240000, 240000, '2023-06-28 13:57:25', NULL),
(280, 193, 4, 'money', 0, 1, 12, 12, '2023-06-28 14:06:14', NULL),
(281, 194, 4, 'money', 0, 1, 12, 12, '2023-06-28 14:09:26', NULL),
(282, 195, 1, 'money', 0, 1, 10, 10, '2023-07-11 00:30:39', NULL),
(283, 195, 212, 'money', 0, 1, 650300, 650300, '2023-07-11 00:30:39', NULL);

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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `number` int(11) NOT NULL DEFAULT '0',
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `sale` tinyint(4) NOT NULL DEFAULT '0',
  `discount_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_value` int(11) NOT NULL DEFAULT '0',
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view` int(11) NOT NULL DEFAULT '0',
  `hot` tinyint(4) NOT NULL DEFAULT '0',
  `manufacturer_id` int(11) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `pay` int(11) NOT NULL DEFAULT '0',
  `dealer_id` int(11) NOT NULL DEFAULT '0',
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  `review_total` int(11) NOT NULL DEFAULT '0',
  `warranty_date` int(11) NOT NULL DEFAULT '0',
  `review_star` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `configuration` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `price`, `category_id`, `number`, `admin_id`, `sale`, `discount_type`, `discount_value`, `avatar`, `view`, `hot`, `manufacturer_id`, `active`, `pay`, `dealer_id`, `description`, `content`, `review_total`, `warranty_date`, `review_star`, `created_at`, `updated_at`, `configuration`) VALUES
(1, 'QT Bio-essence Nước tẩy trang Bio-water micellar water (400ml) (IP01)', 'qt-bio-essence-nuoc-tay-trang-bio-water-micellar-water-400ml-ip01', 10, 12, 10, 0, 10, 'percent', 0, 'http://localhost:3006/api/upload/image-08b38465-69db-4d16-a91b-53425f4c7bc4.png', 0, 0, 0, 1, 1, 0, 'Đang cập nhật', 'Đang cập nhật', 0, 0, 0, NULL, '2022-11-20 01:53:49', 'Đang cập nhật'),
(2, 'QT Bio-essence Nước tẩy trang Bio-water micellar water (100ml) (IP01)', 'qt-bio-essence-nuoc-tay-trang-bio-water-micellar-water-100ml-ip01', 10, 11, 10, 0, 4, 'percent', 5, 'https://product.hstatic.net/200000551679/product/untitled_7c69d5ed28d3494fa769e363fe9ec2f0_1024x1024.png', 0, 0, 0, 1, 0, 0, 'QT Bio-essence Nước tẩy trang Bio-water micellar water (100ml) (IP01)\r\nĐang cập nhật', 'Đang cập nhật', 0, 0, 0, NULL, '2022-11-20 01:53:08', NULL),
(3, '[HÀNG TẶNG KHÔNG BÁN] Avander Nước tẩy trang Babassu Cleansing Water 150ml trị giá 150K', 'hang-tang-khong-ban-avander-nuoc-tay-trang-babassu-cleansing-water-150ml-tri-gia-150k', 250000, 11, 10, 0, 0, 'percent', 10, 'https://product.hstatic.net/200000551679/product/untitled_038980a264144ec3bd79a9a60d97575f_large.png', 0, 0, 0, 1, 0, 0, 'Đang cập nhật', 'Đang cập nhật', 0, 0, 0, NULL, NULL, NULL),
(4, 'La Roche-Posay Gel Rửa Mặt Và Tắm Effaclar Micro-Peeling Purifying Gel 400ml (IP01)', 'la-roche-posay-gel-rua-mat-va-tam-effaclar-micro-peeling-purifying-gel-400ml-ip01', 12, 12, 12, 0, 0, 'percent', 10, 'https://product.hstatic.net/200000551679/product/la_roche_posay_1-11_3cdd8abcd62d4b398e337763ff0e0b47.png', 0, 0, 0, 1, 2, 0, 'La Roche-Posay Gel Rửa Mặt Và Tắm Effaclar Micro-Peeling Purifying Gel 400ml (IP01)\r\nĐang cập nhật', 'test', 3, 0, 15, NULL, '2022-11-20 01:55:33', NULL),
(5, 'La Roche-Posay Sữa Rửa Mặt Purifying Foaming Gel For Oily Sensitive Skin 200ml', 'la-roche-posay-sua-rua-mat-purifying-foaming-gel-for-oily-sensitive-skin-200ml', 270000, 12, 15, 0, 0, 'percent', 10, 'https://product.hstatic.net/200000551679/product/2laroc_1_5e91375b19e147828bd029219e8c846b.png', 0, 0, 0, 1, 0, 0, 'La Roche-Posay Sữa Rửa Mặt Purifying Foaming Gel For Oily Sensitive Skin 200ml\r\nĐang cập nhật', 'test1', 0, 0, 0, NULL, '2022-11-21 18:39:45', NULL),
(6, 'Avander Nước tẩy trang Babassu Cleansing Water 150ml trị giá 150K', 'avander-nuoc-tay-trang-babassu-cleansing-water-150ml-tri-gia-150k', 240000, 11, 12, 0, 0, 'percent', 10, 'https://product.hstatic.net/200000551679/product/untitled_038980a264144ec3bd79a9a60d97575f_grande.png', 0, 0, 0, 1, 0, 0, 'Avander Nước tẩy trang Babassu Cleansing Water 150ml trị giá 150K\r\nNội dung đang cập nhật', 'sữa tắm', 0, 0, 0, NULL, '2022-11-21 18:28:00', NULL),
(7, '3CE Phấn mắt Multi Eye Color Palate', '3ce-phan-mat-multi-eye-color-palate', 189000, 12, 30, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/180813-allnighter_40__c2c3219d0763437890e083eff2ef175a_large.jpg', 0, 0, 0, 1, 0, 0, 'Phấn mắt 3CE Multi Eye Color Palate với những tone màu nhẹ nhàng theo hơi hướng vintage rất phù hợp với phong cách make up đơn giản mỗi ngày. Mỗi bảng phấn mắt chứa tới 9 ô màu đa dạng, dễ sử dụng, có thể kết hợp với nhau tùy thích để cho ra đời những màu mắt ấn tượng và độc đáo nhất.\r\n\r\nđang cập nhật', NULL, 0, 0, 0, '2022-11-21 10:30:40', '2022-11-21 18:39:06', NULL),
(8, 'MAC Son thỏi Powder Kiss # Marrakesh Mere 925', 'mac-son-thoi-powder-kiss-marrakesh-mere-925', 560000, 25, 30, 0, 0, 'percent', 10, 'https://product.hstatic.net/200000551679/product/1_6aa886c5ff04494db26619b3e33550bb.png', 0, 0, 0, 1, 0, 0, 'Son thỏi MAC Powder Kiss Marrakesh Mere 925 là điểm nhấn đột phá trong BST MAC Powder Kiss. sự kết hợp giữa sắc đỏ nổi bật và sắc đất trầm ấm thiên về tông đất nhiều hơn, tôn lên vẻ đẹp sang trọng, quý phái của phái đẹp.', NULL, 2, 0, 8, '2022-11-21 10:35:58', '2022-11-21 18:28:25', NULL),
(9, 'Bioderma Nước tẩy trang hồng Sensibio H2O 100 ml', 'bioderma-nuoc-tay-trang-hong-sensibio-h2o-100-ml', 120000, 11, 0, 0, 0, 'percent', 10, 'https://product.hstatic.net/200000551679/product/1.3_bioderma_nuoc_tay_trang_sensibio_h2o_100ml__a1a30a871dbd41c6862f058925f78116_grande.png', 0, 0, 0, 1, 0, 0, 'Nước tẩy trang Bioderma Sensibio H2O là dung dịch làm sạch và tẩy trang đầu tiên trên thế giới ứng dụng công nghệ micellar, giúp làm sạch đến 99% bụi bẩn, dầu thừa và lớp trang điểm, đồng thời vẫn tôn trọng hàng rào bảo vệ da tuyệt đối. Sản phẩm không cần rửa lại bằng nước. Ngoài ra, Sensibio H2O làm giảm cảm giác khô căng, khó chịu và cải thiện ngưỡng dung nạp của da. Là giả pháp hiệu quả lâu dài cho làn da.', NULL, 0, 0, 0, '2022-11-21 10:38:38', '2022-11-21 18:28:07', NULL),
(10, 'Bioderma Nước tẩy trang Sebium H2O 100 ml', 'bioderma-nuoc-tay-trang-sebium-h2o-100-ml', 50000, 11, 0, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/bioderma_nuoc_tay_trang_sebium_h2o_100ml_f183b1fc3460400abcdd4dc95127e504.png', 0, 0, 0, 1, 0, 0, 'Nước tẩy trang Bioderma Sébium H2O dành cho da hỗn hợp đến da dầu và có mụn, giúp làm sạch sâu bụi bẩn, dầu thừa và lớp trang điểm trên da. Ngoài ra, Sébium H2O còn có khả năng kháng khuẩn và ngăn bít tắc lỗ chân lông gây mụn. Sản phẩm không cần rửa lại bằng nước.', NULL, 0, 0, 0, '2022-11-21 10:59:53', '2022-11-21 18:28:00', NULL),
(11, 'FOX Kem nền Stunning Liquid Foundation dưỡng ẩm làm sáng da SPF 30++ (30ml)', 'fox-kem-nen-stunning-liquid-foundation-duong-am-lam-sang-da-spf-30-30ml', 430000, 25, 20, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/untitled-1-05_14822236dec944b1851257718330c865.png', 0, 0, 0, 1, 0, 0, 'Kem nền F.O.X Stunning Liquid Foundation giúp sáng da và đều màu da, dưỡng ẩm và giữ ẩm từ sâu bên trong. Bảo vệ da khỏi tia UV, có thể thay thế sản phẩm chống nắng.', NULL, 0, 0, 0, '2022-11-22 07:53:49', NULL, NULL),
(12, 'FOX Kem lót hiệu chỉnh màu da Stunning Makeup Primer SPF30 (30ml)', 'fox-kem-lot-hieu-chinh-mau-da-stunning-makeup-primer-spf30-30ml', 420000, 25, 10, 0, 0, 'percent', 5, 'https://product.hstatic.net/200000551679/product/mp-snow-white-trang-min-kem-lot-hieu-chinh-mau-da-f.o.x-spf30-30ml_a7614dc8643445ca923fffe693d11f1b.jpg', 0, 0, 0, 1, 0, 0, 'Kem lót F.O.X Stunning Makeup Primer là bước đầu tiên của trang điểm giúp việc sử dụng các sản phẩm khác hòa quyện vào da. Che phủ tốt, bổ sung độ ẩm, hạn chế xỉn màu.', NULL, 0, 0, 0, '2022-11-22 07:54:42', NULL, NULL),
(13, 'BOM Phấn mắt Base On Basic Eye Palette', 'bom-phan-mat-base-on-basic-eye-palette', 500000, 25, 50, 0, 0, 'percent', 10, 'https://product.hstatic.net/200000551679/product/293946719_1215284555934517_7103541379118523248_n_df5f2888e1084197af5855bfb5c3a9db.jpg', 0, 0, 0, 1, 0, 0, 'Phấn mắt B.O.M Base On Basic Eye Palette kết hợp gam màu lì và nhũ cùng với tông màu dễ dùng nhưng vẫn có thể tạo nhiều phong cách trang điểm khác nhau. Kết cấu hạt phấn mịn lì, lên chuẩn màu, cùng độ bám lý tưởng đem đến đôi mắt sâu cuốn hút và ánh nhìn quyến rũ.', NULL, 0, 0, 0, '2022-11-22 07:55:27', NULL, NULL),
(14, 'Pekah Phấn nước Cherish Velvet Fit Cushion', 'pekah-phan-nuoc-cherish-velvet-fit-cushion', 360000, 25, 10, 0, 0, 'percent', 5, 'https://product.hstatic.net/200000551679/product/untitled-13-03_d4d3b90edf5a43fa9bbb11adbd33b2e5.png', 0, 0, 0, 1, 0, 0, 'Phấn nước Pekah Cherish Velvet Fit Cushion giúp kiềm dầu, làm đều màu da cho cô nàng tự tin với lớp nền bền màu suốt ngày dài.', NULL, 0, 0, 0, '2022-11-22 07:56:02', NULL, NULL),
(15, 'FOX Kem lót High Definition Foundation Primer làm sáng và mịn da - SB03 (30ml)', 'fox-kem-lot-high-definition-foundation-primer-lam-sang-va-min-da-sb03-30ml', 406000, 25, 20, 0, 0, 'percent', 10, 'https://product.hstatic.net/200000551679/product/texture_c3b4a4567c4e43a6acee6c5d45063af9.jpg', 0, 0, 0, 1, 0, 0, 'Kem lót F.O.X High Definition Foundation Primer ngoài công dụng nâng tone da còn có tác dụng cân bằng độ ẩm, kiểm soát dầu. Siêu bền màu, duy trì lớp make up cả ngày.', NULL, 0, 0, 0, '2022-11-22 07:56:43', NULL, NULL),
(16, 'FOX Phấn nước Shinning Cushion Foundation SPF50+++ BF001 (15g)', 'fox-phan-nuoc-shinning-cushion-foundation-spf50-bf001-15g', 390000, 25, 20, 0, 0, 'percent', 10, 'https://product.hstatic.net/200000551679/product/30b10ded513f385cbaed92895b5a831a_301746f27f56487fac3930a05ff8daca.jpg', 0, 0, 0, 1, 0, 0, 'Phấn nước Fox Shining Cushion Foundation sẽ mang đến trải nghiệm cao cấp cho bạn khi kết hợp giữa trang điểm và dưỡng da. Tạo lớp nền mỏng nhẹ, ẩm mát và trơn láng.', NULL, 0, 0, 0, '2022-11-22 07:57:10', '2022-11-22 07:57:28', NULL),
(17, 'Queenie Phấn trang điểm Nutri Collagen & Q10 Whitening Twin Cake SPF30 PA++', 'queenie-phan-trang-diem-nutri-collagen-q10-whitening-twin-cake-spf30-pa', 374000, 25, 10, 0, 0, 'percent', 2, 'https://product.hstatic.net/200000551679/product/d64b711b5e5aa304fa4b-1_3e747c32ca29449e9a9f40b66f71b5bb.jpg', 0, 0, 0, 1, 0, 0, 'Phấn trang điểm Queenie Nutri Collagen & Q10 Whitening Twin Cake SPF30 PA++ dạng phấn nén với tinh chất Collagen & Q10 có tác dụng vừa làm trắng vừa chống nắng, chống lão hóa cho da. Mang lại một lớp trang điểm rạng ngời và tự nhiên nhất, đặc biệt còn giúp sáng da hơn khi sử dụng thường xuyên.', NULL, 0, 0, 0, '2022-11-22 07:58:20', NULL, NULL),
(18, 'FOX Phấn phủ mịn da Silky Skincare Finish Powder- PA01', 'fox-phan-phu-min-da-silky-skincare-finish-powder-pa01', 336000, 25, 10, 0, 0, 'percent', 5, 'https://product.hstatic.net/200000551679/product/pa01-phan-phu-silky-skincare-finish-powder-fox-2_e3a4e99ae009458eb0c2310986768029.jpg', 0, 0, 0, 1, 0, 0, 'Phấn phủ Fox Silky Skincare Finish Powder có tác dụng cố định lớp trang điểm để bền màu và lâu trôi hơn. Sự kết hợp giữa 3 tông màu cho hiệu ứng mịn màng, căng bóng.', NULL, 0, 0, 0, '2022-11-22 07:59:02', NULL, NULL),
(21, 'FOX Phấn nén Double Function Compact SPF30 (12g)', 'fox-phan-nen-double-function-compact-spf30-12g', 25000, 25, 20, 0, 0, 'percent', 10, 'https://sammishop.com/products/fox-phan-nen-double-function-compact-spf30-tk-01-12g-ip01', 0, 0, 0, 1, 0, 0, 'Phấn nén F.O.X Double Function Compact SPF30 mang đến lớp nền trơn mịn hoàn hảo, hạt phấn siêu mịn với công thức đặc biệt giúp bám chặt vào da không gây hiện tượng dày phấn.', NULL, 0, 0, 0, '2022-11-22 08:00:56', NULL, NULL),
(22, 'KISSME Chì kẻ mày Heroine Make Quick Eyebrow', 'kissme-chi-ke-may-heroine-make-quick-eyebrow', 115000, 25, 50, 0, 0, 'percent', 10, 'https://product.hstatic.net/200000551679/product/untitled_4d0d96e6876545dc8ae9c65837db7268.png', 0, 0, 0, 1, 0, 0, 'Chì kẻ mày KISSME Heroine Make Quick Eyebrow đầu chì siêu nhỏ 1.5mm cùng chất liệu ngòi chì mềm dễ kẻ phù hợp cho cả người mới bắt đầu trang điểm. Ngoài ra sản phẩm thiết kế dạng xoay tiện dụng và tiết kiệm.', NULL, 0, 0, 0, '2022-11-22 08:01:46', NULL, NULL),
(23, 'Maybelline Chuốt Mi Lash Sensational Sky High 6ml', 'maybelline-chuot-mi-lash-sensational-sky-high-6ml', 180000, 25, 50, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/5-maybelline-skyhigh-mascara-review_72b70062a1134bed9b4e12f777c99dff.jpg', 0, 0, 0, 1, 0, 0, 'Chuốt mi Maybelline Lash Sensational Sky High giúp hàng mi của bạn cao vút từ mọi góc độ. Mascara dài mi mang lại độ dài hoàn hảo, thích hợp cho mắt nhạy cảm và người đeo kính áp tròng.', NULL, 0, 0, 0, '2022-11-22 08:02:44', NULL, NULL),
(24, 'Maybelline Bút kẻ mắt nước siêu sắc mảnh Maybelline New York Hyper Shapp Extreme Liner Brown', 'maybelline-but-ke-mat-nuoc-sieu-sac-manh-maybelline-new-york-hyper-shapp-extreme-liner-brown', 148000, 25, 20, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/ug_4e1a781eb5ba4c4e9a18e61759b97a2f.jpg', 0, 0, 0, 1, 0, 0, 'Bút kẻ mắt nước siêu sắc mảnh Maybelline New York Hyper Shapp Extreme Liner Brown được cải tiến với đầu cọ mảnh, 0.01mm, sắc nét, công nghệ màng phim độc đáo giữ màu lâu, cực kì linh hoạt giúp bạn dễ dàng vẽ mắt từ nét mỏng tự nhiên đến dày cá tính. Công nghệ Ink Capsule mới giúp dòng mực ra đều hơn 147% và đậm nét hơn so với phiên bản cũ, không lem, không trôi cho bạn lớp trang điểm mắt to tròn, cuốn hút hơn.', NULL, 0, 0, 0, '2022-11-22 08:03:36', NULL, NULL),
(25, 'Unpa Bubi Son Dưỡng Môi Butter Lip Balm 3.8g', 'unpa-bubi-son-duong-moi-butter-lip-balm-38g', 105000, 25, 20, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/son-duong-moi-unpa-bubi-bubi-butter-duong-am-mem-mai-3-8g-5_e09abe27cbef4d65863e1ccf9a7ba64e.jpg', 0, 0, 0, 1, 0, 0, 'Son dưỡng môi Unpa Bubi Butter Lip Balm là son dưỡng môi chứa nhiều thành phần dưỡng ẩm tự nhiên và công nghệ dưỡng ẩm độc đáo giúp dưỡng ẩm và cung cấp độ ẩm cho môi 1 cách hiệu quả, làm sạch các tế bào chết trên môi và hoàn thiện tình trạng môi tốt nhất giúp đôi môi luôn được cấp ẩm.', NULL, 0, 0, 0, '2022-11-22 08:05:13', NULL, NULL),
(26, 'Unpa Bubi Tinh chất Dưỡng Môi Lip Ampoule 10g', 'unpa-bubi-tinh-chat-duong-moi-lip-ampoule-10g', 83000, 25, 20, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/tinh-chat-duong-moi-unpa-bubi-bubi-cang-mong-duong-am-10g-1_07fd0ab2fc7143a3b21619c38a4fa96f.jpg', 0, 0, 0, 1, 0, 0, 'Tinh chất dưỡng môi Unpa Bubi Lip Ampoule chứa thành phần Hyaluronic Acid có khả năng cấp nước tức thì cho môi với kết cấu tinh chất dạng gel cực kì mềm mại , nhẹ môi , giúp duy trì độ ẩm cho môi , cải thiện đôi môi khô ráp trong những ngày khô hanh trở nên căng mọng và hồng hào tự nhiên.', NULL, 0, 0, 0, '2022-11-22 08:05:47', NULL, NULL),
(27, 'Silky Girl Kem nền Perfect Liquid Foundation', 'silky-girl-kem-nen-perfect-liquid-foundation', 125000, 25, 23, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/sg_splf-master_msia-source-web_02_04c57c203ab84f9d8bf071201c99ca3c.jpg', 0, 0, 0, 1, 0, 0, 'Kem nền Silky Girl Perfect Liquid Foundation với công thức cải tiến và bao bì bắt mắt phù hợp xu hướng, hứa hẹn sẽ là sản phẩm trang điểm nền hoàn hảo đáp ứng nhu cầu của giới trẻ hiện đại. Sản phẩm mang đến lớp nền lì, lâu trôi suốt ngày dài mà vẫn giữ được độ mịn và căng mướt, không hề khô mốc.', NULL, 0, 0, 0, '2022-11-22 08:06:18', NULL, NULL),
(28, 'MY COMFORT Combo 2 bông (120m) CO0001 + BTT CO0002 (70m)', 'my-comfort-combo-2-bong-120m-co0001-btt-co0002-70m', 53000, 25, 20, 0, 0, 'percent', 3, 'https://product.hstatic.net/200000551679/product/vfwqf_5b5e8a0978db482f9d877054b82ffcf2.jpg', 0, 0, 0, 1, 0, 0, 'Combo Bông tẩy trang My Comfort  được sản xuất tại Hàn Quốc với 100% cotton tinh khiết  bề mặt bông mỏng, mềm mịn, hoàn toàn không để lại xơ bông trên da.', NULL, 0, 0, 0, '2022-11-22 08:07:31', NULL, NULL),
(29, 'Vacosi Bông phấn ướt hồ lô - BP06', 'vacosi-bong-phan-uot-ho-lo-bp06', 39999, 25, 5, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/bong-phan-blender-ho-lo-vacosi-p_74dc5b06ebae45b9b8fd7e8c7b9d91b1.jpg', 0, 0, 0, 1, 0, 0, 'Bông phấn ướt hồ lô Vacosi với bề mặt mịn cùng các lỗ khí li ti đều đặn tạo cảm giác mềm mại và bông xốp như nhung khi sử dụng.', NULL, 0, 0, 0, '2022-11-22 08:09:17', NULL, NULL),
(30, 'Vacosi Bông phấn ướt tròn nhỏ (Bich 2 miếng) BP03', 'vacosi-bong-phan-uot-tron-nho-bich-2-mieng-bp03', 15630, 25, 15, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/bong-phan-uot-tron-nho-vacosi-pb03-bich-2-cai-202206011125270040_0be16932d1e0448ea94ff1abecc89857.jpg', 0, 0, 0, 1, 0, 0, 'Bông phấn ướt tròn nhỏ Vacosi có dạng hình tròn với đường kính 5.5cm, dễ dàng sử dụng khi trang điểm lớp nền. Bạn có thể thấm chút nước khi dặm kem lót và kem nền. Lớp nền sẽ bám chắc hơn, khuyết điểm được che phủ tinh tế hơn.', NULL, 0, 0, 0, '2022-11-22 08:09:57', NULL, NULL),
(31, 'Vacosi Cọ Foundation F03', 'vacosi-co-foundation-f03', 64850, 25, 35, 0, 0, 'percent', 10, 'https://product.hstatic.net/200000551679/product/-studio-room-background-use-as-montage-product-display-banner-template_d37c0dedb25e4e2ebd1e19c752e6d90a.jpg', 0, 0, 0, 1, 0, 0, 'Cọ nền Vacosi được thiết kế chuyên nghiệp với đầu dẹp lớn và thân cọ dài do đó đánh nền dễ dàng, đặc biệt là những vùng chi tiết nhỏ.', NULL, 0, 0, 0, '2022-11-22 08:10:39', NULL, NULL),
(32, 'Vacosi Cọ phủ trung - M03', 'vacosi-co-phu-trung-m03', 93460, 25, 25, 0, 0, 'percent', 3, 'https://product.hstatic.net/200000551679/product/87a3c40caaf7e2d59ab6a8724f04d642_273379c3aed741709ae9fdacaa08c5f1.jpg', 0, 0, 0, 1, 0, 0, 'Cọ phủ trung Vacosi M03 là cọ dùng phủ má hồng & phủ đa năng khi đem đến lớp phấn phủ mỏng mịn hay dễ dàng đánh má hồng rạng rỡ.', NULL, 0, 0, 0, '2022-11-22 08:11:24', NULL, NULL),
(33, 'Vacosi Natural Studio Realbrow Tatoo Pen 03 Dark Brown', 'vacosi-natural-studio-realbrow-tatoo-pen-03-dark-brown', 65200, 25, 35, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/0326_f555c18afd634143ad863e727b38e3f9.jpg', 0, 0, 0, 1, 0, 0, 'Chì kẻ mày Vacosi Natural Studio Realbrow Tattoo Pen 03 Dark Brown có thiết kế đặc biệt đầu chải 4 điểm. Sản phẩm bền màu, không lem và lâu trôi giúp bạn có đường lông mày phẩy sợi tự nhiên.', NULL, 1, 0, 5, '2022-11-22 08:13:12', NULL, NULL),
(34, '9 Wishes Tinh chất White Tone-up Body Ser', '9-wishes-tinh-chat-white-tone-up-body-ser', 330000, 24, 15, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/1-02__23__8e570d7b0ba54dfe9c55d68346f16b2f.png', 0, 0, 0, 1, 0, 0, 'Tinh chất 9 Wishes White Tone Up Serum là dạng tinh chất dưỡng trắng da mang lại làn da mịn màng, sáng mịn, an toàn, có thể sử dụng hằng ngày, đồng thời có SPF21 giúp bảo vệ da chống khỏi tia UV từ ánh sáng mặt trời. Sản phẩm gồm những thành phần tự nhiên, rất an toàn, lành tính.', NULL, 0, 0, 0, '2022-11-22 08:16:51', NULL, NULL),
(35, 'BOM Dưỡng thể Body Tone-up 290ml', 'bom-duong-the-body-tone-up-290ml', 580000, 24, 40, 0, 0, 'percent', 12, 'https://product.hstatic.net/200000551679/product/4.2_6f763c07601d49588c64da20c85f793c.jpg', 0, 0, 0, 1, 0, 0, 'Dưỡng thể B.O.M Body Tone-up với các thành phần chiết xuất từ tự nhiên lành tính như Hoa hồng Provence, trái đào, protein từ sữa, sữa chua nuôi dưỡng làn da sáng mịn, rạng ngời suốt 72 giờ.', NULL, 0, 0, 0, '2022-11-22 08:17:37', NULL, NULL),
(36, 'Cathy Doll sữa dưỡng thể hương nước hoa cao cấp', 'cathy-doll-sua-duong-the-huong-nuoc-hoa-cao-cap', 139000, 24, 40, 0, 0, 'percent', 5, 'https://product.hstatic.net/200000551679/product/1_f9ce0af48f7645f7bcb80b98c2ed7bd4.jpg', 0, 0, 0, 1, 0, 0, 'Sữa dưỡng da toàn thân hương nước hoa cao cấp Cathy Doll giúp cung cấp độ ẩm và các dưỡng chất, giúp mang đến làn da mềm mại, mịn màng và tươi sáng, lưu hương suốt cả ngày.', NULL, 0, 0, 0, '2022-11-22 08:18:17', NULL, NULL),
(37, 'Cathy Doll Sữa dưỡng thể trắng da mờ thâm Whitamin Vitamin C Arbutin Body Lotion', 'cathy-doll-sua-duong-the-trang-da-mo-tham-whitamin-vitamin-c-arbutin-body-lotion', 430000, 24, 23, 0, 0, 'percent', 3, 'https://product.hstatic.net/200000551679/product/whitamin_c_body_lotion_2939f42fb96a45d483f9969af5fe4494_2996f0fed4c741a383b93f6fe9072dd3.png', 0, 0, 0, 1, 0, 0, 'Sữa dưỡng thể trắng da mờ thâm Cathy Doll Whitamin Vitamin C Arbutin Body Lotion làm trắng da, cải thiện các khuyết điểm trên da như vết thâm, sạm da, chống nhăn da, dưỡng ẩm cho da săn chắc, căng mịn, tươi sáng.', NULL, 0, 0, 0, '2022-11-22 08:18:54', NULL, NULL),
(38, 'Cocoon Bơ Dưỡng Thể Cà Phê Đak Lak Coffee Body Butter 200m', 'cocoon-bo-duong-the-ca-phe-dak-lak-coffee-body-butter-200m', 156000, 24, 25, 0, 0, 'percent', 5, 'https://product.hstatic.net/200000551679/product/boduongthecaphe_fd05ff1d6be14544_1ed17ad08beb47b68a278b3670cbf7db.jpg', 0, 0, 0, 1, 0, 0, 'Bơ dưỡng thể cà phê The Cocoon Dak Lak Coffee Body Butter sự kết hợp của 3 thành phần chính là dầu cà phê Dak Lak, dầu mù u và bơ cacao là giải pháp cấp ẩm chuyên sâu cho làn da khô sần, thiếu mềm mịn. Kết cấu bơ mềm mịn giàu độ ẩm nhanh chóng mang lại làn da ẩm mịn.', NULL, 0, 0, 0, '2022-11-22 08:19:23', NULL, NULL),
(39, 'Dưỡng trắng Laboratoire Chateau Rouge beauty Milk unifying care 400ml', 'duong-trang-laboratoire-chateau-rouge-beauty-milk-unifying-care-400ml', 356000, 24, 12, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/278854087_997303304324150_3165282756221664866_n_97f8c836b5fb42de8cc0875dd122e281.jpg', 0, 0, 0, 1, 0, 0, 'Sữa dưỡng trắng da Laboratoire Chateau Rouge Beauty Milk Unifying Care sẽ mang đến cho bạn một làn da trắng mịn như tuyết, đẹp không tì vết từ mặt cho đến body chỉ trong thời gian ngắn, đó luôn là niềm khao khát mãnh liệt của phái đẹp.', NULL, 0, 0, 0, '2022-11-22 08:20:00', NULL, NULL),
(40, 'Eveline Kem dưỡng da tay Extra Soft SOS 100ml', 'eveline-kem-duong-da-tay-extra-soft-sos-100ml', 110000, 24, 20, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/3010a0440d23cb78d9f3633f410d468f_100a0f04a9f44f4ebea16bfc18acd61f.jpg', 0, 0, 0, 1, 0, 0, 'Kem dưỡng da tay Eveline Extra Soft SOS với công thức đặc biệt kem dưỡng da tay siêu mềm mịn giúp tái tạo da tay. Kem mỏng nhẹ, dễ dàng hấp thu và không tạo cảm giác nhờn dính trên da. Hương thơm dịu nhẹ mang lại cảm giác thư thái khi sử dụng.', NULL, 0, 0, 0, '2022-11-22 08:20:28', NULL, NULL),
(41, 'Eveline Kem dưỡng da tay Raspberry coriander 50ml', 'eveline-kem-duong-da-tay-raspberry-coriander-50ml', 65000, 24, 20, 0, 0, 'percent', 3, 'https://product.hstatic.net/200000551679/product/0f6ce192cfe7de01b58f865ea20548b7_e649870b56444be487311678ddccc27e.png', 0, 0, 0, 1, 0, 0, 'Kem dưỡng da tay Eveline Raspberry Coriander phục hồi sự mềm mại, mịn màng cho bàn tay bị kích ứng, khô ráp, nuôi dưỡng sâu và giữ ẩm. Kem hấp thụ nhanh chóng và không để dầu, đồng thời kem dưỡng còn bảo vệ da tay, chống khô da và các yếu tố kích ứng bên ngoài.', NULL, 0, 0, 0, '2022-11-22 08:21:06', NULL, NULL),
(42, 'Gel dưỡng thể dịu mát trắng da Vaseline Healthy White Fresh&Fair Cooling UV Gel Lotion', 'gel-duong-the-diu-mat-trang-da-vaseline-healthy-white-freshfair-cooling-uv-gel-lotion', 120000, 24, 12, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/review-sua-duong-the-vaseline-7_3233916f076f43fb946b41eee5f57a15.jpg', 0, 0, 0, 1, 0, 0, 'Sữa dưỡng thể Vaseline Healthy Bright Fresh & Bright Cooling UV Niacinamide Lotion chứa Vitamin B3 giúp dưỡng da sáng khỏe tự nhiên trông thấy chỉ sau 2 tuần, kết hợp cùng tinh chất Vaseline Jelly giúp khóa ẩm cho da căng mượt. Kết cấu dạng gel mỏng nhẹ, thấm siêu nhanh, siêu sâu cùng cảm giác mát lạnh tức thì sau khi thoa chắc chắn sẽ là lựa chọn tuyệt vời dành cho mùa hè nóng nực.', NULL, 0, 0, 0, '2022-11-22 08:21:39', NULL, NULL),
(43, 'Kem dưỡng tay với dầu keratin và argan Calliderm 150ml', 'kem-duong-tay-voi-dau-keratin-va-argan-calliderm-150ml', 130000, 24, 13, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/water-texture-background-pastel-blue-design_daef966e41084408a0f923e0b6af8e75.jpg', 0, 0, 0, 1, 0, 0, 'Kem dưỡng tay với dầu keratin và argan Calliderm chiết xuất từ Glycerin, Keratin, Argan oil cùng mùi hương hoa nhẹ nhàng, dễ chịu và lớp kem thấm nhanh để lại độ dưỡng trên phần da tay không gây bết dính.', NULL, 0, 0, 0, '2022-11-22 08:22:23', NULL, NULL),
(44, 'Kem thảo mộc Hasi Habugaden cấp ẩm sâu da tay và phục hồi móng 80g', 'kem-thao-moc-hasi-habugaden-cap-am-sau-da-tay-va-phuc-hoi-mong-80g', 35600, 24, 36, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/907e8ffbdb0aac56502a88faf572ebbc_01f6fadd1ca849e487586994effd63b2.jpg', 0, 0, 0, 1, 0, 0, 'Kem thảo mộc Hasi Habugaden với công thức thảo mộc mới cùng hàm lượng dưỡng chất đậm đặc, kem cấp ẩm & phục hồi móng Hasi Habugaden mang đến liệu pháp chăm sóc và phục hồi hiệu cho bàn tay và móng.', NULL, 0, 0, 0, '2022-11-22 08:22:51', NULL, NULL),
(45, 'KISSME Kem dưỡng tay Mommy Hand Cream C 60g', 'kissme-kem-duong-tay-mommy-hand-cream-c-60g', 115000, 24, 20, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/kem-duong-da-tay-kissme-cho-tre-em-60g-1_83cef5c422024e96af8db301979d67e4.jpg', 0, 0, 0, 1, 0, 0, 'Kem dưỡng tay KISSME Mommy Hand Cream Citrus Mix Aroma với thành phần dầu Argan dầu tự nhiên giàu chất dinh dưỡng chữa lành vết thương, vết nứt da, vết bỏng, bong tróc nhanh lành hơn, có khả năng chống ô xi hóa giúp làm dịu và giảm các tổn thương da. Dầu Argan chứa nhiều axit béo, vitamin E giúp làm giảm nếp nhăn, cho làn da sáng mịn hơn, giữ ẩm mạnh mẽ giúp làn da mềm mại và săn chắc.', NULL, 0, 0, 0, '2022-11-22 08:23:16', NULL, NULL),
(46, 'KISSME Sữa dưỡng thể MOMMY Body Milk', 'kissme-sua-duong-the-mommy-body-milk', 230000, 24, 13, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/untitled_2618507715ef4bd1916aad8_f5be272e1e534c2aa3e82f1bd50b2f9f.jpg', 0, 0, 0, 1, 0, 0, 'Sữa dưỡng thể KISSME Mommy Body Milk là sữa dưỡng thể dòng sản phẩm chăm sóc da cao cấp dành cho trẻ nhỏ thuộc thương hiệu KissMe Mommy. Với thành phần lành tính, an toàn, dịu nhẹ phù hợp ngay cả với bé sơ sinh hoặc làn da nhạy cảm sử dụng được cho da mặt, tay chân mà không lo bị kích ứng.\r\n\r\nSữa dưỡng thể KISSME Mommy Body Milk đã có mặt tại Sammi Shop với 2 loại:\r\n\r\nSữa dưỡng thể KISSME Mommy Body Milk C _Hương cam chanh.\r\nSữa dưỡng thể KISSME Mommy Body Milk S _Không mùi.', NULL, 0, 0, 0, '2022-11-22 08:23:51', NULL, NULL),
(47, 'Sữa dưỡng thể sáng da Love Beauty And Planet Delicious Glow (400ml)', 'sua-duong-the-sang-da-love-beauty-and-planet-delicious-glow-400ml', 125000, 24, 25, 0, 0, 'percent', 12, 'https://product.hstatic.net/200000551679/product/0a33c05c07e3baf76cdb974871c29358_2759177aac2f486491b5ce89b283cbc5.jpg', 0, 0, 0, 1, 0, 0, 'Sữa dưỡng thể sáng da Love Beauty And Planet Delicious Glow là sự hòa quyện giữa chiết xuất bơ Murumuru của Amazon cùng những cánh hoa hồng Bulgari khéo tuyển chọn, giúp dưỡng ẩm cho làn da của bạn trong suốt 24 giờ. Sự kết hợp đầy quyến rũ ấy sẽ mang đến làn da mềm mại và sáng mịn mà bạn hằng mơ ước.', NULL, 0, 0, 0, '2022-11-22 08:24:43', NULL, NULL),
(48, 'Sữa dưỡng thể dưỡng ẩm Love Beauty And Planet Soothe & Serene (400ml)', 'sua-duong-the-duong-am-love-beauty-and-planet-soothe-serene-400ml', 125000, 24, 25, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/e447069ed8917b706d8b02e0f1885f0d_a7f39c9a4e3644388d370dac2bf6e27e.jpg', 0, 0, 0, 1, 0, 0, 'Sữa dưỡng thể dưỡng ẩm Love Beauty And Planet Soothe & Serene hòa quyện cùng tinh dầu Argan và Lavender Pháp, mang lại cho bạn liệu pháp thư giãn như ở Spa.', NULL, 0, 0, 0, '2022-11-22 08:25:12', NULL, NULL),
(49, 'Sữa dưỡng thể cấp ẩm Love Beauty And Planet Luscious Hydration (400ml)', 'sua-duong-the-cap-am-love-beauty-and-planet-luscious-hydration-400ml', 125500, 24, 23, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/sua-duong-the-love-beauty-and-planet-6_1b7d805e41d74bb0be5083d9ed1365b4.jpeg', 0, 0, 0, 1, 0, 0, 'Sữa dưỡng thể cấp ẩm Love Beauty And Planet Luscious Hydration công thức từ thiên nhiên tăng cường độ ẩm mang lại cho bạn làn da mịn màng và tươi trẻ, thấm nhanh vào da mà không gây cảm giác bết dính. Đặc biệt, phiên bản đặc biệt này được tạo ra từ nguyên liệu thuần thực vật và vỏ nhựa tái chế thân thiện với môi trường.', NULL, 0, 0, 0, '2022-11-22 08:25:42', NULL, NULL),
(50, 'Sữa dưỡng thể trắng da Louvcell Crystal Whitening Body Lotion', 'sua-duong-the-trang-da-louvcell-crystal-whitening-body-lotion', 510000, 24, 12, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/g-da-khong-ty-vet-louv-cell-crystal-whitening-body-lotion-spf5-250ml-a_848edc87780d44d38d0d1e782e3ab33f.jpg', 0, 0, 0, 1, 0, 0, 'Dưỡng Thể trắng da Louvcell Crystal Whitening Body Lotion là lotion dưỡng trắng da mang công thức dưỡng trắng đột phá từ thiên nhiên và Glutathione, làm bật tôn', NULL, 0, 0, 0, '2022-11-22 08:26:13', NULL, NULL),
(51, 'Sữa dưỡng thể Kumano Hatomug', 'sua-duong-the-kumano-hatomug', 165000, 24, 15, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/sua-duong-the-hatomugi-duong-sang-da-2_4af4d0b8322e4bf39caba4ce3b2c52ef.jpg', 0, 0, 0, 1, 0, 0, 'Sữa dưỡng thể Kumano Reihaku Hatomugi chiết xuất từ hạt ý dĩ giúp cung cấp dưỡng chất và độ ẩm cho da, mang đến làn da tươi sáng, mịn màng, đồng thời ngăn ngừa tình trạng khô da và nhăn da.', NULL, 0, 0, 0, '2022-11-22 08:26:44', NULL, NULL),
(52, 'Lotion dưỡng thể trắng da Hasi yogurt & trái cây (chiết xuất nha đam, dưa leo) uv30 180g', 'lotion-duong-the-trang-da-hasi-yogurt-trai-cay-chiet-xuat-nha-dam-dua-leo-uv30-180g', 71000, 24, 12, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/lotion-duong-the-hasi-sang-da-yo__1__997b6ca4277048c9bcbfb70499e3d4e1.jpg', 0, 0, 0, 1, 0, 0, 'Lotion dưỡng thể trắng da Hasi yogurt & trái cây (Chiết xuất nha đam, dưa leo) UV30 từ thành phần chính là sữa chua cùng với các tinh chất làm trắng và dưỡng da tự nhiên của nha đam, dưa leo mang đến làn da trắng hồng khỏe mạnh từ sâu bên trong, chất kem thẩm thấu nhanh không gây nhờn rít và bí da.', NULL, 0, 0, 0, '2022-11-22 08:27:35', NULL, NULL),
(53, 'Lotion dưỡng thể trắng da Hasi yogurt & trái cây (chiết xuất dâu tây, yến mạch) uv30 180g', 'lotion-duong-the-trang-da-hasi-yogurt-trai-cay-chiet-xuat-dau-tay-yen-mach-uv30-180g', 75000, 24, 15, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/lotion_final_vn_1__51f504dfc59b46bfbf078b59cc60f9ed.jpg', 0, 0, 0, 1, 0, 0, 'Lotion dưỡng thể trắng da Hasi yogurt & trái cây (chiết xuất dâu tây, yến mạch) UV30 với nguyên liệu dưỡng trắng da lành tính và dễ sử dụng. Lotion dưỡng thể Hasi với công thức được nghiên cứu tỉ mỉ, mang đến dưỡng trắng an toàn hiệu quả chỉ sau 14 ngày.', NULL, 0, 0, 0, '2022-11-22 08:28:07', NULL, NULL),
(54, 'Lotion dưỡng thể trắng da Hasi Yogurt & trái cây (chiết xuất cam tươi, chanh vàng) uv30 180g', 'lotion-duong-the-trang-da-hasi-yogurt-trai-cay-chiet-xuat-cam-tuoi-chanh-vang-uv30-180g', 75505, 24, 20, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/be44ff0b9fbc77af87e290733bf0defb_2706899c3ea948689816e656978b62a6.jpg', 0, 0, 0, 1, 0, 0, 'Lotion dưỡng thể trắng da Hasi Yogurt & trái cây (chiết xuất cam tươi, chanh vàng) UV30  với chiết xuất cam tươi, chanh vàng đem lại hiệu quả dưỡng trắng da cực tốt, thẩm thấu nhanh không gây nhờn rít trên da. Chiết xuất từ trái cây thiên nhiên giúp nuôi dưỡng da trắng hồng khỏe mạnh mà không lo các tác dụng phụ khác.', NULL, 0, 0, 0, '2022-11-22 08:28:37', NULL, NULL),
(55, 'Kem dưỡng AI Stem Cell Cream 10g', 'kem-duong-ai-stem-cell-cream-10g', 852000, 23, 10, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/2_2abf2de218c6469ab30eb379b5489161.jpg', 0, 0, 0, 1, 0, 0, 'Kem dưỡng 82x AI Stem Cell Cream với thành phần chính là tế bào gốc từ thực vật chiết xuất từ Táo Tuyết bên cạnh các dưỡng chất khác giúp hỗ trợ làm đẹp, chăm sóc, bảo vệ và tái tạo làn da. Sự kết hợp này hỗ trợ làm chậm lão hóa, mang đến hiệu quả trẻ hóa và làm đẹp da gấp nhiều lần so với các dòng sản phẩm kem dưỡng khác của Nhật Bản trên thị trường.', NULL, 0, 0, 0, '2022-11-22 08:29:55', NULL, NULL),
(56, '9 Wishes Kem dưỡng Pine Treatment Cream 50ml', '9-wishes-kem-duong-pine-treatment-cream-50ml', 265000, 23, 23, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/1-02__12__9912afe4bba24027bd199d7d4e0a3119.png', 0, 0, 0, 1, 0, 0, 'Kem dưỡng 9 Wishes Pine Treatment Cream với thành phần chính chứa chiết xuất từ lá thông giúp cải thiện bề kết cấu da, thu nhỏ lỗ chân lông, nuôi dưỡng làn da căng mịn, không tì vết.', NULL, 0, 0, 0, '2022-11-22 08:30:28', NULL, NULL),
(57, 'https://product.hstatic.net/200000551679/product/1-03__16__504ff903163f4c3db4743729372f5a62.png', 'httpsproducthstaticnet200000551679product1-03-16-504ff903163f4c3db4743729372f5a62png', 305000, 23, 30, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/1-03__16__504ff903163f4c3db4743729372f5a62.png', 0, 0, 0, 1, 0, 0, 'Kem dưỡng ẩm 9 Wishes Kem dưỡng Rice Radiance Cream làm trắng da chứa 68% nước Cám Gạo Hàn Quốc tự nhiên giúp cải thiện làn da tươi sáng và khỏe mạnh.', NULL, 0, 0, 0, '2022-11-22 08:31:21', NULL, NULL),
(58, '9 Wishes Kem dưỡng Vanishing Balm Tone up Ultimate SPF21 50ml', '9-wishes-kem-duong-vanishing-balm-tone-up-ultimate-spf21-50ml', 465200, 23, 20, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/2c99a4b2502ea1c8d8e0b37448af0bc8_4923e2c71bb64d52a1a49565202ff27f.jpg', 0, 0, 0, 1, 0, 0, 'Kem dưỡng 9 Wishes Vanishing Balm Ultimate Tone Up Cream là sản phẩm kem dưỡng trắng nâng tông da, làm sáng da bên trong một cách tự nhiên.Ngoài ra, giảm thiểu sự xuất hiện của nếp nhăn và lỗ chân lông trên da, mang lại làn da săn chắc, đàn hồi và se khít lỗ chân lông.', NULL, 0, 0, 0, '2022-11-22 08:31:54', NULL, NULL),
(59, 'QT Vichy Kem Dưỡng Vichy Liftactiv Collagen Specialist 15ml', 'qt-vichy-kem-duong-vichy-liftactiv-collagen-specialist-15ml', 45000, 23, 15, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/untitled_61dafd9f41d841e8aae3af64d3ed93f9_1024x1024.png', 0, 0, 0, 1, 0, 0, 'Thông tin sản phẩm đang được cập nhật', NULL, 0, 0, 0, '2022-11-22 08:32:31', NULL, NULL),
(60, 'Astalift kem dưỡng ban đêm night charge Cream S 30g', 'astalift-kem-duong-ban-dem-night-charge-cream-s-30g', 1526500, 23, 10, 0, 0, 'percent', 5, 'https://product.hstatic.net/200000551679/product/274081935_2396435493820078_5074433295581028562_n_2508c35fb662464ca51ba78e76bc9ffe.jpg', 0, 0, 0, 1, 0, 0, 'Kem dưỡng da ban đêm Astalift Night Charge Cream giúp tái tạo tế bào và giữ ẩm sâu cho da, mang đến làn da mềm mại, căng mịn và tràn đầy sức sống khi thức dậy. Đặc biệt, hương thơm kết hợp từ các loại hoa như Hồng Damask, Hoa Cúc La mã, Hoa Lài dịu nhẹ trong sản phẩm có tác dụng xua tan sự mệt mỏi sau ngày làm việc căng thẳng, mang lại cảm giác thoải mái và nhẹ nhàng.', NULL, 0, 0, 0, '2022-11-22 08:33:01', NULL, NULL),
(61, 'Astalift kem dưỡng Jelly Aquarysta T 40g', 'astalift-kem-duong-jelly-aquarysta-t-40g', 215000, 23, 0, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/271332292_2364977046965923_3988711980690499492_n_953daf4378eb4645847f0f63224579db.jpg', 0, 0, 0, 1, 0, 0, 'Kem phục hồi Astalift Jelly Aquarysta T chứa phân tử Nano Ceramide giúp tăng tính đàn hồi và khả năng duy trì độ ẩm tự nhiên của da và ngăn ngừa và chống lão hóa da. Với kết cấu dạng thạch trong như nước, đậm đặc và ổn định cao, các dưỡng chất dễ dàng thấm sâu và nuôi dưỡng làn da, đem lại làn da mềm mịn và rạng rỡ.', NULL, 0, 0, 0, '2022-11-22 08:33:27', NULL, NULL),
(62, 'Astalift kem dưỡng White Cream S', 'astalift-kem-duong-white-cream-s', 1523000, 23, 12, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/271662581_2368242256639402_8130700824368597729_n_d427b25e7d5f4b328db051cd725e1d0c.jpg', 0, 0, 0, 1, 0, 0, 'Kem dưỡng trắng da Astalift White Cream giúp nhẹ nhàng bao bọc toàn bộ và làm trắng da, làn da trở nên rạng rỡ và săn chắc. Kem có kết cấu nhẹ giúp hấp thụ mạnh mẽ các thành phần hoạt tính. Chăm sóc làn da bị cháy nắng và từ đó giúp da căng bóng, khoẻ mạnh hơn.', NULL, 0, 0, 0, '2022-11-22 08:33:57', NULL, NULL),
(63, 'AXIS-Y Kem dưỡng Heartleaf My Type Calming Cream 60ml', 'axis-y-kem-duong-heartleaf-my-type-calming-cream-60ml', 150000, 23, 10, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/3._hinh_inforgraphic__1__9da2de7929684a2dba4bcea63fa8ccf1.png', 0, 0, 0, 1, 0, 0, 'Kem dưỡng diếp cá làm dịu da Axis-Y Heartleaf My Type Calming Cream với chất gel trắng đục, mang đến làn da mướt mịn sau khi sử dụng, mùi hương nhẹ nhàng, thư giãn. Giúp làm dịu làn da ửng đỏ, khô, mất nước sau khoảng thời gian dài điều trị.', NULL, 0, 0, 0, '2022-11-22 08:34:31', NULL, NULL),
(64, 'Bio-essence Gel dưỡng ẩm Bio-water B5 Moisturizing Gel (50g)', 'bio-essence-gel-duong-am-bio-water-b5-moisturizing-gel-50g', 320000, 23, 23, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/303467393_2876663615963524_34998099574528310_n_49e7c6f36cba4aa8aa88e08d1c9decc6.jpg', 0, 0, 0, 1, 0, 0, 'Gel dưỡng ẩm Bio-Essence Bio-water B5 Moisturizing Gel giúp cung cấp và duy trì độ ẩm cần thiết, thúc đẩy quá trình phục hồi và tái tạo da, cải thiện hàng rào bảo vệ da, nuôi dưỡng làn da ẩm mịn, căng tràn sức sống.', NULL, 0, 0, 0, '2022-11-22 08:35:03', NULL, NULL),
(65, 'Bio-essence Kem dưỡng Bio- Vlift Face Lifting Cream (45', 'bio-essence-kem-duong-bio-vlift-face-lifting-cream-45', 326000, 23, 20, 0, 0, 'percent', 10, 'https://product.hstatic.net/200000551679/product/90815004_2256936517936240_7017955305870852096_n_cd045876df054b009cd9118774d23279.jpg', 0, 0, 0, 1, 0, 0, 'Kem dưỡng nâng cơ săn chắc da Bio-Essence Bio-Vlift Face Lifting Cream chứa chiết xuất từ hoa Phong Lan đen giúp cải thiện khả năng phục hồi độ săn chắc của da và và nâng đường nét trên khuôn mặt, làm giảm nếp nhăn. Đồng thời, tinh chất gạo lên men giúp làm sáng da, giảm xỉn màu và giữ cho da mịn màng.', NULL, 0, 0, 0, '2022-11-22 08:35:42', NULL, NULL),
(66, 'Bio-essence Kem dưỡng Bio-bird\'s Nest Collagen Essence Cream (50g)', 'bio-essence-kem-duong-bio-birds-nest-collagen-essence-cream-50g', 345600, 23, 23, 0, 0, 'percent', 10, 'https://product.hstatic.net/200000551679/product/2_adeaa64941b34b0587c58f2fd015fd_7463086be5934b92b5e407dae9c7d91f.jpg', 0, 0, 0, 1, 0, 0, 'Kem dưỡng trắng da Bio-Essence Bio-Bird\'s Nest Collagen Essence Cream với kết cấu kem mềm mịn giúp cung cấp dưỡng chất dồi dào và dưỡng ẩm cho làn da cùng với việc bổ sung hàm lượng collagen giúp giữ cho làn da luôn căng mọng và rạng rỡ.', NULL, 0, 0, 0, '2022-11-22 08:36:16', NULL, NULL),
(67, 'Bio-essence Kem dưỡng Bio-Gold Night Cream (40g)', 'bio-essence-kem-duong-bio-gold-night-cream-40g', 385600, 23, 10, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/3_ab6f27801eea4841a7ed698e8fdbda_03ab727f774542f38b1742f2eebf97c3.jpg', 0, 0, 0, 1, 0, 0, 'Kem dưỡng ban đêm Bio-Essence Bio-Gold Night Cream giúp tái tạo và nuôi dưỡng làn da vào ban đêm, làn da sẽ dễ dàng hấp thụ được các dưỡng chất từ tinh chất vàng 24k cao cấp nhờ công nghệ độc quyền Bio-Energy Complex™ mang đến làn da căng mịn và tràn đầy sức sống vào ngày mới.', NULL, 0, 0, 0, '2022-11-22 08:36:48', NULL, NULL),
(68, 'Bio-essence Kem dưỡng Bio-white Pro Whitening Night Cream (50g)', 'bio-essence-kem-duong-bio-white-pro-whitening-night-cream-50g', 363000, 24, 30, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/kem-duong-bio-essence-lam-sang-da-ban-ngay-50g-1_278f6eadd163445483a8660088c6480f.jpg', 0, 0, 0, 1, 0, 0, 'Kem dưỡng ban đêm Bio-White Pro Whitening Night Cream là dưỡng chất tuyệt vời chăm sóc làn da buổi đêm, mang lại cho làn da nét tươi sáng và ẩm mịn. Công thức sản phẩm dịu nhẹ giúp hồi phục làn da hiệu quả vào buổi tối để lẫn da căng mịn và rạng rỡ ngay sáng hôm sau.', NULL, 0, 0, 0, '2022-11-22 08:37:17', '2022-11-22 08:50:11', NULL),
(69, 'Bioderma Kem dưỡng Cicabio Creme 40ml', 'bioderma-kem-duong-cicabio-creme-40ml', 345000, 24, 10, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/1_25eea7b411204f829cb3b07746de41c9.png', 0, 0, 0, 1, 0, 0, 'Kem phục hồi da tổn thương Bioderma Cicabio Crème tăng cường tốc độ phục hồi làn da hư tổn nhanh gấp 3 lần bình thường so với không sử dụng. Cicabio Crème cực kì lành tính đối với làn da dễ kích ứng, đồng thời cải thiện hiệu quả cấu trúc da hư tổn sau mụn hay sau quá trình xâm lấn (lăn kim/ peel/ laser…).', NULL, 0, 0, 0, '2022-11-22 08:47:37', '2022-11-22 08:50:06', NULL),
(70, '9 Wishes Kem dưỡng Rice Radiance Cream 50ml', '9-wishes-kem-duong-rice-radiance-cream-50ml', 356000, 24, 32, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/1-02__18__5f6c8f19f3d44f66a6f1d79bd01303a2.png', 0, 0, 0, 1, 0, 0, 'Kem dưỡng ẩm 9 Wishes Kem dưỡng Rice Radiance Cream làm trắng da chứa 68% nước Cám Gạo Hàn Quốc tự nhiên giúp cải thiện làn da tươi sáng và khỏe mạnh.', NULL, 0, 0, 0, '2022-11-22 08:48:08', '2022-11-22 08:50:00', NULL),
(71, 'Kem Nâng Tông Da BOM Light on tone -up Cream', 'kem-nang-tong-da-bom-light-on-tone-up-cream', 415000, 24, 10, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/10.3_816a96e10ea544fd965329bf6b44b460.jpg', 0, 0, 0, 1, 0, 0, 'Kem Nâng Tông Da B.O.M Light On Tone-Up Cream giúp nâng tông da, cho làn da trắng hồng tự nhiên. Kem dùng được cho nhiều vùng da khác nhau: từ các khu vực cơ bản như mặt, cổ, tay, chân, cho đến vùng khuỷu tay, nách hoặc đầu gối, phù hợp cho mọi loại da, kể cả da nhạy cảm.', NULL, 0, 0, 0, '2022-11-22 08:48:45', '2022-11-22 08:49:54', NULL),
(72, '82x Tinh chất AI Stem Cell Serum 10ml', '82x-tinh-chat-ai-stem-cell-serum-10ml', 852000, 22, 12, 0, 0, 'percent', 2, 'https://product.hstatic.net/200000551679/product/2_d259547ac44049159f13fbbbf18958a4.jpg', 0, 0, 0, 1, 0, 0, 'Tinh chất 82X AI Stem Cell Serum cao cấp từ Nhật Bản giúp chăm sóc, bảo vệ, cải thiện làn da phái đẹp một cách hiệu quả bằng cách cung cấp dưỡng chất đã qua xử lý thông minh, áp dụng Công thức 82X AI hay còn gọi là Công thức Trí tuệ nhân tạo, tận dụng và kích thích khả năng tự thích nghi, thấu hiểu và tìm tế bào da hư tổn của phân tử dưỡng chất để giải quyết các tổn thương tận gốc trên da.', NULL, 0, 0, 0, '2022-11-22 08:52:10', NULL, NULL),
(73, '9 Wishes Tinh chất Amazing Pine Ampule Serum 25ml', '9-wishes-tinh-chat-amazing-pine-ampule-serum-25ml', 165210, 22, 15, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/1-02__2__b1426b6a3f29480e821769058e6680a7.png', 0, 0, 0, 1, 0, 0, 'Tinh chất 9 Wishes Amazing Pine Ampule với thành phần chính chứa chiết xuất từ lá thông và thành phần được cấp bằng sáng chế Hupura-THA giúp cải thiện bề kết cấu da, cấp ẩm, làm dịu da. Đồng thời thanh lọc, loại bỏ tế bào chết, phù hợp cho cả da nhạy cảm.', NULL, 0, 0, 0, '2022-11-22 08:52:49', NULL, NULL),
(74, '9 Wishes Tinh chất Barrier Ampule Serum 25ml', '9-wishes-tinh-chat-barrier-ampule-serum-25ml', 214000, 22, 20, 0, 0, 'percent', 4, 'https://product.hstatic.net/200000551679/product/1-02__3__f574aa34b60c4f35aad63336c1fbb32c.png', 0, 0, 0, 1, 0, 0, 'Tinh chất dưỡng ẩm 9 Wishes Barrier Ampule Serum với bảng thành phần gồm nhiều dưỡng chất  chiết xuất từ tự nhiên, nhằm củng cố, duy trì và bảo vệ lớp màng ẩm tự nhiên trên da. Không chỉ nuôi dưỡng làn da ẩm mượt, mà còn bảo vệ da trước nguy cơ bị lão hóa sớm và xỉn màu do thiếu ẩm.', NULL, 0, 0, 0, '2022-11-22 08:53:37', NULL, NULL),
(75, '9 Wishes Tinh chất Calm Ampule Serum 25 ml', '9-wishes-tinh-chat-calm-ampule-serum-25-ml', 198000, 22, 20, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/1-03__4__15b06d668fcc4a7d8330ef497faa3533.png', 0, 0, 0, 1, 0, 0, 'Tinh chất làm dịu và trị mụn 9 Wishes Calm Ampule Serum là sản phẩm huyết thanh giúp nhanh chóng làm dịu da. Các thành phần chính được chiết xuất từ rau má, panthenol, tinh chất rau kinh giới có khả năng làm dịu làn da đang gặp mẫn cảm, đang căng thẳng hoặc trong quá trình điều trị mụn.', NULL, 0, 0, 0, '2022-11-22 08:54:13', NULL, NULL),
(76, '9 Wishes Tinh chất Collagen Ampule Essence 150ml', '9-wishes-tinh-chat-collagen-ampule-essence-150ml', 265000, 22, 0, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/1-02__5__4b6346e974d14e378bcb126640089141.png', 0, 0, 0, 1, 0, 0, 'Tinh chất 9 Wishes Collagen Ampule Essence chứa thành phần chính chứa 50% nước biển, Collagen thủy phân, Adenoside dễ hấp thụ giúp da săn chắc, đàn hồi. Đồng thời cấp ẩm giúp da trở nên ẩm mượt. Bên cạnh đó, sản phẩm nâng cơ giúp da cải thiện được tình trạng nếp nhăn.', NULL, 0, 0, 0, '2022-11-22 08:54:35', NULL, NULL),
(77, '9 Wishes Tinh chất Extreme Oxygen Ampule Serum 25ml', '9-wishes-tinh-chat-extreme-oxygen-ampule-serum-25ml', 198000, 22, 20, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/1-03__6__6236a9bc56804d4d928b258054009156.png', 0, 0, 0, 1, 0, 0, 'Tinh chất trẻ hóa 9 Wishes Oxygen Ampule Serum là tinh chất dưỡng ẩm giúp trẻ hóa làn da đến từ thương hiệu 9 Wishes. Sản phẩm được khuyên dùng dành cho làn da căng thẳng do tác hại của môi trường.Bên cạnh đó, giúp da ngậm nước và điều chỉnh độ cân bằng dầu,độ ẩm của da, làm trẻ hóa làn da, chống căng thẳng .', NULL, 0, 0, 0, '2022-11-22 08:54:59', NULL, NULL),
(78, '9 Wishes Tinh chất Mega Vitamin Ampule Serum 25ml', '9-wishes-tinh-chat-mega-vitamin-ampule-serum-25ml', 165000, 22, 20, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/1-03__9__ddbea12aa2b7442e878fc290e9357fd1.png', 0, 0, 0, 1, 0, 0, 'Tinh chất tái tạo 9 Wishes Mega Vitamin Ampule Serum là sản phẩm giúp tái tạo - nuôi dưỡng da. Với kết cấu nhẹ dịu và thành phần kết hợp vitamin B7, C, E, betaine, chiết xuất từ sữa ong chúa giúp cải thiện làn da thiếu sức sống, phục hồi và ngăn ngừa các dấu hiệu lão hóa sớm xuất hiện trên da', NULL, 0, 0, 0, '2022-11-22 08:55:25', NULL, NULL),
(79, '9 Wishes Tinh chất Miracle White Ampule Serum 25ml', '9-wishes-tinh-chat-miracle-white-ampule-serum-25ml', 165230, 22, 30, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/1-03__10__38ce9292484e47779001636f3962aa4f.png', 0, 0, 0, 1, 0, 0, 'Tinh chất dưỡng trắng 9 Wishes Miracle White Ampule Serum là một dạng tinh chất giúp dưỡng trắng da cô đặc đến từ hãng mỹ phẩm 9 Wishes. Kết cấu nhẹ dễ dàng thấm sâu vào da, nuôi dưỡng, phục hồi làn da mệt mỏi, sạm đen vì nắng và các tia UV có hại. Sản phẩm mang lại làn da mềm mại, đủ ẩm và trắng sáng dần từ bên trong.', NULL, 0, 0, 0, '2022-11-22 08:55:57', NULL, NULL),
(80, '9 Wishes Tinh chất Ultimate Collagen Ampule Serum 25 ml', '9-wishes-tinh-chat-ultimate-collagen-ampule-serum-25-ml', 165030, 22, 20, 0, 0, 'percent', 10, 'https://product.hstatic.net/200000551679/product/1-03__1__5e5304ebb7734ee081a6c3befb71a24e.png', 0, 0, 0, 1, 0, 0, 'Tinh chất 9 Wishes Ultimate Collagen Ampule Serum là tinh chất bố sung collagen, chống lại các dấu hiệu lão hóa da. Sản phẩm có kết cấu nhẹ dễ dàng thẩm thấu sâu vào da, nuôi dưỡng, đẩy lùi và làm chậm quá trình lão hóa của da.', NULL, 0, 0, 0, '2022-11-22 08:56:39', NULL, NULL),
(81, 'Bio-essence Tinh chất Vitamin B5 Gel 5ml', 'bio-essence-tinh-chat-vitamin-b5-gel-5ml', 560000, 22, 12, 0, 0, 'percent', 2, 'https://product.hstatic.net/200000551679/product/untitled_e9dd1140675d40b0803de64460a8c015_1024x1024.png', 0, 0, 0, 1, 0, 0, 'Thông tin sản phẩm đang được cập nhật', NULL, 0, 0, 0, '2022-11-22 08:57:08', NULL, NULL),
(82, 'Astalift tinh chất chống lão hóa Al Essence Destiny 30ml', 'astalift-tinh-chat-chong-lao-hoa-al-essence-destiny-30ml', 1256000, 22, 30, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/astalift-essence-destiny-30ml-2_913c92bfe4474637884c880922bd0a3b.jpg', 0, 0, 0, 1, 0, 0, 'Tinh chất chống lão hóa da Astalift Essence Destiny giúp dưỡng chất thẩm thấu nhanh vào da, chống oxy hoá, bảo vệ lưới collagen và kích hoạt việc nhân rộng tế bào, làm da săn chắc và đàn hồi, ngăn chặn sự lão hóa. Với nồng độ dưỡng chất đậm đặc giúp nhanh chóng cải thiện độ ẩm, sự săn chắc và các nếp nhăn cho da.', NULL, 0, 0, 0, '2022-11-22 08:58:02', NULL, NULL),
(86, 'Astalift tinh chất tế bào gốc In-focus Cellactive Serum 30m', 'astalift-tinh-chat-te-bao-goc-in-focus-cellactive-serum-30m', 2300000, 22, 23, 0, 0, 'percent', 2, 'https://product.hstatic.net/200000551679/product/untitled_3bba92195b3245639df409646ac4d4f4_1024x1024.png', 0, 0, 0, 1, 0, 0, 'Tinh chất Astalift In-focus Cellactive Serum tác động vào tế bào gốc, giúp kích hoạt và trẻ hóa tế bào gốc, mang đến làn da tươi trẻ, căng mịn, thách thức cùng thời gian.', NULL, 0, 0, 0, '2022-11-22 09:00:12', '2022-11-22 10:32:39', NULL),
(87, 'AXIS-Y Tinh chất Advanced Aqua Boosting Ampoule 30ml', 'axis-y-tinh-chat-advanced-aqua-boosting-ampoule-30ml', 302000, 22, 0, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/3._hinh_inforgraphic_ede904d9148644e0b7f13d6c9dfdc679.png', 0, 0, 0, 1, 0, 0, 'Tinh chất cấp ẩm chuyên sâu cho da nhạy cảm Advanced Aqua Boosting Ampoule chứa 10 loại Axit Hyaluroric và sáu thành phần tự nhiên, giúp cấp ẩm vào sâu các tầng biểu bì da, mang đến một làn da ngậm nước, một nền da mềm mượt và mịn màng.', NULL, 0, 0, 0, '2022-11-22 09:00:46', NULL, NULL),
(88, 'Axis-Y Tinh chất Artichoke Intensive Skin Barrier Ampoule 30ml', 'axis-y-tinh-chat-artichoke-intensive-skin-barrier-ampoule-30ml', 268000, 22, 20, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/2._hinh_texture_f77142fe6ac949fcb37fc7b4b6be45a4.png', 0, 0, 0, 1, 0, 0, 'Tinh chất Axis-Y Artichoke Intensive Skin Barrier Ampoule có khả năng phục hồi và dưỡng ẩm để da luôn được nuôi dưỡng từ sâu bên trong. Đồng thời, các chất chống oxy hóa mạnh mẽ chứa trong Atiso giúp bảo vệ da khỏi các tác nhân gây hại, giữ cho da luôn căng mịn, tươi trẻ.', NULL, 0, 0, 0, '2022-11-22 09:01:15', NULL, NULL),
(89, 'Axis-Y Tinh chất Dark Spot Correcting Glow Serum 50ml', 'axis-y-tinh-chat-dark-spot-correcting-glow-serum-50ml', 256000, 22, 0, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/3._hinh_inforgraphic_8b2d4ece86a74d0ba2ef3b1742acb7bf.png', 0, 0, 0, 1, 0, 0, 'Tinh chất Axis-Y Dark Spot Correcting Glow Serum chứa Niacinamide 5% giúp dưỡng da mờ thâm và cải thiện các vấn đề về sắc tố da như thâm xỉn, không đều màu. Đồng thời, Niacinamide còn có khả năng giảm viêm do mụn, kích thích quá trình tổng hợp ceramide, giúp da phục hồi. Bên cạnh đó, Squalane có nguồn gốc từ thực vật giúp dưỡng ẩm sâu cho làn da căng mọng, săn chắc.', NULL, 0, 0, 0, '2022-11-22 09:01:37', NULL, NULL),
(90, 'Some By Mi Tinh chất AHA-BHA-PHA 30 Days Miracle Serum 50ml', 'some-by-mi-tinh-chat-aha-bha-pha-30-days-miracle-serum-50ml', 268000, 22, 15, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/vuong-03-01__13__335bb49c1e5e40e09199ce57d875370c.png', 0, 0, 0, 1, 0, 0, 'Tinh chất Some By Mi AHA-BHA-PHA 30 Days Miracle Serum với thành phần chứa bộ 3 AHA-BHA-PHA có tác dụng cao trong việc trị mụn, loại bỏ các tế bào chết giúp đánh bay các loại mụn cám, mụn đầu đen, mụn bọc sẽ nằm trong lòng bàn tay chỉ sau 30 ngày sử dụng kiên trì.', NULL, 0, 0, 0, '2022-11-22 09:02:07', NULL, NULL);
INSERT INTO `products` (`id`, `name`, `slug`, `price`, `category_id`, `number`, `admin_id`, `sale`, `discount_type`, `discount_value`, `avatar`, `view`, `hot`, `manufacturer_id`, `active`, `pay`, `dealer_id`, `description`, `content`, `review_total`, `warranty_date`, `review_star`, `created_at`, `updated_at`, `configuration`) VALUES
(91, 'Melano CC Tinh chất Whitening Essence 20ml', 'melano-cc-tinh-chat-whitening-essence-20ml', 0, 22, 0, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/806a06c89f1a99e782c9832fc9fbecd4_90694336bf4c4e95aa0befb138f722e4.jpg', 0, 0, 0, 1, 0, 0, 'Tinh chất Melano CC Vitamin C Brightening Essence là một trong những sản phẩm trị thâm, dưỡng trăng. Với thành phần vitamin C kết hợp cùng nhiều vi chất khác, sản phẩm giúp cải thiện làn da rõ rệt, mang lại làn da trắng sáng, mịn màng.', NULL, 0, 0, 0, '2022-11-22 09:02:27', NULL, NULL),
(92, 'Tinh chất dưỡng mi DHC Eyelash Tonic 6.5ml', 'tinh-chat-duong-mi-dhc-eyelash-tonic-65ml', 285000, 22, 15, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/f5806e1820fa6519f89854531ba213bd_00202ce7479f401a8f6bd3045028c658.jpg', 0, 0, 0, 1, 0, 0, 'Tinh chất dưỡng mi DHC Eyelash Tonic với thành phần từ chiết xuất 6 loại thực vật, placenta cùng các thành phần dưỡng chất giúp kích thích sự phát triển của lông mi, mang lại hàng mi dày và dài, chắc khỏe và mượt mà.', NULL, 0, 0, 0, '2022-11-22 09:02:53', NULL, NULL),
(93, 'Skin1004 Tinh chất Madagascar Centella Ampoule 100ml', 'skin1004-tinh-chat-madagascar-centella-ampoule-100ml', 152000, 22, 15, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/1-05__11__f6b6fcda12174274ac0f525b252806f4.png', 0, 0, 0, 1, 0, 0, 'Tinh chất rau má hỗ trợ giảm mụn, phục hồi da Skin1004 Madagascar Centella Ampoule là dòng sản phẩm bán chạy nhất của thương hiệu chăm sóc da Skin1004 đến từ Hàn Quốc.Sản phẩm chứa chiết xuất từ rau má giúp làm dịu da, giảm sưng viêm mụn, hỗ trợ phục hồi da và chữa lành các thương tổn do mụn hoặc kích ứng gây ra, tái tạo làn da mới tươi sáng và mịn màng hơn.', NULL, 0, 0, 0, '2022-11-22 09:03:33', NULL, NULL),
(94, 'Bio-essence Tinh chất Bio- Renew Radiant Youth Facial Oil', 'bio-essence-tinh-chat-bio-renew-radiant-youth-facial-oil', 343000, 22, 10, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/3ea392b5a6b1f69f880946c4411a94d7_5b5d9f6f561e4684b8f50580f456bf3c.jpg', 0, 0, 0, 1, 0, 0, 'Tinh chất Bio-Essence Bio- Renew Royal Jelly Radiant Youth Facial Oil  nuôi dưỡng da và ngăn ngừa lão hóa, hồi sinh da chỉ với 1 giọt tinh chất, mang đến cho bạn làn da tươi trẻ, tràn đầy sức sống.', NULL, 0, 0, 0, '2022-11-22 10:24:57', NULL, NULL),
(97, 'Skin1004 Tinh chất Madagascar Centella Hyalu-cica Blue Serum 50ml', 'skin1004-tinh-chat-madagascar-centella-hyalu-cica-blue-serum-50ml', 145000, 22, 12, 0, 0, 'percent', 2, 'https://product.hstatic.net/200000551679/product/1-03__12__f54a64411fa34d7b882867186f122073.png', 0, 0, 0, 1, 0, 0, 'Tinh chất dưỡng ẩm, làm sáng Skin1004 Madagasca Centella Hyalu-Cica sở hữu công thức \"Hyalu-Cica\" chứa chiết xuất rau má Madagascar và Hyaluronic Acid giúp làm dịu da nhảy cảm', NULL, 0, 0, 0, '2022-11-22 10:36:17', NULL, NULL),
(98, 'Tinh chất Dưỡng Sáng Đều Màu MartiDerm Pigment Zero DSP Bright Ampoules 30amp', 'tinh-chat-duong-sang-deu-mau-martiderm-pigment-zero-dsp-bright-ampoules-30amp', 1244000, 22, 23, 0, 0, 'percent', 12, 'https://product.hstatic.net/200000551679/product/ampoule-martiderm-duong-sang-deu-mau-da-mo-tham-nam-2ml-1_6efbdecc0cc44effaf2fa852fccf13e9.jpg', 0, 0, 0, 1, 0, 0, 'Tinh chất dưỡng sáng đều màu MartiDerm Pigment Zero DSP Bright Ampoules công thức chứa 6 thành phần điều trị đốm sắc tố khác nhau được phối trộn và cô đặc trong 1 loại ampoule duy nhất để mang lại hiệu quả tối đa, giúp loại bỏ đốm sắc tố, đồng thời ngăn ngừa sản sinh và tích tụ melanin trong da, từ đó làm giảm kích thước và mật độ của các đốm nâu, dưỡng da sáng mịn đều màu.', NULL, 0, 0, 0, '2022-11-22 10:38:24', NULL, NULL),
(99, 'Tinh chất Dưỡng Ẩm MartiDerm The Originals Proteos Liposome Ampoule 30amp', 'tinh-chat-duong-am-martiderm-the-originals-proteos-liposome-ampoule-30amp', 450000, 22, 12, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/ampoule-martiderm-the-originals-proteos-liposome-orchard.vn-2_900ff39456e04259a20d1651a0dd0c6d.jpg', 0, 0, 0, 1, 0, 0, 'Tinh chất dưỡng ẩm MartiDerm The Originals Proteos Liposome Ampoule công thức sản phẩm độc đáo với 3% Proteoglycans kết hợp cùng Vitamins C & E liposomes và chiết xuất cây Phỉ, giúp cung cấp độ ẩm mạnh mẽ và chuyên sâu cho da, cân bằng lượng dầu tiết ra. Đồng thời, sản phẩm giúp chống oxy hoá và hỗ trợ sửa chữa các tổn thương da do tác hại của ánh nắng mặt trời, làm sáng và đồng đều màu da.', NULL, 0, 0, 0, '2022-11-22 10:39:00', NULL, NULL),
(100, 'I\'m From tinh chất Mugwort Essence 160ml', 'im-from-tinh-chat-mugwort-essence-160ml', 1200000, 22, 0, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/hinh_concept__2__c35fdc1f9dcc4a71a01da48d6a6427cf.png', 0, 0, 0, 1, 0, 0, 'Tinh chất I’m from Mugwort Essence chứa 100% chiết xuất ngải cứu, làm dịu và phục hồi làn da bị tổn thương. Ngoài ra, giúp loại bỏ bã nhờn dư thừa trên da sau khi rửa mặt đồng thời cân bằng độ pH để các bước skincare tiếp theo đạt hiệu quả hơn. Sản phẩm có màu xanh trong, lỏng, nhẹ, thấm nhanh trên da.', NULL, 0, 0, 0, '2022-11-22 10:39:23', NULL, NULL),
(101, 'Cosrx hoạt chất dưỡng da Two in One Poreless Power Liquid 100ml', 'cosrx-hoat-chat-duong-da-two-in-one-poreless-power-liquid-100ml', 145000, 22, 23, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/a12e40878171190f1bbb7cab4cbb1a02_1a0a929bdeaf4c0d9c23238e88a11661.jpg', 0, 0, 0, 1, 0, 0, 'Hoạt chất dưỡng da Cosrx Two in One Poreless Power Liquid chứa chiết xuất vỏ cây liễu trắng, được coi là “BHA tự nhiên” có khả năng hạn chế lượng dầu, “len lỏi” vào sâu lỗ chân lông, giúp làm sạch sâu, hạn chế mụn đầu đen, mụn li ti, sợi bã nhờn.', NULL, 0, 0, 0, '2022-11-22 10:40:31', NULL, NULL),
(102, 'Some By Mi Tinh chất Propolis B5 Glow Barrier Calming Serum 50m', 'some-by-mi-tinh-chat-propolis-b5-glow-barrier-calming-serum-50m', 235000, 22, 10, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/17-23-07-03__7__5b1b35df2b764ddd9e83cc624ef89d1f.png', 0, 0, 0, 1, 0, 0, 'Tinh chất dưỡng da Some By Mi Propolis B5 Glow Barrier Calming Serum với chiết xuất từ ​​keo ong, mật ong, ceramides và panthenol giúp làm giảm viêm sưng và mẩn đỏ, phục hồi và củng cố lớp bảo vệ, mang lại cho làn da vẻ khỏe mạnh và rạng rỡ.', NULL, 0, 0, 0, '2022-11-22 10:41:33', NULL, NULL),
(103, 'It\'s Skin Tinh chất Hyaluronic Acid Moisture Serum 40m', 'its-skin-tinh-chat-hyaluronic-acid-moisture-serum-40m', 235000, 22, 15, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/5.concept_48585ecb39bf4b4eacaaa914d7156ba3.png', 0, 0, 0, 1, 0, 0, 'Tinh chất dưỡng ẩm sâu It\'s Skin Hyaluronic Acid Moisture Serum chứa Hyaluronic Acid, giúp da bạn mọng mướt từ sâu bên trong, đồng thời giảm thiểu tình trạng da thô ráp, bong tróc và xỉn màu.', NULL, 0, 0, 0, '2022-11-22 10:42:47', NULL, NULL),
(104, 'Dear, Klairs tinh chất Rich Moist Soothing Serum 80ml', 'dear-klairs-tinh-chat-rich-moist-soothing-serum-80ml', 560000, 22, 30, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/2__12__b11bfc59c6b7440a8569e05ae913c157.png', 0, 0, 0, 1, 0, 0, 'Tinh chất cấp ẩm cho da nhạy cảm Rich Moist Soothing Serum đến từ thương hiệu Dear Klairs – trực thuộc By Wishtrend Hàn Quốc là sản phẩm tinh chất (serum) giúp cung cấp độ ẩm chuyên sâu dành cho tình trạng da khô mất nước, giúp da trở nên căng mọng ngay tức thì, đồng thời hỗ trợ làm dịu mát da, xoa dịu mẩn đỏ và hỗ trợ ngăn ngừa các dấu hiệu lão hóa.', NULL, 0, 0, 0, '2022-11-22 10:47:37', NULL, NULL),
(105, 'Xịt dưỡng tóc Hairburst Elixir 125ml', 'xit-duong-toc-hairburst-elixir-125ml', 260000, 19, 5, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/xit-duong-toc-hairburst-lam-phon_c1296db00f94444b813c11d76e1634bf.jpg', 0, 0, 0, 1, 0, 0, 'Xịt dưỡng tóc Hairburst Elixir vừa giải quyết được vấn đề tóc bết, tạo độ phồng cho tóc, mà quan trọng nhất là giảm thiểu được vấn đề rụng tóc, giúp tóc mọc nhanh, dài và bóng mượt hơn rất nhiều. Đặc biệt, sản phẩm còn giúp bảo vệ tóc khỏi các tác nhân gây hại của môi trường do thành phần có chống tia UV bảo vệ tóc.', NULL, 0, 0, 0, '2022-11-22 10:48:41', NULL, NULL),
(106, 'Weilaiya Dầu xả White Truffle Hair Nourishing Conditioner 450ml', 'weilaiya-dau-xa-white-truffle-hair-nourishing-conditioner-450ml', 540000, 19, 3, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/weilaiya-truffle-shampoo-conditioner-set-perfume_308971761dc64f85bac30135a821ceab.jpg', 0, 0, 0, 1, 0, 0, 'Dầu xả Weilaiya White Truffle Hair Nourishing Conditioner - Dầu xả phục hồi Weilaiya chiết xuất từ 2 loại siêu thực phẩm giàu dinh dưỡng và quý hiếm trên thế giới giúp bổ sung độ ẩm cho tóc, không xơ gãy tóc, chăm sóc đến tận ngọn tóc.', NULL, 0, 0, 0, '2022-11-22 10:49:09', NULL, NULL),
(107, 'Dầu gội thảo dược Gừng - Dừa CoCayHoaLa 440g', 'dau-goi-thao-duoc-gung-dua-cocayhoala-440g', 150000, 19, 20, 0, 0, 'percent', 10, 'https://product.hstatic.net/200000551679/product/photo_2022-06-02_16-04-32_36043f09a7444cd1a075d4c7ddb8252c.jpg', 0, 0, 0, 1, 0, 0, 'Dầu gội thảo dược Gừng - Dừa CoCayHoaLa với chiết xuất từ các thành phần tự nhiên như gừng tươi, dầu dừa,... giúp làm sạch gàu, giảm ngứa hiệu quả và khắc phục hiệu quả các vấn đề về tóc và da đầu. Đồng thời kích thích sự hoạt động tuần hoàn mạch máu dưới da đầu, giúp giảm căng thẳng, stress cho người sử dụng.', NULL, 0, 0, 0, '2022-11-22 10:50:08', NULL, NULL),
(108, 'Weilaiya Dầu gội Zingiber Officinale Juice Bright Hair Shampoo', 'weilaiya-dau-goi-zingiber-officinale-juice-bright-hair-shampoo', 450000, 19, 30, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/dsc07530_bcd388e2a8c642ec9c2601f_bee9fc39e89e43258c9a197dadf577d6.png', 0, 0, 0, 1, 0, 0, 'Dầu gội gừng hà thủ ô Weilaiya Zingiber Officinale Juice Bright Hair Shampoo chứa chiết xuất từ gừng tươi, tinh chất hà thủ ô và các loại thảo mộc tự nhiên giúp làm sạch tóc và da đầu, loại bỏ gàu. Đồng thời dầu gội còn có tác dụng hỗ trợ lưu thông máu da đầu, tăng cường dinh dưỡng nuôi dưỡng nang tóc, giúp tóc phục hồi chắc khoẻ, giảm gãy rụng chỉ sau 1 lần gội. Ngoài ra tinh chất hà thủ ô có khả năng kích thích tóc mọc mới, giúp tóc đen nhánh, bóng mượt.', NULL, 0, 0, 0, '2022-11-22 10:50:53', NULL, NULL),
(109, 'Weilaiya Dầu gội Ginger Shampoo', 'weilaiya-dau-goi-ginger-shampoo', 560000, 19, 50, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/wei_0542_bea88bc1398f4de09c02b4a_fc7d084479c048a493548af4197c9b48.png', 0, 0, 0, 1, 0, 0, 'Dầu gội gừng Weilaiya Ginger Shampoo chứa chiết xuất từ gừng tươi và các loại thảo mộc tự nhiên ngừa rụng tóc, loại bỏ gàu. Đồng thời còn có tác dụng hỗ trợ lưu thông máu da đầu, tăng cường dinh dưỡng nuôi dưỡng nang tóc, giúp tóc phục hồi chắc khoẻ.', NULL, 0, 0, 0, '2022-11-22 10:51:15', NULL, NULL),
(110, 'Some By Mi Dầu gội Cica Peptide Anti Hair Loss Derma Scalp Shampoo 28', 'some-by-mi-dau-goi-cica-peptide-anti-hair-loss-derma-scalp-shampoo-28', 650000, 19, 10, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/1-8-06-02_8fbf0a95e585468cb9fc3f16398063e8.png', 0, 0, 0, 1, 0, 0, 'Dầu gội Some By Mi Cica Peptide Anti Hair Loss Derma Scalp Shampoo giúp làm sạch, cung cấp độ ẩm và phục hồi cho da đầu bị kích ứng. Ngoài ra, sản phẩm còn hỗ trợ loại bỏ tế bào chết và giảm tình trạng gãy, rụng giúp cho mái tóc luôn bóng khỏe, mềm mượt.', NULL, 0, 0, 0, '2022-11-22 10:51:40', NULL, NULL),
(111, 'Dầu gội bưởi Milaganics', 'dau-goi-buoi-milaganics', 250000, 19, 25, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/om-new-version-dau-xa-buoi-phuc-hoi-toc-hu-ton-milaganics-260ml-chai-1_c4211f20708d4fb1ac6166e0ff0b3886.jpg', 0, 0, 0, 1, 0, 0, 'Milaganics mang đến sản phẩm Dầu Gội Bưởi với sự kết hợp độc đáo giữa tinh dầu vỏ bưởi – vốn nổi tiếng với công dụng giảm rụng tóc, hỗ trợ mọc tóc – các hoạt chất thiên nhiên, Keratin, Biotin cùng công nghệ sản xuất khoa học.', NULL, 0, 0, 0, '2022-11-22 10:52:24', NULL, NULL),
(112, 'Nature Republic Dầu gội đầu Argan Essential Deep Care Shampo', 'nature-republic-dau-goi-dau-argan-essential-deep-care-shampo', 214000, 19, 5, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/e21a3a65c302fcedacc34bb5296d152f_71b96c11198b44bdb214327c0953829e.jpg', 0, 0, 0, 1, 0, 0, 'Dầu gội phục hồi hư tổn Nature Republic Argan Essential Deep Care Shampoo là sự kết hợp các thành phần dưỡng chất chiết xuất từ tinh dầu tự nhiên giúp phục hồi mái tóc, cung cấp độ ẩm và dưỡng chất phục hồi tóc từ sâu bên trong. Đồng thời, dầu anh thảo và quả cây hoa hồng nuôi dưỡng tóc bóng khỏe, mượt mà. Cho bạn thêm tự tin với mái tóc chắc khỏe, bóng mượt và đầy sức sống.', NULL, 0, 0, 0, '2022-11-22 10:52:53', NULL, NULL),
(113, 'Nature Republic Xịt dưỡng tóc Argan Essential Hair No Wash Treatment 160ml', 'nature-republic-xit-duong-toc-argan-essential-hair-no-wash-treatment-160ml', 245000, 19, 5, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/mt-product-argan-treatmentpack-4_d671ded174ce4039b8dbdb21d2f0df9f.png', 0, 0, 0, 1, 0, 0, 'Xịt dưỡng tóc Nature Republic Argan Essential Essential Hair No Wash Treatment Pack là sản phẩm chăm sóc tóc với công thức độc đáo kết hợp giữa dầu Argan và nhiều loại dưỡng chất chiết xuất dâu tằm, nhân sâm, cam thảo..giúp tăng cường nuôi dưỡng và phục hồi tóc hư tổn , trả lại vẻ bóng khỏe, mượt mà đầy sức sống cho mái tóc.', NULL, 0, 0, 0, '2022-11-22 10:53:25', NULL, NULL),
(114, 'OGX Dầu gội heavenly hydration + cherry blossom shampoo 385ml', 'ogx-dau-goi-heavenly-hydration-cherry-blossom-shampoo-385ml', 230000, 19, 5, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/10_e6ba8e001b4c432ab764e01d1fe566aa.jpg', 0, 0, 0, 1, 0, 0, 'Dầu gội OGX Heavenly Hydration + Cherry Blossom Shampoo là dòng dầu gội thuộc thương hiệu OGX. Với hương thơm tự nhiên của hoa anh đào đánh thức các giác quan của bạn với mùi hương thơm ngát. Đồng thời, dầu gội không chỉ làm sạch các bụi bẩn bám trên tóc còn mang lại cho tóc được cấp ẩm, giảm dầu nhờn, giảm ngứa mang lại cho bạn một mái tóc ỏng ả.', NULL, 0, 0, 0, '2022-11-22 10:53:51', NULL, NULL),
(115, 'Dầu xả OGX Thick&full+biotin&collagen conditon 385ml', 'dau-xa-ogx-thickfullbiotincollagen-conditon-385ml', 750000, 19, 10, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/3_f900c3b9ec0045439ac6fea7d4761218.jpeg', 0, 0, 0, 1, 0, 0, 'Dầu xả OGXBiotin & Collagen Conditioner được dùng kết hợp với dầu gội Biotin giúp mang lại mái tóc chắc khỏe, ngăn ngừa rụng tóc hiệu quả. Với sự kết hợp của 2 thành phần chính biotin và collagen, dầu xả biotin cung cấp các dưỡng chất len lỏi vào từng sợi tóc bảo vệ tóc khỏi những tác nhân gây hại như môi trường ô nhiễm, bụi bẩn, nắng nóng.', NULL, 0, 0, 0, '2022-11-22 10:54:22', NULL, NULL),
(116, 'Kerasys Repairing Shampoo ( Trắng hồng ) 600ml', 'kerasys-repairing-shampoo-trang-hong-600ml', 230000, 19, 10, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/green-product-backdrop-with-design-space_7b1d26bb209643c5b1d034e26c961a83.jpg', 0, 0, 0, 1, 0, 0, 'Dầu gội Repairing Shampoo từ Kerasy – dòng sản phẩm dành cho tóc hư tổn và hỗ trợ phục hồi tóc hoàn toàn có thể dịu nhẹ với da đầu, lành tính với tóc và bổ sung dưỡng chất, giúp tóc bạn dần hồi phục và bóng mượt.', NULL, 0, 0, 0, '2022-11-22 10:55:10', NULL, NULL),
(117, 'Kem xả Dove giúp tóc bóng mượt hoa sen & dầu Jojoba Botanical Selection ( 500g)', 'kem-xa-dove-giup-toc-bong-muot-hoa-sen-dau-jojoba-botanical-selection-500g', 450000, 19, 10, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/dau-goi-dove-chiet-xuat-thao-moc-500g-5__1__535c6e761bd14ed891a51b874a05f7b2.jpg', 0, 0, 0, 1, 0, 0, 'Kem xả Dove giúp tóc bóng mượt hoa sen & dầu Jojoba Botanical Selection hòa quyện giữa tinh dầu thực vật cùng dầu Jojoba, chiết xuất hoa sen và nước gạo, mang lại cho bạn mái tóc óng ả, vào nếp thẳng mượt và không làm tóc khô rít.', NULL, 0, 0, 0, '2022-11-22 10:55:46', NULL, NULL),
(118, 'Loreal Dầu dưỡng tóc Elsseve Extraordinary Oil 100ml', 'loreal-dau-duong-toc-elsseve-extraordinary-oil-100ml', 450000, 19, 5, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/59399810_2289735964398163_7005470089344450560_n_e31d53ef71f749859382b383ba5b09f4.png', 0, 0, 0, 1, 0, 0, 'Dầu dưỡng tóc L\'Oréal Elsseve Extraordinary Oil có chứa dưỡng chất 6 loại dầu tự nhiên: dầu argan, hoa hồng, hoa sen, hoa hướng dương, hoa cúc và đậu nành, có công dụng rất tốt trong việc nuôi dưỡng tóc từ sâu bên trong, tóc sẽ chắc khỏe hơn, bồng bềnh và dễ vào nếp.', NULL, 0, 0, 0, '2022-11-22 10:56:24', NULL, NULL),
(119, 'Tsubaki Sữa Dưỡng Tóc Chống Nắng Hair Milk 100ml', 'tsubaki-sua-duong-toc-chong-nang-hair-milk-100ml', 650000, 19, 10, 0, 0, 'percent', 5, 'https://product.hstatic.net/200000551679/product/1c8a51cffe7505c3dd6d1a6cb83f2bd9_2a4140702f964ee4a5c95c905e90d080.jpg', 0, 0, 0, 1, 0, 0, 'Sữa dưỡng tóc chống nắng Tsubaki Hair Milk được ứng dụng công nghệ thẩm thấu độc quyền của Shiseido giúp dưỡng chất hấp thu nhanh và sâu vào trong lõi tóc, nuôi dưỡng cho mái tóc khỏe mạnh và bóng mượt như vừa được dưỡng tại Salon Nhật.', NULL, 0, 0, 0, '2022-11-22 10:56:59', NULL, NULL),
(120, 'Tsubaki Kem Xả Phục Hồi Hư Tổn Premium Repair Treatment 180g', 'tsubaki-kem-xa-phuc-hoi-hu-ton-premium-repair-treatment-180g', 1440000, 19, 5, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/4901872466313-content_e0dab2bf70d140adae3c5287dfbd6212.jpg', 0, 0, 0, 1, 0, 0, 'Kem xả phục hồi hư tổn Tsubaki Premium Repair Treatment giúp chăm sóc mái tóc hư tổn như tại các salon chuyên nghiệp tại Nhật Bản với công nghệ thẩm thấu CMC độc quyền của Shiseido giúp các dưỡng chất thấm vào vào tóc một cách triệt để, phục hồi mái tóc khỏe mạnh và mềm mượt.', NULL, 0, 0, 0, '2022-11-22 10:57:40', NULL, NULL),
(121, 'Avander Kem Ủ Tóc 125g', 'avander-kem-u-toc-125g', 50000, 19, 10, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/kem-u-toc-avander-125g-1_600f42087ff249448e53b428741f0ece.jpg', 0, 0, 0, 1, 0, 0, 'Kem ủ tóc Avander là dòng ủ tóc đến từ thương hiệu mỹ phẩm Avander của Việt Nam, được chiết xuất từ các thành phần tự nhiên, giúp bạn có tóc bồng bềnh, suôn mượt.\r\n\r\nKem ủ tóc Avander có 2 loại: \r\n\r\nKem ủ tóc Avander Thảo Mộc \r\nKem ủ tóc Avander Tinh Dầu Dừa', NULL, 0, 0, 0, '2022-11-22 10:58:14', NULL, NULL),
(122, 'Dầu xả Kumano salon link extra 1000ml', 'dau-xa-kumano-salon-link-extra-1000ml', 780000, 19, 5, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/salon-link-extra-conditioner-1000ml-1_11f7ab0c4e794868a97ec0b4854811d3.png', 0, 0, 0, 1, 0, 0, 'Dầu xả Kumano Salon Link Extra Conditioner giúp cung cấp protein và các Axit amin thấm sâu vào từng sợi tóc để nuôi dưỡng mái tóc, dưỡng ẩm và sửa chữa các tổn thương, phục hồi lại mái tóc chắc khỏe vốn có.', NULL, 0, 0, 0, '2022-11-22 10:58:42', NULL, NULL),
(123, 'Dầu xả Diane Perfect Beauty Extra Hair Fall Control Treatment 450', 'dau-xa-diane-perfect-beauty-extra-hair-fall-control-treatment-450', 190000, 19, 5, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/fr_f35394407345462eb8dc15a7023f8a97.jpg', 0, 0, 0, 1, 0, 0, 'Dầu xả Diane Perfect Beauty Extra Hair Fall Control Treatment với sự kết hợp giữa các thành phần tinh dầu thiên nhiên trong dầu gội (Wasabi, Organic Argan Oil, Lựu, Xoài, Hoa Anh Đào Nhật Bản) và công thức thẩm thấu - phục hồi độc quyền Protect Keratin từ Nhật Bản giúp duy trì độ ẩm, hỗ trợ và tăng cường thêm dưỡng chất nuôi dưỡng tóc từ gốc đến ngọn, giúp mái tóc yếu trở nên chắc khỏe.', NULL, 0, 0, 0, '2022-11-22 10:59:25', NULL, NULL),
(124, 'Dầu gội & xả Pantene Pro-V Classic Clean 2IN1 Shamppo & Conditioner', 'dau-goi-xa-pantene-pro-v-classic-clean-2in1-shamppo-conditioner', 152200, 19, 10, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/concept_ff612068ea974382974372a54886bb44.jpg', 0, 0, 0, 1, 0, 0, 'Dầu Gội & Xả 2in1 Pantene Pro-V Classic Clean 2IN1 Shamppo & Conditioner nhập khẩu từ Mỹ, nuôi dưỡng và bảo vệ tóc chắc khỏe, tiện lợi chỉ sau 1 bước Gội và Xả kết hợp, dành cho mọi loại tóc.', NULL, 0, 0, 0, '2022-11-22 11:33:26', NULL, NULL),
(125, 'Dầu gội hạt Cafe CoCayHoaLa 300g', 'dau-goi-hat-cafe-cocayhoala-300g', 220000, 19, 5, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/5593be15ad1bab5dc5878b379a22c1c5_12be0e0e49354597a27a4b4953c260af.jpg', 0, 0, 0, 1, 0, 0, 'Dầu gội hạt Cafe CoCayHoaLa chiết xuất chính từ cà phê giúp làm sạch da đầu và cuốn trôi đi các bụi bẩn gàu. Thúc đẩy quá trình mọc tóc, giúp tóc trở nên trở nên chắc khỏe, mềm mại, bồng bềnh ngay lần gội đầu tiên.', NULL, 0, 0, 0, '2022-11-22 11:34:14', NULL, NULL),
(126, 'Dầu xả Tresemme Salon Detox Gừng và Trà xanh giúp tóc chắc khỏe (620g)', 'dau-xa-tresemme-salon-detox-gung-va-tra-xanh-giup-toc-chac-khoe-620g', 167000, 19, 10, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/dau-goi-xa-tresemme-gung-tra-xan__3__aa0bb9762f27457dbba0c6a59b4e4a0e.jpg', 0, 0, 0, 1, 0, 0, 'Dầu xả TRESemmé Salon Detox Gừng và Trà xanh nói không với Parabens và chất tạo màu, thành phần tự nhiên gồm Gừng - giúp làm dịu, kháng khuẩn và Trà Xanh giúp chống oxy hóa, sẽ Detox và nuôi dưỡng để trả lại vẻ đẹp chắc khoẻ tự nhiên cho mái tóc cùng cảm giác thư thái khi gội, mùi hương sang trọng cả ngày dài.', NULL, 0, 0, 0, '2022-11-22 11:34:45', NULL, NULL),
(127, 'Dầu xảTresemme Keratin Smooth tinh chất Argan và Keratin vào nếp suôn mượt (620g)', 'dau-xatresemme-keratin-smooth-tinh-chat-argan-va-keratin-vao-nep-suon-muot-620g', 165000, 19, 10, 0, 0, 'percent', 5, 'https://product.hstatic.net/200000551679/product/279442844_5426695270683864_3111212230688909801_n_44b59b4561604b50bb41465e3745eb17.jpg', 0, 0, 0, 1, 0, 0, 'Dầu xả TRESemmé Keratin Smooth tinh chất Argan và Keratin vào nếp suôn mượt dành cho tóc khô xơ, không vào nếp, với công thức chứa Tinh dầu Argan từ vùng Morocco quí hiếm cùng keratin và giúp bổ sung keratin và nhẹ nhàng làm sạch tóc, cho mái tóc 5 hiệu quả sau 1 lần sử dụng: Tóc vào nếp - bóng mượt - mềm mại - giảm xơ - gỡ rối.', NULL, 0, 0, 0, '2022-11-22 11:35:28', NULL, NULL),
(128, 'Tsubaki Dầu Gội Dưỡng Tóc Bóng Mượt Premium Moist Sampoo 490ml', 'tsubaki-dau-goi-duong-toc-bong-muot-premium-moist-sampoo-490ml', 1450000, 19, 10, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/dau-goi-tsubaki-premium-moist-1_86d33f4546ec48bfadb65cae231fcf18.jpg', 0, 0, 0, 1, 0, 0, 'Dầu gội Tsubaki Premium Moist Shampoo được thiết kế dành cho những mái tóc khô xơ và thiếu độ bóng mượt, giúp làm sạch nhẹ nhàng và chăm sóc da đầu, đồng thời cung cấp độ ẩm và duy trì sự bóng mượt từ gốc đến ngọn, sửa chữa tóc khô ngay từ trong lõi.', NULL, 0, 0, 0, '2022-11-22 11:36:04', NULL, NULL),
(129, 'Weilaiya Dầu xả Zingiber Officinale Juice Repairement Hair', 'weilaiya-dau-xa-zingiber-officinale-juice-repairement-hair', 290000, 19, 20, 0, 0, 'percent', 2, 'https://product.hstatic.net/200000551679/product/da009ad3878c70d2299d_3a402ca341a_be7ed0a21d184ecab57d25c1fb26351f.png', 0, 0, 0, 1, 0, 0, 'Dầu xả gừng hà thủ ô Weilaiya giúp tóc mềm mượt và mang hương nước hoa từ Givaudan cho hương thơm nồng nàn, quyến rũ. Kết hợp dầu xả cùng dầu gội gừng hà thủ ô của Weilaiya giúp tối ưu khả năng nuôi dưỡng và kích mọc tóc.', NULL, 0, 0, 0, '2022-11-22 11:36:32', NULL, NULL),
(132, 'OGX Dầu xả Straightening + Brazilian Keratin Therapy 385ml', 'ogx-dau-xa-straightening-brazilian-keratin-therapy-385ml', 231000, 19, 5, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/5_ad34e1453aa84daabd835b0979ce0541.jpg', 0, 0, 0, 1, 0, 0, 'Dầu xả OGX Ever Straightening + Brazilian Keratin Therapy Conditioner được thiết kế dành cho mái tóc uốn hoặc tóc xoăn tự nhiên giúp dưỡng ẩm và cung cấp nguồn dưỡng chất tuyệt vời cho mái tóc trở nên vào nếp suôn mượt và chắc khỏe hơn.Hỗ trợ bảo vệ tóc khỏi các tác nhân tổn thương, đảm bảo độ hoàn thiện cho cấu trúc tóc, cho mái tóc xoăn hoặc gợn sóng luôn vào nếp.', NULL, 0, 0, 0, '2022-11-22 11:38:06', NULL, NULL),
(133, 'OGX Dầu xả Renewing + Argan Oil Of Morocco 385ml', 'ogx-dau-xa-renewing-argan-oil-of-morocco-385ml', 230000, 19, 5, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/dau_goi_ogx_argan_oil_of_morocco_3c3462d93d044906950f6ca7b1812be3.jpg', 0, 0, 0, 1, 0, 0, 'Dầu xả OGX Renewing Argan Oil Of Morocco chiết xuất từ tinh dầu Argan đến từ Morocco để chăm sóc những mái tóc khô xơ, hư tổn và chẻ ngọn. Từ đó mái tóc bạn sẽ trở nên mềm mại, mượt mà và khắc phục được những hư tổn từ gốc đến ngọn.', NULL, 0, 0, 0, '2022-11-22 11:38:30', NULL, NULL),
(134, 'Cyrus Parfums Nước hoa nam Aviator Flyback Edition 100ml', 'cyrus-parfums-nuoc-hoa-nam-aviator-flyback-edition-100ml', 1200000, 26, 10, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/fe_019e545a092f4fbb8c763e0a8d46d2d7.jpg', 0, 0, 0, 1, 0, 0, 'Nước hoa nam Cyrus Parfums Aviator Flyback Edition cuốn hút mãnh liệt chính bởi mùi hương mạnh mẽ và tinh tế, mang đến ấn tượng vô cùng sâu sắc như chính phẩm chất của một quý ông đầy nam tính.', NULL, 0, 0, 0, '2022-11-22 11:43:15', NULL, NULL),
(135, 'Cyrus Parfums Nước hoa nam Space Time Quantum 90ml', 'cyrus-parfums-nuoc-hoa-nam-space-time-quantum-90ml', 1155500, 26, 10, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/space-time-paris-bleu_ambiance_34597e00d56343df836292087dbf2d14.jpg', 0, 0, 0, 1, 0, 0, 'Nước hoa nam Cyrus Parfums Space Time Quantum đã tạo ra Space Time Quantum dành cho những người đàn ông háo hức với những cuộc phiêu lưu và khám phá. Space Time Quantum tôn vinh người đàn ông đam mê và tò mò, người luôn mong muốn đi xa hơn và mạnh mẽ hơn.', NULL, 0, 0, 0, '2022-11-22 11:43:49', NULL, NULL),
(136, 'Paris Bleu Parfums Nước hoa nam Diplomate Pour Legend 100ml', 'paris-bleu-parfums-nuoc-hoa-nam-diplomate-pour-legend-100ml', 1260000, 26, 5, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/gr_3bbb0d2182c841acbdefda48083340ad.jpg', 0, 0, 0, 1, 0, 0, 'Nước hoa nam Paris Bleu Parfums Diplomate Pour Legend là mùi hương của một doanh nhân thành đạt, một người hành động nhất quán theo định hướng, tin ở bản thân và là người luôn thành công. Vì thế nước hoa của họ cũng phải đậm chất nam tính, tràn đầy phong thái tự tin trong từng nốt hương.', NULL, 0, 0, 0, '2022-11-22 11:44:36', NULL, NULL),
(137, 'Paris Bleu Parfums Nước hoa nữ Diplomate Pour Femme 100ml', 'paris-bleu-parfums-nuoc-hoa-nu-diplomate-pour-femme-100ml', 1235000, 26, 10, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/277529445_3185234871699503_1907721672233538796_n_29a7d21f2819431a88efeb069db967b7.jpg', 0, 0, 0, 1, 0, 0, 'Nước hoa nữ Paris Bleu Parfums Diplomate Pour Femme là chai nước hoa dành cho người phụ nữ hiện đại, thích sự đơn giản, phá cách, đánh thức tinh thần tự do nhưng vẫn vô cùng nữ tính và gợi cảm.', NULL, 0, 0, 0, '2022-11-22 11:45:01', NULL, NULL),
(138, 'Paris Bleu Parfums Nước hoa nữ Elmira 100ml', 'paris-bleu-parfums-nuoc-hoa-nu-elmira-100ml', 1532000, 26, 10, 0, 0, 'percent', 5, 'https://product.hstatic.net/200000551679/product/vd_bfa913aa23ef41b9854bc70a0a85b3ee.jpg', 0, 0, 0, 1, 0, 0, 'Nước hoa nữ Paris Bleu Parfums Elmira dành cho những cô gái luôn lạc quan, tươi vui với tình yêu cuộc sống mãnh liêt. Sự tươi tắn và nét trẻ trung được thể hiện đầy sống động qua các tầng hương không chỉ mang đến năng lượng tích cực cho chính cô mà còn lan tỏa đến những người xung quanh.', NULL, 0, 0, 0, '2022-11-22 11:45:35', NULL, NULL),
(139, 'Paris Bleu Parfums Nước hoa nữ Mon Parnasse 105ml', 'paris-bleu-parfums-nuoc-hoa-nu-mon-parnasse-105ml', 980000, 26, 20, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/274180723_3152020165020974_7539845550853692574_n_c90c5af6218341d08e40a550527b4fba.jpg', 0, 0, 0, 1, 0, 0, 'Nước hoa nữ Paris Bleu Parfums Mon Parnasse làm xao xuyến mọi trái tim ngay tầng hương đầu tiên bởi sự quyến rũ rất riêng từ việc pha trộn ngẫu hứng nhưng đáng yêu với thành phần chính từ hương trái lê, trái nho và hạt dẻ cười.', NULL, 0, 0, 0, '2022-11-22 11:46:03', NULL, NULL),
(140, 'Pinker Bell Korea Nước hoa Perfume Holic', 'pinker-bell-korea-nuoc-hoa-perfume-holic', 270000, 26, 20, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/nuoc-hoa-pinker-bell-korea-1014612_00d2dbe609754d2db8d6d2267ce083ba.jpg', 0, 0, 0, 1, 0, 0, 'Nước hoa Perfume Holic Pinker Bell Korea là nước hoa thuộc thương hiệu nước hoa hàng đầu Hàn Quốc, là siêu phẩm mùi hương không thể thiếu cho các mùa lễ hội, chỉ cần xịt một chút thôi cơ thể thêm ngọt ngào và khác biệt là đã đủ để bạn khởi động một ngày mới.', NULL, 0, 0, 0, '2022-11-22 11:46:45', NULL, NULL),
(141, 'Sistelle Paris Nước hoa nữ Mondaine 95ml', 'sistelle-paris-nuoc-hoa-nu-mondaine-95ml', 450000, 26, 20, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/294871938_3269233173299672_125195667007301849_n_a922a8b22afd43f28d7b55c24da9da02.jpg', 0, 0, 0, 1, 0, 0, 'Nước hoa nữ Sistelle Paris Mondaine với thiết kế đơn giản nhưng lại vô cùng tinh tế khi kết hợp về màu sắc và hình dáng một cách cân bằng, hoàn hảo giữa vẻ thanh lịch của truyền thống với vẻ mạnh mẽ của hiện đại.', NULL, 0, 0, 0, '2022-11-22 11:47:17', NULL, NULL),
(142, 'Sistelle Paris Nước hoa nữ Nuptia Passion 100ml', 'sistelle-paris-nuoc-hoa-nu-nuptia-passion-100ml', 1155000, 26, 30, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/duvfb_3b6be0c523bd48309c129d5bd427be11.jpg', 0, 0, 0, 1, 0, 0, 'Nước hoa nữ Sistelle Paris Nuptia Passion mang trong mình câu chuyện về các loài hoa quý phương Đông với hương thơm quyến rũ, bí ẩn và vô cùng thơ mộng, một âm hưởng tươi mới, sẽ làm bạn thấy bất ngờ bởi mùi hương hoàn toàn mới lạ, quyến rũ, yêu kiều khó thể rời đi.', NULL, 0, 0, 0, '2022-11-22 11:47:45', NULL, NULL),
(143, 'Sistelle Paris Nước hoa nữ Red Pearl 100ml', 'sistelle-paris-nuoc-hoa-nu-red-pearl-100ml', 1320000, 26, 15, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/red_1_19cb85b81dd34d069a035e7f50_a5ec861b19434e60a064beb00f41ca75.png', 0, 0, 0, 1, 0, 0, 'Nước hoa nữ Sistelle Paris Red Pearl ấn tượng với màu vàng mật ong quyến rũ như một viên kẹo ngọt hòa cùng những đường nét vô cùng tinh tế từ thân đến nắp chai tạo nên nét nữ tính, lôi cuốn, hấp dẫn như chính mùi hương của nó mang lại.', NULL, 0, 0, 0, '2022-11-22 11:48:07', NULL, NULL),
(144, 'Verites Nước hoa', 'verites-nuoc-hoa', 152000, 26, 10, 0, 0, 'percent', 5, 'https://product.hstatic.net/200000551679/product/1_3f2807c162b948a7ba4871f7abc51e36.jpg', 0, 0, 0, 1, 0, 0, 'Nước hoa Verites lấy cảm hứng từ những mùi hương kinh điển trên thế giới, nước hoa Verites tái tạo lại các tầng hương một cách chân thực bởi nhà hương 150 tuổi tại Pháp. Khoác lên mình một mùi hương đặc biệt là “bí thuật” để thăng hạng khí chất bản thân thêm vẹn toàn.', NULL, 0, 0, 0, '2022-11-22 11:48:36', NULL, NULL),
(145, 'Yves De Sistelle Parfums Nước hoa nữ Galice Sensuelle 100ml', 'yves-de-sistelle-parfums-nuoc-hoa-nu-galice-sensuelle-100ml', 1020000, 26, 10, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/9e6b5fdebb725e3d31624cc9b2e520e7_64da502c8ee54fbc97e27f06e0a5c8ba.jpg', 0, 0, 0, 1, 0, 0, 'Nước hoa nữ Yves De Sistelle Parfums Galice Sensuelle được ví như một cô nàng Paris chính hiệu – thanh lịch và quyến rũ. Hương hoa phương Đông tinh tế đầy chiều sâu tạo nên nét lôi cuốn vô cùng khó tả. Hương thơm từ Galice như mang cả ánh bình minh ngát hương từ những cánh đồng hoa trải dài khắp miền Nam nước Pháp đến bên bạn.', NULL, 0, 0, 0, '2022-11-22 11:49:02', NULL, NULL),
(146, 'Yves De Sistelle Parfums Nước hoa nữ Joli Rêve 100ml', 'yves-de-sistelle-parfums-nuoc-hoa-nu-joli-reve-100ml', 650000, 26, 12, 0, 0, 'percent', 2, 'https://product.hstatic.net/200000551679/product/29542707_1574042195998488_1909973013858151990_n_3b2b21eab1aa47aba715fc3402729aa1.png', 0, 0, 0, 1, 0, 0, 'Nước hoa nữ Yves De Sistelle Parfums Joli – Rêve lấy cảm hứng từ hình ảnh người con gái đứng giữa cánh đồng hoa violet, màu tím dịu dàng cùng hương thơm thanh khiết khiến vẻ đẹp của nàng càng thêm gợi cảm và rạng rỡ.', NULL, 11, 0, 29, '2022-11-22 11:49:30', NULL, NULL),
(147, 'Bio-essence Sữa rửa mặt Bio White Pro Whitening Cleanser (100g)', 'bio-essence-sua-rua-mat-bio-white-pro-whitening-cleanser-100g', 122500, 12, 5, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/3a7943450a33248c62327c1795de96f2_cac20a4450034701897f1d8a2f02eaf2.jpg', 0, 0, 0, 1, 0, 0, 'Sữa rửa mặt Bio-essence Bio White Pro Whitening Cleanser với công thức nhẹ nhàng giúp loại bỏ bụi bẩn và tạp chất trên da cùng với các thành phần dưỡng trắng chuyên sâu và dưỡng ẩm như chiết xuất vỏ cây Tanaka và chiết xuất hoa trà Nhật Bản giúp làn da trở nên ẩm mịn và sáng hồng rạng rỡ.', NULL, 0, 0, 0, '2022-11-24 09:46:18', NULL, NULL),
(148, 'Gel rửa mặt Eucerin Acne-Oil Control Pro Acne Solution Cleasing Gel 200ml', 'gel-rua-mat-eucerin-acne-oil-control-pro-acne-solution-cleasing-gel-200ml', 332000, 12, 5, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/gel-rua-mat-eucerin-cho-da-dau-mun-2.jpg_1c24e379e8934c5bb46ba39bda10188b.png', 0, 0, 0, 1, 0, 0, 'Sữa rửa mặt Eucerin ProAcne Solution Cleansing Gel là gel tẩy trang và rửa mặt hàng ngày không chứa xà phòng và hương liệu. Giúp loại bỏ bã nhờn dư thừa và làm sạch bụi bẩn trên da. Ngăn ngừa vi khuẩn giúp da khoẻ và sạch hơn.', NULL, 0, 0, 0, '2022-11-24 09:52:21', NULL, NULL),
(149, 'Kumano Sữa rửa mặt Hatomugi Tạo Bọt Moisturizing & Facial Washing 160ml', 'kumano-sua-rua-mat-hatomugi-tao-bot-moisturizing-facial-washing-160ml', 126000, 12, 999, 0, 0, 'percent', 10, 'https://product.hstatic.net/200000551679/product/301655941_132080409537469_4186523111481415638_n_8c37f31b6224488a926517dcfb4e76b5.jpg', 0, 0, 0, 1, 0, 0, 'Sữa rửa mặt Hatomugi tạo bọt Moisturizing & Facial Washing với tác dụng làm sạch sâu, dưỡng ẩm, làm sáng và làm dịu da nhờ chứa các thành phần chiết xuất tự nhiên có tác dụng cải thiện làn da khô sần sùi, sỉn màu hiệu quả.', NULL, 0, 0, 0, '2022-11-24 10:02:23', NULL, NULL),
(150, 'Cetaphil Sữa Rửa Mặt Gentle Skin Cleanser 500ml', 'cetaphil-sua-rua-mat-gentle-skin-cleanser-500ml', 235000, 12, 20, 0, 0, 'percent', 10, 'https://product.hstatic.net/200000551679/product/rtyh_1882f9118558420ca49891a7ea6dc318.jpg', 0, 0, 0, 1, 0, 0, 'Sữa rửa mặt Cetaphil Gentle Skin Cleanser được chứng minh lâm sàng có khả năng làm sạch sâu, loại bỏ hoàn toàn bụi bẩn, và tạp chất trên da một cách dịu nhẹ nhưng vẫn duy trì độ ẩm tự nhiên để bảo vệ da khỏi tình trạng khô ráp, sản phẩm với công thức lành tính không gây kích ứng sẽ an toàn cho mọi loại da, kể ca da nhạy cảm.', NULL, 0, 0, 0, '2022-11-24 10:03:17', NULL, NULL),
(151, 'Kumano Hatomugi Cleansing & Facial Washing The W Cleansing Foam 130g', 'kumano-hatomugi-cleansing-facial-washing-the-w-cleansing-foam-130g', 65000, 12, 25, 0, 0, 'percent', 5, 'https://product.hstatic.net/200000551679/product/sua-rua-mat-tay-trang-hatomugi-chiet-xuat-y-di-sang-da-130g_acd5f8daea5a4512b5de660797595259.jpg', 0, 0, 0, 1, 0, 0, 'Sữa rửa mặt Kumano Hatomugi W Cleansing Foam với thành phần chính từ chiết xuất hạt ý dĩ hay, không chỉ làm sạch bụi bẩn và vi khuẩn trên da, mà còn chăm sóc nhẹ dịu, cấp ẩm cho da mịn màng, dưỡng da săn chắc, sáng mịn.', NULL, 0, 0, 0, '2022-11-24 10:04:26', NULL, NULL),
(152, 'Avander Sữa rửa mặt thảo mộc 100g', 'avander-sua-rua-mat-thao-moc-100g', 67000, 12, 50, 0, 0, 'percent', 10, 'https://product.hstatic.net/200000551679/product/sua-rua-mat-avander-100g-2_19b0fa2b8b4943589ef13d6b0460603a.jpg', 0, 0, 0, 1, 0, 0, 'Sữa rửa mặt thảo mộc Avander là sản phẩm sữa rửa mặt dành cho làn da dầu, hỗn hợp và mụn trứng cá. Công thức chứa chiết xuất từ hơn 11 loại Thảo mộc và Salicylic Acid giúp làm sạch sâu, loại bỏ bụi bẩn, dầu thừa và ngăn ngừa mụn hiệu quả.', NULL, 0, 0, 0, '2022-11-24 10:05:06', NULL, NULL),
(153, 'Some By Mi Sữa rửa mặt Bye Bye Blackhead 30 Days Miracle Green Tea Tox Bubble Cleanser 120g', 'some-by-mi-sua-rua-mat-bye-bye-blackhead-30-days-miracle-green-tea-tox-bubble-cleanser-120g', 270000, 12, 56, 0, 0, 'percent', 6, 'https://product.hstatic.net/200000551679/product/vuong-03-03__4__f0a6e0f316584cefaf905885853478a8.png', 0, 0, 0, 1, 0, 0, 'Sữa rửa mặt sủi bọt Some By Mi Bye Bye Blackhead 30 Days Miracle Green Tea Tox Bubble Cleanser là sữa rửa mặt làm sạch sâu làn da chỉ trong vòng 5 phút, giúp làm mềm và loại bỏ các tạp chất như bụi bẩn hay bã nhờn nằm sâu bên trong lỗ chân lông, hỗ trợ loại bỏ mụn đầu đen và mụn đầu trắng, mang lại cho bạn làn da sạch thoáng mịn màng.', NULL, 0, 0, 0, '2022-11-24 10:06:34', NULL, NULL),
(154, 'Some By Mi Sữa rửa mặt AHA-BHA-PHA 30 Days Miracle Acne Clear Foam 100ml', 'some-by-mi-sua-rua-mat-aha-bha-pha-30-days-miracle-acne-clear-foam-100ml', 217000, 12, 0, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/192871825_1114878548994614_318407447547548268_n_843f8139a930407a8f992317f3cc022d.jpg', 0, 0, 0, 1, 0, 0, 'Sữa rửa mặt Some By Mi 30 Days Miracle Acne Clear Foam với công thức đặc biệt chứa phức hợp AHA – BHA – PHA hỗ trợ làm sạch tận sâu lỗ chân lông, lấy đi hết bụi bẩn, bã nhờn cho làn da thông thoáng không còn bí tắc, nhưng vẫn nhẹ dịu không gây kích ứng hay khô căng da, làm giảm mụn trứng cá hiệu quả.', NULL, 0, 0, 0, '2022-11-24 10:08:10', NULL, NULL),
(157, 'Senka Perfect Whip N_Tạo bọt 120g', 'senka-perfect-whip-n-tao-bot-120g', 76000, 12, 10, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/bo-doi-senka-nuoc-tay-trang-sua_a7ccf1e234c649c6873fc13e02aec8bd.jpg', 0, 0, 0, 1, 0, 0, 'Sữa rửa mặt tạo bọt Senka Perfect Whip Facial Foam Wash với lớp bọt tơ tằm trắng bông mịn giúp làm sạch sâu lỗ chân lông, kết hợp cùng công nghệ Aqua in Pool độc quyền sẽ mang lại cho bạn một làn da sạch hoàn hảo nhưng vẫn ẩm mịn tự nhiên, không gây cảm giác khô căng.', NULL, 0, 0, 0, '2022-11-24 10:10:02', NULL, NULL),
(158, 'Loreal Sữa rửa mặt Aura Perfect Milky Foam 50ml', 'loreal-sua-rua-mat-aura-perfect-milky-foam-50ml', 41200, 12, 50, 0, 0, 'percent', 10, 'https://product.hstatic.net/200000551679/product/8d77c5b329cb2b3f4fbd3645696b9826_84e6b84062c34baca36eb955c16c22d8.jpg', 0, 0, 0, 1, 0, 0, 'Sữa rửa mặt L\'Oréal Aura Perfect Milky Foam với thành phần tinh thể đá quý Tourmaline và Vitamin C được nghiên cứu giúp làm dịu và ngăn ngừa hắc tố melanin là nguyên nhân chính gây sạm da, nuôi dưỡng da khỏe mạnh và sáng bóng, sản phẩm là bước khởi đầu hoàn hảo cho quá trình dưỡng da sáng mịn của bạn.', NULL, 0, 0, 0, '2022-11-24 10:11:00', NULL, NULL),
(161, 'Hadalabo Bọt rửa mặt Gokujyun Moisturizing Foaming Wash 160ml', 'hadalabo-bot-rua-mat-gokujyun-moisturizing-foaming-wash-160ml', 210000, 12, 10, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/89ab6cab3ad794ce66f75460345de5c7_72cf68953f7847d5a5719e0db811f960.jpg', 0, 0, 0, 1, 0, 0, 'Sữa rửa mặt tạo bọt Hada Labo Gokujyun Moisturizing Foaming Wash là sửa rửa mặt thuộc thương hiệu Hadalabo với thiết kế dạng tạo bọt độc đáo cho lớp bọt bông mềm mịn như mây, kết hợp cùng các thành phần dưỡng ẩm sẽ giúp làm sạch sâu da mà không hề khô căng, mang đến cho bạn một làn da mềm mại và ẩm mượt sau khi rửa mặt.', NULL, 0, 0, 0, '2022-11-24 10:12:58', NULL, NULL),
(162, 'By Wishtrend Sữa rửa mặt Green tea & Enzyme Powder Wash 70g', 'by-wishtrend-sua-rua-mat-green-tea-enzyme-powder-wash-70g', 250000, 12, 20, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/hinh_concept_3c9c88e9b2ac4dd7b1303546e903d6ed.png', 0, 0, 0, 1, 0, 0, 'Sữa rửa mặt By Wishtrend Green Tea & Enzyme Powder Wash dạng bột có độ pH thấp và có tác dụng đi kèm giúp tẩy tế bào chết. Có hiệu quả làm sạch và làm dịu da đảm bảo mang lại cảm giác sảng khoái khi sử dụng.', NULL, 0, 0, 0, '2022-11-24 10:13:45', NULL, NULL),
(163, 'Bioderma Sữa rửa mặt Sebium Gel Moussant', 'bioderma-sua-rua-mat-sebium-gel-moussant', 365000, 12, 10, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/oke_f73ea9c988404a7e9134f820b603aaac.png', 0, 0, 0, 1, 0, 0, 'Gel rửa mặt tạo bọt Bioderma Sébium Gel Moussant dành cho da nhờn, da mụn và da hỗn hợp, giúp làm sạch nhẹ nhàng, kháng khuẩn, ngăn ngừa mụn và bít tắc lỗ chân lông. Không gây khô da, mang lại cảm giác dễ chịu sau khi dùng.', NULL, 0, 0, 0, '2022-11-24 10:14:29', NULL, NULL),
(164, '9 Wishes Sữa rửa mặt Rice Foaming Cleanser 120ml', '9-wishes-sua-rua-mat-rice-foaming-cleanser-120ml', 237000, 12, 25, 0, 0, 'percent', 10, 'https://product.hstatic.net/200000551679/product/1-03__15__0e15d97579214ab6b1f4077f56064c96.png', 0, 0, 0, 1, 0, 0, 'Sữa rửa mặt 9 Wishes Rice Foaming Cleanser là sản phẩm sữa rửa mặt dành cho những nàng có làn da khô, xỉn màu. Với chiết xuất từ gạo có khả năng làm sạch, loại bỏ bụi bẩn và các tế bào da chết trên da, đồng thời có khả năng cung cấp độ ẩm cần thiết, chống lại tình trạng da bị khô căng sau khi sử dụng.', NULL, 0, 0, 0, '2022-11-24 10:15:07', NULL, NULL),
(165, 'Vichy Sữa Rửa Mặt Normaderm Phytosolution Intensive Purifying Gel', 'vichy-sua-rua-mat-normaderm-phytosolution-intensive-purifying-gel', 307000, 12, 50, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/derm-phytosolution-intensive-purifying-gel-200-ml-21900207-4-container_2d0358c614f844c8ad32fce5cb258ce7.jpg', 0, 0, 0, 1, 0, 0, 'Sữa rửa mặt Vichy Normaderm Phytosolution Intensive Purifying Gel với công thức chứa nước khoáng Vichy và các thành phần giúp làm giảm mụn như Zinc oxide, Copper, Salicylic acid, Bifidus Probiotics... giúp làm sạch sâu làn da và hỗ trợ giảm mụn đầu đen, mụn sưng viêm, điều tiết bã nhờn hiệu quả.', NULL, 0, 0, 0, '2022-11-24 10:15:37', NULL, NULL),
(166, 'Sửa rửa mặt kiểm soát dầu Himalaya Oil Control Lemon Face Wash (150ml)', 'sua-rua-mat-kiem-soat-dau-himalaya-oil-control-lemon-face-wash-150ml', 104200, 12, 10, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/8901138822453-content2_a49d46db468b4fadbb11957de921a2d5.jpg', 0, 0, 0, 1, 0, 0, 'Sữa rửa mặt kiểm soát dầu Himalaya Oil Control Lemon Face Wash đặc biệt phù hợp với da dầu và lỗ chân lông to, giúp kiểm soát loại bỏ dầu thừa và thu nhỏ lỗ chân lông hiệu quả.', NULL, 0, 0, 0, '2022-11-24 10:16:21', NULL, NULL),
(167, 'Sữa Rửa Mặt Bùn Biển Trị Mụn Rosette Face Wash Pasta Acne Clear 120g', 'sua-rua-mat-bun-bien-tri-mun-rosette-face-wash-pasta-acne-clear-120g', 125000, 12, 50, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/c26d67ee8b89ab67552f3f8112ce9c69_2fa6c0f84aec4637aca4fe24c84a6e44.jpg', 0, 0, 0, 1, 0, 0, 'Sữa rửa mặt bùn biển trị mụn Rosette Face Wash Pasta Acne Clear được chiết xuất từ các thành phần tự nhiên như: đất sét và bùn biển…có khả năng làm sạch sâu lỗ chân lông, loại bỏ đi bụi bẩn và bã nhờn hiệu quả. Sản phẩm  lành tính, an toàn, dịu nhẹ, không sử dụng chất tạo mùi, phẩm màu nhân tạo và dầu khoáng.', NULL, 0, 0, 0, '2022-11-24 10:17:22', NULL, NULL),
(168, 'Sữa rửa mặt 8 loại trà BOM Eight Tea Cleasing Foam', 'sua-rua-mat-8-loai-tra-bom-eight-tea-cleasing-foam', 307000, 12, 50, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/16.2_340fbb5cf44e479b96e5711a11a3f6d6.jpg', 0, 0, 0, 1, 0, 0, 'Sữa rửa mặt B.O.M Eight Tea Cleansing Foam 8 loại trà với mùi hương nhẹ nhàng dễ chịu từ các thành phần tự nhiên cùng công thức tạo bọt siêu mềm mịn giúp lấy đi lớp bụi bẩn và làm sạch lớp tẩy trang. Sản phẩm được nghiên cứu an toàn cho cả làn da nhạy cảm nên không hề gây ra cảm giác châm chích, rát da, đồng thời sản phẩm còn giúp mang lại độ pH cân bằng 5.5 cho da mà không phải sản phẩm sữa rửa mặt nào cũng có được.', NULL, 0, 0, 0, '2022-11-24 10:20:38', NULL, NULL),
(169, 'Some By Mi Sữa rửa mặt Snail Truecica Miracle Repair Low PH Gel Cleanser 100ml', 'some-by-mi-sua-rua-mat-snail-truecica-miracle-repair-low-ph-gel-cleanser-100ml', 217000, 12, 20, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/vuong-03-02__6__b009b7d2086f446d897a5d7d91c781ca.png', 0, 0, 0, 1, 0, 0, 'Sữa rửa mặt Some By Mi Snail Truecica Miracle Repair Low PH Gel Cleanser cân bằng dịu nhẹ với da, kết hợp cùng thành phần chiết xuất Ốc Sên Đen và Truecica đặc trưng, giúp làm sạch da nhẹ nhàng đồng thời hỗ trợ tái tạo, phục hồi làn da khỏe mạnh', NULL, 0, 0, 0, '2022-11-24 10:21:29', NULL, NULL),
(170, 'Skin1004 Sữa rửa mặt Madagascar Centella Ampoule Foam 125ml', 'skin1004-sua-rua-mat-madagascar-centella-ampoule-foam-125ml', 251000, 12, 125, 0, 0, 'percent', 25, 'https://product.hstatic.net/200000551679/product/1-05__9__17ce75ef0c22467fa15aa94240efb1ca.png', 0, 0, 0, 1, 0, 0, 'Sữa rửa mặt Skin1004 Madagascar Centella Ampoule Foam với lớp bọt mềm mịn giúp lấy sạch bụi bẩn, bã nhờn, dầu thừa từ sâu lỗ chân lông. Sữa rửa mặt giúp làm sạch da mà không làm da mất nước, lưu giữ được độ ẩm mịn, mềm mại trên da. Với độ pH chuẩn 5.5,bảo vệ lớp màng tế bào mỗi ngày với công thức an toàn, hỗ trợ điều trị mụn tốt hơn.', NULL, 1, 0, 2, '2022-11-24 10:22:59', NULL, NULL),
(171, 'Some By Mi Sữa rửa mặt Super Matcha Pore Clean Cleansing Gel 100ml', 'some-by-mi-sua-rua-mat-super-matcha-pore-clean-cleansing-gel-100ml', 265000, 12, 20, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/vuong-03-03__7__1f02cee954dc4bbdb24febe338c8bc37.png', 0, 0, 0, 1, 0, 0, 'Sữa rửa mặt Some By Mi Super Matcha Pore Cleansing Gel với chiết xuất chính từ 62% nước Matcha, BHA có nguồn gốc tự nhiên giúp làm sạch, hỗ trợ loại bỏ tế bào chết nhẹ nhàng mà không gây tình trạng khô căng cho làn da.', NULL, 0, 0, 0, '2022-11-24 10:24:34', NULL, NULL),
(172, 'Sữa rửa mặt Dove Beauty Serum Facial Cleansing Mousse For Bright and Radiant Skin 160ml', 'sua-rua-mat-dove-beauty-serum-facial-cleansing-mousse-for-bright-and-radiant-skin-160ml', 125500, 12, 125, 0, 0, 'percent', 2, 'https://product.hstatic.net/200000551679/product/tr_9f2a0e7fbc014e469ebbc2c9a93fa76c.jpg', 0, 0, 0, 1, 0, 0, 'Sữa rửa mặt Dove Beauty Serum Facial Cleansing Mousse For Bright and Radiant với kết cấu dạng bọt mịn giúp loại bỏ bụi bẩn, bã nhờn và cấp ẩm hiệu quả mang lại làn da mịn màng,phục hồi lại vẻ căng mịn tự nhiên của da cùng với chiết xuất việt quất đen, cam chanh.', NULL, 17, 0, 50, '2022-11-24 10:25:16', NULL, NULL),
(173, '9 Wishes Mặt nạ giấy Rice Water Sheet Mask 25ml', '9-wishes-mat-na-giay-rice-water-sheet-mask-25ml', 32000, 14, 32, 0, 0, 'percent', 2, 'https://product.hstatic.net/200000551679/product/1-03__17__d9f7b56c898449d5ab866dc1cee818ff.png', 0, 0, 0, 1, 0, 0, 'Mặt nạ sáng da 9 Wishes Rice Water Sheet Mask với chiết xuất từ nước gạo cao cấp Hàn Quốc mang đến độ ẩm dồi dào cho da, đồng thời dưỡng da trắng sáng. Ngoài ra, sản phẩm bổ sung chiết xuất mật ong và tinh chất cam thảo hỗ trợ mang lại làn da mịn màng, rạng rỡ, tràn đầy sức sống.', NULL, 0, 0, 0, '2022-11-24 10:27:00', NULL, NULL),
(174, 'Avif Mặt nạ dưỡng da vùng mắt Bio Cellulose Under-Eye Patches', 'avif-mat-na-duong-da-vung-mat-bio-cellulose-under-eye-patches', 12300, 14, 10, 0, 0, 'percent', 0, 'https://file.hstatic.net/200000551679/file/mat-na-mat_3bc4748be7894d8da6db9b1dd3841cb9_grande.jpg', 0, 0, 0, 1, 0, 0, 'Mặt nạ dưỡng da vùng mắt Avif Bio Cellulose Under-Eye Patches giúp cấp ẩm, tăng đàn hồi, giảm quầng thâm, làm săn chắc da và cho da tươi trẻ hơn.', NULL, 0, 0, 0, '2022-11-24 10:28:00', NULL, NULL),
(175, 'Avif Mặt nạ dưỡng môi Bio Cellulose Premium Hydrating Lip Mask', 'avif-mat-na-duong-moi-bio-cellulose-premium-hydrating-lip-mask', 32000, 14, 10, 0, 0, 'percent', 0, 'https://file.hstatic.net/200000551679/file/8809384276801-extra1_46f154daed3e4cd7905a5eae711842fc_grande.jpg', 0, 0, 0, 1, 0, 0, 'Mặt nạ dưỡng môi Avif Bio Cellulose Premium Hydrating Lip Mask với chiết xuất từ Collagen và Ceramide giúp cấp nước, dưỡng ẩm cho môi căng mọng, làm môi mềm mượt, giảm khô thâm, nuôi dưỡng và làm đầy vân môi.', NULL, 0, 0, 0, '2022-11-24 10:28:50', NULL, NULL),
(176, 'Sexylook Mặt nạ giấy Intensive Moisturizing Black Facial Mask 28 ml', 'sexylook-mat-na-giay-intensive-moisturizing-black-facial-mask-28-ml', 23000, 14, 50, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/trew_bd70fbfac37840f8907cdeda1833e11a.jpg', 0, 0, 0, 1, 0, 0, 'Mặt nạ giấy SEXYLOOK Intensive Moisturizing Black Facial Mask có công dụng chính là cấp ẩm cho da, cải thiện sắc tố da, điều hòa bã nhờn và giúp cho làn da trở nên căng tràn sức sống.', NULL, 0, 0, 0, '2022-11-24 10:29:32', NULL, NULL),
(177, 'Sexylook Mặt nạ giấy Pure Avocado Cooling Cool Jelly Mask 38ml', 'sexylook-mat-na-giay-pure-avocado-cooling-cool-jelly-mask-38ml', 45200, 14, 20, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/c33db6367ae0e1a89ad849fbc0948eca_1629d320b8654b08b27f88392745f2e5.jpg', 0, 0, 0, 1, 0, 0, 'Mặt nạ giấy Sexylook Pure Avocado Cooling Cool Jelly Mask với chiết xuất bơ, chứa nhiều dưỡng chất thẩm thấu sâu vào làn da, đồng thời thanh lọc, cấp nước cho da và ngăn ngừa tình trạng lão hóa sớm, mang đến vẻ tươi trẻ cho da giúp da căng mịn và tươi sáng.', NULL, 0, 0, 0, '2022-11-24 10:30:09', NULL, NULL),
(178, 'Carenel Mặt nạ ngủ Vita-C Toning Night Mask 80ml', 'carenel-mat-na-ngu-vita-c-toning-night-mask-80ml', 450000, 14, 45, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/mat-na-ngu-mat-vita-c-toning-night-mask-carenel-1_126296f86d4744e795ad8cecbaafe5df.jpg', 0, 0, 0, 1, 0, 0, 'Mặt nạ ngủ Care:nel Vita-C Toning Night Mask chứa thành phần nhóm vitamin B, C, e hỗ trợ dưỡng sáng, cải thiện thâm mụn, nám, tàn nhang cực kỳ hiệu quả.', NULL, 0, 0, 0, '2022-11-24 10:30:45', NULL, NULL);
INSERT INTO `products` (`id`, `name`, `slug`, `price`, `category_id`, `number`, `admin_id`, `sale`, `discount_type`, `discount_value`, `avatar`, `view`, `hot`, `manufacturer_id`, `active`, `pay`, `dealer_id`, `description`, `content`, `review_total`, `warranty_date`, `review_star`, `created_at`, `updated_at`, `configuration`) VALUES
(179, 'Sexylook Mặt nạ giấy Marine Algae Whitening Facial Treatment Mask 28ml', 'sexylook-mat-na-giay-marine-algae-whitening-facial-treatment-mask-28ml', 43200, 14, 20, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/1_8e8513450983401a9e5446cca9778845.jpg', 0, 0, 0, 1, 0, 0, 'Mặt nạ giấy SEXYLOOK Marine Algae Whitening Facial Treatment Mask với tinh chất từ rong biển, nấm men và công nghệ enzyme làm đẹp da độc quyền từ Nhật Bản sẽ giúp giải quyết cùng lúc 3 vấn đề là da khô, nếp nhăn và sần sùi, đồng thời bổ sung thêm Mandelic Acid giúp làm mờ đốm nâu và dưỡng da sáng mịn đều màu.', NULL, 0, 0, 0, '2022-11-24 10:32:15', NULL, NULL),
(180, 'Carenel Mặt nạ ngủ mặt Care:nel Aqua Night Mask 15ml', 'carenel-mat-na-ngu-mat-carenel-aqua-night-mask-15ml', 56200, 14, 30, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/aec7ffd24c65b7a1f0259c3206d3f21b_a3241eaa23a34a17a738e692ea8bfe61.jpg', 0, 0, 0, 1, 0, 0, 'Mặt nạ ngủ Care:nel Aqua Night Mask được sử dụng vào ban đêm sẽ giúp cho da có thời gian thư giãn và nạp lại năng lượng vào sáng hôm sau. Mặt nạ ngủ còn giúp cảm giác thoải mái mát lạnh đối với da, để dễ dàng chìm vào giấc ngủ. Không chỉ dưỡng ẩm da, mặt nạ ngủ còn hỗ trợ da phục hồi lại sắc độ da, loại bỏ dần những nét tối sạm trên da, thay vào đó là sự hồng hào, khỏe khoắn và tràn đầy năng lượng.', NULL, 0, 0, 0, '2022-11-24 10:32:39', NULL, NULL),
(181, 'Wellderma Mặt nạ giấy Cica Treatment Repair Fitting Mask 25g', 'wellderma-mat-na-giay-cica-treatment-repair-fitting-mask-25g', 54999, 14, 50, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/wellderma-premium-cica-treatment-repair-fitting-mask-2_42ad184b3a994f0fadeb180fd805dbbc.jpg', 0, 0, 0, 1, 0, 0, 'Mặt nạ giấy Wellderma Cica Treatment Repair Fitting Mask được chiết xuất từ rau má rất lành tính, mát dịu rất tốt cho da tổn thương. Được chiết xuất từ 7 công thức tự nhiên như lá oregano, vỏ cây liễu trắng, cây kim tiền thảo, vàng, lactobacillus (chiết xuất từ ​​đậu nành lên men), vỏ cây thịt gà và cây kim mai giúp làn da của bạn đủ ẩm và khỏe mạnh.', NULL, 0, 0, 0, '2022-11-24 10:33:25', NULL, NULL),
(182, 'Wellderma Mặt nạ giấy Premium Sapphire Collagen Impac Fitting Mask 25g', 'wellderma-mat-na-giay-premium-sapphire-collagen-impac-fitting-mask-25g', 54620, 14, 30, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/71vaq72d4_s._srwidth_height_fmwe_11ae404fe3634e64b981aed57cb62f5b.png', 0, 0, 0, 1, 0, 0, 'Mặt nạ cấp ẩm chống lão hoá WellDerma Premium Sapphire Collagen Impact Fitting Mask tăng khả năng hấp thụ và cải thiện độ ẩm và độ đàn hồi vì chứa hàm lượng 830,000ppm tiểu phân tử 400DA collagen biển từ Na Uy, còn bổ sung Collagen để da luôn căng bóng, chống chảy sệ - lão hóa sớm vượt trội.', NULL, 0, 0, 0, '2022-11-24 10:34:12', NULL, NULL),
(183, 'Prettyskin Mặt nạ giấy Total Solution Essential Sheet mask', 'prettyskin-mat-na-giay-total-solution-essential-sheet-mask', 8900, 14, 50, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/fbe8bb05128dd2d38b9c12_85bc65f2f88a4a0ab4f0e44cfd671ae6.jpg', 0, 0, 0, 1, 0, 0, 'Mặt nạ giấy Prettyskin Total Solution Essential Sheet Mask không hề gây kích ứng da, giúp cho làn da mềm mại và ẩm mịn với các tinh chất từ thiên nhiên. Mặt nạ mỏng nhẹ, ôm sát khuôn mặt giúp các dưỡng chất thấm đều vào da.', NULL, 0, 0, 0, '2022-11-24 10:34:57', NULL, NULL),
(184, 'Dear, Klairs Mặt nạ Freshly Juiced Vitamin E Mask 90ml', 'dear-klairs-mat-na-freshly-juiced-vitamin-e-mask-90ml', 345600, 14, 50, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/_z8v6pkq_f3f932f5605949b4ae337c8559e1f320.png', 0, 0, 0, 1, 0, 0, 'Mặt Nạ Ngủ Klairs Freshly Juiced Vitamin E Mask là sản phẩm đến đến từ thương hiệu Dear Klairs với thiết kế độc đáo 2 trong 1, vừa là mặt nạ ngủ, vừa là kem dưỡng ẩm. Cung cấp hàm lượng dồi dào Vitamin E và chất chống oxy hóa cho làn da trong suốt cả đêm dài, ngăn ngừa lão hóa và dưỡng sáng da hiệu quả.', NULL, 0, 0, 0, '2022-11-24 10:35:33', NULL, NULL),
(185, 'I\'m From Mặt nạ rửa Rice Mask 110g', 'im-from-mat-na-rua-rice-mask-110g', 405320, 14, 50, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/hinh_concept__1__863318c23f404bffb424d3222193f17a.png', 0, 0, 0, 1, 0, 0, 'Mặt nạ rửa chiết xuất gạo I\'m from Rice Mask là lựa chọn phù hợp giúp làm sạch da, hỗ trợ tẩy da chết dịu nhẹ, dưỡng sáng và đem lại làn da căng mịn', NULL, 0, 0, 0, '2022-11-24 10:36:19', NULL, NULL),
(186, 'I\'m From Mặt nạ rửa Mugwort Mask 110g', 'im-from-mat-na-rua-mugwort-mask-110g', 502300, 14, 100, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/texture__5__ddaaa31d0aa84a499ddc789b36e70b5e.png', 0, 0, 0, 1, 0, 0, 'Mặt nạ rửa I’m from Mugwort Mask chứa 2,1% ngải cứu, lá ngải cứu ép nhỏ và hàng loạt thảo mộc quý tác dụng làm dịu làn da mệt mỏi và cấp thêm độ ẩm cho da.', NULL, 0, 0, 0, '2022-11-24 10:37:04', NULL, NULL),
(187, 'Dear, Klairs Mặt nạ rửa Youthful Glow Sugar Mask 110g', 'dear-klairs-mat-na-rua-youthful-glow-sugar-mask-110g', 33500, 14, 35, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/dear-klairs-youthful-glow-sugar-mask-110g-2_f59439c2816f4269abc77a26f457d748.jpg', 0, 0, 0, 1, 0, 0, 'Mặt nạ rửa tẩy tế bào chết Klairs Youthful Glow Sugar Mask giúp loại bỏ tế bào chết, làm kết cấu da không gây kích ứng nhờ thành phần chiết xuất Bưởi và đất sét Kaolin. Đồng thời cung cấp độ ẩm cho da, mềm mịn hơn nhờ các thành phần như bơ hạt mỡ, dầu hạt Jojoba, dầu mâm xôi.', NULL, 0, 0, 0, '2022-11-24 10:37:44', NULL, NULL),
(188, '9 Wishes Nước hoa hồng Pine Treatment Skin 150ml', '9-wishes-nuoc-hoa-hong-pine-treatment-skin-150ml', 267500, 18, 56, 0, 0, 'percent', 6, 'https://product.hstatic.net/200000551679/product/1-03__11__7b9f2e5cc2394797ba42ae2682e689dc.png', 0, 0, 0, 1, 0, 0, 'Nước hoa hồng 9 Wishes Pine Treatment Skin với 67% chiết xuất lá thông và thành phần được cấp bằng sáng chế HuPura - THA giúp làm sạch sâu và thanh lọc làn da, loại bỏ tế bào chết cùng bã nhờn tích tụ trong lỗ chân lông, đồng thời cân bằng độ ẩm, giúp mang lại làn da thông thoáng và sẵn sàng cho bước skincare tiếp theo.', NULL, 0, 0, 0, '2022-11-24 10:39:10', NULL, NULL),
(189, 'Astalift nước cân bằng Lotion Td 130ml', 'astalift-nuoc-can-bang-lotion-td-130ml', 963000, 18, 35, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/274020562_2396433293820298_8194509655702569952_n_5e9771fdf63f49e8902c4bf25d519b43.jpg', 0, 0, 0, 1, 0, 0, 'Nước cân bằng da Astalift Lotion cung cấp các thành phần có tác dụng chống oxy hoá vượt trội như: astaxanthin, lycopene, collagen, hyaluronic acid... mang đến tác dụng dưỡng ẩm và ngăn ngừa các dấu hiệu lão hoá da hiệu quả, duy trì vẻ đẹp săn chắc, mịn màng từ sâu bên trong.', NULL, 0, 0, 0, '2022-11-24 10:39:49', NULL, NULL),
(190, 'Astalift nước cân bằng White Bright Lotion 130ml', 'astalift-nuoc-can-bang-white-bright-lotion-130ml', 1260000, 18, 20, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/275776349_2417132705083690_9077115807131408156_n_1ec2da91f4e8435a90c43cef46aacd68.jpg', 0, 0, 0, 1, 0, 0, 'Nước dưỡng sáng da Astalift White Bright Lotion thuộc dòng sản phẩm chăm sóc và dưỡng trắng da Astalift White lvới khả năng làm sáng màu collagen đã bị ngả vàng. Ngoài ra giúp giải quyết các vấn đề về da như xỉn màu, sạm, đốm nâu, giúp người dùng cảm thấy vẻ đẹp của làn da được cải thiện rõ rệt toàn bộ từ bên trong cơ thể.', NULL, 0, 0, 0, '2022-11-24 10:40:31', NULL, NULL),
(191, 'Avander Nước hoa hồng Fresh Calming Toner', 'avander-nuoc-hoa-hong-fresh-calming-toner', 96000, 18, 50, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/untitled-3-01__2__aed7fe7ed979411a81813d772bd88024.png', 0, 0, 0, 1, 1, 0, 'Nước hoa hồng Avander Fresh Calming làm sạch dịu da là sản phẩm Toner đến từ thương hiệu mỹ phẩm Avander của Việt Nam, giúp cân bằng pH cho làn da, cấp ẩm làm cho da như được thư giãn, trông căng mịn. Đồng thời tạo cảm giác dễ chịu, làm dịu làn da, hỗ trợ dưỡng sáng da.', NULL, 0, 0, 0, '2022-11-24 10:41:15', NULL, NULL),
(192, 'Bio-essence Nước cân bằng Bio- Renew Nourishing Toner (100ml)', 'bio-essence-nuoc-can-bang-bio-renew-nourishing-toner-100ml', 225000, 18, 100, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/1_0eb33e4b7642425f94732c2e9c3947_2309108d5a6d47669c01d377621bf311.png', 0, 0, 0, 1, 0, 0, 'Nước cân bằng Bio-essence Bio-Renew Nourishing Toner giúp nuôi dưỡng & làm sáng da, giảm sự xuất hiện của các dấu hiệu lão hóa, cải thiện nếp nhăn và cải thiện sự săn chắc, đàn hồi mang lại làn da đầy sức sống, mềm mịn và ẩm mượt.', NULL, 0, 0, 0, '2022-11-24 10:42:21', NULL, NULL),
(193, 'Bio-essence Nước cân bằng Bio-Bird\'s Nest Collagen Skin Enhancer (100ml)', 'bio-essence-nuoc-can-bang-bio-birds-nest-collagen-skin-enhancer-100ml', 305000, 18, 50, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/118652303_2373997636230127_6622550379019174004_n_5ff8586a5b0c467b931c374d3dcb2ab2.jpg', 0, 0, 0, 1, 0, 0, 'Nước cân bằng Bio-essenceBio-Bird’s Nest Collagen Skin Enhancer giúp da hấp thu dưỡng chất tốt hơn, làn da trở nên khoẻ mạnh, tươi sáng và tràn đầy năng lượng với chiết xuất từ collagen và tinh chất tổ yến giúp cung cấp độ ẩm cần thiết giúp da săn mịn, mượt mà.', NULL, 0, 0, 0, '2022-11-24 10:43:07', NULL, NULL),
(194, 'Bio-essence Nước hoa hồng Bio-White Advanced Whitening Refiner (100ml)', 'bio-essence-nuoc-hoa-hong-bio-white-advanced-whitening-refiner-100ml', 238000, 18, 100, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/4_89594e29652c492c8b05e9d42c761a_c3f97c26d1bf46b2abc07920d7b8202d.jpg', 0, 0, 0, 1, 0, 0, 'Nước hoa hồng Bio-essence Bio-White Advanced Whitening Refiner từ thương hiệu Bio-essence không chỉ hoàn thành những nhiệm vụ trên mà còn bổ sung dưỡng chất giúp nuôi dưỡng làn da bạn mịn màng, sáng hồng bừng sức sống.', NULL, 0, 0, 0, '2022-11-24 10:43:43', NULL, NULL),
(195, 'Bioderma Nước hoa hồng Sebium Lotion 200ml', 'bioderma-nuoc-hoa-hong-sebium-lotion-200ml', 425000, 18, 10, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/35_0e6f23bcd2674a44bd306e31a0b9e717.png', 0, 0, 0, 1, 0, 0, 'Nước hoa hồng Bioderma Sébium Lotion kích thích cân bằng độ pH trên da, tuyến bã nhờn và độ ẩm sâu trong da, tái cân bằng cho da dầu, da hỗn hợp và da nhạy cảm. Ngăn ngừa bít tắc lỗ chân lông gây mụn, cho da sáng khỏe.', NULL, 0, 0, 0, '2022-11-24 10:44:14', '2022-12-27 02:08:45', NULL),
(196, 'Bioderma Nước hoa hồng Sensibio Tonique 100ml', 'bioderma-nuoc-hoa-hong-sensibio-tonique-100ml', 205000, 18, 50, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/3_e871c8ecac1e4629867e4f7374111b47.jpg', 0, 0, 0, 1, 0, 0, 'Nước hoa hồng Bioderma Sensibio Tonique giúp cân bằng độ pH sinh lí tự nhiên trên da, dưỡng ẩm và làm dịu da nhạy cảm, kích ứng với thành phần chính là nước, chiết xuất dưa leo, Allantoin giúp làm dịu da, cấp nước và giảm thiểu tình trạng kích ứng hiệu quả.', NULL, 0, 0, 0, '2022-11-24 10:44:46', NULL, NULL),
(197, 'BOM nước cân bằng sáng da ngừa mụn AC Red Free Toner 120ml', 'bom-nuoc-can-bang-sang-da-ngua-mun-ac-red-free-toner-120ml', 325000, 18, 60, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/3.2_922627cd12924c1a9decddfd8a78fe9d.jpg', 0, 0, 0, 1, 0, 0, 'Nước cân bằng sáng da ngừa mụn B.O.M AC Red Free Toner là giải pháp cho những làn da đang gặp vấn đề đã nhận được nhiều đánh giá tích cực thuộc thương hiệu BOM đến từ Hàn Quốc. Sản phẩm chứa các thành phần dịu nhẹ giúp cân bằng lượng dầu-nước trên da hiệu quả, giúp sáng da và ngăn ngừa nếp nhăn, lão hóa.', NULL, 0, 0, 0, '2022-11-24 10:46:00', NULL, NULL),
(198, 'Nước bí đao cân bằng da Cocoon winter melon toner', 'nuoc-bi-dao-can-bang-da-cocoon-winter-melon-toner', 140000, 18, 40, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/slide_3_ae195d3404_003781d3613b4860b53288769c7c8af0.jpg', 0, 0, 0, 1, 0, 0, 'Nước bí đao cân bằng da Cocoon Winter Melon Toner thành phần gồm bí đao, rau má và tràm trà, nước bí đao với công thức không chứa cồn có tác dụng cân bằng pH, giảm dầu, làm sạch lỗ chân lông, cải thiện tình trạng mụn. Sản phẩm còn được bổ sung thêm Vitamin B3, HA và chiết xuất cam thảo giúp cấp ẩm cho làn da luôn mịn màng và giảm thiểu các vết đỏ trên da.', NULL, 1, 0, 5, '2022-11-24 10:46:48', NULL, NULL),
(199, 'Kumano Nước hoa hồng Hatomugi Moisturising & Conditioning The Lotion 1000m', 'kumano-nuoc-hoa-hong-hatomugi-moisturising-conditioning-the-lotion-1000m', 175000, 18, 50, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/nuoc-hoa-hong-duong-am-reihaku-hatomugi-the-lotion-500ml_04_1e17b334956a4316822a94c09f64ed82.jpeg', 0, 0, 0, 1, 0, 0, 'Nước hoa hồng Hatomugi Moisturising & Conditioning The Lotion được biết đến không chỉ vì sự lành tính, mà sản phẩm còn có chiết xuất Ý Dĩ nổi bật với tác dụng dưỡng ẩm, dưỡng trắng, chống lão hoá rất được phụ nữ Nhật Bản ưa chuộng. Thành phần này còn được biết đến với tên gọi là Coix, Job’s Tears, Pearl Barley, Hatomugi,...', NULL, 0, 0, 0, '2022-11-24 10:47:31', NULL, NULL),
(202, 'Nacific Nước hoa hồng Pink AHABHA Toner 150ml', 'nacific-nuoc-hoa-hong-pink-ahabha-toner-150ml', 314000, 18, 30, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/texture_6b9caab03b0448509686e4cc8a75805d.png', 0, 0, 0, 1, 0, 0, 'Nước hoa hồng loại bỏ tế bào chết làm dịu da Nacific Pink AHABHA Toner với thành phần chính là AHA & BHA giúp loại bỏ tế bào chết nhẹ nhàng, hỗ trợ làm sạch sâu lỗ chân lông, chăm sóc và cải thiện làn da sần sùi, khô ráp mang đến làn da sáng mịn và đều màu.', NULL, 0, 0, 0, '2022-11-24 10:49:00', '2022-12-07 00:16:46', NULL),
(203, 'Skin1004 Nước hoa hồng Madagascar Centella Hyalu-cica Brightening Toner 210ml', 'skin1004-nuoc-hoa-hong-madagascar-centella-hyalu-cica-brightening-toner-210ml', 356000, 18, 30, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/1-05__6__e621e3cd88b1416183bdfb2283cdca56.png', 0, 0, 0, 1, 0, 0, 'Nước hoa hồng dưỡng ẩm, sáng da Skin1004 Madagascar Centella Hyalu-cica Brightening Toner gồm các thành phần chính chiết xuất rau má Madagascar giúp làm sạch tế bào chết, dầu thừa 1 cách nhẹ nhàng, cung cấp độ ẩm làm dịu da, tăng cường hàng rào bảo vệ da khỏe mạnh hơn.', NULL, 0, 0, 0, '2022-11-24 10:49:35', '2022-12-07 00:16:17', NULL),
(204, 'Nacific Nước hoa hồng Real Floral Toner Calendula 180ml', 'nacific-nuoc-hoa-hong-real-floral-toner-calendula-180ml', 356000, 18, 50, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/hieu_qua_va_cong_dung_bfc095b7e41e403997111711ff29e714.jpg', 0, 0, 0, 1, 0, 0, 'Nước hoa hồng làm dịu da chiết xuất hoa cúc Nacific Real Floral Toner Calendula với thành phần chính chiết xuất hoa cúc và phức hợp 7 loại thảo mộc có nguồn gốc từ Jeju giúp làm dịu da hiệu quả, từ đó chăm sóc và cải thiện các vấn đề về lỗ chân lông, mang lại làn da tươi sáng mịn màng.', NULL, 0, 0, 0, '2022-11-24 10:50:07', NULL, NULL),
(205, 'It\'s Skin Nước hoa hồng Mangowhite Brightening Toner 150ml', 'its-skin-nuoc-hoa-hong-mangowhite-brightening-toner-150ml', 164500, 18, 30, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/5.concept_53f5a33502b9456ca5c04c367d36629f.png', 0, 0, 0, 1, 0, 0, 'Nước hoa hồng It\'s Skin Mangowhite Brightening Toner dưỡng trắng da với chiết xuất Vỏ Măng Cụt giàu Vitamin C, giúp bạn lấy lại sắc diện trắng sáng, mịn màng và đầy sức sống.', NULL, 0, 0, 0, '2022-11-24 10:50:54', NULL, NULL),
(206, 'Nacific Nước hoa hồng Fresh Cica Plus Clear Toner 150ml', 'nacific-nuoc-hoa-hong-fresh-cica-plus-clear-toner-150ml', 356000, 18, 40, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/2c60194d-eba3-4e78-bbf6-2ddc5eebfc85_d924d91c7aa14c13b6ed442ae2b5f42b.jpeg', 0, 0, 0, 1, 0, 0, 'Nước hoa hồng Nacific Fresh Cica Plus Clear Toner với thành phần chính từ cây liễu sam, cây rau má có đặc tính dịu nhẹ, kháng khuẩn, chống viêm giúp làm dịu da nhạy cảm, hay bị ửng đỏ, bị mụn. Các chiết xuất từ trà xanh, bưởi đắng có tác dụng giảm sự tiết dầu nhờn của da, lỗ chân lông thông thoáng và giảm mụn. Đồng thời giúp cân bằng độ PH cho da, là bước đệm để các sản phẩm dưỡng tiếp thẩm thấu nhanh hơn.', NULL, 0, 0, 0, '2022-11-24 10:51:24', NULL, NULL),
(207, 'Skin1004 Nước hoa hồng Madagascar Centella Tone Brightening Boosting Toner 210ml', 'skin1004-nuoc-hoa-hong-madagascar-centella-tone-brightening-boosting-toner-210ml', 356220, 18, 50, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/1-05__7__d9c6de80787e4989bb5e711c985a5225.png', 0, 0, 0, 1, 0, 0, 'Nước hoa hồng sáng da Skin1004 Madagascar Centella Tone Brightening Boosting Toner chiết xuất rau má  đến 90% tăng cường khả năng chăm sóc và làm dịu da từ sâu bên trong. Giúp dưỡng trắng, kháng viêm cho da nhạy cảm, đồng thời hỗ trợ làm dịu da hiệu quả.', NULL, 0, 0, 0, '2022-11-24 10:51:57', NULL, NULL),
(208, 'Bio-essence Nước dưỡng Bio-Gold Rose Gold Water 100ml', 'bio-essence-nuoc-duong-bio-gold-rose-gold-water-100ml', 267000, 18, 50, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/afc4188f302165196a34721e27548d6c_ace69fd45df047a9aa651450913173b2.jpg', 0, 0, 0, 1, 0, 0, 'Nước dưỡng Bio-Essence Bio-Gold Rose Gold Water với chiết xuất vàng 24K và hoa hồng Eijitsu Nhật Bản ngăn ngừa các dấu hiệu lão hóa, nếp nhăn, vết chân chim và mang lại làn da mịn màng, căng mướt.', NULL, 1, 0, 5, '2022-11-24 10:52:32', NULL, NULL),
(209, 'Skin1004 Nước hoa hồng Madagascar Centella Toning Toner 210ml', 'skin1004-nuoc-hoa-hong-madagascar-centella-toning-toner-210ml', 320000, 18, 700, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/1-05__8__42846f216fe2412caac9bb4a4e409838.png', 0, 0, 0, 1, 0, 0, 'Nước hoa hồng hỗ trợ phục hồi, tái tạo da Skin1004 Madagascar Centella Toning Toner  giúp loại bỏ được chất nhờn, bụi bẩn còn sót lại tận sâu trong lỗ chân lông. Vừa cung cấp độ ẩm cho da, cân bằng PH và se khít lỗ chân lông. Chiết xuất từ thành phần tự nhiên có tác dụng phục hồi da bị tổn thương trên da nhất là da mụn, kháng viêm và giảm sưng đỏ do mụn.', NULL, 0, 0, 0, '2022-11-24 10:53:13', NULL, NULL),
(210, 'Nước hoa hồng chiết xuất rau má và hoa cúc Seoulrose Rosa Deep Pore Healing Toner 120ml', 'nuoc-hoa-hong-chiet-xuat-rau-ma-va-hoa-cuc-seoulrose-rosa-deep-pore-healing-toner-120ml', 171000, 18, 200, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/screen_shot_2022-08-22_at_16.23.57_258efa2eac7f4091bbd285c1dcc7094e.png', 0, 0, 0, 1, 0, 0, 'Nước hoa hồng chiết suất rau má và hoa cúc Seoulrose Rosa Deep Pore Healing Toner  với tinh chất tổng hợp từ Rau Má, Hoa Cúc Tươi, Cây Phỉ, Lá Chè Xanh cùng 7 loại thảo dược có tác dụng vừa làm sạch sâu, giảm nhờn trên da, còn có cả tác dụng kháng viêm, xoa dịu vết mụn sưng đỏ trên da, phục hồi, làm dịu làn da.', NULL, 2, 0, 6, '2022-11-24 10:53:47', NULL, NULL),
(211, 'It\'s Skin Nước hoa hồng Collagen Nutrition Toner 150ml', 'its-skin-nuoc-hoa-hong-collagen-nutrition-toner-150ml', 165000, 18, 40, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/5.concept_447e55376f324f5f84486ef4326dea2b.png', 0, 0, 0, 1, 0, 0, 'Nước hoa hồng ngừa lão hóa It\'s Skin Collagen Nutrition Toner với chiết xuất Marine Collagen từ sinh vật tầng sâu trong đại dương, giúp bạn lưu giữ làn da tươi trẻ, căng mịn dài lâu.', NULL, 0, 0, 0, '2022-11-24 10:54:56', NULL, NULL),
(212, 'Nước cân bằng dưỡng ẩm Martiderm Essentials Blooming Toner 200ml', 'nuoc-can-bang-duong-am-martiderm-essentials-blooming-toner-200ml', 650300, 18, 60, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/blooming-2_04ceff97a9c541ada8ab8_5aa8649292e7454daf1b02b66e18dfda.jpg', 0, 0, 0, 1, 1, 0, 'Nước cân bằng dưỡng ẩm Martiderm Essentials Blooming Toner với kết cấu dạng sữa lỏng tươi mát giúp làm sáng, làm mềm da và giữ ẩm, đồng thời loại bỏ các tạp chất còn sót lại trên da sau bước làm sạch, chuẩn bị cho da sẵn sàng hấp thụ dưỡng chất từ các bước chăm sóc tiếp theo.', NULL, 6, 0, 24, '2022-11-24 10:55:26', NULL, NULL),
(213, 'It\'s Skin Nước hoa hồng Hyaluronic Acid Moisture Toner 150ml', 'its-skin-nuoc-hoa-hong-hyaluronic-acid-moisture-toner-150ml', 165000, 18, 30, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/5.concept_98327628c4184559bf6d9a3d9cfc5831.png', 0, 0, 0, 1, 0, 0, 'Nước cân bằng dưỡng ẩm chứa Hyaluronic Acid, giúp da bạn mọng mướt từ sâu bên trong, đồng thời giảm thiểu tình trạng da thô ráp, bong tróc và xỉn màu.', NULL, 30, 0, 119, '2022-11-24 10:56:28', NULL, NULL),
(214, 'Some By Mi Nước hoa hồng Red Teatree Cicassoside Derma Solution Toner 150ml', 'some-by-mi-nuoc-hoa-hong-red-teatree-cicassoside-derma-solution-toner-150ml', 227000, 18, 45, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/vuong-03_0b18b82049fc41b5837bdf500149c5dd.png', 0, 0, 0, 1, 0, 0, 'Nước hoa hồng Some By Mi Red Teatree Cicassoside Derma Solution Toner chứa thành phần chiết xuất tràm trà đỏ (50%) ngoài khả năng chống viêm, kháng khuẩn còn giúp làm dịu da nhạy cảm mạnh mẽ, giảm thiểu khả năng kích ứng so với các loại tràm trà thông thường.', NULL, 6, 0, 19, '2022-11-24 10:59:22', NULL, NULL),
(217, 'Pekah Nước hoa hồng Rebirth Black Snail Toner 150ml', 'pekah-nuoc-hoa-hong-rebirth-black-snail-toner-150ml', 303000, 18, 22, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/32eec8e943a2aff3a8d45f6ff589ad7d_597f219ba850472390cbf8d8799b6c01.jpg', 0, 0, 0, 1, 0, 0, 'Nước hoa hồng Pekah Rebirth Black Snail Toner chiết xuất từ dịch nhầy ốc sên giúp phục hồi da, cân bằng độ ẩm và duy trì độ đàn hồi cho da một cách tuyệt đối.', '<p>Nội dung bài viết hay quá.</p><ol><li>Sau khi 4 trận đấu thuộc bảng G và H khép lại, người ta xác định được 4 tấm vé cuối vào vòng knock-out. Thực ra Brazil ở bảng G và Bồ Đào Nha ở bảng H đã giành vé sớm 1 vòng đấu. Điều mà giới mộ điệu quan tâm chỉ là họ có duy trì được mạch toàn thắng hay không.</li></ol><h3>Tiêu đề h2</h3><p>Thật ngạc nhiên, cả 2 ông lớn này đều bại trận lượt cuối. Bồ Đào Nha thua Hàn Quốc 1-2, còn Brazil bị Cameroon đánh bại với chỉ 1 bàn thắng. Những kết quả sốc này khiến cục diện của các bảng G và H thay đổi đáng kể.</p><h3>Tiêu đề h2</h3><p>Nhưng kết quả sau cùng của các cặp đấu này là Hàn Quốc 2-1 Bồ Đào Nha và Uruguay 2-0 Ghana. Bởi thế, cục diện thay đổi chóng mặt. Người đã đưa đội bóng xứ sở kim chi vào vòng knock-out là Hwang Hee-Chan - tiền đạo bị cho là bật khóc vì không được ra sân sau 2 trận đầu tiên.</p>', 3, 0, 7, '2022-11-24 11:00:50', '2022-12-27 02:23:11', NULL),
(218, 'Astalift tinh dầu tẩy trang cleansing oil 120ml', 'astalift-tinh-dau-tay-trang-cleansing-oil-120ml', 156000, 11, 5, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/273033127_2394733470656947_28274_45de28e969874cc0a7046dd7a399ed00.png', 0, 0, 0, 1, 0, 0, 'Tinh dầu tẩy trang Astalift Cleansing Oil tác dụng làm sạch bụi bẩn, bã nhờn trên da, cho bước làm sạch nhanh chóng và hoàn hảo mà vẫn hết sức dịu nhẹ với làn da.Đồng thời, thành phần collagen tan trong nước có trong tinh dầu tẩy trang này có tác dụng giữ ẩm cho da, tăng cường độ săn chắc và đàn hồi, giúp da mịn màng, rạng rỡ.', NULL, 3, 0, 6, '2022-12-06 23:12:48', NULL, NULL),
(223, 'Some By Mi Nước hoa hồng Propolis B5 Glow Barrier Calming Toner 150ml', 'some-by-mi-nuoc-hoa-hong-propolis-b5-glow-barrier-calming-toner-150ml', 257000, 18, 5, 0, 0, 'percent', 0, 'https://product.hstatic.net/200000551679/product/17-23-07-01__5__77d12559d30549b99a4300a47ad22da0.png', 0, 0, 0, 1, 0, 2, 'Nước hoa hồng Some By Mi Propolis B5 Glow Barrier Calming Toner với công thức chứa dồi dào dưỡng chất từ thiên nhiên giúp chăm sóc, tái tạo và củng cố hàng rào bảo vệ da, chống lại các tác nhân gây hại từ bên ngoài.', '<p><strong>Loại da phù hợp:</strong></p><ul><li>Dành cho mọi loại da, kể cả da nhạy cảm.</li><li>Da thường xuyên gặp tình trạng kích ứng.</li><li>Da xỉn màu, khô ráp và thiếu độ ẩm.</li></ul><p><strong>Công dụng:</strong></p><ul><li><strong>Chứa 65% chiết xuất keo ong và mật ong nguyên chất c</strong>&nbsp;chống oxy hóa, ngoài ra còn hỗ trợ kháng khuẩn, kháng viêm, bảo vệ da tránh khỏi tình trạng viêm nhiễm, làm sạch lỗ chân lông và điều trị mụn trứng cá.</li><li><strong>Chứa 5,000 ppm Vitamin B5</strong> có khả năng ngăn ngừa mất nước, giữ ẩm sâu cho làn da, giúp làm dịu, kháng viêm, tăng cường hàng rào bảo vệ da, phục hồi cho làn da tổn thương, tăng sinh collagen, glycan và elastin giúp chống lại các dấu hiệu lão hóa.</li><li>G<strong>iúp làm dịu da kích ứng và hỗ trợ tăng cường hàng rào bảo vệ da </strong>trước các tác động gây hại từ môi trường bên ngoài, nuôi dưỡng làn da khỏe mạnh từ sâu bên trong.<strong>Thành phần:</strong></li></ul><p>Propolis Extract, Honey Extract, Dipropylene Glycol, Butylene Glycol, Hydroxyethyl Urea, Propanediol, Niacinamide, 1,2-Hexanediol, Centella Asiatica Extract, Melaleuca Alternifolia (Tea Tree) Leaf Water, Panthenol, Benzyl Glycol, Honey, Royal Jelly Extract, Allantoin, Sodium Citrate, Pollen Extract, Glycerin, C12-13 Pareth-9, Sodium Polyacrylate, Ethylhexylglycerin, Malt Extract, Citric Acid, Disodium EDTA, Adenosine, Raspberry Ketone, Artemisia Princeps Leaf Extract, Madecassoside, Fragrance, Sodium Hyaluronate, Water, Asiaticoside, Coumarin, Madecassic Acid, Asiatic Acid, Ceramide NP, Benzyl Alcohol, Centella Asiatica Leaf Extract.</p><p><strong>Hướng dẫn sử dụng:</strong></p><ul><li><strong>Có 3 cách sử dụng với 3 mục đích khác khau:</strong><ul><li><strong>Tăng khả năng làm sạch da:</strong> Nếu bạn sử dụng Nước hoa hồng với mục đích làm sạch da, hãy thấm Nước hoa hồng lên miếng bông cotton và lau lên da theo chiều từ trong ra ngoài.</li><li><strong>Cung cấp độ ẩm mạnh mẽ: </strong>Sau bước làm sạch bạn cần cấp ẩm nhanh thì có thể cho Nước hoa hồng ra tay và vỗ nhẹ lên mặt. Hơi ẩm tự nhiên từ bàn tay gia tăng khả năng hấp thụ Toner vào da.</li><li><strong>Mặt nạ làm dịu da: </strong>Khi làn da đang kích ứng, mẩn đỏ, hãy làm ướt miếng bông cotton bằng Nước hoa hồng. Sau đó, đắp lên da từ 3-5 phút, làn da sẽ được làm dịu một cách nhẹ nhàng.</li></ul></li></ul>', 1, 0, 3, '2023-02-06 23:31:01', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products_images`
--

CREATE TABLE `products_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pi_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pi_slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pi_product_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products_keywords`
--

CREATE TABLE `products_keywords` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pk_product_id` int(11) NOT NULL DEFAULT '0',
  `pk_keyword_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refresh_tokens`
--

CREATE TABLE `refresh_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `is_revoked` tinyint(1) NOT NULL DEFAULT '0',
  `expires` datetime DEFAULT NULL,
  `refresh_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `s_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `s_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `s_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `s_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `s_banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `s_sort` tinyint(4) NOT NULL DEFAULT '0',
  `s_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `t_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_hot` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `t_user_id` int(11) NOT NULL DEFAULT '0',
  `t_total_money` int(11) NOT NULL DEFAULT '0',
  `t_total_discount` int(11) NOT NULL DEFAULT '0',
  `t_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_type` int(11) NOT NULL DEFAULT '1',
  `t_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `t_user_id`, `t_total_money`, `t_total_discount`, `t_name`, `t_email`, `t_phone`, `t_address`, `t_note`, `t_type`, `t_status`, `created_at`, `updated_at`) VALUES
(30, 113, 1180300, 0, 'ggdfgdf', NULL, '0987878787', NULL, 'Giao nhanh', 1, 1, '2022-12-04 08:13:54', NULL),
(31, 115, 65200, 0, 'thuy', NULL, '0989898989', NULL, 'Giao nhanh', 1, 1, '2022-12-04 13:10:58', NULL),
(35, 125, 303000, 0, 'khang', NULL, '0925678902', NULL, 'Giao nhanh', 1, 1, '2022-12-08 03:17:47', NULL),
(36, 125, 156000, 0, 'khang', NULL, '0925678902', NULL, 'Giao nhanh', 1, 1, '2022-12-08 03:20:54', NULL),
(37, 100, 624000, 0, 'trần hoàng', NULL, '0000000115', NULL, 'Giao nhanh', 1, 1, '2022-12-08 18:54:46', NULL),
(38, 100, 468000, 0, 'trần hoàng', NULL, '0000000115', NULL, 'Giao nhanh', 1, 1, '2022-12-08 19:00:20', NULL),
(40, 100, 1056000, 0, 'trần hoàng hehee', NULL, '0000000115', NULL, 'Giao nhanh', 1, 1, '2022-12-12 11:18:30', NULL),
(41, 100, 2106900, 0, 'hoang', NULL, '0000000115', NULL, 'Giao nhanh', 1, 1, '2022-12-13 10:29:04', NULL),
(42, 100, 206000, 0, 'hoang', NULL, '0000000115', NULL, 'Giao nhanh', 1, 1, '2022-12-14 08:04:42', NULL),
(43, 100, 1456600, 0, 'hoang', NULL, '0000000115', NULL, 'Giao nhanh', 1, 1, '2022-12-14 08:05:13', NULL),
(44, 100, 459000, 0, 'hoang', NULL, '0000000115', NULL, 'Giao nhanh', 1, 1, '2022-12-14 08:13:14', NULL),
(45, 105, 400000, 0, 'Phan Trung Phú', NULL, '0986420994', NULL, 'Không có gì', 1, 1, '2022-12-14 09:04:02', NULL),
(46, 105, 400000, 0, 'Phan Trung Phú', NULL, '0986420994', NULL, 'Không có gì', 1, 1, '2022-12-14 09:10:40', NULL),
(47, 105, 400000, 0, 'Phan Trung Phú', NULL, '0986420994', NULL, 'Không có gì', 1, 1, '2022-12-14 09:10:44', NULL),
(48, 105, 400000, 0, 'Phan Trung Phú', NULL, '0986420994', NULL, 'Không có gì', 1, 1, '2022-12-14 09:11:02', NULL),
(49, 105, 400000, 0, 'Phan Trung Phú', NULL, '0986420994', NULL, 'Không có gì', 1, 1, '2022-12-14 09:11:13', NULL),
(50, 105, 400000, 0, 'Phan Trung Phú', NULL, '0986420994', NULL, 'Phú ĐZ', 1, 1, '2022-12-14 09:11:25', NULL),
(51, 105, 400000, 0, 'Phan Trung Phú', NULL, '0986420994', NULL, 'Phú ĐZ', 1, 3, '2022-12-14 09:12:28', '2023-02-13 07:05:03'),
(54, 128, 156000, 0, 'đức', NULL, '0897654321', NULL, 'Giao nhanh', 1, 1, '2022-12-14 12:47:56', NULL),
(56, 105, 2049000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2022-12-15 06:51:24', NULL),
(57, 105, 2049000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2022-12-15 06:51:26', NULL),
(58, 105, 2049000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2022-12-15 06:51:32', NULL),
(59, 100, 330000, 0, 'hoang', NULL, '0000000115', NULL, 'abc', 1, 1, '2022-12-15 09:29:03', NULL),
(60, 100, 330000, 0, 'hoang', NULL, '0000000115', NULL, 'abc', 1, 1, '2022-12-15 09:30:58', NULL),
(61, 100, 330000, 0, 'hoang', NULL, '0000000115', NULL, 'abc', 1, 1, '2022-12-15 09:34:03', NULL),
(62, 100, 330000, 0, 'hoang', NULL, '0000000115', NULL, 'abc', 1, 1, '2022-12-15 09:34:05', NULL),
(63, 100, 165000, 0, 'hoang', NULL, '0000000115', NULL, 'abc', 1, 1, '2022-12-15 09:59:33', NULL),
(65, 100, 454000, 0, 'hoang', NULL, '0000000115', NULL, 'abc', 1, 1, '2022-12-15 10:12:27', NULL),
(74, 100, 454000, 0, 'hoang', NULL, '0000000115', NULL, 'abc', 1, 1, '2022-12-19 08:31:57', NULL),
(75, 100, 650300, 0, 'hoang', NULL, '0000000115', NULL, 'abc', 1, 1, '2022-12-19 08:32:27', NULL),
(81, 105, 2466300, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2022-12-20 15:46:00', NULL),
(82, 129, 10371000, 0, 'Lại Dũng', NULL, '0385044649', NULL, 'abc', 1, 1, '2022-12-21 04:45:34', NULL),
(83, 100, 477000, 0, 'hoang', NULL, '0000000115', NULL, 'abc', 1, 1, '2022-12-23 08:12:01', NULL),
(84, 100, 1078000, 0, 'hoang', NULL, '0000000115', NULL, 'abc', 1, 1, '2022-12-23 09:53:04', NULL),
(86, 129, 810000, 0, 'Lại Dũng', NULL, '0385044649', NULL, 'abc', 1, 4, '2022-12-24 12:49:08', '2022-12-27 02:17:29'),
(88, 125, 156000, 0, 'khang', NULL, '0925678902', NULL, 'Giao nhanh', 1, 3, '2022-12-27 09:03:10', '2022-12-27 02:17:21'),
(89, 118, 303000, 0, 'hoàng', NULL, '0869696969', NULL, 'Giao nhanh', 1, 6, '2022-12-27 09:04:35', '2022-12-27 02:18:17'),
(90, 125, 303000, 0, 'khang', NULL, '0925678902', NULL, 'Giao nhanh', 1, 1, '2022-12-27 09:22:27', NULL),
(91, 128, 789000, 0, 'đức', NULL, '0897654321', NULL, 'Giao nhanh', 1, 1, '2022-12-28 13:27:42', NULL),
(92, 128, 156000, 0, 'đức', NULL, '0897654321', NULL, 'Giao nhanh', 1, 1, '2022-12-28 13:59:57', NULL),
(93, 135, 459000, 0, 'haong', NULL, '5678654567', NULL, 'Giao nhanh', 1, 1, '2022-12-28 15:26:44', NULL),
(94, 125, 1827000, 0, 'khang', NULL, '0925678902', NULL, 'Giao nhanh', 1, 2, '2022-12-29 01:27:53', '2022-12-28 18:28:03'),
(95, 118, 1212000, 0, 'hoàng', NULL, '0869696969', NULL, 'Giao nhanh', 1, 4, '2022-12-29 03:49:14', '2022-12-28 20:55:58'),
(96, 118, 533200, 0, 'hoàng', NULL, '0869696969', NULL, 'Giao nhanh', 1, 1, '2022-12-29 03:56:57', NULL),
(97, 100, 32000, 0, 'hoang', NULL, '0000000115', NULL, 'abc', 1, 1, '2023-01-11 02:34:50', NULL),
(98, 100, 5109300, 0, 'hoang', NULL, '0000000115', NULL, 'abc', 1, 1, '2023-01-11 09:43:36', NULL),
(99, 100, 1447800, 0, 'hoang', NULL, '0000000115', NULL, 'abc', 1, 1, '2023-01-11 09:44:38', NULL),
(101, 136, 156000, 0, 'ns', NULL, 'ccnkv', NULL, 'abc', 1, 1, '2023-01-17 07:58:59', NULL),
(103, 136, 156000, 0, 'ns', NULL, 'ccnkv', NULL, 'abc', 1, 1, '2023-01-17 08:16:22', NULL),
(104, 136, 468000, 0, 'ns', NULL, 'ccnkv', NULL, 'abc', 1, 1, '2023-01-17 10:35:00', NULL),
(105, 148, 32000, 0, 'Ta Dang Trung Hieu', NULL, '0971022791', NULL, 'abc', 1, 1, '2023-01-30 12:57:42', NULL),
(107, 150, 125500, 0, 'Rose Nguyen', NULL, '0938490933', NULL, 'abc', 1, 1, '2023-01-31 15:11:07', NULL),
(109, 149, 267500, 0, 'Lê Sinh', NULL, '0937297402', NULL, 'abc', 1, 1, '2023-02-01 14:54:40', NULL),
(110, 149, 267500, 0, 'Lê Sinh', NULL, '0937297402', NULL, 'abc', 1, 1, '2023-02-01 14:59:25', NULL),
(112, 150, 125500, 0, 'Rose Nguyen', NULL, '0938490933', NULL, 'abc', 1, 1, '2023-02-05 17:00:11', NULL),
(113, 151, 814500, 0, 'bunta', NULL, '0795059249', NULL, 'abc', 1, 1, '2023-02-07 06:04:43', NULL),
(114, 151, 156000, 0, 'bunta', NULL, '0795059249', NULL, 'abc', 1, 1, '2023-02-08 07:02:56', NULL),
(115, 152, 123600, 0, 'tran van a', NULL, '35535353253', NULL, 'abc', 1, 1, '2023-02-13 13:47:18', NULL),
(116, 105, 970300, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 03:28:55', NULL),
(117, 105, 227000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 03:29:11', NULL),
(118, 105, 251000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 03:37:15', NULL),
(119, 105, 251000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 03:37:28', NULL),
(120, 105, 251000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 03:38:11', NULL),
(121, 105, 470000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 04:55:24', NULL),
(122, 105, 470000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 04:56:14', NULL),
(123, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 05:04:58', NULL),
(124, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 05:14:06', NULL),
(125, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 05:23:29', NULL),
(126, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 05:28:31', NULL),
(127, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 06:00:32', NULL),
(128, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 06:11:45', NULL),
(129, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 06:15:48', NULL),
(130, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 10:00:23', NULL),
(131, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 10:06:51', NULL),
(132, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 10:23:40', NULL),
(133, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 10:29:43', NULL),
(134, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 10:29:48', NULL),
(135, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 10:34:20', NULL),
(136, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 10:35:07', NULL),
(137, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 10:35:21', NULL),
(138, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 10:37:44', NULL),
(139, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 10:37:57', NULL),
(140, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 10:44:24', NULL),
(141, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 10:44:42', NULL),
(142, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 10:53:37', NULL),
(143, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 10:54:54', NULL),
(144, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 10:59:09', NULL),
(145, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 11:02:47', NULL),
(146, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 11:02:54', NULL),
(147, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 11:06:56', NULL),
(148, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 11:17:33', NULL),
(149, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 12:00:00', NULL),
(150, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 12:10:47', NULL),
(151, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 12:11:06', NULL),
(152, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 12:12:55', NULL),
(153, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 12:13:02', NULL),
(154, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 12:19:57', NULL),
(155, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 12:20:01', NULL),
(156, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 12:21:27', NULL),
(157, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 12:21:31', NULL),
(158, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 12:21:47', NULL),
(159, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 12:24:13', NULL),
(160, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 12:24:50', NULL),
(161, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 12:29:55', NULL),
(162, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 12:36:23', NULL),
(163, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 12:36:28', NULL),
(164, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 13:38:26', NULL),
(165, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 13:45:11', NULL),
(166, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 13:46:31', NULL),
(167, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 13:49:38', NULL),
(168, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 13:49:43', NULL),
(169, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 13:52:03', NULL),
(170, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 13:59:45', NULL),
(171, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 14:15:30', NULL),
(172, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 14:16:47', NULL),
(173, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 14:17:07', NULL),
(174, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 14:19:05', NULL),
(175, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 14:19:09', NULL),
(176, 105, 235000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 14:19:23', NULL),
(177, 105, 462000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 17:24:41', NULL),
(178, 105, 462000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 17:37:40', NULL),
(179, 105, 462000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 17:37:55', NULL),
(180, 105, 462000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 23:55:04', NULL),
(181, 105, 689000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 1, '2023-02-19 23:55:41', NULL),
(182, 105, 992000, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, -1, '2023-02-20 03:51:45', NULL),
(183, 151, 526000, 0, 'bunta', NULL, '0795059249', NULL, 'abc', 1, 1, '2023-03-01 06:55:34', NULL),
(184, 151, 526000, 0, 'bunta', NULL, '0795059249', NULL, 'abc', 1, 1, '2023-03-01 06:56:26', NULL),
(185, 151, 526000, 0, 'bunta', NULL, '0795059249', NULL, 'abc', 1, 1, '2023-03-01 06:57:18', NULL),
(186, 0, 1026000, 0, 'Trung Phú', NULL, '0909878111', NULL, 'abc', 1, 1, '2023-04-04 09:55:38', NULL),
(187, 0, 1026000, 0, 'Bích Ngọc', NULL, '0909878111', NULL, 'abc', 1, 1, '2023-04-04 09:58:21', NULL),
(188, 158, 303000, 0, 'Phú Phan', NULL, '0909888777', NULL, 'abc', 1, 4, '2023-06-27 08:28:47', NULL),
(189, 158, 576000, 0, 'Phú Phan', NULL, '0909888777', NULL, 'abc', 1, -1, '2023-06-27 08:29:22', NULL),
(190, 158, 485000, 0, 'Phú Phan', NULL, '0909888777', NULL, 'abc', 1, 1, '2023-06-28 09:46:43', NULL),
(191, 158, 1074000, 0, 'Phú Phan', NULL, '0909888777', NULL, 'abc', 1, 4, '2023-06-28 13:36:42', NULL),
(192, 158, 240000, 0, 'Phú Phan', NULL, '0909888777', NULL, 'abc', 1, 4, '2023-06-28 13:57:25', NULL),
(193, 158, 12, 0, 'Phú Phan', NULL, '0909888777', NULL, 'abc', 1, 1, '2023-06-28 14:06:14', NULL),
(194, 158, 12, 0, 'Phú Phan', NULL, '0909888777', NULL, 'abc', 1, 1, '2023-06-28 14:09:26', NULL),
(195, 105, 650310, 0, 'Hạ Linh', NULL, '0986499910', NULL, 'abc', 1, 4, '2023-07-11 00:30:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `refresh_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `email_verified_at`, `password`, `phone`, `address`, `avatar`, `remember_token`, `created_at`, `updated_at`, `refresh_token`) VALUES
(33, 'tranhoang', 'hoang1@gmail.com', 'hoang1', NULL, '$2b$10$dvfGq.y6Bh4430.dQcE.YexC0HI/No7FK55Prj90bOMq6Qy/Y.AYC', '1234561', 'abc', NULL, NULL, NULL, NULL, '4b8623ac94925a43132601641235b367'),
(34, 'string', 'string', 'string', NULL, '$2b$10$7mwo6r4Fly1FluGSp.tzh.3JLJTB5VTxFK5XUeF/6EmV9LzjYGRii', 'string', 'string', NULL, NULL, NULL, NULL, 'c29cb4c792bfd71b19ed3592ea3b5173'),
(44, 'Trần hoàng', 'hoangnguyen@gmail.com', 'tranhoang123', NULL, '$2b$10$taK/Dj8/GPrAIZNDJ9ulC.vSfCN5s2OOr6h/IhhrdcSgGEwO3XAmW', '012321312', 'hanoi', NULL, NULL, NULL, NULL, 'fc7c78b43cefde295e0024be4f5d2521'),
(63, 'Trần hoàng1', 'hoangnguyen1@gmail.com', 'tranhoang1231', NULL, '$2b$10$MKjwxlDEX.fj9ZxFjv2yzerw6crQENeOGXedC9hT8fiZuuIq2323q', '0123213112', 'hano1i', NULL, NULL, NULL, NULL, '5050c040151f13d46fac41832aec7c55'),
(64, 'hehe3', 'hehe3@gmail.com', 'hehe4', NULL, '$2b$10$9RekCMOIoVb/hSyjXcfiJ.vp7jdklYAkduVCtij1DfYoHnOzDRdIi', '123213132', 'han', NULL, NULL, NULL, NULL, '3d2d5803087cc3e11004343df5272c2b'),
(66, 'hoang', 'hoang3@gmail.com', 'hoang3', NULL, '$2b$10$wPYx4/q7vjUf/oyompurxerJz/Wq.Rs6A23xjrE6F8MmrSONwIjya', '123456789', 'han', NULL, NULL, NULL, NULL, 'fdcc2872e54fc8acfd201a11e02082ef'),
(67, 'ád', 'hoang5@gmail.com', 'hoang5', NULL, '$2b$10$T1t7xTdMJVSuMflwN185LesX7lieE1tYMaxuADu3.hN5q64hJ5f/6', '123213213', 'han', NULL, NULL, NULL, NULL, 'ca750143618edfc80400ad9257ded80c'),
(70, 'ádsad', 'hoang6@gmail.com', 'hoang6', NULL, '$2b$10$Wg2AtoTDPtIlpBEkZCJa7eZH2dw1qe01wFDTIjxLF9FALgu9JdqdS', '016456789', 'han', NULL, NULL, NULL, NULL, '7ccba53049aa1fffa673cffcc1f3cbe1'),
(71, 'qweqwe123', 'qweqwe123@gmail.com', 'qweqwe123', NULL, '$2b$10$arYBxf0nPO.OEZp2DEKmtekKskWJTf17S6l2WxK60EeIl5bG3KsL2', '123456', 'han', NULL, NULL, NULL, NULL, '4c96bec6efcae8be5500f93dd02248ff'),
(78, 'hoang61', 'hoang61@gmail.com', 'hoang61', NULL, '$2b$10$FiTB2Oo.64u74gDY7foQIOKsOJQs3zdR.etGppnQdpDp6DIGZL7s2', '881689698', 'han', NULL, NULL, NULL, NULL, '9f878f406893caab1e54404d9c7a12a3'),
(80, 'hoang611', 'hoang611@gmail.com', 'hoang611', NULL, '$2b$10$RTjYNqvspEhLOpKKxXw.mecN44rz0sP0KfR7qvzieTo18/iMEPGXq', '12321908', 'han', NULL, NULL, NULL, NULL, '90eb53ef2d3e32d74a0580bebb108dc9'),
(81, 'hoang612', 'hoang612@gmail.com', 'hoang612', NULL, '$2b$10$hGR761N09D5jyKdaHEjvD.o0yUGHMiCALuxCnRxakPsE5nLuWmmQG', '0123456', 'han', NULL, NULL, NULL, NULL, 'a363112ddf88736c2c5352b63afa08bb'),
(83, 'honag613', 'hoang613@gmail.com', 'hoang613', NULL, '$2b$10$Fu0dEk5IYqyON0.JhSRJ7eFFUdsXNuoODM6OsM0O9JRl.bjcPLv5q', '012311111', 'han', NULL, NULL, NULL, NULL, '91da70b7ecbc943d2000d189874688be'),
(84, 'hoang615', 'hoang615@gmail.com', 'hoang615', NULL, '$2b$10$immVlfeiau9TG83Z4s17UOHbBZkP.PiTUWDVPexfO1YnCvRvm.Bim', '0123111211', 'Han', NULL, NULL, NULL, NULL, '96ee9c378ad6c5165015b40f6c34082b'),
(85, 'hoang616', 'hoang616@gmail.com', 'hoang616', NULL, '$2b$10$ZqoP/wRd2LfTukg7iXz3cuDZnUz1F1GHCSuc9dGv0/KpldH./UItK', '1234561111', 'Han', NULL, NULL, NULL, NULL, '32838bcc7e9db4847f7458d5e73e19f3'),
(86, 'hoang617', 'hoang617@gmail.com', 'hoang617', NULL, '$2b$10$5a/eWQEOosH44KKzroabneqvSS2o2nwBDEqsZ90dvTD.hWCWt1BJC', '0123123112', 'han', NULL, NULL, NULL, NULL, '4cdc98bdc18b25316b515e5c05f85a43'),
(87, 'hoang113', 'hoang113@gm.cm', 'hoang113', NULL, '$2b$10$B/uBS6JL4Vt9XW1KmHVnQe/yq8vKyN1YOSGEgUsUyF1vK8Le2Cmxe', '001111', 'hanoi', NULL, NULL, NULL, NULL, '8e60c2b51ea6585e64297e539559c346'),
(88, 'hoang116', 'hoang116@gm.cm', 'hoang116', NULL, '$2b$10$xL.wXVoSOX/KaDoRMgWFEOboxmeaRpgZBKKRAQwuaMGN86tUy4.6q', '0101211165', 'Hanoi', NULL, NULL, NULL, NULL, '05829858d9a94cbc1548c035f2ab32e9'),
(90, 'hoang117', 'hoang117@gm.cm', 'hoang117', NULL, '$2b$10$PclzYbUlRf.tLZ3Y.eUIGO9WcNKuKH.izsOZqDXgtElsRbdM7Y2Qm', '010155687', 'Hanoi', NULL, NULL, NULL, NULL, 'c703bebe25d89cf1bd90f1de33d4ceb5'),
(91, 'hoang118', 'hoang188@gm.cm', 'hoang118', NULL, '$2b$10$X3RJiqAWROEnCxDcKhOXF.QWFtPteRRaT.66iFd6xtf9m8kN0odF6', '0561984897', 'Hanoi', NULL, NULL, NULL, NULL, '5bba3679a46330b34f071cf4e074f082'),
(92, 'hoang119', 'hoang119@gm.cm', 'hoang119', NULL, '$2b$10$lBALKDHhd5M10qyyPDJFE.GE1FnA8QNG8HhB1IBdNfWWI9u/SN0Ru', '0548977484', 'Hanoi', NULL, NULL, NULL, NULL, '53ae24598688af1e981e3f38dc79466d'),
(97, 'hoang1191', 'hoang1119@gm.cm', 'hoang11911', NULL, '$2b$10$1tcCYCSV33e5lb5tPz45F..5IEEBe.pH2Q2yZvDXFkuzUEeUXhgvq', '054897748', 'Hanoi', NULL, NULL, NULL, NULL, 'fb75689d51632c283ebdf8c3da84c389'),
(99, 'hoang1191', 'hoang122@gm.cm', 'hoang113911', NULL, '$2b$10$vHUu6cNKRdsCotc5VTRY5OKZwuYTG.eHRpHFTB35x6mJ7yoPytOd2', '0548977438', 'Hanoi', NULL, NULL, NULL, NULL, '817decdcc4a0826b1b24aeca2df68418'),
(100, 'hoangg', 'tranhoang2@gm.cmm', 'tranhoang2', NULL, '$2b$10$Q2.5kJ03054XKEwGOqmmOOf6guLfA7368858WZ9LxEwnbBc7.BKKC', '0000000115', 'hà nộii', NULL, NULL, NULL, NULL, '903cb5e955aa3338a5803a00b81ef9f4'),
(101, 'tranhoang3', 'tranhoang3@gm.cm', 'tranhoang3', NULL, '$2b$10$pdGpgrwHNrq6PHEAbttOxu.eApziSMCcBpmh65zi1VI.kNMEDzN.W', '0000000002', 'han', NULL, NULL, NULL, NULL, '5ff8e2feaacf5c4668d08332ed7b0cca'),
(102, 'hoang101', 'hoang101@Mgal.com', 'hoang101', NULL, '$2b$10$Gxot0TJ7wUGJ62IQ8jAJlunBkdIMJET4NUEUAIMGYzgAp2D/HP2m2', '0000000004', 'hanoi', NULL, NULL, NULL, NULL, '2dc8d20abdc126c8180b74fd0bdbf948'),
(103, 'hoang102', 'hoang102@Mgal.com', 'hoang102', NULL, '$2b$10$7EEmLrarXwbTQGiHlnZMnuIJEUNENh4cMgU35RZG.VijdSF6C.K4.', '0000000005', 'hanoi', NULL, NULL, NULL, NULL, 'a9e31e2425dca854ab0826e2ac71efc6'),
(104, 'hoang105', 'hoang105@gm.com', 'hoang105', NULL, '$2b$10$Kn54olKb6jqcMTEe9jOXHeCSxyoVHvaqzcOmWIwxdf5h0N9HniSfi', '0000000007', 'hanoi', NULL, NULL, NULL, NULL, 'aed1a6b9aa7e61a629b0d4820a267f78'),
(105, 'Hạ Linh', 'halinh1@gmail.com', 'halinh1', NULL, '$2b$10$dgeAr054Q.jHYQFfHkQ8vupn2qh7e4spC4q51XfLaDGwSBjLZ75Rq', '0986499910', 'Hà Nội', NULL, NULL, NULL, NULL, 'fed8fe9f64df2d7a3f6a2beaee6466c3'),
(106, 'TrungPhuNA', 'doantotnghiep1@gmail.com', 'doantotnghiep1@gmail.com', NULL, '$2b$10$mQ0Lv8IGVAeNxHe.JBMueeRcjKKEHT92xEuHFBPbLh/f80OwLU4.a', '0986420111', 'Hà Nội', NULL, NULL, NULL, NULL, 'ace33905f6986419ddefa2fd66f06739'),
(107, 'hoàng', 'tranhoang2@gm.com', 'tranhoang22222222', NULL, '$2b$10$M/2ee37gy/QcmD5u96vypOaslxts1UtpaI7VTkBjDYfhd4mtrtb02', '1234567890', 'hanoi', NULL, NULL, NULL, NULL, '2a4850a23a2486cb545f6d9d46cefe2d'),
(108, 'hoàng', 'tranhoang3@gmail.com', 'tranhoang333', NULL, '$2b$10$VBlPZCkY1EnBbI4cHeTdUOYd3uCUh1YM8DZU8/rVrdcfIg0Rq/O.2', '12312311112', 'han', NULL, NULL, NULL, NULL, 'bf3113c6bae44e8017972e92e7dfe373'),
(109, 'halinh2', 'halinh2@gmail.com', 'halinh2@gmail.com', NULL, '$2b$10$82L/VkFLc1Jyz62n68Nr2eN7o0dkh1rO9HSPkVFvjA/adpgZx7Gia', '0909819111', 'Hà Nội', NULL, NULL, NULL, NULL, 'de444415f3744301bafe6253c7aa54c9'),
(110, 'halinh3', 'halinh3@gmail.com', 'halinh3@gmail.com', NULL, '$2b$10$2Up8aPwO4T5EIo3eawcWt.FwXw6pNo.AEayVcMVw3V/XSeEK0JTGm', '0909878222', 'Hà Nội', NULL, NULL, NULL, NULL, '4ecf09a16c5edc512ae5b46b0654bfe2'),
(111, 'halinh4', 'halinh4@gmail.com', 'halinh4@gmail.com', NULL, '$2b$10$BXfVX6JnsjCRRG4xDz/NKOTeAG/lGuWQ6fN.X1wyie4sX7EZt0VNW', '0909898111', 'Hà Nội', NULL, NULL, NULL, NULL, 'd5ba97628873b41b4f9bd5d109b2199e'),
(112, 'giang', 'lmhg061120012gmail.com', 'lmhg061120012gmail.com', NULL, '$2b$10$3tYKU7DCl2ZH5Qw932CgruNy2WQJHbRYwLdYXtkVw/ccXT0kAxkQi', '0869736896', 'Hà Nội', NULL, NULL, NULL, NULL, 'e4f41dc931ce339c288507b01f74ab57'),
(113, 'ggdfgdf', 'dgfgdf@gmail.com', 'dgfgdf@gmail.com', NULL, '$2b$10$OfY62ESeqRQiToVRgD/QX.1zZBdDvGkSfMM63j6cwfCuW1WWxAuL.', '0987878787', 'Hà Nội', NULL, NULL, NULL, NULL, '6f17ae87e4d66f5cb9d7aeca612fd9e3'),
(114, 'linhthuy', 'linhthuy@gmail.com', 'linhthuy@gmail.com', NULL, '$2b$10$uylFkCOmAd6yZmsnZoFwRepgP4nwVA6ZHkdSC4OuehvZnKrwkyAbq', '0987654321', 'Hà Nội', NULL, NULL, NULL, NULL, '5995f6619a0819d076c0de89a1838624'),
(115, 'thuy', 'hghghg@gmail.com', 'hghghg@gmail.com', NULL, '$2b$10$D0hn//fsW/gNG5Jz1NtIg.k4S7Oe.qtSAWEOM5MScA3COaL4xIdZO', '0989898989', 'Hà Nội', NULL, NULL, NULL, NULL, 'ec19d55948a7639bb39b0235f8ad3421'),
(116, 'Linh', 'thuylinh31304@gmail.com', 'thuylinh31304@gmail.com', NULL, '$2b$10$jnuaLtY/IxQA8rWjJtGnZuWl.oLvEopmS9OzTg1wG5JzJWDepZg8W', '0981075472', 'Hà Nội', NULL, NULL, NULL, NULL, 'a80b39550d8b1aa91271e0867cdf78fa'),
(117, 'fhsjfs', 'dsfsef@gmail.com', 'dsfsef@gmail.com', NULL, '$2b$10$yG1epZXGmxGc4nQ3yJqZ0.10pSLZfkhg0zlcz3qqDxOuI1Qlro8ZS', '08796784643', 'Hà Nội', NULL, NULL, NULL, NULL, '871bc8b93594f9b9ef3008904dbe1df9'),
(118, 'hoàng', 'lmhg1@gmail.com', 'lmhg1@gmail.com', NULL, '$2b$10$chPSnR0vVBjLmkN5jZZcb.5ri4zRT/agFgSqd9mNbh8.EMKhYG4j6', '0869696969', 'Hà Nội', NULL, NULL, NULL, NULL, 'aeb262dfcd6d1f3a0cb4518157451095'),
(119, 'bounta ', 'tataa@mail.test', 'tataa', NULL, '$2b$10$2MOQ8w4JT9uJlSIRs5EIp.TFFYDxE7SHOE0OKRUMRMheTX0TIVQBu', '0321654987', '23 Ta Quang Buu', NULL, NULL, NULL, NULL, '3870b4a828c37403733f5452c1b1cf29'),
(120, 'Bounta RATTANAVONG', 'tataa@mail.com', 'tataaa', NULL, '$2b$10$4k7DC1AUUHdmQCp.6q7ohuZBytpHHDiJWmJ9rKWSMCxgsOrd9Voiq', '0123456789', '23 Ta Quang Buu', NULL, NULL, NULL, NULL, 'e2f4e48b0992648de3f7664c9ba62ba7'),
(123, 'bountaa', 'bounta@gmail.com', 'bountaa', NULL, '$2b$10$wtXkZXJYJTxFdV3yRwVlSuKPJfyCDcY8XFfXub4PhBgpXNjywcLEO', '0795059211', '23ta quang buu', NULL, NULL, NULL, NULL, '916cfdf561e36cdeffc7d33817e7f8fd'),
(124, 'nguyen thi thu ha', 'nguyenthithuha@gmail.com', 'ha', NULL, '$2b$10$XPepZEpTT5O2.v1oaaVt3OwRbCijAJ9Lcovxmy527M22wOlJeLH5e', '0795059248', ' ky tuc xa bach khoa nha b7', NULL, NULL, NULL, NULL, '8ff4ec3d34487a8259ff6c452cb3dbcc'),
(125, 'khang', 'lklklk@gmail.com', 'lklklk@gmail.com', NULL, '$2b$10$WIo6niDlnp/jSdkL/nkV2eYNGGM5nr6pf8z8zMjpzRV0YUeCDldlC', '0925678902', 'Hà Nội', NULL, NULL, NULL, NULL, '0040e4ad98facc05d519ebef4fbb1131'),
(126, 'bountaa3107', 'bounta99@gmail.com', 'bountaa3107', NULL, '$2b$10$/m2h/e6mKmAc6rQmRn7AqOiKRHm1agJwHndt0/1jRKlX1nujkKYXG', '0235689147', '24ta quang buu', NULL, NULL, NULL, NULL, 'f96d2ee5580546b5cd704cc7cd7dac58'),
(127, 'Trần Hoàng Nguyễn', 'tranhoangnd3062@gmail.com', 'tranhoangnd3062@gmail.com', NULL, '$2b$10$jjbcf1MzD59arqVWqKQILuRfvFLTxjDXu4CHpO.JbwwBAinjB08/O', '0394890366', 'Hà Nội', NULL, NULL, NULL, NULL, 'aa059f55b302de3c0ef7c6f845afa84e'),
(128, 'đức', 'ducanh@gmail.com', 'ducanh@gmail.com', NULL, '$2b$10$rLoWAIXb5IGfwMNaNQYYSubCw.Di6rUTSpHnSNntvuamIo01rziG6', '0897654321', 'Hà Nội', NULL, NULL, NULL, NULL, 'e232f2e9845d99ebe5ab81b8c7b14303'),
(129, 'Lại Dũng', 'laithedung28563@gmail.com', 'laithedung28563@gmail.com', NULL, '$2b$10$LWeMPcj3gPyZ5NVHuE2PmuPEA6YQrP7P4kLpwbVNPNWKcLj9lQMZq', '0385044649', 'Vũ Ninh-Kiến Xương-Thái Bình', NULL, NULL, NULL, NULL, 'f1c00c38ef6fa0575ce40ef9dae57333'),
(130, 'Đức Anh', '0909111222@gmail.com', '0909111222@gmail.com', NULL, '$2b$10$74P5HPQNwvSkUtloDwM7OODLlWgRsgwApjnh1OnKBDHGJmO/Zkudu', '0909111222', 'Hà Nội', NULL, NULL, NULL, NULL, 'c2f7f0201106c54a158d28f363a75caf'),
(131, 'ducanh2', '0909111112@gmail.com', '0909111112@gmail.com', NULL, '$2b$10$tzJlMBA1XF6rck5Zu.h4c.CgnhXl9B4zlaD/f5N00vGW3bsX3sXUm', '0909111112', 'Hà Nội', NULL, NULL, NULL, NULL, '31228573d3196d27e565f09e582097a7'),
(132, 'ducanh3', '0909111113@gmail.com', '0909111113@gmail.com', NULL, '$2b$10$22PqfTPG52mgCKa801rp2O8kbICYdDYLwbJbcijliltIQ3PkDn.ce', '0909111113', 'Hà Nội', NULL, NULL, NULL, NULL, 'a5475a7175df7dc56eafd4f1ac21d2e4'),
(133, 'quân', 'quan123@gmail.com', 'quan123@gmail.com', NULL, '$2b$10$uINxQr68IfB/4nyl2SP2xu/GUWaH0VnWaRz24l41mmGxoZseW2soy', '0989765123', 'Hà Nội', NULL, NULL, NULL, NULL, '7e86e042bb12f334ae11db3cf2947e67'),
(134, 'tranhoang22', 'tranhoang22@gmail.com', 'tranhoang22', NULL, '$2b$10$is7sJXR3coLTPYmZGYkSx.BM82FBibCrMMp9vJk9RoMR5Uw3UMv6a', '00110110012', 'Hanoi', NULL, NULL, NULL, NULL, 'a0d9e82fb8ff3672d7fa0e938ca32686'),
(135, 'haong', 'd@gmail.com', 'd@gmail.com', NULL, '$2b$10$Rr4bZkxtZU7aXaA0AjQ32Ojh.Qv8cIXzptpnONsEse2z/Z1vi0TpS', '5678654567', 'Hà Nội', NULL, NULL, NULL, NULL, '6b001af3a57284e4caf229ff3389c122'),
(136, 'ns', 'sadad1112', 'a', NULL, '$2b$10$qKwaQ6nl10QpfQ9ApR7aW.dBz7Tp5WOkvrTuJiq5FmyQsx1B49eKy', 'ccnkv', 'h', NULL, NULL, NULL, NULL, '287c1375bbc364b2955557e42a89615e'),
(137, 'b', 'b', 'b', NULL, '$2b$10$oORoQinNB2Qv.nA11YCZIeJ5le93tj62i.VPlxp0obmgXBcreiLaK', 'b', 'b', NULL, NULL, NULL, NULL, '1e928b2baa9e4e66f537152493b8f537'),
(138, 'c', 'c', 'c', NULL, '$2b$10$OzDkkKkl.Zy/2B5Fmr53mOHeGIVZQDAA.9jGs4MkxDFxzOg6pDN4.', 'c', 'c', NULL, NULL, NULL, NULL, '8b0a31e44aadfea6213dbf940aafc3b8'),
(140, 'hoang99', 'hoang99@gm.com', 'hoang99', NULL, '$2b$10$R.KDCzPvPfUqsYIeZDo69uwsqtsUrtz5GnFxkNh6G37tKaknsfZOO', '1212123232', 'han', NULL, NULL, NULL, NULL, '40f60e785f5741320c27c62398146868'),
(141, 'hoang999', 'hoang999@gm.com', 'hoang999', NULL, '$2b$10$F57dQ.qgb5ARdgfDPgaZjeF9Sna8Cm0xqBv4Jb8Vf.PdlEK1wx/R2', '1231231111', 'han', NULL, NULL, NULL, NULL, 'f77fddd17b42de3e286d3484f9571f4b'),
(142, 'hg999', 'hg999@gm.com', 'hg999', NULL, '$2b$10$IobghlOB0iJ2RQU2kalQYOXp5wvNEFdM5CAqmKnF7uT3rGNXYwWhy', '9999888877', 'han', NULL, NULL, NULL, NULL, '2b52ba67d9b65d56b2eab68c48ff838a'),
(143, 'tranhoang369', 'tranhoang369@gm.cm', 'tranhoang369', NULL, '$2b$10$0q21IQ22XfdiVDLdjU.dBefKnQX/z9RwEXIWfF5wZbHMj1juWMzdm', '0001231568', 'h', NULL, NULL, NULL, NULL, 'e18a2d8dc5aee1c2416812378f1ac954'),
(144, 'tranhoang369', 'tranhoang3699@gm.cm', 'tranhoang3699', NULL, '$2b$10$QhWYoqZ7ZHy6HamTgf7pAugTHtLbxfiPhJthMn40jvuLz5Z7edDR2', '00012315854', 'h', NULL, NULL, NULL, NULL, '39f86c7d481a15b81a7a3ae66d05a018'),
(145, 'd', 'd', 'd', NULL, '$2b$10$Ru23cmoQ6CpNcxA.6orSFeNcND7VEzfcQ1E3gZuV.Z2XdpQqrnaGC', '5899849894', 'aa', NULL, NULL, NULL, NULL, '542740800bddc64c407d223d903d755f'),
(146, 'g', 'g', 'g', NULL, '$2b$10$Tdnnq/8w2PfS/bY.qRhQQOZ9295XVUNJu.KnULP4zfklzZdkEHX.6', '1894821897', 'g', NULL, NULL, NULL, NULL, '246b36566aca05c047d0f5038afbd4e5'),
(147, 'jdjd', 'hsbs', 'jddh', NULL, '$2b$10$XSahWL/HQ9sVApK5z4jvfeC9miNTxtslT6lYjeJ6WK3mIJFmaeN6q', 'sbdhs', 'bdhd', NULL, NULL, NULL, NULL, '814f43ee3bba56bb4be27ef29e456ca1'),
(148, 'Ta Dang Trung Hieu', 'trunghieu64.hanoi@gmail.com', 'admin', NULL, '$2b$10$qOS/VYyMzfMhlrJbnw2Rz..QCgsAKYRCriyY9c0CQLVzJiuMInmgy', '0971022791', '158 khu cong nghiep Cau Gao- Dan Phuong- Ha Noi', NULL, NULL, NULL, NULL, '1327d1ddc5656b9919aef98116a8f654'),
(149, 'Lê Sinh', 'sinhsangsua@gmail.com', 'sinhsangsua', NULL, '$2b$10$SyBHZTTmLSuMyyaau5uce.kl.1KLPzFNb2GqTbtSPnYHjeGeWEFSW', '0937297402', '30 Nam Cao', NULL, NULL, NULL, NULL, '2608626f23cf0cb9d9c59033d6047b11'),
(150, 'Rose Nguyen', 'rose@gmail.com', 'rose', NULL, '$2b$10$t1c.LdOo6D5NcIUDQL0r3.PGErexT6wWhXNKYi/k4rcyZqbSlkXnS', '0938490933', 'Hà Nội', NULL, NULL, NULL, NULL, '217c4f18384a3f1afc6e928bce03bab8'),
(151, 'bunta', 'bunta@gmail.com', 'bunta', NULL, '$2b$10$YTk5eJq9WjneYNXyhIgafuRYK1hH.VDl3AaSmsR8rNFnbI42xQyHy', '0795059249', 'ky tuc xa bach  khoa', NULL, NULL, NULL, NULL, 'e8100e86f28b7f8b379ce9a323f99473'),
(152, 'tran van a', 'test324@gmail.com', 'test', NULL, '$2b$10$Wjin/wmkJ5oN29hTk39lW.IEoLDA38HKjNqeFzibaN2Z6nqMHXBu.', '35535353253', 'Hai Bà Trưng - Hà Nội', NULL, NULL, NULL, NULL, 'd3dac96925098ceb160dcc9509b6964a'),
(153, 'h1001', 'tranhoang1001@gmail.com', 'tranhoang1001', NULL, '$2b$10$blrVgPCjU2EuyunvaLr/U.JNInitVBK1iycry5EEIfXwyMWoDN5gW', '1901405106', 'Hanoi', NULL, NULL, NULL, NULL, 'd36f2d97d51a56697711bfaaa47797c7'),
(154, 'cxvxcv', 'àasfasf', 'âdsfds', NULL, '$2b$10$KV.OzTpeyGpQh/FBud50vOf/zGmsmuC2q08EW56gDDVLly3qzvu3G', 'âsfsf', 'ầ', NULL, NULL, NULL, NULL, 'b60189dc589eb1b3d18f1bd19ea43661'),
(155, 'vdf', 'dfv', 'dvf', NULL, '$2b$10$Om9JZdra8KUSFrqND57bx.0jAa8pWhQmVyi97pTlCncEFynEbtBpa', 'dfv', 'vdfv', NULL, NULL, NULL, NULL, 'bbd4718ef3250ae7eef6f43d58149411'),
(156, 'hdh', 'hdh', 'hđhftr', NULL, '$2b$10$iIbEPCjnUVt4zdsktE7BWup9w88xW.lYxpMdgzgkVA./Jvw7WiCre', 'ulgk', 'ghk', NULL, NULL, NULL, NULL, 'b640d78a8a373ac160b95b8cbfd8b26a'),
(157, 'vbjvvbv', 'jvbbj@g.v', 'bvjb', NULL, '$2b$10$RID4oEKHpCXVf8q0wRWSPePbuHMdUKvF5xOhcrdVrquAsKqMIgyg6', '7277867878', 'vbj', NULL, NULL, NULL, NULL, 'fac9a9b2de7b8ac80726eadd0de9f342'),
(158, 'Phú Phan', 'phuphan@gmail.com', 'phuphan', NULL, '$2b$10$qhKOeFqmh7c.oJJ7/krlbOrqq/3kc5aA9wYQm22csh.hEkEdPEnGq', '0909888777', 'Hà Nội', NULL, NULL, NULL, NULL, '1cf6bff95cddd0e04d9af941ecef06f0');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `v_user_id` int(11) NOT NULL DEFAULT '0',
  `v_product_id` int(11) NOT NULL DEFAULT '0',
  `v_number` tinyint(4) NOT NULL DEFAULT '0',
  `v_status` tinyint(4) NOT NULL DEFAULT '1',
  `v_content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`id`, `v_user_id`, `v_product_id`, `v_number`, `v_status`, `v_content`, `created_at`, `updated_at`) VALUES
(5, 100, 8, 5, 1, 'â', '2022-12-27 10:20:03', NULL),
(6, 100, 8, 3, 1, 'ddddddddddd', '2022-12-27 10:21:27', NULL),
(7, 100, 213, 5, 1, 'a', '2022-12-27 10:25:38', NULL),
(8, 100, 213, 5, 1, 'a', '2022-12-27 10:25:45', NULL),
(9, 100, 217, 2, 1, 'a', '2022-12-27 19:27:13', NULL),
(10, 105, 214, 5, 1, '12121', '2022-12-28 03:35:00', NULL),
(11, 100, 212, 5, 1, 'ok', '2022-12-28 08:15:15', NULL),
(12, 100, 213, 5, 1, 'a', '2022-12-28 08:18:36', NULL),
(13, 13, 213, 5, 1, 'aaa', '2022-12-28 08:18:50', '2022-12-28 09:37:21'),
(14, 100, 213, 2, 1, 'c', '2022-12-28 08:19:01', NULL),
(15, 15, 213, 1, 1, '2', '2022-12-28 08:19:08', '2022-12-28 09:56:54'),
(16, 134, 213, 5, 1, 'hhehe', '2022-12-28 08:46:02', NULL),
(17, 134, 213, 4, 1, 'haha', '2022-12-28 08:58:37', NULL),
(18, 18, 218, 0, 1, 'test', '2023-01-04 13:59:43', '2023-01-04 14:00:17'),
(19, 129, 218, 2, 1, 'tốt', '2023-01-04 13:59:58', NULL),
(20, 129, 217, 0, 1, 'good ', '2023-01-04 14:18:59', NULL),
(21, 21, 210, 3, 1, 'very good', '2023-01-05 02:32:12', '2023-01-05 02:33:04'),
(22, 129, 210, 3, 1, 'sản phẩm raats ok\n', '2023-01-05 02:32:36', NULL),
(23, 129, 218, 4, 1, '5star', '2023-01-05 03:56:48', NULL),
(24, 100, 146, 4, 1, 'ok', '2023-01-06 08:54:52', NULL),
(25, 100, 146, 1, 1, 'aaaaaa', '2023-01-06 08:55:03', NULL),
(26, 100, 146, 3, 1, '2', '2023-01-06 08:55:10', NULL),
(27, 100, 146, 1, 1, '1', '2023-01-06 08:55:13', NULL),
(28, 100, 146, 4, 1, 'd', '2023-01-06 08:56:28', NULL),
(29, 100, 146, 2, 1, 'a', '2023-01-06 08:56:33', NULL),
(30, 100, 146, 0, 1, 'b', '2023-01-06 08:56:39', NULL),
(31, 100, 146, 0, 1, '1', '2023-01-06 09:28:26', NULL),
(32, 100, 146, 4, 1, 'ok', '2023-01-06 09:34:33', NULL),
(33, 100, 172, 4, 1, '1', '2023-01-11 02:38:20', NULL),
(34, 100, 172, 4, 1, '2', '2023-01-11 02:38:56', NULL),
(35, 100, 172, 0, 1, '3', '2023-01-11 02:48:03', NULL),
(36, 100, 172, 2, 1, '4', '2023-01-11 02:48:17', NULL),
(37, 100, 172, 2, 1, '5', '2023-01-11 02:48:29', NULL),
(38, 100, 172, 2, 1, '3', '2023-01-11 02:48:45', NULL),
(39, 100, 172, 2, 1, '3', '2023-01-11 02:48:45', NULL),
(40, 100, 172, 2, 1, '3', '2023-01-11 02:48:46', NULL),
(41, 100, 172, 2, 1, '3', '2023-01-11 02:48:46', NULL),
(42, 100, 214, 4, 1, '5', '2023-01-11 02:49:26', NULL),
(43, 100, 214, 4, 1, '5', '2023-01-11 02:54:14', NULL),
(44, 100, 214, 3, 1, '4', '2023-01-11 02:54:23', NULL),
(45, 100, 214, 2, 1, '3', '2023-01-11 02:54:28', NULL),
(46, 100, 214, 1, 1, '2', '2023-01-11 02:54:31', NULL),
(47, 100, 172, 5, 1, '5', '2023-01-11 03:35:24', NULL),
(48, 100, 172, 4, 1, '4', '2023-01-11 03:35:27', NULL),
(49, 100, 172, 3, 1, '3', '2023-01-11 03:35:31', NULL),
(50, 100, 172, 2, 1, '2', '2023-01-11 03:35:36', NULL),
(51, 100, 172, 1, 1, '1', '2023-01-11 03:35:40', NULL),
(52, 100, 172, 4, 1, '5', '2023-01-11 03:38:06', NULL),
(53, 100, 172, 4, 1, '5', '2023-01-11 03:38:10', NULL),
(54, 100, 172, 4, 1, '5', '2023-01-11 03:38:16', NULL),
(55, 100, 212, 4, 1, '5', '2023-01-11 03:39:31', NULL),
(56, 100, 212, 3, 1, '4', '2023-01-11 03:39:37', NULL),
(57, 100, 212, 4, 1, '5', '2023-01-11 03:45:18', NULL),
(58, 100, 212, 3, 1, '4', '2023-01-11 03:45:36', NULL),
(59, 100, 213, 4, 1, '5', '2023-01-11 03:54:27', NULL),
(60, 100, 213, 4, 1, '5', '2023-01-11 04:01:52', NULL),
(61, 100, 213, 4, 1, '5', '2023-01-11 04:02:06', NULL),
(62, 100, 213, 2, 1, '1', '2023-01-11 04:02:39', NULL),
(63, 100, 213, 5, 1, '5', '2023-01-11 04:03:02', NULL),
(64, 100, 213, 1, 1, '1', '2023-01-11 04:03:44', NULL),
(65, 100, 213, 5, 1, '5', '2023-01-11 04:37:06', NULL),
(66, 100, 213, 5, 1, '5', '2023-01-11 04:37:11', NULL),
(67, 100, 213, 5, 1, '5', '2023-01-11 04:37:13', NULL),
(68, 100, 213, 5, 1, '5', '2023-01-11 04:37:15', NULL),
(69, 100, 213, 5, 1, '5', '2023-01-11 04:37:17', NULL),
(70, 100, 213, 5, 1, '5', '2023-01-11 04:37:19', NULL),
(71, 100, 213, 1, 1, '1', '2023-01-11 04:37:23', NULL),
(72, 100, 213, 2, 1, '2', '2023-01-11 04:37:26', NULL),
(73, 100, 213, 3, 1, '3', '2023-01-11 04:38:16', NULL),
(74, 100, 213, 4, 1, '4', '2023-01-11 04:38:20', NULL),
(75, 100, 213, 5, 1, '5', '2023-01-11 04:44:24', NULL),
(76, 100, 213, 5, 1, '5', '2023-01-11 04:44:33', NULL),
(77, 100, 146, 5, 1, '5', '2023-01-11 05:00:30', NULL),
(78, 100, 146, 5, 1, '5', '2023-01-11 06:41:15', NULL),
(79, 100, 33, 5, 1, '5', '2023-01-11 06:49:54', NULL),
(80, 100, 170, 2, 1, '2', '2023-01-11 06:53:52', NULL),
(81, 100, 213, 5, 1, '5', '2023-01-11 07:08:21', NULL),
(82, 100, 213, 3, 1, '4', '2023-01-11 07:08:29', NULL),
(83, 100, 213, 4, 1, '4', '2023-01-11 08:25:44', NULL),
(84, 100, 213, 5, 1, 'được', '2023-01-11 08:35:15', NULL),
(85, 149, 172, 5, 1, 'đá', '2023-02-01 15:10:39', NULL),
(86, 152, 223, 3, 1, 'test', '2023-02-13 13:46:33', NULL),
(87, 105, 208, 5, 1, 'Đúng là sản phẩm tuyệt vời, cảm ơn đã cung cấp', '2023-02-19 16:51:13', NULL),
(88, 158, 4, 5, 4, 'Sản phẩm hay quá', '2023-06-28 13:30:11', NULL),
(89, 158, 4, 5, 4, 'Sản phẩm hay quá', '2023-06-28 13:31:52', NULL),
(90, 158, 4, 5, 4, 'Sản phẩm hay quá', '2023-06-28 13:32:10', NULL),
(91, 158, 198, 5, 4, 'Tuyệt vời', '2023-06-28 13:34:54', NULL),
(92, 158, 217, 5, 4, 'Ngon thế nhỉ, thích vãi', '2023-06-28 13:36:59', NULL),
(93, 105, 212, 5, 4, 'Sản phẩm hay quá', '2023-07-11 00:31:46', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `admins_email_unique` (`email`) USING BTREE,
  ADD UNIQUE KEY `admins_phone_unique` (`phone`) USING BTREE;

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `articles_a_name_unique` (`a_name`) USING BTREE,
  ADD KEY `articles_a_slug_index` (`a_slug`) USING BTREE,
  ADD KEY `articles_a_hot_index` (`a_hot`) USING BTREE,
  ADD KEY `articles_a_active_index` (`a_active`) USING BTREE,
  ADD KEY `articles_a_menu_id_index` (`a_menu_id`) USING BTREE;

--
-- Indexes for table `articles_tags`
--
ALTER TABLE `articles_tags`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `articles_tags_at_article_id_index` (`at_article_id`) USING BTREE,
  ADD KEY `articles_tags_at_tag_id_index` (`at_tag_id`) USING BTREE;

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `categories_name_unique` (`name`) USING BTREE,
  ADD KEY `categories_slug_index` (`slug`) USING BTREE;

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `dealers`
--
ALTER TABLE `dealers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `keywords`
--
ALTER TABLE `keywords`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `keywords_k_name_unique` (`k_name`) USING BTREE;

--
-- Indexes for table `logs_api`
--
ALTER TABLE `logs_api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `menus_mn_name_unique` (`mn_name`) USING BTREE,
  ADD UNIQUE KEY `menus_mn_slug_unique` (`mn_slug`) USING BTREE;

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`) USING BTREE;

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `products_name_unique` (`name`) USING BTREE,
  ADD KEY `products_slug_index` (`slug`) USING BTREE,
  ADD KEY `products_hot_index` (`hot`) USING BTREE,
  ADD KEY `products_active_index` (`active`) USING BTREE;

--
-- Indexes for table `products_images`
--
ALTER TABLE `products_images`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `products_keywords`
--
ALTER TABLE `products_keywords`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `products_keywords_pk_product_id_index` (`pk_product_id`) USING BTREE,
  ADD KEY `products_keywords_pk_keyword_id_index` (`pk_keyword_id`) USING BTREE;

--
-- Indexes for table `refresh_tokens`
--
ALTER TABLE `refresh_tokens`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `tags_t_name_unique` (`t_name`) USING BTREE;

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `transactions_t_user_id_index` (`t_user_id`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `users_phone_unique` (`phone`) USING BTREE,
  ADD UNIQUE KEY `users_email_unique` (`email`) USING BTREE;

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `articles_tags`
--
ALTER TABLE `articles_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dealers`
--
ALTER TABLE `dealers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `keywords`
--
ALTER TABLE `keywords`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs_api`
--
ALTER TABLE `logs_api`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=284;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;

--
-- AUTO_INCREMENT for table `products_images`
--
ALTER TABLE `products_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products_keywords`
--
ALTER TABLE `products_keywords`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refresh_tokens`
--
ALTER TABLE `refresh_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

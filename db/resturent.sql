-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2022 at 10:31 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `resturent`
--

-- --------------------------------------------------------

--
-- Table structure for table `assign_menu_items`
--

CREATE TABLE `assign_menu_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `special_menu_id` int(11) NOT NULL,
  `special_item_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Layne Lehner', 'miss-emely-blanda-iv', NULL, '2022-06-18 01:51:42', '2022-06-18 01:51:42'),
(2, 'Arden Blanda', 'prof-keagan-koss', NULL, '2022-06-18 01:51:42', '2022-06-18 01:51:42'),
(3, 'Kasandra Yundt', 'luther-bode', NULL, '2022-06-18 01:51:42', '2022-06-18 01:51:42'),
(4, 'Gregoria Moore', 'aaliyah-kiehn', NULL, '2022-06-18 01:51:43', '2022-06-18 01:51:43'),
(5, 'Gunner Torphy', 'ms-samara-bosco-sr', NULL, '2022-06-18 01:51:43', '2022-06-18 01:51:43');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 39, 1, 'ok', '2022-06-18 01:55:47', '2022-06-18 01:55:47'),
(2, 39, 2, 'dd', '2022-06-18 02:12:17', '2022-06-18 02:12:17'),
(3, 32, 1, 'vv', '2022-06-18 02:23:00', '2022-06-18 02:23:00');

-- --------------------------------------------------------

--
-- Table structure for table `comment_replies`
--

CREATE TABLE `comment_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comment_replies`
--

INSERT INTO `comment_replies` (`id`, `comment_id`, `user_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '@Md. Samiul Hoque ok', '2022-06-18 01:57:44', '2022-06-18 01:57:44');

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
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logos`
--

CREATE TABLE `logos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deletable` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `description`, `deletable`, `created_at`, `updated_at`) VALUES
(1, 'backend-sidebar', 'This is backend sidebar', 0, '2022-06-18 01:51:40', '2022-06-18 01:51:40'),
(2, 'frontend-header', 'This is frontend header', 0, '2022-06-18 01:51:41', '2022-06-18 01:51:41');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('item','divider') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'item',
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `divider_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `type`, `parent_id`, `order`, `title`, `divider_title`, `url`, `target`, `icon_class`, `created_at`, `updated_at`) VALUES
(1, 1, 'divider', NULL, 1, NULL, 'MENUS', NULL, '_self', NULL, '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(2, 1, 'item', NULL, 2, 'Dashboard', NULL, '/admin/dashboard', '_self', 'metismenu-icon pe-7s-rocket', '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(3, 1, 'divider', NULL, 3, NULL, 'ACCESS CONTROL', NULL, '_self', NULL, '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(4, 1, 'item', NULL, 4, 'Roles', NULL, '/admin/roles', '_self', 'metismenu-icon pe-7s-check', '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(5, 1, 'item', NULL, 5, 'User', NULL, '/admin/users', '_self', 'metismenu-icon pe-7s-users', '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(6, 1, 'divider', NULL, 6, NULL, 'SYSTEM', NULL, '_self', NULL, '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(7, 1, 'item', NULL, 7, 'Menus', NULL, '/admin/menus', '_self', 'metismenu-icon pe-7s-menu', '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(8, 1, 'item', NULL, 8, 'Backup', NULL, '/admin/backups', '_self', 'metismenu-icon pe-7s-cloud', '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(9, 1, 'item', NULL, 9, 'Settings', NULL, '/admin/settings/general', '_self', 'metismenu-icon pe-7s-settings', '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(10, 1, 'divider', NULL, 10, NULL, 'SETUP MANAGEMENT', NULL, '_self', NULL, '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(11, 1, 'item', NULL, 11, 'Logos', NULL, '/admin/logos', '_self', 'metismenu-icon pe-7s-diamond', '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(12, 1, 'item', NULL, 12, 'Sliders', NULL, '/admin/sliders', '_self', 'metismenu-icon pe-7s-diamond', '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(13, 1, 'item', NULL, 13, 'Galleries', NULL, '/admin/galleries', '_self', 'metismenu-icon pe-7s-album', '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(14, 1, 'item', NULL, 14, 'Stuffs', NULL, '/admin/stuffs', '_self', 'metismenu-icon pe-7s-users', '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(15, 1, 'item', NULL, 15, 'Special Menus', NULL, '/admin/food/special-menus', '_self', 'metismenu-icon pe-7s-burger', '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(16, 1, 'item', NULL, 16, 'Special Items', NULL, '/admin/food/special-items', '_self', 'metismenu-icon pe-7s-burger', '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(17, 1, 'item', NULL, 17, 'Assign Special Menu Items', NULL, '/admin/food/assign-menu-items', '_self', 'metismenu-icon pe-7s-burger', '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(18, 2, 'item', NULL, 1, 'Home', NULL, '/', '_self', NULL, '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(19, 2, 'item', NULL, 2, 'Menu', NULL, '/menu', '_self', NULL, '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(20, 2, 'item', NULL, 3, 'About', NULL, '/about', '_self', NULL, '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(21, 2, 'item', NULL, 4, 'Pages', NULL, '#', '_self', NULL, '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(22, 2, 'item', NULL, 5, 'Reservation', NULL, '/reservation', '_self', NULL, '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(23, 2, 'item', NULL, 6, 'Stuff', NULL, '/stuff', '_self', NULL, '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(24, 2, 'item', NULL, 7, 'Gallery', NULL, '/gallery', '_self', NULL, '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(25, 2, 'item', NULL, 8, 'Blog', NULL, '#', '_self', NULL, '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(26, 2, 'item', NULL, 9, 'Blog', NULL, '/blog', '_self', NULL, '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(27, 2, 'item', NULL, 10, 'Contact', NULL, '/contact', '_self', NULL, '2022-06-18 01:51:41', '2022-06-18 01:51:41');

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
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_02_23_141111_create_modules_table', 1),
(6, '2022_02_23_141135_create_permissions_table', 1),
(7, '2022_02_23_141719_create_roles_table', 1),
(8, '2022_02_23_142849_create_permission_role_table', 1),
(9, '2022_02_23_150018_create_menus_table', 1),
(10, '2022_02_23_150027_create_menu_items_table', 1),
(11, '2022_02_23_150537_create_settings_table', 1),
(12, '2022_02_24_110219_create_logos_table', 1),
(13, '2022_02_26_180219_create_sliders_table', 1),
(14, '2022_02_27_194800_create_galleries_table', 1),
(15, '2022_02_27_204511_create_stuffs_table', 1),
(16, '2022_02_28_132950_create_stuff_positions_table', 1),
(17, '2022_03_02_131127_create_special_items_table', 1),
(18, '2022_03_02_131312_create_special_menus_table', 1),
(19, '2022_03_08_143853_create_assign_menu_items_table', 1),
(20, '2022_06_15_064312_create_tags_table', 1),
(21, '2022_06_15_064703_create_categories_table', 1),
(22, '2022_06_15_064941_create_posts_table', 1),
(23, '2022_06_17_151507_create_comments_table', 1),
(24, '2022_06_17_151652_create_comment_replies_table', 1),
(25, '2022_06_18_074959_create_post_user_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin Dashboard', '2022-06-18 01:51:34', '2022-06-18 01:51:34'),
(2, 'Role Management', '2022-06-18 01:51:35', '2022-06-18 01:51:35'),
(3, 'Backups', '2022-06-18 01:51:35', '2022-06-18 01:51:35'),
(4, 'User Management', '2022-06-18 01:51:35', '2022-06-18 01:51:35'),
(5, 'Logo Management', '2022-06-18 01:51:35', '2022-06-18 01:51:35'),
(6, 'Slider Management', '2022-06-18 01:51:35', '2022-06-18 01:51:35'),
(7, 'Gallery Management', '2022-06-18 01:51:36', '2022-06-18 01:51:36'),
(8, 'Stuff Management', '2022-06-18 01:51:36', '2022-06-18 01:51:36'),
(9, 'Menu Management', '2022-06-18 01:51:36', '2022-06-18 01:51:36'),
(10, 'Special Food Menu Management', '2022-06-18 01:51:37', '2022-06-18 01:51:37'),
(11, 'Special Food Item Management', '2022-06-18 01:51:37', '2022-06-18 01:51:37'),
(12, 'Category Management', '2022-06-18 01:51:37', '2022-06-18 01:51:37'),
(13, 'Tag Management', '2022-06-18 01:51:37', '2022-06-18 01:51:37'),
(14, 'Post Management', '2022-06-18 01:51:38', '2022-06-18 01:51:38');

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `module_id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 1, 'Access Dashboard', 'admin.dashboard', '2022-06-18 01:51:35', '2022-06-18 01:51:35'),
(2, 2, 'Access Role', 'admin.roles.index', '2022-06-18 01:51:35', '2022-06-18 01:51:35'),
(3, 2, 'Create Role', 'admin.roles.create', '2022-06-18 01:51:35', '2022-06-18 01:51:35'),
(4, 2, 'Edit Role', 'admin.roles.edit', '2022-06-18 01:51:35', '2022-06-18 01:51:35'),
(5, 2, 'Delete Role', 'admin.roles.destroy', '2022-06-18 01:51:35', '2022-06-18 01:51:35'),
(6, 3, 'Access Backup', 'admin.backups.index', '2022-06-18 01:51:35', '2022-06-18 01:51:35'),
(7, 3, 'Create Backup', 'admin.backups.create', '2022-06-18 01:51:35', '2022-06-18 01:51:35'),
(8, 3, 'Download Backup', 'admin.backups.download', '2022-06-18 01:51:35', '2022-06-18 01:51:35'),
(9, 3, 'Delete Backup', 'admin.backups.destroy', '2022-06-18 01:51:35', '2022-06-18 01:51:35'),
(10, 4, 'Access User', 'admin.users.index', '2022-06-18 01:51:35', '2022-06-18 01:51:35'),
(11, 4, 'Create User', 'admin.users.create', '2022-06-18 01:51:35', '2022-06-18 01:51:35'),
(12, 4, 'Edit User', 'admin.users.edit', '2022-06-18 01:51:35', '2022-06-18 01:51:35'),
(13, 4, 'Delete User', 'admin.users.destroy', '2022-06-18 01:51:35', '2022-06-18 01:51:35'),
(14, 5, 'Access Logo', 'admin.logos.index', '2022-06-18 01:51:35', '2022-06-18 01:51:35'),
(15, 5, 'Create Logo', 'admin.logos.create', '2022-06-18 01:51:35', '2022-06-18 01:51:35'),
(16, 5, 'Edit Logo', 'admin.logos.edit', '2022-06-18 01:51:35', '2022-06-18 01:51:35'),
(17, 5, 'Delete Logo', 'admin.logos.destroy', '2022-06-18 01:51:35', '2022-06-18 01:51:35'),
(18, 6, 'Access Slider', 'admin.sliders.index', '2022-06-18 01:51:35', '2022-06-18 01:51:35'),
(19, 6, 'Create Slider', 'admin.sliders.create', '2022-06-18 01:51:35', '2022-06-18 01:51:35'),
(20, 6, 'Edit Slider', 'admin.sliders.edit', '2022-06-18 01:51:35', '2022-06-18 01:51:35'),
(21, 6, 'Delete Slider', 'admin.sliders.destroy', '2022-06-18 01:51:35', '2022-06-18 01:51:35'),
(22, 6, 'Unactivate Slider', 'admin.sliders.unactivate', '2022-06-18 01:51:36', '2022-06-18 01:51:36'),
(23, 6, 'Activate Slider', 'admin.sliders.activate', '2022-06-18 01:51:36', '2022-06-18 01:51:36'),
(24, 7, 'Access Gallery', 'admin.galleries.index', '2022-06-18 01:51:36', '2022-06-18 01:51:36'),
(25, 7, 'Create Gallery', 'admin.galleries.create', '2022-06-18 01:51:36', '2022-06-18 01:51:36'),
(26, 7, 'Edit Gallery', 'admin.galleries.edit', '2022-06-18 01:51:36', '2022-06-18 01:51:36'),
(27, 7, 'Delete Gallery', 'admin.galleries.destroy', '2022-06-18 01:51:36', '2022-06-18 01:51:36'),
(28, 8, 'Access Stuff', 'admin.stuffs.index', '2022-06-18 01:51:36', '2022-06-18 01:51:36'),
(29, 8, 'Create Stuff', 'admin.stuffs.create', '2022-06-18 01:51:36', '2022-06-18 01:51:36'),
(30, 8, 'Edit Stuff', 'admin.stuffs.edit', '2022-06-18 01:51:36', '2022-06-18 01:51:36'),
(31, 8, 'Delete Stuff', 'admin.stuffs.destroy', '2022-06-18 01:51:36', '2022-06-18 01:51:36'),
(32, 9, 'Access Menus', 'admin.menus.index', '2022-06-18 01:51:36', '2022-06-18 01:51:36'),
(33, 9, 'Access Menus Builder', 'admin.menus.builder', '2022-06-18 01:51:36', '2022-06-18 01:51:36'),
(34, 9, 'Create Menu', 'admin.menus.create', '2022-06-18 01:51:37', '2022-06-18 01:51:37'),
(35, 9, 'Edit Menu', 'admin.menus.edit', '2022-06-18 01:51:37', '2022-06-18 01:51:37'),
(36, 9, 'Delete Menu', 'admin.menus.destroy', '2022-06-18 01:51:37', '2022-06-18 01:51:37'),
(37, 10, 'Access Special Menu', 'admin.food.special-menus.index', '2022-06-18 01:51:37', '2022-06-18 01:51:37'),
(38, 10, 'Create Special Menu', 'admin.food.special-menus.create', '2022-06-18 01:51:37', '2022-06-18 01:51:37'),
(39, 10, 'Edit Special Menu', 'admin.food.special-menus.edit', '2022-06-18 01:51:37', '2022-06-18 01:51:37'),
(40, 10, 'Delete Special Menu', 'admin.food.special-menus.destroy', '2022-06-18 01:51:37', '2022-06-18 01:51:37'),
(41, 11, 'Access Special Item', 'admin.food.special-items.index', '2022-06-18 01:51:37', '2022-06-18 01:51:37'),
(42, 11, 'Create Special Item', 'admin.food.special-items.create', '2022-06-18 01:51:37', '2022-06-18 01:51:37'),
(43, 11, 'Edit Special Item', 'admin.food.special-items.edit', '2022-06-18 01:51:37', '2022-06-18 01:51:37'),
(44, 11, 'Delete Special Item', 'admin.food.special-items.destroy', '2022-06-18 01:51:37', '2022-06-18 01:51:37'),
(45, 11, 'Access Assign Menu Item', 'admin.food.assign-menu-items.index', '2022-06-18 01:51:37', '2022-06-18 01:51:37'),
(46, 11, 'Create Assign Menu Item', 'admin.food.assign-menu-items.create', '2022-06-18 01:51:37', '2022-06-18 01:51:37'),
(47, 11, 'Edit Assign Menu Item', 'admin.food.assign-menu-items.edit', '2022-06-18 01:51:37', '2022-06-18 01:51:37'),
(48, 11, 'Edit Assign Menu Item', 'admin.food.assign-menu-items.show', '2022-06-18 01:51:37', '2022-06-18 01:51:37'),
(49, 11, 'Delete Assign Menu Item', 'admin.food.assign-menu-items.destroy', '2022-06-18 01:51:37', '2022-06-18 01:51:37'),
(50, 12, 'Access Category', 'admin.blog.categories.index', '2022-06-18 01:51:37', '2022-06-18 01:51:37'),
(51, 12, 'Create Category', 'admin.blog.categories.create', '2022-06-18 01:51:37', '2022-06-18 01:51:37'),
(52, 12, 'Edit Category', 'admin.blog.categories.edit', '2022-06-18 01:51:37', '2022-06-18 01:51:37'),
(53, 12, 'Delete Category', 'admin.blog.categories.destroy', '2022-06-18 01:51:37', '2022-06-18 01:51:37'),
(54, 13, 'Access Tag', 'admin.blog.tags.index', '2022-06-18 01:51:37', '2022-06-18 01:51:37'),
(55, 13, 'Create Tag', 'admin.blog.tags.create', '2022-06-18 01:51:37', '2022-06-18 01:51:37'),
(56, 13, 'Edit Tag', 'admin.blog.tags.edit', '2022-06-18 01:51:38', '2022-06-18 01:51:38'),
(57, 13, 'Delete Tag', 'admin.blog.tags.destroy', '2022-06-18 01:51:38', '2022-06-18 01:51:38'),
(58, 14, 'Access Post', 'admin.blog.posts.index', '2022-06-18 01:51:38', '2022-06-18 01:51:38'),
(59, 14, 'Create Post', 'admin.blog.posts.create', '2022-06-18 01:51:38', '2022-06-18 01:51:38'),
(60, 14, 'Edit Post', 'admin.blog.posts.edit', '2022-06-18 01:51:38', '2022-06-18 01:51:38'),
(61, 14, 'Delete Post', 'admin.blog.posts.destroy', '2022-06-18 01:51:38', '2022-06-18 01:51:38'),
(62, 14, 'Show Post', 'admin.blog.posts.show', '2022-06-18 01:51:38', '2022-06-18 01:51:38');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 3, 1, NULL, NULL),
(4, 4, 1, NULL, NULL),
(5, 5, 1, NULL, NULL),
(6, 6, 1, NULL, NULL),
(7, 7, 1, NULL, NULL),
(8, 8, 1, NULL, NULL),
(9, 9, 1, NULL, NULL),
(10, 10, 1, NULL, NULL),
(11, 11, 1, NULL, NULL),
(12, 12, 1, NULL, NULL),
(13, 13, 1, NULL, NULL),
(14, 14, 1, NULL, NULL),
(15, 15, 1, NULL, NULL),
(16, 16, 1, NULL, NULL),
(17, 17, 1, NULL, NULL),
(18, 18, 1, NULL, NULL),
(19, 19, 1, NULL, NULL),
(20, 20, 1, NULL, NULL),
(21, 21, 1, NULL, NULL),
(22, 22, 1, NULL, NULL),
(23, 23, 1, NULL, NULL),
(24, 24, 1, NULL, NULL),
(25, 25, 1, NULL, NULL),
(26, 26, 1, NULL, NULL),
(27, 27, 1, NULL, NULL),
(28, 28, 1, NULL, NULL),
(29, 29, 1, NULL, NULL),
(30, 30, 1, NULL, NULL),
(31, 31, 1, NULL, NULL),
(32, 32, 1, NULL, NULL),
(33, 33, 1, NULL, NULL),
(34, 34, 1, NULL, NULL),
(35, 35, 1, NULL, NULL),
(36, 36, 1, NULL, NULL),
(37, 37, 1, NULL, NULL),
(38, 38, 1, NULL, NULL),
(39, 39, 1, NULL, NULL),
(40, 40, 1, NULL, NULL),
(41, 41, 1, NULL, NULL),
(42, 42, 1, NULL, NULL),
(43, 43, 1, NULL, NULL),
(44, 44, 1, NULL, NULL),
(45, 45, 1, NULL, NULL),
(46, 46, 1, NULL, NULL),
(47, 47, 1, NULL, NULL),
(48, 48, 1, NULL, NULL),
(49, 49, 1, NULL, NULL),
(50, 50, 1, NULL, NULL),
(51, 51, 1, NULL, NULL),
(52, 52, 1, NULL, NULL),
(53, 53, 1, NULL, NULL),
(54, 54, 1, NULL, NULL),
(55, 55, 1, NULL, NULL),
(56, 56, 1, NULL, NULL),
(57, 57, 1, NULL, NULL),
(58, 58, 1, NULL, NULL),
(59, 59, 1, NULL, NULL),
(60, 60, 1, NULL, NULL),
(61, 61, 1, NULL, NULL),
(62, 62, 1, NULL, NULL),
(63, 1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_i` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_ii` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `image`, `description`, `description_i`, `description_ii`, `category_id`, `user_id`, `published_at`, `created_at`, `updated_at`) VALUES
(1, 'Sit omnis ad minus illo repellat commodi.', 'quisquam-voluptas-maiores-modi-est-dolorem-deleniti', 'https://picsum.photos/id/102/640/480.jpg', 'Fugit iste numquam aliquam impedit aut provident. A et provident tenetur minima rerum nihil nostrum aut. Aut rem molestiae incidunt commodi omnis odit eum maiores. Autem minus eos magnam debitis accusamus. Quis quasi dicta enim. Id nobis molestiae voluptas ea aperiam enim velit saepe. Quasi quis qui quam nemo qui voluptas nihil. Velit reiciendis id vel repudiandae mollitia esse quia.', 'Omnis minima ut modi provident natus. Non eum consectetur laboriosam veniam aut soluta quia. Quia qui et ut. Culpa iste nostrum unde laudantium.', 'Cupiditate quo distinctio dolores tenetur. At et alias dolorem eum sint ipsum libero velit.', 4, 1, NULL, '2022-06-18 01:51:43', '2022-06-18 01:51:43'),
(2, 'Ullam odio quisquam et impedit.', 'reiciendis-molestiae-dicta-quas-ipsa', 'https://picsum.photos/id/85/640/480.jpg', 'Cumque est quaerat officia rerum pariatur optio. Quaerat corporis esse libero earum consequatur animi praesentium. Nisi dolores omnis et autem veritatis. Aspernatur consequatur aut architecto qui odio velit corporis.', 'Nisi illum cumque repudiandae nemo aut quaerat id eligendi. Mollitia error aliquam error nobis eos aut. Aut placeat eius aliquam itaque consequatur voluptatibus quia. Quo adipisci nostrum ipsa animi debitis ab.', 'Nesciunt eum non quia. Impedit aut magni repudiandae ut et. Officia saepe et eius corporis sunt.', 4, 1, NULL, '2022-06-18 01:51:43', '2022-06-18 01:51:43'),
(3, 'Architecto et qui tenetur quaerat deserunt soluta ut.', 'omnis-rem-ullam-et-aliquam-similique-atque', 'https://picsum.photos/id/127/640/480.jpg', 'Voluptas neque et nulla sed dolorem. Et voluptas adipisci pariatur reiciendis. Dolores perferendis enim modi asperiores. Eos optio sit illum fugit nihil blanditiis dignissimos. Voluptatem itaque voluptatem velit. Quia voluptatem eum voluptate nulla ut omnis. Culpa dolores aut sapiente rerum. Iste voluptatem harum ab sunt enim numquam earum.', 'Velit tempore reprehenderit debitis animi minima. Laborum et tenetur est est et dolorem. Cum tenetur nisi doloribus eum delectus repudiandae et.', 'Et velit distinctio molestias accusamus consequuntur aut. Quis non eum modi incidunt atque porro.', 2, 1, NULL, '2022-06-18 01:51:43', '2022-06-18 01:51:43'),
(4, 'Facere dolorem quam aliquam magni et voluptatem suscipit earum.', 'non-eos-est-aut-quam-laboriosam-reiciendis', 'https://picsum.photos/id/201/640/480.jpg', 'Aut veritatis sit dolores ullam. Maiores quia debitis et ut deleniti. Ut iste odio ut ipsam magnam. Numquam sed nam fugiat qui. Eos minus sit illum id quidem. Voluptas et excepturi eum magni nobis consequatur adipisci. Ad itaque vero magnam fugiat eum impedit illum. Impedit aut quibusdam ea voluptatibus soluta. Iste aut error aut voluptas quia.', 'Iste hic tenetur illum voluptatem. Porro error unde facilis facere cumque enim natus. Commodi magni maxime officia ut ipsum repellat dolorum.', 'Natus ut vitae aut neque unde. Et voluptatem at qui corrupti.', 5, 1, NULL, '2022-06-18 01:51:43', '2022-06-18 01:51:43'),
(5, 'Nam distinctio delectus consequatur.', 'omnis-mollitia-est-cum-laboriosam-a-et-repellendus-officiis', 'https://picsum.photos/id/41/640/480.jpg', 'Quaerat aliquam saepe laudantium facilis. Quasi est vitae ut. Ipsa consequuntur ad modi optio alias repellendus sed. Est labore eligendi corrupti odio odit blanditiis debitis enim. Error omnis temporibus est. Ex neque rerum nam deserunt inventore sed. Odit qui ut ducimus. Porro illo et deserunt. Et molestias facilis aut iure repellat aut. Natus consectetur nobis quos fugit aut sit neque.', 'Eaque nostrum consequuntur fuga quia maiores placeat libero dicta. A ut adipisci veniam laboriosam maxime a.', 'A necessitatibus enim eaque consequatur non ratione alias. Earum ratione quo quos commodi eum vel.', 4, 1, NULL, '2022-06-18 01:51:43', '2022-06-18 01:51:43'),
(6, 'Vitae ipsum voluptatibus eum magni et dolorum.', 'aperiam-illo-enim-quos-saepe', 'https://picsum.photos/id/294/640/480.jpg', 'Rerum officiis provident molestiae perspiciatis ipsa consequatur ut asperiores. Sequi voluptatem sunt et corporis qui omnis excepturi. Facere consequatur velit dolorem accusantium dicta et est. Inventore sequi accusamus repudiandae officia qui. Commodi repellendus dolor impedit reprehenderit voluptatem iure excepturi. Velit neque at saepe atque quod.', 'Magni sed culpa quia voluptate molestiae. A non et pariatur praesentium. Voluptatem numquam illo praesentium vero. Ab expedita id enim et sequi ipsa rerum.', 'Aut voluptates esse magni voluptate. Quis quaerat veniam natus est eaque architecto.', 5, 1, NULL, '2022-06-18 01:51:43', '2022-06-18 01:51:43'),
(7, 'Voluptate tempore nisi et in qui.', 'iure-dolores-et-omnis-et-qui-possimus-nisi', 'https://picsum.photos/id/45/640/480.jpg', 'A laudantium odio dolores ut perferendis exercitationem quisquam. Ratione expedita omnis quo ea tempora. Eveniet et eveniet inventore vel. Et amet numquam vel magnam velit totam asperiores. Voluptatem sapiente blanditiis laudantium. Optio at laudantium consequatur fugit. Sit soluta quia quos eum sed rem autem. Delectus ut et dignissimos.', 'Consectetur voluptas veniam occaecati cum. Sed dolore fugit voluptatum est reprehenderit qui aspernatur. Molestias eligendi nostrum est sequi. Eos sed soluta cum quia molestiae quasi.', 'Aliquam placeat deserunt dolor ea dolorum. Et sunt voluptate id at.', 5, 1, NULL, '2022-06-18 01:51:43', '2022-06-18 01:51:43'),
(8, 'Eaque dicta numquam et occaecati dolores iure dicta.', 'voluptatem-repellat-unde-tempora-ut', 'https://picsum.photos/id/187/640/480.jpg', 'Magni eligendi id mollitia. Asperiores et enim dignissimos rerum consequuntur. Voluptatum fugit voluptas laudantium qui. Mollitia voluptate aliquid ipsa ex iste. Maxime ad unde est molestiae ea vitae. Ratione sit officia et.', 'Nam tenetur quia a illo consequatur id. Veritatis sunt aliquam quas est officia vitae perspiciatis optio. Voluptas et maxime nobis. Ducimus a repudiandae voluptatem eius quia.', 'Vero ad eaque ut sapiente labore. Dolorem id minima ut nemo quia.', 3, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(9, 'Deserunt autem commodi ipsa.', 'at-id-nisi-et-laborum-velit-commodi', 'https://picsum.photos/id/126/640/480.jpg', 'Culpa et illum et dolores placeat et et. Omnis aliquid provident est explicabo. Magni reprehenderit quis rerum. Similique doloribus sed ipsa aut dolorem. Inventore dolorum a eius ex. Sit nemo sunt consequatur necessitatibus velit. Nihil alias accusamus rerum doloremque.', 'Praesentium soluta natus dolorum aut laborum ut debitis. Nam non ut aut aut in recusandae nisi. Dolorem deleniti qui accusamus rerum aut. Et accusantium vitae voluptas. Eligendi at corrupti perferendis illo.', 'Totam modi ratione sed. In dolorem consequuntur non. Dolores maiores enim sunt assumenda.', 2, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(10, 'Repellendus non quod ab maxime neque consequatur.', 'iure-non-aut-rem-vero-repellendus', 'https://picsum.photos/id/79/640/480.jpg', 'Ex corporis sint nihil quo. Incidunt et explicabo et dolorem. Recusandae quia quis velit ipsam atque voluptates. Ut est omnis est adipisci corporis. Qui sed libero atque voluptas officiis sint qui. Amet dolor impedit velit quam esse velit delectus. At voluptatibus nesciunt sapiente sint et.', 'Aut doloremque inventore facere vel eaque. Libero dolor qui eum natus eum voluptatibus dolorem. Mollitia dolorem asperiores aut quos non cumque. Eum voluptatem qui autem.', 'Modi deserunt sit fuga eum. Quia dolore sit saepe incidunt nostrum distinctio eum dolores.', 3, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(11, 'Aspernatur molestias itaque sed et consectetur iste.', 'nobis-ut-quis-beatae', 'https://picsum.photos/id/275/640/480.jpg', 'Consequatur sapiente pariatur fugit molestiae repellendus sed a. Iure explicabo blanditiis libero. Sapiente porro id non accusamus eos harum. Iste ea et dolore autem expedita. Dolorem culpa at hic ullam.', 'Aut itaque nostrum autem ratione. Ut ea voluptatum aspernatur doloremque reprehenderit. Quis eum ut aut accusamus id non quis. Sunt soluta accusantium a hic eaque similique fugiat et.', 'Ea sit eum sint est. Tempore voluptates vitae rerum id quas eum vel qui.', 5, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(12, 'Porro non commodi eius nesciunt sit ipsam officia laudantium.', 'aliquid-dolorem-esse-eum-nemo-labore-sit-perferendis', 'https://picsum.photos/id/126/640/480.jpg', 'Consequatur perferendis a voluptas occaecati qui suscipit expedita. Vero exercitationem deserunt totam dicta pariatur. Et sit et nobis et sed id alias. Qui sapiente provident expedita velit modi nihil ipsum. A omnis doloribus qui. Qui voluptatem temporibus rerum aliquam quam recusandae soluta ut.', 'Et sed ut quia. Provident consequuntur enim odio eum illo itaque. Recusandae eligendi pariatur et accusamus voluptas et.', 'Alias est ut fugiat magnam voluptatem. Numquam soluta sit sint voluptas minus sit.', 3, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(13, 'Rerum velit asperiores minus esse sint sapiente quis.', 'quia-commodi-veniam-alias-dolores-fuga-qui-tempore-explicabo', 'https://picsum.photos/id/254/640/480.jpg', 'Optio animi dolor ut eaque explicabo. Autem ad aut quibusdam occaecati. Repudiandae pariatur minima molestias est. Dolores ut quae eos voluptatem ad. Placeat adipisci corporis ducimus est quam. Ut sint sunt beatae dignissimos. Est quasi assumenda possimus assumenda autem accusamus quidem numquam. Delectus est consequatur sapiente quibusdam ipsam praesentium est voluptatibus.', 'Rerum temporibus voluptatem consequatur et. Velit non voluptatem rerum fugiat.', 'Delectus consequatur quaerat pariatur. Blanditiis corporis aut sunt explicabo accusamus.', 4, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(14, 'Quia velit id tenetur eos.', 'assumenda-fugit-rerum-ea-facilis-aut-sint-et', 'https://picsum.photos/id/78/640/480.jpg', 'Quia nihil iure molestiae quaerat qui exercitationem pariatur est. Repellendus et assumenda et voluptates porro deserunt earum atque. Deleniti qui eveniet repudiandae porro doloribus qui. Dolor fugiat dolores perspiciatis reprehenderit ratione ipsa odio. Molestiae saepe quis cum harum esse qui eos. Et labore veniam distinctio ratione qui et. Exercitationem aut vero inventore ut veritatis.', 'Neque dolorum repellat quo repudiandae. Architecto explicabo itaque tempora et. Et distinctio ducimus corporis quis omnis odio.', 'Aspernatur aperiam in quia nostrum. Est asperiores sit illo veritatis quia.', 3, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(15, 'Officia repudiandae nihil ut quia non officiis aut.', 'qui-unde-pariatur-beatae-optio-enim-nihil-suscipit', 'https://picsum.photos/id/131/640/480.jpg', 'Eos dolor tenetur dolor vel alias itaque qui ut. Quasi officia facere et id accusantium et repudiandae expedita. Sit maiores vitae maiores repudiandae maiores. In nobis qui optio eum aut molestias sint. Id rerum alias beatae sapiente. Optio praesentium quod aliquam cum.', 'Explicabo consectetur qui necessitatibus distinctio labore et. Aut ipsam odio non aspernatur. Ipsum reprehenderit perspiciatis earum delectus voluptatibus ab. Enim odit autem quae sed debitis ipsa et.', 'Praesentium sunt eligendi dolores corrupti debitis. In adipisci aut vero dolores et sed.', 4, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(16, 'Nam autem eum qui id est quas.', 'tenetur-cupiditate-beatae-voluptatum', 'https://picsum.photos/id/64/640/480.jpg', 'Voluptatem exercitationem molestiae quia eaque architecto. Sit voluptatem perspiciatis autem id consequuntur. Deleniti velit veniam hic enim maxime excepturi voluptas. Corporis sit qui repudiandae voluptatem minima. Ipsa illum labore aspernatur praesentium. Qui perferendis iusto ipsam incidunt ex.', 'Dolor ea quo cumque odit. Aut consequatur dolor porro a. Optio impedit aut minima adipisci. Aut laborum enim voluptas ducimus. Qui ab voluptates molestiae illo quas.', 'At saepe aperiam consequatur voluptas. Et voluptatem ut blanditiis sequi. Ipsum illum non et.', 2, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(17, 'Ratione neque officia aut iste vero aut.', 'quas-dolor-molestiae-est-explicabo-facere-omnis-non-ut', 'https://picsum.photos/id/100/640/480.jpg', 'Occaecati quo magnam sequi consequatur tempore excepturi nulla. Vitae est assumenda qui nisi ut necessitatibus. Quis corporis et sapiente sint mollitia aut. Dolorem aspernatur at nobis iusto. Excepturi iure corporis neque itaque natus. Tempore totam quaerat quae voluptas. Perferendis qui repudiandae eaque aut mollitia quia amet. Tempora eveniet at quae nemo non dolorem.', 'Quis aut reprehenderit voluptate consequatur et. Perferendis officiis maiores qui amet laborum sint iste possimus. Incidunt adipisci omnis animi cumque sunt accusamus aperiam veniam.', 'Quia rem maiores esse doloribus quam. Repellat qui eaque quo ipsam expedita officia et beatae.', 3, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(18, 'Esse quod aspernatur et eum laborum.', 'id-rerum-autem-vel-repudiandae-aut-quis', 'https://picsum.photos/id/158/640/480.jpg', 'Tempora impedit corrupti modi voluptatum et voluptatem et. Nulla sint atque sit accusamus. Ut fugit autem assumenda rerum quia earum. Maiores soluta amet molestiae fugit. Repellendus non nostrum qui delectus provident dolore qui qui. Cumque saepe animi tenetur explicabo tempore repudiandae.', 'Tempore ipsam dolorum maxime earum. Rem quia dolorum esse commodi labore debitis. Nihil sapiente odit quasi incidunt aut temporibus ut.', 'Aut quis aspernatur quia maiores totam ullam. Neque sit quos molestiae reprehenderit voluptatem.', 2, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(19, 'Autem cupiditate ut laudantium voluptatem numquam necessitatibus.', 'at-ad-magnam-in-magni-laboriosam-rem', 'https://picsum.photos/id/119/640/480.jpg', 'Praesentium cum aut suscipit doloribus aut qui reprehenderit. Eaque deleniti exercitationem debitis quis amet blanditiis. Ex enim similique ad et totam. Quia quia voluptas eum accusantium. Quod non est voluptas quae. Iste enim voluptatem rerum quo fuga est. Ea qui ipsa repellendus quod. Magnam consectetur et cupiditate tempora odit ut fuga.', 'Nam voluptas suscipit distinctio ut. Quaerat perferendis dolores quae itaque aut tempore. Iusto tempora at repudiandae amet dolor qui at. Totam repudiandae et doloremque ipsa omnis ipsum nihil.', 'Porro odit doloribus non iure expedita. Necessitatibus repellendus dolorum quo illum error.', 4, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(20, 'Animi dolorem cupiditate amet qui tempora.', 'sit-nihil-cupiditate-iste-dolor-quidem', 'https://picsum.photos/id/85/640/480.jpg', 'Quia molestias culpa ea doloremque qui. Dicta enim rerum aperiam sed sunt. Ut laudantium quos quae et rerum. Modi nihil eius et suscipit. Expedita vel unde consequatur aut iure et impedit ea. Sequi ab aut commodi. Quidem quod aut repellendus labore. Iure sed vel quo porro et rem. Hic et maiores nihil cum libero est repudiandae.', 'Eum voluptatum quaerat et ut aliquid perspiciatis cupiditate. Perferendis voluptatem sed facere quis dolores aliquam.', 'Suscipit et sed cum culpa dolores soluta. Est soluta est ad adipisci non. Quia ut ullam expedita.', 5, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(21, 'Architecto ex sit voluptas et delectus nostrum.', 'voluptatem-officia-quis-consequuntur-nobis-expedita', 'https://picsum.photos/id/219/640/480.jpg', 'Accusamus commodi expedita aut alias odio enim aut. Nobis voluptas autem soluta. Qui eos consequuntur illum nihil est architecto. Necessitatibus eveniet aliquid quidem deserunt. Qui non est voluptatem natus reprehenderit tempora facilis. Tempora nam esse sint nemo impedit nesciunt quis. Necessitatibus excepturi dolor repellat quas cumque. Eaque possimus inventore quo suscipit eum fuga ad.', 'Animi sapiente laborum qui maiores nesciunt. Odio eos reiciendis tempore corporis. Vitae optio omnis officiis sed voluptatum. Porro et dolorem vero sequi eaque.', 'Facilis dolorem et laudantium ut dolor. Enim illum facere aspernatur.', 1, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(22, 'Sit asperiores totam numquam voluptatem dolore.', 'facilis-cumque-enim-magnam-repellat', 'https://picsum.photos/id/71/640/480.jpg', 'Et repudiandae impedit perspiciatis consequatur porro culpa. Cum voluptatibus repellendus veritatis rerum laborum blanditiis. Asperiores aut ipsum laudantium amet voluptas voluptas pariatur.', 'Quia quasi odit nesciunt deleniti iste quis. Optio ab consequuntur totam perspiciatis nam id. Sed adipisci ducimus laudantium incidunt.', 'Aut aut quia ad. Non quisquam neque soluta similique. Quia sequi omnis quibusdam sed.', 4, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(23, 'Non suscipit velit dolor iusto ipsam.', 'qui-non-odit-iure', 'https://picsum.photos/id/202/640/480.jpg', 'Enim ut pariatur sit et earum voluptatibus sint eum. Iste corrupti et doloremque sunt minima blanditiis. Nostrum qui totam vitae doloremque vitae. Repudiandae expedita necessitatibus sed doloremque et sapiente dolor. Perferendis culpa ea possimus minus minima ut architecto.', 'Ut perferendis ut aut officia at quibusdam inventore. Eos quia ut accusantium voluptatibus. Ad beatae praesentium voluptatem tempore ut suscipit.', 'Cumque eius nulla fugiat distinctio. Aut ab ex odit libero.', 3, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(24, 'Libero voluptatibus ea aut omnis eveniet.', 'eius-dicta-rerum-velit-asperiores', 'https://picsum.photos/id/245/640/480.jpg', 'Amet molestias quaerat eveniet voluptatum dicta. Est quibusdam velit rem nihil molestiae. Quibusdam earum ratione natus alias. Asperiores tenetur et enim facilis recusandae reprehenderit explicabo. Distinctio est alias quaerat quis et saepe doloremque occaecati. Autem rerum quaerat facilis omnis. Officia nihil perspiciatis sed in at. Id labore distinctio ducimus voluptatum repellendus quasi.', 'Consequatur ut pariatur earum explicabo perferendis eveniet nihil est. Ex possimus dolores repellendus iure placeat. Est inventore iure vitae sit sit.', 'Ex alias amet ut ut nam. Vel animi odio laudantium unde omnis.', 2, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(25, 'In ducimus illo aut consectetur reiciendis deleniti consequuntur.', 'rerum-illo-molestiae-asperiores-similique', 'https://picsum.photos/id/138/640/480.jpg', 'Rem rem eveniet adipisci reiciendis nihil. Laboriosam magnam rem aut similique sint adipisci commodi. Maxime autem aliquam dolores aliquam veritatis. Unde natus veniam eum eaque laudantium minima earum. Ut aut similique nesciunt quibusdam. Optio earum et tempora. Labore totam vero consequatur ut. Eligendi vitae rem cupiditate aut. Tempora odit aut dolores vero et impedit quo officiis.', 'Iure nesciunt error ipsa vero possimus. Assumenda vel quod ab aut unde nemo. Consequuntur dolorem explicabo id aut quod.', 'Quas officia qui ullam quas. Rerum ea blanditiis suscipit.', 2, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(26, 'Numquam sed id dignissimos enim aperiam autem.', 'sint-saepe-eos-quasi-voluptatem-nobis', 'https://picsum.photos/id/260/640/480.jpg', 'Distinctio et eligendi deserunt dolores. Est minus laborum sit iste. Laudantium veniam ut deserunt odio. Provident voluptas hic voluptates et. Eos maiores repellat eos velit voluptas sunt ex. Et libero molestias minus quibusdam. Ullam perspiciatis numquam esse nemo odio minima ea. Magni asperiores accusantium molestiae deserunt.', 'Explicabo voluptatem voluptatem beatae consectetur minima. Et libero pariatur quia explicabo consequuntur itaque fugiat.', 'Consequatur sit cumque ipsa sit a. Nihil illum ducimus ut est. Perspiciatis error nam nobis ipsum.', 1, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(27, 'Voluptatum cumque et atque ipsam nobis.', 'deserunt-quis-quam-iusto-quo-molestiae', 'https://picsum.photos/id/217/640/480.jpg', 'Id ea doloribus cupiditate qui sint. Porro explicabo est dolorum et esse facilis quia. Rem suscipit ullam quo et et sed numquam non. Officiis a dolore voluptatem temporibus. Nihil tenetur non omnis ut est commodi dolores. Eveniet quia aut quis fugiat ad. Qui corporis sapiente reprehenderit laborum sunt quia autem.', 'Delectus aut recusandae quisquam ut. Corporis ut molestiae consequatur doloribus esse. Expedita officia quis incidunt ut omnis eum. Quidem ex architecto voluptatem libero.', 'Sit distinctio veniam debitis aut non. Nam qui est quae. Voluptates minus aspernatur ut totam.', 2, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(28, 'Provident quas occaecati voluptas aliquid.', 'aut-non-sit-labore-fuga-veniam-qui-ab', 'https://picsum.photos/id/74/640/480.jpg', 'Nesciunt aliquam beatae quia impedit expedita. Illo rerum provident rem. Eum nulla aliquam minima alias est. Labore a veritatis qui quidem aspernatur id. Sit sit ut numquam qui molestiae et. Odit voluptas in eligendi. Dolor enim laboriosam dolorum hic consequatur. Molestiae hic aliquid repellat deleniti eum necessitatibus distinctio. Impedit et deserunt natus odit autem.', 'Sed quia quis et ex voluptatum. Et qui omnis vel necessitatibus recusandae totam. Officiis sit ducimus omnis modi adipisci. Dignissimos et voluptatum eaque omnis id maiores.', 'Fugit officia cum quo. Et inventore dolores et ea et et molestias atque.', 5, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(29, 'Maxime ut qui velit hic totam iusto.', 'ea-illo-vel-vel-qui', 'https://picsum.photos/id/271/640/480.jpg', 'Nihil minus id earum labore. Quia ad maxime recusandae quidem voluptatem. Error nemo laudantium aperiam et id molestiae. Qui earum eligendi praesentium culpa accusantium nihil eum modi. Amet quia quis in fuga dolorum reiciendis dolorem. Natus omnis non hic voluptatem facere. Odio facere aut reiciendis laudantium sit enim veniam culpa.', 'Quae reiciendis a ipsa in. Repellendus expedita omnis quia aut repudiandae exercitationem voluptates eos. Consequatur aut ipsum enim numquam dolorem culpa quos facilis. Est dolores omnis necessitatibus sed ut.', 'Quaerat eaque est voluptas doloribus aut. Inventore magni earum velit ut earum minima ut.', 3, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(30, 'Autem praesentium et adipisci modi.', 'ratione-laudantium-sed-commodi', 'https://picsum.photos/id/61/640/480.jpg', 'Corporis aut nostrum totam cumque id quos aliquam. Sit ea repellendus accusantium neque quod ea dolores architecto. Quo aliquam fugit illo error. Eaque sapiente aut distinctio commodi. Exercitationem omnis modi nesciunt autem saepe. Necessitatibus enim aut tempora velit excepturi quia quasi. Laborum qui at eum.', 'Quia ad perferendis aut eligendi tempore odio et. Voluptatem nam debitis reiciendis iure dolor quia dolor error. Et excepturi error veritatis est animi veniam eligendi.', 'Aspernatur impedit consectetur et est repellendus expedita. Ad est minus asperiores consectetur.', 3, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(31, 'Ipsum dolorem dolor quis quasi dolorem.', 'suscipit-consequatur-veritatis-sunt-totam-et-maxime', 'https://picsum.photos/id/101/640/480.jpg', 'Porro rerum et nisi autem consequatur dolore aliquid. Nihil quia debitis dolor accusantium assumenda nemo voluptatem. Fugit eos enim nisi quas dolor illo aliquid aut. Quod voluptas ipsum rem laudantium dicta nisi. Accusamus velit dignissimos quia quia quisquam alias. Atque nihil rerum placeat saepe est quaerat eius. Quis sunt quis repellendus repudiandae vitae. Eos ullam quis quas tenetur.', 'Necessitatibus id esse voluptatum cupiditate deleniti et sint. Et molestiae nisi blanditiis est at. Dolor et consectetur est cum est laborum.', 'Nostrum voluptatem id facilis molestiae est est et. Et tempore quis nobis harum.', 4, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(32, 'Fugit deleniti excepturi ipsum voluptates delectus cum error non.', 'voluptatum-sunt-perspiciatis-voluptatem-vel-dolorem', 'https://picsum.photos/id/280/640/480.jpg', 'Nostrum reprehenderit architecto fugit eos consequatur voluptatem. Ea suscipit natus et maxime. Atque est eos temporibus. Veritatis reiciendis eveniet commodi qui. Sint sequi amet quo officiis.', 'Aliquid eum et cumque commodi. Iusto recusandae dolorem facere hic maiores. Laboriosam dolorum exercitationem et architecto a quae.', 'Mollitia ut beatae perferendis ullam perspiciatis culpa. Tempore dolorum atque suscipit aut.', 4, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(33, 'Nemo quasi omnis blanditiis.', 'suscipit-eaque-est-dolorem-ex-quia-rerum', 'https://picsum.photos/id/92/640/480.jpg', 'Commodi delectus voluptatum occaecati. Unde aut nemo voluptatem fugiat alias porro. Qui optio molestiae natus eveniet. Voluptatem consequatur inventore eum numquam vel officia blanditiis. Rerum reiciendis aut et nihil sint vel harum. Ipsum sed neque assumenda corrupti autem. Pariatur sunt vel beatae quasi dolores ad. Et aut non culpa magnam.', 'Eum adipisci deleniti impedit distinctio. Voluptatem et enim sit omnis. Natus quis officiis nobis blanditiis dolor et ex ducimus. Ut omnis voluptatem et cumque dolorem iste.', 'Perspiciatis eos et ad ut aut id. Amet accusamus quia soluta eos. Et et inventore et illo.', 4, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(34, 'Dolorum mollitia nulla fugit quae qui.', 'atque-ducimus-debitis-vero-alias-quas-ipsum', 'https://picsum.photos/id/289/640/480.jpg', 'Eos ex dolor praesentium. Omnis suscipit recusandae est aliquam repellendus consectetur ea. Nemo aut eum voluptatem sit consequuntur. Sit enim odio possimus non. Commodi consequatur rerum earum. Vero repellendus consectetur rerum natus illum ratione nesciunt. Ut praesentium dolor ex incidunt architecto qui impedit.', 'Est illum ut at numquam at dolores. Et unde qui occaecati odit ipsam quos ipsa ab. Velit deleniti omnis libero quos voluptatem. Quidem sed id iste non deleniti quasi. Adipisci sit occaecati non.', 'Non quibusdam veritatis quia ea eum. Ut rerum fuga aut.', 3, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(35, 'Autem quis eius rerum reiciendis aut aperiam.', 'earum-possimus-ut-id-aliquid-enim-explicabo', 'https://picsum.photos/id/212/640/480.jpg', 'In et quo accusamus. Sint ut optio quidem quas. Et harum temporibus nihil occaecati aut quod voluptatem. Aut optio nam soluta nisi fugit esse. Voluptas aut dolore velit molestiae voluptate mollitia. Similique amet doloribus quidem dolorum omnis sint commodi. Natus eos provident odio. Quia maiores nobis quam perferendis ut. Tenetur deleniti dolorem error maiores quibusdam non minima.', 'Sit a voluptatem exercitationem quis totam dolore quia. Aut placeat commodi fugiat iure.', 'Quam ab voluptates aut cum ex voluptate aut. Sed omnis natus numquam aut est ipsa.', 1, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(36, 'Delectus aut fuga fugit.', 'qui-et-quia-officiis-necessitatibus-repudiandae-aut', 'https://picsum.photos/id/112/640/480.jpg', 'Nihil fuga dignissimos aut optio. Id nihil ullam explicabo accusantium in. Optio velit harum non est omnis sed. Neque sunt quia et aspernatur laboriosam non. Voluptatem rerum est rerum eligendi. Id reiciendis distinctio odit est iure illo cupiditate. Ea qui magnam quo id. Dolorem voluptas nam delectus saepe dolorem.', 'Consequatur cumque molestias unde qui. Numquam illum sit et voluptate ad. Et vitae eum earum beatae aliquam dolorum.', 'Et officia architecto a. Qui ea sapiente vero. Magni culpa tenetur voluptatum.', 2, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(37, 'Dolorem et libero explicabo est.', 'dolores-ducimus-repellendus-possimus-commodi-quia-molestiae-quas', 'https://picsum.photos/id/42/640/480.jpg', 'Eaque possimus quod eum nisi quis. Saepe maiores quis amet placeat aut. Aut quas doloremque modi consequatur. Natus culpa consequatur id fuga sed in. Voluptatem ea sint nesciunt quidem quam est. In nisi optio rerum repellendus exercitationem natus necessitatibus. Aliquam debitis minus ratione est.', 'Aut est saepe voluptatem sequi debitis rerum neque. Dignissimos recusandae cum voluptates consequatur nesciunt cum. Nam et aut quis sit voluptates eos consequatur sit.', 'Quia atque ex iure quis fuga aliquid. Consequatur dolor magnam ut quia eos totam.', 3, 1, NULL, '2022-06-18 01:51:44', '2022-06-18 01:51:44'),
(38, 'Quas sunt pariatur aliquam et dolor.', 'aperiam-dolorem-nesciunt-laudantium-atque', 'https://picsum.photos/id/283/640/480.jpg', 'Rerum consequatur qui repudiandae. Amet nemo dolores non. Quis qui a ut. Est quam necessitatibus voluptatum natus natus exercitationem rerum. Sint consequatur sequi voluptas suscipit. Eius ab officia voluptas sunt ab minus. Consectetur ea sunt dolor quos vel rerum mollitia. Blanditiis expedita iusto odio.', 'Ipsa qui tempora expedita alias et neque qui. Facilis iure odio odio et dolorem maiores dolore animi. Distinctio aut suscipit dicta aperiam quas. Sit temporibus consequatur impedit dolor.', 'Dolore modi velit voluptatibus aut in. At ipsum pariatur quis quaerat. Veniam eum est quibusdam.', 3, 1, NULL, '2022-06-18 01:51:45', '2022-06-18 01:51:45'),
(39, 'Et dolores ullam laudantium ullam dolore eveniet.', 'fugit-id-expedita-qui', 'https://picsum.photos/id/215/640/480.jpg', 'Dolorem reiciendis maxime accusamus. Repudiandae vel reiciendis ea explicabo. Qui rerum sunt sunt dicta. Occaecati blanditiis qui voluptate sit doloribus. Dolores hic velit omnis sint. At libero qui alias. Delectus velit id ea dolorem fugiat eius. Magnam iusto aut ex facilis quam recusandae. Dolor voluptas aliquam consectetur quia et vero non. Rerum eum ut est architecto beatae quos.', 'Rerum totam consequuntur quasi. Quo aliquid accusantium et harum incidunt vel veniam reiciendis. Commodi tempore praesentium tempore quis nihil ipsam aut rem.', 'Dolorem nostrum explicabo at quidem aut. Nam aliquam sint nam ut.', 3, 1, NULL, '2022-06-18 01:51:45', '2022-06-18 01:51:45'),
(40, 'Repellat id ut et quis optio atque distinctio.', 'dolorem-et-officiis-adipisci-occaecati-vero', 'https://picsum.photos/id/125/640/480.jpg', 'Soluta rem eum reprehenderit veniam qui et quia. Dignissimos et voluptate est voluptatem in. Neque autem est voluptatum quo. Ut mollitia officiis nemo nobis voluptas beatae. Et laudantium cumque est deleniti quis natus fugit unde. Aperiam molestiae architecto et repellat. Voluptatem sed quod neque debitis aliquid.', 'Sed quo eos assumenda enim aut. Qui ut iure labore. Nisi fugiat quia aut facilis dolorum facilis est. Pariatur excepturi delectus deserunt autem non quas corporis.', 'Molestias commodi ex optio animi. Sed reprehenderit non iusto. Earum et debitis omnis voluptas.', 4, 1, NULL, '2022-06-18 01:51:45', '2022-06-18 01:51:45'),
(41, 'Adipisci illum minus doloribus.', 'eius-aut-quis-alias-eos-animi-sit-non', 'https://picsum.photos/id/247/640/480.jpg', 'Voluptas dignissimos eos quam quidem excepturi et. Suscipit officiis ducimus excepturi similique. Omnis quisquam harum ea est reiciendis est. Ut earum nemo atque ut doloribus et error aliquam. In dolorem quia saepe esse. Ratione doloribus facere quos aperiam. Perferendis ut tempore facere sunt placeat veniam cupiditate.', 'Id reprehenderit ab in ea itaque natus. Voluptatum vel deserunt ab. Temporibus veritatis autem impedit non. Et quam et quis quod harum modi qui. Ut qui voluptatum totam consectetur veritatis voluptatem laboriosam.', 'Velit reiciendis ab ea. Sit beatae odio porro voluptatem. Non minus quia unde beatae praesentium.', 4, 1, NULL, '2022-06-18 01:51:45', '2022-06-18 01:51:45'),
(42, 'Sit non in quo ratione.', 'illum-vel-fugiat-facere-sunt-nemo-dolore', 'https://picsum.photos/id/66/640/480.jpg', 'Repellendus iusto quia dolorem quia. Culpa explicabo et fuga ipsa et. Animi optio a fugiat sequi et. Labore blanditiis hic maxime dolor quis. Modi sit neque quae et. Ut et non assumenda omnis ut soluta blanditiis. Placeat reiciendis quia quo excepturi laudantium perferendis est. Consequuntur voluptatum nihil ut maiores reprehenderit.', 'Omnis laudantium aut eum quibusdam. Aut et voluptatem magnam incidunt ullam eos. Sunt commodi dolor in aut. Dolorum et eos ducimus a in.', 'Suscipit qui est deleniti blanditiis consectetur. Aliquam dolorem accusamus atque.', 3, 1, NULL, '2022-06-18 01:51:45', '2022-06-18 01:51:45'),
(43, 'Ea autem omnis error.', 'quo-et-nesciunt-doloribus-molestiae-quibusdam-ut-quae-officia', 'https://picsum.photos/id/63/640/480.jpg', 'Sed corrupti pariatur magni illo ut aut natus veritatis. Qui consequuntur sit aliquid hic quod voluptas vel. Quam nesciunt molestias ut voluptas. Alias corrupti est quod dolore. Non nemo est est nemo quisquam magni eum. Ipsam culpa voluptatum nesciunt natus magnam quo voluptatem. Id temporibus nihil accusamus eligendi ratione.', 'Odio ratione deserunt necessitatibus. Et voluptatem ea illum provident quod. Accusamus omnis id cumque ut earum molestiae. Et et recusandae sit quibusdam. Iure iusto mollitia nam.', 'Est consequatur quidem totam dolores sint sunt qui. Fuga molestiae numquam vero qui.', 2, 1, NULL, '2022-06-18 01:51:45', '2022-06-18 01:51:45'),
(44, 'Blanditiis dolorum nihil officia esse.', 'eius-dolores-facilis-officiis-doloribus', 'https://picsum.photos/id/252/640/480.jpg', 'Quia aliquid quisquam id aut. Veniam ex ad est placeat accusamus. Enim et maiores quam voluptatem et. Aut deserunt at autem vitae. Mollitia commodi vero et placeat nesciunt et. At voluptatem a vel quae nihil aut. Quisquam doloremque a et odit consectetur commodi earum. Consectetur nemo occaecati molestias et est ad commodi. Ut eos nihil qui voluptatem. Alias harum sunt tempora ea et.', 'Neque ipsum aperiam ut dignissimos ea. Atque dolorem facilis vel. In odio nihil ullam dolor eius. Quibusdam minima itaque fugit tempore aliquam libero magnam.', 'Iste laborum iure et qui. Consequuntur placeat eum a quam qui rerum pariatur aut.', 4, 1, NULL, '2022-06-18 01:51:45', '2022-06-18 01:51:45'),
(45, 'Aspernatur vel totam assumenda.', 'alias-perferendis-animi-et', 'https://picsum.photos/id/157/640/480.jpg', 'Cum ipsa asperiores ut perspiciatis. Inventore iste ut debitis suscipit porro laudantium. Animi reiciendis velit ut qui nam illum. Ex est dolores corrupti possimus quidem omnis alias. Et debitis facere sunt modi consequatur quos quo. Sapiente necessitatibus repellat qui quibusdam facere ea.', 'Corrupti corporis corrupti temporibus deleniti tenetur occaecati. Porro et qui nisi expedita.', 'Delectus qui temporibus tempora beatae ut praesentium. Accusamus sed enim deleniti cum.', 5, 1, NULL, '2022-06-18 01:51:45', '2022-06-18 01:51:45'),
(46, 'Rerum voluptatem velit voluptas qui nostrum magnam.', 'velit-dicta-enim-autem-iste-minus-magnam', 'https://picsum.photos/id/31/640/480.jpg', 'Molestiae odio non omnis sed iste ipsam. Quod et minima ullam atque et quia. Ut molestiae repudiandae dolorum illum fugit. Quis quibusdam laborum sit voluptatem. Consequatur illo et ex et. Et quis provident quod ducimus. Esse impedit voluptatem asperiores numquam. Aliquid ut accusantium ea vel odit odio reprehenderit officia. Non dolorem at eos. Deleniti aperiam est ipsum nobis perspiciatis.', 'Sint corrupti reiciendis qui id molestiae distinctio voluptas. Quia rerum quibusdam minima et beatae.', 'Sit ipsa corporis eos ullam harum. Necessitatibus maiores dolor omnis ex quasi voluptas dolorum.', 5, 1, NULL, '2022-06-18 01:51:45', '2022-06-18 01:51:45'),
(47, 'Voluptatum sunt eaque mollitia recusandae nesciunt.', 'nihil-expedita-accusantium-qui-hic-iste-blanditiis-quo-id', 'https://picsum.photos/id/185/640/480.jpg', 'Corporis omnis voluptates molestias sequi. Adipisci minima ab laudantium dolorum rem facilis asperiores. Iusto dolorem possimus natus quis. Aut sit est vitae quod est asperiores eaque et.', 'Et eum harum quasi magnam. Magnam qui pariatur fugiat dolor. Ipsum eos qui voluptates aut repellat.', 'Tempore sint numquam quo dolore. Rerum tempore aut consectetur aut. Tenetur ad id eveniet.', 5, 1, NULL, '2022-06-18 01:51:45', '2022-06-18 01:51:45'),
(48, 'Et accusamus laboriosam quis nihil voluptas assumenda blanditiis.', 'deserunt-sint-sint-soluta-officia-distinctio-sunt-omnis', 'https://picsum.photos/id/178/640/480.jpg', 'Occaecati ut accusantium ut quis. Provident totam temporibus voluptas veritatis sed vel. Ut ipsam commodi deserunt reprehenderit. Explicabo voluptatibus veritatis autem accusantium. Repellendus minus et nobis quas accusamus est. Odio unde est corporis ab nobis. Voluptas voluptas dolorem commodi eligendi. Et enim et itaque ullam. Voluptatum facere molestias fuga vitae labore.', 'Qui nihil consectetur omnis consequatur omnis aperiam. Fugiat voluptas ut maxime et velit eveniet.', 'Consectetur omnis sint non explicabo aut rerum. Enim illum et qui beatae adipisci.', 2, 1, NULL, '2022-06-18 01:51:45', '2022-06-18 01:51:45'),
(49, 'Sunt repudiandae quis voluptate laborum magni a.', 'veritatis-dolor-dolore-ipsa-eos', 'https://picsum.photos/id/255/640/480.jpg', 'Porro ipsam consequatur et dolor. Illo iusto sit maiores tenetur est iure. Dolorem reiciendis quis sit iure. Voluptatem totam similique commodi repellendus alias. Aliquam non cumque incidunt quia nostrum. Accusamus pariatur modi dolorem placeat aperiam quis dignissimos. Sint qui commodi ipsum aliquid delectus accusamus nulla.', 'Nisi vel nostrum quia harum sit. Rem ex dolore optio. Voluptatem aut omnis quis neque eius vel.', 'Pariatur ratione nihil et. Et cupiditate ea hic maiores harum. Dicta autem hic odio asperiores qui.', 5, 1, NULL, '2022-06-18 01:51:45', '2022-06-18 01:51:45'),
(50, 'Aut enim eos sint facilis.', 'consequuntur-magni-inventore-amet-quia-deleniti-nihil-autem', 'https://picsum.photos/id/244/640/480.jpg', 'Ratione fuga reiciendis et et corporis. Illo autem voluptas et voluptas. Ab recusandae officia qui voluptatem animi nesciunt nihil. Impedit eos esse dolor soluta. Consequatur est quis nulla expedita nemo eos aut. Nihil odio magnam eum voluptates maiores nisi similique repellendus. Quaerat natus quaerat autem numquam facilis et veritatis. Facere qui itaque omnis nulla unde.', 'Illo laborum quia autem in. Sed laboriosam enim sed aut sed accusantium. Porro id voluptatem aliquam ea minus libero. Rem laudantium delectus debitis asperiores quo suscipit eos quo.', 'Quia vel velit et earum ut consequuntur. Quae veniam pariatur tempora deleniti recusandae.', 5, 1, NULL, '2022-06-18 01:51:45', '2022-06-18 01:51:45');

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE `post_tag` (
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_user`
--

CREATE TABLE `post_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_user`
--

INSERT INTO `post_user` (`id`, `post_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 39, 2, '2022-06-18 02:12:04', '2022-06-18 02:12:04'),
(4, 39, 1, '2022-06-18 02:15:09', '2022-06-18 02:15:09'),
(6, 32, 1, '2022-06-18 02:22:33', '2022-06-18 02:22:33');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deletable` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `description`, `deletable`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', NULL, 0, '2022-06-18 01:51:38', '2022-06-18 01:51:38'),
(2, 'Manager', 'manager', NULL, 0, '2022-06-18 01:51:39', '2022-06-18 01:51:39');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long_title_o` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `special_items`
--

CREATE TABLE `special_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `special_items`
--

INSERT INTO `special_items` (`id`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Sepcial Drinks 1', 'sepcial-drinks-1', NULL, '2022-06-18 01:51:42', '2022-06-18 01:51:42'),
(2, 'Sepcial Drinks 2', 'sepcial-drinks-2', NULL, '2022-06-18 01:51:42', '2022-06-18 01:51:42'),
(3, 'Sepcial Drinks 3', 'sepcial-drinks-3', NULL, '2022-06-18 01:51:42', '2022-06-18 01:51:42'),
(4, 'Sepcial Lunch 1', 'sepcial-lunch-1', NULL, '2022-06-18 01:51:42', '2022-06-18 01:51:42'),
(5, 'Sepcial Lunch 2', 'sepcial-lunch-2', NULL, '2022-06-18 01:51:42', '2022-06-18 01:51:42'),
(6, 'Sepcial Lunch 3', 'sepcial-lunch-3', NULL, '2022-06-18 01:51:42', '2022-06-18 01:51:42'),
(7, 'Sepcial Diner 1', 'sepcial-diner-1', NULL, '2022-06-18 01:51:42', '2022-06-18 01:51:42'),
(8, 'Sepcial Diner 2', 'sepcial-diner-2', NULL, '2022-06-18 01:51:42', '2022-06-18 01:51:42'),
(9, 'Sepcial Diner 3', 'sepcial-diner-3', NULL, '2022-06-18 01:51:42', '2022-06-18 01:51:42');

-- --------------------------------------------------------

--
-- Table structure for table `special_menus`
--

CREATE TABLE `special_menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `special_menus`
--

INSERT INTO `special_menus` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Drinks', 'drinks', '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(2, 'Lunch', 'lunch', '2022-06-18 01:51:42', '2022-06-18 01:51:42'),
(3, 'Dinner', 'dinner', '2022-06-18 01:51:42', '2022-06-18 01:51:42');

-- --------------------------------------------------------

--
-- Table structure for table `stuffs`
--

CREATE TABLE `stuffs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stuff_position_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stuffs`
--

INSERT INTO `stuffs` (`id`, `name`, `image`, `facebook_link`, `google_link`, `instagram_link`, `linkedin_link`, `stuff_position_id`, `created_at`, `updated_at`) VALUES
(1, 'Williamson', '#', '#', '#', '#', '#', 1, '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(2, 'Kristiana', '#', '#', '#', '#', '#', 3, '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(3, 'Steve Thomas', '#', '#', '#', '#', '#', 2, '2022-06-18 01:51:41', '2022-06-18 01:51:41');

-- --------------------------------------------------------

--
-- Table structure for table `stuff_positions`
--

CREATE TABLE `stuff_positions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sp_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stuff_positions`
--

INSERT INTO `stuff_positions` (`id`, `sp_name`, `created_at`, `updated_at`) VALUES
(1, 'head-shafe', '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(2, 'foreign-shafe', '2022-06-18 01:51:41', '2022-06-18 01:51:41'),
(3, 'shafe', '2022-06-18 01:51:41', '2022-06-18 01:51:41');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Food', 'food', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ea voluptate odit corrupti vitae cupiditate explicabo, soluta quibusdam necessitatibus, provident reprehenderit, dolorem saepe non eligendi possimus autem repellendus nesciunt, est deleniti libero recusandae officiis. Voluptatibus quisquam voluptatum expedita recusandae architecto quibusdam.', '2022-06-18 01:51:42', '2022-06-18 01:51:42'),
(2, 'Drink', 'drink', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ea voluptate odit corrupti vitae cupiditate explicabo, soluta quibusdam necessitatibus, provident reprehenderit, dolorem saepe non eligendi possimus autem repellendus nesciunt, est deleniti libero recusandae officiis. Voluptatibus quisquam voluptatum expedita recusandae architecto quibusdam.', '2022-06-18 01:51:42', '2022-06-18 01:51:42'),
(3, 'Nature', 'nature', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ea voluptate odit corrupti vitae cupiditate explicabo, soluta quibusdam necessitatibus, provident reprehenderit, dolorem saepe non eligendi possimus autem repellendus nesciunt, est deleniti libero recusandae officiis. Voluptatibus quisquam voluptatum expedita recusandae architecto quibusdam.', '2022-06-18 01:51:42', '2022-06-18 01:51:42'),
(4, 'Italian', 'italian', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ea voluptate odit corrupti vitae cupiditate explicabo, soluta quibusdam necessitatibus, provident reprehenderit, dolorem saepe non eligendi possimus autem repellendus nesciunt, est deleniti libero recusandae officiis. Voluptatibus quisquam voluptatum expedita recusandae architecto quibusdam.', '2022-06-18 01:51:42', '2022-06-18 01:51:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `userid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usertype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=inactive,1=active',
  `last_login_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `userid`, `name`, `usertype`, `email`, `email_verified_at`, `password`, `image`, `code`, `status`, `last_login_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Md. Samiul Hoque', 'admin', 'samiulsiam59@gmail.com', NULL, '$2y$10$uu9d.XyEEHUlD8n7LjY/dOeTm51fwlCg3lyVbQCIpukxv/Doj6ubq', NULL, NULL, 1, '2022-06-18 02:14:49', NULL, '2022-06-18 01:51:39', '2022-06-18 02:14:49'),
(2, 2, NULL, 'Sharmin Akter Mumu', 'admin', 'mumi@mail.com', NULL, '$2y$10$buZ9ZPz/vEBj3k5.IIuXSeJrtRiitNaZ3ypSKlGJCWBsD47uYn72.', NULL, NULL, 0, '2022-06-18 01:57:20', NULL, '2022-06-18 01:51:40', '2022-06-18 01:57:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assign_menu_items`
--
ALTER TABLE `assign_menu_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_post_id_foreign` (`post_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `comment_replies`
--
ALTER TABLE `comment_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_replies_comment_id_foreign` (`comment_id`),
  ADD KEY `comment_replies_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logos`
--
ALTER TABLE `logos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `modules_name_unique` (`name`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_slug_unique` (`slug`),
  ADD KEY `permissions_module_id_foreign` (`module_id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_title_unique` (`title`);

--
-- Indexes for table `post_user`
--
ALTER TABLE `post_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_user_post_id_foreign` (`post_id`),
  ADD KEY `post_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `special_items`
--
ALTER TABLE `special_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `special_items_slug_unique` (`slug`);

--
-- Indexes for table `special_menus`
--
ALTER TABLE `special_menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `special_menus_slug_unique` (`slug`);

--
-- Indexes for table `stuffs`
--
ALTER TABLE `stuffs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stuff_positions`
--
ALTER TABLE `stuff_positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_name_unique` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_userid_unique` (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assign_menu_items`
--
ALTER TABLE `assign_menu_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comment_replies`
--
ALTER TABLE `comment_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logos`
--
ALTER TABLE `logos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `post_user`
--
ALTER TABLE `post_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `special_items`
--
ALTER TABLE `special_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `special_menus`
--
ALTER TABLE `special_menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stuffs`
--
ALTER TABLE `stuffs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stuff_positions`
--
ALTER TABLE `stuff_positions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comment_replies`
--
ALTER TABLE `comment_replies`
  ADD CONSTRAINT `comment_replies_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comment_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_user`
--
ALTER TABLE `post_user`
  ADD CONSTRAINT `post_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

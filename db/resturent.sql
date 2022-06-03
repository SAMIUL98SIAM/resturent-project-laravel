-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2022 at 09:01 AM
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

--
-- Dumping data for table `assign_menu_items`
--

INSERT INTO `assign_menu_items` (`id`, `special_menu_id`, `special_item_id`, `description`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'dummy', 121, '2022-06-01 23:54:43', '2022-06-01 23:54:43'),
(2, 1, 2, 'dummy', 13, '2022-06-01 23:54:44', '2022-06-01 23:54:44'),
(3, 2, 4, 'dummy', 111, '2022-06-01 23:55:12', '2022-06-01 23:55:12'),
(4, 2, 5, 'dummy', 142, '2022-06-01 23:55:13', '2022-06-01 23:55:13'),
(5, 2, 6, 'dummy', 456, '2022-06-01 23:55:13', '2022-06-01 23:55:13');

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
(1, 'backend-sidebar', 'This is backend sidebar', 0, '2022-06-01 23:38:06', '2022-06-01 23:38:06'),
(2, 'frontend-header', 'This is frontend header', 0, '2022-06-01 23:38:08', '2022-06-01 23:38:08');

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
(1, 1, 'divider', NULL, 1, NULL, 'MENUS', NULL, '_self', NULL, '2022-06-01 23:38:06', '2022-06-01 23:38:06'),
(2, 1, 'item', NULL, 2, 'Dashboard', NULL, '/admin/dashboard', '_self', 'metismenu-icon pe-7s-rocket', '2022-06-01 23:38:06', '2022-06-01 23:38:06'),
(3, 1, 'divider', NULL, 3, NULL, 'ACCESS CONTROL', NULL, '_self', NULL, '2022-06-01 23:38:07', '2022-06-01 23:38:07'),
(4, 1, 'item', NULL, 4, 'Roles', NULL, '/admin/roles', '_self', 'metismenu-icon pe-7s-check', '2022-06-01 23:38:07', '2022-06-01 23:38:07'),
(5, 1, 'item', NULL, 5, 'User', NULL, '/admin/users', '_self', 'metismenu-icon pe-7s-users', '2022-06-01 23:38:07', '2022-06-01 23:38:07'),
(6, 1, 'divider', NULL, 6, NULL, 'SYSTEM', NULL, '_self', NULL, '2022-06-01 23:38:07', '2022-06-01 23:38:07'),
(7, 1, 'item', NULL, 7, 'Menus', NULL, '/admin/menus', '_self', 'metismenu-icon pe-7s-menu', '2022-06-01 23:38:07', '2022-06-01 23:38:07'),
(8, 1, 'item', NULL, 8, 'Backup', NULL, '/admin/backups', '_self', 'metismenu-icon pe-7s-cloud', '2022-06-01 23:38:07', '2022-06-01 23:38:07'),
(9, 1, 'item', NULL, 9, 'Settings', NULL, '/admin/settings/general', '_self', 'metismenu-icon pe-7s-settings', '2022-06-01 23:38:07', '2022-06-01 23:38:07'),
(10, 1, 'divider', NULL, 10, NULL, 'SETUP MANAGEMENT', NULL, '_self', NULL, '2022-06-01 23:38:07', '2022-06-01 23:38:07'),
(11, 1, 'item', NULL, 11, 'Logos', NULL, '/admin/logos', '_self', 'metismenu-icon pe-7s-diamond', '2022-06-01 23:38:07', '2022-06-01 23:38:07'),
(12, 1, 'item', NULL, 12, 'Sliders', NULL, '/admin/sliders', '_self', 'metismenu-icon pe-7s-diamond', '2022-06-01 23:38:07', '2022-06-01 23:38:07'),
(13, 1, 'item', NULL, 13, 'Galleries', NULL, '/admin/galleries', '_self', 'metismenu-icon pe-7s-album', '2022-06-01 23:38:07', '2022-06-01 23:38:07'),
(14, 1, 'item', NULL, 14, 'Stuffs', NULL, '/admin/stuffs', '_self', 'metismenu-icon pe-7s-users', '2022-06-01 23:38:07', '2022-06-01 23:38:07'),
(15, 1, 'item', NULL, 15, 'Special Menus', NULL, '/admin/food/special-menus', '_self', 'metismenu-icon pe-7s-burger', '2022-06-01 23:38:07', '2022-06-01 23:38:07'),
(16, 1, 'item', NULL, 16, 'Special Items', NULL, '/admin/food/special-items', '_self', 'metismenu-icon pe-7s-burger', '2022-06-01 23:38:07', '2022-06-01 23:38:07'),
(17, 1, 'item', NULL, 17, 'Assign Special Menu Items', NULL, '/admin/food/assign-menu-items', '_self', 'metismenu-icon pe-7s-burger', '2022-06-01 23:38:08', '2022-06-01 23:38:08'),
(18, 2, 'item', NULL, 1, 'Home', NULL, '/', '_self', NULL, '2022-06-01 23:38:08', '2022-06-01 23:38:08'),
(19, 2, 'item', NULL, 2, 'Menu', NULL, '/menu', '_self', NULL, '2022-06-01 23:38:08', '2022-06-01 23:38:08'),
(20, 2, 'item', NULL, 3, 'About', NULL, '/about', '_self', NULL, '2022-06-01 23:38:08', '2022-06-01 23:38:08'),
(21, 2, 'item', NULL, 4, 'Pages', NULL, '#', '_self', NULL, '2022-06-01 23:38:08', '2022-06-01 23:38:08'),
(22, 2, 'item', NULL, 5, 'Reservation', NULL, '/reservation', '_self', NULL, '2022-06-01 23:38:08', '2022-06-01 23:38:08'),
(23, 2, 'item', NULL, 6, 'Stuff', NULL, '/stuff', '_self', NULL, '2022-06-01 23:38:08', '2022-06-01 23:38:08'),
(24, 2, 'item', NULL, 7, 'Gallery', NULL, '/gallery', '_self', NULL, '2022-06-01 23:38:08', '2022-06-01 23:38:08'),
(25, 2, 'item', NULL, 8, 'Blog', NULL, '#', '_self', NULL, '2022-06-01 23:38:08', '2022-06-01 23:38:08'),
(26, 2, 'item', NULL, 9, 'Blog', NULL, '/blog', '_self', NULL, '2022-06-01 23:38:08', '2022-06-01 23:38:08'),
(27, 2, 'item', NULL, 10, 'Blog Single', NULL, '/blog-detail', '_self', NULL, '2022-06-01 23:38:08', '2022-06-01 23:38:08'),
(28, 2, 'item', NULL, 11, 'Contact', NULL, '/contact', '_self', NULL, '2022-06-01 23:38:08', '2022-06-01 23:38:08');

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
(19, '2022_03_08_143853_create_assign_menu_items_table', 1);

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
(1, 'Admin Dashboard', '2022-06-01 23:38:02', '2022-06-01 23:38:02'),
(2, 'Role Management', '2022-06-01 23:38:02', '2022-06-01 23:38:02'),
(3, 'Backups', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(4, 'User Management', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(5, 'Logo Management', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(6, 'Slider Management', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(7, 'Gallery Management', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(8, 'Stuff Management', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(9, 'Menu Management', '2022-06-01 23:38:04', '2022-06-01 23:38:04'),
(10, 'Special Food Menu Management', '2022-06-01 23:38:04', '2022-06-01 23:38:04'),
(11, 'Special Food Item Management', '2022-06-01 23:38:04', '2022-06-01 23:38:04');

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
(1, 1, 'Access Dashboard', 'admin.dashboard', '2022-06-01 23:38:02', '2022-06-01 23:38:02'),
(2, 2, 'Access Role', 'admin.roles.index', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(3, 2, 'Create Role', 'admin.roles.create', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(4, 2, 'Edit Role', 'admin.roles.edit', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(5, 2, 'Delete Role', 'admin.roles.destroy', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(6, 3, 'Access Backup', 'admin.backups.index', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(7, 3, 'Create Backup', 'admin.backups.create', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(8, 3, 'Download Backup', 'admin.backups.download', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(9, 3, 'Delete Backup', 'admin.backups.destroy', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(10, 4, 'Access User', 'admin.users.index', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(11, 4, 'Create User', 'admin.users.create', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(12, 4, 'Edit User', 'admin.users.edit', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(13, 4, 'Delete User', 'admin.users.destroy', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(14, 5, 'Access Logo', 'admin.logos.index', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(15, 5, 'Create Logo', 'admin.logos.create', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(16, 5, 'Edit Logo', 'admin.logos.edit', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(17, 5, 'Delete Logo', 'admin.logos.destroy', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(18, 6, 'Access Slider', 'admin.sliders.index', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(19, 6, 'Create Slider', 'admin.sliders.create', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(20, 6, 'Edit Slider', 'admin.sliders.edit', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(21, 6, 'Delete Slider', 'admin.sliders.destroy', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(22, 6, 'Unactivate Slider', 'admin.sliders.unactivate', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(23, 6, 'Activate Slider', 'admin.sliders.activate', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(24, 7, 'Access Gallery', 'admin.galleries.index', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(25, 7, 'Create Gallery', 'admin.galleries.create', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(26, 7, 'Edit Gallery', 'admin.galleries.edit', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(27, 7, 'Delete Gallery', 'admin.galleries.destroy', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(28, 8, 'Access Stuff', 'admin.stuffs.index', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(29, 8, 'Create Stuff', 'admin.stuffs.create', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(30, 8, 'Edit Stuff', 'admin.stuffs.edit', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(31, 8, 'Delete Stuff', 'admin.stuffs.destroy', '2022-06-01 23:38:03', '2022-06-01 23:38:03'),
(32, 9, 'Access Menus', 'admin.menus.index', '2022-06-01 23:38:04', '2022-06-01 23:38:04'),
(33, 9, 'Access Menus Builder', 'admin.menus.builder', '2022-06-01 23:38:04', '2022-06-01 23:38:04'),
(34, 9, 'Create Menu', 'admin.menus.create', '2022-06-01 23:38:04', '2022-06-01 23:38:04'),
(35, 9, 'Edit Menu', 'admin.menus.edit', '2022-06-01 23:38:04', '2022-06-01 23:38:04'),
(36, 9, 'Delete Menu', 'admin.menus.destroy', '2022-06-01 23:38:04', '2022-06-01 23:38:04'),
(37, 10, 'Access Special Menu', 'admin.food.special-menus.index', '2022-06-01 23:38:04', '2022-06-01 23:38:04'),
(38, 10, 'Create Special Menu', 'admin.food.special-menus.create', '2022-06-01 23:38:04', '2022-06-01 23:38:04'),
(39, 10, 'Edit Special Menu', 'admin.food.special-menus.edit', '2022-06-01 23:38:04', '2022-06-01 23:38:04'),
(40, 10, 'Delete Special Menu', 'admin.food.special-menus.destroy', '2022-06-01 23:38:04', '2022-06-01 23:38:04'),
(41, 11, 'Access Special Item', 'admin.food.special-items.index', '2022-06-01 23:38:04', '2022-06-01 23:38:04'),
(42, 11, 'Create Special Item', 'admin.food.special-items.create', '2022-06-01 23:38:04', '2022-06-01 23:38:04'),
(43, 11, 'Edit Special Item', 'admin.food.special-items.edit', '2022-06-01 23:38:04', '2022-06-01 23:38:04'),
(44, 11, 'Delete Special Item', 'admin.food.special-items.destroy', '2022-06-01 23:38:04', '2022-06-01 23:38:04'),
(45, 11, 'Access Assign Menu Item', 'admin.food.assign-menu-items.index', '2022-06-01 23:38:04', '2022-06-01 23:38:04'),
(46, 11, 'Create Assign Menu Item', 'admin.food.assign-menu-items.create', '2022-06-01 23:38:04', '2022-06-01 23:38:04'),
(47, 11, 'Edit Assign Menu Item', 'admin.food.assign-menu-items.edit', '2022-06-01 23:38:04', '2022-06-01 23:38:04'),
(48, 11, 'Edit Assign Menu Item', 'admin.food.assign-menu-items.show', '2022-06-01 23:38:04', '2022-06-01 23:38:04'),
(49, 11, 'Delete Assign Menu Item', 'admin.food.assign-menu-items.destroy', '2022-06-01 23:38:04', '2022-06-01 23:38:04');

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
(49, 49, 1, NULL, NULL);

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
(1, 'Admin', 'admin', NULL, 0, '2022-06-01 23:38:04', '2022-06-01 23:38:04'),
(2, 'Manager', 'manager', NULL, 0, '2022-06-01 23:38:06', '2022-06-01 23:38:06');

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
(1, 'Sepcial Drinks 1', 'sepcial-drinks-1', NULL, '2022-06-01 23:38:09', '2022-06-01 23:38:09'),
(2, 'Sepcial Drinks 2', 'sepcial-drinks-2', NULL, '2022-06-01 23:38:09', '2022-06-01 23:38:09'),
(3, 'Sepcial Drinks 3', 'sepcial-drinks-3', NULL, '2022-06-01 23:38:09', '2022-06-01 23:38:09'),
(4, 'Sepcial Lunch 1', 'sepcial-lunch-1', NULL, '2022-06-01 23:38:10', '2022-06-01 23:38:10'),
(5, 'Sepcial Lunch 2', 'sepcial-lunch-2', NULL, '2022-06-01 23:38:10', '2022-06-01 23:38:10'),
(6, 'Sepcial Lunch 3', 'sepcial-lunch-3', NULL, '2022-06-01 23:38:10', '2022-06-01 23:38:10'),
(7, 'Sepcial Diner 1', 'sepcial-diner-1', NULL, '2022-06-01 23:38:10', '2022-06-01 23:38:10'),
(8, 'Sepcial Diner 2', 'sepcial-diner-2', NULL, '2022-06-01 23:38:10', '2022-06-01 23:38:10'),
(9, 'Sepcial Diner 3', 'sepcial-diner-3', NULL, '2022-06-01 23:38:10', '2022-06-01 23:38:10');

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
(1, 'Drinks', 'drinks', '2022-06-01 23:38:09', '2022-06-01 23:38:09'),
(2, 'Lunch', 'lunch', '2022-06-01 23:38:09', '2022-06-01 23:38:09'),
(3, 'Dinner', 'dinner', '2022-06-01 23:38:09', '2022-06-01 23:38:09');

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
(1, 'Williamson', '#', '#', '#', '#', '#', 1, '2022-06-01 23:38:08', '2022-06-01 23:38:08'),
(2, 'Kristiana', '#', '#', '#', '#', '#', 3, '2022-06-01 23:38:08', '2022-06-01 23:38:08'),
(3, 'Steve Thomas', '#', '#', '#', '#', '#', 2, '2022-06-01 23:38:09', '2022-06-01 23:38:09');

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
(1, 'head-shafe', '2022-06-01 23:38:08', '2022-06-01 23:38:08'),
(2, 'foreign-shafe', '2022-06-01 23:38:08', '2022-06-01 23:38:08'),
(3, 'shafe', '2022-06-01 23:38:08', '2022-06-01 23:38:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
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

INSERT INTO `users` (`id`, `role_id`, `name`, `usertype`, `email`, `email_verified_at`, `password`, `image`, `code`, `status`, `last_login_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Md. Samiul Hoque', 'admin', 'samiulsiam59@gmail.com', NULL, '$2y$10$xku2kokDug/M1gFwLgoMeuKBcO3FbzcUcMnOMo5/UZkP.BmBQaGNq', NULL, NULL, 1, NULL, NULL, '2022-06-01 23:38:06', '2022-06-01 23:38:06'),
(2, 2, 'Sharmin Akter Mumu', 'admin', 'mumi@mail.com', NULL, '$2y$10$vPn.hNWh/6hMJO7zlgw0u.HSAxBs.Y2k3a6peRbHzTOtk/rH50qhW', NULL, NULL, 0, NULL, NULL, '2022-06-01 23:38:06', '2022-06-01 23:38:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assign_menu_items`
--
ALTER TABLE `assign_menu_items`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assign_menu_items`
--
ALTER TABLE `assign_menu_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

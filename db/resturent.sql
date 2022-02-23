-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2022 at 06:36 PM
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
(1, 'backend-sidebar', 'This is backend sidebar', 0, '2022-02-23 10:05:21', '2022-02-23 10:05:21'),
(2, 'frontend-header', 'This is frontend header', 0, '2022-02-23 10:05:22', '2022-02-23 10:05:22');

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
(1, 1, 'divider', NULL, 1, NULL, 'Access Control', NULL, '_self', NULL, '2022-02-23 10:05:22', '2022-02-23 10:05:22'),
(2, 1, 'item', NULL, 2, 'Dashboard', NULL, '/admin/dashboard', '_self', 'metismenu-icon pe-7s-rocket', '2022-02-23 10:05:22', '2022-02-23 10:08:20'),
(3, 1, 'item', NULL, 3, 'Roles', NULL, '/admin/roles', '_self', 'metismenu-icon pe-7s-check', '2022-02-23 10:05:22', '2022-02-23 10:08:20'),
(4, 1, 'item', NULL, 4, 'User', NULL, '/admin/users', '_self', 'metismenu-icon pe-7s-users', '2022-02-23 10:05:22', '2022-02-23 10:08:20'),
(5, 1, 'item', NULL, 5, 'Menus', NULL, '/admin/menus', '_self', 'metismenu-icon pe-7s-menu', '2022-02-23 10:05:22', '2022-02-23 10:08:20'),
(6, 1, 'item', NULL, 6, 'Backup', NULL, '/admin/backups', '_self', 'metismenu-icon pe-7s-cloud', '2022-02-23 10:05:22', '2022-02-23 10:08:20'),
(7, 1, 'item', NULL, 7, 'Settings', NULL, '/admin/settings/general', '_self', 'metismenu-icon pe-7s-settings', '2022-02-23 10:05:22', '2022-02-23 10:08:24'),
(8, 2, 'item', NULL, 1, 'Home', NULL, '/', '_self', NULL, '2022-02-23 10:05:22', '2022-02-23 10:05:22'),
(9, 2, 'item', NULL, 2, 'Menu', NULL, '/menu', '_self', NULL, '2022-02-23 10:05:22', '2022-02-23 10:05:22'),
(10, 2, 'item', NULL, 3, 'About', NULL, '/about', '_self', NULL, '2022-02-23 10:05:22', '2022-02-23 10:05:22'),
(11, 2, 'item', NULL, 4, 'Pages', NULL, '#', '_self', NULL, '2022-02-23 10:05:22', '2022-02-23 10:05:22'),
(12, 2, 'item', NULL, 5, 'Reservation', NULL, '/reservation', '_self', NULL, '2022-02-23 10:05:22', '2022-02-23 10:05:22'),
(13, 2, 'item', NULL, 6, 'Stuff', NULL, '/stuff', '_self', NULL, '2022-02-23 10:05:22', '2022-02-23 10:05:22'),
(14, 2, 'item', NULL, 7, 'Gallery', NULL, '/gallary', '_self', NULL, '2022-02-23 10:05:22', '2022-02-23 10:05:22'),
(15, 2, 'item', NULL, 8, 'Blog', NULL, '#', '_self', NULL, '2022-02-23 10:05:22', '2022-02-23 10:05:22'),
(16, 2, 'item', 15, 1, 'Blog', NULL, '/blog', '_self', NULL, '2022-02-23 10:05:22', '2022-02-23 10:35:02'),
(17, 2, 'item', NULL, 9, 'Blog Single', NULL, '/blog-detail', '_self', NULL, '2022-02-23 10:05:22', '2022-02-23 10:35:02'),
(18, 2, 'item', NULL, 10, 'Contact', NULL, '/contact', '_self', NULL, '2022-02-23 10:05:22', '2022-02-23 10:35:02');

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
(11, '2022_02_23_150537_create_settings_table', 1);

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
(1, 'Admin Dashboard', '2022-02-23 10:05:19', '2022-02-23 10:05:19'),
(2, 'Role Management', '2022-02-23 10:05:19', '2022-02-23 10:05:19'),
(3, 'Backups', '2022-02-23 10:05:19', '2022-02-23 10:05:19'),
(4, 'User Management', '2022-02-23 10:05:19', '2022-02-23 10:05:19'),
(5, 'Menu Management', '2022-02-23 10:05:20', '2022-02-23 10:05:20');

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
(1, 1, 'Access Dashboard', 'admin.dashboard', '2022-02-23 10:05:19', '2022-02-23 10:05:19'),
(2, 2, 'Access Role', 'admin.roles.index', '2022-02-23 10:05:19', '2022-02-23 10:05:19'),
(3, 2, 'Create Role', 'admin.roles.create', '2022-02-23 10:05:19', '2022-02-23 10:05:19'),
(4, 2, 'Edit Role', 'admin.roles.edit', '2022-02-23 10:05:19', '2022-02-23 10:05:19'),
(5, 2, 'Delete Role', 'admin.roles.destroy', '2022-02-23 10:05:19', '2022-02-23 10:05:19'),
(6, 3, 'Access Backup', 'admin.backups.index', '2022-02-23 10:05:19', '2022-02-23 10:05:19'),
(7, 3, 'Create Backup', 'admin.backups.create', '2022-02-23 10:05:19', '2022-02-23 10:05:19'),
(8, 3, 'Download Backup', 'admin.backups.download', '2022-02-23 10:05:19', '2022-02-23 10:05:19'),
(9, 3, 'Delete Backup', 'admin.backups.destroy', '2022-02-23 10:05:19', '2022-02-23 10:05:19'),
(10, 4, 'Access User', 'admin.users.index', '2022-02-23 10:05:19', '2022-02-23 10:05:19'),
(11, 4, 'Create User', 'admin.users.create', '2022-02-23 10:05:19', '2022-02-23 10:05:19'),
(12, 4, 'Edit User', 'admin.users.edit', '2022-02-23 10:05:20', '2022-02-23 10:05:20'),
(13, 4, 'Delete User', 'admin.users.destroy', '2022-02-23 10:05:20', '2022-02-23 10:05:20'),
(14, 5, 'Access Menus', 'admin.menus.index', '2022-02-23 10:05:20', '2022-02-23 10:05:20'),
(15, 5, 'Access Menus Builder', 'admin.menus.builder', '2022-02-23 10:05:20', '2022-02-23 10:05:20'),
(16, 5, 'Create Menu', 'admin.menus.create', '2022-02-23 10:05:20', '2022-02-23 10:05:20'),
(17, 5, 'Edit Menu', 'admin.menus.edit', '2022-02-23 10:05:20', '2022-02-23 10:05:20'),
(18, 5, 'Delete Menu', 'admin.menus.destroy', '2022-02-23 10:05:20', '2022-02-23 10:05:20');

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
(19, 1, 2, NULL, NULL);

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
(1, 'Admin', 'admin', NULL, 0, '2022-02-23 10:05:20', '2022-02-23 10:05:20'),
(2, 'Manager', 'manager', NULL, 0, '2022-02-23 10:05:21', '2022-02-23 10:05:21');

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

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'site_title', 'SiamKitchen', '2022-02-23 10:10:09', '2022-02-23 11:24:27'),
(2, 'site_description', NULL, '2022-02-23 10:10:09', '2022-02-23 10:10:09'),
(3, 'site_address', NULL, '2022-02-23 10:10:09', '2022-02-23 10:10:09');

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
(1, 1, 'Md. Samiul Hoque', 'admin', 'samiulsiam59@gmail.com', NULL, '$2y$10$7pDZcq1oMdzmoTmjIL4jUuqxoivhVTGwF5TPQxplSwhPnj5n.0ua.', NULL, NULL, 1, '2022-02-23 11:29:10', NULL, '2022-02-23 10:05:21', '2022-02-23 11:29:10'),
(2, 2, 'Sharmin Akter Mumu', 'admin', 'mumi@mail.com', NULL, '$2y$10$rThsUbrDM3Vq2.wb0jUiiexGnLXwSEx3d./ZzaxUood3AWXrA92cC', NULL, NULL, 0, NULL, NULL, '2022-02-23 10:05:21', '2022-02-23 10:05:21');

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
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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

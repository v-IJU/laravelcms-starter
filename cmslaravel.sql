-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2023 at 10:59 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cmslaravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `url` varchar(191) NOT NULL,
  `is_url` int(11) NOT NULL DEFAULT 0,
  `icon` varchar(191) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `group_id`, `name`, `url`, `is_url`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Dashboard', '/administrator', 1, 'fa fa-dashboard', 1, '2023-09-07 03:10:30', '2023-09-07 03:28:20'),
(2, 2, 'View Blogs', 'blog.index', 0, NULL, 1, '2023-09-07 03:10:30', '2023-09-07 03:28:20'),
(3, 2, 'Add Blogs', 'blog.create', 0, NULL, 1, '2023-09-07 03:10:30', '2023-09-07 03:28:20'),
(6, 4, 'Module Configurations', '/administrator/configurations/module/1', 1, NULL, 1, '2023-09-07 03:10:30', '2023-09-07 03:28:20'),
(7, 4, 'Site Configurations', 'admin_site_configuration', 0, NULL, 1, '2023-09-07 03:10:30', '2023-09-07 03:28:20'),
(8, 4, 'Mail Configurations', 'admin_mail_configuration', 0, NULL, 1, '2023-09-07 03:10:30', '2023-09-07 03:28:20'),
(9, 1, 'Permissions', 'roles_index_from_admin', 0, 'fa fa-check-square-o', 1, '2023-09-07 03:10:30', '2023-09-07 03:28:20'),
(10, 1, 'Menus', 'wmenuindex', 0, 'fa fa-braille', 1, '2023-09-07 03:10:30', '2023-09-07 03:28:20'),
(11, 1, 'Menu Assignment', 'menu_assign_from_admin', 0, 'fa fa-exchange', 1, '2023-09-07 03:10:30', '2023-09-07 03:28:20'),
(12, 5, 'View Users', 'user.index', 0, NULL, 1, '2023-09-07 03:10:30', '2023-09-07 03:28:20'),
(13, 5, 'Add User', 'user.create', 0, NULL, 1, '2023-09-07 03:10:30', '2023-09-07 03:28:20'),
(14, 6, 'View User Groups', 'usergroup.index', 0, NULL, 1, '2023-09-07 03:10:30', '2023-09-07 03:28:20'),
(15, 6, 'Add User Group', 'usergroup.create', 0, NULL, 1, '2023-09-07 03:10:30', '2023-09-07 03:28:20'),
(16, 1, 'Social Links', '/administrator/social-links', 1, 'fa fa-whatsapp', 1, '2023-09-07 03:10:30', '2023-09-07 03:28:20');

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu_group`
--

CREATE TABLE `admin_menu_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `parent` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu_group`
--

INSERT INTO `admin_menu_group` (`id`, `name`, `parent`, `order`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 'General', 0, 0, NULL, 1, '2023-09-07 03:10:30', '2023-09-07 03:10:30'),
(2, 'Blogs', 1, 10, 'fa fa-edit', 1, '2023-09-07 03:10:30', '2023-09-07 03:10:30'),
(4, 'Configurations', 0, 2, NULL, 1, '2023-09-07 03:10:30', '2023-09-07 03:10:30'),
(5, 'Users', 1, 0, 'fa fa-user', 1, '2023-09-07 03:10:30', '2023-09-07 03:10:30'),
(6, 'User Groups', 1, 1, 'fa fa-users', 1, '2023-09-07 03:10:30', '2023-09-07 03:10:30');

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu_permission`
--

CREATE TABLE `admin_menu_permission` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `content` varchar(15000) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `author` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_category`
--

CREATE TABLE `blog_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `parent` int(11) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `configurations`
--

CREATE TABLE `configurations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `parm` varchar(15000) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `has_permission`
--

CREATE TABLE `has_permission` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menuitems`
--

CREATE TABLE `menuitems` (
  `id` int(10) UNSIGNED NOT NULL,
  `label` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `parent` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  `class` varchar(255) NOT NULL,
  `menu` int(11) NOT NULL,
  `depth` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2017_09_02_1504351466_create_users', 2),
(5, '2017_09_02_1504351499_create_user_groups', 2),
(6, '2017_09_02_1504351519_create_user_group_map', 2),
(7, '2017_09_08_1504856151_create_menu_items_table', 2),
(8, '2017_09_09_1504947624_create_module_table', 2),
(9, '2017_09_09_1504951259_create_permission_table', 2),
(10, '2017_09_13_1505300167_create_admin_menu_group_table', 2),
(11, '2017_09_13_1505300488_create_admin_menu_table', 2),
(12, '2017_09_19_1505798803_create_configurations_table', 2),
(13, '2017_09_21_1505962766_create_blog_category', 2),
(14, '2017_09_21_1505962812_create_blog', 2),
(15, '2017_09_22_1506067223_create_has_permission_table', 2),
(16, '2017_10_31_1509426508_create_admin_menu_permission', 2),
(17, '2017_11_08_1510132969_create_social_links_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `version` varchar(191) NOT NULL,
  `configuration_view` varchar(191) DEFAULT NULL,
  `configuration_data` varchar(191) DEFAULT NULL,
  `configuration_parm` varchar(15000) DEFAULT NULL,
  `type` int(11) NOT NULL COMMENT '1=>core,2=>local',
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `version`, `configuration_view`, `configuration_data`, `configuration_parm`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', '0.0.2', NULL, NULL, NULL, 1, 1, '2023-09-07 03:10:15', '2023-09-07 03:10:15'),
(2, 'blog', '0.0.1', NULL, NULL, NULL, 1, 1, '2023-09-07 03:10:15', '2023-09-07 03:10:15'),
(3, 'configurations', '0.0.1', NULL, NULL, NULL, 1, 1, '2023-09-07 03:10:15', '2023-09-07 03:10:15'),
(4, 'gate', '0.0.1', NULL, NULL, NULL, 1, 1, '2023-09-07 03:10:15', '2023-09-07 03:10:15'),
(5, 'layout', '0.0.1', NULL, NULL, NULL, 1, 1, '2023-09-07 03:10:15', '2023-09-07 03:10:15'),
(6, 'menu', '0.0.1', NULL, NULL, NULL, 1, 1, '2023-09-07 03:10:15', '2023-09-07 03:10:15'),
(7, 'module', '0.0.1', NULL, NULL, NULL, 1, 1, '2023-09-07 03:10:15', '2023-09-07 03:10:15'),
(8, 'search', '0.0.1', NULL, NULL, NULL, 1, 1, '2023-09-07 03:10:15', '2023-09-07 03:10:15'),
(9, 'user', '0.0.1', 'user::admin.configuration.configuration', '\\cms\\core\\user\\Controllers\\UserController@getConfigurationData', NULL, 1, 1, '2023-09-07 03:10:15', '2023-09-07 03:10:15'),
(10, 'usergroup', '0.0.1', NULL, NULL, NULL, 1, 1, '2023-09-07 03:10:15', '2023-09-07 03:10:15'),
(11, 'sociallinks', '0.0.1', NULL, NULL, NULL, 2, 1, '2023-09-07 03:10:15', '2023-09-07 03:10:15');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `module_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_link`
--

CREATE TABLE `social_link` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `link` varchar(5000) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `username` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `images` varchar(191) DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `online` int(11) NOT NULL DEFAULT 0 COMMENT '0=>offline,1=>online',
  `ip` varchar(191) NOT NULL DEFAULT '' COMMENT 'Ip address',
  `lastactive` varchar(191) NOT NULL DEFAULT '' COMMENT 'Last activate time stamp',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '-1=>trash,0=>disable,1=>active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `mobile`, `images`, `password`, `remember_token`, `created_at`, `updated_at`, `online`, `ip`, `lastactive`, `status`) VALUES
(1, 'admin', 'admin', 'admin@admin.com', NULL, NULL, '$2y$10$eKIC6CeBJA4JOPGP3uCONuGNNIT.KbF5Ue7v87vVE8ymvR2fgr96y', NULL, '2023-09-07 08:40:10', '2023-09-07 03:11:12', 1, '127.0.0.1', '2023-09-07 08:41:12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `group` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '-1=>trash,0=>disable,1=>active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`id`, `group`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Super Admin', '2023-09-07 08:40:10', '2023-09-07 08:40:10', 1),
(2, 'Register', '2023-09-07 08:40:10', '2023-09-07 08:40:10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_group_map`
--

CREATE TABLE `user_group_map` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_group_map`
--

INSERT INTO `user_group_map` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_menu_group_id_foreign` (`group_id`);

--
-- Indexes for table `admin_menu_group`
--
ALTER TABLE `admin_menu_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_menu_permission`
--
ALTER TABLE `admin_menu_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_menu_permission_menu_id_foreign` (`menu_id`),
  ADD KEY `admin_menu_permission_group_id_foreign` (`group_id`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_title_unique` (`title`);

--
-- Indexes for table `blog_category`
--
ALTER TABLE `blog_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_category_name_unique` (`name`);

--
-- Indexes for table `configurations`
--
ALTER TABLE `configurations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `configurations_name_unique` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `has_permission`
--
ALTER TABLE `has_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `has_permission_permission_id_foreign` (`permission_id`),
  ADD KEY `has_permission_group_id_foreign` (`group_id`);

--
-- Indexes for table `menuitems`
--
ALTER TABLE `menuitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permission_name_unique` (`name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `social_link`
--
ALTER TABLE `social_link`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `social_link_name_unique` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_groups_group_unique` (`group`);

--
-- Indexes for table `user_group_map`
--
ALTER TABLE `user_group_map`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_group_map_user_id_foreign` (`user_id`),
  ADD KEY `user_group_map_group_id_foreign` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `admin_menu_group`
--
ALTER TABLE `admin_menu_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `admin_menu_permission`
--
ALTER TABLE `admin_menu_permission`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_category`
--
ALTER TABLE `blog_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `configurations`
--
ALTER TABLE `configurations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `has_permission`
--
ALTER TABLE `has_permission`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menuitems`
--
ALTER TABLE `menuitems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_link`
--
ALTER TABLE `social_link`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_group_map`
--
ALTER TABLE `user_group_map`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD CONSTRAINT `admin_menu_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `admin_menu_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `admin_menu_permission`
--
ALTER TABLE `admin_menu_permission`
  ADD CONSTRAINT `admin_menu_permission_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `user_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `admin_menu_permission_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `admin_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `has_permission`
--
ALTER TABLE `has_permission`
  ADD CONSTRAINT `has_permission_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `user_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `has_permission_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_group_map`
--
ALTER TABLE `user_group_map`
  ADD CONSTRAINT `user_group_map_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `user_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_group_map_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

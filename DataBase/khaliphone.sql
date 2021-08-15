-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 15 août 2021 à 22:33
-- Version du serveur :  10.4.18-MariaDB
-- Version de PHP : 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `khaliphone`
--

-- --------------------------------------------------------

--
-- Structure de la table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `admins`
--

INSERT INTO `admins` (`id`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'khaliphone@gmail.com', '$2a$12$kP3IWzkqQqXa8K0Ld3KOQ.HieFujEAJPBY9GyO185WgdzGJZTCUvG', '2021-01-15 18:27:18', '2021-01-16 13:36:21'),
(2, 'khalid@gmail.com', '$2y$12$FEqsDPlWRZbFQR2mUro.reA9NekZad.8XX3TvuW3/6DNTMaaaHbKi', '2021-08-08 20:29:23', '2021-08-08 20:29:23');

-- --------------------------------------------------------

--
-- Structure de la table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `is_home` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `status`, `is_home`, `created_at`, `updated_at`) VALUES
(4, 'Samsang', '1629054867.jpg', 1, 1, '2021-08-08 14:26:33', '2021-08-15 18:14:27'),
(6, 'Iphone', '1629055266.jpg', 1, 1, '2021-08-08 20:06:08', '2021-08-15 18:21:06'),
(7, 'Xiaomi', '1629055246.jpg', 1, 1, '2021-08-08 20:06:45', '2021-08-15 18:20:46'),
(10, 'Oppo', '1629055293.jpg', 1, 1, '2021-08-11 16:50:58', '2021-08-15 18:21:33'),
(11, 'Vivo', '1629055315.jpg', 1, 1, '2021-08-11 16:51:23', '2021-08-15 18:25:13'),
(12, 'Huawei', '1629055453.jpg', 1, 0, '2021-08-15 18:24:13', '2021-08-15 18:24:54');

-- --------------------------------------------------------

--
-- Structure de la table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` enum('Reg','Not-Reg') NOT NULL,
  `qty` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_attr_id` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `user_type`, `qty`, `product_id`, `product_attr_id`, `added_on`) VALUES
(4, 1, 'Reg', 1, 10, 7, '2021-08-15 12:45:56'),
(5, 1, 'Reg', 1, 13, 5, '2021-08-15 07:39:16'),
(6, 1, 'Reg', 1, 8, 1, '2021-08-15 07:52:49'),
(7, 1, 'Reg', 1, 8, 1, '2021-08-15 07:54:11');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_category_id` int(11) NOT NULL,
  `category_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_home` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_slug`, `parent_category_id`, `category_image`, `is_home`, `status`, `created_at`, `updated_at`) VALUES
(14, 'chargeur', 'chargeur', 0, '1629058612.jpg', 1, 1, '2021-08-08 19:43:48', '2021-08-15 19:16:52'),
(15, 'Tablit', 'Tablit', 0, '1629058578.jpg', 1, 1, '2021-08-08 20:10:58', '2021-08-15 19:16:18'),
(18, 'Mobile', 'Mobile', 0, '1628645841.jpg', 1, 1, '2021-08-08 19:41:58', '2021-08-13 11:41:29'),
(19, 'Watch', 'Watch', 0, '1629058645.jpg', 1, 1, '2021-08-08 19:42:21', '2021-08-15 19:17:25'),
(27, 'Glass', 'Glass', 0, '1629059045.jpg', 1, 1, '2021-08-15 19:24:05', '2021-08-15 19:25:35'),
(28, 'Pochette', 'Pochette', 0, '1629059108.jpg', 1, 1, '2021-08-15 19:25:08', '2021-08-15 19:25:08');

-- --------------------------------------------------------

--
-- Structure de la table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `colors`
--

INSERT INTO `colors` (`id`, `color`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Black', 1, '2021-01-25 21:12:11', '2021-01-28 05:15:28'),
(2, 'Red', 1, '2021-01-25 21:12:22', '2021-01-28 04:02:42'),
(3, 'White', 1, '2021-02-17 04:01:35', '2021-02-17 04:01:35'),
(4, 'Cream', 1, '2021-02-24 00:57:35', '2021-02-24 00:57:35'),
(5, 'Green', 1, '2021-02-24 00:57:45', '2021-02-24 00:57:45'),
(6, 'Purple', 1, '2021-02-24 00:57:57', '2021-02-24 00:57:57'),
(7, 'Blue', 1, '2021-02-24 01:00:15', '2021-02-24 01:00:15'),
(8, 'Yellow', 1, '2021-02-24 01:06:42', '2021-02-24 01:06:42');

-- --------------------------------------------------------

--
-- Structure de la table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('Value','Per') COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_order_amt` int(11) NOT NULL,
  `is_one_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `coupons`
--

INSERT INTO `coupons` (`id`, `title`, `code`, `value`, `type`, `min_order_amt`, `is_one_time`, `status`, `created_at`, `updated_at`) VALUES
(1, 'khaliphone', 'phone2021', '140', 'Value', 0, 1, 1, '2021-01-20 01:43:32', '2021-08-09 21:31:25'),
(4, 'khaliCoupon', 'New2020', '15', 'Per', 500, 1, 1, '2021-02-04 23:32:37', '2021-08-09 19:43:25'),
(9, 'dvdc', 'cx', 'c', 'Per', 54545, 1, 1, '2021-08-12 11:43:13', '2021-08-12 11:47:09'),
(10, 'HVH', 'V', 'V', 'Value', 6565, 1, 1, '2021-08-12 11:57:05', '2021-08-12 11:57:05'),
(11, 'khali', 'khali2020', '50', 'Value', 56565, 1, 1, '2021-08-12 11:58:38', '2021-08-12 11:58:38');

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gstin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `mobile`, `password`, `address`, `city`, `state`, `zip`, `company`, `gstin`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ahmed', 'ahmed@gmail.com', '0612345678', 'eyJpdiI6IlBMbzR3R1lyVzY2bndqLzMwSGpwZWc9PSIsInZhbHVlIjoiNHpTeWRmY25aRndvNXVkeVFxaXFNZz09IiwibWFjIjoiMjVkODM1YWEyZjk0YTE2ZjRhNDc3N2UxMTQ4MTI1YTM5YjhiZWY1MDAyYTc4MDE0M2FmMTdiZTQzYTExOTg5MiJ9', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-15 01:48:50', '2021-08-15 01:48:50'),
(2, 'khalid', 'KHALID@gmail.com', '9999999993', 'eyJpdiI6Iis3Q2p3ai9MaVFkakxGNldKU09jQ3c9PSIsInZhbHVlIjoiUHR5YnlRK1lNUWlnU1k3cUhtQmZ4UT09IiwibWFjIjoiOGRmMTg4ZGQ5MDExOTMwYzJlNWRiYmQxYzNjZGRmZTk5M2YzMTdmMTQyNWYwZTc2M2E5NDlmNjhhMzA5Yzk2MiJ9', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-15 06:56:09', '2021-08-15 06:56:09');

-- --------------------------------------------------------

--
-- Structure de la table `home_banners`
--

CREATE TABLE `home_banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `btn_txt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `home_banners`
--

INSERT INTO `home_banners` (`id`, `image`, `btn_txt`, `btn_link`, `status`, `created_at`, `updated_at`) VALUES
(1, '1628887256.jpg', 'SHOP NEW', NULL, 1, '2021-08-11 19:47:29', '2021-08-13 18:40:56'),
(2, '1628887297.jpg', 'SHOP NEW', NULL, 1, '2021-08-11 19:59:57', '2021-08-13 18:41:37');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_08_04_222730_create_admins_table', 1),
(2, '2021_08_05_145013_create_categories_table', 1),
(3, '2021_08_06_121448_create_coupons_table', 1),
(4, '2021_08_06_212713_create_colors_table', 1),
(5, '2021_08_07_002712_create_products_table', 1),
(6, '2021_08_08_180451_create_brands_table', 1),
(7, '2021_08_09_175732_create_taxes_table', 1),
(8, '2021_08_10_025928_create_customers_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `pincode` varchar(25) NOT NULL,
  `coupon_code` varchar(50) DEFAULT NULL,
  `coupon_value` int(11) DEFAULT NULL,
  `order_status` int(11) NOT NULL,
  `payment_type` enum('COD','Gateway') NOT NULL,
  `payment_status` varchar(50) NOT NULL,
  `payment_id` varchar(50) DEFAULT NULL,
  `txn_id` varchar(100) DEFAULT NULL,
  `total_amt` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `customers_id`, `name`, `email`, `mobile`, `address`, `city`, `state`, `pincode`, `coupon_code`, `coupon_value`, `order_status`, `payment_type`, `payment_status`, `payment_id`, `txn_id`, `total_amt`, `added_on`) VALUES
(1, 2, 'khalid', 'KHALID@gmail.com', '9999999993', 'WXW', 'XCXC', 'XC', 'XC C', NULL, 0, 1, 'COD', 'Pending', NULL, NULL, 50, '2021-08-15 07:56:33'),
(2, 1, 'ahmed', 'ahmed@gmail.com', '0612345678', 'CCD', 'XCXC', 'XC', 'XC C', NULL, 0, 1, 'COD', 'Pending', NULL, NULL, 108, '2021-08-15 07:58:06'),
(3, 2, 'khalid', 'KHALID@gmail.com', '9999999993', 'CCD', 'XCXC', 'XC', 'XC C', NULL, 0, 1, 'COD', 'Pending', NULL, NULL, 3, '2021-08-15 07:58:42'),
(4, 2, 'khalid', 'KHALID@gmail.com', '9999999993', 'CCD', 'XCXC', 'XC', 'XC C', NULL, 0, 1, 'COD', 'Pending', NULL, NULL, 3, '2021-08-15 08:28:10');

-- --------------------------------------------------------

--
-- Structure de la table `orders_details`
--

CREATE TABLE `orders_details` (
  `id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `products_attr_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `orders_details`
--

INSERT INTO `orders_details` (`id`, `orders_id`, `product_id`, `products_attr_id`, `price`, `qty`) VALUES
(1, 1, 8, 1, 50, 1),
(2, 2, 8, 1, 50, 1),
(3, 3, 8, 1, 50, 1),
(4, 1, 8, 1, 50, 1),
(5, 3, 13, 5, 3, 1),
(6, 4, 13, 5, 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `orders_status`
--

CREATE TABLE `orders_status` (
  `id` int(11) NOT NULL,
  `orders_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_desc` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `technical_specification` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uses` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warranty` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lead_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_promo` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `image`, `slug`, `brand`, `model`, `short_desc`, `desc`, `technical_specification`, `uses`, `warranty`, `lead_time`, `is_promo`, `status`, `created_at`, `updated_at`) VALUES
(8, 18, 'Samsang Galaxy A72', '1628467162.png', 'Samsang Galaxy A72', '4', '2021', '<p>10/8/2021</p>', '<p>10/15/2021</p>', '<p>Released 2021,</p>\r\n\r\n<p>March 26 203g, 8.4mm thickness Android 11</p>\r\n\r\n<p>, One UI 3.1 128GB/256GB storage, microSDXC 6.7</p>\r\n\r\n<p>&quot; 1080x2400 pixels 64MP 2160p 6/8GB RAM Snapdragon 720G 5000mAh Li-Ion</p>', 'test', '1 ans', 'y', 0, 1, '2021-08-08 18:59:22', '2021-08-15 19:26:59'),
(13, 18, 'SAMSANG GLAXY M51', '1629056304.png', 'SAMSANG M51', '4', '2021', 'SAMSANG M51 2', 'SAMSANG M51 3', 'Released 2021,\r\n\r\nMarch 26 203g, 8.4mm thickness Android 11\r\n\r\n, One UI 3.1 128GB/256GB storage, microSDXC 6.7\r\n\r\n\" 1080x2400 pixels 64MP 2160p 6/8GB RAM Snapdragon 720G 5000mAh Li-Ion', 'KHALID', '1 ANS', '2021', 1, 1, '2021-08-15 18:37:22', '2021-08-15 18:40:56');

-- --------------------------------------------------------

--
-- Structure de la table `products_attr`
--

CREATE TABLE `products_attr` (
  `id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `attr_image` varchar(255) DEFAULT NULL,
  `mrp` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `products_attr`
--

INSERT INTO `products_attr` (`id`, `products_id`, `sku`, `attr_image`, `mrp`, `price`, `qty`, `size_id`, `color_id`) VALUES
(1, 8, '2', '722075036.jpg', 1, 50, 21321, 6, 3),
(5, 13, '1', '331832155.jpg', 2, 3, 4, 6, 2),
(6, 14, 'SC  C', '849434439.jpg', 5, 666, 5, 1, 1),
(7, 10, '6', '958984807.jpg', 5, 5, 6666, 6, 2),
(8, 10, '66', '116778983.jpg', 1, 2, 1, 6, 1),
(9, 12, '1212', '671292914.jpg', 12131, 666, 1, 6, 6),
(11, 14, 'DFEQF', '193719479.png', 1, 1, 77, 6, 0);

-- --------------------------------------------------------

--
-- Structure de la table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `images` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `product_images`
--

INSERT INTO `product_images` (`id`, `products_id`, `images`) VALUES
(5, 8, '376173328.jpg'),
(7, 13, '984717843.jpg'),
(8, 14, '677597764.jpg'),
(9, 10, '318726917.jpg'),
(11, 12, '374746395.jpg'),
(13, 14, '667008652.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sizes`
--

INSERT INTO `sizes` (`id`, `size`, `status`, `created_at`, `updated_at`) VALUES
(1, 'lite', 1, '2021-01-25 19:56:46', '2021-08-13 17:39:56'),
(2, 'pro', 1, '2021-02-23 23:58:04', '2021-08-13 17:40:04'),
(3, 'normal', 1, '2021-02-23 23:58:08', '2021-08-13 17:40:44'),
(4, 'mini', 1, '2021-02-23 23:58:13', '2021-08-13 17:40:26'),
(5, 'max', 1, '2021-08-13 17:40:11', '2021-08-13 17:40:11'),
(6, 'ultra', 1, '2021-08-13 17:40:34', '2021-08-13 17:40:34');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `home_banners`
--
ALTER TABLE `home_banners`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `orders_details`
--
ALTER TABLE `orders_details`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `orders_status`
--
ALTER TABLE `orders_status`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `products_attr`
--
ALTER TABLE `products_attr`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `home_banners`
--
ALTER TABLE `home_banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `orders_details`
--
ALTER TABLE `orders_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `orders_status`
--
ALTER TABLE `orders_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `products_attr`
--
ALTER TABLE `products_attr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

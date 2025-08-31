-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 29, 2025 at 06:47 PM
-- Server version: 10.6.22-MariaDB-cll-lve
-- PHP Version: 8.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bullxgij_twosigma`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `title`, `status`, `created_at`, `updated_at`) VALUES
(1, 'United States', 1, '2025-08-22 07:25:02', '2025-08-22 07:25:02'),
(2, 'Dubai, United Arab Emirates', 1, '2025-08-22 07:25:26', '2025-08-22 07:25:26'),
(3, 'United Arab Emirate', 1, '2025-08-22 07:25:40', '2025-08-22 07:25:40'),
(4, 'United Kingdom', 1, '2025-08-22 07:25:50', '2025-08-22 07:25:50');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) DEFAULT NULL COMMENT 'null is admin',
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `image_driver` varchar(50) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `admin_access` text DEFAULT NULL,
  `last_login` varchar(50) DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `role_id`, `name`, `username`, `email`, `password`, `image`, `image_driver`, `phone`, `address`, `admin_access`, `last_login`, `last_seen`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, NULL, 'admin', 'admin', 'admin@gmail.com', '$2y$10$FrDfm6B94yWyD1TqKBYKKetYuT529Eewq6AO/5NUyWFBEOlHZsqU2', 'adminProfileImage/kCvF9hacTP7cUwbRAbyJFcTlutyBqD.webp', 'local', '+4455541455', 'NY, USA', NULL, '2025-08-29 18:22:23', '2025-08-29 18:22:24', 1, 'DWYjDlRp0nfTtv0rT7LYtm9TTheY7j6evdtVlykrgZ9DeyFPF3IGQAuI8n7s', NULL, '2025-08-29 22:22:24');

-- --------------------------------------------------------

--
-- Table structure for table `amenities`
--

CREATE TABLE `amenities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `amenities`
--

INSERT INTO `amenities` (`id`, `title`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Wifi', 'fas fa-wifi', 1, '2024-10-20 01:47:07', '2024-10-30 08:37:31'),
(2, 'Bath', 'fas fa-bath', 1, '2024-10-20 01:47:32', '2024-10-30 08:39:17'),
(3, 'Bed', 'fas fa-bed', 1, '2024-10-20 01:47:55', '2024-10-30 08:39:44'),
(4, 'Tv', 'fas fa-tv', 1, '2024-10-20 01:48:14', '2024-10-30 08:39:56'),
(5, 'Ac', 'fa fa-temperature-low', 1, '2024-10-20 01:49:03', '2024-10-30 08:40:07'),
(6, 'Swimming Pool', 'fa fa-fish', 1, '2024-10-20 01:50:10', '2024-11-03 02:08:59'),
(7, 'Car', 'fa fa-car', 1, '2024-10-20 01:50:51', '2024-10-30 08:40:29');

-- --------------------------------------------------------

--
-- Table structure for table `basic_controls`
--

CREATE TABLE `basic_controls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `theme` varchar(50) DEFAULT NULL,
  `site_title` varchar(255) DEFAULT NULL,
  `primary_color` varchar(50) DEFAULT NULL,
  `secondary_color` varchar(50) DEFAULT NULL,
  `time_zone` varchar(50) DEFAULT NULL,
  `base_currency` varchar(20) DEFAULT NULL,
  `currency_symbol` varchar(20) DEFAULT NULL,
  `admin_prefix` varchar(191) DEFAULT NULL,
  `is_currency_position` varchar(191) NOT NULL DEFAULT 'left' COMMENT 'left, right',
  `has_space_between_currency_and_amount` tinyint(1) NOT NULL DEFAULT 0,
  `is_force_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `is_share_investment` tinyint(1) NOT NULL DEFAULT 1,
  `is_rank_bonus` tinyint(1) NOT NULL DEFAULT 0,
  `is_maintenance_mode` tinyint(1) NOT NULL DEFAULT 0,
  `paginate` int(11) DEFAULT NULL,
  `strong_password` tinyint(1) NOT NULL DEFAULT 0,
  `registration` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 => disable, 1 => enable',
  `fraction_number` int(11) DEFAULT NULL,
  `sender_email` varchar(255) DEFAULT NULL,
  `sender_email_name` varchar(255) DEFAULT NULL,
  `email_description` text DEFAULT NULL,
  `push_notification` tinyint(1) NOT NULL DEFAULT 0,
  `in_app_notification` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 => inactive, 1 => active',
  `email_notification` tinyint(1) NOT NULL DEFAULT 0,
  `email_verification` tinyint(1) NOT NULL DEFAULT 0,
  `sms_notification` tinyint(1) NOT NULL DEFAULT 0,
  `sms_verification` tinyint(1) NOT NULL DEFAULT 0,
  `tawk_id` varchar(255) DEFAULT NULL,
  `tawk_status` tinyint(1) NOT NULL DEFAULT 0,
  `fb_messenger_status` tinyint(1) NOT NULL DEFAULT 0,
  `fb_app_id` varchar(255) DEFAULT NULL,
  `fb_page_id` varchar(255) DEFAULT NULL,
  `manual_recaptcha` tinyint(1) DEFAULT 0 COMMENT '0 =>inactive, 1 => active ',
  `google_recaptcha` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=>inactive, 1 =>active',
  `manual_recaptcha_admin_login` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 => inactive, 1 => active ',
  `manual_recaptcha_login` tinyint(1) DEFAULT 0 COMMENT '0 = inactive, 1 = active',
  `manual_recaptcha_register` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = inactive, 1 = active',
  `google_recaptcha_admin_login` tinyint(1) DEFAULT 0 COMMENT '0 = inactive, 1 = active',
  `google_recaptcha_login` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = inactive, 1 = active',
  `google_recaptcha_register` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = inactive, 1 = active',
  `measurement_id` varchar(255) DEFAULT NULL,
  `analytic_status` tinyint(1) DEFAULT NULL,
  `error_log` tinyint(1) DEFAULT NULL,
  `is_active_cron_notification` tinyint(1) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `logo_driver` varchar(20) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `favicon_driver` varchar(20) DEFAULT NULL,
  `admin_logo` varchar(255) DEFAULT NULL,
  `admin_logo_driver` varchar(20) DEFAULT NULL,
  `admin_dark_mode_logo` varchar(255) DEFAULT NULL,
  `admin_dark_mode_logo_driver` varchar(50) DEFAULT NULL,
  `currency_layer_access_key` varchar(255) DEFAULT NULL,
  `currency_layer_auto_update_at` varchar(255) DEFAULT NULL,
  `currency_layer_auto_update` varchar(1) DEFAULT NULL,
  `coin_market_cap_app_key` varchar(255) DEFAULT NULL,
  `coin_market_cap_auto_update_at` varchar(255) NOT NULL,
  `coin_market_cap_auto_update` tinyint(1) DEFAULT NULL,
  `automatic_payout_permission` tinyint(1) NOT NULL DEFAULT 0,
  `date_time_format` varchar(255) DEFAULT NULL,
  `deposit_commission` tinyint(1) DEFAULT 0,
  `investment_commission` tinyint(1) DEFAULT 0,
  `profit_commission` tinyint(1) DEFAULT 0,
  `rank_commission` tinyint(1) DEFAULT 0,
  `min_transfer` decimal(11,2) NOT NULL DEFAULT 0.00,
  `max_transfer` decimal(11,2) NOT NULL DEFAULT 0.00,
  `transfer_charge` decimal(11,2) NOT NULL DEFAULT 0.00,
  `is_first_deposit_bonus` tinyint(1) NOT NULL DEFAULT 1,
  `first_deposit_bonus` decimal(10,0) NOT NULL DEFAULT 0,
  `minimum_first_deposit` decimal(11,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `basic_controls`
--

INSERT INTO `basic_controls` (`id`, `theme`, `site_title`, `primary_color`, `secondary_color`, `time_zone`, `base_currency`, `currency_symbol`, `admin_prefix`, `is_currency_position`, `has_space_between_currency_and_amount`, `is_force_ssl`, `is_share_investment`, `is_rank_bonus`, `is_maintenance_mode`, `paginate`, `strong_password`, `registration`, `fraction_number`, `sender_email`, `sender_email_name`, `email_description`, `push_notification`, `in_app_notification`, `email_notification`, `email_verification`, `sms_notification`, `sms_verification`, `tawk_id`, `tawk_status`, `fb_messenger_status`, `fb_app_id`, `fb_page_id`, `manual_recaptcha`, `google_recaptcha`, `manual_recaptcha_admin_login`, `manual_recaptcha_login`, `manual_recaptcha_register`, `google_recaptcha_admin_login`, `google_recaptcha_login`, `google_recaptcha_register`, `measurement_id`, `analytic_status`, `error_log`, `is_active_cron_notification`, `logo`, `logo_driver`, `favicon`, `favicon_driver`, `admin_logo`, `admin_logo_driver`, `admin_dark_mode_logo`, `admin_dark_mode_logo_driver`, `currency_layer_access_key`, `currency_layer_auto_update_at`, `currency_layer_auto_update`, `coin_market_cap_app_key`, `coin_market_cap_auto_update_at`, `coin_market_cap_auto_update`, `automatic_payout_permission`, `date_time_format`, `deposit_commission`, `investment_commission`, `profit_commission`, `rank_commission`, `min_transfer`, `max_transfer`, `transfer_charge`, `is_first_deposit_bonus`, `first_deposit_bonus`, `minimum_first_deposit`, `created_at`, `updated_at`) VALUES
(1, 'green', 'Two Sigma Real Estate', '#cc54f4', '#488ff9', 'America/New_York', 'USD', '$', 'admin', 'left', 0, 0, 1, 1, 0, 20, 0, 1, 2, 'support@mail.com', 'Bug Admin', '<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n<meta name=\"viewport\" content=\"width=device-width\">\r\n<style type=\"text/css\">\r\n    @media only screen and (min-width: 620px) {\r\n        * [lang=x-wrapper] h1 {\r\n        }\r\n\r\n        * [lang=x-wrapper] h1 {\r\n            font-size: 26px !important;\r\n            line-height: 34px !important\r\n        }\r\n\r\n        * [lang=x-wrapper] h2 {\r\n        }\r\n\r\n        * [lang=x-wrapper] h2 {\r\n            font-size: 20px !important;\r\n            line-height: 28px !important\r\n        }\r\n\r\n        * [lang=x-wrapper] h3 {\r\n        }\r\n\r\n        * [lang=x-layout__inner] p,\r\n        * [lang=x-layout__inner] ol,\r\n        * [lang=x-layout__inner] ul {\r\n        }\r\n\r\n        * div [lang=x-size-8] {\r\n            font-size: 8px !important;\r\n            line-height: 14px !important\r\n        }\r\n\r\n        * div [lang=x-size-9] {\r\n            font-size: 9px !important;\r\n            line-height: 16px !important\r\n        }\r\n\r\n        * div [lang=x-size-10] {\r\n            font-size: 10px !important;\r\n            line-height: 18px !important\r\n        }\r\n\r\n        * div [lang=x-size-11] {\r\n            font-size: 11px !important;\r\n            line-height: 19px !important\r\n        }\r\n\r\n        * div [lang=x-size-12] {\r\n            font-size: 12px !important;\r\n            line-height: 19px !important\r\n        }\r\n\r\n        * div [lang=x-size-13] {\r\n            font-size: 13px !important;\r\n            line-height: 21px !important\r\n        }\r\n\r\n        * div [lang=x-size-14] {\r\n            font-size: 14px !important;\r\n            line-height: 21px !important\r\n        }\r\n\r\n        * div [lang=x-size-15] {\r\n            font-size: 15px !important;\r\n            line-height: 23px !important\r\n        }\r\n\r\n        * div [lang=x-size-16] {\r\n            font-size: 16px !important;\r\n            line-height: 24px !important\r\n        }\r\n\r\n        * div [lang=x-size-17] {\r\n            font-size: 17px !important;\r\n            line-height: 26px !important\r\n        }\r\n\r\n        * div [lang=x-size-18] {\r\n            font-size: 18px !important;\r\n            line-height: 26px !important\r\n        }\r\n\r\n        * div [lang=x-size-18] {\r\n            font-size: 18px !important;\r\n            line-height: 26px !important\r\n        }\r\n\r\n        * div [lang=x-size-20] {\r\n            font-size: 20px !important;\r\n            line-height: 28px !important\r\n        }\r\n\r\n        * div [lang=x-size-22] {\r\n            font-size: 22px !important;\r\n            line-height: 31px !important\r\n        }\r\n\r\n        * div [lang=x-size-24] {\r\n            font-size: 24px !important;\r\n            line-height: 32px !important\r\n        }\r\n\r\n        * div [lang=x-size-26] {\r\n            font-size: 26px !important;\r\n            line-height: 34px !important\r\n        }\r\n\r\n        * div [lang=x-size-28] {\r\n            font-size: 28px !important;\r\n            line-height: 36px !important\r\n        }\r\n\r\n        * div [lang=x-size-30] {\r\n            font-size: 30px !important;\r\n            line-height: 38px !important\r\n        }\r\n\r\n        * div [lang=x-size-32] {\r\n            font-size: 32px !important;\r\n            line-height: 40px !important\r\n        }\r\n\r\n        * div [lang=x-size-34] {\r\n            font-size: 34px !important;\r\n            line-height: 43px !important\r\n        }\r\n\r\n        * div [lang=x-size-36] {\r\n            font-size: 36px !important;\r\n            line-height: 43px !important\r\n        }\r\n\r\n        * div [lang=x-size-40] {\r\n            font-size: 40px !important;\r\n            line-height: 47px !important\r\n        }\r\n\r\n        * div [lang=x-size-44] {\r\n            font-size: 44px !important;\r\n            line-height: 50px !important\r\n        }\r\n\r\n        * div [lang=x-size-48] {\r\n            font-size: 48px !important;\r\n            line-height: 54px !important\r\n        }\r\n\r\n        * div [lang=x-size-56] {\r\n            font-size: 56px !important;\r\n            line-height: 60px !important\r\n        }\r\n\r\n        * div [lang=x-size-64] {\r\n            font-size: 64px !important;\r\n            line-height: 63px !important\r\n        }\r\n    }\r\n</style>\r\n<style type=\"text/css\">\r\n    body {\r\n        margin: 0;\r\n        padding: 0;\r\n    }\r\n\r\n    table {\r\n        border-collapse: collapse;\r\n        table-layout: fixed;\r\n    }\r\n\r\n    * {\r\n        line-height: inherit;\r\n    }\r\n\r\n    [x-apple-data-detectors],\r\n    [href^=\"tel\"],\r\n    [href^=\"sms\"] {\r\n        color: inherit !important;\r\n        text-decoration: none !important;\r\n    }\r\n\r\n    .wrapper .footer__share-button a:hover,\r\n    .wrapper .footer__share-button a:focus {\r\n        color: #ffffff !important;\r\n    }\r\n\r\n    .btn a:hover,\r\n    .btn a:focus,\r\n    .footer__share-button a:hover,\r\n    .footer__share-button a:focus,\r\n    .email-footer__links a:hover,\r\n    .email-footer__links a:focus {\r\n        opacity: 0.8;\r\n    }\r\n\r\n    .preheader,\r\n    .header,\r\n    .layout,\r\n    .column {\r\n        transition: width 0.25s ease-in-out, max-width 0.25s ease-in-out;\r\n    }\r\n\r\n    .layout,\r\n    .header {\r\n        max-width: 400px !important;\r\n        -fallback-width: 95% !important;\r\n        width: calc(100% - 20px) !important;\r\n    }\r\n\r\n    div.preheader {\r\n        max-width: 360px !important;\r\n        -fallback-width: 90% !important;\r\n        width: calc(100% - 60px) !important;\r\n    }\r\n\r\n    .snippet,\r\n    .webversion {\r\n        Float: none !important;\r\n    }\r\n\r\n    .column {\r\n        max-width: 400px !important;\r\n        width: 100% !important;\r\n    }\r\n\r\n    .fixed-width.has-border {\r\n        max-width: 402px !important;\r\n    }\r\n\r\n    .fixed-width.has-border .layout__inner {\r\n        box-sizing: border-box;\r\n    }\r\n\r\n    .snippet,\r\n    .webversion {\r\n        width: 50% !important;\r\n    }\r\n\r\n    .ie .btn {\r\n        width: 100%;\r\n    }\r\n\r\n    .ie .column,\r\n    [owa] .column,\r\n    .ie .gutter,\r\n    [owa] .gutter {\r\n        display: table-cell;\r\n        float: none !important;\r\n        vertical-align: top;\r\n    }\r\n\r\n    .ie div.preheader,\r\n    [owa] div.preheader,\r\n    .ie .email-footer,\r\n    [owa] .email-footer {\r\n        max-width: 560px !important;\r\n        width: 560px !important;\r\n    }\r\n\r\n    .ie .snippet,\r\n    [owa] .snippet,\r\n    .ie .webversion,\r\n    [owa] .webversion {\r\n        width: 280px !important;\r\n    }\r\n\r\n    .ie .header,\r\n    [owa] .header,\r\n    .ie .layout,\r\n    [owa] .layout,\r\n    .ie .one-col .column,\r\n    [owa] .one-col .column {\r\n        max-width: 600px !important;\r\n        width: 600px !important;\r\n    }\r\n\r\n    .ie .fixed-width.has-border,\r\n    [owa] .fixed-width.has-border,\r\n    .ie .has-gutter.has-border,\r\n    [owa] .has-gutter.has-border {\r\n        max-width: 602px !important;\r\n        width: 602px !important;\r\n    }\r\n\r\n    .ie .two-col .column,\r\n    [owa] .two-col .column {\r\n        width: 300px !important;\r\n    }\r\n\r\n    .ie .three-col .column,\r\n    [owa] .three-col .column,\r\n    .ie .narrow,\r\n    [owa] .narrow {\r\n        width: 200px !important;\r\n    }\r\n\r\n    .ie .wide,\r\n    [owa] .wide {\r\n        width: 400px !important;\r\n    }\r\n\r\n    .ie .two-col.has-gutter .column,\r\n    [owa] .two-col.x_has-gutter .column {\r\n        width: 290px !important;\r\n    }\r\n\r\n    .ie .three-col.has-gutter .column,\r\n    [owa] .three-col.x_has-gutter .column,\r\n    .ie .has-gutter .narrow,\r\n    [owa] .has-gutter .narrow {\r\n        width: 188px !important;\r\n    }\r\n\r\n    .ie .has-gutter .wide,\r\n    [owa] .has-gutter .wide {\r\n        width: 394px !important;\r\n    }\r\n\r\n    .ie .two-col.has-gutter.has-border .column,\r\n    [owa] .two-col.x_has-gutter.x_has-border .column {\r\n        width: 292px !important;\r\n    }\r\n\r\n    .ie .three-col.has-gutter.has-border .column,\r\n    [owa] .three-col.x_has-gutter.x_has-border .column,\r\n    .ie .has-gutter.has-border .narrow,\r\n    [owa] .has-gutter.x_has-border .narrow {\r\n        width: 190px !important;\r\n    }\r\n\r\n    .ie .has-gutter.has-border .wide,\r\n    [owa] .has-gutter.x_has-border .wide {\r\n        width: 396px !important;\r\n    }\r\n\r\n    .ie .fixed-width .layout__inner {\r\n        border-left: 0 none white !important;\r\n        border-right: 0 none white !important;\r\n    }\r\n\r\n    .ie .layout__edges {\r\n        display: none;\r\n    }\r\n\r\n    .mso .layout__edges {\r\n        font-size: 0;\r\n    }\r\n\r\n    .layout-fixed-width,\r\n    .mso .layout-full-width {\r\n        background-color: #ffffff;\r\n    }\r\n\r\n    @media only screen and (min-width: 620px) {\r\n\r\n        .column,\r\n        .gutter {\r\n            display: table-cell;\r\n            Float: none !important;\r\n            vertical-align: top;\r\n        }\r\n\r\n        div.preheader,\r\n        .email-footer {\r\n            max-width: 560px !important;\r\n            width: 560px !important;\r\n        }\r\n\r\n        .snippet,\r\n        .webversion {\r\n            width: 280px !important;\r\n        }\r\n\r\n        .header,\r\n        .layout,\r\n        .one-col .column {\r\n            max-width: 600px !important;\r\n            width: 600px !important;\r\n        }\r\n\r\n        .fixed-width.has-border,\r\n        .fixed-width.ecxhas-border,\r\n        .has-gutter.has-border,\r\n        .has-gutter.ecxhas-border {\r\n            max-width: 602px !important;\r\n            width: 602px !important;\r\n        }\r\n\r\n        .two-col .column {\r\n            width: 300px !important;\r\n        }\r\n\r\n        .three-col .column,\r\n        .column.narrow {\r\n            width: 200px !important;\r\n        }\r\n\r\n        .column.wide {\r\n            width: 400px !important;\r\n        }\r\n\r\n        .two-col.has-gutter .column,\r\n        .two-col.ecxhas-gutter .column {\r\n            width: 290px !important;\r\n        }\r\n\r\n        .three-col.has-gutter .column,\r\n        .three-col.ecxhas-gutter .column,\r\n        .has-gutter .narrow {\r\n            width: 188px !important;\r\n        }\r\n\r\n        .has-gutter .wide {\r\n            width: 394px !important;\r\n        }\r\n\r\n        .two-col.has-gutter.has-border .column,\r\n        .two-col.ecxhas-gutter.ecxhas-border .column {\r\n            width: 292px !important;\r\n        }\r\n\r\n        .three-col.has-gutter.has-border .column,\r\n        .three-col.ecxhas-gutter.ecxhas-border .column,\r\n        .has-gutter.has-border .narrow,\r\n        .has-gutter.ecxhas-border .narrow {\r\n            width: 190px !important;\r\n        }\r\n\r\n        .has-gutter.has-border .wide,\r\n        .has-gutter.ecxhas-border .wide {\r\n            width: 396px !important;\r\n        }\r\n    }\r\n\r\n    @media only screen and (-webkit-min-device-pixel-ratio: 2), only screen and (min--moz-device-pixel-ratio: 2), only screen and (-o-min-device-pixel-ratio: 2/1), only screen and (min-device-pixel-ratio: 2), only screen and (min-resolution: 192dpi), only screen and (min-resolution: 2dppx) {\r\n        .fblike {\r\n            background-image: url(https://i3.createsend1.com/static/eb/customise/13-the-blueprint-3/images/fblike@2x.png) !important;\r\n        }\r\n\r\n        .tweet {\r\n            background-image: url(https://i4.createsend1.com/static/eb/customise/13-the-blueprint-3/images/tweet@2x.png) !important;\r\n        }\r\n\r\n        .linkedinshare {\r\n            background-image: url(https://i6.createsend1.com/static/eb/customise/13-the-blueprint-3/images/lishare@2x.png) !important;\r\n        }\r\n\r\n        .forwardtoafriend {\r\n            background-image: url(https://i5.createsend1.com/static/eb/customise/13-the-blueprint-3/images/forward@2x.png) !important;\r\n        }\r\n    }\r\n\r\n    @media (max-width: 321px) {\r\n        .fixed-width.has-border .layout__inner {\r\n            border-width: 1px 0 !important;\r\n        }\r\n\r\n        .layout,\r\n        .column {\r\n            min-width: 320px !important;\r\n            width: 320px !important;\r\n        }\r\n\r\n        .border {\r\n            display: none;\r\n        }\r\n    }\r\n\r\n    .mso div {\r\n        border: 0 none white !important;\r\n    }\r\n\r\n    .mso .w560 .divider {\r\n        margin-left: 260px !important;\r\n        margin-right: 260px !important;\r\n    }\r\n\r\n    .mso .w360 .divider {\r\n        margin-left: 160px !important;\r\n        margin-right: 160px !important;\r\n    }\r\n\r\n    .mso .w260 .divider {\r\n        margin-left: 110px !important;\r\n        margin-right: 110px !important;\r\n    }\r\n\r\n    .mso .w160 .divider {\r\n        margin-left: 60px !important;\r\n        margin-right: 60px !important;\r\n    }\r\n\r\n    .mso .w354 .divider {\r\n        margin-left: 157px !important;\r\n        margin-right: 157px !important;\r\n    }\r\n\r\n    .mso .w250 .divider {\r\n        margin-left: 105px !important;\r\n        margin-right: 105px !important;\r\n    }\r\n\r\n    .mso .w148 .divider {\r\n        margin-left: 54px !important;\r\n        margin-right: 54px !important;\r\n    }\r\n\r\n    .mso .font-avenir,\r\n    .mso .font-cabin,\r\n    .mso .font-open-sans,\r\n    .mso .font-ubuntu {\r\n        font-family: sans-serif !important;\r\n    }\r\n\r\n    .mso .font-bitter,\r\n    .mso .font-merriweather,\r\n    .mso .font-pt-serif {\r\n        font-family: Georgia, serif !important;\r\n    }\r\n\r\n    .mso .font-lato,\r\n    .mso .font-roboto {\r\n        font-family: Tahoma, sans-serif !important;\r\n    }\r\n\r\n    .mso .font-pt-sans {\r\n        font-family: \"Trebuchet MS\", sans-serif !important;\r\n    }\r\n\r\n    .mso .footer__share-button p {\r\n        margin: 0;\r\n    }\r\n\r\n    @media only screen and (min-width: 620px) {\r\n        .wrapper .size-8 {\r\n            font-size: 8px !important;\r\n            line-height: 14px !important;\r\n        }\r\n\r\n        .wrapper .size-9 {\r\n            font-size: 9px !important;\r\n            line-height: 16px !important;\r\n        }\r\n\r\n        .wrapper .size-10 {\r\n            font-size: 10px !important;\r\n            line-height: 18px !important;\r\n        }\r\n\r\n        .wrapper .size-11 {\r\n            font-size: 11px !important;\r\n            line-height: 19px !important;\r\n        }\r\n\r\n        .wrapper .size-12 {\r\n            font-size: 12px !important;\r\n            line-height: 19px !important;\r\n        }\r\n\r\n        .wrapper .size-13 {\r\n            font-size: 13px !important;\r\n            line-height: 21px !important;\r\n        }\r\n\r\n        .wrapper .size-14 {\r\n            font-size: 14px !important;\r\n            line-height: 21px !important;\r\n        }\r\n\r\n        .wrapper .size-15 {\r\n            font-size: 15px !important;\r\n            line-height: 23px !important;\r\n        }\r\n\r\n        .wrapper .size-16 {\r\n            font-size: 16px !important;\r\n            line-height: 24px !important;\r\n        }\r\n\r\n        .wrapper .size-17 {\r\n            font-size: 17px !important;\r\n            line-height: 26px !important;\r\n        }\r\n\r\n        .wrapper .size-18 {\r\n            font-size: 18px !important;\r\n            line-height: 26px !important;\r\n        }\r\n\r\n        .wrapper .size-20 {\r\n            font-size: 20px !important;\r\n            line-height: 28px !important;\r\n        }\r\n\r\n        .wrapper .size-22 {\r\n            font-size: 22px !important;\r\n            line-height: 31px !important;\r\n        }\r\n\r\n        .wrapper .size-24 {\r\n            font-size: 24px !important;\r\n            line-height: 32px !important;\r\n        }\r\n\r\n        .wrapper .size-26 {\r\n            font-size: 26px !important;\r\n            line-height: 34px !important;\r\n        }\r\n\r\n        .wrapper .size-28 {\r\n            font-size: 28px !important;\r\n            line-height: 36px !important;\r\n        }\r\n\r\n        .wrapper .size-30 {\r\n            font-size: 30px !important;\r\n            line-height: 38px !important;\r\n        }\r\n\r\n        .wrapper .size-32 {\r\n            font-size: 32px !important;\r\n            line-height: 40px !important;\r\n        }\r\n\r\n        .wrapper .size-34 {\r\n            font-size: 34px !important;\r\n            line-height: 43px !important;\r\n        }\r\n\r\n        .wrapper .size-36 {\r\n            font-size: 36px !important;\r\n            line-height: 43px !important;\r\n        }\r\n\r\n        .wrapper .size-40 {\r\n            font-size: 40px !important;\r\n            line-height: 47px !important;\r\n        }\r\n\r\n        .wrapper .size-44 {\r\n            font-size: 44px !important;\r\n            line-height: 50px !important;\r\n        }\r\n\r\n        .wrapper .size-48 {\r\n            font-size: 48px !important;\r\n            line-height: 54px !important;\r\n        }\r\n\r\n        .wrapper .size-56 {\r\n            font-size: 56px !important;\r\n            line-height: 60px !important;\r\n        }\r\n\r\n        .wrapper .size-64 {\r\n            font-size: 64px !important;\r\n            line-height: 63px !important;\r\n        }\r\n    }\r\n\r\n    .mso .size-8,\r\n    .ie .size-8 {\r\n        font-size: 8px !important;\r\n        line-height: 14px !important;\r\n    }\r\n\r\n    .mso .size-9,\r\n    .ie .size-9 {\r\n        font-size: 9px !important;\r\n        line-height: 16px !important;\r\n    }\r\n\r\n    .mso .size-10,\r\n    .ie .size-10 {\r\n        font-size: 10px !important;\r\n        line-height: 18px !important;\r\n    }\r\n\r\n    .mso .size-11,\r\n    .ie .size-11 {\r\n        font-size: 11px !important;\r\n        line-height: 19px !important;\r\n    }\r\n\r\n    .mso .size-12,\r\n    .ie .size-12 {\r\n        font-size: 12px !important;\r\n        line-height: 19px !important;\r\n    }\r\n\r\n    .mso .size-13,\r\n    .ie .size-13 {\r\n        font-size: 13px !important;\r\n        line-height: 21px !important;\r\n    }\r\n\r\n    .mso .size-14,\r\n    .ie .size-14 {\r\n        font-size: 14px !important;\r\n        line-height: 21px !important;\r\n    }\r\n\r\n    .mso .size-15,\r\n    .ie .size-15 {\r\n        font-size: 15px !important;\r\n        line-height: 23px !important;\r\n    }\r\n\r\n    .mso .size-16,\r\n    .ie .size-16 {\r\n        font-size: 16px !important;\r\n        line-height: 24px !important;\r\n    }\r\n\r\n    .mso .size-17,\r\n    .ie .size-17 {\r\n        font-size: 17px !important;\r\n        line-height: 26px !important;\r\n    }\r\n\r\n    .mso .size-18,\r\n    .ie .size-18 {\r\n        font-size: 18px !important;\r\n        line-height: 26px !important;\r\n    }\r\n\r\n    .mso .size-20,\r\n    .ie .size-20 {\r\n        font-size: 20px !important;\r\n        line-height: 28px !important;\r\n    }\r\n\r\n    .mso .size-22,\r\n    .ie .size-22 {\r\n        font-size: 22px !important;\r\n        line-height: 31px !important;\r\n    }\r\n\r\n    .mso .size-24,\r\n    .ie .size-24 {\r\n        font-size: 24px !important;\r\n        line-height: 32px !important;\r\n    }\r\n\r\n    .mso .size-26,\r\n    .ie .size-26 {\r\n        font-size: 26px !important;\r\n        line-height: 34px !important;\r\n    }\r\n\r\n    .mso .size-28,\r\n    .ie .size-28 {\r\n        font-size: 28px !important;\r\n        line-height: 36px !important;\r\n    }\r\n\r\n    .mso .size-30,\r\n    .ie .size-30 {\r\n        font-size: 30px !important;\r\n        line-height: 38px !important;\r\n    }\r\n\r\n    .mso .size-32,\r\n    .ie .size-32 {\r\n        font-size: 32px !important;\r\n        line-height: 40px !important;\r\n    }\r\n\r\n    .mso .size-34,\r\n    .ie .size-34 {\r\n        font-size: 34px !important;\r\n        line-height: 43px !important;\r\n    }\r\n\r\n    .mso .size-36,\r\n    .ie .size-36 {\r\n        font-size: 36px !important;\r\n        line-height: 43px !important;\r\n    }\r\n\r\n    .mso .size-40,\r\n    .ie .size-40 {\r\n        font-size: 40px !important;\r\n        line-height: 47px !important;\r\n    }\r\n\r\n    .mso .size-44,\r\n    .ie .size-44 {\r\n        font-size: 44px !important;\r\n        line-height: 50px !important;\r\n    }\r\n\r\n    .mso .size-48,\r\n    .ie .size-48 {\r\n        font-size: 48px !important;\r\n        line-height: 54px !important;\r\n    }\r\n\r\n    .mso .size-56,\r\n    .ie .size-56 {\r\n        font-size: 56px !important;\r\n        line-height: 60px !important;\r\n    }\r\n\r\n    .mso .size-64,\r\n    .ie .size-64 {\r\n        font-size: 64px !important;\r\n        line-height: 63px !important;\r\n    }\r\n\r\n    .footer__share-button p {\r\n        margin: 0;\r\n    }\r\n</style>\r\n\r\n<title></title>\r\n<!--[if !mso]><!-->\r\n<style type=\"text/css\">\r\n    @import url(https://fonts.googleapis.com/css?family=Bitter:400,700,400italic|Cabin:400,700,400italic,700italic|Open+Sans:400italic,700italic,700,400);\r\n</style>\r\n<link href=\"https://fonts.googleapis.com/css?family=Bitter:400,700,400italic|Cabin:400,700,400italic,700italic|Open+Sans:400italic,700italic,700,400\" rel=\"stylesheet\" type=\"text/css\">\r\n<!--<![endif]-->\r\n<style type=\"text/css\">\r\n    body {\r\n        background-color: #f5f7fa\r\n    }\r\n\r\n    .mso h1 {\r\n    }\r\n\r\n    .mso h1 {\r\n        font-family: sans-serif !important\r\n    }\r\n\r\n    .mso h2 {\r\n    }\r\n\r\n    .mso h3 {\r\n    }\r\n\r\n    .mso .column,\r\n    .mso .column__background td {\r\n    }\r\n\r\n    .mso .column,\r\n    .mso .column__background td {\r\n        font-family: sans-serif !important\r\n    }\r\n\r\n    .mso .btn a {\r\n    }\r\n\r\n    .mso .btn a {\r\n        font-family: sans-serif !important\r\n    }\r\n\r\n    .mso .webversion,\r\n    .mso .snippet,\r\n    .mso .layout-email-footer td,\r\n    .mso .footer__share-button p {\r\n    }\r\n\r\n    .mso .webversion,\r\n    .mso .snippet,\r\n    .mso .layout-email-footer td,\r\n    .mso .footer__share-button p {\r\n        font-family: sans-serif !important\r\n    }\r\n\r\n    .mso .logo {\r\n    }\r\n\r\n    .mso .logo {\r\n        font-family: Tahoma, sans-serif !important\r\n    }\r\n\r\n    .logo a:hover,\r\n    .logo a:focus {\r\n        color: #859bb1 !important\r\n    }\r\n\r\n    .mso .layout-has-border {\r\n        border-top: 1px solid #b1c1d8;\r\n        border-bottom: 1px solid #b1c1d8\r\n    }\r\n\r\n    .mso .layout-has-bottom-border {\r\n        border-bottom: 1px solid #b1c1d8\r\n    }\r\n\r\n    .mso .border,\r\n    .ie .border {\r\n        background-color: #b1c1d8\r\n    }\r\n\r\n    @media only screen and (min-width: 620px) {\r\n        .wrapper h1 {\r\n        }\r\n\r\n        .wrapper h1 {\r\n            font-size: 26px !important;\r\n            line-height: 34px !important\r\n        }\r\n\r\n        .wrapper h2 {\r\n        }\r\n\r\n        .wrapper h2 {\r\n            font-size: 20px !important;\r\n            line-height: 28px !important\r\n        }\r\n\r\n        .wrapper h3 {\r\n        }\r\n\r\n        .column p,\r\n        .column ol,\r\n        .column ul {\r\n        }\r\n    }\r\n\r\n    .mso h1,\r\n    .ie h1 {\r\n    }\r\n\r\n    .mso h1,\r\n    .ie h1 {\r\n        font-size: 26px !important;\r\n        line-height: 34px !important\r\n    }\r\n\r\n    .mso h2,\r\n    .ie h2 {\r\n    }\r\n\r\n    .mso h2,\r\n    .ie h2 {\r\n        font-size: 20px !important;\r\n        line-height: 28px !important\r\n    }\r\n\r\n    .mso h3,\r\n    .ie h3 {\r\n    }\r\n\r\n    .mso .layout__inner p,\r\n    .ie .layout__inner p,\r\n    .mso .layout__inner ol,\r\n    .ie .layout__inner ol,\r\n    .mso .layout__inner ul,\r\n    .ie .layout__inner ul {\r\n    }\r\n</style>\r\n<meta name=\"robots\" content=\"noindex,nofollow\">\r\n\r\n<meta property=\"og:title\" content=\"Just One More Step\">\r\n\r\n<link href=\"https://css.createsend1.com/css/social.min.css?h=0ED47CE120160920\" media=\"screen,projection\" rel=\"stylesheet\" type=\"text/css\">\r\n\r\n\r\n<div class=\"wrapper\" style=\"min-width: 320px;background-color: #f5f7fa;\" lang=\"x-wrapper\">\r\n    <div class=\"preheader\" style=\"margin: 0 auto;max-width: 560px;min-width: 280px; width: 280px;\">\r\n        <div style=\"border-collapse: collapse;display: table;width: 100%;\">\r\n            <div class=\"snippet\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 140px; width: 140px;padding: 10px 0 5px 0;color: #b9b9b9;\">\r\n            </div>\r\n            <div class=\"webversion\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 139px; width: 139px;padding: 10px 0 5px 0;text-align: right;color: #b9b9b9;\">\r\n            </div>\r\n        </div>\r\n\r\n        <div class=\"layout one-col fixed-width\" style=\"margin: 0 auto;max-width: 600px;min-width: 320px; width: 320px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;\">\r\n            <div class=\"layout__inner\" style=\"border-collapse: collapse;display: table;width: 100%;background-color: #c4e5dc;\" lang=\"x-layout__inner\">\r\n                <div class=\"column\" style=\"text-align: left;color: #60666d;font-size: 14px;line-height: 21px;max-width:600px;min-width:320px;\">\r\n                    <div style=\"margin-left: 20px;margin-right: 20px;margin-top: 24px;margin-bottom: 24px;\">\r\n                        <h1 style=\"margin-top: 0;margin-bottom: 0;font-style: normal;font-weight: normal;color: #44a8c7;font-size: 36px;line-height: 43px;font-family: bitter,georgia,serif;text-align: center;\">\r\n                            <img style=\"width: 200px;\" src=\"https://bug-finder.s3.ap-southeast-1.amazonaws.com/assets/logo/header-logo.svg\" data-filename=\"imageedit_76_3542310111.png\"></h1>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n\r\n            <div class=\"layout one-col fixed-width\" style=\"margin: 0 auto;max-width: 600px;min-width: 320px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;\">\r\n                <div class=\"layout__inner\" style=\"border-collapse: collapse;display: table;width: 100%;background-color: #ffffff;\" lang=\"x-layout__inner\">\r\n                    <div class=\"column\" style=\"text-align: left; background: rgb(237, 241, 235); line-height: 21px; max-width: 600px; min-width: 320px; width: 320px;\">\r\n\r\n                        <div style=\"color: rgb(96, 102, 109); font-size: 14px; margin-left: 20px; margin-right: 20px; margin-top: 24px;\">\r\n                            <div style=\"line-height:10px;font-size:1px\">&nbsp;</div>\r\n                        </div>\r\n\r\n                        <div style=\"margin-left: 20px; margin-right: 20px;\">\r\n\r\n                            <p style=\"color: rgb(96, 102, 109); font-size: 14px; margin-top: 16px; margin-bottom: 0px;\"><strong>Hello [[name]],</strong></p>\r\n                            <p style=\"color: rgb(96, 102, 109); font-size: 14px; margin-top: 20px; margin-bottom: 20px;\"><strong>[[message]]</strong></p>\r\n                            <p style=\"margin-top: 20px; margin-bottom: 20px;\"><strong style=\"color: rgb(96, 102, 109); font-size: 14px;\">Sincerely,<br>Team&nbsp;</strong><font color=\"#60666d\"><b>Bug Finder</b></font></p>\r\n                        </div>\r\n\r\n                    </div>\r\n                </div>\r\n            </div>\r\n\r\n            <div class=\"layout__inner\" style=\"border-collapse: collapse;display: table;width: 100%;background-color: #2c3262; margin-bottom: 20px\" lang=\"x-layout__inner\">\r\n                <div class=\"column\" style=\"text-align: left;color: #60666d;font-size: 14px;line-height: 21px;max-width:600px;min-width:320px;\">\r\n                    <div style=\"margin-top: 5px;margin-bottom: 5px;\">\r\n                        <p style=\"margin-top: 0;margin-bottom: 0;font-style: normal;font-weight: normal;color: #ffffff;font-size: 16px;line-height: 35px;font-family: bitter,georgia,serif;text-align: center;\">\r\n                            2024 ©  All Right Reserved</p>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n\r\n        </div>\r\n\r\n\r\n        <div style=\"border-collapse: collapse;display: table;width: 100%;\">\r\n            <div class=\"snippet\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 140px; width: 140px;padding: 10px 0 5px 0;color: #b9b9b9;\">\r\n            </div>\r\n            <div class=\"webversion\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 139px; width: 139px;padding: 10px 0 5px 0;text-align: right;color: #b9b9b9;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>', 0, 0, 0, 0, 0, 0, 'OSLDSF465DD', 0, 0, 'KLSDKF789', '654646977', 0, 0, 0, 0, 0, 0, 0, 0, 'aaaaaa', 1, 0, 0, 'logo/uofCKn7kOOf4iB7SoPWN5icj7A810D.webp', 'local', 'logo/cHIGUCplqCe2Lbao4lXAQTLp3uIMl3.webp', 'local', 'logo/vhJyisvqBi0ggXDgFjGrduC2F1GuPS.webp', 'local', 'logo/F4t0JVMxjOaG3022Ki5qAp7qT7H9jn.webp', 'local', 'c4d1082c39633125a67a2b9dd979f7ce', 'everyMinute', '0', '726ffba5-851775dbc481c4', 'everyMinute', 0, 0, 'd/m/Y', 0, 0, 0, 0, 10.00, 10000.00, 1.00, 0, 50, 500.0000, '2023-06-13 18:35:41', '2025-08-23 04:40:06');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `blog_image` varchar(255) DEFAULT NULL,
  `blog_image_driver` varchar(255) DEFAULT NULL,
  `breadcrumb_status` varchar(255) DEFAULT NULL,
  `breadcrumb_image` varchar(255) DEFAULT NULL,
  `breadcrumb_image_driver` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `page_title` varchar(191) DEFAULT NULL,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_keywords` varchar(191) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_image` varchar(191) DEFAULT NULL,
  `meta_image_driver` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `category_id`, `blog_image`, `blog_image_driver`, `breadcrumb_status`, `breadcrumb_image`, `breadcrumb_image_driver`, `status`, `page_title`, `meta_title`, `meta_keywords`, `meta_description`, `meta_image`, `meta_image_driver`, `created_at`, `updated_at`) VALUES
(1, 6, 'blog/EeRFurMW9Fl4zLmtynynaY6PMpRmVT.webp', 'local', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-24 06:13:51', '2024-10-30 04:57:16'),
(2, 5, 'blog/zXIOThewnNXZ8L7LDYwkJqdZK0rr6i.webp', 'local', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-24 06:14:27', '2024-10-30 04:14:38'),
(3, 4, 'blog/vW8rErTjeII2DbJdeV2hBs7PwvjJdv.webp', 'local', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-24 06:14:47', '2024-10-30 04:14:03'),
(4, 3, 'blog/cvyV0zAmCFaWvEwd2wAHmxCS1y1N31.webp', 'local', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-24 06:15:06', '2024-10-30 04:13:29'),
(5, 2, 'blog/xRu7pqEKDQJTMnclgVcQRvpDRgoEGq.webp', 'local', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-24 06:15:23', '2024-10-30 04:09:56'),
(6, 5, 'blog/7jXvpHF0aneDlA0nNwRNP6tND1cvSm.webp', 'local', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-30 06:30:12', '2025-08-25 19:55:47');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Luxury real estate', 'luxury-real-estate', '2024-10-24 04:44:24', '2024-10-24 04:44:24'),
(2, 'Mortgage', 'mortgage', '2024-10-24 04:44:30', '2024-10-24 04:44:30'),
(3, 'Construction', 'construction', '2024-10-24 04:44:34', '2024-10-24 04:44:34'),
(4, 'Building', 'building', '2024-10-24 04:44:40', '2024-10-24 04:44:40'),
(5, 'Commercial real estate', 'commercial-real-estate', '2024-10-24 04:44:49', '2024-10-24 04:44:49'),
(6, 'Crown land', 'crown-land', '2024-10-24 04:44:55', '2024-10-24 04:44:55');

-- --------------------------------------------------------

--
-- Table structure for table `blog_details`
--

CREATE TABLE `blog_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_details`
--

INSERT INTO `blog_details` (`id`, `blog_id`, `language_id`, `title`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'How to Invest In Real Estate with Your First $1000', 'how-to-invest-in-real-estate-with-your-first', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,', '2024-10-24 06:13:51', '2025-01-26 07:27:33'),
(2, 2, 1, 'How Do You Value a Real Estate Investment?', 'how-do-you-eal-estate-investment', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,', '2024-10-24 06:14:27', '2025-01-26 07:27:33'),
(3, 3, 1, 'How to Make Better Real Estate Investments', 'how-to-make-better-real-estate-investments', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,', '2024-10-24 06:14:47', '2025-01-26 07:27:33'),
(4, 4, 1, 'What Is Turn Key Real Estate Investing?', 'whatis-turn-key-real-estate-investing', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,', '2024-10-24 06:15:06', '2025-08-25 21:30:24'),
(5, 5, 1, 'Ten Important Tips For Launching Your Real Estate Investing Career', 'ten-important-tips-for-launching-your-real-estate-investing-career', '<div class=\"text-base my-auto mx-auto pb-10 [--thread-content-margin:--spacing(4)] @[37rem]:[--thread-content-margin:--spacing(6)] @[72rem]:[--thread-content-margin:--spacing(16)] px-(--thread-content-margin)\"><div class=\"[--thread-content-max-width:32rem] @[34rem]:[--thread-content-max-width:40rem] @[64rem]:[--thread-content-max-width:48rem] mx-auto max-w-(--thread-content-max-width) flex-1 group/turn-messages focus-visible:outline-hidden relative flex w-full min-w-0 flex-col agent-turn\"><div class=\"flex max-w-full flex-col grow\"><div class=\"min-h-8 text-message relative flex w-full flex-col items-end gap-2 text-start break-words whitespace-normal [.text-message+&amp;]:mt-5\"><div class=\"flex w-full flex-col gap-1 empty:hidden first:pt-[3px]\"><div class=\"markdown prose dark:prose-invert w-full break-words dark markdown-new-styling\"><p>Starting out in real estate isn’t just about buying property. It’s about building confidence, direction, and a vision for your future. The first steps are often the hardest, but with the right mindset and strategy, you’ll find yourself moving from hesitation to momentum. Here are ten tips that can help you take the leap.</p>\n<p><strong>1. Start with clarity.</strong><br>\nBefore you dive in, know what you want from real estate. Is it extra income, financial freedom, or the pride of building something tangible? Clear goals give you energy and focus when things feel uncertain.</p>\n<p><strong>2. Learn the basics, then act.</strong><br>\nMany people get stuck researching forever. Learn enough to feel steady on your feet, then take your first step. Action builds confidence faster than study alone ever could.</p>\n<p><strong>3. Think long-term.</strong><br>\nReal estate rewards patience. Don’t chase quick wins. Instead, see each decision as a brick in the foundation of your future wealth and security.</p>\n<p><strong>4. Start small, grow steady.</strong><br>\nYour first deal doesn’t need to be massive. A modest property can teach you more than endless theory. Small wins build belief in yourself.</p>\n<p><strong>5. Focus on cash flow.</strong><br>\nProperties that bring in income month after month create a sense of stability and ease. That steady stream is what turns anxiety into confidence.</p>\n<p><strong>6. Surround yourself with the right people.</strong><br>\nEnergy is contagious. Spend time with other investors, mentors, and agents who encourage you, not people who fuel doubt. The right network strengthens your resolve.</p>\n<p><strong>7. Embrace mistakes as progress.</strong><br>\nYou’ll make errors, but each one teaches you. Reframe setbacks as lessons, and they’ll stop feeling like failures. This shift keeps you moving forward instead of stuck in regret.</p>\n<p><strong>8. Keep your emotions steady.</strong><br>\nMarkets move, deals fall through, tenants change. Don’t let every swing shake you. Learning to stay calm protects not just your money, but your peace of mind.</p>\n<p><strong>9. Reinvest in yourself.</strong><br>\nThe more you grow, the better your decisions. Whether it’s reading, attending workshops, or simply learning from each deal, self-investment compounds like interest.</p>\n<p><strong>10. Picture the life you’re building.</strong><br>\nEvery property is more than numbers. It’s a step toward freedom, security, and the lifestyle you’ve always imagined. Holding that vision keeps you motivated through challenges.</p>\n\n<p>Real estate is about more than transactions. It’s about building a future that feels solid and yours. These tips aren’t just steps on a checklist, they’re a way to keep your motivation strong, your confidence growing, and your focus clear as you begin your investing journey.</p></div></div></div></div><div class=\"mt-3 w-full empty:hidden\"><div class=\"text-center\"><div class=\"inline-flex border border-gray-100 dark:border-gray-700 rounded-xl\"><div class=\"text-token-text-secondary flex items-center justify-center gap-4 px-4 py-2.5 text-sm whitespace-nowrap\"><div class=\"flex items-center gap-5\"></div></div><div class=\"bg-token-main-surface-tertiary w-px flex-1 self-stretch\"></div></div></div></div></div></div><div class=\"pointer-events-none h-px w-px\"></div>', '2024-10-24 06:15:23', '2025-08-25 20:00:35'),
(6, 6, 1, 'Do You Prefer Real Estate Investing?', 'do-you-prefer-real-estate-investi', '<p>We all want a sense of security. Something solid we can count on when everything else feels uncertain. That’s why real estate speaks to so many people. Unlike stocks or crypto, it isn’t just numbers on a screen it’s something you can touch, walk through, and know it’s real.</p><p>Owning property brings peace of mind. It’s not just about the income, though that’s a big part of it. It’s the feeling of having control. Knowing you hold the keys to something lasting.</p><p>There’s also pride in ownership. A home, a block of land, a space that’s yours. It gives wealth a meaning you can actually feel.</p><p>And then there’s progress. Small steps that add up over time, rent coming in, value rising bit by bit. It’s steady, it’s patient, and it builds into something powerful.</p><p>\n\n\n\n</p><p>So if you find yourself drawn to real estate, maybe it’s because it gives you more than money. It gives you stability, pride, and the kind of growth you can see with your own eyes.</p>', '2024-10-30 06:30:12', '2025-08-25 19:55:41'),
(7, 6, 2, 'Do You Prefer Real Estate Investing? sdfsd', 'do-you-prefer-real-estate-investig', 'Share data on the carbon footprint of travel, eco-friendly destinations, and sustainable travel practices. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ratione, eligendi sapiente eveniet sequi consectetur quidem corporis quaerat repellendus aliquam fuga minus modi dolorum dolore, natus nihil molestias eius ad est. Share data on the carbon footprint of travel, eco-friendly destinations, and sustainable travel practices. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ratione, eligendi sapiente eveniet sequi consectetur quidem corporis quaerat repellendus aliquam fuga minus modi dolorum dolore, natus nihil molestias eius ad est. What I find remarkable is that this next has been the industry\'s standard dummy text ever since some printer in the 1500s took a gallery Douglas lyphe Share data on the carbon footprint of travel, eco-friendly destinations, and sustainable travel practices. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ratione, eligendi sapiente eveniet sequi consectetur quidem corporis quaerat repellendus aliquam fuga minus modi dolorum dolore, natus nihil molestias eius ad est. Share data on the carbon footprint of travel, eco-friendly destinations, and sustainable travel practices. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ratione, eligendi sapiente eveniet sequi consectetur quidem corporis quaerat repellendus aliquam fuga minus modi dolorum dolore, natus nihil molestias eius ad est.', '2024-12-09 09:31:53', '2025-01-26 07:24:59'),
(8, 5, 2, 'Ten Important Tips For Launching Your Real Estate Investing Career', 'ten-important-your-real-estate-investing-career', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,', '2025-01-26 07:19:30', '2025-01-26 07:19:30'),
(9, 4, 2, 'What Is Turn Key Real Estate Investing?', 'whatis-turn-key-real-estate-investing', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,', '2025-01-26 07:19:47', '2025-08-25 21:30:24'),
(10, 3, 2, 'How to Make Better Real Estate Investments', 'how-to-make-better-real-estate-investments', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,', '2025-01-26 07:19:51', '2025-01-26 07:19:51'),
(11, 2, 2, 'How Do You Value a Real Estate Investment?', 'how-do-you-eal-estate-investment-amount', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,', '2025-01-26 07:19:53', '2025-01-26 07:21:07'),
(12, 1, 2, 'How to Invest In Real Estate with Your First $1000', 'how-to-invest-in-real-estate-with-your-first', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,', '2025-01-26 07:21:32', '2025-01-26 07:21:32');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `investor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `media` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `theme`, `name`, `type`, `media`, `created_at`, `updated_at`) VALUES
(1, 'light', 'hero', 'single', '{\"image\":{\"path\":\"contents\\/M2xC4Jm5lNnlDordpxVQCFP5uOnthw.webp\",\"driver\":\"local\"},\"image2\":{\"path\":\"contents\\/uDZ2q78MFuBF9f984ULyo0NTu12ELX.webp\",\"driver\":\"local\"},\"image3\":{\"path\":\"contents\\/CeN97w6DEVjaJ57H32HX78Izwczir8.webp\",\"driver\":\"local\"}}', '2024-10-28 07:18:16', '2024-10-28 07:18:16'),
(2, 'light', 'feature', 'multiple', '{\"image\":{\"path\":\"contents\\/XsKFBlcq6qyaCfMtzrL4hIQFHFi5yB.webp\",\"driver\":\"local\"}}', '2024-10-28 07:37:09', '2024-10-28 07:37:09'),
(3, 'light', 'feature', 'multiple', '{\"image\":{\"path\":\"contents\\/UpRG2qHrZIfFOVLJUt2QrfIJyL00fO.webp\",\"driver\":\"local\"}}', '2024-10-28 07:38:07', '2024-10-28 07:38:07'),
(4, 'light', 'feature', 'multiple', '{\"image\":{\"path\":\"contents\\/bHWpZAfJeltTKStJIcPPsWKpfQW6Az.webp\",\"driver\":\"local\"}}', '2024-10-28 07:50:20', '2024-10-28 07:50:20'),
(5, 'light', 'feature', 'multiple', '{\"image\":{\"path\":\"contents\\/iCbGE2mWW5DtoMP8rPStFDOwxdXz0B.webp\",\"driver\":\"local\"}}', '2024-10-28 07:51:02', '2024-10-28 07:51:02'),
(6, 'light', 'about', 'single', '{\"image\":{\"path\":\"contents\\/4HqtZ63Pp5FPZa50PAE6osZMgMgYG7.webp\",\"driver\":\"local\"},\"image2\":{\"path\":\"contents\\/X8035lsN3orIOeNfgkQ6daPS3kNaWr.webp\",\"driver\":\"local\"}}', '2024-10-28 07:55:20', '2024-10-28 07:55:22'),
(7, 'light', 'property', 'single', NULL, '2024-10-28 07:59:04', '2024-10-28 07:59:04'),
(8, 'light', 'testimonial', 'single', '{\"image\":{\"path\":\"contents\\/MxwQXqmdKy7Pu5zSdNPyqS3jqUY5jR.webp\",\"driver\":\"local\"}}', '2024-10-28 08:02:33', '2024-10-28 08:02:35'),
(9, 'light', 'latest-property', 'single', NULL, '2024-10-28 08:04:31', '2024-10-28 08:04:31'),
(10, 'light', 'statistics', 'single', NULL, '2024-10-28 08:05:45', '2024-10-28 08:05:45'),
(11, 'light', 'news-letter', 'single', NULL, '2024-10-28 08:12:58', '2024-10-28 08:12:58'),
(13, 'light', 'faq', 'single', NULL, '2024-10-28 08:16:26', '2024-10-28 08:16:26'),
(14, 'light', 'faq', 'multiple', NULL, '2024-10-28 08:22:52', '2024-10-28 08:22:52'),
(15, 'light', 'faq', 'multiple', NULL, '2024-10-28 08:23:12', '2024-10-28 08:23:12'),
(16, 'light', 'faq', 'multiple', NULL, '2024-10-28 08:23:27', '2024-10-28 08:23:27'),
(17, 'light', 'faq', 'multiple', NULL, '2024-10-28 08:23:41', '2024-10-28 08:23:41'),
(18, 'light', 'contact-us', 'single', NULL, '2024-10-28 08:30:23', '2024-10-28 08:30:23'),
(19, 'light', 'maintenance-page', 'single', '{\"image\":{\"path\":\"contents\\/Rdxsch2wvV4yU314nzFvuAA3UvuHur.webp\",\"driver\":\"local\"}}', '2024-10-28 08:33:16', '2024-11-10 02:25:45'),
(20, 'light', 'blog', 'single', NULL, '2024-10-28 08:34:04', '2024-10-28 08:34:04'),
(21, 'light', 'testimonial', 'multiple', NULL, '2024-10-28 08:39:15', '2024-10-28 08:39:15'),
(22, 'light', 'testimonial', 'multiple', NULL, '2024-10-28 08:51:24', '2024-10-28 08:51:24'),
(23, 'light', 'testimonial', 'multiple', NULL, '2024-10-28 08:54:41', '2024-10-28 08:54:41'),
(24, 'light', 'testimonial', 'multiple', NULL, '2024-10-28 08:55:40', '2024-10-28 08:55:40'),
(25, 'light', 'statistics', 'multiple', NULL, '2024-10-28 09:00:32', '2024-10-28 09:00:32'),
(26, 'light', 'statistics', 'multiple', NULL, '2024-10-28 09:01:04', '2024-10-28 09:01:04'),
(27, 'light', 'statistics', 'multiple', NULL, '2024-10-28 09:01:42', '2024-10-28 09:01:42'),
(28, 'light', 'statistics', 'multiple', NULL, '2024-10-28 09:02:34', '2024-10-28 09:02:34'),
(34, 'light', 'social', 'multiple', NULL, '2024-10-28 09:21:01', '2024-10-28 09:21:01'),
(35, 'light', 'social', 'multiple', NULL, '2024-10-28 09:21:56', '2024-10-28 09:21:56'),
(36, 'light', 'social', 'multiple', NULL, '2024-10-28 09:22:37', '2024-10-28 09:22:37'),
(37, 'light', 'social', 'multiple', NULL, '2024-10-28 09:23:44', '2024-10-28 09:23:44'),
(40, 'light', 'privacy_policy', 'single', NULL, '2024-10-29 03:12:56', '2024-10-29 03:12:56'),
(41, 'light', 'terms_condition', 'single', NULL, '2024-10-29 03:13:14', '2024-10-29 03:13:14'),
(42, 'light', 'latest_property', 'single', NULL, '2024-10-29 06:16:10', '2024-10-29 06:16:10'),
(43, 'light', 'contact', 'single', '{\"image\":{\"path\":\"contents\\/N8fp0DxWkZGZmQwqHsShZvNssY6p3z.webp\",\"driver\":\"local\"}}', '2024-10-29 06:42:02', '2025-01-19 07:24:00'),
(44, 'dark', 'heros', 'single', '{\"image\":{\"path\":\"contents\\/aNdJeovkAITLhzmhyLNgMl5AwPxnVj.webp\",\"driver\":\"local\"}}', '2024-11-09 06:08:08', '2024-11-09 06:08:09'),
(45, 'green', 'hero', 'single', '{\"image\":{\"path\":\"contents\\/aCUSxf3DjNu6zOCLF6P61yJ7UJeoRP.webp\",\"driver\":\"local\"},\"image2\":{\"path\":\"contents\\/v84PzDLjHY4RYRz47WfioojF9RiPjH.webp\",\"driver\":\"local\"},\"image3\":{\"path\":\"contents\\/0KwrK0a5IHNhvuOBzohGU3pBkiQ3M8.webp\",\"driver\":\"local\"}}', '2024-11-09 07:59:42', '2024-11-09 07:59:42'),
(46, 'green', 'feature', 'single', NULL, '2024-11-09 08:07:46', '2024-11-09 08:07:46'),
(51, 'green', 'about', 'single', '{\"image\":{\"path\":\"contents\\/T1qWq7azu4cThr6DyqXspYX4W8T2OE.webp\",\"driver\":\"local\"}}', '2024-11-09 09:24:44', '2025-08-22 07:25:54'),
(52, 'green', 'property', 'single', NULL, '2024-11-09 09:35:24', '2024-11-09 09:35:24'),
(53, 'green', 'testimonial', 'single', '{\"image\":{\"path\":\"contents\\/9z28wQ8RroGhjUIEDZaF0zUWaeQTHt.webp\",\"driver\":\"local\"}}', '2024-11-09 09:42:49', '2025-08-22 07:31:47'),
(54, 'green', 'testimonial', 'multiple', '{\"image\":{\"path\":\"contents\\/yjuyIlUvKlh4BkWAFcuZRWX8neJK19.webp\",\"driver\":\"local\"}}', '2024-11-09 09:46:33', '2025-08-25 12:06:14'),
(55, 'green', 'testimonial', 'multiple', '{\"image\":{\"path\":\"contents\\/3u20HCBcL0doQURqt6Dle3lrZ3kI72.webp\",\"driver\":\"local\"}}', '2024-11-09 09:47:04', '2025-08-25 12:10:06'),
(56, 'green', 'testimonial', 'multiple', '{\"image\":{\"path\":\"contents\\/c5DKK0A9pKCEaWht7omJSY9wZH0YDq.webp\",\"driver\":\"local\"}}', '2024-11-09 09:47:23', '2025-08-25 12:07:57'),
(57, 'green', 'testimonial', 'multiple', '{\"image\":{\"path\":\"contents\\/Tvylr8McP7ONKmxvlYJjUMalDbOtqC.webp\",\"driver\":\"local\"}}', '2024-11-09 09:47:54', '2025-08-25 12:08:25'),
(58, 'green', 'testimonial', 'multiple', '{\"image\":{\"path\":\"contents\\/91E9vkmnYT0ZIT8z7YVOYtOmq9S4Gr.webp\",\"driver\":\"local\"}}', '2024-11-09 09:48:14', '2025-08-25 12:09:35'),
(59, 'green', 'latest_property', 'single', NULL, '2024-11-09 09:51:30', '2024-11-09 09:51:30'),
(60, 'green', 'statistics', 'single', NULL, '2024-11-09 09:54:05', '2024-11-09 09:54:05'),
(65, 'green', 'news_letter', 'single', NULL, '2024-11-09 09:56:14', '2024-11-09 09:56:14'),
(66, 'green', 'faq', 'single', NULL, '2024-11-09 09:56:36', '2024-11-09 09:56:36'),
(67, 'green', 'contact', 'single', NULL, '2024-11-09 09:58:49', '2024-11-09 09:58:49'),
(68, 'green', 'blog', 'single', NULL, '2024-11-09 10:00:13', '2024-11-09 10:00:13'),
(69, 'green', 'social', 'multiple', NULL, '2024-11-09 10:02:01', '2024-11-09 10:02:01'),
(70, 'green', 'social', 'multiple', NULL, '2024-11-09 10:02:17', '2024-11-09 10:02:17'),
(71, 'green', 'social', 'multiple', NULL, '2024-11-09 10:02:34', '2024-11-09 10:02:34'),
(73, 'green', 'faq', 'multiple', NULL, '2024-11-10 02:13:01', '2024-11-10 02:13:01'),
(74, 'green', 'faq', 'multiple', NULL, '2024-11-10 02:13:16', '2024-11-10 02:13:16'),
(75, 'green', 'faq', 'multiple', NULL, '2024-11-10 02:13:29', '2024-11-10 02:13:29'),
(76, 'green', 'faq', 'multiple', NULL, '2024-11-10 02:13:43', '2024-11-10 02:13:43'),
(77, 'green', 'privacy_policy', 'single', NULL, '2024-11-10 02:19:54', '2024-11-10 02:19:54'),
(78, 'green', 'terms_condition', 'single', NULL, '2024-11-10 02:20:26', '2024-11-10 02:20:26'),
(79, 'green', 'maintenance-page', 'single', '{\"image\":{\"path\":\"contents\\/XDyRr5ubuqlpcwT7FdsiDszFt532g2.webp\",\"driver\":\"local\"}}', '2024-11-10 02:21:37', '2025-08-23 05:53:35'),
(81, 'green', 'feature', 'multiple', '{\"image\":{\"path\":\"contents\\/wTYQ1xSKxDGYcJPzy9S1zp2OZfOxj2.webp\",\"driver\":\"local\"}}', '2024-11-10 02:48:19', '2024-11-10 02:48:19'),
(82, 'green', 'feature', 'multiple', '{\"image\":{\"path\":\"contents\\/sDjHnmxSuTgUIwuzQLsAwTSRkxiu6P.webp\",\"driver\":\"local\"}}', '2024-11-10 02:48:47', '2024-11-10 02:48:47'),
(83, 'green', 'feature', 'multiple', '{\"image\":{\"path\":\"contents\\/jrgLQvrnzlbVtVNNNSCCWnOOLAITRy.webp\",\"driver\":\"local\"}}', '2024-11-10 02:49:03', '2024-11-10 02:49:03'),
(84, 'green', 'feature', 'multiple', '{\"image\":{\"path\":\"contents\\/zgihL9XBHiB2ukMB7hfOIIoyCukcrs.webp\",\"driver\":\"local\"}}', '2024-11-10 02:49:24', '2024-11-10 02:49:24'),
(85, 'green', 'statistics', 'multiple', '{\"icon\":\"fa-regular fa-users\"}', '2024-11-10 02:49:53', '2024-11-10 06:57:29'),
(86, 'green', 'statistics', 'multiple', '{\"icon\":\"fa-sharp fa-regular fa-box\"}', '2024-11-10 02:50:01', '2024-11-10 06:57:45'),
(87, 'green', 'statistics', 'multiple', '{\"icon\":\"fa-regular fa-file-certificate\"}', '2024-11-10 02:50:09', '2024-11-10 07:01:02'),
(88, 'green', 'statistics', 'multiple', '{\"icon\":\"fa-regular fa-arrow-rotate-left\"}', '2024-11-10 02:50:20', '2024-11-10 07:01:16'),
(89, 'light', 'app_onboard', 'multiple', '{\"image\":{\"path\":\"contents\\/OPvdjf0X2mRVPY2hHHSHfeYFjcwQay.webp\",\"driver\":\"local\"}}', '2024-12-24 02:32:48', '2024-12-24 02:54:59'),
(90, 'light', 'app_onboard', 'multiple', '{\"image\":{\"path\":\"contents\\/W7CVRVYvZaHv72VpJPs06Dhw7qiBZa.webp\",\"driver\":\"local\"}}', '2024-12-24 02:55:19', '2024-12-24 02:55:27'),
(91, 'light', 'app_onboard', 'multiple', '{\"image\":{\"path\":\"contents\\/yY2M5KQnjAERLUWoee3nITvOZLaVRG.webp\",\"driver\":\"local\"}}', '2024-12-24 02:55:44', '2024-12-24 02:55:44'),
(92, 'green', 'faq', 'multiple', NULL, '2025-08-23 05:27:22', '2025-08-23 05:27:22'),
(93, 'green', 'faq', 'multiple', NULL, '2025-08-23 05:27:38', '2025-08-23 05:27:38'),
(94, 'green', 'faq', 'multiple', NULL, '2025-08-23 05:27:53', '2025-08-23 05:27:53'),
(95, 'green', 'faq', 'multiple', NULL, '2025-08-23 05:28:13', '2025-08-23 05:28:13'),
(96, 'green', 'faq', 'multiple', NULL, '2025-08-23 05:28:26', '2025-08-23 05:28:26'),
(97, 'green', 'faq', 'multiple', NULL, '2025-08-23 05:28:39', '2025-08-23 05:28:39'),
(98, 'green', 'social', 'multiple', NULL, '2025-08-23 05:40:21', '2025-08-23 05:40:21');

-- --------------------------------------------------------

--
-- Table structure for table `content_details`
--

CREATE TABLE `content_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content_id` bigint(20) DEFAULT NULL,
  `language_id` bigint(20) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content_details`
--

INSERT INTO `content_details` (`id`, `content_id`, `language_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '{\"title\":\"WORLD\'S FIRST\",\"sub_title\":\"Real Estate Investment Platform For Everyone\",\"another_sub_title\":\"WITH REAL EARNING\",\"short_description\":\"<p><span style=\\\"color:rgb(124,135,152);font-family:Rubik, sans-serif;font-size:16px;\\\">Buy shares of rental properties, earn monthly income, and watch your money grow<\\/span><\\/p>\",\"button_name\":\"Start Exploring\"}', '2024-10-28 07:18:16', '2024-10-28 07:18:16'),
(3, 2, 1, '{\"title\":\"Passive Income\",\"short_details\":\"Earn rental income and receive deposits quarterly\"}', '2024-10-28 07:37:09', '2024-10-28 07:37:09'),
(5, 3, 1, '{\"title\":\"Secure &amp; Cost-efficient\",\"short_details\":\"Digital security is legally compliant and tangible for qualified investors\"}', '2024-10-28 07:38:07', '2024-10-28 07:38:07'),
(7, 4, 1, '{\"title\":\"Transparency\",\"short_details\":\"Easily consult the full documentation for each property.\"}', '2024-10-28 07:50:20', '2024-10-28 07:50:20'),
(9, 5, 1, '{\"title\":\"Support\",\"short_details\":\"We are available 24 hours a day and 7 days a week\"}', '2024-10-28 07:51:02', '2024-10-28 07:51:02'),
(11, 6, 1, '{\"title\":\"ABOUT US\",\"sub_title\":\"Welcome to ChainCity\",\"short_title\":\"Finding Great Properties For Investment\",\"short_description\":\"<p style=\\\"color:rgb(124,135,152);font-family:Rubik, sans-serif;font-size:16px;\\\"><span>The first tip to finding great properties for investment is to use the yellow page. This is a phone directory that lists every type of business in your area. You can use this to find businesses in your area that may be for sale or renting.<\\/span><\\/p><p style=\\\"color:rgb(124,135,152);font-family:Rubik, sans-serif;font-size:16px;\\\"><span>Our mission is to empower the world to build wealth through modern real estate investing.<\\/span><span><br><\\/span><\\/p><p style=\\\"color:rgb(124,135,152);font-family:Rubik, sans-serif;font-size:16px;\\\"><span>Another way to find great properties for investment is to look on eBay. This is a website that sells used merchandise and items that are for sale or for rent. You can use this to find great deals on businesses and properties that are for sale.<\\/span><\\/p>\"}', '2024-10-28 07:55:22', '2024-10-28 07:55:22'),
(13, 7, 1, '{\"title\":\"FEATURED PROPERTIES\",\"sub_title\":\"All Property Spotlight\"}', '2024-10-28 07:59:04', '2024-10-28 07:59:04'),
(15, 8, 1, '{\"title\":\"CUSTOMER TESTIMONIALS\",\"sub_title\":\"What\'s Our Customer Say\"}', '2024-10-28 08:02:35', '2024-10-28 08:02:35'),
(17, 9, 1, '{\"title\":\"Latest Properties\",\"sub_title\":\"Latest Property\"}', '2024-10-28 08:04:31', '2024-10-28 08:04:31'),
(19, 10, 1, '{\"title\":\"WITH CHAINCITY ANYONE CAN INVEST?\",\"sub_title\":\"You Invest. Chaincity Does The Rest\"}', '2024-10-28 08:05:45', '2024-10-28 08:05:45'),
(21, 11, 1, '{\"title\":\"Subscribe Newslatter\",\"sub_title\":\"TO GET EXCLUSIVE BENEFITS\"}', '2024-10-28 08:12:58', '2024-10-28 08:12:58'),
(25, 13, 1, '{\"title\":\"ANY QUESTIONS\",\"sub_title\":\"We\'ve Got Answers\",\"short_details\":\"<p><span style=\\\"color:rgb(124,135,152);font-family:Rubik, sans-serif;font-size:16px;\\\">Help agencies to define their new business objectives and then create professional software.<\\/span><\\/p>\"}', '2024-10-28 08:16:26', '2024-10-28 08:16:26'),
(27, 14, 1, '{\"title\":\"Is chaincity a long-term investment?\",\"description\":\"<p><span style=\\\"color:rgb(124,135,152);font-family:Rubik, sans-serif;font-size:16px;\\\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Temporibus adipisci ullam quos voluptate officiis ab exercitationem? Molestiae deserunt incidunt, inventore cumque explicabo rerum accusantium dolor natus quas eveniet ad molestias!<\\/span><\\/p>\"}', '2024-10-28 08:22:52', '2024-10-28 08:22:52'),
(28, 15, 1, '{\"title\":\"Is chaincity a long-term investment?\",\"description\":\"<p><span style=\\\"color:rgb(124,135,152);font-family:Rubik, sans-serif;font-size:16px;\\\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Temporibus adipisci ullam quos voluptate officiis ab exercitationem? Molestiae deserunt incidunt, inventore cumque explicabo rerum accusantium dolor natus quas eveniet ad molestias!<\\/span><\\/p>\"}', '2024-10-28 08:23:12', '2024-10-28 08:23:12'),
(29, 16, 1, '{\"title\":\"How does pricing work?\",\"description\":\"<p><span style=\\\"color:rgb(124,135,152);font-family:Rubik, sans-serif;font-size:16px;\\\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Temporibus adipisci ullam quos voluptate officiis ab exercitationem? Molestiae deserunt incidunt, inventore cumque explicabo rerum accusantium dolor natus quas eveniet ad molestias!<\\/span><\\/p>\"}', '2024-10-28 08:23:27', '2024-10-28 08:23:27'),
(30, 17, 1, '{\"title\":\"Temporibus adipisci ullam quos voluptate officiis ab\",\"description\":\"<p><span style=\\\"color:rgb(124,135,152);font-family:Rubik, sans-serif;font-size:16px;\\\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Temporibus adipisci ullam quos voluptate officiis ab exercitationem? Molestiae deserunt incidunt, inventore cumque explicabo rerum accusantium dolor natus quas eveniet ad molestias!<\\/span><\\/p>\"}', '2024-10-28 08:23:41', '2024-10-28 08:23:41'),
(35, 18, 1, '{\"heading\":\"GET IN TOUCH\",\"sub_heading\":\"Let\'s Ask Your Questions\",\"title\":\"Our Office\",\"address\":\"22 Baker Street, London\",\"email\":\"email@website.com\",\"phone\":\"+44-20-4526-2356\",\"footer_short_details\":\"<p><span style=\\\"color:rgb(124,135,152);font-family:Rubik, sans-serif;font-size:16px;\\\">We are a full service like readable english. Many desktop publishing packages and web page editor now use lorem Ipsum sites still in their.<\\/span><\\/p>\"}', '2024-10-28 08:30:23', '2024-10-28 08:30:23'),
(37, 19, 1, '{\"title\":\"WE ARE COMING SOON\",\"sub_title\":\"The website under maintenance!\",\"short_description\":\"<p>Someone has kidnapped our site. We are negotiation ransom and will resolve this issue in 24\\/7 hours<\\/p>\"}', '2024-10-28 08:33:17', '2024-11-10 02:25:45'),
(39, 20, 1, '{\"heading\":\"OUR BLOGS\",\"sub_heading\":\"Latest News &amp; Articles\"}', '2024-10-28 08:34:04', '2024-10-28 08:34:04'),
(41, 21, 1, '{\"name\":\"Maria Jacket\",\"designation\":\"Web Developer\",\"description\":\"<p><span style=\\\"color:rgb(124,135,152);font-family:Rubik, sans-serif;font-size:16px;\\\">We help organizations across the private, public, and social sectors create Change that Matters Welcome fat who window extent eithe formal. Removing welcomed civility or hastened is. Justice elderly but perhaps expense..<\\/span><\\/p>\"}', '2024-10-28 08:39:15', '2024-10-28 08:39:15'),
(43, 22, 1, '{\"name\":\"Alica Fox\",\"designation\":\"Team Hunter\",\"description\":\"<p><span style=\\\"color:rgb(124,135,152);font-family:Rubik, sans-serif;font-size:16px;\\\">We help organizations across the private, public, and social sectors create Change that Matters Welcome fat who window extent eithe formal. Removing welcomed civility or hastened is. Justice elderly but perhaps expense..<\\/span><\\/p>\"}', '2024-10-28 08:51:24', '2024-10-28 08:51:24'),
(45, 23, 1, '{\"name\":\"Donald Trump\",\"designation\":\"THink Tank\",\"description\":\"<p><span style=\\\"color:rgb(124,135,152);font-family:Rubik, sans-serif;font-size:16px;\\\">We help organizations across the private, public, and social sectors create Change that Matters Welcome fat who window extent eithe formal. Removing welcomed civility or hastened is. Justice elderly but perhaps expense..<\\/span><\\/p>\"}', '2024-10-28 08:54:41', '2024-10-28 08:54:41'),
(47, 24, 1, '{\"name\":\"Tom Latham\",\"designation\":\"Web Developer\",\"description\":\"<p><span style=\\\"color:rgb(124,135,152);font-family:Rubik, sans-serif;font-size:16px;\\\">We help organizations across the private, public, and social sectors create Change that Matters Welcome fat who window extent eithe formal. Removing welcomed civility or hastened is. Justice elderly but perhaps expense..<\\/span><\\/p>\"}', '2024-10-28 08:55:40', '2024-10-28 08:55:40'),
(49, 25, 1, '{\"title\":\"10000+\",\"description\":\"Member\"}', '2024-10-28 09:00:32', '2024-10-28 09:00:32'),
(51, 26, 1, '{\"title\":\"3000+\",\"description\":\"Investors\"}', '2024-10-28 09:01:04', '2024-10-28 09:01:04'),
(53, 27, 1, '{\"title\":\"25\",\"description\":\"Years Experience\"}', '2024-10-28 09:01:42', '2024-10-28 09:01:42'),
(55, 28, 1, '{\"title\":\"30%\",\"description\":\"Return Upto\"}', '2024-10-28 09:02:34', '2024-10-28 09:02:34'),
(62, 34, 1, '{\"name\":\"Facebook\",\"font_icon\":\"fab fa-facebook-f\",\"link\":\"https:\\/\\/www.facebook.com\\/\"}', '2024-10-28 09:21:01', '2024-10-28 09:21:01'),
(64, 35, 1, '{\"name\":\"Twitter\",\"font_icon\":\"fab fa-twitter\",\"link\":\"https:\\/\\/twitter.com\\/\"}', '2024-10-28 09:21:56', '2024-10-28 09:21:56'),
(66, 36, 1, '{\"name\":\"Linkedin\",\"font_icon\":\"fab fa-linkedin-in\",\"link\":\"https:\\/\\/bd.linkedin.com\\/\"}', '2024-10-28 09:22:37', '2024-10-28 09:22:37'),
(68, 37, 1, '{\"name\":\"Instagram\",\"font_icon\":\"fab fa-instagram\",\"link\":\"https:\\/\\/www.instagram.com\\/\"}', '2024-10-28 09:23:44', '2024-10-28 09:23:44'),
(74, 40, 1, '{\"heading\":\"Welcome To Our\",\"short_title\":\"Privacy Policy\",\"description\":\"<p style=\\\"color:rgb(105,105,105);font-family:\'Exo 2\', sans-serif;font-size:16px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><p style=\\\"color:rgb(105,105,105);font-family:\'Exo 2\', sans-serif;font-size:16px;\\\"><br><\\/p><p style=\\\"color:rgb(105,105,105);font-family:\'Exo 2\', sans-serif;font-size:16px;\\\">The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\"}', '2024-10-29 03:12:56', '2024-10-29 03:12:56'),
(75, 41, 1, '{\"heading\":\"Welcome To Our\",\"short_title\":\"Terms &amp; Conditions\",\"description\":\"<p style=\\\"color:rgb(105,105,105);font-family:\'Exo 2\', sans-serif;font-size:16px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><p style=\\\"color:rgb(105,105,105);font-family:\'Exo 2\', sans-serif;font-size:16px;\\\"><br><\\/p><p style=\\\"color:rgb(105,105,105);font-family:\'Exo 2\', sans-serif;font-size:16px;\\\">The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\"}', '2024-10-29 03:13:14', '2024-10-29 03:13:14'),
(76, 42, 1, '{\"title\":\"Latest Properties\",\"sub_title\":\"Latest Property\"}', '2024-10-29 06:16:10', '2024-10-29 06:16:10'),
(78, 43, 1, '{\"heading\":\"GET IN TOUCH\",\"sub_heading\":\"Let\'s Ask Your Questions\",\"title\":\"Our Office\",\"address\":\"22 Baker Street, London\",\"email\":\"email@website.com\",\"phone\":\"+44-20-4526-2356\",\"footer_short_details\":\"<p><span style=\\\"color:rgb(124,135,152);font-family:Rubik, sans-serif;font-size:16px;\\\">We are a full service like readable english. Many desktop publishing packages and web page editor now use lorem Ipsum sites still in their.<\\/span><\\/p>\",\"subscriber_message\":\"<p>Subscribe to our news letter and never miss out on important information and exclusive deals\\u00a0<\\/p>\"}', '2024-10-29 06:42:02', '2024-10-29 06:51:07'),
(80, 44, 1, '{\"heading\":\"WORLD\'S FIRST\",\"sub_heading\":\"Real Estate Investment Platform For Everyone\"}', '2024-11-09 06:08:09', '2024-11-09 06:08:09'),
(81, 45, 1, '{\"title\":\"Unlock the\",\"sub_title\":\"Door to your Dream Property Today and Forever\",\"happy_client_title\":\"12k+\",\"happy_client_sub_title\":\"Happy clients\",\"review_title\":\"46k+\",\"review_sub_title\":\"Reviews\",\"welcome_bonus_title\":\"50\",\"welcome_bonus_sub_title\":\"Welcome Bonus\",\"button_name\":\"start explore now\\u2022\"}', '2024-11-09 07:59:42', '2024-11-11 01:42:25'),
(82, 46, 1, '{\"title\":\"Maximize the Growth Potential of Your Investments\",\"short_details\":\"Experience a platform designed for serious investors, where every feature is crafted to enhance performance, protect your capital, and drive long-term financial success worldwide.\"}', '2024-11-09 08:07:46', '2025-08-23 05:36:06'),
(87, 51, 1, '{\"title\":\"about us\",\"sub_title\":\"Welcome to Two Sigma Realty - Investment in Real Estate, Simplified.\",\"short_title\":\"Access curated real estate opportunities with low minimums, expert management, and full transparency.\",\"short_description\":\"<p><span style=\\\"font-size:16px;\\\">At Two Sigma Real Estate, we believe everyone should have the chance to invest in high-quality real estate. Our platform connects investors with institutional-grade properties, enabling you to diversify your portfolio and grow wealth with ease. Whether you\\u2019re new to real estate or a seasoned investor, our user-friendly platform makes investing straightforward and secure.<\\/span><\\/p><p><span style=\\\"font-size:16px;color:rgb(51,51,51);font-family:\'Nunito Sans\', sans-serif;\\\">Key Benefits:<\\/span><\\/p><p><span style=\\\"font-size:16px;color:rgb(51,51,51);font-family:\'Nunito Sans\', sans-serif;\\\">Diverse Investment Options: Explore residential, commercial, and mixed-use properties.<\\/span><\\/p><p><span style=\\\"font-size:16px;\\\">Expert Due Diligence: Our team carefully vets each opportunity to ensure quality.<br><br><\\/span><\\/p><p><span style=\\\"font-size:16px;\\\">Our Story:\\u00a0<\\/span><span style=\\\"font-size:16px;\\\">Founded with a passion for real estate and financial empowerment, Two Sigma Real Estate is dedicated to making real estate investing accessible to everyone. By harnessing cutting-edge technology combined with industry expertise, we deliver investment opportunities that were once only available to select insiders.<\\/span><\\/p><p><span style=\\\"font-size:16px;\\\"><br><\\/span><\\/p><p><span style=\\\"font-size:16px;\\\">Our Mission:\\u00a0<\\/span><span style=\\\"font-size:16px;\\\">To democratize real estate investment and help individuals build lasting wealth through transparent, accessible, and expertly managed opportunities.<\\/span><\\/p><p><span style=\\\"font-size:16px;\\\">Our Team:\\u00a0<\\/span><span style=\\\"font-size:16px;\\\">Led by professionals with decades of experience in real estate, finance, and technology, our team is committed to guiding your investment journey with integrity and insight.<\\/span><\\/p>\",\"background_title\":\"Earning has become simple and available for everyone!\",\"background_short_title\":\"Just Invest, Two Sigma Realty will do the rest.\"}', '2024-11-09 09:34:49', '2025-08-23 05:01:04'),
(88, 52, 1, '{\"title\":\"Featured properties\",\"sub_title\":\"All Property Spotlight\"}', '2024-11-09 09:35:24', '2024-11-09 09:35:24'),
(89, 53, 1, '{\"title\":\"Investor Stories &amp; Success Journeys\",\"sub_title\":\"Real People. Real Results. Real Estate That Delivers.\",\"short_description\":\"At <strong>Two Sigma Real Estate<\\/strong>, our greatest achievement is the success of our investors. From first-time participants to seasoned professionals and institutions, our community shares one common experience,\\u00a0<strong>confidence in real estate investments that are transparent, well-managed, and built for long-term growth<\\/strong>. These stories reflect the trust, performance, and peace of mind that define our platform.\",\"background_title\":\"Trusted by Thousands. Proven in Every Project.\"}', '2024-11-09 09:42:50', '2025-08-23 05:06:51'),
(90, 54, 1, '{\"name\":\"Emily R.\",\"designation\":\"First-Time Investor\",\"review\":\"5\",\"description\":\"<p>I had always wanted to invest in real estate but didn\\u2019t know where to start. Traditional property ownership felt overwhelming\\u2014dealing with mortgages, tenants, and upkeep was too much for me. Two Sigma Real Estate changed everything. The platform gave me access to high-quality projects with clear explanations and transparent reporting. Within my first year, I saw returns that were better than any savings account or stock portfolio I had. Now I feel confident knowing I\\u2019m building long-term wealth without the stress of managing properties myself.<\\/p>\"}', '2024-11-09 09:46:33', '2025-08-23 05:16:30'),
(91, 55, 1, '{\"name\":\"Daniel M.\",\"designation\":\"Experienced Portfolio Builder\",\"review\":\"5\",\"description\":\"<p>As someone who has invested in stocks and private equity for over 15 years, I was looking for real estate opportunities that offered diversification without operational headaches. Two Sigma Real Estate\\u2019s team impressed me with their due diligence process every deal was thoroughly vetted, with market data and risk assessments I could trust. I invested in a mixed-use development project last year, and the updates I receive each quarter are more professional than some of the institutional funds I\\u2019ve worked with. It feels like they\\u2019ve brought Wall Street discipline into real estate.<\\/p>\"}', '2024-11-09 09:47:04', '2025-08-23 05:16:50'),
(92, 56, 1, '{\"name\":\"Priya K.\",\"designation\":\"Young Professional\",\"review\":\"5\",\"description\":\"<p>I started with a small investment, just to test the waters, because I was sceptical about online real estate platforms. Two Sigma Real Estate won me over with their transparency. From day one, I had access to detailed reports, projected returns, and a clear breakdown of risks. When the first project I joined reached its milestone, I received distributions exactly as promised. It felt empowering\\u2014like I could participate in the kinds of investments I once thought were only for the wealthy. I\\u2019ve since increased my allocation and plan to make real estate a permanent part of my financial strategy.<\\/p>\"}', '2024-11-09 09:47:23', '2025-08-23 05:17:18'),
(93, 57, 1, '{\"name\":\"Michael &amp; Sarah T. \\u2013 Retired Couple\",\"designation\":\"Retired Couple\",\"review\":\"5\",\"description\":\"<p>After retiring, my wife and I wanted a reliable way to grow our savings without taking unnecessary risks. We had considered rental properties, but managing tenants and maintenance at our age wasn\\u2019t realistic. A financial advisor introduced us to Two Sigma Real Estate, and it\\u2019s been the best decision we\\u2019ve made in retirement. We love how simple it is: we invest, and the team handles everything else. Our distributions help supplement our retirement income, and the peace of mind we get from their regular updates is invaluable.<\\/p>\"}', '2024-11-09 09:47:54', '2025-08-23 05:17:32'),
(94, 58, 1, '{\"name\":\"Laura G.\",\"designation\":\"Entrepreneur Diversifying Wealth\",\"review\":\"5\",\"description\":\"<p>I sold my e-commerce company in 2021 and was searching for ways to diversify outside of tech. Two Sigma Real Estate appealed to me because they made institutional-quality real estate accessible without requiring me to become a landlord. The onboarding process was seamless, and I appreciated the personalized guidance I received in structuring my portfolio. My first project\\u2014a commercial redevelopment in a high-growth market\\u2014has already exceeded expectations. For me, it\\u2019s not just about returns, but about knowing my money is working in tangible, impactful projects.<\\/p>\"}', '2024-11-09 09:48:14', '2025-08-23 05:15:24'),
(95, 59, 1, '{\"title\":\"Latest Properties\",\"sub_title\":\"Latest Properties\"}', '2024-11-09 09:51:30', '2024-11-09 09:51:30'),
(96, 60, 1, '{\"title\":\"With Two Sigma Realty anyone can invest?\",\"sub_title\":\"You Invest. Two Sigma Realty Does The Rest\",\"short_details\":\"Two Sigma Real Estate is your trusted partner in building wealth. We oversee acquisition, management, and optimization, ensuring every investment is positioned for maximum growth while you focus on what matters most.\"}', '2024-11-09 09:54:05', '2025-08-23 05:33:44'),
(101, 65, 1, '{\"title\":\"Newsletter\",\"sub_title\":\"Subscribe To Our Mailing List And Stay Up To Date\"}', '2024-11-09 09:56:14', '2024-11-09 09:56:14'),
(102, 66, 1, '{\"title\":\"Frequently Ask Question\",\"sub_title\":\"Your Questions, Answered with Transparency\",\"short_details\":\"<p>We know investing in real estate comes with important questions. That\\u2019s why we\\u2019ve prepared answers to the most common concerns from our community\\u2014covering everything from safety and returns to tax treatment and exit strategies.<\\/p>\"}', '2024-11-09 09:56:36', '2025-08-23 05:25:01'),
(103, 67, 1, '{\"heading\":\"GET IN TOUCH\",\"sub_heading\":\"Let\'s Ask Your Questions\",\"google_map_embed_url\":\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3023.7550263265884!2d-74.00782062324511!3d40.723409036916!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c25999cf274e29%3A0x9832e581370a4b14!2s101%206th%20Ave%2C%20New%20York%2C%20NY%2010013%2C%20USA!5e0!3m2!1sen!2ses!4v1755927208945!5m2!1sen!2ses\",\"address\":\"101 Avenue of The Americas New York, NY 10013-1689\",\"email\":\"support@twosigmarealty.com\",\"phone\":\"+45345847431324\",\"footer_short_details\":\"<p style=\\\"color:rgb(51,51,51);font-family:\'Nunito Sans\', sans-serif;font-size:16px;\\\"><span style=\\\"color:rgb(0,0,0);font-family:ttc, sans-serif;font-size:17px;\\\">Two Sigma is a leading alternative investment manager with &gt;$60B in total AUM, including public and private strategies.<\\/span><\\/p><p style=\\\"color:rgb(51,51,51);font-family:\'Nunito Sans\', sans-serif;font-size:16px;font-style:normal;font-weight:400;background-color:rgb(255,255,255);\\\"><\\/p>\",\"subscriber_message\":\"<p><span style=\\\"color:rgb(51,51,51);font-family:\'Nunito Sans\', sans-serif;font-size:16px;\\\">Subscribe To Our Mailing List And Stay Up To Date<\\/span><\\/p>\"}', '2024-11-09 09:58:49', '2025-08-23 05:32:33'),
(104, 68, 1, '{\"heading\":\"news &amp; blogs\",\"sub_heading\":\"Stay Informed with Our Latest News &amp; Insights\",\"short_details\":\"Stay informed with expert insights, market updates, and in-depth articles designed to keep you ahead in today\\u2019s fast-changing investment landscape.\"}', '2024-11-09 10:00:13', '2025-08-23 05:36:44'),
(105, 69, 1, '{\"name\":\"Facebook\",\"font_icon\":\"fab fa-facebook-f\",\"link\":\"https:\\/\\/www.facebook.com\\/twosigmainvestments\\/\"}', '2024-11-09 10:02:01', '2025-08-23 05:38:11'),
(106, 70, 1, '{\"name\":\"Twitter\",\"font_icon\":\"fab fa-twitter\",\"link\":\"https:\\/\\/x.com\\/twosigmavc\"}', '2024-11-09 10:02:17', '2025-08-23 05:41:08'),
(107, 71, 1, '{\"name\":\"Linkedin\",\"font_icon\":\"fab fa-linkedin-in\",\"link\":\"https:\\/\\/www.linkedin.com\\/company\\/two-sigma-investments\"}', '2024-11-09 10:02:34', '2025-08-23 05:37:23'),
(109, 73, 1, '{\"title\":\"1. Is my investment safe with Two Sigma Real Estate?\",\"description\":\"<p>We take investor safety seriously. Every project undergoes strict due diligence including legal, financial, and market checks. Funds are only deployed into projects after being reviewed by our investment committee and are held with trusted custodians or administrators.<\\/p>\"}', '2024-11-10 02:13:01', '2025-08-23 05:25:24'),
(110, 74, 1, '{\"title\":\"2. What type of returns can I expect?\",\"description\":\"<p>Returns vary by project and market conditions. While past projects have delivered up to <strong>30% ROI<\\/strong>, all investments carry risk. Each opportunity comes with a projected return profile, detailed financial modeling, and risk disclosures so you can make informed decisions.<\\/p>\"}', '2024-11-10 02:13:16', '2025-08-23 05:25:49'),
(111, 75, 1, '{\"title\":\"3. How liquid are my investments? Can I withdraw anytime?\",\"description\":\"<p>Real estate is naturally less liquid than stocks. Most projects have a set investment horizon (e.g., 2\\u20135 years). We provide clear timelines upfront, including expected exit strategies such as refinancing or property sales. Some projects may offer periodic distributions during the hold period.<\\/p>\"}', '2024-11-10 02:13:29', '2025-08-23 05:26:30'),
(112, 76, 1, '{\"title\":\"4. What fees does Two Sigma Real Estate charge?\",\"description\":\"<p>Our fees are transparent and project-specific. Typically, we charge a management fee and\\/or a performance-based fee (carried interest) aligned with investor success. We succeed only when you succeed.<\\/p>\"}', '2024-11-10 02:13:43', '2025-08-23 05:26:57'),
(113, 77, 1, '{\"heading\":\"Privacy Policy for Two Sigma Real Estate\",\"short_title\":\"Welcome to Two Sigma Real Estate. This Privacy Policy explains how we collect, use, protect, and share your personal information when you use our website, platform, and services.\",\"description\":\"<h5><\\/h5><p><strong>1. Information We Collect<\\/strong><br>\\nWe may collect personal information such as your name, email address, phone number, payment details, and investment preferences when you sign up or interact with our services. We may also collect non-personal data such as browser type, device information, and usage statistics to improve our platform.<\\/p>\\n<p><strong>2. How We Use Your Information<\\/strong><br>\\nYour information is used to:<\\/p>\\n<ul>\\n<li>\\n<p>Provide access to our investment platform and services<\\/p>\\n<\\/li>\\n<li>\\n<p>Process transactions and manage your account<\\/p>\\n<\\/li>\\n<li>\\n<p>Send updates, investment reports, and promotional communications (if you opt-in)<\\/p>\\n<\\/li>\\n<li>\\n<p>Ensure compliance with legal and regulatory requirements<\\/p>\\n<\\/li>\\n<li>\\n<p>Enhance security, detect fraud, and improve user experience<\\/p>\\n<\\/li>\\n<\\/ul>\\n<p><strong>3. How We Share Information<\\/strong><br>\\nWe do not sell your personal information. We may share it with:<\\/p>\\n<ul>\\n<li>\\n<p>Trusted third-party service providers (e.g., payment processors, KYC\\/AML verification services)<\\/p>\\n<\\/li>\\n<li>\\n<p>Regulators or authorities when legally required<\\/p>\\n<\\/li>\\n<li>\\n<p>Affiliates or partners involved in managing investment projects<\\/p>\\n<\\/li>\\n<\\/ul>\\n<p><strong>4. Data Security<\\/strong><br>\\nWe use industry-standard security measures, including encryption and secure servers, to protect your information. While no system is 100% secure, we take every precaution to safeguard your data.<\\/p>\\n<p><strong>5. Your Rights<\\/strong><br>\\nYou have the right to:<\\/p>\\n<ul>\\n<li>\\n<p>Access and update your personal information<\\/p>\\n<\\/li>\\n<li>\\n<p>Request deletion of your data (subject to legal or contractual obligations)<\\/p>\\n<\\/li>\\n<li>\\n<p>Opt out of marketing communications at any time<\\/p>\\n<\\/li>\\n<\\/ul>\\n<p><strong>6. Cookies and Tracking<\\/strong><br>\\nOur website may use cookies and similar technologies to improve performance, personalize content, and analyze usage. You can manage cookie preferences through your browser settings.<\\/p>\\n<p><strong>7. International Users<\\/strong><br>\\nIf you access our services from outside the U.S., please note that your information may be transferred and processed in countries with different data protection laws.<\\/p>\\n<p><strong>8. Changes to this Policy<\\/strong><br>\\nWe may update this Privacy Policy from time to time. Updates will be posted on this page with the revised effective date.<\\/p>\\n<p><strong>9. Contact Us<\\/strong><br>\\nIf you have questions or concerns about this Privacy Policy, please contact us at:<br>\\n\\ud83d\\udce7 <strong><a>privacy@twosigmarealestate.com<span class=\\\"ms-0.5 inline-block align-middle leading-none\\\"><\\/span><\\/a><\\/strong><br>\\n\\ud83d\\udccd <strong>Two Sigma Real Estate,\\u00a0<\\/strong><\\/p><b>101 Avenue of The Americas<\\/b>\\u00a0<b>New York, NY 10013-1689<\\/b>\"}', '2024-11-10 02:19:54', '2025-08-23 05:47:06'),
(114, 78, 1, '{\"heading\":\"Terms and Conditions for Two Sigma Real Estate\",\"short_title\":\"Welcome to Two Sigma Real Estate. By accessing or using our website, platform, and services, you agree to these Terms and Conditions, which govern your use of our offerings.\",\"description\":\"<h5><\\/h5><p><strong>1. Acceptance of Terms<\\/strong><br>\\nBy using our website and services, you confirm that you have read, understood, and agreed to these Terms and Conditions. If you do not agree, you must discontinue use immediately.<\\/p>\\n<p><strong>2. Eligibility<\\/strong><br>\\nYou must be at least 18 years old and legally capable of entering into binding contracts to use our platform. Certain investment opportunities may be restricted to accredited or qualified investors as required by law.<\\/p>\\n<p><strong>3. Services Provided<\\/strong><br>\\nTwo Sigma Real Estate provides access to real estate investment opportunities, resources, and related financial information. We do not guarantee returns, as all investments carry inherent risks.<\\/p>\\n<p><strong>4. User Responsibilities<\\/strong><\\/p>\\n<ul>\\n<li>\\n<p>You agree to provide accurate and truthful information during registration and investment processes.<\\/p>\\n<\\/li>\\n<li>\\n<p>You are responsible for maintaining the confidentiality of your login credentials.<\\/p>\\n<\\/li>\\n<li>\\n<p>You may not use our services for unlawful purposes, including fraud or money laundering.<\\/p>\\n<\\/li>\\n<\\/ul>\\n<p><strong>5. Investment Risks<\\/strong><br>\\nAll investments involve risk, including potential loss of principal. Past performance is not indicative of future results. Two Sigma Real Estate is not liable for investment losses.<\\/p>\\n<p><strong>6. Fees and Payments<\\/strong><br>\\nAny applicable fees or charges will be disclosed before you invest. By participating, you agree to pay all applicable fees related to your investments.<\\/p>\\n<p><strong>7. Intellectual Property<\\/strong><br>\\nAll content, branding, and materials on the Two Sigma Real Estate platform are the property of the company and may not be copied, modified, or distributed without prior written consent.<\\/p>\\n<p><strong>8. Limitation of Liability<\\/strong><br>\\nTwo Sigma Real Estate shall not be held responsible for indirect, incidental, or consequential damages arising from the use of our platform or services.<\\/p>\\n<p><strong>9. Amendments to Terms<\\/strong><br>\\nWe may update these Terms and Conditions from time to time. Updates will be posted on this page with a revised effective date. Continued use of our services after updates constitutes acceptance of the revised Terms.<\\/p>\\n<p><strong>10. Governing Law<\\/strong><br>\\nThese Terms and Conditions are governed by and construed in accordance with the laws of [Your Country\\/State], without regard to its conflict of law principles.<\\/p>\\n<p><strong>11. Contact Us<\\/strong><br>\\nIf you have any questions about these Terms and Conditions, please contact us at:<br>\\n\\ud83d\\udce7 <strong><a>support@twosigmarealestate.com<span class=\\\"ms-0.5 inline-block align-middle leading-none\\\"><\\/span><\\/a><\\/strong><br>\\n\\ud83d\\udccd <strong>Two Sigma Real Estate,<\\/strong><\\/p><b>101 Avenue of The Americas<\\/b>\\u00a0<b>New York, NY 10013-1689<\\/b>\"}', '2024-11-10 02:20:26', '2025-08-23 05:48:55'),
(115, 79, 1, '{\"title\":\"We\\u2019ll Be Back Soon!\",\"sub_title\":\"Our website is currently undergoing scheduled maintenance.\",\"short_description\":\"<p>We\\u2019re working hard to bring you an even better experience. During this time, some features may be unavailable. Please check back soon \\u2014 our team expects everything to be back online within 24\\u201348 hours.<\\/p><p>Thank you for your patience and support!<\\/p><p>\\n\\n<\\/p><p>\\ud83d\\udce7 For urgent inquiries, contact us at <strong><a>support@twosigmarealestate.com<\\/a><\\/strong><\\/p>\"}', '2024-11-10 02:21:37', '2025-08-23 05:53:35'),
(117, 81, 1, '{\"title\":\"Passive Income\",\"short_details\":\"Earn rental income and receive deposits quarterly\"}', '2024-11-10 02:48:19', '2024-11-10 02:48:19'),
(118, 82, 1, '{\"title\":\"Secure &amp; Cost-efficient\",\"short_details\":\"Digital security is legally compliant and tangible for qualified investors\"}', '2024-11-10 02:48:47', '2024-11-10 02:48:47'),
(119, 83, 1, '{\"title\":\"Transparency\",\"short_details\":\"Easily consult the full documentation for each property.\"}', '2024-11-10 02:49:03', '2024-11-10 02:49:03'),
(120, 84, 1, '{\"title\":\"Support\",\"short_details\":\"We are available 24 hours a day and 7 days a week\"}', '2024-11-10 02:49:24', '2024-11-10 02:49:24'),
(121, 85, 1, '{\"title\":\"10000+\",\"description\":\"Member\",\"font_icon\":\"fa-regular fa-users\"}', '2024-11-10 02:49:53', '2024-11-10 07:03:04'),
(122, 86, 1, '{\"title\":\"3000+\",\"description\":\"Investors\",\"font_icon\":\"fa-sharp fa-regular fa-box\"}', '2024-11-10 02:50:01', '2024-11-10 07:04:24'),
(123, 87, 1, '{\"title\":\"25\",\"description\":\"Years Experience\",\"font_icon\":\"fa-regular fa-file-certificate\"}', '2024-11-10 02:50:09', '2024-11-10 07:04:40'),
(124, 88, 1, '{\"title\":\"30%\",\"description\":\"Return Upto\",\"font_icon\":\"fa-regular fa-arrow-rotate-left\"}', '2024-11-10 02:50:20', '2024-11-10 07:04:51'),
(125, 89, 1, '{\"title\":\"Build Wealth In Real Estate\",\"subtitle\":\"Progressively formulate state of the art via exceptional total linkage.\"}', '2024-12-24 02:32:48', '2024-12-24 02:54:59'),
(126, 90, 1, '{\"title\":\"Discover Just What are you Looking for\",\"subtitle\":\"Discover Just What are you Looking for\"}', '2024-12-24 02:55:19', '2024-12-24 02:55:19'),
(127, 91, 1, '{\"title\":\"Perfect Choose For Your Future\",\"subtitle\":\"Progressively formulate state of the art via exceptional total linkage.\"}', '2024-12-24 02:55:44', '2024-12-24 02:55:44'),
(169, 92, 1, '{\"title\":\"5. How do taxes work on my investment returns?\",\"description\":\"<p>Taxes depend on your country of residence and the project structure. In the U.S., returns are generally reported on a <strong>K-1 or 1099 form<\\/strong>, and may be taxed as capital gains, ordinary income, or rental income depending on distributions. We recommend consulting your tax advisor for specifics.<\\/p>\"}', '2025-08-23 05:27:22', '2025-08-23 05:27:22'),
(170, 93, 1, '{\"title\":\"6. Can non-U.S. investors participate?\",\"description\":\"<p>Yes, international investors are welcome, subject to local regulations. We work with global investors but recommend consulting local tax and compliance advisors to understand cross-border implications.<\\/p>\"}', '2025-08-23 05:27:38', '2025-08-23 05:27:38'),
(171, 94, 1, '{\"title\":\"7. Who manages the properties after I invest?\",\"description\":\"<p>All properties are managed by experienced local operators vetted by Two Sigma Real Estate. Our platform oversees operations, performance tracking, and reporting so you can remain hands-off while staying fully informed.<\\/p>\"}', '2025-08-23 05:27:53', '2025-08-23 05:27:53'),
(172, 95, 1, '{\"title\":\"8. What happens if a project underperforms?\",\"description\":\"<p>Every investment carries risk. If a project doesn\\u2019t meet expectations, investors may receive lower returns, or in rare cases, capital may be at risk. To mitigate this, we diversify projects, stress-test assumptions, and share risk factors openly in each investment brief.<\\/p>\"}', '2025-08-23 05:28:13', '2025-08-23 05:28:13'),
(173, 96, 1, '{\"title\":\"9. How will I be updated about my investments?\",\"description\":\"<p>We provide <strong>quarterly reports, financial statements, and milestone updates<\\/strong>. Investors also receive notifications on distributions and have dashboard access to track project performance. Transparency is one of our core values.<\\/p>\"}', '2025-08-23 05:28:26', '2025-08-23 05:28:26'),
(174, 97, 1, '{\"title\":\"10. How do I get started?\",\"description\":\"<p>Sign up on our platform, complete a quick verification (KYC\\/AML), and review available investment opportunities. Once you choose a project, you can invest directly through our secure platform. From there, our team handles everything from management to reporting.<\\/p>\"}', '2025-08-23 05:28:39', '2025-08-23 05:28:39'),
(175, 98, 1, '{\"name\":\"Youtube\",\"font_icon\":\"fa-brands fa-youtube\",\"link\":\"https:\\/\\/www.youtube.com\\/channel\\/UCOylzLjxDbZHFzDbHJiJhgw\"}', '2025-08-23 05:40:21', '2025-08-23 05:40:21');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `depositable_id` int(11) DEFAULT NULL,
  `depositable_type` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_method_currency` varchar(255) DEFAULT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `percentage_charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `fixed_charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `payable_amount` decimal(18,8) NOT NULL DEFAULT 0.00000000 COMMENT 'Amount payed',
  `base_currency_charge` double(18,8) DEFAULT 0.00000000,
  `payable_amount_in_base_currency` double(18,8) NOT NULL DEFAULT 0.00000000,
  `btc_amount` decimal(18,8) DEFAULT NULL,
  `btc_wallet` varchar(255) DEFAULT NULL,
  `payment_id` varchar(191) DEFAULT NULL,
  `information` text DEFAULT NULL,
  `trx_id` char(36) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=pending, 1=success, 2=request, 3=rejected',
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, 'c95bdeb2-8363-475b-9733-032eafa9ca25', 'database', 'default', '{\"uuid\":\"c95bdeb2-8363-475b-9733-032eafa9ca25\",\"displayName\":\"App\\\\Jobs\\\\UserAllRecordDeleteJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserAllRecordDeleteJob\",\"command\":\"O:31:\\\"App\\\\Jobs\\\\UserAllRecordDeleteJob\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"}}', 'Illuminate\\Database\\Eloquent\\ModelNotFoundException: No query results for model [App\\Models\\User]. in /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php:665\nStack trace:\n#0 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Queue/SerializesAndRestoresModelIdentifiers.php(110): Illuminate\\Database\\Eloquent\\Builder->firstOrFail()\n#1 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Queue/SerializesAndRestoresModelIdentifiers.php(63): App\\Jobs\\UserAllRecordDeleteJob->restoreModel()\n#2 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Queue/SerializesModels.php(93): App\\Jobs\\UserAllRecordDeleteJob->getRestoredPropertyValue()\n#3 [internal function]: App\\Jobs\\UserAllRecordDeleteJob->__unserialize()\n#4 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(96): unserialize()\n#5 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(63): Illuminate\\Queue\\CallQueuedHandler->getCommand()\n#6 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#7 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(442): Illuminate\\Queue\\Jobs\\Job->fire()\n#8 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(392): Illuminate\\Queue\\Worker->process()\n#9 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(178): Illuminate\\Queue\\Worker->runJob()\n#10 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(149): Illuminate\\Queue\\Worker->daemon()\n#11 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(132): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#12 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#13 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure()\n#15 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#16 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Container/Container.php(694): Illuminate\\Container\\BoundMethod::call()\n#17 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call()\n#18 /home/bullxgij/twosigmarealty.com/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute()\n#19 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run()\n#20 /home/bullxgij/twosigmarealty.com/vendor/symfony/console/Application.php(1094): Illuminate\\Console\\Command->run()\n#21 /home/bullxgij/twosigmarealty.com/vendor/symfony/console/Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand()\n#22 /home/bullxgij/twosigmarealty.com/vendor/symfony/console/Application.php(193): Symfony\\Component\\Console\\Application->doRun()\n#23 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Console/Application.php(164): Symfony\\Component\\Console\\Application->run()\n#24 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(427): Illuminate\\Console\\Application->call()\n#25 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(361): Illuminate\\Foundation\\Console\\Kernel->call()\n#26 /home/bullxgij/twosigmarealty.com/routes/admin.php(60): Illuminate\\Support\\Facades\\Facade::__callStatic()\n#27 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Routing/CallableDispatcher.php(40): Illuminate\\Routing\\RouteFileRegistrar->{closure}()\n#28 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Routing/Route.php(244): Illuminate\\Routing\\CallableDispatcher->dispatch()\n#29 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Routing/Route.php(215): Illuminate\\Routing\\Route->runCallable()\n#30 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Routing/Router.php(808): Illuminate\\Routing\\Route->run()\n#31 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(170): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#32 /home/bullxgij/twosigmarealty.com/app/Http/Middleware/ActivityByUser.php(36): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#33 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(209): App\\Http\\Middleware\\ActivityByUser->handle()\n#34 /home/bullxgij/twosigmarealty.com/app/Http/Middleware/Language.php(32): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#35 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(209): App\\Http\\Middleware\\Language->handle()\n#36 /home/bullxgij/twosigmarealty.com/app/Http/Middleware/ValidateRequestData.php(30): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#37 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(209): App\\Http\\Middleware\\ValidateRequestData->handle()\n#38 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(51): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#39 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(209): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle()\n#40 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/VerifyCsrfToken.php(88): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#41 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(209): Illuminate\\Foundation\\Http\\Middleware\\VerifyCsrfToken->handle()\n#42 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#43 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(209): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle()\n#44 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#45 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest()\n#46 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(209): Illuminate\\Session\\Middleware\\StartSession->handle()\n#47 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#48 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(209): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle()\n#49 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(75): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#50 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(209): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle()\n#51 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(127): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#52 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Routing/Router.php(807): Illuminate\\Pipeline\\Pipeline->then()\n#53 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Routing/Router.php(786): Illuminate\\Routing\\Router->runRouteWithinStack()\n#54 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Routing/Router.php(750): Illuminate\\Routing\\Router->runRoute()\n#55 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Routing/Router.php(739): Illuminate\\Routing\\Router->dispatchToRoute()\n#56 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(201): Illuminate\\Routing\\Router->dispatch()\n#57 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(170): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#58 /home/bullxgij/twosigmarealty.com/vendor/livewire/livewire/src/Features/SupportDisablingBackButtonCache/DisableBackButtonCacheMiddleware.php(19): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#59 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(209): Livewire\\Features\\SupportDisablingBackButtonCache\\DisableBackButtonCacheMiddleware->handle()\n#60 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/TransformsRequest.php(21): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#61 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/ConvertEmptyStringsToNull.php(31): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle()\n#62 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(209): Illuminate\\Foundation\\Http\\Middleware\\ConvertEmptyStringsToNull->handle()\n#63 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/TransformsRequest.php(21): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#64 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/TrimStrings.php(51): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle()\n#65 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(209): Illuminate\\Foundation\\Http\\Middleware\\TrimStrings->handle()\n#66 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Http/Middleware/ValidatePostSize.php(27): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#67 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(209): Illuminate\\Http\\Middleware\\ValidatePostSize->handle()\n#68 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/PreventRequestsDuringMaintenance.php(110): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#69 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(209): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle()\n#70 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Http/Middleware/HandleCors.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#71 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(209): Illuminate\\Http\\Middleware\\HandleCors->handle()\n#72 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Http/Middleware/TrustProxies.php(58): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#73 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(209): Illuminate\\Http\\Middleware\\TrustProxies->handle()\n#74 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(127): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#75 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): Illuminate\\Pipeline\\Pipeline->then()\n#76 /home/bullxgij/twosigmarealty.com/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#77 /home/bullxgij/twosigmarealty.com/index.php(51): Illuminate\\Foundation\\Http\\Kernel->handle()\n#78 {main}', '2025-08-29 17:40:03');

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `property_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_storages`
--

CREATE TABLE `file_storages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `driver` varchar(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 => active, 0 => inactive',
  `parameters` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `file_storages`
--

INSERT INTO `file_storages` (`id`, `code`, `name`, `logo`, `driver`, `status`, `parameters`, `created_at`, `updated_at`) VALUES
(1, 's3', 'Amazon S3', 'driver/GJrBdvIxtnEprk0kHylgzNh6LcGcfOUcA205IIK5.png', 'local', 0, '{\"access_key_id\":\"xys6\",\"secret_access_key\":\"xys\",\"default_region\":\"xys5\",\"bucket\":\"xys6\",\"url\":\"xysds\"}', NULL, '2024-03-06 02:13:56'),
(2, 'sftp', 'SFTP', 'driver/q8E08YsobyRZGOLHHeKGhwysWsi25F186EbaNNRx.png', 'local', 0, '{\"sftp_username\":\"xys6\",\"sftp_password\":\"xys\"}', NULL, '2023-06-10 17:28:03'),
(3, 'do', 'Digitalocean Spaces', 'driver/iA8q685PBCnOAkmctLXZWhyqSoh7cJMOewpW4S8r.png', 'local', 0, '{\"spaces_key\":\"hj\",\"spaces_secret\":\"vh\",\"spaces_endpoint\":\"jk\",\"spaces_region\":\"sfo2\",\"spaces_bucket\":\"assets-coral\"}', NULL, '2023-06-10 17:45:21'),
(4, 'ftp', 'FTP', 'driver/wIwEOAJ45KgVGw0PL80WNfcbosB4IuUlxStfeHCX.png', 'local', 0, '{\"ftp_host\":\"xys6\",\"ftp_username\":\"xys\",\"ftp_password\":\"xys6\"}', NULL, '2023-06-10 17:27:43'),
(5, 'local', 'Local Storage', '', NULL, 1, NULL, NULL, '2024-03-06 02:13:56');

-- --------------------------------------------------------

--
-- Table structure for table `fire_base_tokens`
--

CREATE TABLE `fire_base_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_id` int(11) DEFAULT NULL,
  `tokenable_type` varchar(255) DEFAULT NULL,
  `token` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `funds`
--

CREATE TABLE `funds` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `gateway_id` int(11) UNSIGNED DEFAULT NULL,
  `fundable_id` int(11) UNSIGNED DEFAULT NULL,
  `fundable_type` varchar(91) NOT NULL,
  `gateway_currency` varchar(191) DEFAULT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `percentage_charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `fixed_charge` decimal(18,8) DEFAULT 0.00000000,
  `final_amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `payable_amount_base_currency` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `btc_amount` decimal(18,8) DEFAULT NULL,
  `btc_wallet` varchar(191) DEFAULT NULL,
  `transaction` varchar(25) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=> Complete, 2=> Pending, 3 => Cancel, 4=> failed',
  `detail` text DEFAULT NULL,
  `feedback` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `validation_token` varchar(191) DEFAULT NULL,
  `referenceno` varchar(191) DEFAULT NULL,
  `reason` varchar(191) DEFAULT NULL,
  `information` text DEFAULT NULL,
  `api_response` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `funds`
--

INSERT INTO `funds` (`id`, `user_id`, `gateway_id`, `fundable_id`, `fundable_type`, `gateway_currency`, `amount`, `charge`, `percentage_charge`, `fixed_charge`, `final_amount`, `payable_amount_base_currency`, `btc_amount`, `btc_wallet`, `transaction`, `status`, `detail`, `feedback`, `created_at`, `updated_at`, `validation_token`, `referenceno`, `reason`, `information`, `api_response`) VALUES
(1, 1, NULL, NULL, '', NULL, 50000.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, 'F274131444646', 1, NULL, NULL, '2025-08-22 09:49:58', '2025-08-22 09:49:58', NULL, NULL, NULL, NULL, NULL),
(2, 1, NULL, NULL, '', NULL, 50000.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, 'F274131444647', 1, NULL, NULL, '2025-08-22 09:50:01', '2025-08-22 09:50:01', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `sort_by` int(11) DEFAULT 1,
  `image` varchar(191) DEFAULT NULL,
  `driver` varchar(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: inactive, 1: active',
  `parameters` text DEFAULT NULL,
  `currencies` text DEFAULT NULL,
  `extra_parameters` text DEFAULT NULL,
  `supported_currency` varchar(255) DEFAULT NULL,
  `receivable_currencies` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `currency_type` tinyint(1) NOT NULL DEFAULT 1,
  `is_sandbox` tinyint(1) NOT NULL DEFAULT 0,
  `environment` enum('test','live') NOT NULL DEFAULT 'live',
  `is_manual` tinyint(1) DEFAULT 1,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `code`, `name`, `sort_by`, `image`, `driver`, `status`, `parameters`, `currencies`, `extra_parameters`, `supported_currency`, `receivable_currencies`, `description`, `currency_type`, `is_sandbox`, `environment`, `is_manual`, `note`, `created_at`, `updated_at`) VALUES
(1, 'paypal', 'Paypal', 10, 'gateway/cCmKX4VMzHorJkQ9omsZdOLIZLXA56.avif', 'local', 0, '{\"cleint_id\":\"\",\"secret\":\"\"}', '{\"0\":{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"USD\"}}', NULL, '[\"USD\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":1.092,\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-26 11:37:06'),
(2, 'stripe', 'Stripe ', 1, 'gateway/Fpn6DbOj8Kh0qEqmDcqzPLaYetzHdU.avif', 'local', 0, '{\"secret_key\":\"\",\"publishable_key\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}}', NULL, '[\"USD\",\"AUD\",\"GBP\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":120,\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0.5\"},{\"name\":\"AUD\",\"currency_symbol\":\"GBP\",\"conversion_rate\":0.864,\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"},{\"name\":\"GBP\",\"currency_symbol\":\"AUD\",\"conversion_rate\":0.816,\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-26 11:37:06'),
(3, 'skrill', 'Skrill', 5, 'gateway/sFW8RqOtyTiIo8369MLJFmMsfHtYHX.avif', 'local', 0, '{\"pay_to_email\":\"\",\"secret_key\":\"\"}', '{\"0\":{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"MAD\":\"MAD\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"SAR\":\"SAR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TND\":\"TND\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\",\"COP\":\"COP\"}}', NULL, '[\"AUD\",\"USD\"]', '[{\"name\":\"AUD\",\"currency_symbol\":\"AUD\",\"conversion_rate\":1.68,\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"},{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":1.092,\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-26 11:37:06'),
(4, 'perfectmoney', 'Perfect Money', 8, 'gateway/B1uwuCo5fk4FVyBSm8yxErDtezvo9R.avif', 'local', 0, '{\"passphrase\":\"\",\"payee_account\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"EUR\":\"EUR\"}}', NULL, '[\"USD\",\"EUR\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":1.092,\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"},{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":0.996,\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-26 11:37:06'),
(5, 'paytm', 'PayTM', 22, 'gateway/9OxY8ZDv4JGt3MS7zPEquDtQ9b1vWU.avif', 'local', 0, '{\"MID\":\"\",\"merchant_key\":\"\",\"WEBSITE\":\"\",\"INDUSTRY_TYPE_ID\":\"\",\"CHANNEL_ID\":\"\",\"environment_url\":\"\",\"process_transaction_url\":\"\"}', '{\"0\":{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}}', NULL, '[\"AUD\",\"CAD\"]', '[{\"name\":\"AUD\",\"currency_symbol\":\"AUD\",\"conversion_rate\":1.68,\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"CAD\",\"currency_symbol\":\"CAD\",\"conversion_rate\":1.44,\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-26 11:37:06'),
(6, 'payeer', 'Payeer', 16, 'gateway/7HTCjJpFcRmHqM1kJSpaRuTA0MzNqG.avif', 'local', 0, '{\"merchant_id\":\"\",\"secret_key\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"EUR\":\"EUR\",\"RUB\":\"RUB\"}}', '{\"status\":\"ipn\"}', '[\"USD\",\"RUB\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":120,\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"RUB\",\"currency_symbol\":\"RUD\",\"conversion_rate\":97.2,\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-26 11:37:06'),
(7, 'paystack', 'PayStack', 4, 'gateway/Km8ogMTUmpEdjbHRvLma7enfvafO3N.avif', 'local', 0, '{\"public_key\":\"\",\"secret_key\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"NGN\":\"NGN\"}}', '{\"callback\":\"ipn\",\"webhook\":\"ipn\"}\r\n', '[\"USD\",\"NGN\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":1.092,\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"NGN\",\"currency_symbol\":\"NGN\",\"conversion_rate\":888,\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-26 11:37:06'),
(8, 'voguepay', 'VoguePay', 33, 'gateway/x6HOsziQhmuJ7iu46zMKdBEewDSesm.avif', 'local', 0, '{\"merchant_id\":\"\"}', '{\"0\":{\"NGN\":\"NGN\",\"USD\":\"USD\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"ZAR\":\"ZAR\",\"JPY\":\"JPY\",\"INR\":\"INR\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PLN\":\"PLN\"}}\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', NULL, '[\"NGN\",\"EUR\"]', '[{\"name\":\"NGN\",\"currency_symbol\":\"NGN\",\"conversion_rate\":888,\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":0.996,\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-26 11:37:06'),
(9, 'flutterwave', 'Flutterwave', 3, 'gateway/SUpub5TEkx7MOcetX340zn7LGSH0Sa.avif', 'local', 0, '{\"public_key\":\"\",\"secret_key\":\"\",\"encryption_key\":\"\"}', '{\"0\":{\"KES\":\"KES\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"UGX\":\"UGX\",\"TZS\":\"TZS\"}}', NULL, '[\"GHS\",\"NGN\",\"USD\"]', '[{\"name\":\"GHS\",\"currency_symbol\":\"GHS\",\"conversion_rate\":13.2,\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"NGN\",\"currency_symbol\":\"NGN\",\"conversion_rate\":888,\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":1.092,\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'test', NULL, NULL, '2020-09-10 03:05:02', '2025-01-26 11:37:06'),
(10, 'razorpay', 'RazorPay', 6, 'gateway/HvTfH2WAQtw0pcN4ZzssUT5l86FMCZ.avif', 'local', 0, '{\"key_id\":\"\",\"key_secret\":\"\"}', '{\"0\":{\"INR\":\"INR\"}}', NULL, '[\"INR\"]', '[{\"name\":\"INR\",\"currency_symbol\":\"INR\",\"conversion_rate\":91.2,\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-26 11:37:06'),
(11, 'instamojo', 'instamojo', 13, 'gateway/rwXQ1P62ePQcvJBIUZRkHMumLbWF73.avif', 'local', 0, '{\"api_key\":\"\",\"auth_token\":\"\",\"salt\":\"\"}', '{\"0\":{\"INR\":\"INR\"}}', NULL, '[\"INR\"]', '[{\"name\":\"INR\",\"currency_symbol\":\"INR\",\"conversion_rate\":91.2,\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-26 11:37:06'),
(12, 'mollie', 'Mollie', 26, 'gateway/S83QZxmVtxCkvl8OGWFGgChxmUcQhc.avif', 'local', 0, '{\"api_key\":\"\"}', '{\"0\":{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}}', NULL, '[\"AUD\",\"BRL\"]', '[{\"name\":\"AUD\",\"currency_symbol\":\"AUD\",\"conversion_rate\":1.68,\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"BRL\",\"currency_symbol\":\"BRL\",\"conversion_rate\":5.3999999999999995,\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-26 11:37:06'),
(13, 'twocheckout', '2checkout', 11, 'gateway/bmAgQ5rUbx2rktlaztA89GEQCKYTxJ.avif', 'local', 0, '{\"merchant_code\":\"\",\"secret_key\":\"\"}', '{\"0\":{\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"DZD\":\"DZD\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"AZN\":\"AZN\",\"BSD\":\"BSD\",\"BDT\":\"BDT\",\"BBD\":\"BBD\",\"BZD\":\"BZD\",\"BMD\":\"BMD\",\"BOB\":\"BOB\",\"BWP\":\"BWP\",\"BRL\":\"BRL\",\"GBP\":\"GBP\",\"BND\":\"BND\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"XCD\":\"XCD\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"FJD\":\"FJD\",\"GTQ\":\"GTQ\",\"HKD\":\"HKD\",\"HNL\":\"HNL\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JMD\":\"JMD\",\"JPY\":\"JPY\",\"KZT\":\"KZT\",\"KES\":\"KES\",\"LAK\":\"LAK\",\"MMK\":\"MMK\",\"LBP\":\"LBP\",\"LRD\":\"LRD\",\"MOP\":\"MOP\",\"MYR\":\"MYR\",\"MVR\":\"MVR\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NIO\":\"NIO\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PGK\":\"PGK\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"WST\":\"WST\",\"SAR\":\"SAR\",\"SCR\":\"SCR\",\"SGD\":\"SGD\",\"SBD\":\"SBD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"SYP\":\"SYP\",\"THB\":\"THB\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TRY\":\"TRY\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"USD\":\"USD\",\"VUV\":\"VUV\",\"VND\":\"VND\",\"XOF\":\"XOF\",\"YER\":\"YER\"}}', '{\"approved_url\":\"ipn\"}', '[\"AFN\",\"ARS\"]', '[{\"name\":\"AFN\",\"currency_symbol\":\"AFN\",\"conversion_rate\":75.6,\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"ARS\",\"currency_symbol\":\"ARS\",\"conversion_rate\":388.8,\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-26 11:37:06'),
(14, 'authorizenet', 'Authorize.Net', 7, 'gateway/kY6uyYr0nPgU0SyM69Yy4ei7aAowCu.avif', 'local', 0, '{\"login_id\":\"\",\"current_transaction_key\":\"\"}', '{\"0\":{\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"USD\":\"USD\"}}', NULL, '[\"AUD\",\"CAD\"]', '[{\"name\":\"AUD\",\"currency_symbol\":\"AUD\",\"conversion_rate\":1.68,\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"},{\"name\":\"CAD\",\"currency_symbol\":\"CAD\",\"conversion_rate\":1.44,\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'test', NULL, NULL, '2020-09-10 03:05:02', '2025-01-26 11:37:06'),
(15, 'securionpay', 'SecurionPay', 32, 'gateway/MZexTcUjZftszr1jA2xG9y8ntD2bA2.avif', 'local', 0, '{\"public_key\":\"\",\"secret_key\":\"\"}', '{\"0\":{\"AFN\":\"AFN\", \"DZD\":\"DZD\", \"ARS\":\"ARS\", \"AUD\":\"AUD\", \"BHD\":\"BHD\", \"BDT\":\"BDT\", \"BYR\":\"BYR\", \"BAM\":\"BAM\", \"BWP\":\"BWP\", \"BRL\":\"BRL\", \"BND\":\"BND\", \"BGN\":\"BGN\", \"CAD\":\"CAD\", \"CLP\":\"CLP\", \"CNY\":\"CNY\", \"COP\":\"COP\", \"KMF\":\"KMF\", \"HRK\":\"HRK\", \"CZK\":\"CZK\", \"DKK\":\"DKK\", \"DJF\":\"DJF\", \"DOP\":\"DOP\", \"EGP\":\"EGP\", \"ETB\":\"ETB\", \"ERN\":\"ERN\", \"EUR\":\"EUR\", \"GEL\":\"GEL\", \"HKD\":\"HKD\", \"HUF\":\"HUF\", \"ISK\":\"ISK\", \"INR\":\"INR\", \"IDR\":\"IDR\", \"IRR\":\"IRR\", \"IQD\":\"IQD\", \"ILS\":\"ILS\", \"JMD\":\"JMD\", \"JPY\":\"JPY\", \"JOD\":\"JOD\", \"KZT\":\"KZT\", \"KES\":\"KES\", \"KWD\":\"KWD\", \"KGS\":\"KGS\", \"LVL\":\"LVL\", \"LBP\":\"LBP\", \"LTL\":\"LTL\", \"MOP\":\"MOP\", \"MKD\":\"MKD\", \"MGA\":\"MGA\", \"MWK\":\"MWK\", \"MYR\":\"MYR\", \"MUR\":\"MUR\", \"MXN\":\"MXN\", \"MDL\":\"MDL\", \"MAD\":\"MAD\", \"MZN\":\"MZN\", \"NAD\":\"NAD\", \"NPR\":\"NPR\", \"ANG\":\"ANG\", \"NZD\":\"NZD\", \"NOK\":\"NOK\", \"OMR\":\"OMR\", \"PKR\":\"PKR\", \"PEN\":\"PEN\", \"PHP\":\"PHP\", \"PLN\":\"PLN\", \"QAR\":\"QAR\", \"RON\":\"RON\", \"RUB\":\"RUB\", \"SAR\":\"SAR\", \"RSD\":\"RSD\", \"SGD\":\"SGD\", \"ZAR\":\"ZAR\", \"KRW\":\"KRW\", \"IKR\":\"IKR\", \"LKR\":\"LKR\", \"SEK\":\"SEK\", \"CHF\":\"CHF\", \"SYP\":\"SYP\", \"TWD\":\"TWD\", \"TZS\":\"TZS\", \"THB\":\"THB\", \"TND\":\"TND\", \"TRY\":\"TRY\", \"UAH\":\"UAH\", \"AED\":\"AED\", \"GBP\":\"GBP\", \"USD\":\"USD\", \"VEB\":\"VEB\", \"VEF\":\"VEF\", \"VND\":\"VND\", \"XOF\":\"XOF\", \"YER\":\"YER\", \"ZMK\":\"ZMK\"}}', NULL, '[\"AFN\",\"DZD\"]', '[{\"name\":\"AFN\",\"currency_symbol\":\"AFN\",\"conversion_rate\":75.6,\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"},{\"name\":\"DZD\",\"currency_symbol\":\"DZD\",\"conversion_rate\":146.4,\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-26 11:37:06'),
(16, 'payumoney', 'PayUmoney', 27, 'gateway/TjSy1hfABIV2RzIRECRJcwmN04sGEh.avif', 'local', 0, '{\"merchant_key\":\"\",\"salt\":\"\"}', '{\"0\":{\"INR\":\"INR\"}}', NULL, '[\"INR\"]', '[{\"name\":\"INR\",\"currency_symbol\":\"INR\",\"conversion_rate\":91.2,\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'test', NULL, NULL, '2020-09-10 03:05:02', '2025-01-26 11:37:06'),
(17, 'mercadopago', 'Mercado Pago', 17, 'gateway/2UlZWhhkfVSWQepk1uBKecw4FrepZx.avif', 'local', 0, '{\"access_token\":\"\"}', '{\"0\":{\"ARS\":\"ARS\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"DOP\":\"DOP\",\"EUR\":\"EUR\",\"GTQ\":\"GTQ\",\"HNL\":\"HNL\",\"MXN\":\"MXN\",\"NIO\":\"NIO\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PYG\":\"PYG\",\"USD\":\"USD\",\"UYU\":\"UYU\",\"VEF\":\"VEF\",\"VES\":\"VES\"}}', NULL, '[\"ARS\"]', '[{\"name\":\"ARS\",\"currency_symbol\":\"ARS\",\"conversion_rate\":388.8,\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-26 11:37:06'),
(18, 'coingate', 'Coingate', 18, 'gateway/uxKFypl7GtiL0YnJhshsLKyGzf2YKt.avif', 'local', 0, '{\"api_key\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"EUR\":\"EUR\"}}', NULL, '[\"USD\",\"EUR\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":1.092,\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":0.996,\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'test', NULL, NULL, '2020-09-10 03:05:02', '2025-01-26 11:37:06'),
(19, 'coinbasecommerce', 'Coinbase Commerce', 15, 'gateway/POaHQGEUctnNpM9YgAvIIwq0R9aXnw.avif', 'local', 0, '{\"api_key\":\"\",\"secret\":\"\"}', '{\"0\":{\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CHF\":\"CHF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"EUR\":\"EUR\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GBP\":\"GBP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HKD\":\"HKD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"INR\":\"INR\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NOK\":\"NOK\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RUB\":\"RUB\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TRY\":\"TRY\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZAR\":\"ZAR\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}}', '{\"webhook\":\"ipn\"}', '[\"AED\",\"ALL\"]', '[{\"name\":\"AED\",\"currency_symbol\":\"AED\",\"conversion_rate\":3.96,\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"ALL\",\"currency_symbol\":\"ALL\",\"conversion_rate\":102,\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-26 11:37:06'),
(20, 'monnify', 'Monnify', 19, 'gateway/N9ZZ4F4YeYM4m78gZW0Gnm8HTu037v.avif', 'local', 0, '{\"api_key\":\"\",\"secret_key\":\"\",\"contract_code\":\"\"}', '{\"0\":{\"NGN\":\"NGN\"}}', NULL, '[\"NGN\"]', '[{\"name\":\"NGN\",\"currency_symbol\":\"NGN\",\"conversion_rate\":888,\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-26 11:37:06'),
(22, 'coinpayments', 'CoinPayments', 20, 'gateway/truY5ILTjTIFunGBf7Hn5vcWSxYw6Q.avif', 'local', 0, '{\"merchant_id\":\"\",\"private_key\":\"\",\"public_key\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\"},\"1\":{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}}', '{\"callback\":\"ipn\"}', '[\"USD\",\"AUD\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":1.092,\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"AUD\",\"currency_symbol\":\"AUD\",\"conversion_rate\":1.68,\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-26 11:37:06'),
(23, 'blockchain', 'Blockchain', 23, 'gateway/20zn8YG4VPgOUSBQHvj0GeKMHwL4ZY.avif', 'local', 0, '{\"api_key\":\"\",\"xpub_code\":\"\"}', '{\"1\":{\"BTC\":\"BTC\"}}', NULL, '[\"BTC\"]', '[{\"name\":\"BTC\",\"currency_symbol\":\"BTC\",\"conversion_rate\":1.092,\"min_limit\":\"50\",\"max_limit\":\"500000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 0, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-26 11:37:06'),
(25, 'cashmaal', 'cashmaal', 24, 'gateway/7Y3IZE7VY61XHwNxRzrgWVFZx8zUu0.avif', 'local', 0, '{\"web_id\":\"\",\"ipn_key\":\"\"}', '{\"0\":{\"PKR\":\"PKR\",\"USD\":\"USD\"}}', '{\"ipn_url\":\"ipn\"}', '[\"PKR\",\"USD\"]', '[{\"name\":\"PKR\",\"currency_symbol\":\"PKR\",\"conversion_rate\":307.2,\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":1.092,\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, NULL, '2025-01-26 11:37:06'),
(26, 'midtrans', 'Midtrans', 2, 'gateway/7fRFCClfGcMefCb35AVzgnEJevUi37.avif', 'local', 0, '{\"client_key\":\"\",\"server_key\":\"\"}', '{\"0\":{\"IDR\":\"IDR\"}}', '{\"payment_notification_url\":\"ipn\", \"finish redirect_url\":\"ipn\", \"unfinish redirect_url\":\"failed\",\"error redirect_url\":\"failed\"}', '[\"IDR\"]', '[{\"name\":\"IDR\",\"currency_symbol\":\"IDR\",\"conversion_rate\":16965.6,\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'test', NULL, '', '2020-09-08 21:05:02', '2025-01-26 11:37:06'),
(27, 'peachpayments', 'peachpayments', 34, 'gateway/4aJggeZFR2SBLYMw9DewRUOByPaRez.avif', 'local', 0, '{\"Authorization_Bearer\":\"\",\"Entity_ID\":\"\",\"Recur_Channel\":\"\"}', '{\"0\":{\"AED\":\"AED\",\"AFA\":\"AFA\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"AWG\":\"AWG\",\"AZM\":\"AZM\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYR\":\"BYR\",\"BZD\":\"BZD\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CYP\":\"CYP\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EEK\":\"EEK\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"EUR\":\"EUR\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GBP\":\"GBP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHC\":\"GHC\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HKD\":\"HKD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"INR\":\"INR\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LTL\":\"LTL\",\"LVL\":\"LVL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MTL\":\"MTL\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"MZM\":\"MZM\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NOK\":\"NOK\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PTS\":\"PTS\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDD\":\"SDD\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"SHP\":\"SHP\",\"SIT\":\"SIT\",\"SKK\":\"SKK\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SPL\":\"SPL\",\"SRD\":\"SRD\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMM\":\"TMM\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TRL\":\"TRL\",\"TRY\":\"TRY\",\"TTD\":\"TTD\",\"TVD\":\"TVD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZAR\":\"ZAR\",\"ZMK\":\"ZMK\",\"ZWD\":\"ZWD\"}}', NULL, '[\"CAD\",\"AED\"]', '[{\"name\":\"CAD\",\"currency_symbol\":\"CAD\",\"conversion_rate\":1.44,\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"AED\",\"currency_symbol\":\"AED\",\"conversion_rate\":3.96,\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'live', NULL, '', '2020-09-09 03:05:02', '2025-01-26 11:37:06'),
(28, 'nowpayments', 'Nowpayments', 25, 'gateway/Z5wvvbRZN7nZUC6GgPTqMyf1lM2WBf.avif', 'local', 0, '{\"api_key\":\"\"}', '{\"1\":{\"BTG\":\"BTG\",\"ETH\":\"ETH\",\"XMR\":\"XMR\",\"ZEC\":\"ZEC\",\"XVG\":\"XVG\",\"ADA\":\"ADA\",\"LTC\":\"LTC\",\"BCH\":\"BCH\",\"QTUM\":\"QTUM\",\"DASH\":\"DASH\",\"XLM\":\"XLM\",\"XRP\":\"XRP\",\"XEM\":\"XEM\",\"DGB\":\"DGB\",\"LSK\":\"LSK\",\"DOGE\":\"DOGE\",\"TRX\":\"TRX\",\"KMD\":\"KMD\",\"REP\":\"REP\",\"BAT\":\"BAT\",\"ARK\":\"ARK\",\"WAVES\":\"WAVES\",\"BNB\":\"BNB\",\"XZC\":\"XZC\",\"NANO\":\"NANO\",\"TUSD\":\"TUSD\",\"VET\":\"VET\",\"ZEN\":\"ZEN\",\"GRS\":\"GRS\",\"FUN\":\"FUN\",\"NEO\":\"NEO\",\"GAS\":\"GAS\",\"PAX\":\"PAX\",\"USDC\":\"USDC\",\"ONT\":\"ONT\",\"XTZ\":\"XTZ\",\"LINK\":\"LINK\",\"RVN\":\"RVN\",\"BNBMAINNET\":\"BNBMAINNET\",\"ZIL\":\"ZIL\",\"BCD\":\"BCD\",\"USDTERC20\":\"USDTERC20\",\"CRO\":\"CRO\",\"DAI\":\"DAI\",\"HT\":\"HT\",\"WABI\":\"WABI\",\"BUSD\":\"BUSD\",\"ALGO\":\"ALGO\",\"USDTTRC20\":\"USDTTRC20\",\"GT\":\"GT\",\"STPT\":\"STPT\",\"AVA\":\"AVA\",\"SXP\":\"SXP\",\"UNI\":\"UNI\",\"OKB\":\"OKB\",\"BTC\":\"BTC\"}}', '{\"cron\":\"ipn\"}', '[\"ETH\",\"XEM\"]', '[{\"name\":\"ETH\",\"currency_symbol\":\"XEM\",\"conversion_rate\":1.092,\"min_limit\":\"10\",\"max_limit\":\"500000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"},{\"name\":\"XEM\",\"currency_symbol\":\"ETH\",\"conversion_rate\":1.092,\"min_limit\":\"10\",\"max_limit\":\"500000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 0, 1, 'live', NULL, '', '2020-09-08 21:05:02', '2025-01-26 11:37:06'),
(29, 'khalti', 'Khalti Payment', 28, 'gateway/x4BeAPBkYuM494NvWfAkrxTfk1tbUt.avif', 'local', 0, '{\"secret_key\":\"\",\"public_key\":\"\"}', '{\"0\":{\"NPR\":\"NPR\"}}', NULL, '[\"NPR\"]', '[{\"name\":\"NPR\",\"currency_symbol\":\"NPR\",\"conversion_rate\":145.2,\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, '', '2020-09-08 21:05:02', '2025-01-26 11:37:06'),
(30, 'swagger', 'MAGUA PAY', 21, 'gateway/j8bFL5e5LOn6YkquKQiy6com8w1uj2.avif', 'local', 0, '{\"MAGUA_PAY_ACCOUNT\":\"\",\"MerchantKey\":\"\",\"Secret\":\"\"}', '{\"0\":{\"EUR\":\"EUR\"}}', NULL, '[\"EUR\"]', '[{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":0.996,\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, '', '2020-09-08 21:05:02', '2025-01-26 11:37:06'),
(31, 'freekassa', 'Free kassa', 35, 'gateway/VqJR12ZLuhmisIpUbpm6p2OCqm4hHC.avif', 'local', 0, '{\"merchant_id\":\"\",\"merchant_key\":\"\",\"secret_word\":\"\",\"secret_word2\":\"\"}', '{\"0\":{\"RUB\":\"RUB\",\"USD\":\"USD\",\"EUR\":\"EUR\",\"UAH\":\"UAH\",\"KZT\":\"KZT\"}}', '{\"ipn_url\":\"ipn\"}', '[\"RUB\",\"USD\"]', '[{\"name\":\"RUB\",\"currency_symbol\":\"RUB\",\"conversion_rate\":97.2,\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":1.092,\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, '', '2020-09-08 21:05:02', '2025-01-26 11:37:06'),
(32, 'konnect', 'Konnect', 29, 'gateway/DIWitJin1UBjkwTLrSPcstnUDGmTz3.avif', 'local', 0, '{\"api_key\":\"\",\"receiver_wallet_Id\":\"\"}', '{\"0\":{\"TND\":\"TND\",\"EUR\":\"EUR\",\"USD\":\"USD\"}}', '{\"webhook\":\"ipn\"}', '[\"USD\",\"TND\",\"EUR\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":1.092,\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"TND\",\"currency_symbol\":\"TND\",\"conversion_rate\":3.36,\"min_limit\":\"1\",\"max_limit\":\"20000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"},{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":0.996,\"min_limit\":\"1\",\"max_limit\":\"60000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'live', NULL, '', '2020-09-08 21:05:02', '2025-01-26 11:37:06'),
(33, 'mypay', 'Mypay Np', 31, 'gateway/kkBeSnA5MFdlLrrSOpF3dJp1JwMxIB.avif', 'local', 0, '{\"merchant_username\":\"\",\"merchant_api_password\":\"\",\"merchant_id\":\"\",\"api_key\":\"\"}', '{\"0\":{\"NPR\":\"NPR\"}}', NULL, '[\"NPR\"]', '[{\"name\":\"NPR\",\"currency_symbol\":\"NPR\",\"conversion_rate\":145.2,\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'live', NULL, '', '2020-09-08 21:05:02', '2025-01-26 11:37:06'),
(35, 'imepay', 'IME PAY', 9, 'gateway/YuBFrsBWuxf17sqB6z8y039xgdxyat.avif', 'local', 0, '{\"MerchantModule\":\"\",\"MerchantCode\":\"\",\"username\":\"\",\"password\":\"\"}', '{\"0\":{\"NPR\":\"NPR\"}}', NULL, '[\"NPR\"]', '[{\"name\":\"NPR\",\"currency_symbol\":\"NPR\",\"conversion_rate\":145.2,\"min_limit\":\"10\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"1.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, '', '2020-09-08 21:05:02', '2025-01-26 11:37:06'),
(36, 'cashonexHosted', 'Cashonex Hosted', 14, 'gateway/GAcL1CamWpPaeDGaD6aSInqXknXK50.avif', 'local', 0, '{\"idempotency_key\":\"\",\"salt\":\"\"}', '{\"0\":{\"USD\":\"USD\"}}', NULL, '[\"USD\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":1.092,\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2023-04-02 18:31:33', '2025-01-26 11:37:06'),
(37, 'cashonex', 'cashonex', 30, 'gateway/rbbey8zLDMKdNPftwRdOSY79eVEGLi.avif', 'local', 0, '{\"idempotency_key\":\"\",\"salt\":\"\"}', '{\"0\":{\"USD\":\"USD\"}}', NULL, '[\"USD\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":1.092,\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0.0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2023-04-02 18:34:54', '2025-01-26 11:37:06'),
(38, 'binance', 'Binance', 12, 'gateway/bZ7w2koAzATHG9gp8k6JzRhhusXTpH.avif', 'local', 0, '{\"mercent_api_key\":\"\",\"mercent_secret\":\"\"}', '{\"1\":{\"ADA\":\"ADA\",\"ATOM\":\"ATOM\",\"AVA\":\"AVA\",\"BCH\":\"BCH\",\"BNB\":\"BNB\",\"BTC\":\"BTC\",\"BUSD\":\"BUSD\",\"CTSI\":\"CTSI\",\"DASH\":\"DASH\",\"DOGE\":\"DOGE\",\"DOT\":\"DOT\",\"EGLD\":\"EGLD\",\"EOS\":\"EOS\",\"ETC\":\"ETC\",\"ETH\":\"ETH\",\"FIL\":\"FIL\",\"FRONT\":\"FRONT\",\"FTM\":\"FTM\",\"GRS\":\"GRS\",\"HBAR\":\"HBAR\",\"IOTX\":\"IOTX\",\"LINK\":\"LINK\",\"LTC\":\"LTC\",\"MANA\":\"MANA\",\"MATIC\":\"MATIC\",\"NEO\":\"NEO\",\"OM\":\"OM\",\"ONE\":\"ONE\",\"PAX\":\"PAX\",\"QTUM\":\"QTUM\",\"STRAX\":\"STRAX\",\"SXP\":\"SXP\",\"TRX\":\"TRX\",\"TUSD\":\"TUSD\",\"UNI\":\"UNI\",\"USDC\":\"USDC\",\"USDT\":\"USDT\",\"WRX\":\"WRX\",\"XLM\":\"XLM\",\"XMR\":\"XMR\",\"XRP\":\"XRP\",\"XTZ\":\"XTZ\",\"XVS\":\"XVS\",\"ZEC\":\"ZEC\",\"ZIL\":\"ZIL\"}}', NULL, '[\"BTC\"]', '[{\"name\":\"BTC\",\"currency_symbol\":\"BTC\",\"conversion_rate\":0.00324,\"min_limit\":\"1\",\"max_limit\":\"5\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 0, 0, 'live', NULL, NULL, '2023-04-02 19:36:14', '2025-01-26 11:37:06'),
(39, 'cinetpay', 'CinetPay ', 36, 'gateway/9WCd4Kn4EvlDX8y4V3bEV7eazCTlla.avif', 'local', 0, '{\"apiKey\":\"\",\"site_id\":\"\"}', '{\"0\":{\"XOF\":\"XOF\",\"XAF\":\"XAF\",\"CDF\":\"CDF\",\"GNF\":\"GNF\",\"USD\":\"USD\"}}', 'NULL', '[\"XOF\"]', '[{\"name\":\"XOF\",\"currency_symbol\":\"XOF\",\"conversion_rate\":654,\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'test', NULL, NULL, '2023-04-02 19:36:14', '2025-01-26 11:37:06'),
(1000, 'bank-transfer', 'U.S. Bank Wire Transfer', 1, 'gateway/H1I9sIlNfUAm4dSC8xmUqAoyz9GLqT.webp', 'local', 1, '{\"BankName\":{\"field_name\":\"BankName\",\"field_label\":\"Bank Name\",\"type\":\"text\",\"validation\":\"required\"},\"BankAddress\":{\"field_name\":\"BankAddress\",\"field_label\":\"Bank Address\",\"type\":\"text\",\"validation\":\"required\"},\"AccountName\":{\"field_name\":\"AccountName\",\"field_label\":\"Account Name\",\"type\":\"file\",\"validation\":\"required\"},\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_label\":\"Account Number\",\"type\":\"text\",\"validation\":\"required\"},\"RoutingNumberABA\":{\"field_name\":\"RoutingNumberABA\",\"field_label\":\"Routing Number (ABA)\",\"type\":\"text\",\"validation\":\"required\"},\"SWIFTBICCode\":{\"field_name\":\"SWIFTBICCode\",\"field_label\":\"SWIFT\\/BIC Code\",\"type\":\"text\",\"validation\":\"required\"},\"ReferenceMemo\":{\"field_name\":\"ReferenceMemo\",\"field_label\":\"Reference \\/ Memo\",\"type\":\"text\",\"validation\":\"required\"},\"UploadWireReceipt\":{\"field_name\":\"UploadWireReceipt\",\"field_label\":\"Upload Wire Receipt\",\"type\":\"file\",\"validation\":\"required\"}}', NULL, NULL, '[\"USD\"]', '[{\"currency\":\"USD\",\"conversion_rate\":\"1\",\"min_limit\":\"5000\",\"max_limit\":\"80000000\",\"percentage_charge\":\"4\",\"fixed_charge\":\"2\"}]', 'Send funds via domestic or international bank wire. Please ensure all details are entered correctly to avoid delays. Bank wires may take 1–3 business days to clear. Any wire transfer fees charged by your bank are the responsibility of the sender.', 1, 0, 'live', NULL, '<p><strong>How to Send a U.S. Bank Wire Transfer:</strong></p>\n<ol>\n<li>\n<p>Visit your bank (online banking or in person).</p>\n</li>\n<li>\n<p>Select <strong>Wire Transfer</strong> as your payment method.</p>\n</li>\n<li>\n<p>Enter the beneficiary bank details exactly as shown below.</p>\n</li>\n<li>\n<p>Confirm your wire transfer and keep a copy of the receipt.</p>\n</li>\n<li>\n<p>Upload proof of payment (wire confirmation slip or screenshot) on our platform to ensure timely credit.<br><strong><br><br>How to Send an International Wire (SWIFT):</strong></p><p>\n</p><ol>\n<li>\n<p>Visit your bank branch or online banking.</p>\n</li>\n<li>\n<p>Select <strong>International Wire Transfer (SWIFT)</strong> as the payment type.</p>\n</li>\n<li>\n<p>Enter the beneficiary bank details exactly as shown below.</p>\n</li>\n<li>\n<p>Confirm your wire transfer and note the <strong>SWIFT Transaction Reference (MT103)</strong>.</p>\n</li>\n<li>\n<p>Upload proof of payment (wire slip or MT103 PDF) in your account portal for faster processing.</p></li></ol>\n</li>\n</ol>', NULL, '2025-08-23 07:13:13'),
(1008, 'usdt-trc20', 'USDT - TRC20', 1, 'gateway/2oGNPFCJW9l6esfBekVLrCQJFJiwA1.webp', 'local', 1, '{\"DepositSlip-ScreenshotsImageetc\":{\"field_name\":\"DepositSlip-ScreenshotsImageetc\",\"field_label\":\"Deposit Slip - Screenshots, Image etc\",\"type\":\"file\",\"validation\":\"required\"}}', NULL, NULL, '[\"USD\"]', '[{\"currency\":\"USD\",\"conversion_rate\":\"1\",\"min_limit\":\"2000\",\"max_limit\":\"8000000\",\"percentage_charge\":\"5\",\"fixed_charge\":\"6\"}]', 'Wallet Address: TG1gJWLnrYDKbJJhybLVdQfs8cmegZktaV', 1, 0, 'live', 1, '<p><span style=\"color:rgb(30,32,34);font-size:1.41094rem;font-weight:600;\">📖 Guide: How to Deposit USDT (TRC-20)</span></p><h3><strong>Step 1 – Select Deposit Method</strong></h3><ul>\n<li>\n<p>Log in to your account on our platform.</p>\n</li>\n<li>\n<p>Navigate to the <strong>Deposit / Add Funds</strong> section.</p>\n</li>\n<li>\n<p>Choose <strong>USDT (TRC-20)</strong> from the list of available payment gateways.</p>\n</li>\n</ul><h3><strong>Step 2 – Copy the Wallet Address</strong></h3><ul>\n<li>\n<p>You will see a unique <strong>USDT TRC-20 wallet address</strong> displayed (along with a QR code).<br><br></p><ul><li><p><span style=\"font-weight:bolder;\">WALLET ADDRESS: </span>TWj6xNCcXzki7XryUhEk89q5guVFmoWeUF</p></li></ul><p><br><br><br><strong>Copy the wallet address</strong> carefully or scan the QR code using your crypto wallet app.<br></p></li><li><p>\n⚠️ Make sure you select the <strong>TRC-20 network (Tron Network)</strong> when sending USDT. Sending funds via the wrong network (ERC-20, BEP-20, etc.) will result in permanent loss.</p>\n</li>\n</ul><h3><strong>Step 3 – Initiate the Transfer</strong></h3><ul>\n<li>\n<p>Open your crypto wallet (e.g., Binance, KuCoin, Trust Wallet, TronLink, etc.).</p>\n</li>\n<li>\n<p>Choose <strong>Withdraw / Send USDT</strong>.</p>\n</li>\n<li>\n<p>Paste the copied wallet address into the recipient field.</p>\n</li>\n<li>\n<p>Select <strong>TRC-20 (Tron Network)</strong> as the transfer network.</p>\n</li>\n<li>\n<p>Enter the amount you want to deposit (respecting platform limits).</p>\n</li>\n</ul><h3><strong>Step 4 – Confirm Transaction</strong></h3><ul>\n<li>\n<p>Double-check the address and network.</p>\n</li>\n<li>\n<p>Confirm the transaction in your wallet app.</p>\n</li>\n<li>\n<p>Most transfers on TRC-20 are completed within a few minutes, but delays can occur depending on network congestion.</p>\n</li>\n</ul><h3><strong>Step 5 – Upload Proof of Payment</strong></h3><ul>\n<li>\n<p>After completing the transfer, <strong>take a screenshot or download the transaction hash (TxID)</strong> from your wallet.</p>\n</li>\n<li>\n<p>Return to the deposit page and upload your proof of payment under the <strong>Deposit Slip</strong> field.</p>\n</li>\n<li>\n<p>Submit the deposit request.</p>\n</li>\n</ul><h3><strong>Step 6 – Wait for Confirmation</strong></h3><ul>\n<li>\n<p>Our system/admin team will verify your transaction.</p>\n</li>\n<li>\n<p>Once confirmed, the equivalent amount will be credited to your account balance.</p>\n</li>\n<li>\n<p>You will receive a notification/email once the funds are available.</p>\n</li>\n</ul><h1>⚠️ Important Notes</h1><ul>\n<li>\n<p>✅ Always use <strong>TRC-20 network</strong> when depositing USDT.</p>\n</li>\n<li>\n<p>✅ Ensure you meet the <strong>minimum deposit limit</strong> ($2,000 USDT).</p>\n</li>\n<li>\n<p>✅ Do not send less than the minimum amount; such transactions may not be credited.</p>\n</li>\n<li>\n<p>✅ Network or transaction fees may apply depending on your wallet provider.</p>\n</li>\n<li>\n<p>✅ Incorrect deposits (wrong network, wrong coin) cannot be refunded.</p></li></ul>', '2025-08-23 06:03:01', '2025-08-28 17:54:54');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `imageable_type` varchar(255) DEFAULT NULL,
  `imageable_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `driver` varchar(255) NOT NULL DEFAULT 'local',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `imageable_type`, `imageable_id`, `image`, `driver`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Property', 1, 'property/ocLL1WFKN9nTa8pu9ZTdlQyxPeB4QF.webp', 'local', '2025-08-22 08:10:34', '2025-08-22 08:10:34'),
(2, 'App\\Models\\Property', 1, 'property/zKkUabXJQ006AYsls1uyYl6TzBTwD3.webp', 'local', '2025-08-22 08:10:34', '2025-08-22 08:10:34'),
(3, 'App\\Models\\Property', 1, 'property/QGjc1VqPfqzMl0XpuidzNPC60cpdO7.webp', 'local', '2025-08-22 08:10:34', '2025-08-22 08:10:34'),
(4, 'App\\Models\\Property', 1, 'property/a2QRKXRDBbzyZvfovOZIYQfOEq6m88.webp', 'local', '2025-08-22 08:10:34', '2025-08-22 08:10:34'),
(5, 'App\\Models\\Property', 1, 'property/sESxhRrXbSbdZuc8QInNWUnrn1M6AS.webp', 'local', '2025-08-22 08:10:35', '2025-08-22 08:10:35'),
(6, 'App\\Models\\Property', 2, 'property/3o0vN9JbpFcl0JV2WKTMrJdMhybKmo.webp', 'local', '2025-08-22 08:41:09', '2025-08-22 08:41:09'),
(7, 'App\\Models\\Property', 2, 'property/qfnEQCq9nE7jRdcn7I70YTzFWr44yq.webp', 'local', '2025-08-22 08:41:09', '2025-08-22 08:41:09'),
(8, 'App\\Models\\Property', 2, 'property/EuwMBenkI7xA0ez6kdTbcqg4N0ubIS.webp', 'local', '2025-08-22 08:41:10', '2025-08-22 08:41:10'),
(9, 'App\\Models\\Property', 2, 'property/J5R7Vb0AygZ0NymVwozVbOujMsWzr1.webp', 'local', '2025-08-22 08:41:10', '2025-08-22 08:41:10'),
(10, 'App\\Models\\Property', 2, 'property/caWZj0I03SN8Qozlp3TkzMQdYztg7W.webp', 'local', '2025-08-22 08:41:10', '2025-08-22 08:41:10'),
(11, 'App\\Models\\Property', 2, 'property/7bnfRxjTKFJffhQ0AevzWQgEiwjHeJ.webp', 'local', '2025-08-22 08:41:10', '2025-08-22 08:41:10'),
(12, 'App\\Models\\Property', 2, 'property/hHFXuslUoeYvDXkrq0fhLgzPrZagd3.webp', 'local', '2025-08-22 08:41:10', '2025-08-22 08:41:10'),
(13, 'App\\Models\\Property', 3, 'property/wNUHrPp0MMs50gNEGGNDamYrYJuT0y.webp', 'local', '2025-08-22 11:39:58', '2025-08-22 11:39:58'),
(14, 'App\\Models\\Property', 3, 'property/FWj2XYaOrslDXnEQgdP2vH77yeL4KP.webp', 'local', '2025-08-22 11:39:58', '2025-08-22 11:39:58'),
(15, 'App\\Models\\Property', 3, 'property/AWclqZZyKnQTPdjasv78rcseo4aOs6.webp', 'local', '2025-08-22 11:39:58', '2025-08-22 11:39:58'),
(16, 'App\\Models\\Property', 3, 'property/kN64lacT6VfDT33Xk13ONmmLvizzK5.webp', 'local', '2025-08-22 11:39:58', '2025-08-22 11:39:58'),
(17, 'App\\Models\\Property', 3, 'property/vTHVKPETnXvEzLs4byAJrmH95icujb.webp', 'local', '2025-08-22 11:39:59', '2025-08-22 11:39:59'),
(18, 'App\\Models\\Property', 3, 'property/I5wC6qSv8w2FBADynX4bidm3Pk6d2o.webp', 'local', '2025-08-22 11:39:59', '2025-08-22 11:39:59'),
(19, 'App\\Models\\Property', 3, 'property/koDiJ8UXgSQDH4jyWQ7YBLdP8FBBaC.webp', 'local', '2025-08-22 11:39:59', '2025-08-22 11:39:59'),
(20, 'App\\Models\\Property', 3, 'property/qSZYOqmK3EBfdjYzRloNdoG5koC3ST.webp', 'local', '2025-08-22 11:39:59', '2025-08-22 11:39:59'),
(21, 'App\\Models\\Property', 3, 'property/JsJ8SLLIw49OWCAc5AIIbDDrrCix4Q.webp', 'local', '2025-08-22 11:39:59', '2025-08-22 11:39:59'),
(22, 'App\\Models\\Property', 3, 'property/y31cKSPFI7QFKvNEVAy9hLfQgQx00S.webp', 'local', '2025-08-22 11:40:00', '2025-08-22 11:40:00'),
(23, 'App\\Models\\Property', 3, 'property/LICxO5jKrcgx1MF29it8515KIouyhv.webp', 'local', '2025-08-22 11:40:00', '2025-08-22 11:40:00'),
(24, 'App\\Models\\Property', 3, 'property/CEMPg8eFmomxA5rcurfiL6JUcb9cee.webp', 'local', '2025-08-22 11:40:00', '2025-08-22 11:40:00'),
(25, 'App\\Models\\Property', 3, 'property/a5hRYb5KEsZiXfNfr6Vn3fWEr2c7vx.webp', 'local', '2025-08-22 11:40:00', '2025-08-22 11:40:00'),
(26, 'App\\Models\\Property', 3, 'property/XHw4vJZOUQhwLJmeO2x2RCN0NaTHpN.webp', 'local', '2025-08-22 11:40:00', '2025-08-22 11:40:00'),
(27, 'App\\Models\\Property', 4, 'property/YKq0dfd4SQCaGx8QK8RfOve875LFHY.webp', 'local', '2025-08-22 20:06:16', '2025-08-22 20:06:16'),
(28, 'App\\Models\\Property', 4, 'property/gXx01lXzN4y76LppwjOID8PcXuVpbB.webp', 'local', '2025-08-22 20:06:16', '2025-08-22 20:06:16'),
(29, 'App\\Models\\Property', 4, 'property/rRNp5v5vZRXqXqzMfXEy8vZ2lzxBXk.webp', 'local', '2025-08-22 20:06:16', '2025-08-22 20:06:16'),
(30, 'App\\Models\\Property', 5, 'property/Ime0htX3JtR3hQMbVQOnYYFCHsFpaf.webp', 'local', '2025-08-22 20:39:05', '2025-08-22 20:39:05'),
(31, 'App\\Models\\Property', 5, 'property/4uH6Y1kU56pYgI1d7s29ggNfHkJTUN.webp', 'local', '2025-08-22 20:39:05', '2025-08-22 20:39:05'),
(32, 'App\\Models\\Property', 5, 'property/U4ujNMKyOj8cUyrXfmJFyczYzbZ8t0.webp', 'local', '2025-08-22 20:39:05', '2025-08-22 20:39:05'),
(33, 'App\\Models\\Property', 5, 'property/ZQcBmw972irMiru3QQgMtod0EAzuwB.webp', 'local', '2025-08-22 20:39:05', '2025-08-22 20:39:05'),
(34, 'App\\Models\\Property', 5, 'property/2GEYnOxdJaG2g4ZnnDHhAiZcZCetvv.webp', 'local', '2025-08-22 20:39:05', '2025-08-22 20:39:05'),
(35, 'App\\Models\\Property', 5, 'property/Kz6ooy1nsPVAT6XR6fEfqAhrqwZYP8.webp', 'local', '2025-08-22 20:39:06', '2025-08-22 20:39:06'),
(36, 'App\\Models\\Property', 5, 'property/gG9InvSa9jyQmzTUSoAidRUfuMJqXf.webp', 'local', '2025-08-22 20:39:06', '2025-08-22 20:39:06'),
(37, 'App\\Models\\Property', 5, 'property/wdl7RiPcaI2cCs0BVHeAEtYQMAdpNA.webp', 'local', '2025-08-22 20:39:06', '2025-08-22 20:39:06'),
(38, 'App\\Models\\Property', 5, 'property/OwYAwjPiAMeTCJ0G82rw80l45Y1dsR.webp', 'local', '2025-08-22 20:39:06', '2025-08-22 20:39:06'),
(39, 'App\\Models\\Property', 5, 'property/MU3h9qebOcsU9dcYtgvCJfhupgYlMS.webp', 'local', '2025-08-22 20:39:06', '2025-08-22 20:39:06'),
(40, 'App\\Models\\Property', 6, 'property/QWPVbmGxLMsJXKstLjyJeLLuX9iQxm.webp', 'local', '2025-08-23 13:50:38', '2025-08-23 13:50:38'),
(41, 'App\\Models\\Property', 6, 'property/lGwfXsrTlyy2Dz7PZOHFC6eP8ZXLzo.webp', 'local', '2025-08-23 13:50:38', '2025-08-23 13:50:38'),
(42, 'App\\Models\\Property', 6, 'property/plxNHjaxXQTcsdJcGgIlXcRNzhPhoT.webp', 'local', '2025-08-23 13:50:38', '2025-08-23 13:50:38'),
(43, 'App\\Models\\Property', 6, 'property/0aWpBXtA9o2oQP2Yx9XgU3yhSwaypi.webp', 'local', '2025-08-23 13:50:38', '2025-08-23 13:50:38'),
(44, 'App\\Models\\Property', 6, 'property/vqW50O905EikFWOPpXcgl9c8EcM3VD.webp', 'local', '2025-08-23 13:50:39', '2025-08-23 13:50:39'),
(45, 'App\\Models\\Property', 7, 'property/zpIRfmIn00QylnZAYC2UENpLz03lWh.webp', 'local', '2025-08-23 16:28:36', '2025-08-23 16:28:36'),
(46, 'App\\Models\\Property', 7, 'property/WbP0oHmPbA6yqFnXKoGyHKbHHZ5fCv.webp', 'local', '2025-08-23 16:28:36', '2025-08-23 16:28:36'),
(47, 'App\\Models\\Property', 7, 'property/K9odYrICvCDeqpWO6vuSinHMMMQRLR.webp', 'local', '2025-08-23 16:28:36', '2025-08-23 16:28:36'),
(48, 'App\\Models\\Property', 7, 'property/A3o5zDvYkugS4YfflHhfmlBbctptUY.webp', 'local', '2025-08-23 16:28:36', '2025-08-23 16:28:36'),
(49, 'App\\Models\\Property', 8, 'property/RpzFqB5ZYIW14H5qcQTQ0yuncGW5zX.webp', 'local', '2025-08-23 17:42:44', '2025-08-23 17:42:44'),
(50, 'App\\Models\\Property', 8, 'property/4Lnif1RtloHg9wY0wBzxh8om5fW8HZ.webp', 'local', '2025-08-23 17:42:44', '2025-08-23 17:42:44'),
(51, 'App\\Models\\Property', 8, 'property/zklBknAugoZ4aW15jRCoUPFe49wYpR.webp', 'local', '2025-08-23 17:42:45', '2025-08-23 17:42:45'),
(52, 'App\\Models\\Property', 8, 'property/ZYVqsDDOHMEAi8xUxv7TDfOiQEnzee.webp', 'local', '2025-08-23 17:42:45', '2025-08-23 17:42:45'),
(53, 'App\\Models\\Property', 8, 'property/vrQhxBbClcth2ijDQDmZpKtHBhIyYF.webp', 'local', '2025-08-23 17:42:45', '2025-08-23 17:42:45'),
(54, 'App\\Models\\Property', 8, 'property/8nDtqQUjVoJQJCFUwPakHPrGyCJ9wC.webp', 'local', '2025-08-23 17:42:45', '2025-08-23 17:42:45'),
(55, 'App\\Models\\Property', 9, 'property/XJ164r6KPNqBayJKI4vQIcYpBKz085.webp', 'local', '2025-08-23 20:54:23', '2025-08-23 20:54:23'),
(56, 'App\\Models\\Property', 9, 'property/QwTW3Kh4O9fgQLFgk74ysKOWBJTyfU.webp', 'local', '2025-08-23 20:54:23', '2025-08-23 20:54:23'),
(57, 'App\\Models\\Property', 9, 'property/Wvd3CdkXl1Kv0VJHOr2a4qr0mjLEqb.webp', 'local', '2025-08-23 20:54:23', '2025-08-23 20:54:23'),
(58, 'App\\Models\\Property', 10, 'property/36GNLBahQTF4CfugW2GwdJvxeamYGh.webp', 'local', '2025-08-23 21:17:27', '2025-08-23 21:17:27'),
(59, 'App\\Models\\Property', 10, 'property/YoCHH1nsVjaieOAkL4lY80iCxnvZZX.webp', 'local', '2025-08-23 21:17:27', '2025-08-23 21:17:27'),
(60, 'App\\Models\\Property', 10, 'property/SiUzRrUOxIsuMgmO6YByY89wLoPmuW.webp', 'local', '2025-08-23 21:17:27', '2025-08-23 21:17:27'),
(61, 'App\\Models\\Property', 11, 'property/lcV3ZeX4MzwMi8Iu6rGd1OtbDkdQXQ.webp', 'local', '2025-08-23 21:28:02', '2025-08-23 21:28:02'),
(62, 'App\\Models\\Property', 11, 'property/92g5yNdni6juWqCWKRwMhbQ9cIX0pH.webp', 'local', '2025-08-23 21:28:02', '2025-08-23 21:28:02'),
(63, 'App\\Models\\Property', 11, 'property/y6A9VcCe7ZBFo3hotVV91Tpzv3Ook1.webp', 'local', '2025-08-23 21:28:02', '2025-08-23 21:28:02'),
(64, 'App\\Models\\Property', 12, 'property/rHI2SZjGUymV5szJ4AE6qPSIDVMBdd.webp', 'local', '2025-08-24 04:08:47', '2025-08-24 04:08:47'),
(65, 'App\\Models\\Property', 12, 'property/6nrjVkIEuLo55CUqjw8MUFKQa26rxv.webp', 'local', '2025-08-24 04:08:47', '2025-08-24 04:08:47'),
(66, 'App\\Models\\Property', 12, 'property/o3Gc7oDNl1FatnnaOS4MCCq7b33uHu.webp', 'local', '2025-08-24 04:08:47', '2025-08-24 04:08:47'),
(67, 'App\\Models\\Property', 13, 'property/qrZTWfzKh897PnsbuqeXVykCeQaQum.webp', 'local', '2025-08-24 04:15:28', '2025-08-24 04:15:28'),
(68, 'App\\Models\\Property', 13, 'property/u0XILcKA4RaVTOMI03h5lQLpa0cAWM.webp', 'local', '2025-08-24 04:15:28', '2025-08-24 04:15:28'),
(69, 'App\\Models\\Property', 13, 'property/gDJZOiySMGVrvabhIHFiBjXD1hmQc5.webp', 'local', '2025-08-24 04:15:28', '2025-08-24 04:15:28'),
(70, 'App\\Models\\Property', 14, 'property/PxGKijaDLuLzs5oLFp7uZ1SMsqmS2H.webp', 'local', '2025-08-24 04:26:08', '2025-08-24 04:26:08'),
(71, 'App\\Models\\Property', 14, 'property/cNAJfii8b6bGgdAXTxQBOLQxJ4NSIV.webp', 'local', '2025-08-24 04:26:09', '2025-08-24 04:26:09'),
(72, 'App\\Models\\Property', 14, 'property/3bYwMeJmnA4JQveQV17adOtQaDX4gw.webp', 'local', '2025-08-24 04:26:09', '2025-08-24 04:26:09'),
(73, 'App\\Models\\Property', 14, 'property/ulfe90IkCT9pY1PASjsIRBHsgVavFO.webp', 'local', '2025-08-24 04:26:09', '2025-08-24 04:26:09'),
(74, 'App\\Models\\Property', 14, 'property/HCDJ8OOfQ8Hnk9VpUEkGlAlS3qPoh7.webp', 'local', '2025-08-24 04:26:10', '2025-08-24 04:26:10'),
(75, 'App\\Models\\Property', 14, 'property/bAMmZ6FPLRrdFM08hTRUlqavXF5bYZ.webp', 'local', '2025-08-24 04:26:10', '2025-08-24 04:26:10'),
(76, 'App\\Models\\Property', 14, 'property/cChTFnD0UBfWkKnR76sETlPntvJMeR.webp', 'local', '2025-08-24 04:26:10', '2025-08-24 04:26:10'),
(77, 'App\\Models\\Property', 15, 'property/VLu2k6fS9RGBywVzj6IOHfMqw02vZI.webp', 'local', '2025-08-24 04:33:11', '2025-08-24 04:33:11'),
(78, 'App\\Models\\Property', 15, 'property/BE8GlAJNkTcCURuOqxgHsRE0BpcnRP.webp', 'local', '2025-08-24 04:33:11', '2025-08-24 04:33:11'),
(79, 'App\\Models\\Property', 15, 'property/TVaJhAHeG5qIAL5QiKiVGTbiFhQstK.webp', 'local', '2025-08-24 04:33:12', '2025-08-24 04:33:12'),
(80, 'App\\Models\\Property', 15, 'property/bSgwIc0fe1YLcYbIhBNpv2GXKHLA5o.webp', 'local', '2025-08-24 04:33:12', '2025-08-24 04:33:12'),
(81, 'App\\Models\\Property', 15, 'property/1JDBbAjM6oHZyn08DV982FVw1McZdh.webp', 'local', '2025-08-24 04:33:12', '2025-08-24 04:33:12'),
(82, 'App\\Models\\Property', 15, 'property/8IoAH3YFBjCImlH7LVpART3RHlq2Ao.webp', 'local', '2025-08-24 04:33:12', '2025-08-24 04:33:12'),
(83, 'App\\Models\\Property', 15, 'property/Us56gZlFrCRPJLcHNd16ayURd9LfoZ.webp', 'local', '2025-08-24 04:33:12', '2025-08-24 04:33:12'),
(84, 'App\\Models\\Property', 15, 'property/LyY4rp2Ds02CiCjSlWw7zSgFbRLkCr.webp', 'local', '2025-08-24 04:33:12', '2025-08-24 04:33:12'),
(85, 'App\\Models\\Property', 15, 'property/EhB260ykVWG6z6hzWF4cLIJZ0LsmeF.webp', 'local', '2025-08-24 04:33:13', '2025-08-24 04:33:13'),
(86, 'App\\Models\\Property', 15, 'property/SgkHEcws3wEJGanYFLYumFmGCwlxIs.webp', 'local', '2025-08-24 04:33:13', '2025-08-24 04:33:13'),
(87, 'App\\Models\\Property', 15, 'property/H2RJN9WZiWdTTWqHpTx1wfbeH2TLd0.webp', 'local', '2025-08-24 04:33:13', '2025-08-24 04:33:13'),
(88, 'App\\Models\\Property', 15, 'property/zLJGQk9uCeTqqQKDaPUqJcfo99TUb8.webp', 'local', '2025-08-24 04:33:13', '2025-08-24 04:33:13'),
(89, 'App\\Models\\Property', 16, 'property/cCxFrQfFSXzKHhcqjurEMu6oFwNEIn.webp', 'local', '2025-08-24 04:39:28', '2025-08-24 04:39:28'),
(90, 'App\\Models\\Property', 16, 'property/dqNJZ2Jdqw8kJms3tSbTC50IXWSrGR.webp', 'local', '2025-08-24 04:39:28', '2025-08-24 04:39:28'),
(91, 'App\\Models\\Property', 16, 'property/x5YpZw3i6kltMoQRdyMX0DcTHsh5Cf.webp', 'local', '2025-08-24 04:39:29', '2025-08-24 04:39:29'),
(92, 'App\\Models\\Property', 16, 'property/b1LsZB7AcwgYZkQy1QYOJtv6gV21j4.webp', 'local', '2025-08-24 04:39:29', '2025-08-24 04:39:29'),
(93, 'App\\Models\\Property', 16, 'property/pdbPDB4GuzymSchyQ8JzQ8MzT9hqfW.webp', 'local', '2025-08-24 04:39:29', '2025-08-24 04:39:29'),
(94, 'App\\Models\\Property', 16, 'property/OuSCrXUAJAgXHa87wgeqNG4roBJl6W.webp', 'local', '2025-08-24 04:39:29', '2025-08-24 04:39:29'),
(95, 'App\\Models\\Property', 17, 'property/9erf49feFe0wNYyYl4CIe31VyVkJ5R.webp', 'local', '2025-08-24 04:50:23', '2025-08-24 04:50:23'),
(96, 'App\\Models\\Property', 17, 'property/POBURFzCpLr9NUHQSQkxFo2EqLWewh.webp', 'local', '2025-08-24 04:50:24', '2025-08-24 04:50:24'),
(97, 'App\\Models\\Property', 17, 'property/3lMmH7bG2VfB6ySmztxWfgUEtiT0Sk.webp', 'local', '2025-08-24 04:50:24', '2025-08-24 04:50:24'),
(98, 'App\\Models\\Property', 17, 'property/Eqeu9jGkASfY7H0cbxh0yGd5Yz6P5g.webp', 'local', '2025-08-24 04:50:24', '2025-08-24 04:50:24'),
(99, 'App\\Models\\Property', 17, 'property/RYKcr6DCQpgOzPrBo35diz9BkVHbWZ.webp', 'local', '2025-08-24 04:50:25', '2025-08-24 04:50:25'),
(100, 'App\\Models\\Property', 17, 'property/pOxImZInbvwTOTKrA7E10b4Jr5KaLm.webp', 'local', '2025-08-24 04:50:25', '2025-08-24 04:50:25'),
(101, 'App\\Models\\Property', 17, 'property/a8c1hDqfZNLTYsgrM9WPyK77CkOqMc.webp', 'local', '2025-08-24 04:50:26', '2025-08-24 04:50:26'),
(102, 'App\\Models\\Property', 17, 'property/b8RRaK968lVcthVpRZ0PtgADLkctfm.webp', 'local', '2025-08-24 04:50:26', '2025-08-24 04:50:26'),
(103, 'App\\Models\\Property', 17, 'property/GHbi6VthRayf5EU3Y0NoXPDt07gqia.webp', 'local', '2025-08-24 04:50:26', '2025-08-24 04:50:26'),
(104, 'App\\Models\\Property', 17, 'property/9kMMHzIKM8lmWofY0EhrdC2ccq9izt.webp', 'local', '2025-08-24 04:50:27', '2025-08-24 04:50:27'),
(105, 'App\\Models\\Property', 17, 'property/PdyMWX1h33KqtPp6Y8tAIc3VdcLDgD.webp', 'local', '2025-08-24 04:50:27', '2025-08-24 04:50:27'),
(106, 'App\\Models\\Property', 17, 'property/dOLfSmLlClQZyRV5vcVlfI2Vyv6d18.webp', 'local', '2025-08-24 04:50:27', '2025-08-24 04:50:27'),
(107, 'App\\Models\\Property', 17, 'property/5gpeqR9hOqQMqxYOafdCFa8sVl003u.webp', 'local', '2025-08-24 04:50:28', '2025-08-24 04:50:28'),
(108, 'App\\Models\\Property', 17, 'property/738LI4n61lGhlA8cEGcUy6sI8oWOh7.webp', 'local', '2025-08-24 04:50:28', '2025-08-24 04:50:28'),
(109, 'App\\Models\\Property', 17, 'property/kDXrTJ86O26Ptaaa2qdA9bgAx5GnWP.webp', 'local', '2025-08-24 04:50:28', '2025-08-24 04:50:28'),
(110, 'App\\Models\\Property', 17, 'property/6DLGqAQMgECemnShctes39cm52nbkW.webp', 'local', '2025-08-24 04:50:29', '2025-08-24 04:50:29'),
(111, 'App\\Models\\Property', 18, 'property/TZSjARGIFpWzVoNGIeApUGMPKjhBy4.webp', 'local', '2025-08-24 05:04:06', '2025-08-24 05:04:06'),
(112, 'App\\Models\\Property', 18, 'property/RkLbzUut9YS0hNHEHB8p5LqHvu7eak.webp', 'local', '2025-08-24 05:04:07', '2025-08-24 05:04:07'),
(113, 'App\\Models\\Property', 18, 'property/N1mqjhNAOh05JajaKsT7kqzNCsjwW3.webp', 'local', '2025-08-24 05:04:07', '2025-08-24 05:04:07'),
(114, 'App\\Models\\Property', 18, 'property/CzNXrOxEX0GGLLhRzW9pdkGCGDuS6c.webp', 'local', '2025-08-24 05:04:07', '2025-08-24 05:04:07'),
(115, 'App\\Models\\Property', 18, 'property/JFcjyMliEh0tATiRQTi1Jc2e6H7AuH.webp', 'local', '2025-08-24 05:04:08', '2025-08-24 05:04:08'),
(116, 'App\\Models\\Property', 18, 'property/Nw2FQKMeCxAaW6pdBPcQzADy2dxWJz.webp', 'local', '2025-08-24 05:04:08', '2025-08-24 05:04:08'),
(117, 'App\\Models\\Property', 18, 'property/GY3LBP35JjNK5xaMa4Qe7nzEc08Zbg.webp', 'local', '2025-08-24 05:04:08', '2025-08-24 05:04:08'),
(118, 'App\\Models\\Property', 18, 'property/Jc47bPw1INCKauYo8xpr6qD96TgXX8.webp', 'local', '2025-08-24 05:04:09', '2025-08-24 05:04:09'),
(119, 'App\\Models\\Property', 5, 'property/e9YYutNS6G76Wc0n3AMTJyzAi8kSW6.webp', 'local', '2025-08-25 12:45:49', '2025-08-25 12:45:49'),
(120, 'App\\Models\\Property', 5, 'property/zxBISCePTN7O9znHeqX9LeJm0x3m6p.webp', 'local', '2025-08-25 12:45:49', '2025-08-25 12:45:49'),
(121, 'App\\Models\\Property', 5, 'property/g6vavl8ZApYAg2F6KdSD4nxmC6HcWa.webp', 'local', '2025-08-25 12:45:50', '2025-08-25 12:45:50'),
(122, 'App\\Models\\Property', 5, 'property/JvWpFFGu8Qp7vBQiZY7GRg5kRyv4gM.webp', 'local', '2025-08-25 12:45:50', '2025-08-25 12:45:50'),
(123, 'App\\Models\\Property', 5, 'property/5L3vUzrboHsz4rIzv8RmMb6rQM40Qk.webp', 'local', '2025-08-25 12:45:50', '2025-08-25 12:45:50'),
(124, 'App\\Models\\Property', 5, 'property/UZepsZfwQ7I89DzCt359Zphyk8dFtq.webp', 'local', '2025-08-25 12:45:50', '2025-08-25 12:45:50'),
(125, 'App\\Models\\Property', 5, 'property/RXRTKkscUsB6N14Gc7evDxNFtCWYMT.webp', 'local', '2025-08-25 12:45:50', '2025-08-25 12:45:50'),
(126, 'App\\Models\\Property', 5, 'property/McsGvfaNTxFkbUJz6Vpmg8TYIDp4rl.webp', 'local', '2025-08-25 12:45:51', '2025-08-25 12:45:51'),
(127, 'App\\Models\\Property', 5, 'property/NXgPIyRBYqrHLHXcgug89N0vtbo4rX.webp', 'local', '2025-08-25 12:45:51', '2025-08-25 12:45:51'),
(128, 'App\\Models\\Property', 5, 'property/N0LffHaxuaS0zyjcDUS6xs12CIOTtr.webp', 'local', '2025-08-25 12:45:51', '2025-08-25 12:45:51'),
(129, 'App\\Models\\Property', 5, 'property/TmIHubt6guHkh05qpwojS5w1lUkkah.webp', 'local', '2025-08-25 12:53:29', '2025-08-25 12:53:29'),
(130, 'App\\Models\\Property', 5, 'property/UFocp6WOsbyOnsolLfyjNuzBoxiljl.webp', 'local', '2025-08-25 12:53:30', '2025-08-25 12:53:30'),
(131, 'App\\Models\\Property', 5, 'property/tc2sg3mC33kceP4r9ERCbsHU5FRtiV.webp', 'local', '2025-08-25 12:53:30', '2025-08-25 12:53:30'),
(132, 'App\\Models\\Property', 5, 'property/UdrlBY09zAqZ0FRgnH5spF2aaiic7n.webp', 'local', '2025-08-25 12:53:30', '2025-08-25 12:53:30'),
(133, 'App\\Models\\Property', 5, 'property/Q5ib8TfqjAAPLbFr6BnLneGHHz5ylX.webp', 'local', '2025-08-25 12:53:30', '2025-08-25 12:53:30'),
(134, 'App\\Models\\Property', 5, 'property/g3jCjZTqlApVK9BGYtAlYymvcnigHB.webp', 'local', '2025-08-25 12:53:30', '2025-08-25 12:53:30'),
(135, 'App\\Models\\Property', 5, 'property/eCVnGjoYIMehWbrgW1RGgbtKYFA2Xi.webp', 'local', '2025-08-25 12:53:31', '2025-08-25 12:53:31'),
(136, 'App\\Models\\Property', 5, 'property/HnIAIzvtFKGndP9ZIp6cxbx5sitfwe.webp', 'local', '2025-08-25 12:53:31', '2025-08-25 12:53:31'),
(137, 'App\\Models\\Property', 5, 'property/OZQt3XOkEEPFAlulU1qFm7J05KxSPX.webp', 'local', '2025-08-25 12:53:31', '2025-08-25 12:53:31'),
(138, 'App\\Models\\Property', 5, 'property/EoUK9rHLSljVNSTpikrojBeJdHXm0m.webp', 'local', '2025-08-25 12:53:31', '2025-08-25 12:53:31'),
(139, 'App\\Models\\Property', 4, 'property/ri7NHkvPtO69uLkrq8elpnw3IzIOKy.webp', 'local', '2025-08-25 13:07:20', '2025-08-25 13:07:20'),
(140, 'App\\Models\\Property', 4, 'property/RN4JlHhTLPEz7eskwztjedICqmwP0X.webp', 'local', '2025-08-25 13:07:20', '2025-08-25 13:07:20'),
(141, 'App\\Models\\Property', 4, 'property/eGIaZcGEibk8y3Vn7Z5lleJjn9VNFE.webp', 'local', '2025-08-25 13:07:20', '2025-08-25 13:07:20'),
(142, 'App\\Models\\Property', 19, 'property/ZhabO2qljR5svKGRqjGW32zf1MitJz.webp', 'local', '2025-08-25 19:18:59', '2025-08-25 19:18:59'),
(143, 'App\\Models\\Property', 19, 'property/lkObnPCRxoamcB7O7G7Axj6fRhaPDG.webp', 'local', '2025-08-25 19:18:59', '2025-08-25 19:18:59'),
(144, 'App\\Models\\Property', 19, 'property/NmpG94kugEkwjYPzTkOS0OdihO5YG6.webp', 'local', '2025-08-25 19:19:00', '2025-08-25 19:19:00'),
(145, 'App\\Models\\Property', 19, 'property/xkmxTs9pdIjOzTIKhkl9qxdRWSCBm6.webp', 'local', '2025-08-25 19:19:00', '2025-08-25 19:19:00'),
(146, 'App\\Models\\Property', 19, 'property/iPMDbmfYZG5jLb4xxajlNkBdi89Oia.webp', 'local', '2025-08-25 19:19:00', '2025-08-25 19:19:00'),
(147, 'App\\Models\\Property', 19, 'property/RuFVgeYFmSmo34gi92rFNDLxU0AkPF.webp', 'local', '2025-08-25 19:19:01', '2025-08-25 19:19:01'),
(148, 'App\\Models\\Property', 19, 'property/GNEjhi4HPxlT4ycLkt1oxvKwW3eSGy.webp', 'local', '2025-08-25 19:19:01', '2025-08-25 19:19:01'),
(149, 'App\\Models\\Property', 19, 'property/HOxwqWwMIiLD5fKDLyrCLOOm4MSY4h.webp', 'local', '2025-08-25 19:19:01', '2025-08-25 19:19:01'),
(150, 'App\\Models\\Property', 20, 'property/A4QIIn53CTsri1UmS5dC6a7puYry1t.webp', 'local', '2025-08-26 15:50:44', '2025-08-26 15:50:44'),
(151, 'App\\Models\\Property', 20, 'property/XuRMnZmIZfwmpUcVcbvozUSnb9rl30.webp', 'local', '2025-08-26 15:50:44', '2025-08-26 15:50:44'),
(152, 'App\\Models\\Property', 20, 'property/xymdtzpe5bhm5nnJPfHg7TgFAmHDym.webp', 'local', '2025-08-26 15:50:44', '2025-08-26 15:50:44'),
(153, 'App\\Models\\Property', 20, 'property/Fipp2oCLVn87yWXOF1TtM7pa4GfCtQ.webp', 'local', '2025-08-26 15:50:45', '2025-08-26 15:50:45'),
(154, 'App\\Models\\Property', 20, 'property/lvz707rSgIkr0IYDv9PCwxYPpXlYh6.webp', 'local', '2025-08-26 15:50:45', '2025-08-26 15:50:45'),
(155, 'App\\Models\\Property', 21, 'property/RNV2Lp0TbUiVQAMs1LuO18SJGMO6Pt.webp', 'local', '2025-08-26 16:22:50', '2025-08-26 16:22:50'),
(156, 'App\\Models\\Property', 21, 'property/crQv6pJovZSmGKBZycYy9Da3L2sFL1.webp', 'local', '2025-08-26 16:22:50', '2025-08-26 16:22:50'),
(157, 'App\\Models\\Property', 21, 'property/HNytBt7Y2EFXqGeXx4veaiuMe7BKcd.webp', 'local', '2025-08-26 16:22:50', '2025-08-26 16:22:50'),
(158, 'App\\Models\\Property', 21, 'property/Ek4tE9xUFFCZZVHZiuuRpVQaIuckql.webp', 'local', '2025-08-26 16:22:50', '2025-08-26 16:22:50'),
(159, 'App\\Models\\Property', 21, 'property/UQnY8oq3vUdkVk4yPP9K866mNtyZNz.webp', 'local', '2025-08-26 16:22:50', '2025-08-26 16:22:50'),
(160, 'App\\Models\\Property', 21, 'property/khwNztzUYsBWcvWutDRvPoo9CqG1iP.webp', 'local', '2025-08-26 16:22:50', '2025-08-26 16:22:50'),
(161, 'App\\Models\\Property', 21, 'property/JnvP9LOe4WSPu9ywa1K6PilzVTspmK.webp', 'local', '2025-08-26 16:22:50', '2025-08-26 16:22:50'),
(162, 'App\\Models\\Property', 22, 'property/ypMbZOpaJrPqjph9Gu1REcxIo0XXwi.webp', 'local', '2025-08-26 16:32:55', '2025-08-26 16:32:55'),
(163, 'App\\Models\\Property', 22, 'property/Sg37KBbx3sReVJOOlPSMMnjf1Wos1G.webp', 'local', '2025-08-26 16:32:55', '2025-08-26 16:32:55'),
(164, 'App\\Models\\Property', 22, 'property/lmN1Y4eRFDc8noEY5mf19yZA4QW0Md.webp', 'local', '2025-08-26 16:32:55', '2025-08-26 16:32:55'),
(165, 'App\\Models\\Property', 22, 'property/6KsCYdjZJQv6hs0yskm5JiPMGizNhs.webp', 'local', '2025-08-26 16:32:55', '2025-08-26 16:32:55'),
(166, 'App\\Models\\Property', 22, 'property/6VYoHGDEgt4wy74HEnE3snXfRS8Hc0.webp', 'local', '2025-08-26 16:32:56', '2025-08-26 16:32:56'),
(167, 'App\\Models\\Property', 23, 'property/EH4YOOgtBiuA9tAlHH8AT3A4tFBgMi.webp', 'local', '2025-08-26 17:01:15', '2025-08-26 17:01:15');

-- --------------------------------------------------------

--
-- Table structure for table `investments`
--

CREATE TABLE `investments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `property_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT NULL,
  `total_installment_late_fee` decimal(11,2) DEFAULT NULL,
  `profit` decimal(11,2) NOT NULL DEFAULT 0.00,
  `profit_type` int(11) DEFAULT NULL,
  `net_profit` decimal(11,2) DEFAULT NULL,
  `loss` decimal(8,2) NOT NULL DEFAULT 0.00,
  `loss_type` int(11) DEFAULT NULL,
  `net_loss` decimal(11,2) DEFAULT NULL,
  `is_return_type` int(11) DEFAULT NULL,
  `return_time` int(11) DEFAULT NULL,
  `return_time_type` varchar(60) DEFAULT NULL,
  `how_many_times` int(11) DEFAULT NULL,
  `return_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_return_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_installment` tinyint(1) DEFAULT NULL,
  `total_installments` int(11) DEFAULT NULL,
  `due_installments` int(11) DEFAULT NULL,
  `next_installment_date_start` timestamp NOT NULL DEFAULT current_timestamp(),
  `next_installment_date_end` timestamp NOT NULL DEFAULT current_timestamp(),
  `invest_status` int(11) DEFAULT NULL COMMENT '0=due, 1=complete',
  `payment_status` int(11) DEFAULT NULL COMMENT '1=complete, 2=pending, 3=rejected',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 => Running, 1=> completed',
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1= active, 0 = deactive',
  `deactive_reason` longtext DEFAULT NULL,
  `capital_back` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = YES & 0 = NO',
  `trx` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `maturity` int(11) DEFAULT NULL,
  `recurring_time` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `investments`
--

INSERT INTO `investments` (`id`, `user_id`, `property_id`, `amount`, `total_installment_late_fee`, `profit`, `profit_type`, `net_profit`, `loss`, `loss_type`, `net_loss`, `is_return_type`, `return_time`, `return_time_type`, `how_many_times`, `return_date`, `last_return_date`, `is_installment`, `total_installments`, `due_installments`, `next_installment_date_start`, `next_installment_date_end`, `invest_status`, `payment_status`, `status`, `is_active`, `deactive_reason`, `capital_back`, `trx`, `deleted_at`, `maturity`, `recurring_time`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 25000.00, NULL, 10.00, 1, 2500.00, 0.00, NULL, 0.00, 1, 6, 'months', NULL, '2026-07-31 16:00:00', '2025-08-22 16:00:17', 0, NULL, NULL, '2025-08-22 16:00:17', '2025-08-22 16:00:17', 1, 1, 0, 1, NULL, 1, 'EKTXKEV1NQP9', NULL, NULL, NULL, '2025-08-22 16:00:17', '2025-08-22 16:00:17');

-- --------------------------------------------------------

--
-- Table structure for table `investor_reviews`
--

CREATE TABLE `investor_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `property_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rating2` double DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `in_app_notifications`
--

CREATE TABLE `in_app_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `in_app_notificationable_id` int(11) NOT NULL,
  `in_app_notificationable_type` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kycs`
--

CREATE TABLE `kycs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `input_form` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0 COMMENT '1 => Active, 0 => Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kycs`
--

INSERT INTO `kycs` (`id`, `name`, `slug`, `input_form`, `status`, `created_at`, `updated_at`) VALUES
(12, 'NID Vefication', 'nid-vefication', '{\"FullName\":{\"field_name\":\"FullName\",\"field_label\":\"Full Name\",\"type\":\"text\",\"validation\":\"required\"},\"FathersName\":{\"field_name\":\"FathersName\",\"field_label\":\"Father\'s Name\",\"type\":\"text\",\"validation\":\"required\"},\"MothersName\":{\"field_name\":\"MothersName\",\"field_label\":\"Mother\'s Name\",\"type\":\"text\",\"validation\":\"required\"},\"NIDNumber\":{\"field_name\":\"NIDNumber\",\"field_label\":\"NID Number\",\"type\":\"number\",\"validation\":\"required\"},\"NIDPhotoFrontPage\":{\"field_name\":\"NIDPhotoFrontPage\",\"field_label\":\"NID Photo (Front Page)\",\"type\":\"file\",\"validation\":\"required\"},\"NIDPhotoRearPage\":{\"field_name\":\"NIDPhotoRearPage\",\"field_label\":\"NID Photo (Rear Page)\",\"type\":\"file\",\"validation\":\"required\"},\"Address\":{\"field_name\":\"Address\",\"field_label\":\"Address\",\"type\":\"textarea\",\"validation\":\"required\"},\"DateOfBirth\":{\"field_name\":\"DateOfBirth\",\"field_label\":\"Date Of Birth\",\"type\":\"date\",\"validation\":\"required\"}}', 1, '2023-09-26 20:53:50', '2024-07-10 04:37:59'),
(13, 'Address Verification', 'address-verification', '{\"Name\":{\"field_name\":\"Name\",\"field_label\":\"Name\",\"type\":\"text\",\"validation\":\"required\"},\"PermanentAddress\":{\"field_name\":\"PermanentAddress\",\"field_label\":\"Permanent Address\",\"type\":\"text\",\"validation\":\"required\"}}', 1, '2023-10-22 02:35:17', '2023-10-22 02:35:17'),
(14, 'Passport Verification', 'passport-verification', '{\"Name\":{\"field_name\":\"Name\",\"field_label\":\"Name\",\"type\":\"text\",\"validation\":\"required\"},\"PN\":{\"field_name\":\"PN\",\"field_label\":\"PN\",\"type\":\"text\",\"validation\":\"required\"}}', 0, '2023-12-18 06:28:16', '2024-11-05 07:15:16');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_name` varchar(20) DEFAULT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `flag_driver` varchar(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 => Inactive, 1 => Active',
  `rtl` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 => Inactive, 1 => Active ',
  `default_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `short_name`, `flag`, `flag_driver`, `status`, `rtl`, `default_status`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 'language/Tffwh41UiRo9GqB9P9OHiWP7R5lujb.avif', 'local', 1, 0, 1, '2023-06-16 22:35:53', '2024-03-04 07:09:56');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_modes`
--

CREATE TABLE `maintenance_modes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image_driver` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maintenance_modes`
--

INSERT INTO `maintenance_modes` (`id`, `heading`, `description`, `image`, `image_driver`, `created_at`, `updated_at`) VALUES
(1, 'The website under maintenance!', '<p>We are currently undergoing scheduled maintenance to improve our services and enhance your user experience. During this time, our website/system will be temporarily unavailable.\r\n</p><p><br></p><p>\r\nWe apologize for any inconvenience this may cause and appreciate your patience. Please rest assured that we are working diligently to complete the maintenance as quickly as possible.</p>', 'maintenanceMode/3jXAnm42OZuYy3kVDcHKUjW3gyiG8eSo96rlgg19.png', 'local', '2023-10-03 22:44:32', '2024-02-05 04:00:13');

-- --------------------------------------------------------

--
-- Table structure for table `manage_menus`
--

CREATE TABLE `manage_menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `template_name` varchar(255) DEFAULT NULL,
  `menu_section` varchar(50) DEFAULT NULL,
  `menu_items` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manage_menus`
--

INSERT INTO `manage_menus` (`id`, `template_name`, `menu_section`, `menu_items`, `created_at`, `updated_at`) VALUES
(1, 'light', 'header', '[\"home\",\"about\",\"Property\",\"Blog\",\"faq\",\"contact\"]', '2024-10-29 03:48:15', '2024-10-30 07:23:44'),
(2, 'light', 'footer', '{\"useful_link\":[\"home\",\"about\",\"contact\",\"privacy policy\",\"terms and conditions\"]}', '2024-10-30 01:27:49', '2024-10-30 07:14:55'),
(3, 'green', 'header', '[\"home\",\"about\",\"Property\",\"faq\",\"contact\"]', '2024-11-10 04:13:13', '2025-08-23 08:16:50'),
(4, 'green', 'footer', '{\"useful_link\":[\"home\",\"blog\",\"faq\",\"contact\"],\"support_link\":[\"privacy policy\",\"terms and conditions\"]}', '2024-11-10 04:14:21', '2024-11-11 02:21:34');

-- --------------------------------------------------------

--
-- Table structure for table `manage_times`
--

CREATE TABLE `manage_times` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `time` int(11) DEFAULT NULL,
  `time_type` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manage_times`
--

INSERT INTO `manage_times` (`id`, `time`, `time_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 6, 'months', 1, '2023-01-26 05:00:50', '2023-02-05 04:12:55'),
(2, 1, 'years', 1, '2023-01-26 05:00:55', '2023-04-08 02:55:35'),
(3, 1, 'months', 1, '2023-01-26 05:01:02', '2023-01-26 05:06:38'),
(4, 3, 'months', 1, '2023-01-26 05:01:08', '2023-02-05 04:12:45'),
(10, 1, 'days', 1, '2023-04-30 06:01:29', '2023-09-05 06:53:33'),
(11, 2, 'days', 1, '2023-04-30 06:01:50', '2023-09-05 06:53:45'),
(12, 3, 'days', 1, '2023-09-05 06:54:04', '2023-09-05 06:54:04'),
(13, 7, 'days', 1, '2023-09-05 06:54:08', '2023-09-05 06:54:08'),
(14, 14, 'days', 1, '2025-08-29 17:39:04', '2025-08-29 17:39:04'),
(15, 21, 'days', 1, '2025-08-29 17:39:14', '2025-08-29 17:39:14'),
(16, 6, 'months', 1, '2025-08-29 17:39:49', '2025-08-29 17:39:49'),
(17, 2, 'years', 1, '2025-08-29 17:40:24', '2025-08-29 17:40:24'),
(18, 5, 'years', 1, '2025-08-29 17:40:52', '2025-08-29 17:40:52'),
(19, 3, 'years', 1, '2025-08-29 17:41:18', '2025-08-29 17:41:18');

-- --------------------------------------------------------

--
-- Table structure for table `manual_sms_configs`
--

CREATE TABLE `manual_sms_configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `action_method` varchar(255) DEFAULT NULL,
  `action_url` varchar(255) DEFAULT NULL,
  `header_data` text DEFAULT NULL,
  `param_data` text DEFAULT NULL,
  `form_data` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manual_sms_configs`
--

INSERT INTO `manual_sms_configs` (`id`, `action_method`, `action_url`, `header_data`, `param_data`, `form_data`, `created_at`, `updated_at`) VALUES
(1, 'POST', 'https://rest.nexmo.com/sms/json', '{\"Content-Type\":\"application\\/x-www-form-urlencoded\"}', NULL, '{\"from\":\"Rownak\",\"text\":\"[[message]]\",\"to\":\"[[receiver]]\",\"api_key\":\"930cc608\",\"api_secret\":\"2pijsaMOUw5YKOK5\"}', NULL, '2023-10-19 03:03:34');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_06_07_064911_create_admins_table', 2),
(6, '2014_10_12_100000_create_password_resets_table', 3),
(7, '2023_06_10_061241_create_basic_controls_table', 4),
(8, '2023_06_10_123329_create_file_storages_table', 4),
(9, '2023_06_15_102426_create_firebase_notifies_table', 5),
(10, '2023_06_17_085447_create_languages_table', 6),
(11, '2023_06_19_082042_create_sms_controls_table', 7),
(12, '2023_06_20_080624_create_support_tickets_table', 8),
(13, '2023_06_20_080731_create_support_ticket_messages_table', 8),
(14, '2023_06_20_080833_create_support_ticket_attachments_table', 8),
(15, '2023_06_20_212143_create_fire_base_tokens_table', 9),
(16, '2023_06_21_124322_create_in_app_notifications_table', 10),
(17, '2023_06_22_084256_create_gateways_table', 11),
(18, '2023_07_15_162549_create_kycs_table', 12),
(19, '2023_07_17_094844_create_manage_pages_table', 13),
(20, '2023_07_17_101515_create_manage_sections_table', 14),
(21, '2023_07_18_084411_create_pages_table', 15),
(22, '2023_07_22_130913_create_manage_menus_table', 16),
(23, '2023_07_26_193156_create_email_controls_table', 17),
(24, '2023_08_10_153005_create_google_sheet_apis_table', 18),
(25, '2023_08_20_140757_create_contents_table', 19),
(26, '2023_08_20_140808_create_content_details_table', 19),
(27, '2023_08_20_140815_create_content_media_table', 19),
(28, '2023_09_07_151706_create_user_logins_table', 20),
(29, '2023_09_09_105217_create_transactions_table', 21),
(30, '2023_09_09_105305_create_payout_logs_table', 21),
(31, '2023_09_09_105353_create_funds_table', 21),
(32, '2023_09_19_131540_create_deposits_table', 22),
(33, '2023_09_20_093121_create_payouts_table', 23),
(34, '2023_09_21_085103_create_wallets_table', 24),
(35, '2023_10_01_125109_create_pages_table', 25),
(36, '2023_10_02_162152_create_page_details_table', 26),
(37, '2023_10_04_102054_create_maintenance_modes_table', 27),
(38, '2023_10_05_124404_create_email_templates_table', 28),
(39, '2023_10_05_124445_create_notify_templates_table', 28),
(40, '2023_10_05_132313_create_email_sms_templates_table', 29),
(41, '2023_10_05_145420_create_push_notification_templates_table', 30),
(42, '2023_10_05_150447_create_in_app_notification_templates_table', 31),
(43, '2023_10_19_140559_create_manual_sms_configs_table', 32),
(44, '2023_10_19_161530_create_jobs_table', 33),
(45, '2023_12_10_085818_create_blog_categories_table', 34),
(46, '2023_12_10_094858_create_blogs_table', 35),
(47, '2023_12_10_094925_create_blog_details_table', 35),
(48, '2024_10_14_081947_create_manage_times_table', 36),
(49, '2024_10_14_105052_create_amenities_table', 37),
(50, '2024_10_14_131903_create_addresses_table', 38),
(51, '2024_10_14_154555_create_properties_table', 39),
(53, '2024_10_16_125321_create_images_table', 40),
(55, '2024_10_19_082739_add_column_to_basic_controls_table', 41),
(56, '2024_10_19_090208_add_is_rank_bonus_to_basic_controls_table', 42),
(59, '2024_10_19_094619_create_rankings_table', 43),
(60, '2024_10_19_095021_create_ranks_table', 43),
(61, '2024_10_19_141506_add_referral_column_to_basic_controls_table', 44),
(62, '2024_10_19_155157_create_referrals_table', 45),
(63, '2024_10_20_130519_create_investments_table', 46),
(64, '2022_10_31_070724_create_favourites_table', 47),
(66, '2024_10_23_091313_add_column_to_transactions_table', 49),
(67, '2024_10_24_081611_create_referral_bonuses_table', 50),
(68, '2024_10_24_132407_add_column_to_admins_table', 51),
(69, '2023_02_01_081645_create_roles_table', 52),
(70, '2024_10_27_074030_add_column_to_roles_table', 53),
(71, '2024_10_27_081509_create_subscribers_table', 54),
(72, '2024_10_28_083317_add_columns_to_contents_table', 55),
(73, '2024_10_28_095441_add_column_to_manage_menus_table', 56),
(75, '2024_10_30_075425_add_column_to_pages_table', 57),
(76, '2024_10_30_134654_create_investor_reviews_table', 58),
(77, '2024_10_31_094609_create_user_socials_table', 59),
(78, '2024_10_31_100423_create_contact_messages_table', 60),
(79, '2024_10_22_155442_add_column_to_users_table', 61),
(80, '2024_11_02_095041_create_property_shares_table', 62),
(81, '2024_11_02_095405_create_property_offers_table', 63),
(82, '2024_11_02_095653_create_offer_locks_table', 64),
(84, '2024_11_02_100316_create_offer_replies_table', 65),
(85, '2024_11_03_083125_add_column_to_property_offers', 66),
(86, '2024_11_04_080956_create_money_transfers_table', 67),
(88, '2024_11_21_155106_add_reviews_stats_to_properties_table', 68),
(89, '2025_01_11_122843_add_social_ids_to_users_table', 69),
(90, '2025_01_15_090254_add_return_time_columns_to_properties_table', 70),
(92, '2025_01_16_085505_add_morph_relation_to_referral_bonuses_table', 71);

-- --------------------------------------------------------

--
-- Table structure for table `money_transfers`
--

CREATE TABLE `money_transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT NULL,
  `charge` decimal(11,2) DEFAULT NULL,
  `trx` varchar(255) DEFAULT NULL,
  `send_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email_from` varchar(191) DEFAULT NULL,
  `template_key` varchar(255) DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `short_keys` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `sms` text DEFAULT NULL,
  `in_app` text DEFAULT NULL,
  `push` text DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL COMMENT 'mail = 0(inactive), mail = 1(active),\r\nsms = 0(inactive), sms = 1(active),\r\nin_app = 0(inactive), in_app = 1(active),\r\npush = 0(inactive), push = 1(active),\r\n ',
  `notify_for` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 => user, 1 => admin',
  `lang_code` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `language_id`, `name`, `email_from`, `template_key`, `subject`, `short_keys`, `email`, `sms`, `in_app`, `push`, `status`, `notify_for`, `lang_code`, `created_at`, `updated_at`) VALUES
(5, 1, 'Balance deducted by Admin', 'noreply@twosigmarealty.com', 'DEDUCTED_BALANCE', 'Your Account has been debited', '{\"transaction\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"main_balance\":\"Users Balance After this operation\"}', '[[amount]] [[currency]] debited in your account.\r\n\r\nYour Current Balance [[main_balance]][[currency]]\r\n\r\nTransaction: #[[transaction]]', '[[amount]] [[currency]] debited in your account.\r\n\r\nYour Current Balance [[main_balance]][[currency]]\r\n\r\nTransaction: #[[transaction]]', '[[amount]] [[currency]] debited in your account.\r\n\r\nYour Current Balance [[main_balance]][[currency]]\r\n\r\nTransaction: #[[transaction]]', '[[amount]] [[currency]] debited in your account.\r\n\r\nYour Current Balance [[main_balance]][[currency]]\r\n\r\nTransaction: #[[transaction]]', '{\"mail\":\"0\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', '2021-08-02 12:05:43', '2025-08-22 07:04:24'),
(6, 1, 'Support Ticket Replied', 'noreply@twosigmarealty.com', 'SUPPORT_TICKET_REPLIED', 'Support Ticket Replied', '{\"ticket_id\":\"Support Ticket ID\",\"username\":\"username\"}', '[[username]] replied  ticket\r\nTicket : [[ticket_id]]', '[[username]] replied  ticket\r\nTicket : [[ticket_id]]', '[[username]] replied  ticket\r\nTicket : [[ticket_id]]', '[[username]] replied  ticket\r\nTicket : [[ticket_id]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', '2021-08-02 12:05:43', '2025-08-22 07:04:24'),
(7, 1, 'Admin Support Ticket Replied', 'noreply@twosigmarealty.com', 'ADMIN_REPLIED_TICKET', 'Admin Support Ticket Replied', '{\"ticket_id\":\"Support Ticket ID\",\"ticket_subject\":\"Ticket Subject\",\"reply\":\"Reply Message\"}', 'Admin replied subject: [[ticket_subject]] message: [[reply]]\r\nTicket : [[ticket_id]]', 'Admin replied subject: [[ticket_subject]] message: [[reply]]\r\nTicket : [[ticket_id]]', 'Admin replied subject: [[ticket_subject]] message: [[reply]]\r\nTicket : [[ticket_id]]', 'Admin replied subject: [[ticket_subject]] message: [[reply]]\r\nTicket : [[ticket_id]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', '2021-08-02 12:05:43', '2025-08-22 07:04:24'),
(10, 1, 'Add Balance', 'noreply@twosigmarealty.com', 'ADD_BALANCE', 'Your Account has been credited', '{\"transaction\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"main_balance\":\"Users Balance After this operation\"}', '[[amount]] credited in your account. \n\n\nYour Current Balance [[main_balance]]\n\nTransaction: #[[transaction]]', '[[amount]] credited in your account. \n\n\nYour Current Balance [[main_balance]]\n\nTransaction: #[[transaction]]', '[[amount]] credited in your account. \n\n\nYour Current Balance [[main_balance]]\n\nTransaction: #[[transaction]]', '[[amount]] credited in your account. \n\n\nYour Current Balance [[main_balance]]\n\nTransaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-08-22 07:04:24'),
(11, 1, 'KYC Approved', 'noreply@twosigmarealty.com', 'KYC_APPROVED', 'Your KYC has been approved', '{\"username\":\"Username\"}', '[[username]] your kyc has been approved', 'Your KYC has been approved', 'Your KYC has been approved', 'Your KYC has been approved', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-08-22 07:04:24'),
(12, 1, 'KYC Rejected', 'noreply@twosigmarealty.com', 'KYC_REJECTED', 'Your KYC has been rejected.', '{\"username\":\"Username\"}', '[[username]] your kyc has been rejected', '[[username]] your kyc has been rejected', '[[username]] your kyc has been rejected', '[[username]] your kyc has been rejected', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-08-22 07:04:24'),
(13, 1, 'Admin Replied Ticket', 'noreply@twosigmarealty.com', 'ADMIN_REPLIED_TICKET', 'Admin Replied Ticket', '{\"ticket_id\":\"Support Ticket ID\"}', 'Admin replied  \r\nTicket : [[ticket_id]]', 'Admin replied  \r\nTicket : [[ticket_id]]', 'Admin replied  \r\nTicket : [[ticket_id]]', 'Admin replied  \r\nTicket : [[ticket_id]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-08-22 07:04:24'),
(15, 1, 'Payment Request', 'noreply@twosigmarealty.com', 'PAYMENT_REQUEST', 'Payment Request', '{\"gateway\":\"gateway\",\"currency\":\"currency\",\"username\":\"username\"}', '[[username]] deposit request [[amount]] via [[gateway]]\r\n', '[[username]] deposit request [[amount]] via [[gateway]]\r\n', '[[username]] deposit request [[amount]] via [[gateway]]\r\n', '[[username]] deposit request [[amount]] via [[gateway]]\r\n', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', '2023-10-07 22:18:47', '2025-08-22 07:04:24'),
(16, 1, 'Payment Approved', 'noreply@twosigmarealty.com', 'PAYMENT_APPROVED', 'Payment Approved', '{\"amount\":\"amount\",\"feedback\":\"Admin feedback\",\"charge\":\"Payment Charge\",\"transaction\":\"Transaction Id\",\"gateway_name\":\"Gateway Name\"}', '[[username]] deposit request [[amount]] via [[gateway]] has been approved.', '[[username]] deposit request [[amount]] via [[gateway]] has been approved', '[[username]] deposit request [[amount]] via [[gateway]] has been approved', '[[username]] deposit request [[amount]] via [[gateway]] has been approved', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', '2023-10-07 22:18:47', '2025-08-22 07:04:24'),
(17, 1, 'Payment Rejected', 'noreply@twosigmarealty.com', 'PAYMENT_REJECTED', 'Payment Rejected', '{\"amount\":\"amount\",\"feedback\":\"Admin feedback\",\"charge\",\"Payment Charge\",\"gateway_name\":\"Gateway Name\",\"transaction\":\"Transaction Id\"}', '[[username]] deposit request [[amount]] via [[gateway]] payment rejected', '[[username]] deposit request [[amount]] via [[gateway]] payment rejected', '[[username]] deposit request [[amount]] via [[gateway]] payment rejected', '[[username]] deposit request [[amount]] via [[gateway]] payment rejected', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-08-22 07:04:24'),
(18, 1, 'Add Fund User', 'noreply@twosigmarealty.com', 'ADD_FUND_USER_USER', 'Add Fund User', '{\"amount\":\"Request Amount\",\"transaction\":\"Transaction Number\"}', 'you add fund money amount [[amount]] . Transaction: #[[transaction]]', 'you add fund money amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'you add fund money amount [[amount]]. Transaction: #[[transaction]]', 'you add fund money amount [[amount]] . Transaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-08-22 07:04:24'),
(19, 1, 'Add Fund User Admin', 'noreply@twosigmarealty.com', 'ADD_FUND_USER_ADMIN', 'Add Fund User Admin', '{\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', '[[user]] add fund money amount [[amount]] . Transaction: #[[transaction]]', '[[user]] add fund money amount [[amount]]. Transaction: #[[transaction]]', '[[user]] add fund money amount [[amount]] . Transaction: #[[transaction]]', '[[user]] add fund money amount [[amount]] . Transaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', '2023-10-07 22:18:47', '2025-08-22 07:04:24'),
(20, 1, 'Payout Request  Admin', 'noreply@twosigmarealty.com', 'PAYOUT_REQUEST_TO_ADMIN', 'payout Request  Admin', '{\"sender\":\"Sender Name\",\"amount\":\"Received Amount\",\"transaction\":\"Transaction Number\"}', '[[user]] add fund money amount [[amount]] [[currency]] . Transaction: #[[transaction]][[sender]] request for payment amount [[amount]] . Transaction: #[[transaction]]', '[[user]] add fund money amount [[amount]] [[currency]] . Transaction: #[[transaction]][[sender]] request for payment amount [[amount]] . Transaction: #[[transaction]]', '[[user]] add fund money amount [[amount]] [[currency]] . Transaction: #[[transaction]][[sender]] request for payment amount [[amount]] . Transaction: #[[transaction]]', '[[user]] add fund money amount [[amount]] [[currency]] . Transaction: #[[transaction]][[sender]] request for payment amount [[amount]] . Transaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', '2023-10-07 22:18:47', '2025-08-22 07:04:24'),
(21, 1, 'Payout Request from', 'noreply@twosigmarealty.com', 'PAYOUT_REQUEST_FROM', 'Payout Request from', '{\"amount\":\"Received Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 'You request for payout amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-08-22 07:04:24'),
(22, 1, 'Payout Request Approved', 'noreply@twosigmarealty.com', 'PAYOUT_APPROVED', 'Payout Request Approved', '{\"amount\":\"Received Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 'You request for payout amount [[amount]] [[currency]] has been approved . Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] has been approved . Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] has been approved . Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] has been approved . Transaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-08-22 07:04:24'),
(23, 1, 'Payout Request Cancel', 'noreply@twosigmarealty.com', 'PAYOUT_CANCEL', 'Payout Request Cancel', '{\"amount\":\"Received Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 'You request for payout amount [[amount]] [[currency]] has been cancel. Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] has been cancel. Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] has been cancel. Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] has been cancel. Transaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-08-22 07:04:24'),
(24, 1, 'Reset Password Notification', 'noreply@twosigmarealty.com', 'PASSWORD_RESET', 'Reset Password Notification', '{\"message\":\"message\"}', 'You are receiving this email because we received a password reset request for your account.[[message]]\r\n\r\n\r\nThis password reset link will expire in 60 minutes.\r\n\r\nIf you did not request a password reset, no further action is required.', 'You are receiving this email because we received a password reset request for your account.[[message]]\r\n\r\n\r\nThis password reset link will expire in 60 minutes.\r\n\r\nIf you did not request a password reset, no further action is required.', 'You are receiving this email because we received a password reset request for your account.[[message]]\r\n\r\n\r\nThis password reset link will expire in 60 minutes.\r\n\r\nIf you did not request a password reset, no further action is required.', 'You are receiving this email because we received a password reset request for your account.[[message]]\r\n\r\n\r\nThis password reset link will expire in 60 minutes.\r\n\r\nIf you did not request a password reset, no further action is required.', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-08-22 07:04:24'),
(25, 1, 'Verification Code', 'noreply@twosigmarealty.com', 'VERIFICATION_CODE', 'Verification Code', '{\"code\":\"code\"}', 'Your Email verification Code  [[code]]', 'Your SMS verification Code  [[code]]', 'Your Email verification Code  [[code]]', 'Your Email verification Code  [[code]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-08-22 07:04:24'),
(26, 1, 'Two step enabled.', 'noreply@twosigmarealty.com', 'TWO_STEP_ENABLED', 'Two step enabled.', '{\"action\":\"Enabled Or Disable\",\"ip\":\"Device Ip\",\"browser\":\"browser and Operating System \",\"time\":\"Time\",\"code\":\"code\"}', 'Your verification code is: {{code}}', 'Your verification code is: {{code}}', 'Your verification code is: {{code}}', 'Your verification code is: {{code}}', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-08-22 07:04:24'),
(27, 1, 'Two Step disabled', 'noreply@twosigmarealty.com', 'TWO_STEP_DISABLED', 'Two Step disabled', '{\"action\":\"Enabled Or Disable\",\"ip\":\"Device Ip\",\"browser\":\"browser and Operating System \",\"time\":\"Time\"}', 'Google two factor verification is disabled.', 'Google two factor verification is disabled.', 'Google two factor verification is disabled.', 'Google two factor verification is disabled.', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-08-22 07:04:24'),
(32, 1, 'CONTACT MESSAGE NOTIFY TO INVESTOR', 'noreply@twosigmarealty.com', 'NOTIFY_INVESTOR_CLIENT_SEND_CONTACT_MESSAGE_TO_INVESTOR', 'CONTACT MESSAGE NOTIFY TO INVESTOR', '{\"site\":\"website name\",\"from\":\"client name\"}', '[[site]] sent a email from [[from]] ', '[[site]] sent a email from [[from]]', '[[site]] sent a email from [[from]]', '[[site]] sent a email from [[from]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2021-08-02 12:05:43', '2025-08-22 07:04:24'),
(33, 1, 'CONTACT MESSAGE SEND TO INVESTOR NOTIFY TO ADMIN', 'noreply@twosigmarealty.com', 'NOTIFY_ADMIN_CLIENT_SEND_CONTACT_MESSAGE_TO_INVESTOR', 'CONTACT MESSAGE SEND TO INVESTOR NOTIFY TO ADMIN', '{\"from\":\"client\",\"to\":\"investor\"}', '[[from]] send contact message to [[to]]', '[[from]] send contact message to [[to]]', '[[from]] send contact message to [[to]]', '[[from]] send contact message to [[to]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', '2021-08-02 12:05:43', '2025-08-22 07:04:24'),
(34, 1, 'REFERRAL BONUS', 'noreply@twosigmarealty.com', 'REFERRAL_BONUS', 'REFERRAL BONUS', '{\"bonus_from\":\"bonus from User\",\"amount\":\"amount\",\"currency\":\"currency\",\"level\":\"level\"}', 'You got [[amount]] [[currency]]  Referral bonus From  [[bonus_from]] ', 'You got [[amount]] [[currency]]  Referral bonus From  [[bonus_from]] ', 'You got [[amount]] [[currency]]  Referral bonus From  [[bonus_from]] ', 'You got [[amount]] [[currency]]  Referral bonus From  [[bonus_from]] ', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2021-08-02 12:05:43', '2025-08-22 07:04:24'),
(35, 1, 'INVESTMENT PROFIT RETURN NOTIFY TO ADMIN', 'noreply@twosigmarealty.com', 'INVEST_PROFIT_NOTIFY_TO_ADMIN', 'INVESTMENT PROFIT RETURN NOTIFY TO ADMIN', '{\"username\":\"Investor\",\"currency\":\"base currency\",\"amount\":\"amount\",\"property_name\":\"interest this property\"}', '[[username]] [[currency]][[amount]] Interest From [[property_name]]', '[[username]] [[currency]][[amount]] Interest From [[property_name]]', '[[username]] [[currency]][[amount]] Interest From [[property_name]]', '[[username]] [[currency]][[amount]] Interest From [[property_name]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', '2021-08-02 12:05:43', '2025-08-22 07:04:24'),
(36, 1, 'INVESTMENT PROFIT RETURN NOTIFY TO USER', 'noreply@twosigmarealty.com', 'INVEST_PROFIT_NOTIFY_TO_USER', 'INVESTMENT PROFIT RETURN NOTIFY TO USER', '{\"username\":\"Investor\",\"currency\":\"base currency\",\"amount\":\"amount\",\"property_name\":\"interest this property\"}', '[[username]] [[currency]][[amount]] Interest From [[property_name]]', '[[username]] [[currency]][[amount]] Interest From [[property_name]]', '[[username]] [[currency]][[amount]] Interest From [[property_name]]', '[[username]] [[currency]][[amount]] Interest From [[property_name]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2021-08-02 12:05:43', '2025-08-22 07:04:24'),
(37, 1, 'INVESTMENT CAPITAL BACK RETURN NOTIFY TO ADMIN', 'noreply@twosigmarealty.com', 'INVESTMENT_CAPITAL_BACK_NOTIFY_TO_ADMIN', 'INVESTMENT CAPITAL BACK RETURN NOTIFY TO ADMIN', '{\"username\":\"Investor\",\"currency\":\"base currency\",\"amount\":\"amount\",\"property_name\":\"interest this property\"}', '[[username]] [[currency]][[amount]] Capital Back From [[property_name]]', '[[username]] [[currency]][[amount]] Capital Back From [[property_name]]', '[[username]] [[currency]][[amount]] Capital Back From [[property_name]]', '[[username]] [[currency]][[amount]] Capital Back From [[property_name]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', '2021-08-02 12:05:43', '2025-08-22 07:04:24'),
(38, 1, 'INVESTMENT CAPITAL BACK RETURN NOTIFY TO USER', 'noreply@twosigmarealty.com', 'INVESTMENT_CAPITAL_BACK_NOTIFY_TO_USER', 'INVESTMENT CAPITAL BACK RETURN NOTIFY TO USER', '{\"username\":\"Investor\",\"currency\":\"base currency\",\"amount\":\"amount\",\"property_name\":\"interest this property\"}', '[[username]] [[currency]][[amount]] Capital Back From [[property_name]]', '[[username]] [[currency]][[amount]] Capital Back From [[property_name]]', '[[username]] [[currency]][[amount]] Capital Back From [[property_name]]', '[[username]] [[currency]][[amount]] Capital Back From [[property_name]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2021-08-02 12:05:43', '2025-08-22 07:04:24'),
(39, 1, 'PROPERTY INVEST NOTIFY TO ADMIN', 'noreply@twosigmarealty.com', 'PROPERTY_INVEST_NOTIFY_TO_ADMIN', 'PROPERTY INVEST NOTIFY TO ADMIN', '{\"username\":\"Investor\",\"currency\":\"base currency\",\"amount\":\"amount\",\"property_name\":\"invest this property\"}', '[[username]] Invested [[currency]][[amount]] on [[property_name]]', '[[username]] Invested [[currency]][[amount]] on [[property_name]]', '[[username]] Invested [[currency]][[amount]] on [[property_name]]', '[[username]] Invested [[currency]][[amount]] on [[property_name]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', '2021-08-02 12:05:43', '2025-08-22 07:04:24'),
(40, 1, 'PROPERTY INVEST NOTIFY TO USER', 'noreply@twosigmarealty.com', 'PROPERTY_INVEST_NOTIFY_TO_USER', 'PROPERTY INVEST NOTIFY TO USER', '{\"username\":\"Investor\",\"currency\":\"base currency\",\"amount\":\"amount\",\"property_name\":\"invest this property\"}', '[[username]] Invested [[currency]][[amount]] on [[property_name]]', '[[username]] Invested [[currency]][[amount]] on [[property_name]]', '[[username]] Invested [[currency]][[amount]] on [[property_name]]', '[[username]] Invested [[currency]][[amount]] on [[property_name]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2021-08-02 12:05:43', '2025-08-22 07:04:24');

-- --------------------------------------------------------

--
-- Table structure for table `offer_locks`
--

CREATE TABLE `offer_locks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_offer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `property_share_id` bigint(20) UNSIGNED DEFAULT NULL,
  `offer_amount` decimal(8,2) DEFAULT NULL,
  `lock_amount` decimal(8,2) DEFAULT NULL,
  `duration` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offer_replies`
--

CREATE TABLE `offer_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_offer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sender_id` bigint(20) UNSIGNED DEFAULT NULL,
  `receiver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reply` longtext DEFAULT NULL,
  `file` text DEFAULT NULL,
  `driver` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `template_name` varchar(191) DEFAULT NULL,
  `custom_link` varchar(255) DEFAULT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_image` varchar(255) DEFAULT NULL,
  `meta_image_driver` varchar(50) DEFAULT NULL,
  `breadcrumb_image` varchar(255) DEFAULT NULL,
  `breadcrumb_image_driver` varchar(50) DEFAULT NULL,
  `breadcrumb_status` tinyint(1) DEFAULT 1 COMMENT '0 => inactive, 1 => active',
  `status` tinyint(1) DEFAULT 1 COMMENT '0 => unpublish, 1 => publish',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 => admin create, 1 => developer create, 2 => create for menus 3 => custom links\r\n',
  `is_breadcrumb_img` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `og_description` text DEFAULT NULL,
  `meta_robots` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `template_name`, `custom_link`, `page_title`, `meta_title`, `meta_keywords`, `meta_description`, `meta_image`, `meta_image_driver`, `breadcrumb_image`, `breadcrumb_image_driver`, `breadcrumb_status`, `status`, `type`, `is_breadcrumb_img`, `created_at`, `updated_at`, `og_description`, `meta_robots`) VALUES
(1, 'home', '/', 'light', NULL, 'Home', 'Chaincity | Real Estate Investment Opportunities | Smart Property Investments', '[\"real estate investment\",\"property investment\",\"Chaincity\",\"investment opportunities\",\"smart real estate\",\"property development\",\"passive income\",\"investment platform\"]', 'Discover profitable real estate investment opportunities with Chaincity. From residential to commercial properties, we offer a secure platform for smart property investments that grow your wealth. Start building your financial future with us.', 'seo/8QnArsj4wdvtGksUEpwhoK2y4FDo8O.webp', 'local', NULL, 'local', 0, 1, 0, 1, '2024-10-29 03:48:00', '2025-01-26 10:38:54', 'Invest in high-potential real estate with Chaincity. Join a secure, transparent platform dedicated to helping you grow your wealth through expertly managed property investments.', 'index,follow'),
(2, 'about', 'about', 'light', NULL, 'About', 'About Us - ChainCity | Real Estate Investment Platform', '[\"About Us\",\"Real Estate Investment\",\"chaincity\",\"ChainCity\",\"Property Investment Platform\",\"Real Estate Solutions\",\"Investment Strategies\"]', 'Discover ChainCity, a leading real estate investment platform. Learn about our mission to simplify property investments and empower investors with innovative tools and resources', NULL, NULL, 'pagesImage/gdb1y2JEMSM0VXKdslclklPki3KukS.webp', 'local', 1, 1, 0, 1, '2024-10-30 01:33:53', '2024-10-30 02:17:22', 'Learn more about ChainCity, your trusted partner in real estate investment. Explore our mission and values that drive our commitment to helping you succeed in property investment.', 'follow'),
(3, 'faq', 'faq', 'light', NULL, 'FAQ', 'FAQs - ChainCity | Your Real Estate Investment Questions Answered', '[\"FAQs\",\"Real Estate Investment\",\"ChainCity\",\"Property Investment Questions\",\"Investment Platform Help\",\"Investor Support\"]', 'Have questions about real estate investment? Explore our FAQs at ChainCity to find answers on investing, platform features, and more. Empower your investment journey today!', NULL, NULL, 'pagesImage/L9nuFi1euEomLa9d3z0mHNiIbVcYdn.webp', 'local', 1, 1, 0, 1, '2024-10-30 02:28:18', '2024-10-30 02:37:13', 'Get the answers you need with ChainCity\'s FAQ section. Discover information about real estate investment, our platform features, and how we can support your investment goals.', NULL),
(4, 'contact', 'contact', 'light', NULL, 'Contact Us', 'Contact Chaincity | Reach Out for Real Estate Investment Support', '[\"contact Chaincity\",\"real estate investment inquiries\",\"property investment support\",\"get in touch\",\"customer service\",\"real estate experts\",\"contact us\",\"investment advice\"]', 'Have questions or need assistance with your real estate investments? Contact Chaincity today. Our team of experts is here to provide personalized support and help you navigate the world of property investments.', NULL, NULL, 'pagesImage/V0vUebCDEBbxjIqZg7I9KDR6l7PuhL.webp', 'local', 1, 1, 0, 1, '2024-10-30 02:44:44', '2025-01-19 10:19:42', 'Contact Chaincity – Reach Out for Investment Assistance', 'index,follow'),
(5, 'Blog', 'blog', 'light', NULL, 'Blog', 'ChainCity Blog | Insights &amp; Tips for Real Estate Investors', '[\"Blog\",\"Real Estate Investment\",\"ChainCity\",\"Investment Tips\",\"Property Market Insights\",\"Real Estate Strategies\"]', 'Explore the ChainCity Blog for the latest insights, tips, and strategies in real estate investment. Stay informed and make smarter investment decisions with our expert content.', NULL, NULL, 'pagesImage/fLjn951aV2RFxAJf7drOYfo0aumZLh.webp', 'local', 1, 1, 2, 1, '2024-10-30 03:19:08', '2024-10-30 03:22:42', 'Dive into the ChainCity Blog for valuable insights and tips on real estate investment. Learn from industry experts and stay ahead in your investment journey!', 'index,follow'),
(6, 'privacy policy', 'privacy-policy', 'light', NULL, 'Privacy Policy', 'Privacy Policy | Chaincity – Your Privacy is Our Priority', '[\"privacy policy\",\"real estate investment privacy\",\"data protection\",\"personal information security\",\"Chaincity privacy\",\"GDPR compliance\",\"secure real estate platform\"]', 'Read Chaincity\'s Privacy Policy to understand how we protect your personal information and ensure a secure environment for your real estate investments. We prioritize your privacy and comply with data protection laws.', NULL, NULL, '/pjdy0WjvvvkzAZxuMdVJyqVgMAFp8M.webp', 'local', 1, 1, 0, 1, '2024-10-30 07:11:08', '2024-11-10 03:48:27', 'Your privacy matters to us. Learn how Chaincity protects your personal information and ensures secure transactions and data handling in accordance with our privacy policy.', 'noindex,nofollow'),
(7, 'terms and conditions', 'terms-and-conditions', 'light', NULL, 'Terms and Conditions', 'Terms and Conditions | Chaincity – Real Estate Investment Platform', '[\"terms and conditions\",\"real estate investment terms\",\"Chaincity terms\",\"investment platform terms\",\"user agreement\",\"privacy terms\",\"real estate platform rules\",\"legal terms\"]', 'Review the Terms and Conditions of using Chaincity\'s real estate investment platform. Our comprehensive agreement outlines the terms of service, user responsibilities, and legal guidelines for secure and transparent investment opportunities.', NULL, NULL, '/VcpKrLjYhFq6qENHCt5MGu9Qa07mUP.webp', 'local', 1, 1, 0, 1, '2024-10-30 07:11:46', '2024-11-10 03:50:48', 'Read Chaincity\'s Terms and Conditions to understand your rights and responsibilities when using our real estate investment platform. Ensuring transparency and legal compliance for all users.', 'noindex,nofollow'),
(8, 'Property', 'property', 'light', NULL, 'Property', 'Properties - ChainCity | Real Estate Investment Opportunities', '[\"Properties\",\"Real Estate Investment\",\"ChainCity\",\"Property Listings\",\"Investment Opportunities\"]', 'Discover a variety of properties available for investment at ChainCity. Explore our listings to find the perfect real estate opportunity that meets your investment goals.', NULL, NULL, 'pagesImage/FMzH2B6kf6at008XD8WuXvgW5Kwzit.webp', 'local', 1, 1, 2, 1, '2024-10-30 07:22:46', '2024-11-10 03:27:00', 'Browse properties at ChainCity and find your ideal real estate investment. Explore diverse listings tailored to help you achieve your investment aspirations.', NULL),
(18, 'home', '/', 'green', NULL, 'Home', 'Two Sigma | Real Estate Investment Opportunities | Smart Property Investments', '[\"real estate investment\",\"property investment\",\"investment opportunities\",\"smart real estate\",\"property development\",\"passive income\",\"investment platform\",\"Two Sigma Real Estate\"]', 'Discover profitable real estate investment opportunities with Two Sigma Real Estate. From residential to commercial properties, we offer a secure platform for smart property investments that grow your wealth. Start building your financial future with us.', 'seo/8DhY8aF4Nt1i1vRHRVWs3nEjO5y0Wj.webp', 'local', NULL, 'local', 0, 1, 0, 1, '2024-11-10 08:14:13', '2025-08-25 12:12:59', 'Invest in high-potential real estate with Two Sigma Real Estate. Join a secure, transparent platform dedicated to helping you grow your wealth through expertly managed property investments.', 'index,follow'),
(19, 'about', 'about', 'green', NULL, 'About', 'About Us - Two Sigma | Real Estate Investment Platform', '[\"real estate investment platform\",\"trusted investment\",\"property investment experts\",\"real estate solutions\",\"secure investments\",\"about Two Sigma Real Estate\",\"Two Sigma Real Estate team\"]', 'Discover Two Sigma Real Estate, a leading real estate investment platform. Learn about our mission to simplify property investments and empower investors with innovative tools and resources', 'seo/vNNfP8pG9fWAm3VpmBl8Cij5vrQEjh.webp', 'local', 'pagesImage/oUJDJ8EBkqc4T00GWz8tRLnrD5tscd.webp', 'local', 1, 1, 0, 1, '2024-11-10 09:31:36', '2025-08-23 04:52:01', 'Learn more about Two Sigma Real Estate, your trusted partner in real estate investment. Explore our mission and values that drive our commitment to helping you succeed in property investment.', 'index,follow'),
(20, 'Property', 'property', 'green', NULL, 'Property', 'Properties - Two Sigma | Real Estate Investment Opportunities', '[\"property listings\",\"real estate investment\",\"property investments\",\"residential properties\",\"commercial properties\",\"investment opportunities\",\"property portfolio\",\"Two Sigma Real Estate\"]', 'Discover a variety of properties available for investment at Two Sigma Realty. Explore our listings to find the perfect real estate opportunity that meets your investment goals.', 'seo/mVKidqdbQXwanX3fINgMEi8drIJJl9.webp', 'local', 'pagesImage/prVqS7ZUShweK8G3APuhDXtXPHTLpi.webp', 'local', 1, 1, 2, 1, '2024-11-10 09:32:34', '2025-08-25 12:12:28', 'Discover a variety of properties available for investment at Two Sigma Realty. Explore our listings to find the perfect real estate opportunity that meets your investment goals.', 'index,follow'),
(21, 'faq', 'faq', 'green', NULL, 'FAQ', 'FAQs - Two Sigma | Your Real Estate Investment Questions Answered', '[\"FAQ\",\"frequently asked questions\",\"real estate investment questions\",\"property investment support\",\"investment platform guide\",\"real estate advice\",\"Two Sigma FAQ\'s\"]', 'Have questions about real estate investment? Explore our FAQs at Two Sigma to find answers on investing, platform features, and more. Empower your investment journey today!', 'seo/LXTSajQrbKOcVuhWcNRKxN4nvMkNGi.webp', 'local', '/qPOcFFcqNXwPDTHfrK6SiUsbyk1lT3.webp', 'local', 1, 1, 0, 1, '2024-11-10 09:34:30', '2025-08-25 12:14:44', 'Get the answers you need with Two Sigma\'s FAQ section. Discover information about real estate investment, our platform features, and how we can support your investment goals.', 'index,follow'),
(22, 'Blog', 'blog', 'green', NULL, 'Blog', 'Two Sigma Blog | Insights &amp; Tips for Real Estate Investors', '[\"real estate blog\",\"investment tips\",\"property investment insights\",\"real estate market trends\",\"investment strategies\",\"property market news\",\"Two Sigma\'s Blog\"]', 'Explore the Two Sigma Blog for the latest insights, tips, and strategies in real estate investment. Stay informed and make smarter investment decisions with our expert content.', 'seo/oYKQpUUVM0i4IWrtToGWYmfzvN8ZPX.webp', 'local', 'pagesImage/Zhe8t6ROmHqxzvHjSU1kcaSEwAN3NO.webp', 'local', 1, 1, 2, 1, '2024-11-10 09:35:30', '2025-08-25 12:15:33', 'Dive into the ChainCity Blog for valuable insights and tips on real estate investment. Learn from industry experts and stay ahead in your investment journey!', 'index,follow'),
(23, 'contact', 'contact', 'green', NULL, 'Contact Us', 'Contact Chaincity | Reach Out for Real Estate Investment Support', '[\"contact Chaincity\",\"real estate investment support\",\"property investment inquiries\",\"Chaincity contact\",\"real estate customer support\",\"investment assistance\",\"get in touch\"]', 'Have questions or need assistance with your real estate investments? Contact Chaincity today. Our team of experts is here to provide personalized support and help you navigate the world of property investments.', NULL, NULL, 'pagesImage/1udKXHr9q6DIsNj28wLDiRJw7LEppf.webp', 'local', 1, 1, 0, 1, '2024-11-10 09:36:20', '2024-11-11 02:30:16', 'Contact Chaincity – Reach Out for Investment Assistance', 'index,follow'),
(24, 'privacy policy', 'privacy-policy', 'green', NULL, 'Privacy Policy', 'Privacy Policy | Chaincity – Your Privacy is Our Priority', '[\"privacy policy\",\"data protection\",\"information security\",\"Chaincity privacy\",\"real estate investment privacy\",\"GDPR compliance\",\"secure data handling\",\"personal information protection\"]', 'Read Chaincity\'s Privacy Policy to understand how we protect your personal information and ensure a secure environment for your real estate investments. We prioritize your privacy and comply with data protection laws.', NULL, NULL, '/Z9dehHaQwLAKyjiNHF7mS98L0YJbKr.webp', 'local', 1, 1, 0, 1, '2024-11-10 09:37:44', '2024-11-11 02:31:17', 'Your privacy matters to us. Learn how Chaincity protects your personal information and ensures secure transactions and data handling in accordance with our privacy policy.', 'noindex,nofollow'),
(25, 'terms and conditions', 'terms-and-conditions', 'green', NULL, 'Terms and Conditions', 'Terms and Conditions | Chaincity – Real Estate Investment Platform', '[\"terms and conditions\",\"Chaincity terms\",\"real estate investment terms\",\"user agreement\",\"property investment rules\",\"legal terms\",\"investment platform terms\",\"Chaincity policies\"]', 'Review the Terms and Conditions of using Chaincity\'s real estate investment platform. Our comprehensive agreement outlines the terms of service, user responsibilities, and legal guidelines for secure and transparent investment opportunities.', NULL, NULL, '/ZYXnSqmSy1izYIievnC8rn1cb3ShZ2.webp', 'local', 1, 1, 0, 1, '2024-11-10 09:38:09', '2024-11-11 02:32:06', 'Read Chaincity\'s Terms and Conditions to understand your rights and responsibilities when using our real estate investment platform. Ensuring transparency and legal compliance for all users.', 'index,follow');

-- --------------------------------------------------------

--
-- Table structure for table `page_details`
--

CREATE TABLE `page_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `sections` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_details`
--

INSERT INTO `page_details` (`id`, `page_id`, `language_id`, `name`, `content`, `sections`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Home', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[hero]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[feature]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[about]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[property]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[testimonial]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[latest_property]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[statistics]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[blog]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"hero\",\"feature\",\"about\",\"property\",\"testimonial\",\"latest_property\",\"statistics\",\"blog\"]', '2024-10-29 03:48:00', '2024-11-12 03:29:11'),
(3, 2, 1, 'About', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[about]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[feature]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[testimonial]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"about\",\"feature\",\"testimonial\"]', '2024-10-30 01:33:53', '2024-10-30 01:33:53'),
(4, 3, 1, 'FAQ', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[faq]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"faq\"]', '2024-10-30 02:28:18', '2024-10-30 02:28:18'),
(5, 4, 1, 'Contact', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[contact]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"contact\"]', '2024-10-30 02:44:44', '2024-10-30 02:44:44'),
(6, 5, 1, 'Blog', NULL, NULL, '2024-10-30 03:19:34', '2024-10-30 03:19:34'),
(7, 6, 1, 'Privacy policy', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[privacy_policy]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"privacy_policy\"]', '2024-10-30 07:11:08', '2024-10-30 07:11:08'),
(8, 7, 1, 'Terms And Conditions', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[terms_condition]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"terms_condition\"]', '2024-10-30 07:11:46', '2024-10-30 07:11:46'),
(9, 8, 1, 'Property', NULL, NULL, '2024-10-30 07:23:11', '2024-10-30 07:23:11'),
(19, 18, 1, 'Home', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[hero]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[feature]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[about]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[property]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[testimonial]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[latest_property]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[statistics]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[blog]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"hero\",\"feature\",\"about\",\"property\",\"testimonial\",\"latest_property\",\"statistics\",\"blog\"]', '2024-11-10 08:14:13', '2024-11-10 09:30:31'),
(20, 19, 1, 'About', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[feature]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[about]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[statistics]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[testimonial]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"feature\",\"about\",\"statistics\",\"testimonial\"]', '2024-11-10 09:31:36', '2024-11-10 09:31:36'),
(21, 20, 1, 'Property', NULL, NULL, '2024-11-10 09:33:43', '2024-11-10 09:33:43'),
(22, 21, 1, 'FAQ', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[faq]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"faq\"]', '2024-11-10 09:34:30', '2024-11-10 09:34:30'),
(23, 22, 1, 'Blog', NULL, NULL, '2024-11-10 09:35:47', '2024-11-10 09:35:47'),
(24, 23, 1, 'Contact', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[contact]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"contact\"]', '2024-11-10 09:36:20', '2024-11-10 09:36:20'),
(25, 24, 1, 'Privacy Policy', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[privacy_policy]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"privacy_policy\"]', '2024-11-10 09:37:44', '2024-11-10 09:37:44'),
(26, 25, 1, 'Terms And Conditions', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[terms_condition]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"terms_condition\"]', '2024-11-10 09:38:09', '2024-11-10 09:38:09');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payouts`
--

CREATE TABLE `payouts` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `payout_method_id` int(11) UNSIGNED DEFAULT NULL,
  `payout_currency_code` varchar(50) DEFAULT NULL,
  `amount` decimal(18,8) DEFAULT 0.00000000,
  `charge` decimal(18,8) DEFAULT 0.00000000,
  `net_amount` decimal(18,8) DEFAULT 0.00000000,
  `amount_in_base_currency` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `charge_in_base_currency` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `net_amount_in_base_currency` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `response_id` varchar(255) DEFAULT NULL,
  `last_error` varchar(255) DEFAULT NULL,
  `information` text DEFAULT NULL,
  `meta_field` varchar(255) NOT NULL COMMENT 'for fullerwave',
  `feedback` text DEFAULT NULL,
  `trx_id` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '0=> pending, 1=> generated, 2=>success 3=> cancel,',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payout_methods`
--

CREATE TABLE `payout_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `bank_name` text DEFAULT NULL COMMENT 'automatic payment for bank name',
  `banks` text DEFAULT NULL COMMENT 'admin bank permission',
  `parameters` text DEFAULT NULL COMMENT 'api parameters',
  `extra_parameters` text DEFAULT NULL,
  `inputForm` text DEFAULT NULL,
  `currency_lists` text DEFAULT NULL,
  `supported_currency` text DEFAULT NULL,
  `payout_currencies` text DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = active, 0 = inactive',
  `is_automatic` tinyint(4) NOT NULL DEFAULT 0,
  `is_sandbox` tinyint(4) NOT NULL DEFAULT 0,
  `environment` enum('test','live') NOT NULL DEFAULT 'live',
  `confirm_payout` tinyint(1) NOT NULL DEFAULT 1,
  `is_auto_update` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'currency rate auto update',
  `currency_type` tinyint(1) NOT NULL DEFAULT 1,
  `logo` varchar(255) DEFAULT NULL,
  `driver` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payout_methods`
--

INSERT INTO `payout_methods` (`id`, `name`, `code`, `description`, `bank_name`, `banks`, `parameters`, `extra_parameters`, `inputForm`, `currency_lists`, `supported_currency`, `payout_currencies`, `is_active`, `is_automatic`, `is_sandbox`, `environment`, `confirm_payout`, `is_auto_update`, `currency_type`, `logo`, `driver`, `created_at`, `updated_at`) VALUES
(2, 'Bank Transfer', 'paypal-manual', 'Payment will receive within 9 hours', NULL, NULL, '[]', NULL, '{\"account_name\":{\"field_name\":\"account_name\",\"field_label\":\"Account Name\",\"type\":\"text\",\"validation\":\"required\"},\"account_details\":{\"field_name\":\"account_details\",\"field_label\":\"Account Details\",\"type\":\"textarea\",\"validation\":\"required\"},\"n_i_d\":{\"field_name\":\"n_i_d\",\"field_label\":\"NID\",\"type\":\"file\",\"validation\":\"required\"}}', NULL, '[\"BDT\",\"USD\"]', '[{\"currency_symbol\":\"BDT\",\"conversion_rate\":\"126\",\"min_limit\":\"1\",\"max_limit\":\"50000000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"currency_symbol\":\"USD\",\"conversion_rate\":\"1\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 1, 0, 0, 'test', 1, 0, 1, 'payoutMethod/ak6zVFBh2VA9vLBwxKOZad8rklp79E4lO4P8aTji.png', 'local', '2020-12-23 13:40:51', '2024-11-20 07:56:43'),
(3, 'Bank', 'bank', 'Payment will receive within 8 days', NULL, NULL, '[]', NULL, '{\"d\":{\"field_name\":\"d\",\"field_label\":\"d\",\"type\":\"text\",\"validation\":\"required\"},\"f\":{\"field_name\":\"f\",\"field_label\":\"f\",\"type\":\"text\",\"validation\":\"required\"}}', NULL, '[\"HUR\"]', '[{\"currency_symbol\":\"HUR\",\"conversion_rate\":\"100\",\"min_limit\":\"1\",\"max_limit\":\"1000\",\"percentage_charge\":\"1.2\",\"fixed_charge\":\"2\"}]', 0, 0, 0, 'test', 1, 0, 1, NULL, 'local', '2020-12-27 13:23:36', '2024-11-04 03:40:30'),
(9, 'Flutterwave', 'flutterwave', 'Payment will receive within 1 days', '{\"0\":{\"NGN BANK\":\"NGN BANK\",\"NGN DOM\":\"NGN DOM\",\"GHS BANK\":\"GHS BANK\",\"KES BANK\":\"KES BANK\",\"ZAR BANK\":\"ZAR BANK\",\"INTL EUR & GBP\":\"INTL EUR & GBP\",\"INTL USD\":\"INTL USD\",\"INTL OTHERS\":\"INTL OTHERS\",\"FRANCOPGONE\":\"FRANCOPGONE\",\"XAF/XOF MOMO\":\"XAF/XOF MOMO\",\"mPesa\":\"mPesa\",\"Rwanda Momo\":\"Rwanda Momo\",\"Uganda Momo\":\"Uganda Momo\",\"Zambia Momo\":\"Zambia Momo\",\"Barter\":\"Barter\",\"FLW\":\"FLW\"}}', '[\"NGN BANK\",\"NGN DOM\",\"GHS BANK\"]', '{\"Public_Key\":\"\",\"Secret_Key\":\"\",\"Encryption_Key\":\"\"}', NULL, '[]', '{\"USD\":\"USD\",\"KES\":\"KES\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"UGX\":\"UGX\",\"TZS\":\"TZS\"}', '[\"USD\",\"KES\",\"NGN\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"KES\",\"conversion_rate\":\"1.38\",\"min_limit\":\"10\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"KES\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"10\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"NGN\",\"currency_symbol\":\"AUD\",\"conversion_rate\":\"0.014\",\"min_limit\":\"10\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 0, 1, 0, 'test', 1, 0, 1, 'payoutMethod/3ZHEVOuAMEKXfG2oeGesEkMEXua0isCJPDFbn6Ix.jpg', 'local', '2020-12-27 13:23:36', '2025-01-26 11:39:40'),
(10, 'Razorpay', 'razorpay', 'Payment will receive within 1 days', '', NULL, '{\"account_number\":\"\",\"Key_Id\":\"\",\"Key_Secret\":\"\"}', '{\"webhook\":\"payout\"}', '[]', '{\"INR\":\"INR\"}', '[\"INR\"]', '[{\"name\":\"INR\",\"currency_symbol\":\"INR\",\"conversion_rate\":\"0.76\",\"min_limit\":\"10\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 0, 1, 0, 'test', 1, 0, 1, 'payoutMethod/KzWb68n0qIkz998tUDeiTj5T45idCJ7Vsz5rVr6O.jpg', 'local', '2020-12-27 13:23:36', '2025-01-26 11:39:40'),
(11, 'Paystack', 'paystack', 'Payment will receive within 1 days', '', NULL, '{\"Public_key\":\"\",\"Secret_key\":\"\"}', '{\"webhook\":\"payout\"}', '[]', '{\"NGN\":\"NGN\",\"GHS\":\"GHS\",\"ZAR\":\"ZAR\"}', '[\"NGN\",\"GHS\",\"ZAR\"]', '[{\"name\":\"NGN\",\"currency_symbol\":\"NGN\",\"conversion_rate\":\"7.40\",\"min_limit\":\"50\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"GHS\",\"currency_symbol\":\"GHS\",\"conversion_rate\":\"0.11\",\"min_limit\":\"50\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"ZAR\",\"currency_symbol\":\"ZAR\",\"conversion_rate\":\"0.17\",\"min_limit\":\"50\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 0, 1, 0, 'test', 1, 1, 1, 'payoutMethod/R171DPtw6jtQL7tvf9NR2gtnwhMTRpFlW51aPjKP.png', 'local', '2020-12-27 13:23:36', '2025-01-26 11:39:40'),
(12, 'Coinbase', 'coinbase', 'Payment will receive within 1 days', '', NULL, '{\"API_Key\":\"\",\"API_Secret\":\"\",\"Api_Passphrase\":\"\"}', '{\"webhook\":\"payout\"}', '{\"crypto_address\":{\"field_name\":\"crypto_address\",\"field_label\":\"Crypto Address\",\"type\":\"text\",\"validation\":\"required\"}}', '{\"BNB\":\"BNB\",\"BTC\":\"BTC\",\"XRP\":\"XRP\",\"ETH\":\"ETH\",\"ETH2\":\"ETH2\",\"USDT\":\"USDT\",\"BCH\":\"BCH\",\"LTC\":\"LTC\",\"XMR\":\"XMR\",\"TON\":\"TON\"}', '[\"BNB\"]', '[{\"name\":\"BNB\",\"currency_symbol\":\"BNB\",\"conversion_rate\":\"0.068\",\"min_limit\":\"1000\",\"max_limit\":\"1000000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0.5\"}]', 0, 1, 0, 'test', 1, 0, 1, 'payoutMethod/moST8wELN5rooqTg1jO5KBeKPrpOn2be3FNeUziY.png', 'local', '2020-12-27 13:23:36', '2025-01-26 11:39:40'),
(14, 'Perfect Money', 'perfectmoney', 'Payment will receive within 1 days', '', NULL, '{\"Passphrase\":\"\",\"Account_ID\":\"\",\"Payer_Account\":\"\"}', '', '[]', '{\"USD\":\"USD\",\"EUR\":\"EUR\"}', '[\"USD\",\"EUR\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":\"0.0081\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 0, 1, 0, 'test', 1, 1, 1, 'payoutMethod/Y7nhbYHjmNnKXDFPQfCBbmGpHvrjH6L8clZXrLrX.jpg', 'local', '2020-12-27 13:23:36', '2025-01-26 11:39:40'),
(15, 'Paypal', 'paypal', 'Payment will receive within 1 days', '', NULL, '{\"cleint_id\":\"\",\"secret\":\"\"}', '{\"webhook\":\"payout\"}', '[]', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"USD\"}', '[\"EUR\",\"USD\"]', '[{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":\"0.0081\",\"min_limit\":\"1\",\"max_limit\":\"1000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"},{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"1000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 0, 1, 1, 'test', 1, 0, 1, 'payoutMethod/UZ9Ask4ycKIT1XML896p035iDb1f3wGm5HebFALO.png', 'local', '2020-12-27 13:23:36', '2025-01-26 11:39:40'),
(16, 'Binance', 'binance', 'Payment will receive within 1 days', '', NULL, '{\"API_Key\":\"\",\"KEY_Secret\":\"\"}', '', '[]', '{\"BNB\":\"BNB\",\"BTC\":\"BTC\",\"XRP\":\"XRP\",\"ETH\":\"ETH\",\"ETH2\":\"ETH2\",\"USDT\":\"USDT\",\"BCH\":\"BCH\",\"LTC\":\"LTC\",\"XMR\":\"XMR\",\"TON\":\"TON\"}', '[\"BNB\"]', '[{\"name\":\"BNB\",\"currency_symbol\":\"BNB\",\"conversion_rate\":\"0.0043\",\"min_limit\":\"10\",\"max_limit\":\"1000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 0, 1, 1, 'test', 1, 0, 1, 'payoutMethod/X6ZKvtR4xcxlSnHKS8FZQuTmOQy270hOyPeUbmSh.png', 'local', '2020-12-27 13:23:36', '2025-01-26 11:39:40');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `is_invest_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'fixed/range\r\n0 = range, 1= fixed',
  `is_return_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Will you get the profit on the investment for a certain period of time or will you continue to get it for life?',
  `is_installment` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Is there an opportunity to repay the money invested in a particular property in stages or not?',
  `is_capital_back` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Will he ever get back the investment amount?',
  `is_investor` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Can the investor sell his shares to another investor or not?',
  `fixed_amount` decimal(11,2) DEFAULT NULL,
  `minimum_amount` decimal(11,2) DEFAULT NULL,
  `maximum_amount` decimal(11,2) DEFAULT NULL,
  `total_investment_amount` decimal(11,2) DEFAULT NULL COMMENT 'Total investment amount is the total amount of investment required in a particular property.',
  `available_funding` decimal(11,2) DEFAULT NULL COMMENT 'The amount left to invest in a particular property',
  `how_many_days` int(11) DEFAULT NULL COMMENT 'After how many days you will get the return',
  `how_many_times` int(11) DEFAULT NULL COMMENT 'How many times profit will be returned',
  `return_time` int(11) DEFAULT NULL,
  `return_time_type` varchar(10) DEFAULT NULL,
  `profit` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT 'fixed/%',
  `profit_type` int(11) DEFAULT NULL COMMENT 'fixed/%',
  `loss` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT 'fixed/%',
  `loss_type` int(11) DEFAULT NULL COMMENT 'fixed/%',
  `total_installments` int(11) DEFAULT NULL,
  `installment_amount` decimal(11,2) DEFAULT NULL,
  `installment_duration` int(11) DEFAULT NULL,
  `installment_duration_type` varchar(255) DEFAULT NULL,
  `installment_late_fee` decimal(11,2) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `faq` text DEFAULT NULL,
  `video` text DEFAULT NULL,
  `amenity_id` text DEFAULT NULL,
  `address_id` bigint(20) UNSIGNED NOT NULL,
  `location` text DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `driver` varchar(255) DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL COMMENT 'property investment start date',
  `expire_date` timestamp NULL DEFAULT NULL COMMENT 'property investment expire date',
  `is_payment` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=>manual profit return 1=>auto profit return',
  `is_featured` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Whether or not this property will show on the home page feature section',
  `is_available_funding` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'How much more money is available for investment in the property now can the user or invest frontend see it or not?',
  `status` int(11) NOT NULL DEFAULT 0,
  `get_favourite_count` int(11) NOT NULL DEFAULT 0,
  `reviews_count` int(11) NOT NULL DEFAULT 0,
  `avg_rating` decimal(5,2) NOT NULL DEFAULT 0.00,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `title`, `is_invest_type`, `is_return_type`, `is_installment`, `is_capital_back`, `is_investor`, `fixed_amount`, `minimum_amount`, `maximum_amount`, `total_investment_amount`, `available_funding`, `how_many_days`, `how_many_times`, `return_time`, `return_time_type`, `profit`, `profit_type`, `loss`, `loss_type`, `total_installments`, `installment_amount`, `installment_duration`, `installment_duration_type`, `installment_late_fee`, `details`, `faq`, `video`, `amenity_id`, `address_id`, `location`, `thumbnail`, `driver`, `start_date`, `expire_date`, `is_payment`, `is_featured`, `is_available_funding`, `status`, `get_favourite_count`, `reviews_count`, `avg_rating`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'BR Diversified Industrial Portfolio V, DST', 0, 1, 0, 1, 1, NULL, 100000.00, 10000000.00, 500000000.00, 500000000.00, NULL, NULL, NULL, NULL, 10.00, 1, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, '<div class=\"section-title\" style=\"font-size:22px;font-family:\'Gotham SSm A\', \'Gotham SSm B\', Arial, Helvetica, sans-serif;color:rgb(32,32,32);\">BR Diversified Industrial Portfolio V, DST</div><div class=\"section-copy\" style=\"font-family:\'Gotham SSm A\', \'Gotham SSm B\', Arial, Helvetica, sans-serif;font-size:16px;color:rgb(32,32,32);\">BR Diversified Industrial Portfolio V, DST is a 100% leased portfolio of two industrial buildings located in the Sunbelt states of NC and SC. In addition to the buildings, both properties have expansive industrial outdoor storage areas. The investment seeks to provide investors with stable monthly cash flow and the potential for capital appreciation.</div><div class=\"section-copy\" style=\"font-family:\'Gotham SSm A\', \'Gotham SSm B\', Arial, Helvetica, sans-serif;font-size:16px;color:rgb(32,32,32);\"><br></div><div class=\"section-copy\" style=\"font-family:\'Gotham SSm A\', \'Gotham SSm B\', Arial, Helvetica, sans-serif;font-size:16px;color:rgb(32,32,32);\"><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span>Eligibility</span><span class=\"value\" style=\"text-align:right;\">1031 Exchange Only</span></div><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span>Minimum Investment</span><span class=\"value minimum-investment\" style=\"text-align:right;\">$100,000</span></div><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span>Estimated Hold Period</span><span class=\"value\" style=\"text-align:right;\">7 to 10 Years</span></div><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span>Investment Type</span><span class=\"value\" style=\"text-align:right;\">Equity</span></div><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span>Offering Loan-to-Value</span><span class=\"value\" style=\"text-align:right;\">0.0%</span></div><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span>721 Type</span><span class=\"value\" style=\"text-align:right;\">Optional</span></div><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span class=\"value\" style=\"text-align:right;\"><br></span></div><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span class=\"value\" style=\"text-align:right;\"><br></span></div><ol><li><span class=\"value\" style=\"text-align:right;\"><br></span></li><li><span class=\"value\" style=\"text-align:right;\"></span><ul><li><div></div><ul><li><span style=\"font-weight:700;\">Creditworthy Tenants:</span> NVR (BBB+) and Builders FirstSource (BB-) are both credit-rated, publicly traded companies with $20+ billion market caps.</li></ul></li><li><ul><li></li></ul><div><span style=\"font-weight:700;\">Well-Located Assets with Strong Market Fundamentals:</span> The properties are situated in high-demand Sunbelt markets with access to exceptional distribution routes providing connectivity to major population centers. NVR’s property in Fayetteville is surrounded by global corporations and distribution companies such as FedEx, Amazon, Pepsi, and Soffe, while Builders FirstSource’s submarket has exhibited a five-year average vacancy of 3.1%. (CoStar)</div></li></ul><div class=\"IOPage-Highlights-container-copy\" style=\"color:rgb(0,0,0);\"><div></div><div><span style=\"font-weight:700;\">Potential Value Creation:</span> With Builders FirstSource’s current lease + extension ending in Year 8 of the hold period, Bluerock projects Builders FirstSource (or a new tenant) will resign at double the in-place rent to align with current market rental rates.</div></div><div class=\"IOPage-Highlights-container-copy\" style=\"color:rgb(0,0,0);\"><div></div><div><span style=\"font-weight:700;\">Robust Industrial Sector Fundamentals:</span> Despite heightened demand, new industrial starts are down creating a positive supply-demand environment. The industrial sector is forecasted to have the highest NOI growth (5.1% annualized) among major commercial real estate sectors through 2028. (Green Street)</div><div><br></div></div><div class=\"IOPage-Highlights-container-copy\" style=\"color:rgb(0,0,0);\"><div></div><div><span style=\"font-weight:700;\">Highly Coveted Industrial Outdoor Storage:</span> The Properties provide their tenants with industrial outdoor storage, a highly sought-after niche property type defined as industrial properties with a large outdoor component, used for storage, heavy industrial use, or truck and vehicle parking. Industrial outdoor storage is difficult to find since municipalities are hesitant to approve the projects and zoning classifications need to be aligned to allow for the space. The lack of supply continues to lead to large rental increases within this sector.</div></div><div class=\"IOPage-Highlights-container-copy\" style=\"color:rgb(0,0,0);\"><div></div><div><span style=\"font-weight:700;\">Debt-Free Offering:</span> The DST is an all-cash, debt-free offering eliminating the risk of lender foreclosure and providing exit strategy flexibility.</div></div></li></ol></div>', NULL, NULL, '[\"1\",\"2\",\"3\",\"4\",\"5\"]', 1, NULL, 'property/thumbnail/Xv0761zm1oSrSO6lwKlNwM3M5bHQih.webp', 'local', '2025-08-22 16:00:00', '2030-08-15 16:00:00', 1, 1, 1, 1, 0, 0, 0.00, NULL, '2025-08-22 08:10:33', '2025-08-29 04:05:04'),
(2, 'LSC-Rochester NY, DST', 0, 1, 0, 1, 1, NULL, 150000.00, 30000000.00, 700000000.00, 700000000.00, 2, NULL, 1, 'years', 12.00, 1, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, '<div class=\"section-title\" style=\"font-size:22px;font-family:\'Gotham SSm A\', \'Gotham SSm B\', Arial, Helvetica, sans-serif;color:rgb(32,32,32);\">LSC-Rochester NY, DST</div><div class=\"section-copy\" style=\"font-family:\'Gotham SSm A\', \'Gotham SSm B\', Arial, Helvetica, sans-serif;font-size:16px;color:rgb(32,32,32);\">LSC-Rochester NY DST owns Legacy at Clover Blossom (\"the Property\"), a 219-unit independent living facility located in the southeast suburbs of Rochester, NY. Constructed in 2006, the highly-amenitized property is stabilized after undergoing approximately $3.25 million worth of renovations and improvements since 2021.</div><div class=\"section-copy\" style=\"font-family:\'Gotham SSm A\', \'Gotham SSm B\', Arial, Helvetica, sans-serif;font-size:16px;color:rgb(32,32,32);\"><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span>Eligibility</span><span class=\"value\" style=\"text-align:right;\">    --1031 Exchange Only</span></div><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span>Minimum Investment</span><span class=\"value minimum-investment\" style=\"text-align:right;\">--$100,000</span></div><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span>Estimated Hold Period</span><span class=\"value\" style=\"text-align:right;\">--10 Years</span></div><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span>Investment Type</span><span class=\"value\" style=\"text-align:right;\">--Equity</span></div><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span>Offering Loan-to-Value</span><span class=\"value\" style=\"text-align:right;\">--48.2%</span></div><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span>721 Type</span><span class=\"value\" style=\"text-align:right;\">--None</span></div><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span class=\"value\" style=\"text-align:right;\"><br></span></div><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span class=\"value\" style=\"text-align:right;\"></span><div class=\"IOPage-Highlights-container-copy\" style=\"color:rgb(0,0,0);\"><div><span style=\"font-weight:700;\">Well-Maintained Asset:</span> Constructed in 2006, the Property has been well-maintained with limited deferred maintenance. Prior ownership reportedly invested approx. $3.25 million since 2021 into the Property, including but not limited to common area upgrades, amenity improvements, and unit renovations.</div></div><div class=\"IOPage-Highlights-container-copy\" style=\"color:rgb(0,0,0);\"><div></div><div><span style=\"font-weight:700;\">Expansive Amenity Package:</span> Management provides an enhanced living experience through social programming and the use of community amenities, including an indoor pool, fitness center, bocce ball court, salon, library, chapel, and media room. In-unit amenities include fully equipped kitchens (excluding studios and petite one-bedrooms), weekly housekeeping, all utilities including cable and internet, and 24-hour associate support.</div></div><div class=\"IOPage-Highlights-container-copy\" style=\"color:rgb(0,0,0);\"><div></div><div><span style=\"font-weight:700;\">Convenient Location:</span> The Property is located within the Town of Brighton, which offers a number of nearby amenities including recreational, medical, dining, and shopping. Nearby amenities include Ellison Park, which has over 447-acres of green space offering numerous amenities including trails, athletic fields, playgrounds, disc golf, tennis and pickleball courts, and fishing. The Property has convenient access to nearby retailers including Wegmans, ALDI, Trader Joe’s, Barnes &amp; Noble, and CVS Pharmacy.</div></div><div class=\"IOPage-Highlights-container-copy\" style=\"color:rgb(0,0,0);\"><div></div><div><span style=\"font-weight:700;\">Enhanced Quality of Life:</span> According to US News &amp; World Report, Rochester, NY is within the top 25 best places to retire in 2024 thanks to a low cost of living, favorable healthcare score, and praise for its friendly residents. Rochester offers more than 3,500 acres of nationally recognized parks along with water activities along Lake Ontario.</div></div><div class=\"IOPage-Highlights-container-copy\" style=\"color:rgb(0,0,0);\"><div></div><div><span style=\"font-weight:700;\">Stable Demographics:</span> Per ESRI, the 55+ population is expected to comprise 30.3% of the population within a 3-mile radius by 2029. The average household income and home value within a 3-mile radius is $105,896 and $297,003, respectively.</div></div><div class=\"IOPage-Highlights-container-copy\" style=\"color:rgb(0,0,0);\"><div></div><div><span style=\"font-weight:700;\">Experienced Sponsorship:</span> Founded in 2016, Livingston Street Capital (“LSC”) is a boutique commercial real estate private equity firm focused on acquiring and managing active adult and independent living facilities across the country.</div></div></div><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span class=\"value\" style=\"text-align:right;\"><br></span></div></div>', NULL, NULL, '[\"1\",\"2\",\"3\",\"4\",\"5\"]', 1, NULL, 'property/thumbnail/j5JRYxW5Ph4HkfqKE9BD4HWyQsf7Xg.webp', 'local', '2025-08-28 16:00:00', '2029-08-15 16:00:00', 1, 0, 1, 1, 0, 0, 0.00, NULL, '2025-08-22 08:41:09', '2025-08-29 04:05:04'),
(3, 'PG Ocean DST', 1, 1, 0, 1, 1, 25000.00, NULL, NULL, 50000000.00, 49975000.00, 1, NULL, 6, 'months', 10.00, 1, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, '<p>Overview</p><p>PG Ocean DST – Residence Inn Ocean Township</p><p><br></p><p>Residence Inn Ocean Township is a premier extended-stay hotel situated in Central New Jersey, just 10 minutes from the Jersey Shore. Built in 2024, this upscale property features 114 modern rooms and a wealth of amenities, including an indoor pool, fitness center, meeting spaces, business center, fire pit, outdoor sports court, and complimentary hot breakfast. Owned and managed by Peachtree Group, a distinguished hospitality sponsor with over 700 investments totaling $11.7 billion, this property offers a strong investment opportunity.</p><p><br></p><p>Property Details</p><p>Minimum Investment: $100,000</p><p>Eligibility: 1031 Exchange Only</p><p>Investment Type: Equity</p><p>Estimated Hold Period: 6 to 8 years</p><p>Offering Loan-to-Value: 0%</p><p>721 Type: None</p><p>For additional details, please refer to the Sponsor’s Investment Memorandum.</p><p><br></p><p>Investment Highlights</p><p>Newly Constructed Asset</p><p>Built in 2024, this is the newest hotel in its local competitive set, offering state-of-the-art facilities.</p><p><br></p><p>Global Brand Recognition</p><p>Residence Inn by Marriott is a leader in the extended-stay hotel segment, with over 895 properties across more than 19 countries. This hotel benefits from Marriott’s expansive network and the Marriott Bonvoy loyalty program with over 200 million members.</p><p><br></p><p>Prime Location within Mixed-Use Development</p><p>The hotel is part of Ocean Commons, a vibrant mixed-use community featuring popular dining options such as Turning Point Café, Miller’s Ale House, Chick-fil-A, Qdoba, and Wawa, all within easy walking distance.</p><p><br></p><p>Excellent Connectivity</p><p>Conveniently located off Route 35 with quick access to Routes 18 and 36, and the Garden State Parkway, guests can easily reach key regional hubs like Newark Airport, New York City, and Philadelphia.</p><p><br></p><p>Situated in a Popular Tourist Destination</p><p>Just three miles from iconic Jersey Shore destinations like Asbury Park and Long Branch, the hotel benefits from strong seasonal demand thanks to vibrant boardwalks, music scenes, upscale shopping, and oceanfront attractions.</p><p><br></p><p>Nearby Major Developments</p><p>Monmouth County is undergoing significant growth, including the Monmouth Mall transformation into the pedestrian-friendly Monmouth Square, with 900,000 square feet of new retail space including a Whole Foods. Additionally, Netflix is investing $900 million to develop a state-of-the-art East Coast production studio at the nearby Fort Monmouth site.</p><p><br></p><p>Experienced Hotel Management</p><p>Managed by Peachtree Hospitality Management, a division of Peachtree Group, currently overseeing 106 hotels and 13,000+ rooms across 28 brands in 27 states. They have substantial expertise managing extended-stay hotels, including many Residence Inn locations.</p><p><br></p><p>Trusted Sponsor with Proven Track Record</p><p>Peachtree Group is a vertically integrated private equity firm with 700+ investments totaling $11.7 billion in assets. The firm has invested in 14 Residence Inn by Marriott properties across 11 states.<br><br></p><p>Management</p><p>For more information, view the Sponsor\'s Investment Memorandum.</p><p><br></p><p>Peachtree Group</p><p>Peachtree Group is a privately held, fully integrated real estate investment management, lending, and servicing platform. The company owns, operates, manages, and develops hotels, hotel- and other commercial real estate-related assets throughout the United States. Founded in 2008 as a family office, Peachtree has invested over $4.3 billion into real estate equity and fixed-income transactions with a cost basis of more than $12.6 billion. The firm has approximately 290+ employees outside of hotel operations.</p><p><br></p><p>Peachtree Hospitality Management, a division of Peachtree Group, is an experienced hotel management company that creates loyalty across all stakeholders — associates, guests, and owners.</p><p><br></p><p>Peachtree Hospitality Management delivers dedicated hotel management services for Peachtree Group’s own portfolio and extends that expertise to a growing number of owners as a third-party hotel manager. Their proprietary systems and processes seek to maximize financial performance and value of every asset, deliver efficiencies, and enable hotel teams to provide guests with an uncommon customer experience.</p><p><br></p><p>In 2022, Peachtree Hospitality Management ranked #40 on LODGING Magazine\'s list of top hotel management companies. They currently manage the performance of 108 hotels comprising 28 brands with more than 13,000 keys located in 26 states, including Washington D.C.</p><p><br></p><p>Management Team</p><p><br></p><p>Greg Friedman — Co-Founder &amp; CEO</p><p>Jatin Desai — Co-Founder &amp; CIO/CFO</p><p>Mitul Patel — Co-Founder &amp; COO</p><p>Timothy Witt — President, 1031 Exchange/DST Products</p><p>Financials</p><p>For more information, view the Sponsor\'s Investment Memorandum.</p><p><br></p><p>Distributions</p><p>Please refer to the PG Ocean DST - Private Placement Memorandum in the Documents section for details regarding distributions and fees.</p><p><br></p><p>Disclosures</p><p><br></p><p>Sponsor’s Information Qualified by Investment Documents</p><p>The information on this page is qualified in its entirety by reference to the more complete information about the offering contained in the Sponsor’s Investment Documents. The information on this page is not complete and is subject to change at the Sponsor’s discretion at any time up to the closing date. The Sponsor’s Investment Documents and supplements thereto contain important information about the Sponsor’s offering including relevant investment objectives, the business plan, risks, charges, expenses, and other information, which you should consider carefully before investing. The information on this page should not be used as a basis for an investor’s decision to invest.</p><p><br></p><p>Risk of Investment</p><p>This investment is speculative, highly illiquid, and involves substantial risk. There can be no assurances that all or any of Sponsor’s assumptions, expectations, estimates, goals, hypothetical illustrations, or other aspects of Sponsor’s business plans (“Assumptions”) will be true or that actual performance will bear any relation to Sponsor’s Assumptions, and no guarantee or representation is made that Sponsor’s Assumptions will be achieved. If Sponsor does not achieve its Assumptions, your investment could be materially and adversely affected. A loss of part or all of the principal value of your investment may occur. You should not invest unless you can readily bear the consequences of such loss. Sponsor’s Assumptions should not be relied upon as the primary basis for your decision to invest.</p><p><br></p><p>No Reliance on Forward-Looking Statements; Sponsor Assumptions</p><p>Sponsor is solely responsible for statements made concerning forward-looking statements and Assumptions, which apply only as of the date made, are preliminary and subject to change, and are expressly qualified in their entirety by the disclosures and cautionary statements included in Sponsor’s Investment Documents, which you should carefully review. A Sponsor is obligated to update or revise such forward-looking statements or Assumptions to reflect events or circumstances that arise after the date made or to reflect the occurrence of unanticipated events. Sponsor’s forward-looking statements and Assumptions are hypothetical, not based on actual investment achievements or events, and are presented solely for purposes of providing insight into the Sponsor’s investment objectives, detailing Sponsor’s anticipated risk and reward characteristics, and establishing a benchmark for future evaluation of actual results; therefore, they are not a predictor, projection, or guarantee of future results. You should not rely on Sponsor’s forward-looking statements as a basis to invest.</p><p><br></p><p>Importantly, we do not adopt, endorse, or provide any assurance of returns or as to the accuracy or reasonableness of Sponsor’s Assumptions or forward-looking statements.</p><p><br></p><p>No Reliance on Past Performance</p><p>Any description of past performance is not a reliable indicator of future performance and should not be relied upon as the primary basis to invest.</p><p><br></p>', NULL, NULL, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\"]', 1, NULL, 'property/thumbnail/w0DVZE9rErgohmJMYv8f5ohwli59QT.webp', 'local', '2025-08-20 16:00:00', '2026-01-31 17:00:00', 1, 1, 1, 1, 0, 0, 0.00, NULL, '2025-08-22 11:39:58', '2025-08-29 04:05:04'),
(4, 'Government Lease Holdings 2 DST', 0, 1, 0, 1, 1, NULL, 1000000.00, 20000000.00, 999999999.99, 999999999.99, 4, NULL, 3, 'months', 15.00, 1, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, '<div class=\"section-title\" style=\"font-size:22px;font-family:\'Gotham SSm A\', \'Gotham SSm B\', Arial, Helvetica, sans-serif;color:rgb(32,32,32);\">Government Lease Holdings 2 DST</div><div class=\"section-copy\" style=\"font-family:\'Gotham SSm A\', \'Gotham SSm B\', Arial, Helvetica, sans-serif;font-size:16px;color:rgb(32,32,32);\">Government Lease Holdings 2, DST (“GLH 2”) is a two-property portfolio consisting of mission-critical facilities encumbered by long-term leases to government agencies. Located in the Winston-Salem MSA, the first asset is a 353,238 SF build-to-suit outpatient care facility occupied by the United States Department of Veteran Affairs (“VA”). Located in the Washington D.C. MSA, the second asset is a 574,767 SF build-to-suit office building occupied by the U.S. Citizenship and Immigration Services (“USCIS”).</div><div class=\"section-copy\" style=\"font-family:\'Gotham SSm A\', \'Gotham SSm B\', Arial, Helvetica, sans-serif;font-size:16px;color:rgb(32,32,32);\"><br></div><div class=\"section-copy\" style=\"font-family:\'Gotham SSm A\', \'Gotham SSm B\', Arial, Helvetica, sans-serif;font-size:16px;color:rgb(32,32,32);\"><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span>Eligibility</span><span class=\"value\" style=\"text-align:right;\">1031 Exchange Only</span></div><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span>Minimum Investment</span><span class=\"value minimum-investment\" style=\"text-align:right;\">$100,000</span></div><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span>Estimated Hold Period</span><span class=\"value\" style=\"text-align:right;\">10 Years</span></div><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span>Investment Strategy</span><span class=\"value\" style=\"text-align:right;\">Diversified Fund</span></div><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span>Investment Type</span><span class=\"value\" style=\"text-align:right;\">Equity</span></div><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span>Offering Loan-to-Value</span><span class=\"value\" style=\"text-align:right;\">56.6%</span></div><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span class=\"value\" style=\"text-align:right;\"><br></span></div><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span class=\"value\" style=\"text-align:right;\"></span><div class=\"IOPage-Highlights-container-copy\" style=\"color:rgb(0,0,0);\"><div><span style=\"font-weight:700;\">Experienced Sponsor:</span> Net Lease Capital Advisors is a real estate investment firm that specializes in net lease and U.S. Government-occupied properties, transacting on more than $16 billion in real estate.</div></div><div class=\"IOPage-Highlights-container-copy\" style=\"color:rgb(0,0,0);\"><div></div><div><span style=\"font-weight:700;\">Long Term Leases:</span> Each tenant has 10+ years remaining on their lease term.</div></div><div class=\"IOPage-Highlights-container-copy\" style=\"color:rgb(0,0,0);\"><div></div><div><span style=\"font-weight:700;\">Leases Backed by Government Credit:</span> The properties are leased to the General Services Administration (“GSA”), a government entity that leases space and then subleases that space to other government entities/agencies. The GSA is considered the nation’s largest public real estate organization with a 350+ million SF portfolio utilized by over one million federal employees. (GSA.gov)</div></div><div class=\"IOPage-Highlights-container-copy\" style=\"color:rgb(0,0,0);\"><div></div><div><span style=\"font-weight:700;\">Diversified Portfolio:</span> The portfolio is diversified across two different property types occupied by two different tenants in two locations.</div></div><div class=\"IOPage-Highlights-container-copy\" style=\"color:rgb(0,0,0);\"><div></div><div><span style=\"font-weight:700;\">Built-to-Suit Assets:</span> The VA and USCIS properties were build-to-suit assets, constructed specifically for their respective tenants’ needs. Developed in 2015 and 2020, respectively, both properties remain in good condition with minimal immediate or short-term repair needs, according to the physical condition reports. The USCIS property is a Level IV secured building, adding additional value to the property. (GSA.gov)</div></div><div class=\"IOPage-Highlights-container-copy\" style=\"color:rgb(0,0,0);\"><div></div><div><span style=\"font-weight:700;\">Growing Veteran Population:</span> Per the VA, the veteran population continues to grow in the Piedmont Triad region, increasing demand for ambulatory/outpatient care. The facility’s Urgent Care Clinic plans to serve 10,000 local veterans each year. (VA.gov)</div></div><div class=\"IOPage-Highlights-container-copy\" style=\"color:rgb(0,0,0);\"><div></div><div><span style=\"font-weight:700;\">Consolidated Operations to Camp Springs Property:</span> USCIS consolidated its headquarters from five leased locations and one federal asset to this one facility, centralizing their operations and reducing their footprint. (USCIS.gov)</div></div></div></div>', NULL, NULL, '[\"1\",\"2\",\"3\",\"4\",\"5\"]', 1, NULL, 'property/thumbnail/qNJKx2kFtL9tdKuJ01REXMwawia7Qm.webp', 'local', '2025-08-22 20:06:00', '2025-08-22 20:06:00', 1, 1, 1, 1, 0, 0, 0.00, NULL, '2025-08-22 20:06:16', '2025-08-29 04:05:04'),
(5, 'The TS Communities Distressed GP Fund', 0, 1, 0, 0, 1, NULL, 50000.00, 1000000.00, 999999999.99, 999999999.99, 2, NULL, 1, 'years', 12.00, 1, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, '<div class=\"section-title\" style=\"font-size:22px;font-family:\'Gotham SSm A\', \'Gotham SSm B\', Arial, Helvetica, sans-serif;color:rgb(32,32,32);\">The TS Communities Distressed GP Fund</div><div class=\"section-copy\" style=\"font-family:\'Gotham SSm A\', \'Gotham SSm B\', Arial, Helvetica, sans-serif;font-size:16px;color:rgb(32,32,32);\">The TS Communities Distressed GP Fund (\"the Fund\") offers investors the chance to invest alongside repeat sponsor, TS Communities. The Fund will receive 25% of TS Communities\' realized carried interest with no fees charged by TS Communities at the fund level. The Fund’s objective is to acquire multifamily properties in strong markets that are experiencing distress, be it financial, operational, physical, or other situational distress.</div><div class=\"section-copy\" style=\"font-family:\'Gotham SSm A\', \'Gotham SSm B\', Arial, Helvetica, sans-serif;font-size:16px;color:rgb(32,32,32);\"><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span>Estimated First Distribution</span><span class=\"value\" style=\"text-align:right;\">   10/2025</span></div><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span>Minimum Investment</span><span class=\"value minimum-investment\" style=\"text-align:right;\">$50,000</span></div><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span>Investment Strategy</span><span class=\"value\" style=\"text-align:right;\">Value-Add</span></div><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span>Investment Type</span><span class=\"value\" style=\"text-align:right;\">Equity</span></div><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span class=\"value\" style=\"text-align:right;\"><br></span></div><div class=\"IOPage-Details-stats-item\" style=\"background-color:rgb(249,250,251);\"><span class=\"value\" style=\"text-align:right;\"></span><div class=\"IOPage-Highlights-container-copy\" style=\"color:rgb(0,0,0);\"><div><span style=\"font-weight:700;\">Experienced, Repeat Sponsor:</span> <span style=\"color:rgb(32,32,32);background-color:rgb(255,255,255);\">TS</span> Communities is a private investment firm with over 2,700 multifamily units acquired and a fully dedicated team of acquisitions, underwriting, and asset management professionals.</div></div><div class=\"IOPage-Highlights-container-copy\" style=\"color:rgb(0,0,0);\"><div></div><div><span style=\"font-weight:700;\">Lower Potential Costs:</span> No fees or expenses are charged by <span style=\"color:rgb(32,32,32);background-color:rgb(255,255,255);\">TS</span> Communities at the fund level. <span style=\"color:rgb(32,32,32);background-color:rgb(255,255,255);\">TS</span> Communities only shares in the carried interest with investors. This arrangement allows the potential for higher net returns due to lower direct costs.</div></div><div class=\"IOPage-Highlights-container-copy\" style=\"color:rgb(0,0,0);\"><div></div><div><span style=\"font-weight:700;\">Earn Carried Interest:</span> As the Fund\'s general partner, <span style=\"color:rgb(32,32,32);background-color:rgb(255,255,255);\">TS</span> Communities has the potential to receive carried interest on investments. The Fund will receive 25% of <span style=\"color:rgb(32,32,32);background-color:rgb(255,255,255);\">TS</span> Communities\' realized carried interest.</div></div><div class=\"IOPage-Highlights-container-copy\" style=\"color:rgb(0,0,0);\"><div></div><div><span style=\"font-weight:700;\">Distress in Multifamily:</span> An evolving economic and interest rate environment has opened a window of opportunity where select multifamily properties can be acquired at prices that are significantly discounted. A tighter lending environment coupled with rapid interest rate hikes to combat inflation have put downward pressure on valuations and left many owners forced to sell. <span style=\"color:rgb(32,32,32);background-color:rgb(255,255,255);\">TS</span> Communities believes the next 12-24 months will present opportunities to capitalize on a brief period of market dislocation.</div></div><div class=\"IOPage-Highlights-container-copy\" style=\"color:rgb(0,0,0);\"><div></div><div><span style=\"font-weight:700;\">Leveraged Equity Return:</span> The Fund is structured to gain a leveraged equity return by co-investing an anticipated 5% to 25% in individual property acquisitions with various co-investors. By receiving a portion of <span style=\"color:rgb(32,32,32);background-color:rgb(255,255,255);\">TS</span> Communities\' carried interest, Fund investors will receive a return that is anticipated to be above the property-level returns, surpassing the returns of traditional limited partners.</div></div><div class=\"IOPage-Highlights-container-copy\" style=\"color:rgb(0,0,0);\"><div></div><div><span style=\"font-weight:700;\">Targeted Opportunities:</span> The Fund will target core-plus and/or value-add multifamily opportunities that are experiencing distress, be it financial, operational, physical, or other situational distress.</div></div><div class=\"IOPage-Highlights-container-copy\" style=\"color:rgb(0,0,0);\"><div></div><div><span style=\"font-weight:700;\">Immediate Capital Deployment:</span> The Fund has already made two investments, Rose Hill Townhomes &amp; Villas and Xander Apartments, both located in the Columbus MSA. This allows for an immediate participation in cash flow distribution.</div></div></div></div>', NULL, NULL, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\"]', 1, NULL, 'property/thumbnail/WFsTLZJTYRGrVd7NyhAGK1JJl0PRzH.webp', 'local', '2025-08-22 20:39:00', '2026-09-25 20:39:00', 1, 1, 1, 1, 0, 0, 0.00, NULL, '2025-08-22 20:39:04', '2025-08-29 04:05:04'),
(6, 'Palace Villas Ostra', 0, 1, 0, 0, 1, NULL, 250000.00, 1000000.00, 32671728.00, 32671728.00, NULL, NULL, NULL, NULL, 6.00, 1, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, '<h2>An iconic residential presence</h2><p style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"></p><p></p><p></p><p style=\"color:rgb(86,94,89);font-family:\'Neuzeit Office Regular\';font-size:18px;\">Set within the exclusive community of The Oasis, Palace Villas Ostra introduces a new benchmark for waterfront villa living in Dubai. This low-rise masterpiece offers serene water views and euphoric green surroundings so you can immerse yourself in the peace. And with easy access to premier dining, shopping, and entertainment, you’re never far from the city\'s pulse.</p><p style=\"color:rgb(86,94,89);font-family:\'Neuzeit Office Regular\';font-size:18px;\"><br></p><h2>Exquisite design &amp; unmatched amenities</h2><p style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"></p><p style=\"color:rgb(86,94,89);font-family:\'Neuzeit Office Regular\';font-size:18px;\"></p><p></p><p style=\"color:rgb(86,94,89);font-family:\'Neuzeit Office Regular\';font-size:18px;\">Palace Villas Ostra showcases impeccable craftsmanship, emphasizing modern elegance. Here, residents can experience seamless indoor-outdoor living with expansive layouts and floor to ceiling windows that invite natural light. Indulge in luxurious amenities, including serene water features, lush landscaping, wellness areas, and exclusive access to leisure facilities. Whether you\'re unwinding after a long day or entertaining guests, the exclusive lounges and curated event spaces offer the perfect setting to relax and connect. </p><p style=\"color:rgb(86,94,89);font-family:\'Neuzeit Office Regular\';font-size:18px;\"><br></p><h2>A lifestyle of elegance &amp; connectivity</h2><p style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"></p><p style=\"color:rgb(86,94,89);font-family:\'Neuzeit Office Regular\';font-size:18px;\"></p><p></p><p style=\"color:rgb(86,94,89);font-family:\'Neuzeit Office Regular\';font-size:18px;\">At Palace Villas Ostra, luxury is a way of life. This residential haven fosters community while offering ultimate convenience and style. Enjoy a sophisticated lifestyle that balances tranquility and vibrancy - a clear sign that you’ve finally found your home. Discover modern living for those who seek the extraordinary. </p><p style=\"color:rgb(86,94,89);font-family:\'Neuzeit Office Regular\';font-size:18px;\"><br></p><h2>Perfectly located</h2><p style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"></p><p style=\"color:rgb(86,94,89);font-family:\'Neuzeit Office Regular\';font-size:18px;\"></p><p></p><ul><li>20 mins to Downtown Dubai</li><li>20 mins to The Dubai Mall</li><li>15 mins to Dubai Intl Airport</li><li>10 mins to Sheikh Zayed Road</li><li>14 mins to Dubai Marina</li></ul>', NULL, NULL, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\"]', 2, NULL, 'property/thumbnail/QOgijwos7ToKFSNIxuCiuTXFuZF8F3.webp', 'local', '2025-08-23 13:50:38', '2025-08-23 13:50:38', 1, 0, 0, 1, 0, 0, 0.00, NULL, '2025-08-23 13:50:38', '2025-08-29 04:05:04'),
(7, 'The LX by Mulk, Arjan, Dubai', 0, 1, 0, 0, 1, NULL, 400000.00, 3280000.00, 3280000.00, 3280000.00, NULL, NULL, NULL, NULL, 6.00, 1, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, '<div class=\"features-list_prop\" style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"><h2>Investment Opportunity | High-end | Arjan</h2></div><h1>Office space for sale in The LX by Mulk, Arjan, Dubai</h1><div class=\"rooms-count count-2\" style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"><div class=\"room-info\"><p><i></i></p><p style=\"color:rgb(86,94,89);\">BUA:</p><p style=\"font-family:\'Neuzeit Office Bold\';font-weight:700;\">1,683 sq.ft</p></div><div class=\"room-info\"><p><i></i></p><p style=\"color:rgb(86,94,89);\">Completion Status:</p><p style=\"font-family:\'Neuzeit Office Bold\';font-weight:700;\">Offplan Primary</p></div></div><div class=\"description-block\" style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"><div class=\"property-long-description\" style=\"color:rgb(86,94,89);\">haus &amp; haus is delighted to present office space in LX by MULK a G+6 commercial tower, introducing a boutique workspace<br>experience to the rapidly developing Arjan business hub. Offering unit sizes from 944 to 3,000 sq. ft., it caters to businesses of all sizes.<br><br>Please call for more information, to arrange a viewing or to make an offer.<br><br>For further details, please drop into our flagship office at the Gold &amp; Diamond Park – or browse the incredible selection of properties we maintain at the haus &amp; haus website. Our agents will be happy to answer any industry-related query you may have.</div></div><div class=\"property-horizontal-line\" style=\"background-color:rgb(243,243,243);color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"></div><div class=\"features-details\" style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"><h5>Features</h5><ul><li>Private Balcony</li><li>Premium finishes throughout the building</li><li>Impressive double-height lobby</li><li>Onsite retail and F&amp;B outlets</li><li>Rooftop wellness zones for relaxation and recreation</li><li>Prime location: Minutes from Sheikh Zayed Road</li><li>Close to upcoming Metro station</li><li>234 parking bays + valet service</li><li>Payment Plan (60/40)</li><li>Flexible office layouts for diverse business needs</li><li>Suitable for investors and end-users</li><li>Arjan, Dubai – a rapidly developing business hub</li></ul></div>', NULL, NULL, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\"]', 2, '', 'property/thumbnail/ydVfgy5XB5RLnR4FlWzCdrbCUcLUiw.webp', 'local', '2025-08-23 16:28:00', '2025-08-23 16:28:00', 1, 1, 1, 1, 0, 0, 0.00, NULL, '2025-08-23 16:28:35', '2025-08-29 04:05:04'),
(8, 'Jumeirah Residences', 0, 1, 0, 0, 0, NULL, 30000.00, 3510000.00, 351000000.00, 351000000.00, NULL, NULL, NULL, NULL, 6.00, 1, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, '<h2>An icon reimagined for modern living</h2><p style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"></p><p></p><p></p><p style=\"color:rgb(86,94,89);font-family:\'Neuzeit Office Regular\';font-size:18px;\">Positioned alongside the Museum of the Future and the DIFC skyline, Jumeirah Residences Emirates Towers delivers a rare opportunity to live within one of Dubai’s most defining landmarks. With uninterrupted views of the city, curated landscaping and access to a gated urban park, this address offers privacy, prestige and presence.</p><p style=\"color:rgb(86,94,89);font-family:\'Neuzeit Office Regular\';font-size:18px;\"><br></p><h2>Crafted interiors, sculpted surroundings</h2><p style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"></p><p style=\"color:rgb(86,94,89);font-family:\'Neuzeit Office Regular\';font-size:18px;\"></p><p></p><p style=\"color:rgb(86,94,89);font-family:\'Neuzeit Office Regular\';font-size:18px;\">Every residence at Jumeirah Residences Emirates Towers is designed by award-winning SCDA Architects, blending refined materials with flowing layouts and floor-to-ceiling glazing. From infinity pools to wellness spaces, private lounges to dining terraces, the amenities here are thoughtfully composed for elegance and everyday use.</p><p style=\"color:rgb(86,94,89);font-family:\'Neuzeit Office Regular\';font-size:18px;\"><br></p><h2>Urban life, elevated</h2><p style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"></p><p style=\"color:rgb(86,94,89);font-family:\'Neuzeit Office Regular\';font-size:18px;\"></p><p></p><p style=\"color:rgb(86,94,89);font-family:\'Neuzeit Office Regular\';font-size:18px;\">At Jumeirah Residences Emirates Towers, you’re connected to everything without compromising on calm. With direct access to Downtown, DIFC, and Sheikh Zayed Road, plus walkable links to the Museum of the Future, this is city living, thoughtfully connected. A lifestyle of substance, style and quiet confidence awaits.</p><p style=\"color:rgb(86,94,89);font-family:\'Neuzeit Office Regular\';font-size:18px;\"><br></p><h2>Perfectly located</h2><p style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"></p><p style=\"color:rgb(86,94,89);font-family:\'Neuzeit Office Regular\';font-size:18px;\"></p><p></p><ul><li>7 mins to Dubai Mall</li><li>7 mins to Burj Khalifa</li><li>10 mins to City Walk</li><li>15 mins to Dubai Design District</li><li>17 mins to J1 Beach<br> </li></ul>', NULL, NULL, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\"]', 2, NULL, 'property/thumbnail/SS05DoqZokZh0CSIZ5ixXyHTXxr0Gp.webp', 'local', '2025-08-23 17:42:44', '2025-08-23 17:42:44', 1, 1, 1, 1, 0, 0, 0.00, NULL, '2025-08-23 17:42:44', '2025-08-29 04:05:04'),
(9, 'Binghatti Phoenix, Jumeirah Village Circle, Dubai', 0, 1, 0, 0, 1, NULL, 350000.00, 5000000.00, 3500000.00, 3500000.00, NULL, NULL, NULL, NULL, 5.00, 1, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, '<div class=\"description-block\" style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"><div class=\"property-long-description\" style=\"color:rgb(86,94,89);\">TwoSigma is proud to present this prime retail unit in the renowned Binghatti Phoenix building, offering exceptional potential for businesses looking to establish a strong presence.<br><br>This shell and core unit is ready for customization, allowing you to design the space to suit your specific needs. With multiple options available, this versatile retail space offers flexibility to cater to a variety of business types. The unit is road-facing, ensuring high visibility and exposure to both pedestrian and vehicular traffic, making it an ideal location for attracting customers.<br><br>Situated in a strategic location, the Binghatti Phoenix building is easily accessible and is surrounded by a thriving community, offering great potential for foot traffic. Whether you\'re looking to open a retail store, cafe, or service-oriented business, this unit provides the perfect foundation for success.</div></div><div class=\"property-horizontal-line\" style=\"background-color:rgb(243,243,243);color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"></div><div class=\"features-details\" style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"><h5>Features</h5><ul><li>Shell &amp; Core</li><li>Brand New</li><li>Suitable for various business ventures</li><li>Prime location, located in a brand new building in JVC</li><li>Surrounded by multiple residential buildings</li></ul></div><div class=\"property-map-component\" style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"></div><div class=\"property-horizontal-line\" style=\"background-color:rgb(243,243,243);color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;font-style:normal;font-weight:400;\"></div>', NULL, NULL, '[\"1\",\"5\"]', 2, NULL, 'property/thumbnail/8jNj9cwkVg9aGjY6zOB6FbVNH4pKt0.webp', 'local', '2025-08-23 20:54:00', '2025-08-23 20:54:00', 1, 1, 0, 1, 0, 0, 0.00, NULL, '2025-08-23 20:54:23', '2025-08-29 04:05:04'),
(10, 'Mazaya Business Avenue BB2, Jumeirah Lake Towers, Dubai', 0, 1, 0, 0, 1, NULL, 500000.00, 6000000.00, 6000000.00, 6000000.00, NULL, NULL, NULL, NULL, 12.00, 1, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, '<div class=\"description-block\" style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"><div class=\"property-long-description\" style=\"color:rgb(86,94,89);\">TwoSigma\'s proudly presents an high end fitted office space for sale in JLT, Mazaya Business Avenue. Spanning 1,194 sq.ft, this spacious office offers a prime location and premium business environment. Ideal for large enterprises. Asking price: USD 6,000,000. Great investment in Dubai’s thriving business hub.<br><br>Conservative Scenario:<br>Expected Rent: USD 624,846.80<br>Net ROI: 9.33%<br><br>Normal Case Scenario:<br>Expected Rent: USD 789,566.76<br>Net ROI: 11.92%<br><br>Best Case Scenario:<br>Expected Rent: USD 884,859.30<br>Net ROI: 13.42%<br><br>Please call for more information, to arrange a viewing or to make an offer.<br><br>For further details, please drop into our flagship office at the Gold &amp; Diamond Park – or browse the incredible selection of properties we maintain at the haus &amp; haus website. Our agents will be happy to answer any industry-related query you may have.</div></div><div class=\"property-horizontal-line\" style=\"background-color:rgb(243,243,243);color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"></div><div class=\"features-details\" style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"><h5>Features</h5><ul><li>Luxury Fit-Out</li><li>High Floor</li><li>Near Metro</li><li>Strategic Location</li><li>Conservative Scenario:</li><li>Expected Rent: USD 624,846.80</li><li>Net ROI: 9.33%</li><li>Normal Case Scenario:</li><li>Expected Rent USD 789,566.76</li><li>Net ROI: 11.92%</li><li>Best Case Scenario:</li><li>Expected Rent: USD 884,859.30</li><li>Net ROI: 13.42%</li></ul></div><div class=\"property-horizontal-line\" style=\"background-color:rgb(243,243,243);color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"></div><div class=\"amenities-details\" style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"><h5>Amenities</h5></div>', NULL, NULL, '[\"1\"]', 2, NULL, 'property/thumbnail/3VCpf0MNLOpYBTtwlFD6KghVyCU7D0.webp', 'local', '2025-08-23 21:17:27', '2025-08-23 21:17:27', 1, 1, 1, 1, 0, 0, 0.00, NULL, '2025-08-23 21:17:27', '2025-08-29 04:05:04'),
(11, 'Binghatti Circle, Jumeirah Village Circle, Dubai', 0, 1, 0, 0, 1, NULL, 300000.00, 500000.00, 2000000.00, 2000000.00, NULL, NULL, NULL, NULL, 12.00, 1, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, '<div class=\"description-block\" style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"><div class=\"property-long-description\" style=\"color:rgb(86,94,89);\">Binghatti Circle represents a compelling investment opportunity, rooted in freehold ownership in designated areas within one of the safest cities in the world. As the tallest building in JVC, it offers strong historical appreciation in property values and high rental yield potential.<br><br>JVC\'s fast-paced growth, supported by ongoing<br>infrastructure and ambitious development plans, is expected to drive both property value increases and enhanced rental yields. Its strong demand as a soughtafter residential area ensures reliable rental income from professionals, families and young couples.<br><br>Situated at the vibrant heart of Jumeirah Village Circle, Binghatti Circle offers unparalleled connectivity. Its strategic location places<br>residents within minutes of key landmarks such as Circle Mall, Jumeirah Five Hotel, Dubai International Cricket Stadium, Dubai<br>Marina and Palm Jumeirah, along with a plethora of local high-class restaurants.</div></div><div class=\"property-horizontal-line\" style=\"background-color:rgb(243,243,243);color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"></div><div class=\"features-details\" style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"><h5>Features</h5><ul><li>Off Plan</li><li>Retail Unit</li><li>Handover in 2027</li><li>Investment Opportunity</li><li>Highest building in JVC</li></ul></div>', NULL, NULL, '[\"1\",\"2\",\"3\",\"4\",\"5\"]', 2, NULL, 'property/thumbnail/kTUFTPOZEIC6CVaBppTdhFwnb3XoM4.webp', 'local', '2025-08-23 21:28:02', '2025-08-23 21:28:02', 1, 1, 0, 1, 0, 0, 0.00, NULL, '2025-08-23 21:28:02', '2025-08-29 04:05:04');
INSERT INTO `properties` (`id`, `title`, `is_invest_type`, `is_return_type`, `is_installment`, `is_capital_back`, `is_investor`, `fixed_amount`, `minimum_amount`, `maximum_amount`, `total_investment_amount`, `available_funding`, `how_many_days`, `how_many_times`, `return_time`, `return_time_type`, `profit`, `profit_type`, `loss`, `loss_type`, `total_installments`, `installment_amount`, `installment_duration`, `installment_duration_type`, `installment_late_fee`, `details`, `faq`, `video`, `amenity_id`, `address_id`, `location`, `thumbnail`, `driver`, `start_date`, `expire_date`, `is_payment`, `is_featured`, `is_available_funding`, `status`, `get_favourite_count`, `reviews_count`, `avg_rating`, `deleted_at`, `created_at`, `updated_at`) VALUES
(12, 'Binghatti Twilight, Al Jaddaf, Dubai', 0, 1, 0, 0, 1, NULL, 50000.00, 850000.00, 1000000.00, 1000000.00, NULL, NULL, NULL, NULL, 7.50, 1, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, '<div class=\"description-block\"><div class=\"property-long-description\" style=\"color:rgb(86,94,89);\">Binghatti Twilight is a premium mixed-use tower by Binghatti Developers, rising in AlJaddaf with 4 basement levels, 3 office floors and 18 residential floors.<br><br>Featuring modern crystal glass facades, it offers 1–3BR apartments (228 units), 47 office spaces and 2 retail units.<br><br>Strategic location: steps from AlJaddaf Metro;<br>5–13min to Dubai Mall/Downtown/Business Bay; 25–29min to Palm Jumeirah and JBR; ~28min to DXB.<br><br>Stunning views: from floor-to-ceiling windows, look out on Dubai Creek, the Downtown skyline, Business Bay Bridge and Palm.<br><br>Lifestyle &amp; amenities include a rooftop infinity pool, state-of-the-art gym, landscaped gardens, children’s play area, concierge, retail outlets, jogging/cycling tracks, BBQ zones, spa, indoor pool and multipurpose spaces.</div></div><div class=\"property-horizontal-line\" style=\"background-color:rgb(243,243,243);\"></div><div class=\"features-details\"><h5>Features</h5><ul><li>Office Unit with balcony</li><li>Shell &amp; Core</li><li>Brand New</li><li>Strategic Location</li><li>Handover in Q2 2026</li></ul></div>', NULL, NULL, NULL, 2, NULL, 'property/thumbnail/GOrJiiZz3nIxlcAiVU8UlW8F7x8oMy.webp', 'local', '2025-08-24 04:08:46', '2025-08-24 04:08:46', 1, 1, 0, 1, 0, 0, 0.00, NULL, '2025-08-24 04:08:47', '2025-08-29 04:05:04'),
(13, 'Binghatti Starlight, Al Jaddaf', 0, 1, 0, 0, 1, NULL, 400000.00, 3700000.00, 6000000.00, 6000000.00, NULL, NULL, NULL, NULL, 5.00, 1, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, '<div class=\"description-block\" style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"><div class=\"property-long-description\" style=\"color:rgb(86,94,89);\">TwoSigma proudly presents a 3,866.4 sqft retail unit in Binghatti Starlight, Al Jaddaf, offers a prime opportunity for businesses seeking visibility and growth. Situated on the ground floor of a 25-storey mixed-use tower, the unit benefits from high foot traffic and proximity to major landmarks like Downtown Dubai and Dubai Creek Tower.<br><br>Please call for more information, to arrange a viewing or to make an offer.<br><br>Finance is available on this property through haus &amp; haus partners.<br><br>For further details, please drop into our flagship office at the Gold &amp; Diamond Park - or browse the incredible selection of properties we maintain at the haus &amp; haus website. Our Agents will be happy to answer any industry related query you have.</div></div><div class=\"property-horizontal-line\" style=\"background-color:rgb(243,243,243);color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"></div><div class=\"features-details\" style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"><h5>Features</h5><ul><li>Retail Unit</li><li>Brand New</li><li>Shell &amp; Core</li><li>Strategic Location</li><li>Handover in Q1 2026</li></ul></div>', NULL, NULL, NULL, 2, NULL, 'property/thumbnail/PSH1Vt2N4yA2XMxNQVlRt09gomBcxu.webp', 'local', '2025-08-24 04:15:28', '2025-08-24 04:15:28', 1, 1, 1, 1, 0, 0, 0.00, NULL, '2025-08-24 04:15:28', '2025-08-29 04:05:04'),
(14, 'Binghatti Ivory, Al Jaddaf,', 0, 1, 0, 0, 1, NULL, 600000.00, 6500000.00, 7000000.00, 7000000.00, NULL, NULL, NULL, NULL, 6.00, 1, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, '<div class=\"description-block\" style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"><div class=\"property-long-description\" style=\"color:rgb(86,94,89);\">TwoSigma proudly presents a spanning 5,700 sqft. This prime retail unit in Binghatti Ivory, Al Jaddaf, offers exceptional visibility and foot traffic. Ideal for showrooms, it features modern design, high ceilings, and a strategic location near major roads and residential hubs. Perfect for business growth.<br><br>Please call for more information, to arrange a viewing or to make an offer.<br><br>For further details, please drop into our flagship office at the Gold &amp; Diamond Park – or browse the incredible selection of properties we maintain at the haus &amp; haus website. Our agents will be happy to answer any industry-related query you may have.</div></div><div class=\"property-horizontal-line\" style=\"background-color:rgb(243,243,243);color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"></div><div class=\"features-details\" style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"><h5>Features</h5><ul><li>Brandnew</li><li>Retail unit</li><li>Shell &amp; Core</li><li>Strategic Position</li><li>Handover in Q4 2025</li></ul></div>', NULL, NULL, NULL, 2, NULL, 'property/thumbnail/oWo8aPUA4Eqx8c7hJ96nhRBJOPz1MC.webp', 'local', '2025-08-24 04:26:07', '2025-08-24 04:26:07', 1, 1, 1, 1, 0, 0, 0.00, NULL, '2025-08-24 04:26:08', '2025-08-29 04:05:04'),
(15, 'ONE by Binghatti', 0, 1, 0, 0, 1, NULL, 700000.00, 11600000.00, 15000000.00, 15000000.00, NULL, NULL, NULL, NULL, 5.00, 1, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, '<div class=\"description-block\" style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"><div class=\"property-long-description\" style=\"color:rgb(86,94,89);\">TwoSigma proud to present this premium retail investment in the heart of Dubai with this expansive 7,667 sq. ft. unit in ONE by Binghatti, a striking architectural landmark in Business Bay.<br><br>This high-visibility retail space offers an exceptional opportunity for brands seeking a prestigious address and strong foot traffic in one of Dubai’s most dynamic commercial hubs.<br><br>Please call for more information, to arrange a viewing or to make an offer.<br><br>For further details, please drop into our flagship office at the Gold &amp; Diamond Park – or browse the incredible selection of properties we maintain at the haus &amp; haus website. Our agents will be happy to answer any industry-related query you may have.</div></div><div class=\"property-horizontal-line\" style=\"background-color:rgb(243,243,243);color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"></div><div class=\"features-details\" style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"><h5>Features</h5><ul><li>Off-Plan Retail Unit</li><li>Shell &amp; Core</li><li>Waterfront</li><li>Prime Location in Business Bay</li></ul></div>', NULL, NULL, NULL, 2, NULL, 'property/thumbnail/qqFN2Vov89OaT1yvMXXlY4GT2fvruF.webp', 'local', '2025-08-24 04:33:11', '2025-08-24 04:33:11', 1, 1, 1, 1, 0, 0, 0.00, NULL, '2025-08-24 04:33:11', '2025-08-29 04:05:04'),
(16, 'Binghatti Aquarise, Business Bay, Dubai', 0, 1, 0, 0, 1, NULL, 600000.00, 4300000.00, 4600000.00, 4600000.00, NULL, NULL, NULL, NULL, 6.00, 1, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, '<div class=\"description-block\" style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"><div class=\"property-long-description\" style=\"color:rgb(86,94,89);\">TwoSigma proudly presents a unique opportunity to invest in a luxury waterfront property in one of Dubai\'s most sought-after districts. Offering unparalleled connectivity, this stunning development is just moments away from Downtown Dubai, Dubai Opera, and major highways like Al Khail Road and Sheikh Zayed Road<br></div></div><div class=\"property-horizontal-line\" style=\"background-color:rgb(243,243,243);color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"><span style=\"font-family:\'Neuzeit Office Bold\';font-size:20px;font-weight:600;background-color:rgb(255,255,255);\">Features</span></div><div class=\"features-details\" style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"><ul><li>Retail Unit</li><li>Shell &amp; Core</li><li>Multiple Options</li><li>Strategic Location</li><li>Main Road</li><li>Internal Plot Driveway</li></ul></div>', NULL, NULL, NULL, 2, NULL, 'property/thumbnail/GOl5Ug4vXc9hBe2m74ESWqMNu9CshM.webp', 'local', '2025-08-24 04:39:28', '2025-08-24 04:39:28', 1, 1, 1, 1, 0, 0, 0.00, NULL, '2025-08-24 04:39:28', '2025-08-29 04:05:04'),
(17, 'The Opus, Business Bay', 0, 1, 0, 0, 1, NULL, 100000.00, 17000000.00, 17000000.00, 17000000.00, NULL, NULL, NULL, NULL, 5.00, 1, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, '<div class=\"description-block\" style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"><div class=\"property-long-description\" style=\"color:rgb(86,94,89);\">TwoSigma is very proud to present this exclusive office in The Opus, Business Bay.<br><br>Spanning 9,557 sq.ft across multiple combined units, offering a fully upgraded, modern workspace. It includes a beautiful CEO suite, ideal for high-level meetings, alongside a spacious, open-plan workspace designed for collaboration and efficiency.<br><br>The office features multiple meeting rooms, perfect for team discussions and client presentations. With stunning views of the Burj Khalifa, the space provides an inspiring atmosphere for productivity.<br><br>Situated in a 5-star building, The Opus offers premium amenities such as world-class dining, fitness facilities, and concierge services, creating a dynamic, high-end environment for any business.<br></div><div class=\"property-long-description\" style=\"color:rgb(86,94,89);\"><br><span style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Bold\';font-size:20px;font-weight:600;\">Features</span></div></div><div class=\"features-details\" style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"><ul><li>Full Floor Office</li><li>Fully Fitted</li><li>Burj Khalifa View</li><li>Canal View</li><li>Beautiful CEO Suite</li><li>Welcoming Reception Area</li><li>5* Building Amenities</li></ul></div>', NULL, NULL, NULL, 2, NULL, 'property/thumbnail/bZvESYvMt1MrCP4FlKmDNpvAO4gRgn.webp', 'local', '2025-08-24 04:50:22', '2025-08-24 04:50:22', 1, 1, 1, 1, 0, 0, 0.00, NULL, '2025-08-24 04:50:23', '2025-08-29 04:05:04'),
(18, 'Office space for sale in Boulevard Plaza 1', 0, 1, 0, 0, 1, NULL, 600000.00, 6500000.00, 7000000.00, 7000000.00, NULL, NULL, NULL, NULL, 7.50, 1, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, '<div class=\"description-block\" style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"><div class=\"property-long-description\" style=\"color:rgb(86,94,89);\">TwoSigma is proud to present this premium Grade A turnkey office in the iconic Boulevard Plaza, offering a sophisticated and fully fitted luxury workspace in the heart of Downtown Dubai.<br><br>Designed to impress, the office boasts a high-end fitout with breathtaking views of the Burj Khalifa. It includes a spacious CEO suite, multiple manager cabins, and a welcoming reception area that sets the tone for professionalism and prestige.<br><br>The layout is intelligently planned with ample open workstation space, ideal for team collaboration and productivity. Additional features include a modern pantry area for staff convenience and eight dedicated parking spaces, ensuring comfort and ease for both employees and clients.<br><br>With its prime location, exceptional design, and functional layout, this office unit perfectly balances elegance with efficiency, making it an ideal choice for companies seeking a prominent business address in one of Dubai’s most sought-after commercial destinations.</div></div><div class=\"property-horizontal-line\" style=\"background-color:rgb(243,243,243);color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"></div><div class=\"features-details\" style=\"color:rgb(8,56,25);font-family:\'Neuzeit Office Regular\';font-size:16px;\"><h5>Features</h5><ul><li>Grade A</li><li>Turnkey</li><li>Luxury Fitout</li><li>Burj Khalifa View</li><li>8 Parking</li><li>CEO Suite</li><li>Welcoming Reception Area</li><li>Ample Workstation Space</li><li>Multiple Manager Cabins</li><li>Pantry Area</li></ul></div>', NULL, NULL, NULL, 2, NULL, 'property/thumbnail/KVjW08zS575EaxVZr2bBCf8aWo5BSs.webp', 'local', '2025-08-24 05:04:05', '2025-08-24 05:04:05', 1, 1, 1, 1, 0, 0, 0.00, NULL, '2025-08-24 05:04:06', '2025-08-29 04:05:04'),
(19, '415 Summit Ave #2, Saint Paul, MN', 0, 1, 0, 1, 1, NULL, 1000.00, 5000000.00, 5000000.00, 5000000.00, NULL, NULL, NULL, NULL, 10.00, 1, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, '<p><span style=\"color:rgb(42,42,51);font-family:\'Open Sans\', \'Adjusted Arial\', Tahoma, Geneva, sans-serif;font-size:16px;\">Beautiful 3-bedroom, 3-bathroom, 2,200 finished square feet converted mansion unit, thoughtfully updated to honor its historic character while delivering modern convenience. Highlights include refinished hardwood floors, new stainless steel appliances, fresh paint, and new wood treads on the stairs. The upper level has been refreshed, including an updated bathroom and a convenient laundry area, and the roof was replaced in 2021 for lasting peace of mind. Distinctive features such as leaded windows, built-in bookcases, high ceilings, and stunning woodwork are complemented by a dramatic spiral staircase that leads to the third level.\nOutside, a quaint private paver patio provides a serene outdoor retreat perfect for al fresco dining or quiet mornings. The home benefits from a superb location near Nathan Hale Park and is steps from a vibrant array of restaurants and shopping, offering true walkability and neighborhood charm. With its blend of updated interiors, timeless craftsmanship, and a highly desirable setting, this property presents a rare opportunity to own a refined mansion unit with modern conveniences.</span></p>', NULL, NULL, '[\"1\",\"2\",\"3\",\"4\",\"5\"]', 1, NULL, 'property/thumbnail/GsbZLThQokWTFCc77SJYwL5uJSRe6E.webp', 'local', '2025-08-25 19:18:58', '2025-08-25 19:18:58', 1, 1, 1, 1, 0, 0, 0.00, NULL, '2025-08-25 19:18:59', '2025-08-29 04:05:04'),
(20, '1460 W 36th St, Minneapolis, MN', 0, 1, 0, 1, 1, NULL, 2500.00, 4000000.00, 400000.00, 400000.00, 13, NULL, 7, 'days', 10.00, 1, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, '<p><span style=\"color:rgb(42,42,51);font-family:\'Open Sans\', \'Adjusted Arial\', Tahoma, Geneva, sans-serif;font-size:16px;\">Welcome to 1460 W. 36th Street-an exceptional home nestled in the heart of the highly sought-after East Calhoun neighborhood. Just steps from Bde Maka Ska, Lake Harriet and vibrant Uptown amenities, this beautifully maintained property combines classic charm with modern updates in one of Minneapolis\' most walkable and desirable locations.\n\nEnjoy serene mornings in the cozy sunroom or relax on the private back patio surrounded by mature landscaping. A finished lower level offers additional living space ideal for a home office, media room, or guest suite. Recent upgrades include maintenance free deck railing, new windows, electric charging station in garage.\n\nWhether you\'re strolling to local cafes, biking around the lakes, or enjoying the city\'s best dining and shops, 1460 W. 36th St offers the perfect balance of city convenience and neighborhood tranquility. \n\nDon\'t miss the rare opportunity to own a timeless home in a premier Minneapolis location! Quick close available.</span></p>', NULL, NULL, '[\"1\",\"2\",\"3\",\"4\",\"5\"]', 1, NULL, 'property/thumbnail/gijErquQBzRAifz2sBOxoB7JUfJd1g.webp', 'local', '2025-08-26 15:50:44', '2025-08-26 15:50:44', 1, 1, 1, 1, 0, 0, 0.00, NULL, '2025-08-26 15:50:44', '2025-08-29 04:05:04'),
(21, '1271 Wynford Colo SW, Marietta, GA', 0, 1, 0, 1, 1, NULL, 2500.00, 400000.00, 500000.00, 500000.00, 3, NULL, 1, 'months', 15.00, 1, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, '<p><span style=\"color:rgb(42,42,51);font-family:\'Open Sans\', \'Adjusted Arial\', Tahoma, Geneva, sans-serif;font-size:16px;\">Discover this inviting ranch-style home nestled on the best lot in the highly desirable Wynford Chace community. Boasting an open-concept layout, the home features soaring ceilings in the expansive great room, and gleaming hardwood floors throughout most of the space. The dining area seamlessly flows into the sunken great room, anchored by a cozy gas log fireplace.  Eat in kitchen features oak cabinets, walk in pantry, updated SS appliances, &amp; breakfast bar. The split bedroom plan offers privacy, with a luxurious owner’s suite featuring a spa-inspired bathroom with dual vanities, heated tile floors, a garden tub, and a separate shower. Two generously sized secondary bedrooms share a well-appointed full bath. Step outside to a sprawling deck overlooking serene greenspace, complete with a covered area and a fenced backyard.</span></p>', NULL, NULL, '[\"1\",\"2\",\"3\",\"4\",\"5\"]', 1, NULL, 'property/thumbnail/PYrtSflmJZKtXmb2jTiDM1mtbgo0gX.webp', 'local', '2025-08-26 16:22:49', '2025-08-26 16:22:49', 1, 1, 1, 1, 0, 0, 0.00, NULL, '2025-08-26 16:22:49', '2025-08-29 04:05:04'),
(22, '4315 LAZY ACRES Road, Middleburg, FL 32068', 0, 1, 0, 1, 1, NULL, 2500.00, 700000.00, 10000000.00, 10000000.00, 1, NULL, 6, 'months', 22.75, 1, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, '<p><span style=\"color:rgb(42,42,51);font-family:\'Open Sans\', \'Adjusted Arial\', Tahoma, Geneva, sans-serif;font-size:16px;\">Investor Opportunity on Black Creek!\nBring your vision to this unique property featuring nearly 6 acres of private land tucked away on a secluded road. The existing home has had a large addition and offers incredible potential for the right buyer (Buyer to do due-diligence on living area) With direct frontage on Black Creek, this property is perfect for those looking to create a private retreat, vacation rental, or future dream home.\n\nThis is a cash or investor purchase only and is being sold AS-IS. Whether you\'re looking for a project, land value, or long-term investment, this property provides endless possibilities in a serene Middleburg setting</span></p>', NULL, NULL, '[\"1\",\"2\",\"3\",\"4\",\"5\"]', 1, NULL, 'property/thumbnail/TxUXyv54awDoO86sDBe4yWvHScjuL6.webp', 'local', '2025-08-26 16:32:54', '2025-08-26 16:32:54', 1, 1, 1, 1, 0, 0, 0.00, NULL, '2025-08-26 16:32:54', '2025-08-29 04:05:04'),
(23, '409 Princeton Dr, Lebanon, TN 37087', 0, 1, 0, 1, 1, NULL, 3000.00, 450000.00, 1000000.00, 1000000.00, 3, NULL, 1, 'months', 15.00, 1, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, '<p><span style=\"color:rgb(42,42,51);font-family:\'Open Sans\', \'Adjusted Arial\', Tahoma, Geneva, sans-serif;font-size:16px;\">Beautiful home in the heart of Lebanon! Great curb appeal with manicured level lot! 3 bedrooms, 2 baths with a large upstairs bonus room. New privacy fenced back yard great for entertaining, with a large, covered patio area. (property line goes beyond fence) -- family room with fireplace-gas logs-eat in kitchen with maple cabinets-3 bedrooms down. Primary bedroom with large walk-in closet, master bath with tub and separate shower, - 2 car garage- 30 minutes from downtown Nashville-Convenient to schools-shopping and easy access to interstate-USDA eligible -no down payment- talk to your lender\n professional photos coming</span></p>', NULL, NULL, '[\"1\",\"2\",\"3\",\"4\",\"5\"]', 1, NULL, 'property/thumbnail/aRjOIUacteSW4cXwpjQffLFZVDqDhV.webp', 'local', '2025-08-26 17:01:14', '2025-08-26 17:01:14', 1, 1, 1, 1, 0, 0, 0.00, NULL, '2025-08-26 17:01:15', '2025-08-29 04:05:04');

-- --------------------------------------------------------

--
-- Table structure for table `property_offers`
--

CREATE TABLE `property_offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_share_id` bigint(20) UNSIGNED DEFAULT NULL,
  `offered_from` bigint(20) UNSIGNED DEFAULT NULL,
  `offered_to` bigint(20) UNSIGNED DEFAULT NULL,
  `investment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `property_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sell_amount` decimal(11,2) DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending, 1=accepted, 2=rejected	',
  `payment_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=>pending, 1=completed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property_shares`
--

CREATE TABLE `property_shares` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `investment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `investor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `property_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rankings`
--

CREATE TABLE `rankings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ranks`
--

CREATE TABLE `ranks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rank_name` varchar(255) DEFAULT NULL,
  `rank_level` varchar(255) DEFAULT NULL,
  `min_invest` decimal(11,4) DEFAULT NULL,
  `min_deposit` decimal(11,4) DEFAULT NULL,
  `min_earning` decimal(11,4) DEFAULT NULL,
  `bonus` decimal(11,4) DEFAULT NULL,
  `rank_icon` varchar(255) DEFAULT NULL,
  `driver` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `sort_by` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ranks`
--

INSERT INTO `ranks` (`id`, `rank_name`, `rank_level`, `min_invest`, `min_deposit`, `min_earning`, `bonus`, `rank_icon`, `driver`, `description`, `sort_by`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Member', 'Level 1', 25000.0000, 10000.0000, 750.0000, 500.0000, 'rank/OOHyGxrPkm8Llqx2qTPPvAd3F6fam2.webp', 'local', '<p>Chaincity Member Rank</p>', 1, 1, '2024-10-19 06:47:52', '2025-08-22 16:14:51'),
(3, 'Leader', 'Level 2', 1000.0000, 5000.0000, 1500.0000, 100.0000, 'rank/BQbaO5ajMqQAr58GZteeERtNvMKIZK.webp', 'local', '<p>Chaincity Leader</p>', 2, 1, '2024-10-19 06:49:14', '2024-10-19 06:49:14'),
(4, 'Captain', 'Level 3', 5000.0000, 10000.0000, 3000.0000, 300.0000, 'rank/AcnaanvcUgbthXQekqNLwXugsIslof.webp', 'local', '<p>Chaincity Captain</p>', 3, 1, '2024-10-19 06:50:18', '2024-10-19 06:50:18'),
(5, 'Victor', 'Level 4', 10000.0000, 100000.0000, 5000.0000, 500.0000, 'rank/158Q1VCYCjzr3J7kBLuYxB4kqBQv5x.webp', 'local', '<p>Chaincity Victor Rank</p>', 4, 1, '2024-10-19 06:55:00', '2024-10-19 07:16:43');

-- --------------------------------------------------------

--
-- Table structure for table `razorpay_contacts`
--

CREATE TABLE `razorpay_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contact_id` varchar(255) DEFAULT NULL,
  `entity` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `commission_type` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `percent` varchar(255) DEFAULT NULL,
  `extra_bonus` decimal(11,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referral_bonuses`
--

CREATE TABLE `referral_bonuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `to_user_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'This user is getting bonus',
  `from_user_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'To user Getting bonus for it',
  `level` int(11) DEFAULT NULL,
  `amount` decimal(11,4) NOT NULL DEFAULT 0.0000,
  `main_balance` decimal(11,4) NOT NULL DEFAULT 0.0000,
  `transaction` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `model_type` varchar(255) DEFAULT NULL,
  `model_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `permission` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=>deactive,1=> active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `ticket` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0 COMMENT '0 =>  Open, 1 => Answered, 2 => Replied, 3 => Closed',
  `last_reply` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_attachments`
--

CREATE TABLE `support_ticket_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_message_id` int(11) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `driver` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_messages`
--

CREATE TABLE `support_ticket_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) UNSIGNED NOT NULL,
  `transactional_id` int(11) DEFAULT NULL,
  `transactional_type` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `property_id` bigint(20) UNSIGNED DEFAULT NULL,
  `investment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` double(11,2) DEFAULT NULL,
  `balance` varchar(20) DEFAULT NULL,
  `charge` decimal(11,2) NOT NULL DEFAULT 0.00,
  `trx_type` varchar(10) DEFAULT NULL,
  `balance_type` varchar(255) DEFAULT NULL,
  `remarks` varchar(191) NOT NULL,
  `trx_id` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `transactional_id`, `transactional_type`, `user_id`, `property_id`, `investment_id`, `amount`, `balance`, `charge`, `trx_type`, `balance_type`, `remarks`, `trx_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'App\\Models\\Fund', 1, NULL, NULL, 50000.00, '50000', 0.00, '+', NULL, 'Add Balance to wallet', 'F274131444646', '2025-08-22 09:49:58', '2025-08-22 09:49:58'),
(2, 2, 'App\\Models\\Fund', 1, NULL, NULL, 50000.00, '100000', 0.00, '+', NULL, 'Add Balance to wallet', 'F274131444647', '2025-08-22 09:50:01', '2025-08-22 09:50:01'),
(5, 1, 'App\\Models\\User', 1, 3, NULL, 25000.00, '75000', 0.00, '-', 'balance', 'Invested On PG Ocean DST', 'EKTXKEV1NQP9', '2025-08-22 16:00:17', '2025-08-22 16:00:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `referral_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `country_code` varchar(20) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `phone_code` varchar(20) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `balance` decimal(11,4) NOT NULL DEFAULT 0.0000,
  `interest_balance` decimal(11,4) NOT NULL DEFAULT 0.0000,
  `total_interest_balance` decimal(11,4) NOT NULL DEFAULT 0.0000,
  `joining_bonus` decimal(11,4) NOT NULL DEFAULT 0.0000,
  `total_referral_joining_bonus` decimal(11,4) NOT NULL DEFAULT 0.0000,
  `deposit_referral_bonous` decimal(11,4) NOT NULL DEFAULT 0.0000,
  `invest_referral_bonous` decimal(11,4) NOT NULL DEFAULT 0.0000,
  `profit_referral_bonous` decimal(11,4) NOT NULL DEFAULT 0.0000,
  `rank_referral_bonous` decimal(11,4) NOT NULL DEFAULT 0.0000,
  `total_rank_bonous` decimal(11,4) NOT NULL DEFAULT 0.0000,
  `total_referral_bonous` decimal(11,4) NOT NULL DEFAULT 0.0000,
  `total_invest` decimal(11,4) NOT NULL DEFAULT 0.0000,
  `total_deposit` decimal(11,4) NOT NULL DEFAULT 0.0000,
  `admin_update_rank` int(11) NOT NULL DEFAULT 0,
  `last_level` int(11) DEFAULT NULL,
  `all_ranks` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image_driver` varchar(50) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL COMMENT 'Zip Or Postal Code',
  `address_one` text DEFAULT NULL,
  `address_two` text DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `provider_id` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `identity_verify` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => Not Applied, 1=> Applied, 2=> Approved, 3 => Rejected	',
  `address_verify` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => Not Applied, 1=> Applied, 2=> Approved, 3 => Rejected	',
  `two_fa` tinyint(1) NOT NULL DEFAULT 0,
  `two_fa_verify` tinyint(1) NOT NULL DEFAULT 1,
  `two_fa_code` varchar(50) DEFAULT NULL,
  `email_verification` tinyint(1) NOT NULL DEFAULT 1,
  `sms_verification` tinyint(1) NOT NULL DEFAULT 1,
  `verify_code` varchar(50) DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  `time_zone` varchar(191) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `timezone` varchar(191) DEFAULT NULL,
  `premium_user` tinyint(1) NOT NULL DEFAULT 0,
  `is_bonus_amount` tinyint(1) NOT NULL DEFAULT 0,
  `github_id` varchar(255) DEFAULT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `facebook_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `referral_id`, `language_id`, `email`, `country_code`, `country`, `phone_code`, `phone`, `balance`, `interest_balance`, `total_interest_balance`, `joining_bonus`, `total_referral_joining_bonus`, `deposit_referral_bonous`, `invest_referral_bonous`, `profit_referral_bonous`, `rank_referral_bonous`, `total_rank_bonous`, `total_referral_bonous`, `total_invest`, `total_deposit`, `admin_update_rank`, `last_level`, `all_ranks`, `address`, `bio`, `image`, `image_driver`, `state`, `city`, `zip_code`, `address_one`, `address_two`, `provider`, `provider_id`, `status`, `identity_verify`, `address_verify`, `two_fa`, `two_fa_verify`, `two_fa_code`, `email_verification`, `sms_verification`, `verify_code`, `sent_at`, `last_login`, `last_seen`, `time_zone`, `password`, `email_verified_at`, `remember_token`, `timezone`, `premium_user`, `is_bonus_amount`, `github_id`, `google_id`, `facebook_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Tim', 'Burkley', 'TimBurkley', NULL, NULL, 'alantboost@gmail.com', NULL, NULL, '+1', '9806754987', 75000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 25000.0000, 0.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, NULL, 1, 1, NULL, NULL, '2025-08-26 11:42:39', '2025-08-26 14:34:26', NULL, '$2y$10$hGEFwGFLbSne7qHMIEL7yeNugcMz63HPrPcuqbyDfmmBSewbkcY2a', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, '2025-08-22 08:16:35', '2025-08-26 18:34:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_kycs`
--

CREATE TABLE `user_kycs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `kyc_id` int(11) DEFAULT NULL,
  `kyc_type` varchar(191) DEFAULT NULL,
  `kyc_info` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>pending , 1=> verified, 2=>rejected',
  `reason` longtext DEFAULT NULL COMMENT 'rejected reason',
  `approved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `country_code` varchar(50) DEFAULT NULL,
  `location` varchar(191) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `browser` varchar(191) DEFAULT NULL,
  `os` varchar(191) DEFAULT NULL,
  `get_device` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_logins`
--

INSERT INTO `user_logins` (`id`, `user_id`, `longitude`, `latitude`, `country_code`, `location`, `country`, `ip_address`, `browser`, `os`, `get_device`, `created_at`, `updated_at`) VALUES
(1, 1, '-118.2781', '34.0587', 'US', 'Los Angeles - - United States - US ', 'United States', '23.160.24.237', 'Chrome', 'Mac OS X', 'Computer', '2025-08-22 08:16:35', '2025-08-22 08:16:35'),
(2, 1, '-97.822', '37.751', 'US', NULL, 'United States', '23.234.70.237', 'Chrome', 'Mac OS X', 'Computer', '2025-08-22 13:00:49', '2025-08-22 13:00:49'),
(3, 1, '6.2605', '4.925', 'NG', 'Yenagoa - - Nigeria - NG ', 'Nigeria', '102.215.57.45', 'Chrome', 'Mac OS X', 'Computer', '2025-08-22 20:08:36', '2025-08-22 20:08:36'),
(4, 1, '3.3903', '6.4474', 'NG', 'Lagos - - Nigeria - NG ', 'Nigeria', '129.222.206.105', 'Chrome', 'Mac OS X', 'Computer', '2025-08-23 12:19:36', '2025-08-23 12:19:36'),
(5, 1, '3.3903', '6.4474', 'NG', 'Lagos - - Nigeria - NG ', 'Nigeria', '129.222.206.105', 'Chrome', 'Mac OS X', 'Computer', '2025-08-23 16:28:49', '2025-08-23 16:28:49'),
(6, 1, '3.3903', '6.4474', 'NG', 'Lagos - - Nigeria - NG ', 'Nigeria', '129.222.206.105', 'Chrome', 'Mac OS X', 'Computer', '2025-08-25 10:16:30', '2025-08-25 10:16:30'),
(7, 1, '3.3903', '6.4474', 'NG', 'Lagos - - Nigeria - NG ', 'Nigeria', '129.222.206.105', 'Chrome', 'Mac OS X', 'Computer', '2025-08-25 12:57:22', '2025-08-25 12:57:22'),
(8, 1, '-97.822', '37.751', 'US', NULL, 'United States', '23.234.70.237', 'Chrome', 'Mac OS X', 'Computer', '2025-08-25 19:51:41', '2025-08-25 19:51:41'),
(9, 1, '-97.822', '37.751', 'US', NULL, 'United States', '23.234.68.237', 'Chrome', 'Mac OS X', 'Computer', '2025-08-26 15:42:39', '2025-08-26 15:42:39'),
(10, 2, NULL, NULL, NULL, NULL, NULL, '85.172.6.206', 'Chrome', 'Windows 10', 'Computer', '2025-08-29 09:00:04', '2025-08-29 09:00:04');

-- --------------------------------------------------------

--
-- Table structure for table `user_socials`
--

CREATE TABLE `user_socials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `social_icon` varchar(255) DEFAULT NULL,
  `social_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`username`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `amenities`
--
ALTER TABLE `amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `basic_controls`
--
ALTER TABLE `basic_controls`
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
-- Indexes for table `blog_details`
--
ALTER TABLE `blog_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_messages_investor_id_index` (`investor_id`),
  ADD KEY `contact_messages_client_id_index` (`client_id`),
  ADD KEY `contact_messages_message_index` (`message`(768));

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_details`
--
ALTER TABLE `content_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deposits_user_id_foreign` (`user_id`),
  ADD KEY `deposits_payment_method_id_foreign` (`payment_method_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favourites_client_id_index` (`client_id`),
  ADD KEY `favourites_property_id_index` (`property_id`);

--
-- Indexes for table `file_storages`
--
ALTER TABLE `file_storages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fire_base_tokens`
--
ALTER TABLE `fire_base_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `funds`
--
ALTER TABLE `funds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `funds_user_id_foreign` (`user_id`),
  ADD KEY `funds_gateway_id_foreign` (`gateway_id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gateways_code_unique` (`code`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `investments`
--
ALTER TABLE `investments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `investor_reviews`
--
ALTER TABLE `investor_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `investor_reviews_user_id_index` (`user_id`),
  ADD KEY `investor_reviews_property_id_index` (`property_id`);

--
-- Indexes for table `in_app_notifications`
--
ALTER TABLE `in_app_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `kycs`
--
ALTER TABLE `kycs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maintenance_modes`
--
ALTER TABLE `maintenance_modes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manage_menus`
--
ALTER TABLE `manage_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manage_times`
--
ALTER TABLE `manage_times`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manual_sms_configs`
--
ALTER TABLE `manual_sms_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `money_transfers`
--
ALTER TABLE `money_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_templates_language_id_foreign` (`language_id`);

--
-- Indexes for table `offer_locks`
--
ALTER TABLE `offer_locks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offer_locks_property_offer_id_index` (`property_offer_id`),
  ADD KEY `offer_locks_property_share_id_index` (`property_share_id`);

--
-- Indexes for table `offer_replies`
--
ALTER TABLE `offer_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offer_replies_property_offer_id_index` (`property_offer_id`),
  ADD KEY `offer_replies_sender_id_index` (`sender_id`),
  ADD KEY `offer_replies_receiver_id_index` (`receiver_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_details`
--
ALTER TABLE `page_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payouts`
--
ALTER TABLE `payouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payout_methods`
--
ALTER TABLE `payout_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `properties_address_id_index` (`address_id`);

--
-- Indexes for table `property_offers`
--
ALTER TABLE `property_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_offers_property_share_id_index` (`property_share_id`),
  ADD KEY `property_offers_offered_from_index` (`offered_from`),
  ADD KEY `property_offers_offered_to_index` (`offered_to`),
  ADD KEY `property_offers_investment_id_index` (`investment_id`),
  ADD KEY `property_offers_property_id_index` (`property_id`);

--
-- Indexes for table `property_shares`
--
ALTER TABLE `property_shares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_shares_investment_id_index` (`investment_id`),
  ADD KEY `property_shares_investor_id_index` (`investor_id`),
  ADD KEY `property_shares_property_id_index` (`property_id`);

--
-- Indexes for table `rankings`
--
ALTER TABLE `rankings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ranks`
--
ALTER TABLE `ranks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `razorpay_contacts`
--
ALTER TABLE `razorpay_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referral_bonuses`
--
ALTER TABLE `referral_bonuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `referral_bonuses_to_user_id_index` (`to_user_id`),
  ADD KEY `referral_bonuses_from_user_id_index` (`from_user_id`),
  ADD KEY `referral_bonuses_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_ticket_attachments`
--
ALTER TABLE `support_ticket_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_ticket_messages`
--
ALTER TABLE `support_ticket_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_property_id_index` (`property_id`),
  ADD KEY `transactions_investment_id_index` (`investment_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_kycs`
--
ALTER TABLE `user_kycs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_kycs_user_id_index` (`user_id`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_socials`
--
ALTER TABLE `user_socials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_socials_user_id_index` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `amenities`
--
ALTER TABLE `amenities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `basic_controls`
--
ALTER TABLE `basic_controls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `blog_details`
--
ALTER TABLE `blog_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `content_details`
--
ALTER TABLE `content_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `favourites`
--
ALTER TABLE `favourites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_storages`
--
ALTER TABLE `file_storages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fire_base_tokens`
--
ALTER TABLE `fire_base_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `funds`
--
ALTER TABLE `funds`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1009;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `investments`
--
ALTER TABLE `investments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `investor_reviews`
--
ALTER TABLE `investor_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `in_app_notifications`
--
ALTER TABLE `in_app_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `kycs`
--
ALTER TABLE `kycs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `maintenance_modes`
--
ALTER TABLE `maintenance_modes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `manage_menus`
--
ALTER TABLE `manage_menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `manage_times`
--
ALTER TABLE `manage_times`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `manual_sms_configs`
--
ALTER TABLE `manual_sms_configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `money_transfers`
--
ALTER TABLE `money_transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `offer_locks`
--
ALTER TABLE `offer_locks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offer_replies`
--
ALTER TABLE `offer_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `page_details`
--
ALTER TABLE `page_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `payouts`
--
ALTER TABLE `payouts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payout_methods`
--
ALTER TABLE `payout_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `property_offers`
--
ALTER TABLE `property_offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property_shares`
--
ALTER TABLE `property_shares`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rankings`
--
ALTER TABLE `rankings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ranks`
--
ALTER TABLE `ranks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `razorpay_contacts`
--
ALTER TABLE `razorpay_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referral_bonuses`
--
ALTER TABLE `referral_bonuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket_attachments`
--
ALTER TABLE `support_ticket_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket_messages`
--
ALTER TABLE `support_ticket_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_kycs`
--
ALTER TABLE `user_kycs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_socials`
--
ALTER TABLE `user_socials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD CONSTRAINT `notification_templates_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

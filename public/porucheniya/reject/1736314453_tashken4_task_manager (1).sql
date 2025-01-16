-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Янв 06 2025 г., 19:17
-- Версия сервера: 10.4.34-MariaDB-log-cll-lve
-- Версия PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `tashken4_task_manager`
--

-- --------------------------------------------------------

--
-- Структура таблицы `api_users`
--

CREATE TABLE `api_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `token_valid_period` mediumint(9) NOT NULL DEFAULT 10,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `deadline` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `additional_time` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`, `deadline`, `score`, `additional_time`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'По умолчанию', 2, 100, NULL, NULL, '2024-10-16 10:43:33', '2024-10-16 10:43:33'),
(2, 'Хат', 1, 150, 3, NULL, '2024-10-16 10:43:33', '2024-10-16 10:43:33'),
(3, 'Учрашув', 1, 80, 3, NULL, '2024-10-16 10:43:33', '2024-10-16 10:43:33');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
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

-- --------------------------------------------------------

--
-- Структура таблицы `files`
--

CREATE TABLE `files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `files`
--

INSERT INTO `files` (`id`, `user_id`, `task_id`, `name`, `department`, `file_name`, `slug`, `created_at`, `updated_at`) VALUES
(4, 1, 3, 'Каталог_ПРОДУКТЫ ДИЗФОР.pdf', NULL, '1730711682_Каталог_ПРОДУКТЫ ДИЗФОР.pdf', NULL, '2024-11-04 09:14:42', '2024-11-04 09:14:42'),
(5, 1, 3, 'КП_Дизфор.pdf', NULL, '1730711682_КП_Дизфор.pdf', NULL, '2024-11-04 09:14:42', '2024-11-04 09:14:42'),
(6, 1, 3, 'Ташкент Инвест.pdf', NULL, '1730711682_Ташкент Инвест.pdf', NULL, '2024-11-04 09:14:42', '2024-11-04 09:14:42'),
(7, 1, 4, '1.pdf', NULL, '1730712114_1.pdf', NULL, '2024-11-04 09:21:54', '2024-11-04 09:21:54'),
(8, 1, 4, '2.pdf', NULL, '1730712114_2.pdf', NULL, '2024-11-04 09:21:54', '2024-11-04 09:21:54'),
(9, 1, 4, '3.pdf', NULL, '1730712114_3.pdf', NULL, '2024-11-04 09:21:54', '2024-11-04 09:21:54'),
(10, 1, 4, '4.pdf', NULL, '1730712114_4.pdf', NULL, '2024-11-04 09:21:54', '2024-11-04 09:21:54'),
(11, 1, 4, '5.pdf', NULL, '1730712114_5.pdf', NULL, '2024-11-04 09:21:54', '2024-11-04 09:21:54'),
(12, 1, 4, '6.pdf', NULL, '1730712114_6.pdf', NULL, '2024-11-04 09:21:54', '2024-11-04 09:21:54'),
(13, 5, 5, '8976-02-қўлга.pdf', NULL, '1730781314_8976-02-қўлга.pdf', NULL, '2024-11-05 04:35:14', '2024-11-05 04:35:14'),
(14, 5, 5, 'Rezolyutsiya 24 Oktabr 2024 kun 8976-02-son (1).pdf', NULL, '1730781314_Rezolyutsiya 24 Oktabr 2024 kun 8976-02-son (1).pdf', NULL, '2024-11-05 04:35:14', '2024-11-05 04:35:14'),
(15, 5, 5, 'Rezolyutsiya 24 Oktabr 2024 kun 8976-02-son (2).pdf', NULL, '1730781314_Rezolyutsiya 24 Oktabr 2024 kun 8976-02-son (2).pdf', NULL, '2024-11-05 04:35:14', '2024-11-05 04:35:14'),
(16, 5, 5, 'Rezolyutsiya 24 Oktabr 2024 kun 8976-02-son.pdf', NULL, '1730781314_Rezolyutsiya 24 Oktabr 2024 kun 8976-02-son.pdf', NULL, '2024-11-05 04:35:14', '2024-11-05 04:35:14'),
(17, 5, 6, 'Rezolyutsiya 30 Oktabr 2024 kun реестр-10-son.pdf', NULL, '1730781984_Rezolyutsiya 30 Oktabr 2024 kun реестр-10-son.pdf', NULL, '2024-11-05 04:46:24', '2024-11-05 04:46:24'),
(18, 5, 6, 'SE62722604 (1).pdf', NULL, '1730781984_SE62722604 (1).pdf', NULL, '2024-11-05 04:46:24', '2024-11-05 04:46:24'),
(19, 5, 6, 'SE62722604 (2).pdf', NULL, '1730781984_SE62722604 (2).pdf', NULL, '2024-11-05 04:46:24', '2024-11-05 04:46:24'),
(20, 5, 6, 'SE62722604.pdf', NULL, '1730781984_SE62722604.pdf', NULL, '2024-11-05 04:46:24', '2024-11-05 04:46:24'),
(21, 5, 8, 'img20241107_12235298.pdf', NULL, '1730988202_img20241107_12235298.pdf', NULL, '2024-11-07 14:03:22', '2024-11-07 14:03:22'),
(22, 5, 9, 'img20241107_19194708.pdf', NULL, '1730989353_img20241107_19194708.pdf', NULL, '2024-11-07 14:22:33', '2024-11-07 14:22:33'),
(23, 5, 10, 'img20241107_19270490.pdf', NULL, '1730989745_img20241107_19270490.pdf', NULL, '2024-11-07 14:29:05', '2024-11-07 14:29:05'),
(24, 5, 11, 'img20241104_12310153.pdf', NULL, '1730989901_img20241104_12310153.pdf', NULL, '2024-11-07 14:31:41', '2024-11-07 14:31:41'),
(25, 5, 11, 'img20241104_12320409.pdf', NULL, '1730989901_img20241104_12320409.pdf', NULL, '2024-11-07 14:31:41', '2024-11-07 14:31:41'),
(26, 5, 12, 'img20241107_19514050.pdf', NULL, '1730991233_img20241107_19514050.pdf', NULL, '2024-11-07 14:53:53', '2024-11-07 14:53:53'),
(27, 5, 13, 'img20241107_19580660.pdf', NULL, '1730991550_img20241107_19580660.pdf', NULL, '2024-11-07 14:59:10', '2024-11-07 14:59:10'),
(28, 5, 14, 'img20241107_20081188.pdf', NULL, '1730992251_img20241107_20081188.pdf', NULL, '2024-11-07 15:10:51', '2024-11-07 15:10:51'),
(29, 5, 15, 'img20241107_20150942.pdf', NULL, '1731043431_img20241107_20150942.pdf', NULL, '2024-11-08 05:23:51', '2024-11-08 05:23:51'),
(30, 5, 16, 'img20241107_12162538.pdf', NULL, '1731044007_img20241107_12162538.pdf', NULL, '2024-11-08 05:33:27', '2024-11-08 05:33:27'),
(32, 5, 17, 'границы участка проекта.PDF', NULL, '1731058053_границы участка проекта.PDF', NULL, '2024-11-08 09:27:33', '2024-11-08 09:27:33'),
(33, 5, 17, 'письмо.pdf', NULL, '1731058053_письмо.pdf', NULL, '2024-11-08 09:27:33', '2024-11-08 09:27:33'),
(34, 5, 17, 'правоустановливающие документы.PDF', NULL, '1731058053_правоустановливающие документы.PDF', NULL, '2024-11-08 09:27:33', '2024-11-08 09:27:33'),
(45, 5, 18, 'Вх №50.pdf', NULL, '1731066073_Вх №50.pdf', NULL, '2024-11-08 11:41:13', '2024-11-08 11:41:13'),
(46, 5, 19, 'Вх №57.pdf', NULL, '1731066169_Вх №57.pdf', NULL, '2024-11-08 11:42:49', '2024-11-08 11:42:49'),
(49, 22, 16, 'правоустановливающие документы.PDF', NULL, '1731067393_правоустановливающие документы.PDF', NULL, '2024-11-08 12:03:14', '2024-11-08 12:03:14'),
(53, 33, 12, '297 от 07.11.2024.pdf', NULL, '1731070916_297 от 07.11.2024.pdf', NULL, '2024-11-08 13:01:56', '2024-11-08 13:01:56'),
(54, 61, 24, 'Презентация Microsoft PowerPoint.pptx', NULL, '1731157782_Презентация Microsoft PowerPoint.pptx', NULL, '2024-11-09 13:09:42', '2024-11-09 13:09:42'),
(55, 5, 25, 'Тошкент_Инвест_Компания янги авлод_437-14-0-Q 24ХД 667-14-0-Q 24ХД 2_ижрочи_8_ноябрь_ҳолатига.xls', NULL, '1731173588_Тошкент_Инвест_Компания янги авлод_437-14-0-Q 24ХД 667-14-0-Q 24ХД 2_ижрочи_8_ноябрь_ҳолатига.xls', NULL, '2024-11-09 17:33:08', '2024-11-09 17:33:08'),
(56, 5, 26, 'Тошкент_Инвест_Компания янги авлод_530-14-0-Q 24ХД 489-14-0-Q 24Х 284-14-0-Q 24_ижрочи_8_ноябрь_ҳолатига (2).xls', NULL, '1731173704_Тошкент_Инвест_Компания янги авлод_530-14-0-Q 24ХД 489-14-0-Q 24Х 284-14-0-Q 24_ижрочи_8_ноябрь_ҳолатига (2).xls', NULL, '2024-11-09 17:35:04', '2024-11-09 17:35:04'),
(57, 5, 27, 'Реновация 603-14-0-Q 24.xls', NULL, '1731173797_Реновация 603-14-0-Q 24.xls', NULL, '2024-11-09 17:36:37', '2024-11-09 17:36:37'),
(58, 5, 28, 'Реновация 715_14_0_Q_24_8_ноябрь_ҳолатига.xls', NULL, '1731173848_Реновация 715_14_0_Q_24_8_ноябрь_ҳолатига.xls', NULL, '2024-11-09 17:37:28', '2024-11-09 17:37:28'),
(59, 5, 25, '437-14-Q-14.pdf', NULL, '1731317579_437-14-Q-14.pdf', NULL, '2024-11-11 09:32:59', '2024-11-11 09:32:59'),
(60, 5, 26, '284-14-0-Q_24.pdf', NULL, '1731317647_284-14-0-Q_24.pdf', NULL, '2024-11-11 09:34:07', '2024-11-11 09:34:07'),
(61, 5, 26, '489-14-Q-14.pdf', NULL, '1731317647_489-14-Q-14.pdf', NULL, '2024-11-11 09:34:07', '2024-11-11 09:34:07'),
(62, 5, 26, '530-14-Q-14.pdf', NULL, '1731317647_530-14-Q-14.pdf', NULL, '2024-11-11 09:34:07', '2024-11-11 09:34:07'),
(63, 5, 27, '603-14-Q-14.pdf', NULL, '1731317666_603-14-Q-14.pdf', NULL, '2024-11-11 09:34:26', '2024-11-11 09:34:26'),
(64, 5, 28, '715-14-0-Q_24.pdf', NULL, '1731317684_715-14-0-Q_24.pdf', NULL, '2024-11-11 09:34:44', '2024-11-11 09:34:44'),
(65, 33, 17, '300 от 11.11.2024.pdf', NULL, '1731320515_300 от 11.11.2024.pdf', NULL, '2024-11-11 10:21:55', '2024-11-11 10:21:55'),
(66, 33, 8, '301 от 11.11.2024.pdf', NULL, '1731320680_301 от 11.11.2024.pdf', NULL, '2024-11-11 10:24:40', '2024-11-11 10:24:40'),
(67, 7, 26, '1731173704_Тошкент_Инвест_Компания янги авлод_530-14-0-Q 24ХД 489-14-0-Q 24Х 284-14-0-Q 24_ижрочи_8_ноябрь_ҳолатига (2).xls', NULL, '1731324039_1731173704_Тошкент_Инвест_Компания янги авлод_530-14-0-Q 24ХД 489-14-0-Q 24Х 284-14-0-Q 24_ижрочи_8_ноябрь_ҳолатига (2).xls', NULL, '2024-11-11 11:20:39', '2024-11-11 11:20:39'),
(68, 7, 26, '1731173704_Тошкент_Инвест_Компания янги авлод_530-14-0-Q 24ХД 489-14-0-Q 24Х 284-14-0-Q 24_ижрочи_8_ноябрь_ҳолатига (2).xls', NULL, '1731324085_1731173704_Тошкент_Инвест_Компания янги авлод_530-14-0-Q 24ХД 489-14-0-Q 24Х 284-14-0-Q 24_ижрочи_8_ноябрь_ҳолатига (2).xls', NULL, '2024-11-11 11:21:25', '2024-11-11 11:21:25'),
(69, 5, 29, 'ОТВЕТ ДХХ.docx', NULL, '1731328566_ОТВЕТ ДХХ.docx', NULL, '2024-11-11 12:36:06', '2024-11-11 12:36:06'),
(70, 33, 29, 'Ответ.pdf', NULL, '1731329556_Ответ.pdf', NULL, '2024-11-11 12:52:36', '2024-11-11 12:52:36'),
(71, 5, 31, 'Industrial development plan of Tashkent Yangi Avlod Special Industrial Zone (Draft for soliciting opinions)_20240808.pdf', NULL, '1731345471_Industrial development plan of Tashkent Yangi Avlod Special Industrial Zone (Draft for soliciting opinions)_20240808.pdf', NULL, '2024-11-11 17:17:52', '2024-11-11 17:17:52'),
(72, 5, 31, '塔什干工业园0716A3-0716.pdf', NULL, '1731345500_塔什干工业园0716A3-0716.pdf', NULL, '2024-11-11 17:18:21', '2024-11-11 17:18:21'),
(73, 5, 32, 'template - 2024-11-04T163035.465.pdf', NULL, '1731345715_template - 2024-11-04T163035.465.pdf', NULL, '2024-11-11 17:21:55', '2024-11-11 17:21:55'),
(74, 5, 33, '175.pdf', NULL, '1731345949_175.pdf', NULL, '2024-11-11 17:25:49', '2024-11-11 17:25:49'),
(75, 5, 34, '86104724_1-Ариза.pdf', NULL, '1731390068_86104724_1-Ариза.pdf', NULL, '2024-11-12 05:41:08', '2024-11-12 05:41:08'),
(76, 5, 34, 'photo_2024-10-28_11-51-44.jpg', NULL, '1731390068_photo_2024-10-28_11-51-44.jpg', NULL, '2024-11-12 05:41:08', '2024-11-12 05:41:08'),
(77, 5, 34, 'Rezolyutsiya 28 Oktabr 2024 kun 5974-рм-son (1).pdf', NULL, '1731390068_Rezolyutsiya 28 Oktabr 2024 kun 5974-рм-son (1).pdf', NULL, '2024-11-12 05:41:08', '2024-11-12 05:41:08'),
(78, 5, 34, 'Rezolyutsiya 28 Oktabr 2024 kun 5974-рм-son (2).pdf', NULL, '1731390068_Rezolyutsiya 28 Oktabr 2024 kun 5974-рм-son (2).pdf', NULL, '2024-11-12 05:41:08', '2024-11-12 05:41:08'),
(79, 5, 34, 'Rezolyutsiya 28 Oktabr 2024 kun 5974-рм-son.pdf', NULL, '1731390068_Rezolyutsiya 28 Oktabr 2024 kun 5974-рм-son.pdf', NULL, '2024-11-12 05:41:08', '2024-11-12 05:41:08'),
(80, 5, 34, 'Rezolyutsiya 29 Oktabr 2024 kun 5974-рм-son.pdf', NULL, '1731390068_Rezolyutsiya 29 Oktabr 2024 kun 5974-рм-son.pdf', NULL, '2024-11-12 05:41:08', '2024-11-12 05:41:08'),
(81, 5, 34, 'А. Валинкинага жавоб хати .pdf', NULL, '1731390068_А. Валинкинага жавоб хати .pdf', NULL, '2024-11-12 05:41:08', '2024-11-12 05:41:08'),
(82, 5, 35, 'Rezolyutsiya 29 Oktabr 2024 kun 3189-ЮР-son (1).pdf', NULL, '1731391562_Rezolyutsiya 29 Oktabr 2024 kun 3189-ЮР-son (1).pdf', NULL, '2024-11-12 06:06:02', '2024-11-12 06:06:02'),
(83, 5, 35, 'Rezolyutsiya 29 Oktabr 2024 kun 3189-ЮР-son (2).pdf', NULL, '1731391562_Rezolyutsiya 29 Oktabr 2024 kun 3189-ЮР-son (2).pdf', NULL, '2024-11-12 06:06:02', '2024-11-12 06:06:02'),
(84, 5, 35, 'Rezolyutsiya 29 Oktabr 2024 kun 3189-ЮР-son.pdf', NULL, '1731391562_Rezolyutsiya 29 Oktabr 2024 kun 3189-ЮР-son.pdf', NULL, '2024-11-12 06:06:02', '2024-11-12 06:06:02'),
(85, 5, 35, 'Rezolyutsiya 30 Oktabr 2024 kun 3189-ЮР-son.pdf', NULL, '1731391562_Rezolyutsiya 30 Oktabr 2024 kun 3189-ЮР-son.pdf', NULL, '2024-11-12 06:06:02', '2024-11-12 06:06:02'),
(86, 5, 35, 'прожект эра.pdf', NULL, '1731391562_прожект эра.pdf', NULL, '2024-11-12 06:06:02', '2024-11-12 06:06:02'),
(87, 5, 36, 'OF89448432.pdf', NULL, '1731391918_OF89448432.pdf', NULL, '2024-11-12 06:11:58', '2024-11-12 06:11:58'),
(88, 5, 36, 'Rezolyutsiya 30 Oktabr 2024 kun 9091-02-son (1).pdf', NULL, '1731391918_Rezolyutsiya 30 Oktabr 2024 kun 9091-02-son (1).pdf', NULL, '2024-11-12 06:11:58', '2024-11-12 06:11:58'),
(89, 5, 36, 'Rezolyutsiya 30 Oktabr 2024 kun 9091-02-son (2).pdf', NULL, '1731391918_Rezolyutsiya 30 Oktabr 2024 kun 9091-02-son (2).pdf', NULL, '2024-11-12 06:11:58', '2024-11-12 06:11:58'),
(90, 5, 36, 'Rezolyutsiya 30 Oktabr 2024 kun 9091-02-son.pdf', NULL, '1731391918_Rezolyutsiya 30 Oktabr 2024 kun 9091-02-son.pdf', NULL, '2024-11-12 06:11:58', '2024-11-12 06:11:58'),
(91, 5, 37, '9075-02  -  AT02723574.pdf', NULL, '1731392116_9075-02  -  AT02723574.pdf', NULL, '2024-11-12 06:15:16', '2024-11-12 06:15:16'),
(92, 5, 37, 'Rezolyutsiya 29 Oktabr 2024 kun 9075-02-son (1).pdf', NULL, '1731392116_Rezolyutsiya 29 Oktabr 2024 kun 9075-02-son (1).pdf', NULL, '2024-11-12 06:15:16', '2024-11-12 06:15:16'),
(93, 5, 37, 'Rezolyutsiya 29 Oktabr 2024 kun 9075-02-son (2).pdf', NULL, '1731392116_Rezolyutsiya 29 Oktabr 2024 kun 9075-02-son (2).pdf', NULL, '2024-11-12 06:15:16', '2024-11-12 06:15:16'),
(94, 5, 37, 'Rezolyutsiya 29 Oktabr 2024 kun 9075-02-son.pdf', NULL, '1731392116_Rezolyutsiya 29 Oktabr 2024 kun 9075-02-son.pdf', NULL, '2024-11-12 06:15:16', '2024-11-12 06:15:16'),
(95, 5, 38, '9128-01  -  № 6-6204 от 30.10.2024.pdf', NULL, '1731392486_9128-01  -  № 6-6204 от 30.10.2024.pdf', NULL, '2024-11-12 06:21:26', '2024-11-12 06:21:26'),
(96, 5, 38, 'Rezolyutsiya 1 Noyabr 2024 kun 9128-01-son.pdf', NULL, '1731392486_Rezolyutsiya 1 Noyabr 2024 kun 9128-01-son.pdf', NULL, '2024-11-12 06:21:26', '2024-11-12 06:21:26'),
(97, 5, 38, 'Rezolyutsiya 30 Oktabr 2024 kun 9128-01-son (1).pdf', NULL, '1731392486_Rezolyutsiya 30 Oktabr 2024 kun 9128-01-son (1).pdf', NULL, '2024-11-12 06:21:26', '2024-11-12 06:21:26'),
(98, 5, 38, 'Rezolyutsiya 30 Oktabr 2024 kun 9128-01-son (2).pdf', NULL, '1731392486_Rezolyutsiya 30 Oktabr 2024 kun 9128-01-son (2).pdf', NULL, '2024-11-12 06:21:26', '2024-11-12 06:21:26'),
(99, 5, 38, 'Rezolyutsiya 30 Oktabr 2024 kun 9128-01-son.pdf', NULL, '1731392486_Rezolyutsiya 30 Oktabr 2024 kun 9128-01-son.pdf', NULL, '2024-11-12 06:21:26', '2024-11-12 06:21:26'),
(100, 5, 39, '9156-01  -  № 6-6231 от 31.10.2024.pdf', NULL, '1731392566_9156-01  -  № 6-6231 от 31.10.2024.pdf', NULL, '2024-11-12 06:22:46', '2024-11-12 06:22:46'),
(101, 5, 39, 'Rezolyutsiya 4 Noyabr 2024 kun 9156-01-son.pdf', NULL, '1731392566_Rezolyutsiya 4 Noyabr 2024 kun 9156-01-son.pdf', NULL, '2024-11-12 06:22:46', '2024-11-12 06:22:46'),
(102, 5, 39, 'Rezolyutsiya 31 Oktabr 2024 kun 9156-01-son (1).pdf', NULL, '1731392566_Rezolyutsiya 31 Oktabr 2024 kun 9156-01-son (1).pdf', NULL, '2024-11-12 06:22:46', '2024-11-12 06:22:46'),
(103, 5, 39, 'Rezolyutsiya 31 Oktabr 2024 kun 9156-01-son (2).pdf', NULL, '1731392566_Rezolyutsiya 31 Oktabr 2024 kun 9156-01-son (2).pdf', NULL, '2024-11-12 06:22:46', '2024-11-12 06:22:46'),
(104, 5, 39, 'Rezolyutsiya 31 Oktabr 2024 kun 9156-01-son.pdf', NULL, '1731392566_Rezolyutsiya 31 Oktabr 2024 kun 9156-01-son.pdf', NULL, '2024-11-12 06:22:46', '2024-11-12 06:22:46'),
(105, 5, 40, '9263-01-почта.pdf', NULL, '1731392897_9263-01-почта.pdf', NULL, '2024-11-12 06:28:17', '2024-11-12 06:28:17'),
(106, 5, 40, 'Rezolyutsiya 4 Noyabr 2024 kun 9263-01-son (1).pdf', NULL, '1731392914_Rezolyutsiya 4 Noyabr 2024 kun 9263-01-son (1).pdf', NULL, '2024-11-12 06:28:34', '2024-11-12 06:28:34'),
(107, 5, 40, 'Rezolyutsiya 4 Noyabr 2024 kun 9263-01-son (2).pdf', NULL, '1731392948_Rezolyutsiya 4 Noyabr 2024 kun 9263-01-son (2).pdf', NULL, '2024-11-12 06:29:08', '2024-11-12 06:29:08'),
(108, 5, 40, 'Rezolyutsiya 4 Noyabr 2024 kun 9263-01-son.pdf', NULL, '1731392948_Rezolyutsiya 4 Noyabr 2024 kun 9263-01-son.pdf', NULL, '2024-11-12 06:29:08', '2024-11-12 06:29:08'),
(109, 29, 28, '1731173848_Реновация 715_14_0_Q_24_8_ноябрь_ҳолатига.xls', NULL, '1731425070_1731173848_Реновация 715_14_0_Q_24_8_ноябрь_ҳолатига.xls', NULL, '2024-11-12 15:24:30', '2024-11-12 15:24:30'),
(111, 8, 4, 'Комментарии.docx', NULL, '1731426344_Комментарии.docx', NULL, '2024-11-12 15:45:44', '2024-11-12 15:45:44'),
(112, 5, 41, 'CamScanner 2024-11-12 16.58.pdf', NULL, '1731428325_CamScanner 2024-11-12 16.58.pdf', NULL, '2024-11-12 16:18:45', '2024-11-12 16:18:45'),
(113, 29, 27, '1731425070_1731173848_Реновация 715_14_0_Q_24_8_ноябрь_ҳолатига.xls', NULL, '1731490215_1731425070_1731173848_Реновация 715_14_0_Q_24_8_ноябрь_ҳолатига.xls', NULL, '2024-11-13 09:30:15', '2024-11-13 09:30:15'),
(114, 5, 42, 'img20241113_12591605.pdf', NULL, '1731490790_img20241113_12591605.pdf', NULL, '2024-11-13 09:39:50', '2024-11-13 09:39:50'),
(115, 5, 43, '437.pdf', NULL, '1731492694_437.pdf', NULL, '2024-11-13 10:11:34', '2024-11-13 10:11:34'),
(117, 5, 43, 'Тошкент_Инвест_Компания_2_ижрочи_715_14_0_Q_24_8_ноябрь_ҳолатига.xls', NULL, '1731492924_Тошкент_Инвест_Компания_2_ижрочи_715_14_0_Q_24_8_ноябрь_ҳолатига.xls', NULL, '2024-11-13 10:15:24', '2024-11-13 10:15:24'),
(118, 19, 43, 'ответ (1).xls', NULL, '1731494652_ответ (1).xls', NULL, '2024-11-13 10:44:12', '2024-11-13 10:44:12'),
(119, 5, 7, 'NY81677694.pdf', NULL, '1731521127_NY81677694.pdf', NULL, '2024-11-13 18:05:27', '2024-11-13 18:05:27'),
(120, 5, 44, 'img20241114_09375740.pdf', NULL, '1731564116_img20241114_09375740.pdf', NULL, '2024-11-14 06:01:56', '2024-11-14 06:01:56'),
(121, 5, 44, 'img20241113_21572553.pdf', NULL, '1731564133_img20241113_21572553.pdf', NULL, '2024-11-14 06:02:13', '2024-11-14 06:02:13'),
(122, 5, 45, 'КП.pdf', NULL, '1731567266_КП.pdf', NULL, '2024-11-14 06:54:26', '2024-11-14 06:54:26'),
(123, 5, 46, 'БЕНЕТ СМАРТ (3).pdf', NULL, '1731570872_БЕНЕТ СМАРТ (3).pdf', NULL, '2024-11-14 07:54:32', '2024-11-14 07:54:32'),
(124, 29, 47, 'Основные проекты Каримов.xlsx', NULL, '1731584662_Основные проекты Каримов.xlsx', NULL, '2024-11-14 11:44:22', '2024-11-14 11:44:22'),
(125, 61, 36, 'АПЗ_Статус_20241115.xlsx', NULL, '1731647356_АПЗ_Статус_20241115.xlsx', NULL, '2024-11-15 05:09:16', '2024-11-15 05:09:16'),
(126, 61, 37, 'АПЗ_Статус_20241115.xlsx', NULL, '1731647415_АПЗ_Статус_20241115.xlsx', NULL, '2024-11-15 05:10:15', '2024-11-15 05:10:15'),
(127, 5, 48, 'photo_2024-11-15_14-38-52 (2).jpg', NULL, '1731904511_photo_2024-11-15_14-38-52 (2).jpg', NULL, '2024-11-18 04:35:11', '2024-11-18 04:35:11'),
(128, 5, 48, 'photo_2024-11-15_14-38-52.jpg', NULL, '1731904511_photo_2024-11-15_14-38-52.jpg', NULL, '2024-11-18 04:35:11', '2024-11-18 04:35:11'),
(129, 5, 48, 'Исх.15-11-2024 от 15.11.2024.pdf', NULL, '1731904511_Исх.15-11-2024 от 15.11.2024.pdf', NULL, '2024-11-18 04:35:11', '2024-11-18 04:35:11'),
(130, 5, 49, 'photo_2024-11-15_15-36-52 (2).jpg', NULL, '1731904785_photo_2024-11-15_15-36-52 (2).jpg', NULL, '2024-11-18 04:39:45', '2024-11-18 04:39:45'),
(131, 5, 49, 'photo_2024-11-15_15-36-52.jpg', NULL, '1731904785_photo_2024-11-15_15-36-52.jpg', NULL, '2024-11-18 04:39:45', '2024-11-18 04:39:45'),
(132, 5, 49, 'Исх.№16-11-2024 от 15.11.2024г..pdf', NULL, '1731904785_Исх.№16-11-2024 от 15.11.2024г..pdf', NULL, '2024-11-18 04:39:45', '2024-11-18 04:39:45'),
(133, 5, 50, '20240711_122741.jpg', NULL, '1731906323_20240711_122741.jpg', NULL, '2024-11-18 05:05:23', '2024-11-18 05:05:23'),
(134, 5, 50, '20240711_123028.jpg', NULL, '1731906323_20240711_123028.jpg', NULL, '2024-11-18 05:05:23', '2024-11-18 05:05:23'),
(135, 5, 50, 'IMG_20240626_160024_817.jpg', NULL, '1731906323_IMG_20240626_160024_817.jpg', NULL, '2024-11-18 05:05:23', '2024-11-18 05:05:23'),
(136, 5, 50, 'IMG_20241107_152038_262.jpg', NULL, '1731906323_IMG_20241107_152038_262.jpg', NULL, '2024-11-18 05:05:23', '2024-11-18 05:05:23'),
(137, 5, 50, 'Доп. Резюме.pdf', NULL, '1731906323_Доп. Резюме.pdf', NULL, '2024-11-18 05:05:23', '2024-11-18 05:05:23'),
(138, 5, 50, 'резюме Леонид Хакунов (2).docx', NULL, '1731906323_резюме Леонид Хакунов (2).docx', NULL, '2024-11-18 05:05:23', '2024-11-18 05:05:23'),
(139, 5, 51, 'img20241118_10142868.pdf', NULL, '1731910637_img20241118_10142868.pdf', NULL, '2024-11-18 06:17:17', '2024-11-18 06:17:17'),
(140, 5, 52, 'img20241118_10261528.pdf', NULL, '1731948890_img20241118_10261528.pdf', NULL, '2024-11-18 16:54:50', '2024-11-18 16:54:50'),
(141, 5, 52, '682-14-0-Q_24 (1).pdf', NULL, '1731949372_682-14-0-Q_24 (1).pdf', NULL, '2024-11-18 17:02:52', '2024-11-18 17:02:52'),
(142, 5, 53, '575-14-0-q.24.pdf', NULL, '1731949979_575-14-0-q.24.pdf', NULL, '2024-11-18 17:12:59', '2024-11-18 17:12:59'),
(143, 5, 54, '418-14-0-Q.24.pdf', NULL, '1731950326_418-14-0-Q.24.pdf', NULL, '2024-11-18 17:18:46', '2024-11-18 17:18:46'),
(144, 33, 49, '316 от 19.11.2024.pdf', NULL, '1731996854_316 от 19.11.2024.pdf', NULL, '2024-11-19 06:14:14', '2024-11-19 06:14:14'),
(145, 33, 48, '315 от 19.11.2024.pdf', NULL, '1731996900_315 от 19.11.2024.pdf', NULL, '2024-11-19 06:15:00', '2024-11-19 06:15:00'),
(146, 5, 55, '10% перевод на YASIZ.pdf', NULL, '1732525222_10% перевод на YASIZ.pdf', NULL, '2024-11-25 09:00:22', '2024-11-25 09:00:22'),
(147, 5, 56, '515-14-0.pdf', NULL, '1732527778_515-14-0.pdf', NULL, '2024-11-25 09:42:58', '2024-11-25 09:42:58'),
(148, 5, 57, 'img20241126_10113900.pdf', NULL, '1732598225_img20241126_10113900.pdf', NULL, '2024-11-26 05:17:05', '2024-11-26 05:17:05'),
(149, 5, 58, 'маблағ ажратиш 604 14.pdf', NULL, '1732688472_маблағ ажратиш 604 14.pdf', NULL, '2024-11-27 06:21:12', '2024-11-27 06:21:12'),
(150, 5, 59, 'маблағ ажратиш 867 14 .pdf', NULL, '1732689393_маблағ ажратиш 867 14 .pdf', NULL, '2024-11-27 06:36:33', '2024-11-27 06:36:33'),
(151, 5, 60, 'вхд 43 869-14-0 маблағ ажратиш.pdf', NULL, '1732775609_вхд 43 869-14-0 маблағ ажратиш.pdf', NULL, '2024-11-28 06:33:29', '2024-11-28 06:33:29'),
(152, 5, 61, 'вхд 44 868-14-0 маблағ ажратиш.pdf', NULL, '1732775898_вхд 44 868-14-0 маблағ ажратиш.pdf', NULL, '2024-11-28 06:38:18', '2024-11-28 06:38:18'),
(153, 5, 62, 'вхд 45 873-14-0 маблағ ажратиш.pdf', NULL, '1732776242_вхд 45 873-14-0 маблағ ажратиш.pdf', NULL, '2024-11-28 06:44:02', '2024-11-28 06:44:02'),
(154, 5, 63, 'Вх 46 от 02.12.2024 сумма 684,2 млн.pdf', NULL, '1733122559_Вх 46 от 02.12.2024 сумма 684,2 млн.pdf', NULL, '2024-12-02 06:55:59', '2024-12-02 06:55:59'),
(155, 5, 61, 'вхд 44 га илова.pdf', NULL, '1733123857_вхд 44 га илова.pdf', NULL, '2024-12-02 07:17:37', '2024-12-02 07:17:37'),
(156, 5, 59, 'вхд № 42 га хат.pdf', NULL, '1733139043_вхд № 42 га хат.pdf', NULL, '2024-12-02 11:30:43', '2024-12-02 11:30:43'),
(157, 5, 64, 'вхд № 48 879-14 от 02.12.2024.pdf', NULL, '1733145004_вхд № 48 879-14 от 02.12.2024.pdf', NULL, '2024-12-02 13:10:04', '2024-12-02 13:10:04'),
(158, 5, 64, 'вхд № 48 га хат.pdf', NULL, '1733145021_вхд № 48 га хат.pdf', NULL, '2024-12-02 13:10:21', '2024-12-02 13:10:21'),
(159, 5, 62, 'вхд №45 га хат.pdf', NULL, '1733147101_вхд №45 га хат.pdf', NULL, '2024-12-02 13:45:01', '2024-12-02 13:45:01'),
(160, 5, 61, 'вхд №44 га хат.pdf', NULL, '1733147191_вхд №44 га хат.pdf', NULL, '2024-12-02 13:46:31', '2024-12-02 13:46:31'),
(161, 5, 65, '01-Б-163 сонли баён от 04.12.pdf', NULL, '1733314353_01-Б-163 сонли баён от 04.12.pdf', NULL, '2024-12-04 12:12:33', '2024-12-04 12:12:33'),
(162, 29, 65, 'Китай.xlsx', NULL, '1733380002_Китай.xlsx', NULL, '2024-12-05 06:26:42', '2024-12-05 06:26:42'),
(163, 5, 66, 'вхд 54 от 05.12 895-14-0-Q24.pdf', NULL, '1733382917_вхд 54 от 05.12 895-14-0-Q24.pdf', NULL, '2024-12-05 07:15:17', '2024-12-05 07:15:17'),
(164, 5, 67, 'вхд 203 от 05.12 реновация таклифи.pdf', NULL, '1733396852_вхд 203 от 05.12 реновация таклифи.pdf', NULL, '2024-12-05 11:07:33', '2024-12-05 11:07:33'),
(165, 5, 68, 'вхд 204 от 05.12 pelican motors.pdf', NULL, '1733397114_вхд 204 от 05.12 pelican motors.pdf', NULL, '2024-12-05 11:11:54', '2024-12-05 11:11:54'),
(166, 5, 66, '895-14-0-Q-24.pdf', NULL, '1733400659_895-14-0-Q-24.pdf', NULL, '2024-12-05 12:10:59', '2024-12-05 12:10:59'),
(167, 5, 69, 'вхд № 206 от 05.12 реновацияга таклиф.pdf', NULL, '1733412507_вхд № 206 от 05.12 реновацияга таклиф.pdf', NULL, '2024-12-05 15:28:28', '2024-12-05 15:28:28'),
(168, 5, 70, 'вхн № 57 от 11.12 907-14-0-Q-24.pdf', NULL, '1733920479_вхн № 57 от 11.12 907-14-0-Q-24.pdf', NULL, '2024-12-11 12:34:39', '2024-12-11 12:34:39'),
(169, 5, 71, '934-14-0-Q-24.pdf', NULL, '1734932791_934-14-0-Q-24.pdf', NULL, '2024-12-23 05:46:31', '2024-12-23 05:46:31'),
(170, 5, 72, '935-14-0-Q-24.pdf', NULL, '1734933252_935-14-0-Q-24.pdf', NULL, '2024-12-23 05:54:12', '2024-12-23 05:54:12'),
(171, 5, 73, '936-14-0-Q-24.pdf', NULL, '1734933519_936-14-0-Q-24.pdf', NULL, '2024-12-23 05:58:39', '2024-12-23 05:58:39');

-- --------------------------------------------------------

--
-- Структура таблицы `long_texts`
--

CREATE TABLE `long_texts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_02_05_183451_create_permission_tables', 1),
(5, '2021_06_10_115905_create_api_users_table', 1),
(6, '2021_06_30_131020_create_tokens_table', 1),
(7, '2024_01_19_210645_create_category_table', 1),
(8, '2024_02_04_104551_create_long_texts_table', 1),
(9, '2024_02_04_141240_task_status_table', 1),
(10, '2024_02_04_141243_create_tasks_table', 1),
(11, '2024_02_25_211741_create_orders_table', 1),
(12, '2024_10_04_161950_create_files_table', 1),
(13, '2024_10_09_095841_create_role_task_table', 1),
(14, '2024_10_09_164232_create_task_user_table', 1),
(15, '2024_11_18_174639_create_qarorlars_table', 2),
(16, '2024_11_18_181234_create_qaror_files_table', 2),
(17, '2024_11_21_100022_add_amount_to_qarorlars_table', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 2),
(1, 'App\\Models\\User', 3),
(1, 'App\\Models\\User', 4),
(1, 'App\\Models\\User', 5),
(1, 'App\\Models\\User', 6),
(1, 'App\\Models\\User', 7),
(1, 'App\\Models\\User', 8),
(1, 'App\\Models\\User', 9),
(1, 'App\\Models\\User', 10),
(1, 'App\\Models\\User', 11),
(1, 'App\\Models\\User', 12),
(1, 'App\\Models\\User', 13),
(1, 'App\\Models\\User', 14),
(1, 'App\\Models\\User', 15),
(1, 'App\\Models\\User', 16),
(1, 'App\\Models\\User', 17),
(1, 'App\\Models\\User', 18),
(1, 'App\\Models\\User', 19),
(1, 'App\\Models\\User', 20),
(1, 'App\\Models\\User', 21),
(1, 'App\\Models\\User', 22),
(1, 'App\\Models\\User', 23),
(1, 'App\\Models\\User', 24),
(1, 'App\\Models\\User', 25),
(1, 'App\\Models\\User', 26),
(1, 'App\\Models\\User', 27),
(1, 'App\\Models\\User', 28),
(1, 'App\\Models\\User', 29),
(1, 'App\\Models\\User', 30),
(1, 'App\\Models\\User', 31),
(1, 'App\\Models\\User', 32),
(1, 'App\\Models\\User', 33),
(1, 'App\\Models\\User', 34),
(1, 'App\\Models\\User', 35),
(1, 'App\\Models\\User', 36),
(1, 'App\\Models\\User', 37),
(1, 'App\\Models\\User', 38),
(1, 'App\\Models\\User', 39),
(1, 'App\\Models\\User', 40),
(1, 'App\\Models\\User', 41),
(1, 'App\\Models\\User', 42),
(1, 'App\\Models\\User', 43),
(1, 'App\\Models\\User', 44),
(1, 'App\\Models\\User', 45),
(1, 'App\\Models\\User', 46),
(1, 'App\\Models\\User', 47),
(1, 'App\\Models\\User', 48),
(1, 'App\\Models\\User', 49),
(1, 'App\\Models\\User', 50),
(1, 'App\\Models\\User', 51),
(1, 'App\\Models\\User', 52),
(1, 'App\\Models\\User', 53),
(1, 'App\\Models\\User', 54),
(1, 'App\\Models\\User', 55),
(1, 'App\\Models\\User', 56),
(1, 'App\\Models\\User', 57),
(1, 'App\\Models\\User', 58),
(1, 'App\\Models\\User', 59),
(1, 'App\\Models\\User', 60),
(1, 'App\\Models\\User', 61),
(1, 'App\\Models\\User', 62),
(1, 'App\\Models\\User', 63),
(1, 'App\\Models\\User', 64),
(1, 'App\\Models\\User', 65),
(2, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 3),
(2, 'App\\Models\\User', 4),
(2, 'App\\Models\\User', 5),
(2, 'App\\Models\\User', 6),
(2, 'App\\Models\\User', 7),
(2, 'App\\Models\\User', 8),
(2, 'App\\Models\\User', 9),
(2, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 11),
(2, 'App\\Models\\User', 12),
(2, 'App\\Models\\User', 13),
(2, 'App\\Models\\User', 14),
(2, 'App\\Models\\User', 15),
(2, 'App\\Models\\User', 16),
(2, 'App\\Models\\User', 17),
(2, 'App\\Models\\User', 18),
(2, 'App\\Models\\User', 19),
(2, 'App\\Models\\User', 20),
(2, 'App\\Models\\User', 21),
(2, 'App\\Models\\User', 22),
(2, 'App\\Models\\User', 23),
(2, 'App\\Models\\User', 24),
(2, 'App\\Models\\User', 25),
(2, 'App\\Models\\User', 26),
(2, 'App\\Models\\User', 27),
(2, 'App\\Models\\User', 28),
(2, 'App\\Models\\User', 29),
(2, 'App\\Models\\User', 30),
(2, 'App\\Models\\User', 31),
(2, 'App\\Models\\User', 32),
(2, 'App\\Models\\User', 33),
(2, 'App\\Models\\User', 34),
(2, 'App\\Models\\User', 35),
(2, 'App\\Models\\User', 36),
(2, 'App\\Models\\User', 37),
(2, 'App\\Models\\User', 38),
(2, 'App\\Models\\User', 39),
(2, 'App\\Models\\User', 40),
(2, 'App\\Models\\User', 41),
(2, 'App\\Models\\User', 42),
(2, 'App\\Models\\User', 43),
(2, 'App\\Models\\User', 44),
(2, 'App\\Models\\User', 45),
(2, 'App\\Models\\User', 46),
(2, 'App\\Models\\User', 47),
(2, 'App\\Models\\User', 48),
(2, 'App\\Models\\User', 49),
(2, 'App\\Models\\User', 50),
(2, 'App\\Models\\User', 51),
(2, 'App\\Models\\User', 52),
(2, 'App\\Models\\User', 53),
(2, 'App\\Models\\User', 54),
(2, 'App\\Models\\User', 55),
(2, 'App\\Models\\User', 56),
(2, 'App\\Models\\User', 57),
(2, 'App\\Models\\User', 58),
(2, 'App\\Models\\User', 59),
(2, 'App\\Models\\User', 60),
(2, 'App\\Models\\User', 61),
(2, 'App\\Models\\User', 62),
(2, 'App\\Models\\User', 63),
(2, 'App\\Models\\User', 64),
(2, 'App\\Models\\User', 65),
(3, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 5),
(3, 'App\\Models\\User', 6),
(3, 'App\\Models\\User', 7),
(3, 'App\\Models\\User', 8),
(3, 'App\\Models\\User', 9),
(3, 'App\\Models\\User', 10),
(3, 'App\\Models\\User', 11),
(3, 'App\\Models\\User', 12),
(3, 'App\\Models\\User', 13),
(3, 'App\\Models\\User', 14),
(3, 'App\\Models\\User', 15),
(3, 'App\\Models\\User', 16),
(3, 'App\\Models\\User', 17),
(3, 'App\\Models\\User', 18),
(3, 'App\\Models\\User', 19),
(3, 'App\\Models\\User', 20),
(3, 'App\\Models\\User', 21),
(3, 'App\\Models\\User', 22),
(3, 'App\\Models\\User', 23),
(3, 'App\\Models\\User', 24),
(3, 'App\\Models\\User', 25),
(3, 'App\\Models\\User', 26),
(3, 'App\\Models\\User', 27),
(3, 'App\\Models\\User', 28),
(3, 'App\\Models\\User', 29),
(3, 'App\\Models\\User', 30),
(3, 'App\\Models\\User', 31),
(3, 'App\\Models\\User', 32),
(3, 'App\\Models\\User', 33),
(3, 'App\\Models\\User', 34),
(3, 'App\\Models\\User', 35),
(3, 'App\\Models\\User', 36),
(3, 'App\\Models\\User', 37),
(3, 'App\\Models\\User', 38),
(3, 'App\\Models\\User', 39),
(3, 'App\\Models\\User', 40),
(3, 'App\\Models\\User', 41),
(3, 'App\\Models\\User', 42),
(3, 'App\\Models\\User', 43),
(3, 'App\\Models\\User', 44),
(3, 'App\\Models\\User', 45),
(3, 'App\\Models\\User', 46),
(3, 'App\\Models\\User', 47),
(3, 'App\\Models\\User', 48),
(3, 'App\\Models\\User', 49),
(3, 'App\\Models\\User', 50),
(3, 'App\\Models\\User', 51),
(3, 'App\\Models\\User', 52),
(3, 'App\\Models\\User', 53),
(3, 'App\\Models\\User', 54),
(3, 'App\\Models\\User', 55),
(3, 'App\\Models\\User', 56),
(3, 'App\\Models\\User', 57),
(3, 'App\\Models\\User', 58),
(3, 'App\\Models\\User', 59),
(3, 'App\\Models\\User', 60),
(3, 'App\\Models\\User', 61),
(3, 'App\\Models\\User', 62),
(3, 'App\\Models\\User', 63),
(3, 'App\\Models\\User', 64),
(3, 'App\\Models\\User', 65),
(4, 'App\\Models\\User', 1),
(4, 'App\\Models\\User', 2),
(4, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 4),
(4, 'App\\Models\\User', 5),
(4, 'App\\Models\\User', 6),
(4, 'App\\Models\\User', 7),
(4, 'App\\Models\\User', 8),
(4, 'App\\Models\\User', 9),
(4, 'App\\Models\\User', 10),
(4, 'App\\Models\\User', 11),
(4, 'App\\Models\\User', 12),
(4, 'App\\Models\\User', 13),
(4, 'App\\Models\\User', 14),
(4, 'App\\Models\\User', 15),
(4, 'App\\Models\\User', 16),
(4, 'App\\Models\\User', 17),
(4, 'App\\Models\\User', 18),
(4, 'App\\Models\\User', 19),
(4, 'App\\Models\\User', 20),
(4, 'App\\Models\\User', 21),
(4, 'App\\Models\\User', 22),
(4, 'App\\Models\\User', 23),
(4, 'App\\Models\\User', 24),
(4, 'App\\Models\\User', 25),
(4, 'App\\Models\\User', 26),
(4, 'App\\Models\\User', 27),
(4, 'App\\Models\\User', 28),
(4, 'App\\Models\\User', 29),
(4, 'App\\Models\\User', 30),
(4, 'App\\Models\\User', 31),
(4, 'App\\Models\\User', 32),
(4, 'App\\Models\\User', 33),
(4, 'App\\Models\\User', 34),
(4, 'App\\Models\\User', 35),
(4, 'App\\Models\\User', 36),
(4, 'App\\Models\\User', 37),
(4, 'App\\Models\\User', 38),
(4, 'App\\Models\\User', 39),
(4, 'App\\Models\\User', 40),
(4, 'App\\Models\\User', 41),
(4, 'App\\Models\\User', 42),
(4, 'App\\Models\\User', 43),
(4, 'App\\Models\\User', 44),
(4, 'App\\Models\\User', 45),
(4, 'App\\Models\\User', 46),
(4, 'App\\Models\\User', 47),
(4, 'App\\Models\\User', 48),
(4, 'App\\Models\\User', 49),
(4, 'App\\Models\\User', 50),
(4, 'App\\Models\\User', 51),
(4, 'App\\Models\\User', 52),
(4, 'App\\Models\\User', 53),
(4, 'App\\Models\\User', 54),
(4, 'App\\Models\\User', 55),
(4, 'App\\Models\\User', 56),
(4, 'App\\Models\\User', 57),
(4, 'App\\Models\\User', 58),
(4, 'App\\Models\\User', 59),
(4, 'App\\Models\\User', 60),
(4, 'App\\Models\\User', 61),
(4, 'App\\Models\\User', 62),
(4, 'App\\Models\\User', 63),
(4, 'App\\Models\\User', 64),
(4, 'App\\Models\\User', 65),
(5, 'App\\Models\\User', 1),
(5, 'App\\Models\\User', 2),
(5, 'App\\Models\\User', 3),
(5, 'App\\Models\\User', 4),
(5, 'App\\Models\\User', 5),
(5, 'App\\Models\\User', 6),
(5, 'App\\Models\\User', 7),
(5, 'App\\Models\\User', 8),
(5, 'App\\Models\\User', 9),
(5, 'App\\Models\\User', 10),
(5, 'App\\Models\\User', 11),
(5, 'App\\Models\\User', 12),
(5, 'App\\Models\\User', 13),
(5, 'App\\Models\\User', 14),
(5, 'App\\Models\\User', 15),
(5, 'App\\Models\\User', 16),
(5, 'App\\Models\\User', 17),
(5, 'App\\Models\\User', 18),
(5, 'App\\Models\\User', 19),
(5, 'App\\Models\\User', 20),
(5, 'App\\Models\\User', 21),
(5, 'App\\Models\\User', 22),
(5, 'App\\Models\\User', 23),
(5, 'App\\Models\\User', 24),
(5, 'App\\Models\\User', 25),
(5, 'App\\Models\\User', 26),
(5, 'App\\Models\\User', 27),
(5, 'App\\Models\\User', 28),
(5, 'App\\Models\\User', 29),
(5, 'App\\Models\\User', 30),
(5, 'App\\Models\\User', 31),
(5, 'App\\Models\\User', 32),
(5, 'App\\Models\\User', 33),
(5, 'App\\Models\\User', 34),
(5, 'App\\Models\\User', 35),
(5, 'App\\Models\\User', 36),
(5, 'App\\Models\\User', 37),
(5, 'App\\Models\\User', 38),
(5, 'App\\Models\\User', 39),
(5, 'App\\Models\\User', 40),
(5, 'App\\Models\\User', 41),
(5, 'App\\Models\\User', 42),
(5, 'App\\Models\\User', 43),
(5, 'App\\Models\\User', 44),
(5, 'App\\Models\\User', 45),
(5, 'App\\Models\\User', 46),
(5, 'App\\Models\\User', 47),
(5, 'App\\Models\\User', 48),
(5, 'App\\Models\\User', 49),
(5, 'App\\Models\\User', 50),
(5, 'App\\Models\\User', 51),
(5, 'App\\Models\\User', 52),
(5, 'App\\Models\\User', 53),
(5, 'App\\Models\\User', 54),
(5, 'App\\Models\\User', 55),
(5, 'App\\Models\\User', 56),
(5, 'App\\Models\\User', 57),
(5, 'App\\Models\\User', 58),
(5, 'App\\Models\\User', 59),
(5, 'App\\Models\\User', 60),
(5, 'App\\Models\\User', 61),
(5, 'App\\Models\\User', 62),
(5, 'App\\Models\\User', 63),
(5, 'App\\Models\\User', 64),
(5, 'App\\Models\\User', 65),
(6, 'App\\Models\\User', 1),
(6, 'App\\Models\\User', 2),
(6, 'App\\Models\\User', 3),
(6, 'App\\Models\\User', 4),
(6, 'App\\Models\\User', 5),
(6, 'App\\Models\\User', 6),
(6, 'App\\Models\\User', 7),
(6, 'App\\Models\\User', 8),
(6, 'App\\Models\\User', 9),
(6, 'App\\Models\\User', 10),
(6, 'App\\Models\\User', 11),
(6, 'App\\Models\\User', 12),
(6, 'App\\Models\\User', 13),
(6, 'App\\Models\\User', 14),
(6, 'App\\Models\\User', 15),
(6, 'App\\Models\\User', 16),
(6, 'App\\Models\\User', 17),
(6, 'App\\Models\\User', 18),
(6, 'App\\Models\\User', 19),
(6, 'App\\Models\\User', 20),
(6, 'App\\Models\\User', 21),
(6, 'App\\Models\\User', 22),
(6, 'App\\Models\\User', 23),
(6, 'App\\Models\\User', 24),
(6, 'App\\Models\\User', 25),
(6, 'App\\Models\\User', 26),
(6, 'App\\Models\\User', 27),
(6, 'App\\Models\\User', 28),
(6, 'App\\Models\\User', 29),
(6, 'App\\Models\\User', 30),
(6, 'App\\Models\\User', 31),
(6, 'App\\Models\\User', 32),
(6, 'App\\Models\\User', 33),
(6, 'App\\Models\\User', 34),
(6, 'App\\Models\\User', 35),
(6, 'App\\Models\\User', 36),
(6, 'App\\Models\\User', 37),
(6, 'App\\Models\\User', 38),
(6, 'App\\Models\\User', 39),
(6, 'App\\Models\\User', 40),
(6, 'App\\Models\\User', 41),
(6, 'App\\Models\\User', 42),
(6, 'App\\Models\\User', 43),
(6, 'App\\Models\\User', 44),
(6, 'App\\Models\\User', 45),
(6, 'App\\Models\\User', 46),
(6, 'App\\Models\\User', 47),
(6, 'App\\Models\\User', 48),
(6, 'App\\Models\\User', 49),
(6, 'App\\Models\\User', 50),
(6, 'App\\Models\\User', 51),
(6, 'App\\Models\\User', 52),
(6, 'App\\Models\\User', 53),
(6, 'App\\Models\\User', 54),
(6, 'App\\Models\\User', 55),
(6, 'App\\Models\\User', 56),
(6, 'App\\Models\\User', 57),
(6, 'App\\Models\\User', 58),
(6, 'App\\Models\\User', 59),
(6, 'App\\Models\\User', 60),
(6, 'App\\Models\\User', 61),
(6, 'App\\Models\\User', 62),
(6, 'App\\Models\\User', 63),
(6, 'App\\Models\\User', 64),
(6, 'App\\Models\\User', 65),
(7, 'App\\Models\\User', 1),
(7, 'App\\Models\\User', 2),
(7, 'App\\Models\\User', 3),
(7, 'App\\Models\\User', 4),
(7, 'App\\Models\\User', 5),
(7, 'App\\Models\\User', 6),
(7, 'App\\Models\\User', 7),
(7, 'App\\Models\\User', 8),
(7, 'App\\Models\\User', 9),
(7, 'App\\Models\\User', 10),
(7, 'App\\Models\\User', 11),
(7, 'App\\Models\\User', 12),
(7, 'App\\Models\\User', 13),
(7, 'App\\Models\\User', 14),
(7, 'App\\Models\\User', 15),
(7, 'App\\Models\\User', 16),
(7, 'App\\Models\\User', 17),
(7, 'App\\Models\\User', 18),
(7, 'App\\Models\\User', 19),
(7, 'App\\Models\\User', 20),
(7, 'App\\Models\\User', 21),
(7, 'App\\Models\\User', 22),
(7, 'App\\Models\\User', 23),
(7, 'App\\Models\\User', 24),
(7, 'App\\Models\\User', 25),
(7, 'App\\Models\\User', 26),
(7, 'App\\Models\\User', 27),
(7, 'App\\Models\\User', 28),
(7, 'App\\Models\\User', 29),
(7, 'App\\Models\\User', 30),
(7, 'App\\Models\\User', 31),
(7, 'App\\Models\\User', 32),
(7, 'App\\Models\\User', 33),
(7, 'App\\Models\\User', 34),
(7, 'App\\Models\\User', 35),
(7, 'App\\Models\\User', 36),
(7, 'App\\Models\\User', 37),
(7, 'App\\Models\\User', 38),
(7, 'App\\Models\\User', 39),
(7, 'App\\Models\\User', 40),
(7, 'App\\Models\\User', 41),
(7, 'App\\Models\\User', 42),
(7, 'App\\Models\\User', 43),
(7, 'App\\Models\\User', 44),
(7, 'App\\Models\\User', 45),
(7, 'App\\Models\\User', 46),
(7, 'App\\Models\\User', 47),
(7, 'App\\Models\\User', 48),
(7, 'App\\Models\\User', 49),
(7, 'App\\Models\\User', 50),
(7, 'App\\Models\\User', 51),
(7, 'App\\Models\\User', 52),
(7, 'App\\Models\\User', 53),
(7, 'App\\Models\\User', 54),
(7, 'App\\Models\\User', 55),
(7, 'App\\Models\\User', 56),
(7, 'App\\Models\\User', 57),
(7, 'App\\Models\\User', 58),
(7, 'App\\Models\\User', 59),
(7, 'App\\Models\\User', 60),
(7, 'App\\Models\\User', 61),
(7, 'App\\Models\\User', 62),
(7, 'App\\Models\\User', 63),
(7, 'App\\Models\\User', 64),
(7, 'App\\Models\\User', 65),
(8, 'App\\Models\\User', 1),
(8, 'App\\Models\\User', 2),
(8, 'App\\Models\\User', 3),
(8, 'App\\Models\\User', 4),
(8, 'App\\Models\\User', 5),
(8, 'App\\Models\\User', 6),
(8, 'App\\Models\\User', 7),
(8, 'App\\Models\\User', 8),
(8, 'App\\Models\\User', 9),
(8, 'App\\Models\\User', 10),
(8, 'App\\Models\\User', 11),
(8, 'App\\Models\\User', 12),
(8, 'App\\Models\\User', 13),
(8, 'App\\Models\\User', 14),
(8, 'App\\Models\\User', 15),
(8, 'App\\Models\\User', 16),
(8, 'App\\Models\\User', 17),
(8, 'App\\Models\\User', 18),
(8, 'App\\Models\\User', 19),
(8, 'App\\Models\\User', 20),
(8, 'App\\Models\\User', 21),
(8, 'App\\Models\\User', 22),
(8, 'App\\Models\\User', 23),
(8, 'App\\Models\\User', 24),
(8, 'App\\Models\\User', 25),
(8, 'App\\Models\\User', 26),
(8, 'App\\Models\\User', 27),
(8, 'App\\Models\\User', 28),
(8, 'App\\Models\\User', 29),
(8, 'App\\Models\\User', 30),
(8, 'App\\Models\\User', 31),
(8, 'App\\Models\\User', 32),
(8, 'App\\Models\\User', 33),
(8, 'App\\Models\\User', 34),
(8, 'App\\Models\\User', 35),
(8, 'App\\Models\\User', 36),
(8, 'App\\Models\\User', 37),
(8, 'App\\Models\\User', 38),
(8, 'App\\Models\\User', 39),
(8, 'App\\Models\\User', 40),
(8, 'App\\Models\\User', 41),
(8, 'App\\Models\\User', 42),
(8, 'App\\Models\\User', 43),
(8, 'App\\Models\\User', 44),
(8, 'App\\Models\\User', 45),
(8, 'App\\Models\\User', 46),
(8, 'App\\Models\\User', 47),
(8, 'App\\Models\\User', 48),
(8, 'App\\Models\\User', 49),
(8, 'App\\Models\\User', 50),
(8, 'App\\Models\\User', 51),
(8, 'App\\Models\\User', 52),
(8, 'App\\Models\\User', 53),
(8, 'App\\Models\\User', 54),
(8, 'App\\Models\\User', 55),
(8, 'App\\Models\\User', 56),
(8, 'App\\Models\\User', 57),
(8, 'App\\Models\\User', 58),
(8, 'App\\Models\\User', 59),
(8, 'App\\Models\\User', 60),
(8, 'App\\Models\\User', 61),
(8, 'App\\Models\\User', 62),
(8, 'App\\Models\\User', 63),
(8, 'App\\Models\\User', 64),
(8, 'App\\Models\\User', 65),
(9, 'App\\Models\\User', 1),
(9, 'App\\Models\\User', 2),
(9, 'App\\Models\\User', 3),
(9, 'App\\Models\\User', 4),
(9, 'App\\Models\\User', 5),
(9, 'App\\Models\\User', 6),
(9, 'App\\Models\\User', 7),
(9, 'App\\Models\\User', 8),
(9, 'App\\Models\\User', 9),
(9, 'App\\Models\\User', 10),
(9, 'App\\Models\\User', 11),
(9, 'App\\Models\\User', 12),
(9, 'App\\Models\\User', 13),
(9, 'App\\Models\\User', 14),
(9, 'App\\Models\\User', 15),
(9, 'App\\Models\\User', 16),
(9, 'App\\Models\\User', 17),
(9, 'App\\Models\\User', 18),
(9, 'App\\Models\\User', 19),
(9, 'App\\Models\\User', 20),
(9, 'App\\Models\\User', 21),
(9, 'App\\Models\\User', 22),
(9, 'App\\Models\\User', 23),
(9, 'App\\Models\\User', 24),
(9, 'App\\Models\\User', 25),
(9, 'App\\Models\\User', 26),
(9, 'App\\Models\\User', 27),
(9, 'App\\Models\\User', 28),
(9, 'App\\Models\\User', 29),
(9, 'App\\Models\\User', 30),
(9, 'App\\Models\\User', 31),
(9, 'App\\Models\\User', 32),
(9, 'App\\Models\\User', 33),
(9, 'App\\Models\\User', 34),
(9, 'App\\Models\\User', 35),
(9, 'App\\Models\\User', 36),
(9, 'App\\Models\\User', 37),
(9, 'App\\Models\\User', 38),
(9, 'App\\Models\\User', 39),
(9, 'App\\Models\\User', 40),
(9, 'App\\Models\\User', 41),
(9, 'App\\Models\\User', 42),
(9, 'App\\Models\\User', 43),
(9, 'App\\Models\\User', 44),
(9, 'App\\Models\\User', 45),
(9, 'App\\Models\\User', 46),
(9, 'App\\Models\\User', 47),
(9, 'App\\Models\\User', 48),
(9, 'App\\Models\\User', 49),
(9, 'App\\Models\\User', 50),
(9, 'App\\Models\\User', 51),
(9, 'App\\Models\\User', 52),
(9, 'App\\Models\\User', 53),
(9, 'App\\Models\\User', 54),
(9, 'App\\Models\\User', 55),
(9, 'App\\Models\\User', 56),
(9, 'App\\Models\\User', 57),
(9, 'App\\Models\\User', 58),
(9, 'App\\Models\\User', 59),
(9, 'App\\Models\\User', 60),
(9, 'App\\Models\\User', 61),
(9, 'App\\Models\\User', 62),
(9, 'App\\Models\\User', 63),
(9, 'App\\Models\\User', 64),
(9, 'App\\Models\\User', 65),
(10, 'App\\Models\\User', 1),
(10, 'App\\Models\\User', 2),
(10, 'App\\Models\\User', 3),
(10, 'App\\Models\\User', 4),
(10, 'App\\Models\\User', 5),
(10, 'App\\Models\\User', 6),
(10, 'App\\Models\\User', 7),
(10, 'App\\Models\\User', 8),
(10, 'App\\Models\\User', 9),
(10, 'App\\Models\\User', 10),
(10, 'App\\Models\\User', 11),
(10, 'App\\Models\\User', 12),
(10, 'App\\Models\\User', 13),
(10, 'App\\Models\\User', 14),
(10, 'App\\Models\\User', 15),
(10, 'App\\Models\\User', 16),
(10, 'App\\Models\\User', 17),
(10, 'App\\Models\\User', 18),
(10, 'App\\Models\\User', 19),
(10, 'App\\Models\\User', 20),
(10, 'App\\Models\\User', 21),
(10, 'App\\Models\\User', 22),
(10, 'App\\Models\\User', 23),
(10, 'App\\Models\\User', 24),
(10, 'App\\Models\\User', 25),
(10, 'App\\Models\\User', 26),
(10, 'App\\Models\\User', 27),
(10, 'App\\Models\\User', 28),
(10, 'App\\Models\\User', 29),
(10, 'App\\Models\\User', 30),
(10, 'App\\Models\\User', 31),
(10, 'App\\Models\\User', 32),
(10, 'App\\Models\\User', 33),
(10, 'App\\Models\\User', 34),
(10, 'App\\Models\\User', 35),
(10, 'App\\Models\\User', 36),
(10, 'App\\Models\\User', 37),
(10, 'App\\Models\\User', 38),
(10, 'App\\Models\\User', 39),
(10, 'App\\Models\\User', 40),
(10, 'App\\Models\\User', 41),
(10, 'App\\Models\\User', 42),
(10, 'App\\Models\\User', 43),
(10, 'App\\Models\\User', 44),
(10, 'App\\Models\\User', 45),
(10, 'App\\Models\\User', 46),
(10, 'App\\Models\\User', 47),
(10, 'App\\Models\\User', 48),
(10, 'App\\Models\\User', 49),
(10, 'App\\Models\\User', 50),
(10, 'App\\Models\\User', 51),
(10, 'App\\Models\\User', 52),
(10, 'App\\Models\\User', 53),
(10, 'App\\Models\\User', 54),
(10, 'App\\Models\\User', 55),
(10, 'App\\Models\\User', 56),
(10, 'App\\Models\\User', 57),
(10, 'App\\Models\\User', 58),
(10, 'App\\Models\\User', 59),
(10, 'App\\Models\\User', 60),
(10, 'App\\Models\\User', 61),
(10, 'App\\Models\\User', 62),
(10, 'App\\Models\\User', 63),
(10, 'App\\Models\\User', 64),
(10, 'App\\Models\\User', 65),
(11, 'App\\Models\\User', 1),
(11, 'App\\Models\\User', 2),
(11, 'App\\Models\\User', 3),
(11, 'App\\Models\\User', 4),
(11, 'App\\Models\\User', 5),
(11, 'App\\Models\\User', 6),
(11, 'App\\Models\\User', 7),
(11, 'App\\Models\\User', 8),
(11, 'App\\Models\\User', 9),
(11, 'App\\Models\\User', 10),
(11, 'App\\Models\\User', 11),
(11, 'App\\Models\\User', 12),
(11, 'App\\Models\\User', 13),
(11, 'App\\Models\\User', 14),
(11, 'App\\Models\\User', 15),
(11, 'App\\Models\\User', 16),
(11, 'App\\Models\\User', 17),
(11, 'App\\Models\\User', 18),
(11, 'App\\Models\\User', 19),
(11, 'App\\Models\\User', 20),
(11, 'App\\Models\\User', 21),
(11, 'App\\Models\\User', 22),
(11, 'App\\Models\\User', 23),
(11, 'App\\Models\\User', 24),
(11, 'App\\Models\\User', 25),
(11, 'App\\Models\\User', 26),
(11, 'App\\Models\\User', 27),
(11, 'App\\Models\\User', 28),
(11, 'App\\Models\\User', 29),
(11, 'App\\Models\\User', 30),
(11, 'App\\Models\\User', 31),
(11, 'App\\Models\\User', 32),
(11, 'App\\Models\\User', 33),
(11, 'App\\Models\\User', 34),
(11, 'App\\Models\\User', 35),
(11, 'App\\Models\\User', 36),
(11, 'App\\Models\\User', 37),
(11, 'App\\Models\\User', 38),
(11, 'App\\Models\\User', 39),
(11, 'App\\Models\\User', 40),
(11, 'App\\Models\\User', 41),
(11, 'App\\Models\\User', 42),
(11, 'App\\Models\\User', 43),
(11, 'App\\Models\\User', 44),
(11, 'App\\Models\\User', 45),
(11, 'App\\Models\\User', 46),
(11, 'App\\Models\\User', 47),
(11, 'App\\Models\\User', 48),
(11, 'App\\Models\\User', 49),
(11, 'App\\Models\\User', 50),
(11, 'App\\Models\\User', 51),
(11, 'App\\Models\\User', 52),
(11, 'App\\Models\\User', 53),
(11, 'App\\Models\\User', 54),
(11, 'App\\Models\\User', 55),
(11, 'App\\Models\\User', 56),
(11, 'App\\Models\\User', 57),
(11, 'App\\Models\\User', 58),
(11, 'App\\Models\\User', 59),
(11, 'App\\Models\\User', 60),
(11, 'App\\Models\\User', 61),
(11, 'App\\Models\\User', 62),
(11, 'App\\Models\\User', 63),
(11, 'App\\Models\\User', 64),
(11, 'App\\Models\\User', 65),
(12, 'App\\Models\\User', 1),
(12, 'App\\Models\\User', 2),
(12, 'App\\Models\\User', 3),
(12, 'App\\Models\\User', 4),
(12, 'App\\Models\\User', 5),
(12, 'App\\Models\\User', 6),
(12, 'App\\Models\\User', 7),
(12, 'App\\Models\\User', 8),
(12, 'App\\Models\\User', 9),
(12, 'App\\Models\\User', 10),
(12, 'App\\Models\\User', 11),
(12, 'App\\Models\\User', 12),
(12, 'App\\Models\\User', 13),
(12, 'App\\Models\\User', 14),
(12, 'App\\Models\\User', 15),
(12, 'App\\Models\\User', 16),
(12, 'App\\Models\\User', 17),
(12, 'App\\Models\\User', 18),
(12, 'App\\Models\\User', 19),
(12, 'App\\Models\\User', 20),
(12, 'App\\Models\\User', 21),
(12, 'App\\Models\\User', 22),
(12, 'App\\Models\\User', 23),
(12, 'App\\Models\\User', 24),
(12, 'App\\Models\\User', 25),
(12, 'App\\Models\\User', 26),
(12, 'App\\Models\\User', 27),
(12, 'App\\Models\\User', 28),
(12, 'App\\Models\\User', 29),
(12, 'App\\Models\\User', 30),
(12, 'App\\Models\\User', 31),
(12, 'App\\Models\\User', 32),
(12, 'App\\Models\\User', 33),
(12, 'App\\Models\\User', 34),
(12, 'App\\Models\\User', 35),
(12, 'App\\Models\\User', 36),
(12, 'App\\Models\\User', 37),
(12, 'App\\Models\\User', 38),
(12, 'App\\Models\\User', 39),
(12, 'App\\Models\\User', 40),
(12, 'App\\Models\\User', 41),
(12, 'App\\Models\\User', 42),
(12, 'App\\Models\\User', 43),
(12, 'App\\Models\\User', 44),
(12, 'App\\Models\\User', 45),
(12, 'App\\Models\\User', 46),
(12, 'App\\Models\\User', 47),
(12, 'App\\Models\\User', 48),
(12, 'App\\Models\\User', 49),
(12, 'App\\Models\\User', 50),
(12, 'App\\Models\\User', 51),
(12, 'App\\Models\\User', 52),
(12, 'App\\Models\\User', 53),
(12, 'App\\Models\\User', 54),
(12, 'App\\Models\\User', 55),
(12, 'App\\Models\\User', 56),
(12, 'App\\Models\\User', 57),
(12, 'App\\Models\\User', 58),
(12, 'App\\Models\\User', 59),
(12, 'App\\Models\\User', 60),
(12, 'App\\Models\\User', 61),
(12, 'App\\Models\\User', 62),
(12, 'App\\Models\\User', 63),
(12, 'App\\Models\\User', 64),
(12, 'App\\Models\\User', 65);

-- --------------------------------------------------------

--
-- Структура таблицы `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 5),
(2, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 5),
(3, 'App\\Models\\User', 64),
(3, 'App\\Models\\User', 65),
(4, 'App\\Models\\User', 2),
(5, 'App\\Models\\User', 12),
(5, 'App\\Models\\User', 13),
(5, 'App\\Models\\User', 14),
(5, 'App\\Models\\User', 15),
(5, 'App\\Models\\User', 16),
(5, 'App\\Models\\User', 17),
(6, 'App\\Models\\User', 22),
(6, 'App\\Models\\User', 23),
(6, 'App\\Models\\User', 63),
(7, 'App\\Models\\User', 57),
(7, 'App\\Models\\User', 58),
(8, 'App\\Models\\User', 10),
(8, 'App\\Models\\User', 28),
(8, 'App\\Models\\User', 29),
(8, 'App\\Models\\User', 30),
(8, 'App\\Models\\User', 31),
(8, 'App\\Models\\User', 32),
(8, 'App\\Models\\User', 33),
(8, 'App\\Models\\User', 34),
(8, 'App\\Models\\User', 35),
(8, 'App\\Models\\User', 36),
(8, 'App\\Models\\User', 37),
(8, 'App\\Models\\User', 38),
(8, 'App\\Models\\User', 39),
(8, 'App\\Models\\User', 40),
(8, 'App\\Models\\User', 41),
(8, 'App\\Models\\User', 42),
(8, 'App\\Models\\User', 43),
(9, 'App\\Models\\User', 7),
(9, 'App\\Models\\User', 44),
(9, 'App\\Models\\User', 45),
(9, 'App\\Models\\User', 46),
(9, 'App\\Models\\User', 47),
(9, 'App\\Models\\User', 48),
(9, 'App\\Models\\User', 49),
(9, 'App\\Models\\User', 50),
(9, 'App\\Models\\User', 51),
(10, 'App\\Models\\User', 62),
(11, 'App\\Models\\User', 8),
(11, 'App\\Models\\User', 52),
(11, 'App\\Models\\User', 53),
(13, 'App\\Models\\User', 9),
(14, 'App\\Models\\User', 60),
(14, 'App\\Models\\User', 61),
(15, 'App\\Models\\User', 59),
(16, 'App\\Models\\User', 24),
(16, 'App\\Models\\User', 25),
(16, 'App\\Models\\User', 26),
(16, 'App\\Models\\User', 27),
(17, 'App\\Models\\User', 6),
(17, 'App\\Models\\User', 18),
(17, 'App\\Models\\User', 19),
(17, 'App\\Models\\User', 20),
(17, 'App\\Models\\User', 21),
(18, 'App\\Models\\User', 54),
(18, 'App\\Models\\User', 55),
(18, 'App\\Models\\User', 56),
(19, 'App\\Models\\User', 11),
(20, 'App\\Models\\User', 13),
(20, 'App\\Models\\User', 22);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `finished_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `completed_time` int(11) DEFAULT NULL,
  `checked_status` int(11) NOT NULL DEFAULT 0,
  `checked_comment` text DEFAULT NULL,
  `checked_time` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `finished_user_id`, `task_id`, `completed_time`, `checked_status`, `checked_comment`, `checked_time`, `deleted_at`, `created_at`, `updated_at`) VALUES
(3, 33, 8, 4, NULL, 2, 'нет коментарий', '2024-11-11 21:34:55', NULL, '2024-11-04 09:54:16', '2024-11-12 15:45:44'),
(4, 33, 19, 6, NULL, 2, 'рассмотреть данное письмо', '2024-11-09 16:20:29', NULL, '2024-11-05 05:41:14', '2024-11-13 10:51:44'),
(5, 33, NULL, 6, NULL, 0, NULL, NULL, NULL, '2024-11-05 05:41:24', '2024-11-05 05:41:24'),
(6, 20, 19, 3, NULL, 1, NULL, '2024-11-13 23:06:02', NULL, '2024-11-06 10:37:58', '2024-11-13 18:06:02'),
(7, 20, 20, 7, NULL, 2, 'Где ваш ответ почему пусто !!!!?', '2024-11-09 16:23:07', NULL, '2024-11-06 10:38:44', '2024-11-09 11:23:07'),
(8, 44, 7, 5, NULL, 1, NULL, '2024-11-11 19:05:04', NULL, '2024-11-08 05:40:58', '2024-11-11 14:05:04'),
(9, 22, 22, 16, NULL, 1, NULL, '2024-11-08 17:57:26', NULL, '2024-11-08 05:45:02', '2024-11-08 12:57:26'),
(10, 33, 33, 12, NULL, 1, NULL, '2024-11-09 18:03:12', NULL, '2024-11-08 07:12:07', '2024-11-09 13:03:12'),
(11, 22, 22, 15, NULL, 1, NULL, '2024-11-09 16:26:38', NULL, '2024-11-09 11:24:56', '2024-11-09 11:26:38'),
(12, 22, 22, 14, NULL, 1, NULL, '2024-11-09 16:26:55', NULL, '2024-11-09 11:24:59', '2024-11-09 11:26:55'),
(13, 22, 22, 13, NULL, 1, NULL, '2024-11-09 16:27:03', NULL, '2024-11-09 11:25:02', '2024-11-09 11:27:03'),
(14, 22, 22, 10, NULL, 1, NULL, '2024-11-09 22:17:58', NULL, '2024-11-09 11:25:04', '2024-11-09 17:17:58'),
(15, 22, 22, 9, NULL, 1, NULL, '2024-11-09 22:18:32', NULL, '2024-11-09 11:25:07', '2024-11-09 17:18:32'),
(16, 61, 61, 24, NULL, 1, NULL, '2024-11-09 20:38:25', NULL, '2024-11-09 13:08:55', '2024-11-09 15:38:25'),
(17, 61, NULL, 20, NULL, 0, NULL, NULL, NULL, '2024-11-09 13:10:22', '2024-11-09 13:10:22'),
(18, 33, 33, 17, NULL, 1, NULL, '2024-11-11 15:29:26', NULL, '2024-11-11 09:21:20', '2024-11-11 10:29:26'),
(19, 33, 29, 22, NULL, 0, NULL, NULL, NULL, '2024-11-11 09:21:39', '2024-11-14 11:39:25'),
(20, 33, 29, 11, NULL, 0, NULL, NULL, NULL, '2024-11-11 09:21:49', '2024-11-14 11:36:07'),
(21, 33, 33, 8, NULL, 1, NULL, '2024-11-11 15:30:18', NULL, '2024-11-11 09:21:57', '2024-11-11 10:30:18'),
(22, 26, 26, 23, NULL, 0, NULL, NULL, NULL, '2024-11-11 09:40:43', '2024-11-13 09:19:11'),
(23, 7, 7, 26, NULL, 0, NULL, NULL, NULL, '2024-11-11 11:06:12', '2024-11-11 11:20:39'),
(24, 8, NULL, 4, NULL, 0, NULL, NULL, NULL, '2024-11-11 11:20:54', '2024-11-11 11:20:54'),
(25, 33, 33, 29, NULL, 1, NULL, '2024-11-11 17:59:19', NULL, '2024-11-11 12:51:24', '2024-11-11 12:59:19'),
(26, 61, 61, 36, NULL, 0, NULL, NULL, NULL, '2024-11-12 06:34:37', '2024-11-15 05:09:16'),
(27, 61, 61, 37, NULL, 0, NULL, NULL, NULL, '2024-11-12 06:35:02', '2024-11-15 05:10:15'),
(28, 22, 22, 32, NULL, 1, NULL, '2024-11-12 17:37:17', NULL, '2024-11-12 06:52:31', '2024-11-12 12:37:17'),
(29, 22, 22, 38, NULL, 1, NULL, '2024-11-12 14:25:23', NULL, '2024-11-12 06:53:42', '2024-11-12 09:25:23'),
(30, 22, 22, 39, NULL, 1, NULL, '2024-11-12 14:24:58', NULL, '2024-11-12 06:55:03', '2024-11-12 09:24:58'),
(31, 9, 9, 35, NULL, 1, NULL, '2024-11-12 17:37:04', NULL, '2024-11-12 07:07:36', '2024-11-12 12:37:04'),
(32, 29, 29, 28, NULL, 0, NULL, NULL, NULL, '2024-11-12 15:22:59', '2024-11-12 15:24:30'),
(33, 29, 29, 27, NULL, 0, NULL, NULL, NULL, '2024-11-12 15:24:51', '2024-11-12 15:27:58'),
(34, 8, NULL, 4, NULL, 0, NULL, NULL, NULL, '2024-11-12 15:41:01', '2024-11-12 15:41:01'),
(35, 33, 33, 30, NULL, 0, NULL, NULL, NULL, '2024-11-13 04:38:02', '2024-11-13 04:39:07'),
(36, 33, 29, 40, NULL, 0, NULL, NULL, NULL, '2024-11-13 09:06:52', '2024-11-14 11:43:09'),
(37, 19, 19, 43, NULL, 1, NULL, '2024-11-13 16:24:02', NULL, '2024-11-13 10:38:01', '2024-11-13 11:24:02'),
(38, 19, NULL, 6, NULL, 0, NULL, NULL, NULL, '2024-11-13 10:51:27', '2024-11-13 10:51:27'),
(39, 19, NULL, 3, NULL, 0, NULL, NULL, NULL, '2024-11-13 10:52:37', '2024-11-13 10:52:37'),
(40, 19, 19, 18, NULL, 0, NULL, NULL, NULL, '2024-11-13 10:54:45', '2024-11-13 10:55:03'),
(41, 19, 19, 19, NULL, 0, NULL, NULL, NULL, '2024-11-13 10:56:45', '2024-11-13 10:57:25'),
(42, 19, 19, 33, NULL, 0, NULL, NULL, NULL, '2024-11-13 11:02:25', '2024-11-13 11:03:05'),
(43, 19, 19, 34, NULL, 0, NULL, NULL, NULL, '2024-11-13 11:04:14', '2024-11-13 11:11:48'),
(44, 20, 20, 45, NULL, 0, NULL, NULL, NULL, '2024-11-14 07:57:27', '2024-11-14 07:59:13'),
(45, 20, 20, 46, NULL, 0, NULL, NULL, NULL, '2024-11-14 07:59:45', '2024-11-14 08:01:13'),
(46, 20, NULL, 7, NULL, 0, NULL, NULL, NULL, '2024-11-14 08:00:43', '2024-11-14 08:00:43'),
(47, 29, 29, 31, NULL, 0, NULL, NULL, NULL, '2024-11-14 11:39:44', '2024-11-14 11:41:19'),
(48, 29, 29, 47, NULL, 0, NULL, NULL, NULL, '2024-11-14 11:43:27', '2024-11-14 11:44:22'),
(49, 13, NULL, 44, NULL, 0, NULL, NULL, NULL, '2024-11-14 13:22:18', '2024-11-14 13:22:18'),
(50, 13, NULL, 42, NULL, 0, NULL, NULL, NULL, '2024-11-14 13:44:04', '2024-11-14 13:44:04'),
(51, 22, 22, 51, NULL, 0, NULL, NULL, NULL, '2024-11-18 12:28:19', '2024-11-18 12:28:46'),
(52, 13, NULL, 52, NULL, 0, NULL, NULL, NULL, '2024-11-18 16:56:22', '2024-11-18 16:56:22'),
(53, 33, 33, 49, NULL, 1, NULL, '2024-11-26 10:18:20', NULL, '2024-11-19 06:12:25', '2024-11-26 05:18:20'),
(54, 33, 33, 48, NULL, 0, NULL, NULL, NULL, '2024-11-19 06:14:24', '2024-11-19 06:15:00'),
(55, 29, 29, 57, NULL, 0, NULL, NULL, NULL, '2024-11-28 05:37:52', '2024-11-28 05:38:12'),
(56, 29, 29, 65, NULL, 0, NULL, NULL, NULL, '2024-12-05 06:25:05', '2024-12-05 06:26:42'),
(57, 22, 22, 66, NULL, 0, NULL, NULL, NULL, '2024-12-10 05:25:23', '2024-12-10 05:25:40'),
(58, 29, 29, 67, NULL, 0, NULL, NULL, NULL, '2024-12-17 06:45:09', '2024-12-17 06:45:27'),
(59, 29, 29, 68, NULL, 0, NULL, NULL, NULL, '2024-12-17 06:45:49', '2024-12-17 06:45:59'),
(60, 29, 29, 69, NULL, 0, NULL, NULL, NULL, '2024-12-17 06:47:02', '2024-12-17 06:47:21');

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `title`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'permission.show', NULL, 'web', '2024-10-16 10:43:26', '2024-10-16 10:43:26'),
(2, 'permission.edit', NULL, 'web', '2024-10-16 10:43:26', '2024-10-16 10:43:26'),
(3, 'permission.add', NULL, 'web', '2024-10-16 10:43:26', '2024-10-16 10:43:26'),
(4, 'permission.delete', NULL, 'web', '2024-10-16 10:43:26', '2024-10-16 10:43:26'),
(5, 'roles.show', NULL, 'web', '2024-10-16 10:43:26', '2024-10-16 10:43:26'),
(6, 'roles.edit', NULL, 'web', '2024-10-16 10:43:26', '2024-10-16 10:43:26'),
(7, 'roles.add', NULL, 'web', '2024-10-16 10:43:26', '2024-10-16 10:43:26'),
(8, 'roles.delete', NULL, 'web', '2024-10-16 10:43:26', '2024-10-16 10:43:26'),
(9, 'user.show', NULL, 'web', '2024-10-16 10:43:26', '2024-10-16 10:43:26'),
(10, 'user.edit', NULL, 'web', '2024-10-16 10:43:26', '2024-10-16 10:43:26'),
(11, 'user.add', NULL, 'web', '2024-10-16 10:43:26', '2024-10-16 10:43:26'),
(12, 'monitoring.show', NULL, 'web', '2024-10-16 10:43:26', '2024-10-16 10:43:26'),
(13, 'qarorlar.show', 'qarorlar uchun', 'web', '2024-11-20 03:55:57', '2024-11-20 03:55:57');

-- --------------------------------------------------------

--
-- Структура таблицы `qarorlars`
--

CREATE TABLE `qarorlars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unique_code` varchar(255) NOT NULL,
  `sana` date NOT NULL,
  `short_name` varchar(255) NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `amount` decimal(30,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `qarorlars`
--

INSERT INTO `qarorlars` (`id`, `user_id`, `category_id`, `unique_code`, `sana`, `short_name`, `comment`, `created_at`, `updated_at`, `amount`) VALUES
(2, 5, NULL, '234-14-0-F/24', '2024-11-14', 'Корея Республика хизмат сафарига юбориш', NULL, '2024-11-20 04:59:42', '2024-11-20 04:59:42', NULL),
(3, 5, NULL, '415-14-0-Q/24', '2024-07-01', '8 300 млн Автомобил йолларини ривжлантириш', NULL, '2024-11-20 05:01:08', '2024-11-20 06:01:28', NULL),
(4, 5, NULL, '446-14-0-Q/24', '2024-07-11', '1 368 млн маблағ ажратиш', NULL, '2024-11-20 05:03:18', '2024-11-20 05:07:23', NULL),
(5, 5, NULL, '450-14-0-Q/24', '2024-07-15', '24 000 млн Кўп квартирали уйларни тамирлаш бўйича инжиниринг компанияси', NULL, '2024-11-20 05:06:58', '2024-11-20 05:06:58', NULL),
(6, 5, NULL, '468-14-0-Q/24', '2024-07-22', '7 112 385 млн Халкаро фестивал дирексияси', NULL, '2024-11-20 05:11:27', '2024-11-20 05:11:27', NULL),
(7, 5, NULL, '476-14-0-Q/24', '2024-11-25', '4 000 млн Кўп квартирали уйларни тамирлаш бўйича инжиниринг компанияси', NULL, '2024-11-20 05:14:16', '2024-11-20 05:14:16', NULL),
(8, 5, NULL, '481-14-0-Q/24', '2024-07-25', '9 108,5 млн Ягона буюртмачи хизмати инжиниринг компанияси', NULL, '2024-11-20 05:22:25', '2024-11-20 05:22:25', NULL),
(9, 5, NULL, '482-14-0-Q/24', '2024-07-25', '10 000 млрд Кўп квартирали уйларни тамирлаш бўйича инжиниринг компанияси', NULL, '2024-11-20 05:24:38', '2024-11-20 05:24:38', NULL),
(10, 5, NULL, '513-14-0-Q/24', '2024-07-31', '5 712 174,6 млн Маданият + Туризм', NULL, '2024-11-20 05:26:28', '2024-11-20 05:26:28', NULL),
(11, 5, NULL, '526-14-0-Q/24', '2024-08-05', '25 312,5 млн Харбий мамурий сектор', NULL, '2024-11-20 05:45:53', '2024-11-20 05:47:51', NULL),
(12, 5, NULL, '532-14-0-Q/24', '2024-08-09', '29 500 млн Кўп квартирали уйларни тамирлаш бўйича инжиниринг компанияси', NULL, '2024-11-20 05:47:19', '2024-11-20 05:47:19', NULL),
(13, 5, NULL, '533-14-0-Q/24', '2024-08-09', '27 888,4 М39В Халка йўли', NULL, '2024-11-20 05:52:06', '2024-11-20 05:52:06', NULL),
(14, 5, NULL, '554-14-0-F/24', '2024-08-14', '6 093,8 млн Ягона буюртмачи хизмати инжиниринг', NULL, '2024-11-20 05:54:47', '2024-11-20 05:54:47', NULL),
(15, 5, NULL, '582-14-0-F/24', '2024-08-22', '28 677 млн Кўп квартирали уйларни тамирлаш бўйича инжиниринг компанияси', NULL, '2024-11-20 05:56:15', '2024-11-20 05:56:15', NULL),
(16, 5, NULL, '596-14-0-Q/24', '2024-08-26', '1 046 394 594 сўм Туман Хокимларига', NULL, '2024-11-20 06:00:02', '2024-11-20 06:00:02', NULL),
(17, 5, NULL, '614-14-0-Q/24', '2024-09-06', '6 000 млн Ягона буюртмачи хизмати инжиниринг компанияси', NULL, '2024-11-20 06:04:13', '2024-11-20 06:04:13', NULL),
(18, 5, NULL, '739-14-0-Q/24', '2024-10-17', 'Ижтимоий соҳа ва бошқа объектларда қурилиш-таъмирлаш ишлари учун', NULL, '2024-11-20 06:10:08', '2024-11-21 06:18:57', 7000000000.00),
(19, 5, NULL, '833-14-0-Q/24', '2024-11-15', 'Йўлларни махаллалар худудидан ўтган қисмини асфалт қопламаси билан қоплаш учун', NULL, '2024-11-20 06:10:58', '2024-11-21 06:17:30', 7000000000.00),
(20, 5, NULL, '834-14-0-Q/24', '2024-11-15', 'Тошкент шахри туманларининг махаллаларида қурулиш-тамирлаш, ободонлаштириш ва кўкаламзорлаштириш ишларини амалга ошириш учун', NULL, '2024-11-20 06:14:06', '2024-11-21 06:07:58', 27064000000.00),
(21, 5, NULL, '418-14-0-Q/24', '2024-07-02', '16 967,9 млн кизил худудга киритлган зоналар', NULL, '2024-11-20 06:17:14', '2024-11-20 06:17:14', NULL),
(22, 5, NULL, '511-14-0-Q/24', '2024-08-18', 'ijtimoiy-iqtisodiy rivojlantirish chora-tadbirlari to‘g‘risida” 2023- yil 26-iyuldagi PF-112-son Farmoniga muvofiq', NULL, '2024-11-20 06:39:57', '2024-11-20 06:39:57', NULL),
(23, 5, NULL, '575-14-0-Q/24', '2024-08-21', '12 000 млн Кўп квартирали уйларни тамирлаш бўйича инжиниринг компанияси', NULL, '2024-11-20 07:38:19', '2024-11-20 07:38:19', NULL),
(24, 5, NULL, '604-14-0-Q/24', '2024-08-28', 'Ижтимоий соха ва бошқа объектларда қурилиш таъмилаш ишлари учун', NULL, '2024-11-27 06:25:36', '2024-11-27 06:25:36', 1314289000.00),
(25, 5, NULL, '867-14-0-Q/24', '2024-11-26', 'Ўзбекистон боғи хамда унга туташ худудларда ичимлик ва оқава сув тизимларини қуриш', NULL, '2024-11-27 06:29:33', '2024-11-27 06:29:33', 20000000000.00),
(26, 5, NULL, '868-14-0-Q/24', '2024-11-27', 'Нукус шахрида оғир турмуш шароитидаги оилаларга тегишли уйларни том қисмини таъмирлаш ва авария холатидаги уйларни таъмирлаш', NULL, '2024-12-02 13:15:13', '2024-12-02 13:15:13', 10000000000.00),
(27, 5, NULL, '869-14-0-Q/24', '2024-11-27', 'Ижтимоий соха ва бошқа объектларда қурилиш таъмилаш ишлари учун', NULL, '2024-12-02 13:21:49', '2024-12-02 13:21:49', 7000000000.00),
(28, 5, NULL, '873-14-0-Q/24', '2024-11-27', 'Тошкент шахридаги марказий ва асосий кўчалар бўйида жойлашган кўп қаватли ва якка тартибдаги уйлар Тошкент халқаро аэропортига туташ худудлардаги турар жойларни фасад ва том қисмини таъмирлаш.', NULL, '2024-12-02 13:59:05', '2024-12-02 13:59:05', 39781100000.00),
(29, 5, NULL, '876-14-0-Q/24', '2024-11-29', 'Янги Хаёт туманидаги 128,1 гектар ер майдонларини қишлоқ хўжалигига мўлжалланган ва ўрмон фонди ерларининг ер фонди тоифаларини ўзгартириш.', NULL, '2024-12-02 14:02:24', '2024-12-02 14:02:24', 684265569.00),
(30, 5, NULL, '878-14-0-Q/24', '2024-12-02', 'Янги йил байрам тадбирларини ташкил этиш ва ўтказиш бўйича.', NULL, '2024-12-02 14:04:35', '2024-12-02 14:04:35', 3000000000.00),
(31, 5, NULL, '879-14-0-Q/24', '2024-12-02', 'Янги йил байрам тадбирларини ташкил этиш ва ўтказиш бўйича.', NULL, '2024-12-02 14:05:15', '2024-12-02 14:05:15', 3000000000.00),
(35, 5, NULL, '245-14-0-F/24', '2024-12-04', 'Россия Федерациясига хизмат сафари тўғрисида', NULL, '2024-12-04 06:23:19', '2024-12-04 06:23:19', 0.00),
(36, 5, NULL, '895-14-0-Q/24', '2024-12-04', 'Тошкент шахридаги мактабгача ва мактаб таълим муассасаларида куз-қиш мавсумини беталофат ўтказиш хамда ижтимоий соха объктлари қурилиш таъмирлаш ишларини янада жадаллаштириш.', 'Тошкент шахар хокимининг 2024 йил 5 августдаги 526-14-0-Q/24 сон қарорига ўзгартириш киритиш.', '2024-12-05 07:28:20', '2024-12-05 07:28:20', 18810700000.00),
(37, 1, NULL, 'Id modi dolore minus', '1981-06-21', 'Clarke Dillon', 'Id reprehenderit la', '2024-12-10 15:36:23', '2024-12-10 15:36:23', 4759496123535849000000000000.00),
(38, 5, NULL, '907-14-0-Q/24', '2024-12-11', 'Тошкент шахри туманларининг маҳаллаларида қурилиш-таъмирлаш, ободонлаштириш кўкаламзорлаштириш ишларини амалга ошириш учун.', NULL, '2024-12-11 12:31:22', '2024-12-11 12:31:22', 109287000000.00);

-- --------------------------------------------------------

--
-- Структура таблицы `qaror_files`
--

CREATE TABLE `qaror_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `qaror_id` bigint(20) UNSIGNED NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `qaror_files`
--

INSERT INTO `qaror_files` (`id`, `qaror_id`, `file_path`, `created_at`, `updated_at`) VALUES
(2, 2, 'qarorlar/w31Pl5KkZIjUDlDPzeGey8qY1sEPDbvmODtlFFvN.pdf', '2024-11-20 04:59:42', '2024-11-20 04:59:42'),
(3, 3, 'qarorlar/ZHi9DUaW5IoYtTFkztZmxkuxxhAbZsq0nuDj3KDY.pdf', '2024-11-20 05:01:08', '2024-11-20 05:01:08'),
(4, 4, 'qarorlar/FWuQabOQL5bzcs0nHgk7g5NH6nxk6ie2lxCaXk2L.pdf', '2024-11-20 05:03:18', '2024-11-20 05:03:18'),
(5, 5, 'qarorlar/IeN4EDcRgadHGXCxnjEXFOYmiX5sNx4FVaRbaRsH.pdf', '2024-11-20 05:06:58', '2024-11-20 05:06:58'),
(6, 6, 'qarorlar/mc8G6emmIoGEvpvbXcPaUrJNBc5JtD4Ka3wDWQYO.pdf', '2024-11-20 05:11:27', '2024-11-20 05:11:27'),
(7, 7, 'qarorlar/476.pdf', '2024-11-20 05:14:16', '2024-11-20 05:14:16'),
(8, 8, 'qarorlar/481.pdf', '2024-11-20 05:22:25', '2024-11-20 05:22:25'),
(9, 9, 'qarorlar/482.pdf', '2024-11-20 05:24:38', '2024-11-20 05:24:38'),
(10, 10, 'qarorlar/513.pdf', '2024-11-20 05:26:28', '2024-11-20 05:26:28'),
(11, 11, 'qarorlar/526.pdf', '2024-11-20 05:45:53', '2024-11-20 05:45:53'),
(12, 12, 'qarorlar/532.pdf', '2024-11-20 05:47:19', '2024-11-20 05:47:19'),
(13, 13, 'qarorlar/533.pdf', '2024-11-20 05:52:06', '2024-11-20 05:52:06'),
(14, 14, 'qarorlar/554.pdf', '2024-11-20 05:54:47', '2024-11-20 05:54:47'),
(15, 15, 'qarorlar/582.pdf', '2024-11-20 05:56:15', '2024-11-20 05:56:15'),
(16, 16, 'qarorlar/596.pdf', '2024-11-20 06:00:02', '2024-11-20 06:00:02'),
(17, 17, 'qarorlar/614.pdf', '2024-11-20 06:04:13', '2024-11-20 06:04:13'),
(18, 18, 'qarorlar/739.pdf', '2024-11-20 06:10:08', '2024-11-20 06:10:08'),
(19, 19, 'qarorlar/833.pdf', '2024-11-20 06:10:58', '2024-11-20 06:10:58'),
(20, 20, 'qarorlar/834.pdf', '2024-11-20 06:14:07', '2024-11-20 06:14:07'),
(21, 21, 'qarorlar/418.pdf', '2024-11-20 06:17:14', '2024-11-20 06:17:14'),
(22, 23, 'qarorlar/575.pdf', '2024-11-20 07:38:19', '2024-11-20 07:38:19'),
(23, 24, 'qarorlar/маблағ ажратиш 604 14.pdf', '2024-11-27 06:25:36', '2024-11-27 06:25:36'),
(24, 25, 'qarorlar/маблағ ажратиш 867 14 .pdf', '2024-11-27 06:29:33', '2024-11-27 06:29:33'),
(25, 26, 'qarorlar/вхд 44 868-14-0 маблағ ажратиш.pdf', '2024-12-02 13:15:13', '2024-12-02 13:15:13'),
(26, 27, 'qarorlar/вхд 43 869-14-0 маблағ ажратиш.pdf', '2024-12-02 13:21:49', '2024-12-02 13:21:49'),
(27, 28, 'qarorlar/вхд 45 873-14-0 маблағ ажратиш.pdf', '2024-12-02 13:59:05', '2024-12-02 13:59:05'),
(28, 29, 'qarorlar/Вх 46 876-14 от 02.12.2024 сумма 684,2 млн.pdf', '2024-12-02 14:02:24', '2024-12-02 14:02:24'),
(29, 30, 'qarorlar/вхд № 47 878-14 от 02.12.2024.pdf', '2024-12-02 14:04:35', '2024-12-02 14:04:35'),
(30, 31, 'qarorlar/вхд № 48 879-14 от 02.12.2024.pdf', '2024-12-02 14:05:15', '2024-12-02 14:05:15'),
(34, 35, 'qarorlar/вхд 52 от 04.12 245-14-О.F.pdf', '2024-12-04 06:23:19', '2024-12-04 06:23:19'),
(35, 36, 'qarorlar/вхд 54 от 05.12 895-14-0-Q24.pdf', '2024-12-05 07:28:20', '2024-12-05 07:28:20'),
(36, 19, 'qarorlar/833-14-0-Q24 от 15.11.2024.pdf', '2024-12-05 10:37:33', '2024-12-05 10:37:33'),
(37, 36, 'qarorlar/895-14-0-Q-24.pdf', '2024-12-05 12:11:18', '2024-12-05 12:11:18'),
(38, 37, 'qarorlar/720__80_48fadcd42969de6dcac19c4dec99370d.jpg', '2024-12-10 15:36:23', '2024-12-10 15:36:23'),
(39, 37, 'qarorlar/kuzatuv/Кузатув кенгашининг қарори-china_state.jpg', '2024-12-10 15:36:23', '2024-12-10 15:36:23'),
(40, 38, 'qarorlar/вхн № 57 от 11.12 907-14-0-Q-24.pdf', '2024-12-11 12:31:22', '2024-12-11 12:31:22'),
(41, 38, 'qarorlar/kuzatuv/Кузатув кенгашининг қарори-907-14-0-Q-24.pdf', '2024-12-12 05:45:20', '2024-12-12 05:45:20');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', 'Super Admin', '2024-10-16 10:43:26', '2024-10-16 10:43:26'),
(2, 'Manager', 'web', 'Manager', '2024-10-16 10:43:26', '2024-10-16 10:43:26'),
(3, 'Employee', 'web', 'Employee', '2024-10-16 10:43:26', '2024-10-16 10:43:26'),
(4, 'Admin', 'web', NULL, '2024-10-16 10:43:26', '2024-10-16 10:43:26'),
(5, 'Boshqaruv ma\'muriyati', 'web', 'Администрация правления', '2024-10-16 10:43:33', '2024-10-16 10:43:33'),
(6, 'Moliya boshqarmasi', 'web', 'правление по финансам', '2024-10-16 10:43:33', '2024-10-16 10:43:33'),
(7, 'Yuridik bo\'lim', 'web', 'Юридический отдел', '2024-10-16 10:43:33', '2024-10-16 10:43:33'),
(8, 'Rivojlanish va Renovasiya', 'web', 'Девелопмент и Реновация', '2024-10-16 10:43:33', '2024-10-26 11:03:38'),
(9, 'Loyihalarni boshqarish', 'web', 'Управление проектами', '2024-10-16 10:43:33', '2024-10-16 10:43:33'),
(10, 'Aktivlarni boshqarish bo\'limi', 'web', 'Департамент по управлению активами', '2024-10-16 10:43:33', '2024-10-16 10:43:33'),
(11, 'Investitsiya boshqarmasi', 'web', 'правление по инвестициям', '2024-10-16 10:43:33', '2024-10-16 10:43:33'),
(12, 'Davlat organlari bilan aloqa bo\'limi', 'web', 'Отдел по связи с государственными органами', '2024-10-16 10:43:33', '2024-10-16 10:43:33'),
(13, 'Strategik rivojlanish', 'web', 'Стратегическое развитие', '2024-10-16 10:43:33', '2024-10-16 10:43:33'),
(14, 'Korporativ aloqalar bo\'limi', 'web', 'Отдел корпоративных отношений', '2024-10-16 10:43:33', '2024-10-16 10:43:33'),
(15, 'Kadrlar bo\'limi (HR)', 'web', 'HR', '2024-10-16 10:43:33', '2024-10-16 10:43:33'),
(16, 'Yo\'l va uy-joy kommunal qurilishi bo\'limi', 'web', 'департамент дорожного и жилищно-коммунального строительного', '2024-10-16 10:43:33', '2024-10-16 10:43:33'),
(17, 'Raqamli transformatsiya va axborot texnologiyalari', 'web', 'Цифровая Трансформация и информационная технология', '2024-10-16 10:43:33', '2024-10-16 10:43:33'),
(18, 'Metodologiya va qonunchilik bo\'limi', 'web', 'Департамент методалогии и нормотворчество', '2024-10-16 10:43:33', '2024-10-16 10:43:33'),
(19, 'Kuzatuv kengashi', 'web', 'Наблюдательный совет', '2024-10-26 10:00:39', '2024-10-26 10:00:39'),
(20, 'Qarorlar', 'web', NULL, '2024-11-20 03:57:46', '2024-11-20 03:57:46');

-- --------------------------------------------------------

--
-- Структура таблицы `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 19),
(13, 20);

-- --------------------------------------------------------

--
-- Структура таблицы `role_task`
--

CREATE TABLE `role_task` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `role_task`
--

INSERT INTO `role_task` (`id`, `task_id`, `role_id`, `created_at`, `updated_at`) VALUES
(3, 3, 17, '2024-11-04 09:14:42', '2024-11-04 09:14:42'),
(5, 5, 9, '2024-11-05 04:35:14', '2024-11-05 04:35:14'),
(9, 6, 17, '2024-11-05 07:14:00', '2024-11-05 07:14:00'),
(10, 8, 8, '2024-11-07 14:03:22', '2024-11-07 14:03:22'),
(11, 9, 6, '2024-11-07 14:22:33', '2024-11-07 14:22:33'),
(12, 10, 6, '2024-11-07 14:29:05', '2024-11-07 14:29:05'),
(13, 11, 8, '2024-11-07 14:31:41', '2024-11-07 14:31:41'),
(14, 12, 8, '2024-11-07 14:53:53', '2024-11-07 14:53:53'),
(15, 13, 6, '2024-11-07 14:59:10', '2024-11-07 14:59:10'),
(16, 14, 6, '2024-11-07 15:10:51', '2024-11-07 15:10:51'),
(17, 15, 6, '2024-11-08 05:23:51', '2024-11-08 05:23:51'),
(19, 18, 17, '2024-11-08 11:41:13', '2024-11-08 11:41:13'),
(20, 19, 17, '2024-11-08 11:42:49', '2024-11-08 11:42:49'),
(24, 21, 15, '2024-11-09 12:50:56', '2024-11-09 12:50:56'),
(25, 23, 16, '2024-11-09 15:27:09', '2024-11-09 15:27:09'),
(26, 22, 8, '2024-11-09 15:27:36', '2024-11-09 15:27:36'),
(30, 17, 8, '2024-11-11 04:59:00', '2024-11-11 04:59:00'),
(32, 27, 8, '2024-11-11 09:34:26', '2024-11-11 09:34:26'),
(33, 28, 8, '2024-11-11 09:34:44', '2024-11-11 09:34:44'),
(34, 4, 11, '2024-11-11 11:16:51', '2024-11-11 11:16:51'),
(35, 29, 8, '2024-11-11 12:36:06', '2024-11-11 12:36:06'),
(36, 30, 8, '2024-11-11 16:39:43', '2024-11-11 16:39:43'),
(38, 32, 6, '2024-11-11 17:22:09', '2024-11-11 17:22:09'),
(39, 33, 17, '2024-11-11 17:25:49', '2024-11-11 17:25:49'),
(40, 34, 17, '2024-11-12 05:41:08', '2024-11-12 05:41:08'),
(41, 35, 13, '2024-11-12 06:06:02', '2024-11-12 06:06:02'),
(42, 35, 17, '2024-11-12 06:06:02', '2024-11-12 06:06:02'),
(43, 38, 6, '2024-11-12 06:21:26', '2024-11-12 06:21:26'),
(44, 39, 6, '2024-11-12 06:22:46', '2024-11-12 06:22:46'),
(47, 40, 8, '2024-11-12 06:29:08', '2024-11-12 06:29:08'),
(48, 41, 9, '2024-11-12 16:18:45', '2024-11-12 16:18:45'),
(51, 43, 17, '2024-11-13 10:15:24', '2024-11-13 10:15:24'),
(52, 7, 17, '2024-11-13 18:05:27', '2024-11-13 18:05:27'),
(53, 45, 17, '2024-11-14 06:54:26', '2024-11-14 06:54:26'),
(54, 46, 17, '2024-11-14 07:54:32', '2024-11-14 07:54:32'),
(55, 47, 8, '2024-11-14 11:29:48', '2024-11-14 11:29:48'),
(56, 48, 8, '2024-11-18 04:35:11', '2024-11-18 04:35:11'),
(57, 49, 8, '2024-11-18 04:39:45', '2024-11-18 04:39:45'),
(58, 50, 15, '2024-11-18 05:05:23', '2024-11-18 05:05:23'),
(59, 51, 6, '2024-11-18 06:17:17', '2024-11-18 06:17:17'),
(60, 57, 8, '2024-11-26 05:17:05', '2024-11-26 05:17:05'),
(62, 65, 8, '2024-12-04 12:12:33', '2024-12-04 12:12:33'),
(63, 67, 8, '2024-12-05 11:07:33', '2024-12-05 11:07:33'),
(64, 68, 8, '2024-12-05 11:11:54', '2024-12-05 11:11:54'),
(65, 69, 8, '2024-12-05 15:28:29', '2024-12-05 15:28:29');

-- --------------------------------------------------------

--
-- Структура таблицы `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `poruchenie` varchar(255) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `planned_completion_date` date DEFAULT NULL,
  `short_title` varchar(255) DEFAULT NULL,
  `attached_file` varchar(255) DEFAULT NULL,
  `attached_file_employee` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `assign_type` varchar(255) DEFAULT NULL,
  `reject_comment` text DEFAULT NULL,
  `reject_time` datetime DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tasks`
--

INSERT INTO `tasks` (`id`, `user_id`, `category_id`, `status_id`, `deleted_at`, `created_at`, `updated_at`, `poruchenie`, `issue_date`, `planned_completion_date`, `short_title`, `attached_file`, `attached_file_employee`, `note`, `assign_type`, `reject_comment`, `reject_time`, `role_id`) VALUES
(3, 1, 2, 4, NULL, '2024-11-04 09:14:42', '2024-11-13 10:53:06', NULL, '2024-11-04', '2024-11-05', 'Вх № 89', NULL, NULL, 'Добрый день!\r\nИмеем честь сообщить, что в период с 18 по 20 ноября 2024 г. состоится бизнес-миссия предприятий Новосибирской области в Республику Узбекистан, г. Ташкент, с целью презентации своей продукции и проведения переговоров о сотрудничестве с потенциальными партнерами. Организатором мероприятия является Центр поддержки экспорта Новосибирской области, при поддержке регионального Правительства.\r\nНаправяем обращение и предложение новосибирского производителя ООО \"Дизфор\".\r\n \r\nНадеемся на Вашу встречную заинтересованность в развитии сотрудничества!\r\n \r\nПриложение к писььму:\r\nПисьмо исх.№89 от 30.10.2024\r\nКП\r\nКаталог продукции', 'role', 'принято к сведенью и назначено встреча на 19.11', '2024-11-13 15:53:06', NULL),
(4, 5, 2, 4, NULL, '2024-11-04 09:21:54', '2024-11-12 15:45:44', NULL, '2024-11-04', '2024-11-12', 'Вх эл письмо 01.11.2024 Бехзод Ибрагимов', NULL, NULL, 'реконструкция подземного перехода на Юнусабаде', 'role', 'Комментарии прилагаются.', '2024-11-12 20:45:44', NULL),
(5, 5, 2, 4, NULL, '2024-11-05 04:35:14', '2024-11-11 12:31:31', NULL, '2024-11-05', '2024-11-08', 'Вх письмо через ЭДО № 70', NULL, NULL, 'Изучить вх письмо, если есть необходимости надо ответить', 'role', 'Муниципал мулклар бўйича Ахборот технологияларини жорий этиш бўйича   ягона дастурни ишга тушириш вазифаси юклатилганлиги маълумот учун қабул қилинди.', '2024-11-11 17:31:31', NULL),
(6, 5, 2, 4, NULL, '2024-11-05 04:46:24', '2024-11-13 10:51:44', NULL, '2024-11-05', '2024-11-08', 'Вх письмо через ЭДО № 71', NULL, NULL, 'Прошу рассмотреть данное вх письмо и ответить в кротчайшее сроки', 'role', 'принято к сведенью', '2024-11-13 15:51:44', NULL),
(7, 5, 2, 3, NULL, '2024-11-05 04:48:00', '2024-11-14 08:00:43', NULL, '2024-11-05', '2024-11-08', 'Вх письмо через ЭДО № 72', NULL, NULL, 'рассмотреть данное и письмо и дать ответ', 'role', NULL, '2024-11-09 16:23:07', NULL),
(8, 5, 2, 4, NULL, '2024-11-07 14:03:22', '2024-11-11 10:24:40', NULL, '2024-11-07', '2024-11-09', 'Вх письмо № 166', NULL, NULL, 'рассмотреть данное письмо и дать', 'role', 'ответ направлен письмом № 301 от 11.11.2024.\r\nУчасток в проработке.', '2024-11-11 15:24:40', NULL),
(9, 5, 2, 4, NULL, '2024-11-07 14:22:33', '2024-11-09 11:26:17', NULL, '2024-11-07', '2024-11-10', 'Вх письмо № 170', NULL, NULL, 'рассмотреть данное письмо.', 'role', 'принял для информации', '2024-11-09 16:26:17', NULL),
(10, 5, 2, 4, NULL, '2024-11-07 14:29:05', '2024-11-09 11:26:07', NULL, '2024-11-07', '2024-11-10', 'Вх письмо № 161', NULL, NULL, 'принять для информации', 'role', 'принял для информации', '2024-11-09 16:26:07', NULL),
(11, 5, 2, 4, NULL, '2024-11-07 14:31:41', '2024-11-14 11:36:07', NULL, '2024-11-07', '2024-11-10', 'Вх письмо № 158', NULL, NULL, 'прошу рассмотреть данное письмо.', 'role', '1) Bu topshiriq qabul qilindi.\r\n2) Renovatsiya bo‘yicha hokim qarori tayyorlangann\r\n3) Investor bilan uchrashuv o‘tkazilgan.\r\n4) Hokimning imzolangan qarorini kutamiz.\r\n5) Tanlashni e’lon qilamiz.', '2024-11-14 16:36:07', NULL),
(12, 5, 2, 4, NULL, '2024-11-07 14:53:53', '2024-11-08 13:01:56', NULL, '2024-11-07', '2024-11-10', 'Вх письмо № 171', NULL, NULL, 'прошу рассмотреть письмо.', 'role', 'ответ на письмо', '2024-11-08 18:01:56', NULL),
(13, 5, 2, 4, NULL, '2024-11-07 14:59:10', '2024-11-09 11:25:56', NULL, '2024-10-23', '2024-11-10', 'Вх письмо № 157', NULL, NULL, 'принять для информации', 'role', 'принял для информации', '2024-11-09 16:25:56', NULL),
(14, 5, 2, 4, NULL, '2024-11-07 15:10:51', '2024-11-09 11:25:46', NULL, '2024-10-25', '2024-11-10', 'Вх письмо № 150', NULL, NULL, 'рассмотреть данное письмо', 'role', 'принял для информации', '2024-11-09 16:25:46', NULL),
(15, 5, 2, 4, NULL, '2024-11-08 05:23:51', '2024-11-09 11:25:29', NULL, '2024-11-08', '2024-11-10', 'Вх письмо № 151', NULL, NULL, 'рассмотреть данное письмо', 'role', 'принял для информации', '2024-11-09 16:25:29', NULL),
(16, 5, 2, 4, NULL, '2024-11-08 05:30:11', '2024-11-08 12:57:14', NULL, '2024-11-08', '2024-11-11', 'ДСП вх письмо № 17', NULL, NULL, 'Рассмотреть данное письмо в кротчайшие сроки и дать ответ!', 'custom', 'принял для информации', '2024-11-08 17:57:14', NULL),
(17, 5, 2, 4, NULL, '2024-11-08 09:27:33', '2024-11-11 10:21:55', NULL, '2024-11-08', '2024-11-11', 'Вх письмо № 172 Vida Wiring Technologies', NULL, NULL, 'Примите для информации', 'role', 'ответ направлен письмом № 300 от 11.11.2024.\r\n11.11.2024 в 14:30 прошла установочная ZOOM встреча по обсуждению проекта', '2024-11-11 15:21:55', NULL),
(18, 5, 2, 4, NULL, '2024-11-08 11:41:13', '2024-11-13 10:55:03', NULL, '2024-11-08', '2024-11-08', 'Вх письмо через ЭДО № 50', NULL, NULL, 'рассмотрите данное письмо в кротчайшие сроки!', 'role', 'принято к сведенью', '2024-11-13 15:55:03', NULL),
(19, 5, 2, 4, NULL, '2024-11-08 11:42:49', '2024-11-13 10:57:25', NULL, '2024-11-08', '2024-11-08', 'Вх письмо через ЭДО № 57', NULL, NULL, 'рассмотрите данное письмо в кротчайшие сроки', 'role', 'приглашены к участие в конкурсных процедурах', '2024-11-13 15:57:25', NULL),
(20, 5, 1, 3, NULL, '2024-11-09 12:28:24', '2024-11-09 13:10:22', NULL, '2024-11-09', '2024-11-16', 'Вызвать всех владельцев договора на АПЗ и изменить пункт 3,4,3 и остальное', NULL, NULL, 'На данное поручение у вас есть целая неделя!', 'custom', NULL, NULL, NULL),
(21, 5, 1, 1, NULL, '2024-11-09 12:31:18', '2024-11-09 12:50:56', NULL, '2024-11-09', '2024-11-11', 'Надо сделать приказ на Файзуллаев Омона  и Тен Евгении', NULL, NULL, 'Сделать в срочном порядке', 'role', NULL, NULL, NULL),
(22, 5, 1, 4, NULL, '2024-11-09 12:38:45', '2024-11-14 11:39:25', NULL, '2024-11-09', '2024-11-15', 'Открыть МЧЖ и представить данные в кратчайшие сроки', NULL, NULL, 'По поручении Бахром Аскаралиевича', 'role', '1) Ustav tayyorlandi, o‘zgartirishlar kiritildi.\r\n2) Ustavni Peregudov tekshiradi.\r\n3) Direktor haqida qaror tayyorlaymiz.\r\n4) 15.11.24 idem otkrivat firmu.', '2024-11-14 16:39:25', NULL),
(23, 5, 1, 4, NULL, '2024-11-09 12:40:11', '2024-11-13 09:19:11', NULL, '2024-11-09', '2024-11-15', 'Открыть МЧЖ и представить данные в кратчайшие сроки', NULL, NULL, 'По поручении Бахром Аскаралиевича', 'role', 'Протокол на согласовании.', '2024-11-13 14:19:11', NULL),
(24, 5, 1, 4, NULL, '2024-11-09 13:00:59', '2024-11-09 13:09:42', NULL, '2024-11-09', '2024-11-09', 'Сделать презентацию о графике и что было сделано до нынешнего момента', NULL, NULL, 'срок сегодня', 'custom', 'презинтация қиилнди', '2024-11-09 18:09:42', NULL),
(25, 5, 1, 1, NULL, '2024-11-09 17:33:08', '2024-11-11 09:53:33', NULL, '2024-11-09', '2024-11-13', 'Ответ на приказ № 437-14-0-Q/24', NULL, NULL, 'Иловадаги малумот билан танишиб ва керакли чора тадбирлар ўтказганли хақида сариқ билан белгиланган жойларида чунтуриб беришингизни сўралади!', 'custom', NULL, NULL, NULL),
(26, 5, 1, 4, NULL, '2024-11-09 17:35:04', '2024-11-11 11:21:25', NULL, '2024-11-09', '2024-11-13', 'Ответ на приказ № 530-14-0-Q 24ХД    № 489-14-0-Q 24Х    №  284-14-0-Q 24', NULL, NULL, 'Иловадаги малумот билан танишиб ва керакли чора тадбирлар ўтказганли хақида сариқ билан белгиланган жойларида чунтуриб беришингизни сўралади!', 'custom', 'Хужжатда Янги Авлод МСЗ худудидаги газь кувурларини кўчиришга Uz Transgaz AJ mas\'ul etib belgilanganligi sababli barcha chora tadbirlar ushbu korxona tomonidan bajarilmoqda.                           Маълумот учун қабул қилинди.', '2024-11-11 16:21:25', NULL),
(27, 5, 1, 4, NULL, '2024-11-09 17:36:37', '2024-11-13 09:30:15', NULL, '2024-11-09', '2024-11-12', 'Ответ на приказ №  603-14-0-Q 24', NULL, NULL, 'Иловадаги малумот билан танишиб ва керакли чора тадбирлар ўтказганли хақида сариқ билан белгиланган жойларида чунтуриб беришингизни сўралади!', 'role', 'Принял в работу. Встречусь с китайским инвестор, доложу отдельно 18.11.24', '2024-11-13 14:30:15', NULL),
(28, 5, 1, 4, NULL, '2024-11-09 17:37:28', '2024-11-12 15:24:30', NULL, '2024-11-09', '2024-11-12', 'Ответ на приказ №  715_14_0_Q_24', NULL, NULL, 'Иловадаги малумот билан танишиб ва керакли чора тадбирлар ўтказганли хақида сариқ билан белгиланган жойларида чунтуриб беришингизни сўралади!', 'role', 'выполнен', '2024-11-12 20:24:30', NULL),
(29, 5, 1, 4, NULL, '2024-11-11 12:36:06', '2024-11-11 12:52:36', NULL, '2024-11-11', '2024-11-11', 'ответное письмо на ДХХ', NULL, NULL, 'срочно внести изменения и ответить на данное письмо', 'role', 'ответ на письмо', '2024-11-11 17:52:36', NULL),
(30, 5, 1, 4, NULL, '2024-11-11 16:39:43', '2024-11-13 04:39:07', NULL, '2024-11-11', '2024-11-12', '2 новые объявления', NULL, NULL, 'до 12.11.2024 включить 2 новые объявления !', 'role', '12.11.2024 выставлены участки Токимачи МФЙ (0,25га), Лабзак МФЙ (1,46га)', '2024-11-13 09:39:07', NULL),
(31, 5, 1, 4, NULL, '2024-11-11 17:17:51', '2024-11-14 11:41:19', NULL, '2024-11-11', '2024-11-15', 'Вх письмо № 173 Янги Авлод лойиха', NULL, NULL, 'Уважаемые коллеги: Вам отправлю документы по ОПЗ . China CAMC Engineering Co., Ltd.  (CAMCE)\r\n№ 5 Engineering Division  (UZB) Tel/telegram: +998 88 1972888 \r\nE-mail: lisiyuan@camce.com.cn\r\nwww.camce.com.cn', 'custom', '1) Ishning barcha 3 bosqichi qabul qilingan.\r\n2) Dalolatnomalar va yukxatlar imzolangan.', '2024-11-14 16:41:19', NULL),
(32, 5, 1, 4, NULL, '2024-11-11 17:21:55', '2024-11-12 06:52:44', NULL, '2024-11-11', '2024-11-12', 'Вх письмо № 174 Асакабанк', NULL, NULL, NULL, 'role', 'Ma\'lumot uchun qabul qilindi', '2024-11-12 11:52:44', NULL),
(33, 5, 1, 4, NULL, '2024-11-11 17:25:49', '2024-11-13 11:03:05', NULL, '2024-11-11', '2024-11-13', 'Вх письмо № 175 IT PRO CONSULTANT', NULL, NULL, 'Просьба ознакомиться с Письмом.\r\n\r\n \r\n\r\nС уважением,\r\n\r\n \r\n\r\nДиректор\r\n\r\nДмитрий Ким\r\n\r\n«IT Pro Consultant».\r\n\r\nОфициальный представитель\r\n\r\nгруппы Компаний «I-Teco» и «Витте Консалтинг»\r\n\r\nв Узбекистане.', 'role', 'Принято к сведению. Заявитель приглашен на встречу 19.11', '2024-11-13 16:03:05', NULL),
(34, 5, 2, 4, NULL, '2024-11-12 05:41:08', '2024-11-13 11:11:48', NULL, '2024-11-12', '2024-11-15', 'Вх письмо через ЭДО № 55', NULL, NULL, 'рассмотреть данные вх письма и дать ответ', 'role', 'Принято к сведению и по возможности будет учтено при планировании размещения остановок в случае предоставления соответствующих полномочий  АО \"Ташкент Инвест Компания\"', '2024-11-13 16:11:48', NULL),
(35, 5, 2, 4, NULL, '2024-11-12 06:06:02', '2024-11-12 07:08:18', NULL, '2024-11-12', '2024-11-15', 'Вх письмо через ЭДО № 56', NULL, NULL, 'Рассмотреть данное письмо и дать ответ', 'role', 'Принято к сведению', '2024-11-12 12:08:18', NULL),
(36, 5, 1, 4, NULL, '2024-11-12 06:11:58', '2024-11-15 05:09:16', NULL, '2024-11-12', '2024-11-15', 'Вх письмо через ЭДО № 73', NULL, NULL, 'рассмотреть данное письмо и дать ответ', 'custom', 'бугунги холатига', '2024-11-15 10:09:16', NULL),
(37, 5, 1, 4, NULL, '2024-11-12 06:15:16', '2024-11-15 05:10:15', NULL, '2024-11-12', '2024-11-15', 'Вх письмо через ЭДО № 74', NULL, NULL, 'рассмотреть данное письмо и дать ответ', 'custom', 'бугунги холатига', '2024-11-15 10:10:15', NULL),
(38, 5, 1, 4, NULL, '2024-11-12 06:21:26', '2024-11-12 06:53:56', NULL, '2024-11-12', '2024-11-15', 'Вх письмо через ЭДО № 75', NULL, NULL, 'Рассмотреть данное письмо и дать ответ', 'role', 'Ma\'lumot uchun qabul qilindi.', '2024-11-12 11:53:56', NULL),
(39, 5, 1, 4, NULL, '2024-11-12 06:22:46', '2024-11-12 06:55:16', NULL, '2024-11-12', '2024-11-15', 'Вх письмо через ЭДО № 76', NULL, NULL, 'Рассмотреть данное письмо и дать ответ', 'role', 'Ma\'lumot uchun qabul qilindi.', '2024-11-12 11:55:16', NULL),
(40, 5, 1, 4, NULL, '2024-11-12 06:28:17', '2024-11-14 11:43:09', NULL, '2024-11-12', '2024-11-12', 'Вх письмо через ЭДО № 77', NULL, NULL, 'рассмотреть данное письмо и дать ответ', 'role', 'Вазифа якунланди\r\n\r\n1) Bu topshiriq qabul qilindi. 2) Renovatsiya bo‘yicha hokim qarori tayyorlangann 3) Investor bilan uchrashuv o‘tkazilgan. 4) Hokimning imzolangan qarorini kutamiz. 5) Tanlashni e’lon qilamiz.', '2024-11-14 16:43:09', NULL),
(41, 5, 1, 1, NULL, '2024-11-12 16:18:45', '2024-11-12 16:18:45', NULL, '2024-11-12', '2024-11-15', 'Вх эл письмо № 176', NULL, NULL, 'рассмотреть данное письмо и дать ответ', 'role', NULL, NULL, NULL),
(42, 5, 1, 3, NULL, '2024-11-13 09:39:50', '2024-11-14 13:44:04', NULL, '2024-11-13', '2024-11-22', 'HDFU 818-14-0-Q/24 qaror  ДСП Вх письмо №19', NULL, NULL, 'ushbu ilovani ochishingiz bilan o\'z zimmangizga quydagi HDFU hujjatni tarqatmaslikka va faqat hodimlar doirasida foydalanish uchun ishlatishingizga roziligingizni bildirasiz.  quydagi qaror boyicha 10 kun muhlat ichida malumot berishingizni so\'rayman.', 'custom', NULL, NULL, NULL),
(43, 5, 1, 4, NULL, '2024-11-13 10:11:34', '2024-11-13 10:44:12', NULL, '2024-11-13', '2024-11-13', 'Qaror 437-14-0-Q/24', NULL, NULL, 'Срочно дать ответ и заполнить таблицу какие проекты были сделаны на основе данного Карора', 'role', 'ответ', '2024-11-13 15:44:12', NULL),
(44, 5, 1, 3, NULL, '2024-11-14 06:01:56', '2024-11-14 13:22:18', NULL, '2024-11-14', '2024-11-23', 'HDFU 819-14-0-Q/24 qaror ДСП Вх письмо №19', NULL, NULL, 'ushbu ilovani ochishingiz bilan o\'z zimmangizga quydagi HDFU hujjatni tarqatmaslikka va faqat hodimlar doirasida foydalanish uchun ishlatishingizga roziligingizni bildirasiz. quydagi qaror boyicha 10 kun muhlat ichida pratakol tuzib, malumot berishingizni so\'rayman.', 'custom', NULL, NULL, NULL),
(45, 5, 1, 4, NULL, '2024-11-14 06:54:26', '2024-11-14 07:59:24', NULL, '2024-11-14', '2024-11-14', 'Вх письмо через ЭДО № 47 TAD INDUSTRIES', NULL, NULL, 'Рассмотреть данное письмо и дать ответ', 'role', 'Принято к сведению, приглашены к участию в конкурсе', '2024-11-14 12:59:24', NULL),
(46, 5, 1, 4, NULL, '2024-11-14 07:54:32', '2024-11-14 08:01:20', NULL, '2024-11-14', '2024-11-14', 'Вх письмо через ЭДО № 48 \"Beenet smart pro\"', NULL, NULL, 'рассмотреть данное письмо и дать ответ', 'role', 'Принято к сведению.', '2024-11-14 13:01:20', NULL),
(47, 5, 1, 4, NULL, '2024-11-14 11:29:48', '2024-11-14 11:44:22', NULL, '2024-11-14', '2024-11-14', 'Составит список поручении', NULL, NULL, 'Составить список всех поручении для отдела Девелопмент и Реновация ( в ворд формате с исполнителями )', 'role', 'asosiy loyihalar ko‘rsatilgan', '2024-11-14 16:44:22', NULL),
(48, 5, 2, 4, NULL, '2024-11-18 04:35:11', '2024-11-19 06:15:00', NULL, '2024-11-18', '2024-11-25', 'Вх письмо № 178', NULL, NULL, '-- \r\nLLC \"Food Agro Company\"\r\nChief Accountant\r\nIdrisova Alfiya Axkamovna\r\nphone number: \r\n+998 95 470 47 13\r\n+998 99 371 31 47\r\n \r\nSpecialist Accountant\r\nErgesheva Nargiza Tursunbaevna\r\nphone number: +998 97 444 19 88', 'role', 'письмо в работе, данные в проработке\r\nответ на входящее письмо №315 от 19.11.2024', '2024-11-19 11:15:00', NULL),
(49, 5, 2, 4, NULL, '2024-11-18 04:39:45', '2024-11-19 06:14:14', NULL, '2024-11-18', '2024-11-25', 'Вх письмо № 179', NULL, NULL, 'LLC \"Food Agro Company\"\r\nChief Accountant\r\nIdrisova Alfiya Axkamovna\r\nphone number: \r\n+998 95 470 47 13\r\n+998 99 371 31 47\r\n \r\nc Specialist Accountant\r\nErgesheva Nargiza Tursunbaevna\r\nphone number: +998 97 444 19 88', 'role', 'письмо в работе, данные в проработке\r\nответ на входящее письмо №316 от 19.11.2024', '2024-11-19 11:14:14', NULL),
(50, 5, 1, 1, NULL, '2024-11-18 05:05:23', '2024-11-18 05:05:23', NULL, '2024-11-18', '2024-11-25', 'Вх письмо № 180', NULL, NULL, 'Здравствуйте        ,   я      ознакомился  с  функциями    вакансии     менеджера    деволоперского   проекта   ,    технического   аудитора   ,   инвестиционных  проектов   \r\nи   мне    в сё  ясно  .\r\n      Да  я    работал  в  строительстве   более  30  лет    на  разных  должностях     в  том   числе приходилось   завскладом  и  в  снабжении    и    инженер  ПТО  и   начальником  ОКС  завода     и    техническим  аудитором  .\r\nЗа  последние  годы  занимаюсь  оценкой      недвижимости  ,  основных  средств  ,  оборудования  .,  ТМЦ   .,  бизнеса  .\r\nЯ  как  тенический  аудитор  проверял  выполнения  в  строительстве  по  заданию  разных  ведомств     и  составлял  отчёты  согласно  стандартов   аудиторской  деятельности           80--специальный  вопрос    и  16--привлечение  эксперта \r\nТакже  как   технический  аудитор  и  оценщик  скажу  что в   ценообразование   продукции  ,   обооудования    ,  строит.  материалов  ,   ТМЦ   при  закупке   входят   в  общем  плане     ----       стоимость   предприятия   изготовителя   ,\r\n---  стоимость  поставки    --перевозки  если        импорт   ,    \r\n  ----НДС (РУз)  если  импорт    ,   ---- налоговая   пошлина  (акцизы)    если  импорт         , ----таможенные  сборы  если  импорт    ,    охрана  ,   складские  расходы   ,, перевозка до  заказчика  --потребителя    ,     разгрузка  ,    прочие  затраты  на  рекламы ,  на маркетинг   ,  на  брокера   , на  юриста  и.т.д.  а  также  прибыль    завода  изготовителя    или    предпринимателя            то  есть  поставщика   допустим    16 %\r\nТакже  я  могу     проверять    и  разрешать  вопросы  по  строительству ,,   затраты  на    производство       ,  оценку  рыночной  стоимости   имущества   ,  оборудования    ,   оценку   инвестиционных  проектов   ,,,\r\n  определять    функциональный и  физический  износ  машин  ,  оборудования    их  переоценку  и  списание  ..  \r\n   \r\nСтоимость  выполненных  работ  в  строительстве  определяется     ссылаясь  на  зсконодательные  ,  правовые    положения   ,  акты    и  формы  финансирования   ,  \r\n   -То  есть    допустим  есть   бюджетные  средства  ,  инвестиции    в  том  числе   иностранные  ,  хозрасчётные  средства    ,   частные  ,  доли  акционеров  ,  доли  государственные  и.т.д.\r\nВ  случае  инвестиции   иностранных  или  частных   компаний   капитала    то    ценообразование  материалов  и  ресурсов    можно    по  протоколом  согласования  договорной  цены   и  приходным  накладным    ,  \r\nв  случае   бюджетных  средств   то   по  фиксированным  ценам по   протоколам   конкурсных торгов ,   ....\r\n. При    отсутсвии  госдоли  также  можно  стоимость  работ     в  актах  заложить   в    в  укрупнённых  договорных  ценах     , ..  или   заключить  договор  по  договорным  ценам    ... а  все  списания  по  нормам  расхода    ,   а     все  сыпучие  материалы  и  краски  можно   отдельно    списывать    по  актам     ...\r\nДля  контроля  строительства  также  есть  положение  об  авторском  и  техническом  надзоре.  Также  есть  приложение  3  к  Пост.   321   ..\r\n    Также  скажу  что    оценка стоимости  недвижимости      компании  , предприятий    выполняется с применением   трёх подходов ,   сравнительный подход      , затратный подход и доходный подход . \r\n   Во всяком случае если аналогов нет то двумя подходами - ,  \r\n---- при затратном подходе  рассчитывается   всё  имущество преприятия их рыночная стоимость   без НДС  и рассчитываются все долги   ,  кредиты  и  обязательства  .  \r\nПри доходном подходе    выполняется    ретроспективный анализ     финансовых  отчётностей  ,  показателей  за  3  года    и  текущие       с учетом значений ставки капитализации ,  дисконта и рисков .  \r\nДля  оценки  инвесттиционных  проектов  рассчитываются      дисконтированный  срок  окупаемости    ,  текущая  стоимость    капитала  ,  предприятия   ,,   рассчитывается  внутренняя норма  рентабельности       ,         различные  значения  нормы  возврата   .    \r\nДисконтирование  это  привидение  будущих  финансовых   потоков  в  настоящую    текущую  стоимость \r\nЕсли   инвестиция  за  счёт  кредитных  средств    то  ставка  дисконта  равна  банковской  годовой  процентной  ставке  рефинансирования  .    \r\nЕсли  инвестиция  за  счёт   собственных  средств  то  ставка  дисконта  рассчитывается   по  другим  формулам  .       ,   .\r\nДалее   я  опять  учился        по  программе      Ассоциации  Инженеров  консультантов  при   Госстрое        РУз   , ... нам  преподавали  зарубежные   \r\nэксперты    по  9  разделам  этой  программы  и  они  указаны         в          сертификате   (прилагается  ниже  )  \r\nДа  я  проходил  обучение     с  учётом  требований    международной     экспертной  организации \r\nFIDIC    и  получил  сертификат   инженера  -   консультанта    22  октября   2022  года   который  даёт   право   участия    инженером -консультантом также   в  любом  международном  проекте. \r\nТакже  во втором  сертификате  в  пунете  7   указывается      \r\n    --- --Планирование   взаимодейстаия  с   Подрядчиком  ,   контроль   выполнения  и  приёмка  работ  (прилагается)----.\r\nДля  обьективности    моих  возможностей    представляю     в  электронном      варианте  резюме  в  4--х  страницах  \r\n  и  дополнительное   резюме    в  электорнном \r\nварианте    в  6-ти  страни цах .    .\r\n  -\'--и    другие  сертифткаты', 'role', NULL, NULL, NULL),
(51, 5, 1, 4, NULL, '2024-11-18 06:17:17', '2024-11-18 12:28:46', NULL, '2024-11-18', '2024-11-25', 'Вх ДСП письмо № 28', NULL, NULL, 'Пахткор', 'role', 'Ma\'lumot va ijro uchun qabul qilindi.', '2024-11-18 17:28:46', NULL),
(52, 5, 1, 3, NULL, '2024-11-18 16:54:50', '2024-11-18 17:02:52', NULL, '2024-11-18', '2024-11-25', 'Вх ДСП письмо № 26 682 и 834 карор', NULL, NULL, 'В установленном порядке рассмотреть данное вх ДСП письмо.', 'custom', NULL, NULL, NULL),
(53, 5, 1, 1, NULL, '2024-11-18 17:12:58', '2024-11-18 17:12:58', NULL, '2024-11-18', '2024-11-25', 'Вх ДСП письмо № - 575-14-0-К,24', NULL, NULL, NULL, 'custom', NULL, NULL, NULL),
(54, 5, 1, 1, NULL, '2024-11-18 17:18:46', '2024-11-18 17:18:46', NULL, '2024-11-18', '2024-11-25', 'Вх письмо № - 418-14-0-Q.24', NULL, NULL, NULL, 'custom', NULL, NULL, NULL),
(55, 5, 1, 1, NULL, '2024-11-25 09:00:22', '2024-11-25 09:00:22', NULL, '2024-11-25', '2024-11-30', 'перевод средств в размере 10% на YASIZ', NULL, NULL, 'прошу рассмотреть данное поручение', 'custom', NULL, NULL, NULL),
(56, 5, 1, 1, NULL, '2024-11-25 09:42:58', '2024-11-25 09:42:58', NULL, '2024-11-25', '2024-11-30', 'Вх ДСП письмо № 39 перевод средств 3,9 млрд', NULL, NULL, 'керакли тарзда кўриб чикишингизни сўрайман', 'custom', NULL, NULL, NULL),
(57, 5, 2, 4, NULL, '2024-11-26 05:17:05', '2024-11-28 05:38:12', NULL, '2024-11-26', '2024-11-30', 'Вх письмо № 191', NULL, NULL, 'рассмотреть данное вх письмо', 'role', 'взято в работу доведено до ситимейкерс', '2024-11-28 10:38:12', NULL),
(58, 5, 2, 1, NULL, '2024-11-27 06:21:12', '2024-11-27 06:21:12', NULL, '2024-11-27', '2024-12-02', 'Вх дсп № 40  суммаси 1 314,3', NULL, NULL, 'Прошу рассматреть данное письмо', 'custom', NULL, NULL, NULL),
(59, 5, 2, 1, NULL, '2024-11-27 06:36:33', '2024-12-02 11:30:43', NULL, '2024-11-27', '2024-12-06', 'Вх дсп № 42  суммаси 20 млрд', NULL, NULL, 'Янги Ўзбекистон боғи хамда унга туташ худудларда ичимлик ва оқава сув тизимларини қуриш', 'custom', NULL, NULL, NULL),
(60, 5, 2, 1, NULL, '2024-11-28 06:33:29', '2024-11-28 06:33:29', NULL, '2024-11-28', '2024-12-02', 'вхд №43 от 27.11.2024 сумма 7 млрд', NULL, NULL, 'Тошкент шахридаги ижтимоий соха обектлари бўйича қуриш ва таъмирлаш ишлари учун', 'custom', NULL, NULL, NULL),
(61, 5, 2, 1, NULL, '2024-11-28 06:38:18', '2024-12-02 07:17:37', NULL, '2024-11-28', '2024-12-06', 'вхд №44 от 27.11.2024 сумма 10 млрд', NULL, NULL, 'Қорақалпоғистон Республикаси Нукус шахрида оғир турмуш шароитидаги оилаларга тегишли уйларнинг том қисмини таъмирлаш ва авария холатидаги уйларни янгидан қуриш', 'custom', NULL, NULL, NULL),
(62, 5, 2, 1, NULL, '2024-11-28 06:44:02', '2024-11-28 06:44:02', NULL, '2024-11-28', '2024-12-02', 'вхд №45 от 27.11.2024 сумма 39,7 млрд', NULL, NULL, 'Тошкентда марказий ва асосий кўчалар бўйида жойлашган кўп қаватли ва якка тартибдаги уйлар, Тошкент халқаро аеропортига туташ худудлардаги турар жойларни фасад ва том қисмини таъмирлаш ишлари учун.', 'custom', NULL, NULL, NULL),
(63, 5, 2, 1, NULL, '2024-12-02 06:55:59', '2024-12-02 06:55:59', NULL, '2024-12-02', '2024-12-06', 'вхд №46 от 02.12.2024 сумма 684,2 млн', NULL, NULL, 'Янги Хаёт туманидаги 128,1 гектар ер майдонларини қишлоқ хўжалигига мўлжалланган ва ўрмон фонди ерларининг ер фонди тоифаларини ўзгартириш бўйича ер тузиш лойихаларини бажариш.', 'custom', NULL, NULL, NULL),
(64, 5, 2, 1, NULL, '2024-12-02 13:10:04', '2024-12-02 13:10:04', NULL, '2024-12-02', '2024-12-06', 'вхд №48 от 02.12.2024 сумма 3 млрд', NULL, NULL, 'Янги йил байрам тадбирларини ташкил этиш ва ўтказиш белгиланганлиги хамда байра тадбирлари билан боғлиқ сарф харажатлар.', 'custom', NULL, NULL, NULL),
(65, 5, 2, 4, NULL, '2024-12-04 12:07:39', '2024-12-05 06:26:49', NULL, '2024-12-04', '2024-12-09', 'вхд №53 от 04.12.2024 01-Б-163 сон баёни', NULL, NULL, 'КУН ТАРТИБИ: Инвестиция дастурлари ижросини самарали ташкил қилиш, шу жумладан Хитой инвесторлари билан имзоланган келишувлар хамда экспорт кўрсаткичлари ижросини самарали ташкил қилиш тўғрисида', 'role', 'выполнено', '2024-12-05 11:26:49', NULL),
(66, 5, 2, 4, NULL, '2024-12-05 07:15:17', '2024-12-10 05:25:40', NULL, '2024-12-05', '2024-12-09', 'вхд № 54 от 05.12.2024 895-14-0-Q/24', NULL, NULL, 'Тошкент шахар хокимининг 2024 йил 5 августдаги 526-14-0-Q/24 сон қарорига ўзгартириш киритиш.', 'custom', 'Ijro uchun qabul qilindi', '2024-12-10 10:25:40', NULL),
(67, 5, 2, 4, NULL, '2024-12-05 11:07:32', '2024-12-17 06:45:34', NULL, '2024-12-05', '2024-12-09', 'вхд № 203 от 05.12.2024 реновацияга таклиф', NULL, NULL, 'Реновацияга таклиф', 'role', 'принято, проверено', '2024-12-17 11:45:34', NULL),
(68, 5, 2, 4, NULL, '2024-12-05 11:11:54', '2024-12-17 06:46:03', NULL, '2024-12-05', '2024-12-09', 'вхд № 204 от 05.12.2024', NULL, NULL, 'Реновация лойихасини амалга ошириш бўйича ўтказилган якуний босқич натижаси бўйича хозирга кундаги холати юзасидан маълумот бериш.', 'role', 'принято в работу', '2024-12-17 11:46:03', NULL),
(69, 5, 2, 4, NULL, '2024-12-05 15:28:27', '2024-12-17 06:47:21', NULL, '2024-12-05', '2024-12-09', 'вхд № 206 от 05.12.2024', NULL, NULL, 'Реновация лойихасини таклиф қилиш бўйича малака босқичида иштирок этиш.', 'role', 'рассмотрено\r\nне соответствует', '2024-12-17 11:47:21', NULL),
(70, 5, 2, 1, NULL, '2024-12-11 12:34:39', '2024-12-11 12:34:39', NULL, '2024-12-11', '2024-12-18', 'вхд № 57 от 11.12.2024 сумма 109,287 млрд', NULL, NULL, 'Тошкент шахри туманларининг махаллаларида қурилиш-таъмирлаш, ободонлаштириш ва кўкаламзорлаштириш ишларини амалга ошириш.', 'custom', NULL, NULL, NULL),
(71, 5, 2, 1, NULL, '2024-12-23 05:46:31', '2024-12-23 05:59:15', NULL, '2024-12-23', '2024-12-27', '934-14-0-Q/24', NULL, NULL, 'Чилонзор туманидаги иқтисодиёт тармоқлари ва ижтимоий соҳа объектларини қуриш ҳамда ободонлаштириш кўкаламзорлаштириш ишлари учун', 'custom', NULL, NULL, NULL),
(72, 5, 2, 1, NULL, '2024-12-23 05:54:12', '2024-12-23 05:54:12', NULL, '2024-12-23', '2024-12-27', '935-14-0-Q/24', NULL, NULL, 'Янгихаёт тумани, Орият ва Хушнуд маҳалласидаги болалар ва ўсмирлар спорт мактаби объектлари қурилишида келган қарздорлигини қоплаш ва маҳаллаларни комплекс ривлжлантириш харажатлари учун', 'custom', NULL, NULL, NULL),
(73, 5, 2, 1, NULL, '2024-12-23 05:58:39', '2024-12-23 05:58:39', NULL, '2024-12-23', '2024-12-27', '936-14-0-Q/24', NULL, NULL, 'Тошкент шаҳар хокимлиги ҳузуридаги жисмоний ва юридик шахсларга етказилган мулкий зарарларни компенсация қилиш.', 'custom', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `task_status`
--

CREATE TABLE `task_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `task_status`
--

INSERT INTO `task_status` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Active', NULL, '2024-10-16 10:43:33', '2024-10-16 10:43:33'),
(2, 'Canceled', NULL, '2024-10-16 10:43:33', '2024-10-16 10:43:33'),
(3, 'Accepted', NULL, '2024-10-16 10:43:33', '2024-10-16 10:43:33'),
(4, 'Completed', NULL, '2024-10-16 10:43:33', '2024-10-16 10:43:33'),
(5, 'Deleted', NULL, '2024-10-16 10:43:33', '2024-10-16 10:43:33'),
(6, 'ORDER_ACTIVE', NULL, '2024-10-16 10:43:33', '2024-10-16 10:43:33'),
(7, 'TIME_IS_OVER', NULL, '2024-10-16 10:43:33', '2024-10-16 10:43:33'),
(8, 'ADMIN_REJECT', NULL, '2024-10-16 10:43:33', '2024-10-16 10:43:33'),
(9, 'XODIM_REJECT', NULL, '2024-10-16 10:43:33', '2024-10-16 10:43:33');

-- --------------------------------------------------------

--
-- Структура таблицы `task_user`
--

CREATE TABLE `task_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `task_user`
--

INSERT INTO `task_user` (`id`, `task_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 16, 22, '2024-11-08 05:33:27', '2024-11-08 05:33:27'),
(2, 16, 44, '2024-11-08 05:33:27', '2024-11-08 05:33:27'),
(6, 20, 41, '2024-11-09 12:52:43', '2024-11-09 12:52:43'),
(7, 20, 61, '2024-11-09 12:52:43', '2024-11-09 12:52:43'),
(8, 24, 61, '2024-11-09 13:00:59', '2024-11-09 13:00:59'),
(13, 26, 7, '2024-11-11 09:53:22', '2024-11-11 09:53:22'),
(14, 25, 7, '2024-11-11 09:53:33', '2024-11-11 09:53:33'),
(17, 31, 7, '2024-11-11 17:18:20', '2024-11-11 17:18:20'),
(18, 31, 29, '2024-11-11 17:18:20', '2024-11-11 17:18:20'),
(20, 36, 41, '2024-11-12 06:12:15', '2024-11-12 06:12:15'),
(21, 36, 61, '2024-11-12 06:12:15', '2024-11-12 06:12:15'),
(22, 37, 41, '2024-11-12 06:15:16', '2024-11-12 06:15:16'),
(23, 37, 61, '2024-11-12 06:15:16', '2024-11-12 06:15:16'),
(30, 42, 13, '2024-11-13 17:21:24', '2024-11-13 17:21:24'),
(32, 44, 13, '2024-11-14 06:02:13', '2024-11-14 06:02:13'),
(36, 52, 13, '2024-11-18 17:02:52', '2024-11-18 17:02:52'),
(37, 52, 22, '2024-11-18 17:02:52', '2024-11-18 17:02:52'),
(38, 53, 22, '2024-11-18 17:12:59', '2024-11-18 17:12:59'),
(39, 54, 22, '2024-11-18 17:18:46', '2024-11-18 17:18:46'),
(41, 55, 63, '2024-11-25 09:04:16', '2024-11-25 09:04:16'),
(42, 56, 13, '2024-11-25 09:42:58', '2024-11-25 09:42:58'),
(43, 56, 22, '2024-11-25 09:42:58', '2024-11-25 09:42:58'),
(44, 58, 13, '2024-11-27 06:21:12', '2024-11-27 06:21:12'),
(45, 58, 22, '2024-11-27 06:21:12', '2024-11-27 06:21:12'),
(48, 60, 13, '2024-11-28 06:33:29', '2024-11-28 06:33:29'),
(49, 60, 22, '2024-11-28 06:33:29', '2024-11-28 06:33:29'),
(54, 63, 13, '2024-12-02 06:55:59', '2024-12-02 06:55:59'),
(55, 63, 22, '2024-12-02 06:55:59', '2024-12-02 06:55:59'),
(58, 59, 13, '2024-12-02 11:30:43', '2024-12-02 11:30:43'),
(59, 59, 22, '2024-12-02 11:30:43', '2024-12-02 11:30:43'),
(62, 64, 13, '2024-12-02 13:10:21', '2024-12-02 13:10:21'),
(63, 64, 22, '2024-12-02 13:10:21', '2024-12-02 13:10:21'),
(64, 62, 13, '2024-12-02 13:45:01', '2024-12-02 13:45:01'),
(65, 62, 22, '2024-12-02 13:45:01', '2024-12-02 13:45:01'),
(66, 61, 13, '2024-12-02 13:46:31', '2024-12-02 13:46:31'),
(67, 61, 22, '2024-12-02 13:46:31', '2024-12-02 13:46:31'),
(70, 66, 13, '2024-12-05 12:10:59', '2024-12-05 12:10:59'),
(71, 66, 22, '2024-12-05 12:10:59', '2024-12-05 12:10:59'),
(72, 70, 13, '2024-12-11 12:34:39', '2024-12-11 12:34:39'),
(73, 70, 22, '2024-12-11 12:34:39', '2024-12-11 12:34:39'),
(76, 72, 13, '2024-12-23 05:54:12', '2024-12-23 05:54:12'),
(77, 72, 22, '2024-12-23 05:54:12', '2024-12-23 05:54:12'),
(78, 73, 13, '2024-12-23 05:58:39', '2024-12-23 05:58:39'),
(79, 73, 22, '2024-12-23 05:58:39', '2024-12-23 05:58:39'),
(80, 71, 13, '2024-12-23 05:59:15', '2024-12-23 05:59:15'),
(81, 71, 22, '2024-12-23 05:59:15', '2024-12-23 05:59:15');

-- --------------------------------------------------------

--
-- Структура таблицы `tokens`
--

CREATE TABLE `tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `api_user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `token_expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `theme` varchar(30) NOT NULL DEFAULT 'default',
  `is_online` int(11) NOT NULL DEFAULT 0,
  `phone` varchar(255) DEFAULT NULL,
  `about` text DEFAULT NULL,
  `location` text DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `last_finishedtask` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `theme`, `is_online`, `phone`, `about`, `location`, `birth_date`, `hire_date`, `avatar`, `deleted_at`, `remember_token`, `last_finishedtask`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'superadmin@example.com', NULL, '$2y$10$a7tawfNU334VCxs7HnDlwe//akmBGtGC8c9Gg8AaQpm7JmxF22T6O', 'light', 0, '+998999992233', 'I am a super admin', 'Uzbekistan', '2004-03-30', NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:26', '2024-11-04 10:14:17'),
(2, 'Admin', 'admin@gmail.com', NULL, '$2y$10$nsZwW3KE2ro845KwORWJr.PPD60sRYbhxuTl/KrRI4b3TeQorlLcW', 'default', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:26', '2024-10-16 10:43:26'),
(3, 'Manager', 'manager@example.com', NULL, '$2y$10$hRcEhRvxmPrP5D1hRrM7reek9g9eM/6gYGClHDcP1uOr3x8TYlwqq', 'default', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:27', '2024-10-16 10:43:27'),
(4, 'Employee', 'employee@example.com', NULL, '$2y$10$.7rK3x2Tf7LwDHj9KD9kcufFR60s0UAMveBACa5aUwTzVNoxdNo3S', 'default', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:27', '2024-10-16 10:43:27'),
(5, 'Shakirov Baxrom Askaralievich', 'baxrom.shakirov@toshkentinevst.uz', NULL, '$2y$10$8uzJpf.zHURI3YH1vXSeSeSxvQSkUmacuMcs8pXXA77Vm0VNshe8.', 'light', 0, '+998 (95) 877-88-00', 'I.O. Predsedatelya pravleniya', 'Uzbekistan', NULL, NULL, NULL, NULL, 'SdNMTgOOD7me8TR8L9C56JgywSzeSAB9l5kMrTZ0HsFm8KzGMUQN1Vbl6j8H', NULL, '2024-10-16 10:43:27', '2025-01-01 15:03:16'),
(6, 'Gurko Aleksandr', 'aleksandr.gurko@toshkentinevst.uz', NULL, '$2y$10$iUcC47Rrq3tntf9YdGa3f.c0pzlPDyT5fDfR.x/rLMZvUdibyv6N6', 'default', 0, '+ 998 (90) 809-94-88', 'Perviy zamestitel Predsedatelya pravleniya po po sifrovoy transformasii i informasionnim texnologiyam', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:27', '2024-10-26 09:51:19'),
(7, 'Otaxonova Nargizaxon Ganievna', 'nargizaxon.otaxonova@toshkentinevst.uz', NULL, '$2y$10$7/Jg.C648bDpyFSRiGLpQObCIrmBbXj2/h7F25iR58rcWWX5I4bhu', 'default', 0, '+ 998 (97) 740-18-36', 'Zamestitel predsedatelya pravleniya po upravleniyu proektami', 'Tashkent', NULL, NULL, NULL, NULL, 'h1daYpD8TlT5vwIU7EV5YdsZsyGwwQ4hui3rL7J7xPfzXlXwfR3jHdf0iKaY', NULL, '2024-10-16 10:43:27', '2024-10-26 09:54:13'),
(8, 'Ryabov Nikita Vladimirovich', 'nikita.ryabov@toshkentinevst.uz', NULL, '$2y$10$4amlxcFgpVj06MLxSWkPUeYb9vd37gpmO7OIwwbOKKDuYzwCX3KFm', 'light', 0, '+ 998 (97) 009-45-04', 'Zamestitel predsedatelya pravleniya \npo investisiyam', 'Tashkent', NULL, NULL, NULL, NULL, 'oSNjpLPKKLxLc5A7dD23fb6C8X4UfZmKls8cl3NIn8MAWa45cFgqBgn2RLyH', NULL, '2024-10-16 10:43:27', '2024-11-11 11:24:24'),
(9, 'Kodirov Rustam Shuxratovich', 'rustam.kodirov@toshkentinevst.uz', NULL, '$2y$10$meWD8qI.70cxvIZxj6cOu.J7MKFkcMGgDrensCnOyPrB.SxHkln3K', 'default', 0, '+998 (90) 979-41-00', 'Zamestitel Predsedatelya pravleniya po strategicheskomu razvitiyu', 'Tashkent', NULL, NULL, NULL, NULL, 'yfgd3nXeOm4ou1WONkF6LvTDRPXLg2hluXtGMw6vyljkQbONek0i5dIxyuWp', NULL, '2024-10-16 10:43:27', '2024-10-25 05:48:59'),
(10, 'Peregudov Andrey Nikolaevich', 'andrey.peregudov@toshkentinevst.uz', NULL, '$2y$10$6T2yawhTCjMrchyO8YOKKO79bl7Th0EcLslcqReUsXL5DWgWSkJGa', 'default', 0, '+ 998 (50) 103-11-18', 'Zamestitel predsedatelya pravleniya\npo developmentu i renovasii – rukovoditel Proektnogo ofisa «Koordinasiya stroitelstva»', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:27', '2024-10-26 09:53:04'),
(11, 'Rajabov Rustam Baxtiyarovich', 'rustam.rajabov@toshkentinevst.uz', NULL, '$2y$10$nBPt8.t.9b1lyxd1/lRXZu9ycGgOKroChC0DbFglKCbOISB2sx7My', 'default', 0, '+ 998 (90) 788-38-83', 'Sovetnik Nablyudatelnogo soveta', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:27', '2024-10-26 10:01:13'),
(12, 'Baraev Murot Abduljanovich', 'murot.baraev@toshkentinevst.uz', NULL, '$2y$10$rOLAuRE0wBrj/ao5fu5nveqpueVHCs8G.A6HeOAjHG...STjJ1VJ2', 'default', 0, '+998 (88) 100-80-80', 'Rukovoditel \nAdministrasii pravleniya', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:27', '2024-10-25 11:06:01'),
(13, 'Axmedov Javoxir', 'javoxir.axmedov@toshkentinevst.uz', NULL, '$2y$10$m9BA8gaECeI1rwi03rzvw.n2TIi.0uAErcchthyWcw63b4lIWJlte', 'default', 0, '+998 (90) 122-47-22', 'Vedushiy spesialist Administrativno-xozyaystvennogo otdela Administrasii Pravleniya', 'Tashkent', NULL, NULL, NULL, NULL, 'ef6Jo6j8wDWOSZaJKEuot39E2XeDtzdwteJMX6x6KrB4xDCSQad9urk5ptxp', NULL, '2024-10-16 10:43:28', '2024-10-25 09:58:09'),
(14, 'Sagdullaev Sadirxuja Sobit', 'sadirxuja.sagdullaev@toshkentinevst.uz', NULL, '$2y$10$hMeoKf0ST04UG8ICvzwHL.2Y/.FLLXSL9.MDPdPJivUvO1iTernai', 'default', 0, '+998 (94) 701-11-11', 'Vedushiy spesialist Administrativno-xozyaystvennogo otdela Administrasii Pravleniya', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:28', '2024-10-26 10:02:20'),
(15, 'Abdullaev Abdulaziz', 'abdulaziz.abdullaev@toshkentinevst.uz', NULL, '$2y$10$/aUX11jO/g8U9Yj9eZtHuOrz4yky26/Mx43fH16wqZHLxet/NTR6m', 'default', 0, '+998 (97) 712-00-11', 'Vedushiy spesialist Administrativno-xozyaystvennogo otdela Administrasii Pravleniya', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:28', '2024-10-25 11:07:17'),
(16, 'Abdusattorov Abdulaziz Davron', 'abdulaziz.abdusattorov@toshkentinevst.uz', NULL, '$2y$10$N.WnZGN2sZkvMlTA616kleXy0iXtyt.xjdLufwgRl7pT2Ej4vFMF2', 'default', 0, '+998 (33) 308-80-99', 'Vedushiy spesialist IT otdela\nAdministrasii Pravleniya', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:28', '2024-10-25 09:58:24'),
(17, 'Turgunov Eldorbek Toxirjon', 'eldorbek.turgunov@toshkentinevst.uz', NULL, '$2y$10$S6zHpzCaLU79RH0xpaU/DOiZ2MMlNyOu6G2dM6gPFLl7K9fZscs2W', 'default', 0, '+ 998 (99) 830-12-57', 'Glavniy spesialist Otdela po svyazi s obshestvennostyu Administrasii pravleniya', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:28', '2024-10-26 10:03:27'),
(18, 'Kochergina Ekaterina Sergeevna', 'ekaterina.kochergina@toshkentinevst.uz', NULL, '$2y$10$VJUusTMLbTqhzBIY7rnClOjToWo9XPSQ2iZh55mwqQmf74yeWOJTy', 'default', 0, '+998 (91) 782-09-67', 'Direktor departamenta po sifrovim texnologiyam', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:28', '2024-10-26 10:04:31'),
(19, 'Valiev Farrux', 'farrux.valiev@toshkentinevst.uz', NULL, '$2y$10$V0UixvDLlHTANc9V9LuOQuAVA462KtLVoCjYR3KUnwQ73QVwCOPo6', 'default', 0, '+998 (90) 324-59-59', 'Zamestitel direktora departamenta po sifrovim texnologiyam', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:28', '2024-10-26 10:05:21'),
(20, 'Alekseev Nikolay Yurevich', 'nikolay.alekseev@toshkentinevst.uz', NULL, '$2y$10$wr3O12rmipHHAbgXWorJweNnoSWj5Tmjo9OL5AsaB2czbpCITMtia', 'default', 0, '`+998 (99) 099-76-31', 'Zamestitel rukovoditelya proektnogo ofisa Proektniy ofis po upravleniyu proektami sifrovoy transformasii v transportnom komplekse', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:28', '2024-10-25 09:59:18'),
(21, 'Tulkunov Shaxzod', 'shaxzod.tulkunov@toshkentinevst.uz', NULL, '$2y$10$dpuwaMEL2UuBjwzvaWyVTus8F/13p3wwdiReQGT/n33RyNb4CERlu', 'default', 0, '+998 (97) 441-86-88', 'Glavniy spesialist - transportniy injener Proektnogo ofisa po upravleniyu proektami sifrovoy transformasii v transportnom komplekse Departamenta po sifrovim texnologiyam', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:28', '2024-10-26 10:06:34'),
(22, 'Mirzaev Baxtiyor Muxitjonovich', 'baxtiyor.mirzaev@toshkentinevst.uz', NULL, '$2y$10$BP1YzGs9j94fuTmGtvUS0uODpPbXPIPviAwCngXvqRL6eesTuSsLi', 'default', 0, '+ 998 (90) 002-20-92', 'Nachalnik otdela finansovogo planirovaniya i analiza', 'Tashkent', NULL, NULL, NULL, NULL, 'fGlIVCfBgrZryxzoKWMjyAfwpiVE04syG7M7LWhatf3m65qSTH59CJS2ZEsw', NULL, '2024-10-16 10:43:28', '2024-10-25 11:08:18'),
(23, 'Abduraximov Faxriddin Karimovich', 'faxriddin.abduraximov@toshkentinevst.uz', NULL, '$2y$10$eeSt0SCCCzCqPcb3lepRyuD9eYMhO//Rckakxn2Nze4WuF4tJRCyu', 'default', 0, '+ 998 (99) 409-98-18', 'Vr.i.o. glavnogo buxgaltera Otdela buxgalterskogo ucheta i otchetnosti - Glavniy spesialist Otdela finansovogo planirovaniya i analiza', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:28', '2024-10-25 11:16:49'),
(24, 'Aydashev Furkat Gulamovich', 'furkat.aydashev@toshkentinevst.uz', NULL, '$2y$10$TjAP92jB.qWNcLHW0poUi.LFACMxSfzjD5XgrrSyOjCSFNRcqVNYm', 'default', 0, '+998 (91) 798-86-50', 'Direktor departamenta organizasii dorojnogo i jilishno-kommunalnogo stroitelstva', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:29', '2024-10-25 11:18:50'),
(25, 'Atajanov Umid Sultanovich', 'umid.atajanov@toshkentinevst.uz', NULL, '$2y$10$B17j25LTKjP5aau29CMM3uK4hmbyjlC.TxAMPHZeW7TxHyC6ByNp6', 'default', 0, '+ 998 (95) 153-71-91', 'Zamestitel direktora departamenta organizasii dorojnogo i jilishno-kommunalnogo stroitelstva', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:29', '2024-10-25 11:20:43'),
(26, 'Suleymanov Shoxrux Shuxratovich', 'shoxrux.suleymanov@toshkentinevst.uz', NULL, '$2y$10$8cCgMGRqxlCVykK1jMlxUOAwqQTdOAMhD0TmRLI/lSgjowf.9.2UO', 'default', 0, '+998 (95) 121-55-44', 'Rukovoditel proekta Otdela organizasii dorojnogo stroitelstva Departamenta organizasii dorojnogo i jilishno-kommunalnogo stroitelstva', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:29', '2024-10-25 11:21:22'),
(27, 'Eminov Emin Nurgilidjovich', 'emin.eminov@toshkentinevst.uz', NULL, '$2y$10$w2oWQidu9unqeutYPdHO..fzK0bzcXCDriw8YKjZIy5PlRLvVHuBW', 'default', 0, '`+998 (93) 746-74-72', 'Glavniy spesialist Otdela organizasii dorojnogo stroitelstva Departamenta organizasii dorojnogo i jilishno-kommunalnogo stroitelstva', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:29', '2024-10-26 10:07:51'),
(28, 'Soliev Iskandar Jaxongir', 'iskandar.soliev@toshkentinevst.uz', NULL, '$2y$10$UeG80Y9g/.9aIT3ZJycBCeqcliwkdmCJq4DAkaZTgG/MEvaiJ4t/W', 'default', 0, '+ 998 (99) 430-11-77', 'Menedjer proekta Otdela parkovix zon i obshestvennix prostranstv Departamenta gorodskogo planirovaniya i komfortnoy sredi', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:29', '2024-10-26 09:47:25'),
(29, 'Karimov Ilyas Talgatovich', 'ilyas.karimov@toshkentinevst.uz', NULL, '$2y$10$I.7ozAeCMPxkWwfCrGOk3u5v1sX8MENIbQ2HcnLwzpwaOj2nsiMq.', 'default', 0, '+ 998 (77) 080-77-03', 'Direktor departamenta stroitelstva i renovasii', 'Tashkent', NULL, NULL, NULL, NULL, 'p2JQP535DnwJWmLGffHePMTGq1anQoMp13gXkpOPrMGQBrYZkAxUbmZTe1KY', NULL, '2024-10-16 10:43:29', '2024-10-26 10:10:26'),
(30, 'Xasanova Rushana Rinnatovna', 'rushana.xasanova@toshkentinevst.uz', NULL, '$2y$10$OZgl2iY6RnsFnJIAkt2kcOyAyFeEcetVFMrHK2xEB2wgwrxjs0PIG', 'default', 0, '+ 998 (90) 968-79-97', 'I.o. Nachalnika otdela formirovaniya i soprovojdeniya developerskix proektov Departamenta stroitelstv i renovasii', 'Tashkent', NULL, NULL, NULL, NULL, 'zBL038DRaAqrfE8YHbs9uHkBPi4RRHukLR38JgA8dPtr5sAdDo8PGnZ5v90W', NULL, '2024-10-16 10:43:29', '2024-10-25 10:03:48'),
(31, 'Xudoyarov Rustam Isamiddinovich', 'rustam.xudoyarov@toshkentinevst.uz', NULL, '$2y$10$.fQrP.eEF9eVb7H7GEAk/.IA0nnOYwMnCXHGV2KNjR.t5jHiSegoC', 'default', 0, '+998 (99) 407-20-25', 'Menedjer proekta \nOtdela formirovaniya i soprovojdeniya developerskix proektov Departamenta stroitelstv i renovasii', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:29', '2024-10-26 10:11:17'),
(32, 'Abdurashitov Enver Islyamovich', 'enver.abdurashitov@toshkentinevst.uz', NULL, '$2y$10$wyzsbDh.UO4/SHewz856CO6AD0WaxtMQtHN3d6Jm4QSfBrMjIGHHW', 'default', 0, '+998 (93) 182-06-33', 'Menedjer proekta \nOtdela formirovaniya i soprovojdeniya developerskix proektov Departamenta stroitelstv i renovasii', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:29', '2024-10-26 10:11:56'),
(33, 'Gapirova Zilola Shavkatovna', 'zilola.gapirova@toshkentinevst.uz', NULL, '$2y$10$4J7Gq3DehtYVDzeE9kIqreN04JFvFMo2ougBIxznovBs5JSQVsuqu', 'default', 0, '+ 998 (97) 774-00-36', 'Glavniy spesialist (Administrator) \nOtdela formirovaniya i soprovojdeniya developerskix proektov Departamenta stroitelstv i renovasii', 'Tashkent', NULL, NULL, NULL, NULL, '9b5IRMEXmMNP4E6a4kzwHNWYVBUTpMSXj5naGyreI1244hgbSPRDb3eVNp71', NULL, '2024-10-16 10:43:29', '2024-10-26 10:12:31'),
(34, 'Ernazarov Adilbek Saparbay', 'adilbek.ernazarov@toshkentinevst.uz', NULL, '$2y$10$fazrsi45eddFndQ8Jx.FnetKFM2yF10y/imqmXijbOEsRbAE/1L0q', 'default', 0, '+ 998 (97) 357-76-66', 'Menedjer proekta \notdela formirovaniya i soprovojdeniya developerskix proektov Departamenta stroitelstv i renovasii', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:30', '2024-10-26 10:13:07'),
(35, 'Axmedov Ja\'far Raximjon', 'ja\'far.axmedov@toshkentinevst.uz', NULL, '$2y$10$oF0gIeoTtSdr3YtMF57bme2NZf/UObHyi8pVQa5jnFBMiiRJFQk7C', 'default', 0, '`+998 (99) 800-76-27', 'Glavniy spesialist Otdela rasseleniya vetxogo jilya Departamenta stroitelstva i renovasii', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:30', '2024-10-26 10:14:13'),
(36, 'Sagdullaev Sayfulla Lutfullaevich', 'sayfulla.sagdullaev@toshkentinevst.uz', NULL, '$2y$10$Vc1TWL4ruhaTPKfFM.iJ6uj161lRm0UDxuOnWYN8LzZopeLVTng1C', 'default', 0, '+998 (97) 470-07-16', 'Glavniy spesialist Otdela rasseleniya vetxogo jilya Departamenta stroitelstva i renovasii', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:30', '2024-10-26 10:14:39'),
(37, 'Ubaydullaev Xotam Xabibullaevich', 'xotam.ubaydullaev@toshkentinevst.uz', NULL, '$2y$10$uJIL0TIrQE4R4IdWM9/0P.lYTk1K.sIQVFp9avBfkeg/s.95oJ1wi', 'default', 0, '`+998 (90) 956-37-55', 'Glavniy spesialist Otdela rasseleniya vetxogo jilya Departamenta stroitelstva i renovasii', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:30', '2024-10-26 10:16:13'),
(38, 'Xalikov Alisher Abdulazizovich', 'alisher.xalikov@toshkentinevst.uz', NULL, '$2y$10$6kPUjFWXzJQzH.aUO1FhfeX1KUqUqcKeDOBkAvNNDV85753yan49m', 'default', 0, '`+998 (99) 866-48-28', 'Glavniy spesialist Otdela rasseleniya vetxogo jilya Departamenta stroitelstva i renovasii', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:30', '2024-10-26 10:17:10'),
(39, 'Umarbekov Adxambek Zokirbek', 'adxambek.umarbekov@toshkentinevst.uz', NULL, '$2y$10$PSsWMFdbi3wdXmmOfKnhsu5NDGjYduRRQhdlYkqzVmEcfW7Yc9Dpu', 'default', 0, '`+998 (97) 730-61-69', 'Vedushiy  spesialist Otdela rasseleniya vetxogo jilya Departamenta stroitelstva i renovasii', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:30', '2024-10-26 10:17:39'),
(40, 'Xashimov Dilshad Sunnat', 'dilshad.xashimov@toshkentinevst.uz', NULL, '$2y$10$.72jPwXUUkkmjcNV569qb.npsrH4vu7NfAVAC5NtGFxlPNITTF3Na', 'default', 0, '+ 998 (97) 705-03-13', 'Vedushiy  spesialist Otdela rasseleniya vetxogo jilya Departamenta stroitelstva i renovasii', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:30', '2024-10-26 10:18:18'),
(41, 'Baymuxamedov Iskandar Baxodirovich', 'iskandar.baymuxamedov@toshkentinevst.uz', NULL, '$2y$10$iWdZmIX5GHO5efwTV1zxUeGMws5N/YFi.DjG/3Wwxd/2WFngJTVLG', 'light', 0, '+ 998 (99) 880-98-17', 'Glavniy spesialist \nOtdela gradostroitelnogo kontrolya Departamenta stroitelstva i renovasii', 'Tashkent', NULL, NULL, NULL, NULL, 'qcpkeyQD7t0fScAc4vVtyAfc7JSsOHyS0tNnbweDnC6ygAlOc3qtLZU00xXA', NULL, '2024-10-16 10:43:30', '2024-11-18 04:48:27'),
(42, 'Zaripova Nazima', 'nazima.zaripova@toshkentinevst.uz', NULL, '$2y$10$MBqC/5mUpqqPdMrK7wyrve/BNVKQdhnyznKfHOf6tfGx.37ZHVGQ2', 'default', 0, '+998 (90) 931-04-30', 'Spesialist 1-kategorii\nOtdela formirovaniya i soprovojdeniya developerskix proektov Departamenta stroitelstv i renovasii', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:30', '2024-10-25 10:00:22'),
(43, 'Juraboev Ravshan Rustam', 'ravshan.juraboev@toshkentinevst.uz', NULL, '$2y$10$FexaRWFPNYaBchlHO6GsIupbRP5olIxv/bLCnJQS75OG2Y4t.ggTa', 'default', 0, '`+998 (95) 171-97-98', 'Spesialist Otdela formirovaniya i soprovojdeniya developerskix proektov Departamenta stroitelstv i renovasii', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:30', '2024-10-26 10:19:32'),
(44, 'Yunusov Djaxangir Baxodirovich', 'djaxangir.yunusov@toshkentinevst.uz', NULL, '$2y$10$u9vlfe/iMxZqIAnSJCxukuPyITneCWJJRTAFTE0Ns6usRq.2v3Ecq', 'default', 0, '+ 998 (99) 832-72-67', 'Direktor departamenta \npo realizasii proektov promishlennosti \ni logistiki', 'Tashkent', NULL, NULL, NULL, NULL, 'kbcuhmBQBxkrxBxPSWdrddRayEWHQ88aACBEvv8xlWGIw9eBF0WYaLGYZp3D', NULL, '2024-10-16 10:43:30', '2024-10-26 10:20:20'),
(45, 'Fayziev Axror Xasanbaevich', 'axror.fayziev@toshkentinevst.uz', NULL, '$2y$10$STVQaImrfuX8m9/qM4p3huXVGSCil57NakVZcc3CEO8a3hIeyfuJW', 'default', 0, '+ 998 (99) 110-93-40', 'Administrator zamestitelya predsedatelya pravleniya\npo upravleniyu promishlennim proektam', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:31', '2024-10-26 10:21:11'),
(46, 'Mamadaliev Alisher Muradilovich', 'alisher.mamadaliev@toshkentinevst.uz', NULL, '$2y$10$0YhKRA21Ky8.i8WphixhAeTZaGNdO6LgfqyQEP3zvz/4JAukWBJhy', 'default', 0, '+998 (94) 437-89-11', 'Rukovoditel Proektnogo ofisa po upravleniyu proektov tyajeloy\npromishlennosti Departamenta \npo realizasii proektov promishlennosti \ni logistiki', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:31', '2024-10-26 10:21:48'),
(47, 'Murodov Akmal Boykobilovich', 'akmal.murodov@toshkentinevst.uz', NULL, '$2y$10$8jrDNvc4eghwqNurq.J1t.n53tIIbGqNqk5i2AT3FkR7js4mqeWSy', 'default', 0, '+ 998 (90) 926-05-07', 'Glavniy spesialist \nProektnogo ofisa po upravleniyu proektov tyajeloy\npromishlennosti Departamenta \npo realizasii proektov promishlennosti \ni logistiki', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:31', '2024-10-26 10:22:13'),
(48, 'Tursunov Abdulnosir Normurod', 'abdulnosir.tursunov@toshkentinevst.uz', NULL, '$2y$10$Am9cIpeSdyqg1Opt0CXYguU5yWvOK.lbSm0rIF9Sc7xl6ZTdBrDxS', 'default', 0, '+ 998 (99) 817-11-80', 'Glavniy spesialist \nProektnogo ofisa po upravleniyu proektov tyajeloy\npromishlennosti Departamenta \npo realizasii proektov promishlennosti \ni logistiki', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:31', '2024-10-26 10:22:47'),
(49, 'Mamatkulov Amirxon Rustam', 'amirxon.mamatkulov@toshkentinevst.uz', NULL, '$2y$10$x01xddZgsHkB19UIrj3mV..H.cchMNKbKvqoxD4/ov2LwP3MLS1yW', 'default', 0, '+ 998 (99) 518-88-81', 'Glavniy spesialist \nProektnogo ofisa po upravleniyu proektov tyajeloy\npromishlennosti Departamenta \npo realizasii proektov promishlennosti \ni logistiki', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:31', '2024-10-25 10:01:48'),
(50, 'Kobilov Odiljon Komiljon', 'odiljon.kobilov@toshkentinevst.uz', NULL, '$2y$10$ajqDQCNGZWtsm1RPoiI0/.uE1ZqNv0kyDzDseq6j1/l6R2jwZbN1i', 'default', 0, '`+998 (90) 992-29-77', 'Glavniy spesialist \nProektnogo ofisa po upravleniyu proektov tyajeloy\npromishlennosti Departamenta \npo realizasii proektov promishlennosti \ni logistiki', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:31', '2024-10-26 10:23:31'),
(51, 'Karimov Baxodir Baxtiyor', 'baxodir.karimov@toshkentinevst.uz', NULL, '$2y$10$PQ.NCtzZ05se.miN/p7ZIuzu7.QQt8Z1peqFzPJ0T/3/XbKHHvJTu', 'default', 0, '+ 998 (93) 534-21-76', 'Glavniy spesialist \nProektnogo ofisa po upravleniyu proektov tyajeloy\npromishlennosti Departamenta \npo realizasii proektov promishlennosti \ni logistiki', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:31', '2024-10-26 10:24:05'),
(52, 'Iskandarov Dilshod Farxod', 'dilshod.iskandarov@toshkentinevst.uz', NULL, '$2y$10$Amrgn1Cml6asugp.victCuOpap.fZemc2kG6oZ8ZDHmCgDNWm9Fhi', 'default', 0, '+ 998 (90) 970-45-67', 'Menedjer proekta \nOtdela analiza proektov i riskov', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:31', '2024-10-25 10:03:09'),
(53, 'Orifjonov Islom Muminjon', 'islom.orifjonov@toshkentinevst.uz', NULL, '$2y$10$IYwtjPvMAP1CSKS4mzpa6.PSDxQEA.7s3f1zZa8MKy3wVAQzCC8H2', 'default', 0, '+ 998 (90) 917-72-27', 'Nachalnik otdela\npo proektam gosudarstvenno-chastnogo partnerstva', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:31', '2024-10-26 10:39:40'),
(54, 'Bibutova Shaxlo Sadullaevna', 'shaxlo.bibutova@toshkentinevst.uz', NULL, '$2y$10$Jlb22rO3Ev8M7A3rEuvnK.q5UVPIisvt4lgYhqDi52mDw6sTXJWWy', 'default', 0, '+ 998 (88) 788-76-09', 'Direktor departamenta metodologii i normotvorchestva', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:31', '2024-10-26 10:47:52'),
(55, 'Maxmudov Xurshid Muminjonovich', 'xurshid.maxmudov@toshkentinevst.uz', NULL, '$2y$10$X8.cswqE8b8J4SovoJ8zmePI59zHS6006JFnKfY.XGpzPS7prSazi', 'default', 0, '+ 998 (90) 907-64-60', 'Zamestitel direktora Departamenta metodologii i normotvorchestva', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:32', '2024-10-26 10:48:32'),
(56, 'Abduazimov Shoxabbos', 'shoxabbos.abduazimov@toshkentinevst.uz', NULL, '$2y$10$.V6gx19muPqO29BHBopGFOLAKu4Sax0JdjXQCnv5wcLl/6zc5ZNZS', 'default', 0, '`+998 (91) 290-00-03', 'Glavniy spesialist Departamenta metodologii i normotvorchestva', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:32', '2024-10-26 10:49:00'),
(57, 'Ochilov Xusen Rashidovich', 'xusen.ochilov@toshkentinevst.uz', NULL, '$2y$10$KLs8z4/nR9yQDoZ.GRO1KOlWnG7q3tPkCsdCVkorH4IC/WFP0//iK', 'default', 0, '`+998 (91) 137-04-02', 'Nachalnik yuridicheskogo otdela', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:32', '2024-10-26 10:49:23'),
(58, 'Fayzullaev Omonulla Asatullaevich', 'omonulla.fayzullaev@toshkentinevst.uz', NULL, '$2y$10$m809UQjLK2DOzjqHfoJFvuAVgNLvjhklhTLAB3.uCP9K0APQ5/VCK', 'default', 0, '`+998 (99) 847-59-51', 'Zamestitel nachalnika yuridicheskogo otdela', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:32', '2024-10-25 10:04:56'),
(59, 'Mingalieva Aliya Rapikovna', 'aliya.mingalieva@toshkentinevst.uz', NULL, '$2y$10$TpUBlTVnrU0H1LdEnjCf0eTRB86zwhKTBaAz/hlEzdFzBqBg7ErMu', 'default', 0, '+ 998 (93) 381-02-71', 'Rukovoditel Slujbi \nrazvitiya chelovecheskix resursov (HR)', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:32', '2024-10-26 10:49:55'),
(60, 'Ten Evgeniya', 'evgeniya.ten@toshkentinevst.uz', NULL, '$2y$10$UO42PlHDe5NozxXjb5EgTeAo09nt2r6VcOF6Ws7huYqYOmC7lkSLm', 'default', 0, '+ 998 (90) 051-24-02', 'Nachalnik Otdela \npo korporativnim otnosheniyam', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:32', '2024-10-26 10:50:40'),
(61, 'Kobulov Sirojiddin Murod', 'sirojiddin.kobulov@toshkentinevst.uz', NULL, '$2y$10$liDxqPoFM7kDhSLOImsLeOAeB2buYNI.RU0sdQQ3.eU17yMEpE60a', 'default', 0, '+998 (90) 120-41-52', 'Spesialist 1-kategorii \nOtdela po korporativnim otnosheniyam', 'Tashkent', NULL, NULL, NULL, NULL, '092NG2FXE1UqZ4KttOijAIOcFXzIgLWnaPpOLre4T9UnkwyJ1BKXylBbMRrl', NULL, '2024-10-16 10:43:32', '2024-11-26 05:59:25'),
(62, 'Boyxanov Maxammadyusuf Otabek', 'maxammadyusuf.boyxanov@toshkentinevst.uz', NULL, '$2y$10$HQ0i8xQVb7jg/n7RqNoFxOUP2cWtTEgeoTbCmL74Unu6DGwwlxQ1i', 'default', 0, '+ 998 (99) 033-11-11', 'Glavniy spesialist \nUpravleniya po rabote s aktivami', 'Tashkent', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:32', '2024-10-26 10:59:23'),
(63, 'Raupov Muhammad Sayyidaxmat o\'gli', 'mraupov@toshkentinevst.uz', NULL, '$2y$10$GlMvx6.zOQjs4aWZt9GbYOUqhcZ1fQPBeM43FT5ZZBzYaREwqfaRW', 'default', 0, '+998909468606', 'Toshkent taraqgiyot jamg\'armasi moliyaviy nazorat bo\'limi mutaxassisi', 'Tashkent', '1998-09-29', '2024-09-25', NULL, NULL, 'hjdUMuvIeLwMqkSu7XwcmG0KHFuEKJ7oOutYIFLQd6ixF6U1siQKwZkO6IcQ', NULL, '2024-10-16 10:43:32', '2024-10-17 14:01:41'),
(64, 'Gulomov Abror Olimjon', 'abror.gulomov@toshkentinevst.uz', NULL, '$2y$10$iK.I9X2yM8dA/80Bu4dwE.tls7.Z4y5Ii2uLbZ8bwZPUtWHbzSoW2', 'default', 0, ' + 998 (93) 592-35-75', 'Konsultant (po farmasevticheskomu napravleniyu)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16 10:43:32', '2024-10-16 10:43:32'),
(65, 'aaaaempi', 'azik@example.com', NULL, '$2y$10$gcSMOjbZDcbrkIQpow6PPuTZePhYJCF9bcDIWfXDotKUR2HpYblUe', 'default', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-25 10:01:56', NULL, NULL, '2024-10-16 10:43:33', '2024-10-25 10:01:56');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `api_users`
--
ALTER TABLE `api_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `api_users_name_unique` (`name`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `files_slug_unique` (`slug`),
  ADD KEY `files_user_id_foreign` (`user_id`),
  ADD KEY `files_task_id_foreign` (`task_id`);

--
-- Индексы таблицы `long_texts`
--
ALTER TABLE `long_texts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Индексы таблицы `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_finished_user_id_foreign` (`finished_user_id`),
  ADD KEY `orders_task_id_foreign` (`task_id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `qarorlars`
--
ALTER TABLE `qarorlars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `qarorlars_unique_code_unique` (`unique_code`),
  ADD KEY `qarorlars_user_id_foreign` (`user_id`),
  ADD KEY `qarorlars_category_id_foreign` (`category_id`);

--
-- Индексы таблицы `qaror_files`
--
ALTER TABLE `qaror_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `qaror_files_qaror_id_foreign` (`qaror_id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `role_task`
--
ALTER TABLE `role_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_task_task_id_foreign` (`task_id`),
  ADD KEY `role_task_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_user_id_foreign` (`user_id`),
  ADD KEY `tasks_category_id_foreign` (`category_id`),
  ADD KEY `tasks_status_id_foreign` (`status_id`),
  ADD KEY `tasks_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `task_status`
--
ALTER TABLE `task_status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `task_user`
--
ALTER TABLE `task_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_user_task_id_foreign` (`task_id`),
  ADD KEY `task_user_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_token_unique` (`token`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `api_users`
--
ALTER TABLE `api_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT для таблицы `long_texts`
--
ALTER TABLE `long_texts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `qarorlars`
--
ALTER TABLE `qarorlars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT для таблицы `qaror_files`
--
ALTER TABLE `qaror_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `role_task`
--
ALTER TABLE `role_task`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT для таблицы `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT для таблицы `task_status`
--
ALTER TABLE `task_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `task_user`
--
ALTER TABLE `task_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT для таблицы `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  ADD CONSTRAINT `files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_finished_user_id_foreign` FOREIGN KEY (`finished_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `qarorlars`
--
ALTER TABLE `qarorlars`
  ADD CONSTRAINT `qarorlars_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `qarorlars_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `qaror_files`
--
ALTER TABLE `qaror_files`
  ADD CONSTRAINT `qaror_files_qaror_id_foreign` FOREIGN KEY (`qaror_id`) REFERENCES `qarorlars` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `role_task`
--
ALTER TABLE `role_task`
  ADD CONSTRAINT `role_task_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `role_task_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`);

--
-- Ограничения внешнего ключа таблицы `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `tasks_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tasks_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `task_status` (`id`),
  ADD CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `task_user`
--
ALTER TABLE `task_user`
  ADD CONSTRAINT `task_user_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

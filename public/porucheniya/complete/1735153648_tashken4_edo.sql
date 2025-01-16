-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Дек 25 2024 г., 16:09
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
-- База данных: `tashken4_edo`
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
(1, 'Кирувчи Хат', 1, 150, 3, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(2, 'Чиқувчи хат', 1, 80, 3, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02');

-- --------------------------------------------------------

--
-- Структура таблицы `documents`
--

CREATE TABLE `documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `letter_number` varchar(255) NOT NULL,
  `received_date` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `document_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ministry_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status_type` enum('kiruvchi','chiquvchi') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `documents`
--

INSERT INTO `documents` (`id`, `title`, `letter_number`, `received_date`, `user_id`, `document_category_id`, `ministry_id`, `status_type`, `created_at`, `updated_at`) VALUES
(1, 'Мамажанов Анвардан келган мурожаат', 'йўқ', '2024-12-24 20:01:00', 1, 31, NULL, 'chiquvchi', '2024-12-24 15:03:39', '2024-12-24 15:03:53'),
(2, 'HAMKORBANK дан келган хат', '2797/13-0101', '2024-12-24 20:25:00', 1, 32, NULL, 'kiruvchi', '2024-12-24 15:26:03', '2024-12-24 15:26:03'),
(3, 'Хоким топшириғи', '2512', '2024-12-25 14:39:00', 1, 28, NULL, 'chiquvchi', '2024-12-25 09:40:09', '2024-12-25 09:40:09');

-- --------------------------------------------------------

--
-- Структура таблицы `document_categories`
--

CREATE TABLE `document_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `document_categories`
--

INSERT INTO `document_categories` (`id`, `name`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Qonun xujjatlar', NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(2, 'O‘zbekiston Respublikasining Konstitutsiyasi', 1, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(3, 'O‘zbekiston Respublikasining qonunlari', 1, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(4, 'O‘zbekiston Respublikasi Oliy Majlisi palatalarining qarorlari', 1, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(5, 'O‘zbekiston Respublikasi Prezidentining farmonlari va qarorlari', 1, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(6, 'O‘zbekiston Respublikasi Vazirlar Mahkamasining qarorlari', 1, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(7, 'Vazirliklar va idoralarning buyruqlari hamda qarorlari', 1, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(8, 'Yuqorida turuvchi tashkilotlar', NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(9, 'Oliy Majlis', 8, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(10, 'Prezident Administratsiyasi', 8, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(11, 'Vazirlar Mahkamasi', 8, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(12, 'Vazirlar idoras + Vazirliklar ro’yxatii', 8, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(13, 'Shahar Hokimligi', 8, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(14, 'Toshkent shahar tuman hokimliklari murojaatlari', NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(15, 'Uchtepa Hokimligi', 14, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(16, 'Bektemir Hokimligi', 14, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(17, 'Chilonzor Hokimligi', 14, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(18, 'Yashnobod Hokimligi', 14, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(19, 'Yakkasaroy Hokimligi', 14, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(20, 'Sergeli Hokimligi', 14, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(21, 'Yunusobod Hokimligi', 14, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(22, 'Olmazor Hokimligi', 14, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(23, 'Mirzo Ulug‘bek Hokimligi', 14, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(24, 'Shayxontohur Hokimligi', 14, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(25, 'Mirobod Hokimligi', 14, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(26, 'Yangihayot Hokimligi', 14, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(27, 'Kompaniya boshqaruv organlari topshiriqlari', NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(28, 'Yagona Aksiyador (Shahar Hokimi)', 27, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(29, 'Kuzatuv Kengashi', 27, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(30, 'Korxona va fuqorolar murojatlar', NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(31, 'Tadbirkorlar', 30, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(32, 'Banklar', 30, '2024-12-24 14:56:02', '2024-12-24 14:56:02');

-- --------------------------------------------------------

--
-- Структура таблицы `document_files`
--

CREATE TABLE `document_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document_id` bigint(20) UNSIGNED NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `document_files`
--

INSERT INTO `document_files` (`id`, `document_id`, `file_path`, `created_at`, `updated_at`) VALUES
(1, 1, 'public/documents/Lmf4ilyuxVc1t9qXAzTU35mGee6dgQNdkg22aX4m.jpg', '2024-12-24 15:03:39', '2024-12-24 15:03:39'),
(2, 2, 'public/documents/rWauN6tTjKOiBW7TNOE7JblGREnP8vC2to9hSN0s.pdf', '2024-12-24 15:26:03', '2024-12-24 15:26:03'),
(3, 3, 'public/documents/5RQEYDxDuXgsg0JdLMS2vvmQPkFcMkpHcSSFMQnC.docx', '2024-12-25 09:40:09', '2024-12-25 09:40:09');

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
(1, 61, 1, 'CamScanner 12-24-2024 20.01.jpg', NULL, '1735053102_CamScanner 12-24-2024 20.01.jpg', NULL, '2024-12-24 15:11:42', '2024-12-24 15:11:42'),
(2, 61, 1, 'VI-104-94-14-0-K24 Ташкент Инвест.pdf', NULL, '1735053454_VI-104-94-14-0-K24 Ташкент Инвест.pdf', NULL, '2024-12-24 15:17:34', '2024-12-24 15:17:34'),
(3, 61, 2, 'VI-104-94-14-0-K24 Ташкент Инвест.pdf', NULL, '1735054372_VI-104-94-14-0-K24 Ташкент Инвест.pdf', NULL, '2024-12-24 15:32:52', '2024-12-24 15:32:52');

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
(8, '2024_02_04_000454_create_document_categories_table', 1),
(9, '2024_02_04_005733_create_ministries_table', 1),
(10, '2024_02_04_005817_create_documents_table', 1),
(11, '2024_02_04_104551_create_long_texts_table', 1),
(12, '2024_02_04_141240_task_status_table', 1),
(13, '2024_02_04_141243_create_tasks_table', 1),
(14, '2024_02_25_211741_create_orders_table', 1),
(15, '2024_10_04_161950_create_files_table', 1),
(16, '2024_10_09_095841_create_role_task_table', 1),
(17, '2024_10_09_164232_create_task_user_table', 1),
(18, '2024_11_18_174639_create_qarorlars_table', 1),
(19, '2024_11_18_181234_create_qaror_files_table', 1),
(20, '2024_11_21_100022_add_amount_to_qarorlars_table', 1),
(21, '2024_12_24_191103_create_order_actions_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ministries`
--

CREATE TABLE `ministries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `ministries`
--

INSERT INTO `ministries` (`id`, `name`, `parent_id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Иқтисодиёт ва молия вазирлиги', NULL, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(2, 'шу жумладан, вазир ўринбосарлари сони', 1, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(3, 'Божхона қўмитаси', 1, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(4, 'шу жумладан, раис ўринбосарлари сони', 3, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(5, 'Давлат захираларини бошқариш қўмитаси', 1, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(6, 'шу жумладан, раис ўринбосарлари сони', 5, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(7, 'Ғазначилик хизмати қўмитаси', 1, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(8, 'шу жумладан, раис ўринбосарлари сони', 7, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(9, 'Кадастр агентлиги', 1, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(10, 'шу жумладан, директор ўринбосарлари сони', 9, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(11, 'Давлат асиллик даражаси назорати инспекцияси', 1, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(12, 'шу жумладан, бошлиқ ўринбосарлари сони', 11, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(13, 'Инвестициялар, саноат ва савдо вазирлиги', NULL, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(14, 'шу жумладан, вазир ўринбосарлари сони', 13, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(15, 'Хорижий инвестицияларни жалб этиш агентлиги', 13, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(16, 'шу жумладан, директор ўринбосарлари сони', 15, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(17, 'Камбағалликни қисқартириш ва бандлик вазирлиги', NULL, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(18, 'шу жумладан, вазир ўринбосарлари сони', 17, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(19, 'Қишлоқ хўжалиги вазирлиги', NULL, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(20, 'шу жумладан, вазир ўринбосарлари сони', 19, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(21, 'Ветеринария ва чорвачиликни ривожлантириш қўмитаси', 19, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(22, 'шу жумладан, раис ўринбосарлари сони', 21, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(23, 'Ипакчилик ва жун саноатини ривожлантириш қўмитаси', 19, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(24, 'шу жумладан, раис ўринбосарлари сони', 23, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(25, 'Ўсимликлар карантини ва ҳимояси агентлиги', 19, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(26, 'шу жумладан, директор ўринбосарлари сони', 25, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(27, 'Агросаноатни ривожлантириш агентлиги', 19, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(28, 'шу жумладан, директор ўринбосарлари сони', 27, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(29, 'Сув хўжалиги вазирлиги', NULL, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(30, 'шу жумладан, вазир ўринбосарлари сони', 29, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(31, 'Сув хўжалиги объектларини эксплуатация қилиш агентлиги', 29, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(32, 'шу жумладан, директор ўринбосарлари сони', 31, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(33, 'Сув хўжалиги объектлари хавфсизлигини ва сувдан фойдаланишни назорат қилиш инспекцияси', 29, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(34, 'шу жумладан, бошлиқ ўринбосарлари сони', 33, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(35, 'Қурилиш ва уй-жой коммунал хўжалиги вазирлиги', NULL, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(36, 'шу жумладан, вазир ўринбосарлари сони', 35, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(37, 'Қурилиш ва уй-жой коммунал хўжалиги соҳасида назорат қилиш инспекцияси', 35, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(38, 'шу жумладан, бошлиқ ўринбосарлари сони', 37, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(39, 'Транспорт вазирлиги', NULL, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(40, 'шу жумладан, вазир ўринбосарлари сони', 39, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(41, 'Автомобиль йўллари қўмитаси', 39, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(42, 'шу жумладан, раис ўринбосарлари сони', 41, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(43, 'Фуқаро авиацияси агентлиги', 39, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(44, 'шу жумладан, директор ўринбосарлари сони', 43, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(45, 'Транспорт назорати инспекцияси', 39, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(46, 'шу жумладан, бошлиқ ўринбосарлари сони', 45, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(47, 'Энергетика вазирлиги', NULL, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(48, 'шу жумладан, вазир ўринбосарлари сони', 47, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(49, 'Тоғ-кон саноати ва геология вазирлиги', NULL, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(50, 'шу жумладан, вазир ўринбосарлари сони', 49, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(51, 'Тоғ-кон саноати ва геология соҳасини назорат қилиш инспекцияси', 49, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(52, 'шу жумладан, бошлиқ ўринбосарлари сони', 51, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(53, 'Рақамли технологиялар вазирлиги', NULL, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(54, 'шу жумладан, вазир ўринбосарлари сони', 53, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(55, 'Космик тадқиқотлар ва технологиялар агентлиги', 53, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(56, 'шу жумладан, директор ўринбосарлари сони', 55, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(57, 'Ахборотлаштириш ва телекоммуникациялар соҳасида назорат инспекцияси', 53, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(58, 'шу жумладан, бошлиқ ўринбосарлари сони', 57, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(59, 'Экология, атроф-муҳитни муҳофаза қилиш ва иқлим ўзгариши вазирлиги', NULL, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(60, 'шу жумладан, вазир ўринбосарлари сони', 59, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(61, 'Туризм қўмитаси', 59, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(62, 'шу жумладан, раис ўринбосарлари сони', 61, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(63, 'Ўрмон хўжалиги агентлиги', 59, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(64, 'шу жумладан, директор ўринбосарлари сони', 63, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(65, 'Гидрометеорология хизмати агентлиги', 59, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(66, 'шу жумладан, директор ўринбосарлари сони', 65, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(67, 'Чиқиндиларни бошқариш ва циркуляр иқтисодиётни ривожлантириш агентлиги', 59, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(68, 'шу жумладан, директор ўринбосарлари сони', 67, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(69, 'Соғлиқни сақлаш вазирлиги', NULL, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(70, 'шу жумладан, вазир ўринбосарлари сони', 69, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(71, 'Санитария-эпидемиологик осойишталик ва жамоат саломатлиги қўмитаси', 69, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(72, 'шу жумладан, раис ўринбосарлари сони', 71, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(73, 'Фармацевтика тармоғини ривожлантириш агентлиги', 69, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(74, 'шу жумладан, директор ўринбосарлари сони', 73, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(75, 'Мактабгача ва мактаб таълими вазирлиги', NULL, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(76, 'шу жумладан, вазир ўринбосарлари сони', 75, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(77, 'Ихтисослаштирилган таълим муассасалари агентлиги', 75, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(78, 'шу жумладан, директор ўринбосарлари сони', 77, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(79, 'Олий таълим, фан ва инновациялар вазирлиги', NULL, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(80, 'шу жумладан, вазир ўринбосарлари сони', 79, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(81, 'Инновацион ривожланиш агентлиги', 79, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(82, 'шу жумладан, директор ўринбосарлари сони', 81, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(83, 'Билим ва малакаларни баҳолаш агентлиги', 79, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(84, 'шу жумладан, директор ўринбосарлари сони', 83, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(85, 'Спорт вазирлиги', NULL, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(86, 'шу жумладан, вазир ўринбосарлари сони', 85, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(87, 'Маданият вазирлиги', NULL, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(88, 'шу жумладан, вазир ўринбосарлари сони', 87, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(89, 'Миллатлараро муносабатлар ва хорижий мамлакатлар билан дўстлик алоқалари қўмитаси', 87, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(90, 'шу жумладан, раис ўринбосарлари сони', 89, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(91, 'Кинематография агентлиги', 87, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(92, 'шу жумладан, директор ўринбосарлари сони', 91, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(93, 'Адлия вазирлиги', NULL, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(94, 'шу жумладан, вазир ўринбосарлари сони', 93, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(95, '«Ўзархив» агентлиги', 93, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(96, 'шу жумладан, директор ўринбосарлари сони', 95, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(97, 'Персоналлаштириш агентлиги', 93, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(98, 'шу жумладан, директор ўринбосарлари сони', 97, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(99, 'Ташқи ишлар вазирлиги', NULL, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(100, 'шу жумладан, вазир ўринбосарлари сони', 99, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02');

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
(2, 'App\\Models\\User', 3),
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
(4, 'App\\Models\\User', 2);

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
(1, 61, 61, 1, NULL, 1, NULL, '2024-12-24 20:19:19', NULL, '2024-12-24 15:10:23', '2024-12-24 15:19:19'),
(2, 61, 61, 2, NULL, 1, NULL, '2024-12-24 20:35:51', NULL, '2024-12-24 15:30:49', '2024-12-24 15:35:51');

-- --------------------------------------------------------

--
-- Структура таблицы `order_actions`
--

CREATE TABLE `order_actions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(255) NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `order_actions`
--

INSERT INTO `order_actions` (`id`, `order_id`, `user_id`, `action`, `comment`, `created_at`, `updated_at`) VALUES
(1, 1, 61, 'Created', 'Order created and task status updated to Accepted!', '2024-12-24 15:10:23', '2024-12-24 15:10:23'),
(2, 1, 61, 'Completed', 'Служебный записка тайёрланиб маблағ қайтарилди', '2024-12-24 15:11:42', '2024-12-24 15:11:42'),
(3, 1, 61, 'Completed', 'Служебный записка тайёрланиб маблағ қайтарилди', '2024-12-24 15:17:34', '2024-12-24 15:17:34'),
(4, 1, 1, 'Admin Confirm', 'Order confirmed by admin', '2024-12-24 15:19:19', '2024-12-24 15:19:19'),
(5, 2, 61, 'Created', 'Order created and task status updated to Accepted!', '2024-12-24 15:30:49', '2024-12-24 15:30:49'),
(6, 2, 61, 'Completed', '2797/13-0101 сонли хат ўрнатилган тартибда кўриб чиқилди.', '2024-12-24 15:32:52', '2024-12-24 15:32:52'),
(7, 2, 1, 'Admin Confirm', 'Order confirmed by admin', '2024-12-24 15:35:51', '2024-12-24 15:35:51');

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
(1, 'permission.show', NULL, 'web', '2024-12-24 14:55:55', '2024-12-24 14:55:55'),
(2, 'permission.edit', NULL, 'web', '2024-12-24 14:55:55', '2024-12-24 14:55:55'),
(3, 'permission.add', NULL, 'web', '2024-12-24 14:55:55', '2024-12-24 14:55:55'),
(4, 'permission.delete', NULL, 'web', '2024-12-24 14:55:55', '2024-12-24 14:55:55'),
(5, 'roles.show', NULL, 'web', '2024-12-24 14:55:55', '2024-12-24 14:55:55'),
(6, 'roles.edit', NULL, 'web', '2024-12-24 14:55:55', '2024-12-24 14:55:55'),
(7, 'roles.add', NULL, 'web', '2024-12-24 14:55:55', '2024-12-24 14:55:55'),
(8, 'roles.delete', NULL, 'web', '2024-12-24 14:55:55', '2024-12-24 14:55:55'),
(9, 'user.show', NULL, 'web', '2024-12-24 14:55:55', '2024-12-24 14:55:55'),
(10, 'user.edit', NULL, 'web', '2024-12-24 14:55:55', '2024-12-24 14:55:55'),
(11, 'user.add', NULL, 'web', '2024-12-24 14:55:55', '2024-12-24 14:55:55'),
(12, 'monitoring.show', NULL, 'web', '2024-12-24 14:55:55', '2024-12-24 14:55:55');

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
(1, 'Super Admin', 'web', 'Super Admin', '2024-12-24 14:55:55', '2024-12-24 14:55:55'),
(2, 'Manager', 'web', 'Manager', '2024-12-24 14:55:55', '2024-12-24 14:55:55'),
(3, 'Employee', 'web', 'Employee', '2024-12-24 14:55:55', '2024-12-24 14:55:55'),
(4, 'Admin', 'web', NULL, '2024-12-24 14:55:55', '2024-12-24 14:55:55'),
(5, 'Boshqaruv ma\'muriyati', 'web', 'Администрация правления', '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(6, 'Moliya boshqarmasi', 'web', 'правление по финансам', '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(7, 'Yuridik bo\'lim', 'web', 'Юридический отдел', '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(8, 'Rivojlanish va rekonstruksiya', 'web', 'Девелопмент и Реновация', '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(9, 'Loyihalarni boshqarish', 'web', 'Управление проектами', '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(10, 'Aktivlarni boshqarish bo\'limi', 'web', 'Департамент по управлению активами', '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(11, 'Investitsiya boshqarmasi', 'web', 'правление по инвестициям', '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(12, 'Davlat organlari bilan aloqa bo\'limi', 'web', 'Отдел по связи с государственными органами', '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(13, 'Strategik rivojlanish', 'web', 'Стратегическое развитие', '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(14, 'Korporativ aloqalar bo\'limi', 'web', 'Отдел корпоративных отношений', '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(15, 'Kadrlar bo\'limi (HR)', 'web', 'HR', '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(16, 'Yo\'l va uy-joy kommunal qurilishi bo\'limi', 'web', 'департамент дорожного и жилищно-коммунального строительного', '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(17, 'Raqamli transformatsiya va axborot texnologiyalari', 'web', 'Цифровая Трансформация и информационная технология', '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(18, 'Metodologiya va qonunchilik bo\'limi', 'web', 'Департамент методалогии и нормотворчество', '2024-12-24 14:56:02', '2024-12-24 14:56:02');

-- --------------------------------------------------------

--
-- Структура таблицы `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `issue_date` datetime DEFAULT NULL,
  `planned_completion_date` datetime DEFAULT NULL,
  `attached_file` varchar(255) DEFAULT NULL,
  `attached_file_employee` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `assign_type` varchar(255) DEFAULT NULL,
  `reject_comment` text DEFAULT NULL,
  `reject_time` datetime DEFAULT NULL,
  `document_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tasks`
--

INSERT INTO `tasks` (`id`, `user_id`, `category_id`, `status_id`, `deleted_at`, `created_at`, `updated_at`, `poruchenie`, `issue_date`, `planned_completion_date`, `attached_file`, `attached_file_employee`, `note`, `assign_type`, `reject_comment`, `reject_time`, `document_id`, `role_id`) VALUES
(1, 1, 1, 4, NULL, '2024-12-24 15:06:00', '2024-12-24 15:17:34', NULL, '2024-12-24 20:04:00', '2024-12-26 00:00:00', NULL, NULL, 'Мамажонов Анварнинг 2024-йил 24-декабрдаги маблағ қайтариш тўғрисида келган мурожаатини ўрнатилган тартибда кўриб чиқилсин.', 'custom', 'Служебный записка тайёрланиб маблағ қайтарилди', '2024-12-24 20:17:34', 1, NULL),
(2, 1, 1, 4, NULL, '2024-12-24 15:28:53', '2024-12-24 15:32:52', NULL, '2024-12-24 20:26:00', '2024-12-27 11:11:00', NULL, NULL, 'Hamkorbank АТБ нинг 2024-йил 20-декабрдаги 2797/13-0101 сонли хати ўрнатилган тартибда кўриб чиқилсин.', 'custom', '2797/13-0101 сонли хат ўрнатилган тартибда кўриб чиқилди.', '2024-12-24 20:32:52', 2, NULL),
(3, 1, 2, 1, NULL, '2024-12-25 09:43:00', '2024-12-25 09:43:00', NULL, '2024-12-25 14:41:00', '2025-01-03 20:47:00', NULL, NULL, 'Рассмотрите в установленном порядке и подготовьте ответ', 'custom', NULL, NULL, 3, NULL);

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
(1, 'Active', NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(2, 'Canceled', NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(3, 'Accepted', NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(4, 'Completed', NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(5, 'Deleted', NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(6, 'ORDER_ACTIVE', NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(7, 'TIME_IS_OVER', NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(8, 'ADMIN_REJECT', NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(9, 'XODIM_REJECT', NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02');

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
(2, 1, 61, '2024-12-24 15:08:09', '2024-12-24 15:08:09'),
(3, 2, 61, '2024-12-24 15:28:53', '2024-12-24 15:28:53'),
(4, 3, 8, '2024-12-25 09:43:00', '2024-12-25 09:43:00');

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
(1, 'Shakirov Baxrom Askaralievich', 'superadmin@example.com', NULL, '$2y$10$mAcKDdhcVkxtIDoQSEBlEuC5WXtaKiitlB6g4296pCEhZzlGzyyqy', 'light', 0, '+998999992233', 'I am a super admin', 'Uzbekistan', '2004-03-30', NULL, NULL, NULL, 'fbyKeYwozmZMhLVVL1ILXUqOXJVT5dW1agKvCE1xiT9V87EyH8XkSLpPCqJd', NULL, '2024-12-24 14:55:55', '2024-12-25 08:22:03'),
(2, 'Admin', 'admin@gmail.com', NULL, '$2y$10$L2AtmNlyKYq/EGhx5RJzhuaaXGjA06HCV6FkcAOPWNGoEIkwy4/PO', 'default', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:56', '2024-12-24 14:55:56'),
(3, 'Manager', 'manager@example.com', NULL, '$2y$10$7FgsCWjQqo8bynTXOYifWe8vZCmf45GxAXzec3oPw6XjgsQsQv5oi', 'default', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:56', '2024-12-24 14:55:56'),
(4, 'Employee', 'employee@example.com', NULL, '$2y$10$sWoa8tA0pkqdWyi4uyjkj.oMoYP5RLWTADstl.iugHVWfGO5ecgoG', 'default', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:56', '2024-12-24 14:55:56'),
(5, 'Shakirov Baxrom Askaralievich', 'baxrom.shakirov@toshkentinevst.uz', NULL, '$2y$10$XLwtOHIyPYk7EA9.VL1hCOJfMkDijF7Iae1CdjgG31SW4tU4AZeE2', 'default', 0, '+998 (95) 877-88-00', 'I.O. Predsedatelya pravleniya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:56', '2024-12-24 14:55:56'),
(6, 'Gurko Aleksandr ', 'aleksandr.gurko@toshkentinevst.uz', NULL, '$2y$10$6yTHjPXjC5c8sEI2UnJNweymx1Bf1/nRF9YNYgzwCELaBrxwLM50u', 'default', 0, ' + 998 (90) 809-94-88', 'Perviy zamestitel Predsedatelya pravleniya po po sifrovoy transformasii i informasionnim texnologiyam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:56', '2024-12-24 14:55:56'),
(7, 'Otaxonova Nargizaxon Ganievna', 'nargizaxon.otaxonova@toshkentinevst.uz', NULL, '$2y$10$5ZqfcGxhKZIo8JIZ3.u8G.j.eUn.GRj6FUrrGZ.sRg.LBdjTpLMPe', 'default', 0, ' + 998 (97) 740-18-36', 'Zamestitel predsedatelya pravleniya po upravleniyu proektami', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:56', '2024-12-24 14:55:56'),
(8, 'Ryabov Nikita Vladimirovich', 'nikita.ryabov@toshkentinevst.uz', NULL, '$2y$10$q6iO8TFDLx1LJW4znLlibuwAWemNEBQRiXD4TYBZ/iZTd5gkD3FbS', 'default', 0, ' + 998 (97) 009-45-04', 'Zamestitel predsedatelya pravleniya \npo investisiyam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:56', '2024-12-24 14:55:56'),
(9, 'Kodirov Rustam Shuxratovich', 'rustam.kodirov@toshkentinevst.uz', NULL, '$2y$10$K9h8LxJyDKTYrQ2jhUioQOTruybwhHKeUHk5XVOlLTWKR99HmC0tG', 'default', 0, '+998 (90) 979-41-00', 'Zamestitel Predsedatelya pravleniya po strategicheskomu razvitiyu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:56', '2024-12-24 14:55:56'),
(10, 'Peregudov Andrey Nikolaevich', 'andrey.peregudov@toshkentinevst.uz', NULL, '$2y$10$UU0ghLky4Vt5iZ/b9dVA5.aUPIQyfXTTalPpePlNw4/KWb0HD1XcS', 'default', 0, ' + 998 (50) 103-11-18', 'Zamestitel predsedatelya pravleniya\npo developmentu i renovasii – rukovoditel Proektnogo ofisa «Koordinasiya stroitelstva»', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:57', '2024-12-24 14:55:57'),
(11, 'Rajabov Rustam Baxtiyarovich', 'rustam.rajabov@toshkentinevst.uz', NULL, '$2y$10$9BUbdMi3s71DKX2smkfNGO8En85eOA/cO/qiRpDxifKg0e4anaOZC', 'default', 0, ' + 998 (90) 788-38-83', 'Sovetnik Nablyudatelnogo soveta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:57', '2024-12-24 14:55:57'),
(12, 'Baraev Murot Abduljanovich', 'murot.baraev@toshkentinevst.uz', NULL, '$2y$10$0hwhmIXlw8UbQJc1HexHEOO8fIXjLxsuXQhD5W9WyHEuBd47ug1Hm', 'default', 0, '+998 (88) 100-80-80', 'Rukovoditel \nAdministrasii pravleniya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:57', '2024-12-24 14:55:57'),
(13, 'Axmedov Javoxir ', 'javoxir.axmedov@toshkentinevst.uz', NULL, '$2y$10$CrckvpeOuEzjwia99ShdneIaUSgiM2HGI6z4rciQtnTKyxYuFSka6', 'default', 0, '+998 (90) 122-47-22', 'Vedushiy spesialist Administrativno-xozyaystvennogo otdela Administrasii Pravleniya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:57', '2024-12-24 14:55:57'),
(14, 'Sagdullaev Sadirxuja Sobit', 'sadirxuja.sagdullaev@toshkentinevst.uz', NULL, '$2y$10$.3GMgvsiPLolVTAo0aDvpuvAGtDKbUczWnxL7VGLQvXfCICKNZTxC', 'default', 0, '+998 (94) 701-11-11', 'Vedushiy spesialist Administrativno-xozyaystvennogo otdela Administrasii Pravleniya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:57', '2024-12-24 14:55:57'),
(15, 'Abdullaev Abdulaziz ', 'abdulaziz.abdullaev@toshkentinevst.uz', NULL, '$2y$10$ACDjzDOv3Zl2tSdFWOQCNuGAW92h2EjoOSzTxnS1z.f2.p/IsMska', 'default', 0, '+998 (97) 712-00-11', 'Vedushiy spesialist Administrativno-xozyaystvennogo otdela Administrasii Pravleniya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:57', '2024-12-24 14:55:57'),
(16, 'Abdusattorov Abdulaziz Davron', 'abdulaziz.abdusattorov@toshkentinevst.uz', NULL, '$2y$10$wmcfoZeH2LDPAhXfJNI4Ye6Wv/QBVqUfquFQwNMx2ycWLb77TPRCy', 'default', 0, ' +998 (33) 308-80-99', 'Vedushiy spesialist IT otdela\nAdministrasii Pravleniya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:57', '2024-12-24 14:55:57'),
(17, 'Turgunov Eldorbek Toxirjon', 'eldorbek.turgunov@toshkentinevst.uz', NULL, '$2y$10$Dk0.EhexJbHEsOabcDm7HO9FcdzWradZWNPWnNOYbaVUoHI56/SBS', 'default', 0, ' + 998 (99) 830-12-57', 'Glavniy spesialist Otdela po svyazi s obshestvennostyu Administrasii pravleniya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:57', '2024-12-24 14:55:57'),
(18, 'Kochergina Ekaterina Sergeevna', 'ekaterina.kochergina@toshkentinevst.uz', NULL, '$2y$10$8unFyjsahhAaJqRX3istC.juGma1xCv1DAa0L5oCP686QXF9O2HoC', 'default', 0, '+998 (91) 782-09-67', 'Direktor departamenta po sifrovim texnologiyam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:57', '2024-12-24 14:55:57'),
(19, 'Valiev Farrux ', 'farrux.valiev@toshkentinevst.uz', NULL, '$2y$10$GcZVew2jM7.Gu9Bg5w.5huFIF4EowxGe5rScajZNFBRlhK8rXRTN.', 'default', 0, ' +998 (90) 324-59-59', 'Zamestitel direktora departamenta po sifrovim texnologiyam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:57', '2024-12-24 14:55:57'),
(20, 'Alekseev Nikolay Yurevich', 'nikolay.alekseev@toshkentinevst.uz', NULL, '$2y$10$fLfLjo.tvKME1CV/ZyNEo.hhC17QteTOJW9RGo2ZCx7QUWE0zaxIO', 'default', 0, '`+998 (99) 099-76-31', 'Zamestitel rukovoditelya proektnogo ofisa Proektniy ofis po upravleniyu proektami sifrovoy transformasii v transportnom komplekse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:57', '2024-12-24 14:55:57'),
(21, 'Tulkunov Shaxzod ', 'shaxzod.tulkunov@toshkentinevst.uz', NULL, '$2y$10$aZDpXanHMAdlvXCI6HlUwOWmq61NwLbDBBoZKMla8ybWukDvH2ueu', 'default', 0, '+998 (97) 441-86-88', 'Glavniy spesialist - transportniy injener Proektnogo ofisa po upravleniyu proektami sifrovoy transformasii v transportnom komplekse Departamenta po sifrovim texnologiyam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:58', '2024-12-24 14:55:58'),
(22, 'Mirzaev Baxtiyor Muxitjonovich', 'baxtiyor.mirzaev@toshkentinevst.uz', NULL, '$2y$10$DQ9DRs.zEWVlmU8Fr6KXeeKsPI7cB5DNge67oCFnNgODGZ47fPaWO', 'default', 0, ' + 998 (90) 002-20-92', 'Nachalnik otdela finansovogo planirovaniya i analiza', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:58', '2024-12-24 14:55:58'),
(23, 'Abduraximov Faxriddin Karimovich', 'faxriddin.abduraximov@toshkentinevst.uz', NULL, '$2y$10$IGaUBBaUWr90n2TPzkt64ebK/ZbvpzfA5VphNzPUmYbK7RpUKQATG', 'default', 0, ' + 998 (99) 409-98-18', 'Vr.i.o. glavnogo buxgaltera Otdela buxgalterskogo ucheta i otchetnosti - Glavniy spesialist Otdela finansovogo planirovaniya i analiza', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:58', '2024-12-24 14:55:58'),
(24, 'Aydashev Furkat Gulamovich', 'furkat.aydashev@toshkentinevst.uz', NULL, '$2y$10$LfabBPpyjN29J08SgBpAse.q3.dE298E1goRI/QooAFztmP/rABzq', 'default', 0, '+998 (91) 798-86-50', 'Direktor departamenta organizasii dorojnogo i jilishno-kommunalnogo stroitelstva', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:58', '2024-12-24 14:55:58'),
(25, 'Atajanov Umid Sultanovich', 'umid.atajanov@toshkentinevst.uz', NULL, '$2y$10$FuOv.ojimhg4QqkAoqa0X.FkO0Z8Ceo7mLPwQZbrCBJXFEa4JSs5K', 'default', 0, ' + 998 (95) 153-71-91', 'Zamestitel direktora departamenta organizasii dorojnogo i jilishno-kommunalnogo stroitelstva', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:58', '2024-12-24 14:55:58'),
(26, 'Suleymanov Shoxrux Shuxratovich', 'shoxrux.suleymanov@toshkentinevst.uz', NULL, '$2y$10$9Ra0Omp14y.D0aOf0J34punslsEIa1lcDVaZACnP4pYAoFD0SZplS', 'default', 0, ' +998 (95) 121-55-44', 'Rukovoditel proekta Otdela organizasii dorojnogo stroitelstva Departamenta organizasii dorojnogo i jilishno-kommunalnogo stroitelstva', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:58', '2024-12-24 14:55:58'),
(27, 'Eminov Emin Nurgilidjovich', 'emin.eminov@toshkentinevst.uz', NULL, '$2y$10$dWmeBPl3BE/H/SYIbx/Bi.nYB8s23RG5Qir.TEEQ1V1KZYEecXFv6', 'default', 0, '`+998 (93) 746-74-72', 'Glavniy spesialist Otdela organizasii dorojnogo stroitelstva Departamenta organizasii dorojnogo i jilishno-kommunalnogo stroitelstva', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:58', '2024-12-24 14:55:58'),
(28, 'Soliev Iskandar Jaxongir', 'iskandar.soliev@toshkentinevst.uz', NULL, '$2y$10$e9yJ3.pD7wgitCdwTcZzseOZYDsOsLibYIHJmo/YtRWOfYARvhZNG', 'default', 0, ' + 998 (99) 430-11-77', 'Menedjer proekta Otdela parkovix zon i obshestvennix prostranstv Departamenta gorodskogo planirovaniya i komfortnoy sredi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:58', '2024-12-24 14:55:58'),
(29, 'Karimov Ilyas Talgatovich', 'ilyas.karimov@toshkentinevst.uz', NULL, '$2y$10$1RbYFgB8G6MVpOySnvQh4uAg/KXCTjzfvNVJBDHK1OnT/JIyLuncC', 'default', 0, ' + 998 (77) 080-77-03', 'Direktor departamenta stroitelstva i renovasii', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:58', '2024-12-24 14:55:58'),
(30, 'Xasanova Rushana Rinnatovna', 'rushana.xasanova@toshkentinevst.uz', NULL, '$2y$10$KRA.GgocM0w.71yAEYp99eUwJsnPlHE5b9NYBxe3PnvRx73BrsgZ.', 'default', 0, ' + 998 (90) 968-79-97', 'I.o. Nachalnika otdela formirovaniya i soprovojdeniya developerskix proektov Departamenta stroitelstv i renovasii', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:58', '2024-12-24 14:55:58'),
(31, 'Xudoyarov Rustam Isamiddinovich', 'rustam.xudoyarov@toshkentinevst.uz', NULL, '$2y$10$824vw5ZOZbQOZKyKr3OHmeZ8EPfS1qUsWHJWryl1SK1CNOBC1ckyy', 'default', 0, '+998 (99) 407-20-25', 'Menedjer proekta \nOtdela formirovaniya i soprovojdeniya developerskix proektov Departamenta stroitelstv i renovasii', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:59', '2024-12-24 14:55:59'),
(32, 'Abdurashitov Enver Islyamovich', 'enver.abdurashitov@toshkentinevst.uz', NULL, '$2y$10$93S3cMY84mVDK0gX.f5RzetJYKpbITd3i/eJiI4sJWTCVHZHrHx5a', 'default', 0, '+998 (93) 182-06-33', 'Menedjer proekta \nOtdela formirovaniya i soprovojdeniya developerskix proektov Departamenta stroitelstv i renovasii', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:59', '2024-12-24 14:55:59'),
(33, 'Gapirova Zilola Shavkatovna', 'zilola.gapirova@toshkentinevst.uz', NULL, '$2y$10$ED2qQ3HB3D1pPRLNrR3LP.yKyre36C/vTWZZtpgtDBCU5J73KOs6O', 'default', 0, ' + 998 (97) 774-00-36', 'Glavniy spesialist (Administrator) \nOtdela formirovaniya i soprovojdeniya developerskix proektov Departamenta stroitelstv i renovasii', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:59', '2024-12-24 14:55:59'),
(34, 'Ernazarov Adilbek Saparbay', 'adilbek.ernazarov@toshkentinevst.uz', NULL, '$2y$10$SBIA0ADyq9PQime2oA9tRegyNuIxiFbXHG83cO/aGj3GE9W/4kpiO', 'default', 0, ' + 998 (97) 357-76-66', 'Menedjer proekta \notdela formirovaniya i soprovojdeniya developerskix proektov Departamenta stroitelstv i renovasii', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:59', '2024-12-24 14:55:59'),
(35, 'Axmedov Ja\'far Raximjon', 'ja\'far.axmedov@toshkentinevst.uz', NULL, '$2y$10$ZsFORhBi4rbk/..DQSTKyuYnJUVTpt2Z8hUk0Hc1HyW.WFWdgAsfO', 'default', 0, '`+998 (99) 800-76-27', 'Glavniy spesialist Otdela rasseleniya vetxogo jilya Departamenta stroitelstva i renovasii', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:59', '2024-12-24 14:55:59'),
(36, 'Sagdullaev Sayfulla Lutfullaevich', 'sayfulla.sagdullaev@toshkentinevst.uz', NULL, '$2y$10$2/wJcraBnxi8Z1/WBjFQiunPgHWyx5PIR8Mk6OiHM2FugCilaW7ti', 'default', 0, '`+998 (97) 470-07-16', 'Glavniy spesialist Otdela rasseleniya vetxogo jilya Departamenta stroitelstva i renovasii', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:59', '2024-12-24 14:55:59'),
(37, 'Ubaydullaev Xotam Xabibullaevich', 'xotam.ubaydullaev@toshkentinevst.uz', NULL, '$2y$10$2ny6zakmdwL.gzQavpoYx.2vTXrnqa6Fyz5k6GpWFZNS5pVWh7UMS', 'default', 0, '`+998 (90) 956-37-55', 'Glavniy spesialist Otdela rasseleniya vetxogo jilya Departamenta stroitelstva i renovasii', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:59', '2024-12-24 14:55:59'),
(38, 'Xalikov Alisher Abdulazizovich', 'alisher.xalikov@toshkentinevst.uz', NULL, '$2y$10$nK31o0dqNeICVrifpf0Sc.OLYF4GDddoEFUMXMtE4xxVjZuHkat/u', 'default', 0, '`+998 (99) 866-48-28', 'Glavniy spesialist Otdela rasseleniya vetxogo jilya Departamenta stroitelstva i renovasii', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:59', '2024-12-24 14:55:59'),
(39, 'Umarbekov Adxambek Zokirbek', 'adxambek.umarbekov@toshkentinevst.uz', NULL, '$2y$10$o9y39LkH5IPSiXcFkLd9eO3v7ec9SEvzfPrO8Sy5uemjf5ri8uuPa', 'default', 0, '`+998 (97) 730-61-69', 'Vedushiy  spesialist Otdela rasseleniya vetxogo jilya Departamenta stroitelstva i renovasii', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:59', '2024-12-24 14:55:59'),
(40, 'Xashimov Dilshad Sunnat', 'dilshad.xashimov@toshkentinevst.uz', NULL, '$2y$10$nv8j/B5gE8lWGwW1WzYjwe7FZze3T0u4pgz7b8tVsYHeXA.PM8ZFu', 'default', 0, ' + 998 (97) 705-03-13', 'Vedushiy  spesialist Otdela rasseleniya vetxogo jilya Departamenta stroitelstva i renovasii', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:55:59', '2024-12-24 14:55:59'),
(41, 'Baymuxamedov Iskandar Baxodirovich', 'iskandar.baymuxamedov@toshkentinevst.uz', NULL, '$2y$10$785SczdzpGXiipD2pwdmmuoaqD05BA0raz/hDk/OuD.5sp8V7DLp.', 'default', 0, ' + 998 (99) 880-98-17', 'Glavniy spesialist \nOtdela gradostroitelnogo kontrolya Departamenta stroitelstva i renovasii', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:56:00', '2024-12-24 14:56:00'),
(42, 'Zaripova Nazima ', 'nazima.zaripova@toshkentinevst.uz', NULL, '$2y$10$OYj8KUCoPO9Ax.mKv6k7l.di4LwT88mBBAiKr8R/Bv98FITFl3fkK', 'default', 0, '`+998 (90) 931-04-30', 'Spesialist 1-kategorii\nOtdela formirovaniya i soprovojdeniya developerskix proektov Departamenta stroitelstv i renovasii', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:56:00', '2024-12-24 14:56:00'),
(43, 'Juraboev Ravshan Rustam', 'ravshan.juraboev@toshkentinevst.uz', NULL, '$2y$10$gGXMT413dCgmIeJPzcfMxuWPa6WbaWyc26ovof1is7GJCx5q4UduS', 'default', 0, '`+998 (95) 171-97-98', 'Spesialist Otdela formirovaniya i soprovojdeniya developerskix proektov Departamenta stroitelstv i renovasii', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:56:00', '2024-12-24 14:56:00'),
(44, 'Yunusov Djaxangir Baxodirovich', 'djaxangir.yunusov@toshkentinevst.uz', NULL, '$2y$10$/KvTHvxYh3yfXl/OWhBtcej1klGvUn/aNkh5scS86V6ZBGBk4dfyO', 'default', 0, ' + 998 (99) 832-72-67', 'Direktor departamenta \npo realizasii proektov promishlennosti \ni logistiki', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:56:00', '2024-12-24 14:56:00'),
(45, 'Fayziev Axror Xasanbaevich', 'axror.fayziev@toshkentinevst.uz', NULL, '$2y$10$Yo.cfdjSBhnq/Fw2aCvDCevbM3VBhHfc/WZQEJ.lFBMb4CLzM02vy', 'default', 0, ' + 998 (99) 110-93-40', 'Administrator zamestitelya predsedatelya pravleniya\npo upravleniyu promishlennim proektam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:56:00', '2024-12-24 14:56:00'),
(46, 'Mamadaliev Alisher Muradilovich', 'alisher.mamadaliev@toshkentinevst.uz', NULL, '$2y$10$kvgPYGba7QBe1XCGEGMPJ.zT8syJxs5hM9lg5ynkiQFDiJ2AozMwK', 'default', 0, '+998 (94) 437-89-11', 'Rukovoditel Proektnogo ofisa po upravleniyu proektov tyajeloy\npromishlennosti Departamenta \npo realizasii proektov promishlennosti \ni logistiki', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:56:00', '2024-12-24 14:56:00'),
(47, 'Murodov Akmal Boykobilovich', 'akmal.murodov@toshkentinevst.uz', NULL, '$2y$10$jg/hsFLGNg8rGORGxcrerOi3zQATLIc3jZWPogtEWhIreNIzyCSNy', 'default', 0, ' + 998 (90) 926-05-07', 'Glavniy spesialist \nProektnogo ofisa po upravleniyu proektov tyajeloy\npromishlennosti Departamenta \npo realizasii proektov promishlennosti \ni logistiki', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:56:00', '2024-12-24 14:56:00'),
(48, 'Tursunov Abdulnosir Normurod', 'abdulnosir.tursunov@toshkentinevst.uz', NULL, '$2y$10$YN57UWEtzoGTxjQslwmMhuAgNXwV46WtcocWLCO2aCAOXRVJYknTq', 'default', 0, ' + 998 (99) 817-11-80', 'Glavniy spesialist \nProektnogo ofisa po upravleniyu proektov tyajeloy\npromishlennosti Departamenta \npo realizasii proektov promishlennosti \ni logistiki', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:56:00', '2024-12-24 14:56:00'),
(49, 'Mamatkulov Amirxon Rustam', 'amirxon.mamatkulov@toshkentinevst.uz', NULL, '$2y$10$uUVKr.hJANO1nq/oKK6GIeOHeqT2vMzK9iyWkQifnX5jpWZ7F8IVO', 'default', 0, ' + 998 (99) 518-88-81', 'Glavniy spesialist \nProektnogo ofisa po upravleniyu proektov tyajeloy\npromishlennosti Departamenta \npo realizasii proektov promishlennosti \ni logistiki', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:56:00', '2024-12-24 14:56:00'),
(50, 'Kobilov Odiljon Komiljon', 'odiljon.kobilov@toshkentinevst.uz', NULL, '$2y$10$MI1RGtV5kuTNGLD3YohhK.lvgmtsXc8o8dsD.hE6rpn9X57xhWeq6', 'default', 0, '`+998 (90) 992-29-77', 'Glavniy spesialist \nProektnogo ofisa po upravleniyu proektov tyajeloy\npromishlennosti Departamenta \npo realizasii proektov promishlennosti \ni logistiki', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:56:00', '2024-12-24 14:56:00'),
(51, 'Karimov Baxodir Baxtiyor', 'baxodir.karimov@toshkentinevst.uz', NULL, '$2y$10$kB326rKH2211P9MBo/hsJOXd/OcIAhwiLw3VLUIBF7TsijT6PIVaK', 'default', 0, ' + 998 (93) 534-21-76', 'Glavniy spesialist \nProektnogo ofisa po upravleniyu proektov tyajeloy\npromishlennosti Departamenta \npo realizasii proektov promishlennosti \ni logistiki', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:56:01', '2024-12-24 14:56:01'),
(52, 'Iskandarov Dilshod Farxod', 'dilshod.iskandarov@toshkentinevst.uz', NULL, '$2y$10$B2sSZhGUgmnnsIu6s8UtFOsPnh7p7ZWU4XzUq5e3fi9z9zbfMr6GC', 'default', 0, ' + 998 (90) 970-45-67', 'Menedjer proekta \nOtdela analiza proektov i riskov', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:56:01', '2024-12-24 14:56:01'),
(53, 'Orifjonov Islom Muminjon', 'islom.orifjonov@toshkentinevst.uz', NULL, '$2y$10$nPoC66jT2oCngQ9HaafZ5uFUDUfqy4b4HfWfiNm44UZe98r5TcLNC', 'default', 0, ' + 998 (90) 917-72-27', 'Nachalnik otdela\npo proektam gosudarstvenno-chastnogo partnerstva', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:56:01', '2024-12-24 14:56:01'),
(54, 'Bibutova Shaxlo Sadullaevna', 'shaxlo.bibutova@toshkentinevst.uz', NULL, '$2y$10$YSpNMnvtnWqRqEv.RpO5/eTQ5u/Wn20cJ4D.YKeXsKjXpbEaoxRmi', 'default', 0, ' + 998 (88) 788-76-09', 'Direktor departamenta metodologii i normotvorchestva', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:56:01', '2024-12-24 14:56:01'),
(55, 'Maxmudov Xurshid Muminjonovich', 'xurshid.maxmudov@toshkentinevst.uz', NULL, '$2y$10$iNudKFyIDh93kC8Z9i1V6eKvmsRraOlMDr3CyFof5GjO/rPeTg1OS', 'default', 0, ' + 998 (90) 907-64-60', 'Zamestitel direktora Departamenta metodologii i normotvorchestva', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:56:01', '2024-12-24 14:56:01'),
(56, 'Abduazimov Shoxabbos ', 'shoxabbos.abduazimov@toshkentinevst.uz', NULL, '$2y$10$v65ltDMf3jfp36ONBDiWY.PmlTtuvFEBM6.KOdH9jZRxoFAAZHXhK', 'default', 0, '`+998 (91) 290-00-03', 'Glavniy spesialist Departamenta metodologii i normotvorchestva', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:56:01', '2024-12-24 14:56:01'),
(57, 'Ochilov Xusen Rashidovich', 'xusen.ochilov@toshkentinevst.uz', NULL, '$2y$10$rRhyuy7XQzdYirhZewrUZ.rHziBCZe4FzEDJhJ550Sd2O86blfvDa', 'default', 0, '`+998 (91) 137-04-02', 'Nachalnik yuridicheskogo otdela', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:56:01', '2024-12-24 14:56:01'),
(58, 'Fayzullaev Omonulla Asatullaevich', 'omonulla.fayzullaev@toshkentinevst.uz', NULL, '$2y$10$zqpzEMP9SQfiRh3tcW/nx.2yFXrxOKoxnirw22N.eyLyRP/ZdHi9i', 'default', 0, '`+998 (99) 847-59-51', 'Zamestitel nachalnika yuridicheskogo otdela', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:56:01', '2024-12-24 14:56:01'),
(59, 'Mingalieva Aliya Rapikovna', 'aliya.mingalieva@toshkentinevst.uz', NULL, '$2y$10$P5uRR/Mj5xOrSbu4rR347.TmkCoWYV/YpoLC2ygslsgq5gX4v.AVe', 'default', 0, ' + 998 (93) 381-02-71', 'Rukovoditel Slujbi \nrazvitiya chelovecheskix resursov (HR)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:56:01', '2024-12-24 14:56:01'),
(60, 'Ten Evgeniya ', 'evgeniya.ten@toshkentinevst.uz', NULL, '$2y$10$uxrYK3IUywD83hquTqXSxelrHJBOJrlcMUNa7cxn6NdLi7tQQgIzy', 'default', 0, ' + 998 (90) 051-24-02', 'Nachalnik Otdela \npo korporativnim otnosheniyam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:56:01', '2024-12-24 14:56:01'),
(61, 'Kobulov Sirojiddin Murod', 'sirojiddin.kobulov@toshkentinevst.uz', NULL, '$2y$10$3A9dG01TTTUIVSD.7NccpegPpa0PGzlR9x6Nt2bdaA0MQGQ9ZFS..', 'default', 0, '+998 (90) 120-41-52', 'Spesialist 1-kategorii \nOtdela po korporativnim otnosheniyam', NULL, NULL, NULL, NULL, NULL, 'GbZsHO2igdcxwKfPwup9Ez3eguhjPjvKbIEIAJWQUDOabqSSa78wtiY7X2vv', NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(62, 'Boyxanov Maxammadyusuf Otabek', 'maxammadyusuf.boyxanov@toshkentinevst.uz', NULL, '$2y$10$sidYis3UnrBnpseABMFT5OC8HHaZXBYWsADsVrGBFStjirIImMh7m', 'default', 0, ' + 998 (99) 033-11-11', 'Glavniy spesialist \nUpravleniya po rabote s aktivami', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(63, 'Raupov Muhammad Sayyidaxmat o\'gli', 'muhammad.raupov@toshkentinevst.uz', NULL, '$2y$10$YrGqCYtRY5Q8ANo7Kvez..j7xdYs4Q9197E9FDHZaP7DWUR26fNPa', 'default', 0, NULL, 'Toshkent taraqgiyot jamg\'armasi moliyaviy nazorat bo\'limi mutaxassisi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(64, 'Gulomov Abror Olimjon', 'abror.gulomov@toshkentinevst.uz', NULL, '$2y$10$eaxhm/CtzxldPKcxsEhauOkIc1OKJ4a./V08C8fSFjAV./PcBt.O.', 'default', 0, ' + 998 (93) 592-35-75', 'Konsultant (po farmasevticheskomu napravleniyu)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02'),
(65, 'aaaaempi', 'azik@example.com', NULL, '$2y$10$FsL37vtfNz6KjrFtQ32t8.qBu0NDGzH9ntZkpCr1eX8WTt3D.llJ2', 'default', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 14:56:02', '2024-12-24 14:56:02');

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
-- Индексы таблицы `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_user_id_foreign` (`user_id`),
  ADD KEY `documents_document_category_id_foreign` (`document_category_id`),
  ADD KEY `documents_ministry_id_foreign` (`ministry_id`);

--
-- Индексы таблицы `document_categories`
--
ALTER TABLE `document_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_categories_parent_id_foreign` (`parent_id`);

--
-- Индексы таблицы `document_files`
--
ALTER TABLE `document_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_files_document_id_foreign` (`document_id`);

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
-- Индексы таблицы `ministries`
--
ALTER TABLE `ministries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ministries_parent_id_foreign` (`parent_id`);

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
-- Индексы таблицы `order_actions`
--
ALTER TABLE `order_actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_actions_order_id_foreign` (`order_id`),
  ADD KEY `order_actions_user_id_foreign` (`user_id`);

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
  ADD KEY `tasks_document_id_foreign` (`document_id`),
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `document_categories`
--
ALTER TABLE `document_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT для таблицы `document_files`
--
ALTER TABLE `document_files`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `long_texts`
--
ALTER TABLE `long_texts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `ministries`
--
ALTER TABLE `ministries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `order_actions`
--
ALTER TABLE `order_actions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `qarorlars`
--
ALTER TABLE `qarorlars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `qaror_files`
--
ALTER TABLE `qaror_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `role_task`
--
ALTER TABLE `role_task`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `task_status`
--
ALTER TABLE `task_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `task_user`
--
ALTER TABLE `task_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- Ограничения внешнего ключа таблицы `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_document_category_id_foreign` FOREIGN KEY (`document_category_id`) REFERENCES `document_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `documents_ministry_id_foreign` FOREIGN KEY (`ministry_id`) REFERENCES `ministries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `documents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ограничения внешнего ключа таблицы `document_categories`
--
ALTER TABLE `document_categories`
  ADD CONSTRAINT `document_categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `document_categories` (`id`) ON DELETE SET NULL;

--
-- Ограничения внешнего ключа таблицы `document_files`
--
ALTER TABLE `document_files`
  ADD CONSTRAINT `document_files_document_id_foreign` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  ADD CONSTRAINT `files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `ministries`
--
ALTER TABLE `ministries`
  ADD CONSTRAINT `ministries_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `ministries` (`id`) ON DELETE SET NULL;

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
-- Ограничения внешнего ключа таблицы `order_actions`
--
ALTER TABLE `order_actions`
  ADD CONSTRAINT `order_actions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_actions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

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
  ADD CONSTRAINT `tasks_document_id_foreign` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE SET NULL,
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

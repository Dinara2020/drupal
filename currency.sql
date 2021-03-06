-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 21 2021 г., 15:56
-- Версия сервера: 8.0.19
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `drupal`
--

-- --------------------------------------------------------

--
-- Структура таблицы `currency`
--

CREATE TABLE `currency` (
  `id` int NOT NULL,
  `code` varchar(3) NOT NULL,
  `rate` float DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '0',
  `updated` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `currency`
--

INSERT INTO `currency` (`id`, `code`, `rate`, `active`, `updated`) VALUES
(2, 'AED', 4.38873, 0, 1616330288),
(3, 'AFN', 92.3667, 0, 1616330288),
(4, 'ALL', 123.369, 0, 1616330288),
(5, 'AMD', 630.726, 0, 1616330288),
(6, 'ANG', 2.14387, 0, 1616330288),
(7, 'AOA', 737.223, 0, 1616330288),
(8, 'ARS', 108.661, 0, 1616330288),
(9, 'AUD', 1.54448, 0, 1616330288),
(10, 'AWG', 2.15073, 0, 1616330288),
(11, 'AZN', 2.03599, 0, 1616330288),
(12, 'BAM', 1.96311, 0, 1616330288),
(13, 'BBD', 2.39199, 0, 1616330288),
(14, 'BDT', 101.104, 0, 1616330288),
(15, 'BGN', 1.96537, 0, 1616330288),
(16, 'BHD', 0.450487, 0, 1616330288),
(17, 'BIF', 2347.28, 0, 1616330288),
(18, 'BMD', 1.19485, 0, 1616330288),
(19, 'BND', 1.60266, 0, 1616330288),
(20, 'BOB', 8.25317, 0, 1616330288),
(21, 'BRL', 6.56069, 0, 1616330288),
(22, 'BSD', 1.19434, 0, 1616330288),
(23, 'BTC', 0.0000212536, 0, 1616330288),
(24, 'BTN', 86.5119, 0, 1616330288),
(25, 'BWP', 13.0748, 0, 1616330288),
(26, 'BYN', 3.10469, 0, 1616330288),
(27, 'BYR', 23419.1, 0, 1616330288),
(28, 'BZD', 2.3947, 0, 1616330288),
(29, 'CAD', 1.49625, 0, 1616330288),
(30, 'CDF', 2384.92, 0, 1616330288),
(31, 'CHF', 1.11094, 0, 1616330288),
(32, 'CLF', 0.030888, 0, 1616330288),
(33, 'CLP', 852.291, 0, 1616330288),
(34, 'CNY', 7.77733, 1, 1616330288),
(35, 'COP', 4252.35, 0, 1616330288),
(36, 'CRC', 729.892, 0, 1616330288),
(37, 'CUC', 1.19485, 0, 1616330288),
(38, 'CUP', 31.6635, 0, 1616330288),
(39, 'CVE', 111.245, 0, 1616330288),
(40, 'CZK', 26.1684, 0, 1616330288),
(41, 'DJF', 212.349, 0, 1616330288),
(42, 'DKK', 7.46399, 0, 1616330288),
(43, 'DOP', 68.2861, 0, 1616330288),
(44, 'DZD', 159.564, 0, 1616330288),
(45, 'EGP', 18.665, 0, 1616330288),
(46, 'ERN', 17.9232, 0, 1616330288),
(47, 'ETB', 48.0932, 0, 1616330288),
(48, 'EUR', 1, 1, 1616330288),
(49, 'FJD', 2.44591, 0, 1616330288),
(50, 'FKP', 0.861451, 0, 1616330288),
(51, 'GBP', 0.861464, 0, 1616330288),
(52, 'GEL', 3.97292, 0, 1616330288),
(53, 'GGP', 0.861451, 0, 1616330288),
(54, 'GHS', 6.86446, 0, 1616330288),
(55, 'GIP', 0.861451, 0, 1616330288),
(56, 'GMD', 61.2365, 0, 1616330288),
(57, 'GNF', 11948.5, 0, 1616330288),
(58, 'GTQ', 9.22056, 0, 1616330288),
(59, 'GYD', 249.567, 0, 1616330288),
(60, 'HKD', 9.27938, 0, 1616330288),
(61, 'HNL', 28.92, 0, 1616330288),
(62, 'HRK', 7.60355, 0, 1616330288),
(63, 'HTG', 94.2583, 0, 1616330288),
(64, 'HUF', 369.054, 0, 1616330288),
(65, 'IDR', 17172.7, 0, 1616330288),
(66, 'ILS', 3.94395, 0, 1616330288),
(67, 'IMP', 0.861451, 0, 1616330288),
(68, 'INR', 86.5574, 0, 1616330288),
(69, 'IQD', 1747.47, 0, 1616330288),
(70, 'IRR', 50309.2, 0, 1616330288),
(71, 'ISK', 151.567, 0, 1616330288),
(72, 'JEP', 0.861451, 0, 1616330288),
(73, 'JMD', 173.895, 0, 1616330288),
(74, 'JOD', 0.847196, 0, 1616330288),
(75, 'JPY', 130.148, 0, 1616330288),
(76, 'KES', 131.255, 0, 1616330288),
(77, 'KGS', 101.328, 0, 1616330288),
(78, 'KHR', 4848.11, 0, 1616330288),
(79, 'KMF', 494.1, 0, 1616330288),
(80, 'KPW', 1075.36, 0, 1616330288),
(81, 'KRW', 1349.54, 0, 1616330288),
(82, 'KWD', 0.360869, 0, 1616330288),
(83, 'KYD', 0.995298, 0, 1616330288),
(84, 'KZT', 502.824, 0, 1616330288),
(85, 'LAK', 11213.7, 0, 1616330288),
(86, 'LBP', 1815.48, 0, 1616330288),
(87, 'LKR', 235.889, 0, 1616330288),
(88, 'LRD', 207.311, 0, 1616330288),
(89, 'LSL', 17.5767, 0, 1616330288),
(90, 'LTL', 3.52808, 0, 1616330288),
(91, 'LVL', 0.722753, 0, 1616330288),
(92, 'LYD', 5.38132, 0, 1616330288),
(93, 'MAD', 10.7253, 0, 1616330288),
(94, 'MDL', 21.2605, 0, 1616330288),
(95, 'MGA', 4504.58, 0, 1616330288),
(96, 'MKD', 61.8443, 0, 1616330288),
(97, 'MMK', 1684.07, 0, 1616330288),
(98, 'MNT', 3406.79, 0, 1616330288),
(99, 'MOP', 9.554, 0, 1616330288),
(100, 'MRO', 426.561, 0, 1616330288),
(101, 'MUR', 48.0901, 0, 1616330288),
(102, 'MVR', 18.4728, 0, 1616330288),
(103, 'MWK', 935.568, 0, 1616330288),
(104, 'MXN', 24.5015, 0, 1616330288),
(105, 'MYR', 4.90785, 0, 1616330288),
(106, 'MZN', 86.3698, 0, 1616330288),
(107, 'NAD', 17.5767, 0, 1616330288),
(108, 'NGN', 454.645, 0, 1616330288),
(109, 'NIO', 41.9755, 0, 1616330288),
(110, 'NOK', 10.2091, 0, 1616330288),
(111, 'NPR', 138.419, 0, 1616330288),
(112, 'NZD', 1.66773, 0, 1616330288),
(113, 'OMR', 0.459666, 0, 1616330288),
(114, 'PAB', 1.19434, 0, 1616330288),
(115, 'PEN', 4.43891, 0, 1616330288),
(116, 'PGK', 4.22384, 0, 1616330288),
(117, 'PHP', 58.1474, 0, 1616330288),
(118, 'PKR', 186.397, 0, 1616330288),
(119, 'PLN', 4.6319, 0, 1616330288),
(120, 'PYG', 7814.74, 0, 1616330288),
(121, 'QAR', 4.35049, 0, 1616330288),
(122, 'RON', 4.90224, 0, 1616330288),
(123, 'RSD', 118.018, 0, 1616330288),
(124, 'RUB', 88.7193, 1, 1616330288),
(125, 'RWF', 1172.75, 0, 1616330288),
(126, 'SAR', 4.48189, 0, 1616330288),
(127, 'SBD', 9.50258, 0, 1616330288),
(128, 'SCR', 25.4727, 0, 1616330288),
(129, 'SDG', 454.043, 0, 1616330288),
(130, 'SEK', 10.1385, 0, 1616330288),
(131, 'SGD', 1.60361, 0, 1616330288),
(132, 'SHP', 0.861451, 0, 1616330288),
(133, 'SLL', 12220.9, 0, 1616330288),
(134, 'SOS', 698.988, 0, 1616330288),
(135, 'SRD', 16.912, 0, 1616330288),
(136, 'STD', 24618.8, 0, 1616330288),
(137, 'SVC', 10.4508, 0, 1616330288),
(138, 'SYP', 612.69, 0, 1616330288),
(139, 'SZL', 17.5767, 0, 1616330288),
(140, 'THB', 36.8648, 0, 1616330288),
(141, 'TJS', 13.6158, 0, 1616330288),
(142, 'TMT', 4.19392, 0, 1616330288),
(143, 'TND', 3.28405, 0, 1616330288),
(144, 'TOP', 2.70855, 0, 1616330288),
(145, 'TRY', 8.62575, 0, 1616330288),
(146, 'TTD', 8.10733, 0, 1616330288),
(147, 'TWD', 33.9351, 0, 1616330288),
(148, 'TZS', 2769.66, 0, 1616330288),
(149, 'UAH', 33.1211, 0, 1616330288),
(150, 'UGX', 4377.37, 0, 1616330288),
(151, 'USD', 1.19485, 1, 1616330288),
(152, 'UYU', 53.293, 0, 1616330288),
(153, 'UZS', 12545.9, 0, 1616330288),
(154, 'VEF', 11.9336, 0, 1616330288),
(155, 'VND', 27571.2, 0, 1616330288),
(156, 'VUV', 128.615, 0, 1616330288),
(157, 'WST', 3.03263, 0, 1616330288),
(158, 'XAF', 658.404, 0, 1616330288),
(159, 'XAG', 0.045535, 0, 1616330288),
(160, 'XAU', 0.000685, 0, 1616330288),
(161, 'XCD', 3.22914, 0, 1616330288),
(162, 'XDR', 0.835404, 0, 1616330288),
(163, 'XOF', 657.168, 0, 1616330288),
(164, 'XPF', 120.206, 0, 1616330288),
(165, 'YER', 299.131, 0, 1616330288),
(166, 'ZAR', 17.47, 0, 1616330288),
(167, 'ZMK', 10755.1, 0, 1616330288),
(168, 'ZMW', 26.3284, 0, 1616330288),
(169, 'ZWL', 384.742, 0, 1616330288);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

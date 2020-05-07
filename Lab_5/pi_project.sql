-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 07 2020 г., 22:50
-- Версия сервера: 10.3.13-MariaDB-log
-- Версия PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `pi_project`
--

-- --------------------------------------------------------

--
-- Структура таблицы `applications`
--

CREATE TABLE `applications` (
  `id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int(11) NOT NULL,
  `sum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `applications`
--

INSERT INTO `applications` (`id`, `model`, `description`, `year`, `sum`) VALUES
('AA65799SBB', 'Смартфон Apple iPhone SE', 'Классический компактный дизайн, мощный процессор и масса других достоинств. iPhone SE создан, чтобы стать вашим идеальным смартфоном. iPhone SE защищён от воды и может выдержать погружение на глубину до 1 метра в течение 30 минут.', 2020, 53999),
('CC65129EEB', 'Игра Hunt: Showdown (PS4)', 'Hunt: Showdown – шутер от первого лица с элементами хоррора, где игрокам предстоит соперничать в охоте за трофеями. Соревновательный игровой процесс Hunt: Showdown, разделенный на матчи, включает элементы противостояний PvP и PvE, благодаря чему игрок постоянно находится в напряжении, на которое не была способна никакая другая игра. ', 2020, 2299),
('DD45789SBB', 'Яндекс станция мини', 'Умная колонка Яндекс станция мини станет полноценным ассистентом для каждого пользователя и даже для целой семьи. Она «умеет» рассказывать сказки и искать нужную информацию в интернете, включая сводку погоды и состояние пробок на дороге, транслировать всевозможные радиостанции и музыку со смартфона, напоминать о выключении плиты и поднимать владельца будильником.', 4499, 2019),
('SA45789SAD', 'Кофемашина EA817010 ', 'Кофемашина Krups EA817010 автоматически готовит превосходный эспрессо из молотого кофе. Теперь вы самостоятельно можете регулировать степень помола кофе, подбирая идеальное сочетание. ', 2019, 30999),
('SA45999AMD', 'Монитор Samsung S24R358FHI', 'Монитор Samsung S24R358FHI [LS24R358FHIXCI] с размером рабочей области 526.88x296.37 мм оптимально подходит для прохождения самых требовательных к графике игр. Благодаря разрешению 1920x1080 пикселей транслируемое изображение отличается безупречной детализацией и четкостью. Дополняет его LED-подсветка.', 2018, 9499);

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` varchar(21) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`id`, `name`, `score`, `city`, `telephone`) VALUES
(1, 'ТехноЦентр', '705698234781257963585', 'Тюмень', '8953697412'),
(2, 'ТелеМаркет', '705699999781257963225', 'Москва', '89521236578'),
(5, 'MVideo', '805698234795657963666', 'Санкт-Петербург', '89526866684');

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `id_client` int(11) DEFAULT NULL,
  `number` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`id`, `date`, `id_client`, `number`, `count`) VALUES
(1, '2020-05-06', 1, 'CC65129EEB', 10),
(2, '2020-05-07', 1, 'SA45789SAD', 3),
(7, '2020-05-01', 2, 'AA65799SBB', 5),
(9, '2020-04-27', 2, 'DD45789SBB', 5),
(11, '2020-04-27', 5, 'SA45999AMD', 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `number` (`number`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_3` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `services_ibfk_4` FOREIGN KEY (`number`) REFERENCES `applications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

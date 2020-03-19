-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 20 2020 г., 00:00
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
-- База данных: `laba_2`
--

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`root`@`%` PROCEDURE `proc` (IN `name_table` VARCHAR(50), IN `team` VARCHAR(50), IN `param1` VARCHAR(50), IN `param2` VARCHAR(255), IN `param3` VARCHAR(5))  NO SQL
BEGIN
IF team='sel' THEN
    SET @sql = CONCAT('SELECT * FROM ', name_table);
   PREPARE proc FROM @sql;
   EXECUTE proc;    

ELSEIF team='ins' THEN
   SET @sql = CONCAT("INSERT INTO ",name_table," VALUES (NULL, '",param1,"', '",param2,"')");
   PREPARE proc FROM @sql;
   EXECUTE proc;  

ELSEIF team='del' THEN
    SET @sql = CONCAT("DELETE FROM ",name_table," WHERE id=",param1);
   PREPARE proc FROM @sql;
   EXECUTE proc;   
 
ELSEIF team='upd' THEN
	IF name_table='service' THEN
    	SET @sql = CONCAT("UPDATE ",name_table," SET name='",param1,"', price='",param2,"' WHERE id=",param3);
  		PREPARE proc FROM @sql;
  		EXECUTE proc;  
        
    ELSE
        SET @sql =CONCAT("UPDATE ",name_table," SET name='",param1,"', data='",param2,"' WHERE id=",param3);
  		PREPARE proc FROM @sql;
  		EXECUTE proc;  
   
 	end IF;
END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `application`
--

CREATE TABLE `application` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `application`
--

INSERT INTO `application` (`id`, `name`, `data`) VALUES
(1, 'application1', '10-10-2019'),
(2, 'application2', '11-11-2020'),
(3, 'application3', '02-02-2021'),
(4, 'application4', '05-07-2022');

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `client`
--

INSERT INTO `client` (`id`, `name`, `data`) VALUES
(1, 'Ivanov F.F.', '10-02-1995'),
(2, 'Petrov A.D.', '14-02-1996');

-- --------------------------------------------------------

--
-- Структура таблицы `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `service`
--

INSERT INTO `service` (`id`, `name`, `price`) VALUES
(1, 'Repairs', '500'),
(2, 'Customization', '1000'),
(3, 'Diagnostics', '1500'),
(4, 'Consultation', '1000'),
(5, 'Cleaning', '1200');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `application`
--
ALTER TABLE `application`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

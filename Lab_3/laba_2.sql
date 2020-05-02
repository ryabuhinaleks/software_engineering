-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 03 2020 г., 00:30
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
	IF name_table='services' THEN
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
-- Структура таблицы `applications`
--

CREATE TABLE `applications` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `applications`
--

INSERT INTO `applications` (`id`, `name`, `data`) VALUES
(1, 'App1', '01-01-1999'),
(2, 'App2', '01-01-2000'),
(3, 'App3', '01-11-2000'),
(4, 'App3', '11-01-2001'),
(5, 'App4', '01-11-2020'),
(6, 'App5', '11-01-2011'),
(7, 'App6', '11-11-2014');

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`id`, `name`, `data`) VALUES
(1, 'client1', '01-01-1999'),
(2, 'client2', '01-01-2000'),
(3, 'client3', '01-11-2000'),
(4, 'client4', '11-01-2001');

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`id`, `name`, `price`) VALUES
(1, 'service1', '100'),
(2, 'service2', '200'),
(3, 'service3', '300'),
(4, 'service4', '44400'),
(5, 'service5', '5465465464'),
(6, 'service6', '44444400'),
(7, 'service7', '200');

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
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

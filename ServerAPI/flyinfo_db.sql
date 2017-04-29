-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- 主機: 127.0.0.1
-- 產生時間： 2017-04-29 10:26:45
-- 伺服器版本: 10.1.19-MariaDB
-- PHP 版本： 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `flyinfo`
--
CREATE DATABASE IF NOT EXISTS `flyinfo` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `flyinfo`;
-- --------------------------------------------------------

--
-- 資料表結構 `info_data`
--

CREATE TABLE `info_data` (
  `data_id` int(32) NOT NULL,
  `timestemp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type_id` int(16) NOT NULL,
  `tag` text,
  `img_url` text,
  `shortcut_img_base64` text,
  `title` text,
  `description` text,
  `memo` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- 資料表結構 `info_location`
--

CREATE TABLE `info_location` (
  `local_id` int(32) NOT NULL,
  `timestemp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type_id` int(16) NOT NULL,
  `data_id` int(32) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `altitude` double NOT NULL,
  `area_code` varchar(32) DEFAULT NULL,
  `multi_zone` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- 資料表結構 `info_type`
--

CREATE TABLE `info_type` (
  `type_id` int(16) NOT NULL,
  `display_default` text,
  `memo` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `info_data`
--
ALTER TABLE `info_data`
  ADD PRIMARY KEY (`data_id`);

--
-- 資料表索引 `info_location`
--
ALTER TABLE `info_location`
  ADD PRIMARY KEY (`local_id`);

--
-- 資料表索引 `info_type`
--
ALTER TABLE `info_type`
  ADD PRIMARY KEY (`type_id`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `info_data`
--
ALTER TABLE `info_data`
  MODIFY `data_id` int(32) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `info_location`
--
ALTER TABLE `info_location`
  MODIFY `local_id` int(32) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `info_type`
--
ALTER TABLE `info_type`
  MODIFY `type_id` int(16) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

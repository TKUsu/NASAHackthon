-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- 主機: 127.0.0.1
-- 產生時間： 2017-04-30 03:59:09
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
-- 資料表的匯出資料 `info_type`
--

INSERT INTO `info_type` (`type_id`, `display_default`, `memo`) VALUES
(1, 'Endangered Species', '{"icon_url":"","icon_base64":""}'),
(2, 'Myths', '{"icon_url":"","icon_base64":""}'),
(3, 'City', '{"icon_url":"","icon_base64":""}');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `info_type`
--
ALTER TABLE `info_type`
  ADD PRIMARY KEY (`type_id`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `info_type`
--
ALTER TABLE `info_type`
  MODIFY `type_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

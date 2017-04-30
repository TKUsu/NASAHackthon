-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- 主機: 127.0.0.1
-- 產生時間： 2017-04-30 03:58:33
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

--
-- 資料表的匯出資料 `info_data`
--

INSERT INTO `info_data` (`data_id`, `timestemp`, `type_id`, `tag`, `img_url`, `shortcut_img_base64`, `title`, `description`, `memo`) VALUES
(1, '2017-04-29 13:31:09', 1, NULL, 'https://c402277.ssl.cf1.rackcdn.com/photos/2330/images/hero_full/polar-bear-hero.jpg', NULL, 'Polar Bear', '1234567', '{"link":"https://www.worldwildlife.org/species/polar-bear","other":"other..."}'),
(45, '2017-04-30 01:14:24', 2, 'NULL', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Greece_Mount_Olympus_%281%29.jpg/500px-Greece_Mount_Olympus_%281%29.jpg', 'NULL', 'Mount Olympus', 'https://en.wikipedia.org/wiki/Category:Locations_in_Greek_mythology', 'NULL'),
(46, '2017-04-30 01:14:24', 2, 'NULL', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Corykian_Cave%2C_exterior_aspect_showing_cave_opening_and_mountain_slope.JPG/440px-Corykian_Cave%2C_exterior_aspect_showing_cave_opening_and_mountain_slope.JPG', 'NULL', 'Corycian Cave', 'https://en.wikipedia.org/wiki/Category:Locations_in_Greek_mythology', 'NULL'),
(47, '2017-04-30 01:14:24', 2, 'NULL', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Parnassus.jpg/500px-Parnassus.jpg', 'NULL', 'Mount Parnassus', 'https://en.wikipedia.org/wiki/Category:Locations_in_Greek_mythology', 'NULL'),
(48, '2017-04-30 01:14:24', 2, 'NULL', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Athens_Montage_L.png/550px-Athens_Montage_L.png', 'NULL', 'Athens', 'https://www.greekmythology.com/Myths/Places/places.html', 'NULL'),
(49, '2017-04-30 01:14:24', 2, 'NULL', 'https://pic1.qyer.com/album/user/1259/13/QEtQSxsEYUg/index/500x300', 'NULL', 'Crete', 'https://www.greekmythology.com/Myths/Places/places.html', 'NULL'),
(50, '2017-04-30 01:14:24', 2, 'NULL', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Greece_location_map.svg/570px-Greece_location_map.svg.png', 'NULL', 'Lerna', 'https://www.greekmythology.com/Myths/Places/places.html', 'NULL'),
(51, '2017-04-30 01:14:25', 2, 'NULL', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Thebes-1.jpg/540px-Thebes-1.jpg', 'NULL', 'Thebes', 'https://www.greekmythology.com/Myths/Places/places.html', 'NULL'),
(52, '2017-04-30 01:14:25', 2, 'NULL', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Delphi%2C_Tholos_%286220581621%29.jpg/580px-Delphi%2C_Tholos_%286220581621%29.jpg', 'NULL', 'Delphi', 'https://en.wikipedia.org/wiki/Delphi', 'NULL'),
(53, '2017-04-30 01:14:25', 2, 'NULL', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Shinto_torii_vermillion.svg/250px-Shinto_torii_vermillion.svg.png', 'NULL', 'Japan', 'WIKI', 'NULL'),
(54, '2017-04-30 01:14:25', 2, 'NULL', 'https://timg01.bdimg.com/timg?wapbaike&quality=80&size=b800_600&sec=1349839550&di=a62f84a92d8baa205e113925beaf59a5&src=http://imgsrc.baidu.com/baike/pic/item/472309f7905298222b59d146dfca7bcb0b46d4c9.jpg', 'NULL', 'Yellow River', 'WIKI', 'NULL'),
(55, '2017-04-30 01:14:25', 2, 'NULL', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Hukou_Waterfall.jpg/600px-Hukou_Waterfall.jpg', 'NULL', 'Yellow River', 'WIKI', 'NULL'),
(56, '2017-04-30 01:14:25', 2, 'NULL', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/Temple_of_Edfu_02.jpg/520px-Temple_of_Edfu_02.jpg', 'NULL', 'Temple of Edfu', 'https://en.wikipedia.org/wiki/Temple_of_Edfu', 'NULL'),
(57, '2017-04-30 01:14:25', 2, 'NULL', 'http://www.ancient.eu/img/r/p/750/2319.jpg?v=1485680608', 'NULL', 'Nile', 'http://www.ancient.eu/nile/', 'NULL'),
(58, '2017-04-30 01:14:25', 2, 'NULL', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/80_-_Machu_Picchu_-_Juin_2009_-_edit.2.jpg/600px-80_-_Machu_Picchu_-_Juin_2009_-_edit.2.jpg', 'NULL', 'Machu Picchu', 'https://en.wikipedia.org/wiki/Machu_Picchu', 'NULL'),
(59, '2017-04-30 01:14:25', 2, 'NULL', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Stonehenge%2C_Condado_de_Wiltshire%2C_Inglaterra%2C_2014-08-12%2C_DD_09.JPG/580px-Stonehenge%2C_Condado_de_Wiltshire%2C_Inglaterra%2C_2014-08-12%2C_DD_09.JPG', 'NULL', 'Stonehenge', 'https://en.wikipedia.org/wiki/Stonehenge', 'NULL'),
(60, '2017-04-30 01:14:25', 2, 'NULL', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/%E5%A1%94%E6%99%AE%E5%80%AB%E5%AF%BA%E7%9A%84%E6%A6%95%E6%A0%91.JPG/600px-%E5%A1%94%E6%99%AE%E5%80%AB%E5%AF%BA%E7%9A%84%E6%A6%95%E6%A0%91.JPG', 'NULL', 'Ta Prohm', 'https://en.wikipedia.org/wiki/Ta_Prohm', 'NULL'),
(61, '2017-04-30 01:14:25', 2, 'NULL', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Lushena_Buddha_at_Longmen_Grottos_in_Luoyang.JPG/440px-Lushena_Buddha_at_Longmen_Grottos_in_Luoyang.JPG', 'NULL', 'Longmen Grottoes', 'https://en.wikipedia.org/wiki/Longmen_Grottoes', 'NULL'),
(62, '2017-04-30 01:14:25', 2, 'NULL', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Mountains_in_Magelang_seen_from_Borobudur_Temple.jpg/440px-Mountains_in_Magelang_seen_from_Borobudur_Temple.jpg', 'NULL', 'Borobudur', 'https://en.wikipedia.org/wiki/Borobudur', 'NULL'),
(65, '2017-04-30 01:46:46', 1, 'NULL', 'https://c402277.ssl.cf1.rackcdn.com/photos/10646/images/hero_full/ThomasSzajner_20141004-20141004-KB1A5172.jpg?1452530740', 'NULL', 'Plains Bison', 'https://c402277.ssl.cf1.rackcdn.com/photos/10646/images/hero_full/ThomasSzajner_20141004-20141004-KB1A5172.jpg?1452530740', 'NULL'),
(68, '2017-04-30 01:55:31', 1, 'NULL', 'https://c402277.ssl.cf1.rackcdn.com/photos/1365/images/hero_full/sumatran_orangutan_8.6.2012_Hero_and_Circle_image_XL_257636.jpg?1345592809', 'NULL', 'Orangutan', 'https://c402277.ssl.cf1.rackcdn.com/photos/1365/images/hero_full/sumatran_orangutan_8.6.2012_Hero_and_Circle_image_XL_257636.jpg?1345592809', 'NULL'),
(69, '2017-04-30 01:55:31', 1, 'NULL', 'https://c402277.ssl.cf1.rackcdn.com/photos/2715/images/hero_full/Mekong_Irrawaddy_Dolphin_breaching_%28c%29_WWF_Greater_Mekong.jpg?1421877230', 'NULL', 'Leatherback Turtle', 'https://c402277.ssl.cf1.rackcdn.com/photos/2715/images/hero_full/Mekong_Irrawaddy_Dolphin_breaching_%28c%29_WWF_Greater_Mekong.jpg?1421877230', 'NULL'),
(70, '2017-04-30 01:55:31', 1, 'NULL', 'https://c402277.ssl.cf1.rackcdn.com/photos/317/images/hero_full/SCR_289416.jpg?1345568766', 'NULL', 'Loggerhead Turtle', 'https://c402277.ssl.cf1.rackcdn.com/photos/317/images/hero_full/SCR_289416.jpg?1345568766', 'NULL'),
(71, '2017-04-30 01:55:31', 1, 'NULL', 'https://c402277.ssl.cf1.rackcdn.com/photos/11551/images/hero_full/Bernard_de_wetter_wwf_canon_113974.jpg?1462218465', 'NULL', 'Giant Panda', 'https://c402277.ssl.cf1.rackcdn.com/photos/11551/images/hero_full/Bernard_de_wetter_wwf_canon_113974.jpg?1462218465', 'NULL'),
(72, '2017-04-30 01:55:31', 1, 'NULL', 'https://c402277.ssl.cf1.rackcdn.com/photos/1257/images/hero_full/SeaTurtle-1600x600px.jpg?1345590072', 'NULL', 'Sea Turtle', 'https://c402277.ssl.cf1.rackcdn.com/photos/1257/images/hero_full/SeaTurtle-1600x600px.jpg?1345590072', 'NULL'),
(73, '2017-04-30 01:55:31', 1, 'NULL', 'https://c402277.ssl.cf1.rackcdn.com/photos/2715/images/hero_full/Mekong_Irrawaddy_Dolphin_breaching_%28c%29_WWF_Greater_Mekong.jpg?1421877230', 'NULL', 'Irrawaddy Dolphin', 'https://c402277.ssl.cf1.rackcdn.com/photos/2715/images/hero_full/Mekong_Irrawaddy_Dolphin_breaching_%28c%29_WWF_Greater_Mekong.jpg?1421877230', 'NULL'),
(74, '2017-04-30 01:55:31', 1, 'NULL', 'https://c402277.ssl.cf1.rackcdn.com/photos/1108/images/hero_full/Western_lowland_gorilla_7.31.2012_hero_and_circle_HI_105208.jpg?1345537656', 'NULL', 'western-lowland-gorilla', 'https://c402277.ssl.cf1.rackcdn.com/photos/1108/images/hero_full/Western_lowland_gorilla_7.31.2012_hero_and_circle_HI_105208.jpg?1345537656', 'NULL'),
(75, '2017-04-30 01:55:31', 1, 'NULL', 'https://c402277.ssl.cf1.rackcdn.com/photos/2379/images/hero_full/DSCN3579.jpg?1346359440', 'NULL', 'Hippopotamus', 'https://c402277.ssl.cf1.rackcdn.com/photos/2379/images/hero_full/DSCN3579.jpg?1346359440', 'NULL'),
(76, '2017-04-30 01:55:31', 1, 'NULL', 'https://c402277.ssl.cf1.rackcdn.com/photos/418/images/hero_full/HI_287332Circle.jpg?1345522102', 'NULL', 'Olive Ridley Turtle', 'https://c402277.ssl.cf1.rackcdn.com/photos/418/images/hero_full/HI_287332Circle.jpg?1345522102', 'NULL');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `info_data`
--
ALTER TABLE `info_data`
  ADD PRIMARY KEY (`data_id`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `info_data`
--
ALTER TABLE `info_data`
  MODIFY `data_id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

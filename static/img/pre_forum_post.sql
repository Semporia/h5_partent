-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1:3306
-- 生成日期： 2021-01-16 05:30:24
-- 服务器版本： 10.4.10-MariaDB
-- PHP 版本： 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `dz32`
--

-- --------------------------------------------------------

--
-- 表的结构 `pre_forum_post`
--

DROP TABLE IF EXISTS `pre_forum_post`;
CREATE TABLE IF NOT EXISTS `pre_forum_post` (
  `pid` int(10) UNSIGNED NOT NULL,
  `fid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `tid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `first` tinyint(1) NOT NULL DEFAULT 0,
  `author` varchar(15) NOT NULL DEFAULT '',
  `authorid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `subject` varchar(80) NOT NULL DEFAULT '',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `message` mediumtext NOT NULL,
  `useip` varchar(15) NOT NULL DEFAULT '',
  `port` smallint(6) UNSIGNED NOT NULL DEFAULT 0,
  `invisible` tinyint(1) NOT NULL DEFAULT 0,
  `anonymous` tinyint(1) NOT NULL DEFAULT 0,
  `usesig` tinyint(1) NOT NULL DEFAULT 0,
  `htmlon` tinyint(1) NOT NULL DEFAULT 0,
  `bbcodeoff` tinyint(1) NOT NULL DEFAULT 0,
  `smileyoff` tinyint(1) NOT NULL DEFAULT 0,
  `parseurloff` tinyint(1) NOT NULL DEFAULT 0,
  `attachment` tinyint(1) NOT NULL DEFAULT 0,
  `rate` smallint(6) NOT NULL DEFAULT 0,
  `ratetimes` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` int(10) NOT NULL DEFAULT 0,
  `tags` varchar(255) NOT NULL DEFAULT '0',
  `comment` tinyint(1) NOT NULL DEFAULT 0,
  `replycredit` int(10) NOT NULL DEFAULT 0,
  `position` int(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`tid`,`position`),
  UNIQUE KEY `pid` (`pid`),
  KEY `fid` (`fid`),
  KEY `authorid` (`authorid`,`invisible`),
  KEY `dateline` (`dateline`),
  KEY `invisible` (`invisible`),
  KEY `displayorder` (`tid`,`invisible`,`dateline`),
  KEY `first` (`tid`,`first`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pre_forum_post`
--

INSERT INTO `pre_forum_post` (`pid`, `fid`, `tid`, `first`, `author`, `authorid`, `subject`, `dateline`, `message`, `useip`, `port`, `invisible`, `anonymous`, `usesig`, `htmlon`, `bbcodeoff`, `smileyoff`, `parseurloff`, `attachment`, `rate`, `ratetimes`, `status`, `tags`, `comment`, `replycredit`, `position`) VALUES
(1, 2, 1, 1, 'admin', 1, 'csacas', 1607579382, 'csacascsa\r\n', '::1', 55734, 0, 0, 1, 0, -1, -1, 0, 0, 1, 1, 0, '', 0, 0, 1),
(2, 2, 2, 1, 'admin', 1, '撒擦擦是', 1607581598, '爱上擦撒\r\n', '::1', 59045, 0, 0, 1, 0, -1, -1, 0, 0, 1, 1, 0, '', 0, 0, 1),
(3, 2, 3, 1, 'admin', 1, 'casca', 1607582130, 'casascsac\r\n', '::1', 64336, 0, 0, 1, 0, -1, -1, 0, 0, 1, 1, 0, '', 0, 0, 1),
(4, 2, 4, 1, 'mrcong', 2, '萨克斯是哥伦比亚大学经济学教授，曾连续三次担任联合...', 1607582985, '萨克斯是哥伦比亚大学经济学教授，曾连续三次担任联合国秘书长的特别顾问。\r\n\r\n1981年，萨克斯首次到访中国，还曾见证“西部大开发”战略的早期实施。\r\n\r\n他告诉记者，他已密切关注中国近40年，看到了“绝对非凡”的发展成就。\r\n\r\n', '::1', 50613, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 0, '', 0, 0, 1),
(5, 2, 5, 1, 'admin', 1, 'csac', 1607583055, 'cascasca\r\n', '::1', 50750, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 0, '', 0, 0, 1),
(6, 2, 6, 1, 'admin', 1, 'csacascsacsa', 1607585187, 'acsac\r\n', '::1', 52663, 0, 0, 1, 0, -1, -1, 0, 0, 0, 1, 0, '', 0, 0, 1),
(7, 36, 7, 1, 'mrcong', 2, 'csacsac', 1607656592, 'cascascsacsa\r\n', '::1', 59660, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 0, '', 0, 0, 1),
(8, 36, 8, 1, 'mrcong', 2, 'csacsac', 1607656620, 'cascascsa\r\n', '::1', 59803, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 0, '', 0, 0, 1),
(9, 36, 9, 1, 'mrcong', 2, 'scsacsa', 1607656670, 'cascsacsacascascacascas\r\n', '::1', 60078, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 0, '', 0, 0, 1),
(10, 36, 10, 1, 'mrcong', 2, 'csacasc', 1607656816, 'ascascascascsacsac\r\n', '::1', 60663, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 0, '', 0, 0, 1),
(11, 2, 11, 1, 'mrcong', 2, 'sccccccccccccccccccccccccccccccccccc', 1607656876, 'sccccccccccccccccccccccccccccccccccc\r\n', '::1', 60893, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 0, '', 0, 0, 1),
(12, 2, 12, 1, 'mrcong', 2, 'ascsacsa', 1607657150, 'csacsacsacascsacsdddddddd\r\n', '::1', 61940, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 0, '', 0, 0, 1),
(13, 36, 13, 1, 'mrcong', 2, '吃撒才散场', 1607657612, '查查是阿女洒出撒女洒出是阿SV撒v\r\n', '::1', 63614, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 0, '', 0, 0, 1),
(14, 36, 14, 1, 'mrcong', 2, 'scascascsaaaaaa', 1607657759, 'csaacasvasvsdfvdvdb\r\n', '::1', 64119, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 0, '', 0, 0, 1),
(15, 36, 15, 1, 'mrcong', 2, 'ascsacsacssssss', 1607657858, 'csacsaccccccccccccccccccccc\r\n', '::1', 64504, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 0, '', 0, 0, 1),
(16, 2, 16, 1, 'mrcong', 2, '吃撒初三', 1607660400, '时擦刹车撒陈飒飒\r\n', '::1', 57722, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 0, '', 0, 0, 1),
(17, 2, 17, 1, 'mrcong', 2, 'ASCSVip', 1607662473, 'ASCASVASVSAV\r\n', '::1', 64579, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 0, '', 0, 0, 1),
(18, 2, 18, 1, 'mrcong', 2, 'CSACSACSA', 1607662491, 'CASCASCASSSSSS\r\n', '::1', 64674, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 0, '', 0, 0, 1),
(19, 2, 19, 1, 'mrcong', 2, '吃撒初三', 1607662753, '爱上擦撒ACSV\r\n', '::1', 49255, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 0, '', 0, 0, 1),
(20, 2, 20, 1, 'mrcong', 2, '吃撒初三吃撒初三吃撒初三吃撒初三', 1607664385, '吃撒初三吃撒初三吃撒初三吃撒初三吃撒初三吃撒初三吃撒初三吃撒初三吃撒初三吃撒初三吃撒初三吃撒初三吃撒初三吃撒初三吃撒初三吃撒初三\r\n', '::1', 55509, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 0, '', 0, 0, 1),
(21, 2, 20, 0, 'mrcong', 2, '', 1608692384, 'ascascsacasc', '::1', 64881, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 0, '0', 0, 0, 2),
(22, 2, 20, 0, 'admin', 1, '', 1608693268, 'ascascsacasc', '::1', 50327, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 0, '0', 0, 0, 3),
(23, 2, 20, 0, 'admin', 1, '', 1608693274, 'ascascsacasc啊', '::1', 50343, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 0, '0', 0, 0, 4),
(24, 2, 19, 0, 'admin', 1, '', 1610607242, '擦擦是', '::1', 59855, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 1024, '0', 0, 0, 2),
(25, 2, 16, 0, 'admin', 1, '', 1610607249, '啛啛喳喳错', '::1', 59855, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 0, '0', 0, 0, 2),
(26, 2, 18, 0, 'admin', 1, '', 1610607257, '茶山村撒 ', '::1', 60695, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 1024, '0', 0, 0, 2),
(27, 2, 4, 0, 'admin', 1, '', 1610607264, '爱上擦擦', '::1', 60695, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 1024, '0', 0, 0, 2),
(28, 2, 11, 0, 'admin', 1, '', 1610607272, '擦擦是从', '::1', 54146, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 1024, '0', 0, 0, 2),
(29, 36, 15, 0, 'admin', 1, '', 1610608331, 'cascsacv', '::1', 62651, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 1024, '0', 0, 0, 2),
(30, 36, 13, 0, 'admin', 1, '', 1610608338, 'cascas ', '::1', 55942, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 1024, '0', 0, 0, 2),
(31, 36, 9, 0, 'admin', 1, '', 1610608440, 'csa吧吧vvv ', '::1', 50172, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 0, '0', 0, 0, 2),
(32, 36, 10, 0, 'admin', 1, '', 1610608448, '差', '::1', 56679, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 1024, '0', 0, 0, 2),
(33, 2, 17, 0, 'admin', 1, '', 1610609526, '565656565656666', '::1', 53611, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 0, '0', 0, 0, 2),
(34, 2, 12, 0, 'admin', 1, '', 1610609533, '88999', '::1', 53611, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 1024, '0', 0, 0, 2),
(35, 2, 21, 1, 'admin', 1, '不回复', 1610611933, '擦擦是\r\n', '::1', 58381, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0, 0, '', 0, 0, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

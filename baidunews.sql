-- phpMyAdmin SQL Dump
-- version 4.7.0-beta1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2017-04-14 04:22:02
-- 服务器版本： 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `baidunews`
--

-- --------------------------------------------------------

--
-- 表的结构 `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `newstype` char(200) NOT NULL,
  `newstitle` varchar(200) NOT NULL,
  `newsimg` varchar(200) NOT NULL,
  `newstime` date NOT NULL,
  `newssrc` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `news`
--

INSERT INTO `news` (`id`, `newstype`, `newstitle`, `newsimg`, `newstime`, `newssrc`) VALUES
(18, '精选', '第十五', 'images/2.jpg', '2017-04-12', '极客科技22'),
(20, '本地', '第二十一', 'images/2.jpg', '2017-03-18', '极客科技3'),
(21, '图片', '第二十三', 'images/1.jpg', '2017-03-18', '极客科技4'),
(22, '百家', '百家笑谈', 'images/4.jpg', '2017-03-17', '笑傲江湖'),
(23, '互联网', '互联网', 'images/3.jpg', '2017-03-19', '谷歌'),
(24, '娱乐', '互联网', 'images/2.jpg', '2017-03-19', '谷歌'),
(25, '社会', '互联网', 'images/3.jpg', '2017-03-19', '谷歌'),
(28, '科技', '军事活动', 'images/1.jpg', '2017-03-19', '谷歌'),
(29, '女人', '女士', 'images/1.jpg', '2017-03-19', '谷歌'),
(37, '精选', '3453', 'images/2.jpg', '2017-04-12', '346');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

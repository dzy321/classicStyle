-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-11-24 04:09:48
-- 服务器版本： 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs`
--

-- --------------------------------------------------------

--
-- 表的结构 `cs_cloth`
--

CREATE TABLE `cs_cloth` (
  `cid` int(4) NOT NULL,
  `fid` int(4) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `details` varchar(128) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `fpic` varchar(128) DEFAULT NULL,
  `bpic` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cs_cloth`
--

INSERT INTO `cs_cloth` (`cid`, `fid`, `title`, `details`, `price`, `fpic`, `bpic`) VALUES
(1, 1, 'Lauren Crew Neck Tee', 'Fabric:Tissue-weight jersey/Curved,uneven hem/Shell:50% modal 50% cotton/Hand wash or dry clean/Made in Canada', '88.00', 'img/pr.jpg', 'img/pr1.jpg'),
(2, 1, 'Joe\'s Jeans The Charlie Ankle Cords', 'Fabric Ankle length/Raw,frayed cuffs/Skinny sihouette/Shell:90% cotton 1% spandex/Wash cold/Imported,China', '188.00', 'img/pr2.jpg', 'img/pr3.jpg'),
(3, 1, 'Nico Giani Duvalia Mini Top Handle Bag', 'Leathr:Cowhide/Magnetic closure at top/Path interior pockets/Weight:19oz 0.54kg/Made in Italy', '385.00', 'img/pr4.jpg', 'img/pr5.jpg'),
(4, 1, 'Ancient Greek Sandals', 'Leather:Cowhide/Polished rivet accents/Slide sandals/Flat profile/Open teo/Made in Greece', '250.00', 'img/pr12.jpg', 'img/pr13.jpg'),
(5, 1, 'Agile Pyper Watch,38mm', 'Water resistant to 50 meters/2-year manufacture warranty/Imported,China', '150.00', 'img/pr14.jpg', 'img/pr15.jpg'),
(6, 1, 'Cupcakes And Cashmere Jola Dress', 'Fabric: Denim/Mini dress cut/Mock neck/Long sleeves/Shell:100% cotton/Wash cold', '108.00', 'img/pr16.jpg', 'img/pr17.jpg'),
(7, 1, 'Figue Theresa Dress', 'Fabric:Ribbed jerset/Mini cut/Sleeveless/Unlined/Shell:47% cotton 47% modal 6% spandex/Wash cold/Made in USA', '325.00', 'img/pr18.jpg', 'img/pr19.jpg'),
(8, 1, 'Sperry Crest Vibe Chubby Lace Sneakers', 'Fabric:Canvas/Padded insole/Lace-up style/Flat profile/Rubber sole/Imported,China', '52.50', 'img/pr20.jpg', 'img/pr21.jpg'),
(9, 1, 'GENX Metro Mesh Watch,34mm', 'Water resistant to 30 meters/2-year manufacturer warranty/Imported,China', '225.00', 'img/pr22.jpg', 'img/pr23.jpg'),
(10, 2, 'Gage Chronograph Watch', 'Water resistant to 50 meters/2-year manufacturer warranty/Importanted,India', '250.00', 'img/pr7.jpg', 'img/pr6.jpg'),
(11, 2, 'AG Gray Boy Tee', 'Fabric:cotton Super-soft jersey/Banded crew neckline/Slim fit/Short sleeves/Unlined/Shell:100% cotton/Wash cold/Imported,Mexico', '78.00', 'img/pr8.jpg', 'img/pr9.jpg'),
(12, 2, 'Superga Empire Sneakers', 'Leather:Calfshin/Logo accent/Lace-up at front/Rounded toe/Imported,Indonesia', '225.00', 'img/pr11.jpg', 'img/pr10.jpg'),
(13, 2, 'United Nude Rico Sandals', 'Leather:Cowhide/Molded footbed/Platform profile/open toe/Imported China', '89.00', 'img/pr24.jpg', 'img/pr25.jpg'),
(14, 2, 'Levi\'s Wedgie Wtraight Jeans', 'Fabric:Stretch denim/Contract stitching/Shell:99% cotton 1% elastane/Wash cold or dry clean/Imported,China', '98.00', 'img/pr26.jpg', 'img/pr27.jpg'),
(15, 2, 'Gray Ant Mingus Sunglasses', 'Soft case/Cleaning cloth included/Rectangular frame/Non-polarized leness/Made in Italy', '345.00', 'img/pr28.jpg', 'img/pr29.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `cs_cloth_family`
--

CREATE TABLE `cs_cloth_family` (
  `fid` int(11) NOT NULL,
  `fname` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cs_cloth_family`
--

INSERT INTO `cs_cloth_family` (`fid`, `fname`) VALUES
(1, 'women'),
(2, 'man');

-- --------------------------------------------------------

--
-- 表的结构 `cs_shoppingcart_item`
--

CREATE TABLE `cs_shoppingcart_item` (
  `iid` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `cloid` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `is_checked` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cs_shoppingcart_item`
--

INSERT INTO `cs_shoppingcart_item` (`iid`, `uid`, `cloid`, `count`, `is_checked`) VALUES
(3, 12, 1, 10, 1),
(4, 13, 3, 9, 0),
(5, 14, 1, 1, 0),
(13, 20, 1, 1, 1),
(16, 25, 2, 1, 1),
(18, 3, 14, 1, 1),
(26, 32, 13, 1, 0),
(27, 32, 5, 1, 0),
(29, 33, 1, 1, 0),
(31, 3, 1, 1, 0),
(37, 1, 9, 1, 1),
(39, 46, 1, 1, 0),
(41, 1, 1, 31, 1),
(44, 51, 5, 1, 1),
(45, 54, 1, 1, 1),
(47, 59, 5, 1, 0),
(48, 59, 9, 1, 0),
(50, 31, 1, 1, 1),
(51, 59, 1, 2, 0),
(54, 1, 12, 2, 1),
(55, 61, 5, 1, 1),
(56, 61, 6, 1, 0),
(57, 70, 1, 1, 1),
(58, 71, 1, 1, 1),
(59, 1, 4, 3, 1),
(62, 35, 5, 13, 0),
(63, 72, 9, 1, 1),
(64, 82, 1, 1, 1),
(71, 1, 6, 10, 0),
(72, 1, 10, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cs_user`
--

CREATE TABLE `cs_user` (
  `uid` int(11) NOT NULL,
  `uname` varchar(32) DEFAULT NULL,
  `upwd` varchar(32) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `avatar` varchar(128) DEFAULT NULL,
  `user_name` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cs_user`
--

INSERT INTO `cs_user` (`uid`, `uname`, `upwd`, `email`, `phone`, `avatar`, `user_name`) VALUES
(1, 'dingding', '123456', 'ding@qq.com', '13511011000', 'img/avatar/default.png', '丁春秋'),
(2, 'dangdang', '123456', 'dang@qq.com', '13501234568', 'img/avatar/default.png', '当当喵'),
(3, 'doudou', '123456', 'dou@qq.com', '13501234569', 'img/avatar/default.png', '窦志强'),
(4, 'yayadddd', '123456', 'ya@qq.com', '13501234560', 'img/avatar/default.png', '秦小雅'),
(6, 'ABCD', '123456', '123@qq.com', '13538894495', NULL, NULL),
(8, '121123', 'w13945128995', '491000888@qq.com', '13213389258', NULL, NULL),
(9, '555555', '5555555', '55555555@163.com', '13400000000', NULL, NULL),
(10, 'xuyong', '123456', '123456789@qq.com', '15525623622', NULL, 'a a '),
(11, 'admin', 'cxy930123', 'mail@xingyu1993.cn', '13580510164', NULL, NULL),
(12, 'siyongbo', '900427', '616188545@qq.com', '18447103998', NULL, NULL),
(13, 'qwerty', '123456', '1091256014@qq.com', '15617152367', NULL, NULL),
(14, 'dingziqiang', '456456', '996534706@qq.com', '15567502520', NULL, '汤姆'),
(15, 'hdb2264068', 'huang123', '471062503@qq.com', '18898405759', NULL, NULL),
(16, 'wenhua', '654321', 'liwenhua@tedu.cn', '15012345678', NULL, NULL),
(21, 'Jessy', 'ac210921', '123456@qq.com', '13523456789', NULL, NULL),
(22, 'yuanxf', '123456', 'yuanxf@tedu.cn', '13537763301', NULL, NULL),
(23, '查安军', '025520', '27514172112@qq.com', '18158899905', NULL, NULL),
(24, '123456', '123456', '123456@1.com', '13815668132', NULL, NULL),
(25, '1234', '111111', '734713428@qq.com', '18061920422', NULL, NULL),
(26, 'qwe12345', '123123', '1191769510@qq.com', '15234010643', NULL, NULL),
(27, '海贼王', '5124457', 'hxxcrocky@qq.com', '18826450879', NULL, NULL),
(28, 'hanrufuyun00', 'hanrufuyun11', '458205630@qq.com', '13853114827', NULL, NULL),
(29, 'li999999', 'li999999', 'limingdir@163.com', '18557512341', NULL, NULL),
(30, '111111111111', '123456', '1057631733@qq.com', '15275106677', NULL, NULL),
(31, 'tom', '123456', 'tom@tedu.cn', '13801234568', NULL, NULL),
(32, 'zhouzhi', '123456', '2206344145@qq.com', '17600587478', NULL, NULL),
(33, 'juleck', '123456', 'wuhaofushan@sina.com', '12345678901', NULL, NULL),
(34, 'yangtao', '123456', '250737026@qq.com', '18256953222', NULL, NULL),
(35, 'tarena', '123456', '783664829@qq.com', '17711625897', NULL, NULL),
(36, 'xiaobai', 'xx527603', '1196465493@qq.com', '13980312111', NULL, 'lulu'),
(37, '璐璐lu', '546521ll', '1273447080@qq.com', '15892761793', NULL, NULL),
(38, '胖王二二', 'woaidoubi1.', '1179524522@qq.com', '13269195181', NULL, ''),
(39, 'Yeye ', '123456', '1610608370@qq.com', '15062394551', NULL, NULL),
(40, 'lsj', '123456', '11324564879@qq.com', '13156467891', NULL, NULL),
(41, 'lsj', '123456', '11324564879@qq.com', '13156467891', NULL, NULL),
(42, 'lsj', '123456', '11324564879@qq.com', '13156467891', NULL, NULL),
(43, 'lsj', '123456', '11324564879@qq.com', '13156467891', NULL, NULL),
(45, 'hjh', '958030', 'hjh@126.com', '17812344567', NULL, NULL),
(46, 'ewq', '123456', '1234567890@qq.com', '12345678909', NULL, NULL),
(47, 'pipi', '123456', '78@qq.com', '12367889993', NULL, NULL),
(48, 'Lovica', '309418727', '1684707021@qq.com', '18435130456', NULL, NULL),
(49, 'htt0908', '19920908', '418720482@qq.com', '15244691033', NULL, NULL),
(50, 'SUXUEMEI', '123456', 'SUXUEMEI@qq.com', '15817338974', NULL, NULL),
(51, 'zhong', '123456', '123456789@126.com', '13120211111', NULL, NULL),
(52, '金豆豆', '123456789', '1170363143@qq.com', '15738619097', NULL, NULL),
(53, 'wangjunfei', '123456', '396225880@qq.com', '13205935797', NULL, NULL),
(54, 'gijhglkhglkh', '123456', 'sjksfj@fjdh.com', '15698765423', NULL, NULL),
(55, 'zuiyd1314', 'zuiyh1994', '528396697@qq.com', '15927843908', NULL, NULL),
(56, 'xiaoming123', '123456', '54646@qq.com', '13553688534', NULL, NULL),
(57, 'yuanzhi', '123456', '270096123@qq.com', '15962573639', NULL, NULL),
(58, 'fengkuang11', 'fengkuang113', '1135779768@qq.com', '18559132247', NULL, NULL),
(60, 'yxzaaa', '123456', '2280517552@qq.com', '13716225357', NULL, NULL),
(61, 'linlei0001', '58874439', '876056078@qq.com', '13390922939', NULL, NULL),
(62, 'superman', '1314520', '904202099@qq.com', '12345678910', NULL, NULL),
(63, 'tom222', '123456', '1@163.com', '13456789012', NULL, NULL),
(64, 'tom1234', '123456', '2@163.com', '13423456789', NULL, NULL),
(65, 'Liyu123', 'asd8520', '812544715@qq.com', '18911743412', NULL, '左天'),
(66, 'Liyu123', 'asd8520', '812544715@qq.com', '18911743412', NULL, NULL),
(67, '李白李白', '123456', '125365@163.com', '13986273022', NULL, NULL),
(68, 'dingdong', '123456', '15194898156@qq.com', '15112316516', NULL, NULL),
(69, 'wenjinhua', '236239', '461677613@qq.com', '13516574786', NULL, NULL),
(70, 'thebigleg', '1a4b2c8d5e7f', '1352951609@qq.com', '13572508752', NULL, NULL),
(71, 'zhangsan', 'add123456', 'add@qq.com', '12234324223', NULL, NULL),
(72, '高渐离', '123456', '935263676@qq.com', '18352501250', NULL, NULL),
(73, 'lifan', '123456', '18092034652@163.com', '18092933456', NULL, NULL),
(74, 'zhangsan99', '123456zs', '876987366@qq.com', '13934721892', NULL, NULL),
(75, 'tingDING', '123456', '12345678@qq.com', '13548525468', NULL, NULL),
(76, 'dongdong', '123456', 'wenhua@taqobao.com', '13946585968', NULL, NULL),
(77, 'weiyiwei', '123456', '598475405@qq.com', '15923741956', NULL, '韦祎伟'),
(78, '落英缤纷赋酒诗', 'sAberTime050', '857464657@qq.com', '17727420979', NULL, NULL),
(79, 'xiaoming1234', '123456', '4564564564@qq.com', '15269188535', NULL, NULL),
(80, 'loonchao', '123456', '850248873@qq.com', '13548729051', NULL, NULL),
(81, 'hushuang', '123456', '850248813@qq.com', '15802507525', NULL, NULL),
(83, 'fhr9588', '000009588', '111111111@qq.com', '12345666666', NULL, NULL),
(84, 'baibaidexue', '13809024377', '408130701@qq.com', '18301973827', NULL, NULL),
(85, 'tom10', '123456', '123@163.com', '12323456', NULL, NULL),
(91, 'tom', '1234', 'tom@qq.com', '13456789251', NULL, NULL),
(92, 'jerry', '123456', 'jerry@qq.com', '13456789251', NULL, '杰瑞'),
(93, 'amy', '123456', 'amy@qq.com', '13456789251', NULL, 'a a '),
(94, 'tom', '123', '47fdasa1062503@qq.com', '13511011000', NULL, '丁春秋'),
(95, 'yayaa a ', '123', '123@qq.com', '13511011000', NULL, '丁春秋'),
(96, 'yaya12', '123', '123@qq.com', '13511011000', NULL, '丁春秋'),
(97, 'yaya', '123', '12333333@qq.com', '13511011000', NULL, '丁春秋'),
(98, 'yaya', '123', '12333af3@qq.com', '13511011000', NULL, '丁春秋'),
(99, 'tom222adfaf', 'adf', '123@qq.com', '13456789251', NULL, '丁春秋'),
(100, 'tom', 'adf', '1232942aef126daf@qq.com', '13456789251', NULL, 'af');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cs_cloth`
--
ALTER TABLE `cs_cloth`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `cs_cloth_family`
--
ALTER TABLE `cs_cloth_family`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `cs_shoppingcart_item`
--
ALTER TABLE `cs_shoppingcart_item`
  ADD PRIMARY KEY (`iid`);

--
-- Indexes for table `cs_user`
--
ALTER TABLE `cs_user`
  ADD PRIMARY KEY (`uid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `cs_cloth`
--
ALTER TABLE `cs_cloth`
  MODIFY `cid` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 使用表AUTO_INCREMENT `cs_cloth_family`
--
ALTER TABLE `cs_cloth_family`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `cs_shoppingcart_item`
--
ALTER TABLE `cs_shoppingcart_item`
  MODIFY `iid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- 使用表AUTO_INCREMENT `cs_user`
--
ALTER TABLE `cs_user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

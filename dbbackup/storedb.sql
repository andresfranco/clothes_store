-- phpMyAdmin SQL Dump
-- version 4.4.13.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 12, 2016 at 08:40 PM
-- Server version: 5.6.27-0ubuntu1
-- PHP Version: 5.6.11-1ubuntu3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `storedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_address`
--

CREATE TABLE IF NOT EXISTS `oc_address` (
  `address_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_address`
--

INSERT INTO `oc_address` (`address_id`, `customer_id`, `firstname`, `lastname`, `company`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`, `custom_field`) VALUES
(1, 1, 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 164, 2486, '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate` (
  `affiliate_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate_activity`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_activity` (
  `activity_id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate_login`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_login` (
  `affiliate_login_id` int(11) NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_api`
--

CREATE TABLE IF NOT EXISTS `oc_api` (
  `api_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_api`
--

INSERT INTO `oc_api` (`api_id`, `name`, `key`, `status`, `date_added`, `date_modified`) VALUES
(1, 'Default', 'zPxRwEW80cCSykR4kkQM6NHaRPacOgSbNWtzEUiAtBrej1QVlQjs5LxRYYcdJgonVv5AupXNEvAbD5CUUYuXydludU0ISQjUVBfsDhCTo1WTI8stbMDFMfTugLAKwFx21KRlE7qNoM5vF4nRUiPFAPlORSTEtPr2XpXpw4s4agY8VHfrAHBWe64aMMALaNijGEyZHJeCKTCkND3iim46rz2nuijAb89YkM8dpxu4p7ecowvq7rMENuGdRyCqdfBo', 1, '2015-11-01 10:36:35', '2015-11-01 10:36:35');

-- --------------------------------------------------------

--
-- Table structure for table `oc_api_ip`
--

CREATE TABLE IF NOT EXISTS `oc_api_ip` (
  `api_ip_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_api_session`
--

CREATE TABLE IF NOT EXISTS `oc_api_session` (
  `api_session_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `session_name` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute`
--

CREATE TABLE IF NOT EXISTS `oc_attribute` (
  `attribute_id` int(11) NOT NULL,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute`
--

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_description`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_description`
--

INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 1, 'Description'),
(2, 1, 'No. of Cores'),
(4, 1, 'test 1'),
(5, 1, 'test 2'),
(6, 1, 'test 3'),
(7, 1, 'test 4'),
(8, 1, 'test 5'),
(9, 1, 'test 6'),
(10, 1, 'test 7'),
(11, 1, 'test 8'),
(3, 1, 'Clockspeed');

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_group`
--

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_group_description`
--

INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, 'Memory'),
(4, 1, 'Technical'),
(5, 1, 'Motherboard'),
(6, 1, 'Processor');

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner`
--

CREATE TABLE IF NOT EXISTS `oc_banner` (
  `banner_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(6, 'HP Products', 0),
(10, 'sub_banner', 1),
(8, 'Manufacturers', 1),
(9, 'Home Page Slideshow', 1),
(11, 'sub_banner1', 1),
(12, 'sub_banner2', 1),
(13, 'Stores', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner_image`
--

CREATE TABLE IF NOT EXISTS `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_banner_image`
--

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `link`, `image`, `sort_order`) VALUES
(160, 11, '#', 'catalog/subbanners/subbanner1.png', 0),
(159, 12, '#', 'catalog/subbanners/subbanner2.png', 0),
(99, 6, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(94, 8, '', 'catalog/demo/manufacturer/nfl.png', 0),
(95, 8, '', 'catalog/demo/manufacturer/redbull.png', 0),
(96, 8, '', 'catalog/demo/manufacturer/sony.png', 0),
(91, 8, '', 'catalog/demo/manufacturer/cocacola.png', 0),
(92, 8, '', 'catalog/demo/manufacturer/burgerking.png', 0),
(93, 8, '', 'catalog/demo/manufacturer/canon.png', 0),
(88, 8, '', 'catalog/demo/manufacturer/harley.png', 0),
(89, 8, '', 'catalog/demo/manufacturer/dell.png', 0),
(90, 8, '', 'catalog/demo/manufacturer/disney.png', 0),
(164, 9, 'https://www.etsy.com/shop/RibbonRevolution', 'catalog/banners/Main Banner 4.png', 4),
(97, 8, '', 'catalog/demo/manufacturer/starbucks.png', 0),
(98, 8, '', 'catalog/demo/manufacturer/nintendo.png', 0),
(163, 9, 'https://www.etsy.com/shop/RibbonRevolution', 'catalog/banners/Main Banner 3.png', 3),
(157, 10, '#', 'catalog/subbanners/subbanner.png', 0),
(162, 9, 'https://www.etsy.com/shop/RibbonRevolution', 'catalog/banners/Main Banner 2.png', 2),
(161, 9, 'https://www.etsy.com/shop/RibbonRevolution', 'catalog/banners/Main Banner 1.png', 1),
(146, 13, '#', 'catalog/stores_carousel/carousel3.png', 3),
(145, 13, '#', 'catalog/stores_carousel/carousel2.png', 2),
(144, 13, '#', 'catalog/stores_carousel/carousel1.png', 1),
(147, 13, '#', 'catalog/stores_carousel/carousel4.png', 4);

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner_image_description`
--

CREATE TABLE IF NOT EXISTS `oc_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_banner_image_description`
--

INSERT INTO `oc_banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`) VALUES
(160, 1, 11, 'sub_banner1'),
(99, 1, 6, 'HP Banner'),
(93, 1, 8, 'Canon'),
(92, 1, 8, 'Burger King'),
(91, 1, 8, 'Coca Cola'),
(90, 1, 8, 'Disney'),
(89, 1, 8, 'Dell'),
(157, 1, 10, 'sub_banner'),
(88, 1, 8, 'Harley Davidson'),
(94, 1, 8, 'NFL'),
(95, 1, 8, 'RedBull'),
(96, 1, 8, 'Sony'),
(97, 1, 8, 'Starbucks'),
(98, 1, 8, 'Nintendo'),
(164, 1, 9, 'mainbanner4'),
(163, 1, 9, 'mainbanner2'),
(162, 1, 9, 'mainbanner1'),
(159, 1, 12, 'sub_banner2'),
(161, 1, 9, 'mainbanner3'),
(147, 1, 13, 'item4'),
(146, 1, 13, 'item3'),
(145, 1, 13, 'item2'),
(144, 1, 13, 'item1');

-- --------------------------------------------------------

--
-- Table structure for table `oc_cart`
--

CREATE TABLE IF NOT EXISTS `oc_cart` (
  `cart_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_cart`
--

INSERT INTO `oc_cart` (`cart_id`, `customer_id`, `session_id`, `product_id`, `recurring_id`, `option`, `quantity`, `date_added`) VALUES
(26, 1, '3sooaqkfdn089nb32kpgi54rb2', 241, 0, '{"421":"2264"}', 1, '2016-01-12 19:44:29');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category`
--

CREATE TABLE IF NOT EXISTS `oc_category` (
  `category_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category`
--

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(85, '', 90, 0, 0, 22, 1, '2015-11-15 16:41:28', '2015-12-10 21:57:48'),
(86, '', 90, 0, 0, 23, 1, '2015-11-15 16:41:47', '2015-12-10 21:58:19'),
(65, '', 90, 0, 0, 7, 1, '2015-11-02 14:13:13', '2015-12-10 21:42:45'),
(66, '', 90, 1, 4, 7, 1, '2015-11-15 16:33:55', '2015-12-13 19:36:51'),
(83, '', 90, 0, 0, 20, 1, '2015-11-15 16:40:34', '2015-12-10 21:56:29'),
(82, '', 90, 0, 0, 19, 1, '2015-11-15 16:39:56', '2015-12-10 21:49:44'),
(81, '', 90, 0, 0, 18, 1, '2015-11-15 16:39:37', '2015-12-10 21:49:11'),
(80, '', 90, 0, 0, 16, 1, '2015-11-15 16:39:22', '2015-12-10 21:47:29'),
(79, '', 90, 0, 0, 17, 1, '2015-11-15 16:39:05', '2015-12-10 21:48:49'),
(78, '', 90, 0, 0, 15, 1, '2015-11-15 16:38:47', '2015-12-10 21:47:07'),
(77, '', 90, 0, 0, 14, 1, '2015-11-15 16:38:31', '2015-12-10 21:46:30'),
(84, '', 90, 0, 0, 21, 1, '2015-11-15 16:41:13', '2015-12-10 21:57:09'),
(76, '', 90, 0, 0, 13, 1, '2015-11-15 16:38:15', '2015-12-10 21:46:05'),
(75, '', 90, 0, 0, 12, 1, '2015-11-15 16:38:00', '2015-12-10 21:45:39'),
(74, '', 90, 0, 0, 11, 1, '2015-11-15 16:37:43', '2015-12-10 21:45:20'),
(73, '', 90, 0, 0, 10, 1, '2015-11-15 16:37:19', '2015-12-10 21:44:37'),
(72, '', 90, 0, 0, 9, 1, '2015-11-15 16:36:59', '2015-12-10 21:44:00'),
(71, '', 90, 0, 0, 8, 1, '2015-11-15 16:36:39', '2015-12-10 21:43:25'),
(70, '', 90, 0, 0, 6, 1, '2015-11-15 16:36:15', '2015-12-10 21:42:06'),
(69, '', 90, 0, 0, 5, 1, '2015-11-15 16:35:42', '2015-12-10 21:41:14'),
(68, '', 90, 0, 0, 4, 1, '2015-11-15 16:35:15', '2015-12-10 21:40:33'),
(67, '', 90, 0, 0, 2, 1, '2015-11-15 16:34:17', '2015-12-10 21:55:24'),
(60, '', 90, 0, 0, 3, 1, '2015-11-02 13:29:14', '2015-12-10 21:39:48'),
(90, '', 0, 1, 4, 7, 1, '2015-12-10 20:01:01', '2016-01-09 17:16:21'),
(91, '', 0, 0, 1, 0, 1, '2015-12-12 11:32:01', '2015-12-12 11:32:01'),
(92, '', 0, 0, 1, 0, 1, '2015-12-12 11:54:02', '2015-12-12 11:54:02'),
(93, '', 0, 0, 1, 0, 1, '2015-12-12 14:35:00', '2015-12-12 14:35:00'),
(94, '', 90, 1, 1, 0, 1, '2015-12-12 16:25:04', '2015-12-13 19:34:38'),
(95, '', 90, 0, 1, 0, 1, '2015-12-12 16:33:10', '2015-12-13 19:36:43'),
(96, '', 90, 0, 0, 0, 1, '2015-12-12 16:41:03', '2015-12-14 21:50:24'),
(97, '', 90, 0, 1, 0, 1, '2016-01-04 11:24:20', '2016-01-04 11:24:20'),
(98, '', 90, 0, 1, 0, 1, '2016-01-04 15:15:20', '2016-01-04 15:15:20'),
(99, '', 90, 0, 1, 0, 1, '2016-01-04 15:45:25', '2016-01-04 15:45:25');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_description`
--

CREATE TABLE IF NOT EXISTS `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_description`
--

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(77, 1, 'Melanoma', '&lt;p&gt;Melanoma&lt;br&gt;&lt;/p&gt;', 'Melanoma', '', ''),
(78, 1, 'Multiple Myeloma', '&lt;p&gt;Multiple Myeloma&lt;br&gt;&lt;/p&gt;', 'Multiple Myeloma', '', ''),
(68, 1, 'Cervical Cancer ', '&lt;p&gt;Cervical Cancer &lt;br&gt;&lt;/p&gt;', 'Cervical Cancer ', '', ''),
(96, 1, 'Appendix Cancer', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Appendix Cancer', '', ''),
(97, 1, 'Carcinoid Cancer', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Carcinoid Cancer', '', ''),
(76, 1, 'Lymphoma', '&lt;p&gt;Lymphoma&lt;br&gt;&lt;/p&gt;', 'Lymphoma', '', ''),
(94, 1, 'Bone Cancer', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Bone Cancer', '', ''),
(95, 1, 'Bile Duct Cancer ', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Bile Duct Cancer ', '', ''),
(90, 1, 'Shop', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Cancer T-Shirts', '', ''),
(91, 1, 'Spina Bifida', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Spina Bifida', '', ''),
(92, 1, 'Chiari Malformation', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Chiari Malformation', '', ''),
(65, 1, 'Endometriosis', '&lt;p&gt;Endometriosis&lt;/p&gt;', 'Endometriosis', 'Endometriosis', ''),
(66, 1, 'Blood Cancer', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Blood Cancer', '', ''),
(67, 1, 'Brain Cancer', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Brain Cancer', '', ''),
(93, 1, 'Heart Disease', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Heart Disease', '', ''),
(69, 1, 'Childhood Cancer', '&lt;p&gt;Childhood Cancer&lt;br&gt;&lt;/p&gt;', 'Childhood Cancer', '', ''),
(70, 1, 'Colon Cancer', '&lt;p&gt;Colon Cancer&lt;br&gt;&lt;/p&gt;', 'Colon Cancer', '', ''),
(71, 1, 'Hodgkin''s Lymphoma', '&lt;p&gt;Hodgkin''s Lymphoma&lt;br&gt;&lt;/p&gt;', 'Hodgkin''s Lymphoma', '', ''),
(72, 1, 'Kidney Cancer', '&lt;p&gt;Kidney Cancer&lt;br&gt;&lt;/p&gt;', 'Kidney Cancer', '', ''),
(73, 1, 'Leukemia', '&lt;p&gt;Leukemia&lt;br&gt;&lt;/p&gt;', 'Leukemia', '', ''),
(74, 1, 'Liver Cancer', '&lt;p&gt;Liver Cancer&lt;br&gt;&lt;/p&gt;', 'Liver Cancer', '', ''),
(75, 1, 'Lung Cancer', '&lt;p&gt;Lung Cancer&lt;br&gt;&lt;/p&gt;', 'Lung Cancer', '', ''),
(60, 1, 'Breast Cancer', 'Breast Cancer', 'Breast Cancer', 'Breast Cancer', 'Breast Cancer'),
(79, 1, 'Non Hodgkins Lymphoma', '&lt;p&gt;Non Hodgkins Lymphoma&lt;br&gt;&lt;/p&gt;', 'Non Hodgkins Lymphoma', '', ''),
(80, 1, 'Ovarian Cancer', '&lt;p&gt;Ovarian Cancer&lt;br&gt;&lt;/p&gt;', 'Ovarian Cancer', '', ''),
(81, 1, 'Pancreatic Cancer', '&lt;p&gt;Pancreatic Cancer&lt;br&gt;&lt;/p&gt;', 'Pancreatic Cancer', '', ''),
(82, 1, 'Prostate Cancer', '&lt;p&gt;Prostate Cancer&lt;br&gt;&lt;/p&gt;', 'Prostate Cancer', '', ''),
(83, 1, 'Sarcoma', '&lt;p&gt;Sarcoma&lt;br&gt;&lt;/p&gt;', 'Sarcoma', '', ''),
(84, 1, 'Skin Cancer', '&lt;p&gt;Skin Cancer&lt;br&gt;&lt;/p&gt;', 'Skin Cancer', '', ''),
(85, 1, 'Thyroid Cancer', '&lt;p&gt;Thyroid Cancer&lt;br&gt;&lt;/p&gt;', 'Thyroid Cancer', '', ''),
(86, 1, 'Uterine Cancer', '&lt;p&gt;Uterine Cancer&lt;br&gt;&lt;/p&gt;', 'Uterine Cancer', '', ''),
(98, 1, 'Cancer Awareness', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Cancer Awareness', '', ''),
(99, 1, 'Esophageal Cancer', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Esophageal Cancer', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_filter`
--

CREATE TABLE IF NOT EXISTS `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_path`
--

CREATE TABLE IF NOT EXISTS `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_path`
--

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES
(99, 99, 1),
(99, 90, 0),
(98, 98, 1),
(98, 90, 0),
(97, 97, 1),
(97, 90, 0),
(66, 90, 0),
(94, 90, 0),
(96, 90, 0),
(96, 96, 1),
(95, 95, 1),
(94, 94, 1),
(93, 93, 0),
(73, 90, 0),
(92, 92, 0),
(91, 91, 0),
(86, 90, 0),
(85, 90, 0),
(84, 90, 0),
(74, 90, 0),
(83, 90, 0),
(82, 90, 0),
(81, 90, 0),
(79, 90, 0),
(80, 90, 0),
(77, 90, 0),
(76, 90, 0),
(75, 90, 0),
(72, 90, 0),
(71, 90, 0),
(65, 90, 0),
(70, 90, 0),
(69, 90, 0),
(68, 90, 0),
(60, 90, 0),
(95, 90, 0),
(86, 86, 1),
(85, 85, 1),
(84, 84, 1),
(83, 83, 1),
(82, 82, 1),
(81, 81, 1),
(80, 80, 1),
(79, 79, 1),
(78, 78, 1),
(77, 77, 1),
(76, 76, 1),
(75, 75, 1),
(74, 74, 1),
(73, 73, 1),
(72, 72, 1),
(71, 71, 1),
(70, 70, 1),
(69, 69, 1),
(68, 68, 1),
(67, 67, 1),
(66, 66, 1),
(65, 65, 1),
(67, 90, 0),
(90, 90, 0),
(60, 60, 1),
(78, 90, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_to_layout`
--

INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(91, 0, 0),
(60, 0, 0),
(93, 0, 0),
(92, 0, 0),
(90, 0, 0),
(94, 0, 0),
(65, 0, 0),
(66, 0, 0),
(67, 0, 0),
(68, 0, 0),
(69, 0, 0),
(70, 0, 0),
(71, 0, 0),
(72, 0, 0),
(73, 0, 0),
(74, 0, 0),
(75, 0, 0),
(76, 0, 0),
(77, 0, 0),
(78, 0, 0),
(79, 0, 0),
(80, 0, 0),
(81, 0, 0),
(82, 0, 0),
(83, 0, 0),
(84, 0, 0),
(85, 0, 0),
(86, 0, 0),
(95, 0, 0),
(96, 0, 0),
(97, 0, 0),
(98, 0, 0),
(99, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_to_store`
--

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES
(60, 0),
(65, 0),
(66, 0),
(67, 0),
(68, 0),
(69, 0),
(70, 0),
(71, 0),
(72, 0),
(73, 0),
(74, 0),
(75, 0),
(76, 0),
(77, 0),
(78, 0),
(79, 0),
(80, 0),
(81, 0),
(82, 0),
(83, 0),
(84, 0),
(85, 0),
(86, 0),
(90, 0),
(91, 0),
(92, 0),
(93, 0),
(94, 0),
(95, 0),
(96, 0),
(97, 0),
(98, 0),
(99, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_country`
--

CREATE TABLE IF NOT EXISTS `oc_country` (
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=258 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_country`
--

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '', 0, 1),
(2, 'Albania', 'AL', 'ALB', '', 0, 1),
(3, 'Algeria', 'DZ', 'DZA', '', 0, 1),
(4, 'American Samoa', 'AS', 'ASM', '', 0, 1),
(5, 'Andorra', 'AD', 'AND', '', 0, 1),
(6, 'Angola', 'AO', 'AGO', '', 0, 1),
(7, 'Anguilla', 'AI', 'AIA', '', 0, 1),
(8, 'Antarctica', 'AQ', 'ATA', '', 0, 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '', 0, 1),
(10, 'Argentina', 'AR', 'ARG', '', 0, 1),
(11, 'Armenia', 'AM', 'ARM', '', 0, 1),
(12, 'Aruba', 'AW', 'ABW', '', 0, 1),
(13, 'Australia', 'AU', 'AUS', '', 0, 1),
(14, 'Austria', 'AT', 'AUT', '', 0, 1),
(15, 'Azerbaijan', 'AZ', 'AZE', '', 0, 1),
(16, 'Bahamas', 'BS', 'BHS', '', 0, 1),
(17, 'Bahrain', 'BH', 'BHR', '', 0, 1),
(18, 'Bangladesh', 'BD', 'BGD', '', 0, 1),
(19, 'Barbados', 'BB', 'BRB', '', 0, 1),
(20, 'Belarus', 'BY', 'BLR', '', 0, 1),
(21, 'Belgium', 'BE', 'BEL', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 1),
(22, 'Belize', 'BZ', 'BLZ', '', 0, 1),
(23, 'Benin', 'BJ', 'BEN', '', 0, 1),
(24, 'Bermuda', 'BM', 'BMU', '', 0, 1),
(25, 'Bhutan', 'BT', 'BTN', '', 0, 1),
(26, 'Bolivia', 'BO', 'BOL', '', 0, 1),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', '', 0, 1),
(28, 'Botswana', 'BW', 'BWA', '', 0, 1),
(29, 'Bouvet Island', 'BV', 'BVT', '', 0, 1),
(30, 'Brazil', 'BR', 'BRA', '', 0, 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '', 0, 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', '', 0, 1),
(33, 'Bulgaria', 'BG', 'BGR', '', 0, 1),
(34, 'Burkina Faso', 'BF', 'BFA', '', 0, 1),
(35, 'Burundi', 'BI', 'BDI', '', 0, 1),
(36, 'Cambodia', 'KH', 'KHM', '', 0, 1),
(37, 'Cameroon', 'CM', 'CMR', '', 0, 1),
(38, 'Canada', 'CA', 'CAN', '', 0, 1),
(39, 'Cape Verde', 'CV', 'CPV', '', 0, 1),
(40, 'Cayman Islands', 'KY', 'CYM', '', 0, 1),
(41, 'Central African Republic', 'CF', 'CAF', '', 0, 1),
(42, 'Chad', 'TD', 'TCD', '', 0, 1),
(43, 'Chile', 'CL', 'CHL', '', 0, 1),
(44, 'China', 'CN', 'CHN', '', 0, 1),
(45, 'Christmas Island', 'CX', 'CXR', '', 0, 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '', 0, 1),
(47, 'Colombia', 'CO', 'COL', '', 0, 1),
(48, 'Comoros', 'KM', 'COM', '', 0, 1),
(49, 'Congo', 'CG', 'COG', '', 0, 1),
(50, 'Cook Islands', 'CK', 'COK', '', 0, 1),
(51, 'Costa Rica', 'CR', 'CRI', '', 0, 1),
(52, 'Cote D''Ivoire', 'CI', 'CIV', '', 0, 1),
(53, 'Croatia', 'HR', 'HRV', '', 0, 1),
(54, 'Cuba', 'CU', 'CUB', '', 0, 1),
(55, 'Cyprus', 'CY', 'CYP', '', 0, 1),
(56, 'Czech Republic', 'CZ', 'CZE', '', 0, 1),
(57, 'Denmark', 'DK', 'DNK', '', 0, 1),
(58, 'Djibouti', 'DJ', 'DJI', '', 0, 1),
(59, 'Dominica', 'DM', 'DMA', '', 0, 1),
(60, 'Dominican Republic', 'DO', 'DOM', '', 0, 1),
(61, 'East Timor', 'TL', 'TLS', '', 0, 1),
(62, 'Ecuador', 'EC', 'ECU', '', 0, 1),
(63, 'Egypt', 'EG', 'EGY', '', 0, 1),
(64, 'El Salvador', 'SV', 'SLV', '', 0, 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '', 0, 1),
(66, 'Eritrea', 'ER', 'ERI', '', 0, 1),
(67, 'Estonia', 'EE', 'EST', '', 0, 1),
(68, 'Ethiopia', 'ET', 'ETH', '', 0, 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', 0, 1),
(70, 'Faroe Islands', 'FO', 'FRO', '', 0, 1),
(71, 'Fiji', 'FJ', 'FJI', '', 0, 1),
(72, 'Finland', 'FI', 'FIN', '', 0, 1),
(74, 'France, Metropolitan', 'FR', 'FRA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(75, 'French Guiana', 'GF', 'GUF', '', 0, 1),
(76, 'French Polynesia', 'PF', 'PYF', '', 0, 1),
(77, 'French Southern Territories', 'TF', 'ATF', '', 0, 1),
(78, 'Gabon', 'GA', 'GAB', '', 0, 1),
(79, 'Gambia', 'GM', 'GMB', '', 0, 1),
(80, 'Georgia', 'GE', 'GEO', '', 0, 1),
(81, 'Germany', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(82, 'Ghana', 'GH', 'GHA', '', 0, 1),
(83, 'Gibraltar', 'GI', 'GIB', '', 0, 1),
(84, 'Greece', 'GR', 'GRC', '', 0, 1),
(85, 'Greenland', 'GL', 'GRL', '', 0, 1),
(86, 'Grenada', 'GD', 'GRD', '', 0, 1),
(87, 'Guadeloupe', 'GP', 'GLP', '', 0, 1),
(88, 'Guam', 'GU', 'GUM', '', 0, 1),
(89, 'Guatemala', 'GT', 'GTM', '', 0, 1),
(90, 'Guinea', 'GN', 'GIN', '', 0, 1),
(91, 'Guinea-Bissau', 'GW', 'GNB', '', 0, 1),
(92, 'Guyana', 'GY', 'GUY', '', 0, 1),
(93, 'Haiti', 'HT', 'HTI', '', 0, 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '', 0, 1),
(95, 'Honduras', 'HN', 'HND', '', 0, 1),
(96, 'Hong Kong', 'HK', 'HKG', '', 0, 1),
(97, 'Hungary', 'HU', 'HUN', '', 0, 1),
(98, 'Iceland', 'IS', 'ISL', '', 0, 1),
(99, 'India', 'IN', 'IND', '', 0, 1),
(100, 'Indonesia', 'ID', 'IDN', '', 0, 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '', 0, 1),
(102, 'Iraq', 'IQ', 'IRQ', '', 0, 1),
(103, 'Ireland', 'IE', 'IRL', '', 0, 1),
(104, 'Israel', 'IL', 'ISR', '', 0, 1),
(105, 'Italy', 'IT', 'ITA', '', 0, 1),
(106, 'Jamaica', 'JM', 'JAM', '', 0, 1),
(107, 'Japan', 'JP', 'JPN', '', 0, 1),
(108, 'Jordan', 'JO', 'JOR', '', 0, 1),
(109, 'Kazakhstan', 'KZ', 'KAZ', '', 0, 1),
(110, 'Kenya', 'KE', 'KEN', '', 0, 1),
(111, 'Kiribati', 'KI', 'KIR', '', 0, 1),
(112, 'North Korea', 'KP', 'PRK', '', 0, 1),
(113, 'South Korea', 'KR', 'KOR', '', 0, 1),
(114, 'Kuwait', 'KW', 'KWT', '', 0, 1),
(115, 'Kyrgyzstan', 'KG', 'KGZ', '', 0, 1),
(116, 'Lao People''s Democratic Republic', 'LA', 'LAO', '', 0, 1),
(117, 'Latvia', 'LV', 'LVA', '', 0, 1),
(118, 'Lebanon', 'LB', 'LBN', '', 0, 1),
(119, 'Lesotho', 'LS', 'LSO', '', 0, 1),
(120, 'Liberia', 'LR', 'LBR', '', 0, 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', 0, 1),
(122, 'Liechtenstein', 'LI', 'LIE', '', 0, 1),
(123, 'Lithuania', 'LT', 'LTU', '', 0, 1),
(124, 'Luxembourg', 'LU', 'LUX', '', 0, 1),
(125, 'Macau', 'MO', 'MAC', '', 0, 1),
(126, 'FYROM', 'MK', 'MKD', '', 0, 1),
(127, 'Madagascar', 'MG', 'MDG', '', 0, 1),
(128, 'Malawi', 'MW', 'MWI', '', 0, 1),
(129, 'Malaysia', 'MY', 'MYS', '', 0, 1),
(130, 'Maldives', 'MV', 'MDV', '', 0, 1),
(131, 'Mali', 'ML', 'MLI', '', 0, 1),
(132, 'Malta', 'MT', 'MLT', '', 0, 1),
(133, 'Marshall Islands', 'MH', 'MHL', '', 0, 1),
(134, 'Martinique', 'MQ', 'MTQ', '', 0, 1),
(135, 'Mauritania', 'MR', 'MRT', '', 0, 1),
(136, 'Mauritius', 'MU', 'MUS', '', 0, 1),
(137, 'Mayotte', 'YT', 'MYT', '', 0, 1),
(138, 'Mexico', 'MX', 'MEX', '', 0, 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '', 0, 1),
(140, 'Moldova, Republic of', 'MD', 'MDA', '', 0, 1),
(141, 'Monaco', 'MC', 'MCO', '', 0, 1),
(142, 'Mongolia', 'MN', 'MNG', '', 0, 1),
(143, 'Montserrat', 'MS', 'MSR', '', 0, 1),
(144, 'Morocco', 'MA', 'MAR', '', 0, 1),
(145, 'Mozambique', 'MZ', 'MOZ', '', 0, 1),
(146, 'Myanmar', 'MM', 'MMR', '', 0, 1),
(147, 'Namibia', 'NA', 'NAM', '', 0, 1),
(148, 'Nauru', 'NR', 'NRU', '', 0, 1),
(149, 'Nepal', 'NP', 'NPL', '', 0, 1),
(150, 'Netherlands', 'NL', 'NLD', '', 0, 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', '', 0, 1),
(152, 'New Caledonia', 'NC', 'NCL', '', 0, 1),
(153, 'New Zealand', 'NZ', 'NZL', '', 0, 1),
(154, 'Nicaragua', 'NI', 'NIC', '', 0, 1),
(155, 'Niger', 'NE', 'NER', '', 0, 1),
(156, 'Nigeria', 'NG', 'NGA', '', 0, 1),
(157, 'Niue', 'NU', 'NIU', '', 0, 1),
(158, 'Norfolk Island', 'NF', 'NFK', '', 0, 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '', 0, 1),
(160, 'Norway', 'NO', 'NOR', '', 0, 1),
(161, 'Oman', 'OM', 'OMN', '', 0, 1),
(162, 'Pakistan', 'PK', 'PAK', '', 0, 1),
(163, 'Palau', 'PW', 'PLW', '', 0, 1),
(164, 'Panama', 'PA', 'PAN', '', 0, 1),
(165, 'Papua New Guinea', 'PG', 'PNG', '', 0, 1),
(166, 'Paraguay', 'PY', 'PRY', '', 0, 1),
(167, 'Peru', 'PE', 'PER', '', 0, 1),
(168, 'Philippines', 'PH', 'PHL', '', 0, 1),
(169, 'Pitcairn', 'PN', 'PCN', '', 0, 1),
(170, 'Poland', 'PL', 'POL', '', 0, 1),
(171, 'Portugal', 'PT', 'PRT', '', 0, 1),
(172, 'Puerto Rico', 'PR', 'PRI', '', 0, 1),
(173, 'Qatar', 'QA', 'QAT', '', 0, 1),
(174, 'Reunion', 'RE', 'REU', '', 0, 1),
(175, 'Romania', 'RO', 'ROM', '', 0, 1),
(176, 'Russian Federation', 'RU', 'RUS', '', 0, 1),
(177, 'Rwanda', 'RW', 'RWA', '', 0, 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '', 0, 1),
(179, 'Saint Lucia', 'LC', 'LCA', '', 0, 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', 0, 1),
(181, 'Samoa', 'WS', 'WSM', '', 0, 1),
(182, 'San Marino', 'SM', 'SMR', '', 0, 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', '', 0, 1),
(184, 'Saudi Arabia', 'SA', 'SAU', '', 0, 1),
(185, 'Senegal', 'SN', 'SEN', '', 0, 1),
(186, 'Seychelles', 'SC', 'SYC', '', 0, 1),
(187, 'Sierra Leone', 'SL', 'SLE', '', 0, 1),
(188, 'Singapore', 'SG', 'SGP', '', 0, 1),
(189, 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', 0, 1),
(190, 'Slovenia', 'SI', 'SVN', '', 0, 1),
(191, 'Solomon Islands', 'SB', 'SLB', '', 0, 1),
(192, 'Somalia', 'SO', 'SOM', '', 0, 1),
(193, 'South Africa', 'ZA', 'ZAF', '', 0, 1),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', 0, 1),
(195, 'Spain', 'ES', 'ESP', '', 0, 1),
(196, 'Sri Lanka', 'LK', 'LKA', '', 0, 1),
(197, 'St. Helena', 'SH', 'SHN', '', 0, 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '', 0, 1),
(199, 'Sudan', 'SD', 'SDN', '', 0, 1),
(200, 'Suriname', 'SR', 'SUR', '', 0, 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', 0, 1),
(202, 'Swaziland', 'SZ', 'SWZ', '', 0, 1),
(203, 'Sweden', 'SE', 'SWE', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(204, 'Switzerland', 'CH', 'CHE', '', 0, 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '', 0, 1),
(206, 'Taiwan', 'TW', 'TWN', '', 0, 1),
(207, 'Tajikistan', 'TJ', 'TJK', '', 0, 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '', 0, 1),
(209, 'Thailand', 'TH', 'THA', '', 0, 1),
(210, 'Togo', 'TG', 'TGO', '', 0, 1),
(211, 'Tokelau', 'TK', 'TKL', '', 0, 1),
(212, 'Tonga', 'TO', 'TON', '', 0, 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '', 0, 1),
(214, 'Tunisia', 'TN', 'TUN', '', 0, 1),
(215, 'Turkey', 'TR', 'TUR', '', 0, 1),
(216, 'Turkmenistan', 'TM', 'TKM', '', 0, 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '', 0, 1),
(218, 'Tuvalu', 'TV', 'TUV', '', 0, 1),
(219, 'Uganda', 'UG', 'UGA', '', 0, 1),
(220, 'Ukraine', 'UA', 'UKR', '', 0, 1),
(221, 'United Arab Emirates', 'AE', 'ARE', '', 0, 1),
(222, 'United Kingdom', 'GB', 'GBR', '', 1, 1),
(223, 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', 0, 1),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 0, 1),
(225, 'Uruguay', 'UY', 'URY', '', 0, 1),
(226, 'Uzbekistan', 'UZ', 'UZB', '', 0, 1),
(227, 'Vanuatu', 'VU', 'VUT', '', 0, 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '', 0, 1),
(229, 'Venezuela', 'VE', 'VEN', '', 0, 1),
(230, 'Viet Nam', 'VN', 'VNM', '', 0, 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '', 0, 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '', 0, 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '', 0, 1),
(234, 'Western Sahara', 'EH', 'ESH', '', 0, 1),
(235, 'Yemen', 'YE', 'YEM', '', 0, 1),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '', 0, 1),
(238, 'Zambia', 'ZM', 'ZMB', '', 0, 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', '', 0, 1),
(242, 'Montenegro', 'ME', 'MNE', '', 0, 1),
(243, 'Serbia', 'RS', 'SRB', '', 0, 1),
(244, 'Aaland Islands', 'AX', 'ALA', '', 0, 1),
(245, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '', 0, 1),
(246, 'Curacao', 'CW', 'CUW', '', 0, 1),
(247, 'Palestinian Territory, Occupied', 'PS', 'PSE', '', 0, 1),
(248, 'South Sudan', 'SS', 'SSD', '', 0, 1),
(249, 'St. Barthelemy', 'BL', 'BLM', '', 0, 1),
(250, 'St. Martin (French part)', 'MF', 'MAF', '', 0, 1),
(251, 'Canary Islands', 'IC', 'ICA', '', 0, 1),
(252, 'Ascension Island (British)', 'AC', 'ASC', '', 0, 1),
(253, 'Kosovo, Republic of', 'XK', 'UNK', '', 0, 1),
(254, 'Isle of Man', 'IM', 'IMN', '', 0, 1),
(255, 'Tristan da Cunha', 'TA', 'SHN', '', 0, 1),
(256, 'Guernsey', 'GG', 'GGY', '', 0, 1),
(257, 'Jersey', 'JE', 'JEY', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon`
--

CREATE TABLE IF NOT EXISTS `oc_coupon` (
  `coupon_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_coupon`
--

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', 10.0000, 0, 0, 0.0000, '2014-01-01', '2020-01-01', 10, '10', 0, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', 0.0000, 0, 1, 100.0000, '2014-01-01', '2014-02-01', 10, '10', 0, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', 10.0000, 0, 0, 10.0000, '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_category`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_history`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_product`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_currency`
--

CREATE TABLE IF NOT EXISTS `oc_currency` (
  `currency_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_currency`
--

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(2, 'US Dollar', 'USD', '$', '', '2', 1.00000000, 1, '2016-01-13 01:17:41');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer`
--

CREATE TABLE IF NOT EXISTS `oc_customer` (
  `customer_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer`
--

INSERT INTO `oc_customer` (`customer_id`, `customer_group_id`, `store_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `password`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `custom_field`, `ip`, `status`, `approved`, `safe`, `token`, `date_added`) VALUES
(1, 1, 0, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', 'eb7e4d491d5b21c26efb74498de07ceb50f0c53d', 'bpLMlb9Rp', NULL, NULL, 0, 1, '', '127.0.0.1', 1, 1, 0, '', '2015-11-03 20:49:55');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_activity`
--

CREATE TABLE IF NOT EXISTS `oc_customer_activity` (
  `activity_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_activity`
--

INSERT INTO `oc_customer_activity` (`activity_id`, `customer_id`, `key`, `data`, `ip`, `date_added`) VALUES
(1, 1, 'register', '{"customer_id":1,"name":"Andres Franco"}', '127.0.0.1', '2015-11-03 20:49:55'),
(2, 1, 'login', '{"customer_id":"1","name":"Andres Franco"}', '127.0.0.1', '2016-01-09 08:46:33'),
(3, 1, 'login', '{"customer_id":"1","name":"Andres Franco"}', '127.0.0.1', '2016-01-09 10:40:47'),
(4, 1, 'edit', '{"customer_id":"1","name":"Andres Franco"}', '127.0.0.1', '2016-01-09 10:41:53'),
(5, 1, 'login', '{"customer_id":"1","name":"Andres Franco"}', '127.0.0.1', '2016-01-09 12:25:32'),
(6, 1, 'login', '{"customer_id":"1","name":"Andres Franco"}', '127.0.0.1', '2016-01-09 17:04:57'),
(7, 1, 'login', '{"customer_id":"1","name":"Andres Franco"}', '127.0.0.1', '2016-01-11 18:32:13'),
(8, 1, 'order_account', '{"customer_id":"1","name":"Andres Franco","order_id":47}', '127.0.0.1', '2016-01-11 21:13:09'),
(9, 1, 'order_account', '{"customer_id":"1","name":"Andres Franco","order_id":50}', '127.0.0.1', '2016-01-11 21:21:08'),
(10, 1, 'order_account', '{"customer_id":"1","name":"Andres Franco","order_id":52}', '127.0.0.1', '2016-01-11 21:47:38'),
(11, 1, 'login', '{"customer_id":"1","name":"Andres Franco"}', '127.0.0.1', '2016-01-12 18:34:28'),
(12, 1, 'order_account', '{"customer_id":"1","name":"Andres Franco","order_id":75}', '127.0.0.1', '2016-01-12 19:35:36'),
(13, 1, 'order_account', '{"customer_id":"1","name":"Andres Franco","order_id":76}', '127.0.0.1', '2016-01-12 19:39:07'),
(14, 1, 'login', '{"customer_id":"1","name":"Andres Franco"}', '127.0.0.1', '2016-01-12 19:44:29');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_group`
--

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_group_description`
--

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_history`
--

CREATE TABLE IF NOT EXISTS `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_ip`
--

CREATE TABLE IF NOT EXISTS `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_ip`
--

INSERT INTO `oc_customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`) VALUES
(1, 1, '127.0.0.1', '2015-11-03 20:49:55');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_login`
--

CREATE TABLE IF NOT EXISTS `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_online`
--

CREATE TABLE IF NOT EXISTS `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_reward`
--

CREATE TABLE IF NOT EXISTS `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_wishlist`
--

CREATE TABLE IF NOT EXISTS `oc_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_description`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value_description`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_download`
--

CREATE TABLE IF NOT EXISTS `oc_download` (
  `download_id` int(11) NOT NULL,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_download_description`
--

CREATE TABLE IF NOT EXISTS `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_event`
--

CREATE TABLE IF NOT EXISTS `oc_event` (
  `event_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_event`
--

INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`) VALUES
(1, 'voucher', 'post.order.history.add', 'total/voucher/send');

-- --------------------------------------------------------

--
-- Table structure for table `oc_extension`
--

CREATE TABLE IF NOT EXISTS `oc_extension` (
  `extension_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(1, 'payment', 'cod'),
(2, 'total', 'shipping'),
(3, 'total', 'sub_total'),
(4, 'total', 'tax'),
(5, 'total', 'total'),
(6, 'module', 'banner'),
(7, 'module', 'carousel'),
(8, 'total', 'credit'),
(9, 'shipping', 'flat'),
(10, 'total', 'handling'),
(11, 'total', 'low_order_fee'),
(12, 'total', 'coupon'),
(13, 'module', 'category'),
(14, 'module', 'account'),
(15, 'total', 'reward'),
(16, 'total', 'voucher'),
(17, 'payment', 'free_checkout'),
(18, 'module', 'featured'),
(19, 'module', 'slideshow'),
(20, 'module', 'information'),
(21, 'module', 'information'),
(22, 'module', 'bestseller'),
(23, 'module', 'latest'),
(24, 'module', 'special'),
(25, 'module', 'affiliate'),
(26, 'module', 'html'),
(27, 'module', 'filter'),
(28, 'payment', 'pp_standard'),
(41, 'payment', 'pp_express'),
(32, 'shipping', 'free'),
(39, 'payment', 'paypal_advanced');

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter`
--

CREATE TABLE IF NOT EXISTS `oc_filter` (
  `filter_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_description`
--

CREATE TABLE IF NOT EXISTS `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group`
--

CREATE TABLE IF NOT EXISTS `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_geo_zone`
--

CREATE TABLE IF NOT EXISTS `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_geo_zone`
--

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, 'UK VAT Zone', 'UK VAT', '2010-02-26 22:33:24', '2009-01-06 23:26:25'),
(4, 'UK Shipping', 'UK Shipping Zones', '2010-12-15 15:18:13', '2009-06-23 01:14:53');

-- --------------------------------------------------------

--
-- Table structure for table `oc_information`
--

CREATE TABLE IF NOT EXISTS `oc_information` (
  `information_id` int(11) NOT NULL,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information`
--

INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1),
(6, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_description`
--

CREATE TABLE IF NOT EXISTS `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_description`
--

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(4, 1, 'About Us', '&lt;p&gt;Ribbon Revolution showcases an array of cancer, disease, syndrome and health awareness shirts, apparel, merchandise and original gifts to take a stand for your cause brought to you by survivors and advocates.&amp;nbsp; Shop our variety of shops located on the banners to your right.&lt;/p&gt;\r\n', 'About Us', '', ''),
(5, 1, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', '', '', ''),
(3, 1, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', '', '', ''),
(6, 1, 'Shipping Information', '&lt;p&gt;After you payment has cleared and the 24 hour cancellation period has expired, we will then proceed to process your order then print your shirt.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt; We ship between 3 to 5 Business Days after payment clearance. We utilize USPS First Class Mail with delivery confirmation. We do not ship weekends and certain holidays. &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;NOTE: At this time, we do not offer expedited shipping.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;', 'Shipping Information', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_to_layout`
--

INSERT INTO `oc_information_to_layout` (`information_id`, `store_id`, `layout_id`) VALUES
(6, 0, 0),
(4, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_language`
--

CREATE TABLE IF NOT EXISTS `oc_language` (
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_language`
--

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(1, 'English', 'en', 'en_US.UTF-8,en_US,en-gb,english', 'gb.png', 'english', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout`
--

CREATE TABLE IF NOT EXISTS `oc_layout` (
  `layout_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(12, 'Compare'),
(13, 'Search');

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout_module`
--

CREATE TABLE IF NOT EXISTS `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=263 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_layout_module`
--

INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(2, 4, '0', 'content_top', 0),
(3, 4, '0', 'content_top', 1),
(20, 5, '0', 'column_left', 2),
(69, 10, 'affiliate', 'column_right', 1),
(68, 6, 'account', 'column_right', 1),
(72, 3, 'category', 'column_left', 1),
(73, 3, 'banner.30', 'column_left', 2),
(262, 1, 'html.48', 'content_bottom', 5),
(261, 1, 'html.46', 'headertop', 0),
(260, 1, 'html.43', 'footerright', 0),
(259, 1, 'featured.37', 'content_bottom', 4),
(258, 1, 'carousel.42', 'content_bottom', 8),
(257, 1, 'html.47', 'content_bottom', 7),
(256, 1, 'slideshow.38', 'content_top', 1),
(255, 1, 'latest.33', 'content_bottom', 6),
(254, 1, 'html.44', 'footerbottom', 0),
(253, 1, 'html.45', 'footertop', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout_route`
--

CREATE TABLE IF NOT EXISTS `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(38, 6, 0, 'account/%'),
(17, 10, 0, 'affiliate/%'),
(44, 3, 0, 'product/category'),
(85, 1, 0, 'common/home'),
(20, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(23, 7, 0, 'checkout/%'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(34, 4, 0, ''),
(45, 5, 0, 'product/manufacturer'),
(52, 12, 0, 'product/compare'),
(53, 13, 0, 'product/search');

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class`
--

CREATE TABLE IF NOT EXISTS `oc_length_class` (
  `length_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_length_class`
--

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1, 1.00000000),
(2, 10.00000000),
(3, 0.39370000);

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class_description`
--

CREATE TABLE IF NOT EXISTS `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_length_class_description`
--

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Centimeter', 'cm'),
(2, 1, 'Millimeter', 'mm'),
(3, 1, 'Inch', 'in');

-- --------------------------------------------------------

--
-- Table structure for table `oc_location`
--

CREATE TABLE IF NOT EXISTS `oc_location` (
  `location_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer`
--

CREATE TABLE IF NOT EXISTS `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_marketing`
--

CREATE TABLE IF NOT EXISTS `oc_marketing` (
  `marketing_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_modification`
--

CREATE TABLE IF NOT EXISTS `oc_modification` (
  `modification_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_module`
--

CREATE TABLE IF NOT EXISTS `oc_module` (
  `module_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_module`
--

INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(30, 'Category', 'banner', '{"name":"Category","banner_id":"6","width":"182","height":"182","status":"0"}'),
(29, 'Home Page', 'carousel', '{"name":"Home Page","banner_id":"8","width":"130","height":"100","status":"1"}'),
(28, 'Home Page', 'featured', '{"name":"Home Page","product":["43","40","42","30"],"limit":"4","width":"200","height":"200","status":"0"}'),
(27, 'Home Page', 'slideshow', '{"name":"Home Page","banner_id":"7","width":"1140","height":"380","status":"1"}'),
(31, 'Banner 1', 'banner', '{"name":"Banner 1","banner_id":"6","width":"182","height":"182","status":"1"}'),
(32, 'Bestseller_Column_left', 'bestseller', '{"name":"Bestseller_Column_left","limit":"3","width":"100","height":"100","status":"1"}'),
(33, 'home_latest', 'latest', '{"name":"home_latest","limit":"7","width":"230","height":"280","status":"1"}'),
(34, 'Latest_Column_left', 'latest', '{"name":"Latest_Column_left","limit":"3","width":"100","height":"100","status":"1"}'),
(35, 'Special_Column_left', 'special', '{"name":"Special_Column_left","limit":"3","width":"100","height":"100","status":"1"}'),
(36, 'Special_Column_left', 'special', '{"name":"Special_Column_left","limit":"3","width":"100","height":"100","status":"0"}'),
(37, 'Featured - Home Page', 'featured', '{"name":"Featured - Home Page","product":["53","51","50","54"],"limit":"7","width":"230","height":"280","status":"1"}'),
(38, 'Slideshow - Home Page', 'slideshow', '{"name":"Slideshow - Home Page","banner_id":"9","width":"1903","height":"641","status":"1"}'),
(39, 'sub_banner', 'banner', '{"name":"sub_banner","banner_id":"10","width":"624","height":"295","status":"1"}'),
(40, 'sub_banner1', 'banner', '{"name":"sub_banner1","banner_id":"11","width":"312","height":"295","status":"1"}'),
(41, 'sub_banner2', 'banner', '{"name":"sub_banner2","banner_id":"12","width":"312","height":"295","status":"1"}'),
(42, 'Stores', 'carousel', '{"name":"Stores","banner_id":"13","width":"137","height":"25","status":"1"}'),
(43, 'Footer_Right_CMS', 'html', '{"name":"Footer_Right_CMS","module_description":{"1":{"title":"","description":"&lt;div class=&quot;block_contact column&quot; id=&quot;contact_us&quot;&gt;&lt;h5&gt;Contact us&lt;\\/h5&gt;\\r\\n\\r\\n&lt;ul&gt;\\r\\n\\r\\n&lt;li class=&quot;company&quot;&gt;Awareness Ribbon Revolution&lt;\\/li&gt;\\r\\n\\r\\n&lt;li&gt;P.O. Box 4041&lt;\\/li&gt;\\r\\n\\r\\n&lt;li&gt;Covina, CA 91723&lt;\\/li&gt;\\r\\n\\r\\n&lt;li class=&quot;phoneno&quot;&gt;&lt;\\/li&gt;\\r\\n\\r\\n&lt;li&gt;&lt;a href=&quot;#&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n&lt;\\/ul&gt;\\r\\n\\r\\n&lt;\\/div&gt;\\r\\n\\r\\n&lt;div class=&quot;column&quot; id=&quot;socialpayment&quot;&gt;&lt;div class=&quot;social&quot;&gt;&lt;h5&gt;Stay Connected&lt;\\/h5&gt;\\r\\n\\r\\n&lt;ul class=&quot;social_block&quot;&gt;\\r\\n\\r\\n&lt;li class=&quot;facebook&quot;&gt;&lt;a href=&quot;https:\\/\\/www.facebook.com\\/awarenessribbonrevolution\\/?ref=bookmarks&quot;&gt;&amp;nbsp;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n&lt;li class=&quot;twitter&quot;&gt;&lt;a href=&quot;https:\\/\\/twitter.com\\/RibbnRevolution&quot;&gt;&amp;nbsp;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n&lt;li class=&quot;pinterest&quot;&gt;&lt;a href=&quot;https:\\/\\/www.pinterest.com\\/awarenessgear\\/&quot;&gt;&amp;nbsp;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n&lt;\\/ul&gt;\\r\\n\\r\\n&lt;\\/div&gt;\\r\\n\\r\\n&lt;div calss=&quot;payment&quot;&gt;&lt;h5&gt;Payment Method&lt;\\/h5&gt;\\r\\n\\r\\n&lt;ul class=&quot;payment_block&quot;&gt;\\r\\n\\r\\n&lt;li class=&quot;visa&quot;&gt;&lt;a href=&quot;#&quot;&gt;&amp;nbsp;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n&lt;li class=&quot;master&quot;&gt;&lt;a href=&quot;#&quot;&gt;&amp;nbsp;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n&lt;li class=&quot;express&quot;&gt;&lt;a href=&quot;#&quot;&gt;&amp;nbsp;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n&lt;\\/ul&gt;\\r\\n\\r\\n&lt;\\/div&gt;\\r\\n\\r\\n&lt;\\/div&gt;"}},"status":"1"}'),
(44, 'Footer_Bottom_CMS', 'html', '{"name":"Footer_Bottom_CMS","module_description":{"1":{"title":"","description":"&lt;div id=&quot;bottomfooter_link&quot;&gt;&lt;ul&gt;\\r\\n &lt;li class=&quot;first&quot;&gt;&lt;span&gt;CLOTHES:&lt;\\/span&gt;&lt;\\/li&gt;\\r\\n&lt;li&gt;&lt;a href=&quot;#&quot;&gt;T-Shirts&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n&lt;\\/ul&gt;\\r\\n&lt;div class=&quot;discription&quot;&gt;&lt;p&gt;&lt;br&gt;&lt;\\/p&gt;\\r\\n&lt;\\/div&gt;\\r\\n&lt;\\/div&gt;"}},"status":"1"}'),
(45, 'Footer_Top_CMS', 'html', '{"name":"Footer_Top_CMS","module_description":{"1":{"title":"","description":"&lt;div class=&quot;subbanner3_block&quot;&gt;&lt;div class=&quot;subbanner3&quot;&gt;&lt;div class=&quot;subbanner3_1&quot;&gt;&lt;ul&gt;&lt;li class=&quot;first&quot;&gt;Customare care 24\\/7&lt;\\/li&gt;&lt;li class=&quot;second&quot;&gt;Hours : - 14.0123456789&lt;\\/li&gt;&lt;\\/ul&gt;&lt;div class=&quot;img&quot;&gt;&amp;nbsp;&lt;\\/div&gt;&lt;\\/div&gt;&lt;div class=&quot;subbanner3_2&quot;&gt;&lt;ul&gt;&lt;li class=&quot;first&quot;&gt;Money Back Guarantee&lt;\\/li&gt;&lt;li class=&quot;second&quot;&gt;At vero et accusamas et&lt;\\/li&gt;&lt;\\/ul&gt;&lt;div class=&quot;img&quot;&gt;&amp;nbsp;&lt;\\/div&gt;&lt;\\/div&gt;&lt;div class=&quot;subbanner3_3&quot;&gt;&lt;ul&gt;&lt;li class=&quot;first&quot;&gt;Special Gift Cart&lt;\\/li&gt;&lt;li class=&quot;second&quot;&gt;At vero et accusamas et&lt;\\/li&gt;&lt;\\/ul&gt;&lt;div class=&quot;img&quot;&gt;&amp;nbsp;&lt;\\/div&gt;&lt;\\/div&gt;&lt;div class=&quot;subbanner3_4&quot;&gt;&lt;ul&gt;&lt;li class=&quot;first&quot;&gt;Free Shipping&lt;\\/li&gt;&lt;li class=&quot;second&quot;&gt;On order over $99&lt;\\/li&gt;&lt;\\/ul&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;"}},"status":"1"}'),
(46, 'Header_Top_CMS', 'html', '{"name":"Header_Top_CMS","module_description":{"1":{"title":"","description":"&lt;div class=&quot;header_call&quot;&gt;\\r\\n&lt;ul&gt;\\r\\n&lt;li class=&quot;contact&quot;&gt;(+91)123 456 789&lt;\\/li&gt;\\r\\n&lt;li class=&quot;email&quot;&gt;&lt;a href=&quot;#&quot;&gt;info@templatemela.com &lt;\\/a&gt; &lt;\\/li&gt;\\r\\n&lt;\\/ul&gt;\\r\\n&lt;\\/div&gt;"}},"status":"1"}'),
(47, 'Homepage_Blog_CMS', 'html', '{"name":"Homepage_Blog_CMS","module_description":{"1":{"title":"","description":"&lt;div class=&quot;homepage-testimonial-block&quot;&gt;&lt;div class=&quot;homepage-testimonial-block-inner&quot;&gt;&lt;div class=&quot;homepage-testimonials-inner&quot; id=&quot;testimonial&quot;&gt;&lt;div class=&quot;box-heading&quot;&gt;&lt;div class=&quot;static-blog&quot;&gt;News&lt;\\/div&gt;&lt;\\/div&gt;&lt;div class=&quot;customNavigation&quot;&gt;&lt;a class=&quot;btn prev&quot;&gt;&amp;nbsp;&lt;\\/a&gt;&lt;a class=&quot;btn next&quot;&gt;&amp;nbsp;&lt;\\/a&gt;&lt;\\/div&gt;&lt;div class=&quot;products product-carousel&quot; id=&quot;testimonial-carousel&quot;&gt;&lt;div class=&quot;slider-item&quot;&gt;&lt;div class=&quot;product-block&quot;&gt;&lt;div class=&quot;img&quot;&gt;&lt;div class=&quot;img_inner&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;...\\/image\\/catalog\\/blogimg.jpg&quot;&gt;&lt;\\/a&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;div class=&quot;content-wrapper&quot;&gt;&lt;div class=&quot;content1&quot;&gt;&lt;a href=&quot;#&quot;&gt;The Standard chunk ipspum&lt;\\/a&gt;&lt;\\/div&gt;&lt;div class=&quot;author&quot;&gt;by admin- March28,2014&lt;\\/div&gt;&lt;div class=&quot;comment&quot;&gt;5 comments &lt;\\/div&gt;&lt;div class=&quot;desc&quot;&gt;Vestibulum ante ipsum primis urna risus suscipit leo Cras eget augue vitae neque euismod congue quis non erat.&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;div class=&quot;slider-item&quot;&gt;&lt;div class=&quot;product-block&quot;&gt;&lt;div class=&quot;img&quot;&gt;&lt;div class=&quot;img_inner&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;...\\/image\\/catalog\\/blogimg1.jpg&quot;&gt;&lt;\\/a&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;div class=&quot;content-wrapper&quot;&gt;&lt;div class=&quot;content1&quot;&gt;&lt;a href=&quot;#&quot;&gt;The Standard chunk ipspum&lt;\\/a&gt;&lt;\\/div&gt;&lt;div class=&quot;author&quot;&gt;by admin- March28,2014&lt;\\/div&gt;&lt;div class=&quot;comment&quot;&gt;5 comments&lt;\\/div&gt;&lt;div class=&quot;desc&quot;&gt;Vestibulum ante ipsum primis urna risus suscipit leo Cras eget augue vitae neque euismod congue quis non erat.&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;div class=&quot;slider-item&quot;&gt;&lt;div class=&quot;product-block&quot;&gt;&lt;div class=&quot;img&quot;&gt;&lt;div class=&quot;img_inner&quot;&gt;&lt;a href=&quot;#&quot;&gt; &lt;img alt=&quot;&quot; src=&quot;...\\/image\\/catalog\\/blogimg2.jpg&quot;&gt;&lt;\\/a&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;div class=&quot;content-wrapper&quot;&gt;&lt;div class=&quot;content1&quot;&gt;&lt;a href=&quot;#&quot;&gt;The Standard chunk ipspum&lt;\\/a&gt;&lt;\\/div&gt;&lt;div class=&quot;author&quot;&gt;by admin- March28,2014&lt;\\/div&gt;&lt;div class=&quot;comment&quot;&gt;5 comments&lt;\\/div&gt;&lt;div class=&quot;desc&quot;&gt;Vestibulum ante ipsum primis urna risus suscipit leo Cras eget augue vitae neque euismod congue quis non erat.&lt;\\/div&gt; &lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;div class=&quot;slider-item&quot;&gt;&lt;div class=&quot;product-block&quot;&gt;&lt;div class=&quot;img&quot;&gt;&lt;div class=&quot;img_inner&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;...\\/image\\/catalog\\/blogimg3.jpg&quot;&gt; &lt;\\/a&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;div class=&quot;content-wrapper&quot;&gt;&lt;div class=&quot;content1&quot;&gt;&lt;a href=&quot;#&quot;&gt;The Standard chunk ipspum&lt;\\/a&gt;&lt;\\/div&gt;&lt;div class=&quot;author&quot;&gt;by admin- March28,2014&lt;\\/div&gt;&lt;div class=&quot;comment&quot;&gt;5 comments&lt;\\/div&gt;&lt;div class=&quot;desc&quot;&gt;Vestibulum ante ipsum primis urna risus suscipit leo Cras eget augue vitae neque euismod congue quis non erat.&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;div class=&quot;viewmore&quot;&gt;&lt;a class=&quot;button&quot; href=&quot;#&quot;&gt;View More&lt;\\/a&gt;&lt;\\/div&gt;&lt;div class=&quot;testimonial_default_width&quot; style=&quot;display: none; visibility: hidden;&quot;&gt;&amp;nbsp;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;"}},"status":"1"}'),
(48, 'Homepage_Banner_CMS', 'html', '{"name":"Homepage_Banner_CMS","module_description":{"1":{"title":"","description":"&lt;div class=&quot;tmcmsblock clear&quot; id=&quot;tmcmsblock&quot;&gt;&lt;div class=&quot;subbanner2&quot;&gt;&lt;div class=&quot;subbanner2_2&quot;&gt;&lt;a href=&quot;https:\\/\\/www.etsy.com\\/shop\\/RibbonRevolution&quot;&gt;&lt;img src=&quot;http:\\/\\/localhost\\/store\\/image\\/catalog\\/sub_banner2\\/268x252banner.png&quot;&gt;&lt;\\/a&gt;&lt;\\/div&gt;&lt;div class=&quot;subbanner2_3&quot;&gt;&lt;a href=&quot;https:\\/\\/www.etsy.com\\/shop\\/RibbonRevolution&quot;&gt;&lt;img src=&quot;http:\\/\\/localhost\\/store\\/image\\/catalog\\/sub_banner2\\/699x252banner.png&quot;&gt;&lt;\\/a&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;"}},"status":"1"}');

-- --------------------------------------------------------

--
-- Table structure for table `oc_option`
--

CREATE TABLE IF NOT EXISTS `oc_option` (
  `option_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option`
--

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 1),
(2, 'checkbox', 2),
(4, 'text', 3),
(5, 'select', 4),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 12),
(12, 'date', 11),
(13, 'select', 0),
(14, 'select', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_description`
--

CREATE TABLE IF NOT EXISTS `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_description`
--

INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 1, 'Radio'),
(2, 1, 'Checkbox'),
(4, 1, 'Text'),
(6, 1, 'Textarea'),
(8, 1, 'Date'),
(7, 1, 'File'),
(5, 1, 'Select'),
(9, 1, 'Time'),
(10, 1, 'Date &amp; Time'),
(12, 1, 'Delivery Date'),
(11, 1, 'Size'),
(13, 1, 'Style'),
(14, 1, 'Color');

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value`
--

CREATE TABLE IF NOT EXISTS `oc_option_value` (
  `option_value_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_value`
--

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(39, 5, '', 1),
(40, 5, '', 2),
(31, 1, '', 2),
(23, 2, '', 1),
(24, 2, '', 2),
(57, 11, '', 12),
(56, 11, '', 11),
(55, 11, '', 10),
(50, 13, '', 2),
(53, 11, '', 9),
(52, 11, '', 8),
(51, 11, '', 7),
(49, 13, '', 1),
(48, 11, '', 6),
(47, 11, '', 5),
(46, 11, '', 4),
(58, 11, '', 3),
(59, 11, '', 2),
(60, 11, '', 1),
(61, 14, '', 0),
(62, 14, '', 0),
(63, 14, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value_description`
--

CREATE TABLE IF NOT EXISTS `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_value_description`
--

INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(43, 1, 1, 'Large'),
(32, 1, 1, 'Small'),
(45, 1, 2, 'Checkbox 4'),
(44, 1, 2, 'Checkbox 3'),
(31, 1, 1, 'Medium'),
(42, 1, 5, 'Yellow'),
(41, 1, 5, 'Green'),
(39, 1, 5, 'Red'),
(40, 1, 5, 'Blue'),
(23, 1, 2, 'Checkbox 1'),
(24, 1, 2, 'Checkbox 2'),
(55, 1, 11, 'XL-Men'),
(53, 1, 11, 'L-Men'),
(51, 1, 11, 'S-Men'),
(52, 1, 11, 'M-Men'),
(48, 1, 11, '3XL- Ladies'),
(47, 1, 11, 'XXL-Ladies'),
(46, 1, 11, 'XL-Ladies'),
(50, 1, 13, 'Men'),
(49, 1, 13, 'Ladies'),
(58, 1, 11, 'L-Ladies'),
(59, 1, 11, 'M-Ladies'),
(60, 1, 11, 'S-Ladies'),
(56, 1, 11, 'XXL-Men'),
(57, 1, 11, '3XL-Men'),
(61, 1, 14, 'White'),
(62, 1, 14, 'Black'),
(63, 1, 14, 'Navy Blue');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order`
--

CREATE TABLE IF NOT EXISTS `oc_order` (
  `order_id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(40) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_order`
--

INSERT INTO `oc_order` (`order_id`, `invoice_no`, `invoice_prefix`, `store_id`, `store_name`, `store_url`, `customer_id`, `customer_group_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `custom_field`, `payment_firstname`, `payment_lastname`, `payment_company`, `payment_address_1`, `payment_address_2`, `payment_city`, `payment_postcode`, `payment_country`, `payment_country_id`, `payment_zone`, `payment_zone_id`, `payment_address_format`, `payment_custom_field`, `payment_method`, `payment_code`, `shipping_firstname`, `shipping_lastname`, `shipping_company`, `shipping_address_1`, `shipping_address_2`, `shipping_city`, `shipping_postcode`, `shipping_country`, `shipping_country_id`, `shipping_zone`, `shipping_zone_id`, `shipping_address_format`, `shipping_custom_field`, `shipping_method`, `shipping_code`, `comment`, `total`, `order_status_id`, `affiliate_id`, `commission`, `marketing_id`, `tracking`, `language_id`, `currency_id`, `currency_code`, `currency_value`, `ip`, `forwarded_ip`, `user_agent`, `accept_language`, `date_added`, `date_modified`) VALUES
(1, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'PayPal', 'pp_standard', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Flat Shipping Rate', 'flat.flat', '', 27.9900, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 08:47:23', '2016-01-09 08:47:23'),
(2, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'PayPal', 'pp_standard', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Flat Shipping Rate', 'flat.flat', '', 27.9900, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 08:52:10', '2016-01-09 08:52:10'),
(3, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Flat Shipping Rate', 'flat.flat', '', 27.9900, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 09:26:40', '2016-01-09 09:26:40'),
(4, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Flat Shipping Rate', 'flat.flat', '', 27.9900, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 09:27:14', '2016-01-09 09:27:14'),
(5, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Flat Shipping Rate', 'flat.flat', '', 27.9900, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 09:28:11', '2016-01-09 09:28:11'),
(6, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Flat Shipping Rate', 'flat.flat', '', 27.9900, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 09:31:16', '2016-01-09 09:31:16'),
(7, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Flat Shipping Rate', 'flat.flat', '', 52.9800, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 10:41:01', '2016-01-09 10:41:01'),
(8, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Flat Shipping Rate', 'flat.flat', '', 52.9800, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 10:44:05', '2016-01-09 10:44:05'),
(9, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Flat Shipping Rate', 'flat.flat', '', 27.9900, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 10:47:01', '2016-01-09 10:47:01'),
(10, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Flat Shipping Rate', 'flat.flat', '', 27.9900, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 10:51:52', '2016-01-09 10:51:52'),
(11, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Flat Shipping Rate', 'flat.flat', '', 27.9900, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 11:03:08', '2016-01-09 11:03:08'),
(12, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Flat Shipping Rate', 'flat.flat', '', 27.9900, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 11:08:55', '2016-01-09 11:08:55'),
(13, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Flat Shipping Rate', 'flat.flat', '', 52.9800, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 11:11:20', '2016-01-09 11:11:20'),
(14, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Flat Shipping Rate', 'flat.flat', '', 52.9800, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 11:12:31', '2016-01-09 11:12:31'),
(15, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 47.9800, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 11:30:19', '2016-01-09 11:30:19'),
(16, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 72.9700, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 12:25:44', '2016-01-09 12:25:44'),
(17, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 72.9700, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 12:28:50', '2016-01-09 12:28:50'),
(18, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 72.9700, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 12:30:07', '2016-01-09 12:30:07'),
(19, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 72.9700, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 12:33:59', '2016-01-09 12:33:59'),
(20, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 72.9700, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 12:35:13', '2016-01-09 12:35:13'),
(21, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 72.9700, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 12:37:22', '2016-01-09 12:37:22'),
(22, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 72.9700, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 12:38:15', '2016-01-09 12:38:15'),
(23, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 72.9700, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 12:50:49', '2016-01-09 12:50:49'),
(24, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card (Processed securely by PayPal)', 'pp_pro', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 72.9700, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 12:54:12', '2016-01-09 12:54:12'),
(25, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card (Processed securely by PayPal)', 'pp_pro', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.0000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 13:15:04', '2016-01-09 13:15:04'),
(26, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card (Processed securely by PayPal)', 'pp_pro', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 1.0000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 13:22:41', '2016-01-09 13:22:41'),
(27, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'PayPal', 'pp_standard', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 1.0000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 13:27:12', '2016-01-09 13:27:12'),
(28, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card (Processed securely by PayPal)', 'pp_pro', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.1000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 13:33:31', '2016-01-09 13:33:31'),
(29, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'PayPal', 'pp_standard', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.1000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 13:33:47', '2016-01-09 13:33:47'),
(30, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'PayPal Express Checkout', 'pp_express', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.1000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 14:13:06', '2016-01-09 14:13:06'),
(31, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'PayPal', 'pp_standard', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.1000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 14:18:30', '2016-01-09 14:18:30'),
(32, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'PayPal', 'pp_standard', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.1000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 14:18:30', '2016-01-09 14:18:30'),
(33, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'PayPal', 'pp_standard', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.2000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-09 19:36:06', '2016-01-09 19:36:06'),
(34, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.3000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-11 18:32:29', '2016-01-11 18:32:29'),
(35, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.3000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-11 18:33:02', '2016-01-11 18:33:02'),
(36, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.3000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-11 18:33:48', '2016-01-11 18:33:48'),
(37, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'PayPal', 'pp_standard', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.3000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-11 18:35:53', '2016-01-11 18:35:53'),
(38, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.3000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-11 18:37:36', '2016-01-11 18:37:36'),
(39, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.3000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-11 18:46:18', '2016-01-11 18:46:18'),
(40, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'PayPal', 'pp_standard', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.3000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-11 19:33:01', '2016-01-11 19:33:01'),
(41, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Paypal Advanced', 'paypal_advanced', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.3000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-11 19:39:43', '2016-01-11 19:39:43'),
(42, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.1000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-11 20:22:31', '2016-01-11 20:22:31'),
(43, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'PayPal', 'pp_standard', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.1000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-11 20:24:38', '2016-01-11 20:24:38'),
(44, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Paypal Advanced', 'paypal_advanced', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.1000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-11 20:25:02', '2016-01-11 20:25:02'),
(45, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.1000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-11 20:29:47', '2016-01-11 20:29:47'),
(46, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card (Processed securely by PayPal)', 'pp_pro', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.1000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-11 21:08:52', '2016-01-11 21:08:52'),
(47, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card (Processed securely by PayPal)', 'pp_pro', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.1000, 7, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-11 21:12:36', '2016-01-11 21:13:09'),
(48, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.1000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-11 21:17:08', '2016-01-11 21:17:08'),
(49, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.1000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-11 21:20:04', '2016-01-11 21:20:04'),
(50, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card (Processed securely by PayPal)', 'pp_pro', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.1000, 15, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-11 21:20:28', '2016-01-11 21:21:08'),
(51, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.1000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-11 21:24:03', '2016-01-11 21:24:03'),
(52, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card (Processed securely by PayPal)', 'pp_pro', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.1000, 15, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-11 21:46:54', '2016-01-11 21:47:38'),
(53, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.1000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-11 22:19:10', '2016-01-11 22:19:10'),
(54, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'PayPal', 'pp_standard', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.1000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-11 22:40:07', '2016-01-11 22:40:07'),
(55, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.1000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-11 22:45:30', '2016-01-11 22:45:30'),
(56, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card (Processed securely by PayPal)', 'pp_pro', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.1000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-11 22:53:34', '2016-01-11 22:53:34'),
(57, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'PayPal', 'pp_standard', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.1000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-11 22:53:45', '2016-01-11 22:53:45'),
(58, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.1000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-11 23:01:56', '2016-01-11 23:01:56'),
(59, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card', 'pp_pro_iframe', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.1000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-11 23:05:30', '2016-01-11 23:05:30'),
(60, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Paypal Advanced', 'paypal_advanced', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.2000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-12 18:34:38', '2016-01-12 18:34:38'),
(61, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Paypal Advanced', 'paypal_advanced', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.2000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-12 18:49:11', '2016-01-12 18:49:11'),
(62, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Paypal Advanced', 'paypal_advanced', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.2000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-12 18:49:54', '2016-01-12 18:49:54'),
(63, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Paypal Advanced', 'paypal_advanced', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.2000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-12 18:53:38', '2016-01-12 18:53:38'),
(64, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Paypal Advanced', 'paypal_advanced', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.2000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-12 18:53:39', '2016-01-12 18:53:39'),
(65, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Paypal Advanced', 'paypal_advanced', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.2000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-12 18:55:00', '2016-01-12 18:55:00'),
(66, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'PayPal Express Checkout', 'pp_express', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.2000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-12 18:55:41', '2016-01-12 18:55:41'),
(67, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Paypal Advanced', 'paypal_advanced', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.2000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-12 18:56:42', '2016-01-12 18:56:42'),
(68, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Paypal Advanced', 'paypal_advanced', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.2000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-12 19:06:39', '2016-01-12 19:06:39'),
(69, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Paypal Advanced', 'paypal_advanced', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.2000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-12 19:14:48', '2016-01-12 19:14:48'),
(70, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Paypal Advanced', 'paypal_advanced', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.2000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-12 19:17:29', '2016-01-12 19:17:29'),
(71, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Paypal Advanced', 'paypal_advanced', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.2000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-12 19:26:17', '2016-01-12 19:26:17'),
(72, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Paypal Advanced', 'paypal_advanced', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.1000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-12 19:28:35', '2016-01-12 19:28:35'),
(73, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Paypal Advanced', 'paypal_advanced', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.1000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-12 19:29:24', '2016-01-12 19:29:24'),
(74, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Paypal Advanced', 'paypal_advanced', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.1000, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-12 19:30:11', '2016-01-12 19:30:11'),
(75, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Paypal Advanced', 'paypal_advanced', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.0300, 7, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-12 19:32:11', '2016-01-12 19:35:35'),
(76, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Paypal Advanced', 'paypal_advanced', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.0300, 7, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-12 19:37:48', '2016-01-12 19:39:06'),
(77, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Paypal Advanced', 'paypal_advanced', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.0300, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', 'en-US,en;q=0.8', '2016-01-12 19:44:39', '2016-01-12 19:44:39');
INSERT INTO `oc_order` (`order_id`, `invoice_no`, `invoice_prefix`, `store_id`, `store_name`, `store_url`, `customer_id`, `customer_group_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `custom_field`, `payment_firstname`, `payment_lastname`, `payment_company`, `payment_address_1`, `payment_address_2`, `payment_city`, `payment_postcode`, `payment_country`, `payment_country_id`, `payment_zone`, `payment_zone_id`, `payment_address_format`, `payment_custom_field`, `payment_method`, `payment_code`, `shipping_firstname`, `shipping_lastname`, `shipping_company`, `shipping_address_1`, `shipping_address_2`, `shipping_city`, `shipping_postcode`, `shipping_country`, `shipping_country_id`, `shipping_zone`, `shipping_zone_id`, `shipping_address_format`, `shipping_custom_field`, `shipping_method`, `shipping_code`, `comment`, `total`, `order_status_id`, `affiliate_id`, `commission`, `marketing_id`, `tracking`, `language_id`, `currency_id`, `currency_code`, `currency_value`, `ip`, `forwarded_ip`, `user_agent`, `accept_language`, `date_added`, `date_modified`) VALUES
(78, 0, 'INV-2013-00', 0, 'Awareness Ribbon Revolution', 'http://localhost/store/', 1, 1, 'Andres', 'Franco', 'koloinotzente@gmail.com', '3902669', '', '', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Credit or Debit Card (Processed securely by PayPal) ', 'paypal_advanced', 'Andres', 'Franco', '', 'Panama', '', 'Panama', '', 'Panama', 164, 'Panama', 2486, '', '[]', 'Free Shipping', 'free.free', '', 0.0300, 0, 0, 0.0000, 0, '', 1, 2, 'USD', 1.00000000, '127.0.0.1', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2016-01-12 19:53:09', '2016-01-12 19:53:09');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_custom_field`
--

CREATE TABLE IF NOT EXISTS `oc_order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_history`
--

CREATE TABLE IF NOT EXISTS `oc_order_history` (
  `order_history_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_order_history`
--

INSERT INTO `oc_order_history` (`order_history_id`, `order_id`, `order_status_id`, `notify`, `comment`, `date_added`) VALUES
(1, 47, 7, 0, 'AVSCODE: G\nCVV2MATCH: M\nTRANSACTIONID: 7X797266HD922214X\n', '2016-01-11 21:13:09'),
(2, 50, 15, 0, 'AVSCODE: G\nCVV2MATCH: M\nTRANSACTIONID: 3CS52551F1210615D\n', '2016-01-11 21:21:08'),
(3, 52, 15, 0, 'AVSCODE: G\nCVV2MATCH: M\nTRANSACTIONID: 0GT8712261060304X\n', '2016-01-11 21:47:38'),
(4, 75, 1, 1, '', '2016-01-12 19:35:35'),
(5, 75, 7, 0, '', '2016-01-12 19:35:35'),
(6, 76, 1, 1, '', '2016-01-12 19:39:06'),
(7, 76, 7, 0, '', '2016-01-12 19:39:06');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_option`
--

CREATE TABLE IF NOT EXISTS `oc_order_option` (
  `order_option_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_order_option`
--

INSERT INTO `oc_order_option` (`order_option_id`, `order_id`, `order_product_id`, `product_option_id`, `product_option_value_id`, `name`, `value`, `type`) VALUES
(1, 1, 1, 406, 2129, 'Size', 'S-Ladies', 'select'),
(2, 2, 2, 406, 2129, 'Size', 'S-Ladies', 'select'),
(3, 3, 3, 406, 2129, 'Size', 'S-Ladies', 'select'),
(4, 4, 4, 406, 2129, 'Size', 'S-Ladies', 'select'),
(5, 5, 5, 406, 2129, 'Size', 'S-Ladies', 'select'),
(6, 6, 6, 406, 2129, 'Size', 'S-Ladies', 'select'),
(7, 7, 7, 406, 2129, 'Size', 'S-Ladies', 'select'),
(8, 7, 8, 409, 2147, 'Color', 'White', 'select'),
(9, 7, 8, 407, 2141, 'Size', 'XL-Men', 'select'),
(10, 8, 9, 406, 2129, 'Size', 'S-Ladies', 'select'),
(11, 8, 10, 409, 2147, 'Color', 'White', 'select'),
(12, 8, 10, 407, 2141, 'Size', 'XL-Men', 'select'),
(13, 9, 11, 406, 2129, 'Size', 'S-Ladies', 'select'),
(14, 10, 12, 406, 2129, 'Size', 'S-Ladies', 'select'),
(15, 11, 13, 406, 2129, 'Size', 'S-Ladies', 'select'),
(16, 12, 14, 406, 2129, 'Size', 'S-Ladies', 'select'),
(17, 13, 15, 406, 2129, 'Size', 'S-Ladies', 'select'),
(18, 13, 16, 409, 2147, 'Color', 'White', 'select'),
(19, 13, 16, 407, 2141, 'Size', 'XL-Men', 'select'),
(20, 14, 17, 406, 2129, 'Size', 'S-Ladies', 'select'),
(21, 14, 18, 409, 2147, 'Color', 'White', 'select'),
(22, 14, 18, 407, 2141, 'Size', 'XL-Men', 'select'),
(23, 15, 19, 406, 2129, 'Size', 'S-Ladies', 'select'),
(24, 15, 20, 409, 2147, 'Color', 'White', 'select'),
(25, 15, 20, 407, 2141, 'Size', 'XL-Men', 'select'),
(26, 16, 21, 406, 2129, 'Size', 'S-Ladies', 'select'),
(27, 16, 22, 409, 2147, 'Color', 'White', 'select'),
(28, 16, 22, 407, 2141, 'Size', 'XL-Men', 'select'),
(29, 16, 23, 409, 2149, 'Color', 'Black', 'select'),
(30, 16, 23, 407, 2141, 'Size', 'XL-Men', 'select'),
(31, 17, 24, 406, 2129, 'Size', 'S-Ladies', 'select'),
(32, 17, 25, 409, 2147, 'Color', 'White', 'select'),
(33, 17, 25, 407, 2141, 'Size', 'XL-Men', 'select'),
(34, 17, 26, 409, 2149, 'Color', 'Black', 'select'),
(35, 17, 26, 407, 2141, 'Size', 'XL-Men', 'select'),
(36, 18, 27, 406, 2129, 'Size', 'S-Ladies', 'select'),
(37, 18, 28, 409, 2147, 'Color', 'White', 'select'),
(38, 18, 28, 407, 2141, 'Size', 'XL-Men', 'select'),
(39, 18, 29, 409, 2149, 'Color', 'Black', 'select'),
(40, 18, 29, 407, 2141, 'Size', 'XL-Men', 'select'),
(41, 19, 30, 406, 2129, 'Size', 'S-Ladies', 'select'),
(42, 19, 31, 409, 2147, 'Color', 'White', 'select'),
(43, 19, 31, 407, 2141, 'Size', 'XL-Men', 'select'),
(44, 19, 32, 409, 2149, 'Color', 'Black', 'select'),
(45, 19, 32, 407, 2141, 'Size', 'XL-Men', 'select'),
(46, 20, 33, 406, 2129, 'Size', 'S-Ladies', 'select'),
(47, 20, 34, 409, 2147, 'Color', 'White', 'select'),
(48, 20, 34, 407, 2141, 'Size', 'XL-Men', 'select'),
(49, 20, 35, 409, 2149, 'Color', 'Black', 'select'),
(50, 20, 35, 407, 2141, 'Size', 'XL-Men', 'select'),
(51, 21, 36, 406, 2129, 'Size', 'S-Ladies', 'select'),
(52, 21, 37, 409, 2147, 'Color', 'White', 'select'),
(53, 21, 37, 407, 2141, 'Size', 'XL-Men', 'select'),
(54, 21, 38, 409, 2149, 'Color', 'Black', 'select'),
(55, 21, 38, 407, 2141, 'Size', 'XL-Men', 'select'),
(56, 22, 39, 406, 2129, 'Size', 'S-Ladies', 'select'),
(57, 22, 40, 409, 2147, 'Color', 'White', 'select'),
(58, 22, 40, 407, 2141, 'Size', 'XL-Men', 'select'),
(59, 22, 41, 409, 2149, 'Color', 'Black', 'select'),
(60, 22, 41, 407, 2141, 'Size', 'XL-Men', 'select'),
(61, 23, 42, 406, 2129, 'Size', 'S-Ladies', 'select'),
(62, 23, 43, 409, 2147, 'Color', 'White', 'select'),
(63, 23, 43, 407, 2141, 'Size', 'XL-Men', 'select'),
(64, 23, 44, 409, 2149, 'Color', 'Black', 'select'),
(65, 23, 44, 407, 2141, 'Size', 'XL-Men', 'select'),
(66, 24, 45, 406, 2129, 'Size', 'S-Ladies', 'select'),
(67, 24, 46, 409, 2147, 'Color', 'White', 'select'),
(68, 24, 46, 407, 2141, 'Size', 'XL-Men', 'select'),
(69, 24, 47, 409, 2149, 'Color', 'Black', 'select'),
(70, 24, 47, 407, 2141, 'Size', 'XL-Men', 'select'),
(71, 26, 49, 421, 2264, 'Style', 'Ladies', 'select'),
(72, 27, 50, 421, 2264, 'Style', 'Ladies', 'select'),
(73, 28, 51, 421, 2264, 'Style', 'Ladies', 'select'),
(74, 29, 52, 421, 2264, 'Style', 'Ladies', 'select'),
(75, 30, 53, 421, 2264, 'Style', 'Ladies', 'select'),
(76, 31, 54, 421, 2264, 'Style', 'Ladies', 'select'),
(77, 32, 55, 421, 2264, 'Style', 'Ladies', 'select'),
(78, 33, 56, 421, 2264, 'Style', 'Ladies', 'select'),
(79, 34, 57, 421, 2264, 'Style', 'Ladies', 'select'),
(80, 35, 58, 421, 2264, 'Style', 'Ladies', 'select'),
(81, 36, 59, 421, 2264, 'Style', 'Ladies', 'select'),
(82, 37, 60, 421, 2264, 'Style', 'Ladies', 'select'),
(83, 38, 61, 421, 2264, 'Style', 'Ladies', 'select'),
(84, 39, 62, 421, 2264, 'Style', 'Ladies', 'select'),
(85, 40, 63, 421, 2264, 'Style', 'Ladies', 'select'),
(86, 41, 64, 421, 2264, 'Style', 'Ladies', 'select'),
(87, 42, 65, 421, 2264, 'Style', 'Ladies', 'select'),
(88, 43, 66, 421, 2264, 'Style', 'Ladies', 'select'),
(89, 44, 67, 421, 2264, 'Style', 'Ladies', 'select'),
(90, 45, 68, 421, 2264, 'Style', 'Ladies', 'select'),
(91, 46, 69, 421, 2264, 'Style', 'Ladies', 'select'),
(92, 47, 70, 421, 2264, 'Style', 'Ladies', 'select'),
(93, 48, 71, 421, 2264, 'Style', 'Ladies', 'select'),
(94, 49, 72, 421, 2264, 'Style', 'Ladies', 'select'),
(95, 50, 73, 421, 2264, 'Style', 'Ladies', 'select'),
(96, 51, 74, 421, 2264, 'Style', 'Ladies', 'select'),
(97, 52, 75, 421, 2264, 'Style', 'Ladies', 'select'),
(98, 53, 76, 421, 2264, 'Style', 'Ladies', 'select'),
(99, 54, 77, 421, 2264, 'Style', 'Ladies', 'select'),
(100, 55, 78, 421, 2264, 'Style', 'Ladies', 'select'),
(101, 56, 79, 421, 2264, 'Style', 'Ladies', 'select'),
(102, 57, 80, 421, 2264, 'Style', 'Ladies', 'select'),
(103, 58, 81, 421, 2264, 'Style', 'Ladies', 'select'),
(104, 59, 82, 421, 2264, 'Style', 'Ladies', 'select'),
(105, 60, 83, 421, 2264, 'Style', 'Ladies', 'select'),
(106, 61, 84, 421, 2264, 'Style', 'Ladies', 'select'),
(107, 62, 85, 421, 2264, 'Style', 'Ladies', 'select'),
(108, 63, 86, 421, 2264, 'Style', 'Ladies', 'select'),
(109, 64, 87, 421, 2264, 'Style', 'Ladies', 'select'),
(110, 65, 88, 421, 2264, 'Style', 'Ladies', 'select'),
(111, 66, 89, 421, 2264, 'Style', 'Ladies', 'select'),
(112, 67, 90, 421, 2264, 'Style', 'Ladies', 'select'),
(113, 68, 91, 421, 2264, 'Style', 'Ladies', 'select'),
(114, 69, 92, 421, 2264, 'Style', 'Ladies', 'select'),
(115, 70, 93, 421, 2264, 'Style', 'Ladies', 'select'),
(116, 71, 94, 421, 2264, 'Style', 'Ladies', 'select'),
(117, 72, 95, 421, 2264, 'Style', 'Ladies', 'select'),
(118, 73, 96, 421, 2264, 'Style', 'Ladies', 'select'),
(119, 74, 97, 421, 2264, 'Style', 'Ladies', 'select'),
(120, 75, 98, 421, 2264, 'Style', 'Ladies', 'select'),
(121, 76, 99, 421, 2264, 'Style', 'Ladies', 'select'),
(122, 77, 100, 421, 2264, 'Style', 'Ladies', 'select'),
(123, 78, 101, 421, 2264, 'Style', 'Ladies', 'select');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_product`
--

CREATE TABLE IF NOT EXISTS `oc_order_product` (
  `order_product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_order_product`
--

INSERT INTO `oc_order_product` (`order_product_id`, `order_id`, `product_id`, `name`, `model`, `quantity`, `price`, `total`, `tax`, `reward`) VALUES
(1, 1, 230, 'Yellow Awareness Heart Ribbon Shirts for Endometriosis, Ewing Sarcoma, Spina Bifida Awareness and More', 'Yellow Awareness Heart Ribbon Shirts for Endometriosis', 1, 22.9900, 22.9900, 0.0000, 0),
(2, 2, 230, 'Yellow Awareness Heart Ribbon Shirts for Endometriosis, Ewing Sarcoma, Spina Bifida Awareness and More', 'Yellow Awareness Heart Ribbon Shirts for Endometriosis', 1, 22.9900, 22.9900, 0.0000, 0),
(3, 3, 230, 'Yellow Awareness Heart Ribbon Shirts for Endometriosis, Ewing Sarcoma, Spina Bifida Awareness and More', 'Yellow Awareness Heart Ribbon Shirts for Endometriosis', 1, 22.9900, 22.9900, 0.0000, 0),
(4, 4, 230, 'Yellow Awareness Heart Ribbon Shirts for Endometriosis, Ewing Sarcoma, Spina Bifida Awareness and More', 'Yellow Awareness Heart Ribbon Shirts for Endometriosis', 1, 22.9900, 22.9900, 0.0000, 0),
(5, 5, 230, 'Yellow Awareness Heart Ribbon Shirts for Endometriosis, Ewing Sarcoma, Spina Bifida Awareness and More', 'Yellow Awareness Heart Ribbon Shirts for Endometriosis', 1, 22.9900, 22.9900, 0.0000, 0),
(6, 6, 230, 'Yellow Awareness Heart Ribbon Shirts for Endometriosis, Ewing Sarcoma, Spina Bifida Awareness and More', 'Yellow Awareness Heart Ribbon Shirts for Endometriosis', 1, 22.9900, 22.9900, 0.0000, 0),
(7, 7, 230, 'Yellow Awareness Heart Ribbon Shirts for Endometriosis, Ewing Sarcoma, Spina Bifida Awareness and More', 'Yellow Awareness Heart Ribbon Shirts for Endometriosis', 1, 22.9900, 22.9900, 0.0000, 0),
(8, 7, 231, 'Straight Outta Chemo Tall Shirts For Men', 'Straight Outta Chemo Tall Shirts For Men', 1, 24.9900, 24.9900, 0.0000, 0),
(9, 8, 230, 'Yellow Awareness Heart Ribbon Shirts for Endometriosis, Ewing Sarcoma, Spina Bifida Awareness and More', 'Yellow Awareness Heart Ribbon Shirts for Endometriosis', 1, 22.9900, 22.9900, 0.0000, 0),
(10, 8, 231, 'Straight Outta Chemo Tall Shirts For Men', 'Straight Outta Chemo Tall Shirts For Men', 1, 24.9900, 24.9900, 0.0000, 0),
(11, 9, 230, 'Yellow Awareness Heart Ribbon Shirts for Endometriosis, Ewing Sarcoma, Spina Bifida Awareness and More', 'Yellow Awareness Heart Ribbon Shirts for Endometriosis', 1, 22.9900, 22.9900, 0.0000, 0),
(12, 10, 230, 'Yellow Awareness Heart Ribbon Shirts for Endometriosis, Ewing Sarcoma, Spina Bifida Awareness and More', 'Yellow Awareness Heart Ribbon Shirts for Endometriosis', 1, 22.9900, 22.9900, 0.0000, 0),
(13, 11, 230, 'Yellow Awareness Heart Ribbon Shirts for Endometriosis, Ewing Sarcoma, Spina Bifida Awareness and More', 'Yellow Awareness Heart Ribbon Shirts for Endometriosis', 1, 22.9900, 22.9900, 0.0000, 0),
(14, 12, 230, 'Yellow Awareness Heart Ribbon Shirts for Endometriosis, Ewing Sarcoma, Spina Bifida Awareness and More', 'Yellow Awareness Heart Ribbon Shirts for Endometriosis', 1, 22.9900, 22.9900, 0.0000, 0),
(15, 13, 230, 'Yellow Awareness Heart Ribbon Shirts for Endometriosis, Ewing Sarcoma, Spina Bifida Awareness and More', 'Yellow Awareness Heart Ribbon Shirts for Endometriosis', 1, 22.9900, 22.9900, 0.0000, 0),
(16, 13, 231, 'Straight Outta Chemo Tall Shirts For Men', 'Straight Outta Chemo Tall Shirts For Men', 1, 24.9900, 24.9900, 0.0000, 0),
(17, 14, 230, 'Yellow Awareness Heart Ribbon Shirts for Endometriosis, Ewing Sarcoma, Spina Bifida Awareness and More', 'Yellow Awareness Heart Ribbon Shirts for Endometriosis', 1, 22.9900, 22.9900, 0.0000, 0),
(18, 14, 231, 'Straight Outta Chemo Tall Shirts For Men', 'Straight Outta Chemo Tall Shirts For Men', 1, 24.9900, 24.9900, 0.0000, 0),
(19, 15, 230, 'Yellow Awareness Heart Ribbon Shirts for Endometriosis, Ewing Sarcoma, Spina Bifida Awareness and More', 'Yellow Awareness Heart Ribbon Shirts for Endometriosis', 1, 22.9900, 22.9900, 0.0000, 0),
(20, 15, 231, 'Straight Outta Chemo Tall Shirts For Men', 'Straight Outta Chemo Tall Shirts For Men', 1, 24.9900, 24.9900, 0.0000, 0),
(21, 16, 230, 'Yellow Awareness Heart Ribbon Shirts for Endometriosis, Ewing Sarcoma, Spina Bifida Awareness and More', 'Yellow Awareness Heart Ribbon Shirts for Endometriosis', 1, 22.9900, 22.9900, 0.0000, 0),
(22, 16, 231, 'Straight Outta Chemo Tall Shirts For Men', 'Straight Outta Chemo Tall Shirts For Men', 1, 24.9900, 24.9900, 0.0000, 0),
(23, 16, 231, 'Straight Outta Chemo Tall Shirts For Men', 'Straight Outta Chemo Tall Shirts For Men', 1, 24.9900, 24.9900, 0.0000, 0),
(24, 17, 230, 'Yellow Awareness Heart Ribbon Shirts for Endometriosis, Ewing Sarcoma, Spina Bifida Awareness and More', 'Yellow Awareness Heart Ribbon Shirts for Endometriosis', 1, 22.9900, 22.9900, 0.0000, 0),
(25, 17, 231, 'Straight Outta Chemo Tall Shirts For Men', 'Straight Outta Chemo Tall Shirts For Men', 1, 24.9900, 24.9900, 0.0000, 0),
(26, 17, 231, 'Straight Outta Chemo Tall Shirts For Men', 'Straight Outta Chemo Tall Shirts For Men', 1, 24.9900, 24.9900, 0.0000, 0),
(27, 18, 230, 'Yellow Awareness Heart Ribbon Shirts for Endometriosis, Ewing Sarcoma, Spina Bifida Awareness and More', 'Yellow Awareness Heart Ribbon Shirts for Endometriosis', 1, 22.9900, 22.9900, 0.0000, 0),
(28, 18, 231, 'Straight Outta Chemo Tall Shirts For Men', 'Straight Outta Chemo Tall Shirts For Men', 1, 24.9900, 24.9900, 0.0000, 0),
(29, 18, 231, 'Straight Outta Chemo Tall Shirts For Men', 'Straight Outta Chemo Tall Shirts For Men', 1, 24.9900, 24.9900, 0.0000, 0),
(30, 19, 230, 'Yellow Awareness Heart Ribbon Shirts for Endometriosis, Ewing Sarcoma, Spina Bifida Awareness and More', 'Yellow Awareness Heart Ribbon Shirts for Endometriosis', 1, 22.9900, 22.9900, 0.0000, 0),
(31, 19, 231, 'Straight Outta Chemo Tall Shirts For Men', 'Straight Outta Chemo Tall Shirts For Men', 1, 24.9900, 24.9900, 0.0000, 0),
(32, 19, 231, 'Straight Outta Chemo Tall Shirts For Men', 'Straight Outta Chemo Tall Shirts For Men', 1, 24.9900, 24.9900, 0.0000, 0),
(33, 20, 230, 'Yellow Awareness Heart Ribbon Shirts for Endometriosis, Ewing Sarcoma, Spina Bifida Awareness and More', 'Yellow Awareness Heart Ribbon Shirts for Endometriosis', 1, 22.9900, 22.9900, 0.0000, 0),
(34, 20, 231, 'Straight Outta Chemo Tall Shirts For Men', 'Straight Outta Chemo Tall Shirts For Men', 1, 24.9900, 24.9900, 0.0000, 0),
(35, 20, 231, 'Straight Outta Chemo Tall Shirts For Men', 'Straight Outta Chemo Tall Shirts For Men', 1, 24.9900, 24.9900, 0.0000, 0),
(36, 21, 230, 'Yellow Awareness Heart Ribbon Shirts for Endometriosis, Ewing Sarcoma, Spina Bifida Awareness and More', 'Yellow Awareness Heart Ribbon Shirts for Endometriosis', 1, 22.9900, 22.9900, 0.0000, 0),
(37, 21, 231, 'Straight Outta Chemo Tall Shirts For Men', 'Straight Outta Chemo Tall Shirts For Men', 1, 24.9900, 24.9900, 0.0000, 0),
(38, 21, 231, 'Straight Outta Chemo Tall Shirts For Men', 'Straight Outta Chemo Tall Shirts For Men', 1, 24.9900, 24.9900, 0.0000, 0),
(39, 22, 230, 'Yellow Awareness Heart Ribbon Shirts for Endometriosis, Ewing Sarcoma, Spina Bifida Awareness and More', 'Yellow Awareness Heart Ribbon Shirts for Endometriosis', 1, 22.9900, 22.9900, 0.0000, 0),
(40, 22, 231, 'Straight Outta Chemo Tall Shirts For Men', 'Straight Outta Chemo Tall Shirts For Men', 1, 24.9900, 24.9900, 0.0000, 0),
(41, 22, 231, 'Straight Outta Chemo Tall Shirts For Men', 'Straight Outta Chemo Tall Shirts For Men', 1, 24.9900, 24.9900, 0.0000, 0),
(42, 23, 230, 'Yellow Awareness Heart Ribbon Shirts for Endometriosis, Ewing Sarcoma, Spina Bifida Awareness and More', 'Yellow Awareness Heart Ribbon Shirts for Endometriosis', 1, 22.9900, 22.9900, 0.0000, 0),
(43, 23, 231, 'Straight Outta Chemo Tall Shirts For Men', 'Straight Outta Chemo Tall Shirts For Men', 1, 24.9900, 24.9900, 0.0000, 0),
(44, 23, 231, 'Straight Outta Chemo Tall Shirts For Men', 'Straight Outta Chemo Tall Shirts For Men', 1, 24.9900, 24.9900, 0.0000, 0),
(45, 24, 230, 'Yellow Awareness Heart Ribbon Shirts for Endometriosis, Ewing Sarcoma, Spina Bifida Awareness and More', 'Yellow Awareness Heart Ribbon Shirts for Endometriosis', 1, 22.9900, 22.9900, 0.0000, 0),
(46, 24, 231, 'Straight Outta Chemo Tall Shirts For Men', 'Straight Outta Chemo Tall Shirts For Men', 1, 24.9900, 24.9900, 0.0000, 0),
(47, 24, 231, 'Straight Outta Chemo Tall Shirts For Men', 'Straight Outta Chemo Tall Shirts For Men', 1, 24.9900, 24.9900, 0.0000, 0),
(48, 25, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.0000, 0.0000, 0.0000, 0),
(49, 26, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 1.0000, 1.0000, 0.0000, 0),
(50, 27, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 1.0000, 1.0000, 0.0000, 0),
(51, 28, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.1000, 0.1000, 0.0000, 0),
(52, 29, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.1000, 0.1000, 0.0000, 0),
(53, 30, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.1000, 0.1000, 0.0000, 0),
(54, 31, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.1000, 0.1000, 0.0000, 0),
(55, 32, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.1000, 0.1000, 0.0000, 0),
(56, 33, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 2, 0.1000, 0.2000, 0.0000, 0),
(57, 34, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 3, 0.1000, 0.3000, 0.0000, 0),
(58, 35, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 3, 0.1000, 0.3000, 0.0000, 0),
(59, 36, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 3, 0.1000, 0.3000, 0.0000, 0),
(60, 37, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 3, 0.1000, 0.3000, 0.0000, 0),
(61, 38, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 3, 0.1000, 0.3000, 0.0000, 0),
(62, 39, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 3, 0.1000, 0.3000, 0.0000, 0),
(63, 40, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 3, 0.1000, 0.3000, 0.0000, 0),
(64, 41, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 3, 0.1000, 0.3000, 0.0000, 0),
(65, 42, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.1000, 0.1000, 0.0000, 0),
(66, 43, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.1000, 0.1000, 0.0000, 0),
(67, 44, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.1000, 0.1000, 0.0000, 0),
(68, 45, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.1000, 0.1000, 0.0000, 0),
(69, 46, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.1000, 0.1000, 0.0000, 0),
(70, 47, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.1000, 0.1000, 0.0000, 0),
(71, 48, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.1000, 0.1000, 0.0000, 0),
(72, 49, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.1000, 0.1000, 0.0000, 0),
(73, 50, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.1000, 0.1000, 0.0000, 0),
(74, 51, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.1000, 0.1000, 0.0000, 0),
(75, 52, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.1000, 0.1000, 0.0000, 0),
(76, 53, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.1000, 0.1000, 0.0000, 0),
(77, 54, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.1000, 0.1000, 0.0000, 0),
(78, 55, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.1000, 0.1000, 0.0000, 0),
(79, 56, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.1000, 0.1000, 0.0000, 0),
(80, 57, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.1000, 0.1000, 0.0000, 0),
(81, 58, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.1000, 0.1000, 0.0000, 0),
(82, 59, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.1000, 0.1000, 0.0000, 0),
(83, 60, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 2, 0.1000, 0.2000, 0.0000, 0),
(84, 61, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 2, 0.1000, 0.2000, 0.0000, 0),
(85, 62, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 2, 0.1000, 0.2000, 0.0000, 0),
(86, 63, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 2, 0.1000, 0.2000, 0.0000, 0),
(87, 64, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 2, 0.1000, 0.2000, 0.0000, 0),
(88, 65, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 2, 0.1000, 0.2000, 0.0000, 0),
(89, 66, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 2, 0.1000, 0.2000, 0.0000, 0),
(90, 67, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 2, 0.1000, 0.2000, 0.0000, 0),
(91, 68, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 2, 0.1000, 0.2000, 0.0000, 0),
(92, 69, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 2, 0.1000, 0.2000, 0.0000, 0),
(93, 70, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 2, 0.1000, 0.2000, 0.0000, 0),
(94, 71, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 2, 0.1000, 0.2000, 0.0000, 0),
(95, 72, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.1000, 0.1000, 0.0000, 0),
(96, 73, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.1000, 0.1000, 0.0000, 0),
(97, 74, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.1000, 0.1000, 0.0000, 0),
(98, 75, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.0300, 0.0300, 0.0000, 0),
(99, 76, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.0300, 0.0300, 0.0000, 0),
(100, 77, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.0300, 0.0300, 0.0000, 0),
(101, 78, 241, 'TEST product', 'Appendix Cancer Awareness Heart Ribbon Shirts', 1, 0.0300, 0.0300, 0.0000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_recurring_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_status`
--

CREATE TABLE IF NOT EXISTS `oc_order_status` (
  `order_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_order_status`
--

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(2, 1, 'Processing'),
(3, 1, 'Shipped'),
(7, 1, 'Canceled'),
(5, 1, 'Complete'),
(8, 1, 'Denied'),
(9, 1, 'Canceled Reversal'),
(10, 1, 'Failed'),
(11, 1, 'Refunded'),
(12, 1, 'Reversed'),
(13, 1, 'Chargeback'),
(1, 1, 'Pending'),
(16, 1, 'Voided'),
(15, 1, 'Processed'),
(14, 1, 'Expired');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_total`
--

CREATE TABLE IF NOT EXISTS `oc_order_total` (
  `order_total_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=235 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_order_total`
--

INSERT INTO `oc_order_total` (`order_total_id`, `order_id`, `code`, `title`, `value`, `sort_order`) VALUES
(1, 1, 'sub_total', 'Sub-Total', 22.9900, 1),
(2, 1, 'shipping', 'Flat Shipping Rate', 5.0000, 3),
(3, 1, 'total', 'Total', 27.9900, 9),
(4, 2, 'sub_total', 'Sub-Total', 22.9900, 1),
(5, 2, 'shipping', 'Flat Shipping Rate', 5.0000, 3),
(6, 2, 'total', 'Total', 27.9900, 9),
(7, 3, 'sub_total', 'Sub-Total', 22.9900, 1),
(8, 3, 'shipping', 'Flat Shipping Rate', 5.0000, 3),
(9, 3, 'total', 'Total', 27.9900, 9),
(10, 4, 'sub_total', 'Sub-Total', 22.9900, 1),
(11, 4, 'shipping', 'Flat Shipping Rate', 5.0000, 3),
(12, 4, 'total', 'Total', 27.9900, 9),
(13, 5, 'sub_total', 'Sub-Total', 22.9900, 1),
(14, 5, 'shipping', 'Flat Shipping Rate', 5.0000, 3),
(15, 5, 'total', 'Total', 27.9900, 9),
(16, 6, 'sub_total', 'Sub-Total', 22.9900, 1),
(17, 6, 'shipping', 'Flat Shipping Rate', 5.0000, 3),
(18, 6, 'total', 'Total', 27.9900, 9),
(19, 7, 'sub_total', 'Sub-Total', 47.9800, 1),
(20, 7, 'shipping', 'Flat Shipping Rate', 5.0000, 3),
(21, 7, 'total', 'Total', 52.9800, 9),
(22, 8, 'sub_total', 'Sub-Total', 47.9800, 1),
(23, 8, 'shipping', 'Flat Shipping Rate', 5.0000, 3),
(24, 8, 'total', 'Total', 52.9800, 9),
(25, 9, 'sub_total', 'Sub-Total', 22.9900, 1),
(26, 9, 'shipping', 'Flat Shipping Rate', 5.0000, 3),
(27, 9, 'total', 'Total', 27.9900, 9),
(28, 10, 'sub_total', 'Sub-Total', 22.9900, 1),
(29, 10, 'shipping', 'Flat Shipping Rate', 5.0000, 3),
(30, 10, 'total', 'Total', 27.9900, 9),
(31, 11, 'sub_total', 'Sub-Total', 22.9900, 1),
(32, 11, 'shipping', 'Flat Shipping Rate', 5.0000, 3),
(33, 11, 'total', 'Total', 27.9900, 9),
(34, 12, 'sub_total', 'Sub-Total', 22.9900, 1),
(35, 12, 'shipping', 'Flat Shipping Rate', 5.0000, 3),
(36, 12, 'total', 'Total', 27.9900, 9),
(37, 13, 'sub_total', 'Sub-Total', 47.9800, 1),
(38, 13, 'shipping', 'Flat Shipping Rate', 5.0000, 3),
(39, 13, 'total', 'Total', 52.9800, 9),
(40, 14, 'sub_total', 'Sub-Total', 47.9800, 1),
(41, 14, 'shipping', 'Flat Shipping Rate', 5.0000, 3),
(42, 14, 'total', 'Total', 52.9800, 9),
(43, 15, 'sub_total', 'Sub-Total', 47.9800, 1),
(44, 15, 'shipping', 'Free Shipping', 0.0000, 3),
(45, 15, 'total', 'Total', 47.9800, 9),
(46, 16, 'sub_total', 'Sub-Total', 72.9700, 1),
(47, 16, 'shipping', 'Free Shipping', 0.0000, 3),
(48, 16, 'total', 'Total', 72.9700, 9),
(49, 17, 'sub_total', 'Sub-Total', 72.9700, 1),
(50, 17, 'shipping', 'Free Shipping', 0.0000, 3),
(51, 17, 'total', 'Total', 72.9700, 9),
(52, 18, 'sub_total', 'Sub-Total', 72.9700, 1),
(53, 18, 'shipping', 'Free Shipping', 0.0000, 3),
(54, 18, 'total', 'Total', 72.9700, 9),
(55, 19, 'sub_total', 'Sub-Total', 72.9700, 1),
(56, 19, 'shipping', 'Free Shipping', 0.0000, 3),
(57, 19, 'total', 'Total', 72.9700, 9),
(58, 20, 'sub_total', 'Sub-Total', 72.9700, 1),
(59, 20, 'shipping', 'Free Shipping', 0.0000, 3),
(60, 20, 'total', 'Total', 72.9700, 9),
(61, 21, 'sub_total', 'Sub-Total', 72.9700, 1),
(62, 21, 'shipping', 'Free Shipping', 0.0000, 3),
(63, 21, 'total', 'Total', 72.9700, 9),
(64, 22, 'sub_total', 'Sub-Total', 72.9700, 1),
(65, 22, 'shipping', 'Free Shipping', 0.0000, 3),
(66, 22, 'total', 'Total', 72.9700, 9),
(67, 23, 'sub_total', 'Sub-Total', 72.9700, 1),
(68, 23, 'shipping', 'Free Shipping', 0.0000, 3),
(69, 23, 'total', 'Total', 72.9700, 9),
(70, 24, 'sub_total', 'Sub-Total', 72.9700, 1),
(71, 24, 'shipping', 'Free Shipping', 0.0000, 3),
(72, 24, 'total', 'Total', 72.9700, 9),
(73, 25, 'sub_total', 'Sub-Total', 0.0000, 1),
(74, 25, 'shipping', 'Free Shipping', 0.0000, 3),
(75, 25, 'total', 'Total', 0.0000, 9),
(76, 26, 'sub_total', 'Sub-Total', 1.0000, 1),
(77, 26, 'shipping', 'Free Shipping', 0.0000, 3),
(78, 26, 'total', 'Total', 1.0000, 9),
(79, 27, 'sub_total', 'Sub-Total', 1.0000, 1),
(80, 27, 'shipping', 'Free Shipping', 0.0000, 3),
(81, 27, 'total', 'Total', 1.0000, 9),
(82, 28, 'sub_total', 'Sub-Total', 0.1000, 1),
(83, 28, 'shipping', 'Free Shipping', 0.0000, 3),
(84, 28, 'total', 'Total', 0.1000, 9),
(85, 29, 'sub_total', 'Sub-Total', 0.1000, 1),
(86, 29, 'shipping', 'Free Shipping', 0.0000, 3),
(87, 29, 'total', 'Total', 0.1000, 9),
(88, 30, 'sub_total', 'Sub-Total', 0.1000, 1),
(89, 30, 'shipping', 'Free Shipping', 0.0000, 3),
(90, 30, 'total', 'Total', 0.1000, 9),
(91, 31, 'sub_total', 'Sub-Total', 0.1000, 1),
(92, 31, 'shipping', 'Free Shipping', 0.0000, 3),
(93, 31, 'total', 'Total', 0.1000, 9),
(94, 32, 'sub_total', 'Sub-Total', 0.1000, 1),
(95, 32, 'shipping', 'Free Shipping', 0.0000, 3),
(96, 32, 'total', 'Total', 0.1000, 9),
(97, 33, 'sub_total', 'Sub-Total', 0.2000, 1),
(98, 33, 'shipping', 'Free Shipping', 0.0000, 3),
(99, 33, 'total', 'Total', 0.2000, 9),
(100, 34, 'sub_total', 'Sub-Total', 0.3000, 1),
(101, 34, 'shipping', 'Free Shipping', 0.0000, 3),
(102, 34, 'total', 'Total', 0.3000, 9),
(103, 35, 'sub_total', 'Sub-Total', 0.3000, 1),
(104, 35, 'shipping', 'Free Shipping', 0.0000, 3),
(105, 35, 'total', 'Total', 0.3000, 9),
(106, 36, 'sub_total', 'Sub-Total', 0.3000, 1),
(107, 36, 'shipping', 'Free Shipping', 0.0000, 3),
(108, 36, 'total', 'Total', 0.3000, 9),
(109, 37, 'sub_total', 'Sub-Total', 0.3000, 1),
(110, 37, 'shipping', 'Free Shipping', 0.0000, 3),
(111, 37, 'total', 'Total', 0.3000, 9),
(112, 38, 'sub_total', 'Sub-Total', 0.3000, 1),
(113, 38, 'shipping', 'Free Shipping', 0.0000, 3),
(114, 38, 'total', 'Total', 0.3000, 9),
(115, 39, 'sub_total', 'Sub-Total', 0.3000, 1),
(116, 39, 'shipping', 'Free Shipping', 0.0000, 3),
(117, 39, 'total', 'Total', 0.3000, 9),
(118, 40, 'sub_total', 'Sub-Total', 0.3000, 1),
(119, 40, 'shipping', 'Free Shipping', 0.0000, 3),
(120, 40, 'total', 'Total', 0.3000, 9),
(121, 41, 'sub_total', 'Sub-Total', 0.3000, 1),
(122, 41, 'shipping', 'Free Shipping', 0.0000, 3),
(123, 41, 'total', 'Total', 0.3000, 9),
(124, 42, 'sub_total', 'Sub-Total', 0.1000, 1),
(125, 42, 'shipping', 'Free Shipping', 0.0000, 3),
(126, 42, 'total', 'Total', 0.1000, 9),
(127, 43, 'sub_total', 'Sub-Total', 0.1000, 1),
(128, 43, 'shipping', 'Free Shipping', 0.0000, 3),
(129, 43, 'total', 'Total', 0.1000, 9),
(130, 44, 'sub_total', 'Sub-Total', 0.1000, 1),
(131, 44, 'shipping', 'Free Shipping', 0.0000, 3),
(132, 44, 'total', 'Total', 0.1000, 9),
(133, 45, 'sub_total', 'Sub-Total', 0.1000, 1),
(134, 45, 'shipping', 'Free Shipping', 0.0000, 3),
(135, 45, 'total', 'Total', 0.1000, 9),
(136, 46, 'sub_total', 'Sub-Total', 0.1000, 1),
(137, 46, 'shipping', 'Free Shipping', 0.0000, 3),
(138, 46, 'total', 'Total', 0.1000, 9),
(139, 47, 'sub_total', 'Sub-Total', 0.1000, 1),
(140, 47, 'shipping', 'Free Shipping', 0.0000, 3),
(141, 47, 'total', 'Total', 0.1000, 9),
(142, 48, 'sub_total', 'Sub-Total', 0.1000, 1),
(143, 48, 'shipping', 'Free Shipping', 0.0000, 3),
(144, 48, 'total', 'Total', 0.1000, 9),
(145, 49, 'sub_total', 'Sub-Total', 0.1000, 1),
(146, 49, 'shipping', 'Free Shipping', 0.0000, 3),
(147, 49, 'total', 'Total', 0.1000, 9),
(148, 50, 'sub_total', 'Sub-Total', 0.1000, 1),
(149, 50, 'shipping', 'Free Shipping', 0.0000, 3),
(150, 50, 'total', 'Total', 0.1000, 9),
(151, 51, 'sub_total', 'Sub-Total', 0.1000, 1),
(152, 51, 'shipping', 'Free Shipping', 0.0000, 3),
(153, 51, 'total', 'Total', 0.1000, 9),
(154, 52, 'sub_total', 'Sub-Total', 0.1000, 1),
(155, 52, 'shipping', 'Free Shipping', 0.0000, 3),
(156, 52, 'total', 'Total', 0.1000, 9),
(157, 53, 'sub_total', 'Sub-Total', 0.1000, 1),
(158, 53, 'shipping', 'Free Shipping', 0.0000, 3),
(159, 53, 'total', 'Total', 0.1000, 9),
(160, 54, 'sub_total', 'Sub-Total', 0.1000, 1),
(161, 54, 'shipping', 'Free Shipping', 0.0000, 3),
(162, 54, 'total', 'Total', 0.1000, 9),
(163, 55, 'sub_total', 'Sub-Total', 0.1000, 1),
(164, 55, 'shipping', 'Free Shipping', 0.0000, 3),
(165, 55, 'total', 'Total', 0.1000, 9),
(166, 56, 'sub_total', 'Sub-Total', 0.1000, 1),
(167, 56, 'shipping', 'Free Shipping', 0.0000, 3),
(168, 56, 'total', 'Total', 0.1000, 9),
(169, 57, 'sub_total', 'Sub-Total', 0.1000, 1),
(170, 57, 'shipping', 'Free Shipping', 0.0000, 3),
(171, 57, 'total', 'Total', 0.1000, 9),
(172, 58, 'sub_total', 'Sub-Total', 0.1000, 1),
(173, 58, 'shipping', 'Free Shipping', 0.0000, 3),
(174, 58, 'total', 'Total', 0.1000, 9),
(175, 59, 'sub_total', 'Sub-Total', 0.1000, 1),
(176, 59, 'shipping', 'Free Shipping', 0.0000, 3),
(177, 59, 'total', 'Total', 0.1000, 9),
(178, 60, 'sub_total', 'Sub-Total', 0.2000, 1),
(179, 60, 'shipping', 'Free Shipping', 0.0000, 3),
(180, 60, 'total', 'Total', 0.2000, 9),
(181, 61, 'sub_total', 'Sub-Total', 0.2000, 1),
(182, 61, 'shipping', 'Free Shipping', 0.0000, 3),
(183, 61, 'total', 'Total', 0.2000, 9),
(184, 62, 'sub_total', 'Sub-Total', 0.2000, 1),
(185, 62, 'shipping', 'Free Shipping', 0.0000, 3),
(186, 62, 'total', 'Total', 0.2000, 9),
(187, 63, 'sub_total', 'Sub-Total', 0.2000, 1),
(188, 63, 'shipping', 'Free Shipping', 0.0000, 3),
(189, 63, 'total', 'Total', 0.2000, 9),
(190, 64, 'sub_total', 'Sub-Total', 0.2000, 1),
(191, 64, 'shipping', 'Free Shipping', 0.0000, 3),
(192, 64, 'total', 'Total', 0.2000, 9),
(193, 65, 'sub_total', 'Sub-Total', 0.2000, 1),
(194, 65, 'shipping', 'Free Shipping', 0.0000, 3),
(195, 65, 'total', 'Total', 0.2000, 9),
(196, 66, 'sub_total', 'Sub-Total', 0.2000, 1),
(197, 66, 'shipping', 'Free Shipping', 0.0000, 3),
(198, 66, 'total', 'Total', 0.2000, 9),
(199, 67, 'sub_total', 'Sub-Total', 0.2000, 1),
(200, 67, 'shipping', 'Free Shipping', 0.0000, 3),
(201, 67, 'total', 'Total', 0.2000, 9),
(202, 68, 'sub_total', 'Sub-Total', 0.2000, 1),
(203, 68, 'shipping', 'Free Shipping', 0.0000, 3),
(204, 68, 'total', 'Total', 0.2000, 9),
(205, 69, 'sub_total', 'Sub-Total', 0.2000, 1),
(206, 69, 'shipping', 'Free Shipping', 0.0000, 3),
(207, 69, 'total', 'Total', 0.2000, 9),
(208, 70, 'sub_total', 'Sub-Total', 0.2000, 1),
(209, 70, 'shipping', 'Free Shipping', 0.0000, 3),
(210, 70, 'total', 'Total', 0.2000, 9),
(211, 71, 'sub_total', 'Sub-Total', 0.2000, 1),
(212, 71, 'shipping', 'Free Shipping', 0.0000, 3),
(213, 71, 'total', 'Total', 0.2000, 9),
(214, 72, 'sub_total', 'Sub-Total', 0.1000, 1),
(215, 72, 'shipping', 'Free Shipping', 0.0000, 3),
(216, 72, 'total', 'Total', 0.1000, 9),
(217, 73, 'sub_total', 'Sub-Total', 0.1000, 1),
(218, 73, 'shipping', 'Free Shipping', 0.0000, 3),
(219, 73, 'total', 'Total', 0.1000, 9),
(220, 74, 'sub_total', 'Sub-Total', 0.1000, 1),
(221, 74, 'shipping', 'Free Shipping', 0.0000, 3),
(222, 74, 'total', 'Total', 0.1000, 9),
(223, 75, 'sub_total', 'Sub-Total', 0.0300, 1),
(224, 75, 'shipping', 'Free Shipping', 0.0000, 3),
(225, 75, 'total', 'Total', 0.0300, 9),
(226, 76, 'sub_total', 'Sub-Total', 0.0300, 1),
(227, 76, 'shipping', 'Free Shipping', 0.0000, 3),
(228, 76, 'total', 'Total', 0.0300, 9),
(229, 77, 'sub_total', 'Sub-Total', 0.0300, 1),
(230, 77, 'shipping', 'Free Shipping', 0.0000, 3),
(231, 77, 'total', 'Total', 0.0300, 9),
(232, 78, 'sub_total', 'Sub-Total', 0.0300, 1),
(233, 78, 'shipping', 'Free Shipping', 0.0000, 3),
(234, 78, 'total', 'Total', 0.0300, 9);

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_voucher`
--

CREATE TABLE IF NOT EXISTS `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_paypal_order`
--

CREATE TABLE IF NOT EXISTS `oc_paypal_order` (
  `paypal_order_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `capture_status` enum('Complete','NotComplete') DEFAULT NULL,
  `currency_code` char(3) NOT NULL,
  `authorization_id` varchar(30) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_paypal_order_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_paypal_order_transaction` (
  `paypal_order_transaction_id` int(11) NOT NULL,
  `paypal_order_id` int(11) NOT NULL,
  `transaction_id` char(20) NOT NULL,
  `parent_transaction_id` char(20) NOT NULL,
  `date_added` datetime NOT NULL,
  `note` varchar(255) NOT NULL,
  `msgsubid` char(38) NOT NULL,
  `receipt_id` char(20) NOT NULL,
  `payment_type` enum('none','echeck','instant','refund','void') DEFAULT NULL,
  `payment_status` char(20) NOT NULL,
  `pending_reason` char(50) NOT NULL,
  `transaction_entity` char(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `debug_data` text NOT NULL,
  `call_data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product`
--

CREATE TABLE IF NOT EXISTS `oc_product` (
  `product_id` int(11) NOT NULL,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=242 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES
(68, 'Cervical Cancer Strongest Among Us T-Shirt', 'TS-CEC-W-00001', '', '', '', '', '', '', 360, 6, 'catalog/TS-CEC-W-00001/il_570xN.873586616_3gj3.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 2, '2015-12-06 13:45:24', '0000-00-00 00:00:00'),
(66, 'Ovarian Cancer Strongest Among Us T-Shirt', 'TS-OC-W-00001', '', '', '', '', '', '', 360, 6, 'catalog/TS-OC-W-00001/il_570xN.873357715_g4i3.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-06 13:38:33', '0000-00-00 00:00:00'),
(67, 'Cervical Cancer Strongest Among Us T-Shirt', 'TS-CEC-W-00001', '', '', '', '', '', '', 360, 6, 'catalog/TS-CEC-W-00001/il_570xN.873586616_3gj3.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-06 13:45:24', '0000-00-00 00:00:00'),
(65, 'Yes They''re Fake Breast Cancer Grunge Shirts', 'TS-BC-W-00005', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00005/il_570xN.857296416_k5g2.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-06 13:31:11', '0000-00-00 00:00:00'),
(55, 'Yes They''re Fake Breast Cancer Shirt', 'TS-BC-B-00001', '', '', '', '', '', '', 360, 5, 'catalog/Yes They''re Fake Breast Cancer Shirt/il_570xN.838274345_i6mg.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 80, '2015-11-21 10:22:34', '2015-12-06 11:56:53'),
(56, 'Yes They''re Fake Breast Cancer Grunge Shirts', 'TS-BC-W-00001', '', '', '', '', '', '', 360, 6, 'catalog/Yes They''re Fake Breast Cancer Grunge Shirts/il_570xN.857296416_k5g2.jpg', 0, 1, 19.9900, 0, 0, '2015-11-29', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 1, '2015-11-29 16:27:04', '2015-12-06 12:01:01'),
(57, 'Uterine Cancer Strongest Among Us T-Shirt', 'TS-UC-W-00001', '', '', '', '', '', '', 360, 6, 'catalog/Uterine Cancer Strongest Among Us T-Shirt/il_570xN.873592184_f81f.jpg', 0, 1, 19.9900, 0, 0, '2015-11-29', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 3, '2015-11-29 16:44:03', '2015-12-06 12:02:19'),
(58, 'Straight Outta Chemo Breast Cancer Shirts', 'TS-BC-W-00007', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00007/il_570xN.860203482_adi3.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-06 12:10:07', '2015-12-06 15:13:22'),
(59, 'Straight Outta Chemo Light Pink Shirts', 'TS-BC-P-00001', '', '', '', '', '', '', 360, 6, 'catalog/Straight Outta Chemo Light Pink Shirts/il_570xN.859024083_2q5g.jpg', 0, 1, 21.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-06 12:17:27', '2015-12-06 12:18:19'),
(233, 'Breast Cancer Hope Love Cure Light Pink Shirts', '', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-P-00004/il_570xN.860353194_jma0.jpg', 0, 1, 21.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 0, 0, '2016-01-07 18:51:34', '0000-00-00 00:00:00'),
(234, 'Straight Outta Cancer Black Shirts', 'TS-CAA-B-00001', '', '', '', '', '', '', 360, 6, 'catalog/TS-CAA-B-00001/il_570xN.881675327_dskk.jpg', 0, 1, 21.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 0, 0, '2016-01-07 18:57:03', '2016-01-07 19:21:50'),
(62, 'Never Underestimate a Breast Cancer Survivor Shirt', 'TS-BC-W-00003', '', '', '', '', '', '', 360, 6, 'catalog/Never Underestimate a Breast Cancer Survivor Shirt/il_570xN.849808777_dqvl.jpg', 0, 1, 0.0000, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 360, 1, 1, 0, '2015-12-06 12:30:46', '2015-12-06 12:32:43'),
(63, 'Breast Cancer Yes They''re Fake Shirts', 'TS-BC-W-00004', '', '', '', '', '', '', 360, 6, 'catalog/Breast Cancer Yes They''re Fake Shirts/il_570xN.857063315_rg67.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-06 12:37:21', '2015-12-06 12:38:11'),
(64, 'Breast Cancer I Will Never Ever Give Up Shirts', 'TS-BC-P-00003', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-P-00002/il_570xN.848476028_7u15.jpg', 0, 1, 20.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-06 13:12:53', '2015-12-06 15:30:47'),
(69, 'Breast Cancer Strongest Among Us T-Shirt', 'TS-BC-W-00006', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00006/il_570xN.873352193_lq8n.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-06 15:05:52', '0000-00-00 00:00:00'),
(71, 'Cancer Picked The Wrong Diva Breast Cancer Shirt', 'TS-BC-W-00008', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00008/il_570xN.832225729_6zjj.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-06 15:10:00', '2015-12-06 15:17:26'),
(200, 'Prostate Cancer I''m Not a Super Hero', 'TS-PRC-W-00001', '', '', '', '', '', '', 360, 6, 'catalog/TS-PRC-W-00001/il_570xN.897167281_7pzz.jpg', 0, 1, 20.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2016-01-04 10:33:38', '2016-01-04 10:37:18'),
(73, 'Yes They''re Fake Breast Cancer Shirts', 'TS-BC-W-00009', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00009/il_570xN.857060967_pl7w.jpg', 0, 1, 19.9900, 0, 0, '2015-11-29', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-06 15:18:56', '2015-12-06 15:21:08'),
(74, 'Personalize I Wear a Pink Ribbon Shirt', 'TS-BC-W-00010', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00009/il_570xN.857060967_pl7w.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-06 15:22:41', '2015-12-06 15:24:39'),
(75, 'Straight Outta Chemo Light Blue Shirts', 'TS-CAA-BL-00001', '', '', '', '', '', '', 360, 6, 'catalog/TS-CAA-BL-00001/il_570xN.881917020_5qei.jpg', 0, 1, 21.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-06 15:25:21', '2016-01-07 18:56:17'),
(76, 'Breast Cancer Hope Love Cure Shrits', 'TS-BC-P-00005', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-P-00005/il_570xN.860113961_c4dz.jpg', 0, 1, 21.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-06 20:24:23', '2015-12-06 20:26:18'),
(77, 'Straight Outta Chemo Leukemia Shirts', 'TS-LEU-W-00001', '', '', '', '', '', '', 360, 6, 'catalog/TS-LEU-W-00001/il_570xN.859969657_t9xa.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-06 20:28:12', '2015-12-06 20:31:15'),
(78, 'Straight Outta Chemo Heliconia Pink Shirts', 'TS-BC-P-00006', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-P-00006/il_570xN.859253082_f2jx.jpg', 0, 1, 21.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-06 20:32:18', '2015-12-06 20:35:22'),
(79, 'Breast Cancer Tribal Ribbon T-Shirts', 'TS-BC-P-00007', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-P-00007/il_570xN.857917673_5r7q.jpg', 0, 1, 21.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-06 20:35:46', '2015-12-06 20:39:04'),
(80, 'Breast Cancer Fighter Gal Rosie The Riveter Shirt', 'TS-BC-W-00011', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00011/il_570xN.832354312_8001.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-06 20:42:18', '2015-12-06 20:44:16'),
(81, 'Breast Cancer Tribal Warrior Ribbon T-Shirts', 'TS-BC-B-00002', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-B-00002/il_570xN.857148113_t9t3.jpg', 0, 1, 21.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-06 20:47:25', '2015-12-06 20:48:41'),
(82, 'Breast Cancer Tribal Warrior Ribbon Shirts', 'TS-BC-W-00012', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00012/il_570xN.857341654_fdw3.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-06 21:00:24', '2015-12-06 21:02:41'),
(83, 'I Wear Pink For My Hero Breast Cancer Shirt', 'TS-BC-W-00013', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00013/il_570xN.832362372_gc25.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-06 21:04:08', '2015-12-06 21:05:32'),
(84, 'Breast Cancer Hope Butterfly Shirts', 'TS-BC-W-00014', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00014/il_570xN.850035612_rez2.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-06 21:11:15', '2015-12-06 21:12:11'),
(85, 'Breast Cancer Being Strong Shirts', 'TS-BC-W-00015', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00015/il_570xN.849804723_hpvr.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 11:24:40', '2015-12-10 20:50:15'),
(86, 'Breast Cancer Miss My Hero Shirt', 'TS-BC-W-00016', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00016/il_570xN.850030252_fiy5.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 11:27:21', '2015-12-08 11:29:02'),
(87, 'Breast Cancer Picked The Wrong Chick Shirt', 'TS-BC-W-00017', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00017/il_570xN.849639689_5az5.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 11:30:51', '2015-12-08 11:33:10'),
(89, 'Breast Cancer Believe Heart Ribbon T-Shirt', 'TS-BC-W-00018', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00018/il_570xN.832339708_3u3w.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 11:34:19', '2015-12-10 20:50:27'),
(90, 'Breast Cancer Hope Awareness Ribbon Shirt', 'TS-BC-P-00008', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-P-00008/il_570xN.849048809_riqk.jpg', 0, 1, 20.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 11:37:17', '2015-12-08 11:38:42'),
(91, 'Breast Cancer Hope Flower Ribbon Shirt', 'TS-BC-P-00009', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-P-00009/il_570xN.849174264_87rc.jpg', 0, 1, 20.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 11:46:18', '2015-12-08 11:47:55'),
(92, 'Breast Cancer Heart Ribbon Shirts', 'TS-BC-P-00010', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-P-00010/il_570xN.848452042_rjjj.jpg', 0, 1, 20.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 11:49:05', '2015-12-08 11:50:28'),
(93, 'Breast Cancer Wearing Ribbon Shirts', 'TS-BC-W-00019', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00019/il_570xN.848006277_8a6g.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 12:16:31', '2015-12-08 12:17:37'),
(94, 'Breast Cancer Not a Super Hero Shirt', 'TS-BC-W-00020', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00020/il_570xN.847790754_7qyk.jpg', 0, 1, 20.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 12:20:13', '2015-12-08 12:22:02'),
(95, 'Hope Heart Ribbon Breast Cancer Shirt', 'TS-BC-P-00011', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-P-00011/il_570xN.833029892_bqjw.jpg', 0, 1, 20.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 12:23:12', '2015-12-08 12:24:35'),
(96, 'Support 2nd Base Breast Cancer Shirts', 'TS-BC-W-00021', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00021/il_570xN.832461090_oms7.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 12:26:22', '2015-12-08 12:27:33'),
(97, 'Stronger Than Cancer Breast Cancer Shirts', 'TS-BC-P-00012', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-P-00012/il_570xN.832805395_t6iq.jpg', 0, 1, 20.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 12:28:25', '2015-12-08 12:29:48'),
(98, 'For My Hero Breast Cancer Shirts', 'TS-BC-P-00013', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-P-00013/il_570xN.833027388_ncpm.jpg', 0, 1, 20.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 12:31:22', '2015-12-08 12:33:19'),
(99, 'Breast Cancer I am Survivor Strong Shirts', 'TS-BC-W-00022', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00022/il_570xN.832231555_pcxe.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 12:36:29', '2015-12-08 12:37:25'),
(100, 'Breast Cancer Hope Ribbon Shirts', 'TS-BC-P-00014', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-P-00014/il_570xN.833035126_oj3n.jpg', 0, 1, 20.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 12:38:17', '2015-12-08 12:40:52'),
(101, 'Personalize Breast Cancer Heart Shirt', 'TS-BC-P-00015', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-P-00015/il_570xN.833034488_jha1.jpg', 0, 1, 20.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 12:41:58', '2015-12-08 12:43:11'),
(102, 'Team Name Breast Cancer Shirts', 'TS-BC-P-00016', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-P-00016/il_570xN.832806063_ghs0.jpg', 0, 1, 20.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 12:43:54', '2015-12-08 12:45:02'),
(103, 'Hope Strong Breast Cancer Shirts', 'TS-BC-P-00017', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-P-00017/il_570xN.833031462_9ga2.jpg', 0, 1, 20.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 12:46:04', '2015-12-08 12:46:58'),
(104, 'Never Give Up Breast Cancer Shirt', 'TS-BC-P-00018', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-P-00018/il_570xN.833030626_hmwr.jpg', 0, 1, 20.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 12:47:44', '2015-12-08 12:48:41'),
(105, 'The Fight is On Against Breast Cancer Shirts', 'TS-BC-W-00023', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00023/il_570xN.832232171_4z4d.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 12:50:00', '2015-12-08 12:51:43'),
(107, 'Someone I Love Needs a Cure Breast Cancer Shirt', 'TS-BC-W-00024', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00024/il_570xN.832459220_gqey.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 12:57:12', '2015-12-08 12:59:02'),
(108, 'Hope Strength Love Breast Cancer Awareness Shirt', 'TS-BC-W-00025', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00025/il_570xN.832458624_5hwa.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 13:00:21', '2015-12-08 13:01:27'),
(109, 'Do Not Disturb..Busy Kicking Cancer''s Butt Shirt', 'TS-BC-W-00026', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00026/il_570xN.832230581_klem.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 13:02:31', '2015-12-08 13:03:31'),
(110, 'Breast Cancer Survivor Rose Tattoo Shirt', 'TS-BC-W-00027', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00027/il_570xN.832230141_sme9.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 13:04:48', '2015-12-08 13:06:13'),
(111, 'Breast Cancer I Wear Pink Tribute Shirts', 'TS-BC-W-00028', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00028/il_570xN.832229697_9v8l.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 13:07:27', '2015-12-08 13:08:20'),
(112, 'Breast Cancer Fighter Diva Shirt', 'TS-BC-W-00029', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00029/il_570xN.832456642_lc3k.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 13:10:07', '2015-12-10 20:51:30'),
(113, 'I''m Wearing Pink For My Hero Breast Cancer Shirt', 'TS-BC-W-00030', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00030/il_570xN.832228549_hfik.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 13:12:08', '2015-12-08 13:13:06'),
(114, 'Breast Cancer Love Courage Hope Shirt', 'TS-BC-W-00031', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00031/il_570xN.832452122_b08w.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 13:14:03', '2015-12-08 13:14:56'),
(115, 'Not Going Down Without a Fight Breast Cancer Shirt', 'TS-BC-W-00032', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00032/il_570xN.832449446_8oj5.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 13:15:42', '2015-12-08 13:16:58'),
(116, 'Hope Breast Cancer Awareness Ribbon Shirt', 'TS-BC-W-00033', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00033/il_570xN.832214443_bp1a.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 13:18:41', '2015-12-08 13:19:39'),
(117, 'Breast Cancer I Fight Back I Fight Hard...I Fight To Win Shirts', 'TS-BC-W-00034', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00034/il_570xN.832372332_d9zv.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 14:26:38', '2015-12-08 14:27:53'),
(118, 'This Gal is a Survivor Breast Cancer Shirts', 'TS-BC-W-00035', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00035/il_570xN.832143645_8v4m.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 14:29:11', '2015-12-08 14:30:05'),
(119, 'Breast Cancer We Can Do It Rosie The Riveter Shirts', 'TS-BC-W-00036', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00036/il_570xN.832367158_anfb.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 14:31:01', '2015-12-08 14:32:38'),
(120, 'Wake Up...Kick Butt Breast Cancer Shirts', 'TS-BC-W-00037', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00037/il_570xN.832138259_8whc.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 14:33:34', '2015-12-08 14:34:43'),
(121, 'Tough Girls Wear Pink Breast Cancer Shirt', 'TS-BC-W-00038', '', '', '', '', '', '', 360, 6, 'catalog/TS-BC-W-00038/il_570xN.832363950_o1al.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 14:36:29', '2015-12-08 14:37:34'),
(122, 'I Love Someone With Hodgkins Lymphoma To The Moon and Back', 'TS-HL-B-00001', '', '', '', '', '', '', 360, 5, 'catalog/TS-HL-B-00001/il_570xN.884263746_cm69.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 14:42:03', '2015-12-08 14:50:29'),
(123, 'Personalize I Wear Lime Green Ribbon Shirt', 'TS-L-W-00001', '', '', '', '', '', '', 360, 6, 'catalog/TS-L-W-00001/il_570xN.884811803_fs8z.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 14:51:22', '2015-12-08 14:54:34'),
(124, 'I Wear a Violet Ribbon Hodgkins Lymphoma Shirt', 'TS-HL-W-00001', '', '', '', '', '', '', 360, 6, 'catalog/TS-HL-W-00001/il_570xN.863659228_6lpb.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 14:55:09', '2015-12-08 14:57:24'),
(125, 'Hodgkins Lymphoma Awareness Heart Ribbon Shirt', 'TS-HL-B-00002', '', '', '', '', '', '', 360, 5, 'catalog/TS-HL-B-00002/il_570xN.883914396_74cq.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 14:58:44', '2015-12-08 15:01:04'),
(126, 'Lime Green Awareness Heart Ribbon Shirts', 'TS-L-B-00001', '', '', '', '', '', '', 360, 5, 'catalog/TS-L-B-00001/il_570xN.885083759_8c9j.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 15:02:58', '2015-12-08 15:05:23'),
(127, 'Non-Hodgkin''s Lymphoma Straight Outta Chemo Shirts', 'TS-L-G-00001', '', '', '', '', '', '', 360, 6, 'catalog/TS-L-G-00001/il_570xN.860355286_fnl8.jpg', 0, 1, 21.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 15:06:50', '2015-12-08 15:10:16'),
(128, 'Not Going Down Non-Hodgkins Lymphoma Shirt', 'TS-L-W-00002', '', '', '', '', '', '', 360, 6, 'catalog/TS-L-W-00002/il_570xN.833797689_j9x3.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 15:18:17', '2015-12-08 15:21:17'),
(129, 'Straight Outta Cancer Lime Green Shirts', 'TS-L-G-00002', '', '', '', '', '', '', 360, 6, 'catalog/TS-L-G-00002/il_570xN.881889408_djka.jpg', 0, 1, 21.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 15:41:31', '2015-12-08 15:43:32'),
(130, 'Fuck Non-Hodgkin''s Lymphoma Shirts', 'TS-L-W-00003', '', '', '', '', '', '', 360, 6, 'catalog/TS-L-W-00003/il_570xN.885013378_qrnh.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 15:44:40', '2015-12-08 15:47:51'),
(131, 'Hodgkins Lymphoma Cancer Wrong Chick Shirt', 'TS-HL-W-00002', '', '', '', '', '', '', 360, 6, 'catalog/TS-HL-W-00002/il_570xN.849878428_eif6.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 15:57:46', '2015-12-08 15:59:46'),
(132, 'Lymphoma Strongest Among Us T-Shirt', 'TS-L-W-00004', '', '', '', '', '', '', 360, 6, 'catalog/TS-L-W-00004/il_570xN.873604388_noep.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 16:02:34', '2015-12-08 16:05:42'),
(133, 'Non-Hodgkins Lymphoma Strongest Among Us T-Shirt', 'TS-L-W-00005', '', '', '', '', '', '', 360, 6, 'catalog/TS-L-W-00005/il_570xN.873604388_noep.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 16:06:26', '2015-12-08 16:08:05'),
(134, 'Hodgkins Lymphoma Strongest Among Us T-Shirt', 'TS-HL-W-00003', '', '', '', '', '', '', 360, 6, 'catalog/TS-HL-W-00003/il_570xN.873587242_nvrb.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 16:10:41', '2015-12-08 16:13:18'),
(135, 'Not Going Down Without a Fight Lymphoma Shirt', 'TS-L-W-00006', '', '', '', '', '', '', 360, 6, 'catalog/TS-L-W-00006/il_570xN.832919080_kv0d.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 16:14:33', '2015-12-08 16:16:14'),
(136, 'Being Strong Only Choice Lymphoma Men Unisex Shirts', 'TS-L-W-00007', '', '', '', '', '', '', 360, 6, 'catalog/TS-L-W-00007/il_570xN.832690445_3z4f.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 16:17:28', '2015-12-10 20:50:02'),
(137, 'Non-Hodgkin''s Lymphoma Hope Floral Ribbon Shirts', 'TS-L-G-00003', '', '', '', '', '', '', 360, 6, 'catalog/TS-L-G-00003/il_570xN.860355776_s05n.jpg', 0, 1, 21.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 16:25:47', '2015-12-08 16:27:09'),
(138, 'Non-Hodgkins Lymphoma Hope Love Cure Shirts', 'TS-L-G-00004', '', '', '', '', '', '', 360, 6, 'catalog/TS-L-G-00002/il_570xN.881889408_djka.jpg', 0, 1, 21.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 16:28:24', '2015-12-08 16:29:45'),
(139, 'Straight Outta Chemo Non-Hodgkin''s Lymphoma Shirts', 'TS-L-W-00008', '', '', '', '', '', '', 360, 6, 'catalog/TS-L-W-00008/il_570xN.884785581_909i.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 16:31:43', '2015-12-08 16:34:04'),
(140, 'Straight Outta Chemo Hodgkin''s Lymphoma Shirts', 'TS-HL-W-00004', '', '', '', '', '', '', 360, 6, 'catalog/TS-HL-W-00004/il_570xN.860188032_dj33.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 16:35:21', '2015-12-08 16:38:28'),
(141, 'I Wear a Violet Ribbon For My Hero Hodgkin''s Lymphoma Shirts', 'TS-HL-W-00005', '', '', '', '', '', '', 360, 6, 'catalog/TS-HL-W-00005/il_570xN.859951651_rmkz.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 16:40:07', '2015-12-08 16:41:51'),
(142, 'Hope Love Cure Hodgkin''s Lymphoma Shirts', 'TS-HL-W-00006', '', '', '', '', '', '', 360, 6, 'catalog/TS-HL-W-00006/il_570xN.859950517_o4ml.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 19:01:20', '2015-12-08 19:04:47'),
(143, 'Fuck Hodgkin''s Lymphoma Shirts', 'TS-HL-W-00007', '', '', '', '', '', '', 360, 6, 'catalog/TS-HL-W-00007/il_570xN.860183638_o270.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 19:05:27', '2015-12-08 19:09:07'),
(144, 'Fighting Hodgkins Lymphoma Cancer Now That''s a Bitch Shirt', 'TS-HL-W-00008', '', '', '', '', '', '', 360, 6, 'catalog/TS-HL-W-00008/il_570xN.859946657_bkph.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 19:10:28', '2015-12-08 19:13:45'),
(145, 'Hodgkin''s Lymphoma Fight Support Shirts', 'TS-HL-W-00009', '', '', '', '', '', '', 360, 6, 'catalog/TS-HL-W-00009/il_570xN.860180656_53hs.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-08 19:14:58', '2015-12-08 19:18:15'),
(146, 'Hodgkin''s Lymphoma Butterfly Shirts', 'TS-HL-W-00010', '', '', '', '', '', '', 360, 6, 'catalog/TS-HL-W-00010/il_570xN.859943817_lkci.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 08:25:32', '2015-12-12 08:27:29'),
(147, 'Hodgkin''s Lymphoma Tribal Warrior Shorts', 'TS-HL-W-00013', '', '', '', '', '', '', 360, 6, 'catalog/TS-HL-W-00013/il_570xN.857351198_37zh.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 09:08:26', '2015-12-12 09:22:08'),
(148, 'Hodgkin''s Lymphoma I Fought Back and Won Shirt', 'TS-HL-W-00012', '', '', '', '', '', '', 360, 6, 'catalog/TS-HL-W-00012/il_570xN.859126605_6p89.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 09:11:59', '2015-12-12 09:13:42'),
(149, 'Lime Green Tribal Ribbon Warrior Black T-Shirts', 'TS-L-B-00002', '', '', '', '', '', '', 360, 6, 'catalog/TS-L-B-00002/il_570xN.857141705_dtcn.jpg', 0, 1, 21.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 09:14:58', '2015-12-12 09:17:48'),
(150, 'Hodgkin''s Lymphoma Being Strong Shirts', 'TS-HL-W-00011', '', '', '', '', '', '', 360, 6, 'catalog/TS-HL-W-00011/il_570xN.859942067_1d4w.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 09:18:50', '2015-12-16 19:18:06'),
(151, 'Lime Green Tribal Ribbon Warrior Shirts', 'TS-L-W-00009', '', '', '', '', '', '', 360, 6, 'catalog/TS-L-W-00009/il_570xN.857346506_mygq.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 09:23:20', '2015-12-12 09:28:06'),
(153, 'Hodgkin''s Disease Heart Ribbon Shirt', 'TS-HL-W-00014', '', '', '', '', '', '', 360, 6, 'catalog/TS-HL-W-00014/il_570xN.849226038_i532.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 09:30:45', '2015-12-12 09:34:10'),
(154, 'Hodgkin''s Lymphoma Heart Ribbon Shirt', 'TS-HL-P-00001', '', '', '', '', '', '', 360, 6, 'catalog/TS-HL-P-00001/il_570xN.848994007_ffuz.jpg', 0, 1, 20.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 09:36:48', '2015-12-12 09:39:23'),
(155, 'Lime Green Heart Awareness Shirt', 'TS-L-W-00010', '', '', '', '', '', '', 360, 6, 'catalog/TS-L-W-00010/il_570xN.885017782_qdp4.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 09:39:41', '2015-12-12 09:43:35'),
(156, 'Ready to Win Lymphoma Men/Unisex Shirts', 'TS-L-W-00011', '', '', '', '', '', '', 360, 6, 'catalog/TS-L-W-00011/il_570xN.832914250_tjgy.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 09:44:51', '2015-12-12 09:47:27'),
(157, 'Hodgkins Lymphoma Wearing a Ribbon Shirts', 'TS-HL-W-00015', '', '', '', '', '', '', 360, 6, 'catalog/TS-HL-W-00015/il_570xN.848009795_xe37.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 10:04:10', '2015-12-12 10:06:02'),
(158, 'Lymphoma Wearing a Ribbon Shirts', 'TS-L-W-00012', '', '', '', '', '', '', 360, 6, 'catalog/TS-L-W-00012/il_570xN.885327348_pf85.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 10:07:05', '2015-12-12 10:10:09'),
(160, 'Not Going Down Without a Fight Hodgkins Lymphoma Shirts', 'TS-HL-W-00016', '', '', '', '', '', '', 360, 6, 'catalog/TS-HL-W-00016/il_570xN.832707625_jyrk.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 10:10:58', '2015-12-12 10:13:56'),
(161, 'Strength of a Lymphoma Survivor Men Unisex Shirt', 'TS-L-W-00013', '', '', '', '', '', '', 360, 6, 'catalog/TS-L-W-00013/il_570xN.832689635_psqs.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 10:15:20', '2015-12-12 10:17:16'),
(162, 'Too Tough For Lymphoma Cancer Men Shirt', 'TS-L-W-00014', '', '', '', '', '', '', 360, 6, 'catalog/TS-L-W-00014/il_570xN.832685035_kfxe.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 10:18:09', '2015-12-12 10:19:13'),
(163, 'Too Tough For Lymphoma Cancer Shirt', 'TS-L-W-00015', '', '', '', '', '', '', 360, 6, 'catalog/TS-L-W-00015/il_570xN.832683423_366y.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 10:21:01', '2015-12-12 10:22:28'),
(164, 'Lymphoma I Fought Back and Won Unisex/Men Shirt', 'TS-L-W-00016', '', '', '', '', '', '', 360, 6, 'catalog/TS-L-W-00016/il_570xN.885044062_9ipo.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 10:29:08', '2015-12-12 10:42:58'),
(165, 'Lymphoma I Fought Back and Won Shirt', 'TS-L-W-00017', '', '', '', '', '', '', 360, 6, 'catalog/TS-L-W-00017/il_570xN.885043246_gdok.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 10:45:14', '2015-12-12 10:48:18'),
(166, 'Ready to Win Lymphoma Shirts', 'TS-L-W-00018', '', '', '', '', '', '', 360, 6, 'catalog/TS-L-W-00018/il_570xN.832245919_671a.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 10:49:13', '2015-12-12 10:50:24'),
(167, 'Strength of a Lymphoma Survivor Shirt', 'TS-L-W-00019', '', '', '', '', '', '', 360, 6, 'catalog/TS-L-W-00019/il_570xN.832246671_arpk.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 10:52:25', '2015-12-12 10:54:32'),
(168, 'Being Strong Only Choice Lymphoma Shirts', 'TS-L-W-00020', '', '', '', '', '', '', 360, 6, 'catalog/TS-L-W-00020/il_570xN.885329984_pb2f.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 10:57:00', '2015-12-12 11:00:24'),
(169, 'I Love Someone With Spina Bifida Shirts', 'TS-SB-B-00001', '', '', '', '', '', '', 360, 5, 'catalog/TS-SB-B-00001/il_570xN.883497006_fckq.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 11:32:48', '2015-12-12 11:36:10'),
(170, 'Gray Tribal Warrior Ribbon Shirts', 'TS-BRC-W-00001', '', '', '', '', '', '', 360, 6, 'catalog/TS-BRC-W-00001/il_570xN.857348094_meic.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 11:38:51', '2015-12-12 11:41:12'),
(171, 'Non-Hodgkins Lymphoma Wrong Chick Shirt', 'TS-L-W-00021', '', '', '', '', '', '', 360, 6, 'catalog/TS-L-W-00021/il_570xN.849654675_fuxj.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 11:42:44', '2015-12-12 11:44:26'),
(173, 'Stronger Than Cancer Blue Ribbon Shirt', 'TS-COL-BL-00001', '', '', '', '', '', '', 360, 6, 'catalog/TS-COL-BL-00001/il_570xN.838265765_immj.jpg', 0, 1, 20.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 11:46:14', '2015-12-12 12:00:38'),
(174, 'Cervical Cancer Strongest Among Us T-Shirt', 'TS-CEC-W-00002', '', '', '', '', '', '', 360, 6, 'catalog/TS-CEC-W-00002/il_570xN.873586616_3gj3.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 11:48:37', '2015-12-12 11:52:25'),
(175, 'Not Going Down Chiari Malformation Shirt', 'TS-CM-P-00001', '', '', '', '', '', '', 360, 6, 'catalog/TS-CM-P-00001/il_570xN.837259919_mrpj.jpg', 0, 1, 21.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 11:54:17', '2015-12-12 11:56:33'),
(176, 'Stronger Blue Ribbon Shirt', 'TS-COL-BL-00002', '', '', '', '', '', '', 360, 6, 'catalog/TS-COL-BL-00002/il_570xN.838488570_br9h.jpg', 0, 1, 20.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 11:58:35', '2015-12-12 12:00:15'),
(177, 'I Love Someone With Skin Cancer To The Moon and Back', 'TS-SC-B-00001', '', '', '', '', '', '', 360, 5, 'catalog/TS-SC-B-00001/il_570xN.884270978_6gsn.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 12:01:54', '2015-12-12 12:04:04'),
(178, 'I Love Someone With Ovarian Cancer To The Moon and Back', 'TS-OC-B-00001', '', '', '', '', '', '', 360, 5, 'catalog/TS-OC-B-00001/il_570xN.884033777_mnb6.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 13:48:19', '2015-12-12 14:00:25'),
(179, 'I Love Someone With Non-Hodgkin''s Lymphoma To The Moon and Back', 'TS-L-B-00003', '', '', '', '', '', '', 360, 5, 'catalog/TS-L-B-00003/il_570xN.884269138_hbvf.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 14:01:32', '2015-12-12 14:05:40'),
(180, 'I Love Someone With Melanoma Cancer To The Moon and Back', 'TS-MC-B-00001', '', '', '', '', '', '', 360, 5, 'catalog/TS-MC-B-00001/il_570xN.884032149_iycq.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 14:06:39', '2015-12-12 14:11:20'),
(181, 'I Love Someone With Lymphoma Cancer To The Moon and Back', 'TS-L-B-00004', '', '', '', '', '', '', 360, 5, 'catalog/TS-L-B-00004/il_570xN.884031439_1uea.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 14:13:44', '2015-12-12 14:15:59'),
(182, 'I Love Someone With Lung Cancer To The Moon and Back', 'TS-LUC-B-00001', '', '', '', '', '', '', 360, 5, 'catalog/TS-LUC-B-00001/il_570xN.884266584_6go7.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 14:16:47', '2015-12-12 14:20:50'),
(183, 'I Love Someone With Liver Cancer To The Moon and Back', 'TS-LIVC-B-00001', '', '', '', '', '', '', 360, 5, 'catalog/TS-LIVC-B-00001/il_570xN.884029671_g0o9.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 14:23:06', '2015-12-12 14:25:17'),
(184, 'I Love Someone With Kidney Cancer To The Moon and Back', 'TS-KC-B-00001', '', '', '', '', '', '', 360, 5, 'catalog/TS-KC-B-00001/il_570xN.884264466_asf9.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 14:27:01', '2015-12-12 14:30:08'),
(185, 'I Love Someone With Hodgkins Lymphoma To The Moon and Back', 'TS-HL-B-00003', '', '', '', '', '', '', 360, 5, 'catalog/TS-HL-B-00003/il_570xN.884263746_cm69.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 14:31:29', '2015-12-12 14:34:15'),
(186, 'I Love Someone With Heart Disease To The Moon and Back', 'TS-HD-B-00001', '', '', '', '', '', '', 360, 5, 'catalog/TS-HD-B-00001/il_570xN.884019005_a5r7.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 14:35:17', '2015-12-12 14:38:53'),
(187, 'I Love Someone With Ewing''s Sarcoma To The Moon and Back', 'TS-SAR-B-00001', '', '', '', '', '', '', 360, 5, 'catalog/TS-SAR-B-00001/il_570xN.884018103_p3f2.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 14:40:36', '2015-12-12 14:43:20'),
(188, 'I Love Someone With Childhood Cancer To The Moon and Back', 'TS-CHC-B-00001', '', '', '', '', '', '', 360, 5, 'catalog/TS-CHC-B-00001/il_570xN.884017217_be7p.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 14:45:08', '2015-12-12 14:47:04'),
(189, 'I Love Someone With Cervical Cancer To The Moon and Back', 'TS-CEC-B-00001', '', '', '', '', '', '', 360, 5, 'catalog/TS-CEC-B-00001/il_570xN.884014941_fv9m.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 16:09:17', '2015-12-12 16:13:46'),
(190, 'I Love Someone With Breast Cancer To The Moon and Back', 'TS-BC-B-00003', '', '', '', '', '', '', 360, 5, 'catalog/TS-BC-B-00003/il_570xN.884014125_2uki.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 16:16:29', '2015-12-12 16:19:04'),
(191, 'I Love Someone With Brain Cancer To The Moon and Back', 'TS-BRC-B-00001', '', '', '', '', '', '', 360, 5, 'catalog/TS-BRC-B-00001/il_570xN.884013003_2p99.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 16:21:21', '2015-12-12 16:24:16'),
(192, 'I Love Someone With Bone Cancer To The Moon and Back', 'TS-BOC-B-00001', '', '', '', '', '', '', 360, 5, 'catalog/TS-BOC-B-00001/il_570xN.884248758_agn1.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 16:25:20', '2015-12-12 16:28:10'),
(193, 'I Love Someone With Blood Cancer To The Moon and Back', 'TS-BLC-B-00001', '', '', '', '', '', '', 360, 5, 'catalog/TS-BLC-B-00001/il_570xN.884247846_4yw8.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 16:30:31', '2015-12-12 16:32:37'),
(194, 'I Love Someone With Bile Duct Cancer To The Moon and Back', 'TS-BDC-B-00001', '', '', '', '', '', '', 360, 5, 'catalog/TS-BDC-B-00001/il_570xN.884246846_9s78.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 16:34:19', '2015-12-12 16:36:53'),
(195, 'I Love Someone With Appendix Cancer To The Moon and Back', 'TS-APC-B-00001', '', '', '', '', '', '', 360, 5, 'catalog/TS-APC-B-00001/il_570xN.884242178_tkti.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 16:38:17', '2015-12-12 17:00:24'),
(196, 'I Wear a Violet Ribbon Hodgkins Lymphoma Shirt', 'TS-HL-W-00017', '', '', '', '', '', '', 360, 6, 'catalog/TS-HL-W-00017/il_570xN.863659228_6lpb.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 16:44:12', '2015-12-12 16:45:51'),
(197, 'Personalize I Wear Lime Green Ribbon Shirt', 'TS-L-W-00022', '', '', '', '', '', '', 360, 6, 'catalog/TS-L-W-00022/il_570xN.884811803_fs8z.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 16:47:02', '2015-12-12 16:49:01'),
(198, 'Appendix Cancer Awareness Heart Ribbon Shirts', 'TS-APC-B-00002', '', '', '', '', '', '', 360, 5, 'catalog/TS-APC-B-00002/il_570xN.883923038_gxjq.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2015-12-12 16:56:44', '2016-01-12 20:38:01'),
(201, 'Melanoma Strongest Among Us T-Shirt', 'TS-ME-W-00001', '', '', '', '', '', '', 360, 6, 'catalog/TS-ME-W-00001/il_570xN.873355505_117c.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2016-01-04 10:40:00', '2016-01-04 10:43:06'),
(202, 'Melanoma and Skin Cancer Awareness Heart Ribbon Shirts', 'TS-ME-SC-W-00001', '', '', '', '', '', '', 360, 6, 'catalog/TS-ME-SC-W-00001/il_570xN.894646049_1z2t.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2016-01-04 10:46:01', '2016-01-04 10:48:52'),
(203, 'Colon Cancer Heart Ribbon Shirts', 'TS-COL-W-00001', '', '', '', '', '', '', 360, 6, 'catalog/TS-COL-W-00001/il_570xN.894628677_ivbe.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2016-01-04 10:54:41', '2016-01-04 10:57:28'),
(204, 'Heart Ribbon Shirts Blood Cancer', 'TS-BLC-B-00002', '', '', '', '', '', '', 360, 5, 'catalog/TS-BLC-B-00002/il_570xN.894853436_jafu.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2016-01-04 10:58:33', '2016-01-04 11:04:36'),
(205, 'Lung Cancer Heart Ribbon Shirts', 'TS-LUC-B-00002', '', '', '', '', '', '', 360, 5, 'catalog/TS-LUC-B-00002/il_570xN.894609989_20wy.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2016-01-04 11:13:04', '2016-01-04 11:15:35'),
(206, 'Brain Cancer Heart Ribbon Shirts', 'TS-BRC-B-00002', '', '', '', '', '', '', 360, 5, 'catalog/TS-BRC-B-00002/il_570xN.894608921_dmsw.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2016-01-04 11:17:44', '2016-01-04 11:19:40'),
(207, 'Brain Cancer Picked The Wrong Chick Shirt', 'TS-BRC-W-00002', '', '', '', '', '', '', 360, 6, 'catalog/TS-BRC-W-00002/il_570xN.849874628_c9qq.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2016-01-04 11:20:40', '2016-01-04 11:22:55'),
(208, 'Carcinoid Cancer For My Hero Shirts', 'TS-CAC-W-00001', '', '', '', '', '', '', 360, 6, 'catalog/TS-CAC-W-00001/il_570xN.894043019_eds6.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2016-01-04 11:25:25', '2016-01-04 11:31:13'),
(209, 'Brain Cancer For My Hero Shirts ', 'TS-BRC-W-00003', '', '', '', '', '', '', 360, 6, 'catalog/TS-BRC-W-00003/il_570xN.894038891_lq4a.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2016-01-04 11:33:04', '2016-01-04 11:35:36'),
(210, 'Lung Cancer For My Hero Shirts ', 'TS-LUC-W-00001', '', '', '', '', '', '', 360, 6, 'catalog/TS-LUC-W-00001/il_570xN.894274214_q9de.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2016-01-04 11:37:36', '2016-01-04 11:47:10'),
(211, 'I''ll Never Give Up I''m Fighting To Win Shirts for Blood Cancer', 'TS-BLC-W-00001', '', '', '', '', '', '', 360, 6, 'catalog/TS-BLC-W-00001/il_570xN.894029491_lu0r.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2016-01-04 12:00:16', '2016-01-04 12:02:33'),
(212, 'Colon Cancer For My Hero Shirts', 'TS-COL-W-00002', '', '', '', '', '', '', 360, 6, 'catalog/TS-COL-W-00002/il_570xN.894272368_goso.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2016-01-04 12:04:19', '2016-01-04 12:07:04'),
(213, 'Ovarian Cancer For My Hero Shirts', 'TS-OC-W-00002', '', '', '', '', '', '', 360, 6, 'catalog/TS-OC-W-00002/il_570xN.894263006_fr2u.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2016-01-04 12:08:37', '2016-01-04 12:11:28'),
(214, 'Ovarian Cancer I''ll Never Give Up I''m Fighting To Win Shirts', 'TS-OC-W-00003', '', '', '', '', '', '', 360, 6, 'catalog/TS-OC-W-00003/il_570xN.893874465_jxi4.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2016-01-04 12:12:12', '2016-01-04 12:14:32'),
(215, 'Colon Cancer I''ll Never Give Up I''m Fighting To Win Shirts', 'TS-COL-W-00003', '', '', '', '', '', '', 360, 6, 'catalog/TS-COL-W-00003/il_570xN.894096656_gipg.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2016-01-04 12:15:57', '2016-01-04 12:19:09'),
(216, 'Lung Cancer I''ll Never Give Up I''m Fighting To Win Shirts', 'TS-LUC-W-00002', '', '', '', '', '', '', 360, 6, 'catalog/TS-LUC-W-00002/il_570xN.893844809_bquz.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2016-01-04 12:20:45', '2016-01-04 12:23:27'),
(217, 'I''ll Never Give Up I''m Fighting To Win Shirts for Blood Cancer', 'TS-BLC-W-00002', '', '', '', '', '', '', 360, 6, 'catalog/TS-BLC-W-00002/il_570xN.893842407_it37.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2016-01-04 12:26:33', '2016-01-04 12:28:12'),
(218, 'Brain Cancer Shirts I''ll Never Give Up I''m Fighting To Win', 'TS-BRC-W-00004', '', '', '', '', '', '', 360, 6, 'catalog/TS-BRC-W-00004/il_570xN.893841165_iep1.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2016-01-04 12:29:32', '2016-01-04 12:31:46'),
(219, 'Melanoma and Skin Cancer Shirts I''ll Never Give Up', 'TS-ME-W-00002', '', '', '', '', '', '', 360, 6, 'catalog/TS-ME-W-00002/il_570xN.893839387_gjl2.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2016-01-04 12:38:12', '2016-01-04 12:40:07'),
(220, 'Straight Outta Chemo Purple Shirts', 'TS-CAA-P-00001', '', '', '', '', '', '', 360, 6, 'catalog/TS-CAA-P-00001/il_570xN.859258952_g0dk.jpg', 0, 1, 21.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2016-01-04 15:16:01', '2016-01-04 15:21:11'),
(221, 'Colon Cancer Picked The Wrong Chick Shirt', 'TS-COL-W-00004', '', '', '', '', '', '', 360, 6, 'catalog/TS-COL-W-00004/il_570xN.849647067_h8kq.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2016-01-04 15:23:39', '2016-01-04 15:25:31'),
(222, 'Red Ribbon For My Hero Shirts', 'TS-BLC-R-00001', '', '', '', '', '', '', 360, 6, 'catalog/TS-BLC-R-00001/il_570xN.837306012_6651.jpg', 0, 1, 20.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2016-01-04 15:27:21', '2016-01-04 15:31:44'),
(223, 'Melanoma Cancer Wrong Chick Shirt', 'TS-ME-W-00003', '', '', '', '', '', '', 360, 6, 'catalog/TS-ME-W-00003/il_570xN.849882538_p5sa.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2016-01-04 15:32:34', '2016-01-04 15:37:06'),
(224, 'Multiple Myeloma Strongest Among Us T-Shirt', 'TS-MM-W-00001', '', '', '', '', '', '', 360, 6, 'catalog/TS-MM-W-00001/il_570xN.873588948_g0qm.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2016-01-04 15:39:14', '2016-01-04 15:43:45');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES
(225, 'Esophageal Cancer Strongest Among Us T-Shirt', 'TS-EC-W-00001', '', '', '', '', '', '', 360, 6, 'catalog/TS-EC-W-00001/il_570xN.873353171_6m3t.jpg', 0, 1, 19.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2016-01-04 15:46:01', '2016-01-04 15:51:35'),
(226, 'I Love Someone With Skin Cancer To The Moon', 'TS-SC-B-00001', '', '', '', '', '', '', 360, 5, 'catalog/TS-SKC-B-00001/il_570xN.884270978_6gsn.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2016-01-04 15:53:32', '2016-01-04 15:58:15'),
(227, 'Teal Tribal Warrior Ribbon Shirts', 'TS-OC-B-00002', '', '', '', '', '', '', 360, 5, 'catalog/TS-OC-B-00002/il_570xN.883919286_nbut.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2016-01-04 19:22:34', '2016-01-04 19:24:49'),
(228, 'Grey Awareness Ribbon Heart Shirts', 'TS-BRC-B-00003', '', '', '', '', '', '', 360, 5, 'catalog/TS-BRC-B-00003/il_570xN.883682321_3pdy.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 0, '2016-01-04 19:30:05', '2016-01-04 19:33:36'),
(229, 'Thyroid Cancer Awareness Heart Ribbon Shirts', 'TS-TIC-B-00001', '', '', '', '', '', '', 360, 5, 'catalog/TS-TIC-B-00001/il_570xN.883916232_hypw.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 1, '2016-01-04 19:34:26', '2016-01-04 19:37:54'),
(230, 'Yellow Awareness Heart Ribbon Shirts for Endometriosis', 'TS-END-B-00001', '', '', '', '', '', '', 360, 5, 'catalog/TS-END-B-00001/il_570xN.883674275_j9m6.jpg', 0, 1, 22.9900, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 4, '2016-01-04 19:40:15', '2016-01-04 19:42:18'),
(231, 'Straight Outta Chemo Tall Shirts For Men', 'TS-CAA-G-00001', '', '', '', '', '', '', 360, 5, 'catalog/TS-CAA-G-00001/il_570xN.883880952_cczh.jpg', 0, 1, 24.9900, 0, 0, '2016-01-04', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 5, '2016-01-04 20:01:23', '2016-01-04 20:21:32'),
(232, 'Straight Outta Cancer Tall Shirts', 'TS-CAA-G-00002', '', '', '', '', '', '', 360, 5, 'catalog/TS-CAA-G-00002/il_570xN.883874026_9z7q.jpg', 0, 1, 24.9900, 0, 0, '2016-01-04', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 0, 0, '2016-01-04 20:26:52', '2016-01-04 20:36:02'),
(235, 'Straight Outta Cancer Colon Cancer and Rectal Cancer Shirts', 'TS-COL-BL-00003', '', '', '', '', '', '', 360, 6, 'catalog/TS-COL-BL-00003/il_570xN.881649131_42el.jpg', 0, 1, 21.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 0, 0, '2016-01-07 19:22:25', '2016-01-07 19:28:19'),
(238, 'Straight Outta Cancer Yellow Shirts for Sarcoma Survivors', 'TS-CAA-Y-00001', '', '', '', '', '', '', 360, 6, 'catalog/TS-CAA-Y-00001/il_570xN.881884378_46jb.jpg', 0, 1, 21.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 0, 0, '2016-01-07 20:08:40', '2016-01-07 20:11:19'),
(237, 'Straight Outta Cancer Shirts for Blood Cancer Survivors', 'TS-CAA-R-00001', '', '', '', '', '', '', 360, 6, 'catalog/TS-CAA-R-00001/il_570xN.881676061_32ht.jpg', 0, 1, 21.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 0, 0, '2016-01-07 20:01:54', '2016-01-07 20:06:08'),
(239, 'Straight Outta Cancer Light Gray Shirts', 'TS-CAA-G-00003', '', '', '', '', '', '', 360, 6, 'catalog/TS-CAA-G-00003/il_570xN.881676527_8b4t.jpg', 0, 1, 21.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 0, 0, '2016-01-07 20:13:58', '2016-01-07 20:17:15'),
(240, 'Straight Outta Cancer Green Shirts', 'TS-CAA-GR-00001', '', '', '', '', '', '', 360, 6, 'catalog/TS-CAA-GR-00001/il_570xN.881881842_fjc3.jpg', 0, 1, 21.9900, 0, 0, '2015-12-06', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 0, 0, '2016-01-07 20:21:30', '2016-01-07 20:32:17'),
(241, 'Appendix Cancer Awareness Heart Ribbon Shirts', 'test123', '', '', '', '', '', '', 360, 5, '', 0, 1, 1.0000, 0, 0, '2015-11-21', 0.00000000, 5, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 1, 1, 14, '2016-01-09 13:11:33', '2016-01-12 19:31:45');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_attribute`
--

CREATE TABLE IF NOT EXISTS `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_description`
--

CREATE TABLE IF NOT EXISTS `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_description`
--

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(68, 1, 'Cervical Cancer Strongest Among Us T-Shirt', '&lt;p&gt;Cervical Cancer Awareness T-Shirt With Powerful Quote:  The Strongest \r\nAmong Us Are The Ones Who Smile Through The Silent Pain, Cry Behind The \r\nClosed Doors and Fight Battles Nobody Knows About.  Design features an \r\nawareness ribbon with eye-catching text.&lt;br&gt;&lt;br&gt;This shirt is a Gildan \r\nclassic fit t-shirt available from Small to size 3XL in styles for \r\nladies and men. The shirt is made from preshrunk 100% Cotton Jersey and \r\nweighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is printed \r\non demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprint your order anywhere between 3 to 5 Business Days following payment\r\n clearance. We ship by USPS First Class Mail with delivery confirmation.\r\n Business days excludes weekends and certain holidays. &lt;br&gt;&lt;br&gt;Any \r\nquestions or concerns, please send us a message before placing order and\r\n prior to placing unfavorable reviews. Our goal is that you will be \r\nhappy with your shirt. Thank you for your consideration.            \r\n        &lt;/p&gt;', '', 'Cervical Cancer', '', ''),
(69, 1, 'Breast Cancer Strongest Among Us T-Shirt', '&lt;p&gt;Breast Cancer Awareness T-Shirt With Powerful Quote:  The Strongest \r\nAmong Us Are The Ones Who Smile Through The Silent Pain, Cry Behind The \r\nClosed Doors and Fight Battles Nobody Knows About.  Design features an \r\nawareness ribbon with eye-catching text.&lt;br&gt;&lt;br&gt;This shirt is a Gildan \r\nclassic fit t-shirt available from Small to size 3XL in styles for \r\nladies and men. The shirt is made from preshrunk 100% Cotton Jersey and \r\nweighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is printed \r\non demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprint your order anywhere between 3 to 5 Business Days following payment\r\n clearance. We ship by USPS First Class Mail with delivery confirmation.\r\n Business days excludes weekends and certain holidays. &lt;br&gt;&lt;br&gt;Any \r\nquestions or concerns, please send us a message before placing order and\r\n prior to placing unfavorable reviews. Our goal is that you will be \r\nhappy with your shirt. Thank you for your consideration. &lt;/p&gt;', '', 'Breast Cancer', '', ''),
(71, 1, 'Cancer Picked The Wrong Diva Breast Cancer Shirt', 'Cancer Picked The Wrong Diva Breast Cancer Shirt featuring our original \r\ndesign with a pink distressed ribbon to signify advocacy. This shirt is a\r\n Gildan classic fit ladies t-shirt available from Small to size 3XL. The\r\n shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. It \r\nhas taped neck and shoulders. NOTE: It is printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;We ship 3 to 5 business days after order is received (exception holidays and weekends). &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;PINK Copyright notice will NOT appear on shirt.            \r\n        ', '', 'Breast Cancer ', '', ''),
(66, 1, 'Ovarian Cancer Strongest Among Us T-Shirt', '&lt;p&gt;Ovarian Cancer Awareness T-Shirt With Powerful Quote:  The Strongest \r\nAmong Us Are The Ones Who Smile Through The Silent Pain, Cry Behind The \r\nClosed Doors and Fight Battles Nobody Knows About.  Design features an \r\nawareness ribbon with eye-catching text.&lt;br&gt;&lt;br&gt;This shirt is a Gildan \r\nclassic fit t-shirt available from Small to size 3XL in styles for \r\nladies and men. The shirt is made from preshrunk 100% Cotton Jersey and \r\nweighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is printed \r\non demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprint your order anywhere between 3 to 5 Business Days following payment\r\n clearance. We ship by USPS First Class Mail with delivery confirmation.\r\n Business days excludes weekends and certain holidays. &lt;br&gt;&lt;br&gt;Any \r\nquestions or concerns, please send us a message before placing order and\r\n prior to placing unfavorable reviews. Our goal is that you will be \r\nhappy with your shirt. Thank you for your consideration.            \r\n        &lt;/p&gt;', '', 'Ovarian Cancer', '', ''),
(67, 1, 'Cervical Cancer Strongest Among Us T-Shirt', '&lt;p&gt;Cervical Cancer Awareness T-Shirt With Powerful Quote:  The Strongest \r\nAmong Us Are The Ones Who Smile Through The Silent Pain, Cry Behind The \r\nClosed Doors and Fight Battles Nobody Knows About.  Design features an \r\nawareness ribbon with eye-catching text.&lt;br&gt;&lt;br&gt;This shirt is a Gildan \r\nclassic fit t-shirt available from Small to size 3XL in styles for \r\nladies and men. The shirt is made from preshrunk 100% Cotton Jersey and \r\nweighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is printed \r\non demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprint your order anywhere between 3 to 5 Business Days following payment\r\n clearance. We ship by USPS First Class Mail with delivery confirmation.\r\n Business days excludes weekends and certain holidays. &lt;br&gt;&lt;br&gt;Any \r\nquestions or concerns, please send us a message before placing order and\r\n prior to placing unfavorable reviews. Our goal is that you will be \r\nhappy with your shirt. Thank you for your consideration.            \r\n        &lt;/p&gt;', '', 'Cervical Cancer', '', ''),
(64, 1, 'Breast Cancer I Will Never Ever Give Up Shirts', '&lt;p&gt;Breast Cancer I Will Never Ever Give Up Shirt featuring our exclusive \r\ngrunge ribbon printed on a pink shirt. Ideal for awareness walks, \r\nawareness events, and any occasion to take a stand.&lt;br&gt;&lt;br&gt;This shirt is\r\n a Gildan classic fit t-shirt available from Small to size 3XL in styles\r\n for ladies and men. The shirt is made from preshrunk 100% Cotton Jersey\r\n and weighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is \r\nprinted on demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:   Awareness Ribbon is © Copyrighted. All Rights Reserved.            \r\n        &lt;/p&gt;', '', 'Breast Cancer', '', ''),
(65, 1, 'Yes They''re Fake Breast Cancer Grunge Shirts', '&lt;p&gt;Yes, They''re Fake...The Real Ones Tried To Kill Me Breast Cancer shirts \r\nfeaturing our original pink grunge ribbon to make a strong impact for \r\nadvocacy.Ideal for Breast Cancer Awareness month, awareness walks, \r\nsupport events, etc.  &lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit t-shirt\r\n available from Small to size 3XL in styles for ladies and unisex/men. \r\nThe shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: Shirt is printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews. Thank you\r\n for your consideration.&lt;br&gt;&lt;br&gt;NOTE:   ©All Rights Reserved. Pink Distressed Ribbon is Our Copyright.            \r\n        &lt;/p&gt;', '', 'Breast Cancer', '', ''),
(62, 1, 'Never Underestimate a Breast Cancer Survivor Shirt', '&lt;p&gt;Never Underestimate The Strength and Power of a Breast Cancer Survivor \r\nempowering slogan on shirts featuring a pink ribbon to raise awareness \r\nand inspire hope.  Great slogan to wear during Breast Cancer Awareness \r\nMonth, support events, groups and more.&lt;br&gt;&lt;br&gt;This shirt is a Gildan \r\nclassic fit ladies t-shirt (feminine inspired pattern) available from \r\nsize small to size 3XL.  The shirt is made from preshrunk 100% Cotton \r\nJersey and weighs 6.0 oz. It has taped neck and shoulders.  NOTE: It is \r\nprinted on demand in the USA.&lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprint your order anywhere between 3 to 5 Business Days following payment\r\n clearance. We ship by USPS First Class Mail with delivery confirmation.\r\n Business days excludes weekends and certain holidays. &lt;br&gt;&lt;br&gt;Any \r\nquestions or concerns, please send us a message before placing order and\r\n prior to placing unfavorable reviews. Our goal is that you will be \r\nhappy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:  Angel Wing Ribbon is Our Copyright.  All Rights Reserved. &lt;/p&gt;', '', 'Never Underestimate a Breast Cancer Survivor Shirt', '', ''),
(233, 1, 'Breast Cancer Hope Love Cure Light Pink Shirts', '&lt;p&gt;Breast Cancer Hope Love Cure shirts to inspire and raise awareness.  \r\nIdeal for support events and more.  Design features distressed and \r\nscripted style text with an outline ribbon to highlight the color of the\r\n shirt.  The shirt color is light pink.&lt;br&gt;&lt;br&gt;This shirt is a Gildan \r\nclassic fit t-shirt available from Small to size 3XL in styles for \r\nladies and men. The shirt is made from preshrunk 100% Cotton Jersey and \r\nweighs 6.0 oz. It has taped neck and shoulders. NOTE: Black Shirt is \r\nprinted on demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:   Awareness Ribbon is © Copyrighted. All Rights Reserved.            \r\n        &lt;/p&gt;', '', 'Breast Cancer', '', ''),
(63, 1, 'Breast Cancer Yes They''re Fake Shirts', '&lt;p&gt;Yes, They''re Fake...The Real Ones Tried To Kill Me Breast Cancer shirts \r\nfeaturing our original pink grunge ribbon to make a strong impact for \r\nadvocacy.Ideal for Breast Cancer Awareness month, awareness walks, \r\nsupport events, etc.  &lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit t-shirt\r\n available from Small to size 3XL in styles for ladies and unisex/men. \r\nThe shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: Shirt is printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews. Thank you\r\n for your consideration.&lt;br&gt;&lt;br&gt;NOTE:   ©All Rights Reserved. Pink Distressed Ribbon is Our Copyright.            \r\n        &lt;/p&gt;', '', 'Breast Cancer', '', ''),
(55, 1, 'Yes They''re Fake Breast Cancer Shirt', 'Yes, They''re Fake...The Real Ones Tried To Kill Me Breast Cancer shirts \r\nfeaturing our original pink ribbon to make a strong impact for \r\nadvocacy.Ideal for Breast Cancer Awareness month, awareness walks, \r\nsupport events, etc.  October is National Breast Cancer Awareness Month,\r\n so get your pink on!&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit t-shirt \r\navailable from Small to size 3XL in styles for ladies and unisex/men. \r\nThe shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: Shirt is printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews. Thank you\r\n for your consideration.&lt;br&gt;&lt;br&gt;NOTE:   ©All Rights Reserved. Pink Distressed Ribbon is Our Copyright.            \r\n        ', '', 'Straight Outta Chemo Light Pink Shirts', '', ''),
(56, 1, 'Yes They''re Fake Breast Cancer Grunge Shirts', '&lt;p&gt;Yes, They''re Fake...The Real Ones Tried To Kill Me Breast Cancer shirts \r\nfeaturing our original pink grunge ribbon to make a strong impact for \r\nadvocacy.Ideal for Breast Cancer Awareness month, awareness walks, \r\nsupport events, etc.  &lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit t-shirt\r\n available from Small to size 3XL in styles for ladies and unisex/men. \r\nThe shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: Shirt is printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews. Thank you\r\n for your consideration.&lt;br&gt;&lt;br&gt;NOTE:   ©All Rights Reserved. Pink Distressed Ribbon is Our Copyright.            \r\n        &lt;/p&gt;', '', 'Yes They''re Fake Breast Cancer Grunge Shirts', '', ''),
(57, 1, 'Uterine Cancer Strongest Among Us T-Shirt', '&lt;p&gt;Uterine Cancer Awareness T-Shirt With Powerful Quote:  The Strongest \r\nAmong Us Are The Ones Who Smile Through The Silent Pain, Cry Behind The \r\nClosed Doors and Fight Battles Nobody Knows About.  Design features an \r\nawareness ribbon with eye-catching text.&lt;br&gt;&lt;br&gt;This shirt is a Gildan \r\nclassic fit t-shirt available from Small to size 3XL in styles for \r\nladies and men. The shirt is made from preshrunk 100% Cotton Jersey and \r\nweighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is printed \r\non demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprint your order anywhere between 3 to 5 Business Days following payment\r\n clearance. We ship by USPS First Class Mail with delivery confirmation.\r\n Business days excludes weekends and certain holidays. &lt;br&gt;&lt;br&gt;Any \r\nquestions or concerns, please send us a message before placing order and\r\n prior to placing unfavorable reviews. Our goal is that you will be \r\nhappy with your shirt. Thank you for your consideration.            \r\n        &lt;/p&gt;', '', 'Uterine Cancer ', '', ''),
(58, 1, 'Straight Outta Chemo Breast Cancer Shirts', 'A must have for cancer warriors! Straight Outta Chemo for Breast Cancer \r\nWarriors is a bold and funny slogan perfect to wear during, before and \r\nafter chemotherapy treatment.  Makes a great gift for the cancer warrior\r\n with a sense of humor.   The text in the design is slightly distressed \r\nmaking it super-cool to wear.&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit \r\nt-shirt available from Small to size 3XL in styles for ladies and men. \r\nThe shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: Shirt is printed on demand using \r\ndirect to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you will be happy with your shirt. Thank you for your \r\nconsideration.            \r\n        ', '', 'Breast Cancer ', '', ''),
(59, 1, 'Straight Outta Chemo Light Pink Shirts', '&lt;p&gt;A must have for cancer warriors! Straight Outta Chemo Light Pink Shirt \r\nis a bold and funny slogan perfect to wear during, before and after \r\nchemotherapy treatment.  Makes a great gift for the cancer warrior with a\r\n sense of humor.   The text in the design is slightly distressed making \r\nit super-cool to wear.&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit t-shirt\r\n available from Small to size 3XL in styles for ladies and men. The \r\nshirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. It \r\nhas taped neck and shoulders. NOTE: Shirt is printed on demand using \r\ndirect to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you will be happy with your shirt. Thank you for your \r\nconsideration.            \r\n        &lt;/p&gt;', '', 'Breast Cancer', '', ''),
(73, 1, 'Yes They''re Fake Breast Cancer Shirts', '&lt;p&gt;Yes, They''re Fake...The Real Ones Tried To Kill Me Breast Cancer shirts \r\nfeaturing our original pink ribbon to make a strong impact for \r\nadvocacy.Ideal for Breast Cancer Awareness month, awareness walks, \r\nsupport events, etc.  &lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit t-shirt\r\n available from Small to size 3XL in styles for ladies and unisex/men. \r\nThe shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: Shirt is printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews. Thank you\r\n for your consideration.&lt;br&gt;&lt;br&gt;NOTE:   ©All Rights Reserved. Pink Distressed Ribbon is Our Copyright.            \r\n        &lt;/p&gt;', '', 'Breast Cancer', '', ''),
(74, 1, 'Personalize I Wear a Pink Ribbon Shirt', '&lt;p&gt;Personalize I Wear a Pink Ribbon Breast Cancer shirts featuring our original draped style ribbon.&lt;br&gt;&lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt;\r\n ADD a short name to this &quot;I Wear a Ribbon Design&quot; (e.g. Lisa, Jennifer,\r\n Susan, Maria etc) by requesting it when placing your order in the \r\n&quot;comment&quot; field&quot;. &lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit t-shirt \r\navailable from Small to size 3XL in styles for ladies. The shirt is made\r\n from preshrunk 100% Cotton Jersey and weighs 6.0 oz. It has taped neck \r\nand shoulders. NOTE: Shirt is printed on demand using direct to garment \r\nprinters. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:   Awareness Ribbon is © Copyrighted. All Rights Reserved.            \r\n        &lt;/p&gt;', '', 'Breast Cancer ', '', ''),
(75, 1, 'Straight Outta Chemo Light Blue Shirts', '&lt;p&gt;A must have for cancer warriors! Straight Outta Cancer Light  Blue Shirt\r\n is a bold and funny slogan perfect to wear during, before and after \r\nchemotherapy treatment.  Makes a great gift for the cancer warrior with a\r\n sense of humor.   The text in the design is slightly distressed making \r\nit super-cool to wear.&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit t-shirt\r\n available from Small to size 3XL in styles for men. The shirt is made \r\nfrom preshrunk 100% Cotton Jersey and weighs 6.0 oz. It has taped neck \r\nand shoulders. NOTE: Shirt is printed using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt;\r\n SIZES/Printing:  Please check sizing chart prior to placing order. It \r\nis found in the image thumbnails above. You can also read about the \r\nprinting process found in the image thumbnails&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprepare your order for shipment anywhere between 5 to 7 Business Days \r\nfollowing payment clearance. We ship by USPS First Class Mail with \r\ndelivery confirmation. Two or more shirts get shipped by U.S. Priority \r\nmail.  Business days excludes weekends and certain holidays.   &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message before placing order \r\nand prior to placing unfavorable reviews.  Our goal is that you will be \r\nhappy with your shirt. Thank you for your consideration.            \r\n        &lt;/p&gt;', '', 'Cancer Awareness', '', ''),
(76, 1, 'Breast Cancer Hope Love Cure Shrits', '&lt;p&gt;Breast Cancer Hope Love Cure shirts to inspire and raise awareness.  \r\nIdeal for support events and more.  Design features distressed and \r\nscripted style text with an outline ribbon to highlight the color of the\r\n shirt.  The shirt color is HELICONIA/pink colored shirt.&lt;br&gt;&lt;br&gt;This \r\nshirt is a Gildan classic fit t-shirt available from Small to size 3XL \r\nin styles for ladies and men. The shirt is made from preshrunk 100% \r\nCotton Jersey and weighs 6.0 oz. It has taped neck and shoulders. NOTE: \r\nBlack Shirt is printed on demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:   Awareness Ribbon is © Copyrighted. All Rights Reserved.            \r\n        &lt;/p&gt;', '', 'Breast Cancer', '', ''),
(77, 1, 'Straight Outta Chemo Leukemia Shirts', 'A must have for cancer warriors! Straight Outta Chemo for Leukemia and \r\nKidney Cancer Warriors is a bold and funny slogan perfect to wear \r\nduring, before and after chemotherapy treatment.  Makes a great gift for\r\n the cancer warrior with a sense of humor.   The text in the design is \r\nslightly distressed making it super-cool to wear.&lt;br&gt;&lt;br&gt;This shirt is a\r\n Gildan classic fit t-shirt available from Small to size 3XL in styles \r\nfor ladies and men. The shirt is made from preshrunk 100% Cotton Jersey \r\nand weighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is \r\nprinted on demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you will be happy with your shirt. Thank you for your \r\nconsideration.            \r\n        ', '', 'Leukemia', '', ''),
(78, 1, 'Straight Outta Chemo Heliconia Pink Shirts', 'A must have for cancer warriors! Straight Outta Chemo Heliconia Pink \r\nShirt is a bold and funny slogan perfect to wear during, before and \r\nafter chemotherapy treatment.  Makes a great gift for the cancer warrior\r\n with a sense of humor.   The text in the design is slightly distressed \r\nmaking it super-cool to wear.&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit \r\nt-shirt available from Small to size 3XL in styles for ladies and men. \r\nThe shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: Shirt is printed on demand using \r\ndirect to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you will be happy with your shirt. Thank you for your \r\nconsideration.            \r\n        &lt;p&gt;           \r\n        &lt;/p&gt;', '', 'Breast Cancer', '', ''),
(79, 1, 'Breast Cancer Tribal Ribbon T-Shirts', '&lt;p&gt;Breast Cancer Awareness Tribal Ribbon Shirts to raise awareness for your\r\n cause.  Ideal for awareness events and more.  Go bold and stand out \r\nwith this awesome ribbon on a HELICONIA/pink colored shirt.&lt;br&gt;&lt;br&gt;This \r\nshirt is a Gildan classic fit t-shirt available from Small to size 3XL \r\nin styles for ladies. The shirt is made from preshrunk 100% Cotton \r\nJersey and weighs 6.0 oz. It has taped neck and shoulders. NOTE: Black \r\nShirt is printed on demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:   Awareness Ribbon is © Copyrighted. All Rights Reserved.            \r\n        &lt;/p&gt;', '', 'Breast Cancer', '', ''),
(80, 1, 'Breast Cancer Fighter Gal Rosie The Riveter Shirt', 'Show your stronger than Breast Cancer with our Fighter Gal Rosie The \r\nRiveter available on Breast Cancer T-Shirts featuring a pink ribbon. \r\nThis shirt is a Gildan classic fit ladies t-shirt available up from \r\nsmall to size 3XL.  The shirt is made from preshrunk 100% Cotton Jersey \r\nand weighs 6.0 oz. It has taped neck and shoulders.  NOTE: It is printed\r\n on demand in the USA.&lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;\r\n Note regarding shipping: After the 24 hour cancellation period has \r\nexpired, we will process and print your order anywhere between 3 to 5 \r\nBusiness Days following payment clearance. We ship by USPS First Class \r\nMail with delivery confirmation. Business days excludes weekends and \r\ncertain holidays.   No rush shipping at this time.&lt;br&gt;&lt;br&gt;Any questions \r\nor concerns, please send us a message BEFORE placing order and prior to \r\nplacing unfavorable reviews. Our goal is that you''re happy with your \r\nshirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;PINK Copyright notice will NOT appear on shirt.            \r\n        ', '', 'Breast Cancer ', '', ''),
(81, 1, 'Breast Cancer Tribal Warrior Ribbon T-Shirts', 'Breast Cancer Warrior shirts featuring a tribal pink ribbon.  Perfect for the defiant, ready-to-fight warrior!&lt;br&gt;&lt;br&gt;This\r\n shirt is a Gildan classic fit t-shirt available from Small to size 3XL \r\nin styles for ladies. The shirt is made from preshrunk 100% Cotton \r\nJersey and weighs 6.0 oz. It has taped neck and shoulders. NOTE: Black \r\nShirt is printed on demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:   Awareness Ribbon is © Copyrighted. All Rights Reserved.            \r\n        ', '', 'Breast Cancer', '', ''),
(82, 1, 'Breast Cancer Tribal Warrior Ribbon Shirts', '&lt;p&gt;Breast Cancer Warrior shirts featuring a tribal pink ribbon.  Perfect for the defiant, ready-to-fight warrior!&lt;br&gt;&lt;br&gt;This\r\n shirt is a Gildan classic fit t-shirt available from Small to size 3XL \r\nin styles for ladies. The shirt is made from preshrunk 100% Cotton \r\nJersey and weighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt \r\nis printed on demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:   Awareness Ribbon is © Copyrighted. All Rights Reserved.            \r\n        &lt;/p&gt;', '', 'Breast Cancer ', '', ''),
(83, 1, 'I Wear Pink For My Hero Breast Cancer Shirt', '&lt;p&gt;I Wear Pink For My Hero Breast Cancer Awareness Shirt features an \r\noriginal pink ribbon created in draped style for support and advocacy. \r\nThis shirt is a Gildan classic fit ladies t-shirt available from Small \r\nto size 3XL. The shirt is made from preshrunk 100% Cotton Jersey and \r\nweighs 6.0 oz. It has taped neck and shoulders. NOTE: It is printed on \r\ndemand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews. Thank you\r\n for your consideration.&lt;br&gt;&lt;br&gt;PINK Copyright notice will NOT appear on shirt.            \r\n        &lt;/p&gt;', '', 'Breast Cancer ', '', ''),
(84, 1, 'Breast Cancer Hope Butterfly Shirts', '&lt;p&gt;Breast Cancer Hope Shirts spotlighting a beautiful butterfly with a pink\r\n ribbon for support, hope and awareness.  A great gift to inspire those \r\naffected with Breast Cancer with a bit of hope.  &lt;br&gt;&lt;br&gt;This shirt is a\r\n Gildan classic fit ladies t-shirt (feminine inspired pattern) available\r\n from size small to size 3XL.  The shirt is made from preshrunk 100% \r\nCotton Jersey and weighs 6.0 oz. It has taped neck and shoulders.  NOTE:\r\n It is printed on demand in the USA.&lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprint your order anywhere between 3 to 5 Business Days following payment\r\n clearance. We ship by USPS First Class Mail with delivery confirmation.\r\n Business days excludes weekends and certain holidays. &lt;br&gt;&lt;br&gt;Any \r\nquestions or concerns, please send us a message before placing order and\r\n prior to placing unfavorable reviews. Our goal is that you will be \r\nhappy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:  Pink Ribbon is Our Copyright.  All Rights Reserved.            \r\n        &lt;/p&gt;', '', 'Breast Cancer ', '', ''),
(85, 1, 'Breast Cancer Being Strong Shirts', '&lt;p&gt;Breast Cancer Being Strong is The Only Choice Against Cancer shirt \r\nfeaturing the words &quot;Fight, Defy and Win&quot; and  a cool banner design with\r\n a pink ribbon for support and awareness.  Perfect to wear at your next \r\nawareness events, support groups and more.  A very powerful statement \r\nthat makes an impact.&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit ladies \r\nt-shirt (feminine inspired pattern) available from size small to size \r\n3XL.  The shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0\r\n oz. It has taped neck and shoulders.  NOTE: It is printed on demand in \r\nthe USA.&lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprint your order anywhere between 3 to 5 Business Days following payment\r\n clearance. We ship by USPS First Class Mail with delivery confirmation.\r\n Business days excludes weekends and certain holidays. &lt;br&gt;&lt;br&gt;Any \r\nquestions or concerns, please send us a message before placing order and\r\n prior to placing unfavorable reviews. Our goal is that you will be \r\nhappy with your shirt. Thank you for your consideration.            \r\n        &lt;/p&gt;', '', 'Breast Cancer ', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(86, 1, 'Breast Cancer Miss My Hero Shirt', 'Breast Cancer Every Day I Miss My Hero, My Angel remembrance shirt \r\nfeaturing our exclusive angel wings with a pink ribbon to raise \r\nawareness while paying tribute to a special hero in your life. &lt;br&gt;&lt;br&gt;This\r\n shirt is a Gildan classic fit ladies t-shirt (feminine inspired \r\npattern) available from size small to size 3XL.  The shirt is made from \r\npreshrunk 100% Cotton Jersey and weighs 6.0 oz. It has taped neck and \r\nshoulders.  NOTE: It is printed on demand in the USA.&lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprint your order anywhere between 3 to 5 Business Days following payment\r\n clearance. We ship by USPS First Class Mail with delivery confirmation.\r\n Business days excludes weekends and certain holidays. &lt;br&gt;&lt;br&gt;Any \r\nquestions or concerns, please send us a message before placing order and\r\n prior to placing unfavorable reviews. Our goal is that you will be \r\nhappy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:  Angel Wing Ribbon is Our Copyright.  All Rights Reserved.            \r\n        ', '', 'Breast Cancer ', '', ''),
(87, 1, 'Breast Cancer Picked The Wrong Chick Shirt', 'Wear it with a fighter attitude with our line of Breast Cancer Picked \r\nThe Wrong Chick shirts featuring our originally illustrated \r\n(copyrighted) chick wearing a head scarf and an awareness ribbon to \r\nsupport her cause and raise awareness.  Makes a perfect gift for the \r\nwarrior in your life.&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit ladies \r\nt-shirt (feminine inspired pattern) available from size small to size \r\n3XL.  The shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0\r\n oz. It has taped neck and shoulders.  NOTE: It is printed on demand in \r\nthe USA.&lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprint your order anywhere between 3 to 5 Business Days following payment\r\n clearance. We ship by USPS First Class Mail with delivery confirmation.\r\n Business days excludes weekends and certain holidays. &lt;br&gt;&lt;br&gt;Any \r\nquestions or concerns, please send us a message before placing order and\r\n prior to placing unfavorable reviews. Our goal is that you will be \r\nhappy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:  © Chick Illustration is Our Copyright.  All Rights Reserved.            \r\n        ', '', 'Breast Cancer ', '', ''),
(89, 1, 'Breast Cancer Believe Heart Ribbon T-Shirt', 'Inspiring Breast Cancer T-Shirt features a beautiful heart design with a\r\n pink ribbon, swirl accents and the word BELIEVE. This shirt is a Gildan\r\n classic fit ladies t-shirt available up from small to size 3XL.  The \r\nshirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. It \r\nhas taped neck and shoulders.  NOTE: It is printed on demand in the USA.&lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;We ship 3 to 5 business days after order is received (exception holidays and weekends).  &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;PINK Copyright notice will NOT appear on shirt.            \r\n        ', '', 'Breast Cancer ', '', ''),
(90, 1, 'Breast Cancer Hope Awareness Ribbon Shirt', 'Breast Cancer Hope Ribbon Pink Shirt featuring floral elements on a \r\nlarge ribbon with the words hope to the side for inspiration.  Ideal as a\r\n gift to someone who can use some hope. Perfect for Breast Cancer \r\nawareness walks, awareness events, etc.&lt;br&gt;&lt;br&gt;This shirt is a Gildan \r\nclassic fit t-shirt available from Small to size 3XL in styles for \r\nladies and men. The shirt is made from preshrunk 100% Cotton Jersey and \r\nweighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is printed \r\non demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:   Awareness Ribbon is © Copyrighted. All Rights Reserved.            \r\n        ', '', 'Breast Cancer', '', ''),
(91, 1, 'Breast Cancer Hope Flower Ribbon Shirt', 'Breast Cancer Hope Ribbon Shirt featuring floral elements on a large \r\npink ribbon with the word HOPE to the side for inspiration.  Ideal as a \r\ngift for patients, survivors, families, caregivers and supporters. \r\nPerfect for Breast Cancer awareness walks, awareness events, etc.&lt;br&gt;&lt;br&gt;This\r\n shirt is a Gildan classic fit t-shirt available from Small to size 3XL \r\nin styles for ladies and men. The shirt is made from preshrunk 100% \r\nCotton Jersey and weighs 6.0 oz. It has taped neck and shoulders. NOTE: \r\nShirt is printed on demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:   Awareness Ribbon is © Copyrighted. All Rights Reserved.            \r\n        ', '', 'Breast Cancer', '', ''),
(92, 1, 'Breast Cancer Heart Ribbon Shirts', 'Breast Cancer Heart Awareness Ribbon Shirt. The ribbon is our exclusive \r\nhandcrafted ribbon with a diamond-like stud and powerful words. The \r\nwords printed on this shirt are inspiring and empowering:  Hope, Faith, \r\nCure, Believe, Win, Love,  Awareness, Strength, Support, Courage and \r\nTriumph&lt;br&gt;&lt;br&gt;Get the shirt with this empowering message spotlighting \r\nour original heart awareness ribbon printed on a pink shirt. Ideal for \r\nawareness walks, awareness events, and any occasion to wear your \r\nsupport.  Perfect as a gift to inspire hope.&lt;br&gt;&lt;br&gt;This shirt is a \r\nGildan classic fit t-shirt available from Small to size 3XL in styles \r\nfor ladies and men. The shirt is made from preshrunk 100% Cotton Jersey \r\nand weighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is \r\nprinted on demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:   Awareness Ribbon is © Copyrighted. All Rights Reserved.            \r\n        ', '', 'Breast Cancer', '', ''),
(93, 1, 'Breast Cancer Wearing Ribbon Shirts', 'Breast Cancer Shirts with slogan &quot;Wearing a Ribbon For My Hero featuring\r\n floral accents and a pink green ribbon for advocacy and support.  Get \r\nthe shirt with a powerful support message. Ideal for awareness walks, \r\nawareness events, and any occasion to wear your support.  &lt;br&gt;&lt;br&gt;This \r\nshirt is a Gildan classic fit t-shirt available from Small to size 3XL \r\nin styles for ladies and men. The shirt is made from preshrunk 100% \r\nCotton Jersey and weighs 6.0 oz. It has taped neck and shoulders. NOTE: \r\nShirt is printed on demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;October is National Breast Cancer Awareness Month            \r\n        ', '', 'Breast Cancer ', '', ''),
(94, 1, 'Breast Cancer Not a Super Hero Shirt', 'Breast Cancer Shirt with slogan &quot;I''m Not a Super Hero But I''m Fighting \r\nCancer So Close Enough&quot; featuring a pink ribbon to support the cause \r\nwhile advocating for support.  Get the shirt with this humorous but \r\npowerful message. Perfect gift for the defiant cancer fighter. Ideal for\r\n awareness walks, cancer events, etc.&lt;br&gt;&lt;br&gt;This shirt is a Gildan \r\nclassic fit t-shirt available from Small to size 3XL in styles for \r\nladies. The shirt is made from preshrunk 100% Cotton Jersey and weighs \r\n6.0 oz. It has taped neck and shoulders. NOTE: Shirt is printed on \r\ndemand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.\r\n            \r\n                   \r\n        ', '', 'Breast Cancer', '', ''),
(95, 1, 'Hope Heart Ribbon Breast Cancer Shirt', 'HOPE Breast Cancer Shirts features a white heart ribbon on a heliconia \r\npink Gildan shirt that is attention getting while inspiring support and \r\nmost of all hope. Great way to support someone in your life batting \r\nBreast Cancer.  Ideal for walks, support events, and any occasion to \r\nwear your support.  October is National Breast Cancer Awareness Month, \r\nso get your pink on!&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit t-shirt \r\navailable from Small to size 3XL in styles for ladies and men. The shirt\r\n is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. It has \r\ntaped neck and shoulders. NOTE: Shirt is printed on demand using direct \r\nto garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:   ©All Rights Reserved. The Copyright notice on shirt will NOT appear on it.            \r\n        ', '', 'Breast Cancer', '', ''),
(96, 1, 'Support 2nd Base Breast Cancer Shirts', 'Support 2nd Base Breast Cancer Awareness Shirts featuring a cool grunge \r\ndesign with a pink ribbon for support, advocacy and a little humor. This\r\n shirt is a Gildan classic fit ladies t-shirt available from Small to \r\nsize 3XL. The shirt is made from preshrunk 100% Cotton Jersey and weighs\r\n 6.0 oz. It has taped neck and shoulders. NOTE: It is printed on demand.\r\n &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;We ship 3 to 5 business days after order is received (exception holidays and weekends). &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;PINK Copyright notice will NOT appear on shirt.            \r\n        ', '', 'Breast Cancer ', '', ''),
(97, 1, 'Stronger Than Cancer Breast Cancer Shirts', 'STRONGER THAN CANCER!  Get the shirt with this empowering message on \r\nBreast Cancer Awareness Shirts spotlighting our original heart white \r\nribbon outline on a heliconia pink Gildan shirt that is attention \r\ngetting for your cause. Ideal for walks, support events, and any \r\noccasion to wear your support.  October is National Breast Cancer \r\nAwareness Month, so get your pink on!&lt;br&gt;&lt;br&gt;This shirt is a Gildan \r\nclassic fit t-shirt available from Small to size 3XL in styles for \r\nladies and men. The shirt is made from preshrunk 100% Cotton Jersey and \r\nweighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is printed \r\non demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:   ©All Rights Reserved. The Copyright notice on shirt will NOT appear on it.            \r\n        ', '', 'Breast Cancer', '', ''),
(98, 1, 'For My Hero Breast Cancer Shirts', 'For My Hero Breast Cancer Shirts features a white heart ribbon on a \r\nheliconia pink Gildan shirt. Great way to support someone in your life \r\nbatting Breast Cancer.  Ideal for walks, support events, and any \r\noccasion to wear your support.  October is National Breast Cancer \r\nAwareness Month, so get your pink on!&lt;br&gt;&lt;br&gt;This shirt is a Gildan \r\nclassic fit t-shirt available from Small to size 3XL in styles for \r\nladies and men. The shirt is made from preshrunk 100% Cotton Jersey and \r\nweighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is printed \r\non demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:   ©All Rights Reserved. The Copyright notice on shirt will NOT appear on it.            \r\n        ', '', 'Breast Cancer', '', ''),
(99, 1, 'Breast Cancer I am Survivor Strong Shirts', 'Breast Cancer I am Survivor Strong Shirts featuring a pink ribbon for \r\nactivism.   Ideal for awareness walks, support events, etc.   Makes an \r\ninspiring gift. This shirt is a Gildan classic fit ladies t-shirt \r\navailable from Small to size 3XL. The shirt is made from preshrunk 100% \r\nCotton Jersey and weighs 6.0 oz. It has taped neck and shoulders. NOTE: \r\nIt is printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews. Thank you\r\n for your consideration.&lt;br&gt;&lt;br&gt;PINK Copyright notice will NOT appear on shirt.            \r\n        ', '', 'Breast Cancer ', '', ''),
(100, 1, 'Breast Cancer Hope Ribbon Shirts', 'HOPE Breast Cancer Shirts!  Get the shirt with this empowering message \r\non Breast Cancer Awareness Shirts spotlighting our original heart white \r\nribbon outline. The shirt is printed on a heliconia pink Gildan shirt \r\nthat is attention getting for your cause. Ideal for walks, support \r\nevents, and any occasion to wear your support.  October is National \r\nBreast Cancer Awareness Month, so get your pink on!&lt;br&gt;&lt;br&gt;This shirt is\r\n a Gildan classic fit t-shirt available from Small to size 3XL in styles\r\n for ladies and men. The shirt is made from preshrunk 100% Cotton Jersey\r\n and weighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is \r\nprinted on demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:   ©All Rights Reserved. The Copyright notice on shirt will NOT appear on it.            \r\n        ', '', 'Breast Cancer', '', ''),
(101, 1, 'Personalize Breast Cancer Heart Shirt', 'PERSONALIZE it with a loved one''s first name.  This stand-out Breast \r\nCancer Awareness Team Name Shirt spotlights our original heart white \r\nribbon outline on a heliconia pink Gildan shirt that is attention \r\ngetting for your cause. Ideal for walks, support events, and any \r\noccasion to wear your support.  October is National Breast Cancer \r\nAwareness Month, so get your pink on!  &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; CUSTOMIZATION:  \r\nTo add a first name to this shirt, please be sure to include it in the \r\nNOTES section upon checkout, so we can prepare it for you.  &lt;br&gt;&lt;br&gt;This\r\n shirt is a Gildan classic fit t-shirt available from Small to size 3XL \r\nin styles for ladies and men. The shirt is made from preshrunk 100% \r\nCotton Jersey and weighs 6.0 oz. It has taped neck and shoulders. NOTE: \r\nShirt is printed on demand using direct to garment printers.  (Please \r\ncheck sizing below prior to placing order)&lt;br&gt;&lt;br&gt;SIZES:  &lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:   ©All Rights Reserved. The Copyright notice on shirt will NOT appear on it.            \r\n        ', '', 'Breast Cancer', '', ''),
(102, 1, 'Team Name Breast Cancer Shirts', 'PERSONALIZE this team name with your loved one''s first name.  This \r\nstand-out Breast Cancer Awareness Team Name Shirt spotlights our \r\noriginal heart white ribbon outline on a heliconia pink Gildan shirt \r\nthat is attention getting for your cause. Ideal for walks, support \r\nevents, and any occasion to wear your support.  October is National \r\nBreast Cancer Awareness Month, so get your pink on!  &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; \r\nCUSTOMIZATION:  To add a first name to this shirt, please be sure to \r\ninclude it in the NOTES section upon checkout, so we can prepare it for \r\nyou.  &lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit t-shirt available from \r\nSmall to size 3XL in styles for ladies and men. The shirt is made from \r\npreshrunk 100% Cotton Jersey and weighs 6.0 oz. It has taped neck and \r\nshoulders. NOTE: Shirt is printed on demand using direct to garment \r\nprinters. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:   ©All Rights Reserved. The Copyright notice on shirt will NOT appear on it.            \r\n        ', '', 'Breast Cancer', '', ''),
(103, 1, 'Hope Strong Breast Cancer Shirts', 'HOPE STRONG  is an empowering motto for all of us.  Get the shirt with \r\nthis bold HOPE STRONG slogan on Breast Cancer Awareness Shirts \r\nspotlighting our original heart white ribbon outline on a heliconia pink\r\n Gildan shirt that is attention getting for your cause. Ideal for walks,\r\n support events, and any occasion to wear your support.  October is \r\nNational Breast Cancer Awareness Month, so get your pink on!&lt;br&gt;&lt;br&gt;This\r\n shirt is a Gildan classic fit t-shirt available from Small to size 3XL \r\nin styles for ladies and men. The shirt is made from preshrunk 100% \r\nCotton Jersey and weighs 6.0 oz. It has taped neck and shoulders. NOTE: \r\nShirt is printed on demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:   ©All Rights Reserved. The Copyright notice on shirt will NOT appear on it.            \r\n                   \r\n        ', '', 'Breast Cancer', '', ''),
(104, 1, 'Never Give Up Breast Cancer Shirt', 'Never Give Up is a motto we cancer warriors understand!  Get the shirt \r\nwith this bold NEVER GIVE UP slogan on Breast Cancer Awareness Shirts \r\nspotlighting our original heart white ribbon outline on a heliconia pink\r\n Gildan shirt that is attention getting for your cause. Ideal for walks,\r\n support events, and any occasion to wear your support.  October is \r\nNational Breast Cancer Awareness Month, so get your pink on!&lt;br&gt;&lt;br&gt;This\r\n shirt is a Gildan classic fit t-shirt available from Small to size 3XL \r\nin styles for ladies and men. The shirt is made from preshrunk 100% \r\nCotton Jersey and weighs 6.0 oz. It has taped neck and shoulders. NOTE: \r\nShirt is printed on demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:   ©All Rights Reserved. The Copyright notice on shirt will NOT appear on it.            \r\n        ', '', 'Breast Cancer', '', ''),
(105, 1, 'The Fight is On Against Breast Cancer Shirts', 'The Fight is On Against Breast Cancer Shirts featuring our original \r\nhandcrafted boxing gloves with pink ribbons in each glove and a pink \r\nribbon in the center of the design with a starburst.  Makes an \r\nempowering gift for anyone looking to take a stand against Breast \r\nCancer. This shirt is a Gildan classic fit ladies t-shirt available from\r\n Small to size 3XL. The shirt is made from preshrunk 100% Cotton Jersey \r\nand weighs 6.0 oz. It has taped neck and shoulders. NOTE: It is printed \r\non demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;We ship 3 to 5 business days after order is received (exception holidays and weekends). &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;PINK Copyright notice will NOT appear on shirt.            \r\n        ', '', 'Breast Cancer ', '', ''),
(107, 1, 'Someone I Love Needs a Cure Breast Cancer Shirt', 'Someone I Love Needs a Cure Breast Cancer Shirt featuring a pink ribbon \r\nto inspire hope, support and awareness.  This shirt is a Gildan classic \r\nfit ladies t-shirt available from Small to size 3XL. The shirt is made \r\nfrom preshrunk 100% Cotton Jersey and weighs 6.0 oz. It has taped neck \r\nand shoulders. NOTE: It is printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;We ship 3 to 5 business days after order is received (exception holidays and weekends). &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;PINK Copyright notice will NOT appear on shirt.            \r\n        ', '', 'Breast Cancer ', '', ''),
(108, 1, 'Hope Strength Love Breast Cancer Awareness Shirt', 'Hope Strength Love Breast Cancer Awareness Shirt featuring a pink ribbon\r\n with a white butterfly for support and awareness. This shirt is a \r\nGildan classic fit ladies t-shirt available from Small to size 3XL. The \r\nshirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. It \r\nhas taped neck and shoulders. NOTE: It is printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;We ship 3 to 5 business days after order is received (exception certain holidays and weekends). &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;PINK Copyright notice will NOT appear on shirt.            \r\n        ', '', 'Breast Cancer ', '', ''),
(109, 1, 'Do Not Disturb..Busy Kicking Cancer''s Butt Shirt', 'Do Not Disturb..Busy Kicking Cancer''s Butt Shirt with pink color to \r\nsignify the Breast Cancer cause.  Ideal for awareness walks, support \r\nevents, etc.   Makes an inspiring gift. This shirt is a Gildan classic \r\nfit ladies t-shirt available from Small to size 3XL. The shirt is made \r\nfrom preshrunk 100% Cotton Jersey and weighs 6.0 oz. It has taped neck \r\nand shoulders. NOTE: It is printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;We ship 3 to 5 business days after order is received (exception holidays and weekends). &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;PINK Copyright notice will NOT appear on shirt.', '', 'Breast Cancer ', '', ''),
(110, 1, 'Breast Cancer Survivor Rose Tattoo Shirt', 'Breast Cancer Survivor Rose Tattoo Shirt shirts featuring a cool grunge \r\ndesign with a pink ribbon and two red roses to celebrate victory against\r\n Breast Cancer. Ideal for awareness walks, support events, etc.   Makes \r\nan inspiring gift. This shirt is a Gildan classic fit ladies t-shirt \r\navailable from Small to size 3XL. The shirt is made from preshrunk 100% \r\nCotton Jersey and weighs 6.0 oz. It has taped neck and shoulders. NOTE: \r\nIt is printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;We ship 3 to 5 business days after order is received (exception holidays and weekends). &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;PINK Copyright notice will NOT appear on shirt.            \r\n        ', '', 'Breast Cancer ', '', ''),
(111, 1, 'Breast Cancer I Wear Pink Tribute Shirts', 'I Wear Pink For The Warriors, Survivors and The Departed Breast Cancer \r\ntribute shirts featuring a typographic style with a pink awareness \r\nribbon. Ideal for awareness walks, support events, etc.   Makes an \r\ninspiring gift. This shirt is a Gildan classic fit ladies t-shirt \r\navailable from Small to size 3XL. The shirt is made from preshrunk 100% \r\nCotton Jersey and weighs 6.0 oz. It has taped neck and shoulders. NOTE: \r\nIt is printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;We ship 3 to 5 business days after order is received (exception holidays and weekends). &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;PINK Copyright notice will NOT appear on shirt.            \r\n        ', '', 'Breast Cancer ', '', ''),
(112, 1, 'Breast Cancer Fighter Diva Shirt', '&lt;p&gt;Breast Cancer Fighter Diva Shirt featuring a female silhouette and a \r\npink ribbon to wear it with strength against Breast Cancer. Ideal for \r\nawareness walks, support events, etc.   Makes an inspiring gift. This \r\nshirt is a Gildan classic fit ladies t-shirt available from Small to \r\nsize 3XL. The shirt is made from preshrunk 100% Cotton Jersey and weighs\r\n 6.0 oz. It has taped neck and shoulders. NOTE: It is printed on demand.\r\n &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;We ship 3 to 5 business days after order is received (exception holidays and weekends). &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;PINK Copyright notice will NOT appear on shirt.            \r\n        &lt;/p&gt;', '', 'Breast Cancer ', '', ''),
(113, 1, 'I''m Wearing Pink For My Hero Breast Cancer Shirt', 'I''m Wearing Pink For My Hero Breast Cancer Awareness Shirt features an \r\neye-catching banner emblem design with stars and a pink ribbon to \r\nsingify support and advocacy. Ideal for awareness walks to wear your \r\nsupport. This shirt is a Gildan classic fit ladies t-shirt available \r\nfrom Small to size 3XL. The shirt is made from preshrunk 100% Cotton \r\nJersey and weighs 6.0 oz. It has taped neck and shoulders. NOTE: It is \r\nprinted on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;We ship 3 to 5 business days after order is received (exception holidays and weekends). &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;PINK Copyright notice will NOT appear on shirt.            \r\n        ', '', 'Breast Cancer ', '', ''),
(114, 1, 'Breast Cancer Love Courage Hope Shirt', '&lt;p&gt;Beautiful and inspiring Breast Cancer t-shirt with a pink ribbon \r\ncomprised of butterflies and flowers in shape of an awareness ribbon and\r\n the words Love, Courage and Hope.  Makes an inspiring gift. This shirt \r\nis a Gildan classic fit ladies t-shirt available from Small to size 3XL.\r\n The shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: It is printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;We ship 3 to 5 business days after order is received (exception holidays and weekends). &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;PINK Copyright notice will NOT appear on shirt.            \r\n        &lt;/p&gt;', '', 'Breast Cancer ', '', ''),
(115, 1, 'Not Going Down Without a Fight Breast Cancer Shirt', 'Not Going Down Without a Fight...Cure Breast Cancer Shirts featuring our\r\n original design with a pink distressed ribbon to signify advocacy. This\r\n shirt is a Gildan classic fit ladies t-shirt available from Small to \r\nsize 3XL. The shirt is made from preshrunk 100% Cotton Jersey and weighs\r\n 6.0 oz. It has taped neck and shoulders. NOTE: It is printed on demand.\r\n &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XLarge 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;We ship 3 to 5 business days after order is received (exception holidays and weekends). &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;PINK Copyright notice will NOT appear on shirt.            \r\n        ', '', 'Breast Cancer ', '', ''),
(123, 1, 'Personalize I Wear Lime Green Ribbon Shirt', 'Personalize I Wear a Lime Green Ribbon Shirt for Lymphoma, Lyme Disease,\r\n Muscular Dystrophy, Mental Health and CDKL5 Awareness causes. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt;\r\n NOTE: ADD a short name to this &quot;I Wear a Ribbon Design&quot; (e.g. Lisa, \r\nJennifer, Bob, Michael, etc) by requesting it when placing your order in\r\n the &quot;comment&quot; field&quot;. &lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit \r\nt-shirt available from Small to size 3XL in styles for ladies and men. \r\nThe shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: Shirt is printed on demand using \r\ndirect to garment printers (see about us for more info). &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt;SIZES:  (Please check sizing chart located in the thumbnails above prior to placing order)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:  Awareness Ribbon is Our © Copyright. All Rights Reserved.            \r\n        ', '', 'Lymphoma', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(116, 1, 'Hope Breast Cancer Awareness Ribbon Shirt', 'HOPE Inspiring Breast Cancer T-Shirt features a beautiful pink ribbon \r\nwith floral accents. This shirt is a Gildan classic fit ladies t-shirt \r\navailable from Small to size 3XL. The shirt is made from preshrunk 100% \r\nCotton Jersey and weighs 6.0 oz. It has taped neck and shoulders. NOTE: \r\nIt is printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;We ship 3 to 5 business days after order is received (exception certain holidays and weekends). &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;PINK Copyright notice will NOT appear on shirt.            \r\n        ', '', 'Breast Cancer ', '', ''),
(117, 1, 'Breast Cancer I Fight Back...I Fight Hard...I Fight To Win Shirts', 'I Fight Back....I Fight Hard...I Fight to Win slogan on Breast Cancer \r\nAwareness shirts featuring a pink ribbon and lots of defiance too! This \r\nshirt is a Gildan classic fit ladies t-shirt available from Small to \r\nsize 3XL. The shirt is made from preshrunk 100% Cotton Jersey and weighs\r\n 6.0 oz. It has taped neck and shoulders. NOTE: It is printed on demand.\r\n &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;We ship 3 to 5 business days after order is received (exception holidays and weekends). &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;PINK Copyright notice will NOT appear on shirt.            \r\n        ', '', 'Breast Cancer ', '', ''),
(118, 1, 'This Gal is a Survivor Breast Cancer Shirts', '&lt;p&gt;This Gal is a Survivor Breast Cancer T-Shirt featuring a pink ribbon for\r\n awareness. Show the world that you are a SURVIVOR! This shirt is a \r\nGildan classic fit ladies t-shirt available from Small to size 3XL. The \r\nshirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. It \r\nhas taped neck and shoulders. NOTE: It is printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;We ship 3 to 5 business days after order is received (exception holidays and weekends). &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;PINK Copyright notice will NOT appear on shirt.            \r\n        &lt;/p&gt;', '', 'Breast Cancer ', '', ''),
(119, 1, 'Breast Cancer We Can Do It Rosie The Riveter Shirts', 'Breast Cancer Awareness Mission We Can Do It shirt features cultural \r\nicon Rosie The Riveter with her famous pose and featuring a pink ribbon \r\nfor awareness.  October is National Breast Cancer Awareness Month, so \r\nget your pink on!  This shirt is a Gildan classic fit ladies t-shirt \r\navailable from Small to size 3XL. The shirt is made from preshrunk 100% \r\nCotton Jersey and weighs 6.0 oz. It has taped neck and shoulders. NOTE: \r\nIt is printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;We ship 3 to 5 business days after order is received (exception holidays and weekends). &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;PINK Copyright notice will NOT appear on shirt.', '', 'Breast Cancer ', '', ''),
(120, 1, 'Wake Up...Kick Butt Breast Cancer Shirts', 'Take a defiant stance against Breast Cancer with WAKE UP, KICK BUTT and \r\nREPEAT Breast Cancer Fighter Shirts featuring a cool splatter design \r\nwith our original pink distressed ribbon.  This shirt is a Gildan \r\nclassic fit ladies t-shirt available from Small to size 3XL. The shirt \r\nis made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. It has \r\ntaped neck and shoulders. NOTE: It is printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;We ship 3 to 5 business days after order is received (exception holidays and weekends). &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;PINK Copyright notice will NOT appear on shirt.            \r\n        ', '', 'Breast Cancer ', '', ''),
(121, 1, 'Tough Girls Wear Pink Breast Cancer Shirt', 'Tough Girls Wear Pink Breast Cancer Awareness Shirt featuring a cool \r\ngrunge design with a pink distressed awareness ribbon. This shirt is a \r\nGildan classic fit ladies t-shirt available from Small to size 3XL. The \r\nshirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. It \r\nhas taped neck and shoulders. NOTE: It is printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;We ship 3 to 5 business days after order is received (exception holidays and weekends). &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;PINK Copyright notice will NOT appear on shirt.            \r\n        ', '', 'Breast Cancer ', '', ''),
(122, 1, 'I Love Someone With Hodgkins Lymphoma To The Moon and Back and To Infinity and Beyond Shirts', 'Show and wear your support with I Love Someone With Hodgkin''s Lymphoma \r\nTo The Moon and Back and To Infinity and Beyond shirts featuring a \r\nunique decorative design with hearts, a moon and a twist to our original\r\n violet awareness ribbon.&lt;br&gt;&lt;br&gt;This black shirt is a Gildan classic \r\nfit t-shirt available from Small to size 3XL in styles for ladies and \r\nmen. The shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 \r\noz. It has taped neck and shoulders. NOTE: Shirt is printed after \r\nprocessing using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES:  (Please check sizing prior to placing order found in the image thumbnails above)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your shirt anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  Currently, rush shipping is not available, so please plan \r\nahead.&lt;br&gt;&lt;br&gt;Any requests, questions or concerns, please send us a \r\nmessage BEFORE placing order and prior to placing unfavorable reviews.  \r\nOur goal is that you''re happy with your shirt. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n                   \r\n        ', '', 'Hodgkin''s Lymphoma', '', ''),
(124, 1, 'I Wear a Violet Ribbon Hodgkins Lymphoma Shirt', 'I Wear a Violet Awareness Ribbon Hodgkin''s Lymphoma Shirt featuring our original draped style ribbon.&lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt;\r\n ADD a short name to this &quot;I Wear a Ribbon Design&quot; (e.g. Lisa, Jennifer,\r\n Bob, Michael, etc) by requesting it when placing your order in the \r\n&quot;comment&quot; field&quot;. &lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit t-shirt \r\navailable from Small to size 3XL in styles for ladies and men. The shirt\r\n is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. It has \r\ntaped neck and shoulders. NOTE: Shirt is printed on demand using direct \r\nto garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:  Awareness Ribbon is Our © Copyright. All Rights Reserved.', '', 'Hodgkin''s Lymphoma', '', ''),
(125, 1, 'Hodgkins Lymphoma Awareness Heart Ribbon Shirt', 'Hodgkin''s Lymphoma Heart Ribbon Shirts featuring an inspirational design\r\n with empowering words of Faith, Peace, Courage, Love, Hope, \r\nDetermination, Strength, Believe and Never Give Up in the shape of a \r\nheart with a violet ribbon.&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit \r\nt-shirt available from Small to size 3XL in styles for ladies and men. \r\nThe shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: Shirt is printed after processing\r\n using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES:  (Please check sizing prior to placing order found in the image thumbnails above)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  Currently rush shipping is not available.&lt;br&gt;&lt;br&gt;Any \r\nrequests, questions or concerns, please send us a message BEFORE placing\r\n order and prior to placing unfavorable reviews.  Our goal is that \r\nyou''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;© Awareness Heart Design is Copyrighted.            \r\n        ', '', 'Hodgkin''s Lymphoma', '', ''),
(126, 1, 'Lime Green Awareness Heart Ribbon Shirts', 'Lime Green Awareness Heart Ribbon Shirts for causes Lymphoma, Lyme \r\nDisease, Muscular Dystrophy, Mental Health and CDKL5 Awareness causes.  \r\nThis original empowering design features words like Faith, Peace, \r\nCourage, Love, Hope, Determination, Strength, Believe and Never Give Up \r\nin the shape of a heart.&lt;br&gt;&lt;br&gt;NOTE: This Shirt is printed using direct\r\n to garment printers, meaning the ink is embedded directly on the fabric\r\n which makes it last longer than conventional screen printing.  &lt;br&gt;&lt;br&gt;This\r\n shirt is a Gildan classic fit t-shirt available from Small to size 3XL \r\nin styles for ladies and men. The shirt is made from preshrunk 100% \r\nCotton Jersey and weighs 6.0 oz. It has taped neck and shoulders.&lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt;SIZES:  (Please check sizing prior to placing order found in the image thumbnails)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  Currently rush shipping is not available.&lt;br&gt;&lt;br&gt;Any \r\nrequests, questions or concerns, please send us a message BEFORE placing\r\n order and prior to placing unfavorable reviews.  Our goal is that \r\nyou''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;© Awareness Heart Design is Copyrighted.            \r\n        ', '', 'Lymphoma', '', ''),
(127, 1, 'Non-Hodgkin''s Lymphoma Straight Outta Chemo Shirts', 'Straight Outta Chemo Shirts for Non-Hodgkin''s Lymphoma warriors is a \r\nbold and funny slogan perfect to wear during, before and after \r\nchemotherapy treatment.  Makes a great gift for the Non-Hodgkin''s \r\nLymphoma warrior with a sense of humor.   The text features a slightly \r\ndistressed design on a lime green shirt making it super-cool to wear.&lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt;Also ideal for other causes too.&lt;br&gt;&lt;br&gt;This\r\n shirt is a Gildan classic fit t-shirt available from Small to size 3XL \r\nin a UNISEX style. The lime green is made from preshrunk 100% Cotton \r\nJersey and weighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt \r\nis printed on demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you will be happy with your shirt. Thank you for your \r\nconsideration.            \r\n        ', '', 'Lymphoma', '', ''),
(128, 1, 'Not Going Down Non-Hodgkins Lymphoma Shirt', 'Not Going Down Without a Fight Cure Non-Hodgkin''s Lymphoma Shirts \r\nfeaturing a stand-out grunge design with our original emerald green \r\ndistressed ribbon.  Makes an empowering gift for anyone looking to take a\r\n stand against Non-Hodgkin''s Lymphoma. Ideal for walks, support events, \r\netc.&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit t-shirt available from \r\nSmall to size 3XL in styles for ladies and men. The shirt is made from \r\npreshrunk 100% Cotton Jersey and weighs 6.0 oz. It has taped neck and \r\nshoulders. NOTE: Shirt is printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews. Thank you\r\n for your consideration.&lt;br&gt;&lt;br&gt;NOTE:   ©All Rights Reserved. The Copyright notice on shirt will NOT appear on it.            \r\n        ', '', 'Lymphoma', '', ''),
(129, 1, 'Straight Outta Cancer Lime Green Shirts', 'Straight Outta Chemo Shirts (Lime Green) is a bold and funny slogan \r\nperfect to wear during, before and after chemotherapy treatment.  Makes a\r\n great gift for all cancer warriors with a sense of humor.   The text \r\nfeatures a slightly distressed design on a lime green shirt making it \r\nsuper-cool to wear.&lt;br&gt;&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit \r\nt-shirt available from Small to size 3XL in a UNISEX style. The lime \r\ngreen is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. It \r\nhas taped neck and shoulders. NOTE: Shirt is printed on demand using \r\ndirect to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you will be happy with your shirt. Thank you for your \r\nconsideration.            \r\n        ', '', 'Lymphoma', '', ''),
(130, 1, 'Fuck Non-Hodgkin''s Lymphoma Shirts', 'Say it and mean it! F*ck Lymphoma shirts with a lime green ribbon for \r\nNon-Hodgkin'' s Lymphoma to take a strong strand against cancer while \r\nraising awareness in a bold way.  This shirt is for the defiant cancer \r\nsurvivor who loves a bit of bold humor.&lt;br&gt;&lt;br&gt;We use direct to garment \r\nprinters (not screen printed). In direct to garment method, the color is\r\n printed direct on the fabric, so it last longer than conventional \r\nscreen printing. The shirt is a Gildan classic fit ladies and/or men \r\nt-shirt available from Small to size 3XL. The shirt is made from \r\npreshrunk 100% Cotton Jersey and weighs 6.0 oz. It has taped neck and \r\nshoulders.  NOTE: Shirts are printed upon order processing.&lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES: (Please check sizing prior to placing order found in the image thumbnails above)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping: After the 24 hour cancellation period has expired, \r\nwe will process and print your order anywhere between 5 to 7 Business \r\nDays following payment clearance. We ship by USPS First Class Mail with \r\ndelivery confirmation. Business days excludes weekends and certain \r\nholidays.  No rush shipping at this time.&lt;br&gt;&lt;br&gt;Any questions or \r\nconcerns, please send us a message BEFORE placing order and prior to \r\nplacing unfavorable reviews. Our goal is that you will be happy with \r\nyour shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;Copyright. All Rights Reserved.            \r\n        ', '', 'Lymphoma', '', ''),
(131, 1, 'Hodgkins Lymphoma Cancer Wrong Chick Shirt', 'Wear it with a fighter attitude with our line of Hodgkin''s Lymphoma \r\nCancer Picked The Wrong Chick shirts featuring our originally \r\nillustrated (copyrighted) chick wearing a head scarf and a violet \r\nawareness ribbon to support her cause and raise awareness.  Makes a \r\nperfect gift for the warrior in your life.&lt;br&gt;&lt;br&gt;This shirt is a Gildan\r\n classic fit ladies t-shirt (feminine inspired pattern) available from \r\nsize small to size 3XL.  The shirt is made from preshrunk 100% Cotton \r\nJersey and weighs 6.0 oz. It has taped neck and shoulders.  NOTE: It is \r\nprinted on demand in the USA.&lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprint your order anywhere between 3 to 5 Business Days following payment\r\n clearance. We ship by USPS First Class Mail with delivery confirmation.\r\n Business days excludes weekends and certain holidays. &lt;br&gt;&lt;br&gt;Any \r\nquestions or concerns, please send us a message before placing order and\r\n prior to placing unfavorable reviews. Our goal is that you will be \r\nhappy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:  © Chick Illustration is Our Copyright.  All Rights Reserved.            \r\n        ', '', 'Hodgkin''s Lymphoma', '', ''),
(132, 1, 'Lymphoma Strongest Among Us T-Shirt', 'Lymphoma Awareness T-Shirt With Powerful Quote:  The Strongest Among Us \r\nAre The Ones Who Smile Through The Silent Pain, Cry Behind The Closed \r\nDoors and Fight Battles Nobody Knows About.  Design features an \r\nawareness ribbon with eye-catching text.&lt;br&gt;&lt;br&gt;This shirt is a Gildan \r\nclassic fit t-shirt available from Small to size 3XL in styles for \r\nladies and men. The shirt is made from preshrunk 100% Cotton Jersey and \r\nweighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is printed \r\non demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprint your order anywhere between 3 to 5 Business Days following payment\r\n clearance. We ship by USPS First Class Mail with delivery confirmation.\r\n Business days excludes weekends and certain holidays. &lt;br&gt;&lt;br&gt;Any \r\nquestions or concerns, please send us a message before placing order and\r\n prior to placing unfavorable reviews. Our goal is that you will be \r\nhappy with your shirt. Thank you for your consideration.            \r\n        ', '', 'Lymphoma', '', ''),
(133, 1, 'Non-Hodgkins Lymphoma Strongest Among Us T-Shirt', 'Non-Hodgkin''s Lymphoma Awareness T-Shirt With Powerful Quote:  The \r\nStrongest Among Us Are The Ones Who Smile Through The Silent Pain, Cry \r\nBehind The Closed Doors and Fight Battles Nobody Knows About.  Design \r\nfeatures an awareness ribbon with eye-catching text.&lt;br&gt;&lt;br&gt;This shirt \r\nis a Gildan classic fit t-shirt available from Small to size 3XL in \r\nstyles for ladies and men. The shirt is made from preshrunk 100% Cotton \r\nJersey and weighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt \r\nis printed on demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprint your order anywhere between 3 to 5 Business Days following payment\r\n clearance. We ship by USPS First Class Mail with delivery confirmation.\r\n Business days excludes weekends and certain holidays. &lt;br&gt;&lt;br&gt;Any \r\nquestions or concerns, please send us a message before placing order and\r\n prior to placing unfavorable reviews. Our goal is that you will be \r\nhappy with your shirt. Thank you for your consideration.            \r\n        ', '', 'Lymphoma', '', ''),
(134, 1, 'Hodgkins Lymphoma Strongest Among Us T-Shirt', 'Hodgkin''s Lymphoma (Hodgkin''s Disease) Awareness T-Shirt With Powerful \r\nQuote:  The Strongest Among Us Are The Ones Who Smile Through The Silent\r\n Pain, Cry Behind The Closed Doors and Fight Battles Nobody Knows About.\r\n  Design features an awareness ribbon with eye-catching text.&lt;br&gt;&lt;br&gt;This\r\n shirt is a Gildan classic fit t-shirt available from Small to size 3XL \r\nin styles for ladies and men. The shirt is made from preshrunk 100% \r\nCotton Jersey and weighs 6.0 oz. It has taped neck and shoulders. NOTE: \r\nShirt is printed on demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprint your order anywhere between 3 to 5 Business Days following payment\r\n clearance. We ship by USPS First Class Mail with delivery confirmation.\r\n Business days excludes weekends and certain holidays. &lt;br&gt;&lt;br&gt;Any \r\nquestions or concerns, please send us a message before placing order and\r\n prior to placing unfavorable reviews. Our goal is that you will be \r\nhappy with your shirt. Thank you for your consideration.            \r\n        ', '', 'Hodgkin''s Lymphoma', '', ''),
(136, 1, 'Being Strong Only Choice Lymphoma Men Unisex Shirts', 'You Never Know How Strong You Are Until Being Strong is The Only Choice \r\nLymphoma Cancer shirts featuring a lime green ribbon to raise awareness \r\nfor Non-Hodgkin''s Lymphoma.  Makes an empowering gift for anyone looking\r\n to take a stand against Lymphoma. &lt;br&gt;&lt;br&gt;One of the most classic \r\nt-shirts in a basic fit. It is made from 6oz of 100% cotton jersey \r\ncotton. It has a seamless double needle 7/8 collar along with a taped \r\nneck and shoulders. There is an increased body and sleeve lengths to \r\naccommodate shrinkage. Double needle sleeve and bottom hems NOTE: It is \r\nprinted on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;We ship 3 to 5 business days after order is received (exception holidays and weekends). &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;NOTE:  Copyright notice will NOT appear on shirt.            \r\n        ', '', 'Lymphoma', '', ''),
(135, 1, 'Not Going Down Without a Fight Lymphoma Shirt', 'Not Going Down Without a Fight Cure Lymphoma Shirts featuring a \r\nstand-out grunge design our original lime green grunge ribbon.  Makes an\r\n empowering gift for anyone looking to take a stand against Lymphoma. &lt;br&gt;&lt;br&gt;This\r\n shirt is a Gildan classic fit t-shirt available from Small to size 3XL.\r\n The shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: Shirt is printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;We ship 3 to 5 business days after order is received (exception holidays and weekends). &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;NOTE:  Copyright notice will NOT appear on shirt.            \r\n        ', '', 'Lymphoma', '', ''),
(137, 1, 'Non-Hodgkin''s Lymphoma Hope Floral Ribbon Shirts', 'Non-Hodgkin''s Lymphoma Ribbon shirts with floral accents also raises \r\nawareness for causes such as Lyme Disease, Muscular Dystrophy, Mental \r\nHealth and CDKL5 Awareness.  Ideal for awareness walks, awareness \r\nevents, and any occasion to inspire hope.&lt;br&gt;&lt;br&gt;This shirt is a Gildan \r\nclassic fit t-shirt available from Small to size 3XL in UNISEX style. \r\nThe shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: Shirt is printed on demand using \r\ndirect to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you will be happy with your shirt. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;NOTE:   Awareness Ribbon is ©Copyrighted.  All Rights Reserved.            \r\n        ', '', 'Lymphoma', '', ''),
(138, 1, 'Non-Hodgkins Lymphoma Hope Love Cure Shirts', 'Hope Love Cure shirts with an outline ribbon signifies awareness  for \r\nLymphoma, Lyme Disease, Muscular Dystrophy, Mental Health, Non-Hodgkin''s\r\n Lymphoma and CDKL5 Awareness causes. Design features distressed and \r\nscripted style text with an outline ribbon to highlight the color of the\r\n shirt.&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit t-shirt available from\r\n Small to size 3XL in styles UNISEX sizes.  The shirt is made from \r\npreshrunk 100% Cotton Jersey and weighs 6.0 oz. It has taped neck and \r\nshoulders. NOTE: Shirt is printed on demand using direct to garment \r\nprinters. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:  Awareness Ribbon is Our © Copyright. All Rights Reserved.            \r\n        ', '', 'Lymphoma', '', ''),
(139, 1, 'Straight Outta Chemo Non-Hodgkin''s Lymphoma Shirts', 'Straight Outta Chemo Shirts for Non-Hodgkin''s Lymphoma warriors is a \r\nbold and funny slogan perfect to wear during, before and after \r\nchemotherapy treatment.  Makes a great gift for the Non-Hodgkin''s \r\nLymphoma warrior with a sense of humor.   The text features a lime green\r\n design and is slightly distressed making it super-cool to wear. Shirt \r\nis printed using direct to garment printers (ink is embedded on the \r\nshirt making it last longer than screen printing.&lt;br&gt;&lt;br&gt;This shirt is a\r\n Gildan classic fit t-shirt available from Small to size 3XL in styles \r\nfor ladies and men. The white shirt is made from preshrunk 100% Cotton \r\nJersey and weighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt \r\nis printed on demand using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES: (Please check sizing prior to placing order found in the image thumbnails above)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 5 to 6 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you will be happy with your shirt. Thank you for your \r\nconsideration.            \r\n        ', '', 'Lymphoma', '', ''),
(140, 1, 'Straight Outta Chemo Hodgkin''s Lymphoma Shirts', 'Straight Outta Chemo Shirts for Hodgkin''s Lymphoma warriors is a bold \r\nand funny slogan perfect to wear during, before and after chemotherapy \r\ntreatment.  Makes a great gift for the Hodgkin''s Disease warrior with a \r\nsense of humor.   The text in the violet combination design is slightly \r\ndistressed making it super-cool to wear.&lt;br&gt;&lt;br&gt;This shirt is a Gildan \r\nclassic fit t-shirt available from Small to size 3XL in styles for \r\nladies and men. The white shirt is made from preshrunk 100% Cotton \r\nJersey and weighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt \r\nis printed on demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you will be happy with your shirt. Thank you for your \r\nconsideration.            \r\n        ', '', 'Hodgkin''s Lymphoma', '', ''),
(141, 1, 'I Wear a Violet Ribbon For My Hero Hodgkin''s Lymphoma Shirts', 'I Wear a Violet Ribbon For My Hero Hodgkin''s Lymphoma Shirts features a \r\ncombination of scripted and distressed letters and our original draped \r\nstyle violet ribbon to raise awareness and inspire hope.  Wear it at \r\nyour next support cancer event or anytime to show your support to \r\nsomeone affected by Hodgkin''s Lymphoma aka Hodgkin''s Disease.&lt;br&gt;&lt;br&gt;This\r\n shirt is a Gildan classic fit ladies and/or men t-shirt available from \r\nSmall to size 3XL. The shirt is made from preshrunk 100% Cotton Jersey \r\nand weighs 6.0 oz. It has taped neck and shoulders. NOTE: It is printed \r\non demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping: After the 24 hour cancellation period has expired, \r\nwe will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance. We ship by USPS First Class Mail with \r\ndelivery confirmation. Business days excludes weekends and certain \r\nholidays. &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews. Our goal \r\nis that you will be happy with your shirt. Thank you for your \r\nconsideration.', '', 'Hodgkin''s Lymphoma', '', ''),
(142, 1, 'Hope Love Cure Hodgkin''s Lymphoma Shirts', 'Hope Love Cure Hodgkin''s Lymphoma Shirts features a cool combination of \r\nscripted and distressed letters and our original draped style violet \r\nribbon to raise awareness and inspire hope.  Makes an inspirational gift\r\n for anyone affected by Hodgkin''s Lymphoma aka Hodgkin''s Disease.&lt;br&gt;&lt;br&gt;This\r\n shirt is a Gildan classic fit ladies and/or men t-shirt available from \r\nSmall to size 3XL. The shirt is made from preshrunk 100% Cotton Jersey \r\nand weighs 6.0 oz. It has taped neck and shoulders. NOTE: It is printed \r\non demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping: After the 24 hour cancellation period has expired, \r\nwe will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance. We ship by USPS First Class Mail with \r\ndelivery confirmation. Business days excludes weekends and certain \r\nholidays. &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews. Our goal \r\nis that you will be happy with your shirt. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;Copyright. All Rights Reserved.            \r\n        ', '', 'Hodgkin''s Lymphoma', '', ''),
(143, 1, 'Fuck Hodgkin''s Lymphoma Shirts', 'Say it and mean it! F*ck Lymphoma shirts with a violet ribbon for \r\nHodgkin'' s Lymphoma to take a strong strand against cancer while raising\r\n awareness in a bold way.  This shirt is for the defiant cancer survivor\r\n who loves a bit of bold humor.&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic \r\nfit ladies and/or men t-shirt available from Small to size 3XL. The \r\nshirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. It \r\nhas taped neck and shoulders. NOTE: It is printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping: After the 24 hour cancellation period has expired, \r\nwe will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance. We ship by USPS First Class Mail with \r\ndelivery confirmation. Business days excludes weekends and certain \r\nholidays. &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews. Our goal \r\nis that you will be happy with your shirt. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;Copyright. All Rights Reserved.            \r\n        ', '', 'Hodgkin''s Lymphoma', '', ''),
(144, 1, 'Fighting Hodgkins Lymphoma Cancer Now That''s a Bitch Shirt', 'Fighting Cancer Now That''s a Bitch Shirts with a violet ribbon to \r\nsignify activism and a bit of humor for Hodgkin''s Lymphoma. It features a\r\n bold text design to make a  strong but funny statement while raising \r\nawareness.   We understand the plight of a cancer warrior because we \r\nhave been there.&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit ladies and/or\r\n men t-shirt available from Small to size 3XL. The shirt is made from \r\npreshrunk 100% Cotton Jersey and weighs 6.0 oz. It has taped neck and \r\nshoulders. NOTE: It is printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping: After the 24 hour cancellation period has expired, \r\nwe will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance. We ship by USPS First Class Mail with \r\ndelivery confirmation. Business days excludes weekends and certain \r\nholidays. &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews. Our goal \r\nis that you will be happy with your shirt. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;Copyright. All Rights Reserved.            \r\n        ', '', 'Hodgkin''s Lymphoma', '', ''),
(145, 1, 'Hodgkin''s Lymphoma Fight Support Shirts', 'Hodgkin''s Lymphoma FIGHT SUPPORT and CURE shirts features an ultra cool \r\ngrunge design with a distressed violet ribbon to raise awareness while \r\nshowing your support.   Makes an ideal gift for those looking to raise \r\nawareness for Hodgkin''s Lymphoma aka Hodgkin''s Disease.  We understand \r\nthe plight of a warrior because we have been there.&lt;br&gt;&lt;br&gt;This shirt is\r\n a Gildan classic fit ladies and/or men t-shirt available from Small to \r\nsize 3XL. The shirt is made from preshrunk 100% Cotton Jersey and weighs\r\n 6.0 oz. It has taped neck and shoulders. NOTE: It is printed on demand.\r\n &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping: After the 24 hour cancellation period has expired, \r\nwe will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance. We ship by USPS First Class Mail with \r\ndelivery confirmation. Business days excludes weekends and certain \r\nholidays. &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews. Our goal \r\nis that you will be happy with your shirt. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;Copyright. All Rights Reserved.            \r\n        ', '', 'Hodgkin''s Lymphoma', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(146, 1, 'Hodgkin''s Lymphoma Butterfly Shirts', 'Hodgkin''s Lymphoma shirts features a butterfly tattoo style design with a\r\n violet ribbon.  Makes an ideal gift for those looking to raise \r\nawareness for Hodgkin''s Lymphoma aka Hodgkin''s Disease. &lt;br&gt;&lt;br&gt;This \r\nshirt is a Gildan classic fit ladies and/or men t-shirt available from \r\nSmall to size 3XL. The shirt is made from preshrunk 100% Cotton Jersey \r\nand weighs 6.0 oz. It has taped neck and shoulders. NOTE: It is printed \r\non demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping: After the 24 hour cancellation period has expired, \r\nwe will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance. We ship by USPS First Class Mail with \r\ndelivery confirmation. Business days excludes weekends and certain \r\nholidays. &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews. Our goal \r\nis that you will be happy with your shirt. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;Copyright. All Rights Reserved.            \r\n        ', '', 'Hodgkin''s Lymphoma', '', ''),
(147, 1, 'Hodgkin''s Lymphoma Tribal Warrior Shorts', 'Hodgkin''s Lymphoma Warrior shirts featuring a super-cool tribal \r\nawareness ribbon.  Perfect for the defiant, ready-to-fight warrior!&lt;br&gt;&lt;br&gt;This\r\n shirt is a Gildan classic fit t-shirt available from Small to size 3XL \r\nin styles for ladies and men. The shirt is made from preshrunk 100% \r\nCotton Jersey and weighs 6.0 oz. It has taped neck and shoulders. NOTE: \r\nShirt is printed on demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:  Awareness Ribbon is Our © Copyright. All Rights Reserved.            \r\n        ', '', 'Hodgkin''s Lymphoma', '', ''),
(148, 1, 'Hodgkin''s Lymphoma I Fought Back and Won Shirt', 'Hodgkin''s Lymphoma I Fought Back...I Fought Hard and I Fought and Won \r\nvictory shirts featuring a violet ribbon to raise awareness for \r\nHodgkin''s Lymphoma while celebrating remission.  Makes an empowering \r\ngift for anyone looking to take a stand against Hodgkin''s Lymphoma. &lt;br&gt;&lt;br&gt;This\r\n shirt is a Gildan classic fit ladies and/or men t-shirt available from \r\nSmall to size 3XL. The shirt is made from preshrunk 100% Cotton Jersey \r\nand weighs 6.0 oz. It has taped neck and shoulders. NOTE: It is printed \r\non demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping: After the 24 hour cancellation period has expired, \r\nwe will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance. We ship by USPS First Class Mail with \r\ndelivery confirmation. Business days excludes weekends and certain \r\nholidays. &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews. Our goal \r\nis that you will be happy with your shirt. Thank you for your \r\nconsideration.            \r\n        ', '', 'Hodgkin''s Lymphoma', '', ''),
(149, 1, 'Lime Green Tribal Ribbon Warrior Black T-Shirts', 'Warrior shirts featuring a tribal ribbon  for Lymphoma, Lyme Disease, \r\nMuscular Dystrophy, Mental Health and CDKL5 Awareness causes. Perfect \r\nfor the defiant, ready-to-fight warrior!&lt;br&gt;&lt;br&gt;This shirt is a Gildan \r\nclassic fit t-shirt available from Small to size 3XL in styles for \r\nladies and men. The shirt is made from preshrunk 100% Cotton Jersey and \r\nweighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is printed \r\non demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:  Awareness Ribbon is Our © Copyright. All Rights Reserved.            \r\n        ', '', 'Lymphoma', '', ''),
(150, 1, 'Hodgkin''s Lymphoma Being Strong Shirts', 'Hodgkin''s Lymphoma Being Strong is The Only Choice Against Cancer \r\nshirts. It is the perfect gift for the defiant warrior.  Makes an \r\nempowering gift!  It features a banner design with a violet ribbon. \r\nFight on!&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit ladies and/or men \r\nt-shirt available from Small to size 3XL. The shirt is made from \r\npreshrunk 100% Cotton Jersey and weighs 6.0 oz. It has taped neck and \r\nshoulders. NOTE: It is printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping: After the 24 hour cancellation period has expired, \r\nwe will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance. We ship by USPS First Class Mail with \r\ndelivery confirmation. Business days excludes weekends and certain \r\nholidays. &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews. Our goal \r\nis that you will be happy with your shirt. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;Copyright. All Rights Reserved.            \r\n        ', '', 'Hodgkin''s Lymphoma', '', ''),
(151, 1, 'Lime Green Tribal Ribbon Warrior Shirts', 'Warrior shirts featuring a tribal ribbon  for Lymphoma, Lyme Disease, \r\nMuscular Dystrophy, Mental Health and CDKL5 Awareness causes. Perfect \r\nfor the defiant, ready-to-fight warrior!&lt;br&gt;&lt;br&gt;This shirt is a Gildan \r\nclassic fit t-shirt available from Small to size 3XL in styles for \r\nladies and men. The shirt is made from preshrunk 100% Cotton Jersey and \r\nweighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is printed \r\non demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:  Awareness Ribbon is Our © Copyright. All Rights Reserved.            \r\n        ', '', 'Lymphoma', '', ''),
(153, 1, 'Hodgkin''s Disease Heart Ribbon Shirt', 'Hodgkin''s Lymphoma Heart Ribbon Shirts featuring an inspirational design\r\n with empowering words of Hope, Faith, Cure, Believe, Win, Love,  \r\nAwareness, Strength, Support, Courage and Triumph. The violet awareness \r\nribbon is our exclusive handcrafted ribbon with a diamond-like stud and \r\nis printed on a white shirt.&lt;br&gt;&lt;br&gt;Get the shirt with this empowering \r\nmessage spotlighting our original heart awareness ribbon. Ideal for \r\nawareness walks, awareness events, and any occasion to wear your \r\nsupport.  Perfect as a gift to inspire hope.&lt;br&gt;&lt;br&gt;This shirt is a \r\nGildan classic fit t-shirt available from Small to size 3XL in styles \r\nfor ladies and men. The shirt is made from preshrunk 100% Cotton Jersey \r\nand weighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is \r\nprinted on demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:  Awareness Ribbon is Our © Copyright. All Rights Reserved.            \r\n        ', '', 'Hodgkin''s Lymphoma', '', ''),
(154, 1, 'Hodgkin''s Lymphoma Heart Ribbon Shirt', 'Hodgkin''s Lymphoma Heart Ribbon Shirts featuring an inspirational design\r\n with empowering words of Hope, Faith, Cure, Believe, Win, Love,  \r\nAwareness, Strength, Support, Courage and Triumph. The violet awareness \r\nribbon is our exclusive handcrafted ribbon with a diamond-like stud and \r\nis printed on a purple shirt.&lt;br&gt;&lt;br&gt;Get the shirt with this empowering \r\nmessage spotlighting our original heart awareness ribbon. Ideal for \r\nawareness walks, awareness events, and any occasion to wear your \r\nsupport.  Perfect as a gift to inspire hope.&lt;br&gt;&lt;br&gt;This shirt is a \r\nGildan classic fit t-shirt available from Small to size 3XL in styles \r\nfor ladies and men. The shirt is made from preshrunk 100% Cotton Jersey \r\nand weighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is \r\nprinted on demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:  Awareness Ribbon is Our © Copyright. All Rights Reserved.            \r\n        ', '', 'Hodgkin''s Lymphoma', '', ''),
(155, 1, 'Lime Green Heart Awareness Shirt', 'Heart Awareness Ribbon Shirts for Lymphoma, Lyme Disease, Muscular \r\nDystrophy, Mental Health and CDKL5 Awareness causes. The ribbon is our \r\nexclusive handcrafted ribbon with a diamond-like stud and powerful \r\nwords.&lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt;The words printed on this shirt are inspiring and \r\nempowering:  Hope, Faith, Cure, Believe, Win, Love,  Awareness, \r\nStrength, Support, Courage and Triumph&lt;br&gt;&lt;br&gt;Get the shirt with this \r\nempowering message spotlighting our original heart awareness ribbon. \r\nIdeal for awareness walks, awareness events, and any occasion to wear \r\nyour support.  Perfect as a gift to inspire hope.&lt;br&gt;&lt;br&gt;This shirt is a\r\n Gildan classic fit t-shirt available from Small to size 3XL in styles \r\nfor ladies and men. The shirt is made from preshrunk 100% Cotton Jersey \r\nand weighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is \r\nprinted upon order using direct to garment printers (not screen \r\nprinted). &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES: (Please check sizing prior to placing order found in the image thumbnails above)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:  Awareness Ribbon is Our © Copyright. All Rights Reserved.', '', 'Lymphoma', '', ''),
(156, 1, 'Ready to Win Lymphoma Men/Unisex Shirts', 'Ready to Win Lymphoma Awareness shirts featuring our originally \r\nhand-crafted boxing gloves shaped into a lime green ribbon to raise \r\nawareness for Non-Hodgkin''s Lymphoma.  Makes an empowering gift for \r\nanyone looking to take a stand against Lymphoma. &lt;br&gt;&lt;br&gt;One of the most\r\n classic t-shirts in a basic fit. It is made from 6oz of 100% cotton \r\njersey cotton. It has a seamless double needle 7/8 collar along with a \r\ntaped neck and shoulders. There is an increased body and sleeve lengths \r\nto accommodate shrinkage. Double needle sleeve and bottom hems NOTE: It \r\nis printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;We ship 3 to 5 business days after order is received (exception holidays and weekends). &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;NOTE:  Copyright notice will NOT appear on shirt.            \r\n        ', '', 'Lymphoma', '', ''),
(157, 1, 'Hodgkins Lymphoma Wearing a Ribbon Shirts', 'Hodgkin''s Lymphoma Shirts with slogan &quot;Wearing a Ribbon For My Hero \r\nfeaturing floral accents and a violet ribbon for advocacy and support.  \r\nGet the shirt with a powerful support message. Ideal for awareness \r\nwalks, awareness events, and any occasion to wear your support.  &lt;br&gt;&lt;br&gt;This\r\n shirt is a Gildan classic fit t-shirt available from Small to size 3XL \r\nin styles for ladies and men. The shirt is made from preshrunk 100% \r\nCotton Jersey and weighs 6.0 oz. It has taped neck and shoulders. NOTE: \r\nShirt is printed on demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.\r\n            \r\n        ', '', 'Hodgkin''s Lymphoma', '', ''),
(158, 1, 'Lymphoma Wearing a Ribbon Shirts', 'Non-Hodgkin''s Lymphoma Shirts with slogan &quot;Wearing a Ribbon For My Hero \r\nfeaturing floral accents and a lime green ribbon for advocacy and \r\nsupport.  Get the shirt with a powerful support message. Ideal for \r\nawareness walks, awareness events, and any occasion to wear your \r\nsupport.  &lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit t-shirt available \r\nfrom Small to size 3XL in styles for ladies and men. The shirt is made \r\nfrom preshrunk 100% Cotton Jersey and weighs 6.0 oz. It has taped neck \r\nand shoulders. NOTE: Shirt is printed on demand using direct to garment \r\nprinters. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing in the image thumbnails above prior to placing order)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.\r\n            \r\n        ', '', 'Lymphoma', '', ''),
(160, 1, 'Not Going Down Without a Fight Hodgkins Lymphoma Shirts', 'Not Going Down Without a Fight Cure Hodgkin''s Lymphoma Shirts featuring a\r\n stand-out grunge design our original violet distressed ribbon.  Makes \r\nan empowering gift for anyone looking to take a stand against Hodgkin''s \r\nLymphoma.&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit t-shirt available \r\nfrom Small to size 3XL in styles for ladies and men. The shirt is made \r\nfrom preshrunk 100% Cotton Jersey and weighs 6.0 oz. It has taped neck \r\nand shoulders. NOTE: Shirt is printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;We ship 3 to 5 business days after order is received (exception holidays and weekends). &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;NOTE:   ©All Rights Reserved. The Copyright notice on shirt will NOT appear on it.            \r\n        ', '', 'Hodgkin''s Lymphoma', '', ''),
(161, 1, 'Strength of a Lymphoma Survivor Men Unisex Shirt', 'Never Underestimate The Strength and Power of a Lymphoma Cancer Survivor\r\n Shirt shirts featuring a lime green ribbon to raise awareness for \r\nNon-Hodgkin''s Lymphoma.  Makes an empowering gift for anyone looking to \r\ntake a stand against Lymphoma. &lt;br&gt;&lt;br&gt;One of the most classic t-shirts \r\nin a basic fit. It is made from 6oz of 100% cotton jersey cotton. It has\r\n a seamless double needle 7/8 collar along with a taped neck and \r\nshoulders. There is an increased body and sleeve lengths to accommodate \r\nshrinkage. Double needle sleeve and bottom hems NOTE: Shirt is printed \r\non demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;We ship 3 to 5 business days after order is received (exception holidays and weekends). &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;NOTE:  Copyright notice will NOT appear on shirt.            \r\n        ', '', 'Lymphoma', '', ''),
(162, 1, 'Too Tough For Lymphoma Cancer Men Shirt', 'Too Tough For Lymphoma Cancer Shirt features a strong male silhouette \r\ntaking on a lime green ribbon as a symbol for activism.  Makes an \r\nempowering gift for anyone looking to take a stand against Lymphoma. &lt;br&gt;&lt;br&gt;One\r\n of the most classic t-shirts in a basic fit. It is made from 6oz of \r\n100% cotton jersey cotton. It has a seamless double needle 7/8 collar \r\nalong with a taped neck and shoulders. There is an increased body and \r\nsleeve lengths to accommodate shrinkage. Double needle sleeve and bottom\r\n hems NOTE: It is printed on demand. &lt;br&gt; &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;We ship 3 to 5 business days after order is received (exception holidays and weekends). &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;NOTE:  Copyright notice will NOT appear on shirt.            \r\n        ', '', 'Lymphoma', '', ''),
(163, 1, 'Too Tough For Lymphoma Cancer Shirt', 'Too Tough For Lymphoma Cancer Shirt features a strong female silhouette \r\nflexing her muscles and a lime green ribbon for awareness.  Makes an \r\nempowering gift for anyone looking to take a stand against Lymphoma. \r\nThis shirt is a Gildan classic fit ladies t-shirt available from Small \r\nto size 3XL. The shirt is made from preshrunk 100% Cotton Jersey and \r\nweighs 6.0 oz. It has taped neck and shoulders. NOTE: It is printed on \r\ndemand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;We ship 3 to 5 business days after order is received (exception holidays and weekends). &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;NOTE:  Copyright notice will NOT appear on shirt.            \r\n        ', '', 'Lymphoma', '', ''),
(164, 1, 'Lymphoma I Fought Back and Won Unisex/Men Shirt', 'Lymphoma I Fought Back...I Fought Hard and I Fought and Won victory \r\nshirts featuring a lime green ribbon to raise awareness for \r\nNon-Hodgkin''s Lymphoma while celebrating remission.  Makes an empowering\r\n gift for anyone looking to take a stand against Lymphoma. &lt;br&gt;&lt;br&gt;One \r\nof the most classic t-shirts in a basic fit. It is made from 6oz of 100%\r\n cotton jersey cotton. It has a seamless double needle 7/8 collar along \r\nwith a taped neck and shoulders. There is an increased body and sleeve \r\nlengths to accommodate shrinkage. Double needle sleeve and bottom hems \r\nNOTE: It is printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;We ship 3 to 5 business days after order is received (exception holidays and weekends). &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;NOTE:  Copyright notice will NOT appear on shirt.            \r\n        ', '', 'Lymphoma', '', ''),
(165, 1, 'Lymphoma I Fought Back and Won Shirt', 'Lymphoma I Fought Back...I Fought Hard and I Fought and Won victory \r\nshirts featuring a lime green ribbon to raise awareness for \r\nNon-Hodgkin''s Lymphoma while celebrating remission.  Makes an empowering\r\n gift for anyone looking to take a stand against Lymphoma. This shirt is\r\n a Gildan classic fit ladies t-shirt available from Small to size 3XL. \r\nThe shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: It is printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping: After the 24 hour cancellation period has expired, \r\nwe will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance. We ship by USPS First Class Mail with \r\ndelivery confirmation. Business days excludes weekends and certain \r\nholidays. &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews. Our goal \r\nis that you will be happy with your shirt. Thank you for your \r\nconsideration. ', '', 'Lymphoma', '', ''),
(166, 1, 'Ready to Win Lymphoma Shirts', 'Ready to Win Lymphoma Awareness shirts featuring our originally \r\nhand-crafted boxing gloves shaped into a lime green ribbon to raise \r\nawareness for Non-Hodgkin''s Lymphoma.  Makes an empowering gift for \r\nanyone looking to take a stand against Lymphoma. This shirt is a Gildan \r\nclassic fit ladies t-shirt available from Small to size 3XL. The shirt \r\nis made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. It has \r\ntaped neck and shoulders. NOTE: It is printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;We ship 3 to 5 business days after order is received (exception holidays and weekends). &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;NOTE:  Copyright notice will NOT appear on shirt.            \r\n        ', '', 'Lymphoma', '', ''),
(167, 1, 'Strength of a Lymphoma Survivor Shirt', 'Never Underestimate The Strength and Power of a Lymphoma Cancer Survivor\r\n Shirt shirts featuring a lime green ribbon to raise awareness for \r\nNon-Hodgkin''s Lymphoma.  Makes an empowering gift for anyone looking to \r\ntake a stand against Lymphoma. This shirt is a Gildan classic fit ladies\r\n t-shirt available from Small to size 3XL. The shirt is made from \r\npreshrunk 100% Cotton Jersey and weighs 6.0 oz. It has taped neck and \r\nshoulders. NOTE: It is printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;We ship 3 to 5 business days after order is received (exception holidays and weekends). &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;NOTE:  Copyright notice will NOT appear on shirt.            \r\n        ', '', 'Lymphoma', '', ''),
(168, 1, 'Being Strong Only Choice Lymphoma Shirts', 'You Never Know How Strong You Are Until Being Strong is The Only Choice \r\nLymphoma Cancer shirts featuring a lime green ribbon to raise awareness \r\nfor Non-Hodgkin''s Lymphoma.  Makes an empowering gift for anyone looking\r\n to take a stand against Lymphoma. This shirt is a Gildan classic fit \r\nt-shirt available from Small to size 3XL. The shirt is made from \r\npreshrunk 100% Cotton Jersey and weighs 6.0 oz. It has taped neck and \r\nshoulders. NOTE: It is printed after order is processed using direct to \r\ngarment printers, meaning ink is printed direct on the fabric.&lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing in the image thumbnails above prior to placing order)&lt;br&gt;&lt;br&gt;&lt;br&gt;We ship 5 to 7 business days after order is received (exception holidays and weekends). &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message BEFORE placing order \r\nand prior to placing unfavorable reviews. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;NOTE:  Copyright notice will NOT appear on shirt.', '', 'Lymphoma', '', ''),
(169, 1, 'I Love Someone With Spina Bifida Shirts', 'Show and wear your support with I Love Someone With Spina Bifida To The \r\nMoon and Back and To Infinity and Beyond shirts featuring a unique \r\ndecorative design with hearts, a moon and a twist to our original yellow\r\n awareness ribbon.&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit t-shirt \r\navailable from Small to size 3XL in styles for men. The shirt is made \r\nfrom preshrunk 100% Cotton Jersey and weighs 6.0 oz. It has taped neck \r\nand shoulders. NOTE: Shirt is printed on demand using direct to garment \r\nprinters. &lt;br&gt;&lt;br&gt;SIZING CHART: Check image gallery for sizing chart for women and men before placing order.&lt;br&gt;&lt;br&gt;Holiday\r\n shipping:  After the 24 hour cancellation period has expired, we will \r\nprocess and then print your order anywhere between 5 to 7 Business Days \r\nfollowing payment clearance.  We ship by USPS First Class Mail with \r\ndelivery confirmation.  Business days excludes weekends and certain \r\nholidays.  **NOTE: Please read our shipping profile.&lt;br&gt;&lt;br&gt;VERY \r\nIMPORTANT: Any questions or concerns, please send us a message before \r\nplacing order and prior to placing unfavorable reviews.  Our goal is \r\nthat you will be happy with your shirt. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;Design ©RibbonRevolution. All Rights Reserved.', '', 'Spina Bifida', '', ''),
(170, 1, 'Gray Tribal Warrior Ribbon Shirts', 'Warrior shirts featuring a tribal ribbon for Brain Cancer, Brain Tumor, \r\nDiabetes, Parkinson''s Disease and Asthma Awareness.   Perfect for the \r\ndefiant, ready-to-fight warrior!&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic \r\nfit t-shirt available from Small to size 3XL in styles for ladies and \r\nmen. The shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 \r\noz. It has taped neck and shoulders. NOTE: Shirt is printed on demand \r\nusing direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;Note: Ribbon is Copyrighted. All Rights Reserved.            \r\n        ', '', 'Brain Cancer', '', ''),
(171, 1, 'Non-Hodgkins Lymphoma Wrong Chick Shirt', 'Wear it with a fighter attitude with our line of Non-Hodgkin''s Lymphoma \r\n Cancer Picked The Wrong Chick shirts featuring our originally \r\nillustrated (copyrighted) chick wearing a head scarf and a lime green \r\nawareness ribbon to support her cause and raise awareness.  Makes a \r\nperfect gift for the warrior in your life.&lt;br&gt;&lt;br&gt;This shirt is a Gildan\r\n classic fit ladies t-shirt (feminine inspired pattern) available from \r\nsize small to size 3XL.  The shirt is made from preshrunk 100% Cotton \r\nJersey and weighs 6.0 oz. It has taped neck and shoulders.  NOTE: It is \r\nprinted on demand in the USA.&lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprint your order anywhere between 3 to 5 Business Days following payment\r\n clearance. We ship by USPS First Class Mail with delivery confirmation.\r\n Business days excludes weekends and certain holidays. &lt;br&gt;&lt;br&gt;Any \r\nquestions or concerns, please send us a message before placing order and\r\n prior to placing unfavorable reviews. Our goal is that you will be \r\nhappy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:  © Chick Illustration is Our Copyright.  All Rights Reserved.            \r\n        ', '', 'Lymphoma', '', ''),
(173, 1, 'Stronger Than Cancer Blue Ribbon Shirt', 'Stronger Than Cancer Shirt for causes such as Anal Cancer, Colon Cancer,\r\n and Rectal Cancer awareness.  Get the shirt with this empowering \r\nmessage spotlighting our original heart white ribbon outline and printed\r\n on a blue shirt. Ideal for walks, awareness events, and any occasion to\r\n wear your support.  &lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit t-shirt \r\navailable from Small to size 3XL in styles for ladies and men. The shirt\r\n is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. It has \r\ntaped neck and shoulders. NOTE: Shirt is printed on demand using direct \r\nto garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:   ©All Rights Reserved. The Copyright notice on shirt will NOT appear on it.            \r\n        ', '', 'Colon Cancer', '', ''),
(174, 1, 'Cervical Cancer Strongest Among Us T-Shirt', 'Cervical Cancer Awareness T-Shirt With Powerful Quote:  The Strongest \r\nAmong Us Are The Ones Who Smile Through The Silent Pain, Cry Behind The \r\nClosed Doors and Fight Battles Nobody Knows About.  Design features an \r\nawareness ribbon with eye-catching text.&lt;br&gt;&lt;br&gt;This shirt is a Gildan \r\nclassic fit t-shirt available from Small to size 3XL in styles for \r\nladies and men. The shirt is made from preshrunk 100% Cotton Jersey and \r\nweighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is printed \r\non demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprint your order anywhere between 3 to 5 Business Days following payment\r\n clearance. We ship by USPS First Class Mail with delivery confirmation.\r\n Business days excludes weekends and certain holidays. &lt;br&gt;&lt;br&gt;Any \r\nquestions or concerns, please send us a message before placing order and\r\n prior to placing unfavorable reviews. Our goal is that you will be \r\nhappy with your shirt. Thank you for your consideration.            \r\n        ', '', 'Cervical Cancer', '', ''),
(175, 1, 'Not Going Down Chiari Malformation Shirt', '&lt;p&gt;Not Going Down Without a Fight Chiari Malformation Awareness Shirts \r\nfeaturing a stand-out grunge design with our original purple distressed \r\nribbon.  Printed on a purple shirt! Makes an empowering gift for anyone \r\nlooking to take a stand. Ideal for walks, support events, etc.&lt;br&gt;&lt;br&gt;This\r\n shirt is a Gildan classic fit t-shirt available from Small to size 3XL \r\nin styles for ladies and men. The shirt is made from preshrunk 100% \r\nCotton Jersey and weighs 6.0 oz. It has taped neck and shoulders. NOTE: \r\nShirt is printed on demand. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews. Thank you\r\n for your consideration.&lt;br&gt;&lt;br&gt;NOTE:   ©All Rights Reserved. Purple Ribbon is Our Copyright.  Copyright will not appear on shirt.            \r\n        &lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;/p&gt;', '', 'Chiari Malformation', '', ''),
(176, 1, 'Stronger Blue Ribbon Shirt', 'STRONGER Shirt for causes such as Anal Cancer, Colon Cancer, Rectal \r\nCancer, Ankylosing Spondylitis, Arthritis, Dysautonomia, Erb''s Palsy, \r\nHistiocytosis, Huntington''s Disease, Myositis and Guillain Barre \r\nSyndrome awareness.  Get the shirt with this empowering message \r\nspotlighting our original heart white ribbon outline and printed on a \r\nblue shirt. Ideal for walks, awareness events, and any occasion to wear \r\nyour support.  &lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit t-shirt \r\navailable from Small to size 3XL in styles for ladies and men. The shirt\r\n is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. It has \r\ntaped neck and shoulders. NOTE: Shirt is printed on demand using direct \r\nto garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:   ©All Rights Reserved. The Copyright notice on shirt will NOT appear on it.            \r\n        ', '', 'Colon Cancer', '', ''),
(177, 1, 'I Love Someone With Skin Cancer To The Moon and Back and To Infinity and Beyond Shirts', 'Show and wear your support with I Love Someone With Skin Cancer To The \r\nMoon and Back and To Infinity and Beyond shirts featuring a unique \r\ndecorative design with hearts, a moon and a twist to our original black \r\nawareness ribbon.&lt;br&gt;&lt;br&gt;This black shirt is a Gildan classic fit \r\nt-shirt available from Small to size 3XL in styles for ladies and men. \r\nThe shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: Shirt is printed after processing\r\n using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES:  (Please check sizing prior to placing order found in the image thumbnails above)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your shirt anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  Currently, rush shipping is not available, so please plan \r\nahead.&lt;br&gt;&lt;br&gt;Any requests, questions or concerns, please send us a \r\nmessage BEFORE placing order and prior to placing unfavorable reviews.  \r\nOur goal is that you''re happy with your shirt. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Skin Cancer', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(178, 1, 'I Love Someone With Ovarian Cancer To The Moon and Back and To Infinity and Beyond Shirts', 'Show and wear your support with I Love Someone With Ovarian Cancer To \r\nThe Moon and Back and To Infinity and Beyond shirts featuring a unique \r\ndecorative design with hearts, a moon and a twist to our original teal \r\nawareness ribbon.&lt;br&gt;&lt;br&gt;This black shirt is a Gildan classic fit \r\nt-shirt available from Small to size 3XL in styles for ladies and men. \r\nThe shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: Shirt is printed after processing\r\n using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES:  (Please check sizing prior to placing order found in the image thumbnails above)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your shirt anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  Currently, rush shipping is not available, so please plan \r\nahead.&lt;br&gt;&lt;br&gt;Any requests, questions or concerns, please send us a \r\nmessage BEFORE placing order and prior to placing unfavorable reviews.  \r\nOur goal is that you''re happy with your shirt. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Ovarian Cancer', '', ''),
(179, 1, 'I Love Someone With Non-Hodgkin''s Lymphoma To The Moon and Back and To Infinity and Beyond Shirts', 'Show and wear your support with I Love Someone With Non-Hodgkin''s \r\nLymphoma To The Moon and Back and To Infinity and Beyond shirts \r\nfeaturing a unique decorative design with hearts, a moon and a twist to \r\nour original lime green awareness ribbon.&lt;br&gt;&lt;br&gt;This black shirt is a \r\nGildan classic fit t-shirt available from Small to size 3XL in styles \r\nfor ladies and men. The shirt is made from preshrunk 100% Cotton Jersey \r\nand weighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is \r\nprinted after processing using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES:  (Please check sizing prior to placing order found in the image thumbnails above)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your shirt anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  Currently, rush shipping is not available, so please plan \r\nahead.&lt;br&gt;&lt;br&gt;Any requests, questions or concerns, please send us a \r\nmessage BEFORE placing order and prior to placing unfavorable reviews.  \r\nOur goal is that you''re happy with your shirt. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Lymphoma', '', ''),
(180, 1, 'I Love Someone With Melanoma Cancer To The Moon and Back and To Infinity and Beyond Shirts', 'Show and wear your support with I Love Someone With Melanoma Cancer To \r\nThe Moon and Back and To Infinity and Beyond shirts featuring a unique \r\ndecorative design with hearts, a moon and a twist to our original black \r\nawareness ribbon.&lt;br&gt;&lt;br&gt;This black shirt is a Gildan classic fit \r\nt-shirt available from Small to size 3XL in styles for ladies and men. \r\nThe shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: Shirt is printed after processing\r\n using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES:  (Please check sizing prior to placing order found in the image thumbnails above)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your shirt anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  Currently, rush shipping is not available, so please plan \r\nahead.&lt;br&gt;&lt;br&gt;Any requests, questions or concerns, please send us a \r\nmessage BEFORE placing order and prior to placing unfavorable reviews.  \r\nOur goal is that you''re happy with your shirt. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Melanoma', '', ''),
(181, 1, 'I Love Someone With Lymphoma Cancer To The Moon and Back and To Infinity and Beyond Shirts', 'Show and wear your support with I Love Someone With Lymphoma Cancer To \r\nThe Moon and Back and To Infinity and Beyond shirts featuring a unique \r\ndecorative design with hearts, a moon and a twist to our original lime \r\ngreen awareness ribbon.&lt;br&gt;&lt;br&gt;This black shirt is a Gildan classic fit \r\nt-shirt available from Small to size 3XL in styles for ladies and men. \r\nThe shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: Shirt is printed after processing\r\n using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES:  (Please check sizing prior to placing order found in the image thumbnails above)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your shirt anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  Currently, rush shipping is not available, so please plan \r\nahead.&lt;br&gt;&lt;br&gt;Any requests, questions or concerns, please send us a \r\nmessage BEFORE placing order and prior to placing unfavorable reviews.  \r\nOur goal is that you''re happy with your shirt. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Lymphoma', '', ''),
(182, 1, 'I Love Someone With Lung Cancer To The Moon and Back and To Infinity and Beyond Shirts', 'Show and wear your support with I Love Someone With Lung Cancer To The \r\nMoon and Back and To Infinity and Beyond shirts featuring a unique \r\ndecorative design with hearts, a moon and a twist to our original \r\npearl-white awareness ribbon.&lt;br&gt;&lt;br&gt;This black shirt is a Gildan \r\nclassic fit t-shirt available from Small to size 3XL in styles for \r\nladies and men. The shirt is made from preshrunk 100% Cotton Jersey and \r\nweighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is printed \r\nafter processing using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES:  (Please check sizing prior to placing order found in the image thumbnails above)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your shirt anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  Currently, rush shipping is not available, so please plan \r\nahead.&lt;br&gt;&lt;br&gt;Any requests, questions or concerns, please send us a \r\nmessage BEFORE placing order and prior to placing unfavorable reviews.  \r\nOur goal is that you''re happy with your shirt. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Lung Cancer', '', ''),
(183, 1, 'I Love Someone With Liver Cancer To The Moon and Back and To Infinity and Beyond Shirts', 'Show and wear your support with I Love Someone With Liver Cancer To The \r\nMoon and Back and To Infinity and Beyond shirts featuring a unique \r\ndecorative design with hearts, a moon and a twist to our original orange\r\n awareness ribbon.&lt;br&gt;&lt;br&gt;This black shirt is a Gildan classic fit \r\nt-shirt available from Small to size 3XL in styles for ladies and men. \r\nThe shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: Shirt is printed after processing\r\n using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES:  (Please check sizing prior to placing order found in the image thumbnails above)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your shirt anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  Currently, rush shipping is not available, so please plan \r\nahead.&lt;br&gt;&lt;br&gt;Any requests, questions or concerns, please send us a \r\nmessage BEFORE placing order and prior to placing unfavorable reviews.  \r\nOur goal is that you''re happy with your shirt. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Liver Cancer', '', ''),
(184, 1, 'I Love Someone With Kidney Cancer To The Moon and Back and To Infinity and Beyond Shirts', 'Show and wear your support with I Love Someone With Kidney Cancer To The\r\n Moon and Back and To Infinity and Beyond shirts featuring a unique \r\ndecorative design with hearts, a moon and a twist to our original orange\r\n awareness ribbon.&lt;br&gt;&lt;br&gt;This black shirt is a Gildan classic fit \r\nt-shirt available from Small to size 3XL in styles for ladies and men. \r\nThe shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: Shirt is printed after processing\r\n using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES:  (Please check sizing prior to placing order found in the image thumbnails above)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your shirt anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  Currently, rush shipping is not available, so please plan \r\nahead.&lt;br&gt;&lt;br&gt;Any requests, questions or concerns, please send us a \r\nmessage BEFORE placing order and prior to placing unfavorable reviews.  \r\nOur goal is that you''re happy with your shirt. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Kidney Cancer', '', ''),
(185, 1, 'I Love Someone With Hodgkins Lymphoma To The Moon and Back and To Infinity and Beyond Shirts', 'Show and wear your support with I Love Someone With Hodgkin''s Lymphoma \r\nTo The Moon and Back and To Infinity and Beyond shirts featuring a \r\nunique decorative design with hearts, a moon and a twist to our original\r\n violet awareness ribbon.&lt;br&gt;&lt;br&gt;This black shirt is a Gildan classic \r\nfit t-shirt available from Small to size 3XL in styles for ladies and \r\nmen. The shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 \r\noz. It has taped neck and shoulders. NOTE: Shirt is printed after \r\nprocessing using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES:  (Please check sizing prior to placing order found in the image thumbnails above)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your shirt anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  Currently, rush shipping is not available, so please plan \r\nahead.&lt;br&gt;&lt;br&gt;Any requests, questions or concerns, please send us a \r\nmessage BEFORE placing order and prior to placing unfavorable reviews.  \r\nOur goal is that you''re happy with your shirt. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Hodgkin''s Lymphoma', '', ''),
(186, 1, 'I Love Someone With Heart Disease To The Moon and Back and To Infinity and Beyond Shirts', 'Show and wear your support with I Love Someone With Heart Disease To The\r\n Moon and Back and To Infinity and Beyond shirts featuring a unique \r\ndecorative design with hearts, a moon and a twist to our original yellow\r\n awareness ribbon.&lt;br&gt;&lt;br&gt;This black shirt is a Gildan classic fit \r\nt-shirt available from Small to size 3XL in styles for ladies and men. \r\nThe shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: Shirt is printed after processing\r\n using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES:  (Please check sizing prior to placing order found in the image thumbnails above)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your shirt anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  Currently, rush shipping is not available, so please plan \r\nahead.&lt;br&gt;&lt;br&gt;Any requests, questions or concerns, please send us a \r\nmessage BEFORE placing order and prior to placing unfavorable reviews.  \r\nOur goal is that you''re happy with your shirt. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', ' Heart Disease', '', ''),
(187, 1, 'I Love Someone With Ewing''s Sarcoma To The Moon and Back and To Infinity and Beyond Shirts', 'Show and wear your support with I Love Someone With Ewing''s Sarcoma To \r\nThe Moon and Back and To Infinity and Beyond shirts featuring a unique \r\ndecorative design with hearts, a moon and a twist to our original yellow\r\n awareness ribbon.&lt;br&gt;&lt;br&gt;This black shirt is a Gildan classic fit \r\nt-shirt available from Small to size 3XL in styles for ladies and men. \r\nThe shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: Shirt is printed after processing\r\n using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES:  (Please check sizing prior to placing order found in the image thumbnails above)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your shirt anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  Currently, rush shipping is not available, so please plan \r\nahead.&lt;br&gt;&lt;br&gt;Any requests, questions or concerns, please send us a \r\nmessage BEFORE placing order and prior to placing unfavorable reviews.  \r\nOur goal is that you''re happy with your shirt. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Sarcoma', '', ''),
(188, 1, 'I Love Someone With Childhood Cancer To The Moon and Back and To Infinity and Beyond Shirts', 'Show and wear your support with I Love Someone With Childhood Cancer To \r\nThe Moon and Back and To Infinity and Beyond shirts featuring a unique \r\ndecorative design with hearts, a moon and a twist to our original gold \r\nawareness ribbon.&lt;br&gt;&lt;br&gt;This black shirt is a Gildan classic fit \r\nt-shirt available from Small to size 3XL in styles for ladies and men. \r\nThe shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: Shirt is printed after processing\r\n using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES:  (Please check sizing prior to placing order found in the image thumbnails above)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your shirt anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  Currently, rush shipping is not available, so please plan \r\nahead.&lt;br&gt;&lt;br&gt;Any requests, questions or concerns, please send us a \r\nmessage BEFORE placing order and prior to placing unfavorable reviews.  \r\nOur goal is that you''re happy with your shirt. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Chilhood Cancer', '', ''),
(189, 1, 'I Love Someone With Cervical Cancer To The Moon and Back and To Infinity and Beyond Shirts', 'Show and wear your support with I Love Someone With Cervical Cancer To \r\nThe Moon and Back and To Infinity and Beyond shirts featuring a unique \r\ndecorative design with hearts, a moon and a twist to our original teal \r\nand white awareness ribbon.&lt;br&gt;&lt;br&gt;This black shirt is a Gildan classic \r\nfit t-shirt available from Small to size 3XL in styles for ladies and \r\nmen. The shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 \r\noz. It has taped neck and shoulders. NOTE: Shirt is printed after \r\nprocessing using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES:  (Please check sizing prior to placing order found in the image thumbnails above)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your shirt anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  Currently, rush shipping is not available, so please plan \r\nahead.&lt;br&gt;&lt;br&gt;Any requests, questions or concerns, please send us a \r\nmessage BEFORE placing order and prior to placing unfavorable reviews.  \r\nOur goal is that you''re happy with your shirt. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Cervical Cancer', '', ''),
(190, 1, 'I Love Someone With Breast Cancer To The Moon and Back and To Infinity and Beyond Shirts', 'Show and wear your support with I Love Someone With Breast Cancer To The\r\n Moon and Back and To Infinity and Beyond shirts featuring a unique \r\ndecorative design with hearts, a moon and a twist to our original  pink \r\nawareness ribbon.&lt;br&gt;&lt;br&gt;This black shirt is a Gildan classic fit \r\nt-shirt available from Small to size 3XL in styles for ladies and men. \r\nThe shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: Shirt is printed after processing\r\n using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES:  (Please check sizing prior to placing order found in the image thumbnails above)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your shirt anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  Currently, rush shipping is not available, so please plan \r\nahead.&lt;br&gt;&lt;br&gt;Any requests, questions or concerns, please send us a \r\nmessage BEFORE placing order and prior to placing unfavorable reviews.  \r\nOur goal is that you''re happy with your shirt. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted. ', '', 'Breast Cancer', '', ''),
(191, 1, 'I Love Someone With Brain Cancer To The Moon and Back and To Infinity and Beyond Shirts', 'Show and wear your support with I Love Someone With Brain Cancer To The \r\nMoon and Back and To Infinity and Beyond shirts featuring a unique \r\ndecorative design with hearts, a moon and a twist to our original grey \r\nawareness ribbon.&lt;br&gt;&lt;br&gt;This black shirt is a Gildan classic fit \r\nt-shirt available from Small to size 3XL in styles for ladies and men. \r\nThe shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: Shirt is printed after processing\r\n using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES:  (Please check sizing prior to placing order found in the image thumbnails above)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your shirt anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  Currently, rush shipping is not available, so please plan \r\nahead.&lt;br&gt;&lt;br&gt;Any requests, questions or concerns, please send us a \r\nmessage BEFORE placing order and prior to placing unfavorable reviews.  \r\nOur goal is that you''re happy with your shirt. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Brain Cancer', '', ''),
(192, 1, 'I Love Someone With Bone Cancer To The Moon and Back and To Infinity and Beyond Shirts', 'Show and wear your support with I Love Someone With Bone Cancer To The \r\nMoon and Back and To Infinity and Beyond shirts featuring a unique \r\ndecorative design with hearts, a moon and a twist to our original white \r\nawareness ribbon.&lt;br&gt;&lt;br&gt;This black shirt is a Gildan classic fit \r\nt-shirt available from Small to size 3XL in styles for ladies and men. \r\nThe shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: Shirt is printed after processing\r\n using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES:  (Please check sizing prior to placing order found in the image thumbnails above)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your shirt anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  Currently, rush shipping is not available, so please plan \r\nahead.&lt;br&gt;&lt;br&gt;Any requests, questions or concerns, please send us a \r\nmessage BEFORE placing order and prior to placing unfavorable reviews.  \r\nOur goal is that you''re happy with your shirt. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Bone Cancer', '', ''),
(193, 1, 'I Love Someone With Blood Cancer To The Moon and Back and To Infinity and Beyond Shirts', 'Show and wear your support with I Love Someone With Blood Cancer To The \r\nMoon and Back and To Infinity and Beyond shirts featuring a unique \r\ndecorative design with hearts, a moon and a twist to our original red \r\nawareness ribbon.&lt;br&gt;&lt;br&gt;This black shirt is a Gildan classic fit \r\nt-shirt available from Small to size 3XL in styles for ladies and men. \r\nThe shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: Shirt is printed after processing\r\n using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES:  (Please check sizing prior to placing order found in the image thumbnails above)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your shirt anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  Currently, rush shipping is not available, so please plan \r\nahead.&lt;br&gt;&lt;br&gt;Any requests, questions or concerns, please send us a \r\nmessage BEFORE placing order and prior to placing unfavorable reviews.  \r\nOur goal is that you''re happy with your shirt. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Blood Cancer', '', ''),
(194, 1, 'I Love Someone With Bile Duct Cancer To The Moon and Back and To Infinity and Beyond Shirts', 'Show and wear your support with I Love Someone With Bile Duct Cancer To \r\nThe Moon and Back and To Infinity and Beyond shirts featuring a unique \r\ndecorative design with hearts, a moon and a twist to our original green \r\nawareness ribbon.&lt;br&gt;&lt;br&gt;This black shirt is a Gildan classic fit \r\nt-shirt available from Small to size 3XL in styles for ladies and men. \r\nThe shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: Shirt is printed after processing\r\n using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES:  (Please check sizing prior to placing order found in the image thumbnails above)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your shirt anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  Currently, rush shipping is not available, so please plan \r\nahead.&lt;br&gt;&lt;br&gt;Any requests, questions or concerns, please send us a \r\nmessage BEFORE placing order and prior to placing unfavorable reviews.  \r\nOur goal is that you''re happy with your shirt. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Bile Duct Cancer', '', ''),
(195, 1, 'I Love Someone With Appendix Cancer To The Moon and Back and To Infinity and Beyond Shirts', 'Show and wear your support with I Love Someone With Appendix Cancer  To \r\nThe Moon and Back and To Infinity and Beyond shirts featuring a unique \r\ndecorative design with hearts, a moon and a twist to our original amber \r\nawareness ribbon.&lt;br&gt;&lt;br&gt;This black shirt is a Gildan classic fit \r\nt-shirt available from Small to size 3XL in styles for ladies and men. \r\nThe shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: Shirt is printed after processing\r\n using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES:  (Please check sizing prior to placing order found in the image thumbnails above)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your shirt anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  Currently, rush shipping is not available, so please plan \r\nahead.&lt;br&gt;&lt;br&gt;Any requests, questions or concerns, please send us a \r\nmessage BEFORE placing order and prior to placing unfavorable reviews.  \r\nOur goal is that you''re happy with your shirt. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Appendix Cancer', '', ''),
(196, 1, 'I Wear a Violet Ribbon Hodgkins Lymphoma Shirt', 'I Wear a Violet Awareness Ribbon Hodgkin''s Lymphoma Shirt featuring our original draped style ribbon.&lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt;\r\n ADD a short name to this &quot;I Wear a Ribbon Design&quot; (e.g. Lisa, Jennifer,\r\n Bob, Michael, etc) by requesting it when placing your order in the \r\n&quot;comment&quot; field&quot;. &lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit t-shirt \r\navailable from Small to size 3XL in styles for ladies and men. The shirt\r\n is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. It has \r\ntaped neck and shoulders. NOTE: Shirt is printed on demand using direct \r\nto garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 3 to 5 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:  Awareness Ribbon is Our © Copyright. All Rights Reserved.            \r\n        ', '', 'Hodgkin''s Lymphoma', '', ''),
(197, 1, 'Personalize I Wear Lime Green Ribbon Shirt', 'Personalize I Wear a Lime Green Ribbon Shirt for Lymphoma, Lyme Disease,\r\n Muscular Dystrophy, Mental Health and CDKL5 Awareness causes. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt;\r\n NOTE: ADD a short name to this &quot;I Wear a Ribbon Design&quot; (e.g. Lisa, \r\nJennifer, Bob, Michael, etc) by requesting it when placing your order in\r\n the &quot;comment&quot; field&quot;. &lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit \r\nt-shirt available from Small to size 3XL in styles for ladies and men. \r\nThe shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: Shirt is printed on demand using \r\ndirect to garment printers (see about us for more info). &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt;SIZES:  (Please check sizing chart located in the thumbnails above prior to placing order)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:  Awareness Ribbon is Our © Copyright. All Rights Reserved.            \r\n        ', '', 'Lymphoma', '', ''),
(201, 1, 'Melanoma Strongest Among Us T-Shirt', 'Melanoma Awareness T-Shirt With Powerful Quote:  The Strongest Among Us \r\nAre The Ones Who Smile Through The Silent Pain, Cry Behind The Closed \r\nDoors and Fight Battles Nobody Knows About.  Design features an \r\nawareness ribbon with eye-catching text.&lt;br&gt;&lt;br&gt;This shirt is a Gildan \r\nclassic fit t-shirt available from Small to size 3XL in styles for \r\nladies and men. The shirt is made from preshrunk 100% Cotton Jersey and \r\nweighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is printed \r\non demand using direct to garment printers. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing below prior to placing order)&lt;br&gt;Size Small 18&quot; Width, 25 Height and 13.75 Sleeve Center Back&lt;br&gt;Size Medium 20&quot; Width, 26 Height and 14.5 Sleeve Center Back&lt;br&gt;Size Large 22 Width, 27 Height and 15.5 Sleeve Center Back&lt;br&gt;Size XL 24&quot; Width, 28 Height and 16.5 Sleeve Center Back&lt;br&gt;Size 2XL 26&quot; Width, 29 Height and 17.5 Sleeve Center Back&lt;br&gt;Size 3XL 28&quot; Width, 30 Height and 18.5 Sleeve Center Back&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprint your order anywhere between 3 to 5 Business Days following payment\r\n clearance. We ship by USPS First Class Mail with delivery confirmation.\r\n Business days excludes weekends and certain holidays. &lt;br&gt;&lt;br&gt;Any \r\nquestions or concerns, please send us a message before placing order and\r\n prior to placing unfavorable reviews. Our goal is that you will be \r\nhappy with your shirt. Thank you for your consideration.            \r\n        ', '', 'Melanoma', '', ''),
(198, 1, 'Appendix Cancer Awareness Heart Ribbon Shirts', 'Appendix Cancer Awareness Heart Ribbon Shirts featuring an \r\ninspirational, original design with words like Faith, Peace, Courage, \r\nLove, Hope, Determination, Strength, Believe and Never Give Up in the \r\nshape of a heart with an amber ribbon.&lt;br&gt;&lt;br&gt;This shirt is a Gildan \r\nclassic fit t-shirt available from Small to size 3XL in styles for \r\nladies and men. The shirt is made from preshrunk 100% Cotton Jersey and \r\nweighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is printed \r\nafter processing using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES:  (Please check sizing prior to placing order found in the image thumbnails above)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  Currently rush shipping is not available.&lt;br&gt;&lt;br&gt;Any \r\nrequests, questions or concerns, please send us a message BEFORE placing\r\n order and prior to placing unfavorable reviews.  Our goal is that \r\nyou''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;© Awareness Heart Design is Copyrighted.            \r\n        ', '', 'Apendix Cancer', '', ''),
(200, 1, 'Prostate Cancer I''m Not a Super Hero But I Beat Cancer So Close Enough Shirts', 'Prostate Cancer Shirt with slogan &quot;I''m Not a Super Hero But I Beat \r\nCancer So Close Enough&quot; featuring two light blue ribbons to support the \r\ncause while advocating for support.  Get the shirt with this humorous \r\nbut powerful message. Perfect gift for the defiant cancer survivor. \r\nIdeal for awareness walks, cancer events, etc.&lt;br&gt;&lt;br&gt;This shirt is a \r\nGildan classic fit t-shirt available from Small to size 3XL in styles \r\nfor men. The shirt is made from preshrunk 100% Cotton Jersey and weighs \r\n6.0 oz. It has taped neck and shoulders. NOTE: Shirts are printed using \r\nthe direct to garment printing method.&lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES/Printing:  \r\nPlease check sizing chart *before* to placing order. It is found in the \r\nimage thumbnails above. You can also read about the printing process \r\nfound in the image thumbnails&lt;br&gt;&lt;br&gt;Processing/Shipping: After the 24 \r\nhour cancellation period has expired, we will process and prepare your \r\norder for shipment anywhere between 5 to 7 Business Days following \r\npayment clearance. We ship by USPS First Class Mail with delivery \r\nconfirmation. Two or more shirts get shipped by U.S. Priority mail.  \r\nBusiness days excludes weekends and certain holidays.   &lt;br&gt;&lt;br&gt;Any \r\nquestions or concerns, please send us a message BEFORE placing order and\r\n prior to placing unfavorable reviews.  Our goal is that you will be \r\nhappy with your shirt. Thank you for your consideration. ', '', 'Prostate Cancer', '', ''),
(202, 1, 'Melanoma and Skin Cancer Awareness Heart Ribbon Shirts', 'Melanoma and Skin Cancer shirts featuring an eye-catching heart ribbon \r\nwith a starburst. Ideal for awareness events, support groups or anytime \r\nto support your cause.&lt;br&gt;&lt;br&gt;This is a Gildan classic fit t-shirt \r\navailable from Small to size 3XL in styles for ladies and men. The shirt\r\n is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. It has \r\ntaped neck and shoulders. NOTE: Shirt is printed using direct to garment\r\n printers. &lt;br&gt;&lt;br&gt;✔️✔️SIZES/Printing:  Please DOUBLE check sizing chart\r\n located in the image thumbnails prior to placing order as we do not \r\noffer refunds or exchanges for choosing the wrong size.  T-shirts are \r\nmade to order so study the chart and/or SIZE up as t-shirts may run a \r\nlittle small for some individuals.  You can also read about how we print\r\n the shirts in the image thumbnails. All information is also in the \r\npolicies section, so please read before you buy.&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprepare your order for shipment anywhere between 3 to 7 Business Days \r\nfollowing payment clearance. We ship by USPS First Class Mail with \r\ndelivery confirmation. 2+ shirts get shipped by U.S. Priority Mail.  \r\nBusiness days excludes weekends and certain holidays.  - More info in \r\nthe policies section.&lt;br&gt;&lt;br&gt;Any requests, questions or concerns, please\r\n send us a message BEFORE placing order and prior to placing unfavorable\r\n reviews.  Our goal is that you''re happy with your shirt. Thank you for \r\nyour consideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted            \r\n        ', '', 'Melanoma', '', ''),
(203, 1, 'Colon Cancer Heart Ribbon Shirts (Arthritis, Dysautonomia, Rectal Cancer, Huntington''s Disease)', 'Colon Cancer Shirts featuring an eye-catching heart ribbon with a \r\nstarburst.  This unique blue ribbon design signifies advocacy for \r\nAnkylosing Spondylitis, ARDS (Acute respiratory distress syndrome), \r\nArthritis, Chronic Fatigue Syndrome, Dysautonomia, Erb''s Palsy, Guillain\r\n Barre Syndrome, Histiocytosis, Huntington''s Disease, Myositis,  Rectal \r\nCancer, Reye''s Syndrome, Sjogren''s Syndrome, etc.  Ideal for awareness \r\nevents, support groups or any occasion.&lt;br&gt;&lt;br&gt;This is a Gildan classic \r\nfit t-shirt available from Small to size 3XL in styles for ladies and \r\nmen. The shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 \r\noz. It has taped neck and shoulders. NOTE: Shirt is printed using direct\r\n to garment printers. &lt;br&gt;&lt;br&gt;✔️✔️SIZES/Printing:  Please DOUBLE check \r\nsizing chart located in the image thumbnails prior to placing order as \r\nwe do not offer refunds or exchanges for choosing the wrong size.  \r\nT-shirts are made to order so study the chart and/or SIZE up as t-shirts\r\n may run a little small for some individuals.  You can also read about \r\nhow we print the shirts in the image thumbnails. All information is also\r\n in the policies section, so please read before you buy.&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprepare your order for shipment anywhere between 3 to 7 Business Days \r\nfollowing payment clearance. We ship by USPS First Class Mail with \r\ndelivery confirmation. 2+ shirts get shipped by U.S. Priority Mail.  \r\nBusiness days excludes weekends and certain holidays.  - More info in \r\nthe policies section.&lt;br&gt;&lt;br&gt;Any requests, questions or concerns, please\r\n send us a message BEFORE placing order and prior to placing unfavorable\r\n reviews.  Our goal is that you''re happy with your shirt. Thank you for \r\nyour consideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Colon Cancer', '', ''),
(204, 1, 'Heart Ribbon Shirts Blood Cancer, Heart Disease, AIDS, Vasculitis and Stroke Awareness', 'Blood Cancer shirts featuring an eye-catching heart ribbon with a \r\nstarburst.  This unique red ribbon design also  signifies advocacy for \r\nother causes such as AIDS, Cardiovascular Disease, Epidermolysis \r\nBullosa, Heart Disease, Hemophilia, High Blood Pressure , HIV, \r\nMyeloproliferative Neoplasms, Pulmonary Embolism, Stroke Disease and \r\nVasculitis.  Ideal for awareness events, support groups or any occasion.\r\n &lt;br&gt;&lt;br&gt;This is a Gildan classic fit t-shirt available from Small to \r\nsize 3XL in styles for ladies and men. The shirt is made from preshrunk \r\n100% Cotton Jersey and weighs 6.0 oz. It has taped neck and shoulders. \r\nNOTE: Shirt is printed using direct to garment printers. &lt;br&gt;&lt;br&gt;✔️✔️SIZES/Printing:\r\n  Please DOUBLE check sizing chart located in the image thumbnails prior\r\n to placing order as we do not offer refunds or exchanges for choosing \r\nthe wrong size.  T-shirts are made to order so study the chart and/or \r\nSIZE up as t-shirts may run a little small for some individuals.  You \r\ncan also read about how we print the shirts in the image thumbnails. All\r\n information is also in the policies section, so please read before you \r\nbuy.&lt;br&gt;&lt;br&gt;Processing/Shipping: After the 24 hour cancellation period \r\nhas expired, we will process and prepare your order for shipment \r\nanywhere between 3 to 7 Business Days following payment clearance. We \r\nship by USPS First Class Mail with delivery confirmation. 2+ shirts get \r\nshipped by U.S. Priority Mail.  Business days excludes weekends and \r\ncertain holidays.  - More info in the policies section.&lt;br&gt;&lt;br&gt;Any \r\nrequests, questions or concerns, please send us a message BEFORE placing\r\n order and prior to placing unfavorable reviews.  Our goal is that \r\nyou''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Blood Cancer', '', ''),
(205, 1, 'Lung Cancer Heart Ribbon Shirts (Emphysema, Lung Disease, Mesothelioma, Retinoblastoma, SCID and Scoliosis)', 'Lung Cancer shirts featuring an eye-catching heart ribbon with a \r\nstarburst.  This unique white ribbon design also  signifies advocacy for\r\n other causes such as Bone Cancer, Bone Disease, Emphysema, Lung \r\nDisease, Mesothelioma, Osteoporosis, Postpartum Depression, \r\nRetinoblastoma, SCID (Severe combined immunodeficiency) and Scoliosis.  \r\nIdeal for awareness events, support groups or any occasion. &lt;br&gt;&lt;br&gt;This\r\n is a Gildan classic fit t-shirt available from Small to size 3XL in \r\nstyles for ladies and men. The shirt is made from preshrunk 100% Cotton \r\nJersey and weighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt \r\nis printed using direct to garment printers. &lt;br&gt;&lt;br&gt;✔️✔️SIZES/Printing:\r\n  Please DOUBLE check sizing chart located in the image thumbnails prior\r\n to placing order as we do not offer refunds or exchanges for choosing \r\nthe wrong size.  T-shirts are made to order so study the chart and/or \r\nSIZE up as t-shirts may run a little small for some individuals.  You \r\ncan also read about how we print the shirts in the image thumbnails. All\r\n information is also in the policies section, so please read before you \r\nbuy.&lt;br&gt;&lt;br&gt;Processing/Shipping: After the 24 hour cancellation period \r\nhas expired, we will process and prepare your order for shipment \r\nanywhere between 3 to 7 Business Days following payment clearance. We \r\nship by USPS First Class Mail with delivery confirmation. 2+ shirts get \r\nshipped by U.S. Priority Mail.  Business days excludes weekends and \r\ncertain holidays.  - More info in the policies section.&lt;br&gt;&lt;br&gt;Any \r\nrequests, questions or concerns, please send us a message BEFORE placing\r\n order and prior to placing unfavorable reviews.  Our goal is that \r\nyou''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted            \r\n        ', '', 'Lung Cancer', '', ''),
(206, 1, 'Brain Cancer Heart Ribbon Shirts (Brain Tumor, Diabetes, Parkinson''s Disease)', 'Brain Cancer shirts featuring an eye-catching heart ribbon. This unique \r\ngrey ribbon signifies  advocacy for causes such as Asthma, Brain \r\nDisorders, Brain Tumor, Diabetes, Neurological Disorders and Parkinson''s\r\n Disease. Ideal for awareness events, support groups or any occasion.  &lt;br&gt;&lt;br&gt;This\r\n is a Gildan classic fit t-shirt available from Small to size 3XL in \r\nstyles for ladies and men. The shirt is made from preshrunk 100% Cotton \r\nJersey and weighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt \r\nis printed using direct to garment printers. &lt;br&gt;&lt;br&gt;✔️✔️SIZES/Printing:\r\n  Please DOUBLE check sizing chart located in the image thumbnails prior\r\n to placing order as we do not offer refunds or exchanges for choosing \r\nthe wrong size.  T-shirts are made to order so study the chart and/or \r\nSIZE up as t-shirts may run a little small for some individuals.  You \r\ncan also read about how we print the shirts in the image thumbnails. All\r\n information is also in the policies section, so please read before you \r\nbuy.&lt;br&gt;&lt;br&gt;Processing/Shipping: After the 24 hour cancellation period \r\nhas expired, we will process and prepare your order for shipment \r\nanywhere between 3 to 7 Business Days following payment clearance. We \r\nship by USPS First Class Mail with delivery confirmation. 2+ shirts get \r\nshipped by U.S. Priority Mail.  Business days excludes weekends and \r\ncertain holidays.  - More info in the policies section.&lt;br&gt;&lt;br&gt;Any \r\nrequests, questions or concerns, please send us a message BEFORE placing\r\n order and prior to placing unfavorable reviews.  Our goal is that \r\nyou''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted            \r\n        ', '', 'Brain Cancer', '', ''),
(207, 1, 'Brain Cancer Picked The Wrong Chick Shirt', 'Wear it with a fighter attitude with our line of Brain Cancer Picked The\r\n Wrong Chick shirts featuring our originally illustrated (copyrighted) \r\nchick wearing a head scarf and a gray awareness ribbon to support her \r\ncause and raise awareness.  Makes a perfect gift for the warrior in your\r\n life.&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit ladies t-shirt \r\n(feminine inspired pattern) available from size small to size 3XL.  The \r\nshirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. It \r\nhas taped neck and shoulders.  NOTE: Shirts are printed using the direct\r\n to garment printing method.&lt;br&gt;&lt;br&gt;✔️✔️SIZES/Printing:  Please DOUBLE \r\ncheck sizing chart located in the image thumbnails prior to placing \r\norder as we do not offer refunds or exchanges for choosing the wrong \r\nsize.  T-shirts are made to order so study the chart and/or SIZE up as \r\nt-shirts may run a little small for some individuals.  You can also read\r\n about how we print the shirts in the image thumbnails. All information \r\nis also in the policies section, so please read before you buy.&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprepare your order for shipment anywhere between 5 to 7 Business Days \r\nfollowing payment clearance. We ship by USPS First Class Mail with \r\ndelivery confirmation. Two or more shirts get shipped by U.S. Priority \r\nmail.  Business days excludes weekends and certain holidays. &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message before placing order \r\nand prior to placing unfavorable reviews. Our goal is that you will be \r\nhappy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:  © Chick Illustration is Our Copyright.  All Rights Reserved.', '', 'Brain Cancer', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(208, 1, 'Carcinoid Cancer For My Hero Shirts (Ehlers-Danlos Syndrome and Neuroendocrine Cancer )', 'For My Hero Carcinoid Cancer Shirts featuring a zebra awareness ribbon \r\nwith floral accents and a butterfly.  This unique zebra ribbon design \r\nalso  signifies advocacy for other causes such as Ehlers-Danlos Syndrome\r\n and Neuroendocrine Cancer.&amp;nbsp; Ideal for awareness events, support groups \r\nor anytime to support your hero while raising awareness.&lt;br&gt;&lt;br&gt;This is a\r\n Gildan classic fit t-shirt available from Small to size 3XL in styles \r\nfor ladies and men. The shirt is made from preshrunk 100% Cotton Jersey \r\nand weighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is \r\nprinted using direct to garment printers. &lt;br&gt;&lt;br&gt;✔️✔️SIZES/Printing:  \r\nPlease DOUBLE check sizing chart located in the image thumbnails prior \r\nto placing order as we do not offer refunds or exchanges for choosing \r\nthe wrong size.  T-shirts are made to order so study the chart and/or \r\nSIZE up as t-shirts may run a little small for some individuals.  You \r\ncan also read about how we print the shirts in the image thumbnails. All\r\n information is also in the policies section, so please read before you \r\nbuy.&lt;br&gt;&lt;br&gt;Processing/Shipping: After the 24 hour cancellation period \r\nhas expired, we will process and prepare your order for shipment \r\nanywhere between 3 to 7 Business Days following payment clearance. We \r\nship by USPS First Class Mail with delivery confirmation. 2+ shirts get \r\nshipped by U.S. Priority Mail.  Business days excludes weekends and \r\ncertain holidays.   &lt;br&gt;&lt;br&gt;Any requests, questions or concerns, please \r\nsend us a message BEFORE placing order and prior to placing unfavorable \r\nreviews.  Our goal is that you''re happy with your shirt. Thank you for \r\nyour consideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Carcinoid Cancer', '', ''),
(209, 1, 'Brain Cancer For My Hero Shirts (Brain Tumor, Diabetes, Parkinson''s Disease)', 'For My Hero Brain Cancer shirts featuring our original grey awareness \r\nribbon with floral accents and a butterfly.    This unique grey ribbon \r\nsignifies  advocacy for causes such as Asthma, Brain Disorders, Brain \r\nTumor, Diabetes, Neurological Disorders and Parkinson''s Disease. Ideal \r\nfor awareness events, support groups or anytime to support your hero and\r\n raise awareness.&lt;br&gt;&lt;br&gt;This is a Gildan classic fit t-shirt available \r\nfrom Small to size 3XL in styles for ladies and men. The shirt is made \r\nfrom preshrunk 100% Cotton Jersey and weighs 6.0 oz. It has taped neck \r\nand shoulders. NOTE: Shirt is printed using direct to garment printers. &lt;br&gt;&lt;br&gt;✔️✔️SIZES/Printing:\r\n  Please DOUBLE check sizing chart located in the image thumbnails prior\r\n to placing order as we do not offer refunds or exchanges for choosing \r\nthe wrong size.  T-shirts are made to order so study the chart and/or \r\nSIZE up as t-shirts may run a little small for some individuals.  You \r\ncan also read about how we print the shirts in the image thumbnails. All\r\n information is also in the policies section, so please read before you \r\nbuy.&lt;br&gt;&lt;br&gt;Processing/Shipping: After the 24 hour cancellation period \r\nhas expired, we will process and prepare your order for shipment \r\nanywhere between 3 to 7 Business Days following payment clearance. We \r\nship by USPS First Class Mail with delivery confirmation. 2+ shirts get \r\nshipped by U.S. Priority Mail.  Business days excludes weekends and \r\ncertain holidays.   &lt;br&gt;&lt;br&gt;Any requests, questions or concerns, please \r\nsend us a message BEFORE placing order and prior to placing unfavorable \r\nreviews.  Our goal is that you''re happy with your shirt. Thank you for \r\nyour consideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Brain Cancer', '', ''),
(210, 1, 'Lung Cancer For My Hero Shirts (Emphysema, Lung Disease, Mesothelioma, Retinoblastoma, SCID and Scoliosis)', 'For My Hero Lung Cancer shirts featuring our original awareness ribbon \r\nwith floral accents and a butterfly.  This unique white ribbon design \r\nalso  signifies advocacy for other causes such as Bone Cancer, Bone \r\nDisease, Emphysema, Lung Disease, Mesothelioma, Osteoporosis, Postpartum\r\n Depression, Retinoblastoma, SCID (Severe combined immunodeficiency) and\r\n Scoliosis.  Ideal for awareness events, support groups or anytime \r\nsupport your  hero.&lt;br&gt;&lt;br&gt;This is a Gildan classic fit t-shirt \r\navailable from Small to size 3XL in styles for ladies and men. The shirt\r\n is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. It has \r\ntaped neck and shoulders. NOTE: Shirt is printed using direct to garment\r\n printers. &lt;br&gt;&lt;br&gt;✔️✔️SIZES/Printing:  Please DOUBLE check sizing chart\r\n located in the image thumbnails prior to placing order as we do not \r\noffer refunds or exchanges for choosing the wrong size.  T-shirts are \r\nmade to order so study the chart and/or SIZE up as t-shirts may run a \r\nlittle small for some individuals.  You can also read about how we print\r\n the shirts in the image thumbnails. All information is also in the \r\npolicies section, so please read before you buy.&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprepare your order for shipment anywhere between 3 to 7 Business Days \r\nfollowing payment clearance. We ship by USPS First Class Mail with \r\ndelivery confirmation. 2+ shirts get shipped by U.S. Priority Mail.  \r\nBusiness days excludes weekends and certain holidays.   &lt;br&gt;&lt;br&gt;Any \r\nrequests, questions or concerns, please send us a message BEFORE placing\r\n order and prior to placing unfavorable reviews.  Our goal is that \r\nyou''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Lung Cancer', '', ''),
(211, 1, 'I''ll Never Give Up I''m Fighting To Win Shirts for Blood Cancer, Heart Disease, AIDS, Vasculitis and Stroke Awareness', 'For My Hero Blood Cancer shirts featuring our original awareness ribbon \r\nwith floral accents and a butterfly.  This unique red ribbon design also\r\n  signifies advocacy for other causes such as AIDS, Cardiovascular \r\nDisease, Epidermolysis Bullosa, Heart Disease, Hemophilia, High Blood \r\nPressure , HIV, Myeloproliferative Neoplasms, Pulmonary Embolism, Stroke\r\n Disease and Vasculitis.  Ideal for awareness events, support groups or \r\nanytime to take a stand for your cause.  &lt;br&gt;&lt;br&gt;This is a Gildan \r\nclassic fit t-shirt available from Small to size 3XL in styles for \r\nladies and men. The shirt is made from preshrunk 100% Cotton Jersey and \r\nweighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is printed \r\nusing direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES/Printing:  \r\nPlease check sizing chart prior to placing order. It is found in the \r\nimage thumbnails above. You can also read about the printing process \r\nfound in the image thumbnails&lt;br&gt;&lt;br&gt;Processing/Shipping: After the 24 \r\nhour cancellation period has expired, we will process and prepare your \r\norder for shipment anywhere between 3 to 7 Business Days following \r\npayment clearance. We ship by USPS First Class Mail with delivery \r\nconfirmation. 2+ shirts get shipped by U.S. Priority Mail.  Business \r\ndays excludes weekends and certain holidays.   &lt;br&gt;&lt;br&gt;Any requests, \r\nquestions or concerns, please send us a message BEFORE placing order and\r\n prior to placing unfavorable reviews.  Our goal is that you''re happy \r\nwith your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Blood Cancer', '', ''),
(212, 1, 'Colon Cancer For My Hero Shirts (Arthritis, Dysautonomia, Rectal Cancer, Huntington''s Disease)', 'For My Hero Colon Cancer Shirts featuring a blue awareness ribbon with \r\nfloral accents and a butterfly.  This unique blue ribbon design also  \r\nsignifies advocacy for other causes such as Ankylosing Spondylitis, ARDS\r\n (Acute respiratory distress syndrome), Arthritis, Chronic Fatigue \r\nSyndrome, Dysautonomia, Erb''s Palsy, Guillain Barre Syndrome, \r\nHistiocytosis, Huntington''s Disease, Myositis,  Rectal Cancer, Reye''s \r\nSyndrome, Sjogren''s Syndrome, etc.  Ideal for awareness events, support \r\ngroups or anytime to take a stand for your cause.  &lt;br&gt;&lt;br&gt;This is a \r\nGildan classic fit t-shirt available from Small to size 3XL in styles \r\nfor ladies and men. The shirt is made from preshrunk 100% Cotton Jersey \r\nand weighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is \r\nprinted using direct to garment printers. &lt;br&gt;&lt;br&gt;✔️✔️SIZES/Printing:  \r\nPlease DOUBLE check sizing chart located in the image thumbnails prior \r\nto placing order as we do not offer refunds or exchanges for choosing \r\nthe wrong size.  T-shirts are made to order so study the chart and/or \r\nSIZE up as t-shirts may run a little small for some individuals.  You \r\ncan also read about how we print the shirts in the image thumbnails. All\r\n information is also in the policies section, so please read before you \r\nbuy.&lt;br&gt;&lt;br&gt;Processing/Shipping: After the 24 hour cancellation period \r\nhas expired, we will process and prepare your order for shipment \r\nanywhere between 3 to 7 Business Days following payment clearance. We \r\nship by USPS First Class Mail with delivery confirmation. 2+ shirts get \r\nshipped by U.S. Priority Mail.  Business days excludes weekends and \r\ncertain holidays.   &lt;br&gt;&lt;br&gt;Any requests, questions or concerns, please \r\nsend us a message BEFORE placing order and prior to placing unfavorable \r\nreviews.  Our goal is that you''re happy with your shirt. Thank you for \r\nyour consideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Colon Cancer', '', ''),
(213, 1, 'Ovarian Cancer For My Hero Shirts (Batten Disease, Myasthenia Gravis, PCOS, Peritoneal Cancer)', 'For My Hero Ovarian Cancer shirts featuring a teal ribbon with floral \r\naccents.  This unique teal ribbon design signifies awareness for causes \r\nsuch as Batten Disease, Gynecologic Cancer, Interstitial Cystitis, \r\nMyasthenia Gravis,  Ovarian Cancer,   PCOS (Polycystic ovary syndrome), \r\nPeritoneal Cancer, Polycystic Kidney Disease (PKD), PTSD (Posttraumatic \r\nStress Disorder), Scleroderma, etc.  Ideal for awareness events, support\r\n groups or anytime to take a stand for your cause.  &lt;br&gt;&lt;br&gt;This is a \r\nGildan classic fit t-shirt available from Small to size 3XL in styles \r\nfor ladies and men. The shirt is made from preshrunk 100% Cotton Jersey \r\nand weighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is \r\nprinted using direct to garment printers. &lt;br&gt;&lt;br&gt;✔️✔️SIZES/Printing:  \r\nPlease DOUBLE check sizing chart located in the image thumbnails prior \r\nto placing order as we do not offer refunds or exchanges for choosing \r\nthe wrong size.  T-shirts are made to order so study the chart and/or \r\nSIZE up as t-shirts may run a little small for some individuals.  You \r\ncan also read about how we print the shirts in the image thumbnails. All\r\n information is also in the policies section, so please read before you \r\nbuy.&lt;br&gt;&lt;br&gt;Processing/Shipping: After the 24 hour cancellation period \r\nhas expired, we will process and prepare your order for shipment \r\nanywhere between 3 to 7 Business Days following payment clearance. We \r\nship by USPS First Class Mail with delivery confirmation. 2+ shirts get \r\nshipped by U.S. Priority Mail.  Business days excludes weekends and \r\ncertain holidays.   &lt;br&gt;&lt;br&gt;Any requests, questions or concerns, please \r\nsend us a message BEFORE placing order and prior to placing unfavorable \r\nreviews.  Our goal is that you''re happy with your shirt. Thank you for \r\nyour consideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.', '', 'Ovarian Cancer', '', ''),
(214, 1, 'Ovarian Cancer I''ll Never Give Up I''m Fighting To Win Shirts (Batten Disease, Myasthenia Gravis, PCOS, Peritoneal Cancer)', 'Stand defiant against Ovarian Cancer and other teal ribbon causes with  \r\n&quot;I''ll Never Give Up I''m Fighting To Win&quot; shirts featuring our original \r\nbraided style awareness ribbon.  This unique teal ribbon design \r\nsignifies advocacy for causes such as Batten Disease, Gynecologic \r\nCancer, Interstitial Cystitis, Myasthenia Gravis,  Ovarian Cancer,   \r\nPCOS (Polycystic ovary syndrome), Peritoneal Cancer, Polycystic Kidney \r\nDisease (PKD), PTSD (Posttraumatic Stress Disorder), Scleroderma, etc.  \r\nIdeal for awareness events, support groups or anytime to take a stand \r\nfor your cause.  &lt;br&gt;&lt;br&gt;This is a Gildan classic fit t-shirt available \r\nfrom Small to size 3XL in styles for ladies and men. The shirt is made \r\nfrom preshrunk 100% Cotton Jersey and weighs 6.0 oz. It has taped neck \r\nand shoulders. NOTE: Shirt is printed using direct to garment printers. &lt;br&gt;&lt;br&gt;✔️✔️SIZES/Printing:\r\n  Please DOUBLE check sizing chart located in the image thumbnails prior\r\n to placing order as we do not offer refunds or exchanges for choosing \r\nthe wrong size.  T-shirts are made to order so study the chart and/or \r\nSIZE up as t-shirts may run a little small for some individuals.  You \r\ncan also read about how we print the shirts in the image thumbnails. All\r\n information is also in the policies section, so please read before you \r\nbuy.&lt;br&gt;&lt;br&gt;Processing/Shipping: After the 24 hour cancellation period \r\nhas expired, we will process and prepare your order for shipment \r\nanywhere between 3 to 7 Business Days following payment clearance. We \r\nship by USPS First Class Mail with delivery confirmation. 2+ shirts get \r\nshipped by U.S. Priority Mail.  Business days excludes weekends and \r\ncertain holidays.   &lt;br&gt;&lt;br&gt;Any requests, questions or concerns, please \r\nsend us a message BEFORE placing order and prior to placing unfavorable \r\nreviews.  Our goal is that you''re happy with your shirt. Thank you for \r\nyour consideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Ovarian Cancer', '', ''),
(215, 1, 'Colon Cancer I''ll Never Give Up I''m Fighting To Win Shirts (Arthritis, Dysautonomia, Rectal Cancer, Huntington''s Disease)', 'Stand defiant against Colon Cancer and other blue ribbon causes with  \r\n&quot;I''ll Never Give Up I''m Fighting To Win&quot; shirts featuring our original \r\nbraided style awareness ribbon.  This unique blue ribbon design also  \r\nsignifies advocacy for other causes such as Ankylosing Spondylitis, ARDS\r\n (Acute respiratory distress syndrome), Arthritis, Chronic Fatigue \r\nSyndrome, Dysautonomia, Erb''s Palsy, Guillain Barre Syndrome, \r\nHistiocytosis, Huntington''s Disease, Myositis,  Rectal Cancer, Reye''s \r\nSyndrome, Sjogren''s Syndrome, etc.  Ideal for awareness events, support \r\ngroups or anytime to take a stand for your cause.  &lt;br&gt;&lt;br&gt;This is a \r\nGildan classic fit t-shirt available from Small to size 3XL in styles \r\nfor ladies and men. The shirt is made from preshrunk 100% Cotton Jersey \r\nand weighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is \r\nprinted using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; \r\nSIZES/Printing:  Please check sizing chart prior to placing order. It is\r\n found in the image thumbnails above. You can also read about the \r\nprinting process found in the image thumbnails&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprepare your order for shipment anywhere between 5 to 7 Business Days \r\nfollowing payment clearance. We ship by USPS First Class Mail with \r\ndelivery confirmation. 2+ shirts get shipped by U.S. Priority Mail.  \r\nBusiness days excludes weekends and certain holidays.   &lt;br&gt;&lt;br&gt;Any \r\nrequests, questions or concerns, please send us a message BEFORE placing\r\n order and prior to placing unfavorable reviews.  Our goal is that \r\nyou''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Colon Cancer', '', ''),
(216, 1, 'Lung Cancer I''ll Never Give Up I''m Fighting To Win Shirts', 'Stand defiant against Lung Cancer and other pearl white ribbon causes \r\nwith  &quot;I''ll Never Give Up I''m Fighting To Win&quot; shirts featuring our \r\noriginal braided style awareness ribbon.  This unique white ribbon \r\ndesign also  signifies advocacy for other causes such as Bone Cancer, \r\nBone Disease, Emphysema, Lung Disease, Mesothelioma, Osteoporosis, \r\nPostpartum Depression, Retinoblastoma, SCID (Severe combined \r\nimmunodeficiency) and Scoliosis.  Ideal for awareness events, support \r\ngroups or anytime to take a stand for your cause.  &lt;br&gt;&lt;br&gt;This is a \r\nGildan classic fit t-shirt available from Small to size 3XL in styles \r\nfor ladies and men. The shirt is made from preshrunk 100% Cotton Jersey \r\nand weighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is \r\nprinted using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; \r\nSIZES/Printing:  Please check sizing chart prior to placing order. It is\r\n found in the image thumbnails above. You can also read about the \r\nprinting process found in the image thumbnails&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprepare your order for shipment anywhere between 5 to 7 Business Days \r\nfollowing payment clearance. We ship by USPS First Class Mail with \r\ndelivery confirmation. 2+ shirts get shipped by U.S. Priority Mail.  \r\nBusiness days excludes weekends and certain holidays.   &lt;br&gt;&lt;br&gt;Any \r\nrequests, questions or concerns, please send us a message BEFORE placing\r\n order and prior to placing unfavorable reviews.  Our goal is that \r\nyou''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Lung Cancer', '', ''),
(217, 1, 'I''ll Never Give Up I''m Fighting To Win Shirts for Blood Cancer, Heart Disease, AIDS, Vasculitis and Stroke Awareness', 'Stand defiant against Blood Cancer and other red ribbon causes with  \r\n&quot;I''ll Never Give Up I''m Fighting To Win&quot; shirts featuring our original \r\nbraided style awareness ribbon.  Ideal for awareness events, support \r\ngroups or anytime to take a stand for your cause.  This unique red \r\nribbon design also  signifies advocacy for other causes such as AIDS, \r\nCardiovascular Disease, Epidermolysis Bullosa, Heart Disease, \r\nHemophilia, High Blood Pressure , HIV, Myeloproliferative Neoplasms, \r\nPulmonary Embolism, Stroke Disease and Vasculitis.&lt;br&gt;&lt;br&gt;This is a \r\nGildan classic fit t-shirt available from Small to size 3XL in styles \r\nfor ladies and men. The shirt is made from preshrunk 100% Cotton Jersey \r\nand weighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is \r\nprinted using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; \r\nSIZES/Printing:  Please check sizing chart prior to placing order. It is\r\n found in the image thumbnails above. You can also read about the \r\nprinting process found in the image thumbnails&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprepare your order for shipment anywhere between 5 to 7 Business Days \r\nfollowing payment clearance. We ship by USPS First Class Mail with \r\ndelivery confirmation. 2+ shirts get shipped by U.S. Priority Mail.  \r\nBusiness days excludes weekends and certain holidays.   &lt;br&gt;&lt;br&gt;Any \r\nrequests, questions or concerns, please send us a message BEFORE placing\r\n order and prior to placing unfavorable reviews.  Our goal is that \r\nyou''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Blood Cancer', '', ''),
(218, 1, 'Brain Cancer Shirts I''ll Never Give Up I''m Fighting To Win (Grey Ribbon Brain Tumor, Diabetes, Parkinson''s Disease)', 'Stand defiant against Brain Cancer and other causes with  &quot;I''ll Never \r\nGive Up I''m Fighting To Win&quot; shirts featuring our original braided style\r\n awareness ribbon.  Ideal for awareness events, support groups or \r\nanytime to take a stand for your cause.  This unique grey ribbon design \r\nalso  signifies  advocacy for other causes such as Asthma, Brain \r\nDisorders, Brain Tumor, Diabetes, Neurological Disorders and Parkinson''s\r\n Disease&lt;br&gt;&lt;br&gt;This is a Gildan classic fit t-shirt available from \r\nSmall to size 3XL in styles for ladies and men. The shirt is made from \r\npreshrunk 100% Cotton Jersey and weighs 6.0 oz. It has taped neck and \r\nshoulders. NOTE: Shirt is printed using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt;\r\n SIZES/Printing:  Please check sizing chart prior to placing order. It \r\nis found in the image thumbnails above. You can also read about the \r\nprinting process found in the image thumbnails&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprepare your order for shipment anywhere between 5 to 7 Business Days \r\nfollowing payment clearance. We ship by USPS First Class Mail with \r\ndelivery confirmation. 2+ shirts get shipped by U.S. Priority Mail.  \r\nBusiness days excludes weekends and certain holidays.   &lt;br&gt;&lt;br&gt;Any \r\nrequests, questions or concerns, please send us a message BEFORE placing\r\n order and prior to placing unfavorable reviews.  Our goal is that \r\nyou''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Brain Cancer', '', ''),
(219, 1, 'Melanoma and Skin Cancer Shirts I''ll Never Give Up I''m Fighting To Win', 'Stand defiant against Melanoma and Skin Cancer with  &quot;I''ll Never Give Up\r\n I''m Fighting To Win&quot; shirts featuring our original braided style \r\nawareness ribbon.  Ideal for awareness events, support groups or anytime\r\n to take a stand for your cause.&lt;br&gt;&lt;br&gt; This is a Gildan classic fit \r\nt-shirt available from Small to size 3XL in styles for ladies and men. \r\nThe shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: Shirt is printed using direct to \r\ngarment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES/Printing:  Please check sizing \r\nchart prior to placing order. It is found in the image thumbnails above.\r\n You can also read about the printing process found in the image \r\nthumbnails&lt;br&gt;&lt;br&gt;Processing/Shipping: After the 24 hour cancellation \r\nperiod has expired, we will process and prepare your order for shipment \r\nanywhere between 5 to 7 Business Days following payment clearance. We \r\nship by USPS First Class Mail with delivery confirmation. 2+ shirts get \r\nshipped by U.S. Priority Mail.  Business days excludes weekends and \r\ncertain holidays.   &lt;br&gt;&lt;br&gt;Any requests, questions or concerns, please \r\nsend us a message BEFORE placing order and prior to placing unfavorable \r\nreviews.  Our goal is that you''re happy with your shirt. Thank you for \r\nyour consideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.', '', 'Melanoma', '', ''),
(220, 1, 'Straight Outta Chemo Purple Shirts', 'A must have for cancer warriors! Straight Outta Chemo Purple Shirt is a \r\nbold and funny slogan perfect to wear during, before and after \r\nchemotherapy treatment.  Makes a great gift for the cancer warrior with a\r\n sense of humor.   The text in the design is slightly distressed making \r\nit super-cool to wear.&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit t-shirt\r\n available from Small to size 3XL in styles for ladies and men. The \r\nshirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. It \r\nhas taped neck and shoulders. NOTE: Shirt is printed on demand using \r\ndirect to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES/Printing:  Please \r\ncheck sizing chart prior to placing order. It is found in the image \r\nthumbnails above. You can also read about the printing process found in \r\nthe image thumbnails&lt;br&gt;&lt;br&gt;Note regarding shipping:  After the 24 hour \r\ncancellation period has expired, we will process and print your order \r\nanywhere between 3 to 5 Business Days following payment clearance.  We \r\nship by USPS First Class Mail with delivery confirmation.  Business days\r\n excludes weekends and certain holidays.  &lt;br&gt;&lt;br&gt;Any questions or \r\nconcerns, please send us a message before placing order and prior to \r\nplacing unfavorable reviews.  Our goal is that you will be happy with \r\nyour shirt. Thank you for your consideration.            \r\n        ', '', 'Cancer Awareness', '', ''),
(221, 1, 'Colon Cancer Picked The Wrong Chick Shirt', 'Wear it with a fighter attitude with our line of Colon Cancer Picked The\r\n Wrong Chick shirts featuring our originally illustrated (copyrighted) \r\nchick wearing a head scarf and a blue awareness ribbon to support her \r\ncause and raise awareness.  Makes a perfect gift for the warrior in your\r\n life.&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit ladies t-shirt \r\n(feminine inspired pattern) available from size small to size 3XL.  The \r\nshirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. It \r\nhas taped neck and shoulders.  NOTE: It is printed using direct to \r\ngarment method.&lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES/Printing:  Please check sizing \r\nchart prior to placing order. It is found in the image thumbnails above.\r\n You can also read about the printing process found in the image \r\nthumbnails&lt;br&gt;&lt;br&gt;Processing/Shipping: After the 24 hour cancellation \r\nperiod has expired, we will process and print your order anywhere \r\nbetween 5 to 7 Business Days following payment clearance. We ship by \r\nUSPS First Class Mail with delivery confirmation. Business days excludes\r\n weekends and certain holidays. &lt;br&gt;&lt;br&gt;Any questions or concerns, \r\nplease send us a message before placing order and prior to placing \r\nunfavorable reviews. Our goal is that you will be happy with your shirt.\r\n Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:  © Chick Illustration is Our Copyright.  All Rights Reserved.', '', 'Colon Cancer', '', ''),
(222, 1, 'Red Ribbon For My Hero Shirts for Heart Disease, Stroke Awareness, Vasculitis and More', 'For My Hero Slogan Shirt for causes such as AIDS, Blood Cancer, Heart \r\nDisease, HIV, Stroke and Vasculitis Awareness.  Get the shirt with this \r\nempowering message spotlighting our original heart white ribbon outline.\r\n The shirt is printed on a red shirt that is attention-getting for your \r\ncause. Ideal for walks, support events, and any occasion to wear your \r\nsupport.  &lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit t-shirt available \r\nfrom Small to size 3XL in styles for ladies and men. The shirt is made \r\nfrom preshrunk 100% Cotton Jersey and weighs 6.0 oz. It has taped neck \r\nand shoulders. NOTE: Shirt is printed on demand using direct to garment \r\nprinters. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES/Printing:  Please check sizing chart \r\nprior to placing order. It is found in the image thumbnails above. You \r\ncan also read about the printing process found in the image thumbnails&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nBEFORE placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:   ©All Rights Reserved. The Copyright notice on shirt will NOT appear on it.            \r\n        ', '', 'Blood Cancer', '', ''),
(223, 1, 'Melanoma Cancer Wrong Chick Shirt', 'Wear it with a fighter attitude with our line of Melanoma Cancer Picked \r\nThe Wrong Chick shirts featuring our originally illustrated \r\n(copyrighted) chick wearing a head scarf and a black awareness ribbon to\r\n support her cause and raise awareness.  Makes a perfect gift for the \r\nwarrior in your life.&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit ladies \r\nt-shirt (feminine inspired pattern) available from size small to size \r\n3XL.  The shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0\r\n oz. It has taped neck and shoulders.  NOTE: Shirts are printed using \r\nthe direct to garment printing method.&lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES/Printing:  \r\nPlease check sizing chart prior to placing order. It is found in the \r\nimage thumbnails above. You can also read about the printing process \r\nfound in the image thumbnails&lt;br&gt;&lt;br&gt;Processing/Shipping: After the 24 \r\nhour cancellation period has expired, we will process and prepare your \r\norder for shipment anywhere between 5 to 7 Business Days following \r\npayment clearance. We ship by USPS First Class Mail with delivery \r\nconfirmation. Business days excludes weekends and certain holidays. &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message before placing order \r\nand prior to placing unfavorable reviews. Our goal is that you will be \r\nhappy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;NOTE:  © Chick Illustration is Our Copyright.  All Rights Reserved.            \r\n        ', '', 'Melanoma', '', ''),
(224, 1, 'Multiple Myeloma Strongest Among Us T-Shirt', 'Multiple Myeloma Awareness T-Shirt With Powerful Quote:  The Strongest \r\nAmong Us Are The Ones Who Smile Through The Silent Pain, Cry Behind The \r\nClosed Doors and Fight Battles Nobody Knows About.  Design features an \r\nawareness ribbon with eye-catching text.&lt;br&gt;&lt;br&gt;This shirt is a Gildan \r\nclassic fit t-shirt available from Small to size 3XL in styles for \r\nladies and men. The shirt is made from preshrunk 100% Cotton Jersey and \r\nweighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is printed \r\non demand using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; \r\nSIZES/Printing:  Please check sizing chart prior to placing order. It is\r\n found in the image thumbnails above. You can also read about the \r\nprinting process found in the image thumbnails&lt;br&gt;&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprepare your order for shipment anywhere between 5 to 7 Business Days \r\nfollowing payment clearance. We ship by USPS First Class Mail with \r\ndelivery confirmation. Business days excludes weekends and certain \r\nholidays. &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews. Our goal \r\nis that you will be happy with your shirt. Thank you for your \r\nconsideration.            \r\n        ', '', 'Multiple Myeloma', '', ''),
(225, 1, 'Esophageal Cancer Strongest Among Us T-Shirt', 'Esophageal Cancer Awareness T-Shirt With Powerful Quote:  The Strongest \r\nAmong Us Are The Ones Who Smile Through The Silent Pain, Cry Behind The \r\nClosed Doors and Fight Battles Nobody Knows About.  Design features an \r\nawareness ribbon with eye-catching text.&lt;br&gt;&lt;br&gt;This shirt is a Gildan \r\nclassic fit t-shirt available from Small to size 3XL in styles for \r\nladies and men. The shirt is made from preshrunk 100% Cotton Jersey and \r\nweighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is printed \r\non demand using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; \r\nSIZES/Printing:  Please check sizing chart prior to placing order. It is\r\n found in the image thumbnails above. You can also read about the \r\nprinting process found in the image thumbnails&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprepare your order for shipment anywhere between 5 to 7 Business Days \r\nfollowing payment clearance. We ship by USPS First Class Mail with \r\ndelivery confirmation. Business days excludes weekends and certain \r\nholidays. &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews. Our goal \r\nis that you will be happy with your shirt. Thank you for your \r\nconsideration.            \r\n        ', '', 'Esophageal Cancer', '', ''),
(226, 1, 'I Love Someone With Skin Cancer To The Moon and Back and To Infinity and Beyond Shirts', 'Show and wear your support with I Love Someone With Skin Cancer To The \r\nMoon and Back and To Infinity and Beyond shirts featuring a unique \r\ndecorative design with hearts, a moon and a twist to our original black \r\nawareness ribbon.&lt;br&gt;&lt;br&gt;This black shirt is a Gildan classic fit \r\nt-shirt available from Small to size 3XL in styles for ladies and men. \r\nThe shirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. \r\nIt has taped neck and shoulders. NOTE: Shirt is printed after processing\r\n using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES/Printing:  \r\nPlease check sizing chart prior to placing order. It is found in the \r\nimage thumbnails above. You can also read about the printing process \r\nfound in the image thumbnails&lt;br&gt;&lt;br&gt;Processing/Shipping: After the 24 \r\nhour cancellation period has expired, we will process and prepare your \r\norder for shipment anywhere between 5 to 7 Business Days following \r\npayment clearance. We ship by USPS First Class Mail with delivery \r\nconfirmation. Business days excludes weekends and certain holidays. &lt;br&gt;&lt;br&gt;Any\r\n requests, questions or concerns, please send us a message BEFORE \r\nplacing order and prior to placing unfavorable reviews.  Our goal is \r\nthat you''re happy with your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;© Awareness Ribbon Design is Copyrighted.            \r\n        ', '', 'Skin Cancer', '', ''),
(227, 1, 'Teal Tribal Warrior Ribbon Shirts', 'Teal Awareness Heart Ribbon Shirts for causes such as Gynecologic \r\nCancer, Interstitial Cystitis, Myasthenia Gravis, Ovarian Cancer, PCOS \r\n(Polycystic ovary syndrome), Polycystic Kidney Dsease, Peritoneal \r\nCancer, Scleroderma and Tourette Syndrome.   This original empowering \r\ndesign features words like Faith, Peace, Courage, Love, Hope, \r\nDetermination, Strength, Believe and Never Give Up in the shape of a \r\nheart.&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit t-shirt available from \r\nSmall to size 3XL in styles for ladies and men. The shirt is made from \r\npreshrunk 100% Cotton Jersey and weighs 6.0 oz. It has taped neck and \r\nshoulders. NOTE: Shirt is printed after processing using direct to \r\ngarment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES/Printing:  Please check sizing \r\nchart prior to placing order. It is found in the image thumbnails above.\r\n You can also read about the printing process found in the image \r\nthumbnails&lt;br&gt;&lt;br&gt;Processing/Shipping: After the 24 hour cancellation \r\nperiod has expired, we will process and prepare your order for shipment \r\nanywhere between 5 to 7 Business Days following payment clearance. We \r\nship by USPS First Class Mail with delivery confirmation. Business days \r\nexcludes weekends and certain holidays.  &lt;br&gt;&lt;br&gt;Any requests, questions\r\n or concerns, please send us a message BEFORE placing order and prior to\r\n placing unfavorable reviews.  Our goal is that you''re happy with your \r\nshirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;© Awareness Heart Design is Copyrighted.            \r\n        ', '', 'Ovarian Cancer', '', ''),
(228, 1, 'Grey Awareness Ribbon Heart Shirts', 'Grey Awareness Heart Ribbon Shirts for causes such as Brain Cancer, \r\nBrain Tumor, Diabetes, Parkinson''s Disease and Asthma Awareness.   This \r\noriginal empowering design features words like Faith, Peace, Courage, \r\nLove, Hope, Determination, Strength, Believe and Never Give Up in the \r\nshape of a heart.&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit t-shirt \r\navailable from Small to size 3XL in styles for ladies and men. The shirt\r\n is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. It has \r\ntaped neck and shoulders. NOTE: Shirt is printed after processing using \r\ndirect to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES/Printing:  Please \r\ncheck sizing chart prior to placing order. It is found in the image \r\nthumbnails above. You can also read about the printing process found in \r\nthe image thumbnails&lt;br&gt;&lt;br&gt;Processing/Shipping: After the 24 hour \r\ncancellation period has expired, we will process and prepare your order \r\nfor shipment anywhere between 5 to 7 Business Days following payment \r\nclearance. We ship by USPS First Class Mail with delivery confirmation. \r\nBusiness days excludes weekends and certain holidays.   Currently, rush \r\nshipping is not available, so please plan ahead.&lt;br&gt;&lt;br&gt;Any requests, \r\nquestions or concerns, please send us a message BEFORE placing order and\r\n prior to placing unfavorable reviews.  Our goal is that you''re happy \r\nwith your shirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;© Awareness Heart Design is Copyrighted.            \r\n        ', '', 'Brain Cancer', '', ''),
(229, 1, 'Thyroid Cancer Awareness Heart Ribbon Shirts', 'Thyroid Cancer Awareness Heart Ribbon Shirts with an empowering design \r\nfeaturing words such as Faith, Peace, Courage, Love, Hope, \r\nDetermination, Strength, Believe and Never Give Up in the shape of a \r\nheart.&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit t-shirt available from \r\nSmall to size 3XL in styles for ladies and men. The shirt is made from \r\npreshrunk 100% Cotton Jersey and weighs 6.0 oz. It has taped neck and \r\nshoulders. NOTE: Shirt is printed after processing using direct to \r\ngarment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES/Printing:  Please check sizing \r\nchart prior to placing order. It is found in the image thumbnails above.\r\n You can also read about the printing process found in the image \r\nthumbnails&lt;br&gt;&lt;br&gt;Processing/Shipping: After the 24 hour cancellation \r\nperiod has expired, we will process and prepare your order for shipment \r\nanywhere between 5 to 7 Business Days following payment clearance. We \r\nship by USPS First Class Mail with delivery confirmation. Business days \r\nexcludes weekends and certain holidays.   Currently, rush shipping is \r\nnot available, so please plan ahead.&lt;br&gt;&lt;br&gt;Any requests, questions or \r\nconcerns, please send us a message BEFORE placing order and prior to \r\nplacing unfavorable reviews.  Our goal is that you''re happy with your \r\nshirt. Thank you for your consideration.&lt;br&gt;&lt;br&gt;© Awareness Heart Design is Copyrighted.            \r\n        ', '', 'Thyroid Cancer', '', ''),
(230, 1, 'Yellow Awareness Heart Ribbon Shirts for Endometriosis, Ewing Sarcoma, Spina Bifida Awareness and More', 'Yellow Awareness Heart Ribbon Shirts for causes such as Adenosarcoma, \r\nEndometriosis, Ewing Sarcoma, Osteosarcoma, Sarcoma, Spina Bifida and \r\nTesticular Cancer.  This original empowering design features words like \r\nFaith, Peace, Courage, Love, Hope, Determination, Strength, Believe and \r\nNever Give Up in the shape of a heart.&lt;br&gt;&lt;br&gt;This shirt is a Gildan \r\nclassic fit t-shirt available from Small to size 3XL in styles for \r\nladies and men. The shirt is made from preshrunk 100% Cotton Jersey and \r\nweighs 6.0 oz. It has taped neck and shoulders. NOTE: Shirt is printed \r\nafter processing using direct to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; \r\nSIZES/Printing:  Please check sizing chart prior to placing order. It is\r\n found in the image thumbnails above. You can also read about the \r\nprinting process found in the image thumbnails&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprepare your order for shipment anywhere between 5 to 7 Business Days \r\nfollowing payment clearance. We ship by USPS First Class Mail with \r\ndelivery confirmation. Business days excludes weekends and certain \r\nholidays. &lt;br&gt;&lt;br&gt;Any requests, questions or concerns, please send us a \r\nmessage BEFORE placing order and prior to placing unfavorable reviews.  \r\nOur goal is that you''re happy with your shirt. Thank you for your \r\nconsideration.&lt;br&gt;&lt;br&gt;Awareness Heart Design is Copyrighted.            \r\n        ', '', 'Endometriosis', '', ''),
(231, 1, 'Straight Outta Chemo Tall Shirts For Men', '&lt;p&gt;Straight Outta Chemo Shirts for Men (TALL SIZES) is a bold and funny \r\nslogan perfect to wear as a cancer survivor.  Makes a great gift for the\r\n cancer warrior with a sense of humor.   The text in the design is \r\nslightly distressed making it super-cool to wear.  **We do have regular \r\nsizes too in a separate listing. Convo us if you can''t find it**&lt;br&gt;&lt;br&gt;This\r\n shirt is a Gildan classic fit t-shirt for *TALL MEN* sizes available \r\nfrom XL to size 3XL in styles for men. The shirt is made from preshrunk \r\n100% Cotton Jersey and weighs 6.0 oz. It has taped neck and shoulders. \r\nNOTE: Shirt is printed during processing time using direct to garment \r\nprinters. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing prior to placing order available in the image thumbnails)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you will be happy with your shirt. Thank you for your \r\nconsideration.            \r\n        &lt;/p&gt;', '', 'Cancer Awareness', '', ''),
(232, 1, 'Straight Outta Cancer Tall Shirts', 'Straight Outta Cancer Shirt for men (TALL SIZES) is a bold and funny \r\nslogan perfect to wear as a cancer survivor.  Makes a great gift for the\r\n cancer warrior with a sense of humor.   The text in the design is \r\nslightly distressed making it super-cool to wear.  **We do have regular \r\nsizes too in a separate listing. Convo us if you can''t find it**&lt;br&gt;&lt;br&gt;This\r\n shirt is a Gildan classic fit t-shirt for *TALL MEN* sizes available \r\nfrom XL to size 3XL in styles for men. The shirt is made from preshrunk \r\n100% Cotton Jersey and weighs 6.0 oz. It has taped neck and shoulders. \r\nNOTE: Shirt is printed during processing time using direct to garment \r\nprinters. &lt;br&gt;&lt;br&gt;SIZES:  (Please check sizing prior to placing order available in the image thumbnails)&lt;br&gt;&lt;br&gt;Note\r\n regarding shipping:  After the 24 hour cancellation period has expired,\r\n we will process and print your order anywhere between 5 to 7 Business \r\nDays following payment clearance.  We ship by USPS First Class Mail with\r\n delivery confirmation.  Business days excludes weekends and certain \r\nholidays.  &lt;br&gt;&lt;br&gt;Any questions or concerns, please send us a message \r\nbefore placing order and prior to placing unfavorable reviews.  Our goal\r\n is that you will be happy with your shirt. Thank you for your \r\nconsideration.            \r\n        ', '', 'Cancer Awareness', '', ''),
(234, 1, 'Straight Outta Cancer Black Shirts', 'A must have for cancer warriors! Straight Outta Cancer Black Shirt is a \r\nbold and funny slogan perfect to wear during, before and after \r\nchemotherapy treatment.  Makes a great gift for the cancer warrior with a\r\n sense of humor.   The text in the design is slightly distressed making \r\nit super-cool to wear.&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit t-shirt\r\n available from Small to size 3XL in styles for ladies and men. The \r\nshirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. It \r\nhas taped neck and shoulders. NOTE: Shirt is using direct to garment \r\nprinters. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES/Printing:  Please check sizing chart \r\nprior to placing order. It is found in the image thumbnails above. You \r\ncan also read about the printing process found in the image thumbnails&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprepare your order for shipment anywhere between 5 to 7 Business Days \r\nfollowing payment clearance. We ship by USPS First Class Mail with \r\ndelivery confirmation. Two or more shirts get shipped by U.S. Priority \r\nmail.  Business days excludes weekends and certain holidays.    &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message before placing order \r\nand prior to placing unfavorable reviews.  Our goal is that you will be \r\nhappy with your shirt. Thank you for your consideration.            \r\n        ', '', 'Cancer Awareness', '', ''),
(235, 1, 'Straight Outta Cancer Colon Cancer and Rectal Cancer Shirts', '&lt;p&gt;A must have for cancer warriors! Straight Outta Cancer  Blue Shirt is a \r\nbold and funny slogan perfect to wear during, before and after \r\nchemotherapy treatment.  Makes a great gift for the cancer warrior with a\r\n sense of humor.   The text in the design is slightly distressed making \r\nit super-cool to wear.&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit t-shirt\r\n available from Small to size 3XL in styles for ladies and men. The \r\nshirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. It \r\nhas taped neck and shoulders. NOTE: Shirt is printed on demand using \r\ndirect to garment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES/Printing:  Please \r\ncheck sizing chart prior to placing order. It is found in the image \r\nthumbnails above. You can also read about the printing process found in \r\nthe image thumbnails&lt;br&gt;&lt;br&gt;Processing/Shipping: After the 24 hour \r\ncancellation period has expired, we will process and prepare your order \r\nfor shipment anywhere between 5 to 7 Business Days following payment \r\nclearance. We ship by USPS First Class Mail with delivery confirmation. \r\nTwo or more shirts get shipped by U.S. Priority mail.  Business days \r\nexcludes weekends and certain holidays.   &lt;br&gt;&lt;br&gt;Any questions or \r\nconcerns, please send us a message before placing order and prior to \r\nplacing unfavorable reviews.  Our goal is that you will be happy with \r\nyour shirt. Thank you for your consideration.            \r\n        &lt;/p&gt;', '', 'Colon Cancer', '', ''),
(237, 1, 'Straight Outta Cancer Shirts for Blood Cancer Survivors', '&lt;p&gt;A must have for cancer warriors! Straight Outta Cancer Red Shirt is a \r\nbold and funny slogan perfect to wear during, before and after \r\nchemotherapy treatment.  Makes a great gift for the cancer warrior with a\r\n sense of humor.   The text in the design is slightly distressed making \r\nit super-cool to wear.&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit t-shirt\r\n available from Small to size 3XL in styles for ladies and men. The \r\nshirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. It \r\nhas taped neck and shoulders. NOTE: Shirts are printed using the direct \r\nto garment printing method.&lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES/Printing:  Please \r\ncheck sizing chart prior to placing order. It is found in the image \r\nthumbnails above. You can also read about the printing process found in \r\nthe image thumbnails&lt;br&gt;&lt;br&gt;Processing/Shipping: After the 24 hour \r\ncancellation period has expired, we will process and prepare your order \r\nfor shipment anywhere between 5 to 7 Business Days following payment \r\nclearance. We ship by USPS First Class Mail with delivery confirmation. \r\nTwo or more shirts get shipped by U.S. Priority mail.  Business days \r\nexcludes weekends and certain holidays.   &lt;br&gt;&lt;br&gt;Any questions or \r\nconcerns, please send us a message before placing order and prior to \r\nplacing unfavorable reviews.  Our goal is that you will be happy with \r\nyour shirt. Thank you for your consideration.            \r\n        &lt;/p&gt;', '', 'Cancer Awareness', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(238, 1, 'Straight Outta Cancer Yellow Shirts for Sarcoma Survivors', 'A must have for cancer warriors! Straight Outta Cancer Yellow Shirt is a\r\n bold and funny slogan perfect to wear during, before and after \r\nchemotherapy treatment.  Makes a great gift for the cancer warrior with a\r\n sense of humor.   The text in the design is slightly distressed making \r\nit super-cool to wear.   &lt;br&gt;&lt;br&gt;NOTE: yellow shirts vary in color hue for women in men.&lt;br&gt;&lt;br&gt;This\r\n shirt is a Gildan classic fit t-shirt available from Small to size 3XL \r\nin styles for ladies and men. The shirt is made from preshrunk 100% \r\nCotton Jersey and weighs 6.0 oz. It has taped neck and shoulders. NOTE: \r\nShirts are printed using the direct to garment printing method.&lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt;\r\n SIZES/Printing:  Please check sizing chart prior to placing order. It \r\nis found in the image thumbnails above. You can also read about the \r\nprinting process found in the image thumbnails&lt;br&gt;&lt;br&gt;Processing/Shipping:\r\n After the 24 hour cancellation period has expired, we will process and \r\nprepare your order for shipment anywhere between 5 to 7 Business Days \r\nfollowing payment clearance. We ship by USPS First Class Mail with \r\ndelivery confirmation. Two or more shirts get shipped by U.S. Priority \r\nmail.  Business days excludes weekends and certain holidays.   &lt;br&gt;&lt;br&gt;Any\r\n questions or concerns, please send us a message before placing order \r\nand prior to placing unfavorable reviews.  Our goal is that you will be \r\nhappy with your shirt. Thank you for your consideration.            \r\n        ', '', 'Cancer Awareness', '', ''),
(239, 1, 'Straight Outta Cancer Light Gray Shirts For Brain Cancer Survivors', '&lt;p&gt;A must have for cancer warriors! Straight Outta Cancer Gray Shirt is a \r\nbold and funny slogan perfect to wear during, before and after \r\nchemotherapy treatment.  Makes a great gift for the cancer warrior with a\r\n sense of humor.   The text in the design is slightly distressed making \r\nit super-cool to wear.&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit t-shirt\r\n available from Small to size 3XL in styles for ladies and men. The \r\nshirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. It \r\nhas taped neck and shoulders. NOTE: Shirts are printed using the direct \r\nto garment printing method.&lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES/Printing:  Please \r\ncheck sizing chart prior to placing order. It is found in the image \r\nthumbnails above. You can also read about the printing process found in \r\nthe image thumbnails&lt;br&gt;&lt;br&gt;Processing/Shipping: After the 24 hour \r\ncancellation period has expired, we will process and prepare your order \r\nfor shipment anywhere between 5 to 7 Business Days following payment \r\nclearance. We ship by USPS First Class Mail with delivery confirmation. \r\nTwo or more shirts get shipped by U.S. Priority mail.  Business days \r\nexcludes weekends and certain holidays.   &lt;br&gt;&lt;br&gt;Any questions or \r\nconcerns, please send us a message before placing order and prior to \r\nplacing unfavorable reviews.  Our goal is that you will be happy with \r\nyour shirt. Thank you for your consideration.            \r\n        &lt;/p&gt;', '', 'Cancer Awareness', '', ''),
(240, 1, 'Straight Outta Cancer Green Shirts For Adrenal Cancer, Bile Duct Cancer and Kidney Cancer Survivors', '&lt;p&gt;A must have for cancer warriors! Straight Outta Cancer Green Shirt is a \r\nbold and funny slogan perfect to wear during, before and after \r\nchemotherapy treatment.  Makes a great gift for the cancer warrior with a\r\n sense of humor.   The text in the design is slightly distressed making \r\nit super-cool to wear.&lt;br&gt;&lt;br&gt;This shirt is a Gildan classic fit t-shirt\r\n available from Small to size 3XL in styles for ladies and men. The \r\nshirt is made from preshrunk 100% Cotton Jersey and weighs 6.0 oz. It \r\nhas taped neck and shoulders. NOTE: Shirt is printed  using direct to \r\ngarment printers. &lt;br&gt;&lt;br&gt;&amp;gt;&amp;gt; SIZES/Printing:  Please check sizing \r\nchart prior to placing order. It is found in the image thumbnails above.\r\n You can also read about the printing process found in the image \r\nthumbnails&lt;br&gt;&lt;br&gt;Processing/Shipping: After the 24 hour cancellation \r\nperiod has expired, we will process and prepare your order for shipment \r\nanywhere between 5 to 7 Business Days following payment clearance. We \r\nship by USPS First Class Mail with delivery confirmation. Two or more \r\nshirts get shipped by U.S. Priority mail.  Business days excludes \r\nweekends and certain holidays.   &lt;br&gt;&lt;br&gt;Any questions or concerns, \r\nplease send us a message before placing order and prior to placing \r\nunfavorable reviews.  Our goal is that you will be happy with your \r\nshirt. Thank you for your consideration.            \r\n        &lt;/p&gt;', '', 'Cancer Awareness', '', ''),
(241, 1, 'TEST product', 'test product', '', 'test', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_discount`
--

CREATE TABLE IF NOT EXISTS `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM AUTO_INCREMENT=441 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_filter`
--

CREATE TABLE IF NOT EXISTS `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_image`
--

CREATE TABLE IF NOT EXISTS `oc_product_image` (
  `product_image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2776 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_image`
--

INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2446, 154, 'catalog/TS-HL-P-00001/il_570xN.848994057_lm0k.jpg', 0),
(2445, 153, 'catalog/TS-HL-W-00014/il_570xN.849226086_cktv.jpg', 0),
(2443, 151, 'catalog/TS-L-W-00009/il_570xN.857113113_sh80.jpg', 0),
(2564, 150, 'catalog/TS-HL-W-00011/il_570xN.859942049_tdeh.jpg', 0),
(2437, 149, 'catalog/TS-L-B-00002/il_570xN.857375688_muix.jpg', 0),
(2436, 148, 'catalog/TS-HL-W-00011/il_570xN.859942049_tdeh.jpg', 0),
(2439, 147, 'catalog/TS-HL-W-00013/il_570xN.857351232_15zs.jpg', 0),
(2432, 146, 'catalog/TS-HL-W-00010/il_570xN.860179144_hurd.jpg', 0),
(2427, 144, 'catalog/TS-HL-W-00008/il_570xN.860181888_8oz2.jpg', 0),
(2425, 143, 'catalog/TS-HL-W-00007/il_570xN.859948573_n9l3.jpg', 0),
(2421, 141, 'catalog/TS-HL-W-00005/il_570xN.859951669_j6mr.jpg', 0),
(2419, 140, 'catalog/TS-HL-W-00004/il_570xN.859953069_f76c.jpg', 0),
(2391, 126, 'catalog/TS-L-B-00001/il_570xN.883676285_qv98.jpg', 0),
(2417, 139, 'catalog/TS-L-W-00008/il_570xN.885020602_iuq6.jpg', 0),
(2394, 128, 'catalog/TS-L-W-00002/il_570xN.881990745_8oig.jpg', 0),
(2396, 130, 'catalog/TS-L-W-00003/il_570xN.884778525_devv.jpg', 0),
(2397, 130, 'catalog/TS-L-W-00003/il_570xN.885015562_9aoj.jpg', 0),
(2398, 130, 'catalog/TS-L-W-00003/il_570xN.885015598_4hjb.jpg', 0),
(2416, 139, 'catalog/TS-L-W-00008/il_570xN.885020560_bwt4.jpg', 0),
(2415, 139, 'catalog/TS-L-W-00008/il_570xN.884785561_ddz0.jpg', 0),
(2402, 132, 'catalog/TS-L-W-00004/il_570xN.873371767_f7g8.jpg', 0),
(2411, 135, 'catalog/TS-L-W-00006/il_570xN.832693981_tstr.jpg', 0),
(2406, 133, 'catalog/TS-L-W-00005/il_570xN.873371767_f7g8.jpg', 0),
(2407, 134, 'catalog/TS-HL-W-00003/il_570xN.873354411_t41j.jpg', 0),
(2429, 145, 'catalog/TS-HL-W-00009/il_570xN.859945409_q1zu.jpg', 0),
(2423, 142, 'catalog/TS-HL-W-00006/il_570xN.860185524_8x98.jpg', 0),
(2390, 126, 'catalog/TS-L-B-00001/il_570xN.883676273_j300.jpg', 0),
(2387, 125, 'catalog/TS-HL-B-00002/il_570xN.883914222_pwku.jpg', 0),
(2386, 125, 'catalog/TS-HL-B-00002/il_570xN.883678829_gld6.jpg', 0),
(2378, 122, 'catalog/TS-HL-B-00001/il_570xN.883686613_6qv4.jpg', 0),
(2379, 122, 'catalog/TS-HL-B-00001/il_570xN.883686603_ao0t.jpg', 0),
(2383, 123, 'catalog/TS-L-W-00001/il_570xN.885047032_45un.jpg', 0),
(2382, 123, 'catalog/TS-L-W-00001/il_570xN.884812039_mc36.jpg', 0),
(2448, 155, 'catalog/TS-L-W-00010/il_570xN.885017820_mcc8.jpg', 0),
(2453, 158, 'catalog/TS-L-W-00012/il_570xN.885093015_nwxw.jpg', 0),
(2454, 158, 'catalog/TS-L-W-00012/il_570xN.885093099_2ohm.jpg', 0),
(2460, 164, 'catalog/TS-L-W-00016/il_570xN.884809011_qnhr.jpg', 0),
(2462, 165, 'catalog/TS-L-W-00017/il_570xN.884808209_7zmt.jpg', 0),
(2466, 168, 'catalog/TS-L-W-00020/il_570xN.885096051_nywh.jpg', 0),
(2467, 168, 'catalog/TS-L-W-00020/il_570xN.885330192_btqr.jpg', 0),
(2471, 170, 'catalog/TS-BRC-W-00001/il_570xN.857348122_o13o.jpg', 0),
(2470, 169, 'catalog/TS-SB-B-00001/il_570xN.883497130_hvvb.jpg', 0),
(2477, 174, 'catalog/TS-L-W-00020/il_570xN.885330192_btqr.jpg', 0),
(2476, 174, 'catalog/TS-L-W-00020/il_570xN.885096051_nywh.jpg', 0),
(2483, 178, 'catalog/TS-OC-B-00001/il_570xN.883686613_6qv4.jpg', 0),
(2482, 178, 'catalog/TS-OC-B-00001/il_570xN.883686603_ao0t.jpg', 0),
(2487, 179, 'catalog/TS-L-B-00003/il_570xN.883686613_6qv4.jpg', 0),
(2486, 179, 'catalog/TS-L-B-00003/il_570xN.883686603_ao0t.jpg', 0),
(2491, 180, 'catalog/TS-MC-B-00001/il_570xN.883686613_6qv4.jpg', 0),
(2490, 180, 'catalog/TS-MC-B-00001/il_570xN.883686603_ao0t.jpg', 0),
(2495, 181, 'catalog/TS-L-B-00004/il_570xN.883686613_6qv4.jpg', 0),
(2494, 181, 'catalog/TS-L-B-00004/il_570xN.883686603_ao0t.jpg', 0),
(2499, 182, 'catalog/TS-LUC-B-00001/il_570xN.883686613_6qv4.jpg', 0),
(2498, 182, 'catalog/TS-LUC-B-00001/il_570xN.883686603_ao0t.jpg', 0),
(2503, 183, 'catalog/TS-LIVC-B-00001/il_570xN.883686613_6qv4.jpg', 0),
(2502, 183, 'catalog/TS-LIVC-B-00001/il_570xN.883686603_ao0t.jpg', 0),
(2507, 184, 'catalog/TS-KC-B-00001/il_570xN.883686613_6qv4.jpg', 0),
(2506, 184, 'catalog/TS-KC-B-00001/il_570xN.883686603_ao0t.jpg', 0),
(2511, 185, 'catalog/TS-HL-B-00003/il_570xN.883686613_6qv4.jpg', 0),
(2510, 185, 'catalog/TS-HL-B-00003/il_570xN.883686603_ao0t.jpg', 0),
(2515, 186, 'catalog/TS-HD-B-00001/il_570xN.883686613_6qv4.jpg', 0),
(2514, 186, 'catalog/TS-HD-B-00001/il_570xN.883686603_ao0t.jpg', 0),
(2519, 187, 'catalog/TS-SAR-B-00001/il_570xN.883686613_6qv4.jpg', 0),
(2518, 187, 'catalog/TS-SAR-B-00001/il_570xN.883686603_ao0t.jpg', 0),
(2523, 188, 'catalog/TS-CHC-B-00001/il_570xN.883686613_6qv4.jpg', 0),
(2522, 188, 'catalog/TS-CHC-B-00001/il_570xN.883686603_ao0t.jpg', 0),
(2527, 189, 'catalog/TS-CEC-B-00001/il_570xN.883686613_6qv4.jpg', 0),
(2526, 189, 'catalog/TS-CEC-B-00001/il_570xN.883686603_ao0t.jpg', 0),
(2528, 190, 'catalog/TS-BC-B-00003/il_570xN.883686603_ao0t.jpg', 0),
(2529, 190, 'catalog/TS-BC-B-00003/il_570xN.883686613_6qv4.jpg', 0),
(2533, 191, 'catalog/TS-BRC-B-00001/il_570xN.883686613_6qv4.jpg', 0),
(2532, 191, 'catalog/TS-BRC-B-00001/il_570xN.883686603_ao0t.jpg', 0),
(2537, 192, 'catalog/TS-BOC-B-00001/il_570xN.883686613_6qv4.jpg', 0),
(2536, 192, 'catalog/TS-BOC-B-00001/il_570xN.883686603_ao0t.jpg', 0),
(2541, 193, 'catalog/TS-BLC-B-00001/il_570xN.883686613_6qv4.jpg', 0),
(2540, 193, 'catalog/TS-BLC-B-00001/il_570xN.883686603_ao0t.jpg', 0),
(2545, 194, 'catalog/TS-HL-B-00002/il_570xN.883678829_gld6.jpg', 0),
(2544, 194, 'catalog/TS-HL-B-00002/il_570xN.883914222_pwku.jpg', 0),
(2563, 195, 'catalog/TS-APC-B-00001/il_570xN.883686613_6qv4.jpg', 0),
(2562, 195, 'catalog/TS-APC-B-00001/il_570xN.883686603_ao0t.jpg', 0),
(2554, 197, 'catalog/TS-L-W-00022/il_570xN.884812039_mc36.jpg', 0),
(2555, 197, 'catalog/TS-L-W-00022/il_570xN.885047032_45un.jpg', 0),
(2775, 198, 'catalog/TS-APC-B-00002/il_570xN.883686613_6qv4.jpg', 0),
(2774, 198, 'catalog/TS-APC-B-00002/il_570xN.883686603_ao0t.jpg', 0),
(2566, 200, 'catalog/TS-PRC-W-00001/il_570xN.893274048_jtbx.jpg', 0),
(2565, 200, 'catalog/TS-PRC-W-00001/il_570xN.893033065_gcfc.jpg', 0),
(2567, 201, 'catalog/TS-ME-W-00001/il_570xN.873588488_7zwq.jpg', 0),
(2569, 202, 'catalog/TS-ME-SC-W-00001/il_570xN.893070345_fu1h.jpg', 0),
(2570, 202, 'catalog/TS-ME-SC-W-00001/il_570xN.893311596_5mze.jpg', 0),
(2571, 203, 'catalog/TS-COL-W-00001/il_570xN.893311596_5mze.jpg', 0),
(2572, 203, 'catalog/TS-COL-W-00001/il_570xN.893070345_fu1h.jpg', 0),
(2576, 204, 'catalog/TS-BLC-B-00002/il_570xN.893311596_5mze.jpg', 0),
(2575, 204, 'catalog/TS-BLC-B-00002/il_570xN.893070345_fu1h.jpg', 0),
(2580, 205, 'catalog/TS-LUC-B-00002/il_570xN.893311596_5mze.jpg', 0),
(2579, 205, 'catalog/TS-LUC-B-00002/il_570xN.893070345_fu1h.jpg', 0),
(2584, 206, 'catalog/TS-BRC-B-00002/il_570xN.893311596_5mze.jpg', 0),
(2583, 206, 'catalog/TS-BRC-B-00002/il_570xN.893070345_fu1h.jpg', 0),
(2586, 207, 'catalog/TS-BRC-W-00002/il_570xN.893025727_k39b.jpg', 0),
(2587, 207, 'catalog/TS-BRC-W-00002/il_570xN.893026087_mx6a.jpg', 0),
(2591, 208, 'catalog/TS-CAC-W-00001/il_570xN.893311596_5mze.jpg', 0),
(2590, 208, 'catalog/TS-CAC-W-00001/il_570xN.893070345_fu1h.jpg', 0),
(2595, 209, 'catalog/TS-BRC-W-00003/il_570xN.893070345_fu1h.jpg', 0),
(2594, 209, 'catalog/TS-BRC-W-00003/il_570xN.893311596_5mze.jpg', 0),
(2599, 210, 'catalog/TS-LUC-W-00001/il_570xN.893070345_fu1h.jpg', 0),
(2598, 210, 'catalog/TS-LUC-W-00001/il_570xN.893311596_5mze.jpg', 0),
(2603, 211, 'catalog/TS-BLC-W-00001/il_570xN.893311596_5mze.jpg', 0),
(2602, 211, 'catalog/TS-BLC-W-00001/il_570xN.893070345_fu1h.jpg', 0),
(2607, 212, 'catalog/TS-COL-W-00002/il_570xN.893311596_5mze.jpg', 0),
(2606, 212, 'catalog/TS-COL-W-00002/il_570xN.893070345_fu1h.jpg', 0),
(2608, 213, 'catalog/TS-OC-W-00002/il_570xN.893070345_fu1h.jpg', 0),
(2609, 213, 'catalog/TS-OC-W-00002/il_570xN.893311596_5mze.jpg', 0),
(2610, 214, 'catalog/TS-OC-W-00003/il_570xN.893070345_fu1h.jpg', 0),
(2611, 214, 'catalog/TS-OC-W-00003/il_570xN.893311596_5mze.jpg', 0),
(2615, 215, 'catalog/TS-COL-W-00003/il_570xN.893311596_5mze.jpg', 0),
(2614, 215, 'catalog/TS-COL-W-00003/il_570xN.893070345_fu1h.jpg', 0),
(2619, 216, 'catalog/TS-LUC-W-00002/il_570xN.893311596_5mze.jpg', 0),
(2618, 216, 'catalog/TS-LUC-W-00002/il_570xN.893070345_fu1h.jpg', 0),
(2623, 217, 'catalog/TS-BLC-W-00002/il_570xN.893311596_5mze.jpg', 0),
(2622, 217, 'catalog/TS-BLC-W-00002/il_570xN.893070345_fu1h.jpg', 0),
(2627, 218, 'catalog/TS-BRC-W-00004/il_570xN.893311596_5mze.jpg', 0),
(2626, 218, 'catalog/TS-BRC-W-00004/il_570xN.893070345_fu1h.jpg', 0),
(2629, 219, 'catalog/TS-ME-W-00002/il_570xN.893070345_fu1h.jpg', 0),
(2630, 219, 'catalog/TS-ME-W-00002/il_570xN.893311596_5mze.jpg', 0),
(2631, 220, 'catalog/TS-CAA-P-00001/il_570xN.859259108_os3o.jpg', 0),
(2632, 220, 'catalog/TS-CAA-P-00001/il_570xN.893067917_5p8d.jpg', 0),
(2633, 220, 'catalog/TS-CAA-P-00001/il_570xN.893220250_9u3u.jpg', 0),
(2637, 221, 'catalog/TS-COL-W-00004/il_570xN.893309446_qnog.jpg', 0),
(2636, 221, 'catalog/TS-COL-W-00004/il_570xN.893220348_eaym.jpg', 0),
(2638, 222, 'catalog/TS-BLC-R-00001/il_570xN.892980161_ketc.jpg', 0),
(2639, 222, 'catalog/TS-BLC-R-00001/il_570xN.893309496_f6k2.jpg', 0),
(2641, 223, 'catalog/TS-ME-W-00003/il_570xN.892980389_nuix.jpg', 0),
(2642, 223, 'catalog/TS-ME-W-00003/il_570xN.893309544_50e7.jpg', 0),
(2643, 224, 'catalog/TS-MM-W-00001/il_570xN.873589030_r8kj.jpg', 0),
(2644, 224, 'catalog/TS-MM-W-00001/il_570xN.892981217_tgmx.jpg', 0),
(2645, 224, 'catalog/TS-MM-W-00001/il_570xN.893068785_28cg.jpg', 0),
(2646, 225, 'catalog/TS-EC-W-00001/il_570xN.873585960_qahg.jpg', 0),
(2647, 225, 'catalog/TS-EC-W-00001/il_570xN.893068775_3qsm.jpg', 0),
(2648, 225, 'catalog/TS-EC-W-00001/il_570xN.893222528_buds.jpg', 0),
(2652, 226, 'catalog/TS-SKC-B-00001/il_570xN.893070217_csjg.jpg', 0),
(2651, 226, 'catalog/TS-SKC-B-00001/il_570xN.892983229_lr73.jpg', 0),
(2656, 227, 'catalog/TS-OC-B-00002/il_570xN.893313312_95fd.jpg', 0),
(2655, 227, 'catalog/TS-OC-B-00002/il_570xN.893227706_iljr.jpg', 0),
(2660, 228, 'catalog/TS-BRC-B-00003/il_570xN.893227954_2zdo.jpg', 0),
(2659, 228, 'catalog/TS-BRC-B-00003/il_570xN.893072271_57e9.jpg', 0),
(2664, 229, 'catalog/TS-TIC-B-00001/il_570xN.893313696_7rpw.jpg', 0),
(2663, 229, 'catalog/TS-TIC-B-00001/il_570xN.892987281_t7ea.jpg', 0),
(2668, 230, 'catalog/TS-END-B-00001/il_570xN.893314182_q2i9.jpg', 0),
(2667, 230, 'catalog/TS-END-B-00001/il_570xN.893228478_2vj1.jpg', 0),
(2712, 231, 'catalog/TS-CAA-G-00001/il_570xN.883874194_ll22.jpg', 0),
(2711, 231, 'catalog/TS-CAA-G-00001/il_570xN.883645251_ezlg.jpg', 0),
(2710, 231, 'catalog/TS-CAA-G-00001/il_570xN.883881168_ktp5.jpg', 0),
(2709, 231, 'catalog/TS-CAA-G-00001/il_570xN.893228574_lv44.jpg', 0),
(2720, 232, 'catalog/TS-CAA-G-00002/il_570xN.893228628_bcnp.jpg', 0),
(2719, 232, 'catalog/TS-CAA-G-00002/il_570xN.883874194_ll22.jpg', 0),
(2718, 232, 'catalog/TS-CAA-G-00002/il_570xN.883874140_4t2w.jpg', 0),
(2717, 232, 'catalog/TS-CAA-G-00002/il_570xN.883638231_kwle.jpg', 0),
(2721, 75, 'catalog/TS-CAA-BL-00001/il_570xN.893229538_h6r6.jpg', 0),
(2722, 75, 'catalog/TS-CAA-BL-00001/il_570xN.893314752_rune.jpg', 0),
(2726, 234, 'catalog/TS-CAA-B-00001/il_570xN.892989605_onoq.jpg', 0),
(2725, 234, 'catalog/TS-CAA-B-00001/il_570xN.881888728_47xk.jpg', 0),
(2727, 234, 'catalog/TS-CAA-B-00001/il_570xN.893314852_boya.jpg', 0),
(2731, 235, 'catalog/TS-COL-BL-00003/il_570xN.892989839_dwt8.jpg', 0),
(2730, 235, 'catalog/TS-COL-BL-00003/il_570xN.881675661_316o.jpg', 0),
(2732, 235, 'catalog/TS-COL-BL-00003/il_570xN.893315052_mxrl.jpg', 0),
(2742, 238, 'catalog/TS-CAA-Y-00001/il_570xN.893074193_stce.jpg', 0),
(2741, 238, 'catalog/TS-CAA-Y-00001/il_570xN.881915068_rcyw.jpg', 0),
(2738, 237, 'catalog/TS-CAA-R-00001/il_570xN.893315272_toyt.jpg', 0),
(2737, 237, 'catalog/TS-CAA-R-00001/il_570xN.893315250_e3y9.jpg', 0),
(2743, 238, 'catalog/TS-CAA-Y-00001/il_570xN.893315286_oujx.jpg', 0),
(2747, 239, 'catalog/TS-CAA-G-00003/il_570xN.893074141_qc6i.jpg', 0),
(2746, 239, 'catalog/TS-CAA-G-00003/il_570xN.881883192_3nef.jpg', 0),
(2748, 239, 'catalog/TS-CAA-G-00003/il_570xN.893315434_ods0.jpg', 0),
(2752, 240, 'catalog/TS-CAA-GR-00001/il_570xN.892999785_lieq.jpg', 0),
(2751, 240, 'catalog/TS-CAA-GR-00001/il_570xN.881915540_9bgh.jpg', 0),
(2753, 240, 'catalog/TS-CAA-GR-00001/il_570xN.893315520_ghx0.jpg', 0),
(2771, 241, 'catalog/TS-APC-B-00002/il_570xN.883686613_6qv4.jpg', 0),
(2770, 241, 'catalog/TS-APC-B-00002/il_570xN.883686603_ao0t.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option`
--

CREATE TABLE IF NOT EXISTS `oc_product_option` (
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=422 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_option`
--

INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES
(240, 64, 11, '', 1),
(239, 63, 11, '', 1),
(238, 62, 11, '', 1),
(412, 233, 11, '', 1),
(235, 59, 11, '', 1),
(234, 58, 11, '', 1),
(233, 57, 11, '', 1),
(232, 56, 11, '', 1),
(229, 55, 11, '', 1),
(241, 65, 11, '', 1),
(242, 66, 11, '', 1),
(243, 67, 11, '', 1),
(244, 68, 11, '', 1),
(245, 69, 11, '', 1),
(247, 71, 11, '', 1),
(376, 200, 11, '', 1),
(249, 73, 11, '', 1),
(250, 74, 11, '', 1),
(251, 75, 11, '', 1),
(252, 76, 11, '', 1),
(253, 77, 11, '', 1),
(254, 78, 11, '', 1),
(255, 79, 11, '', 1),
(256, 80, 11, '', 1),
(257, 81, 11, '', 1),
(258, 82, 11, '', 1),
(259, 83, 11, '', 1),
(260, 84, 11, '', 1),
(261, 85, 11, '', 1),
(262, 86, 11, '', 1),
(263, 87, 11, '', 1),
(265, 89, 11, '', 1),
(266, 90, 11, '', 1),
(267, 91, 11, '', 1),
(268, 92, 11, '', 1),
(269, 93, 11, '', 1),
(270, 94, 11, '', 1),
(271, 95, 11, '', 1),
(272, 96, 11, '', 1),
(273, 97, 11, '', 1),
(274, 98, 11, '', 1),
(275, 99, 11, '', 1),
(276, 100, 11, '', 1),
(277, 101, 11, '', 1),
(278, 102, 11, '', 1),
(279, 103, 11, '', 1),
(280, 104, 11, '', 1),
(281, 105, 11, '', 1),
(283, 107, 11, '', 1),
(284, 108, 11, '', 1),
(285, 109, 11, '', 1),
(286, 110, 11, '', 1),
(287, 111, 11, '', 1),
(288, 112, 11, '', 1),
(289, 113, 11, '', 1),
(290, 114, 11, '', 1),
(291, 115, 11, '', 1),
(292, 116, 11, '', 1),
(293, 117, 11, '', 1),
(294, 118, 11, '', 1),
(295, 119, 11, '', 1),
(296, 120, 11, '', 1),
(297, 121, 11, '', 1),
(298, 122, 11, '', 1),
(299, 123, 11, '', 1),
(300, 124, 11, '', 1),
(301, 125, 11, '', 1),
(302, 126, 11, '', 1),
(303, 127, 11, '', 1),
(304, 128, 11, '', 1),
(305, 129, 11, '', 1),
(306, 130, 11, '', 1),
(307, 131, 11, '', 1),
(308, 132, 11, '', 1),
(309, 133, 11, '', 1),
(310, 134, 11, '', 1),
(311, 135, 11, '', 1),
(312, 136, 11, '', 1),
(313, 137, 11, '', 1),
(314, 138, 11, '', 1),
(315, 139, 11, '', 1),
(316, 140, 11, '', 1),
(317, 141, 11, '', 1),
(318, 142, 11, '', 1),
(319, 143, 11, '', 1),
(320, 144, 11, '', 1),
(321, 145, 11, '', 1),
(322, 146, 11, '', 1),
(323, 147, 11, '', 1),
(324, 148, 11, '', 1),
(325, 149, 11, '', 1),
(326, 150, 11, '', 1),
(327, 151, 11, '', 1),
(329, 153, 11, '', 1),
(330, 154, 11, '', 1),
(331, 155, 11, '', 1),
(332, 156, 11, '', 1),
(333, 157, 11, '', 1),
(334, 158, 11, '', 1),
(336, 160, 11, '', 1),
(337, 161, 11, '', 1),
(338, 162, 11, '', 1),
(339, 163, 11, '', 1),
(340, 164, 11, '', 1),
(341, 165, 11, '', 1),
(342, 166, 11, '', 1),
(343, 167, 11, '', 1),
(344, 168, 11, '', 1),
(345, 169, 11, '', 1),
(346, 170, 11, '', 1),
(347, 171, 11, '', 1),
(349, 173, 11, '', 1),
(350, 174, 11, '', 1),
(351, 175, 11, '', 1),
(352, 176, 11, '', 1),
(353, 177, 11, '', 1),
(354, 178, 11, '', 1),
(355, 179, 11, '', 1),
(356, 180, 11, '', 1),
(357, 181, 11, '', 1),
(358, 182, 11, '', 1),
(359, 183, 11, '', 1),
(360, 184, 11, '', 1),
(361, 185, 11, '', 1),
(362, 186, 11, '', 1),
(363, 187, 11, '', 1),
(364, 188, 11, '', 1),
(365, 189, 11, '', 1),
(366, 190, 11, '', 1),
(367, 191, 11, '', 1),
(368, 192, 11, '', 1),
(369, 193, 11, '', 1),
(370, 194, 11, '', 1),
(371, 195, 11, '', 1),
(372, 196, 11, '', 1),
(373, 197, 11, '', 1),
(374, 198, 11, '', 1),
(377, 201, 11, '', 1),
(378, 202, 11, '', 1),
(379, 203, 11, '', 1),
(380, 204, 11, '', 1),
(381, 205, 11, '', 1),
(382, 206, 11, '', 1),
(383, 207, 11, '', 1),
(384, 208, 11, '', 1),
(385, 209, 11, '', 1),
(386, 210, 11, '', 1),
(387, 211, 11, '', 1),
(388, 212, 11, '', 1),
(389, 213, 11, '', 1),
(390, 214, 11, '', 1),
(391, 215, 11, '', 1),
(392, 216, 11, '', 1),
(393, 217, 11, '', 1),
(394, 218, 11, '', 1),
(395, 219, 11, '', 1),
(396, 220, 11, '', 1),
(397, 221, 11, '', 1),
(398, 222, 11, '', 1),
(399, 223, 11, '', 1),
(400, 224, 11, '', 1),
(401, 225, 11, '', 1),
(402, 226, 11, '', 1),
(403, 227, 11, '', 1),
(404, 228, 11, '', 1),
(405, 229, 11, '', 1),
(406, 230, 11, '', 1),
(409, 231, 14, '', 1),
(407, 231, 11, '', 1),
(411, 232, 11, '', 1),
(410, 232, 14, '', 1),
(413, 234, 11, '', 1),
(414, 235, 11, '', 1),
(417, 238, 11, '', 1),
(416, 237, 11, '', 1),
(418, 239, 11, '', 1),
(419, 240, 11, '', 1),
(421, 241, 13, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option_value`
--

CREATE TABLE IF NOT EXISTS `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2265 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_option_value`
--

INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(42, 232, 56, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(41, 232, 56, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(40, 229, 55, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(39, 229, 55, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(38, 229, 55, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(37, 229, 55, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(36, 229, 55, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(35, 229, 55, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(26, 229, 55, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(27, 229, 55, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(28, 229, 55, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(29, 229, 55, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(30, 229, 55, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(31, 229, 55, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(43, 232, 56, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(44, 232, 56, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(45, 232, 56, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(46, 232, 56, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(47, 232, 56, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(48, 232, 56, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(49, 232, 56, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(50, 232, 56, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(51, 232, 56, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(52, 232, 56, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(53, 233, 57, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(54, 233, 57, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(55, 233, 57, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(56, 233, 57, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(57, 233, 57, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(58, 233, 57, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(59, 233, 57, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(60, 233, 57, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(61, 233, 57, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(62, 233, 57, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(63, 233, 57, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(64, 233, 57, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(75, 234, 58, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(76, 234, 58, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(74, 234, 58, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(73, 234, 58, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(72, 234, 58, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(71, 234, 58, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(70, 234, 58, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(69, 234, 58, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(68, 234, 58, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(67, 234, 58, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(65, 234, 58, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(66, 234, 58, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(88, 235, 59, 11, 57, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(87, 235, 59, 11, 56, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(86, 235, 59, 11, 55, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(85, 235, 59, 11, 53, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(84, 235, 59, 11, 52, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(83, 235, 59, 11, 51, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(82, 235, 59, 11, 48, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(81, 235, 59, 11, 47, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(80, 235, 59, 11, 46, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(79, 235, 59, 11, 58, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(77, 235, 59, 11, 60, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(78, 235, 59, 11, 59, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2167, 412, 233, 11, 57, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2166, 412, 233, 11, 56, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2165, 412, 233, 11, 55, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2164, 412, 233, 11, 53, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2163, 412, 233, 11, 52, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2162, 412, 233, 11, 51, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2161, 412, 233, 11, 48, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2160, 412, 233, 11, 47, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2159, 412, 233, 11, 46, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2158, 412, 233, 11, 58, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2157, 412, 233, 11, 60, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2156, 412, 233, 11, 59, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(124, 238, 62, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(123, 238, 62, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(122, 238, 62, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(121, 238, 62, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(120, 238, 62, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(119, 238, 62, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(118, 238, 62, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(117, 238, 62, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(116, 238, 62, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(115, 238, 62, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(114, 238, 62, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(113, 238, 62, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(136, 239, 63, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(135, 239, 63, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(134, 239, 63, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(133, 239, 63, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(132, 239, 63, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(131, 239, 63, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(130, 239, 63, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(129, 239, 63, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(128, 239, 63, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(127, 239, 63, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(126, 239, 63, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(125, 239, 63, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(148, 240, 64, 11, 57, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(147, 240, 64, 11, 56, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(146, 240, 64, 11, 55, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(145, 240, 64, 11, 53, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(144, 240, 64, 11, 52, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(143, 240, 64, 11, 51, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(142, 240, 64, 11, 48, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(141, 240, 64, 11, 47, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(140, 240, 64, 11, 46, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(139, 240, 64, 11, 58, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(138, 240, 64, 11, 59, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(137, 240, 64, 11, 60, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(149, 241, 65, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(150, 241, 65, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(151, 241, 65, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(152, 241, 65, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(153, 241, 65, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(154, 241, 65, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(155, 241, 65, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(156, 241, 65, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(157, 241, 65, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(158, 241, 65, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(159, 241, 65, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(160, 241, 65, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(161, 242, 66, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(162, 242, 66, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(163, 242, 66, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(164, 242, 66, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(165, 242, 66, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(166, 242, 66, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(167, 242, 66, 11, 51, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(168, 242, 66, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(169, 242, 66, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(170, 242, 66, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(171, 242, 66, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(172, 242, 66, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(173, 243, 67, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(174, 243, 67, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(175, 243, 67, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(176, 243, 67, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(177, 243, 67, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(178, 243, 67, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(179, 243, 67, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(180, 243, 67, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(181, 243, 67, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(182, 243, 67, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(183, 243, 67, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(184, 243, 67, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(185, 244, 68, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(186, 244, 68, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(187, 244, 68, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(188, 244, 68, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(189, 244, 68, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(190, 244, 68, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(191, 244, 68, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(192, 244, 68, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(193, 244, 68, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(194, 244, 68, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(195, 244, 68, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(196, 244, 68, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(197, 245, 69, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(198, 245, 69, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(199, 245, 69, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(200, 245, 69, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(201, 245, 69, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(202, 245, 69, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(203, 245, 69, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(204, 245, 69, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(205, 245, 69, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(206, 245, 69, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(207, 245, 69, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(208, 245, 69, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(221, 247, 71, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(222, 247, 71, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(223, 247, 71, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(224, 247, 71, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(225, 247, 71, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(226, 247, 71, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(227, 247, 71, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(228, 247, 71, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(229, 247, 71, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(230, 247, 71, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(231, 247, 71, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(232, 247, 71, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1769, 376, 200, 11, 60, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1770, 376, 200, 11, 59, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1771, 376, 200, 11, 58, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1772, 376, 200, 11, 46, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1773, 376, 200, 11, 47, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1774, 376, 200, 11, 48, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1775, 376, 200, 11, 51, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1776, 376, 200, 11, 52, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1777, 376, 200, 11, 53, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1778, 376, 200, 11, 55, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1779, 376, 200, 11, 56, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1780, 376, 200, 11, 57, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(256, 249, 73, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(255, 249, 73, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(254, 249, 73, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(253, 249, 73, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(252, 249, 73, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(251, 249, 73, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(250, 249, 73, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(249, 249, 73, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(248, 249, 73, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(247, 249, 73, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(246, 249, 73, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(245, 249, 73, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(268, 250, 74, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(267, 250, 74, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(266, 250, 74, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(265, 250, 74, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(264, 250, 74, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(263, 250, 74, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(262, 250, 74, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(261, 250, 74, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(260, 250, 74, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(259, 250, 74, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(258, 250, 74, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(257, 250, 74, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(269, 251, 75, 11, 57, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(270, 251, 75, 11, 56, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(271, 251, 75, 11, 55, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(272, 251, 75, 11, 53, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(273, 251, 75, 11, 52, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(274, 251, 75, 11, 51, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(275, 251, 75, 11, 48, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(276, 251, 75, 11, 47, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(277, 251, 75, 11, 46, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(278, 251, 75, 11, 58, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(279, 251, 75, 11, 60, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(280, 251, 75, 11, 59, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(292, 252, 76, 11, 57, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(291, 252, 76, 11, 56, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(290, 252, 76, 11, 55, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(289, 252, 76, 11, 53, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(288, 252, 76, 11, 52, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(287, 252, 76, 11, 51, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(286, 252, 76, 11, 48, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(285, 252, 76, 11, 47, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(284, 252, 76, 11, 46, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(283, 252, 76, 11, 58, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(282, 252, 76, 11, 60, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(281, 252, 76, 11, 59, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(304, 253, 77, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(303, 253, 77, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(302, 253, 77, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(301, 253, 77, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(300, 253, 77, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(299, 253, 77, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(298, 253, 77, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(297, 253, 77, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(296, 253, 77, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(295, 253, 77, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(294, 253, 77, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(293, 253, 77, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(316, 254, 78, 11, 59, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(315, 254, 78, 11, 60, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(314, 254, 78, 11, 58, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(313, 254, 78, 11, 46, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(312, 254, 78, 11, 47, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(311, 254, 78, 11, 48, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(310, 254, 78, 11, 51, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(309, 254, 78, 11, 52, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(308, 254, 78, 11, 53, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(307, 254, 78, 11, 55, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(306, 254, 78, 11, 56, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(305, 254, 78, 11, 57, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(328, 255, 79, 11, 59, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(327, 255, 79, 11, 60, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(326, 255, 79, 11, 58, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(325, 255, 79, 11, 46, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(324, 255, 79, 11, 47, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(323, 255, 79, 11, 48, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(322, 255, 79, 11, 51, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(321, 255, 79, 11, 52, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(320, 255, 79, 11, 53, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(319, 255, 79, 11, 55, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(318, 255, 79, 11, 56, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(317, 255, 79, 11, 57, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(340, 256, 80, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(339, 256, 80, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(338, 256, 80, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(337, 256, 80, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(336, 256, 80, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(335, 256, 80, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(334, 256, 80, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(333, 256, 80, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(332, 256, 80, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(331, 256, 80, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(330, 256, 80, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(329, 256, 80, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(352, 257, 81, 11, 57, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(351, 257, 81, 11, 56, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(350, 257, 81, 11, 55, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(349, 257, 81, 11, 53, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(348, 257, 81, 11, 52, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(347, 257, 81, 11, 51, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(346, 257, 81, 11, 48, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(345, 257, 81, 11, 47, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(344, 257, 81, 11, 46, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(343, 257, 81, 11, 58, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(342, 257, 81, 11, 60, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(341, 257, 81, 11, 59, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(364, 258, 82, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(363, 258, 82, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(362, 258, 82, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(361, 258, 82, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(360, 258, 82, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(359, 258, 82, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(358, 258, 82, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(357, 258, 82, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(356, 258, 82, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(355, 258, 82, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(354, 258, 82, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(353, 258, 82, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(376, 259, 83, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(375, 259, 83, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(374, 259, 83, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(373, 259, 83, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(372, 259, 83, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(371, 259, 83, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(370, 259, 83, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(369, 259, 83, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(368, 259, 83, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(367, 259, 83, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(366, 259, 83, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(365, 259, 83, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(388, 260, 84, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(387, 260, 84, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(386, 260, 84, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(385, 260, 84, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(384, 260, 84, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(383, 260, 84, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(382, 260, 84, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(381, 260, 84, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(380, 260, 84, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(379, 260, 84, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(378, 260, 84, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(377, 260, 84, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(400, 261, 85, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(399, 261, 85, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(398, 261, 85, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(397, 261, 85, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(396, 261, 85, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(395, 261, 85, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(394, 261, 85, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(393, 261, 85, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(392, 261, 85, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(391, 261, 85, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(390, 261, 85, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(389, 261, 85, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(412, 262, 86, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(411, 262, 86, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(410, 262, 86, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(409, 262, 86, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(408, 262, 86, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(407, 262, 86, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(406, 262, 86, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(405, 262, 86, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(404, 262, 86, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(403, 262, 86, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(402, 262, 86, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(401, 262, 86, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(437, 265, 89, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(424, 263, 87, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(423, 263, 87, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(422, 263, 87, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(421, 263, 87, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(420, 263, 87, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(419, 263, 87, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(418, 263, 87, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(417, 263, 87, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(416, 263, 87, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(415, 263, 87, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(413, 263, 87, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(414, 263, 87, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(447, 265, 89, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(446, 265, 89, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(445, 265, 89, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(444, 265, 89, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(443, 265, 89, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(442, 265, 89, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(441, 265, 89, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(440, 265, 89, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(439, 265, 89, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(438, 265, 89, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(448, 265, 89, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(460, 266, 90, 11, 60, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(459, 266, 90, 11, 59, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(458, 266, 90, 11, 58, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(457, 266, 90, 11, 46, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(456, 266, 90, 11, 47, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(455, 266, 90, 11, 48, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(454, 266, 90, 11, 51, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(453, 266, 90, 11, 52, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(452, 266, 90, 11, 53, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(451, 266, 90, 11, 55, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(450, 266, 90, 11, 56, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(449, 266, 90, 11, 57, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(472, 267, 91, 11, 60, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(471, 267, 91, 11, 59, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(470, 267, 91, 11, 58, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(469, 267, 91, 11, 46, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(468, 267, 91, 11, 47, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(467, 267, 91, 11, 48, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(466, 267, 91, 11, 51, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(465, 267, 91, 11, 52, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(464, 267, 91, 11, 53, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(463, 267, 91, 11, 55, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(462, 267, 91, 11, 56, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(461, 267, 91, 11, 57, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(484, 268, 92, 11, 60, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(483, 268, 92, 11, 59, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(482, 268, 92, 11, 58, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(481, 268, 92, 11, 46, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(480, 268, 92, 11, 47, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(479, 268, 92, 11, 48, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(478, 268, 92, 11, 51, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(477, 268, 92, 11, 52, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(476, 268, 92, 11, 53, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(475, 268, 92, 11, 55, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(474, 268, 92, 11, 56, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(473, 268, 92, 11, 57, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(496, 269, 93, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(495, 269, 93, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(494, 269, 93, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(493, 269, 93, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(492, 269, 93, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(491, 269, 93, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(490, 269, 93, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(489, 269, 93, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(488, 269, 93, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(487, 269, 93, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(486, 269, 93, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(485, 269, 93, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(508, 270, 94, 11, 57, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(507, 270, 94, 11, 56, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(506, 270, 94, 11, 55, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(505, 270, 94, 11, 53, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(504, 270, 94, 11, 52, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(503, 270, 94, 11, 51, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(502, 270, 94, 11, 48, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(501, 270, 94, 11, 47, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(500, 270, 94, 11, 46, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(499, 270, 94, 11, 58, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(498, 270, 94, 11, 59, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(497, 270, 94, 11, 60, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(520, 271, 95, 11, 57, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(519, 271, 95, 11, 56, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(518, 271, 95, 11, 55, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(517, 271, 95, 11, 53, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(516, 271, 95, 11, 52, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(515, 271, 95, 11, 51, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(514, 271, 95, 11, 48, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(513, 271, 95, 11, 47, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(512, 271, 95, 11, 46, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(511, 271, 95, 11, 58, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(510, 271, 95, 11, 59, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(509, 271, 95, 11, 60, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(532, 272, 96, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(531, 272, 96, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(530, 272, 96, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(529, 272, 96, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(528, 272, 96, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(527, 272, 96, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(526, 272, 96, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(525, 272, 96, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(524, 272, 96, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(523, 272, 96, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(522, 272, 96, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(521, 272, 96, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(544, 273, 97, 11, 57, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(543, 273, 97, 11, 56, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(542, 273, 97, 11, 55, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(541, 273, 97, 11, 53, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(540, 273, 97, 11, 52, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(539, 273, 97, 11, 51, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(538, 273, 97, 11, 48, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(537, 273, 97, 11, 47, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(536, 273, 97, 11, 46, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(535, 273, 97, 11, 58, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(534, 273, 97, 11, 59, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(533, 273, 97, 11, 60, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(556, 274, 98, 11, 57, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(555, 274, 98, 11, 56, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(554, 274, 98, 11, 55, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(553, 274, 98, 11, 53, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(552, 274, 98, 11, 52, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(551, 274, 98, 11, 51, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(550, 274, 98, 11, 48, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(549, 274, 98, 11, 47, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(548, 274, 98, 11, 46, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(547, 274, 98, 11, 58, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(546, 274, 98, 11, 59, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(545, 274, 98, 11, 60, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(568, 275, 99, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(567, 275, 99, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(566, 275, 99, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(565, 275, 99, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(564, 275, 99, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(563, 275, 99, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(562, 275, 99, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(561, 275, 99, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(560, 275, 99, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(559, 275, 99, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(558, 275, 99, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(557, 275, 99, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(580, 276, 100, 11, 57, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(579, 276, 100, 11, 56, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(578, 276, 100, 11, 55, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(577, 276, 100, 11, 53, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(576, 276, 100, 11, 52, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(575, 276, 100, 11, 51, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(574, 276, 100, 11, 48, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(573, 276, 100, 11, 47, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(572, 276, 100, 11, 46, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(571, 276, 100, 11, 58, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(570, 276, 100, 11, 59, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(569, 276, 100, 11, 60, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(592, 277, 101, 11, 57, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(591, 277, 101, 11, 56, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(590, 277, 101, 11, 55, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(589, 277, 101, 11, 53, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(588, 277, 101, 11, 52, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(587, 277, 101, 11, 51, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(586, 277, 101, 11, 48, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(585, 277, 101, 11, 47, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(584, 277, 101, 11, 46, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(583, 277, 101, 11, 58, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(582, 277, 101, 11, 59, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(581, 277, 101, 11, 60, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(604, 278, 102, 11, 57, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(603, 278, 102, 11, 56, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(602, 278, 102, 11, 55, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(601, 278, 102, 11, 53, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(600, 278, 102, 11, 52, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(599, 278, 102, 11, 51, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(598, 278, 102, 11, 48, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(597, 278, 102, 11, 47, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(596, 278, 102, 11, 46, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(595, 278, 102, 11, 58, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(594, 278, 102, 11, 59, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(593, 278, 102, 11, 60, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(616, 279, 103, 11, 57, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(615, 279, 103, 11, 56, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(614, 279, 103, 11, 55, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(613, 279, 103, 11, 53, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(612, 279, 103, 11, 52, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(611, 279, 103, 11, 51, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(610, 279, 103, 11, 48, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(609, 279, 103, 11, 47, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(608, 279, 103, 11, 46, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(607, 279, 103, 11, 58, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(606, 279, 103, 11, 59, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(605, 279, 103, 11, 60, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(628, 280, 104, 11, 57, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(627, 280, 104, 11, 56, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(626, 280, 104, 11, 55, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(625, 280, 104, 11, 53, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(624, 280, 104, 11, 52, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(623, 280, 104, 11, 51, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(622, 280, 104, 11, 48, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(621, 280, 104, 11, 47, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(620, 280, 104, 11, 46, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(619, 280, 104, 11, 58, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(618, 280, 104, 11, 59, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(617, 280, 104, 11, 60, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(664, 283, 107, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(663, 283, 107, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(657, 283, 107, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(658, 283, 107, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(640, 281, 105, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(639, 281, 105, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(638, 281, 105, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(637, 281, 105, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(636, 281, 105, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(635, 281, 105, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(634, 281, 105, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(633, 281, 105, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(629, 281, 105, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(630, 281, 105, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(631, 281, 105, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(632, 281, 105, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(659, 283, 107, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(660, 283, 107, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(661, 283, 107, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(662, 283, 107, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(653, 283, 107, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(654, 283, 107, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(655, 283, 107, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(656, 283, 107, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(676, 284, 108, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(675, 284, 108, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(674, 284, 108, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(673, 284, 108, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(672, 284, 108, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(671, 284, 108, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(670, 284, 108, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(669, 284, 108, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(668, 284, 108, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(667, 284, 108, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(666, 284, 108, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(665, 284, 108, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(688, 285, 109, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(687, 285, 109, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(686, 285, 109, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(685, 285, 109, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(684, 285, 109, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(683, 285, 109, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(682, 285, 109, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(681, 285, 109, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(680, 285, 109, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(679, 285, 109, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(678, 285, 109, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(677, 285, 109, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(700, 286, 110, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(699, 286, 110, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(698, 286, 110, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(697, 286, 110, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(696, 286, 110, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(695, 286, 110, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(694, 286, 110, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(693, 286, 110, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(692, 286, 110, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(691, 286, 110, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(690, 286, 110, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(689, 286, 110, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(712, 287, 111, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(711, 287, 111, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(710, 287, 111, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(709, 287, 111, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(708, 287, 111, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(707, 287, 111, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(706, 287, 111, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(705, 287, 111, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(704, 287, 111, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(703, 287, 111, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(702, 287, 111, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(701, 287, 111, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(713, 288, 112, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(714, 288, 112, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(715, 288, 112, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(716, 288, 112, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(717, 288, 112, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(718, 288, 112, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(719, 288, 112, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(720, 288, 112, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(721, 288, 112, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(722, 288, 112, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(723, 288, 112, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(724, 288, 112, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(736, 289, 113, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(735, 289, 113, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(734, 289, 113, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(733, 289, 113, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(732, 289, 113, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(731, 289, 113, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(730, 289, 113, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(729, 289, 113, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(728, 289, 113, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(727, 289, 113, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(726, 289, 113, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(725, 289, 113, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(748, 290, 114, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(747, 290, 114, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(746, 290, 114, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(745, 290, 114, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(744, 290, 114, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(743, 290, 114, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(742, 290, 114, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(741, 290, 114, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(740, 290, 114, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(739, 290, 114, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(738, 290, 114, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(737, 290, 114, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(760, 291, 115, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(759, 291, 115, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(758, 291, 115, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(757, 291, 115, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(756, 291, 115, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(755, 291, 115, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(754, 291, 115, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(753, 291, 115, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(752, 291, 115, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(751, 291, 115, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(750, 291, 115, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(749, 291, 115, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(772, 292, 116, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(771, 292, 116, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(770, 292, 116, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(769, 292, 116, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(768, 292, 116, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(767, 292, 116, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(766, 292, 116, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(765, 292, 116, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(764, 292, 116, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(763, 292, 116, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(762, 292, 116, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(761, 292, 116, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(784, 293, 117, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(783, 293, 117, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(782, 293, 117, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(781, 293, 117, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(780, 293, 117, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(779, 293, 117, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(778, 293, 117, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(777, 293, 117, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(776, 293, 117, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(775, 293, 117, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(774, 293, 117, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(773, 293, 117, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(796, 294, 118, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(795, 294, 118, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(794, 294, 118, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(793, 294, 118, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(792, 294, 118, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(791, 294, 118, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(790, 294, 118, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(789, 294, 118, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(788, 294, 118, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(787, 294, 118, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(786, 294, 118, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(785, 294, 118, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(808, 295, 119, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(807, 295, 119, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(806, 295, 119, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(805, 295, 119, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(804, 295, 119, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(803, 295, 119, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(802, 295, 119, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(801, 295, 119, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(800, 295, 119, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(799, 295, 119, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(798, 295, 119, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(797, 295, 119, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(820, 296, 120, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(819, 296, 120, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(818, 296, 120, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(817, 296, 120, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(816, 296, 120, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(815, 296, 120, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(814, 296, 120, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(813, 296, 120, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(812, 296, 120, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(811, 296, 120, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(810, 296, 120, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(809, 296, 120, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(832, 297, 121, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(831, 297, 121, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(830, 297, 121, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(829, 297, 121, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(828, 297, 121, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(827, 297, 121, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(826, 297, 121, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(825, 297, 121, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(824, 297, 121, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(823, 297, 121, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(822, 297, 121, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(821, 297, 121, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(844, 298, 122, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(843, 298, 122, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(842, 298, 122, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(841, 298, 122, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(840, 298, 122, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(839, 298, 122, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(838, 298, 122, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(837, 298, 122, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(836, 298, 122, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(835, 298, 122, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(834, 298, 122, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(833, 298, 122, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(845, 299, 123, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(846, 299, 123, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(847, 299, 123, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(848, 299, 123, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(849, 299, 123, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(850, 299, 123, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(851, 299, 123, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(852, 299, 123, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(853, 299, 123, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(854, 299, 123, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(855, 299, 123, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(856, 299, 123, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(868, 300, 124, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(867, 300, 124, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(866, 300, 124, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(865, 300, 124, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(864, 300, 124, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(863, 300, 124, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(862, 300, 124, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(861, 300, 124, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(860, 300, 124, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(859, 300, 124, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(858, 300, 124, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(857, 300, 124, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(880, 301, 125, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(879, 301, 125, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(878, 301, 125, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(877, 301, 125, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(876, 301, 125, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(875, 301, 125, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(874, 301, 125, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(873, 301, 125, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(872, 301, 125, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(871, 301, 125, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(870, 301, 125, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(869, 301, 125, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(892, 302, 126, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(891, 302, 126, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(890, 302, 126, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(889, 302, 126, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(888, 302, 126, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(887, 302, 126, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(886, 302, 126, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(885, 302, 126, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(884, 302, 126, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(883, 302, 126, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(882, 302, 126, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(881, 302, 126, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(904, 303, 127, 11, 57, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(903, 303, 127, 11, 56, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(902, 303, 127, 11, 55, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(901, 303, 127, 11, 53, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(900, 303, 127, 11, 52, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(899, 303, 127, 11, 51, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(898, 303, 127, 11, 48, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(897, 303, 127, 11, 47, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(896, 303, 127, 11, 46, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(895, 303, 127, 11, 58, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(894, 303, 127, 11, 60, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(893, 303, 127, 11, 59, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(916, 304, 128, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(915, 304, 128, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(914, 304, 128, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(913, 304, 128, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(912, 304, 128, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(911, 304, 128, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(910, 304, 128, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(909, 304, 128, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(908, 304, 128, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(907, 304, 128, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(906, 304, 128, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(905, 304, 128, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(928, 305, 129, 11, 59, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(927, 305, 129, 11, 60, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(926, 305, 129, 11, 58, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(925, 305, 129, 11, 46, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(924, 305, 129, 11, 47, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(923, 305, 129, 11, 48, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(922, 305, 129, 11, 51, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(921, 305, 129, 11, 52, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(920, 305, 129, 11, 53, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(919, 305, 129, 11, 55, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(918, 305, 129, 11, 56, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(917, 305, 129, 11, 57, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(940, 306, 130, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(939, 306, 130, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(938, 306, 130, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(937, 306, 130, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(936, 306, 130, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(935, 306, 130, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(934, 306, 130, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(933, 306, 130, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(932, 306, 130, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(931, 306, 130, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(930, 306, 130, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(929, 306, 130, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(952, 307, 131, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(951, 307, 131, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(950, 307, 131, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(949, 307, 131, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(948, 307, 131, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(947, 307, 131, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(946, 307, 131, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(945, 307, 131, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(944, 307, 131, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(943, 307, 131, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(942, 307, 131, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(941, 307, 131, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(964, 308, 132, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(963, 308, 132, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(962, 308, 132, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(961, 308, 132, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(960, 308, 132, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(959, 308, 132, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(958, 308, 132, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(957, 308, 132, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(956, 308, 132, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(955, 308, 132, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(954, 308, 132, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(953, 308, 132, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(976, 309, 133, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(975, 309, 133, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(974, 309, 133, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(973, 309, 133, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(972, 309, 133, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(971, 309, 133, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(970, 309, 133, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(969, 309, 133, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(968, 309, 133, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(967, 309, 133, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(966, 309, 133, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(965, 309, 133, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(988, 310, 134, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(987, 310, 134, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(986, 310, 134, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(985, 310, 134, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(984, 310, 134, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(983, 310, 134, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(982, 310, 134, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(981, 310, 134, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(980, 310, 134, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(979, 310, 134, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(978, 310, 134, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(977, 310, 134, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1000, 311, 135, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(999, 311, 135, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(998, 311, 135, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(997, 311, 135, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(996, 311, 135, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(995, 311, 135, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(994, 311, 135, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(993, 311, 135, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(992, 311, 135, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(991, 311, 135, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(990, 311, 135, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(989, 311, 135, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1012, 312, 136, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1011, 312, 136, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1010, 312, 136, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1009, 312, 136, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1008, 312, 136, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1007, 312, 136, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1006, 312, 136, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1005, 312, 136, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1004, 312, 136, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1003, 312, 136, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1002, 312, 136, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1001, 312, 136, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1024, 313, 137, 11, 57, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(1023, 313, 137, 11, 56, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(1022, 313, 137, 11, 55, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1021, 313, 137, 11, 53, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1020, 313, 137, 11, 52, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1019, 313, 137, 11, 51, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1018, 313, 137, 11, 48, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(1017, 313, 137, 11, 47, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(1016, 313, 137, 11, 46, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1015, 313, 137, 11, 58, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1014, 313, 137, 11, 60, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1013, 313, 137, 11, 59, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1036, 314, 138, 11, 57, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(1035, 314, 138, 11, 56, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(1034, 314, 138, 11, 55, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1033, 314, 138, 11, 53, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1032, 314, 138, 11, 52, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1031, 314, 138, 11, 51, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1030, 314, 138, 11, 48, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(1029, 314, 138, 11, 47, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(1028, 314, 138, 11, 46, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1027, 314, 138, 11, 58, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1026, 314, 138, 11, 60, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1025, 314, 138, 11, 59, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1048, 315, 139, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1047, 315, 139, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1046, 315, 139, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1045, 315, 139, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1044, 315, 139, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1043, 315, 139, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1042, 315, 139, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1041, 315, 139, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1040, 315, 139, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1039, 315, 139, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1038, 315, 139, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1037, 315, 139, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1060, 316, 140, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1059, 316, 140, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1058, 316, 140, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1057, 316, 140, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1056, 316, 140, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1055, 316, 140, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1054, 316, 140, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1053, 316, 140, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1052, 316, 140, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1051, 316, 140, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1050, 316, 140, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1049, 316, 140, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1072, 317, 141, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1071, 317, 141, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1070, 317, 141, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1069, 317, 141, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1068, 317, 141, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1067, 317, 141, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1066, 317, 141, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1065, 317, 141, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1064, 317, 141, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1063, 317, 141, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1062, 317, 141, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1061, 317, 141, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1084, 318, 142, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1083, 318, 142, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1082, 318, 142, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1081, 318, 142, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1080, 318, 142, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1079, 318, 142, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1078, 318, 142, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1077, 318, 142, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1076, 318, 142, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1075, 318, 142, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1074, 318, 142, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1073, 318, 142, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1096, 319, 143, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1095, 319, 143, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1094, 319, 143, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1093, 319, 143, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1092, 319, 143, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1091, 319, 143, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1090, 319, 143, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1089, 319, 143, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1088, 319, 143, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1087, 319, 143, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1086, 319, 143, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1085, 319, 143, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1108, 320, 144, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1107, 320, 144, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1106, 320, 144, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1105, 320, 144, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1104, 320, 144, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1103, 320, 144, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1102, 320, 144, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1101, 320, 144, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1100, 320, 144, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1099, 320, 144, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1098, 320, 144, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1097, 320, 144, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1120, 321, 145, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1119, 321, 145, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1118, 321, 145, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1117, 321, 145, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1116, 321, 145, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1115, 321, 145, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1114, 321, 145, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1113, 321, 145, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1112, 321, 145, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1111, 321, 145, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1110, 321, 145, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1109, 321, 145, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1132, 322, 146, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1131, 322, 146, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1130, 322, 146, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1129, 322, 146, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1128, 322, 146, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1127, 322, 146, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1126, 322, 146, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1125, 322, 146, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1124, 322, 146, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1123, 322, 146, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1122, 322, 146, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1121, 322, 146, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1133, 323, 147, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1134, 323, 147, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1135, 323, 147, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1136, 323, 147, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1137, 323, 147, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1138, 323, 147, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1139, 323, 147, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1140, 323, 147, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1141, 323, 147, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1142, 323, 147, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1143, 323, 147, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1144, 323, 147, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1156, 324, 148, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1155, 324, 148, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1154, 324, 148, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1153, 324, 148, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1152, 324, 148, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1151, 324, 148, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1150, 324, 148, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1149, 324, 148, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1148, 324, 148, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1147, 324, 148, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1146, 324, 148, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1145, 324, 148, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1168, 325, 149, 11, 59, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1167, 325, 149, 11, 60, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1166, 325, 149, 11, 58, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1165, 325, 149, 11, 46, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1164, 325, 149, 11, 47, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(1163, 325, 149, 11, 48, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(1162, 325, 149, 11, 51, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1161, 325, 149, 11, 52, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1160, 325, 149, 11, 53, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1159, 325, 149, 11, 55, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1158, 325, 149, 11, 56, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(1157, 325, 149, 11, 57, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(1180, 326, 150, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1179, 326, 150, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1178, 326, 150, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1177, 326, 150, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1176, 326, 150, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1175, 326, 150, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1174, 326, 150, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1173, 326, 150, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1172, 326, 150, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1171, 326, 150, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1170, 326, 150, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1169, 326, 150, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1216, 329, 153, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1215, 329, 153, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1209, 329, 153, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1210, 329, 153, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1192, 327, 151, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1191, 327, 151, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1190, 327, 151, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1189, 327, 151, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1188, 327, 151, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1187, 327, 151, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1186, 327, 151, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1185, 327, 151, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1181, 327, 151, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1182, 327, 151, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1183, 327, 151, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1184, 327, 151, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1211, 329, 153, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1212, 329, 153, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1213, 329, 153, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1214, 329, 153, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1205, 329, 153, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1206, 329, 153, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1207, 329, 153, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1208, 329, 153, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1228, 330, 154, 11, 57, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1227, 330, 154, 11, 56, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1226, 330, 154, 11, 55, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1225, 330, 154, 11, 53, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1224, 330, 154, 11, 52, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1223, 330, 154, 11, 51, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1222, 330, 154, 11, 48, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1221, 330, 154, 11, 47, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1220, 330, 154, 11, 46, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1219, 330, 154, 11, 58, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1218, 330, 154, 11, 59, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1217, 330, 154, 11, 60, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1240, 331, 155, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1239, 331, 155, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1238, 331, 155, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1237, 331, 155, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1236, 331, 155, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1235, 331, 155, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1234, 331, 155, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1233, 331, 155, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1232, 331, 155, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1231, 331, 155, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1230, 331, 155, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1229, 331, 155, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1252, 332, 156, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1251, 332, 156, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1250, 332, 156, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1249, 332, 156, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1248, 332, 156, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1247, 332, 156, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1246, 332, 156, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1245, 332, 156, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1244, 332, 156, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1243, 332, 156, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1242, 332, 156, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1241, 332, 156, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1264, 333, 157, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1263, 333, 157, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1262, 333, 157, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1261, 333, 157, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1260, 333, 157, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1259, 333, 157, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1258, 333, 157, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1257, 333, 157, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1256, 333, 157, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1255, 333, 157, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1254, 333, 157, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1253, 333, 157, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1300, 336, 160, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1276, 334, 158, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1275, 334, 158, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1274, 334, 158, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1273, 334, 158, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1272, 334, 158, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1271, 334, 158, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1270, 334, 158, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1269, 334, 158, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1268, 334, 158, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1267, 334, 158, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1265, 334, 158, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1266, 334, 158, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1290, 336, 160, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1291, 336, 160, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1292, 336, 160, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1293, 336, 160, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1294, 336, 160, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1295, 336, 160, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1296, 336, 160, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1297, 336, 160, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1298, 336, 160, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1299, 336, 160, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1289, 336, 160, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1312, 337, 161, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1311, 337, 161, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1310, 337, 161, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1309, 337, 161, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1308, 337, 161, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1307, 337, 161, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1306, 337, 161, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1305, 337, 161, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1304, 337, 161, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1303, 337, 161, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1302, 337, 161, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1301, 337, 161, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1324, 338, 162, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1323, 338, 162, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1322, 338, 162, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1321, 338, 162, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1320, 338, 162, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1319, 338, 162, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1318, 338, 162, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1317, 338, 162, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1316, 338, 162, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1315, 338, 162, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1314, 338, 162, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1313, 338, 162, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1336, 339, 163, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1335, 339, 163, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1334, 339, 163, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1333, 339, 163, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1332, 339, 163, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1331, 339, 163, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1330, 339, 163, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1329, 339, 163, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1328, 339, 163, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1327, 339, 163, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1326, 339, 163, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1325, 339, 163, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1348, 340, 164, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1347, 340, 164, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1346, 340, 164, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1345, 340, 164, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1344, 340, 164, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1343, 340, 164, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1342, 340, 164, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1341, 340, 164, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1340, 340, 164, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1339, 340, 164, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1338, 340, 164, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1337, 340, 164, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1360, 341, 165, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1359, 341, 165, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1358, 341, 165, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1357, 341, 165, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1356, 341, 165, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1355, 341, 165, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1354, 341, 165, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1353, 341, 165, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1352, 341, 165, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1351, 341, 165, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1350, 341, 165, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1349, 341, 165, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1372, 342, 166, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1371, 342, 166, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1370, 342, 166, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1369, 342, 166, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1368, 342, 166, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1367, 342, 166, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1366, 342, 166, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1365, 342, 166, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1364, 342, 166, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1363, 342, 166, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1362, 342, 166, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1361, 342, 166, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1384, 343, 167, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1383, 343, 167, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1382, 343, 167, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1381, 343, 167, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1380, 343, 167, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1379, 343, 167, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1378, 343, 167, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1377, 343, 167, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1376, 343, 167, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1375, 343, 167, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1374, 343, 167, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1373, 343, 167, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1396, 344, 168, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1395, 344, 168, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1394, 344, 168, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1393, 344, 168, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1392, 344, 168, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1391, 344, 168, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1390, 344, 168, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1389, 344, 168, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1388, 344, 168, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1387, 344, 168, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1386, 344, 168, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1385, 344, 168, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1408, 345, 169, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1407, 345, 169, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1406, 345, 169, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1405, 345, 169, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1404, 345, 169, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1403, 345, 169, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1402, 345, 169, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1401, 345, 169, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1400, 345, 169, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1399, 345, 169, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1398, 345, 169, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1397, 345, 169, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1420, 346, 170, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1419, 346, 170, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1418, 346, 170, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1417, 346, 170, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1416, 346, 170, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1415, 346, 170, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1414, 346, 170, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1413, 346, 170, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1412, 346, 170, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1411, 346, 170, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1410, 346, 170, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1409, 346, 170, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1445, 349, 173, 11, 60, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1432, 347, 171, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1431, 347, 171, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1430, 347, 171, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1429, 347, 171, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1428, 347, 171, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1427, 347, 171, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1426, 347, 171, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1425, 347, 171, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1424, 347, 171, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1423, 347, 171, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1421, 347, 171, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1422, 347, 171, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1455, 349, 173, 11, 56, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1454, 349, 173, 11, 55, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1453, 349, 173, 11, 53, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1452, 349, 173, 11, 52, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1451, 349, 173, 11, 51, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1450, 349, 173, 11, 48, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1449, 349, 173, 11, 47, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1448, 349, 173, 11, 46, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1447, 349, 173, 11, 58, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1446, 349, 173, 11, 59, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1456, 349, 173, 11, 57, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1468, 350, 174, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1467, 350, 174, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1466, 350, 174, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1465, 350, 174, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1464, 350, 174, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1463, 350, 174, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1462, 350, 174, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1461, 350, 174, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1460, 350, 174, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1459, 350, 174, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1458, 350, 174, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1457, 350, 174, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1480, 351, 175, 11, 57, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(1479, 351, 175, 11, 56, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(1478, 351, 175, 11, 55, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1477, 351, 175, 11, 53, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1476, 351, 175, 11, 52, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1475, 351, 175, 11, 51, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1474, 351, 175, 11, 48, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(1473, 351, 175, 11, 47, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(1472, 351, 175, 11, 46, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1471, 351, 175, 11, 58, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1470, 351, 175, 11, 60, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1469, 351, 175, 11, 59, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1492, 352, 176, 11, 60, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1491, 352, 176, 11, 56, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1490, 352, 176, 11, 55, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1489, 352, 176, 11, 53, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1488, 352, 176, 11, 52, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1487, 352, 176, 11, 51, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1486, 352, 176, 11, 48, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1485, 352, 176, 11, 47, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1484, 352, 176, 11, 46, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1483, 352, 176, 11, 58, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1482, 352, 176, 11, 59, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1481, 352, 176, 11, 57, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(1504, 353, 177, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1503, 353, 177, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1502, 353, 177, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1501, 353, 177, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1500, 353, 177, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1499, 353, 177, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1498, 353, 177, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1497, 353, 177, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1496, 353, 177, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1495, 353, 177, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1494, 353, 177, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1493, 353, 177, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1516, 354, 178, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1515, 354, 178, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1514, 354, 178, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1513, 354, 178, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1512, 354, 178, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1511, 354, 178, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1510, 354, 178, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1509, 354, 178, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1508, 354, 178, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1507, 354, 178, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1506, 354, 178, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1505, 354, 178, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1528, 355, 179, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1527, 355, 179, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1526, 355, 179, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1525, 355, 179, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1524, 355, 179, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1523, 355, 179, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1522, 355, 179, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1521, 355, 179, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1520, 355, 179, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1519, 355, 179, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1518, 355, 179, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1517, 355, 179, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1540, 356, 180, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1539, 356, 180, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1538, 356, 180, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1537, 356, 180, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1536, 356, 180, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1535, 356, 180, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1534, 356, 180, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1533, 356, 180, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1532, 356, 180, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1531, 356, 180, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1530, 356, 180, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1529, 356, 180, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1552, 357, 181, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1551, 357, 181, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1550, 357, 181, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1549, 357, 181, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1548, 357, 181, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1547, 357, 181, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1546, 357, 181, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1545, 357, 181, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1544, 357, 181, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1543, 357, 181, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1542, 357, 181, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1541, 357, 181, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1564, 358, 182, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(1563, 358, 182, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1562, 358, 182, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1561, 358, 182, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1560, 358, 182, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1559, 358, 182, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1558, 358, 182, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1557, 358, 182, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1556, 358, 182, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1555, 358, 182, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1554, 358, 182, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1553, 358, 182, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1576, 359, 183, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1575, 359, 183, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1574, 359, 183, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1573, 359, 183, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1572, 359, 183, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1571, 359, 183, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1570, 359, 183, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1569, 359, 183, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1568, 359, 183, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1567, 359, 183, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1566, 359, 183, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1565, 359, 183, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1588, 360, 184, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1587, 360, 184, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1586, 360, 184, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1585, 360, 184, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1584, 360, 184, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1583, 360, 184, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1582, 360, 184, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1581, 360, 184, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1580, 360, 184, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1579, 360, 184, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1578, 360, 184, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1577, 360, 184, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1600, 361, 185, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1599, 361, 185, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1598, 361, 185, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1597, 361, 185, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1596, 361, 185, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1595, 361, 185, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1594, 361, 185, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1593, 361, 185, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1592, 361, 185, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1591, 361, 185, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1590, 361, 185, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1589, 361, 185, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1612, 362, 186, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1611, 362, 186, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1610, 362, 186, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1609, 362, 186, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1608, 362, 186, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1607, 362, 186, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1606, 362, 186, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1605, 362, 186, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1604, 362, 186, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1603, 362, 186, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1602, 362, 186, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1601, 362, 186, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1624, 363, 187, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1623, 363, 187, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1622, 363, 187, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1621, 363, 187, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1620, 363, 187, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1619, 363, 187, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1618, 363, 187, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1617, 363, 187, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1616, 363, 187, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1615, 363, 187, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1614, 363, 187, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1613, 363, 187, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1636, 364, 188, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1635, 364, 188, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1634, 364, 188, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1633, 364, 188, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1632, 364, 188, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1631, 364, 188, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1630, 364, 188, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1629, 364, 188, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1628, 364, 188, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1627, 364, 188, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1626, 364, 188, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1625, 364, 188, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1648, 365, 189, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1647, 365, 189, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1646, 365, 189, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1645, 365, 189, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1644, 365, 189, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1643, 365, 189, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1642, 365, 189, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1641, 365, 189, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1640, 365, 189, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1639, 365, 189, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1638, 365, 189, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1637, 365, 189, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1660, 366, 190, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1659, 366, 190, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1658, 366, 190, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1657, 366, 190, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1656, 366, 190, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1655, 366, 190, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1654, 366, 190, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1653, 366, 190, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1652, 366, 190, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1651, 366, 190, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1650, 366, 190, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1649, 366, 190, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1672, 367, 191, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1671, 367, 191, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1670, 367, 191, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1669, 367, 191, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1668, 367, 191, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1667, 367, 191, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1666, 367, 191, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1665, 367, 191, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1664, 367, 191, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1663, 367, 191, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1662, 367, 191, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1661, 367, 191, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1684, 368, 192, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1683, 368, 192, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1682, 368, 192, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1681, 368, 192, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1680, 368, 192, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1679, 368, 192, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1678, 368, 192, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1677, 368, 192, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1676, 368, 192, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1675, 368, 192, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1674, 368, 192, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1673, 368, 192, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1696, 369, 193, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1695, 369, 193, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1694, 369, 193, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1693, 369, 193, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1692, 369, 193, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1691, 369, 193, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1690, 369, 193, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1689, 369, 193, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1688, 369, 193, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1687, 369, 193, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1686, 369, 193, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1685, 369, 193, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1708, 370, 194, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1707, 370, 194, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1706, 370, 194, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1705, 370, 194, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1704, 370, 194, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1703, 370, 194, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1702, 370, 194, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1701, 370, 194, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1700, 370, 194, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1699, 370, 194, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1698, 370, 194, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1697, 370, 194, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1720, 371, 195, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1719, 371, 195, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1718, 371, 195, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1717, 371, 195, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1716, 371, 195, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1715, 371, 195, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1714, 371, 195, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1713, 371, 195, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1712, 371, 195, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1711, 371, 195, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1710, 371, 195, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1709, 371, 195, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1732, 372, 196, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1731, 372, 196, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1730, 372, 196, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1729, 372, 196, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1728, 372, 196, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1727, 372, 196, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1726, 372, 196, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1725, 372, 196, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1724, 372, 196, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1723, 372, 196, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1722, 372, 196, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1721, 372, 196, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1744, 373, 197, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1743, 373, 197, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1742, 373, 197, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1741, 373, 197, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1740, 373, 197, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1739, 373, 197, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1738, 373, 197, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1737, 373, 197, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1736, 373, 197, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1735, 373, 197, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1734, 373, 197, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1733, 373, 197, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1756, 374, 198, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1755, 374, 198, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1754, 374, 198, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1753, 374, 198, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1752, 374, 198, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1751, 374, 198, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1750, 374, 198, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1749, 374, 198, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1748, 374, 198, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1747, 374, 198, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1746, 374, 198, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1745, 374, 198, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1781, 377, 201, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1782, 377, 201, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1783, 377, 201, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1784, 377, 201, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1785, 377, 201, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1786, 377, 201, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1787, 377, 201, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1788, 377, 201, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1789, 377, 201, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1790, 377, 201, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1791, 377, 201, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1792, 377, 201, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1804, 378, 202, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1803, 378, 202, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1802, 378, 202, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1801, 378, 202, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1800, 378, 202, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1799, 378, 202, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1798, 378, 202, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1797, 378, 202, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1796, 378, 202, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1795, 378, 202, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1794, 378, 202, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1793, 378, 202, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1816, 379, 203, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1815, 379, 203, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1814, 379, 203, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1813, 379, 203, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1812, 379, 203, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1811, 379, 203, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1810, 379, 203, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1809, 379, 203, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1808, 379, 203, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1807, 379, 203, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1806, 379, 203, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1805, 379, 203, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1828, 380, 204, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1827, 380, 204, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1826, 380, 204, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1825, 380, 204, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1824, 380, 204, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1823, 380, 204, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1822, 380, 204, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1821, 380, 204, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1820, 380, 204, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1819, 380, 204, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1818, 380, 204, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1817, 380, 204, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1840, 381, 205, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1839, 381, 205, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1838, 381, 205, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1837, 381, 205, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1836, 381, 205, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1835, 381, 205, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1834, 381, 205, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1833, 381, 205, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1832, 381, 205, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1831, 381, 205, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1830, 381, 205, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1829, 381, 205, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1852, 382, 206, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1851, 382, 206, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1850, 382, 206, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1849, 382, 206, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1848, 382, 206, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1847, 382, 206, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1846, 382, 206, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1845, 382, 206, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(1844, 382, 206, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1843, 382, 206, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1842, 382, 206, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1841, 382, 206, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(1864, 383, 207, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1863, 383, 207, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1862, 383, 207, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1861, 383, 207, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1860, 383, 207, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1859, 383, 207, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1858, 383, 207, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1857, 383, 207, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1856, 383, 207, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1855, 383, 207, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1854, 383, 207, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1853, 383, 207, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1876, 384, 208, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1875, 384, 208, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1874, 384, 208, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1873, 384, 208, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1872, 384, 208, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1871, 384, 208, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1870, 384, 208, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1869, 384, 208, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1868, 384, 208, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1867, 384, 208, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1866, 384, 208, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1865, 384, 208, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1888, 385, 209, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1887, 385, 209, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1886, 385, 209, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1885, 385, 209, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1884, 385, 209, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1883, 385, 209, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1882, 385, 209, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1881, 385, 209, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1880, 385, 209, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1879, 385, 209, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1878, 385, 209, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1877, 385, 209, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1900, 386, 210, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1899, 386, 210, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1898, 386, 210, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1897, 386, 210, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1896, 386, 210, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1895, 386, 210, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1894, 386, 210, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1893, 386, 210, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1892, 386, 210, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1891, 386, 210, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1890, 386, 210, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1889, 386, 210, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1912, 387, 211, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1911, 387, 211, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1910, 387, 211, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1909, 387, 211, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1908, 387, 211, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1907, 387, 211, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1906, 387, 211, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1905, 387, 211, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1904, 387, 211, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1903, 387, 211, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1902, 387, 211, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1901, 387, 211, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1924, 388, 212, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1923, 388, 212, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1922, 388, 212, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1921, 388, 212, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1920, 388, 212, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1919, 388, 212, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1918, 388, 212, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1917, 388, 212, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1916, 388, 212, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1915, 388, 212, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1914, 388, 212, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1913, 388, 212, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1936, 389, 213, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1935, 389, 213, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1934, 389, 213, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1933, 389, 213, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1932, 389, 213, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1931, 389, 213, 11, 51, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1930, 389, 213, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1929, 389, 213, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1928, 389, 213, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1927, 389, 213, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1926, 389, 213, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1925, 389, 213, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1948, 390, 214, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1947, 390, 214, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1946, 390, 214, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1945, 390, 214, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1944, 390, 214, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1943, 390, 214, 11, 51, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1942, 390, 214, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1941, 390, 214, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1940, 390, 214, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1939, 390, 214, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1938, 390, 214, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1937, 390, 214, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1960, 391, 215, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1959, 391, 215, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1958, 391, 215, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1957, 391, 215, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1956, 391, 215, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1955, 391, 215, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1954, 391, 215, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1953, 391, 215, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1952, 391, 215, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1951, 391, 215, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1950, 391, 215, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1949, 391, 215, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1972, 392, 216, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1971, 392, 216, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1970, 392, 216, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1969, 392, 216, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1968, 392, 216, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1967, 392, 216, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1966, 392, 216, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1965, 392, 216, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1964, 392, 216, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1963, 392, 216, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1962, 392, 216, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1961, 392, 216, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1984, 393, 217, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1983, 393, 217, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1982, 393, 217, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1981, 393, 217, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1980, 393, 217, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1979, 393, 217, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1978, 393, 217, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1977, 393, 217, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1976, 393, 217, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1975, 393, 217, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1974, 393, 217, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1973, 393, 217, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1996, 394, 218, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1995, 394, 218, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1994, 394, 218, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1993, 394, 218, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1992, 394, 218, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1991, 394, 218, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1990, 394, 218, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1989, 394, 218, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1988, 394, 218, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1987, 394, 218, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1986, 394, 218, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1985, 394, 218, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2008, 395, 219, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2007, 395, 219, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2006, 395, 219, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2005, 395, 219, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2004, 395, 219, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2003, 395, 219, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2002, 395, 219, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2001, 395, 219, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2000, 395, 219, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1999, 395, 219, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(1998, 395, 219, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(1997, 395, 219, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2020, 396, 220, 11, 57, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2019, 396, 220, 11, 56, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2018, 396, 220, 11, 55, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2017, 396, 220, 11, 53, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2016, 396, 220, 11, 52, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2015, 396, 220, 11, 51, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2014, 396, 220, 11, 48, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2013, 396, 220, 11, 47, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2012, 396, 220, 11, 46, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2011, 396, 220, 11, 58, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2010, 396, 220, 11, 60, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2009, 396, 220, 11, 59, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2032, 397, 221, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2031, 397, 221, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2030, 397, 221, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2029, 397, 221, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2028, 397, 221, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2027, 397, 221, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2026, 397, 221, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2025, 397, 221, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2024, 397, 221, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2023, 397, 221, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2022, 397, 221, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2021, 397, 221, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2044, 398, 222, 11, 57, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(2043, 398, 222, 11, 56, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(2042, 398, 222, 11, 55, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(2041, 398, 222, 11, 53, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(2040, 398, 222, 11, 52, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(2039, 398, 222, 11, 51, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(2038, 398, 222, 11, 48, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2037, 398, 222, 11, 47, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2036, 398, 222, 11, 46, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(2035, 398, 222, 11, 58, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(2034, 398, 222, 11, 59, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(2033, 398, 222, 11, 60, 30, 1, 20.9900, '+', 0, '+', 0.00000000, '+'),
(2056, 399, 223, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2055, 399, 223, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2054, 399, 223, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2053, 399, 223, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2052, 399, 223, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2051, 399, 223, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2050, 399, 223, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2049, 399, 223, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2048, 399, 223, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2047, 399, 223, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2046, 399, 223, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2045, 399, 223, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2068, 400, 224, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2067, 400, 224, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2066, 400, 224, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2065, 400, 224, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2064, 400, 224, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2063, 400, 224, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2062, 400, 224, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2061, 400, 224, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2060, 400, 224, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2059, 400, 224, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2058, 400, 224, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2057, 400, 224, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2080, 401, 225, 11, 60, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2079, 401, 225, 11, 59, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2078, 401, 225, 11, 58, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2077, 401, 225, 11, 46, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2076, 401, 225, 11, 47, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2075, 401, 225, 11, 48, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2074, 401, 225, 11, 51, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2073, 401, 225, 11, 52, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2072, 401, 225, 11, 53, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2071, 401, 225, 11, 55, 30, 1, 19.9900, '+', 0, '+', 0.00000000, '+'),
(2070, 401, 225, 11, 56, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2069, 401, 225, 11, 57, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2092, 402, 226, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(2091, 402, 226, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(2090, 402, 226, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2089, 402, 226, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2088, 402, 226, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2087, 402, 226, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2086, 402, 226, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(2085, 402, 226, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(2084, 402, 226, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2083, 402, 226, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2082, 402, 226, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2081, 402, 226, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2104, 403, 227, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(2103, 403, 227, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(2102, 403, 227, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2101, 403, 227, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2100, 403, 227, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2099, 403, 227, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2098, 403, 227, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(2097, 403, 227, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(2096, 403, 227, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2095, 403, 227, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2094, 403, 227, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2093, 403, 227, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2116, 404, 228, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2115, 404, 228, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2114, 404, 228, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2113, 404, 228, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2112, 404, 228, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(2111, 404, 228, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(2110, 404, 228, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2109, 404, 228, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2108, 404, 228, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2107, 404, 228, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2106, 404, 228, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(2105, 404, 228, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(2128, 405, 229, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(2127, 405, 229, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(2126, 405, 229, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2125, 405, 229, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2124, 405, 229, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2123, 405, 229, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2122, 405, 229, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(2121, 405, 229, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(2120, 405, 229, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2119, 405, 229, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2118, 405, 229, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2117, 405, 229, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2140, 406, 230, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(2139, 406, 230, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(2138, 406, 230, 11, 55, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2137, 406, 230, 11, 53, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2136, 406, 230, 11, 52, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2135, 406, 230, 11, 51, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2134, 406, 230, 11, 48, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(2133, 406, 230, 11, 47, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(2132, 406, 230, 11, 46, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2131, 406, 230, 11, 58, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2130, 406, 230, 11, 59, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2129, 406, 230, 11, 60, 30, 1, 22.9900, '+', 0, '+', 0.00000000, '+'),
(2154, 411, 232, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(2149, 409, 231, 14, 62, 0, 0, 0.0000, '+', 0, '+', 0.00000000, '+'),
(2148, 409, 231, 14, 63, 0, 0, 0.0000, '+', 0, '+', 0.00000000, '+'),
(2147, 409, 231, 14, 61, 0, 0, 0.0000, '+', 0, '+', 0.00000000, '+'),
(2143, 407, 231, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(2142, 407, 231, 11, 56, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(2141, 407, 231, 11, 55, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(2153, 411, 232, 11, 57, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(2152, 410, 232, 14, 61, 0, 0, 0.0000, '+', 0, '+', 0.00000000, '+'),
(2151, 410, 232, 14, 63, 0, 0, 0.0000, '+', 0, '+', 0.00000000, '+'),
(2150, 410, 232, 14, 62, 0, 0, 0.0000, '+', 0, '+', 0.00000000, '+'),
(2155, 411, 232, 11, 55, 30, 1, 24.9900, '+', 0, '+', 0.00000000, '+'),
(2179, 413, 234, 11, 59, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2178, 413, 234, 11, 60, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2177, 413, 234, 11, 58, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2176, 413, 234, 11, 46, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2175, 413, 234, 11, 47, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2174, 413, 234, 11, 48, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2173, 413, 234, 11, 51, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2172, 413, 234, 11, 52, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2171, 413, 234, 11, 53, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2170, 413, 234, 11, 55, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2169, 413, 234, 11, 56, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2168, 413, 234, 11, 57, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2191, 414, 235, 11, 59, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2190, 414, 235, 11, 60, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2189, 414, 235, 11, 58, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2188, 414, 235, 11, 46, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2187, 414, 235, 11, 47, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2186, 414, 235, 11, 48, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2185, 414, 235, 11, 51, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2184, 414, 235, 11, 52, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2183, 414, 235, 11, 53, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2182, 414, 235, 11, 55, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2181, 414, 235, 11, 56, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2180, 414, 235, 11, 57, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2216, 417, 238, 11, 57, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2217, 417, 238, 11, 56, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2218, 417, 238, 11, 55, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2219, 417, 238, 11, 53, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2220, 417, 238, 11, 52, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2221, 417, 238, 11, 51, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2222, 417, 238, 11, 48, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2223, 417, 238, 11, 47, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2224, 417, 238, 11, 46, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2225, 417, 238, 11, 58, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2226, 417, 238, 11, 60, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2227, 417, 238, 11, 59, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2215, 416, 237, 11, 59, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2214, 416, 237, 11, 60, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2213, 416, 237, 11, 58, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2212, 416, 237, 11, 46, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2211, 416, 237, 11, 47, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2210, 416, 237, 11, 48, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2209, 416, 237, 11, 51, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2208, 416, 237, 11, 52, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2207, 416, 237, 11, 53, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2206, 416, 237, 11, 55, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2205, 416, 237, 11, 56, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2204, 416, 237, 11, 57, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2239, 418, 239, 11, 59, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2238, 418, 239, 11, 60, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2237, 418, 239, 11, 58, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2236, 418, 239, 11, 46, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2235, 418, 239, 11, 47, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2234, 418, 239, 11, 48, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2233, 418, 239, 11, 51, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2232, 418, 239, 11, 52, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2231, 418, 239, 11, 53, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2230, 418, 239, 11, 55, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2229, 418, 239, 11, 56, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2228, 418, 239, 11, 57, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2251, 419, 240, 11, 59, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2250, 419, 240, 11, 60, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2249, 419, 240, 11, 58, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2248, 419, 240, 11, 46, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2247, 419, 240, 11, 47, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2246, 419, 240, 11, 48, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2245, 419, 240, 11, 51, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2244, 419, 240, 11, 52, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2243, 419, 240, 11, 53, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2242, 419, 240, 11, 55, 30, 1, 21.9900, '+', 0, '+', 0.00000000, '+'),
(2241, 419, 240, 11, 56, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2240, 419, 240, 11, 57, 30, 1, 23.9900, '+', 0, '+', 0.00000000, '+'),
(2264, 421, 241, 13, 49, 30, 1, 0.0300, '+', 0, '+', 0.00000000, '+');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_related`
--

CREATE TABLE IF NOT EXISTS `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_reward`
--

CREATE TABLE IF NOT EXISTS `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=546 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_special`
--

CREATE TABLE IF NOT EXISTS `oc_product_special` (
  `product_special_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM AUTO_INCREMENT=441 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_category`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_category`
--

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES
(55, 60),
(56, 60),
(57, 86),
(58, 60),
(59, 60),
(62, 60),
(63, 60),
(64, 60),
(65, 60),
(66, 80),
(67, 68),
(68, 68),
(69, 60),
(71, 60),
(73, 60),
(74, 60),
(75, 98),
(76, 60),
(77, 73),
(78, 60),
(79, 60),
(80, 60),
(81, 60),
(82, 60),
(83, 60),
(84, 60),
(85, 60),
(86, 60),
(87, 60),
(89, 60),
(90, 60),
(91, 60),
(92, 60),
(93, 60),
(94, 60),
(95, 60),
(96, 60),
(97, 60),
(98, 60),
(99, 60),
(100, 60),
(101, 60),
(102, 60),
(103, 60),
(104, 60),
(105, 60),
(107, 60),
(108, 60),
(109, 60),
(110, 60),
(111, 60),
(112, 60),
(113, 60),
(114, 60),
(115, 60),
(116, 60),
(117, 60),
(118, 60),
(119, 60),
(120, 60),
(121, 60),
(122, 71),
(123, 76),
(124, 71),
(125, 71),
(126, 71),
(127, 76),
(128, 76),
(129, 76),
(130, 76),
(131, 71),
(132, 76),
(133, 76),
(134, 71),
(135, 76),
(136, 76),
(137, 76),
(138, 76),
(139, 76),
(140, 71),
(141, 71),
(142, 71),
(143, 71),
(144, 71),
(145, 71),
(146, 71),
(147, 71),
(148, 71),
(149, 76),
(150, 71),
(151, 76),
(153, 71),
(154, 71),
(155, 76),
(156, 76),
(157, 71),
(158, 76),
(160, 71),
(161, 76),
(162, 76),
(163, 76),
(164, 76),
(165, 76),
(166, 76),
(167, 76),
(168, 76),
(169, 91),
(170, 67),
(171, 76),
(173, 70),
(174, 68),
(175, 92),
(176, 70),
(177, 84),
(178, 80),
(179, 71),
(180, 77),
(181, 76),
(182, 75),
(183, 74),
(184, 72),
(185, 71),
(186, 93),
(187, 83),
(188, 69),
(189, 68),
(190, 60),
(191, 67),
(192, 94),
(193, 66),
(194, 95),
(195, 96),
(196, 71),
(197, 76),
(198, 96),
(200, 82),
(201, 77),
(202, 77),
(202, 84),
(203, 70),
(204, 66),
(204, 93),
(205, 75),
(206, 67),
(207, 67),
(208, 97),
(209, 67),
(210, 75),
(211, 66),
(212, 70),
(213, 80),
(214, 80),
(215, 70),
(216, 75),
(217, 66),
(218, 67),
(219, 77),
(220, 98),
(221, 70),
(222, 66),
(223, 77),
(224, 78),
(225, 99),
(226, 84),
(227, 80),
(228, 67),
(229, 85),
(230, 65),
(231, 98),
(232, 98),
(233, 60),
(234, 98),
(235, 70),
(237, 66),
(237, 98),
(238, 83),
(238, 98),
(239, 67),
(239, 98),
(240, 95),
(240, 98),
(241, 98);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_download`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_layout`
--

INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(58, 0, 0),
(59, 0, 0),
(57, 0, 0),
(56, 0, 0),
(55, 0, 0),
(233, 0, 0),
(62, 0, 0),
(63, 0, 0),
(64, 0, 0),
(65, 0, 0),
(66, 0, 0),
(67, 0, 0),
(68, 0, 0),
(69, 0, 0),
(71, 0, 0),
(200, 0, 0),
(73, 0, 0),
(74, 0, 0),
(75, 0, 0),
(76, 0, 0),
(77, 0, 0),
(78, 0, 0),
(79, 0, 0),
(80, 0, 0),
(81, 0, 0),
(82, 0, 0),
(83, 0, 0),
(84, 0, 0),
(85, 0, 0),
(86, 0, 0),
(87, 0, 0),
(89, 0, 0),
(90, 0, 0),
(91, 0, 0),
(92, 0, 0),
(93, 0, 0),
(94, 0, 0),
(95, 0, 0),
(96, 0, 0),
(97, 0, 0),
(98, 0, 0),
(99, 0, 0),
(100, 0, 0),
(101, 0, 0),
(102, 0, 0),
(103, 0, 0),
(104, 0, 0),
(105, 0, 0),
(107, 0, 0),
(108, 0, 0),
(109, 0, 0),
(110, 0, 0),
(111, 0, 0),
(112, 0, 0),
(113, 0, 0),
(114, 0, 0),
(115, 0, 0),
(116, 0, 0),
(117, 0, 0),
(118, 0, 0),
(119, 0, 0),
(120, 0, 0),
(121, 0, 0),
(122, 0, 0),
(123, 0, 0),
(124, 0, 0),
(125, 0, 0),
(126, 0, 0),
(127, 0, 0),
(128, 0, 0),
(129, 0, 0),
(130, 0, 0),
(131, 0, 0),
(132, 0, 0),
(133, 0, 0),
(134, 0, 0),
(135, 0, 0),
(136, 0, 0),
(137, 0, 0),
(138, 0, 0),
(139, 0, 0),
(140, 0, 0),
(141, 0, 0),
(142, 0, 0),
(143, 0, 0),
(144, 0, 0),
(145, 0, 0),
(146, 0, 0),
(147, 0, 0),
(148, 0, 0),
(149, 0, 0),
(150, 0, 0),
(151, 0, 0),
(153, 0, 0),
(154, 0, 0),
(155, 0, 0),
(156, 0, 0),
(157, 0, 0),
(158, 0, 0),
(160, 0, 0),
(161, 0, 0),
(162, 0, 0),
(163, 0, 0),
(164, 0, 0),
(165, 0, 0),
(166, 0, 0),
(167, 0, 0),
(168, 0, 0),
(169, 0, 0),
(170, 0, 0),
(171, 0, 0),
(173, 0, 0),
(174, 0, 0),
(175, 0, 0),
(176, 0, 0),
(177, 0, 0),
(178, 0, 0),
(179, 0, 0),
(180, 0, 0),
(181, 0, 0),
(182, 0, 0),
(183, 0, 0),
(184, 0, 0),
(185, 0, 0),
(186, 0, 0),
(187, 0, 0),
(188, 0, 0),
(189, 0, 0),
(190, 0, 0),
(191, 0, 0),
(192, 0, 0),
(193, 0, 0),
(194, 0, 0),
(195, 0, 0),
(196, 0, 0),
(197, 0, 0),
(198, 0, 0),
(201, 0, 0),
(202, 0, 0),
(203, 0, 0),
(204, 0, 0),
(205, 0, 0),
(206, 0, 0),
(207, 0, 0),
(208, 0, 0),
(209, 0, 0),
(210, 0, 0),
(211, 0, 0),
(212, 0, 0),
(213, 0, 0),
(214, 0, 0),
(215, 0, 0),
(216, 0, 0),
(217, 0, 0),
(218, 0, 0),
(219, 0, 0),
(220, 0, 0),
(221, 0, 0),
(222, 0, 0),
(223, 0, 0),
(224, 0, 0),
(225, 0, 0),
(226, 0, 0),
(227, 0, 0),
(228, 0, 0),
(229, 0, 0),
(230, 0, 0),
(231, 0, 0),
(232, 0, 0),
(234, 0, 0),
(235, 0, 0),
(238, 0, 0),
(237, 0, 0),
(239, 0, 0),
(240, 0, 0),
(241, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(55, 0),
(56, 0),
(57, 0),
(58, 0),
(59, 0),
(62, 0),
(63, 0),
(64, 0),
(65, 0),
(66, 0),
(67, 0),
(68, 0),
(69, 0),
(71, 0),
(73, 0),
(74, 0),
(75, 0),
(76, 0),
(77, 0),
(78, 0),
(79, 0),
(80, 0),
(81, 0),
(82, 0),
(83, 0),
(84, 0),
(85, 0),
(86, 0),
(87, 0),
(89, 0),
(90, 0),
(91, 0),
(92, 0),
(93, 0),
(94, 0),
(95, 0),
(96, 0),
(97, 0),
(98, 0),
(99, 0),
(100, 0),
(101, 0),
(102, 0),
(103, 0),
(104, 0),
(105, 0),
(107, 0),
(108, 0),
(109, 0),
(110, 0),
(111, 0),
(112, 0),
(113, 0),
(114, 0),
(115, 0),
(116, 0),
(117, 0),
(118, 0),
(119, 0),
(120, 0),
(121, 0),
(122, 0),
(123, 0),
(124, 0),
(125, 0),
(126, 0),
(127, 0),
(128, 0),
(129, 0),
(130, 0),
(131, 0),
(132, 0),
(133, 0),
(134, 0),
(135, 0),
(136, 0),
(137, 0),
(138, 0),
(139, 0),
(140, 0),
(141, 0),
(142, 0),
(143, 0),
(144, 0),
(145, 0),
(146, 0),
(147, 0),
(148, 0),
(149, 0),
(150, 0),
(151, 0),
(153, 0),
(154, 0),
(155, 0),
(156, 0),
(157, 0),
(158, 0),
(160, 0),
(161, 0),
(162, 0),
(163, 0),
(164, 0),
(165, 0),
(166, 0),
(167, 0),
(168, 0),
(169, 0),
(170, 0),
(171, 0),
(173, 0),
(174, 0),
(175, 0),
(176, 0),
(177, 0),
(178, 0),
(179, 0),
(180, 0),
(181, 0),
(182, 0),
(183, 0),
(184, 0),
(185, 0),
(186, 0),
(187, 0),
(188, 0),
(189, 0),
(190, 0),
(191, 0),
(192, 0),
(193, 0),
(194, 0),
(195, 0),
(196, 0),
(197, 0),
(198, 0),
(200, 0),
(201, 0),
(202, 0),
(203, 0),
(204, 0),
(205, 0),
(206, 0),
(207, 0),
(208, 0),
(209, 0),
(210, 0),
(211, 0),
(212, 0),
(213, 0),
(214, 0),
(215, 0),
(216, 0),
(217, 0),
(218, 0),
(219, 0),
(220, 0),
(221, 0),
(222, 0),
(223, 0),
(224, 0),
(225, 0),
(226, 0),
(227, 0),
(228, 0),
(229, 0),
(230, 0),
(231, 0),
(232, 0),
(233, 0),
(234, 0),
(235, 0),
(237, 0),
(238, 0),
(239, 0),
(240, 0),
(241, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_recurring` (
  `recurring_id` int(11) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_recurring_description`
--

CREATE TABLE IF NOT EXISTS `oc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return`
--

CREATE TABLE IF NOT EXISTS `oc_return` (
  `return_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_action`
--

CREATE TABLE IF NOT EXISTS `oc_return_action` (
  `return_action_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_return_action`
--

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Refunded'),
(2, 1, 'Credit Issued'),
(3, 1, 'Replacement Sent');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_history`
--

CREATE TABLE IF NOT EXISTS `oc_return_history` (
  `return_history_id` int(11) NOT NULL,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_reason`
--

CREATE TABLE IF NOT EXISTS `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_return_reason`
--

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Dead On Arrival'),
(2, 1, 'Received Wrong Item'),
(3, 1, 'Order Error'),
(4, 1, 'Faulty, please supply details'),
(5, 1, 'Other, please supply details');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_status`
--

CREATE TABLE IF NOT EXISTS `oc_return_status` (
  `return_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_return_status`
--

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Pending'),
(3, 1, 'Complete'),
(2, 1, 'Awaiting Products');

-- --------------------------------------------------------

--
-- Table structure for table `oc_review`
--

CREATE TABLE IF NOT EXISTS `oc_review` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_setting`
--

CREATE TABLE IF NOT EXISTS `oc_setting` (
  `setting_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3450 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_setting`
--

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(1, 0, 'shipping', 'shipping_sort_order', '3', 0),
(2, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(3, 0, 'sub_total', 'sub_total_status', '1', 0),
(4, 0, 'tax', 'tax_status', '1', 0),
(5, 0, 'total', 'total_sort_order', '9', 0),
(6, 0, 'total', 'total_status', '1', 0),
(7, 0, 'tax', 'tax_sort_order', '5', 0),
(8, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(9, 0, 'cod', 'cod_sort_order', '5', 0),
(10, 0, 'cod', 'cod_total', '0.01', 0),
(11, 0, 'cod', 'cod_order_status_id', '1', 0),
(12, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(13, 0, 'cod', 'cod_status', '1', 0),
(14, 0, 'shipping', 'shipping_status', '1', 0),
(15, 0, 'shipping', 'shipping_estimator', '1', 0),
(27, 0, 'coupon', 'coupon_sort_order', '4', 0),
(28, 0, 'coupon', 'coupon_status', '1', 0),
(2447, 0, 'flat', 'flat_sort_order', '1', 0),
(2446, 0, 'flat', 'flat_status', '0', 0),
(2445, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(2444, 0, 'flat', 'flat_tax_class_id', '9', 0),
(2443, 0, 'flat', 'flat_cost', '5.00', 0),
(42, 0, 'credit', 'credit_sort_order', '7', 0),
(43, 0, 'credit', 'credit_status', '1', 0),
(53, 0, 'reward', 'reward_sort_order', '2', 0),
(54, 0, 'reward', 'reward_status', '1', 0),
(1320, 0, 'category', 'category_status', '1', 0),
(1784, 0, 'account', 'account_status', '1', 0),
(1785, 0, 'affiliate', 'affiliate_status', '1', 0),
(1667, 0, 'filter', 'filter_status', '0', 0),
(2720, 0, 'config', 'config_error_log', '1', 0),
(2721, 0, 'config', 'config_error_filename', 'error.log', 0),
(2711, 0, 'config', 'config_compression', '0', 0),
(2712, 0, 'config', 'config_secure', '0', 0),
(2713, 0, 'config', 'config_password', '1', 0),
(2714, 0, 'config', 'config_shared', '1', 0),
(2715, 0, 'config', 'config_encryption', '3AchUvzrURzC1j8AdFccSfX5KsDKD7dh2XKqS6bnTsUFGK6fjA74hS7CNZy8hlGcuCEjmNvM28qSJwKdt82JDbMbApBtL1cl5srvCMo1QrYj6VXmo45FNQexgXRSMubQcxeQLUb7c0TZWq1AymyFNN6mHyEmEpGn8VGuDJtbtubrjrNGsVjvHdbFf3srSVd1FLXu6IV7IJZ8t22vaQqLcr7Ac5Im5uFtVi8wkUGgIgzxSXGOojhKmPF2IdQRIsdHVQJzsW47PPsPMT6Rz04p2PiSVZiXY4L6X8eP3cRHPVlpJBl7zRdo2pbUH7JHYfvf176SztgH0xj13KebPZE9JOmW5cYQYW7y6k0AXW6VxN3zTvt5DpF9mJHXv31sKOlMPTLSsX6WZxEGxJFKIVqYCcAwkoAzWsn44JhbpOlEqHoxL8bsvBDW2A6H6Y1qiyGHnc9NKtPIVqpOwGuzEIsiTtZ5CIKwRh3aJBszJsOeSBDJtbQDxNfMLDWxErWTVrfCd3d8Ux1SAnfI1U8uZkoBe55AL0BmvwNcXbECzAYrXDaWTIahXaSGhSVAa9V4941o2l3YgSPmsIdCKvxKQHxJF1qXHpb5JqQqxTh0Y4eDZWGvzcbOy2BGLU5y9YB8nu9o9LFljWlQNMC0qILrzUpzsfrDUscUyK0nPuF8fnc4xS8uSTgw6Owwrq3vqIVKFtZqzjVP8ODm8Xx3W9YbBe2iNlXmMYME78kLY18UGhTh9kX1xUn7ZioSSVTA5BxMaZWPr2G5cFOwcaMiO0L8Yoeli8ba1Qckb3NyywRljY7oXCEJfkMH3gxSjPqBAVWv5vtCSZBaQnBmP74yqtjphe9zGCNyeFZbqNCYa2LnC4TazSINqh99bnJKBx2Cy8TglX4SaMnpT8vBpKsy2u63YMprejkGERgbPcRYJFRq5Tj1Ym6DVpnlpXvVzLSpEO3ftzCDtzZhFzid0CzrsglrQhF95E7C81qo7O4VnRa4X66K6rf749CStkAvDmk6AHXoeXZF', 0),
(2716, 0, 'config', 'config_file_max_size', '300000', 0),
(2717, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(2718, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(94, 0, 'voucher', 'voucher_sort_order', '8', 0),
(95, 0, 'voucher', 'voucher_status', '1', 0),
(2719, 0, 'config', 'config_error_display', '1', 0),
(103, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(104, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(2710, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai''hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(2709, 0, 'config', 'config_seo_url', '0', 0),
(2708, 0, 'config', 'config_maintenance', '0', 0),
(2707, 0, 'config', 'config_mail_alert', '', 0),
(2706, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(2705, 0, 'config', 'config_mail_smtp_port', '25', 0),
(2704, 0, 'config', 'config_mail_smtp_password', '', 0),
(2703, 0, 'config', 'config_mail_smtp_username', '', 0),
(2702, 0, 'config', 'config_mail_smtp_hostname', '', 0),
(2700, 0, 'config', 'config_mail_protocol', 'mail', 0),
(2701, 0, 'config', 'config_mail_parameter', '', 0),
(2699, 0, 'config', 'config_ftp_status', '0', 0),
(2697, 0, 'config', 'config_ftp_password', '', 0),
(2698, 0, 'config', 'config_ftp_root', '', 0),
(2694, 0, 'config', 'config_ftp_hostname', 'localhost', 0),
(2695, 0, 'config', 'config_ftp_port', '21', 0),
(2696, 0, 'config', 'config_ftp_username', '', 0),
(2693, 0, 'config', 'config_image_location_height', '115', 0),
(2692, 0, 'config', 'config_image_location_width', '268', 0),
(2691, 0, 'config', 'config_image_cart_height', '47', 0),
(2690, 0, 'config', 'config_image_cart_width', '47', 0),
(2689, 0, 'config', 'config_image_wishlist_height', '47', 0),
(2688, 0, 'config', 'config_image_wishlist_width', '47', 0),
(2687, 0, 'config', 'config_image_compare_height', '90', 0),
(2686, 0, 'config', 'config_image_compare_width', '90', 0),
(2685, 0, 'config', 'config_image_related_height', '280', 0),
(2684, 0, 'config', 'config_image_related_width', '230', 0),
(2683, 0, 'config', 'config_image_additional_height', '460', 0),
(2682, 0, 'config', 'config_image_additional_width', '380', 0),
(2681, 0, 'config', 'config_image_product_height', '280', 0),
(2680, 0, 'config', 'config_image_product_width', '230', 0),
(2679, 0, 'config', 'config_image_popup_height', '500', 0),
(2678, 0, 'config', 'config_image_popup_width', '500', 0),
(2677, 0, 'config', 'config_image_thumb_height', '460', 0),
(2676, 0, 'config', 'config_image_thumb_width', '380', 0),
(2674, 0, 'config', 'config_image_category_width', '965', 0),
(2675, 0, 'config', 'config_image_category_height', '146', 0),
(2673, 0, 'config', 'config_icon', 'catalog/icons/storeiconfav.png', 0),
(2672, 0, 'config', 'config_logo', 'catalog/logo/logo.png', 0),
(2671, 0, 'config', 'config_captcha_page', '["review","return","contact"]', 1),
(2668, 0, 'config', 'config_return_id', '0', 0),
(2669, 0, 'config', 'config_return_status_id', '2', 0),
(2670, 0, 'config', 'config_captcha', '', 0),
(2667, 0, 'config', 'config_affiliate_mail', '0', 0),
(2666, 0, 'config', 'config_affiliate_id', '4', 0),
(2665, 0, 'config', 'config_affiliate_commission', '5', 0),
(2664, 0, 'config', 'config_affiliate_auto', '0', 0),
(2663, 0, 'config', 'config_affiliate_approval', '0', 0),
(2662, 0, 'config', 'config_stock_checkout', '0', 0),
(2661, 0, 'config', 'config_stock_warning', '0', 0),
(2657, 0, 'config', 'config_fraud_status_id', '7', 0),
(2658, 0, 'config', 'config_order_mail', '0', 0),
(2659, 0, 'config', 'config_api_id', '1', 0),
(2660, 0, 'config', 'config_stock_display', '0', 0),
(2656, 0, 'config', 'config_complete_status', '["5","3"]', 1),
(2655, 0, 'config', 'config_processing_status', '["5","1","2","12","3"]', 1),
(2654, 0, 'config', 'config_order_status_id', '1', 0),
(2653, 0, 'config', 'config_checkout_id', '5', 0),
(2652, 0, 'config', 'config_checkout_guest', '1', 0),
(2651, 0, 'config', 'config_cart_weight', '1', 0),
(2650, 0, 'config', 'config_invoice_prefix', 'INV-2013-00', 0),
(2647, 0, 'config', 'config_login_attempts', '5', 0),
(2649, 0, 'config', 'config_account_mail', '0', 0),
(2648, 0, 'config', 'config_account_id', '3', 0),
(2646, 0, 'config', 'config_customer_price', '0', 0),
(2645, 0, 'config', 'config_customer_group_display', '["1"]', 1),
(2644, 0, 'config', 'config_customer_group_id', '1', 0),
(2643, 0, 'config', 'config_customer_online', '0', 0),
(2642, 0, 'config', 'config_tax_customer', 'shipping', 0),
(2641, 0, 'config', 'config_tax_default', 'shipping', 0),
(2640, 0, 'config', 'config_tax', '1', 0),
(2639, 0, 'config', 'config_voucher_max', '1000', 0),
(2638, 0, 'config', 'config_voucher_min', '1', 0),
(2637, 0, 'config', 'config_review_mail', '0', 0),
(2635, 0, 'config', 'config_review_status', '1', 0),
(2636, 0, 'config', 'config_review_guest', '1', 0),
(2634, 0, 'config', 'config_limit_admin', '20', 0),
(2633, 0, 'config', 'config_product_description_length', '100', 0),
(2632, 0, 'config', 'config_product_limit', '15', 0),
(2631, 0, 'config', 'config_product_count', '1', 0),
(2630, 0, 'config', 'config_weight_class_id', '5', 0),
(2629, 0, 'config', 'config_length_class_id', '3', 0),
(2628, 0, 'config', 'config_currency_auto', '1', 0),
(2627, 0, 'config', 'config_currency', 'USD', 0),
(2626, 0, 'config', 'config_admin_language', 'en', 0),
(2625, 0, 'config', 'config_language', 'en', 0),
(2624, 0, 'config', 'config_zone_id', '3624', 0),
(2623, 0, 'config', 'config_country_id', '223', 0),
(2622, 0, 'config', 'config_comment', '', 0),
(2621, 0, 'config', 'config_open', '', 0),
(2620, 0, 'config', 'config_image', '', 0),
(2619, 0, 'config', 'config_fax', '', 0),
(2618, 0, 'config', 'config_telephone', '123456789', 0),
(2617, 0, 'config', 'config_email', 'koloinotzente@gmail.com', 0),
(2616, 0, 'config', 'config_geocode', '91723', 0),
(2615, 0, 'config', 'config_address', 'Covina, CA 91723', 0),
(2614, 0, 'config', 'config_owner', 'Awareness Ribbon Revolution', 0),
(2610, 0, 'config', 'config_meta_keyword', '', 0),
(1782, 0, 'information', 'information_status', '1', 0),
(2612, 0, 'config', 'config_layout_id', '1', 0),
(2613, 0, 'config', 'config_name', 'Awareness Ribbon Revolution', 0),
(2611, 0, 'config', 'config_template', 'OPC080176', 0),
(3428, 0, 'pp_standard', 'pp_standard_voided_status_id', '16', 0),
(3427, 0, 'pp_standard', 'pp_standard_reversed_status_id', '12', 0),
(3425, 0, 'pp_standard', 'pp_standard_processed_status_id', '15', 0),
(3426, 0, 'pp_standard', 'pp_standard_refunded_status_id', '11', 0),
(3424, 0, 'pp_standard', 'pp_standard_pending_status_id', '1', 0),
(3423, 0, 'pp_standard', 'pp_standard_failed_status_id', '10', 0),
(3422, 0, 'pp_standard', 'pp_standard_expired_status_id', '14', 0),
(3421, 0, 'pp_standard', 'pp_standard_denied_status_id', '8', 0),
(3420, 0, 'pp_standard', 'pp_standard_completed_status_id', '5', 0),
(3419, 0, 'pp_standard', 'pp_standard_canceled_reversal_status_id', '7', 0),
(3418, 0, 'pp_standard', 'pp_standard_status', '0', 0),
(3417, 0, 'pp_standard', 'pp_standard_geo_zone_id', '0', 0),
(3416, 0, 'pp_standard', 'pp_standard_sort_order', '0', 0),
(3415, 0, 'pp_standard', 'pp_standard_total', '', 0),
(3414, 0, 'pp_standard', 'pp_standard_transaction', '0', 0),
(3413, 0, 'pp_standard', 'pp_standard_debug', '0', 0),
(3412, 0, 'pp_standard', 'pp_standard_test', '0', 0),
(2609, 0, 'config', 'config_meta_description', 'Cancer an Health Shirts ,Apparel and Gifts', 0),
(3405, 0, 'pp_express', 'pp_express_refunded_status_id', '11', 0),
(3402, 0, 'pp_express', 'pp_express_failed_status_id', '10', 0),
(3401, 0, 'pp_express', 'pp_express_expired_status_id', '14', 0),
(3382, 0, 'paypal_advanced', 'paypal_advanced_debug', '1', 0),
(3381, 0, 'paypal_advanced', 'paypal_advanced_sort_order', '', 0),
(3380, 0, 'paypal_advanced', 'paypal_advanced_geo_zone_id', '0', 0),
(3379, 0, 'paypal_advanced', 'paypal_advanced_tax_class_id', '0', 0),
(3378, 0, 'paypal_advanced', 'paypal_advanced_order_status_id', '7', 0),
(3377, 0, 'paypal_advanced', 'paypal_advanced_default_currency', 'USD', 0),
(3376, 0, 'paypal_advanced', 'paypal_advanced_supported_currencies', 'USD', 0),
(3375, 0, 'paypal_advanced', 'paypal_advanced_max_total', '2000', 0),
(3374, 0, 'paypal_advanced', 'paypal_advanced_total', '', 0),
(3373, 0, 'paypal_advanced', 'paypal_advanced_log_to_history', '0', 0),
(3372, 0, 'paypal_advanced', 'paypal_advanced_iframe', '1', 0),
(3371, 0, 'paypal_advanced', 'paypal_advanced_itemized', '0', 0),
(3370, 0, 'paypal_advanced', 'paypal_advanced_mode', 'S', 0),
(3369, 0, 'paypal_advanced', 'paypal_advanced_key', 'wedding2016$', 0),
(3368, 0, 'paypal_advanced', 'paypal_advanced_partner', 'PayPal', 0),
(3367, 0, 'paypal_advanced', 'paypal_advanced_vendor', 'ribbonrevolution', 0),
(3366, 0, 'paypal_advanced', 'paypal_advanced_mid', 'andresfranco', 0),
(3365, 0, 'paypal_advanced', 'paypal_advanced_test', '0', 0),
(3364, 0, 'paypal_advanced', 'paypal_advanced_title_1', 'Credit or Debit Card (Processed securely by PayPal) ', 0),
(2448, 0, 'free', 'free_total', '', 0),
(2449, 0, 'free', 'free_geo_zone_id', '0', 0),
(2450, 0, 'free', 'free_status', '1', 0),
(2451, 0, 'free', 'free_sort_order', '0', 0),
(2608, 0, 'config', 'config_meta_title', 'Awaraness Ribbon Revolution', 0),
(3404, 0, 'pp_express', 'pp_express_processed_status_id', '15', 0),
(3410, 0, 'pp_express', 'pp_express_logo', '', 0),
(3408, 0, 'pp_express', 'pp_express_allow_note', '0', 0),
(3409, 0, 'pp_express', 'pp_express_page_colour', '', 0),
(3407, 0, 'pp_express', 'pp_express_voided_status_id', '16', 0),
(3406, 0, 'pp_express', 'pp_express_reversed_status_id', '12', 0),
(3363, 0, 'paypal_advanced', 'paypal_advanced_status', '1', 0),
(3411, 0, 'pp_standard', 'pp_standard_email', 'hopeinspiredcreations@gmail.com', 0),
(3403, 0, 'pp_express', 'pp_express_pending_status_id', '1', 0),
(3400, 0, 'pp_express', 'pp_express_denied_status_id', '8', 0),
(3399, 0, 'pp_express', 'pp_express_completed_status_id', '5', 0),
(3398, 0, 'pp_express', 'pp_express_canceled_reversal_status_id', '7', 0),
(3397, 0, 'pp_express', 'pp_express_status', '0', 0),
(3396, 0, 'pp_express', 'pp_express_geo_zone_id', '0', 0),
(3395, 0, 'pp_express', 'pp_express_sort_order', '', 0),
(3394, 0, 'pp_express', 'pp_express_total', '', 0),
(3393, 0, 'pp_express', 'pp_express_method', 'Sale', 0),
(3392, 0, 'pp_express', 'pp_express_recurring_cancel_status', '0', 0),
(3391, 0, 'pp_express', 'pp_express_currency', 'AUD', 0),
(3390, 0, 'pp_express', 'pp_express_debug', '0', 0),
(3389, 0, 'pp_express', 'pp_express_test', '0', 0),
(3388, 0, 'pp_express', 'pp_express_sandbox_signature', '', 0),
(3387, 0, 'pp_express', 'pp_express_sandbox_password', '', 0),
(3386, 0, 'pp_express', 'pp_express_sandbox_username', '', 0),
(3385, 0, 'pp_express', 'pp_express_signature', 'AFcWxV21C7fd0v3bYYYRCpSSRl31A5krAw3GIheDwsqPlHJ3LUJljSOg', 0),
(3384, 0, 'pp_express', 'pp_express_password', 'ZR2QEEDC9T552S9L', 0),
(3383, 0, 'pp_express', 'pp_express_username', 'hopeinspiredcreations_api1.gmail.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_stock_status`
--

CREATE TABLE IF NOT EXISTS `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_stock_status`
--

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, 'In Stock'),
(8, 1, 'Pre-Order'),
(5, 1, 'Out Of Stock'),
(6, 1, '2-3 Days');

-- --------------------------------------------------------

--
-- Table structure for table `oc_store`
--

CREATE TABLE IF NOT EXISTS `oc_store` (
  `store_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_class`
--

CREATE TABLE IF NOT EXISTS `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_class`
--

INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed goods', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_rate`
--

INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (20%)', 20.0000, 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', 2.0000, 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate_to_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_rate_to_customer_group`
--

INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rule`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_rule`
--

INSERT INTO `oc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_upload`
--

CREATE TABLE IF NOT EXISTS `oc_upload` (
  `upload_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_url_alias`
--

CREATE TABLE IF NOT EXISTS `oc_url_alias` (
  `url_alias_id` int(11) NOT NULL,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=1114 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_url_alias`
--

INSERT INTO `oc_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(1032, 'category_id=92', ''),
(858, 'information_id=4', 'about_us'),
(1095, 'category_id=99', ''),
(1113, 'category_id=90', 'Cancer T-Shirts'),
(1044, 'category_id=93', ''),
(1025, 'category_id=91', ''),
(1076, 'category_id=97', ''),
(1001, 'category_id=86', 'Uterine Cancer'),
(1000, 'category_id=85', 'Thyroid Cancer'),
(999, 'category_id=84', 'Skin Cancer'),
(998, 'category_id=83', 'Sarcoma'),
(992, 'category_id=81', 'Pancreatic Cancer'),
(991, 'category_id=79', 'Non Hodgkins Lymphoma'),
(993, 'category_id=82', 'Prostate Cancer'),
(990, 'category_id=80', 'Ovarian Cancer'),
(988, 'category_id=77', 'Melanoma'),
(987, 'category_id=76', 'Lymphoma'),
(984, 'category_id=73', 'Leukemia'),
(989, 'category_id=78', 'Multiple Myeloma'),
(985, 'category_id=74', 'Liver Cancer'),
(1104, 'product_id=233', ''),
(983, 'category_id=72', 'Kidney Cancer'),
(893, 'product_id=65', ''),
(894, 'product_id=66', ''),
(895, 'product_id=67', ''),
(896, 'product_id=68', ''),
(897, 'product_id=69', ''),
(986, 'category_id=75', 'Lung Cancer'),
(1065, 'category_id=66', 'Blood Cancer'),
(997, 'category_id=67', 'Brain Cancer'),
(977, 'category_id=60', 'Breast Cancer'),
(978, 'category_id=68', 'Cervical Cancer'),
(979, 'category_id=69', 'Chilhood Cancer'),
(980, 'category_id=70', 'Colon Cancer'),
(981, 'category_id=65', 'Endometriosis'),
(982, 'category_id=71', 'Hodgkin''s Lymphoma'),
(857, 'information_id=6', 'delivery'),
(842, 'information_id=3', 'privacy'),
(843, 'information_id=5', 'terms'),
(1089, 'category_id=98', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_user`
--

CREATE TABLE IF NOT EXISTS `oc_user` (
  `user_id` int(11) NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_user`
--

INSERT INTO `oc_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', '93afdbc8ddad2612e670fd985432390e1950f8cb', 'TEk8lD3Ll', 'Andres', 'Franco', 'koloinotzente@gmail.com', 'catalog/1446516653_preferences-contact-list.png', '', '127.0.0.1', 1, '2015-11-01 10:36:35');

-- --------------------------------------------------------

--
-- Table structure for table `oc_user_group`
--

CREATE TABLE IF NOT EXISTS `oc_user_group` (
  `user_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Administrator', '{"access":["analytics\\/google_analytics","captcha\\/basic_captcha","captcha\\/google_captcha","catalog\\/attribute","catalog\\/attribute_group","catalog\\/category","catalog\\/download","catalog\\/filter","catalog\\/information","catalog\\/manufacturer","catalog\\/option","catalog\\/product","catalog\\/recurring","catalog\\/review","common\\/column_left","common\\/filemanager","common\\/menu","common\\/profile","common\\/sass","common\\/stats","customer\\/custom_field","customer\\/customer","customer\\/customer_group","design\\/banner","design\\/layout","extension\\/analytics","extension\\/captcha","extension\\/feed","extension\\/fraud","extension\\/installer","extension\\/modification","extension\\/module","extension\\/openbay","extension\\/payment","extension\\/shipping","extension\\/total","feed\\/google_base","feed\\/google_sitemap","feed\\/openbaypro","fraud\\/fraudlabspro","fraud\\/ip","fraud\\/maxmind","localisation\\/country","localisation\\/currency","localisation\\/geo_zone","localisation\\/language","localisation\\/length_class","localisation\\/location","localisation\\/order_status","localisation\\/return_action","localisation\\/return_reason","localisation\\/return_status","localisation\\/stock_status","localisation\\/tax_class","localisation\\/tax_rate","localisation\\/weight_class","localisation\\/zone","marketing\\/affiliate","marketing\\/contact","marketing\\/coupon","marketing\\/marketing","module\\/account","module\\/affiliate","module\\/amazon_login","module\\/amazon_pay","module\\/banner","module\\/bestseller","module\\/carousel","module\\/category","module\\/ebay_listing","module\\/featured","module\\/filter","module\\/google_hangouts","module\\/html","module\\/information","module\\/latest","module\\/pp_button","module\\/pp_login","module\\/slideshow","module\\/special","module\\/store","openbay\\/amazon","openbay\\/amazon_listing","openbay\\/amazon_product","openbay\\/amazonus","openbay\\/amazonus_listing","openbay\\/amazonus_product","openbay\\/ebay","openbay\\/ebay_profile","openbay\\/ebay_template","openbay\\/etsy","openbay\\/etsy_product","openbay\\/etsy_shipping","openbay\\/etsy_shop","payment\\/amazon_login_pay","payment\\/authorizenet_aim","payment\\/authorizenet_sim","payment\\/bank_transfer","payment\\/bluepay_hosted","payment\\/bluepay_redirect","payment\\/cheque","payment\\/cod","payment\\/firstdata","payment\\/firstdata_remote","payment\\/free_checkout","payment\\/g2apay","payment\\/globalpay","payment\\/globalpay_remote","payment\\/klarna_account","payment\\/klarna_invoice","payment\\/liqpay","payment\\/nochex","payment\\/paymate","payment\\/paypal_advanced","payment\\/paypal_advanced","payment\\/paypoint","payment\\/payza","payment\\/perpetual_payments","payment\\/pp_express","payment\\/pp_payflow","payment\\/pp_payflow_iframe","payment\\/pp_pro","payment\\/pp_pro_iframe","payment\\/pp_standard","payment\\/realex","payment\\/realex_remote","payment\\/sagepay_direct","payment\\/sagepay_server","payment\\/sagepay_us","payment\\/securetrading_pp","payment\\/securetrading_ws","payment\\/skrill","payment\\/twocheckout","payment\\/web_payment_software","payment\\/worldpay","report\\/affiliate","report\\/affiliate_activity","report\\/affiliate_login","report\\/customer_activity","report\\/customer_credit","report\\/customer_login","report\\/customer_online","report\\/customer_order","report\\/customer_reward","report\\/marketing","report\\/product_purchased","report\\/product_viewed","report\\/sale_coupon","report\\/sale_order","report\\/sale_return","report\\/sale_shipping","report\\/sale_tax","sale\\/order","sale\\/recurring","sale\\/return","sale\\/voucher","sale\\/voucher_theme","setting\\/setting","setting\\/store","shipping\\/auspost","shipping\\/citylink","shipping\\/fedex","shipping\\/flat","shipping\\/free","shipping\\/item","shipping\\/parcelforce_48","shipping\\/pickup","shipping\\/royal_mail","shipping\\/ups","shipping\\/usps","shipping\\/weight","tool\\/backup","tool\\/error_log","tool\\/upload","total\\/coupon","total\\/credit","total\\/handling","total\\/klarna_fee","total\\/low_order_fee","total\\/reward","total\\/shipping","total\\/sub_total","total\\/tax","total\\/total","total\\/voucher","user\\/api","user\\/user","user\\/user_permission","payment\\/paypal_advanced","payment\\/pp_pro","payment\\/pp_express"],"modify":["analytics\\/google_analytics","captcha\\/basic_captcha","captcha\\/google_captcha","catalog\\/attribute","catalog\\/attribute_group","catalog\\/category","catalog\\/download","catalog\\/filter","catalog\\/information","catalog\\/manufacturer","catalog\\/option","catalog\\/product","catalog\\/recurring","catalog\\/review","common\\/column_left","common\\/filemanager","common\\/menu","common\\/profile","common\\/sass","common\\/stats","customer\\/custom_field","customer\\/customer","customer\\/customer_group","design\\/banner","design\\/layout","extension\\/analytics","extension\\/captcha","extension\\/feed","extension\\/fraud","extension\\/installer","extension\\/modification","extension\\/module","extension\\/openbay","extension\\/payment","extension\\/shipping","extension\\/total","feed\\/google_base","feed\\/google_sitemap","feed\\/openbaypro","fraud\\/fraudlabspro","fraud\\/ip","fraud\\/maxmind","localisation\\/country","localisation\\/currency","localisation\\/geo_zone","localisation\\/language","localisation\\/length_class","localisation\\/location","localisation\\/order_status","localisation\\/return_action","localisation\\/return_reason","localisation\\/return_status","localisation\\/stock_status","localisation\\/tax_class","localisation\\/tax_rate","localisation\\/weight_class","localisation\\/zone","marketing\\/affiliate","marketing\\/contact","marketing\\/coupon","marketing\\/marketing","module\\/account","module\\/affiliate","module\\/amazon_login","module\\/amazon_pay","module\\/banner","module\\/bestseller","module\\/carousel","module\\/category","module\\/ebay_listing","module\\/featured","module\\/filter","module\\/google_hangouts","module\\/html","module\\/information","module\\/latest","module\\/pp_button","module\\/pp_login","module\\/slideshow","module\\/special","module\\/store","openbay\\/amazon","openbay\\/amazon_listing","openbay\\/amazon_product","openbay\\/amazonus","openbay\\/amazonus_listing","openbay\\/amazonus_product","openbay\\/ebay","openbay\\/ebay_profile","openbay\\/ebay_template","openbay\\/etsy","openbay\\/etsy_product","openbay\\/etsy_shipping","openbay\\/etsy_shop","payment\\/amazon_login_pay","payment\\/authorizenet_aim","payment\\/authorizenet_sim","payment\\/bank_transfer","payment\\/bluepay_hosted","payment\\/bluepay_redirect","payment\\/cheque","payment\\/cod","payment\\/firstdata","payment\\/firstdata_remote","payment\\/free_checkout","payment\\/g2apay","payment\\/globalpay","payment\\/globalpay_remote","payment\\/klarna_account","payment\\/klarna_invoice","payment\\/liqpay","payment\\/nochex","payment\\/paymate","payment\\/paypal_advanced","payment\\/paypal_advanced","payment\\/paypoint","payment\\/payza","payment\\/perpetual_payments","payment\\/pp_express","payment\\/pp_payflow","payment\\/pp_payflow_iframe","payment\\/pp_pro","payment\\/pp_pro_iframe","payment\\/pp_standard","payment\\/realex","payment\\/realex_remote","payment\\/sagepay_direct","payment\\/sagepay_server","payment\\/sagepay_us","payment\\/securetrading_pp","payment\\/securetrading_ws","payment\\/skrill","payment\\/twocheckout","payment\\/web_payment_software","payment\\/worldpay","report\\/affiliate","report\\/affiliate_activity","report\\/affiliate_login","report\\/customer_activity","report\\/customer_credit","report\\/customer_login","report\\/customer_online","report\\/customer_order","report\\/customer_reward","report\\/marketing","report\\/product_purchased","report\\/product_viewed","report\\/sale_coupon","report\\/sale_order","report\\/sale_return","report\\/sale_shipping","report\\/sale_tax","sale\\/order","sale\\/recurring","sale\\/return","sale\\/voucher","sale\\/voucher_theme","setting\\/setting","setting\\/store","shipping\\/auspost","shipping\\/citylink","shipping\\/fedex","shipping\\/flat","shipping\\/free","shipping\\/item","shipping\\/parcelforce_48","shipping\\/pickup","shipping\\/royal_mail","shipping\\/ups","shipping\\/usps","shipping\\/weight","tool\\/backup","tool\\/error_log","tool\\/upload","total\\/coupon","total\\/credit","total\\/handling","total\\/klarna_fee","total\\/low_order_fee","total\\/reward","total\\/shipping","total\\/sub_total","total\\/tax","total\\/total","total\\/voucher","user\\/api","user\\/user","user\\/user_permission","payment\\/paypal_advanced","payment\\/pp_pro","payment\\/pp_express"]}'),
(10, 'Demonstration', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher`
--

CREATE TABLE IF NOT EXISTS `oc_voucher` (
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_history`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_voucher_theme`
--

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme_description`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_voucher_theme_description`
--

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Christmas'),
(7, 1, 'Birthday'),
(8, 1, 'General');

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class`
--

CREATE TABLE IF NOT EXISTS `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000'
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_weight_class`
--

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(1, 1.00000000),
(2, 1000.00000000),
(5, 2.20460000),
(6, 35.27400000);

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class_description`
--

CREATE TABLE IF NOT EXISTS `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_weight_class_description`
--

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Kilogram', 'kg'),
(2, 1, 'Gram', 'g'),
(5, 1, 'Pound ', 'lb'),
(6, 1, 'Ounce', 'oz');

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone`
--

CREATE TABLE IF NOT EXISTS `oc_zone` (
  `zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=4232 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_zone`
--

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 1, 'Badakhshan', 'BDS', 1),
(2, 1, 'Badghis', 'BDG', 1),
(3, 1, 'Baghlan', 'BGL', 1),
(4, 1, 'Balkh', 'BAL', 1),
(5, 1, 'Bamian', 'BAM', 1),
(6, 1, 'Farah', 'FRA', 1),
(7, 1, 'Faryab', 'FYB', 1),
(8, 1, 'Ghazni', 'GHA', 1),
(9, 1, 'Ghowr', 'GHO', 1),
(10, 1, 'Helmand', 'HEL', 1),
(11, 1, 'Herat', 'HER', 1),
(12, 1, 'Jowzjan', 'JOW', 1),
(13, 1, 'Kabul', 'KAB', 1),
(14, 1, 'Kandahar', 'KAN', 1),
(15, 1, 'Kapisa', 'KAP', 1),
(16, 1, 'Khost', 'KHO', 1),
(17, 1, 'Konar', 'KNR', 1),
(18, 1, 'Kondoz', 'KDZ', 1),
(19, 1, 'Laghman', 'LAG', 1),
(20, 1, 'Lowgar', 'LOW', 1),
(21, 1, 'Nangrahar', 'NAN', 1),
(22, 1, 'Nimruz', 'NIM', 1),
(23, 1, 'Nurestan', 'NUR', 1),
(24, 1, 'Oruzgan', 'ORU', 1),
(25, 1, 'Paktia', 'PIA', 1),
(26, 1, 'Paktika', 'PKA', 1),
(27, 1, 'Parwan', 'PAR', 1),
(28, 1, 'Samangan', 'SAM', 1),
(29, 1, 'Sar-e Pol', 'SAR', 1),
(30, 1, 'Takhar', 'TAK', 1),
(31, 1, 'Wardak', 'WAR', 1),
(32, 1, 'Zabol', 'ZAB', 1),
(33, 2, 'Berat', 'BR', 1),
(34, 2, 'Bulqize', 'BU', 1),
(35, 2, 'Delvine', 'DL', 1),
(36, 2, 'Devoll', 'DV', 1),
(37, 2, 'Diber', 'DI', 1),
(38, 2, 'Durres', 'DR', 1),
(39, 2, 'Elbasan', 'EL', 1),
(40, 2, 'Kolonje', 'ER', 1),
(41, 2, 'Fier', 'FR', 1),
(42, 2, 'Gjirokaster', 'GJ', 1),
(43, 2, 'Gramsh', 'GR', 1),
(44, 2, 'Has', 'HA', 1),
(45, 2, 'Kavaje', 'KA', 1),
(46, 2, 'Kurbin', 'KB', 1),
(47, 2, 'Kucove', 'KC', 1),
(48, 2, 'Korce', 'KO', 1),
(49, 2, 'Kruje', 'KR', 1),
(50, 2, 'Kukes', 'KU', 1),
(51, 2, 'Librazhd', 'LB', 1),
(52, 2, 'Lezhe', 'LE', 1),
(53, 2, 'Lushnje', 'LU', 1),
(54, 2, 'Malesi e Madhe', 'MM', 1),
(55, 2, 'Mallakaster', 'MK', 1),
(56, 2, 'Mat', 'MT', 1),
(57, 2, 'Mirdite', 'MR', 1),
(58, 2, 'Peqin', 'PQ', 1),
(59, 2, 'Permet', 'PR', 1),
(60, 2, 'Pogradec', 'PG', 1),
(61, 2, 'Puke', 'PU', 1),
(62, 2, 'Shkoder', 'SH', 1),
(63, 2, 'Skrapar', 'SK', 1),
(64, 2, 'Sarande', 'SR', 1),
(65, 2, 'Tepelene', 'TE', 1),
(66, 2, 'Tropoje', 'TP', 1),
(67, 2, 'Tirane', 'TR', 1),
(68, 2, 'Vlore', 'VL', 1),
(69, 3, 'Adrar', 'ADR', 1),
(70, 3, 'Ain Defla', 'ADE', 1),
(71, 3, 'Ain Temouchent', 'ATE', 1),
(72, 3, 'Alger', 'ALG', 1),
(73, 3, 'Annaba', 'ANN', 1),
(74, 3, 'Batna', 'BAT', 1),
(75, 3, 'Bechar', 'BEC', 1),
(76, 3, 'Bejaia', 'BEJ', 1),
(77, 3, 'Biskra', 'BIS', 1),
(78, 3, 'Blida', 'BLI', 1),
(79, 3, 'Bordj Bou Arreridj', 'BBA', 1),
(80, 3, 'Bouira', 'BOA', 1),
(81, 3, 'Boumerdes', 'BMD', 1),
(82, 3, 'Chlef', 'CHL', 1),
(83, 3, 'Constantine', 'CON', 1),
(84, 3, 'Djelfa', 'DJE', 1),
(85, 3, 'El Bayadh', 'EBA', 1),
(86, 3, 'El Oued', 'EOU', 1),
(87, 3, 'El Tarf', 'ETA', 1),
(88, 3, 'Ghardaia', 'GHA', 1),
(89, 3, 'Guelma', 'GUE', 1),
(90, 3, 'Illizi', 'ILL', 1),
(91, 3, 'Jijel', 'JIJ', 1),
(92, 3, 'Khenchela', 'KHE', 1),
(93, 3, 'Laghouat', 'LAG', 1),
(94, 3, 'Muaskar', 'MUA', 1),
(95, 3, 'Medea', 'MED', 1),
(96, 3, 'Mila', 'MIL', 1),
(97, 3, 'Mostaganem', 'MOS', 1),
(98, 3, 'M''Sila', 'MSI', 1),
(99, 3, 'Naama', 'NAA', 1),
(100, 3, 'Oran', 'ORA', 1),
(101, 3, 'Ouargla', 'OUA', 1),
(102, 3, 'Oum el-Bouaghi', 'OEB', 1),
(103, 3, 'Relizane', 'REL', 1),
(104, 3, 'Saida', 'SAI', 1),
(105, 3, 'Setif', 'SET', 1),
(106, 3, 'Sidi Bel Abbes', 'SBA', 1),
(107, 3, 'Skikda', 'SKI', 1),
(108, 3, 'Souk Ahras', 'SAH', 1),
(109, 3, 'Tamanghasset', 'TAM', 1),
(110, 3, 'Tebessa', 'TEB', 1),
(111, 3, 'Tiaret', 'TIA', 1),
(112, 3, 'Tindouf', 'TIN', 1),
(113, 3, 'Tipaza', 'TIP', 1),
(114, 3, 'Tissemsilt', 'TIS', 1),
(115, 3, 'Tizi Ouzou', 'TOU', 1),
(116, 3, 'Tlemcen', 'TLE', 1),
(117, 4, 'Eastern', 'E', 1),
(118, 4, 'Manu''a', 'M', 1),
(119, 4, 'Rose Island', 'R', 1),
(120, 4, 'Swains Island', 'S', 1),
(121, 4, 'Western', 'W', 1),
(122, 5, 'Andorra la Vella', 'ALV', 1),
(123, 5, 'Canillo', 'CAN', 1),
(124, 5, 'Encamp', 'ENC', 1),
(125, 5, 'Escaldes-Engordany', 'ESE', 1),
(126, 5, 'La Massana', 'LMA', 1),
(127, 5, 'Ordino', 'ORD', 1),
(128, 5, 'Sant Julia de Loria', 'SJL', 1),
(129, 6, 'Bengo', 'BGO', 1),
(130, 6, 'Benguela', 'BGU', 1),
(131, 6, 'Bie', 'BIE', 1),
(132, 6, 'Cabinda', 'CAB', 1),
(133, 6, 'Cuando-Cubango', 'CCU', 1),
(134, 6, 'Cuanza Norte', 'CNO', 1),
(135, 6, 'Cuanza Sul', 'CUS', 1),
(136, 6, 'Cunene', 'CNN', 1),
(137, 6, 'Huambo', 'HUA', 1),
(138, 6, 'Huila', 'HUI', 1),
(139, 6, 'Luanda', 'LUA', 1),
(140, 6, 'Lunda Norte', 'LNO', 1),
(141, 6, 'Lunda Sul', 'LSU', 1),
(142, 6, 'Malange', 'MAL', 1),
(143, 6, 'Moxico', 'MOX', 1),
(144, 6, 'Namibe', 'NAM', 1),
(145, 6, 'Uige', 'UIG', 1),
(146, 6, 'Zaire', 'ZAI', 1),
(147, 9, 'Saint George', 'ASG', 1),
(148, 9, 'Saint John', 'ASJ', 1),
(149, 9, 'Saint Mary', 'ASM', 1),
(150, 9, 'Saint Paul', 'ASL', 1),
(151, 9, 'Saint Peter', 'ASR', 1),
(152, 9, 'Saint Philip', 'ASH', 1),
(153, 9, 'Barbuda', 'BAR', 1),
(154, 9, 'Redonda', 'RED', 1),
(155, 10, 'Antartida e Islas del Atlantico', 'AN', 1),
(156, 10, 'Buenos Aires', 'BA', 1),
(157, 10, 'Catamarca', 'CA', 1),
(158, 10, 'Chaco', 'CH', 1),
(159, 10, 'Chubut', 'CU', 1),
(160, 10, 'Cordoba', 'CO', 1),
(161, 10, 'Corrientes', 'CR', 1),
(162, 10, 'Distrito Federal', 'DF', 1),
(163, 10, 'Entre Rios', 'ER', 1),
(164, 10, 'Formosa', 'FO', 1),
(165, 10, 'Jujuy', 'JU', 1),
(166, 10, 'La Pampa', 'LP', 1),
(167, 10, 'La Rioja', 'LR', 1),
(168, 10, 'Mendoza', 'ME', 1),
(169, 10, 'Misiones', 'MI', 1),
(170, 10, 'Neuquen', 'NE', 1),
(171, 10, 'Rio Negro', 'RN', 1),
(172, 10, 'Salta', 'SA', 1),
(173, 10, 'San Juan', 'SJ', 1),
(174, 10, 'San Luis', 'SL', 1),
(175, 10, 'Santa Cruz', 'SC', 1),
(176, 10, 'Santa Fe', 'SF', 1),
(177, 10, 'Santiago del Estero', 'SD', 1),
(178, 10, 'Tierra del Fuego', 'TF', 1),
(179, 10, 'Tucuman', 'TU', 1),
(180, 11, 'Aragatsotn', 'AGT', 1),
(181, 11, 'Ararat', 'ARR', 1),
(182, 11, 'Armavir', 'ARM', 1),
(183, 11, 'Geghark''unik''', 'GEG', 1),
(184, 11, 'Kotayk''', 'KOT', 1),
(185, 11, 'Lorri', 'LOR', 1),
(186, 11, 'Shirak', 'SHI', 1),
(187, 11, 'Syunik''', 'SYU', 1),
(188, 11, 'Tavush', 'TAV', 1),
(189, 11, 'Vayots'' Dzor', 'VAY', 1),
(190, 11, 'Yerevan', 'YER', 1),
(191, 13, 'Australian Capital Territory', 'ACT', 1),
(192, 13, 'New South Wales', 'NSW', 1),
(193, 13, 'Northern Territory', 'NT', 1),
(194, 13, 'Queensland', 'QLD', 1),
(195, 13, 'South Australia', 'SA', 1),
(196, 13, 'Tasmania', 'TAS', 1),
(197, 13, 'Victoria', 'VIC', 1),
(198, 13, 'Western Australia', 'WA', 1),
(199, 14, 'Burgenland', 'BUR', 1),
(200, 14, 'Kärnten', 'KAR', 1),
(201, 14, 'Nieder&ouml;sterreich', 'NOS', 1),
(202, 14, 'Ober&ouml;sterreich', 'OOS', 1),
(203, 14, 'Salzburg', 'SAL', 1),
(204, 14, 'Steiermark', 'STE', 1),
(205, 14, 'Tirol', 'TIR', 1),
(206, 14, 'Vorarlberg', 'VOR', 1),
(207, 14, 'Wien', 'WIE', 1),
(208, 15, 'Ali Bayramli', 'AB', 1),
(209, 15, 'Abseron', 'ABS', 1),
(210, 15, 'AgcabAdi', 'AGC', 1),
(211, 15, 'Agdam', 'AGM', 1),
(212, 15, 'Agdas', 'AGS', 1),
(213, 15, 'Agstafa', 'AGA', 1),
(214, 15, 'Agsu', 'AGU', 1),
(215, 15, 'Astara', 'AST', 1),
(216, 15, 'Baki', 'BA', 1),
(217, 15, 'BabAk', 'BAB', 1),
(218, 15, 'BalakAn', 'BAL', 1),
(219, 15, 'BArdA', 'BAR', 1),
(220, 15, 'Beylaqan', 'BEY', 1),
(221, 15, 'Bilasuvar', 'BIL', 1),
(222, 15, 'Cabrayil', 'CAB', 1),
(223, 15, 'Calilabab', 'CAL', 1),
(224, 15, 'Culfa', 'CUL', 1),
(225, 15, 'Daskasan', 'DAS', 1),
(226, 15, 'Davaci', 'DAV', 1),
(227, 15, 'Fuzuli', 'FUZ', 1),
(228, 15, 'Ganca', 'GA', 1),
(229, 15, 'Gadabay', 'GAD', 1),
(230, 15, 'Goranboy', 'GOR', 1),
(231, 15, 'Goycay', 'GOY', 1),
(232, 15, 'Haciqabul', 'HAC', 1),
(233, 15, 'Imisli', 'IMI', 1),
(234, 15, 'Ismayilli', 'ISM', 1),
(235, 15, 'Kalbacar', 'KAL', 1),
(236, 15, 'Kurdamir', 'KUR', 1),
(237, 15, 'Lankaran', 'LA', 1),
(238, 15, 'Lacin', 'LAC', 1),
(239, 15, 'Lankaran', 'LAN', 1),
(240, 15, 'Lerik', 'LER', 1),
(241, 15, 'Masalli', 'MAS', 1),
(242, 15, 'Mingacevir', 'MI', 1),
(243, 15, 'Naftalan', 'NA', 1),
(244, 15, 'Neftcala', 'NEF', 1),
(245, 15, 'Oguz', 'OGU', 1),
(246, 15, 'Ordubad', 'ORD', 1),
(247, 15, 'Qabala', 'QAB', 1),
(248, 15, 'Qax', 'QAX', 1),
(249, 15, 'Qazax', 'QAZ', 1),
(250, 15, 'Qobustan', 'QOB', 1),
(251, 15, 'Quba', 'QBA', 1),
(252, 15, 'Qubadli', 'QBI', 1),
(253, 15, 'Qusar', 'QUS', 1),
(254, 15, 'Saki', 'SA', 1),
(255, 15, 'Saatli', 'SAT', 1),
(256, 15, 'Sabirabad', 'SAB', 1),
(257, 15, 'Sadarak', 'SAD', 1),
(258, 15, 'Sahbuz', 'SAH', 1),
(259, 15, 'Saki', 'SAK', 1),
(260, 15, 'Salyan', 'SAL', 1),
(261, 15, 'Sumqayit', 'SM', 1),
(262, 15, 'Samaxi', 'SMI', 1),
(263, 15, 'Samkir', 'SKR', 1),
(264, 15, 'Samux', 'SMX', 1),
(265, 15, 'Sarur', 'SAR', 1),
(266, 15, 'Siyazan', 'SIY', 1),
(267, 15, 'Susa', 'SS', 1),
(268, 15, 'Susa', 'SUS', 1),
(269, 15, 'Tartar', 'TAR', 1),
(270, 15, 'Tovuz', 'TOV', 1),
(271, 15, 'Ucar', 'UCA', 1),
(272, 15, 'Xankandi', 'XA', 1),
(273, 15, 'Xacmaz', 'XAC', 1),
(274, 15, 'Xanlar', 'XAN', 1),
(275, 15, 'Xizi', 'XIZ', 1),
(276, 15, 'Xocali', 'XCI', 1),
(277, 15, 'Xocavand', 'XVD', 1),
(278, 15, 'Yardimli', 'YAR', 1),
(279, 15, 'Yevlax', 'YEV', 1),
(280, 15, 'Zangilan', 'ZAN', 1),
(281, 15, 'Zaqatala', 'ZAQ', 1),
(282, 15, 'Zardab', 'ZAR', 1),
(283, 15, 'Naxcivan', 'NX', 1),
(284, 16, 'Acklins', 'ACK', 1),
(285, 16, 'Berry Islands', 'BER', 1),
(286, 16, 'Bimini', 'BIM', 1),
(287, 16, 'Black Point', 'BLK', 1),
(288, 16, 'Cat Island', 'CAT', 1),
(289, 16, 'Central Abaco', 'CAB', 1),
(290, 16, 'Central Andros', 'CAN', 1),
(291, 16, 'Central Eleuthera', 'CEL', 1),
(292, 16, 'City of Freeport', 'FRE', 1),
(293, 16, 'Crooked Island', 'CRO', 1),
(294, 16, 'East Grand Bahama', 'EGB', 1),
(295, 16, 'Exuma', 'EXU', 1),
(296, 16, 'Grand Cay', 'GRD', 1),
(297, 16, 'Harbour Island', 'HAR', 1),
(298, 16, 'Hope Town', 'HOP', 1),
(299, 16, 'Inagua', 'INA', 1),
(300, 16, 'Long Island', 'LNG', 1),
(301, 16, 'Mangrove Cay', 'MAN', 1),
(302, 16, 'Mayaguana', 'MAY', 1),
(303, 16, 'Moore''s Island', 'MOO', 1),
(304, 16, 'North Abaco', 'NAB', 1),
(305, 16, 'North Andros', 'NAN', 1),
(306, 16, 'North Eleuthera', 'NEL', 1),
(307, 16, 'Ragged Island', 'RAG', 1),
(308, 16, 'Rum Cay', 'RUM', 1),
(309, 16, 'San Salvador', 'SAL', 1),
(310, 16, 'South Abaco', 'SAB', 1),
(311, 16, 'South Andros', 'SAN', 1),
(312, 16, 'South Eleuthera', 'SEL', 1),
(313, 16, 'Spanish Wells', 'SWE', 1),
(314, 16, 'West Grand Bahama', 'WGB', 1),
(315, 17, 'Capital', 'CAP', 1),
(316, 17, 'Central', 'CEN', 1),
(317, 17, 'Muharraq', 'MUH', 1),
(318, 17, 'Northern', 'NOR', 1),
(319, 17, 'Southern', 'SOU', 1),
(320, 18, 'Barisal', 'BAR', 1),
(321, 18, 'Chittagong', 'CHI', 1),
(322, 18, 'Dhaka', 'DHA', 1),
(323, 18, 'Khulna', 'KHU', 1),
(324, 18, 'Rajshahi', 'RAJ', 1),
(325, 18, 'Sylhet', 'SYL', 1),
(326, 19, 'Christ Church', 'CC', 1),
(327, 19, 'Saint Andrew', 'AND', 1),
(328, 19, 'Saint George', 'GEO', 1),
(329, 19, 'Saint James', 'JAM', 1),
(330, 19, 'Saint John', 'JOH', 1),
(331, 19, 'Saint Joseph', 'JOS', 1),
(332, 19, 'Saint Lucy', 'LUC', 1),
(333, 19, 'Saint Michael', 'MIC', 1),
(334, 19, 'Saint Peter', 'PET', 1),
(335, 19, 'Saint Philip', 'PHI', 1),
(336, 19, 'Saint Thomas', 'THO', 1),
(337, 20, 'Brestskaya (Brest)', 'BR', 1),
(338, 20, 'Homyel''skaya (Homyel'')', 'HO', 1),
(339, 20, 'Horad Minsk', 'HM', 1),
(340, 20, 'Hrodzyenskaya (Hrodna)', 'HR', 1),
(341, 20, 'Mahilyowskaya (Mahilyow)', 'MA', 1),
(342, 20, 'Minskaya', 'MI', 1),
(343, 20, 'Vitsyebskaya (Vitsyebsk)', 'VI', 1),
(344, 21, 'Antwerpen', 'VAN', 1),
(345, 21, 'Brabant Wallon', 'WBR', 1),
(346, 21, 'Hainaut', 'WHT', 1),
(347, 21, 'Liège', 'WLG', 1),
(348, 21, 'Limburg', 'VLI', 1),
(349, 21, 'Luxembourg', 'WLX', 1),
(350, 21, 'Namur', 'WNA', 1),
(351, 21, 'Oost-Vlaanderen', 'VOV', 1),
(352, 21, 'Vlaams Brabant', 'VBR', 1),
(353, 21, 'West-Vlaanderen', 'VWV', 1),
(354, 22, 'Belize', 'BZ', 1),
(355, 22, 'Cayo', 'CY', 1),
(356, 22, 'Corozal', 'CR', 1),
(357, 22, 'Orange Walk', 'OW', 1),
(358, 22, 'Stann Creek', 'SC', 1),
(359, 22, 'Toledo', 'TO', 1),
(360, 23, 'Alibori', 'AL', 1),
(361, 23, 'Atakora', 'AK', 1),
(362, 23, 'Atlantique', 'AQ', 1),
(363, 23, 'Borgou', 'BO', 1),
(364, 23, 'Collines', 'CO', 1),
(365, 23, 'Donga', 'DO', 1),
(366, 23, 'Kouffo', 'KO', 1),
(367, 23, 'Littoral', 'LI', 1),
(368, 23, 'Mono', 'MO', 1),
(369, 23, 'Oueme', 'OU', 1),
(370, 23, 'Plateau', 'PL', 1),
(371, 23, 'Zou', 'ZO', 1),
(372, 24, 'Devonshire', 'DS', 1),
(373, 24, 'Hamilton City', 'HC', 1),
(374, 24, 'Hamilton', 'HA', 1),
(375, 24, 'Paget', 'PG', 1),
(376, 24, 'Pembroke', 'PB', 1),
(377, 24, 'Saint George City', 'GC', 1),
(378, 24, 'Saint George''s', 'SG', 1),
(379, 24, 'Sandys', 'SA', 1),
(380, 24, 'Smith''s', 'SM', 1),
(381, 24, 'Southampton', 'SH', 1),
(382, 24, 'Warwick', 'WA', 1),
(383, 25, 'Bumthang', 'BUM', 1),
(384, 25, 'Chukha', 'CHU', 1),
(385, 25, 'Dagana', 'DAG', 1),
(386, 25, 'Gasa', 'GAS', 1),
(387, 25, 'Haa', 'HAA', 1),
(388, 25, 'Lhuntse', 'LHU', 1),
(389, 25, 'Mongar', 'MON', 1),
(390, 25, 'Paro', 'PAR', 1),
(391, 25, 'Pemagatshel', 'PEM', 1),
(392, 25, 'Punakha', 'PUN', 1),
(393, 25, 'Samdrup Jongkhar', 'SJO', 1),
(394, 25, 'Samtse', 'SAT', 1),
(395, 25, 'Sarpang', 'SAR', 1),
(396, 25, 'Thimphu', 'THI', 1),
(397, 25, 'Trashigang', 'TRG', 1),
(398, 25, 'Trashiyangste', 'TRY', 1),
(399, 25, 'Trongsa', 'TRO', 1),
(400, 25, 'Tsirang', 'TSI', 1),
(401, 25, 'Wangdue Phodrang', 'WPH', 1),
(402, 25, 'Zhemgang', 'ZHE', 1),
(403, 26, 'Beni', 'BEN', 1),
(404, 26, 'Chuquisaca', 'CHU', 1),
(405, 26, 'Cochabamba', 'COC', 1),
(406, 26, 'La Paz', 'LPZ', 1),
(407, 26, 'Oruro', 'ORU', 1),
(408, 26, 'Pando', 'PAN', 1),
(409, 26, 'Potosi', 'POT', 1),
(410, 26, 'Santa Cruz', 'SCZ', 1),
(411, 26, 'Tarija', 'TAR', 1),
(412, 27, 'Brcko district', 'BRO', 1),
(413, 27, 'Unsko-Sanski Kanton', 'FUS', 1),
(414, 27, 'Posavski Kanton', 'FPO', 1),
(415, 27, 'Tuzlanski Kanton', 'FTU', 1),
(416, 27, 'Zenicko-Dobojski Kanton', 'FZE', 1),
(417, 27, 'Bosanskopodrinjski Kanton', 'FBP', 1),
(418, 27, 'Srednjebosanski Kanton', 'FSB', 1),
(419, 27, 'Hercegovacko-neretvanski Kanton', 'FHN', 1),
(420, 27, 'Zapadnohercegovacka Zupanija', 'FZH', 1),
(421, 27, 'Kanton Sarajevo', 'FSA', 1),
(422, 27, 'Zapadnobosanska', 'FZA', 1),
(423, 27, 'Banja Luka', 'SBL', 1),
(424, 27, 'Doboj', 'SDO', 1),
(425, 27, 'Bijeljina', 'SBI', 1),
(426, 27, 'Vlasenica', 'SVL', 1),
(427, 27, 'Sarajevo-Romanija or Sokolac', 'SSR', 1),
(428, 27, 'Foca', 'SFO', 1),
(429, 27, 'Trebinje', 'STR', 1),
(430, 28, 'Central', 'CE', 1),
(431, 28, 'Ghanzi', 'GH', 1),
(432, 28, 'Kgalagadi', 'KD', 1),
(433, 28, 'Kgatleng', 'KT', 1),
(434, 28, 'Kweneng', 'KW', 1),
(435, 28, 'Ngamiland', 'NG', 1),
(436, 28, 'North East', 'NE', 1),
(437, 28, 'North West', 'NW', 1),
(438, 28, 'South East', 'SE', 1),
(439, 28, 'Southern', 'SO', 1),
(440, 30, 'Acre', 'AC', 1),
(441, 30, 'Alagoas', 'AL', 1),
(442, 30, 'Amapá', 'AP', 1),
(443, 30, 'Amazonas', 'AM', 1),
(444, 30, 'Bahia', 'BA', 1),
(445, 30, 'Ceará', 'CE', 1),
(446, 30, 'Distrito Federal', 'DF', 1),
(447, 30, 'Espírito Santo', 'ES', 1),
(448, 30, 'Goiás', 'GO', 1),
(449, 30, 'Maranhão', 'MA', 1),
(450, 30, 'Mato Grosso', 'MT', 1),
(451, 30, 'Mato Grosso do Sul', 'MS', 1),
(452, 30, 'Minas Gerais', 'MG', 1),
(453, 30, 'Pará', 'PA', 1),
(454, 30, 'Paraíba', 'PB', 1),
(455, 30, 'Paraná', 'PR', 1),
(456, 30, 'Pernambuco', 'PE', 1),
(457, 30, 'Piauí', 'PI', 1),
(458, 30, 'Rio de Janeiro', 'RJ', 1),
(459, 30, 'Rio Grande do Norte', 'RN', 1),
(460, 30, 'Rio Grande do Sul', 'RS', 1),
(461, 30, 'Rondônia', 'RO', 1),
(462, 30, 'Roraima', 'RR', 1),
(463, 30, 'Santa Catarina', 'SC', 1),
(464, 30, 'São Paulo', 'SP', 1),
(465, 30, 'Sergipe', 'SE', 1),
(466, 30, 'Tocantins', 'TO', 1),
(467, 31, 'Peros Banhos', 'PB', 1),
(468, 31, 'Salomon Islands', 'SI', 1),
(469, 31, 'Nelsons Island', 'NI', 1),
(470, 31, 'Three Brothers', 'TB', 1),
(471, 31, 'Eagle Islands', 'EA', 1),
(472, 31, 'Danger Island', 'DI', 1),
(473, 31, 'Egmont Islands', 'EG', 1),
(474, 31, 'Diego Garcia', 'DG', 1),
(475, 32, 'Belait', 'BEL', 1),
(476, 32, 'Brunei and Muara', 'BRM', 1),
(477, 32, 'Temburong', 'TEM', 1),
(478, 32, 'Tutong', 'TUT', 1),
(479, 33, 'Blagoevgrad', '', 1),
(480, 33, 'Burgas', '', 1),
(481, 33, 'Dobrich', '', 1),
(482, 33, 'Gabrovo', '', 1),
(483, 33, 'Haskovo', '', 1),
(484, 33, 'Kardjali', '', 1),
(485, 33, 'Kyustendil', '', 1),
(486, 33, 'Lovech', '', 1),
(487, 33, 'Montana', '', 1),
(488, 33, 'Pazardjik', '', 1),
(489, 33, 'Pernik', '', 1),
(490, 33, 'Pleven', '', 1),
(491, 33, 'Plovdiv', '', 1),
(492, 33, 'Razgrad', '', 1),
(493, 33, 'Shumen', '', 1),
(494, 33, 'Silistra', '', 1),
(495, 33, 'Sliven', '', 1),
(496, 33, 'Smolyan', '', 1),
(497, 33, 'Sofia', '', 1),
(498, 33, 'Sofia - town', '', 1),
(499, 33, 'Stara Zagora', '', 1),
(500, 33, 'Targovishte', '', 1),
(501, 33, 'Varna', '', 1),
(502, 33, 'Veliko Tarnovo', '', 1),
(503, 33, 'Vidin', '', 1),
(504, 33, 'Vratza', '', 1),
(505, 33, 'Yambol', '', 1),
(506, 34, 'Bale', 'BAL', 1),
(507, 34, 'Bam', 'BAM', 1),
(508, 34, 'Banwa', 'BAN', 1),
(509, 34, 'Bazega', 'BAZ', 1),
(510, 34, 'Bougouriba', 'BOR', 1),
(511, 34, 'Boulgou', 'BLG', 1),
(512, 34, 'Boulkiemde', 'BOK', 1),
(513, 34, 'Comoe', 'COM', 1),
(514, 34, 'Ganzourgou', 'GAN', 1),
(515, 34, 'Gnagna', 'GNA', 1),
(516, 34, 'Gourma', 'GOU', 1),
(517, 34, 'Houet', 'HOU', 1),
(518, 34, 'Ioba', 'IOA', 1),
(519, 34, 'Kadiogo', 'KAD', 1),
(520, 34, 'Kenedougou', 'KEN', 1),
(521, 34, 'Komondjari', 'KOD', 1),
(522, 34, 'Kompienga', 'KOP', 1),
(523, 34, 'Kossi', 'KOS', 1),
(524, 34, 'Koulpelogo', 'KOL', 1),
(525, 34, 'Kouritenga', 'KOT', 1),
(526, 34, 'Kourweogo', 'KOW', 1),
(527, 34, 'Leraba', 'LER', 1),
(528, 34, 'Loroum', 'LOR', 1),
(529, 34, 'Mouhoun', 'MOU', 1),
(530, 34, 'Nahouri', 'NAH', 1),
(531, 34, 'Namentenga', 'NAM', 1),
(532, 34, 'Nayala', 'NAY', 1),
(533, 34, 'Noumbiel', 'NOU', 1),
(534, 34, 'Oubritenga', 'OUB', 1),
(535, 34, 'Oudalan', 'OUD', 1),
(536, 34, 'Passore', 'PAS', 1),
(537, 34, 'Poni', 'PON', 1),
(538, 34, 'Sanguie', 'SAG', 1),
(539, 34, 'Sanmatenga', 'SAM', 1),
(540, 34, 'Seno', 'SEN', 1),
(541, 34, 'Sissili', 'SIS', 1),
(542, 34, 'Soum', 'SOM', 1),
(543, 34, 'Sourou', 'SOR', 1),
(544, 34, 'Tapoa', 'TAP', 1),
(545, 34, 'Tuy', 'TUY', 1),
(546, 34, 'Yagha', 'YAG', 1),
(547, 34, 'Yatenga', 'YAT', 1),
(548, 34, 'Ziro', 'ZIR', 1),
(549, 34, 'Zondoma', 'ZOD', 1),
(550, 34, 'Zoundweogo', 'ZOW', 1),
(551, 35, 'Bubanza', 'BB', 1),
(552, 35, 'Bujumbura', 'BJ', 1),
(553, 35, 'Bururi', 'BR', 1),
(554, 35, 'Cankuzo', 'CA', 1),
(555, 35, 'Cibitoke', 'CI', 1),
(556, 35, 'Gitega', 'GI', 1),
(557, 35, 'Karuzi', 'KR', 1),
(558, 35, 'Kayanza', 'KY', 1),
(559, 35, 'Kirundo', 'KI', 1),
(560, 35, 'Makamba', 'MA', 1),
(561, 35, 'Muramvya', 'MU', 1),
(562, 35, 'Muyinga', 'MY', 1),
(563, 35, 'Mwaro', 'MW', 1),
(564, 35, 'Ngozi', 'NG', 1),
(565, 35, 'Rutana', 'RT', 1),
(566, 35, 'Ruyigi', 'RY', 1),
(567, 36, 'Phnom Penh', 'PP', 1),
(568, 36, 'Preah Seihanu (Kompong Som or Sihanoukville)', 'PS', 1),
(569, 36, 'Pailin', 'PA', 1),
(570, 36, 'Keb', 'KB', 1),
(571, 36, 'Banteay Meanchey', 'BM', 1),
(572, 36, 'Battambang', 'BA', 1),
(573, 36, 'Kampong Cham', 'KM', 1),
(574, 36, 'Kampong Chhnang', 'KN', 1),
(575, 36, 'Kampong Speu', 'KU', 1),
(576, 36, 'Kampong Som', 'KO', 1),
(577, 36, 'Kampong Thom', 'KT', 1),
(578, 36, 'Kampot', 'KP', 1),
(579, 36, 'Kandal', 'KL', 1),
(580, 36, 'Kaoh Kong', 'KK', 1),
(581, 36, 'Kratie', 'KR', 1),
(582, 36, 'Mondul Kiri', 'MK', 1),
(583, 36, 'Oddar Meancheay', 'OM', 1),
(584, 36, 'Pursat', 'PU', 1),
(585, 36, 'Preah Vihear', 'PR', 1),
(586, 36, 'Prey Veng', 'PG', 1),
(587, 36, 'Ratanak Kiri', 'RK', 1),
(588, 36, 'Siemreap', 'SI', 1),
(589, 36, 'Stung Treng', 'ST', 1),
(590, 36, 'Svay Rieng', 'SR', 1),
(591, 36, 'Takeo', 'TK', 1),
(592, 37, 'Adamawa (Adamaoua)', 'ADA', 1),
(593, 37, 'Centre', 'CEN', 1),
(594, 37, 'East (Est)', 'EST', 1),
(595, 37, 'Extreme North (Extreme-Nord)', 'EXN', 1),
(596, 37, 'Littoral', 'LIT', 1),
(597, 37, 'North (Nord)', 'NOR', 1),
(598, 37, 'Northwest (Nord-Ouest)', 'NOT', 1),
(599, 37, 'West (Ouest)', 'OUE', 1),
(600, 37, 'South (Sud)', 'SUD', 1),
(601, 37, 'Southwest (Sud-Ouest).', 'SOU', 1),
(602, 38, 'Alberta', 'AB', 1),
(603, 38, 'British Columbia', 'BC', 1),
(604, 38, 'Manitoba', 'MB', 1),
(605, 38, 'New Brunswick', 'NB', 1),
(606, 38, 'Newfoundland and Labrador', 'NL', 1),
(607, 38, 'Northwest Territories', 'NT', 1),
(608, 38, 'Nova Scotia', 'NS', 1),
(609, 38, 'Nunavut', 'NU', 1),
(610, 38, 'Ontario', 'ON', 1),
(611, 38, 'Prince Edward Island', 'PE', 1),
(612, 38, 'Qu&eacute;bec', 'QC', 1),
(613, 38, 'Saskatchewan', 'SK', 1),
(614, 38, 'Yukon Territory', 'YT', 1),
(615, 39, 'Boa Vista', 'BV', 1),
(616, 39, 'Brava', 'BR', 1),
(617, 39, 'Calheta de Sao Miguel', 'CS', 1),
(618, 39, 'Maio', 'MA', 1),
(619, 39, 'Mosteiros', 'MO', 1),
(620, 39, 'Paul', 'PA', 1),
(621, 39, 'Porto Novo', 'PN', 1),
(622, 39, 'Praia', 'PR', 1),
(623, 39, 'Ribeira Grande', 'RG', 1),
(624, 39, 'Sal', 'SL', 1),
(625, 39, 'Santa Catarina', 'CA', 1),
(626, 39, 'Santa Cruz', 'CR', 1),
(627, 39, 'Sao Domingos', 'SD', 1),
(628, 39, 'Sao Filipe', 'SF', 1),
(629, 39, 'Sao Nicolau', 'SN', 1),
(630, 39, 'Sao Vicente', 'SV', 1),
(631, 39, 'Tarrafal', 'TA', 1),
(632, 40, 'Creek', 'CR', 1),
(633, 40, 'Eastern', 'EA', 1),
(634, 40, 'Midland', 'ML', 1),
(635, 40, 'South Town', 'ST', 1),
(636, 40, 'Spot Bay', 'SP', 1),
(637, 40, 'Stake Bay', 'SK', 1),
(638, 40, 'West End', 'WD', 1),
(639, 40, 'Western', 'WN', 1),
(640, 41, 'Bamingui-Bangoran', 'BBA', 1),
(641, 41, 'Basse-Kotto', 'BKO', 1),
(642, 41, 'Haute-Kotto', 'HKO', 1),
(643, 41, 'Haut-Mbomou', 'HMB', 1),
(644, 41, 'Kemo', 'KEM', 1),
(645, 41, 'Lobaye', 'LOB', 1),
(646, 41, 'Mambere-KadeÔ', 'MKD', 1),
(647, 41, 'Mbomou', 'MBO', 1),
(648, 41, 'Nana-Mambere', 'NMM', 1),
(649, 41, 'Ombella-M''Poko', 'OMP', 1),
(650, 41, 'Ouaka', 'OUK', 1),
(651, 41, 'Ouham', 'OUH', 1),
(652, 41, 'Ouham-Pende', 'OPE', 1),
(653, 41, 'Vakaga', 'VAK', 1),
(654, 41, 'Nana-Grebizi', 'NGR', 1),
(655, 41, 'Sangha-Mbaere', 'SMB', 1),
(656, 41, 'Bangui', 'BAN', 1),
(657, 42, 'Batha', 'BA', 1),
(658, 42, 'Biltine', 'BI', 1),
(659, 42, 'Borkou-Ennedi-Tibesti', 'BE', 1),
(660, 42, 'Chari-Baguirmi', 'CB', 1),
(661, 42, 'Guera', 'GU', 1),
(662, 42, 'Kanem', 'KA', 1),
(663, 42, 'Lac', 'LA', 1),
(664, 42, 'Logone Occidental', 'LC', 1),
(665, 42, 'Logone Oriental', 'LR', 1),
(666, 42, 'Mayo-Kebbi', 'MK', 1),
(667, 42, 'Moyen-Chari', 'MC', 1),
(668, 42, 'Ouaddai', 'OU', 1),
(669, 42, 'Salamat', 'SA', 1),
(670, 42, 'Tandjile', 'TA', 1),
(671, 43, 'Aisen del General Carlos Ibanez', 'AI', 1),
(672, 43, 'Antofagasta', 'AN', 1),
(673, 43, 'Araucania', 'AR', 1),
(674, 43, 'Atacama', 'AT', 1),
(675, 43, 'Bio-Bio', 'BI', 1),
(676, 43, 'Coquimbo', 'CO', 1),
(677, 43, 'Libertador General Bernardo O''Higgins', 'LI', 1),
(678, 43, 'Los Lagos', 'LL', 1),
(679, 43, 'Magallanes y de la Antartica Chilena', 'MA', 1),
(680, 43, 'Maule', 'ML', 1),
(681, 43, 'Region Metropolitana', 'RM', 1),
(682, 43, 'Tarapaca', 'TA', 1),
(683, 43, 'Valparaiso', 'VS', 1),
(684, 44, 'Anhui', 'AN', 1),
(685, 44, 'Beijing', 'BE', 1),
(686, 44, 'Chongqing', 'CH', 1),
(687, 44, 'Fujian', 'FU', 1),
(688, 44, 'Gansu', 'GA', 1),
(689, 44, 'Guangdong', 'GU', 1),
(690, 44, 'Guangxi', 'GX', 1),
(691, 44, 'Guizhou', 'GZ', 1),
(692, 44, 'Hainan', 'HA', 1),
(693, 44, 'Hebei', 'HB', 1),
(694, 44, 'Heilongjiang', 'HL', 1),
(695, 44, 'Henan', 'HE', 1),
(696, 44, 'Hong Kong', 'HK', 1),
(697, 44, 'Hubei', 'HU', 1),
(698, 44, 'Hunan', 'HN', 1),
(699, 44, 'Inner Mongolia', 'IM', 1),
(700, 44, 'Jiangsu', 'JI', 1),
(701, 44, 'Jiangxi', 'JX', 1),
(702, 44, 'Jilin', 'JL', 1),
(703, 44, 'Liaoning', 'LI', 1),
(704, 44, 'Macau', 'MA', 1),
(705, 44, 'Ningxia', 'NI', 1),
(706, 44, 'Shaanxi', 'SH', 1),
(707, 44, 'Shandong', 'SA', 1),
(708, 44, 'Shanghai', 'SG', 1),
(709, 44, 'Shanxi', 'SX', 1),
(710, 44, 'Sichuan', 'SI', 1),
(711, 44, 'Tianjin', 'TI', 1),
(712, 44, 'Xinjiang', 'XI', 1),
(713, 44, 'Yunnan', 'YU', 1),
(714, 44, 'Zhejiang', 'ZH', 1),
(715, 46, 'Direction Island', 'D', 1),
(716, 46, 'Home Island', 'H', 1),
(717, 46, 'Horsburgh Island', 'O', 1),
(718, 46, 'South Island', 'S', 1),
(719, 46, 'West Island', 'W', 1),
(720, 47, 'Amazonas', 'AMZ', 1),
(721, 47, 'Antioquia', 'ANT', 1),
(722, 47, 'Arauca', 'ARA', 1),
(723, 47, 'Atlantico', 'ATL', 1),
(724, 47, 'Bogota D.C.', 'BDC', 1),
(725, 47, 'Bolivar', 'BOL', 1),
(726, 47, 'Boyaca', 'BOY', 1),
(727, 47, 'Caldas', 'CAL', 1),
(728, 47, 'Caqueta', 'CAQ', 1),
(729, 47, 'Casanare', 'CAS', 1),
(730, 47, 'Cauca', 'CAU', 1),
(731, 47, 'Cesar', 'CES', 1),
(732, 47, 'Choco', 'CHO', 1),
(733, 47, 'Cordoba', 'COR', 1),
(734, 47, 'Cundinamarca', 'CAM', 1),
(735, 47, 'Guainia', 'GNA', 1),
(736, 47, 'Guajira', 'GJR', 1),
(737, 47, 'Guaviare', 'GVR', 1),
(738, 47, 'Huila', 'HUI', 1),
(739, 47, 'Magdalena', 'MAG', 1),
(740, 47, 'Meta', 'MET', 1),
(741, 47, 'Narino', 'NAR', 1),
(742, 47, 'Norte de Santander', 'NDS', 1),
(743, 47, 'Putumayo', 'PUT', 1),
(744, 47, 'Quindio', 'QUI', 1),
(745, 47, 'Risaralda', 'RIS', 1),
(746, 47, 'San Andres y Providencia', 'SAP', 1),
(747, 47, 'Santander', 'SAN', 1),
(748, 47, 'Sucre', 'SUC', 1),
(749, 47, 'Tolima', 'TOL', 1),
(750, 47, 'Valle del Cauca', 'VDC', 1),
(751, 47, 'Vaupes', 'VAU', 1),
(752, 47, 'Vichada', 'VIC', 1),
(753, 48, 'Grande Comore', 'G', 1),
(754, 48, 'Anjouan', 'A', 1),
(755, 48, 'Moheli', 'M', 1),
(756, 49, 'Bouenza', 'BO', 1),
(757, 49, 'Brazzaville', 'BR', 1),
(758, 49, 'Cuvette', 'CU', 1),
(759, 49, 'Cuvette-Ouest', 'CO', 1),
(760, 49, 'Kouilou', 'KO', 1),
(761, 49, 'Lekoumou', 'LE', 1),
(762, 49, 'Likouala', 'LI', 1),
(763, 49, 'Niari', 'NI', 1),
(764, 49, 'Plateaux', 'PL', 1),
(765, 49, 'Pool', 'PO', 1),
(766, 49, 'Sangha', 'SA', 1),
(767, 50, 'Pukapuka', 'PU', 1),
(768, 50, 'Rakahanga', 'RK', 1),
(769, 50, 'Manihiki', 'MK', 1),
(770, 50, 'Penrhyn', 'PE', 1),
(771, 50, 'Nassau Island', 'NI', 1),
(772, 50, 'Surwarrow', 'SU', 1),
(773, 50, 'Palmerston', 'PA', 1),
(774, 50, 'Aitutaki', 'AI', 1),
(775, 50, 'Manuae', 'MA', 1),
(776, 50, 'Takutea', 'TA', 1),
(777, 50, 'Mitiaro', 'MT', 1),
(778, 50, 'Atiu', 'AT', 1),
(779, 50, 'Mauke', 'MU', 1),
(780, 50, 'Rarotonga', 'RR', 1),
(781, 50, 'Mangaia', 'MG', 1),
(782, 51, 'Alajuela', 'AL', 1),
(783, 51, 'Cartago', 'CA', 1),
(784, 51, 'Guanacaste', 'GU', 1),
(785, 51, 'Heredia', 'HE', 1),
(786, 51, 'Limon', 'LI', 1),
(787, 51, 'Puntarenas', 'PU', 1),
(788, 51, 'San Jose', 'SJ', 1),
(789, 52, 'Abengourou', 'ABE', 1),
(790, 52, 'Abidjan', 'ABI', 1),
(791, 52, 'Aboisso', 'ABO', 1),
(792, 52, 'Adiake', 'ADI', 1),
(793, 52, 'Adzope', 'ADZ', 1),
(794, 52, 'Agboville', 'AGB', 1),
(795, 52, 'Agnibilekrou', 'AGN', 1),
(796, 52, 'Alepe', 'ALE', 1),
(797, 52, 'Bocanda', 'BOC', 1),
(798, 52, 'Bangolo', 'BAN', 1),
(799, 52, 'Beoumi', 'BEO', 1),
(800, 52, 'Biankouma', 'BIA', 1),
(801, 52, 'Bondoukou', 'BDK', 1),
(802, 52, 'Bongouanou', 'BGN', 1),
(803, 52, 'Bouafle', 'BFL', 1),
(804, 52, 'Bouake', 'BKE', 1),
(805, 52, 'Bouna', 'BNA', 1),
(806, 52, 'Boundiali', 'BDL', 1),
(807, 52, 'Dabakala', 'DKL', 1),
(808, 52, 'Dabou', 'DBU', 1),
(809, 52, 'Daloa', 'DAL', 1),
(810, 52, 'Danane', 'DAN', 1),
(811, 52, 'Daoukro', 'DAO', 1),
(812, 52, 'Dimbokro', 'DIM', 1),
(813, 52, 'Divo', 'DIV', 1),
(814, 52, 'Duekoue', 'DUE', 1),
(815, 52, 'Ferkessedougou', 'FER', 1),
(816, 52, 'Gagnoa', 'GAG', 1),
(817, 52, 'Grand-Bassam', 'GBA', 1),
(818, 52, 'Grand-Lahou', 'GLA', 1),
(819, 52, 'Guiglo', 'GUI', 1),
(820, 52, 'Issia', 'ISS', 1),
(821, 52, 'Jacqueville', 'JAC', 1),
(822, 52, 'Katiola', 'KAT', 1),
(823, 52, 'Korhogo', 'KOR', 1),
(824, 52, 'Lakota', 'LAK', 1),
(825, 52, 'Man', 'MAN', 1),
(826, 52, 'Mankono', 'MKN', 1),
(827, 52, 'Mbahiakro', 'MBA', 1),
(828, 52, 'Odienne', 'ODI', 1),
(829, 52, 'Oume', 'OUM', 1),
(830, 52, 'Sakassou', 'SAK', 1),
(831, 52, 'San-Pedro', 'SPE', 1),
(832, 52, 'Sassandra', 'SAS', 1),
(833, 52, 'Seguela', 'SEG', 1),
(834, 52, 'Sinfra', 'SIN', 1),
(835, 52, 'Soubre', 'SOU', 1),
(836, 52, 'Tabou', 'TAB', 1),
(837, 52, 'Tanda', 'TAN', 1),
(838, 52, 'Tiebissou', 'TIE', 1),
(839, 52, 'Tingrela', 'TIN', 1),
(840, 52, 'Tiassale', 'TIA', 1),
(841, 52, 'Touba', 'TBA', 1),
(842, 52, 'Toulepleu', 'TLP', 1),
(843, 52, 'Toumodi', 'TMD', 1),
(844, 52, 'Vavoua', 'VAV', 1),
(845, 52, 'Yamoussoukro', 'YAM', 1),
(846, 52, 'Zuenoula', 'ZUE', 1),
(847, 53, 'Bjelovarsko-bilogorska', 'BB', 1),
(848, 53, 'Grad Zagreb', 'GZ', 1),
(849, 53, 'Dubrovačko-neretvanska', 'DN', 1),
(850, 53, 'Istarska', 'IS', 1),
(851, 53, 'Karlovačka', 'KA', 1),
(852, 53, 'Koprivničko-križevačka', 'KK', 1),
(853, 53, 'Krapinsko-zagorska', 'KZ', 1),
(854, 53, 'Ličko-senjska', 'LS', 1),
(855, 53, 'Međimurska', 'ME', 1),
(856, 53, 'Osječko-baranjska', 'OB', 1),
(857, 53, 'Požeško-slavonska', 'PS', 1),
(858, 53, 'Primorsko-goranska', 'PG', 1),
(859, 53, 'Šibensko-kninska', 'SK', 1),
(860, 53, 'Sisačko-moslavačka', 'SM', 1),
(861, 53, 'Brodsko-posavska', 'BP', 1),
(862, 53, 'Splitsko-dalmatinska', 'SD', 1),
(863, 53, 'Varaždinska', 'VA', 1),
(864, 53, 'Virovitičko-podravska', 'VP', 1),
(865, 53, 'Vukovarsko-srijemska', 'VS', 1),
(866, 53, 'Zadarska', 'ZA', 1),
(867, 53, 'Zagrebačka', 'ZG', 1),
(868, 54, 'Camaguey', 'CA', 1),
(869, 54, 'Ciego de Avila', 'CD', 1),
(870, 54, 'Cienfuegos', 'CI', 1),
(871, 54, 'Ciudad de La Habana', 'CH', 1),
(872, 54, 'Granma', 'GR', 1),
(873, 54, 'Guantanamo', 'GU', 1),
(874, 54, 'Holguin', 'HO', 1),
(875, 54, 'Isla de la Juventud', 'IJ', 1),
(876, 54, 'La Habana', 'LH', 1),
(877, 54, 'Las Tunas', 'LT', 1),
(878, 54, 'Matanzas', 'MA', 1),
(879, 54, 'Pinar del Rio', 'PR', 1),
(880, 54, 'Sancti Spiritus', 'SS', 1),
(881, 54, 'Santiago de Cuba', 'SC', 1),
(882, 54, 'Villa Clara', 'VC', 1),
(883, 55, 'Famagusta', 'F', 1),
(884, 55, 'Kyrenia', 'K', 1),
(885, 55, 'Larnaca', 'A', 1),
(886, 55, 'Limassol', 'I', 1),
(887, 55, 'Nicosia', 'N', 1),
(888, 55, 'Paphos', 'P', 1),
(889, 56, 'Ústecký', 'U', 1),
(890, 56, 'Jihočeský', 'C', 1),
(891, 56, 'Jihomoravský', 'B', 1),
(892, 56, 'Karlovarský', 'K', 1),
(893, 56, 'Královehradecký', 'H', 1),
(894, 56, 'Liberecký', 'L', 1),
(895, 56, 'Moravskoslezský', 'T', 1),
(896, 56, 'Olomoucký', 'M', 1),
(897, 56, 'Pardubický', 'E', 1),
(898, 56, 'Plzeňský', 'P', 1),
(899, 56, 'Praha', 'A', 1),
(900, 56, 'Středočeský', 'S', 1),
(901, 56, 'Vysočina', 'J', 1),
(902, 56, 'Zlínský', 'Z', 1),
(903, 57, 'Arhus', 'AR', 1),
(904, 57, 'Bornholm', 'BH', 1),
(905, 57, 'Copenhagen', 'CO', 1),
(906, 57, 'Faroe Islands', 'FO', 1),
(907, 57, 'Frederiksborg', 'FR', 1),
(908, 57, 'Fyn', 'FY', 1),
(909, 57, 'Kobenhavn', 'KO', 1),
(910, 57, 'Nordjylland', 'NO', 1),
(911, 57, 'Ribe', 'RI', 1),
(912, 57, 'Ringkobing', 'RK', 1),
(913, 57, 'Roskilde', 'RO', 1),
(914, 57, 'Sonderjylland', 'SO', 1),
(915, 57, 'Storstrom', 'ST', 1),
(916, 57, 'Vejle', 'VK', 1),
(917, 57, 'Vestj&aelig;lland', 'VJ', 1),
(918, 57, 'Viborg', 'VB', 1),
(919, 58, '''Ali Sabih', 'S', 1),
(920, 58, 'Dikhil', 'K', 1),
(921, 58, 'Djibouti', 'J', 1),
(922, 58, 'Obock', 'O', 1),
(923, 58, 'Tadjoura', 'T', 1),
(924, 59, 'Saint Andrew Parish', 'AND', 1),
(925, 59, 'Saint David Parish', 'DAV', 1),
(926, 59, 'Saint George Parish', 'GEO', 1),
(927, 59, 'Saint John Parish', 'JOH', 1),
(928, 59, 'Saint Joseph Parish', 'JOS', 1),
(929, 59, 'Saint Luke Parish', 'LUK', 1),
(930, 59, 'Saint Mark Parish', 'MAR', 1),
(931, 59, 'Saint Patrick Parish', 'PAT', 1),
(932, 59, 'Saint Paul Parish', 'PAU', 1),
(933, 59, 'Saint Peter Parish', 'PET', 1),
(934, 60, 'Distrito Nacional', 'DN', 1),
(935, 60, 'Azua', 'AZ', 1),
(936, 60, 'Baoruco', 'BC', 1),
(937, 60, 'Barahona', 'BH', 1),
(938, 60, 'Dajabon', 'DJ', 1),
(939, 60, 'Duarte', 'DU', 1),
(940, 60, 'Elias Pina', 'EL', 1),
(941, 60, 'El Seybo', 'SY', 1),
(942, 60, 'Espaillat', 'ET', 1),
(943, 60, 'Hato Mayor', 'HM', 1),
(944, 60, 'Independencia', 'IN', 1),
(945, 60, 'La Altagracia', 'AL', 1),
(946, 60, 'La Romana', 'RO', 1),
(947, 60, 'La Vega', 'VE', 1),
(948, 60, 'Maria Trinidad Sanchez', 'MT', 1),
(949, 60, 'Monsenor Nouel', 'MN', 1),
(950, 60, 'Monte Cristi', 'MC', 1),
(951, 60, 'Monte Plata', 'MP', 1),
(952, 60, 'Pedernales', 'PD', 1),
(953, 60, 'Peravia (Bani)', 'PR', 1),
(954, 60, 'Puerto Plata', 'PP', 1),
(955, 60, 'Salcedo', 'SL', 1),
(956, 60, 'Samana', 'SM', 1),
(957, 60, 'Sanchez Ramirez', 'SH', 1),
(958, 60, 'San Cristobal', 'SC', 1),
(959, 60, 'San Jose de Ocoa', 'JO', 1),
(960, 60, 'San Juan', 'SJ', 1),
(961, 60, 'San Pedro de Macoris', 'PM', 1),
(962, 60, 'Santiago', 'SA', 1),
(963, 60, 'Santiago Rodriguez', 'ST', 1),
(964, 60, 'Santo Domingo', 'SD', 1),
(965, 60, 'Valverde', 'VA', 1),
(966, 61, 'Aileu', 'AL', 1),
(967, 61, 'Ainaro', 'AN', 1),
(968, 61, 'Baucau', 'BA', 1),
(969, 61, 'Bobonaro', 'BO', 1),
(970, 61, 'Cova Lima', 'CO', 1),
(971, 61, 'Dili', 'DI', 1),
(972, 61, 'Ermera', 'ER', 1),
(973, 61, 'Lautem', 'LA', 1),
(974, 61, 'Liquica', 'LI', 1),
(975, 61, 'Manatuto', 'MT', 1),
(976, 61, 'Manufahi', 'MF', 1),
(977, 61, 'Oecussi', 'OE', 1),
(978, 61, 'Viqueque', 'VI', 1),
(979, 62, 'Azuay', 'AZU', 1),
(980, 62, 'Bolivar', 'BOL', 1),
(981, 62, 'Ca&ntilde;ar', 'CAN', 1),
(982, 62, 'Carchi', 'CAR', 1),
(983, 62, 'Chimborazo', 'CHI', 1),
(984, 62, 'Cotopaxi', 'COT', 1),
(985, 62, 'El Oro', 'EOR', 1),
(986, 62, 'Esmeraldas', 'ESM', 1),
(987, 62, 'Gal&aacute;pagos', 'GPS', 1),
(988, 62, 'Guayas', 'GUA', 1),
(989, 62, 'Imbabura', 'IMB', 1),
(990, 62, 'Loja', 'LOJ', 1),
(991, 62, 'Los Rios', 'LRO', 1),
(992, 62, 'Manab&iacute;', 'MAN', 1),
(993, 62, 'Morona Santiago', 'MSA', 1),
(994, 62, 'Napo', 'NAP', 1),
(995, 62, 'Orellana', 'ORE', 1),
(996, 62, 'Pastaza', 'PAS', 1),
(997, 62, 'Pichincha', 'PIC', 1),
(998, 62, 'Sucumb&iacute;os', 'SUC', 1),
(999, 62, 'Tungurahua', 'TUN', 1),
(1000, 62, 'Zamora Chinchipe', 'ZCH', 1),
(1001, 63, 'Ad Daqahliyah', 'DHY', 1),
(1002, 63, 'Al Bahr al Ahmar', 'BAM', 1),
(1003, 63, 'Al Buhayrah', 'BHY', 1),
(1004, 63, 'Al Fayyum', 'FYM', 1),
(1005, 63, 'Al Gharbiyah', 'GBY', 1),
(1006, 63, 'Al Iskandariyah', 'IDR', 1),
(1007, 63, 'Al Isma''iliyah', 'IML', 1),
(1008, 63, 'Al Jizah', 'JZH', 1),
(1009, 63, 'Al Minufiyah', 'MFY', 1),
(1010, 63, 'Al Minya', 'MNY', 1),
(1011, 63, 'Al Qahirah', 'QHR', 1),
(1012, 63, 'Al Qalyubiyah', 'QLY', 1),
(1013, 63, 'Al Wadi al Jadid', 'WJD', 1),
(1014, 63, 'Ash Sharqiyah', 'SHQ', 1),
(1015, 63, 'As Suways', 'SWY', 1),
(1016, 63, 'Aswan', 'ASW', 1),
(1017, 63, 'Asyut', 'ASY', 1),
(1018, 63, 'Bani Suwayf', 'BSW', 1),
(1019, 63, 'Bur Sa''id', 'BSD', 1),
(1020, 63, 'Dumyat', 'DMY', 1),
(1021, 63, 'Janub Sina''', 'JNS', 1),
(1022, 63, 'Kafr ash Shaykh', 'KSH', 1),
(1023, 63, 'Matruh', 'MAT', 1),
(1024, 63, 'Qina', 'QIN', 1),
(1025, 63, 'Shamal Sina''', 'SHS', 1),
(1026, 63, 'Suhaj', 'SUH', 1),
(1027, 64, 'Ahuachapan', 'AH', 1),
(1028, 64, 'Cabanas', 'CA', 1),
(1029, 64, 'Chalatenango', 'CH', 1),
(1030, 64, 'Cuscatlan', 'CU', 1),
(1031, 64, 'La Libertad', 'LB', 1),
(1032, 64, 'La Paz', 'PZ', 1),
(1033, 64, 'La Union', 'UN', 1),
(1034, 64, 'Morazan', 'MO', 1),
(1035, 64, 'San Miguel', 'SM', 1),
(1036, 64, 'San Salvador', 'SS', 1),
(1037, 64, 'San Vicente', 'SV', 1),
(1038, 64, 'Santa Ana', 'SA', 1),
(1039, 64, 'Sonsonate', 'SO', 1),
(1040, 64, 'Usulutan', 'US', 1),
(1041, 65, 'Provincia Annobon', 'AN', 1),
(1042, 65, 'Provincia Bioko Norte', 'BN', 1),
(1043, 65, 'Provincia Bioko Sur', 'BS', 1),
(1044, 65, 'Provincia Centro Sur', 'CS', 1),
(1045, 65, 'Provincia Kie-Ntem', 'KN', 1),
(1046, 65, 'Provincia Litoral', 'LI', 1),
(1047, 65, 'Provincia Wele-Nzas', 'WN', 1),
(1048, 66, 'Central (Maekel)', 'MA', 1),
(1049, 66, 'Anseba (Keren)', 'KE', 1),
(1050, 66, 'Southern Red Sea (Debub-Keih-Bahri)', 'DK', 1),
(1051, 66, 'Northern Red Sea (Semien-Keih-Bahri)', 'SK', 1),
(1052, 66, 'Southern (Debub)', 'DE', 1),
(1053, 66, 'Gash-Barka (Barentu)', 'BR', 1),
(1054, 67, 'Harjumaa (Tallinn)', 'HA', 1),
(1055, 67, 'Hiiumaa (Kardla)', 'HI', 1),
(1056, 67, 'Ida-Virumaa (Johvi)', 'IV', 1),
(1057, 67, 'Jarvamaa (Paide)', 'JA', 1),
(1058, 67, 'Jogevamaa (Jogeva)', 'JO', 1),
(1059, 67, 'Laane-Virumaa (Rakvere)', 'LV', 1),
(1060, 67, 'Laanemaa (Haapsalu)', 'LA', 1),
(1061, 67, 'Parnumaa (Parnu)', 'PA', 1),
(1062, 67, 'Polvamaa (Polva)', 'PO', 1),
(1063, 67, 'Raplamaa (Rapla)', 'RA', 1),
(1064, 67, 'Saaremaa (Kuessaare)', 'SA', 1),
(1065, 67, 'Tartumaa (Tartu)', 'TA', 1),
(1066, 67, 'Valgamaa (Valga)', 'VA', 1),
(1067, 67, 'Viljandimaa (Viljandi)', 'VI', 1),
(1068, 67, 'Vorumaa (Voru)', 'VO', 1),
(1069, 68, 'Afar', 'AF', 1),
(1070, 68, 'Amhara', 'AH', 1),
(1071, 68, 'Benishangul-Gumaz', 'BG', 1),
(1072, 68, 'Gambela', 'GB', 1),
(1073, 68, 'Hariai', 'HR', 1),
(1074, 68, 'Oromia', 'OR', 1),
(1075, 68, 'Somali', 'SM', 1),
(1076, 68, 'Southern Nations - Nationalities and Peoples Region', 'SN', 1),
(1077, 68, 'Tigray', 'TG', 1),
(1078, 68, 'Addis Ababa', 'AA', 1),
(1079, 68, 'Dire Dawa', 'DD', 1),
(1080, 71, 'Central Division', 'C', 1),
(1081, 71, 'Northern Division', 'N', 1),
(1082, 71, 'Eastern Division', 'E', 1),
(1083, 71, 'Western Division', 'W', 1),
(1084, 71, 'Rotuma', 'R', 1),
(1085, 72, 'Ahvenanmaan lääni', 'AL', 1),
(1086, 72, 'Etelä-Suomen lääni', 'ES', 1),
(1087, 72, 'Itä-Suomen lääni', 'IS', 1),
(1088, 72, 'Länsi-Suomen lääni', 'LS', 1),
(1089, 72, 'Lapin lääni', 'LA', 1),
(1090, 72, 'Oulun lääni', 'OU', 1),
(1114, 74, 'Ain', '01', 1),
(1115, 74, 'Aisne', '02', 1),
(1116, 74, 'Allier', '03', 1),
(1117, 74, 'Alpes de Haute Provence', '04', 1),
(1118, 74, 'Hautes-Alpes', '05', 1),
(1119, 74, 'Alpes Maritimes', '06', 1),
(1120, 74, 'Ard&egrave;che', '07', 1),
(1121, 74, 'Ardennes', '08', 1),
(1122, 74, 'Ari&egrave;ge', '09', 1),
(1123, 74, 'Aube', '10', 1),
(1124, 74, 'Aude', '11', 1),
(1125, 74, 'Aveyron', '12', 1),
(1126, 74, 'Bouches du Rh&ocirc;ne', '13', 1),
(1127, 74, 'Calvados', '14', 1),
(1128, 74, 'Cantal', '15', 1),
(1129, 74, 'Charente', '16', 1),
(1130, 74, 'Charente Maritime', '17', 1),
(1131, 74, 'Cher', '18', 1),
(1132, 74, 'Corr&egrave;ze', '19', 1),
(1133, 74, 'Corse du Sud', '2A', 1),
(1134, 74, 'Haute Corse', '2B', 1),
(1135, 74, 'C&ocirc;te d&#039;or', '21', 1),
(1136, 74, 'C&ocirc;tes d&#039;Armor', '22', 1),
(1137, 74, 'Creuse', '23', 1),
(1138, 74, 'Dordogne', '24', 1),
(1139, 74, 'Doubs', '25', 1),
(1140, 74, 'Dr&ocirc;me', '26', 1),
(1141, 74, 'Eure', '27', 1),
(1142, 74, 'Eure et Loir', '28', 1),
(1143, 74, 'Finist&egrave;re', '29', 1),
(1144, 74, 'Gard', '30', 1),
(1145, 74, 'Haute Garonne', '31', 1),
(1146, 74, 'Gers', '32', 1),
(1147, 74, 'Gironde', '33', 1),
(1148, 74, 'H&eacute;rault', '34', 1),
(1149, 74, 'Ille et Vilaine', '35', 1),
(1150, 74, 'Indre', '36', 1),
(1151, 74, 'Indre et Loire', '37', 1),
(1152, 74, 'Is&eacute;re', '38', 1),
(1153, 74, 'Jura', '39', 1),
(1154, 74, 'Landes', '40', 1),
(1155, 74, 'Loir et Cher', '41', 1),
(1156, 74, 'Loire', '42', 1),
(1157, 74, 'Haute Loire', '43', 1),
(1158, 74, 'Loire Atlantique', '44', 1),
(1159, 74, 'Loiret', '45', 1),
(1160, 74, 'Lot', '46', 1),
(1161, 74, 'Lot et Garonne', '47', 1),
(1162, 74, 'Loz&egrave;re', '48', 1),
(1163, 74, 'Maine et Loire', '49', 1),
(1164, 74, 'Manche', '50', 1),
(1165, 74, 'Marne', '51', 1),
(1166, 74, 'Haute Marne', '52', 1),
(1167, 74, 'Mayenne', '53', 1),
(1168, 74, 'Meurthe et Moselle', '54', 1),
(1169, 74, 'Meuse', '55', 1),
(1170, 74, 'Morbihan', '56', 1),
(1171, 74, 'Moselle', '57', 1),
(1172, 74, 'Ni&egrave;vre', '58', 1),
(1173, 74, 'Nord', '59', 1),
(1174, 74, 'Oise', '60', 1),
(1175, 74, 'Orne', '61', 1),
(1176, 74, 'Pas de Calais', '62', 1),
(1177, 74, 'Puy de D&ocirc;me', '63', 1),
(1178, 74, 'Pyr&eacute;n&eacute;es Atlantiques', '64', 1),
(1179, 74, 'Hautes Pyr&eacute;n&eacute;es', '65', 1),
(1180, 74, 'Pyr&eacute;n&eacute;es Orientales', '66', 1),
(1181, 74, 'Bas Rhin', '67', 1),
(1182, 74, 'Haut Rhin', '68', 1),
(1183, 74, 'Rh&ocirc;ne', '69', 1),
(1184, 74, 'Haute Sa&ocirc;ne', '70', 1),
(1185, 74, 'Sa&ocirc;ne et Loire', '71', 1),
(1186, 74, 'Sarthe', '72', 1),
(1187, 74, 'Savoie', '73', 1),
(1188, 74, 'Haute Savoie', '74', 1),
(1189, 74, 'Paris', '75', 1),
(1190, 74, 'Seine Maritime', '76', 1),
(1191, 74, 'Seine et Marne', '77', 1),
(1192, 74, 'Yvelines', '78', 1),
(1193, 74, 'Deux S&egrave;vres', '79', 1),
(1194, 74, 'Somme', '80', 1),
(1195, 74, 'Tarn', '81', 1),
(1196, 74, 'Tarn et Garonne', '82', 1),
(1197, 74, 'Var', '83', 1),
(1198, 74, 'Vaucluse', '84', 1),
(1199, 74, 'Vend&eacute;e', '85', 1),
(1200, 74, 'Vienne', '86', 1),
(1201, 74, 'Haute Vienne', '87', 1),
(1202, 74, 'Vosges', '88', 1),
(1203, 74, 'Yonne', '89', 1),
(1204, 74, 'Territoire de Belfort', '90', 1),
(1205, 74, 'Essonne', '91', 1),
(1206, 74, 'Hauts de Seine', '92', 1),
(1207, 74, 'Seine St-Denis', '93', 1),
(1208, 74, 'Val de Marne', '94', 1),
(1209, 74, 'Val d''Oise', '95', 1),
(1210, 76, 'Archipel des Marquises', 'M', 1),
(1211, 76, 'Archipel des Tuamotu', 'T', 1),
(1212, 76, 'Archipel des Tubuai', 'I', 1),
(1213, 76, 'Iles du Vent', 'V', 1),
(1214, 76, 'Iles Sous-le-Vent', 'S', 1),
(1215, 77, 'Iles Crozet', 'C', 1),
(1216, 77, 'Iles Kerguelen', 'K', 1),
(1217, 77, 'Ile Amsterdam', 'A', 1),
(1218, 77, 'Ile Saint-Paul', 'P', 1),
(1219, 77, 'Adelie Land', 'D', 1),
(1220, 78, 'Estuaire', 'ES', 1),
(1221, 78, 'Haut-Ogooue', 'HO', 1),
(1222, 78, 'Moyen-Ogooue', 'MO', 1),
(1223, 78, 'Ngounie', 'NG', 1),
(1224, 78, 'Nyanga', 'NY', 1),
(1225, 78, 'Ogooue-Ivindo', 'OI', 1),
(1226, 78, 'Ogooue-Lolo', 'OL', 1),
(1227, 78, 'Ogooue-Maritime', 'OM', 1),
(1228, 78, 'Woleu-Ntem', 'WN', 1),
(1229, 79, 'Banjul', 'BJ', 1),
(1230, 79, 'Basse', 'BS', 1),
(1231, 79, 'Brikama', 'BR', 1),
(1232, 79, 'Janjangbure', 'JA', 1),
(1233, 79, 'Kanifeng', 'KA', 1),
(1234, 79, 'Kerewan', 'KE', 1),
(1235, 79, 'Kuntaur', 'KU', 1),
(1236, 79, 'Mansakonko', 'MA', 1),
(1237, 79, 'Lower River', 'LR', 1),
(1238, 79, 'Central River', 'CR', 1),
(1239, 79, 'North Bank', 'NB', 1),
(1240, 79, 'Upper River', 'UR', 1),
(1241, 79, 'Western', 'WE', 1),
(1242, 80, 'Abkhazia', 'AB', 1),
(1243, 80, 'Ajaria', 'AJ', 1),
(1244, 80, 'Tbilisi', 'TB', 1),
(1245, 80, 'Guria', 'GU', 1),
(1246, 80, 'Imereti', 'IM', 1),
(1247, 80, 'Kakheti', 'KA', 1),
(1248, 80, 'Kvemo Kartli', 'KK', 1),
(1249, 80, 'Mtskheta-Mtianeti', 'MM', 1),
(1250, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 1),
(1251, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 1),
(1252, 80, 'Samtskhe-Javakheti', 'SJ', 1),
(1253, 80, 'Shida Kartli', 'SK', 1),
(1254, 81, 'Baden-W&uuml;rttemberg', 'BAW', 1),
(1255, 81, 'Bayern', 'BAY', 1),
(1256, 81, 'Berlin', 'BER', 1),
(1257, 81, 'Brandenburg', 'BRG', 1),
(1258, 81, 'Bremen', 'BRE', 1),
(1259, 81, 'Hamburg', 'HAM', 1),
(1260, 81, 'Hessen', 'HES', 1),
(1261, 81, 'Mecklenburg-Vorpommern', 'MEC', 1),
(1262, 81, 'Niedersachsen', 'NDS', 1),
(1263, 81, 'Nordrhein-Westfalen', 'NRW', 1),
(1264, 81, 'Rheinland-Pfalz', 'RHE', 1),
(1265, 81, 'Saarland', 'SAR', 1),
(1266, 81, 'Sachsen', 'SAS', 1),
(1267, 81, 'Sachsen-Anhalt', 'SAC', 1),
(1268, 81, 'Schleswig-Holstein', 'SCN', 1),
(1269, 81, 'Th&uuml;ringen', 'THE', 1),
(1270, 82, 'Ashanti Region', 'AS', 1),
(1271, 82, 'Brong-Ahafo Region', 'BA', 1),
(1272, 82, 'Central Region', 'CE', 1),
(1273, 82, 'Eastern Region', 'EA', 1),
(1274, 82, 'Greater Accra Region', 'GA', 1),
(1275, 82, 'Northern Region', 'NO', 1),
(1276, 82, 'Upper East Region', 'UE', 1),
(1277, 82, 'Upper West Region', 'UW', 1),
(1278, 82, 'Volta Region', 'VO', 1),
(1279, 82, 'Western Region', 'WE', 1),
(1280, 84, 'Attica', 'AT', 1),
(1281, 84, 'Central Greece', 'CN', 1),
(1282, 84, 'Central Macedonia', 'CM', 1),
(1283, 84, 'Crete', 'CR', 1),
(1284, 84, 'East Macedonia and Thrace', 'EM', 1),
(1285, 84, 'Epirus', 'EP', 1),
(1286, 84, 'Ionian Islands', 'II', 1),
(1287, 84, 'North Aegean', 'NA', 1),
(1288, 84, 'Peloponnesos', 'PP', 1),
(1289, 84, 'South Aegean', 'SA', 1),
(1290, 84, 'Thessaly', 'TH', 1),
(1291, 84, 'West Greece', 'WG', 1),
(1292, 84, 'West Macedonia', 'WM', 1),
(1293, 85, 'Avannaa', 'A', 1),
(1294, 85, 'Tunu', 'T', 1),
(1295, 85, 'Kitaa', 'K', 1),
(1296, 86, 'Saint Andrew', 'A', 1),
(1297, 86, 'Saint David', 'D', 1),
(1298, 86, 'Saint George', 'G', 1),
(1299, 86, 'Saint John', 'J', 1),
(1300, 86, 'Saint Mark', 'M', 1),
(1301, 86, 'Saint Patrick', 'P', 1),
(1302, 86, 'Carriacou', 'C', 1),
(1303, 86, 'Petit Martinique', 'Q', 1),
(1304, 89, 'Alta Verapaz', 'AV', 1),
(1305, 89, 'Baja Verapaz', 'BV', 1),
(1306, 89, 'Chimaltenango', 'CM', 1),
(1307, 89, 'Chiquimula', 'CQ', 1),
(1308, 89, 'El Peten', 'PE', 1),
(1309, 89, 'El Progreso', 'PR', 1),
(1310, 89, 'El Quiche', 'QC', 1),
(1311, 89, 'Escuintla', 'ES', 1),
(1312, 89, 'Guatemala', 'GU', 1),
(1313, 89, 'Huehuetenango', 'HU', 1),
(1314, 89, 'Izabal', 'IZ', 1),
(1315, 89, 'Jalapa', 'JA', 1),
(1316, 89, 'Jutiapa', 'JU', 1),
(1317, 89, 'Quetzaltenango', 'QZ', 1),
(1318, 89, 'Retalhuleu', 'RE', 1),
(1319, 89, 'Sacatepequez', 'ST', 1),
(1320, 89, 'San Marcos', 'SM', 1),
(1321, 89, 'Santa Rosa', 'SR', 1),
(1322, 89, 'Solola', 'SO', 1),
(1323, 89, 'Suchitepequez', 'SU', 1),
(1324, 89, 'Totonicapan', 'TO', 1),
(1325, 89, 'Zacapa', 'ZA', 1),
(1326, 90, 'Conakry', 'CNK', 1),
(1327, 90, 'Beyla', 'BYL', 1),
(1328, 90, 'Boffa', 'BFA', 1),
(1329, 90, 'Boke', 'BOK', 1),
(1330, 90, 'Coyah', 'COY', 1),
(1331, 90, 'Dabola', 'DBL', 1),
(1332, 90, 'Dalaba', 'DLB', 1),
(1333, 90, 'Dinguiraye', 'DGR', 1),
(1334, 90, 'Dubreka', 'DBR', 1),
(1335, 90, 'Faranah', 'FRN', 1),
(1336, 90, 'Forecariah', 'FRC', 1),
(1337, 90, 'Fria', 'FRI', 1),
(1338, 90, 'Gaoual', 'GAO', 1),
(1339, 90, 'Gueckedou', 'GCD', 1),
(1340, 90, 'Kankan', 'KNK', 1),
(1341, 90, 'Kerouane', 'KRN', 1),
(1342, 90, 'Kindia', 'KND', 1),
(1343, 90, 'Kissidougou', 'KSD', 1),
(1344, 90, 'Koubia', 'KBA', 1),
(1345, 90, 'Koundara', 'KDA', 1),
(1346, 90, 'Kouroussa', 'KRA', 1),
(1347, 90, 'Labe', 'LAB', 1),
(1348, 90, 'Lelouma', 'LLM', 1),
(1349, 90, 'Lola', 'LOL', 1),
(1350, 90, 'Macenta', 'MCT', 1),
(1351, 90, 'Mali', 'MAL', 1),
(1352, 90, 'Mamou', 'MAM', 1),
(1353, 90, 'Mandiana', 'MAN', 1),
(1354, 90, 'Nzerekore', 'NZR', 1),
(1355, 90, 'Pita', 'PIT', 1),
(1356, 90, 'Siguiri', 'SIG', 1),
(1357, 90, 'Telimele', 'TLM', 1),
(1358, 90, 'Tougue', 'TOG', 1),
(1359, 90, 'Yomou', 'YOM', 1),
(1360, 91, 'Bafata Region', 'BF', 1),
(1361, 91, 'Biombo Region', 'BB', 1),
(1362, 91, 'Bissau Region', 'BS', 1),
(1363, 91, 'Bolama Region', 'BL', 1),
(1364, 91, 'Cacheu Region', 'CA', 1),
(1365, 91, 'Gabu Region', 'GA', 1),
(1366, 91, 'Oio Region', 'OI', 1),
(1367, 91, 'Quinara Region', 'QU', 1),
(1368, 91, 'Tombali Region', 'TO', 1),
(1369, 92, 'Barima-Waini', 'BW', 1),
(1370, 92, 'Cuyuni-Mazaruni', 'CM', 1),
(1371, 92, 'Demerara-Mahaica', 'DM', 1),
(1372, 92, 'East Berbice-Corentyne', 'EC', 1),
(1373, 92, 'Essequibo Islands-West Demerara', 'EW', 1),
(1374, 92, 'Mahaica-Berbice', 'MB', 1),
(1375, 92, 'Pomeroon-Supenaam', 'PM', 1),
(1376, 92, 'Potaro-Siparuni', 'PI', 1),
(1377, 92, 'Upper Demerara-Berbice', 'UD', 1),
(1378, 92, 'Upper Takutu-Upper Essequibo', 'UT', 1),
(1379, 93, 'Artibonite', 'AR', 1),
(1380, 93, 'Centre', 'CE', 1),
(1381, 93, 'Grand''Anse', 'GA', 1),
(1382, 93, 'Nord', 'ND', 1),
(1383, 93, 'Nord-Est', 'NE', 1),
(1384, 93, 'Nord-Ouest', 'NO', 1),
(1385, 93, 'Ouest', 'OU', 1),
(1386, 93, 'Sud', 'SD', 1),
(1387, 93, 'Sud-Est', 'SE', 1),
(1388, 94, 'Flat Island', 'F', 1),
(1389, 94, 'McDonald Island', 'M', 1),
(1390, 94, 'Shag Island', 'S', 1),
(1391, 94, 'Heard Island', 'H', 1),
(1392, 95, 'Atlantida', 'AT', 1),
(1393, 95, 'Choluteca', 'CH', 1),
(1394, 95, 'Colon', 'CL', 1),
(1395, 95, 'Comayagua', 'CM', 1),
(1396, 95, 'Copan', 'CP', 1),
(1397, 95, 'Cortes', 'CR', 1),
(1398, 95, 'El Paraiso', 'PA', 1),
(1399, 95, 'Francisco Morazan', 'FM', 1),
(1400, 95, 'Gracias a Dios', 'GD', 1),
(1401, 95, 'Intibuca', 'IN', 1),
(1402, 95, 'Islas de la Bahia (Bay Islands)', 'IB', 1),
(1403, 95, 'La Paz', 'PZ', 1),
(1404, 95, 'Lempira', 'LE', 1),
(1405, 95, 'Ocotepeque', 'OC', 1),
(1406, 95, 'Olancho', 'OL', 1),
(1407, 95, 'Santa Barbara', 'SB', 1),
(1408, 95, 'Valle', 'VA', 1),
(1409, 95, 'Yoro', 'YO', 1),
(1410, 96, 'Central and Western Hong Kong Island', 'HCW', 1),
(1411, 96, 'Eastern Hong Kong Island', 'HEA', 1),
(1412, 96, 'Southern Hong Kong Island', 'HSO', 1),
(1413, 96, 'Wan Chai Hong Kong Island', 'HWC', 1),
(1414, 96, 'Kowloon City Kowloon', 'KKC', 1),
(1415, 96, 'Kwun Tong Kowloon', 'KKT', 1),
(1416, 96, 'Sham Shui Po Kowloon', 'KSS', 1),
(1417, 96, 'Wong Tai Sin Kowloon', 'KWT', 1),
(1418, 96, 'Yau Tsim Mong Kowloon', 'KYT', 1),
(1419, 96, 'Islands New Territories', 'NIS', 1),
(1420, 96, 'Kwai Tsing New Territories', 'NKT', 1),
(1421, 96, 'North New Territories', 'NNO', 1),
(1422, 96, 'Sai Kung New Territories', 'NSK', 1),
(1423, 96, 'Sha Tin New Territories', 'NST', 1),
(1424, 96, 'Tai Po New Territories', 'NTP', 1),
(1425, 96, 'Tsuen Wan New Territories', 'NTW', 1),
(1426, 96, 'Tuen Mun New Territories', 'NTM', 1),
(1427, 96, 'Yuen Long New Territories', 'NYL', 1),
(1467, 98, 'Austurland', 'AL', 1),
(1468, 98, 'Hofuoborgarsvaeoi', 'HF', 1),
(1469, 98, 'Norourland eystra', 'NE', 1),
(1470, 98, 'Norourland vestra', 'NV', 1),
(1471, 98, 'Suourland', 'SL', 1),
(1472, 98, 'Suournes', 'SN', 1),
(1473, 98, 'Vestfiroir', 'VF', 1),
(1474, 98, 'Vesturland', 'VL', 1),
(1475, 99, 'Andaman and Nicobar Islands', 'AN', 1),
(1476, 99, 'Andhra Pradesh', 'AP', 1),
(1477, 99, 'Arunachal Pradesh', 'AR', 1),
(1478, 99, 'Assam', 'AS', 1),
(1479, 99, 'Bihar', 'BI', 1),
(1480, 99, 'Chandigarh', 'CH', 1),
(1481, 99, 'Dadra and Nagar Haveli', 'DA', 1),
(1482, 99, 'Daman and Diu', 'DM', 1),
(1483, 99, 'Delhi', 'DE', 1),
(1484, 99, 'Goa', 'GO', 1),
(1485, 99, 'Gujarat', 'GU', 1),
(1486, 99, 'Haryana', 'HA', 1),
(1487, 99, 'Himachal Pradesh', 'HP', 1),
(1488, 99, 'Jammu and Kashmir', 'JA', 1),
(1489, 99, 'Karnataka', 'KA', 1),
(1490, 99, 'Kerala', 'KE', 1),
(1491, 99, 'Lakshadweep Islands', 'LI', 1),
(1492, 99, 'Madhya Pradesh', 'MP', 1),
(1493, 99, 'Maharashtra', 'MA', 1),
(1494, 99, 'Manipur', 'MN', 1),
(1495, 99, 'Meghalaya', 'ME', 1),
(1496, 99, 'Mizoram', 'MI', 1),
(1497, 99, 'Nagaland', 'NA', 1),
(1498, 99, 'Orissa', 'OR', 1),
(1499, 99, 'Puducherry', 'PO', 1),
(1500, 99, 'Punjab', 'PU', 1),
(1501, 99, 'Rajasthan', 'RA', 1),
(1502, 99, 'Sikkim', 'SI', 1),
(1503, 99, 'Tamil Nadu', 'TN', 1),
(1504, 99, 'Tripura', 'TR', 1),
(1505, 99, 'Uttar Pradesh', 'UP', 1),
(1506, 99, 'West Bengal', 'WB', 1),
(1507, 100, 'Aceh', 'AC', 1),
(1508, 100, 'Bali', 'BA', 1),
(1509, 100, 'Banten', 'BT', 1),
(1510, 100, 'Bengkulu', 'BE', 1),
(1511, 100, 'BoDeTaBek', 'BD', 1),
(1512, 100, 'Gorontalo', 'GO', 1),
(1513, 100, 'Jakarta Raya', 'JK', 1),
(1514, 100, 'Jambi', 'JA', 1),
(1515, 100, 'Jawa Barat', 'JB', 1),
(1516, 100, 'Jawa Tengah', 'JT', 1),
(1517, 100, 'Jawa Timur', 'JI', 1),
(1518, 100, 'Kalimantan Barat', 'KB', 1),
(1519, 100, 'Kalimantan Selatan', 'KS', 1),
(1520, 100, 'Kalimantan Tengah', 'KT', 1),
(1521, 100, 'Kalimantan Timur', 'KI', 1),
(1522, 100, 'Kepulauan Bangka Belitung', 'BB', 1),
(1523, 100, 'Lampung', 'LA', 1),
(1524, 100, 'Maluku', 'MA', 1),
(1525, 100, 'Maluku Utara', 'MU', 1),
(1526, 100, 'Nusa Tenggara Barat', 'NB', 1),
(1527, 100, 'Nusa Tenggara Timur', 'NT', 1),
(1528, 100, 'Papua', 'PA', 1),
(1529, 100, 'Riau', 'RI', 1),
(1530, 100, 'Sulawesi Selatan', 'SN', 1),
(1531, 100, 'Sulawesi Tengah', 'ST', 1),
(1532, 100, 'Sulawesi Tenggara', 'SG', 1),
(1533, 100, 'Sulawesi Utara', 'SA', 1),
(1534, 100, 'Sumatera Barat', 'SB', 1),
(1535, 100, 'Sumatera Selatan', 'SS', 1),
(1536, 100, 'Sumatera Utara', 'SU', 1),
(1537, 100, 'Yogyakarta', 'YO', 1),
(1538, 101, 'Tehran', 'TEH', 1),
(1539, 101, 'Qom', 'QOM', 1),
(1540, 101, 'Markazi', 'MKZ', 1),
(1541, 101, 'Qazvin', 'QAZ', 1),
(1542, 101, 'Gilan', 'GIL', 1),
(1543, 101, 'Ardabil', 'ARD', 1),
(1544, 101, 'Zanjan', 'ZAN', 1),
(1545, 101, 'East Azarbaijan', 'EAZ', 1),
(1546, 101, 'West Azarbaijan', 'WEZ', 1),
(1547, 101, 'Kurdistan', 'KRD', 1),
(1548, 101, 'Hamadan', 'HMD', 1),
(1549, 101, 'Kermanshah', 'KRM', 1),
(1550, 101, 'Ilam', 'ILM', 1),
(1551, 101, 'Lorestan', 'LRS', 1),
(1552, 101, 'Khuzestan', 'KZT', 1),
(1553, 101, 'Chahar Mahaal and Bakhtiari', 'CMB', 1),
(1554, 101, 'Kohkiluyeh and Buyer Ahmad', 'KBA', 1),
(1555, 101, 'Bushehr', 'BSH', 1),
(1556, 101, 'Fars', 'FAR', 1),
(1557, 101, 'Hormozgan', 'HRM', 1),
(1558, 101, 'Sistan and Baluchistan', 'SBL', 1),
(1559, 101, 'Kerman', 'KRB', 1),
(1560, 101, 'Yazd', 'YZD', 1),
(1561, 101, 'Esfahan', 'EFH', 1),
(1562, 101, 'Semnan', 'SMN', 1),
(1563, 101, 'Mazandaran', 'MZD', 1),
(1564, 101, 'Golestan', 'GLS', 1),
(1565, 101, 'North Khorasan', 'NKH', 1),
(1566, 101, 'Razavi Khorasan', 'RKH', 1),
(1567, 101, 'South Khorasan', 'SKH', 1),
(1568, 102, 'Baghdad', 'BD', 1),
(1569, 102, 'Salah ad Din', 'SD', 1),
(1570, 102, 'Diyala', 'DY', 1),
(1571, 102, 'Wasit', 'WS', 1),
(1572, 102, 'Maysan', 'MY', 1),
(1573, 102, 'Al Basrah', 'BA', 1),
(1574, 102, 'Dhi Qar', 'DQ', 1),
(1575, 102, 'Al Muthanna', 'MU', 1),
(1576, 102, 'Al Qadisyah', 'QA', 1),
(1577, 102, 'Babil', 'BB', 1),
(1578, 102, 'Al Karbala', 'KB', 1),
(1579, 102, 'An Najaf', 'NJ', 1),
(1580, 102, 'Al Anbar', 'AB', 1),
(1581, 102, 'Ninawa', 'NN', 1),
(1582, 102, 'Dahuk', 'DH', 1),
(1583, 102, 'Arbil', 'AL', 1),
(1584, 102, 'At Ta''mim', 'TM', 1),
(1585, 102, 'As Sulaymaniyah', 'SL', 1),
(1586, 103, 'Carlow', 'CA', 1),
(1587, 103, 'Cavan', 'CV', 1),
(1588, 103, 'Clare', 'CL', 1),
(1589, 103, 'Cork', 'CO', 1),
(1590, 103, 'Donegal', 'DO', 1),
(1591, 103, 'Dublin', 'DU', 1),
(1592, 103, 'Galway', 'GA', 1),
(1593, 103, 'Kerry', 'KE', 1),
(1594, 103, 'Kildare', 'KI', 1),
(1595, 103, 'Kilkenny', 'KL', 1),
(1596, 103, 'Laois', 'LA', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1597, 103, 'Leitrim', 'LE', 1),
(1598, 103, 'Limerick', 'LI', 1),
(1599, 103, 'Longford', 'LO', 1),
(1600, 103, 'Louth', 'LU', 1),
(1601, 103, 'Mayo', 'MA', 1),
(1602, 103, 'Meath', 'ME', 1),
(1603, 103, 'Monaghan', 'MO', 1),
(1604, 103, 'Offaly', 'OF', 1),
(1605, 103, 'Roscommon', 'RO', 1),
(1606, 103, 'Sligo', 'SL', 1),
(1607, 103, 'Tipperary', 'TI', 1),
(1608, 103, 'Waterford', 'WA', 1),
(1609, 103, 'Westmeath', 'WE', 1),
(1610, 103, 'Wexford', 'WX', 1),
(1611, 103, 'Wicklow', 'WI', 1),
(1612, 104, 'Be''er Sheva', 'BS', 1),
(1613, 104, 'Bika''at Hayarden', 'BH', 1),
(1614, 104, 'Eilat and Arava', 'EA', 1),
(1615, 104, 'Galil', 'GA', 1),
(1616, 104, 'Haifa', 'HA', 1),
(1617, 104, 'Jehuda Mountains', 'JM', 1),
(1618, 104, 'Jerusalem', 'JE', 1),
(1619, 104, 'Negev', 'NE', 1),
(1620, 104, 'Semaria', 'SE', 1),
(1621, 104, 'Sharon', 'SH', 1),
(1622, 104, 'Tel Aviv (Gosh Dan)', 'TA', 1),
(3860, 105, 'Caltanissetta', 'CL', 1),
(3842, 105, 'Agrigento', 'AG', 1),
(3843, 105, 'Alessandria', 'AL', 1),
(3844, 105, 'Ancona', 'AN', 1),
(3845, 105, 'Aosta', 'AO', 1),
(3846, 105, 'Arezzo', 'AR', 1),
(3847, 105, 'Ascoli Piceno', 'AP', 1),
(3848, 105, 'Asti', 'AT', 1),
(3849, 105, 'Avellino', 'AV', 1),
(3850, 105, 'Bari', 'BA', 1),
(3851, 105, 'Belluno', 'BL', 1),
(3852, 105, 'Benevento', 'BN', 1),
(3853, 105, 'Bergamo', 'BG', 1),
(3854, 105, 'Biella', 'BI', 1),
(3855, 105, 'Bologna', 'BO', 1),
(3856, 105, 'Bolzano', 'BZ', 1),
(3857, 105, 'Brescia', 'BS', 1),
(3858, 105, 'Brindisi', 'BR', 1),
(3859, 105, 'Cagliari', 'CA', 1),
(1643, 106, 'Clarendon Parish', 'CLA', 1),
(1644, 106, 'Hanover Parish', 'HAN', 1),
(1645, 106, 'Kingston Parish', 'KIN', 1),
(1646, 106, 'Manchester Parish', 'MAN', 1),
(1647, 106, 'Portland Parish', 'POR', 1),
(1648, 106, 'Saint Andrew Parish', 'AND', 1),
(1649, 106, 'Saint Ann Parish', 'ANN', 1),
(1650, 106, 'Saint Catherine Parish', 'CAT', 1),
(1651, 106, 'Saint Elizabeth Parish', 'ELI', 1),
(1652, 106, 'Saint James Parish', 'JAM', 1),
(1653, 106, 'Saint Mary Parish', 'MAR', 1),
(1654, 106, 'Saint Thomas Parish', 'THO', 1),
(1655, 106, 'Trelawny Parish', 'TRL', 1),
(1656, 106, 'Westmoreland Parish', 'WML', 1),
(1657, 107, 'Aichi', 'AI', 1),
(1658, 107, 'Akita', 'AK', 1),
(1659, 107, 'Aomori', 'AO', 1),
(1660, 107, 'Chiba', 'CH', 1),
(1661, 107, 'Ehime', 'EH', 1),
(1662, 107, 'Fukui', 'FK', 1),
(1663, 107, 'Fukuoka', 'FU', 1),
(1664, 107, 'Fukushima', 'FS', 1),
(1665, 107, 'Gifu', 'GI', 1),
(1666, 107, 'Gumma', 'GU', 1),
(1667, 107, 'Hiroshima', 'HI', 1),
(1668, 107, 'Hokkaido', 'HO', 1),
(1669, 107, 'Hyogo', 'HY', 1),
(1670, 107, 'Ibaraki', 'IB', 1),
(1671, 107, 'Ishikawa', 'IS', 1),
(1672, 107, 'Iwate', 'IW', 1),
(1673, 107, 'Kagawa', 'KA', 1),
(1674, 107, 'Kagoshima', 'KG', 1),
(1675, 107, 'Kanagawa', 'KN', 1),
(1676, 107, 'Kochi', 'KO', 1),
(1677, 107, 'Kumamoto', 'KU', 1),
(1678, 107, 'Kyoto', 'KY', 1),
(1679, 107, 'Mie', 'MI', 1),
(1680, 107, 'Miyagi', 'MY', 1),
(1681, 107, 'Miyazaki', 'MZ', 1),
(1682, 107, 'Nagano', 'NA', 1),
(1683, 107, 'Nagasaki', 'NG', 1),
(1684, 107, 'Nara', 'NR', 1),
(1685, 107, 'Niigata', 'NI', 1),
(1686, 107, 'Oita', 'OI', 1),
(1687, 107, 'Okayama', 'OK', 1),
(1688, 107, 'Okinawa', 'ON', 1),
(1689, 107, 'Osaka', 'OS', 1),
(1690, 107, 'Saga', 'SA', 1),
(1691, 107, 'Saitama', 'SI', 1),
(1692, 107, 'Shiga', 'SH', 1),
(1693, 107, 'Shimane', 'SM', 1),
(1694, 107, 'Shizuoka', 'SZ', 1),
(1695, 107, 'Tochigi', 'TO', 1),
(1696, 107, 'Tokushima', 'TS', 1),
(1697, 107, 'Tokyo', 'TK', 1),
(1698, 107, 'Tottori', 'TT', 1),
(1699, 107, 'Toyama', 'TY', 1),
(1700, 107, 'Wakayama', 'WA', 1),
(1701, 107, 'Yamagata', 'YA', 1),
(1702, 107, 'Yamaguchi', 'YM', 1),
(1703, 107, 'Yamanashi', 'YN', 1),
(1704, 108, '''Amman', 'AM', 1),
(1705, 108, 'Ajlun', 'AJ', 1),
(1706, 108, 'Al ''Aqabah', 'AA', 1),
(1707, 108, 'Al Balqa''', 'AB', 1),
(1708, 108, 'Al Karak', 'AK', 1),
(1709, 108, 'Al Mafraq', 'AL', 1),
(1710, 108, 'At Tafilah', 'AT', 1),
(1711, 108, 'Az Zarqa''', 'AZ', 1),
(1712, 108, 'Irbid', 'IR', 1),
(1713, 108, 'Jarash', 'JA', 1),
(1714, 108, 'Ma''an', 'MA', 1),
(1715, 108, 'Madaba', 'MD', 1),
(1716, 109, 'Almaty', 'AL', 1),
(1717, 109, 'Almaty City', 'AC', 1),
(1718, 109, 'Aqmola', 'AM', 1),
(1719, 109, 'Aqtobe', 'AQ', 1),
(1720, 109, 'Astana City', 'AS', 1),
(1721, 109, 'Atyrau', 'AT', 1),
(1722, 109, 'Batys Qazaqstan', 'BA', 1),
(1723, 109, 'Bayqongyr City', 'BY', 1),
(1724, 109, 'Mangghystau', 'MA', 1),
(1725, 109, 'Ongtustik Qazaqstan', 'ON', 1),
(1726, 109, 'Pavlodar', 'PA', 1),
(1727, 109, 'Qaraghandy', 'QA', 1),
(1728, 109, 'Qostanay', 'QO', 1),
(1729, 109, 'Qyzylorda', 'QY', 1),
(1730, 109, 'Shyghys Qazaqstan', 'SH', 1),
(1731, 109, 'Soltustik Qazaqstan', 'SO', 1),
(1732, 109, 'Zhambyl', 'ZH', 1),
(1733, 110, 'Central', 'CE', 1),
(1734, 110, 'Coast', 'CO', 1),
(1735, 110, 'Eastern', 'EA', 1),
(1736, 110, 'Nairobi Area', 'NA', 1),
(1737, 110, 'North Eastern', 'NE', 1),
(1738, 110, 'Nyanza', 'NY', 1),
(1739, 110, 'Rift Valley', 'RV', 1),
(1740, 110, 'Western', 'WE', 1),
(1741, 111, 'Abaiang', 'AG', 1),
(1742, 111, 'Abemama', 'AM', 1),
(1743, 111, 'Aranuka', 'AK', 1),
(1744, 111, 'Arorae', 'AO', 1),
(1745, 111, 'Banaba', 'BA', 1),
(1746, 111, 'Beru', 'BE', 1),
(1747, 111, 'Butaritari', 'bT', 1),
(1748, 111, 'Kanton', 'KA', 1),
(1749, 111, 'Kiritimati', 'KR', 1),
(1750, 111, 'Kuria', 'KU', 1),
(1751, 111, 'Maiana', 'MI', 1),
(1752, 111, 'Makin', 'MN', 1),
(1753, 111, 'Marakei', 'ME', 1),
(1754, 111, 'Nikunau', 'NI', 1),
(1755, 111, 'Nonouti', 'NO', 1),
(1756, 111, 'Onotoa', 'ON', 1),
(1757, 111, 'Tabiteuea', 'TT', 1),
(1758, 111, 'Tabuaeran', 'TR', 1),
(1759, 111, 'Tamana', 'TM', 1),
(1760, 111, 'Tarawa', 'TW', 1),
(1761, 111, 'Teraina', 'TE', 1),
(1762, 112, 'Chagang-do', 'CHA', 1),
(1763, 112, 'Hamgyong-bukto', 'HAB', 1),
(1764, 112, 'Hamgyong-namdo', 'HAN', 1),
(1765, 112, 'Hwanghae-bukto', 'HWB', 1),
(1766, 112, 'Hwanghae-namdo', 'HWN', 1),
(1767, 112, 'Kangwon-do', 'KAN', 1),
(1768, 112, 'P''yongan-bukto', 'PYB', 1),
(1769, 112, 'P''yongan-namdo', 'PYN', 1),
(1770, 112, 'Ryanggang-do (Yanggang-do)', 'YAN', 1),
(1771, 112, 'Rason Directly Governed City', 'NAJ', 1),
(1772, 112, 'P''yongyang Special City', 'PYO', 1),
(1773, 113, 'Ch''ungch''ong-bukto', 'CO', 1),
(1774, 113, 'Ch''ungch''ong-namdo', 'CH', 1),
(1775, 113, 'Cheju-do', 'CD', 1),
(1776, 113, 'Cholla-bukto', 'CB', 1),
(1777, 113, 'Cholla-namdo', 'CN', 1),
(1778, 113, 'Inch''on-gwangyoksi', 'IG', 1),
(1779, 113, 'Kangwon-do', 'KA', 1),
(1780, 113, 'Kwangju-gwangyoksi', 'KG', 1),
(1781, 113, 'Kyonggi-do', 'KD', 1),
(1782, 113, 'Kyongsang-bukto', 'KB', 1),
(1783, 113, 'Kyongsang-namdo', 'KN', 1),
(1784, 113, 'Pusan-gwangyoksi', 'PG', 1),
(1785, 113, 'Soul-t''ukpyolsi', 'SO', 1),
(1786, 113, 'Taegu-gwangyoksi', 'TA', 1),
(1787, 113, 'Taejon-gwangyoksi', 'TG', 1),
(1788, 114, 'Al ''Asimah', 'AL', 1),
(1789, 114, 'Al Ahmadi', 'AA', 1),
(1790, 114, 'Al Farwaniyah', 'AF', 1),
(1791, 114, 'Al Jahra''', 'AJ', 1),
(1792, 114, 'Hawalli', 'HA', 1),
(1793, 115, 'Bishkek', 'GB', 1),
(1794, 115, 'Batken', 'B', 1),
(1795, 115, 'Chu', 'C', 1),
(1796, 115, 'Jalal-Abad', 'J', 1),
(1797, 115, 'Naryn', 'N', 1),
(1798, 115, 'Osh', 'O', 1),
(1799, 115, 'Talas', 'T', 1),
(1800, 115, 'Ysyk-Kol', 'Y', 1),
(1801, 116, 'Vientiane', 'VT', 1),
(1802, 116, 'Attapu', 'AT', 1),
(1803, 116, 'Bokeo', 'BK', 1),
(1804, 116, 'Bolikhamxai', 'BL', 1),
(1805, 116, 'Champasak', 'CH', 1),
(1806, 116, 'Houaphan', 'HO', 1),
(1807, 116, 'Khammouan', 'KH', 1),
(1808, 116, 'Louang Namtha', 'LM', 1),
(1809, 116, 'Louangphabang', 'LP', 1),
(1810, 116, 'Oudomxai', 'OU', 1),
(1811, 116, 'Phongsali', 'PH', 1),
(1812, 116, 'Salavan', 'SL', 1),
(1813, 116, 'Savannakhet', 'SV', 1),
(1814, 116, 'Vientiane', 'VI', 1),
(1815, 116, 'Xaignabouli', 'XA', 1),
(1816, 116, 'Xekong', 'XE', 1),
(1817, 116, 'Xiangkhoang', 'XI', 1),
(1818, 116, 'Xaisomboun', 'XN', 1),
(1852, 119, 'Berea', 'BE', 1),
(1853, 119, 'Butha-Buthe', 'BB', 1),
(1854, 119, 'Leribe', 'LE', 1),
(1855, 119, 'Mafeteng', 'MF', 1),
(1856, 119, 'Maseru', 'MS', 1),
(1857, 119, 'Mohale''s Hoek', 'MH', 1),
(1858, 119, 'Mokhotlong', 'MK', 1),
(1859, 119, 'Qacha''s Nek', 'QN', 1),
(1860, 119, 'Quthing', 'QT', 1),
(1861, 119, 'Thaba-Tseka', 'TT', 1),
(1862, 120, 'Bomi', 'BI', 1),
(1863, 120, 'Bong', 'BG', 1),
(1864, 120, 'Grand Bassa', 'GB', 1),
(1865, 120, 'Grand Cape Mount', 'CM', 1),
(1866, 120, 'Grand Gedeh', 'GG', 1),
(1867, 120, 'Grand Kru', 'GK', 1),
(1868, 120, 'Lofa', 'LO', 1),
(1869, 120, 'Margibi', 'MG', 1),
(1870, 120, 'Maryland', 'ML', 1),
(1871, 120, 'Montserrado', 'MS', 1),
(1872, 120, 'Nimba', 'NB', 1),
(1873, 120, 'River Cess', 'RC', 1),
(1874, 120, 'Sinoe', 'SN', 1),
(1875, 121, 'Ajdabiya', 'AJ', 1),
(1876, 121, 'Al ''Aziziyah', 'AZ', 1),
(1877, 121, 'Al Fatih', 'FA', 1),
(1878, 121, 'Al Jabal al Akhdar', 'JA', 1),
(1879, 121, 'Al Jufrah', 'JU', 1),
(1880, 121, 'Al Khums', 'KH', 1),
(1881, 121, 'Al Kufrah', 'KU', 1),
(1882, 121, 'An Nuqat al Khams', 'NK', 1),
(1883, 121, 'Ash Shati''', 'AS', 1),
(1884, 121, 'Awbari', 'AW', 1),
(1885, 121, 'Az Zawiyah', 'ZA', 1),
(1886, 121, 'Banghazi', 'BA', 1),
(1887, 121, 'Darnah', 'DA', 1),
(1888, 121, 'Ghadamis', 'GD', 1),
(1889, 121, 'Gharyan', 'GY', 1),
(1890, 121, 'Misratah', 'MI', 1),
(1891, 121, 'Murzuq', 'MZ', 1),
(1892, 121, 'Sabha', 'SB', 1),
(1893, 121, 'Sawfajjin', 'SW', 1),
(1894, 121, 'Surt', 'SU', 1),
(1895, 121, 'Tarabulus (Tripoli)', 'TL', 1),
(1896, 121, 'Tarhunah', 'TH', 1),
(1897, 121, 'Tubruq', 'TU', 1),
(1898, 121, 'Yafran', 'YA', 1),
(1899, 121, 'Zlitan', 'ZL', 1),
(1900, 122, 'Vaduz', 'V', 1),
(1901, 122, 'Schaan', 'A', 1),
(1902, 122, 'Balzers', 'B', 1),
(1903, 122, 'Triesen', 'N', 1),
(1904, 122, 'Eschen', 'E', 1),
(1905, 122, 'Mauren', 'M', 1),
(1906, 122, 'Triesenberg', 'T', 1),
(1907, 122, 'Ruggell', 'R', 1),
(1908, 122, 'Gamprin', 'G', 1),
(1909, 122, 'Schellenberg', 'L', 1),
(1910, 122, 'Planken', 'P', 1),
(1911, 123, 'Alytus', 'AL', 1),
(1912, 123, 'Kaunas', 'KA', 1),
(1913, 123, 'Klaipeda', 'KL', 1),
(1914, 123, 'Marijampole', 'MA', 1),
(1915, 123, 'Panevezys', 'PA', 1),
(1916, 123, 'Siauliai', 'SI', 1),
(1917, 123, 'Taurage', 'TA', 1),
(1918, 123, 'Telsiai', 'TE', 1),
(1919, 123, 'Utena', 'UT', 1),
(1920, 123, 'Vilnius', 'VI', 1),
(1921, 124, 'Diekirch', 'DD', 1),
(1922, 124, 'Clervaux', 'DC', 1),
(1923, 124, 'Redange', 'DR', 1),
(1924, 124, 'Vianden', 'DV', 1),
(1925, 124, 'Wiltz', 'DW', 1),
(1926, 124, 'Grevenmacher', 'GG', 1),
(1927, 124, 'Echternach', 'GE', 1),
(1928, 124, 'Remich', 'GR', 1),
(1929, 124, 'Luxembourg', 'LL', 1),
(1930, 124, 'Capellen', 'LC', 1),
(1931, 124, 'Esch-sur-Alzette', 'LE', 1),
(1932, 124, 'Mersch', 'LM', 1),
(1933, 125, 'Our Lady Fatima Parish', 'OLF', 1),
(1934, 125, 'St. Anthony Parish', 'ANT', 1),
(1935, 125, 'St. Lazarus Parish', 'LAZ', 1),
(1936, 125, 'Cathedral Parish', 'CAT', 1),
(1937, 125, 'St. Lawrence Parish', 'LAW', 1),
(1938, 127, 'Antananarivo', 'AN', 1),
(1939, 127, 'Antsiranana', 'AS', 1),
(1940, 127, 'Fianarantsoa', 'FN', 1),
(1941, 127, 'Mahajanga', 'MJ', 1),
(1942, 127, 'Toamasina', 'TM', 1),
(1943, 127, 'Toliara', 'TL', 1),
(1944, 128, 'Balaka', 'BLK', 1),
(1945, 128, 'Blantyre', 'BLT', 1),
(1946, 128, 'Chikwawa', 'CKW', 1),
(1947, 128, 'Chiradzulu', 'CRD', 1),
(1948, 128, 'Chitipa', 'CTP', 1),
(1949, 128, 'Dedza', 'DDZ', 1),
(1950, 128, 'Dowa', 'DWA', 1),
(1951, 128, 'Karonga', 'KRG', 1),
(1952, 128, 'Kasungu', 'KSG', 1),
(1953, 128, 'Likoma', 'LKM', 1),
(1954, 128, 'Lilongwe', 'LLG', 1),
(1955, 128, 'Machinga', 'MCG', 1),
(1956, 128, 'Mangochi', 'MGC', 1),
(1957, 128, 'Mchinji', 'MCH', 1),
(1958, 128, 'Mulanje', 'MLJ', 1),
(1959, 128, 'Mwanza', 'MWZ', 1),
(1960, 128, 'Mzimba', 'MZM', 1),
(1961, 128, 'Ntcheu', 'NTU', 1),
(1962, 128, 'Nkhata Bay', 'NKB', 1),
(1963, 128, 'Nkhotakota', 'NKH', 1),
(1964, 128, 'Nsanje', 'NSJ', 1),
(1965, 128, 'Ntchisi', 'NTI', 1),
(1966, 128, 'Phalombe', 'PHL', 1),
(1967, 128, 'Rumphi', 'RMP', 1),
(1968, 128, 'Salima', 'SLM', 1),
(1969, 128, 'Thyolo', 'THY', 1),
(1970, 128, 'Zomba', 'ZBA', 1),
(1971, 129, 'Johor', 'MY-01', 1),
(1972, 129, 'Kedah', 'MY-02', 1),
(1973, 129, 'Kelantan', 'MY-03', 1),
(1974, 129, 'Labuan', 'MY-15', 1),
(1975, 129, 'Melaka', 'MY-04', 1),
(1976, 129, 'Negeri Sembilan', 'MY-05', 1),
(1977, 129, 'Pahang', 'MY-06', 1),
(1978, 129, 'Perak', 'MY-08', 1),
(1979, 129, 'Perlis', 'MY-09', 1),
(1980, 129, 'Pulau Pinang', 'MY-07', 1),
(1981, 129, 'Sabah', 'MY-12', 1),
(1982, 129, 'Sarawak', 'MY-13', 1),
(1983, 129, 'Selangor', 'MY-10', 1),
(1984, 129, 'Terengganu', 'MY-11', 1),
(1985, 129, 'Kuala Lumpur', 'MY-14', 1),
(4035, 129, 'Putrajaya', 'MY-16', 1),
(1986, 130, 'Thiladhunmathi Uthuru', 'THU', 1),
(1987, 130, 'Thiladhunmathi Dhekunu', 'THD', 1),
(1988, 130, 'Miladhunmadulu Uthuru', 'MLU', 1),
(1989, 130, 'Miladhunmadulu Dhekunu', 'MLD', 1),
(1990, 130, 'Maalhosmadulu Uthuru', 'MAU', 1),
(1991, 130, 'Maalhosmadulu Dhekunu', 'MAD', 1),
(1992, 130, 'Faadhippolhu', 'FAA', 1),
(1993, 130, 'Male Atoll', 'MAA', 1),
(1994, 130, 'Ari Atoll Uthuru', 'AAU', 1),
(1995, 130, 'Ari Atoll Dheknu', 'AAD', 1),
(1996, 130, 'Felidhe Atoll', 'FEA', 1),
(1997, 130, 'Mulaku Atoll', 'MUA', 1),
(1998, 130, 'Nilandhe Atoll Uthuru', 'NAU', 1),
(1999, 130, 'Nilandhe Atoll Dhekunu', 'NAD', 1),
(2000, 130, 'Kolhumadulu', 'KLH', 1),
(2001, 130, 'Hadhdhunmathi', 'HDH', 1),
(2002, 130, 'Huvadhu Atoll Uthuru', 'HAU', 1),
(2003, 130, 'Huvadhu Atoll Dhekunu', 'HAD', 1),
(2004, 130, 'Fua Mulaku', 'FMU', 1),
(2005, 130, 'Addu', 'ADD', 1),
(2006, 131, 'Gao', 'GA', 1),
(2007, 131, 'Kayes', 'KY', 1),
(2008, 131, 'Kidal', 'KD', 1),
(2009, 131, 'Koulikoro', 'KL', 1),
(2010, 131, 'Mopti', 'MP', 1),
(2011, 131, 'Segou', 'SG', 1),
(2012, 131, 'Sikasso', 'SK', 1),
(2013, 131, 'Tombouctou', 'TB', 1),
(2014, 131, 'Bamako Capital District', 'CD', 1),
(2015, 132, 'Attard', 'ATT', 1),
(2016, 132, 'Balzan', 'BAL', 1),
(2017, 132, 'Birgu', 'BGU', 1),
(2018, 132, 'Birkirkara', 'BKK', 1),
(2019, 132, 'Birzebbuga', 'BRZ', 1),
(2020, 132, 'Bormla', 'BOR', 1),
(2021, 132, 'Dingli', 'DIN', 1),
(2022, 132, 'Fgura', 'FGU', 1),
(2023, 132, 'Floriana', 'FLO', 1),
(2024, 132, 'Gudja', 'GDJ', 1),
(2025, 132, 'Gzira', 'GZR', 1),
(2026, 132, 'Gargur', 'GRG', 1),
(2027, 132, 'Gaxaq', 'GXQ', 1),
(2028, 132, 'Hamrun', 'HMR', 1),
(2029, 132, 'Iklin', 'IKL', 1),
(2030, 132, 'Isla', 'ISL', 1),
(2031, 132, 'Kalkara', 'KLK', 1),
(2032, 132, 'Kirkop', 'KRK', 1),
(2033, 132, 'Lija', 'LIJ', 1),
(2034, 132, 'Luqa', 'LUQ', 1),
(2035, 132, 'Marsa', 'MRS', 1),
(2036, 132, 'Marsaskala', 'MKL', 1),
(2037, 132, 'Marsaxlokk', 'MXL', 1),
(2038, 132, 'Mdina', 'MDN', 1),
(2039, 132, 'Melliea', 'MEL', 1),
(2040, 132, 'Mgarr', 'MGR', 1),
(2041, 132, 'Mosta', 'MST', 1),
(2042, 132, 'Mqabba', 'MQA', 1),
(2043, 132, 'Msida', 'MSI', 1),
(2044, 132, 'Mtarfa', 'MTF', 1),
(2045, 132, 'Naxxar', 'NAX', 1),
(2046, 132, 'Paola', 'PAO', 1),
(2047, 132, 'Pembroke', 'PEM', 1),
(2048, 132, 'Pieta', 'PIE', 1),
(2049, 132, 'Qormi', 'QOR', 1),
(2050, 132, 'Qrendi', 'QRE', 1),
(2051, 132, 'Rabat', 'RAB', 1),
(2052, 132, 'Safi', 'SAF', 1),
(2053, 132, 'San Giljan', 'SGI', 1),
(2054, 132, 'Santa Lucija', 'SLU', 1),
(2055, 132, 'San Pawl il-Bahar', 'SPB', 1),
(2056, 132, 'San Gwann', 'SGW', 1),
(2057, 132, 'Santa Venera', 'SVE', 1),
(2058, 132, 'Siggiewi', 'SIG', 1),
(2059, 132, 'Sliema', 'SLM', 1),
(2060, 132, 'Swieqi', 'SWQ', 1),
(2061, 132, 'Ta Xbiex', 'TXB', 1),
(2062, 132, 'Tarxien', 'TRX', 1),
(2063, 132, 'Valletta', 'VLT', 1),
(2064, 132, 'Xgajra', 'XGJ', 1),
(2065, 132, 'Zabbar', 'ZBR', 1),
(2066, 132, 'Zebbug', 'ZBG', 1),
(2067, 132, 'Zejtun', 'ZJT', 1),
(2068, 132, 'Zurrieq', 'ZRQ', 1),
(2069, 132, 'Fontana', 'FNT', 1),
(2070, 132, 'Ghajnsielem', 'GHJ', 1),
(2071, 132, 'Gharb', 'GHR', 1),
(2072, 132, 'Ghasri', 'GHS', 1),
(2073, 132, 'Kercem', 'KRC', 1),
(2074, 132, 'Munxar', 'MUN', 1),
(2075, 132, 'Nadur', 'NAD', 1),
(2076, 132, 'Qala', 'QAL', 1),
(2077, 132, 'Victoria', 'VIC', 1),
(2078, 132, 'San Lawrenz', 'SLA', 1),
(2079, 132, 'Sannat', 'SNT', 1),
(2080, 132, 'Xagra', 'ZAG', 1),
(2081, 132, 'Xewkija', 'XEW', 1),
(2082, 132, 'Zebbug', 'ZEB', 1),
(2083, 133, 'Ailinginae', 'ALG', 1),
(2084, 133, 'Ailinglaplap', 'ALL', 1),
(2085, 133, 'Ailuk', 'ALK', 1),
(2086, 133, 'Arno', 'ARN', 1),
(2087, 133, 'Aur', 'AUR', 1),
(2088, 133, 'Bikar', 'BKR', 1),
(2089, 133, 'Bikini', 'BKN', 1),
(2090, 133, 'Bokak', 'BKK', 1),
(2091, 133, 'Ebon', 'EBN', 1),
(2092, 133, 'Enewetak', 'ENT', 1),
(2093, 133, 'Erikub', 'EKB', 1),
(2094, 133, 'Jabat', 'JBT', 1),
(2095, 133, 'Jaluit', 'JLT', 1),
(2096, 133, 'Jemo', 'JEM', 1),
(2097, 133, 'Kili', 'KIL', 1),
(2098, 133, 'Kwajalein', 'KWJ', 1),
(2099, 133, 'Lae', 'LAE', 1),
(2100, 133, 'Lib', 'LIB', 1),
(2101, 133, 'Likiep', 'LKP', 1),
(2102, 133, 'Majuro', 'MJR', 1),
(2103, 133, 'Maloelap', 'MLP', 1),
(2104, 133, 'Mejit', 'MJT', 1),
(2105, 133, 'Mili', 'MIL', 1),
(2106, 133, 'Namorik', 'NMK', 1),
(2107, 133, 'Namu', 'NAM', 1),
(2108, 133, 'Rongelap', 'RGL', 1),
(2109, 133, 'Rongrik', 'RGK', 1),
(2110, 133, 'Toke', 'TOK', 1),
(2111, 133, 'Ujae', 'UJA', 1),
(2112, 133, 'Ujelang', 'UJL', 1),
(2113, 133, 'Utirik', 'UTK', 1),
(2114, 133, 'Wotho', 'WTH', 1),
(2115, 133, 'Wotje', 'WTJ', 1),
(2116, 135, 'Adrar', 'AD', 1),
(2117, 135, 'Assaba', 'AS', 1),
(2118, 135, 'Brakna', 'BR', 1),
(2119, 135, 'Dakhlet Nouadhibou', 'DN', 1),
(2120, 135, 'Gorgol', 'GO', 1),
(2121, 135, 'Guidimaka', 'GM', 1),
(2122, 135, 'Hodh Ech Chargui', 'HC', 1),
(2123, 135, 'Hodh El Gharbi', 'HG', 1),
(2124, 135, 'Inchiri', 'IN', 1),
(2125, 135, 'Tagant', 'TA', 1),
(2126, 135, 'Tiris Zemmour', 'TZ', 1),
(2127, 135, 'Trarza', 'TR', 1),
(2128, 135, 'Nouakchott', 'NO', 1),
(2129, 136, 'Beau Bassin-Rose Hill', 'BR', 1),
(2130, 136, 'Curepipe', 'CU', 1),
(2131, 136, 'Port Louis', 'PU', 1),
(2132, 136, 'Quatre Bornes', 'QB', 1),
(2133, 136, 'Vacoas-Phoenix', 'VP', 1),
(2134, 136, 'Agalega Islands', 'AG', 1),
(2135, 136, 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', 1),
(2136, 136, 'Rodrigues', 'RO', 1),
(2137, 136, 'Black River', 'BL', 1),
(2138, 136, 'Flacq', 'FL', 1),
(2139, 136, 'Grand Port', 'GP', 1),
(2140, 136, 'Moka', 'MO', 1),
(2141, 136, 'Pamplemousses', 'PA', 1),
(2142, 136, 'Plaines Wilhems', 'PW', 1),
(2143, 136, 'Port Louis', 'PL', 1),
(2144, 136, 'Riviere du Rempart', 'RR', 1),
(2145, 136, 'Savanne', 'SA', 1),
(2146, 138, 'Baja California Norte', 'BN', 1),
(2147, 138, 'Baja California Sur', 'BS', 1),
(2148, 138, 'Campeche', 'CA', 1),
(2149, 138, 'Chiapas', 'CI', 1),
(2150, 138, 'Chihuahua', 'CH', 1),
(2151, 138, 'Coahuila de Zaragoza', 'CZ', 1),
(2152, 138, 'Colima', 'CL', 1),
(2153, 138, 'Distrito Federal', 'DF', 1),
(2154, 138, 'Durango', 'DU', 1),
(2155, 138, 'Guanajuato', 'GA', 1),
(2156, 138, 'Guerrero', 'GE', 1),
(2157, 138, 'Hidalgo', 'HI', 1),
(2158, 138, 'Jalisco', 'JA', 1),
(2159, 138, 'Mexico', 'ME', 1),
(2160, 138, 'Michoacan de Ocampo', 'MI', 1),
(2161, 138, 'Morelos', 'MO', 1),
(2162, 138, 'Nayarit', 'NA', 1),
(2163, 138, 'Nuevo Leon', 'NL', 1),
(2164, 138, 'Oaxaca', 'OA', 1),
(2165, 138, 'Puebla', 'PU', 1),
(2166, 138, 'Queretaro de Arteaga', 'QA', 1),
(2167, 138, 'Quintana Roo', 'QR', 1),
(2168, 138, 'San Luis Potosi', 'SA', 1),
(2169, 138, 'Sinaloa', 'SI', 1),
(2170, 138, 'Sonora', 'SO', 1),
(2171, 138, 'Tabasco', 'TB', 1),
(2172, 138, 'Tamaulipas', 'TM', 1),
(2173, 138, 'Tlaxcala', 'TL', 1),
(2174, 138, 'Veracruz-Llave', 'VE', 1),
(2175, 138, 'Yucatan', 'YU', 1),
(2176, 138, 'Zacatecas', 'ZA', 1),
(2177, 139, 'Chuuk', 'C', 1),
(2178, 139, 'Kosrae', 'K', 1),
(2179, 139, 'Pohnpei', 'P', 1),
(2180, 139, 'Yap', 'Y', 1),
(2181, 140, 'Gagauzia', 'GA', 1),
(2182, 140, 'Chisinau', 'CU', 1),
(2183, 140, 'Balti', 'BA', 1),
(2184, 140, 'Cahul', 'CA', 1),
(2185, 140, 'Edinet', 'ED', 1),
(2186, 140, 'Lapusna', 'LA', 1),
(2187, 140, 'Orhei', 'OR', 1),
(2188, 140, 'Soroca', 'SO', 1),
(2189, 140, 'Tighina', 'TI', 1),
(2190, 140, 'Ungheni', 'UN', 1),
(2191, 140, 'St‚nga Nistrului', 'SN', 1),
(2192, 141, 'Fontvieille', 'FV', 1),
(2193, 141, 'La Condamine', 'LC', 1),
(2194, 141, 'Monaco-Ville', 'MV', 1),
(2195, 141, 'Monte-Carlo', 'MC', 1),
(2196, 142, 'Ulanbaatar', '1', 1),
(2197, 142, 'Orhon', '035', 1),
(2198, 142, 'Darhan uul', '037', 1),
(2199, 142, 'Hentiy', '039', 1),
(2200, 142, 'Hovsgol', '041', 1),
(2201, 142, 'Hovd', '043', 1),
(2202, 142, 'Uvs', '046', 1),
(2203, 142, 'Tov', '047', 1),
(2204, 142, 'Selenge', '049', 1),
(2205, 142, 'Suhbaatar', '051', 1),
(2206, 142, 'Omnogovi', '053', 1),
(2207, 142, 'Ovorhangay', '055', 1),
(2208, 142, 'Dzavhan', '057', 1),
(2209, 142, 'DundgovL', '059', 1),
(2210, 142, 'Dornod', '061', 1),
(2211, 142, 'Dornogov', '063', 1),
(2212, 142, 'Govi-Sumber', '064', 1),
(2213, 142, 'Govi-Altay', '065', 1),
(2214, 142, 'Bulgan', '067', 1),
(2215, 142, 'Bayanhongor', '069', 1),
(2216, 142, 'Bayan-Olgiy', '071', 1),
(2217, 142, 'Arhangay', '073', 1),
(2218, 143, 'Saint Anthony', 'A', 1),
(2219, 143, 'Saint Georges', 'G', 1),
(2220, 143, 'Saint Peter', 'P', 1),
(2221, 144, 'Agadir', 'AGD', 1),
(2222, 144, 'Al Hoceima', 'HOC', 1),
(2223, 144, 'Azilal', 'AZI', 1),
(2224, 144, 'Beni Mellal', 'BME', 1),
(2225, 144, 'Ben Slimane', 'BSL', 1),
(2226, 144, 'Boulemane', 'BLM', 1),
(2227, 144, 'Casablanca', 'CBL', 1),
(2228, 144, 'Chaouen', 'CHA', 1),
(2229, 144, 'El Jadida', 'EJA', 1),
(2230, 144, 'El Kelaa des Sraghna', 'EKS', 1),
(2231, 144, 'Er Rachidia', 'ERA', 1),
(2232, 144, 'Essaouira', 'ESS', 1),
(2233, 144, 'Fes', 'FES', 1),
(2234, 144, 'Figuig', 'FIG', 1),
(2235, 144, 'Guelmim', 'GLM', 1),
(2236, 144, 'Ifrane', 'IFR', 1),
(2237, 144, 'Kenitra', 'KEN', 1),
(2238, 144, 'Khemisset', 'KHM', 1),
(2239, 144, 'Khenifra', 'KHN', 1),
(2240, 144, 'Khouribga', 'KHO', 1),
(2241, 144, 'Laayoune', 'LYN', 1),
(2242, 144, 'Larache', 'LAR', 1),
(2243, 144, 'Marrakech', 'MRK', 1),
(2244, 144, 'Meknes', 'MKN', 1),
(2245, 144, 'Nador', 'NAD', 1),
(2246, 144, 'Ouarzazate', 'ORZ', 1),
(2247, 144, 'Oujda', 'OUJ', 1),
(2248, 144, 'Rabat-Sale', 'RSA', 1),
(2249, 144, 'Safi', 'SAF', 1),
(2250, 144, 'Settat', 'SET', 1),
(2251, 144, 'Sidi Kacem', 'SKA', 1),
(2252, 144, 'Tangier', 'TGR', 1),
(2253, 144, 'Tan-Tan', 'TAN', 1),
(2254, 144, 'Taounate', 'TAO', 1),
(2255, 144, 'Taroudannt', 'TRD', 1),
(2256, 144, 'Tata', 'TAT', 1),
(2257, 144, 'Taza', 'TAZ', 1),
(2258, 144, 'Tetouan', 'TET', 1),
(2259, 144, 'Tiznit', 'TIZ', 1),
(2260, 144, 'Ad Dakhla', 'ADK', 1),
(2261, 144, 'Boujdour', 'BJD', 1),
(2262, 144, 'Es Smara', 'ESM', 1),
(2263, 145, 'Cabo Delgado', 'CD', 1),
(2264, 145, 'Gaza', 'GZ', 1),
(2265, 145, 'Inhambane', 'IN', 1),
(2266, 145, 'Manica', 'MN', 1),
(2267, 145, 'Maputo (city)', 'MC', 1),
(2268, 145, 'Maputo', 'MP', 1),
(2269, 145, 'Nampula', 'NA', 1),
(2270, 145, 'Niassa', 'NI', 1),
(2271, 145, 'Sofala', 'SO', 1),
(2272, 145, 'Tete', 'TE', 1),
(2273, 145, 'Zambezia', 'ZA', 1),
(2274, 146, 'Ayeyarwady', 'AY', 1),
(2275, 146, 'Bago', 'BG', 1),
(2276, 146, 'Magway', 'MG', 1),
(2277, 146, 'Mandalay', 'MD', 1),
(2278, 146, 'Sagaing', 'SG', 1),
(2279, 146, 'Tanintharyi', 'TN', 1),
(2280, 146, 'Yangon', 'YG', 1),
(2281, 146, 'Chin State', 'CH', 1),
(2282, 146, 'Kachin State', 'KC', 1),
(2283, 146, 'Kayah State', 'KH', 1),
(2284, 146, 'Kayin State', 'KN', 1),
(2285, 146, 'Mon State', 'MN', 1),
(2286, 146, 'Rakhine State', 'RK', 1),
(2287, 146, 'Shan State', 'SH', 1),
(2288, 147, 'Caprivi', 'CA', 1),
(2289, 147, 'Erongo', 'ER', 1),
(2290, 147, 'Hardap', 'HA', 1),
(2291, 147, 'Karas', 'KR', 1),
(2292, 147, 'Kavango', 'KV', 1),
(2293, 147, 'Khomas', 'KH', 1),
(2294, 147, 'Kunene', 'KU', 1),
(2295, 147, 'Ohangwena', 'OW', 1),
(2296, 147, 'Omaheke', 'OK', 1),
(2297, 147, 'Omusati', 'OT', 1),
(2298, 147, 'Oshana', 'ON', 1),
(2299, 147, 'Oshikoto', 'OO', 1),
(2300, 147, 'Otjozondjupa', 'OJ', 1),
(2301, 148, 'Aiwo', 'AO', 1),
(2302, 148, 'Anabar', 'AA', 1),
(2303, 148, 'Anetan', 'AT', 1),
(2304, 148, 'Anibare', 'AI', 1),
(2305, 148, 'Baiti', 'BA', 1),
(2306, 148, 'Boe', 'BO', 1),
(2307, 148, 'Buada', 'BU', 1),
(2308, 148, 'Denigomodu', 'DE', 1),
(2309, 148, 'Ewa', 'EW', 1),
(2310, 148, 'Ijuw', 'IJ', 1),
(2311, 148, 'Meneng', 'ME', 1),
(2312, 148, 'Nibok', 'NI', 1),
(2313, 148, 'Uaboe', 'UA', 1),
(2314, 148, 'Yaren', 'YA', 1),
(2315, 149, 'Bagmati', 'BA', 1),
(2316, 149, 'Bheri', 'BH', 1),
(2317, 149, 'Dhawalagiri', 'DH', 1),
(2318, 149, 'Gandaki', 'GA', 1),
(2319, 149, 'Janakpur', 'JA', 1),
(2320, 149, 'Karnali', 'KA', 1),
(2321, 149, 'Kosi', 'KO', 1),
(2322, 149, 'Lumbini', 'LU', 1),
(2323, 149, 'Mahakali', 'MA', 1),
(2324, 149, 'Mechi', 'ME', 1),
(2325, 149, 'Narayani', 'NA', 1),
(2326, 149, 'Rapti', 'RA', 1),
(2327, 149, 'Sagarmatha', 'SA', 1),
(2328, 149, 'Seti', 'SE', 1),
(2329, 150, 'Drenthe', 'DR', 1),
(2330, 150, 'Flevoland', 'FL', 1),
(2331, 150, 'Friesland', 'FR', 1),
(2332, 150, 'Gelderland', 'GE', 1),
(2333, 150, 'Groningen', 'GR', 1),
(2334, 150, 'Limburg', 'LI', 1),
(2335, 150, 'Noord Brabant', 'NB', 1),
(2336, 150, 'Noord Holland', 'NH', 1),
(2337, 150, 'Overijssel', 'OV', 1),
(2338, 150, 'Utrecht', 'UT', 1),
(2339, 150, 'Zeeland', 'ZE', 1),
(2340, 150, 'Zuid Holland', 'ZH', 1),
(2341, 152, 'Iles Loyaute', 'L', 1),
(2342, 152, 'Nord', 'N', 1),
(2343, 152, 'Sud', 'S', 1),
(2344, 153, 'Auckland', 'AUK', 1),
(2345, 153, 'Bay of Plenty', 'BOP', 1),
(2346, 153, 'Canterbury', 'CAN', 1),
(2347, 153, 'Coromandel', 'COR', 1),
(2348, 153, 'Gisborne', 'GIS', 1),
(2349, 153, 'Fiordland', 'FIO', 1),
(2350, 153, 'Hawke''s Bay', 'HKB', 1),
(2351, 153, 'Marlborough', 'MBH', 1),
(2352, 153, 'Manawatu-Wanganui', 'MWT', 1),
(2353, 153, 'Mt Cook-Mackenzie', 'MCM', 1),
(2354, 153, 'Nelson', 'NSN', 1),
(2355, 153, 'Northland', 'NTL', 1),
(2356, 153, 'Otago', 'OTA', 1),
(2357, 153, 'Southland', 'STL', 1),
(2358, 153, 'Taranaki', 'TKI', 1),
(2359, 153, 'Wellington', 'WGN', 1),
(2360, 153, 'Waikato', 'WKO', 1),
(2361, 153, 'Wairarapa', 'WAI', 1),
(2362, 153, 'West Coast', 'WTC', 1),
(2363, 154, 'Atlantico Norte', 'AN', 1),
(2364, 154, 'Atlantico Sur', 'AS', 1),
(2365, 154, 'Boaco', 'BO', 1),
(2366, 154, 'Carazo', 'CA', 1),
(2367, 154, 'Chinandega', 'CI', 1),
(2368, 154, 'Chontales', 'CO', 1),
(2369, 154, 'Esteli', 'ES', 1),
(2370, 154, 'Granada', 'GR', 1),
(2371, 154, 'Jinotega', 'JI', 1),
(2372, 154, 'Leon', 'LE', 1),
(2373, 154, 'Madriz', 'MD', 1),
(2374, 154, 'Managua', 'MN', 1),
(2375, 154, 'Masaya', 'MS', 1),
(2376, 154, 'Matagalpa', 'MT', 1),
(2377, 154, 'Nuevo Segovia', 'NS', 1),
(2378, 154, 'Rio San Juan', 'RS', 1),
(2379, 154, 'Rivas', 'RI', 1),
(2380, 155, 'Agadez', 'AG', 1),
(2381, 155, 'Diffa', 'DF', 1),
(2382, 155, 'Dosso', 'DS', 1),
(2383, 155, 'Maradi', 'MA', 1),
(2384, 155, 'Niamey', 'NM', 1),
(2385, 155, 'Tahoua', 'TH', 1),
(2386, 155, 'Tillaberi', 'TL', 1),
(2387, 155, 'Zinder', 'ZD', 1),
(2388, 156, 'Abia', 'AB', 1),
(2389, 156, 'Abuja Federal Capital Territory', 'CT', 1),
(2390, 156, 'Adamawa', 'AD', 1),
(2391, 156, 'Akwa Ibom', 'AK', 1),
(2392, 156, 'Anambra', 'AN', 1),
(2393, 156, 'Bauchi', 'BC', 1),
(2394, 156, 'Bayelsa', 'BY', 1),
(2395, 156, 'Benue', 'BN', 1),
(2396, 156, 'Borno', 'BO', 1),
(2397, 156, 'Cross River', 'CR', 1),
(2398, 156, 'Delta', 'DE', 1),
(2399, 156, 'Ebonyi', 'EB', 1),
(2400, 156, 'Edo', 'ED', 1),
(2401, 156, 'Ekiti', 'EK', 1),
(2402, 156, 'Enugu', 'EN', 1),
(2403, 156, 'Gombe', 'GO', 1),
(2404, 156, 'Imo', 'IM', 1),
(2405, 156, 'Jigawa', 'JI', 1),
(2406, 156, 'Kaduna', 'KD', 1),
(2407, 156, 'Kano', 'KN', 1),
(2408, 156, 'Katsina', 'KT', 1),
(2409, 156, 'Kebbi', 'KE', 1),
(2410, 156, 'Kogi', 'KO', 1),
(2411, 156, 'Kwara', 'KW', 1),
(2412, 156, 'Lagos', 'LA', 1),
(2413, 156, 'Nassarawa', 'NA', 1),
(2414, 156, 'Niger', 'NI', 1),
(2415, 156, 'Ogun', 'OG', 1),
(2416, 156, 'Ondo', 'ONG', 1),
(2417, 156, 'Osun', 'OS', 1),
(2418, 156, 'Oyo', 'OY', 1),
(2419, 156, 'Plateau', 'PL', 1),
(2420, 156, 'Rivers', 'RI', 1),
(2421, 156, 'Sokoto', 'SO', 1),
(2422, 156, 'Taraba', 'TA', 1),
(2423, 156, 'Yobe', 'YO', 1),
(2424, 156, 'Zamfara', 'ZA', 1),
(2425, 159, 'Northern Islands', 'N', 1),
(2426, 159, 'Rota', 'R', 1),
(2427, 159, 'Saipan', 'S', 1),
(2428, 159, 'Tinian', 'T', 1),
(2429, 160, 'Akershus', 'AK', 1),
(2430, 160, 'Aust-Agder', 'AA', 1),
(2431, 160, 'Buskerud', 'BU', 1),
(2432, 160, 'Finnmark', 'FM', 1),
(2433, 160, 'Hedmark', 'HM', 1),
(2434, 160, 'Hordaland', 'HL', 1),
(2435, 160, 'More og Romdal', 'MR', 1),
(2436, 160, 'Nord-Trondelag', 'NT', 1),
(2437, 160, 'Nordland', 'NL', 1),
(2438, 160, 'Ostfold', 'OF', 1),
(2439, 160, 'Oppland', 'OP', 1),
(2440, 160, 'Oslo', 'OL', 1),
(2441, 160, 'Rogaland', 'RL', 1),
(2442, 160, 'Sor-Trondelag', 'ST', 1),
(2443, 160, 'Sogn og Fjordane', 'SJ', 1),
(2444, 160, 'Svalbard', 'SV', 1),
(2445, 160, 'Telemark', 'TM', 1),
(2446, 160, 'Troms', 'TR', 1),
(2447, 160, 'Vest-Agder', 'VA', 1),
(2448, 160, 'Vestfold', 'VF', 1),
(2449, 161, 'Ad Dakhiliyah', 'DA', 1),
(2450, 161, 'Al Batinah', 'BA', 1),
(2451, 161, 'Al Wusta', 'WU', 1),
(2452, 161, 'Ash Sharqiyah', 'SH', 1),
(2453, 161, 'Az Zahirah', 'ZA', 1),
(2454, 161, 'Masqat', 'MA', 1),
(2455, 161, 'Musandam', 'MU', 1),
(2456, 161, 'Zufar', 'ZU', 1),
(2457, 162, 'Balochistan', 'B', 1),
(2458, 162, 'Federally Administered Tribal Areas', 'T', 1),
(2459, 162, 'Islamabad Capital Territory', 'I', 1),
(2460, 162, 'North-West Frontier', 'N', 1),
(2461, 162, 'Punjab', 'P', 1),
(2462, 162, 'Sindh', 'S', 1),
(2463, 163, 'Aimeliik', 'AM', 1),
(2464, 163, 'Airai', 'AR', 1),
(2465, 163, 'Angaur', 'AN', 1),
(2466, 163, 'Hatohobei', 'HA', 1),
(2467, 163, 'Kayangel', 'KA', 1),
(2468, 163, 'Koror', 'KO', 1),
(2469, 163, 'Melekeok', 'ME', 1),
(2470, 163, 'Ngaraard', 'NA', 1),
(2471, 163, 'Ngarchelong', 'NG', 1),
(2472, 163, 'Ngardmau', 'ND', 1),
(2473, 163, 'Ngatpang', 'NT', 1),
(2474, 163, 'Ngchesar', 'NC', 1),
(2475, 163, 'Ngeremlengui', 'NR', 1),
(2476, 163, 'Ngiwal', 'NW', 1),
(2477, 163, 'Peleliu', 'PE', 1),
(2478, 163, 'Sonsorol', 'SO', 1),
(2479, 164, 'Bocas del Toro', 'BT', 1),
(2480, 164, 'Chiriqui', 'CH', 1),
(2481, 164, 'Cocle', 'CC', 1),
(2482, 164, 'Colon', 'CL', 1),
(2483, 164, 'Darien', 'DA', 1),
(2484, 164, 'Herrera', 'HE', 1),
(2485, 164, 'Los Santos', 'LS', 1),
(2486, 164, 'Panama', 'PA', 1),
(2487, 164, 'San Blas', 'SB', 1),
(2488, 164, 'Veraguas', 'VG', 1),
(2489, 165, 'Bougainville', 'BV', 1),
(2490, 165, 'Central', 'CE', 1),
(2491, 165, 'Chimbu', 'CH', 1),
(2492, 165, 'Eastern Highlands', 'EH', 1),
(2493, 165, 'East New Britain', 'EB', 1),
(2494, 165, 'East Sepik', 'ES', 1),
(2495, 165, 'Enga', 'EN', 1),
(2496, 165, 'Gulf', 'GU', 1),
(2497, 165, 'Madang', 'MD', 1),
(2498, 165, 'Manus', 'MN', 1),
(2499, 165, 'Milne Bay', 'MB', 1),
(2500, 165, 'Morobe', 'MR', 1),
(2501, 165, 'National Capital', 'NC', 1),
(2502, 165, 'New Ireland', 'NI', 1),
(2503, 165, 'Northern', 'NO', 1),
(2504, 165, 'Sandaun', 'SA', 1),
(2505, 165, 'Southern Highlands', 'SH', 1),
(2506, 165, 'Western', 'WE', 1),
(2507, 165, 'Western Highlands', 'WH', 1),
(2508, 165, 'West New Britain', 'WB', 1),
(2509, 166, 'Alto Paraguay', 'AG', 1),
(2510, 166, 'Alto Parana', 'AN', 1),
(2511, 166, 'Amambay', 'AM', 1),
(2512, 166, 'Asuncion', 'AS', 1),
(2513, 166, 'Boqueron', 'BO', 1),
(2514, 166, 'Caaguazu', 'CG', 1),
(2515, 166, 'Caazapa', 'CZ', 1),
(2516, 166, 'Canindeyu', 'CN', 1),
(2517, 166, 'Central', 'CE', 1),
(2518, 166, 'Concepcion', 'CC', 1),
(2519, 166, 'Cordillera', 'CD', 1),
(2520, 166, 'Guaira', 'GU', 1),
(2521, 166, 'Itapua', 'IT', 1),
(2522, 166, 'Misiones', 'MI', 1),
(2523, 166, 'Neembucu', 'NE', 1),
(2524, 166, 'Paraguari', 'PA', 1),
(2525, 166, 'Presidente Hayes', 'PH', 1),
(2526, 166, 'San Pedro', 'SP', 1),
(2527, 167, 'Amazonas', 'AM', 1),
(2528, 167, 'Ancash', 'AN', 1),
(2529, 167, 'Apurimac', 'AP', 1),
(2530, 167, 'Arequipa', 'AR', 1),
(2531, 167, 'Ayacucho', 'AY', 1),
(2532, 167, 'Cajamarca', 'CJ', 1),
(2533, 167, 'Callao', 'CL', 1),
(2534, 167, 'Cusco', 'CU', 1),
(2535, 167, 'Huancavelica', 'HV', 1),
(2536, 167, 'Huanuco', 'HO', 1),
(2537, 167, 'Ica', 'IC', 1),
(2538, 167, 'Junin', 'JU', 1),
(2539, 167, 'La Libertad', 'LD', 1),
(2540, 167, 'Lambayeque', 'LY', 1),
(2541, 167, 'Lima', 'LI', 1),
(2542, 167, 'Loreto', 'LO', 1),
(2543, 167, 'Madre de Dios', 'MD', 1),
(2544, 167, 'Moquegua', 'MO', 1),
(2545, 167, 'Pasco', 'PA', 1),
(2546, 167, 'Piura', 'PI', 1),
(2547, 167, 'Puno', 'PU', 1),
(2548, 167, 'San Martin', 'SM', 1),
(2549, 167, 'Tacna', 'TA', 1),
(2550, 167, 'Tumbes', 'TU', 1),
(2551, 167, 'Ucayali', 'UC', 1),
(2552, 168, 'Abra', 'ABR', 1),
(2553, 168, 'Agusan del Norte', 'ANO', 1),
(2554, 168, 'Agusan del Sur', 'ASU', 1),
(2555, 168, 'Aklan', 'AKL', 1),
(2556, 168, 'Albay', 'ALB', 1),
(2557, 168, 'Antique', 'ANT', 1),
(2558, 168, 'Apayao', 'APY', 1),
(2559, 168, 'Aurora', 'AUR', 1),
(2560, 168, 'Basilan', 'BAS', 1),
(2561, 168, 'Bataan', 'BTA', 1),
(2562, 168, 'Batanes', 'BTE', 1),
(2563, 168, 'Batangas', 'BTG', 1),
(2564, 168, 'Biliran', 'BLR', 1),
(2565, 168, 'Benguet', 'BEN', 1),
(2566, 168, 'Bohol', 'BOL', 1),
(2567, 168, 'Bukidnon', 'BUK', 1),
(2568, 168, 'Bulacan', 'BUL', 1),
(2569, 168, 'Cagayan', 'CAG', 1),
(2570, 168, 'Camarines Norte', 'CNO', 1),
(2571, 168, 'Camarines Sur', 'CSU', 1),
(2572, 168, 'Camiguin', 'CAM', 1),
(2573, 168, 'Capiz', 'CAP', 1),
(2574, 168, 'Catanduanes', 'CAT', 1),
(2575, 168, 'Cavite', 'CAV', 1),
(2576, 168, 'Cebu', 'CEB', 1),
(2577, 168, 'Compostela', 'CMP', 1),
(2578, 168, 'Davao del Norte', 'DNO', 1),
(2579, 168, 'Davao del Sur', 'DSU', 1),
(2580, 168, 'Davao Oriental', 'DOR', 1),
(2581, 168, 'Eastern Samar', 'ESA', 1),
(2582, 168, 'Guimaras', 'GUI', 1),
(2583, 168, 'Ifugao', 'IFU', 1),
(2584, 168, 'Ilocos Norte', 'INO', 1),
(2585, 168, 'Ilocos Sur', 'ISU', 1),
(2586, 168, 'Iloilo', 'ILO', 1),
(2587, 168, 'Isabela', 'ISA', 1),
(2588, 168, 'Kalinga', 'KAL', 1),
(2589, 168, 'Laguna', 'LAG', 1),
(2590, 168, 'Lanao del Norte', 'LNO', 1),
(2591, 168, 'Lanao del Sur', 'LSU', 1),
(2592, 168, 'La Union', 'UNI', 1),
(2593, 168, 'Leyte', 'LEY', 1),
(2594, 168, 'Maguindanao', 'MAG', 1),
(2595, 168, 'Marinduque', 'MRN', 1),
(2596, 168, 'Masbate', 'MSB', 1),
(2597, 168, 'Mindoro Occidental', 'MIC', 1),
(2598, 168, 'Mindoro Oriental', 'MIR', 1),
(2599, 168, 'Misamis Occidental', 'MSC', 1),
(2600, 168, 'Misamis Oriental', 'MOR', 1),
(2601, 168, 'Mountain', 'MOP', 1),
(2602, 168, 'Negros Occidental', 'NOC', 1),
(2603, 168, 'Negros Oriental', 'NOR', 1),
(2604, 168, 'North Cotabato', 'NCT', 1),
(2605, 168, 'Northern Samar', 'NSM', 1),
(2606, 168, 'Nueva Ecija', 'NEC', 1),
(2607, 168, 'Nueva Vizcaya', 'NVZ', 1),
(2608, 168, 'Palawan', 'PLW', 1),
(2609, 168, 'Pampanga', 'PMP', 1),
(2610, 168, 'Pangasinan', 'PNG', 1),
(2611, 168, 'Quezon', 'QZN', 1),
(2612, 168, 'Quirino', 'QRN', 1),
(2613, 168, 'Rizal', 'RIZ', 1),
(2614, 168, 'Romblon', 'ROM', 1),
(2615, 168, 'Samar', 'SMR', 1),
(2616, 168, 'Sarangani', 'SRG', 1),
(2617, 168, 'Siquijor', 'SQJ', 1),
(2618, 168, 'Sorsogon', 'SRS', 1),
(2619, 168, 'South Cotabato', 'SCO', 1),
(2620, 168, 'Southern Leyte', 'SLE', 1),
(2621, 168, 'Sultan Kudarat', 'SKU', 1),
(2622, 168, 'Sulu', 'SLU', 1),
(2623, 168, 'Surigao del Norte', 'SNO', 1),
(2624, 168, 'Surigao del Sur', 'SSU', 1),
(2625, 168, 'Tarlac', 'TAR', 1),
(2626, 168, 'Tawi-Tawi', 'TAW', 1),
(2627, 168, 'Zambales', 'ZBL', 1),
(2628, 168, 'Zamboanga del Norte', 'ZNO', 1),
(2629, 168, 'Zamboanga del Sur', 'ZSU', 1),
(2630, 168, 'Zamboanga Sibugay', 'ZSI', 1),
(2631, 170, 'Dolnoslaskie', 'DO', 1),
(2632, 170, 'Kujawsko-Pomorskie', 'KP', 1),
(2633, 170, 'Lodzkie', 'LO', 1),
(2634, 170, 'Lubelskie', 'LL', 1),
(2635, 170, 'Lubuskie', 'LU', 1),
(2636, 170, 'Malopolskie', 'ML', 1),
(2637, 170, 'Mazowieckie', 'MZ', 1),
(2638, 170, 'Opolskie', 'OP', 1),
(2639, 170, 'Podkarpackie', 'PP', 1),
(2640, 170, 'Podlaskie', 'PL', 1),
(2641, 170, 'Pomorskie', 'PM', 1),
(2642, 170, 'Slaskie', 'SL', 1),
(2643, 170, 'Swietokrzyskie', 'SW', 1),
(2644, 170, 'Warminsko-Mazurskie', 'WM', 1),
(2645, 170, 'Wielkopolskie', 'WP', 1),
(2646, 170, 'Zachodniopomorskie', 'ZA', 1),
(2647, 198, 'Saint Pierre', 'P', 1),
(2648, 198, 'Miquelon', 'M', 1),
(2649, 171, 'A&ccedil;ores', 'AC', 1),
(2650, 171, 'Aveiro', 'AV', 1),
(2651, 171, 'Beja', 'BE', 1),
(2652, 171, 'Braga', 'BR', 1),
(2653, 171, 'Bragan&ccedil;a', 'BA', 1),
(2654, 171, 'Castelo Branco', 'CB', 1),
(2655, 171, 'Coimbra', 'CO', 1),
(2656, 171, '&Eacute;vora', 'EV', 1),
(2657, 171, 'Faro', 'FA', 1),
(2658, 171, 'Guarda', 'GU', 1),
(2659, 171, 'Leiria', 'LE', 1),
(2660, 171, 'Lisboa', 'LI', 1),
(2661, 171, 'Madeira', 'ME', 1),
(2662, 171, 'Portalegre', 'PO', 1),
(2663, 171, 'Porto', 'PR', 1),
(2664, 171, 'Santar&eacute;m', 'SA', 1),
(2665, 171, 'Set&uacute;bal', 'SE', 1),
(2666, 171, 'Viana do Castelo', 'VC', 1),
(2667, 171, 'Vila Real', 'VR', 1),
(2668, 171, 'Viseu', 'VI', 1),
(2669, 173, 'Ad Dawhah', 'DW', 1),
(2670, 173, 'Al Ghuwayriyah', 'GW', 1),
(2671, 173, 'Al Jumayliyah', 'JM', 1),
(2672, 173, 'Al Khawr', 'KR', 1),
(2673, 173, 'Al Wakrah', 'WK', 1),
(2674, 173, 'Ar Rayyan', 'RN', 1),
(2675, 173, 'Jarayan al Batinah', 'JB', 1),
(2676, 173, 'Madinat ash Shamal', 'MS', 1),
(2677, 173, 'Umm Sa''id', 'UD', 1),
(2678, 173, 'Umm Salal', 'UL', 1),
(2679, 175, 'Alba', 'AB', 1),
(2680, 175, 'Arad', 'AR', 1),
(2681, 175, 'Arges', 'AG', 1),
(2682, 175, 'Bacau', 'BC', 1),
(2683, 175, 'Bihor', 'BH', 1),
(2684, 175, 'Bistrita-Nasaud', 'BN', 1),
(2685, 175, 'Botosani', 'BT', 1),
(2686, 175, 'Brasov', 'BV', 1),
(2687, 175, 'Braila', 'BR', 1),
(2688, 175, 'Bucuresti', 'B', 1),
(2689, 175, 'Buzau', 'BZ', 1),
(2690, 175, 'Caras-Severin', 'CS', 1),
(2691, 175, 'Calarasi', 'CL', 1),
(2692, 175, 'Cluj', 'CJ', 1),
(2693, 175, 'Constanta', 'CT', 1),
(2694, 175, 'Covasna', 'CV', 1),
(2695, 175, 'Dimbovita', 'DB', 1),
(2696, 175, 'Dolj', 'DJ', 1),
(2697, 175, 'Galati', 'GL', 1),
(2698, 175, 'Giurgiu', 'GR', 1),
(2699, 175, 'Gorj', 'GJ', 1),
(2700, 175, 'Harghita', 'HR', 1),
(2701, 175, 'Hunedoara', 'HD', 1),
(2702, 175, 'Ialomita', 'IL', 1),
(2703, 175, 'Iasi', 'IS', 1),
(2704, 175, 'Ilfov', 'IF', 1),
(2705, 175, 'Maramures', 'MM', 1),
(2706, 175, 'Mehedinti', 'MH', 1),
(2707, 175, 'Mures', 'MS', 1),
(2708, 175, 'Neamt', 'NT', 1),
(2709, 175, 'Olt', 'OT', 1),
(2710, 175, 'Prahova', 'PH', 1),
(2711, 175, 'Satu-Mare', 'SM', 1),
(2712, 175, 'Salaj', 'SJ', 1),
(2713, 175, 'Sibiu', 'SB', 1),
(2714, 175, 'Suceava', 'SV', 1),
(2715, 175, 'Teleorman', 'TR', 1),
(2716, 175, 'Timis', 'TM', 1),
(2717, 175, 'Tulcea', 'TL', 1),
(2718, 175, 'Vaslui', 'VS', 1),
(2719, 175, 'Valcea', 'VL', 1),
(2720, 175, 'Vrancea', 'VN', 1),
(2721, 176, 'Abakan', 'AB', 1),
(2722, 176, 'Aginskoye', 'AG', 1),
(2723, 176, 'Anadyr', 'AN', 1),
(2724, 176, 'Arkahangelsk', 'AR', 1),
(2725, 176, 'Astrakhan', 'AS', 1),
(2726, 176, 'Barnaul', 'BA', 1),
(2727, 176, 'Belgorod', 'BE', 1),
(2728, 176, 'Birobidzhan', 'BI', 1),
(2729, 176, 'Blagoveshchensk', 'BL', 1),
(2730, 176, 'Bryansk', 'BR', 1),
(2731, 176, 'Cheboksary', 'CH', 1),
(2732, 176, 'Chelyabinsk', 'CL', 1),
(2733, 176, 'Cherkessk', 'CR', 1),
(2734, 176, 'Chita', 'CI', 1),
(2735, 176, 'Dudinka', 'DU', 1),
(2736, 176, 'Elista', 'EL', 1),
(2737, 176, 'Gomo-Altaysk', 'GO', 1),
(2738, 176, 'Gorno-Altaysk', 'GA', 1),
(2739, 176, 'Groznyy', 'GR', 1),
(2740, 176, 'Irkutsk', 'IR', 1),
(2741, 176, 'Ivanovo', 'IV', 1),
(2742, 176, 'Izhevsk', 'IZ', 1),
(2743, 176, 'Kalinigrad', 'KA', 1),
(2744, 176, 'Kaluga', 'KL', 1),
(2745, 176, 'Kasnodar', 'KS', 1),
(2746, 176, 'Kazan', 'KZ', 1),
(2747, 176, 'Kemerovo', 'KE', 1),
(2748, 176, 'Khabarovsk', 'KH', 1),
(2749, 176, 'Khanty-Mansiysk', 'KM', 1),
(2750, 176, 'Kostroma', 'KO', 1),
(2751, 176, 'Krasnodar', 'KR', 1),
(2752, 176, 'Krasnoyarsk', 'KN', 1),
(2753, 176, 'Kudymkar', 'KU', 1),
(2754, 176, 'Kurgan', 'KG', 1),
(2755, 176, 'Kursk', 'KK', 1),
(2756, 176, 'Kyzyl', 'KY', 1),
(2757, 176, 'Lipetsk', 'LI', 1),
(2758, 176, 'Magadan', 'MA', 1),
(2759, 176, 'Makhachkala', 'MK', 1),
(2760, 176, 'Maykop', 'MY', 1),
(2761, 176, 'Moscow', 'MO', 1),
(2762, 176, 'Murmansk', 'MU', 1),
(2763, 176, 'Nalchik', 'NA', 1),
(2764, 176, 'Naryan Mar', 'NR', 1),
(2765, 176, 'Nazran', 'NZ', 1),
(2766, 176, 'Nizhniy Novgorod', 'NI', 1),
(2767, 176, 'Novgorod', 'NO', 1),
(2768, 176, 'Novosibirsk', 'NV', 1),
(2769, 176, 'Omsk', 'OM', 1),
(2770, 176, 'Orel', 'OR', 1),
(2771, 176, 'Orenburg', 'OE', 1),
(2772, 176, 'Palana', 'PA', 1),
(2773, 176, 'Penza', 'PE', 1),
(2774, 176, 'Perm', 'PR', 1),
(2775, 176, 'Petropavlovsk-Kamchatskiy', 'PK', 1),
(2776, 176, 'Petrozavodsk', 'PT', 1),
(2777, 176, 'Pskov', 'PS', 1),
(2778, 176, 'Rostov-na-Donu', 'RO', 1),
(2779, 176, 'Ryazan', 'RY', 1),
(2780, 176, 'Salekhard', 'SL', 1),
(2781, 176, 'Samara', 'SA', 1),
(2782, 176, 'Saransk', 'SR', 1),
(2783, 176, 'Saratov', 'SV', 1),
(2784, 176, 'Smolensk', 'SM', 1),
(2785, 176, 'St. Petersburg', 'SP', 1),
(2786, 176, 'Stavropol', 'ST', 1),
(2787, 176, 'Syktyvkar', 'SY', 1),
(2788, 176, 'Tambov', 'TA', 1),
(2789, 176, 'Tomsk', 'TO', 1),
(2790, 176, 'Tula', 'TU', 1),
(2791, 176, 'Tura', 'TR', 1),
(2792, 176, 'Tver', 'TV', 1),
(2793, 176, 'Tyumen', 'TY', 1),
(2794, 176, 'Ufa', 'UF', 1),
(2795, 176, 'Ul''yanovsk', 'UL', 1),
(2796, 176, 'Ulan-Ude', 'UU', 1),
(2797, 176, 'Ust''-Ordynskiy', 'US', 1),
(2798, 176, 'Vladikavkaz', 'VL', 1),
(2799, 176, 'Vladimir', 'VA', 1),
(2800, 176, 'Vladivostok', 'VV', 1),
(2801, 176, 'Volgograd', 'VG', 1),
(2802, 176, 'Vologda', 'VD', 1),
(2803, 176, 'Voronezh', 'VO', 1),
(2804, 176, 'Vyatka', 'VY', 1),
(2805, 176, 'Yakutsk', 'YA', 1),
(2806, 176, 'Yaroslavl', 'YR', 1),
(2807, 176, 'Yekaterinburg', 'YE', 1),
(2808, 176, 'Yoshkar-Ola', 'YO', 1),
(2809, 177, 'Butare', 'BU', 1),
(2810, 177, 'Byumba', 'BY', 1),
(2811, 177, 'Cyangugu', 'CY', 1),
(2812, 177, 'Gikongoro', 'GK', 1),
(2813, 177, 'Gisenyi', 'GS', 1),
(2814, 177, 'Gitarama', 'GT', 1),
(2815, 177, 'Kibungo', 'KG', 1),
(2816, 177, 'Kibuye', 'KY', 1),
(2817, 177, 'Kigali Rurale', 'KR', 1),
(2818, 177, 'Kigali-ville', 'KV', 1),
(2819, 177, 'Ruhengeri', 'RU', 1),
(2820, 177, 'Umutara', 'UM', 1),
(2821, 178, 'Christ Church Nichola Town', 'CCN', 1),
(2822, 178, 'Saint Anne Sandy Point', 'SAS', 1),
(2823, 178, 'Saint George Basseterre', 'SGB', 1),
(2824, 178, 'Saint George Gingerland', 'SGG', 1),
(2825, 178, 'Saint James Windward', 'SJW', 1),
(2826, 178, 'Saint John Capesterre', 'SJC', 1),
(2827, 178, 'Saint John Figtree', 'SJF', 1),
(2828, 178, 'Saint Mary Cayon', 'SMC', 1),
(2829, 178, 'Saint Paul Capesterre', 'CAP', 1),
(2830, 178, 'Saint Paul Charlestown', 'CHA', 1),
(2831, 178, 'Saint Peter Basseterre', 'SPB', 1),
(2832, 178, 'Saint Thomas Lowland', 'STL', 1),
(2833, 178, 'Saint Thomas Middle Island', 'STM', 1),
(2834, 178, 'Trinity Palmetto Point', 'TPP', 1),
(2835, 179, 'Anse-la-Raye', 'AR', 1),
(2836, 179, 'Castries', 'CA', 1),
(2837, 179, 'Choiseul', 'CH', 1),
(2838, 179, 'Dauphin', 'DA', 1),
(2839, 179, 'Dennery', 'DE', 1),
(2840, 179, 'Gros-Islet', 'GI', 1),
(2841, 179, 'Laborie', 'LA', 1),
(2842, 179, 'Micoud', 'MI', 1),
(2843, 179, 'Praslin', 'PR', 1),
(2844, 179, 'Soufriere', 'SO', 1),
(2845, 179, 'Vieux-Fort', 'VF', 1),
(2846, 180, 'Charlotte', 'C', 1),
(2847, 180, 'Grenadines', 'R', 1),
(2848, 180, 'Saint Andrew', 'A', 1),
(2849, 180, 'Saint David', 'D', 1),
(2850, 180, 'Saint George', 'G', 1),
(2851, 180, 'Saint Patrick', 'P', 1),
(2852, 181, 'A''ana', 'AN', 1),
(2853, 181, 'Aiga-i-le-Tai', 'AI', 1),
(2854, 181, 'Atua', 'AT', 1),
(2855, 181, 'Fa''asaleleaga', 'FA', 1),
(2856, 181, 'Gaga''emauga', 'GE', 1),
(2857, 181, 'Gagaifomauga', 'GF', 1),
(2858, 181, 'Palauli', 'PA', 1),
(2859, 181, 'Satupa''itea', 'SA', 1),
(2860, 181, 'Tuamasaga', 'TU', 1),
(2861, 181, 'Va''a-o-Fonoti', 'VF', 1),
(2862, 181, 'Vaisigano', 'VS', 1),
(2863, 182, 'Acquaviva', 'AC', 1),
(2864, 182, 'Borgo Maggiore', 'BM', 1),
(2865, 182, 'Chiesanuova', 'CH', 1),
(2866, 182, 'Domagnano', 'DO', 1),
(2867, 182, 'Faetano', 'FA', 1),
(2868, 182, 'Fiorentino', 'FI', 1),
(2869, 182, 'Montegiardino', 'MO', 1),
(2870, 182, 'Citta di San Marino', 'SM', 1),
(2871, 182, 'Serravalle', 'SE', 1),
(2872, 183, 'Sao Tome', 'S', 1),
(2873, 183, 'Principe', 'P', 1),
(2874, 184, 'Al Bahah', 'BH', 1),
(2875, 184, 'Al Hudud ash Shamaliyah', 'HS', 1),
(2876, 184, 'Al Jawf', 'JF', 1),
(2877, 184, 'Al Madinah', 'MD', 1),
(2878, 184, 'Al Qasim', 'QS', 1),
(2879, 184, 'Ar Riyad', 'RD', 1),
(2880, 184, 'Ash Sharqiyah (Eastern)', 'AQ', 1),
(2881, 184, '''Asir', 'AS', 1),
(2882, 184, 'Ha''il', 'HL', 1),
(2883, 184, 'Jizan', 'JZ', 1),
(2884, 184, 'Makkah', 'ML', 1),
(2885, 184, 'Najran', 'NR', 1),
(2886, 184, 'Tabuk', 'TB', 1),
(2887, 185, 'Dakar', 'DA', 1),
(2888, 185, 'Diourbel', 'DI', 1),
(2889, 185, 'Fatick', 'FA', 1),
(2890, 185, 'Kaolack', 'KA', 1),
(2891, 185, 'Kolda', 'KO', 1),
(2892, 185, 'Louga', 'LO', 1),
(2893, 185, 'Matam', 'MA', 1),
(2894, 185, 'Saint-Louis', 'SL', 1),
(2895, 185, 'Tambacounda', 'TA', 1),
(2896, 185, 'Thies', 'TH', 1),
(2897, 185, 'Ziguinchor', 'ZI', 1),
(2898, 186, 'Anse aux Pins', 'AP', 1),
(2899, 186, 'Anse Boileau', 'AB', 1),
(2900, 186, 'Anse Etoile', 'AE', 1),
(2901, 186, 'Anse Louis', 'AL', 1),
(2902, 186, 'Anse Royale', 'AR', 1),
(2903, 186, 'Baie Lazare', 'BL', 1),
(2904, 186, 'Baie Sainte Anne', 'BS', 1),
(2905, 186, 'Beau Vallon', 'BV', 1),
(2906, 186, 'Bel Air', 'BA', 1),
(2907, 186, 'Bel Ombre', 'BO', 1),
(2908, 186, 'Cascade', 'CA', 1),
(2909, 186, 'Glacis', 'GL', 1),
(2910, 186, 'Grand'' Anse (on Mahe)', 'GM', 1),
(2911, 186, 'Grand'' Anse (on Praslin)', 'GP', 1),
(2912, 186, 'La Digue', 'DG', 1),
(2913, 186, 'La Riviere Anglaise', 'RA', 1),
(2914, 186, 'Mont Buxton', 'MB', 1),
(2915, 186, 'Mont Fleuri', 'MF', 1),
(2916, 186, 'Plaisance', 'PL', 1),
(2917, 186, 'Pointe La Rue', 'PR', 1),
(2918, 186, 'Port Glaud', 'PG', 1),
(2919, 186, 'Saint Louis', 'SL', 1),
(2920, 186, 'Takamaka', 'TA', 1),
(2921, 187, 'Eastern', 'E', 1),
(2922, 187, 'Northern', 'N', 1),
(2923, 187, 'Southern', 'S', 1),
(2924, 187, 'Western', 'W', 1),
(2925, 189, 'Banskobystrický', 'BA', 1),
(2926, 189, 'Bratislavský', 'BR', 1),
(2927, 189, 'Košický', 'KO', 1),
(2928, 189, 'Nitriansky', 'NI', 1),
(2929, 189, 'Prešovský', 'PR', 1),
(2930, 189, 'Trenčiansky', 'TC', 1),
(2931, 189, 'Trnavský', 'TV', 1),
(2932, 189, 'Žilinský', 'ZI', 1),
(2933, 191, 'Central', 'CE', 1),
(2934, 191, 'Choiseul', 'CH', 1),
(2935, 191, 'Guadalcanal', 'GC', 1),
(2936, 191, 'Honiara', 'HO', 1),
(2937, 191, 'Isabel', 'IS', 1),
(2938, 191, 'Makira', 'MK', 1),
(2939, 191, 'Malaita', 'ML', 1),
(2940, 191, 'Rennell and Bellona', 'RB', 1),
(2941, 191, 'Temotu', 'TM', 1),
(2942, 191, 'Western', 'WE', 1),
(2943, 192, 'Awdal', 'AW', 1),
(2944, 192, 'Bakool', 'BK', 1),
(2945, 192, 'Banaadir', 'BN', 1),
(2946, 192, 'Bari', 'BR', 1),
(2947, 192, 'Bay', 'BY', 1),
(2948, 192, 'Galguduud', 'GA', 1),
(2949, 192, 'Gedo', 'GE', 1),
(2950, 192, 'Hiiraan', 'HI', 1),
(2951, 192, 'Jubbada Dhexe', 'JD', 1),
(2952, 192, 'Jubbada Hoose', 'JH', 1),
(2953, 192, 'Mudug', 'MU', 1),
(2954, 192, 'Nugaal', 'NU', 1),
(2955, 192, 'Sanaag', 'SA', 1),
(2956, 192, 'Shabeellaha Dhexe', 'SD', 1),
(2957, 192, 'Shabeellaha Hoose', 'SH', 1),
(2958, 192, 'Sool', 'SL', 1),
(2959, 192, 'Togdheer', 'TO', 1),
(2960, 192, 'Woqooyi Galbeed', 'WG', 1),
(2961, 193, 'Eastern Cape', 'EC', 1),
(2962, 193, 'Free State', 'FS', 1),
(2963, 193, 'Gauteng', 'GT', 1),
(2964, 193, 'KwaZulu-Natal', 'KN', 1),
(2965, 193, 'Limpopo', 'LP', 1),
(2966, 193, 'Mpumalanga', 'MP', 1),
(2967, 193, 'North West', 'NW', 1),
(2968, 193, 'Northern Cape', 'NC', 1),
(2969, 193, 'Western Cape', 'WC', 1),
(2970, 195, 'La Coru&ntilde;a', 'CA', 1),
(2971, 195, '&Aacute;lava', 'AL', 1),
(2972, 195, 'Albacete', 'AB', 1),
(2973, 195, 'Alicante', 'AC', 1),
(2974, 195, 'Almeria', 'AM', 1),
(2975, 195, 'Asturias', 'AS', 1),
(2976, 195, '&Aacute;vila', 'AV', 1),
(2977, 195, 'Badajoz', 'BJ', 1),
(2978, 195, 'Baleares', 'IB', 1),
(2979, 195, 'Barcelona', 'BA', 1),
(2980, 195, 'Burgos', 'BU', 1),
(2981, 195, 'C&aacute;ceres', 'CC', 1),
(2982, 195, 'C&aacute;diz', 'CZ', 1),
(2983, 195, 'Cantabria', 'CT', 1),
(2984, 195, 'Castell&oacute;n', 'CL', 1),
(2985, 195, 'Ceuta', 'CE', 1),
(2986, 195, 'Ciudad Real', 'CR', 1),
(2987, 195, 'C&oacute;rdoba', 'CD', 1),
(2988, 195, 'Cuenca', 'CU', 1),
(2989, 195, 'Girona', 'GI', 1),
(2990, 195, 'Granada', 'GD', 1),
(2991, 195, 'Guadalajara', 'GJ', 1),
(2992, 195, 'Guip&uacute;zcoa', 'GP', 1),
(2993, 195, 'Huelva', 'HL', 1),
(2994, 195, 'Huesca', 'HS', 1),
(2995, 195, 'Ja&eacute;n', 'JN', 1),
(2996, 195, 'La Rioja', 'RJ', 1),
(2997, 195, 'Las Palmas', 'PM', 1),
(2998, 195, 'Leon', 'LE', 1),
(2999, 195, 'Lleida', 'LL', 1),
(3000, 195, 'Lugo', 'LG', 1),
(3001, 195, 'Madrid', 'MD', 1),
(3002, 195, 'Malaga', 'MA', 1),
(3003, 195, 'Melilla', 'ML', 1),
(3004, 195, 'Murcia', 'MU', 1),
(3005, 195, 'Navarra', 'NV', 1),
(3006, 195, 'Ourense', 'OU', 1),
(3007, 195, 'Palencia', 'PL', 1),
(3008, 195, 'Pontevedra', 'PO', 1),
(3009, 195, 'Salamanca', 'SL', 1),
(3010, 195, 'Santa Cruz de Tenerife', 'SC', 1),
(3011, 195, 'Segovia', 'SG', 1),
(3012, 195, 'Sevilla', 'SV', 1),
(3013, 195, 'Soria', 'SO', 1),
(3014, 195, 'Tarragona', 'TA', 1),
(3015, 195, 'Teruel', 'TE', 1),
(3016, 195, 'Toledo', 'TO', 1),
(3017, 195, 'Valencia', 'VC', 1),
(3018, 195, 'Valladolid', 'VD', 1),
(3019, 195, 'Vizcaya', 'VZ', 1),
(3020, 195, 'Zamora', 'ZM', 1),
(3021, 195, 'Zaragoza', 'ZR', 1),
(3022, 196, 'Central', 'CE', 1),
(3023, 196, 'Eastern', 'EA', 1),
(3024, 196, 'North Central', 'NC', 1),
(3025, 196, 'Northern', 'NO', 1),
(3026, 196, 'North Western', 'NW', 1),
(3027, 196, 'Sabaragamuwa', 'SA', 1),
(3028, 196, 'Southern', 'SO', 1),
(3029, 196, 'Uva', 'UV', 1),
(3030, 196, 'Western', 'WE', 1),
(3032, 197, 'Saint Helena', 'S', 1),
(3034, 199, 'A''ali an Nil', 'ANL', 1),
(3035, 199, 'Al Bahr al Ahmar', 'BAM', 1),
(3036, 199, 'Al Buhayrat', 'BRT', 1),
(3037, 199, 'Al Jazirah', 'JZR', 1),
(3038, 199, 'Al Khartum', 'KRT', 1),
(3039, 199, 'Al Qadarif', 'QDR', 1),
(3040, 199, 'Al Wahdah', 'WDH', 1),
(3041, 199, 'An Nil al Abyad', 'ANB', 1),
(3042, 199, 'An Nil al Azraq', 'ANZ', 1),
(3043, 199, 'Ash Shamaliyah', 'ASH', 1),
(3044, 199, 'Bahr al Jabal', 'BJA', 1),
(3045, 199, 'Gharb al Istiwa''iyah', 'GIS', 1),
(3046, 199, 'Gharb Bahr al Ghazal', 'GBG', 1),
(3047, 199, 'Gharb Darfur', 'GDA', 1),
(3048, 199, 'Gharb Kurdufan', 'GKU', 1),
(3049, 199, 'Janub Darfur', 'JDA', 1),
(3050, 199, 'Janub Kurdufan', 'JKU', 1),
(3051, 199, 'Junqali', 'JQL', 1),
(3052, 199, 'Kassala', 'KSL', 1),
(3053, 199, 'Nahr an Nil', 'NNL', 1),
(3054, 199, 'Shamal Bahr al Ghazal', 'SBG', 1),
(3055, 199, 'Shamal Darfur', 'SDA', 1),
(3056, 199, 'Shamal Kurdufan', 'SKU', 1),
(3057, 199, 'Sharq al Istiwa''iyah', 'SIS', 1),
(3058, 199, 'Sinnar', 'SNR', 1),
(3059, 199, 'Warab', 'WRB', 1),
(3060, 200, 'Brokopondo', 'BR', 1),
(3061, 200, 'Commewijne', 'CM', 1),
(3062, 200, 'Coronie', 'CR', 1),
(3063, 200, 'Marowijne', 'MA', 1),
(3064, 200, 'Nickerie', 'NI', 1),
(3065, 200, 'Para', 'PA', 1),
(3066, 200, 'Paramaribo', 'PM', 1),
(3067, 200, 'Saramacca', 'SA', 1),
(3068, 200, 'Sipaliwini', 'SI', 1),
(3069, 200, 'Wanica', 'WA', 1),
(3070, 202, 'Hhohho', 'H', 1),
(3071, 202, 'Lubombo', 'L', 1),
(3072, 202, 'Manzini', 'M', 1),
(3073, 202, 'Shishelweni', 'S', 1),
(3074, 203, 'Blekinge', 'K', 1),
(3075, 203, 'Dalarna', 'W', 1),
(3076, 203, 'G&auml;vleborg', 'X', 1),
(3077, 203, 'Gotland', 'I', 1),
(3078, 203, 'Halland', 'N', 1),
(3079, 203, 'J&auml;mtland', 'Z', 1),
(3080, 203, 'J&ouml;nk&ouml;ping', 'F', 1),
(3081, 203, 'Kalmar', 'H', 1),
(3082, 203, 'Kronoberg', 'G', 1),
(3083, 203, 'Norrbotten', 'BD', 1),
(3084, 203, '&Ouml;rebro', 'T', 1),
(3085, 203, '&Ouml;sterg&ouml;tland', 'E', 1),
(3086, 203, 'Sk&aring;ne', 'M', 1),
(3087, 203, 'S&ouml;dermanland', 'D', 1),
(3088, 203, 'Stockholm', 'AB', 1),
(3089, 203, 'Uppsala', 'C', 1),
(3090, 203, 'V&auml;rmland', 'S', 1),
(3091, 203, 'V&auml;sterbotten', 'AC', 1),
(3092, 203, 'V&auml;sternorrland', 'Y', 1),
(3093, 203, 'V&auml;stmanland', 'U', 1),
(3094, 203, 'V&auml;stra G&ouml;taland', 'O', 1),
(3095, 204, 'Aargau', 'AG', 1),
(3096, 204, 'Appenzell Ausserrhoden', 'AR', 1),
(3097, 204, 'Appenzell Innerrhoden', 'AI', 1),
(3098, 204, 'Basel-Stadt', 'BS', 1),
(3099, 204, 'Basel-Landschaft', 'BL', 1),
(3100, 204, 'Bern', 'BE', 1),
(3101, 204, 'Fribourg', 'FR', 1),
(3102, 204, 'Gen&egrave;ve', 'GE', 1),
(3103, 204, 'Glarus', 'GL', 1),
(3104, 204, 'Graub&uuml;nden', 'GR', 1),
(3105, 204, 'Jura', 'JU', 1),
(3106, 204, 'Luzern', 'LU', 1),
(3107, 204, 'Neuch&acirc;tel', 'NE', 1),
(3108, 204, 'Nidwald', 'NW', 1),
(3109, 204, 'Obwald', 'OW', 1),
(3110, 204, 'St. Gallen', 'SG', 1),
(3111, 204, 'Schaffhausen', 'SH', 1),
(3112, 204, 'Schwyz', 'SZ', 1),
(3113, 204, 'Solothurn', 'SO', 1),
(3114, 204, 'Thurgau', 'TG', 1),
(3115, 204, 'Ticino', 'TI', 1),
(3116, 204, 'Uri', 'UR', 1),
(3117, 204, 'Valais', 'VS', 1),
(3118, 204, 'Vaud', 'VD', 1),
(3119, 204, 'Zug', 'ZG', 1),
(3120, 204, 'Z&uuml;rich', 'ZH', 1),
(3121, 205, 'Al Hasakah', 'HA', 1),
(3122, 205, 'Al Ladhiqiyah', 'LA', 1),
(3123, 205, 'Al Qunaytirah', 'QU', 1),
(3124, 205, 'Ar Raqqah', 'RQ', 1),
(3125, 205, 'As Suwayda', 'SU', 1),
(3126, 205, 'Dara', 'DA', 1),
(3127, 205, 'Dayr az Zawr', 'DZ', 1),
(3128, 205, 'Dimashq', 'DI', 1),
(3129, 205, 'Halab', 'HL', 1),
(3130, 205, 'Hamah', 'HM', 1),
(3131, 205, 'Hims', 'HI', 1),
(3132, 205, 'Idlib', 'ID', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(3133, 205, 'Rif Dimashq', 'RD', 1),
(3134, 205, 'Tartus', 'TA', 1),
(3135, 206, 'Chang-hua', 'CH', 1),
(3136, 206, 'Chia-i', 'CI', 1),
(3137, 206, 'Hsin-chu', 'HS', 1),
(3138, 206, 'Hua-lien', 'HL', 1),
(3139, 206, 'I-lan', 'IL', 1),
(3140, 206, 'Kao-hsiung county', 'KH', 1),
(3141, 206, 'Kin-men', 'KM', 1),
(3142, 206, 'Lien-chiang', 'LC', 1),
(3143, 206, 'Miao-li', 'ML', 1),
(3144, 206, 'Nan-t''ou', 'NT', 1),
(3145, 206, 'P''eng-hu', 'PH', 1),
(3146, 206, 'P''ing-tung', 'PT', 1),
(3147, 206, 'T''ai-chung', 'TG', 1),
(3148, 206, 'T''ai-nan', 'TA', 1),
(3149, 206, 'T''ai-pei county', 'TP', 1),
(3150, 206, 'T''ai-tung', 'TT', 1),
(3151, 206, 'T''ao-yuan', 'TY', 1),
(3152, 206, 'Yun-lin', 'YL', 1),
(3153, 206, 'Chia-i city', 'CC', 1),
(3154, 206, 'Chi-lung', 'CL', 1),
(3155, 206, 'Hsin-chu', 'HC', 1),
(3156, 206, 'T''ai-chung', 'TH', 1),
(3157, 206, 'T''ai-nan', 'TN', 1),
(3158, 206, 'Kao-hsiung city', 'KC', 1),
(3159, 206, 'T''ai-pei city', 'TC', 1),
(3160, 207, 'Gorno-Badakhstan', 'GB', 1),
(3161, 207, 'Khatlon', 'KT', 1),
(3162, 207, 'Sughd', 'SU', 1),
(3163, 208, 'Arusha', 'AR', 1),
(3164, 208, 'Dar es Salaam', 'DS', 1),
(3165, 208, 'Dodoma', 'DO', 1),
(3166, 208, 'Iringa', 'IR', 1),
(3167, 208, 'Kagera', 'KA', 1),
(3168, 208, 'Kigoma', 'KI', 1),
(3169, 208, 'Kilimanjaro', 'KJ', 1),
(3170, 208, 'Lindi', 'LN', 1),
(3171, 208, 'Manyara', 'MY', 1),
(3172, 208, 'Mara', 'MR', 1),
(3173, 208, 'Mbeya', 'MB', 1),
(3174, 208, 'Morogoro', 'MO', 1),
(3175, 208, 'Mtwara', 'MT', 1),
(3176, 208, 'Mwanza', 'MW', 1),
(3177, 208, 'Pemba North', 'PN', 1),
(3178, 208, 'Pemba South', 'PS', 1),
(3179, 208, 'Pwani', 'PW', 1),
(3180, 208, 'Rukwa', 'RK', 1),
(3181, 208, 'Ruvuma', 'RV', 1),
(3182, 208, 'Shinyanga', 'SH', 1),
(3183, 208, 'Singida', 'SI', 1),
(3184, 208, 'Tabora', 'TB', 1),
(3185, 208, 'Tanga', 'TN', 1),
(3186, 208, 'Zanzibar Central/South', 'ZC', 1),
(3187, 208, 'Zanzibar North', 'ZN', 1),
(3188, 208, 'Zanzibar Urban/West', 'ZU', 1),
(3189, 209, 'Amnat Charoen', 'Amnat Charoen', 1),
(3190, 209, 'Ang Thong', 'Ang Thong', 1),
(3191, 209, 'Ayutthaya', 'Ayutthaya', 1),
(3192, 209, 'Bangkok', 'Bangkok', 1),
(3193, 209, 'Buriram', 'Buriram', 1),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 1),
(3195, 209, 'Chai Nat', 'Chai Nat', 1),
(3196, 209, 'Chaiyaphum', 'Chaiyaphum', 1),
(3197, 209, 'Chanthaburi', 'Chanthaburi', 1),
(3198, 209, 'Chiang Mai', 'Chiang Mai', 1),
(3199, 209, 'Chiang Rai', 'Chiang Rai', 1),
(3200, 209, 'Chon Buri', 'Chon Buri', 1),
(3201, 209, 'Chumphon', 'Chumphon', 1),
(3202, 209, 'Kalasin', 'Kalasin', 1),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 1),
(3204, 209, 'Kanchanaburi', 'Kanchanaburi', 1),
(3205, 209, 'Khon Kaen', 'Khon Kaen', 1),
(3206, 209, 'Krabi', 'Krabi', 1),
(3207, 209, 'Lampang', 'Lampang', 1),
(3208, 209, 'Lamphun', 'Lamphun', 1),
(3209, 209, 'Loei', 'Loei', 1),
(3210, 209, 'Lop Buri', 'Lop Buri', 1),
(3211, 209, 'Mae Hong Son', 'Mae Hong Son', 1),
(3212, 209, 'Maha Sarakham', 'Maha Sarakham', 1),
(3213, 209, 'Mukdahan', 'Mukdahan', 1),
(3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 1),
(3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 1),
(3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 1),
(3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasima', 1),
(3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 1),
(3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', 1),
(3220, 209, 'Nan', 'Nan', 1),
(3221, 209, 'Narathiwat', 'Narathiwat', 1),
(3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 1),
(3223, 209, 'Nong Khai', 'Nong Khai', 1),
(3224, 209, 'Nonthaburi', 'Nonthaburi', 1),
(3225, 209, 'Pathum Thani', 'Pathum Thani', 1),
(3226, 209, 'Pattani', 'Pattani', 1),
(3227, 209, 'Phangnga', 'Phangnga', 1),
(3228, 209, 'Phatthalung', 'Phatthalung', 1),
(3229, 209, 'Phayao', 'Phayao', 1),
(3230, 209, 'Phetchabun', 'Phetchabun', 1),
(3231, 209, 'Phetchaburi', 'Phetchaburi', 1),
(3232, 209, 'Phichit', 'Phichit', 1),
(3233, 209, 'Phitsanulok', 'Phitsanulok', 1),
(3234, 209, 'Phrae', 'Phrae', 1),
(3235, 209, 'Phuket', 'Phuket', 1),
(3236, 209, 'Prachin Buri', 'Prachin Buri', 1),
(3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', 1),
(3238, 209, 'Ranong', 'Ranong', 1),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 1),
(3240, 209, 'Rayong', 'Rayong', 1),
(3241, 209, 'Roi Et', 'Roi Et', 1),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 1),
(3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 1),
(3244, 209, 'Samut Prakan', 'Samut Prakan', 1),
(3245, 209, 'Samut Sakhon', 'Samut Sakhon', 1),
(3246, 209, 'Samut Songkhram', 'Samut Songkhram', 1),
(3247, 209, 'Sara Buri', 'Sara Buri', 1),
(3248, 209, 'Satun', 'Satun', 1),
(3249, 209, 'Sing Buri', 'Sing Buri', 1),
(3250, 209, 'Sisaket', 'Sisaket', 1),
(3251, 209, 'Songkhla', 'Songkhla', 1),
(3252, 209, 'Sukhothai', 'Sukhothai', 1),
(3253, 209, 'Suphan Buri', 'Suphan Buri', 1),
(3254, 209, 'Surat Thani', 'Surat Thani', 1),
(3255, 209, 'Surin', 'Surin', 1),
(3256, 209, 'Tak', 'Tak', 1),
(3257, 209, 'Trang', 'Trang', 1),
(3258, 209, 'Trat', 'Trat', 1),
(3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 1),
(3260, 209, 'Udon Thani', 'Udon Thani', 1),
(3261, 209, 'Uthai Thani', 'Uthai Thani', 1),
(3262, 209, 'Uttaradit', 'Uttaradit', 1),
(3263, 209, 'Yala', 'Yala', 1),
(3264, 209, 'Yasothon', 'Yasothon', 1),
(3265, 210, 'Kara', 'K', 1),
(3266, 210, 'Plateaux', 'P', 1),
(3267, 210, 'Savanes', 'S', 1),
(3268, 210, 'Centrale', 'C', 1),
(3269, 210, 'Maritime', 'M', 1),
(3270, 211, 'Atafu', 'A', 1),
(3271, 211, 'Fakaofo', 'F', 1),
(3272, 211, 'Nukunonu', 'N', 1),
(3273, 212, 'Ha''apai', 'H', 1),
(3274, 212, 'Tongatapu', 'T', 1),
(3275, 212, 'Vava''u', 'V', 1),
(3276, 213, 'Couva/Tabaquite/Talparo', 'CT', 1),
(3277, 213, 'Diego Martin', 'DM', 1),
(3278, 213, 'Mayaro/Rio Claro', 'MR', 1),
(3279, 213, 'Penal/Debe', 'PD', 1),
(3280, 213, 'Princes Town', 'PT', 1),
(3281, 213, 'Sangre Grande', 'SG', 1),
(3282, 213, 'San Juan/Laventille', 'SL', 1),
(3283, 213, 'Siparia', 'SI', 1),
(3284, 213, 'Tunapuna/Piarco', 'TP', 1),
(3285, 213, 'Port of Spain', 'PS', 1),
(3286, 213, 'San Fernando', 'SF', 1),
(3287, 213, 'Arima', 'AR', 1),
(3288, 213, 'Point Fortin', 'PF', 1),
(3289, 213, 'Chaguanas', 'CH', 1),
(3290, 213, 'Tobago', 'TO', 1),
(3291, 214, 'Ariana', 'AR', 1),
(3292, 214, 'Beja', 'BJ', 1),
(3293, 214, 'Ben Arous', 'BA', 1),
(3294, 214, 'Bizerte', 'BI', 1),
(3295, 214, 'Gabes', 'GB', 1),
(3296, 214, 'Gafsa', 'GF', 1),
(3297, 214, 'Jendouba', 'JE', 1),
(3298, 214, 'Kairouan', 'KR', 1),
(3299, 214, 'Kasserine', 'KS', 1),
(3300, 214, 'Kebili', 'KB', 1),
(3301, 214, 'Kef', 'KF', 1),
(3302, 214, 'Mahdia', 'MH', 1),
(3303, 214, 'Manouba', 'MN', 1),
(3304, 214, 'Medenine', 'ME', 1),
(3305, 214, 'Monastir', 'MO', 1),
(3306, 214, 'Nabeul', 'NA', 1),
(3307, 214, 'Sfax', 'SF', 1),
(3308, 214, 'Sidi', 'SD', 1),
(3309, 214, 'Siliana', 'SL', 1),
(3310, 214, 'Sousse', 'SO', 1),
(3311, 214, 'Tataouine', 'TA', 1),
(3312, 214, 'Tozeur', 'TO', 1),
(3313, 214, 'Tunis', 'TU', 1),
(3314, 214, 'Zaghouan', 'ZA', 1),
(3315, 215, 'Adana', 'ADA', 1),
(3316, 215, 'Adıyaman', 'ADI', 1),
(3317, 215, 'Afyonkarahisar', 'AFY', 1),
(3318, 215, 'Ağrı', 'AGR', 1),
(3319, 215, 'Aksaray', 'AKS', 1),
(3320, 215, 'Amasya', 'AMA', 1),
(3321, 215, 'Ankara', 'ANK', 1),
(3322, 215, 'Antalya', 'ANT', 1),
(3323, 215, 'Ardahan', 'ARD', 1),
(3324, 215, 'Artvin', 'ART', 1),
(3325, 215, 'Aydın', 'AYI', 1),
(3326, 215, 'Balıkesir', 'BAL', 1),
(3327, 215, 'Bartın', 'BAR', 1),
(3328, 215, 'Batman', 'BAT', 1),
(3329, 215, 'Bayburt', 'BAY', 1),
(3330, 215, 'Bilecik', 'BIL', 1),
(3331, 215, 'Bingöl', 'BIN', 1),
(3332, 215, 'Bitlis', 'BIT', 1),
(3333, 215, 'Bolu', 'BOL', 1),
(3334, 215, 'Burdur', 'BRD', 1),
(3335, 215, 'Bursa', 'BRS', 1),
(3336, 215, 'Çanakkale', 'CKL', 1),
(3337, 215, 'Çankırı', 'CKR', 1),
(3338, 215, 'Çorum', 'COR', 1),
(3339, 215, 'Denizli', 'DEN', 1),
(3340, 215, 'Diyarbakır', 'DIY', 1),
(3341, 215, 'Düzce', 'DUZ', 1),
(3342, 215, 'Edirne', 'EDI', 1),
(3343, 215, 'Elazığ', 'ELA', 1),
(3344, 215, 'Erzincan', 'EZC', 1),
(3345, 215, 'Erzurum', 'EZR', 1),
(3346, 215, 'Eskişehir', 'ESK', 1),
(3347, 215, 'Gaziantep', 'GAZ', 1),
(3348, 215, 'Giresun', 'GIR', 1),
(3349, 215, 'Gümüşhane', 'GMS', 1),
(3350, 215, 'Hakkari', 'HKR', 1),
(3351, 215, 'Hatay', 'HTY', 1),
(3352, 215, 'Iğdır', 'IGD', 1),
(3353, 215, 'Isparta', 'ISP', 1),
(3354, 215, 'İstanbul', 'IST', 1),
(3355, 215, 'İzmir', 'IZM', 1),
(3356, 215, 'Kahramanmaraş', 'KAH', 1),
(3357, 215, 'Karabük', 'KRB', 1),
(3358, 215, 'Karaman', 'KRM', 1),
(3359, 215, 'Kars', 'KRS', 1),
(3360, 215, 'Kastamonu', 'KAS', 1),
(3361, 215, 'Kayseri', 'KAY', 1),
(3362, 215, 'Kilis', 'KLS', 1),
(3363, 215, 'Kırıkkale', 'KRK', 1),
(3364, 215, 'Kırklareli', 'KLR', 1),
(3365, 215, 'Kırşehir', 'KRH', 1),
(3366, 215, 'Kocaeli', 'KOC', 1),
(3367, 215, 'Konya', 'KON', 1),
(3368, 215, 'Kütahya', 'KUT', 1),
(3369, 215, 'Malatya', 'MAL', 1),
(3370, 215, 'Manisa', 'MAN', 1),
(3371, 215, 'Mardin', 'MAR', 1),
(3372, 215, 'Mersin', 'MER', 1),
(3373, 215, 'Muğla', 'MUG', 1),
(3374, 215, 'Muş', 'MUS', 1),
(3375, 215, 'Nevşehir', 'NEV', 1),
(3376, 215, 'Niğde', 'NIG', 1),
(3377, 215, 'Ordu', 'ORD', 1),
(3378, 215, 'Osmaniye', 'OSM', 1),
(3379, 215, 'Rize', 'RIZ', 1),
(3380, 215, 'Sakarya', 'SAK', 1),
(3381, 215, 'Samsun', 'SAM', 1),
(3382, 215, 'Şanlıurfa', 'SAN', 1),
(3383, 215, 'Siirt', 'SII', 1),
(3384, 215, 'Sinop', 'SIN', 1),
(3385, 215, 'Şırnak', 'SIR', 1),
(3386, 215, 'Sivas', 'SIV', 1),
(3387, 215, 'Tekirdağ', 'TEL', 1),
(3388, 215, 'Tokat', 'TOK', 1),
(3389, 215, 'Trabzon', 'TRA', 1),
(3390, 215, 'Tunceli', 'TUN', 1),
(3391, 215, 'Uşak', 'USK', 1),
(3392, 215, 'Van', 'VAN', 1),
(3393, 215, 'Yalova', 'YAL', 1),
(3394, 215, 'Yozgat', 'YOZ', 1),
(3395, 215, 'Zonguldak', 'ZON', 1),
(3396, 216, 'Ahal Welayaty', 'A', 1),
(3397, 216, 'Balkan Welayaty', 'B', 1),
(3398, 216, 'Dashhowuz Welayaty', 'D', 1),
(3399, 216, 'Lebap Welayaty', 'L', 1),
(3400, 216, 'Mary Welayaty', 'M', 1),
(3401, 217, 'Ambergris Cays', 'AC', 1),
(3402, 217, 'Dellis Cay', 'DC', 1),
(3403, 217, 'French Cay', 'FC', 1),
(3404, 217, 'Little Water Cay', 'LW', 1),
(3405, 217, 'Parrot Cay', 'RC', 1),
(3406, 217, 'Pine Cay', 'PN', 1),
(3407, 217, 'Salt Cay', 'SL', 1),
(3408, 217, 'Grand Turk', 'GT', 1),
(3409, 217, 'South Caicos', 'SC', 1),
(3410, 217, 'East Caicos', 'EC', 1),
(3411, 217, 'Middle Caicos', 'MC', 1),
(3412, 217, 'North Caicos', 'NC', 1),
(3413, 217, 'Providenciales', 'PR', 1),
(3414, 217, 'West Caicos', 'WC', 1),
(3415, 218, 'Nanumanga', 'NMG', 1),
(3416, 218, 'Niulakita', 'NLK', 1),
(3417, 218, 'Niutao', 'NTO', 1),
(3418, 218, 'Funafuti', 'FUN', 1),
(3419, 218, 'Nanumea', 'NME', 1),
(3420, 218, 'Nui', 'NUI', 1),
(3421, 218, 'Nukufetau', 'NFT', 1),
(3422, 218, 'Nukulaelae', 'NLL', 1),
(3423, 218, 'Vaitupu', 'VAI', 1),
(3424, 219, 'Kalangala', 'KAL', 1),
(3425, 219, 'Kampala', 'KMP', 1),
(3426, 219, 'Kayunga', 'KAY', 1),
(3427, 219, 'Kiboga', 'KIB', 1),
(3428, 219, 'Luwero', 'LUW', 1),
(3429, 219, 'Masaka', 'MAS', 1),
(3430, 219, 'Mpigi', 'MPI', 1),
(3431, 219, 'Mubende', 'MUB', 1),
(3432, 219, 'Mukono', 'MUK', 1),
(3433, 219, 'Nakasongola', 'NKS', 1),
(3434, 219, 'Rakai', 'RAK', 1),
(3435, 219, 'Sembabule', 'SEM', 1),
(3436, 219, 'Wakiso', 'WAK', 1),
(3437, 219, 'Bugiri', 'BUG', 1),
(3438, 219, 'Busia', 'BUS', 1),
(3439, 219, 'Iganga', 'IGA', 1),
(3440, 219, 'Jinja', 'JIN', 1),
(3441, 219, 'Kaberamaido', 'KAB', 1),
(3442, 219, 'Kamuli', 'KML', 1),
(3443, 219, 'Kapchorwa', 'KPC', 1),
(3444, 219, 'Katakwi', 'KTK', 1),
(3445, 219, 'Kumi', 'KUM', 1),
(3446, 219, 'Mayuge', 'MAY', 1),
(3447, 219, 'Mbale', 'MBA', 1),
(3448, 219, 'Pallisa', 'PAL', 1),
(3449, 219, 'Sironko', 'SIR', 1),
(3450, 219, 'Soroti', 'SOR', 1),
(3451, 219, 'Tororo', 'TOR', 1),
(3452, 219, 'Adjumani', 'ADJ', 1),
(3453, 219, 'Apac', 'APC', 1),
(3454, 219, 'Arua', 'ARU', 1),
(3455, 219, 'Gulu', 'GUL', 1),
(3456, 219, 'Kitgum', 'KIT', 1),
(3457, 219, 'Kotido', 'KOT', 1),
(3458, 219, 'Lira', 'LIR', 1),
(3459, 219, 'Moroto', 'MRT', 1),
(3460, 219, 'Moyo', 'MOY', 1),
(3461, 219, 'Nakapiripirit', 'NAK', 1),
(3462, 219, 'Nebbi', 'NEB', 1),
(3463, 219, 'Pader', 'PAD', 1),
(3464, 219, 'Yumbe', 'YUM', 1),
(3465, 219, 'Bundibugyo', 'BUN', 1),
(3466, 219, 'Bushenyi', 'BSH', 1),
(3467, 219, 'Hoima', 'HOI', 1),
(3468, 219, 'Kabale', 'KBL', 1),
(3469, 219, 'Kabarole', 'KAR', 1),
(3470, 219, 'Kamwenge', 'KAM', 1),
(3471, 219, 'Kanungu', 'KAN', 1),
(3472, 219, 'Kasese', 'KAS', 1),
(3473, 219, 'Kibaale', 'KBA', 1),
(3474, 219, 'Kisoro', 'KIS', 1),
(3475, 219, 'Kyenjojo', 'KYE', 1),
(3476, 219, 'Masindi', 'MSN', 1),
(3477, 219, 'Mbarara', 'MBR', 1),
(3478, 219, 'Ntungamo', 'NTU', 1),
(3479, 219, 'Rukungiri', 'RUK', 1),
(3480, 220, 'Cherkas''ka Oblast''', '71', 1),
(3481, 220, 'Chernihivs''ka Oblast''', '74', 1),
(3482, 220, 'Chernivets''ka Oblast''', '77', 1),
(3483, 220, 'Crimea', '43', 1),
(3484, 220, 'Dnipropetrovs''ka Oblast''', '12', 1),
(3485, 220, 'Donets''ka Oblast''', '14', 1),
(3486, 220, 'Ivano-Frankivs''ka Oblast''', '26', 1),
(3487, 220, 'Khersons''ka Oblast''', '65', 1),
(3488, 220, 'Khmel''nyts''ka Oblast''', '68', 1),
(3489, 220, 'Kirovohrads''ka Oblast''', '35', 1),
(3490, 220, 'Kyiv', '30', 1),
(3491, 220, 'Kyivs''ka Oblast''', '32', 1),
(3492, 220, 'Luhans''ka Oblast''', '09', 1),
(3493, 220, 'L''vivs''ka Oblast''', '46', 1),
(3494, 220, 'Mykolayivs''ka Oblast''', '48', 1),
(3495, 220, 'Odes''ka Oblast''', '51', 1),
(3496, 220, 'Poltavs''ka Oblast''', '53', 1),
(3497, 220, 'Rivnens''ka Oblast''', '56', 1),
(3498, 220, 'Sevastopol''', '40', 1),
(3499, 220, 'Sums''ka Oblast''', '59', 1),
(3500, 220, 'Ternopil''s''ka Oblast''', '61', 1),
(3501, 220, 'Vinnyts''ka Oblast''', '05', 1),
(3502, 220, 'Volyns''ka Oblast''', '07', 1),
(3503, 220, 'Zakarpats''ka Oblast''', '21', 1),
(3504, 220, 'Zaporiz''ka Oblast''', '23', 1),
(3505, 220, 'Zhytomyrs''ka oblast''', '18', 1),
(3506, 221, 'Abu Dhabi', 'ADH', 1),
(3507, 221, '''Ajman', 'AJ', 1),
(3508, 221, 'Al Fujayrah', 'FU', 1),
(3509, 221, 'Ash Shariqah', 'SH', 1),
(3510, 221, 'Dubai', 'DU', 1),
(3511, 221, 'R''as al Khaymah', 'RK', 1),
(3512, 221, 'Umm al Qaywayn', 'UQ', 1),
(3513, 222, 'Aberdeen', 'ABN', 1),
(3514, 222, 'Aberdeenshire', 'ABNS', 1),
(3515, 222, 'Anglesey', 'ANG', 1),
(3516, 222, 'Angus', 'AGS', 1),
(3517, 222, 'Argyll and Bute', 'ARY', 1),
(3518, 222, 'Bedfordshire', 'BEDS', 1),
(3519, 222, 'Berkshire', 'BERKS', 1),
(3520, 222, 'Blaenau Gwent', 'BLA', 1),
(3521, 222, 'Bridgend', 'BRI', 1),
(3522, 222, 'Bristol', 'BSTL', 1),
(3523, 222, 'Buckinghamshire', 'BUCKS', 1),
(3524, 222, 'Caerphilly', 'CAE', 1),
(3525, 222, 'Cambridgeshire', 'CAMBS', 1),
(3526, 222, 'Cardiff', 'CDF', 1),
(3527, 222, 'Carmarthenshire', 'CARM', 1),
(3528, 222, 'Ceredigion', 'CDGN', 1),
(3529, 222, 'Cheshire', 'CHES', 1),
(3530, 222, 'Clackmannanshire', 'CLACK', 1),
(3531, 222, 'Conwy', 'CON', 1),
(3532, 222, 'Cornwall', 'CORN', 1),
(3533, 222, 'Denbighshire', 'DNBG', 1),
(3534, 222, 'Derbyshire', 'DERBY', 1),
(3535, 222, 'Devon', 'DVN', 1),
(3536, 222, 'Dorset', 'DOR', 1),
(3537, 222, 'Dumfries and Galloway', 'DGL', 1),
(3538, 222, 'Dundee', 'DUND', 1),
(3539, 222, 'Durham', 'DHM', 1),
(3540, 222, 'East Ayrshire', 'ARYE', 1),
(3541, 222, 'East Dunbartonshire', 'DUNBE', 1),
(3542, 222, 'East Lothian', 'LOTE', 1),
(3543, 222, 'East Renfrewshire', 'RENE', 1),
(3544, 222, 'East Riding of Yorkshire', 'ERYS', 1),
(3545, 222, 'East Sussex', 'SXE', 1),
(3546, 222, 'Edinburgh', 'EDIN', 1),
(3547, 222, 'Essex', 'ESX', 1),
(3548, 222, 'Falkirk', 'FALK', 1),
(3549, 222, 'Fife', 'FFE', 1),
(3550, 222, 'Flintshire', 'FLINT', 1),
(3551, 222, 'Glasgow', 'GLAS', 1),
(3552, 222, 'Gloucestershire', 'GLOS', 1),
(3553, 222, 'Greater London', 'LDN', 1),
(3554, 222, 'Greater Manchester', 'MCH', 1),
(3555, 222, 'Gwynedd', 'GDD', 1),
(3556, 222, 'Hampshire', 'HANTS', 1),
(3557, 222, 'Herefordshire', 'HWR', 1),
(3558, 222, 'Hertfordshire', 'HERTS', 1),
(3559, 222, 'Highlands', 'HLD', 1),
(3560, 222, 'Inverclyde', 'IVER', 1),
(3561, 222, 'Isle of Wight', 'IOW', 1),
(3562, 222, 'Kent', 'KNT', 1),
(3563, 222, 'Lancashire', 'LANCS', 1),
(3564, 222, 'Leicestershire', 'LEICS', 1),
(3565, 222, 'Lincolnshire', 'LINCS', 1),
(3566, 222, 'Merseyside', 'MSY', 1),
(3567, 222, 'Merthyr Tydfil', 'MERT', 1),
(3568, 222, 'Midlothian', 'MLOT', 1),
(3569, 222, 'Monmouthshire', 'MMOUTH', 1),
(3570, 222, 'Moray', 'MORAY', 1),
(3571, 222, 'Neath Port Talbot', 'NPRTAL', 1),
(3572, 222, 'Newport', 'NEWPT', 1),
(3573, 222, 'Norfolk', 'NOR', 1),
(3574, 222, 'North Ayrshire', 'ARYN', 1),
(3575, 222, 'North Lanarkshire', 'LANN', 1),
(3576, 222, 'North Yorkshire', 'YSN', 1),
(3577, 222, 'Northamptonshire', 'NHM', 1),
(3578, 222, 'Northumberland', 'NLD', 1),
(3579, 222, 'Nottinghamshire', 'NOT', 1),
(3580, 222, 'Orkney Islands', 'ORK', 1),
(3581, 222, 'Oxfordshire', 'OFE', 1),
(3582, 222, 'Pembrokeshire', 'PEM', 1),
(3583, 222, 'Perth and Kinross', 'PERTH', 1),
(3584, 222, 'Powys', 'PWS', 1),
(3585, 222, 'Renfrewshire', 'REN', 1),
(3586, 222, 'Rhondda Cynon Taff', 'RHON', 1),
(3587, 222, 'Rutland', 'RUT', 1),
(3588, 222, 'Scottish Borders', 'BOR', 1),
(3589, 222, 'Shetland Islands', 'SHET', 1),
(3590, 222, 'Shropshire', 'SPE', 1),
(3591, 222, 'Somerset', 'SOM', 1),
(3592, 222, 'South Ayrshire', 'ARYS', 1),
(3593, 222, 'South Lanarkshire', 'LANS', 1),
(3594, 222, 'South Yorkshire', 'YSS', 1),
(3595, 222, 'Staffordshire', 'SFD', 1),
(3596, 222, 'Stirling', 'STIR', 1),
(3597, 222, 'Suffolk', 'SFK', 1),
(3598, 222, 'Surrey', 'SRY', 1),
(3599, 222, 'Swansea', 'SWAN', 1),
(3600, 222, 'Torfaen', 'TORF', 1),
(3601, 222, 'Tyne and Wear', 'TWR', 1),
(3602, 222, 'Vale of Glamorgan', 'VGLAM', 1),
(3603, 222, 'Warwickshire', 'WARKS', 1),
(3604, 222, 'West Dunbartonshire', 'WDUN', 1),
(3605, 222, 'West Lothian', 'WLOT', 1),
(3606, 222, 'West Midlands', 'WMD', 1),
(3607, 222, 'West Sussex', 'SXW', 1),
(3608, 222, 'West Yorkshire', 'YSW', 1),
(3609, 222, 'Western Isles', 'WIL', 1),
(3610, 222, 'Wiltshire', 'WLT', 1),
(3611, 222, 'Worcestershire', 'WORCS', 1),
(3612, 222, 'Wrexham', 'WRX', 1),
(3613, 223, 'Alabama', 'AL', 1),
(3614, 223, 'Alaska', 'AK', 1),
(3615, 223, 'American Samoa', 'AS', 1),
(3616, 223, 'Arizona', 'AZ', 1),
(3617, 223, 'Arkansas', 'AR', 1),
(3618, 223, 'Armed Forces Africa', 'AF', 1),
(3619, 223, 'Armed Forces Americas', 'AA', 1),
(3620, 223, 'Armed Forces Canada', 'AC', 1),
(3621, 223, 'Armed Forces Europe', 'AE', 1),
(3622, 223, 'Armed Forces Middle East', 'AM', 1),
(3623, 223, 'Armed Forces Pacific', 'AP', 1),
(3624, 223, 'California', 'CA', 1),
(3625, 223, 'Colorado', 'CO', 1),
(3626, 223, 'Connecticut', 'CT', 1),
(3627, 223, 'Delaware', 'DE', 1),
(3628, 223, 'District of Columbia', 'DC', 1),
(3629, 223, 'Federated States Of Micronesia', 'FM', 1),
(3630, 223, 'Florida', 'FL', 1),
(3631, 223, 'Georgia', 'GA', 1),
(3632, 223, 'Guam', 'GU', 1),
(3633, 223, 'Hawaii', 'HI', 1),
(3634, 223, 'Idaho', 'ID', 1),
(3635, 223, 'Illinois', 'IL', 1),
(3636, 223, 'Indiana', 'IN', 1),
(3637, 223, 'Iowa', 'IA', 1),
(3638, 223, 'Kansas', 'KS', 1),
(3639, 223, 'Kentucky', 'KY', 1),
(3640, 223, 'Louisiana', 'LA', 1),
(3641, 223, 'Maine', 'ME', 1),
(3642, 223, 'Marshall Islands', 'MH', 1),
(3643, 223, 'Maryland', 'MD', 1),
(3644, 223, 'Massachusetts', 'MA', 1),
(3645, 223, 'Michigan', 'MI', 1),
(3646, 223, 'Minnesota', 'MN', 1),
(3647, 223, 'Mississippi', 'MS', 1),
(3648, 223, 'Missouri', 'MO', 1),
(3649, 223, 'Montana', 'MT', 1),
(3650, 223, 'Nebraska', 'NE', 1),
(3651, 223, 'Nevada', 'NV', 1),
(3652, 223, 'New Hampshire', 'NH', 1),
(3653, 223, 'New Jersey', 'NJ', 1),
(3654, 223, 'New Mexico', 'NM', 1),
(3655, 223, 'New York', 'NY', 1),
(3656, 223, 'North Carolina', 'NC', 1),
(3657, 223, 'North Dakota', 'ND', 1),
(3658, 223, 'Northern Mariana Islands', 'MP', 1),
(3659, 223, 'Ohio', 'OH', 1),
(3660, 223, 'Oklahoma', 'OK', 1),
(3661, 223, 'Oregon', 'OR', 1),
(3662, 223, 'Palau', 'PW', 1),
(3663, 223, 'Pennsylvania', 'PA', 1),
(3664, 223, 'Puerto Rico', 'PR', 1),
(3665, 223, 'Rhode Island', 'RI', 1),
(3666, 223, 'South Carolina', 'SC', 1),
(3667, 223, 'South Dakota', 'SD', 1),
(3668, 223, 'Tennessee', 'TN', 1),
(3669, 223, 'Texas', 'TX', 1),
(3670, 223, 'Utah', 'UT', 1),
(3671, 223, 'Vermont', 'VT', 1),
(3672, 223, 'Virgin Islands', 'VI', 1),
(3673, 223, 'Virginia', 'VA', 1),
(3674, 223, 'Washington', 'WA', 1),
(3675, 223, 'West Virginia', 'WV', 1),
(3676, 223, 'Wisconsin', 'WI', 1),
(3677, 223, 'Wyoming', 'WY', 1),
(3678, 224, 'Baker Island', 'BI', 1),
(3679, 224, 'Howland Island', 'HI', 1),
(3680, 224, 'Jarvis Island', 'JI', 1),
(3681, 224, 'Johnston Atoll', 'JA', 1),
(3682, 224, 'Kingman Reef', 'KR', 1),
(3683, 224, 'Midway Atoll', 'MA', 1),
(3684, 224, 'Navassa Island', 'NI', 1),
(3685, 224, 'Palmyra Atoll', 'PA', 1),
(3686, 224, 'Wake Island', 'WI', 1),
(3687, 225, 'Artigas', 'AR', 1),
(3688, 225, 'Canelones', 'CA', 1),
(3689, 225, 'Cerro Largo', 'CL', 1),
(3690, 225, 'Colonia', 'CO', 1),
(3691, 225, 'Durazno', 'DU', 1),
(3692, 225, 'Flores', 'FS', 1),
(3693, 225, 'Florida', 'FA', 1),
(3694, 225, 'Lavalleja', 'LA', 1),
(3695, 225, 'Maldonado', 'MA', 1),
(3696, 225, 'Montevideo', 'MO', 1),
(3697, 225, 'Paysandu', 'PA', 1),
(3698, 225, 'Rio Negro', 'RN', 1),
(3699, 225, 'Rivera', 'RV', 1),
(3700, 225, 'Rocha', 'RO', 1),
(3701, 225, 'Salto', 'SL', 1),
(3702, 225, 'San Jose', 'SJ', 1),
(3703, 225, 'Soriano', 'SO', 1),
(3704, 225, 'Tacuarembo', 'TA', 1),
(3705, 225, 'Treinta y Tres', 'TT', 1),
(3706, 226, 'Andijon', 'AN', 1),
(3707, 226, 'Buxoro', 'BU', 1),
(3708, 226, 'Farg''ona', 'FA', 1),
(3709, 226, 'Jizzax', 'JI', 1),
(3710, 226, 'Namangan', 'NG', 1),
(3711, 226, 'Navoiy', 'NW', 1),
(3712, 226, 'Qashqadaryo', 'QA', 1),
(3713, 226, 'Qoraqalpog''iston Republikasi', 'QR', 1),
(3714, 226, 'Samarqand', 'SA', 1),
(3715, 226, 'Sirdaryo', 'SI', 1),
(3716, 226, 'Surxondaryo', 'SU', 1),
(3717, 226, 'Toshkent City', 'TK', 1),
(3718, 226, 'Toshkent Region', 'TO', 1),
(3719, 226, 'Xorazm', 'XO', 1),
(3720, 227, 'Malampa', 'MA', 1),
(3721, 227, 'Penama', 'PE', 1),
(3722, 227, 'Sanma', 'SA', 1),
(3723, 227, 'Shefa', 'SH', 1),
(3724, 227, 'Tafea', 'TA', 1),
(3725, 227, 'Torba', 'TO', 1),
(3726, 229, 'Amazonas', 'AM', 1),
(3727, 229, 'Anzoategui', 'AN', 1),
(3728, 229, 'Apure', 'AP', 1),
(3729, 229, 'Aragua', 'AR', 1),
(3730, 229, 'Barinas', 'BA', 1),
(3731, 229, 'Bolivar', 'BO', 1),
(3732, 229, 'Carabobo', 'CA', 1),
(3733, 229, 'Cojedes', 'CO', 1),
(3734, 229, 'Delta Amacuro', 'DA', 1),
(3735, 229, 'Dependencias Federales', 'DF', 1),
(3736, 229, 'Distrito Federal', 'DI', 1),
(3737, 229, 'Falcon', 'FA', 1),
(3738, 229, 'Guarico', 'GU', 1),
(3739, 229, 'Lara', 'LA', 1),
(3740, 229, 'Merida', 'ME', 1),
(3741, 229, 'Miranda', 'MI', 1),
(3742, 229, 'Monagas', 'MO', 1),
(3743, 229, 'Nueva Esparta', 'NE', 1),
(3744, 229, 'Portuguesa', 'PO', 1),
(3745, 229, 'Sucre', 'SU', 1),
(3746, 229, 'Tachira', 'TA', 1),
(3747, 229, 'Trujillo', 'TR', 1),
(3748, 229, 'Vargas', 'VA', 1),
(3749, 229, 'Yaracuy', 'YA', 1),
(3750, 229, 'Zulia', 'ZU', 1),
(3751, 230, 'An Giang', 'AG', 1),
(3752, 230, 'Bac Giang', 'BG', 1),
(3753, 230, 'Bac Kan', 'BK', 1),
(3754, 230, 'Bac Lieu', 'BL', 1),
(3755, 230, 'Bac Ninh', 'BC', 1),
(3756, 230, 'Ba Ria-Vung Tau', 'BR', 1),
(3757, 230, 'Ben Tre', 'BN', 1),
(3758, 230, 'Binh Dinh', 'BH', 1),
(3759, 230, 'Binh Duong', 'BU', 1),
(3760, 230, 'Binh Phuoc', 'BP', 1),
(3761, 230, 'Binh Thuan', 'BT', 1),
(3762, 230, 'Ca Mau', 'CM', 1),
(3763, 230, 'Can Tho', 'CT', 1),
(3764, 230, 'Cao Bang', 'CB', 1),
(3765, 230, 'Dak Lak', 'DL', 1),
(3766, 230, 'Dak Nong', 'DG', 1),
(3767, 230, 'Da Nang', 'DN', 1),
(3768, 230, 'Dien Bien', 'DB', 1),
(3769, 230, 'Dong Nai', 'DI', 1),
(3770, 230, 'Dong Thap', 'DT', 1),
(3771, 230, 'Gia Lai', 'GL', 1),
(3772, 230, 'Ha Giang', 'HG', 1),
(3773, 230, 'Hai Duong', 'HD', 1),
(3774, 230, 'Hai Phong', 'HP', 1),
(3775, 230, 'Ha Nam', 'HM', 1),
(3776, 230, 'Ha Noi', 'HI', 1),
(3777, 230, 'Ha Tay', 'HT', 1),
(3778, 230, 'Ha Tinh', 'HH', 1),
(3779, 230, 'Hoa Binh', 'HB', 1),
(3780, 230, 'Ho Chi Minh City', 'HC', 1),
(3781, 230, 'Hau Giang', 'HU', 1),
(3782, 230, 'Hung Yen', 'HY', 1),
(3783, 232, 'Saint Croix', 'C', 1),
(3784, 232, 'Saint John', 'J', 1),
(3785, 232, 'Saint Thomas', 'T', 1),
(3786, 233, 'Alo', 'A', 1),
(3787, 233, 'Sigave', 'S', 1),
(3788, 233, 'Wallis', 'W', 1),
(3789, 235, 'Abyan', 'AB', 1),
(3790, 235, 'Adan', 'AD', 1),
(3791, 235, 'Amran', 'AM', 1),
(3792, 235, 'Al Bayda', 'BA', 1),
(3793, 235, 'Ad Dali', 'DA', 1),
(3794, 235, 'Dhamar', 'DH', 1),
(3795, 235, 'Hadramawt', 'HD', 1),
(3796, 235, 'Hajjah', 'HJ', 1),
(3797, 235, 'Al Hudaydah', 'HU', 1),
(3798, 235, 'Ibb', 'IB', 1),
(3799, 235, 'Al Jawf', 'JA', 1),
(3800, 235, 'Lahij', 'LA', 1),
(3801, 235, 'Ma''rib', 'MA', 1),
(3802, 235, 'Al Mahrah', 'MR', 1),
(3803, 235, 'Al Mahwit', 'MW', 1),
(3804, 235, 'Sa''dah', 'SD', 1),
(3805, 235, 'San''a', 'SN', 1),
(3806, 235, 'Shabwah', 'SH', 1),
(3807, 235, 'Ta''izz', 'TA', 1),
(3812, 237, 'Bas-Congo', 'BC', 1),
(3813, 237, 'Bandundu', 'BN', 1),
(3814, 237, 'Equateur', 'EQ', 1),
(3815, 237, 'Katanga', 'KA', 1),
(3816, 237, 'Kasai-Oriental', 'KE', 1),
(3817, 237, 'Kinshasa', 'KN', 1),
(3818, 237, 'Kasai-Occidental', 'KW', 1),
(3819, 237, 'Maniema', 'MA', 1),
(3820, 237, 'Nord-Kivu', 'NK', 1),
(3821, 237, 'Orientale', 'OR', 1),
(3822, 237, 'Sud-Kivu', 'SK', 1),
(3823, 238, 'Central', 'CE', 1),
(3824, 238, 'Copperbelt', 'CB', 1),
(3825, 238, 'Eastern', 'EA', 1),
(3826, 238, 'Luapula', 'LP', 1),
(3827, 238, 'Lusaka', 'LK', 1),
(3828, 238, 'Northern', 'NO', 1),
(3829, 238, 'North-Western', 'NW', 1),
(3830, 238, 'Southern', 'SO', 1),
(3831, 238, 'Western', 'WE', 1),
(3832, 239, 'Bulawayo', 'BU', 1),
(3833, 239, 'Harare', 'HA', 1),
(3834, 239, 'Manicaland', 'ML', 1),
(3835, 239, 'Mashonaland Central', 'MC', 1),
(3836, 239, 'Mashonaland East', 'ME', 1),
(3837, 239, 'Mashonaland West', 'MW', 1),
(3838, 239, 'Masvingo', 'MV', 1),
(3839, 239, 'Matabeleland North', 'MN', 1),
(3840, 239, 'Matabeleland South', 'MS', 1),
(3841, 239, 'Midlands', 'MD', 1),
(3861, 105, 'Campobasso', 'CB', 1),
(3862, 105, 'Carbonia-Iglesias', 'CI', 1),
(3863, 105, 'Caserta', 'CE', 1),
(3864, 105, 'Catania', 'CT', 1),
(3865, 105, 'Catanzaro', 'CZ', 1),
(3866, 105, 'Chieti', 'CH', 1),
(3867, 105, 'Como', 'CO', 1),
(3868, 105, 'Cosenza', 'CS', 1),
(3869, 105, 'Cremona', 'CR', 1),
(3870, 105, 'Crotone', 'KR', 1),
(3871, 105, 'Cuneo', 'CN', 1),
(3872, 105, 'Enna', 'EN', 1),
(3873, 105, 'Ferrara', 'FE', 1),
(3874, 105, 'Firenze', 'FI', 1),
(3875, 105, 'Foggia', 'FG', 1),
(3876, 105, 'Forli-Cesena', 'FC', 1),
(3877, 105, 'Frosinone', 'FR', 1),
(3878, 105, 'Genova', 'GE', 1),
(3879, 105, 'Gorizia', 'GO', 1),
(3880, 105, 'Grosseto', 'GR', 1),
(3881, 105, 'Imperia', 'IM', 1),
(3882, 105, 'Isernia', 'IS', 1),
(3883, 105, 'L&#39;Aquila', 'AQ', 1),
(3884, 105, 'La Spezia', 'SP', 1),
(3885, 105, 'Latina', 'LT', 1),
(3886, 105, 'Lecce', 'LE', 1),
(3887, 105, 'Lecco', 'LC', 1),
(3888, 105, 'Livorno', 'LI', 1),
(3889, 105, 'Lodi', 'LO', 1),
(3890, 105, 'Lucca', 'LU', 1),
(3891, 105, 'Macerata', 'MC', 1),
(3892, 105, 'Mantova', 'MN', 1),
(3893, 105, 'Massa-Carrara', 'MS', 1),
(3894, 105, 'Matera', 'MT', 1),
(3895, 105, 'Medio Campidano', 'VS', 1),
(3896, 105, 'Messina', 'ME', 1),
(3897, 105, 'Milano', 'MI', 1),
(3898, 105, 'Modena', 'MO', 1),
(3899, 105, 'Napoli', 'NA', 1),
(3900, 105, 'Novara', 'NO', 1),
(3901, 105, 'Nuoro', 'NU', 1),
(3902, 105, 'Ogliastra', 'OG', 1),
(3903, 105, 'Olbia-Tempio', 'OT', 1),
(3904, 105, 'Oristano', 'OR', 1),
(3905, 105, 'Padova', 'PD', 1),
(3906, 105, 'Palermo', 'PA', 1),
(3907, 105, 'Parma', 'PR', 1),
(3908, 105, 'Pavia', 'PV', 1),
(3909, 105, 'Perugia', 'PG', 1),
(3910, 105, 'Pesaro e Urbino', 'PU', 1),
(3911, 105, 'Pescara', 'PE', 1),
(3912, 105, 'Piacenza', 'PC', 1),
(3913, 105, 'Pisa', 'PI', 1),
(3914, 105, 'Pistoia', 'PT', 1),
(3915, 105, 'Pordenone', 'PN', 1),
(3916, 105, 'Potenza', 'PZ', 1),
(3917, 105, 'Prato', 'PO', 1),
(3918, 105, 'Ragusa', 'RG', 1),
(3919, 105, 'Ravenna', 'RA', 1),
(3920, 105, 'Reggio Calabria', 'RC', 1),
(3921, 105, 'Reggio Emilia', 'RE', 1),
(3922, 105, 'Rieti', 'RI', 1),
(3923, 105, 'Rimini', 'RN', 1),
(3924, 105, 'Roma', 'RM', 1),
(3925, 105, 'Rovigo', 'RO', 1),
(3926, 105, 'Salerno', 'SA', 1),
(3927, 105, 'Sassari', 'SS', 1),
(3928, 105, 'Savona', 'SV', 1),
(3929, 105, 'Siena', 'SI', 1),
(3930, 105, 'Siracusa', 'SR', 1),
(3931, 105, 'Sondrio', 'SO', 1),
(3932, 105, 'Taranto', 'TA', 1),
(3933, 105, 'Teramo', 'TE', 1),
(3934, 105, 'Terni', 'TR', 1),
(3935, 105, 'Torino', 'TO', 1),
(3936, 105, 'Trapani', 'TP', 1),
(3937, 105, 'Trento', 'TN', 1),
(3938, 105, 'Treviso', 'TV', 1),
(3939, 105, 'Trieste', 'TS', 1),
(3940, 105, 'Udine', 'UD', 1),
(3941, 105, 'Varese', 'VA', 1),
(3942, 105, 'Venezia', 'VE', 1),
(3943, 105, 'Verbano-Cusio-Ossola', 'VB', 1),
(3944, 105, 'Vercelli', 'VC', 1),
(3945, 105, 'Verona', 'VR', 1),
(3946, 105, 'Vibo Valentia', 'VV', 1),
(3947, 105, 'Vicenza', 'VI', 1),
(3948, 105, 'Viterbo', 'VT', 1),
(3949, 222, 'County Antrim', 'ANT', 1),
(3950, 222, 'County Armagh', 'ARM', 1),
(3951, 222, 'County Down', 'DOW', 1),
(3952, 222, 'County Fermanagh', 'FER', 1),
(3953, 222, 'County Londonderry', 'LDY', 1),
(3954, 222, 'County Tyrone', 'TYR', 1),
(3955, 222, 'Cumbria', 'CMA', 1),
(3956, 190, 'Pomurska', '1', 1),
(3957, 190, 'Podravska', '2', 1),
(3958, 190, 'Koroška', '3', 1),
(3959, 190, 'Savinjska', '4', 1),
(3960, 190, 'Zasavska', '5', 1),
(3961, 190, 'Spodnjeposavska', '6', 1),
(3962, 190, 'Jugovzhodna Slovenija', '7', 1),
(3963, 190, 'Osrednjeslovenska', '8', 1),
(3964, 190, 'Gorenjska', '9', 1),
(3965, 190, 'Notranjsko-kraška', '10', 1),
(3966, 190, 'Goriška', '11', 1),
(3967, 190, 'Obalno-kraška', '12', 1),
(3968, 33, 'Ruse', '', 1),
(3969, 101, 'Alborz', 'ALB', 1),
(3970, 21, 'Brussels-Capital Region', 'BRU', 1),
(3971, 138, 'Aguascalientes', 'AG', 1),
(3973, 242, 'Andrijevica', '01', 1),
(3974, 242, 'Bar', '02', 1),
(3975, 242, 'Berane', '03', 1),
(3976, 242, 'Bijelo Polje', '04', 1),
(3977, 242, 'Budva', '05', 1),
(3978, 242, 'Cetinje', '06', 1),
(3979, 242, 'Danilovgrad', '07', 1),
(3980, 242, 'Herceg-Novi', '08', 1),
(3981, 242, 'Kolašin', '09', 1),
(3982, 242, 'Kotor', '10', 1),
(3983, 242, 'Mojkovac', '11', 1),
(3984, 242, 'Nikšić', '12', 1),
(3985, 242, 'Plav', '13', 1),
(3986, 242, 'Pljevlja', '14', 1),
(3987, 242, 'Plužine', '15', 1),
(3988, 242, 'Podgorica', '16', 1),
(3989, 242, 'Rožaje', '17', 1),
(3990, 242, 'Šavnik', '18', 1),
(3991, 242, 'Tivat', '19', 1),
(3992, 242, 'Ulcinj', '20', 1),
(3993, 242, 'Žabljak', '21', 1),
(3994, 243, 'Belgrade', '00', 1),
(3995, 243, 'North Bačka', '01', 1),
(3996, 243, 'Central Banat', '02', 1),
(3997, 243, 'North Banat', '03', 1),
(3998, 243, 'South Banat', '04', 1),
(3999, 243, 'West Bačka', '05', 1),
(4000, 243, 'South Bačka', '06', 1),
(4001, 243, 'Srem', '07', 1),
(4002, 243, 'Mačva', '08', 1),
(4003, 243, 'Kolubara', '09', 1),
(4004, 243, 'Podunavlje', '10', 1),
(4005, 243, 'Braničevo', '11', 1),
(4006, 243, 'Šumadija', '12', 1),
(4007, 243, 'Pomoravlje', '13', 1),
(4008, 243, 'Bor', '14', 1),
(4009, 243, 'Zaječar', '15', 1),
(4010, 243, 'Zlatibor', '16', 1),
(4011, 243, 'Moravica', '17', 1),
(4012, 243, 'Raška', '18', 1),
(4013, 243, 'Rasina', '19', 1),
(4014, 243, 'Nišava', '20', 1),
(4015, 243, 'Toplica', '21', 1),
(4016, 243, 'Pirot', '22', 1),
(4017, 243, 'Jablanica', '23', 1),
(4018, 243, 'Pčinja', '24', 1),
(4020, 245, 'Bonaire', 'BO', 1),
(4021, 245, 'Saba', 'SA', 1),
(4022, 245, 'Sint Eustatius', 'SE', 1),
(4023, 248, 'Central Equatoria', 'EC', 1),
(4024, 248, 'Eastern Equatoria', 'EE', 1),
(4025, 248, 'Jonglei', 'JG', 1),
(4026, 248, 'Lakes', 'LK', 1),
(4027, 248, 'Northern Bahr el-Ghazal', 'BN', 1),
(4028, 248, 'Unity', 'UY', 1),
(4029, 248, 'Upper Nile', 'NU', 1),
(4030, 248, 'Warrap', 'WR', 1),
(4031, 248, 'Western Bahr el-Ghazal', 'BW', 1),
(4032, 248, 'Western Equatoria', 'EW', 1),
(4036, 117, 'Ainaži, Salacgrīvas novads', '0661405', 1),
(4037, 117, 'Aizkraukle, Aizkraukles novads', '0320201', 1),
(4038, 117, 'Aizkraukles novads', '0320200', 1),
(4039, 117, 'Aizpute, Aizputes novads', '0640605', 1),
(4040, 117, 'Aizputes novads', '0640600', 1),
(4041, 117, 'Aknīste, Aknīstes novads', '0560805', 1),
(4042, 117, 'Aknīstes novads', '0560800', 1),
(4043, 117, 'Aloja, Alojas novads', '0661007', 1),
(4044, 117, 'Alojas novads', '0661000', 1),
(4045, 117, 'Alsungas novads', '0624200', 1),
(4046, 117, 'Alūksne, Alūksnes novads', '0360201', 1),
(4047, 117, 'Alūksnes novads', '0360200', 1),
(4048, 117, 'Amatas novads', '0424701', 1),
(4049, 117, 'Ape, Apes novads', '0360805', 1),
(4050, 117, 'Apes novads', '0360800', 1),
(4051, 117, 'Auce, Auces novads', '0460805', 1),
(4052, 117, 'Auces novads', '0460800', 1),
(4053, 117, 'Ādažu novads', '0804400', 1),
(4054, 117, 'Babītes novads', '0804900', 1),
(4055, 117, 'Baldone, Baldones novads', '0800605', 1),
(4056, 117, 'Baldones novads', '0800600', 1),
(4057, 117, 'Baloži, Ķekavas novads', '0800807', 1),
(4058, 117, 'Baltinavas novads', '0384400', 1),
(4059, 117, 'Balvi, Balvu novads', '0380201', 1),
(4060, 117, 'Balvu novads', '0380200', 1),
(4061, 117, 'Bauska, Bauskas novads', '0400201', 1),
(4062, 117, 'Bauskas novads', '0400200', 1),
(4063, 117, 'Beverīnas novads', '0964700', 1),
(4064, 117, 'Brocēni, Brocēnu novads', '0840605', 1),
(4065, 117, 'Brocēnu novads', '0840601', 1),
(4066, 117, 'Burtnieku novads', '0967101', 1),
(4067, 117, 'Carnikavas novads', '0805200', 1),
(4068, 117, 'Cesvaine, Cesvaines novads', '0700807', 1),
(4069, 117, 'Cesvaines novads', '0700800', 1),
(4070, 117, 'Cēsis, Cēsu novads', '0420201', 1),
(4071, 117, 'Cēsu novads', '0420200', 1),
(4072, 117, 'Ciblas novads', '0684901', 1),
(4073, 117, 'Dagda, Dagdas novads', '0601009', 1),
(4074, 117, 'Dagdas novads', '0601000', 1),
(4075, 117, 'Daugavpils', '0050000', 1),
(4076, 117, 'Daugavpils novads', '0440200', 1),
(4077, 117, 'Dobele, Dobeles novads', '0460201', 1),
(4078, 117, 'Dobeles novads', '0460200', 1),
(4079, 117, 'Dundagas novads', '0885100', 1),
(4080, 117, 'Durbe, Durbes novads', '0640807', 1),
(4081, 117, 'Durbes novads', '0640801', 1),
(4082, 117, 'Engures novads', '0905100', 1),
(4083, 117, 'Ērgļu novads', '0705500', 1),
(4084, 117, 'Garkalnes novads', '0806000', 1),
(4085, 117, 'Grobiņa, Grobiņas novads', '0641009', 1),
(4086, 117, 'Grobiņas novads', '0641000', 1),
(4087, 117, 'Gulbene, Gulbenes novads', '0500201', 1),
(4088, 117, 'Gulbenes novads', '0500200', 1),
(4089, 117, 'Iecavas novads', '0406400', 1),
(4090, 117, 'Ikšķile, Ikšķiles novads', '0740605', 1),
(4091, 117, 'Ikšķiles novads', '0740600', 1),
(4092, 117, 'Ilūkste, Ilūkstes novads', '0440807', 1),
(4093, 117, 'Ilūkstes novads', '0440801', 1),
(4094, 117, 'Inčukalna novads', '0801800', 1),
(4095, 117, 'Jaunjelgava, Jaunjelgavas novads', '0321007', 1),
(4096, 117, 'Jaunjelgavas novads', '0321000', 1),
(4097, 117, 'Jaunpiebalgas novads', '0425700', 1),
(4098, 117, 'Jaunpils novads', '0905700', 1),
(4099, 117, 'Jelgava', '0090000', 1),
(4100, 117, 'Jelgavas novads', '0540200', 1),
(4101, 117, 'Jēkabpils', '0110000', 1),
(4102, 117, 'Jēkabpils novads', '0560200', 1),
(4103, 117, 'Jūrmala', '0130000', 1),
(4104, 117, 'Kalnciems, Jelgavas novads', '0540211', 1),
(4105, 117, 'Kandava, Kandavas novads', '0901211', 1),
(4106, 117, 'Kandavas novads', '0901201', 1),
(4107, 117, 'Kārsava, Kārsavas novads', '0681009', 1),
(4108, 117, 'Kārsavas novads', '0681000', 1),
(4109, 117, 'Kocēnu novads ,bij. Valmieras)', '0960200', 1),
(4110, 117, 'Kokneses novads', '0326100', 1),
(4111, 117, 'Krāslava, Krāslavas novads', '0600201', 1),
(4112, 117, 'Krāslavas novads', '0600202', 1),
(4113, 117, 'Krimuldas novads', '0806900', 1),
(4114, 117, 'Krustpils novads', '0566900', 1),
(4115, 117, 'Kuldīga, Kuldīgas novads', '0620201', 1),
(4116, 117, 'Kuldīgas novads', '0620200', 1),
(4117, 117, 'Ķeguma novads', '0741001', 1),
(4118, 117, 'Ķegums, Ķeguma novads', '0741009', 1),
(4119, 117, 'Ķekavas novads', '0800800', 1),
(4120, 117, 'Lielvārde, Lielvārdes novads', '0741413', 1),
(4121, 117, 'Lielvārdes novads', '0741401', 1),
(4122, 117, 'Liepāja', '0170000', 1),
(4123, 117, 'Limbaži, Limbažu novads', '0660201', 1),
(4124, 117, 'Limbažu novads', '0660200', 1),
(4125, 117, 'Līgatne, Līgatnes novads', '0421211', 1),
(4126, 117, 'Līgatnes novads', '0421200', 1),
(4127, 117, 'Līvāni, Līvānu novads', '0761211', 1),
(4128, 117, 'Līvānu novads', '0761201', 1),
(4129, 117, 'Lubāna, Lubānas novads', '0701413', 1),
(4130, 117, 'Lubānas novads', '0701400', 1),
(4131, 117, 'Ludza, Ludzas novads', '0680201', 1),
(4132, 117, 'Ludzas novads', '0680200', 1),
(4133, 117, 'Madona, Madonas novads', '0700201', 1),
(4134, 117, 'Madonas novads', '0700200', 1),
(4135, 117, 'Mazsalaca, Mazsalacas novads', '0961011', 1),
(4136, 117, 'Mazsalacas novads', '0961000', 1),
(4137, 117, 'Mālpils novads', '0807400', 1),
(4138, 117, 'Mārupes novads', '0807600', 1),
(4139, 117, 'Mērsraga novads', '0887600', 1),
(4140, 117, 'Naukšēnu novads', '0967300', 1),
(4141, 117, 'Neretas novads', '0327100', 1),
(4142, 117, 'Nīcas novads', '0647900', 1),
(4143, 117, 'Ogre, Ogres novads', '0740201', 1),
(4144, 117, 'Ogres novads', '0740202', 1),
(4145, 117, 'Olaine, Olaines novads', '0801009', 1),
(4146, 117, 'Olaines novads', '0801000', 1),
(4147, 117, 'Ozolnieku novads', '0546701', 1),
(4148, 117, 'Pārgaujas novads', '0427500', 1),
(4149, 117, 'Pāvilosta, Pāvilostas novads', '0641413', 1),
(4150, 117, 'Pāvilostas novads', '0641401', 1),
(4151, 117, 'Piltene, Ventspils novads', '0980213', 1),
(4152, 117, 'Pļaviņas, Pļaviņu novads', '0321413', 1),
(4153, 117, 'Pļaviņu novads', '0321400', 1),
(4154, 117, 'Preiļi, Preiļu novads', '0760201', 1),
(4155, 117, 'Preiļu novads', '0760202', 1),
(4156, 117, 'Priekule, Priekules novads', '0641615', 1),
(4157, 117, 'Priekules novads', '0641600', 1),
(4158, 117, 'Priekuļu novads', '0427300', 1),
(4159, 117, 'Raunas novads', '0427700', 1),
(4160, 117, 'Rēzekne', '0210000', 1),
(4161, 117, 'Rēzeknes novads', '0780200', 1),
(4162, 117, 'Riebiņu novads', '0766300', 1),
(4163, 117, 'Rīga', '0010000', 1),
(4164, 117, 'Rojas novads', '0888300', 1),
(4165, 117, 'Ropažu novads', '0808400', 1),
(4166, 117, 'Rucavas novads', '0648500', 1),
(4167, 117, 'Rugāju novads', '0387500', 1),
(4168, 117, 'Rundāles novads', '0407700', 1),
(4169, 117, 'Rūjiena, Rūjienas novads', '0961615', 1),
(4170, 117, 'Rūjienas novads', '0961600', 1),
(4171, 117, 'Sabile, Talsu novads', '0880213', 1),
(4172, 117, 'Salacgrīva, Salacgrīvas novads', '0661415', 1),
(4173, 117, 'Salacgrīvas novads', '0661400', 1),
(4174, 117, 'Salas novads', '0568700', 1),
(4175, 117, 'Salaspils novads', '0801200', 1),
(4176, 117, 'Salaspils, Salaspils novads', '0801211', 1),
(4177, 117, 'Saldus novads', '0840200', 1),
(4178, 117, 'Saldus, Saldus novads', '0840201', 1),
(4179, 117, 'Saulkrasti, Saulkrastu novads', '0801413', 1),
(4180, 117, 'Saulkrastu novads', '0801400', 1),
(4181, 117, 'Seda, Strenču novads', '0941813', 1),
(4182, 117, 'Sējas novads', '0809200', 1),
(4183, 117, 'Sigulda, Siguldas novads', '0801615', 1),
(4184, 117, 'Siguldas novads', '0801601', 1),
(4185, 117, 'Skrīveru novads', '0328200', 1),
(4186, 117, 'Skrunda, Skrundas novads', '0621209', 1),
(4187, 117, 'Skrundas novads', '0621200', 1),
(4188, 117, 'Smiltene, Smiltenes novads', '0941615', 1),
(4189, 117, 'Smiltenes novads', '0941600', 1),
(4190, 117, 'Staicele, Alojas novads', '0661017', 1),
(4191, 117, 'Stende, Talsu novads', '0880215', 1),
(4192, 117, 'Stopiņu novads', '0809600', 1),
(4193, 117, 'Strenči, Strenču novads', '0941817', 1),
(4194, 117, 'Strenču novads', '0941800', 1),
(4195, 117, 'Subate, Ilūkstes novads', '0440815', 1),
(4196, 117, 'Talsi, Talsu novads', '0880201', 1),
(4197, 117, 'Talsu novads', '0880200', 1),
(4198, 117, 'Tērvetes novads', '0468900', 1),
(4199, 117, 'Tukuma novads', '0900200', 1),
(4200, 117, 'Tukums, Tukuma novads', '0900201', 1),
(4201, 117, 'Vaiņodes novads', '0649300', 1),
(4202, 117, 'Valdemārpils, Talsu novads', '0880217', 1),
(4203, 117, 'Valka, Valkas novads', '0940201', 1),
(4204, 117, 'Valkas novads', '0940200', 1),
(4205, 117, 'Valmiera', '0250000', 1),
(4206, 117, 'Vangaži, Inčukalna novads', '0801817', 1),
(4207, 117, 'Varakļāni, Varakļānu novads', '0701817', 1),
(4208, 117, 'Varakļānu novads', '0701800', 1),
(4209, 117, 'Vārkavas novads', '0769101', 1),
(4210, 117, 'Vecpiebalgas novads', '0429300', 1),
(4211, 117, 'Vecumnieku novads', '0409500', 1),
(4212, 117, 'Ventspils', '0270000', 1),
(4213, 117, 'Ventspils novads', '0980200', 1),
(4214, 117, 'Viesīte, Viesītes novads', '0561815', 1),
(4215, 117, 'Viesītes novads', '0561800', 1),
(4216, 117, 'Viļaka, Viļakas novads', '0381615', 1),
(4217, 117, 'Viļakas novads', '0381600', 1),
(4218, 117, 'Viļāni, Viļānu novads', '0781817', 1),
(4219, 117, 'Viļānu novads', '0781800', 1),
(4220, 117, 'Zilupe, Zilupes novads', '0681817', 1),
(4221, 117, 'Zilupes novads', '0681801', 1),
(4222, 43, 'Arica y Parinacota', 'AP', 1),
(4223, 43, 'Los Rios', 'LR', 1),
(4224, 220, 'Kharkivs''ka Oblast''', '63', 1),
(4225, 118, 'Beirut', 'LB-BR', 1),
(4226, 118, 'Bekaa', 'LB-BE', 1),
(4227, 118, 'Mount Lebanon', 'LB-ML', 1),
(4228, 118, 'Nabatieh', 'LB-NB', 1),
(4229, 118, 'North', 'LB-NR', 1),
(4230, 118, 'South', 'LB-ST', 1),
(4231, 99, 'Telangana', 'TS', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone_to_geo_zone`
--

CREATE TABLE IF NOT EXISTS `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_zone_to_geo_zone`
--

INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(1, 222, 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 222, 3513, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 222, 3514, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 222, 3515, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 222, 3516, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 222, 3517, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 222, 3518, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 222, 3519, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 222, 3520, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 222, 3521, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 222, 3522, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 222, 3523, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 222, 3524, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 222, 3525, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 222, 3526, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 222, 3527, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 222, 3528, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 222, 3529, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 222, 3530, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 222, 3531, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 222, 3532, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 222, 3533, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 222, 3534, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 222, 3535, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 222, 3536, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 222, 3537, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 222, 3538, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 222, 3539, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 222, 3540, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 222, 3541, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 222, 3542, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 222, 3543, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 222, 3544, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 222, 3545, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 222, 3546, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 222, 3547, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 222, 3548, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 222, 3549, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 222, 3550, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 222, 3551, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 222, 3552, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 222, 3553, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 222, 3554, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 222, 3555, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 222, 3556, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 222, 3557, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 222, 3558, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 222, 3559, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 222, 3560, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 222, 3561, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 222, 3562, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 222, 3563, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 222, 3564, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 222, 3565, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 222, 3566, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 222, 3567, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 222, 3568, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 222, 3569, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 222, 3570, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 222, 3571, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 222, 3572, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 222, 3573, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 222, 3574, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 222, 3575, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 222, 3576, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 222, 3577, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 222, 3578, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 222, 3579, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 222, 3580, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 222, 3581, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 222, 3582, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 222, 3583, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 222, 3584, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 222, 3585, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 222, 3586, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 222, 3587, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 222, 3588, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 222, 3589, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 222, 3590, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 222, 3591, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 222, 3592, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 222, 3593, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 222, 3594, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 222, 3595, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 222, 3596, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 222, 3597, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 222, 3598, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 222, 3599, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 222, 3600, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 222, 3601, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 222, 3602, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 222, 3603, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 222, 3604, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 222, 3605, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 222, 3606, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 222, 3607, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 222, 3608, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 222, 3609, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 222, 3610, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 222, 3611, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 222, 3612, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 222, 3949, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 222, 3950, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 222, 3951, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 222, 3952, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 222, 3953, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 222, 3954, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 222, 3955, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 222, 3972, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oc_address`
--
ALTER TABLE `oc_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `oc_affiliate`
--
ALTER TABLE `oc_affiliate`
  ADD PRIMARY KEY (`affiliate_id`);

--
-- Indexes for table `oc_affiliate_activity`
--
ALTER TABLE `oc_affiliate_activity`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `oc_affiliate_login`
--
ALTER TABLE `oc_affiliate_login`
  ADD PRIMARY KEY (`affiliate_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `oc_affiliate_transaction`
--
ALTER TABLE `oc_affiliate_transaction`
  ADD PRIMARY KEY (`affiliate_transaction_id`);

--
-- Indexes for table `oc_api`
--
ALTER TABLE `oc_api`
  ADD PRIMARY KEY (`api_id`);

--
-- Indexes for table `oc_api_ip`
--
ALTER TABLE `oc_api_ip`
  ADD PRIMARY KEY (`api_ip_id`);

--
-- Indexes for table `oc_api_session`
--
ALTER TABLE `oc_api_session`
  ADD PRIMARY KEY (`api_session_id`);

--
-- Indexes for table `oc_attribute`
--
ALTER TABLE `oc_attribute`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Indexes for table `oc_attribute_description`
--
ALTER TABLE `oc_attribute_description`
  ADD PRIMARY KEY (`attribute_id`,`language_id`);

--
-- Indexes for table `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  ADD PRIMARY KEY (`attribute_group_id`);

--
-- Indexes for table `oc_attribute_group_description`
--
ALTER TABLE `oc_attribute_group_description`
  ADD PRIMARY KEY (`attribute_group_id`,`language_id`);

--
-- Indexes for table `oc_banner`
--
ALTER TABLE `oc_banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  ADD PRIMARY KEY (`banner_image_id`);

--
-- Indexes for table `oc_banner_image_description`
--
ALTER TABLE `oc_banner_image_description`
  ADD PRIMARY KEY (`banner_image_id`,`language_id`);

--
-- Indexes for table `oc_cart`
--
ALTER TABLE `oc_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_id` (`customer_id`,`session_id`,`product_id`,`recurring_id`);

--
-- Indexes for table `oc_category`
--
ALTER TABLE `oc_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `oc_category_description`
--
ALTER TABLE `oc_category_description`
  ADD PRIMARY KEY (`category_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `oc_category_filter`
--
ALTER TABLE `oc_category_filter`
  ADD PRIMARY KEY (`category_id`,`filter_id`);

--
-- Indexes for table `oc_category_path`
--
ALTER TABLE `oc_category_path`
  ADD PRIMARY KEY (`category_id`,`path_id`);

--
-- Indexes for table `oc_category_to_layout`
--
ALTER TABLE `oc_category_to_layout`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Indexes for table `oc_category_to_store`
--
ALTER TABLE `oc_category_to_store`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Indexes for table `oc_country`
--
ALTER TABLE `oc_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `oc_coupon`
--
ALTER TABLE `oc_coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `oc_coupon_category`
--
ALTER TABLE `oc_coupon_category`
  ADD PRIMARY KEY (`coupon_id`,`category_id`);

--
-- Indexes for table `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  ADD PRIMARY KEY (`coupon_history_id`);

--
-- Indexes for table `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  ADD PRIMARY KEY (`coupon_product_id`);

--
-- Indexes for table `oc_currency`
--
ALTER TABLE `oc_currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `oc_customer`
--
ALTER TABLE `oc_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  ADD PRIMARY KEY (`customer_group_id`);

--
-- Indexes for table `oc_customer_group_description`
--
ALTER TABLE `oc_customer_group_description`
  ADD PRIMARY KEY (`customer_group_id`,`language_id`);

--
-- Indexes for table `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  ADD PRIMARY KEY (`customer_history_id`);

--
-- Indexes for table `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  ADD PRIMARY KEY (`customer_ip_id`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  ADD PRIMARY KEY (`customer_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `oc_customer_online`
--
ALTER TABLE `oc_customer_online`
  ADD PRIMARY KEY (`ip`);

--
-- Indexes for table `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  ADD PRIMARY KEY (`customer_reward_id`);

--
-- Indexes for table `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  ADD PRIMARY KEY (`customer_transaction_id`);

--
-- Indexes for table `oc_customer_wishlist`
--
ALTER TABLE `oc_customer_wishlist`
  ADD PRIMARY KEY (`customer_id`,`product_id`);

--
-- Indexes for table `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  ADD PRIMARY KEY (`custom_field_id`);

--
-- Indexes for table `oc_custom_field_customer_group`
--
ALTER TABLE `oc_custom_field_customer_group`
  ADD PRIMARY KEY (`custom_field_id`,`customer_group_id`);

--
-- Indexes for table `oc_custom_field_description`
--
ALTER TABLE `oc_custom_field_description`
  ADD PRIMARY KEY (`custom_field_id`,`language_id`);

--
-- Indexes for table `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  ADD PRIMARY KEY (`custom_field_value_id`);

--
-- Indexes for table `oc_custom_field_value_description`
--
ALTER TABLE `oc_custom_field_value_description`
  ADD PRIMARY KEY (`custom_field_value_id`,`language_id`);

--
-- Indexes for table `oc_download`
--
ALTER TABLE `oc_download`
  ADD PRIMARY KEY (`download_id`);

--
-- Indexes for table `oc_download_description`
--
ALTER TABLE `oc_download_description`
  ADD PRIMARY KEY (`download_id`,`language_id`);

--
-- Indexes for table `oc_event`
--
ALTER TABLE `oc_event`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `oc_extension`
--
ALTER TABLE `oc_extension`
  ADD PRIMARY KEY (`extension_id`);

--
-- Indexes for table `oc_filter`
--
ALTER TABLE `oc_filter`
  ADD PRIMARY KEY (`filter_id`);

--
-- Indexes for table `oc_filter_description`
--
ALTER TABLE `oc_filter_description`
  ADD PRIMARY KEY (`filter_id`,`language_id`);

--
-- Indexes for table `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  ADD PRIMARY KEY (`filter_group_id`);

--
-- Indexes for table `oc_filter_group_description`
--
ALTER TABLE `oc_filter_group_description`
  ADD PRIMARY KEY (`filter_group_id`,`language_id`);

--
-- Indexes for table `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  ADD PRIMARY KEY (`geo_zone_id`);

--
-- Indexes for table `oc_information`
--
ALTER TABLE `oc_information`
  ADD PRIMARY KEY (`information_id`);

--
-- Indexes for table `oc_information_description`
--
ALTER TABLE `oc_information_description`
  ADD PRIMARY KEY (`information_id`,`language_id`);

--
-- Indexes for table `oc_information_to_layout`
--
ALTER TABLE `oc_information_to_layout`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Indexes for table `oc_information_to_store`
--
ALTER TABLE `oc_information_to_store`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Indexes for table `oc_language`
--
ALTER TABLE `oc_language`
  ADD PRIMARY KEY (`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `oc_layout`
--
ALTER TABLE `oc_layout`
  ADD PRIMARY KEY (`layout_id`);

--
-- Indexes for table `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  ADD PRIMARY KEY (`layout_module_id`);

--
-- Indexes for table `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  ADD PRIMARY KEY (`layout_route_id`);

--
-- Indexes for table `oc_length_class`
--
ALTER TABLE `oc_length_class`
  ADD PRIMARY KEY (`length_class_id`);

--
-- Indexes for table `oc_length_class_description`
--
ALTER TABLE `oc_length_class_description`
  ADD PRIMARY KEY (`length_class_id`,`language_id`);

--
-- Indexes for table `oc_location`
--
ALTER TABLE `oc_location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Indexes for table `oc_manufacturer_to_store`
--
ALTER TABLE `oc_manufacturer_to_store`
  ADD PRIMARY KEY (`manufacturer_id`,`store_id`);

--
-- Indexes for table `oc_marketing`
--
ALTER TABLE `oc_marketing`
  ADD PRIMARY KEY (`marketing_id`);

--
-- Indexes for table `oc_modification`
--
ALTER TABLE `oc_modification`
  ADD PRIMARY KEY (`modification_id`);

--
-- Indexes for table `oc_module`
--
ALTER TABLE `oc_module`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexes for table `oc_option`
--
ALTER TABLE `oc_option`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `oc_option_description`
--
ALTER TABLE `oc_option_description`
  ADD PRIMARY KEY (`option_id`,`language_id`);

--
-- Indexes for table `oc_option_value`
--
ALTER TABLE `oc_option_value`
  ADD PRIMARY KEY (`option_value_id`);

--
-- Indexes for table `oc_option_value_description`
--
ALTER TABLE `oc_option_value_description`
  ADD PRIMARY KEY (`option_value_id`,`language_id`);

--
-- Indexes for table `oc_order`
--
ALTER TABLE `oc_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `oc_order_custom_field`
--
ALTER TABLE `oc_order_custom_field`
  ADD PRIMARY KEY (`order_custom_field_id`);

--
-- Indexes for table `oc_order_history`
--
ALTER TABLE `oc_order_history`
  ADD PRIMARY KEY (`order_history_id`);

--
-- Indexes for table `oc_order_option`
--
ALTER TABLE `oc_order_option`
  ADD PRIMARY KEY (`order_option_id`);

--
-- Indexes for table `oc_order_product`
--
ALTER TABLE `oc_order_product`
  ADD PRIMARY KEY (`order_product_id`);

--
-- Indexes for table `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  ADD PRIMARY KEY (`order_recurring_id`);

--
-- Indexes for table `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  ADD PRIMARY KEY (`order_recurring_transaction_id`);

--
-- Indexes for table `oc_order_status`
--
ALTER TABLE `oc_order_status`
  ADD PRIMARY KEY (`order_status_id`,`language_id`);

--
-- Indexes for table `oc_order_total`
--
ALTER TABLE `oc_order_total`
  ADD PRIMARY KEY (`order_total_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  ADD PRIMARY KEY (`order_voucher_id`);

--
-- Indexes for table `oc_paypal_order`
--
ALTER TABLE `oc_paypal_order`
  ADD PRIMARY KEY (`paypal_order_id`);

--
-- Indexes for table `oc_paypal_order_transaction`
--
ALTER TABLE `oc_paypal_order_transaction`
  ADD PRIMARY KEY (`paypal_order_transaction_id`);

--
-- Indexes for table `oc_product`
--
ALTER TABLE `oc_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `oc_product_attribute`
--
ALTER TABLE `oc_product_attribute`
  ADD PRIMARY KEY (`product_id`,`attribute_id`,`language_id`);

--
-- Indexes for table `oc_product_description`
--
ALTER TABLE `oc_product_description`
  ADD PRIMARY KEY (`product_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  ADD PRIMARY KEY (`product_discount_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `oc_product_filter`
--
ALTER TABLE `oc_product_filter`
  ADD PRIMARY KEY (`product_id`,`filter_id`);

--
-- Indexes for table `oc_product_image`
--
ALTER TABLE `oc_product_image`
  ADD PRIMARY KEY (`product_image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `oc_product_option`
--
ALTER TABLE `oc_product_option`
  ADD PRIMARY KEY (`product_option_id`);

--
-- Indexes for table `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  ADD PRIMARY KEY (`product_option_value_id`);

--
-- Indexes for table `oc_product_recurring`
--
ALTER TABLE `oc_product_recurring`
  ADD PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`);

--
-- Indexes for table `oc_product_related`
--
ALTER TABLE `oc_product_related`
  ADD PRIMARY KEY (`product_id`,`related_id`);

--
-- Indexes for table `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  ADD PRIMARY KEY (`product_reward_id`);

--
-- Indexes for table `oc_product_special`
--
ALTER TABLE `oc_product_special`
  ADD PRIMARY KEY (`product_special_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `oc_product_to_category`
--
ALTER TABLE `oc_product_to_category`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `oc_product_to_download`
--
ALTER TABLE `oc_product_to_download`
  ADD PRIMARY KEY (`product_id`,`download_id`);

--
-- Indexes for table `oc_product_to_layout`
--
ALTER TABLE `oc_product_to_layout`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Indexes for table `oc_product_to_store`
--
ALTER TABLE `oc_product_to_store`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Indexes for table `oc_recurring`
--
ALTER TABLE `oc_recurring`
  ADD PRIMARY KEY (`recurring_id`);

--
-- Indexes for table `oc_recurring_description`
--
ALTER TABLE `oc_recurring_description`
  ADD PRIMARY KEY (`recurring_id`,`language_id`);

--
-- Indexes for table `oc_return`
--
ALTER TABLE `oc_return`
  ADD PRIMARY KEY (`return_id`);

--
-- Indexes for table `oc_return_action`
--
ALTER TABLE `oc_return_action`
  ADD PRIMARY KEY (`return_action_id`,`language_id`);

--
-- Indexes for table `oc_return_history`
--
ALTER TABLE `oc_return_history`
  ADD PRIMARY KEY (`return_history_id`);

--
-- Indexes for table `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  ADD PRIMARY KEY (`return_reason_id`,`language_id`);

--
-- Indexes for table `oc_return_status`
--
ALTER TABLE `oc_return_status`
  ADD PRIMARY KEY (`return_status_id`,`language_id`);

--
-- Indexes for table `oc_review`
--
ALTER TABLE `oc_review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `oc_setting`
--
ALTER TABLE `oc_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  ADD PRIMARY KEY (`stock_status_id`,`language_id`);

--
-- Indexes for table `oc_store`
--
ALTER TABLE `oc_store`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  ADD PRIMARY KEY (`tax_class_id`);

--
-- Indexes for table `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  ADD PRIMARY KEY (`tax_rate_id`);

--
-- Indexes for table `oc_tax_rate_to_customer_group`
--
ALTER TABLE `oc_tax_rate_to_customer_group`
  ADD PRIMARY KEY (`tax_rate_id`,`customer_group_id`);

--
-- Indexes for table `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  ADD PRIMARY KEY (`tax_rule_id`);

--
-- Indexes for table `oc_upload`
--
ALTER TABLE `oc_upload`
  ADD PRIMARY KEY (`upload_id`);

--
-- Indexes for table `oc_url_alias`
--
ALTER TABLE `oc_url_alias`
  ADD PRIMARY KEY (`url_alias_id`),
  ADD KEY `query` (`query`),
  ADD KEY `keyword` (`keyword`);

--
-- Indexes for table `oc_user`
--
ALTER TABLE `oc_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `oc_user_group`
--
ALTER TABLE `oc_user_group`
  ADD PRIMARY KEY (`user_group_id`);

--
-- Indexes for table `oc_voucher`
--
ALTER TABLE `oc_voucher`
  ADD PRIMARY KEY (`voucher_id`);

--
-- Indexes for table `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  ADD PRIMARY KEY (`voucher_history_id`);

--
-- Indexes for table `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  ADD PRIMARY KEY (`voucher_theme_id`);

--
-- Indexes for table `oc_voucher_theme_description`
--
ALTER TABLE `oc_voucher_theme_description`
  ADD PRIMARY KEY (`voucher_theme_id`,`language_id`);

--
-- Indexes for table `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  ADD PRIMARY KEY (`weight_class_id`);

--
-- Indexes for table `oc_weight_class_description`
--
ALTER TABLE `oc_weight_class_description`
  ADD PRIMARY KEY (`weight_class_id`,`language_id`);

--
-- Indexes for table `oc_zone`
--
ALTER TABLE `oc_zone`
  ADD PRIMARY KEY (`zone_id`);

--
-- Indexes for table `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  ADD PRIMARY KEY (`zone_to_geo_zone_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oc_address`
--
ALTER TABLE `oc_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oc_affiliate`
--
ALTER TABLE `oc_affiliate`
  MODIFY `affiliate_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_affiliate_activity`
--
ALTER TABLE `oc_affiliate_activity`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_affiliate_login`
--
ALTER TABLE `oc_affiliate_login`
  MODIFY `affiliate_login_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_affiliate_transaction`
--
ALTER TABLE `oc_affiliate_transaction`
  MODIFY `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_api`
--
ALTER TABLE `oc_api`
  MODIFY `api_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oc_api_ip`
--
ALTER TABLE `oc_api_ip`
  MODIFY `api_ip_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_api_session`
--
ALTER TABLE `oc_api_session`
  MODIFY `api_session_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_attribute`
--
ALTER TABLE `oc_attribute`
  MODIFY `attribute_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  MODIFY `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `oc_banner`
--
ALTER TABLE `oc_banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  MODIFY `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=165;
--
-- AUTO_INCREMENT for table `oc_cart`
--
ALTER TABLE `oc_cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `oc_category`
--
ALTER TABLE `oc_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT for table `oc_country`
--
ALTER TABLE `oc_country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=258;
--
-- AUTO_INCREMENT for table `oc_coupon`
--
ALTER TABLE `oc_coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  MODIFY `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  MODIFY `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_currency`
--
ALTER TABLE `oc_currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oc_customer`
--
ALTER TABLE `oc_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  MODIFY `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  MODIFY `customer_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  MODIFY `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  MODIFY `customer_login_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  MODIFY `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  MODIFY `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  MODIFY `custom_field_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  MODIFY `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_download`
--
ALTER TABLE `oc_download`
  MODIFY `download_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_event`
--
ALTER TABLE `oc_event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oc_extension`
--
ALTER TABLE `oc_extension`
  MODIFY `extension_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `oc_filter`
--
ALTER TABLE `oc_filter`
  MODIFY `filter_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  MODIFY `filter_group_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  MODIFY `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `oc_information`
--
ALTER TABLE `oc_information`
  MODIFY `information_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `oc_language`
--
ALTER TABLE `oc_language`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oc_layout`
--
ALTER TABLE `oc_layout`
  MODIFY `layout_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  MODIFY `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=263;
--
-- AUTO_INCREMENT for table `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  MODIFY `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=86;
--
-- AUTO_INCREMENT for table `oc_length_class`
--
ALTER TABLE `oc_length_class`
  MODIFY `length_class_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oc_length_class_description`
--
ALTER TABLE `oc_length_class_description`
  MODIFY `length_class_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oc_location`
--
ALTER TABLE `oc_location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  MODIFY `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `oc_marketing`
--
ALTER TABLE `oc_marketing`
  MODIFY `marketing_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_modification`
--
ALTER TABLE `oc_modification`
  MODIFY `modification_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_module`
--
ALTER TABLE `oc_module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `oc_option`
--
ALTER TABLE `oc_option`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `oc_option_value`
--
ALTER TABLE `oc_option_value`
  MODIFY `option_value_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT for table `oc_order`
--
ALTER TABLE `oc_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT for table `oc_order_custom_field`
--
ALTER TABLE `oc_order_custom_field`
  MODIFY `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_order_history`
--
ALTER TABLE `oc_order_history`
  MODIFY `order_history_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `oc_order_option`
--
ALTER TABLE `oc_order_option`
  MODIFY `order_option_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=124;
--
-- AUTO_INCREMENT for table `oc_order_product`
--
ALTER TABLE `oc_order_product`
  MODIFY `order_product_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=102;
--
-- AUTO_INCREMENT for table `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  MODIFY `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  MODIFY `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_order_status`
--
ALTER TABLE `oc_order_status`
  MODIFY `order_status_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `oc_order_total`
--
ALTER TABLE `oc_order_total`
  MODIFY `order_total_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=235;
--
-- AUTO_INCREMENT for table `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  MODIFY `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_paypal_order`
--
ALTER TABLE `oc_paypal_order`
  MODIFY `paypal_order_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_paypal_order_transaction`
--
ALTER TABLE `oc_paypal_order_transaction`
  MODIFY `paypal_order_transaction_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_product`
--
ALTER TABLE `oc_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=242;
--
-- AUTO_INCREMENT for table `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  MODIFY `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=441;
--
-- AUTO_INCREMENT for table `oc_product_image`
--
ALTER TABLE `oc_product_image`
  MODIFY `product_image_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2776;
--
-- AUTO_INCREMENT for table `oc_product_option`
--
ALTER TABLE `oc_product_option`
  MODIFY `product_option_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=422;
--
-- AUTO_INCREMENT for table `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  MODIFY `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2265;
--
-- AUTO_INCREMENT for table `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  MODIFY `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=546;
--
-- AUTO_INCREMENT for table `oc_product_special`
--
ALTER TABLE `oc_product_special`
  MODIFY `product_special_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=441;
--
-- AUTO_INCREMENT for table `oc_recurring`
--
ALTER TABLE `oc_recurring`
  MODIFY `recurring_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_return`
--
ALTER TABLE `oc_return`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_return_action`
--
ALTER TABLE `oc_return_action`
  MODIFY `return_action_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oc_return_history`
--
ALTER TABLE `oc_return_history`
  MODIFY `return_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  MODIFY `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `oc_return_status`
--
ALTER TABLE `oc_return_status`
  MODIFY `return_status_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oc_review`
--
ALTER TABLE `oc_review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_setting`
--
ALTER TABLE `oc_setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3450;
--
-- AUTO_INCREMENT for table `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  MODIFY `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `oc_store`
--
ALTER TABLE `oc_store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  MODIFY `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  MODIFY `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT for table `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  MODIFY `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=129;
--
-- AUTO_INCREMENT for table `oc_upload`
--
ALTER TABLE `oc_upload`
  MODIFY `upload_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_url_alias`
--
ALTER TABLE `oc_url_alias`
  MODIFY `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1114;
--
-- AUTO_INCREMENT for table `oc_user`
--
ALTER TABLE `oc_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oc_user_group`
--
ALTER TABLE `oc_user_group`
  MODIFY `user_group_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `oc_voucher`
--
ALTER TABLE `oc_voucher`
  MODIFY `voucher_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  MODIFY `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  MODIFY `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  MODIFY `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `oc_weight_class_description`
--
ALTER TABLE `oc_weight_class_description`
  MODIFY `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `oc_zone`
--
ALTER TABLE `oc_zone`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4232;
--
-- AUTO_INCREMENT for table `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  MODIFY `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=110;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

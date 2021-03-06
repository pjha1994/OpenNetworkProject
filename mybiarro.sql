-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 14, 2017 at 12:36 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mybiarro`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL COMMENT 'associated post',
  `content` varchar(4000) NOT NULL COMMENT 'content of comment',
  `owner` varchar(200) NOT NULL COMMENT 'owner of comment',
  `neighborhood` varchar(200) NOT NULL COMMENT 'their neighborhood',
  `TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `content`, `owner`, `neighborhood`, `TIMESTAMP`) VALUES
(1, 2, 'Sjzjsj', 'Abhi Mitra', '896 alameida jurupis', '2017-08-15 15:06:19'),
(2, 3, ':::', 'Abhi Mitra', '896 alameida jurupis', '2017-08-16 17:06:45'),
(3, 2, 'vhjj', 'vishnu reddy', 'bangalore', '2017-08-23 16:06:31'),
(4, 3, 'Check out the notifications!', 'Kartik Gajendra', 'kasturinagar', '2017-08-27 08:27:10'),
(5, 7, 'Nice wallpaper', 'Kartik Gajendra', 'kasturinagar', '2017-08-27 08:27:22'),
(6, 8, 'lol. ', 'Kartik Gajendra', 'kasturinagar', '2017-09-02 08:59:12'),
(7, 8, 'Hey amigo ', 'Kartik lol', 'Kasturinagar', '2017-09-10 17:16:03'),
(8, 8, 'haha\n', 'Abhi Mitra', '896 alameida jurupis', '2017-09-12 23:53:00'),
(9, 8, 'we need to have the like button active , right now its a placeholder ', 'Abhi Mitra', '896 alameida jurupis', '2017-09-12 23:53:23');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `username` varchar(300) NOT NULL COMMENT 'owns the post',
  `comment_id` int(11) DEFAULT NULL COMMENT 'id of comment posted',
  `post_id` int(11) NOT NULL COMMENT 'post on which comment was made',
  `comment_from` varchar(300) DEFAULT NULL COMMENT 'owner of the comment',
  `liked_by` int(11) DEFAULT NULL COMMENT 'who liked the post',
  `is_read` tinyint(1) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`username`, `comment_id`, `post_id`, `comment_from`, `liked_by`, `is_read`, `time`) VALUES
('Abhi Mitra', 4, 3, 'Kartik Gajendra', NULL, 0, '2017-08-27 08:27:10'),
('Kartik Gajendra', 5, 7, 'Kartik Gajendra', NULL, 0, '2017-08-27 08:27:22'),
('Abhi Mitra', 6, 8, 'Kartik Gajendra', NULL, 0, '2017-09-02 08:59:12'),
('Abhi Mitra', 7, 8, 'Kartik lol', NULL, 0, '2017-09-10 17:16:03'),
('Abhi Mitra', 8, 8, 'Abhi Mitra', NULL, 0, '2017-09-12 23:53:00'),
('Abhi Mitra', 9, 8, 'Abhi Mitra', NULL, 0, '2017-09-12 23:53:23');

-- --------------------------------------------------------

--
-- Table structure for table `privacy_settings`
--

DROP TABLE IF EXISTS `privacy_settings`;
CREATE TABLE IF NOT EXISTS `privacy_settings` (
  `username` varchar(300) NOT NULL,
  `display-email` tinyint(1) NOT NULL,
  `display-address` tinyint(1) NOT NULL,
  `display-phone` tinyint(1) NOT NULL,
  `show-profile-pic` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(80) NOT NULL,
  `password` varchar(120) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `neighborhood` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_likes`
--

DROP TABLE IF EXISTS `user_likes`;
CREATE TABLE IF NOT EXISTS `user_likes` (
  `username` varchar(300) NOT NULL,
  `post_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_posts`
--

DROP TABLE IF EXISTS `user_posts`;
CREATE TABLE IF NOT EXISTS `user_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id of post',
  `type` varchar(180) DEFAULT NULL COMMENT 'type of post - event,etc',
  `content` varchar(30000) NOT NULL COMMENT 'text of post',
  `img_src` varchar(200) DEFAULT NULL COMMENT 'img link',
  `owner` varchar(180) NOT NULL COMMENT 'owner of the post',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'time',
  `likes` int(11) NOT NULL COMMENT 'number of likes',
  `neighborhood` varchar(180) NOT NULL COMMENT 'relevant neighborhood',
  `comments` int(11) NOT NULL COMMENT 'number of comments',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_posts`
--

INSERT INTO `user_posts` (`id`, `type`, `content`, `img_src`, `owner`, `time`, `likes`, `neighborhood`, `comments`) VALUES
(1, '', 'Welcome testers! You are a part of the mybairro alpha test. Go ahead and use the site for whatever you want. The test will end on 20th August. At that point all the data generated will be removed. The feedback form link is available under your username in the top bar or in the sidebar (if you are on your phone). ', '', 'Abhi Mitra', '2017-08-15 07:52:09', 50, '896 alameida jurupis', 10),
(2, 'Pets.', 'ygedyaedv', '', 'Soumya Deb', '2017-08-15 08:57:16', 50, 'Andu ka takla', 10),
(3, 'Events', 'hhfhf uf ig ', '', 'Abhi Mitra', '2017-08-16 17:06:38', 50, '896 alameida jurupis', 10),
(4, '', 'nothing', 'uploads/bangalore//', 'vishnu reddy', '2017-08-23 16:07:36', 50, 'bangalore', 10),
(5, 'Events', 'unable to upload anything', 'uploads/bangalore//', 'vishnu reddy', '2017-08-23 16:15:59', 50, 'bangalore', 10),
(6, '', 'The photos can not be uploaded from gallery', 'uploads/Bangalore//', 'Raghavendra T M', '2017-08-23 16:27:00', 50, 'Bangalore', 10),
(7, '', 'Uploads work for me.', 'uploads//af301771-fe1d-4004-a65f-f74a15751d01/14470_mass_efect.jpg', 'Kartik Gajendra', '2017-08-25 08:31:01', 50, 'kasturinagar', 10),
(8, 'Pets.Recommendations.', 'Sjdjd', 'uploads//9af2fb9b-800e-42db-b4b1-f1e96cc6d0d1/IMG_5999.PNG', 'Abhi Mitra', '2017-08-30 12:21:31', 50, '896 alameida jurupis', 10),
(9, '', 'Bbb', '', 'Abhi Mitra', '2017-09-07 02:38:32', 50, '896 alameida jurupis', 10),
(10, '', 'Hello world. ', '', 'Kartik lol', '2017-09-10 17:16:32', 50, 'Kasturinagar', 10),
(11, 'Recommendations.EventsEvents', 'I\'m bored', '', 'Kartik Gajendra', '2017-09-17 16:04:02', 50, 'kasturinagar', 10),
(12, 'Recommendations.EventsEvents', 'I\'m bored', 'uploads//b345989b-1b9a-4e88-843c-ddb48acb5fec/IMG-20170917-WA0003.jpg', 'Kartik Gajendra', '2017-09-17 16:04:52', 50, 'kasturinagar', 10);

-- --------------------------------------------------------

--
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
CREATE TABLE IF NOT EXISTS `user_settings` (
  `name` varchar(100) NOT NULL,
  `about` varchar(2000) DEFAULT NULL,
  `interests` varchar(300) NOT NULL,
  `recommendations` varchar(300) NOT NULL,
  `email_verified` tinyint(1) NOT NULL,
  `address_verified` tinyint(1) NOT NULL,
  `invited` int(11) NOT NULL,
  `picture` varchar(3000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_settings`
--

INSERT INTO `user_settings` (`name`, `about`, `interests`, `recommendations`, `email_verified`, `address_verified`, `invited`, `picture`) VALUES
('Kartik Gajendra', 'creator of mybairro, tech enthusiast, enviromentalist, coder, design affcianado and guy on the hunt for the world\'s greatest dosa joint. ', 'Java', 'recommendations', 0, 0, 0, 'profile_pics/Iron-Man-1.jpg'),
('Abhi Mitra', NULL, 'null', 'null', 0, 0, 0, 'images/user-default-gray.png'),
('Kartik lol', 'Test account', 'Testing', 'recommendations', 0, 0, 0, 'profile_pics/IMG-20170910-WA0007.jpg');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 06, 2023 at 06:09 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_schooladmission`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_profile`
--

CREATE TABLE `account_profile` (
  `id` bigint(20) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `role` longtext NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account_profile`
--

INSERT INTO `account_profile` (`id`, `image`, `role`, `user_id`) VALUES
(1, 'profile/photo_2023-08-31_16-07-18.jpg', 'Admin', 1),
(4, 'default.png', 'User', 4),
(6, 'default.png', '', 5),
(8, 'default.png', '', 6);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add academic program', 7, 'add_academicprogram'),
(26, 'Can change academic program', 7, 'change_academicprogram'),
(27, 'Can delete academic program', 7, 'delete_academicprogram'),
(28, 'Can view academic program', 7, 'view_academicprogram'),
(29, 'Can add contact', 8, 'add_contact'),
(30, 'Can change contact', 8, 'change_contact'),
(31, 'Can delete contact', 8, 'delete_contact'),
(32, 'Can view contact', 8, 'view_contact'),
(33, 'Can add department', 9, 'add_department'),
(34, 'Can change department', 9, 'change_department'),
(35, 'Can delete department', 9, 'delete_department'),
(36, 'Can view department', 9, 'view_department'),
(37, 'Can add expired', 10, 'add_expired'),
(38, 'Can change expired', 10, 'change_expired'),
(39, 'Can delete expired', 10, 'delete_expired'),
(40, 'Can view expired', 10, 'view_expired'),
(41, 'Can add form reg', 11, 'add_formreg'),
(42, 'Can change form reg', 11, 'change_formreg'),
(43, 'Can delete form reg', 11, 'delete_formreg'),
(44, 'Can view form reg', 11, 'view_formreg'),
(45, 'Can add level', 12, 'add_level'),
(46, 'Can change level', 12, 'change_level'),
(47, 'Can delete level', 12, 'delete_level'),
(48, 'Can view level', 12, 'view_level'),
(49, 'Can add major', 13, 'add_major'),
(50, 'Can change major', 13, 'change_major'),
(51, 'Can delete major', 13, 'delete_major'),
(52, 'Can view major', 13, 'view_major'),
(53, 'Can add married', 14, 'add_married'),
(54, 'Can change married', 14, 'change_married'),
(55, 'Can delete married', 14, 'delete_married'),
(56, 'Can view married', 14, 'view_married'),
(57, 'Can add menu', 15, 'add_menu'),
(58, 'Can change menu', 15, 'change_menu'),
(59, 'Can delete menu', 15, 'delete_menu'),
(60, 'Can view menu', 15, 'view_menu'),
(61, 'Can add payment', 16, 'add_payment'),
(62, 'Can change payment', 16, 'change_payment'),
(63, 'Can delete payment', 16, 'delete_payment'),
(64, 'Can view payment', 16, 'view_payment'),
(65, 'Can add ratings', 17, 'add_ratings'),
(66, 'Can change ratings', 17, 'change_ratings'),
(67, 'Can delete ratings', 17, 'delete_ratings'),
(68, 'Can view ratings', 17, 'view_ratings'),
(69, 'Can add relationship', 18, 'add_relationship'),
(70, 'Can change relationship', 18, 'change_relationship'),
(71, 'Can delete relationship', 18, 'delete_relationship'),
(72, 'Can view relationship', 18, 'view_relationship'),
(73, 'Can add role', 19, 'add_role'),
(74, 'Can change role', 19, 'change_role'),
(75, 'Can delete role', 19, 'delete_role'),
(76, 'Can view role', 19, 'view_role'),
(77, 'Can add sex', 20, 'add_sex'),
(78, 'Can change sex', 20, 'change_sex'),
(79, 'Can delete sex', 20, 'delete_sex'),
(80, 'Can view sex', 20, 'view_sex'),
(81, 'Can add shift', 21, 'add_shift'),
(82, 'Can change shift', 21, 'change_shift'),
(83, 'Can delete shift', 21, 'delete_shift'),
(84, 'Can view shift', 21, 'view_shift'),
(85, 'Can add status', 22, 'add_status'),
(86, 'Can change status', 22, 'change_status'),
(87, 'Can delete status', 22, 'delete_status'),
(88, 'Can view status', 22, 'view_status'),
(89, 'Can add subscribe', 23, 'add_subscribe'),
(90, 'Can change subscribe', 23, 'change_subscribe'),
(91, 'Can delete subscribe', 23, 'delete_subscribe'),
(92, 'Can view subscribe', 23, 'view_subscribe'),
(93, 'Can add tuition fee', 24, 'add_tuitionfee'),
(94, 'Can change tuition fee', 24, 'change_tuitionfee'),
(95, 'Can delete tuition fee', 24, 'delete_tuitionfee'),
(96, 'Can view tuition fee', 24, 'view_tuitionfee'),
(97, 'Can add subject', 25, 'add_subject'),
(98, 'Can change subject', 25, 'change_subject'),
(99, 'Can delete subject', 25, 'delete_subject'),
(100, 'Can view subject', 25, 'view_subject'),
(101, 'Can add access', 26, 'add_access'),
(102, 'Can change access', 26, 'change_access'),
(103, 'Can delete access', 26, 'delete_access'),
(104, 'Can view access', 26, 'view_access'),
(105, 'Can add register', 27, 'add_register'),
(106, 'Can change register', 27, 'change_register'),
(107, 'Can delete register', 27, 'delete_register'),
(108, 'Can view register', 27, 'view_register'),
(109, 'Can add profile', 28, 'add_profile'),
(110, 'Can change profile', 28, 'change_profile'),
(111, 'Can delete profile', 28, 'delete_profile'),
(112, 'Can view profile', 28, 'view_profile');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$0wuWLbVjevvk7AO4vnrwnH$XevvCZed+2y3K8/Y9gWz1mH1aDf+xtomnRIJQMQRMQY=', '2023-09-01 01:14:08.166206', 1, 'Phearak', 'PHO', 'So Phearak', 'phearakph2003@gmail.com', 1, 1, '2023-08-13 09:04:17.000000'),
(4, 'pbkdf2_sha256$600000$Vnf4Hs8ZefnBRkqLGHcSyi$IU/+NKnc0RjkuTPiZGuoA7TCzsCEvTb9RTUiqPRxrb0=', NULL, 0, 'John', '', '', '', 1, 1, '2023-09-02 04:56:32.000000'),
(5, 'pbkdf2_sha256$600000$J94IW8k5kGpubPNk77Io3L$pOt/AIROeQ5HERVGxEkJlgIT38q7kRtlsJAFdVmZmI4=', NULL, 0, 'Makara', '', '', 'phearakph2003@gmail.com', 0, 1, '2023-09-02 06:15:26.556551'),
(6, 'pbkdf2_sha256$600000$eLrTA3AbN1774efZh9yYhq$Du6nU0JHBVrE/7CO8fvWncYd900kSpz094RACN5Wlrc=', NULL, 0, 'admin', '', '', 'phearakph2003@gmail.com', 0, 1, '2023-09-02 06:24:38.353085');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user_user_permissions`
--

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20),
(21, 1, 21),
(22, 1, 22),
(23, 1, 23),
(24, 1, 24),
(25, 1, 25),
(26, 1, 26),
(27, 1, 27),
(28, 1, 28),
(29, 1, 29),
(30, 1, 30),
(31, 1, 31),
(32, 1, 32),
(33, 1, 33),
(34, 1, 34),
(35, 1, 35),
(36, 1, 36),
(37, 1, 37),
(38, 1, 38),
(39, 1, 39),
(40, 1, 40),
(41, 1, 41),
(42, 1, 42),
(43, 1, 43),
(44, 1, 44),
(45, 1, 45),
(46, 1, 46),
(47, 1, 47),
(48, 1, 48),
(49, 1, 49),
(50, 1, 50),
(51, 1, 51),
(52, 1, 52),
(53, 1, 53),
(54, 1, 54),
(55, 1, 55),
(56, 1, 56),
(57, 1, 57),
(58, 1, 58),
(59, 1, 59),
(60, 1, 60),
(61, 1, 61),
(62, 1, 62),
(63, 1, 63),
(64, 1, 64),
(65, 1, 65),
(66, 1, 66),
(67, 1, 67),
(68, 1, 68),
(69, 1, 69),
(70, 1, 70),
(71, 1, 71),
(72, 1, 72),
(73, 1, 73),
(74, 1, 74),
(75, 1, 75),
(76, 1, 76),
(77, 1, 77),
(78, 1, 78),
(79, 1, 79),
(80, 1, 80),
(81, 1, 81),
(82, 1, 82),
(83, 1, 83),
(84, 1, 84),
(85, 1, 85),
(86, 1, 86),
(87, 1, 87),
(88, 1, 88),
(89, 1, 89),
(90, 1, 90),
(91, 1, 91),
(92, 1, 92),
(93, 1, 93),
(94, 1, 94),
(95, 1, 95),
(96, 1, 96),
(97, 1, 97),
(98, 1, 98),
(99, 1, 99),
(100, 1, 100),
(101, 1, 101),
(102, 1, 102),
(103, 1, 103),
(104, 1, 104),
(105, 1, 105),
(106, 1, 106),
(107, 1, 107),
(108, 1, 108),
(109, 1, 109),
(110, 1, 110),
(111, 1, 111),
(112, 1, 112);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-08-13 09:04:49.700525', '1', 'Phearak', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"User permissions\"]}}]', 4, 1),
(2, '2023-08-13 11:52:51.576332', '1', 'Morning', 1, '[{\"added\": {}}]', 21, 1),
(3, '2023-08-13 11:53:02.220932', '2', 'Afternoon', 1, '[{\"added\": {}}]', 21, 1),
(4, '2023-08-13 11:53:09.633137', '3', 'Evening', 1, '[{\"added\": {}}]', 21, 1),
(5, '2023-08-13 11:53:18.375759', '4', 'Weekend', 1, '[{\"added\": {}}]', 21, 1),
(6, '2023-08-13 11:59:17.520080', '1', 'Morning(07:45-10:45)', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 21, 1),
(7, '2023-08-13 11:59:27.564046', '2', 'Afternoon(14:00-17:00)', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 21, 1),
(8, '2023-08-13 11:59:32.277711', '5', 'Afternoon(11:00-14:00)', 1, '[{\"added\": {}}]', 21, 1),
(9, '2023-08-13 11:59:49.468381', '3', 'Evening(17:30-20:30)', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 21, 1),
(10, '2023-08-13 12:00:05.248303', '4', 'Weekend', 2, '[]', 21, 1),
(11, '2023-08-13 12:00:10.091184', '5', 'Afternoon (11:00-14:00)', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 21, 1),
(12, '2023-08-13 12:00:14.205044', '3', 'Evening (17:30-20:30)', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 21, 1),
(13, '2023-08-13 12:00:18.250974', '2', 'Afternoon (14:00-17:00)', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 21, 1),
(14, '2023-08-13 12:00:22.402636', '1', 'Morning (07:45-10:45)', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 21, 1),
(15, '2023-08-13 12:01:55.862046', '1', 'John Doe', 1, '[{\"added\": {}}]', 17, 1),
(16, '2023-08-13 12:12:06.009846', '1', 'Techonology', 1, '[{\"added\": {}}]', 9, 1),
(17, '2023-08-13 12:12:26.549349', '2', 'Finance', 1, '[{\"added\": {}}]', 9, 1),
(18, '2023-08-13 12:12:52.850432', '3', 'Banking', 1, '[{\"added\": {}}]', 9, 1),
(19, '2023-08-13 12:13:38.047276', '4', 'Language', 1, '[{\"added\": {}}]', 9, 1),
(20, '2023-08-13 12:13:44.560963', '3', 'Banking', 2, '[]', 9, 1),
(21, '2023-08-13 12:25:38.571477', '1', 'INFINITY Institute', 1, '[{\"added\": {}}]', 8, 1),
(22, '2023-08-13 12:28:00.859668', '1', 'Location', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Icon\", \"Text\", \"Link\"]}}]', 8, 1),
(23, '2023-08-13 12:28:20.850226', '2', 'INFINITY Institute', 1, '[{\"added\": {}}]', 8, 1),
(24, '2023-08-13 12:28:37.913836', '3', 'Email', 1, '[{\"added\": {}}]', 8, 1),
(25, '2023-08-13 12:28:52.390838', '4', 'Phone', 1, '[{\"added\": {}}]', 8, 1),
(26, '2023-08-13 12:29:07.381134', '5', 'Telegram', 1, '[{\"added\": {}}]', 8, 1),
(27, '2023-08-13 12:29:19.667379', '6', 'Facebook', 1, '[{\"added\": {}}]', 8, 1),
(28, '2023-08-13 12:29:31.117510', '7', 'LinkedIn', 1, '[{\"added\": {}}]', 8, 1),
(29, '2023-08-13 12:31:15.996655', '1', 'True', 1, '[{\"added\": {}}]', 11, 1),
(30, '2023-08-13 12:31:32.806895', '1', 'False', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(31, '2023-08-13 13:28:55.250332', '1', 'True', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(32, '2023-08-13 14:07:39.086942', '1', 'False', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(33, '2023-08-13 14:20:06.790756', '1', 'Batch: 1, Year: 2022', 1, '[{\"added\": {}}]', 10, 1),
(34, '2023-08-13 14:26:45.203596', '2', 'Batch: 2, Year: 2023', 1, '[{\"added\": {}}]', 10, 1),
(35, '2023-08-13 14:35:50.688912', '1', 'True', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(36, '2023-08-13 14:36:19.761154', '1', 'False', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(37, '2023-08-13 14:50:51.868898', '1', 'INFINITY Institute', 1, '[{\"added\": {}}]', 8, 1),
(38, '2023-08-13 14:52:13.822294', '2', 'Location', 1, '[{\"added\": {}}]', 8, 1),
(39, '2023-08-13 14:52:59.343409', '3', 'Email', 1, '[{\"added\": {}}]', 8, 1),
(40, '2023-08-13 14:56:49.624673', '4', 'Phone', 1, '[{\"added\": {}}]', 8, 1),
(41, '2023-08-13 14:57:13.065065', '5', 'Telegram', 1, '[{\"added\": {}}]', 8, 1),
(42, '2023-08-13 14:57:33.949088', '6', 'Facebook', 1, '[{\"added\": {}}]', 8, 1),
(43, '2023-08-13 14:57:53.057671', '7', 'LinkedIn', 1, '[{\"added\": {}}]', 8, 1),
(44, '2023-08-13 15:03:34.488785', '1', 'True', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(45, '2023-08-13 15:10:09.482740', '1', 'False', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(46, '2023-08-13 15:11:14.450806', '1', 'True', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(47, '2023-08-13 15:12:48.455864', '1', 'False', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(48, '2023-08-13 15:12:57.982199', '1', 'True', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(49, '2023-08-13 15:13:43.720828', '1', 'False', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(50, '2023-08-13 15:15:06.008126', '1', 'True', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(51, '2023-08-13 15:15:13.966556', '1', 'False', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(52, '2023-08-13 15:32:10.515509', '1', 'True', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(53, '2023-08-13 15:32:44.599618', '1', 'False', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(54, '2023-08-13 15:32:59.862640', '1', 'True', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(55, '2023-08-13 15:33:06.570064', '1', 'False', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(56, '2023-08-13 15:33:33.181868', '1', 'True', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(57, '2023-08-13 15:36:23.159680', '1', 'False', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(58, '2023-08-13 15:36:29.846503', '1', 'True', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(59, '2023-08-13 15:36:44.072823', '1', 'False', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(60, '2023-08-13 15:39:44.248406', '1', 'True', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(61, '2023-08-13 15:40:36.117189', '1', 'False', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(62, '2023-08-13 15:40:43.115794', '1', 'True', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(63, '2023-08-13 15:41:01.928841', '1', 'False', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(64, '2023-08-13 15:46:02.200231', '1', 'True', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(65, '2023-08-13 15:46:39.526420', '1', 'False', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(66, '2023-08-15 08:28:45.613766', '1', 'Computer Science', 1, '[{\"added\": {}}]', 13, 1),
(67, '2023-08-15 08:28:55.518009', '2', 'Cybersecurity', 1, '[{\"added\": {}}]', 13, 1),
(68, '2023-08-15 08:29:04.917855', '3', 'Robotics', 1, '[{\"added\": {}}]', 13, 1),
(69, '2023-08-15 08:29:16.341997', '4', 'Finance', 1, '[{\"added\": {}}]', 13, 1),
(70, '2023-08-15 08:29:29.366971', '5', 'Accounting', 1, '[{\"added\": {}}]', 13, 1),
(71, '2023-08-15 08:29:39.765850', '6', 'Economics', 1, '[{\"added\": {}}]', 13, 1),
(72, '2023-08-15 08:29:48.374307', '7', 'Business Administration', 1, '[{\"added\": {}}]', 13, 1),
(73, '2023-08-15 08:30:01.413710', '8', 'Banking and Finance', 1, '[{\"added\": {}}]', 13, 1),
(74, '2023-08-15 08:30:11.141918', '9', 'Risk Management', 1, '[{\"added\": {}}]', 13, 1),
(75, '2023-08-15 08:30:20.189907', '10', 'Financial Analysis', 1, '[{\"added\": {}}]', 13, 1),
(76, '2023-08-15 08:30:41.126054', '11', 'Teaching English as a Foreign Language (TEFL)', 1, '[{\"added\": {}}]', 13, 1),
(77, '2023-08-15 08:30:51.986615', '12', 'English for Business Communication', 1, '[{\"added\": {}}]', 13, 1),
(78, '2023-08-15 08:31:04.285312', '11', 'Teaching English as a Foreign Language (TEFL)', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 13, 1),
(79, '2023-08-15 08:44:29.007989', '4', 'Language', 2, '[{\"changed\": {\"fields\": [\"Icon\"]}}]', 9, 1),
(80, '2023-08-15 08:44:37.048010', '3', 'Banking', 2, '[{\"changed\": {\"fields\": [\"Icon\"]}}]', 9, 1),
(81, '2023-08-15 08:44:45.319849', '2', 'Finance', 2, '[{\"changed\": {\"fields\": [\"Icon\"]}}]', 9, 1),
(82, '2023-08-15 08:44:52.719843', '1', 'Techonology', 2, '[{\"changed\": {\"fields\": [\"Icon\"]}}]', 9, 1),
(83, '2023-08-15 08:55:37.969318', '1', 'Associate Degree', 1, '[{\"added\": {}}]', 12, 1),
(84, '2023-08-15 08:55:44.401236', '2', 'Bachelor Degree', 1, '[{\"added\": {}}]', 12, 1),
(85, '2023-08-15 08:55:48.057189', '3', 'Master Degree', 1, '[{\"added\": {}}]', 12, 1),
(86, '2023-08-15 08:57:17.421170', '1', 'Level: Associate Degree, Price: 450', 1, '[{\"added\": {}}]', 24, 1),
(87, '2023-08-15 08:57:30.097650', '2', 'Level: Bachelor Degree, Price: 600', 1, '[{\"added\": {}}]', 24, 1),
(88, '2023-08-15 08:57:35.057642', '3', 'Level: Master Degree, Price: 800', 1, '[{\"added\": {}}]', 24, 1),
(89, '2023-08-15 09:25:22.469000', '1', 'John Doe', 2, '[]', 17, 1),
(90, '2023-08-15 09:25:32.202791', '2', 'PHO Phearak', 1, '[{\"added\": {}}]', 17, 1),
(91, '2023-08-15 09:25:35.988889', '1', 'John Doe', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(92, '2023-08-15 09:28:09.874178', '1', 'John Doe', 2, '[]', 17, 1),
(93, '2023-08-15 10:09:08.036015', '7', 'LinkedIn', 2, '[{\"changed\": {\"fields\": [\"Icon\"]}}]', 8, 1),
(94, '2023-08-15 10:09:16.056691', '6', 'Facebook', 2, '[{\"changed\": {\"fields\": [\"Icon\"]}}]', 8, 1),
(95, '2023-08-15 10:09:22.524059', '5', 'Telegram', 2, '[{\"changed\": {\"fields\": [\"Icon\"]}}]', 8, 1),
(96, '2023-08-15 10:09:29.772028', '4', 'Phone', 2, '[{\"changed\": {\"fields\": [\"Icon\"]}}]', 8, 1),
(97, '2023-08-15 10:09:32.596069', '4', 'Phone', 2, '[]', 8, 1),
(98, '2023-08-15 10:09:37.429541', '3', 'Email', 2, '[{\"changed\": {\"fields\": [\"Icon\"]}}]', 8, 1),
(99, '2023-08-15 10:09:44.020008', '2', 'Location', 2, '[{\"changed\": {\"fields\": [\"Icon\"]}}]', 8, 1),
(100, '2023-08-15 10:09:47.750476', '2', 'Location', 2, '[]', 8, 1),
(101, '2023-08-15 10:09:51.815913', '1', 'INFINITY Institute', 2, '[]', 8, 1),
(102, '2023-08-15 10:23:41.441319', '1', 'True', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(103, '2023-08-15 11:33:32.362858', '1', 'False', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(104, '2023-08-15 16:02:18.027882', '1', 'True', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(105, '2023-08-15 16:11:03.327429', '1', 'False', 2, '[{\"changed\": {\"fields\": [\"Form\"]}}]', 11, 1),
(106, '2023-08-15 16:42:03.311731', '2', 'Batch: 2, Year: 2023', 2, '[{\"changed\": {\"fields\": [\"Expired date\"]}}]', 10, 1),
(107, '2023-08-15 16:42:32.086274', '2', 'Batch: 2, Year: 2023', 2, '[{\"changed\": {\"fields\": [\"Expired date\"]}}]', 10, 1),
(108, '2023-08-16 15:57:57.517553', '2', 'Batch: 2, Year: 2023', 2, '[{\"changed\": {\"fields\": [\"Expired date\"]}}]', 10, 1),
(109, '2023-08-16 16:08:55.643639', '2', 'Batch: 2, Year: 2023', 2, '[{\"changed\": {\"fields\": [\"Expired date\"]}}]', 10, 1),
(110, '2023-08-16 16:10:40.124043', '1', 'Female', 1, '[{\"added\": {}}]', 20, 1),
(111, '2023-08-16 16:10:44.293994', '2', 'Male', 1, '[{\"added\": {}}]', 20, 1),
(112, '2023-08-17 09:35:01.916578', '1', 'Single', 1, '[{\"added\": {}}]', 14, 1),
(113, '2023-08-17 09:35:07.639953', '2', 'Married', 1, '[{\"added\": {}}]', 14, 1),
(114, '2023-08-17 09:35:12.192591', '3', 'Window(er)', 1, '[{\"added\": {}}]', 14, 1),
(115, '2023-08-17 09:40:26.499916', '1', 'Mother', 1, '[{\"added\": {}}]', 18, 1),
(116, '2023-08-17 09:40:35.309547', '2', 'Father', 1, '[{\"added\": {}}]', 18, 1),
(117, '2023-08-17 09:40:40.560598', '3', 'Brother', 1, '[{\"added\": {}}]', 18, 1),
(118, '2023-08-17 09:40:45.588668', '4', 'Sister', 1, '[{\"added\": {}}]', 18, 1),
(119, '2023-08-17 09:40:50.082497', '5', 'Uncle', 1, '[{\"added\": {}}]', 18, 1),
(120, '2023-08-17 09:40:54.220712', '6', 'Aunt', 1, '[{\"added\": {}}]', 18, 1),
(121, '2023-08-17 09:40:58.423098', '7', 'Grandma', 1, '[{\"added\": {}}]', 18, 1),
(122, '2023-08-17 09:41:02.780096', '8', 'Grandpa', 1, '[{\"added\": {}}]', 18, 1),
(123, '2023-08-17 09:41:07.213795', '9', 'Other', 1, '[{\"added\": {}}]', 18, 1),
(124, '2023-08-17 09:41:19.386642', '9', 'Other', 2, '[]', 18, 1),
(125, '2023-08-17 09:50:39.699747', '1', 'Quarter', 1, '[{\"added\": {}}]', 16, 1),
(126, '2023-08-17 09:50:44.061588', '2', 'Semester', 1, '[{\"added\": {}}]', 16, 1),
(127, '2023-08-17 09:50:48.808683', '3', 'Yearly', 1, '[{\"added\": {}}]', 16, 1),
(128, '2023-08-17 16:49:59.007476', '1', 'Title: Robotics, Level: Associate Degree', 1, '[{\"added\": {}}]', 25, 1),
(129, '2023-08-17 16:50:21.224104', '2', 'Title: Finance, Level: Associate Degree', 1, '[{\"added\": {}}]', 25, 1),
(130, '2023-08-17 16:50:29.325400', '3', 'Title: Banking and Finance, Level: Associate Degree', 1, '[{\"added\": {}}]', 25, 1),
(131, '2023-08-17 16:50:39.001109', '4', 'Title: Financial Analysis, Level: Associate Degree', 1, '[{\"added\": {}}]', 25, 1),
(132, '2023-08-17 16:50:51.075928', '5', 'Title: English for Business Communication, Level: Associate Degree', 1, '[{\"added\": {}}]', 25, 1),
(133, '2023-08-17 16:51:13.981754', '6', 'Title: Computer Science, Level: Bachelor Degree', 1, '[{\"added\": {}}]', 25, 1),
(134, '2023-08-17 16:51:21.268375', '7', 'Title: Cybersecurity, Level: Bachelor Degree', 1, '[{\"added\": {}}]', 25, 1),
(135, '2023-08-17 16:51:27.585148', '8', 'Title: Robotics, Level: Bachelor Degree', 1, '[{\"added\": {}}]', 25, 1),
(136, '2023-08-17 16:52:12.654496', '9', 'Title: Finance, Level: Bachelor Degree', 1, '[{\"added\": {}}]', 25, 1),
(137, '2023-08-17 16:52:26.013744', '10', 'Title: Accounting, Level: Bachelor Degree', 1, '[{\"added\": {}}]', 25, 1),
(138, '2023-08-17 16:52:39.596147', '11', 'Title: Banking and Finance, Level: Bachelor Degree', 1, '[{\"added\": {}}]', 25, 1),
(139, '2023-08-17 16:52:43.701712', '12', 'Title: Risk Management, Level: Bachelor Degree', 1, '[{\"added\": {}}]', 25, 1),
(140, '2023-08-17 16:52:55.263520', '13', 'Title: Financial Analysis, Level: Bachelor Degree', 1, '[{\"added\": {}}]', 25, 1),
(141, '2023-08-17 16:53:03.518813', '14', 'Title: Teaching English as a Foreign Language (TEFL), Level: Bachelor Degree', 1, '[{\"added\": {}}]', 25, 1),
(142, '2023-08-17 16:53:56.660568', '15', 'Title: English for Business Communication, Level: Bachelor Degree', 1, '[{\"added\": {}}]', 25, 1),
(143, '2023-08-17 16:54:01.753214', '16', 'Title: Economics, Level: Master Degree', 1, '[{\"added\": {}}]', 25, 1),
(144, '2023-08-17 16:54:13.055891', '17', 'Title: Business Administration, Level: Master Degree', 1, '[{\"added\": {}}]', 25, 1),
(145, '2023-08-17 16:54:20.971737', '18', 'Title: Banking and Finance, Level: Master Degree', 1, '[{\"added\": {}}]', 25, 1),
(146, '2023-08-17 16:54:33.151983', '19', 'Title: Teaching English as a Foreign Language (TEFL), Level: Master Degree', 1, '[{\"added\": {}}]', 25, 1),
(147, '2023-08-31 08:50:29.097780', '1', 'Phearak', 1, '[{\"added\": {}}]', 28, 1),
(148, '2023-08-31 09:06:16.338161', '1', 'Phearak', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 28, 1),
(149, '2023-08-31 09:07:31.950621', '1', 'Phearak', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 28, 1),
(150, '2023-08-31 09:25:50.075410', '1', 'Phearak', 2, '[{\"changed\": {\"fields\": [\"User permissions\"]}}]', 4, 1),
(151, '2023-08-31 15:03:48.317330', '1', 'Phearak', 2, '[]', 28, 1),
(152, '2023-08-31 15:04:35.045075', '2', 'Batch: 2, Year: 2023', 2, '[{\"changed\": {\"fields\": [\"Expired date\"]}}]', 10, 1),
(153, '2023-09-02 04:56:33.322702', '4', 'John', 1, '[{\"added\": {}}]', 4, 1),
(154, '2023-09-02 04:56:50.280998', '4', 'John', 2, '[{\"changed\": {\"fields\": [\"Role\"]}}]', 28, 1),
(155, '2023-09-02 05:03:02.863368', '4', 'John', 2, '[{\"changed\": {\"fields\": [\"Staff status\"]}}]', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(28, 'account', 'profile'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'index', 'academicprogram'),
(26, 'index', 'access'),
(8, 'index', 'contact'),
(9, 'index', 'department'),
(10, 'index', 'expired'),
(11, 'index', 'formreg'),
(12, 'index', 'level'),
(13, 'index', 'major'),
(14, 'index', 'married'),
(15, 'index', 'menu'),
(16, 'index', 'payment'),
(17, 'index', 'ratings'),
(27, 'index', 'register'),
(18, 'index', 'relationship'),
(19, 'index', 'role'),
(20, 'index', 'sex'),
(21, 'index', 'shift'),
(22, 'index', 'status'),
(25, 'index', 'subject'),
(23, 'index', 'subscribe'),
(24, 'index', 'tuitionfee'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-08-13 09:00:53.743562'),
(2, 'auth', '0001_initial', '2023-08-13 09:00:54.589098'),
(3, 'admin', '0001_initial', '2023-08-13 09:00:54.760948'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-08-13 09:00:54.776582'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-08-13 09:00:54.796718'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-08-13 09:00:54.901717'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-08-13 09:00:54.978346'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-08-13 09:00:55.012340'),
(9, 'auth', '0004_alter_user_username_opts', '2023-08-13 09:00:55.024341'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-08-13 09:00:55.103217'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-08-13 09:00:55.108218'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-08-13 09:00:55.122214'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-08-13 09:00:55.157242'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-08-13 09:00:55.195214'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-08-13 09:00:55.233215'),
(16, 'auth', '0011_update_proxy_permissions', '2023-08-13 09:00:55.250213'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-08-13 09:00:55.288217'),
(18, 'index', '0001_initial', '2023-08-13 09:00:55.990759'),
(19, 'sessions', '0001_initial', '2023-08-13 09:00:56.068779'),
(20, 'index', '0002_alter_contact_link_alter_department_icon_and_more', '2023-08-13 12:08:38.087736'),
(21, 'index', '0003_alter_department_icon_alter_department_title', '2023-08-13 12:11:08.374968'),
(22, 'index', '0004_alter_contact_link_alter_contact_text', '2023-08-13 12:17:08.497957'),
(23, 'index', '0005_remove_contact_link_remove_contact_text', '2023-08-13 12:25:26.544412'),
(24, 'index', '0006_contact_link_contact_text', '2023-08-13 12:26:38.534819'),
(25, 'index', '0007_alter_formreg_form', '2023-08-13 12:31:10.771883'),
(26, 'index', '0008_contact_link2', '2023-08-13 15:00:26.679728'),
(27, 'index', '0009_remove_contact_link2', '2023-08-13 15:00:26.736282'),
(28, 'index', '0010_alter_tuitionfee_description', '2023-08-15 08:57:11.223221'),
(29, 'index', '0011_register', '2023-08-15 16:08:23.647334'),
(30, 'index', '0012_remove_subject_title_subject_major', '2023-08-17 17:09:14.353545'),
(31, 'index', '0013_remove_subject_major_subject_title', '2023-08-17 17:10:13.285914'),
(32, 'index', '0014_alter_subject_level', '2023-08-17 17:11:01.857355'),
(33, 'account', '0001_initial', '2023-08-31 08:47:12.669920'),
(34, 'account', '0002_alter_profile_role', '2023-08-31 08:49:17.165909'),
(35, 'account', '0003_alter_profile_role', '2023-08-31 08:50:14.287990'),
(36, 'account', '0004_rename_image_profile_iimage', '2023-08-31 15:02:07.214631'),
(37, 'account', '0005_rename_iimage_profile_image', '2023-08-31 15:02:07.278631'),
(38, 'account', '0006_alter_profile_image', '2023-09-02 04:56:27.830948');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('299rj8itj4hy8qm7eneel8c2jgh5g2pp', '.eJxVjMsOwiAQRf-FtSE8hBlcuvcbyBQGqRqalHZl_HfbpAvdnnPufYtI61Lj2nmOYxYXocXplw2Untx2kR_U7pNMU1vmcZB7Ig_b5W3K_Loe7d9BpV63NbAzcFbKFmuwQAnFYdigdj4oX7QmBDQBtHfoCSw58OhTSQismaz4fAGmzTaH:1qbsjg:19G0BKdqBhAtCBKRQ7V_EMDW2eq_vycQIYkjckrC7Is', '2023-09-15 01:14:08.243221'),
('9tfupwn74qecsf93axikv5akvcxm4b9n', '.eJxVjMsOwiAQRf-FtSE8hBlcuvcbyBQGqRqalHZl_HfbpAvdnnPufYtI61Lj2nmOYxYXocXplw2Untx2kR_U7pNMU1vmcZB7Ig_b5W3K_Loe7d9BpV63NbAzcFbKFmuwQAnFYdigdj4oX7QmBDQBtHfoCSw58OhTSQismaz4fAGmzTaH:1qV71P:FozXuAGIRp36gbyB6jrTA4_7V-eh_9u78CqxvnbJPQ4', '2023-08-27 09:04:27.364463'),
('9zijg27exi30w149u4a96i5bkdx3iuco', '.eJxVjMsOwiAQRf-FtSE8hBlcuvcbyBQGqRqalHZl_HfbpAvdnnPufYtI61Lj2nmOYxYXocXplw2Untx2kR_U7pNMU1vmcZB7Ig_b5W3K_Loe7d9BpV63NbAzcFbKFmuwQAnFYdigdj4oX7QmBDQBtHfoCSw58OhTSQismaz4fAGmzTaH:1qYIGS:zpU39U9O90dQKKtJNNg2l5YoHH4qiIe2vquAZVpTK7Q', '2023-09-05 03:41:08.715601'),
('h8iluu4kz7wn3ipmtup49qmw2fpomdk8', 'e30:1qYI8R:9lzyfVhxiWPPvrqz6MRQjRXHQFFYwMRn6g2Uxb12sS8', '2023-09-05 03:32:51.879269'),
('nz28qzeyif3ywyw31vams43bm7f0ru38', 'e30:1qYI5w:ZhNdCEKALstmfMsE9ZZ4BhFSj8Q9L9Bx8cRA8U1wNrY', '2023-09-05 03:30:16.623406'),
('tcve6ddwq4g9ochs8r6hqa3zq9s37i7f', 'e30:1qYI7P:Y8Fu-C6oMbih_Lthjg5U-VTOq_GaYFPGW-sA9WMSvRI', '2023-09-05 03:31:47.029441'),
('xq8fe4pq5ynanoqgk8hlo206bo3lfo49', '.eJxVjMsOwiAQRf-FtSE8hBlcuvcbyBQGqRqalHZl_HfbpAvdnnPufYtI61Lj2nmOYxYXocXplw2Untx2kR_U7pNMU1vmcZB7Ig_b5W3K_Loe7d9BpV63NbAzcFbKFmuwQAnFYdigdj4oX7QmBDQBtHfoCSw58OhTSQismaz4fAGmzTaH:1qbduw:ZRIl4q379J1gvKFabLQIkcaBD2TK1fWShu1D4HrXbIE', '2023-09-14 09:24:46.957574');

-- --------------------------------------------------------

--
-- Table structure for table `index_academicprogram`
--

CREATE TABLE `index_academicprogram` (
  `id` bigint(20) NOT NULL,
  `iconName` varchar(255) NOT NULL,
  `iconSize` int(11) NOT NULL,
  `iconType` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `index_access`
--

CREATE TABLE `index_access` (
  `id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `index_contact`
--

CREATE TABLE `index_contact` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `text` varchar(255) DEFAULT '',
  `link` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `index_contact`
--

INSERT INTO `index_contact` (`id`, `name`, `icon`, `text`, `link`) VALUES
(1, 'INFINITY Institute', 'infinity-logo.png', '', ''),
(2, 'Location', 'fa-solid fa-location-dot', 'St. 5th, Vinhear Loung, Ponhea Leu, Kandal, Cambodia', 'https://www.google.com/maps/place/Glory+International+School+in+Oudong/@11.8229794,104.76758,15z/data=!4m6!3m5!1s0x310eb0e3c61ba661:0x2c4c593264eeefbc!8m2!3d11.8210473!4d104.7832061!16s%2Fg%2F11c6cbgyq0'),
(3, 'Email', 'fa-regular fa-envelope', 'phearakph2003@gmail.com', 'mailto:phearakph2003@gmail.com'),
(4, 'Phone', 'fa-solid fa-mobile-screen', '(+855) 96 848 4940', 'tel:(+855)968484940'),
(5, 'Telegram', 'fa-brands fa-telegram', 'Pho Phearak', 'https://t.me/phearak2003'),
(6, 'Facebook', 'fa-brands fa-facebook-f', 'Pho Phearak', 'https://www.facebook.com/phearak2003'),
(7, 'LinkedIn', 'fa-brands fa-linkedin-in', 'Pho Phearak', 'https://www.linkedin.com/in/pho-phearak-32402024b/');

-- --------------------------------------------------------

--
-- Table structure for table `index_department`
--

CREATE TABLE `index_department` (
  `id` bigint(20) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `title` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `index_department`
--

INSERT INTO `index_department` (`id`, `icon`, `title`) VALUES
(1, 'fa-solid fa-laptop-code', 'Techonology'),
(2, 'fa-solid fa-coins', 'Finance'),
(3, 'fa-solid fa-building-columns', 'Banking'),
(4, 'fa-solid fa-language', 'Language');

-- --------------------------------------------------------

--
-- Table structure for table `index_expired`
--

CREATE TABLE `index_expired` (
  `id` bigint(20) NOT NULL,
  `batch` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `expired_date` date NOT NULL,
  `start_class` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `index_expired`
--

INSERT INTO `index_expired` (`id`, `batch`, `year`, `start_date`, `expired_date`, `start_class`) VALUES
(1, 1, 2022, '2023-08-01', '2023-10-06', '2023-11-06'),
(2, 2, 2023, '2023-08-01', '2023-09-30', '2023-10-09');

-- --------------------------------------------------------

--
-- Table structure for table `index_formreg`
--

CREATE TABLE `index_formreg` (
  `id` bigint(20) NOT NULL,
  `form` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `index_formreg`
--

INSERT INTO `index_formreg` (`id`, `form`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `index_level`
--

CREATE TABLE `index_level` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `index_level`
--

INSERT INTO `index_level` (`id`, `title`) VALUES
(1, 'Associate Degree'),
(2, 'Bachelor Degree'),
(3, 'Master Degree');

-- --------------------------------------------------------

--
-- Table structure for table `index_major`
--

CREATE TABLE `index_major` (
  `id` bigint(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `department_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `index_major`
--

INSERT INTO `index_major` (`id`, `title`, `description`, `department_id`) VALUES
(1, 'Computer Science', 'Study algorithms, programming languages, and software development.', 1),
(2, 'Cybersecurity', 'Protect computer systems and networks from unauthorized access and attacks.', 1),
(3, 'Robotics', 'Design, build and program robots for various applications.', 1),
(4, 'Finance', 'Study investments, financial analysis, and risk management.', 2),
(5, 'Accounting', 'Learn financial reporting, auditing, and taxation.', 2),
(6, 'Economics', 'Analyze economic systems, policies, and market trends.', 2),
(7, 'Business Administration', 'Develop managerial and decision-making skills for various business contexts.', 2),
(8, 'Banking and Finance', 'Study financial markets, banking operations, and investment strategies.', 3),
(9, 'Risk Management', 'Assess and mitigate risks in banking and financial services.', 3),
(10, 'Financial Analysis', 'Analyze financial statements, market trends, and investment opportunities.', 3),
(11, 'Teaching English as a Foreign Language (TEFL)', 'Focuses on teaching English to non-native speakers using various methods and techniques to develop language skills.', 4),
(12, 'English for Business Communication', 'Teaches effective communication skills in English for professional contexts, including writing emails, making presentations, and negotiating deals.', 4);

-- --------------------------------------------------------

--
-- Table structure for table `index_married`
--

CREATE TABLE `index_married` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `index_married`
--

INSERT INTO `index_married` (`id`, `title`) VALUES
(1, 'Single'),
(2, 'Married'),
(3, 'Window(er)');

-- --------------------------------------------------------

--
-- Table structure for table `index_menu`
--

CREATE TABLE `index_menu` (
  `id` bigint(20) NOT NULL,
  `menu_ID` varchar(30) NOT NULL,
  `div_ID` varchar(30) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `title` varchar(30) NOT NULL,
  `span` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `index_payment`
--

CREATE TABLE `index_payment` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `index_payment`
--

INSERT INTO `index_payment` (`id`, `title`) VALUES
(1, 'Quarter'),
(2, 'Semester'),
(3, 'Yearly');

-- --------------------------------------------------------

--
-- Table structure for table `index_ratings`
--

CREATE TABLE `index_ratings` (
  `id` bigint(20) NOT NULL,
  `rating` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `comments` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `index_ratings`
--

INSERT INTO `index_ratings` (`id`, `rating`, `name`, `comments`, `created_at`, `status`) VALUES
(1, 5, 'John Doe', 'Great site!', '2023-08-13 12:01:55.860499', 1),
(2, 4, 'PHO Phearak', 'Wow!', '2023-08-15 09:25:32.202791', 1);

-- --------------------------------------------------------

--
-- Table structure for table `index_register`
--

CREATE TABLE `index_register` (
  `id` bigint(20) NOT NULL,
  `Batch` int(11) NOT NULL,
  `Ref` varchar(30) NOT NULL,
  `Photo` varchar(255) NOT NULL,
  `First_Name_Kh` varchar(255) NOT NULL,
  `Last_Name_Kh` varchar(255) NOT NULL,
  `First_Name_En` varchar(255) NOT NULL,
  `Last_Name_En` varchar(255) NOT NULL,
  `Village_POB` varchar(255) NOT NULL,
  `Commune_POB` varchar(255) NOT NULL,
  `District_POB` varchar(255) NOT NULL,
  `Province_POB` varchar(255) NOT NULL,
  `DOB` date NOT NULL,
  `Village_Current` varchar(255) NOT NULL,
  `Commune_Current` varchar(255) NOT NULL,
  `District_Current` varchar(255) NOT NULL,
  `Province_Current` varchar(255) NOT NULL,
  `Nationality` varchar(255) NOT NULL,
  `Father_Name` varchar(255) NOT NULL,
  `Father_Tel` varchar(20) NOT NULL,
  `Mother_Name` varchar(255) NOT NULL,
  `Mother_Tel` varchar(20) NOT NULL,
  `Emergency_Contact_Name` varchar(255) NOT NULL,
  `Emergency_Contact_Tel` varchar(20) NOT NULL,
  `Tel` varchar(30) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Diploma_Certificate` varchar(255) NOT NULL,
  `Student_ID` varchar(255) NOT NULL,
  `Khmer_ID` varchar(255) NOT NULL,
  `Submit_Date` datetime(6) NOT NULL,
  `Status` varchar(10) NOT NULL,
  `Decided_By` varchar(30) DEFAULT NULL,
  `Decided_Date` datetime(6) NOT NULL,
  `Reason` longtext DEFAULT NULL,
  `Apply_For_id` bigint(20) NOT NULL,
  `Emergency_Contact_Relation_id` bigint(20) NOT NULL,
  `Major_id` bigint(20) NOT NULL,
  `Marital_Status_id` bigint(20) NOT NULL,
  `Payment_Method_id` bigint(20) NOT NULL,
  `Sex_id` bigint(20) NOT NULL,
  `Shift_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `index_relationship`
--

CREATE TABLE `index_relationship` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `index_relationship`
--

INSERT INTO `index_relationship` (`id`, `title`) VALUES
(1, 'Mother'),
(2, 'Father'),
(3, 'Brother'),
(4, 'Sister'),
(5, 'Uncle'),
(6, 'Aunt'),
(7, 'Grandma'),
(8, 'Grandpa'),
(9, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `index_role`
--

CREATE TABLE `index_role` (
  `id` bigint(20) NOT NULL,
  `title` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `index_sex`
--

CREATE TABLE `index_sex` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `index_sex`
--

INSERT INTO `index_sex` (`id`, `title`) VALUES
(1, 'Female'),
(2, 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `index_shift`
--

CREATE TABLE `index_shift` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `index_shift`
--

INSERT INTO `index_shift` (`id`, `title`) VALUES
(1, 'Morning (07:45-10:45)'),
(2, 'Afternoon (14:00-17:00)'),
(3, 'Evening (17:30-20:30)'),
(4, 'Weekend'),
(5, 'Afternoon (11:00-14:00)');

-- --------------------------------------------------------

--
-- Table structure for table `index_status`
--

CREATE TABLE `index_status` (
  `id` bigint(20) NOT NULL,
  `title` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `index_subject`
--

CREATE TABLE `index_subject` (
  `id` bigint(20) NOT NULL,
  `level_id` bigint(20) NOT NULL,
  `title_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `index_subject`
--

INSERT INTO `index_subject` (`id`, `level_id`, `title_id`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1),
(4, 1, 1),
(5, 1, 1),
(6, 2, 1),
(7, 2, 1),
(8, 2, 1),
(9, 2, 1),
(10, 2, 1),
(11, 2, 1),
(12, 2, 1),
(13, 2, 1),
(14, 2, 1),
(15, 2, 1),
(16, 3, 1),
(17, 3, 1),
(18, 3, 1),
(19, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `index_subscribe`
--

CREATE TABLE `index_subscribe` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `subscribe_date` datetime(6) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `index_tuitionfee`
--

CREATE TABLE `index_tuitionfee` (
  `id` bigint(20) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` longtext NOT NULL,
  `level_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `index_tuitionfee`
--

INSERT INTO `index_tuitionfee` (`id`, `price`, `description`, `level_id`) VALUES
(1, 450.00, '', 1),
(2, 600.00, '', 2),
(3, 800.00, '', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_profile`
--
ALTER TABLE `account_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `index_academicprogram`
--
ALTER TABLE `index_academicprogram`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `index_access`
--
ALTER TABLE `index_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_access_menu_id_d8575310_fk_index_menu_id` (`menu_id`),
  ADD KEY `index_access_role_id_74a2b6a3_fk_index_role_id` (`role_id`);

--
-- Indexes for table `index_contact`
--
ALTER TABLE `index_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `index_department`
--
ALTER TABLE `index_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `index_expired`
--
ALTER TABLE `index_expired`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `index_formreg`
--
ALTER TABLE `index_formreg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `index_level`
--
ALTER TABLE `index_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `index_major`
--
ALTER TABLE `index_major`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_major_department_id_b249c75d_fk_index_department_id` (`department_id`);

--
-- Indexes for table `index_married`
--
ALTER TABLE `index_married`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `index_menu`
--
ALTER TABLE `index_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `index_payment`
--
ALTER TABLE `index_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `index_ratings`
--
ALTER TABLE `index_ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `index_register`
--
ALTER TABLE `index_register`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_register_Apply_For_id_aaff5aa4_fk_index_level_id` (`Apply_For_id`),
  ADD KEY `index_register_Emergency_Contact_Re_1fceafba_fk_index_rel` (`Emergency_Contact_Relation_id`),
  ADD KEY `index_register_Major_id_12b6a3b2_fk_index_major_id` (`Major_id`),
  ADD KEY `index_register_Marital_Status_id_02f83833_fk_index_married_id` (`Marital_Status_id`),
  ADD KEY `index_register_Payment_Method_id_c428cbfd_fk_index_payment_id` (`Payment_Method_id`),
  ADD KEY `index_register_Sex_id_17455f49_fk_index_sex_id` (`Sex_id`),
  ADD KEY `index_register_Shift_id_14192c75_fk_index_shift_id` (`Shift_id`);

--
-- Indexes for table `index_relationship`
--
ALTER TABLE `index_relationship`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `index_role`
--
ALTER TABLE `index_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `index_sex`
--
ALTER TABLE `index_sex`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `index_shift`
--
ALTER TABLE `index_shift`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `index_status`
--
ALTER TABLE `index_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `index_subject`
--
ALTER TABLE `index_subject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_subject_level_id_e8a72363_fk_index_level_id` (`level_id`),
  ADD KEY `index_subject_title_id_a2039145_fk_index_major_id` (`title_id`);

--
-- Indexes for table `index_subscribe`
--
ALTER TABLE `index_subscribe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `index_tuitionfee`
--
ALTER TABLE `index_tuitionfee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_tuitionfee_level_id_389adbf7_fk_index_level_id` (`level_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_profile`
--
ALTER TABLE `account_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `index_academicprogram`
--
ALTER TABLE `index_academicprogram`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `index_access`
--
ALTER TABLE `index_access`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `index_contact`
--
ALTER TABLE `index_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `index_department`
--
ALTER TABLE `index_department`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `index_expired`
--
ALTER TABLE `index_expired`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `index_formreg`
--
ALTER TABLE `index_formreg`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `index_level`
--
ALTER TABLE `index_level`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `index_major`
--
ALTER TABLE `index_major`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `index_married`
--
ALTER TABLE `index_married`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `index_menu`
--
ALTER TABLE `index_menu`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `index_payment`
--
ALTER TABLE `index_payment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `index_ratings`
--
ALTER TABLE `index_ratings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `index_register`
--
ALTER TABLE `index_register`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `index_relationship`
--
ALTER TABLE `index_relationship`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `index_role`
--
ALTER TABLE `index_role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `index_sex`
--
ALTER TABLE `index_sex`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `index_shift`
--
ALTER TABLE `index_shift`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `index_status`
--
ALTER TABLE `index_status`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `index_subject`
--
ALTER TABLE `index_subject`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `index_subscribe`
--
ALTER TABLE `index_subscribe`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `index_tuitionfee`
--
ALTER TABLE `index_tuitionfee`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_profile`
--
ALTER TABLE `account_profile`
  ADD CONSTRAINT `account_profile_user_id_bdd52018_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `index_access`
--
ALTER TABLE `index_access`
  ADD CONSTRAINT `index_access_menu_id_d8575310_fk_index_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `index_menu` (`id`),
  ADD CONSTRAINT `index_access_role_id_74a2b6a3_fk_index_role_id` FOREIGN KEY (`role_id`) REFERENCES `index_role` (`id`);

--
-- Constraints for table `index_major`
--
ALTER TABLE `index_major`
  ADD CONSTRAINT `index_major_department_id_b249c75d_fk_index_department_id` FOREIGN KEY (`department_id`) REFERENCES `index_department` (`id`);

--
-- Constraints for table `index_register`
--
ALTER TABLE `index_register`
  ADD CONSTRAINT `index_register_Apply_For_id_aaff5aa4_fk_index_level_id` FOREIGN KEY (`Apply_For_id`) REFERENCES `index_level` (`id`),
  ADD CONSTRAINT `index_register_Emergency_Contact_Re_1fceafba_fk_index_rel` FOREIGN KEY (`Emergency_Contact_Relation_id`) REFERENCES `index_relationship` (`id`),
  ADD CONSTRAINT `index_register_Major_id_12b6a3b2_fk_index_major_id` FOREIGN KEY (`Major_id`) REFERENCES `index_major` (`id`),
  ADD CONSTRAINT `index_register_Marital_Status_id_02f83833_fk_index_married_id` FOREIGN KEY (`Marital_Status_id`) REFERENCES `index_married` (`id`),
  ADD CONSTRAINT `index_register_Payment_Method_id_c428cbfd_fk_index_payment_id` FOREIGN KEY (`Payment_Method_id`) REFERENCES `index_payment` (`id`),
  ADD CONSTRAINT `index_register_Sex_id_17455f49_fk_index_sex_id` FOREIGN KEY (`Sex_id`) REFERENCES `index_sex` (`id`),
  ADD CONSTRAINT `index_register_Shift_id_14192c75_fk_index_shift_id` FOREIGN KEY (`Shift_id`) REFERENCES `index_shift` (`id`);

--
-- Constraints for table `index_subject`
--
ALTER TABLE `index_subject`
  ADD CONSTRAINT `index_subject_level_id_e8a72363_fk_index_level_id` FOREIGN KEY (`level_id`) REFERENCES `index_level` (`id`),
  ADD CONSTRAINT `index_subject_title_id_a2039145_fk_index_major_id` FOREIGN KEY (`title_id`) REFERENCES `index_major` (`id`);

--
-- Constraints for table `index_tuitionfee`
--
ALTER TABLE `index_tuitionfee`
  ADD CONSTRAINT `index_tuitionfee_level_id_389adbf7_fk_index_level_id` FOREIGN KEY (`level_id`) REFERENCES `index_level` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

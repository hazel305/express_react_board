-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 23-10-09 07:33
-- 서버 버전: 10.4.28-MariaDB
-- PHP 버전: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `react_bbs`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `board`
--

CREATE TABLE `board` (
  `BOARD_ID` int(11) NOT NULL,
  `BOARD_TITLE` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BOARD_CONTENT` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REGISTER_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REGISTER_DATE` datetime DEFAULT current_timestamp(),
  `UPDATER_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPDATER_DATE` datetime DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 테이블의 덤프 데이터 `board`
--

INSERT INTO `board` (`BOARD_ID`, `BOARD_TITLE`, `BOARD_CONTENT`, `REGISTER_ID`, `REGISTER_DATE`, `UPDATER_ID`, `UPDATER_DATE`) VALUES
(1, '제목1', '내용1', 'admin', '2023-10-06 12:17:00', NULL, '2023-10-06 12:17:00'),
(2, '제목2', '내용2', 'admin', '2023-10-06 12:17:00', NULL, '2023-10-06 12:17:00'),
(3, '제목3', '내용3', 'admin', '2023-10-06 12:17:00', NULL, '2023-10-06 12:17:00'),
(4, 'test1', 'test11', 'admin', '2023-10-09 13:54:42', NULL, '2023-10-09 13:54:42');

-- --------------------------------------------------------

--
-- 테이블 구조 `requested`
--
-- react_bbs.requested 테이블의 테이블 구조를 읽어오지 못함: #1932 - Table 'react_bbs.requested' doesn't exist in engine
-- react_bbs.requested테이블의 데이터 읽기 오류: #1064 - 'SQL 구문에 오류가 있습니다.' 에러 같습니다. ('FROM `react_bbs`.`requested`' 명령어 라인 1)

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `board`
--
ALTER TABLE `board`
  ADD PRIMARY KEY (`BOARD_ID`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `board`
--
ALTER TABLE `board`
  MODIFY `BOARD_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

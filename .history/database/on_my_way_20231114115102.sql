-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Oct 29, 2023 at 03:09 AM
-- Server version: 8.2.0
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `on_my_way`
--

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_pl_0900_as_cs;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `problem` varchar(512) COLLATE utf8mb4_pl_0900_as_cs NOT NULL,
  `need` varchar(512) COLLATE utf8mb4_pl_0900_as_cs NOT NULL,
  `is_completed` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_pl_0900_as_cs;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `problem`, `need`, `is_completed`, `is_active`) VALUES
(15, 15, 'Jestem po operacji kolana. Mam utrudnione chodzenie.', 'Pomoc w kupnie 1 zgrzewki wody', 0, 0),
(16, 15, 'Jestem po operacji kolana. Mam utrudnione poruszanie.', 'Wyprowadzenie psa', 0, 0),
(17, 14, 'Jeżdzę na wózku inwalidzkim', 'Pomoc w dostarczeniu przesyłki z poczty', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_pl_0900_as_cs NOT NULL,
  `surname` varchar(64) COLLATE utf8mb4_pl_0900_as_cs NOT NULL,
  `email` varchar(128) COLLATE utf8mb4_pl_0900_as_cs NOT NULL,
  `login` varchar(128) COLLATE utf8mb4_pl_0900_as_cs NOT NULL,
  `password` varchar(512) COLLATE utf8mb4_pl_0900_as_cs NOT NULL,
  `city` varchar(128) COLLATE utf8mb4_pl_0900_as_cs NOT NULL,
  `address` varchar(128) COLLATE utf8mb4_pl_0900_as_cs NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_pl_0900_as_cs;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `email`, `login`, `password`, `city`, `address`) VALUES
(14, 'Jan', 'Kowalski', 'j.kowalski@gmail.com', 'JKowalski', '202cb962ac59075b964b07152d234b70', 'Wrocław', 'Legnicka 34/7a'),
(15, 'Oliwer', 'Nowak', 'o.nowak@gmail.com', 'Oliwer12', '202cb962ac59075b964b07152d234b70', 'Kołobrzeg', 'Warszawska 13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
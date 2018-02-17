-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 17. Feb 2018 um 15:35
-- Server-Version: 10.1.30-MariaDB
-- PHP-Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr11_irene_theiss_php_car_rental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur f√ºr Tabelle `branch_office`
--

CREATE TABLE `branch_office` (
  `id` int(10) UNSIGNED NOT NULL,
  `office_name` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_nr` varchar(20) NOT NULL,
  `street` varchar(100) DEFAULT NULL,
  `street_nr` varchar(6) DEFAULT NULL,
  `district` varchar(4) DEFAULT NULL,
  `fk_location_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten f√ºr Tabelle `branch_office`
--

INSERT INTO `branch_office` (`id`, `office_name`, `email`, `phone_nr`, `street`, `street_nr`, `district`, `fk_location_id`) VALUES
(1, 'Office Wien 3', 'carrental_v3@carrental.com', '699/129867', 'Landstra√üer Haupstra√üe', '44', '1030', 1),
(2, 'Office Wien 1', 'carrental_v1@carrental.com', '699/1298312', 'K√§rntner Ring', '7', '1010', 2),
(3, 'Office Wien 16', 'carrental_gv16@carrental.com', '699/986512', 'Wattgasse', '56', '1160', 3),
(4, 'Office Wien 7', 'carrental_gv7@carrental.com', '699/999763', 'Lindengasse', '5', '1070', 7);

-- --------------------------------------------------------

--
-- Tabellenstruktur f√ºr Tabelle `brand`
--

CREATE TABLE `brand` (
  `id` int(10) UNSIGNED NOT NULL,
  `brandname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten f√ºr Tabelle `brand`
--

INSERT INTO `brand` (`id`, `brandname`) VALUES
(1, 'VW'),
(2, 'Opel'),
(3, 'BMW'),
(4, 'Tesla');

-- --------------------------------------------------------

--
-- Tabellenstruktur f√ºr Tabelle `car`
--

CREATE TABLE `car` (
  `id` int(10) UNSIGNED NOT NULL,
  `license_nr` varchar(20) NOT NULL,
  `kilometer_status` int(10) UNSIGNED NOT NULL,
  `ps` int(10) UNSIGNED NOT NULL,
  `circuit` enum('hand','automatic') DEFAULT 'hand',
  `prod_year` year(4) NOT NULL,
  `air_condition` enum('true','false') DEFAULT 'false',
  `num_seats` tinyint(10) NOT NULL,
  `num_doors` tinyint(5) NOT NULL,
  `price_per_day` double NOT NULL,
  `fk_model_id` int(10) UNSIGNED NOT NULL,
  `fk_brand_id` int(10) UNSIGNED NOT NULL,
  `fk_location_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten f√ºr Tabelle `car`
--

INSERT INTO `car` (`id`, `license_nr`, `kilometer_status`, `ps`, `circuit`, `prod_year`, `air_condition`, `num_seats`, `num_doors`, `price_per_day`, `fk_model_id`, `fk_brand_id`, `fk_location_id`) VALUES
(1, 'W1234', 12000, 100, 'hand', 2000, 'false', 5, 5, 85.7, 1, 1, 4),
(2, 'W4321', 45000, 110, 'automatic', 2010, 'true', 4, 3, 99.7, 2, 2, 5),
(3, 'W9807', 8000, 130, 'hand', 2012, 'true', 5, 5, 105.7, 3, 3, 6),
(4, 'W9807', 14000, 100, 'automatic', 2014, 'false', 5, 5, 99.8, 4, 1, 1),
(5, 'W7765', 25000, 200, 'automatic', 2015, 'true', 5, 3, 110.8, 1, 3, 2),
(6, 'W2243', 11000, 230, 'hand', 2016, 'true', 5, 5, 210.9, 1, 4, 2),
(7, 'WH765', 7000, 200, 'hand', 2012, 'false', 5, 3, 75.9, 2, 1, 2),
(8, 'WB7Z2', 3700, 180, 'hand', 2002, 'true', 5, 5, 85.9, 3, 4, 1),
(9, 'W54RE', 30000, 140, 'automatic', 2005, 'true', 5, 3, 88.9, 4, 3, 3),
(10, 'W9IG6', 75000, 160, 'hand', 2007, 'true', 5, 5, 99.9, 2, 1, 3),
(11, 'W89ZU', 98200, 180, 'hand', 2011, 'true', 5, 5, 105.9, 3, 2, 7),
(12, 'W44ES', 12700, 120, 'hand', 2009, 'false', 5, 3, 103.9, 4, 3, 7);

-- --------------------------------------------------------

--
-- Tabellenstruktur f√ºr Tabelle `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `salutation` enum('Ms','Mr','Mrs') DEFAULT NULL,
  `firstname` varchar(55) NOT NULL,
  `lastname` varchar(55) NOT NULL,
  `birthdate` date NOT NULL,
  `phone_nr` varchar(55) DEFAULT NULL,
  `drivers_license_nr` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten f√ºr Tabelle `customer`
--

INSERT INTO `customer` (`id`, `username`, `pwd`, `email`, `salutation`, `firstname`, `lastname`, `birthdate`, `phone_nr`, `drivers_license_nr`, `created_at`) VALUES
(1, 'testuser1', '$2y$10$41UCfabFdgaYz4h0dEWeO.tuOefScad84vUeXcDH5FjvfNWNEjmau', 'dummy1@gmx.at', 'Ms', 'Maria', 'Muster', '1970-12-13', '650/676767', '12341234B', '2018-02-16 16:52:45'),
(2, 'testuser2', '$2y$10$41UCfabFdgaYz4h0dEWeO.tuOefScad84vUeXcDH5FjvfNWNEjmau', 'dummy2@gmx.at', 'Mr', 'Herbert', 'Herbst', '1966-04-09', '676/8654', '43214321A', '2018-02-16 16:52:45'),
(3, 'testuser3', '$2y$10$41UCfabFdgaYz4h0dEWeO.tuOefScad84vUeXcDH5FjvfNWNEjmau', 'dummy3@gmx.at', 'Mrs', 'Ludmilla', 'Lodenmantel', '1993-10-31', '676/098707', '98769876C', '2018-02-16 16:52:45');

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `getcarcountandoffices`
-- (Siehe unten f√ºr die tats√§chliche Ansicht)
--
CREATE TABLE `getcarcountandoffices` (
`id` int(10) unsigned
,`office_name` varchar(20)
,`email` varchar(100)
,`phone` varchar(24)
,`Address` varchar(107)
,`disctrict` varchar(9)
,`Coordinates` longtext
,`carcount` bigint(21)
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `getcarswithlocation`
-- (Siehe unten f√ºr die tats√§chliche Ansicht)
--
CREATE TABLE `getcarswithlocation` (
`id` int(10) unsigned
,`license_nr` varchar(20)
,`Age` int(5) unsigned
,`ps` int(10) unsigned
,`circuit` enum('hand','automatic')
,`air_condition` enum('true','false')
,`num_seats` tinyint(10)
,`num_doors` tinyint(5)
,`car_type` varchar(20)
,`brandname` varchar(20)
,`price_per_day` double
,`office_name` varchar(20)
,`Coordinates` longtext
);

-- --------------------------------------------------------

--
-- Tabellenstruktur f√ºr Tabelle `location`
--

CREATE TABLE `location` (
  `id` int(10) UNSIGNED NOT NULL,
  `coord` geometry NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten f√ºr Tabelle `location`
--

INSERT INTO `location` (`id`, `coord`, `created_at`) VALUES
(1, '\0\0\0\0\0\0\02Â˙H@ÂBÂ_Àc0@', '2018-02-16 16:52:44'),
(2, '\0\0\0\0\0\0\0ëÓÁ‰H@GõÙ_0@', '2018-02-16 16:52:44'),
(3, '\0\0\0\0\0\0\0S‰µ∑\0H@NSdR0@', '2018-02-16 16:52:44'),
(4, '\0\0\0\0\0\0\0ªË–é¿H@„+À!ÛR0@', '2018-02-16 16:52:44'),
(5, '\0\0\0\0\0\0\0´I¶˘H@+‚œK X0@', '2018-02-16 16:52:44'),
(6, '\0\0\0\0\0\0\0ZßÄjrH@ƒêAS0@', '2018-02-16 16:52:44'),
(7, '\0\0\0\0\0\0\0t≤‘zøH@çËCºZ0@', '2018-02-16 16:52:44');

-- --------------------------------------------------------

--
-- Tabellenstruktur f√ºr Tabelle `model`
--

CREATE TABLE `model` (
  `id` int(10) UNSIGNED NOT NULL,
  `car_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten f√ºr Tabelle `model`
--

INSERT INTO `model` (`id`, `car_type`) VALUES
(1, 'Limousine'),
(2, 'Kombi'),
(3, 'SUV'),
(4, 'Minibus');

-- --------------------------------------------------------

--
-- Tabellenstruktur f√ºr Tabelle `reservation`
--

CREATE TABLE `reservation` (
  `id` int(10) UNSIGNED NOT NULL,
  `fk_customer_id` int(10) UNSIGNED NOT NULL,
  `fk_car_id` int(10) UNSIGNED NOT NULL,
  `fk_pickup_office_id` int(10) UNSIGNED NOT NULL,
  `fk_return_office_id` int(10) UNSIGNED NOT NULL,
  `pickup_date` date NOT NULL,
  `return_date` date NOT NULL,
  `pickup_time` time NOT NULL,
  `return_time` time NOT NULL,
  `cancel_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten f√ºr Tabelle `reservation`
--

INSERT INTO `reservation` (`id`, `fk_customer_id`, `fk_car_id`, `fk_pickup_office_id`, `fk_return_office_id`, `pickup_date`, `return_date`, `pickup_time`, `return_time`, `cancel_date`) VALUES
(1, 1, 1, 3, 3, '2018-01-21', '2018-01-22', '09:00:00', '12:00:00', NULL),
(2, 2, 2, 1, 2, '2018-02-02', '2018-02-06', '10:00:00', '13:00:00', NULL),
(3, 3, 3, 2, 3, '2018-04-02', '2018-02-07', '08:00:00', '10:00:00', NULL);

-- --------------------------------------------------------

--
-- Struktur des Views `getcarcountandoffices`
--
DROP TABLE IF EXISTS `getcarcountandoffices`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `getcarcountandoffices`  AS  select `branch_office`.`id` AS `id`,`branch_office`.`office_name` AS `office_name`,`branch_office`.`email` AS `email`,concat('+43 ',`branch_office`.`phone_nr`) AS `phone`,concat(`branch_office`.`street`,' ',`branch_office`.`street_nr`) AS `Address`,concat(`branch_office`.`district`,' Wien') AS `disctrict`,st_astext(`location`.`coord`) AS `Coordinates`,count(`car`.`license_nr`) AS `carcount` from ((`branch_office` left join `location` on((`branch_office`.`fk_location_id` = `location`.`id`))) left join `car` on((`location`.`id` = `car`.`fk_location_id`))) group by `branch_office`.`office_name` order by `branch_office`.`district` ;

-- --------------------------------------------------------

--
-- Struktur des Views `getcarswithlocation`
--
DROP TABLE IF EXISTS `getcarswithlocation`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `getcarswithlocation`  AS  select `car`.`id` AS `id`,`car`.`license_nr` AS `license_nr`,(extract(year from curdate()) - `car`.`prod_year`) AS `Age`,`car`.`ps` AS `ps`,`car`.`circuit` AS `circuit`,`car`.`air_condition` AS `air_condition`,`car`.`num_seats` AS `num_seats`,`car`.`num_doors` AS `num_doors`,`model`.`car_type` AS `car_type`,`brand`.`brandname` AS `brandname`,`car`.`price_per_day` AS `price_per_day`,`branch_office`.`office_name` AS `office_name`,st_astext(`location`.`coord`) AS `Coordinates` from ((((`car` left join `location` on((`car`.`fk_location_id` = `location`.`id`))) left join `branch_office` on((`location`.`id` = `branch_office`.`fk_location_id`))) join `model` on((`car`.`fk_model_id` = `model`.`id`))) join `brand` on((`car`.`fk_brand_id` = `brand`.`id`))) order by `car`.`license_nr` ;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes f√ºr die Tabelle `branch_office`
--
ALTER TABLE `branch_office`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_branch_office__location` (`fk_location_id`);

--
-- Indizes f√ºr die Tabelle `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indizes f√ºr die Tabelle `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_car_model` (`fk_model_id`),
  ADD KEY `fk_car_brand` (`fk_brand_id`),
  ADD KEY `fk_car_location` (`fk_location_id`);

--
-- Indizes f√ºr die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indizes f√ºr die Tabelle `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indizes f√ºr die Tabelle `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`id`);

--
-- Indizes f√ºr die Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_reservation_customer` (`fk_customer_id`),
  ADD KEY `fk_reservation_car` (`fk_car_id`),
  ADD KEY `fk_reservation__branch_office_pickup` (`fk_pickup_office_id`),
  ADD KEY `fk_reservation__branch_office_return` (`fk_return_office_id`);

--
-- AUTO_INCREMENT f√ºr exportierte Tabellen
--

--
-- AUTO_INCREMENT f√ºr Tabelle `branch_office`
--
ALTER TABLE `branch_office`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT f√ºr Tabelle `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT f√ºr Tabelle `car`
--
ALTER TABLE `car`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT f√ºr Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT f√ºr Tabelle `location`
--
ALTER TABLE `location`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT f√ºr Tabelle `model`
--
ALTER TABLE `model`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT f√ºr Tabelle `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `branch_office`
--
ALTER TABLE `branch_office`
  ADD CONSTRAINT `fk_branch_office__location` FOREIGN KEY (`fk_location_id`) REFERENCES `location` (`id`);

--
-- Constraints der Tabelle `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `fk_car_brand` FOREIGN KEY (`fk_brand_id`) REFERENCES `brand` (`id`),
  ADD CONSTRAINT `fk_car_location` FOREIGN KEY (`fk_location_id`) REFERENCES `location` (`id`),
  ADD CONSTRAINT `fk_car_model` FOREIGN KEY (`fk_model_id`) REFERENCES `model` (`id`);

--
-- Constraints der Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `fk_reservation__branch_office_pickup` FOREIGN KEY (`fk_pickup_office_id`) REFERENCES `branch_office` (`id`),
  ADD CONSTRAINT `fk_reservation__branch_office_return` FOREIGN KEY (`fk_return_office_id`) REFERENCES `branch_office` (`id`),
  ADD CONSTRAINT `fk_reservation_car` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`id`),
  ADD CONSTRAINT `fk_reservation_customer` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mar 14, 2020 alle 12:35
-- Versione del server: 10.4.11-MariaDB
-- Versione PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_fulvia_marai_delivery`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `fk_city_id` int(11) NOT NULL,
  `street` varchar(30) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `zone` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `address`
--

INSERT INTO `address` (`address_id`, `fk_city_id`, `street`, `number`, `zone`) VALUES
(1, 1, 'Via Pratomaggiore', 326, NULL),
(2, 2, 'via Giuseppe di Vittorio', NULL, 'industriale Brescia'),
(3, 3, 'Piazza delle Erbe', 12, NULL),
(4, 4, 'Wehlistrasse', 325, NULL),
(5, 5, 'Via dei Signori', 123, NULL),
(6, 6, 'Briennerstraße', 25, NULL),
(7, 2, 'Via Capanello', 7, NULL),
(8, 5, 'Via Saltafosso per lungo', 55, NULL),
(9, 3, 'Via Supermario', 13, NULL),
(10, 4, 'Mariahilfenstrasse', 368, NULL),
(11, 3, 'Via Carletto', 12, ''),
(12, 6, 'Wehlistrasse', 12, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `city`
--

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `cap` int(11) NOT NULL,
  `nation` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `city`
--

INSERT INTO `city` (`city_id`, `name`, `cap`, `nation`) VALUES
(1, 'Rivoltella', 25015, 'Italy'),
(2, 'Brescia', 25121, 'Italy'),
(3, 'Verona', 37100, 'Italy'),
(4, 'Vienna', 1010, 'Austria'),
(5, 'Venezia', 30100, 'Italy'),
(6, 'München', 80331, 'Germany');

-- --------------------------------------------------------

--
-- Struttura della tabella `contract`
--

CREATE TABLE `contract` (
  `contract_id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `task` varchar(20) NOT NULL,
  `hire_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `contract`
--

INSERT INTO `contract` (`contract_id`, `type`, `task`, `hire_date`) VALUES
(1, 'permanent', 'receptionist', '0000-00-00'),
(2, 'fixed-term', 'sorter', '0000-00-00'),
(3, 'fixed-term', 'driver', '0000-00-00'),
(4, 'part-time', 'receptionist', '0000-00-00'),
(5, 'fixed-term', 'driver', '0000-00-00'),
(6, 'apprenticeship', 'sorter', '0000-00-00');

-- --------------------------------------------------------

--
-- Struttura della tabella `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `fk_address_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `telephone` int(11) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `customer`
--

INSERT INTO `customer` (`customer_id`, `fk_address_id`, `name`, `surname`, `telephone`, `email`) VALUES
(1, 1, 'Fulvia', 'Marai', 681844593, 'marai@libero.it'),
(2, 3, 'Ermenegildo', 'Vittori', 309901800, 'vittoriE@gmail.com'),
(3, 5, 'Serenella', 'DeMaris', 399872987, 'lucola@gmail.com');

-- --------------------------------------------------------

--
-- Struttura della tabella `delivery_process`
--

CREATE TABLE `delivery_process` (
  `delivery_id` int(11) NOT NULL,
  `fk_package_id` int(11) NOT NULL,
  `fk_position_id` int(11) NOT NULL,
  `date_hour` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `delivery_process`
--

INSERT INTO `delivery_process` (`delivery_id`, `fk_package_id`, `fk_position_id`, `date_hour`) VALUES
(1, 1, 1, '2020-03-12 22:30:00'),
(2, 2, 2, '2020-03-13 10:06:05'),
(3, 3, 3, '2020-03-13 20:25:57'),
(4, 4, 4, '2020-03-13 16:28:10');

-- --------------------------------------------------------

--
-- Struttura della tabella `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `fk_contract_id` int(11) NOT NULL,
  `fk_address_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `telephone` int(11) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `employee`
--

INSERT INTO `employee` (`employee_id`, `fk_contract_id`, `fk_address_id`, `name`, `surname`, `telephone`, `email`) VALUES
(1, 1, 2, 'Marcella', 'Bella', 284759356, 'nonsonounasignora@gmail.com'),
(2, 2, 1, 'Costanzo', 'Maurizio', 258476365, 'MCshow@gmail.com'),
(3, 3, 9, 'Clementina', 'De´Mulino', 123476475, 'mulinobianco@gmail.com'),
(4, 4, 7, 'Gianluca', 'Canicola', 1342536475, 'Baubau@gmail.com'),
(5, 5, 8, 'Carlo', 'Musica', 12345987, 'violino@gmail.com'),
(6, 6, 9, 'Luigi', 'Mario', 318445934, 'super@gmail.com');

-- --------------------------------------------------------

--
-- Struttura della tabella `facility`
--

CREATE TABLE `facility` (
  `facility_id` int(11) NOT NULL,
  `fk_address_id` int(11) NOT NULL,
  `fk_employee_id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `facility`
--

INSERT INTO `facility` (`facility_id`, `fk_address_id`, `fk_employee_id`, `name`) VALUES
(1, 2, 1, 'Filiale di Brescia'),
(2, 9, 2, 'Filiale di S.Luca e Paolo'),
(3, 4, 3, 'Sede interna');

-- --------------------------------------------------------

--
-- Struttura della tabella `package`
--

CREATE TABLE `package` (
  `package_id` int(11) NOT NULL,
  `fk_customer_id` int(11) NOT NULL,
  `fk_address_id` int(11) NOT NULL,
  `type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `package`
--

INSERT INTO `package` (`package_id`, `fk_customer_id`, `fk_address_id`, `type`) VALUES
(1, 1, 4, 'flat package'),
(2, 2, 6, 'envelope'),
(3, 3, 10, 'catalogue'),
(4, 1, 4, 'catalogue');

-- --------------------------------------------------------

--
-- Struttura della tabella `position`
--

CREATE TABLE `position` (
  `position_id` int(11) NOT NULL,
  `fk_facility_id` int(11) NOT NULL,
  `fk_status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `position`
--

INSERT INTO `position` (`position_id`, `fk_facility_id`, `fk_status_id`) VALUES
(1, 1, 3),
(2, 2, 2),
(3, 3, 5),
(4, 3, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `status`
--

CREATE TABLE `status` (
  `status_id` int(11) NOT NULL,
  `status` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `status`
--

INSERT INTO `status` (`status_id`, `status`) VALUES
(1, 'Delivered'),
(2, 'Delivering'),
(3, 'processing'),
(4, 'in stock'),
(5, 'refused'),
(6, 'approved');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `fk_city_id` (`fk_city_id`);

--
-- Indici per le tabelle `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`);

--
-- Indici per le tabelle `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`contract_id`);

--
-- Indici per le tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_address_id` (`fk_address_id`);

--
-- Indici per le tabelle `delivery_process`
--
ALTER TABLE `delivery_process`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `fk_package_id` (`fk_package_id`),
  ADD KEY `fk_position_id` (`fk_position_id`);

--
-- Indici per le tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `fk_contract_id` (`fk_contract_id`),
  ADD KEY `fk_address_id` (`fk_address_id`);

--
-- Indici per le tabelle `facility`
--
ALTER TABLE `facility`
  ADD PRIMARY KEY (`facility_id`),
  ADD KEY `fk_address_id` (`fk_address_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indici per le tabelle `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_address_id` (`fk_address_id`);

--
-- Indici per le tabelle `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`position_id`),
  ADD KEY `fk_status_id` (`fk_status_id`),
  ADD KEY `fk_facility_id` (`fk_facility_id`);

--
-- Indici per le tabelle `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`fk_city_id`) REFERENCES `city` (`city_id`);

--
-- Limiti per la tabella `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);

--
-- Limiti per la tabella `delivery_process`
--
ALTER TABLE `delivery_process`
  ADD CONSTRAINT `delivery_process_ibfk_1` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `delivery_process_ibfk_2` FOREIGN KEY (`fk_position_id`) REFERENCES `position` (`position_id`);

--
-- Limiti per la tabella `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fk_contract_id`) REFERENCES `contract` (`contract_id`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);

--
-- Limiti per la tabella `facility`
--
ALTER TABLE `facility`
  ADD CONSTRAINT `facility_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `facility_ibfk_2` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Limiti per la tabella `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `package_ibfk_2` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);

--
-- Limiti per la tabella `position`
--
ALTER TABLE `position`
  ADD CONSTRAINT `position_ibfk_1` FOREIGN KEY (`fk_status_id`) REFERENCES `status` (`status_id`),
  ADD CONSTRAINT `position_ibfk_2` FOREIGN KEY (`fk_facility_id`) REFERENCES `facility` (`facility_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

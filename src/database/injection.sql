-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 18. Dez 2017 um 13:20
-- Server-Version: 10.1.28-MariaDB
-- PHP-Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `injection`
--
CREATE DATABASE IF NOT EXISTS `injection` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `injection`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_bestellungen`
--

CREATE TABLE `tbl_bestellungen` (
  `bestellnr` int(11) NOT NULL,
  `datum` date NOT NULL,
  `fk_produkt` int(255) NOT NULL,
  `fk_erfasser` int(255) NOT NULL,
  `anzahl` int(255) NOT NULL,
  `kommentar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_kategorie`
--

CREATE TABLE `tbl_kategorie` (
  `id_kategorie` int(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_produkte`
--

CREATE TABLE `tbl_produkte` (
  `id_produkt` int(255) NOT NULL,
  `titel` varchar(255) NOT NULL,
  `beschreibung` varchar(255) NOT NULL,
  `menge` int(255) NOT NULL,
  `preis` decimal(65,0) NOT NULL,
  `fk_kategorie` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(11) NOT NULL,
  `benutzername` varchar(255) NOT NULL,
  `passwort` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `tbl_bestellungen`
--
ALTER TABLE `tbl_bestellungen`
  ADD PRIMARY KEY (`bestellnr`),
  ADD KEY `fk_produkt` (`fk_produkt`),
  ADD KEY `fk_erfasser` (`fk_erfasser`);

--
-- Indizes für die Tabelle `tbl_kategorie`
--
ALTER TABLE `tbl_kategorie`
  ADD PRIMARY KEY (`id_kategorie`);

--
-- Indizes für die Tabelle `tbl_produkte`
--
ALTER TABLE `tbl_produkte`
  ADD PRIMARY KEY (`id_produkt`),
  ADD KEY `fk_kategorie` (`fk_kategorie`);

--
-- Indizes für die Tabelle `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `tbl_bestellungen`
--
ALTER TABLE `tbl_bestellungen`
  MODIFY `bestellnr` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `tbl_kategorie`
--
ALTER TABLE `tbl_kategorie`
  MODIFY `id_kategorie` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `tbl_produkte`
--
ALTER TABLE `tbl_produkte`
  MODIFY `id_produkt` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `tbl_bestellungen`
--
ALTER TABLE `tbl_bestellungen`
  ADD CONSTRAINT `tbl_bestellungen_ibfk_1` FOREIGN KEY (`fk_produkt`) REFERENCES `tbl_produkte` (`id_produkt`),
  ADD CONSTRAINT `tbl_bestellungen_ibfk_2` FOREIGN KEY (`fk_erfasser`) REFERENCES `tbl_user` (`id_user`);

--
-- Constraints der Tabelle `tbl_produkte`
--
ALTER TABLE `tbl_produkte`
  ADD CONSTRAINT `tbl_produkte_ibfk_1` FOREIGN KEY (`fk_kategorie`) REFERENCES `tbl_kategorie` (`id_kategorie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

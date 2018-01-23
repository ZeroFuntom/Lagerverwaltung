-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 22. Jan 2018 um 11:45
-- Server-Version: 10.1.16-MariaDB
-- PHP-Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `m151_lagerverwaltung`
--
CREATE DATABASE IF NOT EXISTS `m151_lagerverwaltung_t` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `m151_lagerverwaltung_t`;



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
  `fk_status` int(11) NOT NULL,
  `kommentar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `tbl_bestellungen`
--



-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_kategorie`
--

CREATE TABLE `tbl_kategorie` (
  `id_kategorie` int(255) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `tbl_kategorie`
--



-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_produkte`
--

CREATE TABLE `tbl_produkte` (
  `id_produkt` int(255) NOT NULL,
  `titel` varchar(50) NOT NULL,
  `beschreibung` varchar(255) NOT NULL,
  `menge` int(255) NOT NULL,
  `preis` decimal(65,0) NOT NULL,
  `fk_kategorie` int(255) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `tbl_produkte`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_status`
--

CREATE TABLE `tbl_status` (
  `id_status` int(11) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `tbl_status`
--



-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(11) NOT NULL,
  `benutzername` varchar(50) NOT NULL,
  `passwort` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `tbl_user`
--



--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `tbl_bestellungen`
--
ALTER TABLE `tbl_bestellungen`
  ADD PRIMARY KEY (`bestellnr`),
  ADD KEY `fk_produkt` (`fk_produkt`),
  ADD KEY `fk_erfasser` (`fk_erfasser`),
  ADD KEY `fk_status` (`fk_status`);

--
-- Indizes für die Tabelle `tbl_kategorie`
--
ALTER TABLE `tbl_kategorie`
  ADD PRIMARY KEY (`id_kategorie`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indizes für die Tabelle `tbl_produkte`
--
ALTER TABLE `tbl_produkte`
  ADD PRIMARY KEY (`id_produkt`),
  ADD UNIQUE KEY `titel` (`titel`),
  ADD KEY `fk_kategorie` (`fk_kategorie`);

--
-- Indizes für die Tabelle `tbl_status`
--
ALTER TABLE `tbl_status`
  ADD PRIMARY KEY (`id_status`),
  ADD UNIQUE KEY `status` (`status`);

--
-- Indizes für die Tabelle `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `benutzername` (`benutzername`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `tbl_bestellungen`
--
ALTER TABLE `tbl_bestellungen`
  MODIFY `bestellnr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT für Tabelle `tbl_kategorie`
--
ALTER TABLE `tbl_kategorie`
  MODIFY `id_kategorie` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT für Tabelle `tbl_produkte`
--
ALTER TABLE `tbl_produkte`
  MODIFY `id_produkt` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT für Tabelle `tbl_status`
--
ALTER TABLE `tbl_status`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT für Tabelle `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 08. Jan 2018 um 13:42
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
CREATE DATABASE IF NOT EXISTS `m151_lagerverwaltung` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `m151_lagerverwaltung`;

DELIMITER $$
--
-- Prozeduren
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getproducts` ()  SELECT id_produkt, titel, beschreibung, menge, preis, link FROM tbl_produkte$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getpurchases` (IN `$userid` INT)  SELECT b.bestellnr, b.datum, b.fk_produkt, b.fk_erfasser, b.anzahl, b.kommentar, p.titel FROM tbl_bestellungen b INNER JOIN tbl_produkte p ON p.id_produkt = b.fk_produkt WHERE fk_erfasser = $userid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `login` (IN `$username` VARCHAR(50))  SELECT id_user, benutzername, passwort FROM tbl_user WHERE benutzername = $username$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updatepurchases` (IN `$id` INT, IN `$comment` VARCHAR(255), IN `$anzahl` INT)  UPDATE tbl_bestellungen SET anzahl = $anzahl, kommentar = $comment WHERE bestellnr = $id$$

DELIMITER ;

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

--
-- Daten für Tabelle `tbl_bestellungen`
--

INSERT INTO `tbl_bestellungen` (`bestellnr`, `datum`, `fk_produkt`, `fk_erfasser`, `anzahl`, `kommentar`) VALUES
(1, '2017-12-18', 1, 1, 3, 'twist'),
(2, '2017-12-18', 3, 1, 12, 'string');

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

INSERT INTO `tbl_kategorie` (`id_kategorie`, `name`) VALUES
(1, 'Hosiery'),
(2, 'Underwear'),
(3, 'Headwear'),
(4, 'Tops'),
(5, 'Bottoms');

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

INSERT INTO `tbl_produkte` (`id_produkt`, `titel`, `beschreibung`, `menge`, `preis`, `fk_kategorie`, `link`) VALUES
(1, 'Socks', 'Warm socks for cold seasons', 20, '49', 1, 'http://www.birkenstock.com/dw/image/v2/BBBF_PRD/on/demandware.static/-/Sites-master-catalog/default/dw114054f1/001/002/452/1002452/1002452.jpg?sw=2000&sh=2000'),
(2, 'Underpants', 'Beautiful underpants for men and women', 20, '89', 2, 'https://cdn.notonthehighstreet.com/system/product_images/images/002/234/517/original_oekotex-hassle-free-boy-underpants.jpg'),
(3, 'Hat', 'A hat is simply a hat', 20, '785', 3, 'https://theuglysweatershop.com/wp-content/uploads/2014/11/Plush-Turkey-Hat-Tacky-Ugly-Thanksgiving-Accessory-2.jpg'),
(4, 'Sweater', 'Make christmas season cozy with this sweater', 20, '1800', 4, 'http://partycity6.scene7.com/is/image/PartyCity/_ml_p2p_pc_badge_taller15?$_ml_p2p_pc_thumb_taller15$&$product=PartyCity/P652754_full'),
(5, 'Shorts', 'Shorts, when man is hot', 20, '1390', 5, 'https://pixel.nymag.com/imgs/fashion/daily/2016/08/02/02-cargo-shorts.w710.h473.jpg');

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

INSERT INTO `tbl_user` (`id_user`, `benutzername`, `passwort`) VALUES
(1, 'cassandra', '$2y$10$uEd4NjmagQ6VmpcJDUcxhOHZQQzz.YhurnXJ1yzIEwP0oiFyiz5Da');

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
  MODIFY `bestellnr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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

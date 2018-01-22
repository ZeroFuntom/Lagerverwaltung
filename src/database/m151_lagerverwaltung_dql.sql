DELIMITER $$
--
-- Prozeduren
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addpurchase` (IN `$datum` DATE, IN `$fk_produkt` INT, IN `$fk_erfasser` INT, IN `$anzahl` INT)  NO SQL
INSERT INTO tbl_bestellungen(datum, fk_produkt, fk_erfasser, anzahl, fk_status, kommentar)
VALUES ($datum, $fk_produkt, $fk_erfasser, $anzahl, 1, '-')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getcurrentstatus` (IN `$id` INT)  SELECT fk_status FROM tbl_bestellungen WHERE bestellnr = $id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getlager` (IN `$id` INT)  NO SQL
SELECT menge FROM tbl_produkte WHERE id_produkt = $id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getproductbyid` (IN `$id` INT)  SELECT id_produkt, titel, beschreibung, menge, preis, link FROM tbl_produkte WHERE id_produkt = $id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getproducts` ()  SELECT id_produkt, titel, beschreibung, menge, preis, link FROM tbl_produkte$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getpurchases` (IN `$userid` INT)  SELECT b.bestellnr, b.datum, b.fk_produkt, b.fk_erfasser, b.anzahl, b.kommentar, p.titel, b.fk_status FROM tbl_bestellungen b INNER JOIN tbl_produkte p ON p.id_produkt = b.fk_produkt WHERE fk_erfasser = $userid
ORDER BY b.datum DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getstatus` ()  SELECT id_status, status FROM tbl_status ORDER BY id_status$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `login` (IN `$username` VARCHAR(50))  SELECT id_user, benutzername, passwort FROM tbl_user WHERE benutzername = $username$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updatepurchases` (IN `$id` INT, IN `$comment` VARCHAR(255), IN `$anzahl` INT, IN `$status` INT)  UPDATE tbl_bestellungen SET anzahl = $anzahl, kommentar = $comment, fk_status = $status WHERE bestellnr = $id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updatequantity` (IN `$id` INT, IN `$menge` INT)  UPDATE tbl_produkte SET menge = $menge WHERE id_produkt = $id$$

DELIMITER ;

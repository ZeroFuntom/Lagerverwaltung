INSERT INTO `tbl_kategorie` (`id_kategorie`, `name`) VALUES
(1, 'Hosiery'),
(2, 'Underwear'),
(3, 'Headwear'),
(4, 'Tops'),
(5, 'Bottoms');

INSERT INTO `tbl_status` (`id_status`, `status`) VALUES
(2, 'bezahlt'),
(1, 'offen');

INSERT INTO `tbl_user` (`id_user`, `benutzername`, `passwort`) VALUES
(1, 'cassandra', '$2y$10$uEd4NjmagQ6VmpcJDUcxhOHZQQzz.YhurnXJ1yzIEwP0oiFyiz5Da');

INSERT INTO `tbl_produkte` (`id_produkt`, `titel`, `beschreibung`, `menge`, `preis`, `fk_kategorie`, `link`) VALUES
(1, 'Socks', 'Warm socks for cold seasons', 0, '49', 1, 'http://www.birkenstock.com/dw/image/v2/BBBF_PRD/on/demandware.static/-/Sites-master-catalog/default/dw114054f1/001/002/452/1002452/1002452.jpg?sw=2000&sh=2000'),
(2, 'Underpants', 'Beautiful underpants for men and women', 20, '89', 2, 'https://cdn.notonthehighstreet.com/system/product_images/images/002/234/517/original_oekotex-hassle-free-boy-underpants.jpg'),
(3, 'Hat', 'A hat is simply a hat', 20, '785', 3, 'https://theuglysweatershop.com/wp-content/uploads/2014/11/Plush-Turkey-Hat-Tacky-Ugly-Thanksgiving-Accessory-2.jpg'),
(4, 'Sweater', 'Make christmas season cozy with this sweater', 17, '1800', 4, 'http://partycity6.scene7.com/is/image/PartyCity/_ml_p2p_pc_badge_taller15?$_ml_p2p_pc_thumb_taller15$&$product=PartyCity/P652754_full'),
(5, 'Shorts', 'Shorts, when man is hot', 0, '1390', 5, 'https://pixel.nymag.com/imgs/fashion/daily/2016/08/02/02-cargo-shorts.w710.h473.jpg');


INSERT INTO `tbl_bestellungen` (`bestellnr`, `datum`, `fk_produkt`, `fk_erfasser`, `anzahl`, `fk_status`, `kommentar`) VALUES
(1, '2017-12-18', 1, 1, 2, 2, '-'),
(18, '2018-01-22', 1, 1, 69, 1, '-');

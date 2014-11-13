-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Machine: 127.0.0.1
-- Genereertijd: 13 nov 2014 om 05:59
-- Serverversie: 5.5.32
-- PHP-versie: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databank: `ing`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `access`
--

CREATE TABLE IF NOT EXISTS `access` (
  `id` int(11) unsigned NOT NULL,
  `target` int(11) unsigned NOT NULL,
  `type` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`id`,`target`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `access`
--

INSERT INTO `access` (`id`, `target`, `type`) VALUES
(11701, 11703, 'ouder'),
(11701, 11704, 'ouder'),
(11701, 11705, 'ouder'),
(11702, 11703, 'ouder'),
(11702, 11704, 'ouder'),
(11702, 11705, 'ouder'),
(11703, 11701, 'kind'),
(11703, 11702, 'kind'),
(11704, 11701, 'kind'),
(11704, 11702, 'kind'),
(11705, 11701, 'kind'),
(11705, 11702, 'kind');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

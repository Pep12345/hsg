-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Giu 03, 2022 alle 20:13
-- Versione del server: 10.4.22-MariaDB
-- Versione PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hsg`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `api_key`
--

CREATE TABLE `api_key` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credential_hash` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_ip` varbinary(16) DEFAULT NULL COMMENT '(DC2Type:ip_address)',
  `last_accessed` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `asset`
--

CREATE TABLE `asset` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `datavis_vis`
--

CREATE TABLE `datavis_vis` (
  `id` int(10) UNSIGNED NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `dataset_modified` datetime DEFAULT NULL,
  `dataset_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diagram_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dataset_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `diagram_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `dataset` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:json)',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `query` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `datavis_vis`
--

INSERT INTO `datavis_vis` (`id`, `owner_id`, `site_id`, `created`, `modified`, `dataset_modified`, `dataset_type`, `diagram_type`, `dataset_data`, `diagram_data`, `dataset`, `title`, `description`, `query`) VALUES
(1, 2, 1, '2022-01-30 22:50:36', '2022-01-30 22:52:14', NULL, 'count_items_classes', 'bar_chart', '{\"class_ids\":[\"361\",\"363\",\"371\",\"397\",\"365\",\"392\",\"437\"]}', '{\"width\":\"700\",\"height\":\"700\",\"margin_top\":\"30\",\"margin_right\":\"30\",\"margin_bottom\":\"60\",\"margin_left\":\"100\",\"order\":\"value_asc\"}', NULL, 'count item with classes', NULL, ''),
(2, 2, 1, '2022-01-30 23:51:01', '2022-01-30 23:51:10', NULL, 'count_items_item_sets', 'pie_chart', '{\"item_set_ids\":[\"167\"]}', '{\"width\":\"700\",\"height\":\"700\",\"margin\":\"30\"}', NULL, 'ttt', NULL, 'item_set_id%5B%5D=167');

-- --------------------------------------------------------

--
-- Struttura della tabella `data_type_geography`
--

CREATE TABLE `data_type_geography` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value` geometry NOT NULL COMMENT '(DC2Type:geometry:geography)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `data_type_geometry`
--

CREATE TABLE `data_type_geometry` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value` geometry NOT NULL COMMENT '(DC2Type:geometry:geometry)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `fulltext_search`
--

CREATE TABLE `fulltext_search` (
  `id` int(11) NOT NULL,
  `resource` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(1, 'site_pages', 1, 1, 'HSG Welcome', 'Benvenuti al sito di HiStoryGraphia.\r\n'),
(2, 'site_pages', 1, 1, 'Narrations', ''),
(3, 'site_pages', 1, 1, 'Committenze', ''),
(4, 'items', 1, 1, 'Affiliazione amministrativa Entracque', 'Affiliazione amministrativa Entracque\nEntracque\nDiocesi di Mondovì'),
(4, 'site_pages', 1, 1, 'Fonti', ''),
(5, 'items', 1, 1, 'Erezione Chiesa della Confraternita di Santa Croce a Entracque', 'Erezione Chiesa della Confraternita di Santa Croce a Entracque\n1538\nChiesa della Confraternita di Santa Croce a Entracque'),
(6, 'items', 1, 1, 'Committenza 12 teleri Chiesa della Confraternita di Santa Croce a Entracque', 'Committenza 12 teleri Chiesa della Confraternita di Santa Croce a Entracque\n1658-1660\nCiclo di 12 teleri Confraternita SantaCroce Entracque\nModello Confraternita di Santa Croce a Cuneo\nLorenzo Gastaldi\nConfraternita Santa Croce Entracque'),
(7, 'items', 1, 1, 'Chiesa della Confraternita di Santa Croce a Entracque', 'Chiesa della Confraternita di Santa Croce a Entracque \nCiclo di 12 teleri Confraternita SantaCroce Entracque\nEntracque'),
(8, 'items', 1, 1, '1538', '1538'),
(9, 'items', 1, 1, '1658-1660', '1658-1660'),
(10, 'items', 1, 1, 'Entracque', 'Entracque'),
(11, 'items', 1, 1, 'Confraternita Santa Croce Entracque', 'Confraternita Santa Croce Entracque'),
(12, 'items', 1, 1, 'Modello Confraternita di Santa Croce a Cuneo', 'Modello Confraternita di Santa Croce a Cuneo\nChiesa della Confraternita di Santa Croce a Cuneo'),
(13, 'items', 1, 1, 'Ciclo di 12 teleri Confraternita SantaCroce Entracque', 'Ciclo di 12 teleri Confraternita SantaCroce Entracque\nVita di Gesù\nVita della Vergine\nTrinità\nImmacolata Concezione della Vergine\nRiscatto genere umano con sacrificio di Cristo'),
(14, 'items', 1, 1, 'Diocesi di Mondovì', 'Diocesi di Mondovì'),
(15, 'items', 1, 1, 'Lorenzo Gastaldi', 'Lorenzo Gastaldi\nTriora\n1625-1690'),
(16, 'items', 1, 1, 'Chiesa della Confraternita di Santa Croce a Cuneo', 'Chiesa della Confraternita di Santa Croce a Cuneo '),
(17, 'items', 1, 1, 'Vita di Gesù', 'Vita di Gesù'),
(18, 'items', 1, 1, 'Vita della Vergine', 'Vita della Vergine'),
(19, 'items', 1, 1, 'Trinità', 'Trinità'),
(20, 'items', 1, 1, 'Immacolata Concezione della Vergine', 'Immacolata Concezione della Vergine'),
(21, 'items', 1, 1, 'Riscatto genere umano con sacrificio di Cristo', 'Riscatto genere umano con sacrificio di Cristo'),
(22, 'items', 1, 1, 'Triora', 'Triora'),
(23, 'items', 1, 1, '1625-1690', '1625-1690'),
(24, 'items', 1, 1, 'Affiliazione amministrativa Castelletto Stura', 'Affiliazione amministrativa Castelletto Stura\nDiocesi di Asti\nCastelletto Stura'),
(25, 'items', 1, 1, 'Committenza edificazione Cappella San Bernardo Castelletto Stura', 'Committenza edificazione Cappella San Bernardo Castelletto Stura\nConfraternita Santa Croce Castelletto Stura\nParroco Castelletto Stura\nIntorno del 1480\nCappella di San Bernardo Castelletto Stura'),
(26, 'items', 1, 1, 'Committenza Decorazione Cappella San Bernardo Castelletto Stura', 'Committenza Decorazione Cappella San Bernardo Castelletto Stura\nConfraternita Santa Croce Castelletto Stura\nParroco Castelletto Stura\nIntorno del 1480'),
(27, 'items', 1, 1, 'Percorso processionale Castelletto Stura', 'Percorso processionale Castelletto Stura\nTappa Percorso professionale Castelletto Stura - Cappella di San Francesco Saverio\nTappa Percorso professionale Castelletto Stura - Cappella di San Grato\nTappa Percorso professionale Castelletto Stura - Cappella di Sant\'Anna e San Rocco\nTappa Percorso professionale Castelletto Stura - Oratorio\nTappa Percorso professionale Castelletto Stura - Chiesa parrocchiale\nTappa Percorso professionale Castelletto Stura - Cappella San Bernardo'),
(28, 'items', 1, 1, 'Chiesa parrocchiale Castelletto Stura', 'Chiesa parrocchiale Castelletto Stura'),
(29, 'items', 1, 1, 'Oratorio Castelletto Stura', 'Oratorio Castelletto Stura'),
(30, 'items', 1, 1, 'Cappella di Sant’Anna e San Rocco Castelletto Stura', 'Cappella di Sant’Anna e San Rocco Castelletto Stura'),
(31, 'items', 1, 1, 'Cappella di San Grato Castelletto Stura', 'Cappella di San Grato Castelletto Stura'),
(32, 'items', 1, 1, 'Cappella di San Francesco Saverio Castelletto Stura', 'Cappella di San Francesco Saverio Castelletto Stura'),
(33, 'items', 1, 1, 'Cappella di San Bernardo Castelletto Stura', 'Cappella di San Bernardo Castelletto Stura'),
(34, 'items', 1, 1, 'Giudizio Universale', 'Giudizio Universale'),
(35, 'items', 1, 1, 'Passione del Signore', 'Passione del Signore'),
(36, 'items', 1, 1, 'Inferno', 'Inferno'),
(37, 'items', 1, 1, 'Cavalcata dei vizi', 'Cavalcata dei vizi'),
(38, 'items', 1, 1, 'Paradiso', 'Paradiso'),
(39, 'items', 1, 1, 'Opere di misericordia', 'Opere di misericordia'),
(40, 'items', 1, 1, 'Teorie dei santi', 'Teorie dei santi'),
(41, 'items', 1, 1, 'Affreschi Pareti Cappella San Bernardo Castelletto Stura', 'Affreschi Pareti Cappella San Bernardo Castelletto Stura\nGiudizio Universale\nPassione del Signore\nInferno\nCavalcata dei vizi\nParadiso\nOpere di misericordia\nTeorie dei santi'),
(42, 'items', 1, 1, 'Intorno del 1480', 'Intorno del 1480'),
(43, 'items', 1, 1, 'Parroco Castelletto Stura', 'Parroco Castelletto Stura'),
(44, 'items', 1, 1, 'Confraternita Santa Croce Castelletto Stura', 'Confraternita Santa Croce Castelletto Stura\nConfraternita Santa Croce Cuneo'),
(45, 'items', 1, 1, 'Diocesi di Asti', 'Diocesi di Asti'),
(46, 'items', 1, 1, 'Castelletto Stura', 'Castelletto Stura'),
(47, 'items', 1, 1, 'Confraternita Santa Croce Cuneo', 'Confraternita Santa Croce Cuneo'),
(48, 'items', 1, 1, 'Crocifissione  nell’antica sacrestia di Niella Tanaro', 'Crocifissione  nell’antica sacrestia di Niella Tanaro'),
(49, 'items', 1, 1, 'Madonna col Bambino nel Santuario del Pasco a Villanova Mondovì', 'Madonna col Bambino nel Santuario del Pasco a Villanova Mondovì'),
(50, 'items', 1, 1, 'Committenza affreschi della cappella del Santo Sepolcro a Piozzo', 'Committenza affreschi della cappella del Santo Sepolcro a Piozzo \n1481'),
(51, 'items', 1, 1, 'Committenza affreschi della chiesa di San Domenico a Peveragno', 'Committenza affreschi della chiesa di San Domenico a Peveragno \n1487'),
(52, 'items', 1, 1, 'Committenza affreschi del santuario del Brichetto a Morozzo', 'Committenza affreschi del santuario del Brichetto a Morozzo \n1491'),
(53, 'items', 1, 1, '1481', '1481'),
(54, 'items', 1, 1, '1487', '1487'),
(55, 'items', 1, 1, '1491', '1491'),
(56, 'items', 1, 1, 'frammento con la Madonna con Bambino tra sant’Antonio abate e san Giovanni Battista,  nella cappella di Sant’Antonio a San Michele Mondovì', 'frammento con la Madonna con Bambino tra sant’Antonio abate e san Giovanni Battista,  nella cappella di Sant’Antonio a San Michele Mondovì \n1480'),
(57, 'items', 1, 1, 'trittico con la Madonna con il Bambino e san Pietro e sant’Antonio, nella cappella dio San Pietro in Roncaglia a Benevagienna', 'trittico con la Madonna con il Bambino e san Pietro e sant’Antonio, nella cappella dio San Pietro in Roncaglia a Benevagienna \n1485'),
(58, 'items', 1, 1, 'polittico con la Madonna col Bambino e santi nella cappella di San Bernardino a San Michele Mondovì', 'polittico con la Madonna col Bambino e santi nella cappella di San Bernardino a San Michele Mondovì\n1488'),
(59, 'items', 1, 1, 'decorazione nell’ex convento dei domenicani nella frazione Bertini di Roccaforte Mondovì', 'decorazione nell’ex convento dei domenicani nella frazione Bertini di Roccaforte Mondovì \ncirca 1480'),
(60, 'items', 1, 1, 'circa 1480', 'circa 1480'),
(61, 'items', 1, 1, '1488', '1488'),
(62, 'items', 1, 1, '1485', '1485'),
(63, 'items', 1, 1, '1480', '1480'),
(64, 'items', 1, 1, 'Giovanni Mazzucco', 'Giovanni Mazzucco\nCrocifissione  nell’antica sacrestia di Niella Tanaro\nMadonna col Bambino nel Santuario del Pasco a Villanova Mondovì\nCommittenza affreschi della cappella del Santo Sepolcro a Piozzo\nCommittenza affreschi della chiesa di San Domenico a Peveragno\nCommittenza affreschi del santuario del Brichetto a Morozzo\nframmento con la Madonna con Bambino tra sant’Antonio abate e san Giovanni Battista,  nella cappella di Sant’Antonio a San Michele Mondovì\ntrittico con la Madonna con il Bambino e san Pietro e sant’Antonio, nella cappella dio San Pietro in Roncaglia a Benevagienna\npolittico con la Madonna col Bambino e santi nella cappella di San Bernardino a San Michele Mondovì\ndecorazione nell’ex convento dei domenicani nella frazione Bertini di Roccaforte Mondovì'),
(65, 'items', 1, 1, 'Sviluppo economico della Valle Gesso dalla seconda metà del secolo XV', 'Sviluppo economico della Valle Gesso dalla seconda metà del secolo XV\nRicerca di percorso terre cisalpine-Nizza alternativo al Col di Tenda\nDinastia Savoia\n2a metà del secolo XV'),
(66, 'items', 1, 1, 'Acquisizione della Contea di Tenda da parte dei Savoia nel 1579', 'Acquisizione della Contea di Tenda da parte dei Savoia nel 1579\nDinastia Savoia\n1579\nContea di Tenda'),
(67, 'items', 1, 1, 'Ricerca di percorso terre cisalpine-Nizza alternativo al Col di Tenda', 'Ricerca di percorso terre cisalpine-Nizza alternativo al Col di Tenda\nEvitamento esosi pedaggi imposti dai signori di Tenda\nDinastia Savoia\nItinerario Valle Gesso'),
(68, 'items', 1, 1, 'Evitamento esosi pedaggi imposti dai signori di Tenda', 'Evitamento esosi pedaggi imposti dai signori di Tenda\nPedaggio itinerario Tenda\nDinastia Savoia'),
(69, 'items', 1, 1, '2a metà del secolo XV', '2a metà del secolo XV'),
(70, 'items', 1, 1, '1579', '1579'),
(71, 'items', 1, 1, 'Dinastia Savoia', 'Dinastia Savoia'),
(72, 'items', 1, 1, 'Itinerario Valle Gesso', 'Itinerario Valle Gesso\nTappa Valle Gesso-Borgo San Dalmazzo\nTappa Valle Gesso-Nice\nTappa Valle Gesso-Borgo San Dalmazzo\nTappa Valle Gesso-Valle Gesso\nTappa Valle Gesso-Entracque\nTappa Valle Gesso-Colle delle Finestre\nTappa Valle Gesso-val Vésubie\nTappa Valle Gesso-St. Martin\nTappa Valle Gesso-Lantosca\nTappa Valle Gesso-Nice\n8h\nMappa Itinerari terre cisalpine - Francia'),
(73, 'items', 1, 1, 'Itinerario Tenda', 'Itinerario Tenda\nTappa Tenda-Borgo San Dalmazzo\nTappa Tenda-Nice\nTappa Tenda-Borgo San Dalmazzo\nTappa Tenda-Valle Vermenagna\nTappa Tenda-Colle di Tenda\nTappa Tenda-Valle Roya\nTappa Tenda-Breglio\nTappa Tenda-Colle del Brouis\nTappa Tenda-Sospello\nTappa Tenda-Col de Braus\nTappa Tenda-L’Escarène\nTappa Tenda-Nice\n8h\nMappa Itinerari terre cisalpine - Francia'),
(74, 'items', 1, 1, 'Itinerario Valle Gesso – cont. 1', 'Itinerario Valle Gesso – cont. 1\nTappa Valle Gesso cont 1-Lévens\nTappa Valle Gesso-Nice\nTappa Valle Gesso cont 1-Lévens\nTappa Valle Gesso-Nice'),
(75, 'items', 1, 1, 'Itinerario Valle Gesso – cont. 2', 'Itinerario Valle Gesso – cont. 2\nTappa Valle Gesso cont 2-Utelle\nTappa Valle Gesso-Nice\nTappa Valle Gesso cont 2-Utelle\nTappa Valle Gesso-Nice'),
(78, 'items', 1, 1, 'Tappa Tenda-Borgo San Dalmazzo', 'Tappa Tenda-Borgo San Dalmazzo\nBorgo San Dalmazzo\nTappa Tenda-Valle Vermenagna'),
(80, 'items', 1, 1, 'Borgo San Dalmazzo', 'Borgo San Dalmazzo'),
(81, 'items', 1, 1, 'Valle Vermenagna', 'Valle Vermenagna '),
(82, 'items', 1, 1, 'Colle di Tenda', 'Colle di Tenda'),
(83, 'items', 1, 1, 'Valle Roya', 'Valle Roya'),
(84, 'items', 1, 1, 'Breglio', 'Breglio'),
(85, 'items', 1, 1, 'Sospello', 'Sospello'),
(86, 'items', 1, 1, 'L’Escarène', 'L’Escarène'),
(87, 'items', 1, 1, 'St. Martin', 'St. Martin'),
(88, 'items', 1, 1, 'Lantosca', 'Lantosca'),
(89, 'items', 1, 1, 'Lévens', 'Lévens'),
(90, 'items', 1, 1, 'Utelle', 'Utelle'),
(91, 'items', 1, 1, 'Nice', 'Nice'),
(92, 'items', 1, 1, 'Valle Gesso', 'Valle Gesso'),
(93, 'items', 1, 1, 'val Vésubie', 'val Vésubie'),
(94, 'items', 1, 1, 'Colle del Brouis', 'Colle del Brouis'),
(95, 'items', 1, 1, 'Col de Braus', 'Col de Braus'),
(96, 'items', 1, 1, 'Colle delle Finestre', 'Colle delle Finestre'),
(97, 'items', 1, 1, 'Tappa Tenda-Valle Vermenagna', 'Tappa Tenda-Valle Vermenagna\nValle Vermenagna\nTappa Tenda-Colle di Tenda'),
(98, 'items', 1, 1, 'Tappa Tenda-Colle di Tenda', 'Tappa Tenda-Colle di Tenda\nColle di Tenda\nTappa Tenda-Valle Roya'),
(99, 'items', 1, 1, 'Tappa Tenda-Valle Roya', 'Tappa Tenda-Valle Roya\nValle Roya\nTappa Tenda-Breglio'),
(100, 'items', 1, 1, 'Tappa Tenda-Breglio', 'Tappa Tenda-Breglio\nBreglio\nTappa Tenda-Colle del Brouis'),
(101, 'items', 1, 1, 'Tappa Tenda-Colle del Brouis', 'Tappa Tenda-Colle del Brouis\nColle del Brouis\nTappa Tenda-Sospello'),
(102, 'items', 1, 1, 'Tappa Tenda-Sospello', 'Tappa Tenda-Sospello\nSospello\nTappa Tenda-Col de Braus'),
(103, 'items', 1, 1, 'Tappa Tenda-Col de Braus', 'Tappa Tenda-Col de Braus\nCol de Braus\nTappa Tenda-L’Escarène'),
(104, 'items', 1, 1, 'Tappa Tenda-L’Escarène', 'Tappa Tenda-L’Escarène\nL’Escarène\nTappa Tenda-Nice'),
(105, 'items', 1, 1, 'Tappa Tenda-Nice', 'Tappa Tenda-Nice\nNice'),
(106, 'items', 1, 1, 'Tappa Valle Gesso-Nice', 'Tappa Valle Gesso-Nice\nNice'),
(107, 'items', 1, 1, 'Tappa Valle Gesso-Borgo San Dalmazzo', 'Tappa Valle Gesso-Borgo San Dalmazzo\nBorgo San Dalmazzo\nTappa Valle Gesso-Valle Gesso'),
(108, 'items', 1, 1, 'Tappa Valle Gesso-Valle Gesso', 'Tappa Valle Gesso-Valle Gesso\nValle Gesso\nTappa Valle Gesso-Entracque'),
(109, 'items', 1, 1, 'Tappa Valle Gesso-Entracque', 'Tappa Valle Gesso-Entracque\nEntracque\nTappa Valle Gesso-Colle delle Finestre'),
(110, 'items', 1, 1, 'Tappa Valle Gesso-Colle delle Finestre', 'Tappa Valle Gesso-Colle delle Finestre\nColle delle Finestre\nTappa Valle Gesso-val Vésubie'),
(111, 'items', 1, 1, 'Tappa Valle Gesso-val Vésubie', 'Tappa Valle Gesso-val Vésubie\nval Vésubie\nTappa Valle Gesso-St. Martin'),
(112, 'items', 1, 1, 'Tappa Valle Gesso-St. Martin', 'Tappa Valle Gesso-St. Martin\nSt. Martin\nTappa Valle Gesso-Lantosca'),
(113, 'items', 1, 1, 'Tappa Valle Gesso-Lantosca', 'Tappa Valle Gesso-Lantosca\nLantosca\nTappa Valle Gesso cont 1-Lévens\nTappa Valle Gesso cont 2-Utelle'),
(114, 'items', 1, 1, 'Tappa Valle Gesso cont 1-Lévens', 'Tappa Valle Gesso cont 1-Lévens\nLévens\nTappa Valle Gesso-Nice'),
(115, 'items', 1, 1, 'Tappa Valle Gesso cont 2-Utelle', 'Tappa Valle Gesso cont 2-Utelle\nUtelle\nTappa Valle Gesso-Nice'),
(116, 'items', 1, 1, 'Signori di Tenda', 'Signori di Tenda'),
(117, 'items', 1, 1, 'Pedaggio itinerario Tenda', 'Pedaggio itinerario Tenda\nItinerario Tenda\nSignori di Tenda'),
(118, 'items', 1, 1, 'Contea di Tenda', 'Contea di Tenda'),
(121, 'items', 1, 1, 'Confraternita di Santa Croce \na Entracque: Autore', 'Confraternita di Santa Croce \na Entracque: Autore \n[Autore].  Gelsomina Spione\nConfraternita di Santa Croce \na Entracque: Localizzazione'),
(122, 'items', 1, 1, 'Tappa Percorso professionale Castelletto Stura - Chiesa parrocchiale', 'Tappa Percorso professionale Castelletto Stura - Chiesa parrocchiale'),
(123, 'items', 1, 1, 'Tappa Percorso professionale Castelletto Stura - Chiesa parrocchiale', 'Tappa Percorso professionale Castelletto Stura - Chiesa parrocchiale\nChiesa parrocchiale Castelletto Stura'),
(124, 'items', 1, 1, 'Tappa Percorso professionale Castelletto Stura - Oratorio', 'Tappa Percorso professionale Castelletto Stura - Oratorio\nOratorio Castelletto Stura'),
(125, 'items', 1, 1, 'Tappa Percorso professionale Castelletto Stura - Cappella di Sant\'Anna e San Rocco', 'Tappa Percorso professionale Castelletto Stura - Cappella di Sant\'Anna e San Rocco\nCappella di Sant’Anna e San Rocco Castelletto Stura'),
(126, 'items', 1, 1, 'Tappa Percorso professionale Castelletto Stura - Cappella di San Grato', 'Tappa Percorso professionale Castelletto Stura - Cappella di San Grato\nCappella di San Grato Castelletto Stura'),
(127, 'items', 1, 1, 'Tappa Percorso professionale Castelletto Stura - Cappella di San Francesco Saverio', 'Tappa Percorso professionale Castelletto Stura - Cappella di San Francesco Saverio\nCappella di San Francesco Saverio Castelletto Stura'),
(128, 'items', 1, 1, 'Tappa Percorso professionale Castelletto Stura - Cappella San Bernardo', 'Tappa Percorso professionale Castelletto Stura - Cappella San Bernardo\nCappella di San Bernardo Castelletto Stura'),
(129, 'items', 1, 1, 'Confraternita di Santa Croce \na Entracque: Articolo', 'Confraternita di Santa Croce \na Entracque: Articolo\n[Articolo]: \nConfraternita di Santa Croce \na Entracque\nConfraternita di Santa Croce \na Entracque: Autore\nConfraternita di Santa Croce \na Entracque: Localizzazione\nConfraternita di Santa Croce \na Entracque: Committenza\nConfraternita di Santa Croce a Entracque: Iconografia\nConfraternita di Santa Croce \na Entracque: Geografia artistica'),
(130, 'items', 1, 1, 'Confraternita di Santa Croce \na Entracque: Localizzazione', 'Confraternita di Santa Croce \na Entracque: Localizzazione \n[Localizzazione]. Entracque, diocesi di Mondovì\nEntracque\nDiocesi di Mondovì\nConfraternita di Santa Croce \na Entracque: Committenza'),
(131, 'items', 1, 1, 'Confraternita di Santa Croce \na Entracque: Committenza', 'Confraternita di Santa Croce \na Entracque: Committenza\n[Committenza]. La chiesa della confraternita viene edificata nel 1538, segno dell’affermazione di un notabilato che controlla la vita economica e sociale della comunità e sviluppatosi tra la metà del Quattrocento e la fine del Cinquecento, a seguito dell’incremento dei traffici commerciali. La rete economica favorisce anche la circolazione di artisti. I confratelli di Santa Croce commissionano (1658 - 1660) un ciclo di dodici tele a Lorenzo Gastaldi. La scelta del pittore, che in quel momento si trova a Monaco, e realizza molte opere per le valli del Nizzardo e il basso cuneese, si spiega con interessi economici della comunità e alle frequentazioni liguri-nizzarde della popolazione locale.  Durante il Seicento gli entracquesi vendono ovini e bovini ai macelli di Grasse, Nizza e Genova. Sovente  alcuni abitanti si recavano per affari a Tenda, raggiunta attraverso i colli della Finestra e del Sabbione. A partire dagli anni Settanta del Seicento è potenziata l’attività mercantile, a cui corrisponde il tentativo di rilanciare l’antica strada del colle delle Finestre, che in seguito al potenziamento della strada del colle di Tenda aveva perso la sua importanza.] I rapporti di Entracque con la valle della Vesubie, attraverso il colle delle Finestre, sulla strada di Nizza, determinarono almeno un altro episodio di committenza: il “mastro da bosco” (falegname) Giacomo Rosso di Lantosca realizza nel 1684 un armadio per la parrocchiale di Sant’Antonino.\nConfraternita di Santa Croce \na Entracque: Fonte Arneodo et al. 1997\nConfraternita di Santa Croce \na Entracque: Fonte Palmero 2008\nEx voto Chiesa Santa Croce Entracque\nChiesa della Confraternita di Santa Croce a Entracque\nLorenzo Gastaldi\nCommittenza 12 teleri Chiesa della Confraternita di Santa Croce a Entracque\nConfraternita di Santa Croce a Entracque: Iconografia'),
(132, 'items', 1, 1, 'Confraternita di Santa Croce \na Entracque: Fonte Palmero 2008', 'Confraternita di Santa Croce \na Entracque: Fonte Palmero 2008\n[Fonte]. B. Palmero, Entracque 2008, https://www.archiviocasalis.it/localized-install/biblio/cuneo/entracque\nPalmero 2008'),
(133, 'items', 1, 1, 'Confraternita di Santa Croce \na Entracque: Fonte Arneodo et al. 1997', 'Confraternita di Santa Croce \na Entracque: Fonte Arneodo et al. 1997\n[Fonte].  F. ARNEODO, D. DEIDDA, L. VOLPE, Attività pastorizia ed evoluzione degli equilibri socio-economici a Entracque (secoli XV-XVIII), in Entracque : una comunità alpina tra Medioevo ed Età moderna, Atti della giornata di studio, Entracque, 13 Aprile 1997, a cura di R. Comba, M. Cordero, Cuneo 1997, pp. 107-143].\nARNEODO et al. 1997'),
(134, 'items', 1, 1, 'Confraternita di Santa Croce a Entracque: Iconografia', 'Confraternita di Santa Croce a Entracque: Iconografia\n[Iconografia]. Si tratta di dodici teleri raffiguranti episodi della vita di Cristo e della Vergine. Una scelta che risponde ai dogmi affermati dalla Chiesa cattolica della Controriforma, l’Immacolata Concezione della Vergine, la Trinità, il riscatto del genere umano attraverso il Sacrificio di Cristo. A questo si aggiungono i riferimenti alle pratiche liturgiche svolte dai confratelli durante il Giovedì Santo, rievocate nell’Ultima Cena e soprattutto nella Lavanda dei piedi. Il modello decorativo di riferimento è quello della Confraternita di Santa Croce a Cuneo, dove nel 1626 sono allestite le tele con i Miracoli della Vera Croce dipinti nel 1626 da Giulio e Giovanni Battista Bruno (che a loro volta rimandano ai modelli decorativi di primo Seicento delle Casacce (oratori), genovesi.\nCiclo di 12 teleri Confraternita SantaCroce Entracque\nTrinità\nRiscatto genere umano con sacrificio di Cristo\nImmacolata Concezione della Vergine\nConfraternita di Santa Croce \na Entracque: Geografia artistica\nConfraternita di Santa Croce \na Entracque: Bartoletti 2003\nConfraternita di Santa Croce \na Entracque: Confronto chiese Santa Croce'),
(135, 'items', 1, 1, 'Confraternita di Santa Croce \na Entracque: Geografia artistica', 'Confraternita di Santa Croce \na Entracque: Geografia artistica\n[Geografia artistica]. Lorenzo Gastaldi è un pittore originario di Triora (1625-1690); dal 1651 si trasferisce a Monaco dove si ritaglia uno spazio a corte, per poi passare a Nizza e ritornare a Triora nel 1676. Molte sono le opere da lui realizzate, destinate alle valli del Nizzardo e del basso Cuneese.  Le sue opere sono presenti a La Brigue (per la parrocchiale, Immacolata con i santi Sebastiano, Giuseppe, Rocco e Carlo Borromeo), a Peillon (per la parrocchiale, Madonna del Rosario), a Contes in Val Paillon (per la parrocchiale, Pentecoste); a Triora (Natività del Battista per l’Oratorio di San Giovanni Battista);  in valle Stura a Bersezio (per la parrocchiale, Madonna con il Bambino e santi; Sacra Famiglia); Pontebernardo (per la parrocchiale, Madonna con il Bambino, Santi e la Sindone; Moiola; Vernante (per la parrocchiale, la Sindone, 1671; Roccavione (per la cappella dei Santi Rocco e Biagio, 1676; per la parrocchiale uno stendardo per la Compagnia del Rosario, 1678); Demonte (parrocchiale, Madonna con il Bambino e i santi Marco evangelista, Chiara, Grato e Barbara); nella valle della Tinèe, a Isola (per la parrocchiale, Incoronazione della Vergine e i santi Bernardo e Lorenzo). \nConfraternita di Santa Croce \na Entracque: Fonte Bartoletti 1997'),
(136, 'items', 1, 1, 'Confraternita di Santa Croce \na Entracque: Fonte Bartoletti 1997', 'Confraternita di Santa Croce \na Entracque: Fonte Bartoletti 1997\n[FONTE: M. Bartoletti, Due episodi figurativi del Seicento a Entracque: l’attività del pittore Lorenzo Gastaldi e le tele dell’Apostolato nella parrocchiale, in Entracque : una comunità alpina tra Medioevo ed Età moderna, Atti della giornata di studio, Entracque, 13 Aprile 1997, a cura di R. Comba, M. Cordero, Cuneo 1997, pp. 193-214].'),
(138, 'items', 1, 1, 'ARNEODO et al. 1997', 'ARNEODO et al. 1997\nhttps://www.archiviocasalis.it/localized-install/biblio/cuneo/entracque Link Centro Casalis per Aneoddo et al. 1997'),
(139, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Articolo', 'San Bernardo a Castelletto Stura: Articolo\n[Articolo]: San Bernardo a Castelletto Stura\nSan Bernardo a Castelletto Stura: Autore\nSan Bernardo a Castelletto Stura: Diocesi\nSan Bernardo a Castelletto Stura: Dipendenze\nSan Bernardo a Castelletto Stura: Cronologia\nSan Bernardo a Castelletto Stura: Committenza\nSan Bernardo a Castelletto: Funzione\nSan Bernardo a Castelletto Stura: Iconografia\nSan Bernardo a Castelletto Stura: Artista\nSan Bernardo a Castelletto Stura: Geografia artistica\nSan Bernardo a Castelletto Stura: Circolazione\nSan Bernardo a Castelletto Stura: Attribuzioni per stile'),
(140, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Autore', 'San Bernardo a Castelletto Stura: Autore\n[Autore].  Gelsomina Spione\nSan Bernardo a Castelletto Stura: Diocesi'),
(141, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Diocesi', 'San Bernardo a Castelletto Stura: Diocesi\n[Diocesi]: Diocesi di Asti; dal 1430 Diocesi di Mondovì e in seguito alla riorganizzazione post-napoleonica (1817) passa sotto la Diocesi di Cuneo.\nSan Bernardo a Castelletto Stura: Fonte Berra 1995\nSan Bernardo a Castelletto Stura: Dipendenze'),
(142, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Dipendenze', 'San Bernardo a Castelletto Stura: Dipendenze\n[Dipendenze] Dal 1430 il territorio di Castelletto è assorbito in quello di più vasta pertinenza della “villanova” di Cuneo Nel 1619 Castelletto è infeudato ad Amedeo Ponte di Scarnafigi; nel 1661passa a Francesco Bartolomeo Sandri Trotti, marchese di Montanera, che nel 1668 lo vende a Giovanni Battista Lamberti, famiglia a cui apparterrà fino al periodo della conquista francese.\nSan Bernardo a Castelletto Stura: Fonte Comba 1972\nSan Bernardo a Castelletto Stura: Fonte Ristorto 1977\nSan Bernardo a Castelletto Stura: Cronologia'),
(143, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Cronologia', 'San Bernardo a Castelletto Stura: Cronologia\n[Cronologia]: sulla base della lettura dei dati di stile, la cronologia di esecuzione cade intorno al 1480.\nSan Bernardo a Castelletto Stura: Fonte Brezzi Rossetti 1987\nSan Bernardo a Castelletto Stura: Committenza'),
(144, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Committenza', 'San Bernardo a Castelletto Stura: Committenza\n[Committenza]: L’edificazione della cappella e la sua decorazione ad affresco sono realizzati su commissione del parroco del paese con la partecipazione di alcuni notabili (che identifichiamo nelle figure affrescate ai margini della lunetta con l’Incoronazione della Vergine, abbigliate in vesti moderne e più caratterizzate  nella fisionomia rispetto agli altri personaggi), illustri membri della confraternita di Santa Croce, da poco istituita in paese come filiazione della più importante congregazione cuneese.\nSan Bernardo a Castelletto Stura: Fonte Anonima\nSan Bernardo a Castelletto Stura: Fonte figure affrescate ai margini della lunetta con l’Incoronazione della Vergine\nSan Bernardo a Castelletto: Funzione'),
(145, 'items', 1, 1, 'San Bernardo a Castelletto: Funzione', 'San Bernardo a Castelletto: Funzione\n[Funzione] La cappella di San Bernardo, nelle pratiche di devozione del paese, è una delle tappe del percorso processionale che legava i luoghi sacri del paese : la chiesa parrocchiale, l’oratorio di San Sebastiano e quindi la cappella di San Bernardo che con la sua struttura aperta accoglieva per una breve sosta la processione.  A questo itinerario si aggiunge la cappella di Sant’Anna edificata dopo la peste che afflisse il territorio tra il 1520 e il 1526 (dopo la peste del 1630 la cappella assocerà al titolo di Sant’Anna, quello di San Sebastiano, nuovo santo invocato contro il flagello). Nel Seicento si aggiungeranno altre due cappelle, Sant’Anna e San Grato, sulla strada verso Cuneo, e quella intitolata a San Francesco Saverio sulla strada verso Montanera. Il paese era così tutelato da santi in ogni strada di accesso, con le cappelle distribuite sui quattro punti cardinali.\nSan Bernardo a Castelletto Stura: Fonte Gazzola 2007\nSan Bernardo a Castelletto Stura: Fonte Cappella San Bernardo\nSan Bernardo a Castelletto Stura: Iconografia'),
(146, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Fonte Berra 1995', 'San Bernardo a Castelletto Stura: Fonte Berra 1995\n[Berra 1995] L. Berra, Riordinamento delle Diocesi di Mondovì, Saluzzo, Alba e Fossano ed erezione della Diocesi di Cuneo nel 1817, in “Bollettino della Società per gli Studi Storici, Archeologici e Artistici della Provincia di Cuneo”, 36, 1955, p. 51.'),
(147, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Fonte Comba 1972', 'San Bernardo a Castelletto Stura: Fonte Comba 1972\n[Fonte].  R. Comba, Due resoconti inediti della castellania di Cuneo (1388-1409), in “Bollettino della Società per gli Studi Storici, Archeologici e Artistici della Provincia di Cuneo” , 67, 1972, pp. 32-33].'),
(148, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Fonte Ristorto 1977', 'San Bernardo a Castelletto Stura: Fonte Ristorto 1977\n[Fonte]. M. Ristorto, Castelletto Stura. Storia civile e religiosa, Cuneo 1977, pp. 56-73; G. Comino, Castelletto Stura, 1998 https://www.archiviocasalis.it/localized-install/content/castelletto-stura]. \nRistornò 1977'),
(149, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Fonte Brezzi Rossetti 1987', 'San Bernardo a Castelletto Stura: Fonte Brezzi Rossetti 1987\n[Brezzi Rossetti 1987] E. Brezzi Rossetti, Giovanni Mazzucco, in La Pittura in Italia. Il Quattrocento, Milano 1987, pp. 708-709]\nBrezzi Rossetti 1987'),
(150, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Fonte Anonima', 'San Bernardo a Castelletto Stura: Fonte Anonima\n[Anonimo].  La confraternita di Santa Croce di Cuneo concede un aiuto in denaro il 7 marzo 1473.'),
(151, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Fonte Gazzola 2007', 'San Bernardo a Castelletto Stura: Fonte Gazzola 2007\n[Gazzola 2007] G.M. Gazzola, San Bernardo nel tessuto rituale di Castelletto Stura. La vita devozionale di un borgo rurale dal Medioevo a oggi, in in Il restauro della cappella di San Bernardo a Castelletto Stura, Cuneo 2007, pp. 101-110].'),
(152, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Iconografia', 'San Bernardo a Castelletto Stura: Iconografia\n[Iconografia]. Le figure dipinte sulle pareti riassumono alcuni dei temi della spiritualità propria delle confraternite dedicate alla Santa Croce: è una vera narrazione per immagini. \nSulla volta, le scene della Passione del Signore, con una forte accento sulle pratiche della penitenza, richiamano l’uso della flagellazione attuata dai confratelli in alcune processioni, l’Inferno e il Paradiso, sono l’esito del Giudizio Universale che i predicatori del tempo andavano preannunciando.  Ai piedi di queste scene si trovano le sequenze della Cavalcata dei vizi (in relazione con l’Inferno) e le Opere di misericordia (in relazione con il Paradiso).  Le teorie dei Santi (all’interno e sulla facciata) accompagnavano le litanie che ritmavano il cammino processionale in salmi penitenziali o il “Te Deum”, a seconda della festività).\nSan Bernardo a Castelletto Stura: Fonte Quasimodo 2007\nSan Bernardo a Castelletto Stura: Fonte teorie dei Santi sulla facciata\nSan Bernardo a Castelletto Stura: Fonte teorie dei Santi all’interno\nSan Bernardo a Castelletto Stura: Fonte l’Inferno e il Paradiso\nSan Bernardo a Castelletto Stura: Fonte scene della Passione del Signore\nSan Bernardo a Castelletto Stura: Artista'),
(153, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Artista', 'San Bernardo a Castelletto Stura: Artista\n [ARTISTA] Gli affreschi sono assegnati, sulla base dei dati di stile a  Giovanni Mazzucco, un pittore attivo in area monregalese nella seconda metà del Quattrocento.\nSan Bernardo a Castelletto Stura: Fonte Brezzi Rossetti 1987\nSan Bernardo a Castelletto Stura: Geografia artistica'),
(154, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Geografia artistica', 'San Bernardo a Castelletto Stura: Geografia artistica\n [GEOGRAFIA ARTISTICA] La prima data utile per ricostruire l’ attività di Giovanni Mazzucco è il 1481, quando firma gli affreschi della cappella del Santo Sepolcro a Piozzo. Nel 1487 decora la chiesa di San Domenico a Peveragno. Al  1491  risale l’ultima opera firmata da Mazzucco, realizzata nel santuario del Brichetto a Morozzo, su commissione di Biagio Fauzone. Questo nucleo di affreschi tutti firmati da Giovanni Mazzucco, sono la base di riferimento per assegnare, al pittore e alla sua bottega, altre opere, affini per i dati di stile.\nSan Bernardo a Castelletto Stura: Fonte Marino 2007\nSan Bernardo a Castelletto Stura: Fonte Cappella del Santo Sepolcro a Piozzo\nSan Bernardo a Castelletto Stura: Fonte santuario del Brichetto a Morozzo\nSan Bernardo a Castelletto Stura: Attribuzioni per stile'),
(155, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Attribuzioni per stile', 'San Bernardo a Castelletto Stura: Attribuzioni per stile\n[OPERE ATTRIBUITE PER CONFRONTI STILISTICI] Le attribuzioni più convincenti sono: un frammento con la Madonna con Bambino tra sant’Antonio abate e san Giovanni Battista,  nella cappella di Sant’Antonio a San Michele Mondovì (1480); il trittico con la Madonna con il Bambino e san Pietro e sant’Antonio, nella cappella di San Pietro in Roncaglia a Benevagienna (commissionato nel 1485 dai fratelli Andrea e Giuliano de Capelinis); il polittico con la Madonna col Bambino e santi nella cappella di San Bernardino a San Michele Mondovì (1488) e la decorazione nell’ex convento dei domenicani nella frazione Bertini di Roccaforte Mondovì (circa 1480).\nSan Bernardo a Castelletto Stura: Fonte Marino 2007\nSan Bernardo a Castelletto Stura: Fonte decorazione nell’ex convento dei domenicani nella frazione Bertini di Roccaforte Mondovì\nSan Bernardo a Castelletto Stura: Fonte polittico con la Madonna col Bambino e santi nella cappella di San Bernardino a San Michele Mondovì\nSan Bernardo a Castelletto Stura: Fonte trittico con la Madonna con il Bambino e san Pietro e sant’Antonio, nella cappella di San Pietro in Roncaglia a Benevagienna\nSan Bernardo a Castelletto Stura: Fonte la Madonna con Bambino tra sant’Antonio abate e san Giovanni Battista,  nella cappella di Sant’Antonio a San Michele Mondovì\nSan Bernardo a Castelletto Stura: Circolazione'),
(156, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Circolazione', 'San Bernardo a Castelletto Stura: Circolazione\n[AMBITO/FORTUNA] Un gruppo di affreschi, da datare intorno alla seconda metà del Quattrocento,  appaiono vicini allo stile del Mazzucco, ma non sono direttamente opera del pittore o della sua bottega. E’ il caso della Crocifissione  nell’antica sacrestia di Niella Tanaro; la Madonna col Bambino nel Santuario del Pasco a Villanova Mondovì: sono segni della fortuna di cui gode il linguaggio del pittore. \nSan Bernardo a Castelletto Stura: Fonte Marino 2007'),
(157, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Fonte Quasimodo 2007', 'San Bernardo a Castelletto Stura: Fonte Quasimodo 2007\n [Quasimodo 2007] F. Quasimodo, Tra Inferno e Paradiso. L’iconografia degli affreschi, in Il restauro della cappella di San Bernardo a Castelletto Stura, Cuneo 2007, pp.37-58].'),
(159, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Fonte Marino 2007', 'San Bernardo a Castelletto Stura: Fonte Marino 2007\n [Fonte]. L. Marino, Sulle tracce di Giovanni Mazzucco. Biografia, stile, confronti, in Il restauro della cappella di San Bernardo a Castelletto Stura, Cuneo 2007, pp.59-78].'),
(160, 'items', 1, 1, 'Valle Gesso – Strade di transito: Articolo', 'Valle Gesso – Strade di transito: Articolo\nArticle: Valle Gesso – Strade di transito\nValle Gesso – Strade di transito: Quadro politico\nValle Gesso – Strade di transito: Area di transito'),
(161, 'items', 1, 1, 'Valle Gesso – Strade di transito: Autore', 'Valle Gesso – Strade di transito: Autore\n[Autore].  Gelsomina Spione\nValle Gesso – Strade di transito: Quadro politico'),
(162, 'items', 1, 1, 'Valle Gesso – Strade di transito: Quadro politico', 'Valle Gesso – Strade di transito: Quadro politico\n[Quadro politico]. Per evitare gli esosi pedaggi imposti dai signori di Tenda alle merci che transitavano nei territori da loro controllati, I Savoia cercano un percorso alternativo alla strada del Col di Tenda per raggiungere Nizza. L’itinerario scelto dai Savoia è quello che attraversava la valle Gesso, e il Colle di Finestra, forse meno agevole, ma utile ad evitare i pedaggi (1200 scudi all’anno solo per il trasporto del sale) e quindi molto praticato. favorendo così, a partire dalla seconda metà del secolo XV, lo sviluppo economico della Valle e di Entracque. E’ un percorso che verso la metà del Quattrocento era stato addirittura raddoppiato, con il velleitario e un po’ folle progetto attuato da Paganino Dal Pozzo attraverso il colle che oggi da lui prende il nome, il Pagarì, e che supera i 2800 metri di altitudine. \nVa tuttavia detto che, nonostante i pedaggi imposti, la strada del colle di Tenda, attraverso la valle Roya, rimase la strada più battuta, perché più vantaggiosa rispetto agli altri itinerari sia per la minor altitudine che per la migliore percorribilità durante i mesi invernali.\nCon l’annessione nel 1579 della contea di Tenda ai domini dei Savoia, la strada del sale, da Torino a Nizza per il col di Tenda,  si libera dai dazi che fino a quel momento i signori di Tenda avevano infitto al traffico delle merci e diventa la via principale per traffici e comunicazioni. E’ l’avvio della crisi di Entracque, e del suo territorio,  escluso dalla scelta di privilegiare la via passante per Limone e la val Roia per il trasporto di merci e per il rifornimento di sale, a scapito del più problematico collegamento attraverso gli alti passi della val Gesso.\nValle Gesso – Strade di transito: Area di transito'),
(164, 'items', 1, 1, 'Valle Gesso – Strade di transito: Area di transito', 'Valle Gesso – Strade di transito: Area di transito\n[Area di transito]. Gli itinerari che si diramano verso la Francia sono due.\nIl primo da Borgo San Dalmazzo attraversava la valle Vermenagna e valicava il colle di Tenda in direzione di Nizza. Percorreva la valle Roya fino a Breglio e per il colle del Brouis raggiungeva Sospello; da qui valicando il Braus, scendeva a L’Escarene e sbucava a Nizza.\nQuesto itinerario, con alcune varianti, sarà modificato tra il 1610 e il 1714, assumendo il nome di Route Royale (Strada Reale), percorribile da carri e artiglierie. Tra il 1780 e il 1788, sono realizzati nuovi lavori di ampliamento e la via del Tenda diventa la prima strada carrozzabile che attraversa le Alpi. Le trasformazioni  facilitano gli scambi commerciali a scapito del meno agevole Colle di Finestra. Dal 1815, tramontata l’occupazione francese (1792-1815), Vittorio Emanuele I fa istituire il primo servizio di trasporto pubblico da Torino a Nizza, con diligenze trisettimanali.\nNel 1882, l’apertura del tunnel al di sotto del valico tronca l’importanza  dell’antica via commerciale del sale. Alla sua inaugurazione, il traforo del Colle di Tenda era il tunnel  stradale più lungo mai costruito (3182 m). Nel 1898 è ultimata anche una galleria ferroviaria, molto più lunga di quella stradale  (8099 m). \nIl secondo percorso, parallelo alla via del Colle di Tenda, imboccava la valle Gesso e salendo ad Entracque valicava il colle delle Finestre e si immetteva nella val Vésubie, attraversava St. Martin e Lantosca. Da qui si snodavano due tragitti per Nizza: uno passante per Lévens e l’altro per Utelle. \nValle Gesso – Strade di transito: Fonte Fontana 2013\nValle Gesso – Strade di transito: Fonte Collidà et al. 1982\nItinerario Valle Gesso\nEntracque'),
(165, 'items', 1, 1, 'Valle Gesso – Strade di transito: Fonte Fontana 2013', 'Valle Gesso – Strade di transito: Fonte Fontana 2013\n[Fontana 2013] J.-L. Fontana, Les capitulations des forts de Nice, Villafranche et Mont-Alban, in Au Coeur des Alpes: Utrecht, actes du colloque de Jausiers, Colmars et Etraunes 14,15,16 Septembre 2012, Barcellonette 2013.'),
(166, 'items', 1, 1, 'Valle Gesso – Strade di transito: Fonte Collidà et al. 1982', 'Valle Gesso – Strade di transito: Fonte Collidà et al. 1982\n[Collidà et al. 1982] F. Collidà, M. Gallo, A. Mola,  Cuneo-Nizza: storia di una ferrovia, Cuneo 1982.'),
(167, 'item_sets', 1, 1, 'HSG site items', 'HSG site items'),
(168, 'items', 1, 1, 'Ex voto Chiesa Santa Croce Entracque', 'Ex voto Chiesa Santa Croce Entracque\nEx voto conservati nella Chiesa di Santa Croce a Entracque.'),
(171, 'items', 1, 1, 'Confraternita di Santa Croce a Entracque: riferimento ex voto Chiesa Santa Croce', 'Confraternita di Santa Croce a Entracque: riferimento ex voto Chiesa Santa Croce\nEx voto Chiesa Santa Croce Entracque'),
(172, 'items', 1, 1, 'Palmero 2008', 'Palmero 2008'),
(174, 'items', 1, 1, 'I pittori Bruno', 'I pittori Bruno\nParagrafo sui pittori Bruno tratto dal saggio di Massimo Bartoletti, Tra Cuneo, le sue valli, la Riviera di Ponente e il Nizzardo durante il Seicento, in Cantieri e documenti del Barocco. Cuneo e le sue valli, a cura di G. Romano, G. Spione,  catalogo della mostra, Cuneo 2003.'),
(176, 'items', 1, 1, 'Confraternita di Santa Croce \na Entracque: i pittori Bruno', 'Confraternita di Santa Croce \na Entracque: i pittori Bruno\nRiferimento a documento testuale\nMassimo Bartoletti, Tra Cuneo, le sue valli, la Riviera di Ponente e il Nizzardo durante il Seicento, in Cantieri e documenti del Barocco. Cuneo e le sue valli, a cura di G. Romano, G. Spione,  catalogo della mostra, Cuneo 2003 (nello specifico il paragrafo sui pittori Bruno ).\nI pittori Bruno'),
(177, 'items', 1, 1, 'Valle Gesso – Strade di transito: Fonte Palmero 1995', 'Valle Gesso – Strade di transito: Fonte Palmero 1995\nFonte]. B. Palmero, Consenso e contrattazione politica lungo la direttrice del col di Tenda (1586-1754). I comuni della val Roya e la progettazione della strada, in Bollettino storico Bibliografico subalpino, XCIII, 1995, pp. 507-546].'),
(178, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Fonte scene della Passione del Signore', 'San Bernardo a Castelletto Stura: Fonte scene della Passione del Signore'),
(180, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Fonte l’Inferno e il Paradiso', 'San Bernardo a Castelletto Stura: Fonte l’Inferno e il Paradiso'),
(182, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Fonte teorie dei Santi all’interno', 'San Bernardo a Castelletto Stura: Fonte teorie dei Santi all’interno'),
(184, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Fonte teorie dei Santi sulla facciata', 'San Bernardo a Castelletto Stura: Fonte teorie dei Santi sulla facciata'),
(186, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Fonte Cappella San Bernardo', 'San Bernardo a Castelletto Stura: Fonte Cappella San Bernardo\nhttps://www.cittaecattedrali.it/it/bces/217-cappella-di-san-bernardo# '),
(187, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Fonte figure affrescate ai margini della lunetta con l’Incoronazione della Vergine', 'San Bernardo a Castelletto Stura: Fonte figure affrescate ai margini della lunetta con l’Incoronazione della Vergine'),
(189, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Fonte la Madonna con Bambino tra sant’Antonio abate e san Giovanni Battista,  nella cappella di Sant’Antonio a San Michele Mondovì', 'San Bernardo a Castelletto Stura: Fonte la Madonna con Bambino tra sant’Antonio abate e san Giovanni Battista,  nella cappella di Sant’Antonio a San Michele Mondovì '),
(191, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Fonte trittico con la Madonna con il Bambino e san Pietro e sant’Antonio, nella cappella di San Pietro in Roncaglia a Benevagienna', 'San Bernardo a Castelletto Stura: Fonte trittico con la Madonna con il Bambino e san Pietro e sant’Antonio, nella cappella di San Pietro in Roncaglia a Benevagienna'),
(193, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Fonte polittico con la Madonna col Bambino e santi nella cappella di San Bernardino a San Michele Mondovì', 'San Bernardo a Castelletto Stura: Fonte polittico con la Madonna col Bambino e santi nella cappella di San Bernardino a San Michele Mondovì'),
(195, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Fonte decorazione nell’ex convento dei domenicani nella frazione Bertini di Roccaforte Mondovì', 'San Bernardo a Castelletto Stura: Fonte decorazione nell’ex convento dei domenicani nella frazione Bertini di Roccaforte Mondovì'),
(197, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Fonte santuario del Brichetto a Morozzo', 'San Bernardo a Castelletto Stura: Fonte santuario del Brichetto a Morozzo\nhttps://www.cittaecattedrali.it/it/bces/104-santuario-della-madonna-del-brichetto '),
(198, 'items', 1, 1, 'San Bernardo a Castelletto Stura: Fonte Cappella del Santo Sepolcro a Piozzo', 'San Bernardo a Castelletto Stura: Fonte Cappella del Santo Sepolcro a Piozzo\nhttps://www.cittaecattedrali.it/it/bces/409-cappella-santo-sepolcro '),
(199, 'items', 1, 1, 'Brezzi Rossetti 1987', 'Brezzi Rossetti 1987'),
(201, 'items', 1, 1, 'Ristorto 1977', 'Ristorto 1977\nhttps://www.archiviocasalis.it/localized-install/content/castelletto-stura  '),
(208, 'items', 1, 1, 'Mappa Itinerari terre cisalpine - Francia', 'Mappa Itinerari terre cisalpine - Francia'),
(210, 'items', 1, 1, 'Valle Gesso – Strade di transito: Itinerari terre cisalpine - Francia', 'Valle Gesso – Strade di transito: Itinerari terre cisalpine - Francia\nMappa Itinerari terre cisalpine - Francia'),
(212, 'items', 1, 1, 'Confraternita di Santa Croce \na Entracque: Confronto chiese Santa Croce', 'Confraternita di Santa Croce \na Entracque: Confronto chiese Santa Croce\nChiesa della Confraternita di Santa Croce a Cuneo\nChiesa della Confraternita di Santa Croce a Entracque'),
(214, 'items', 1, 1, 'Confraternita di Santa Croce \na Entracque: Bartoletti 2003', 'Confraternita di Santa Croce \na Entracque: Bartoletti 2003\n[Bartoletti 2003] Massimo Bartoletti, Tra Cuneo, le sue valli, la Riviera di Ponente e il Nizzardo durante il Seicento, in Cantieri e documenti del Barocco. Cuneo e le sue valli, a cura di G. Romano, G. Spione,  catalogo della mostra, Cuneo 2003 (nello specifico il paragrafo su i pittori Bruno ).');

-- --------------------------------------------------------

--
-- Struttura della tabella `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `item`
--

INSERT INTO `item` (`id`) VALUES
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28),
(29),
(30),
(31),
(32),
(33),
(34),
(35),
(36),
(37),
(38),
(39),
(40),
(41),
(42),
(43),
(44),
(45),
(46),
(47),
(48),
(49),
(50),
(51),
(52),
(53),
(54),
(55),
(56),
(57),
(58),
(59),
(60),
(61),
(62),
(63),
(64),
(65),
(66),
(67),
(68),
(69),
(70),
(71),
(72),
(73),
(74),
(75),
(78),
(80),
(81),
(82),
(83),
(84),
(85),
(86),
(87),
(88),
(89),
(90),
(91),
(92),
(93),
(94),
(95),
(96),
(97),
(98),
(99),
(100),
(101),
(102),
(103),
(104),
(105),
(106),
(107),
(108),
(109),
(110),
(111),
(112),
(113),
(114),
(115),
(116),
(117),
(118),
(121),
(122),
(123),
(124),
(125),
(126),
(127),
(128),
(129),
(130),
(131),
(132),
(133),
(134),
(135),
(136),
(138),
(139),
(140),
(141),
(142),
(143),
(144),
(145),
(146),
(147),
(148),
(149),
(150),
(151),
(152),
(153),
(154),
(155),
(156),
(157),
(159),
(160),
(161),
(162),
(164),
(165),
(166),
(168),
(171),
(172),
(174),
(176),
(177),
(178),
(180),
(182),
(184),
(186),
(187),
(189),
(191),
(193),
(195),
(197),
(198),
(199),
(201),
(208),
(210),
(212),
(214);

-- --------------------------------------------------------

--
-- Struttura della tabella `item_item_set`
--

CREATE TABLE `item_item_set` (
  `item_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `item_item_set`
--

INSERT INTO `item_item_set` (`item_id`, `item_set_id`) VALUES
(4, 167),
(5, 167),
(6, 167),
(7, 167),
(8, 167),
(9, 167),
(10, 167),
(11, 167),
(12, 167),
(13, 167),
(14, 167),
(15, 167),
(16, 167),
(17, 167),
(18, 167),
(19, 167),
(20, 167),
(21, 167),
(22, 167),
(23, 167),
(24, 167),
(25, 167),
(26, 167),
(27, 167),
(28, 167),
(29, 167),
(30, 167),
(31, 167),
(32, 167),
(33, 167),
(34, 167),
(35, 167),
(36, 167),
(37, 167),
(38, 167),
(39, 167),
(40, 167),
(41, 167),
(42, 167),
(43, 167),
(44, 167),
(45, 167),
(46, 167),
(47, 167),
(48, 167),
(49, 167),
(50, 167),
(51, 167),
(52, 167),
(53, 167),
(54, 167),
(55, 167),
(56, 167),
(57, 167),
(58, 167),
(59, 167),
(60, 167),
(61, 167),
(62, 167),
(63, 167),
(64, 167),
(65, 167),
(66, 167),
(67, 167),
(68, 167),
(69, 167),
(70, 167),
(71, 167),
(72, 167),
(73, 167),
(74, 167),
(75, 167),
(78, 167),
(80, 167),
(81, 167),
(82, 167),
(83, 167),
(84, 167),
(85, 167),
(86, 167),
(87, 167),
(88, 167),
(89, 167),
(90, 167),
(91, 167),
(92, 167),
(93, 167),
(94, 167),
(95, 167),
(96, 167),
(97, 167),
(98, 167),
(99, 167),
(100, 167),
(101, 167),
(102, 167),
(103, 167),
(104, 167),
(105, 167),
(106, 167),
(107, 167),
(108, 167),
(109, 167),
(110, 167),
(111, 167),
(112, 167),
(113, 167),
(114, 167),
(115, 167),
(116, 167),
(117, 167),
(118, 167),
(121, 167),
(122, 167),
(123, 167),
(124, 167),
(125, 167),
(126, 167),
(127, 167),
(128, 167),
(129, 167),
(130, 167),
(131, 167),
(132, 167),
(133, 167),
(134, 167),
(135, 167),
(136, 167),
(138, 167),
(139, 167),
(140, 167),
(141, 167),
(142, 167),
(143, 167),
(144, 167),
(145, 167),
(146, 167),
(147, 167),
(148, 167),
(149, 167),
(150, 167),
(151, 167),
(152, 167),
(153, 167),
(154, 167),
(155, 167),
(156, 167),
(157, 167),
(159, 167),
(160, 167),
(161, 167),
(162, 167),
(164, 167),
(165, 167),
(166, 167),
(168, 167),
(171, 167),
(172, 167),
(174, 167),
(176, 167),
(177, 167);

-- --------------------------------------------------------

--
-- Struttura della tabella `item_set`
--

CREATE TABLE `item_set` (
  `id` int(11) NOT NULL,
  `is_open` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `item_set`
--

INSERT INTO `item_set` (`id`, `is_open`) VALUES
(167, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `item_site`
--

CREATE TABLE `item_site` (
  `item_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `item_site`
--

INSERT INTO `item_site` (`item_id`, `site_id`) VALUES
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(78, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 1),
(142, 1),
(143, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1),
(151, 1),
(152, 1),
(153, 1),
(154, 1),
(155, 1),
(156, 1),
(157, 1),
(159, 1),
(160, 1),
(161, 1),
(162, 1),
(164, 1),
(165, 1),
(166, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `pid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `args` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `log` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `started` datetime NOT NULL,
  `ended` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `job`
--

INSERT INTO `job` (`id`, `owner_id`, `pid`, `status`, `class`, `args`, `log`, `started`, `ended`) VALUES
(1, 1, '59265', 'completed', 'Omeka\\Job\\BatchUpdate', '{\"resource\":\"items\",\"query\":[],\"data\":[],\"data_remove\":{\"o:resource_class\":{\"o:id\":\"444\"},\"set_value_visibility\":\"\"},\"data_append\":[]}', NULL, '2021-07-26 09:30:06', '2021-07-26 09:30:07'),
(2, 1, '50570', 'completed', 'Omeka\\Job\\BatchUpdate', '{\"resource\":\"items\",\"query\":[],\"data\":[],\"data_remove\":{\"set_value_visibility\":\"\"},\"data_append\":[]}', NULL, '2021-08-23 13:34:25', '2021-08-23 13:34:26'),
(3, 1, '50654', 'completed', 'Omeka\\Job\\BatchUpdate', '{\"resource\":\"items\",\"query\":[],\"data\":[],\"data_remove\":{\"set_value_visibility\":\"\"},\"data_append\":{\"o:item_set\":[\"167\"]}}', NULL, '2021-08-23 13:35:14', '2021-08-23 13:35:15'),
(4, 1, '50978', 'completed', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"1\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"eq\",\"text\":\"\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', NULL, '2021-08-23 13:38:33', '2021-08-23 13:38:34'),
(5, 1, '43087', 'completed', 'Omeka\\Job\\BatchUpdate', '{\"resource\":\"items\",\"query\":[],\"data\":[],\"data_remove\":{\"set_value_visibility\":\"\"},\"data_append\":{\"o:item_set\":[\"167\"]}}', NULL, '2021-09-14 15:55:53', '2021-09-14 15:55:54'),
(6, 2, NULL, 'error', 'Datavis\\Job\\GenerateDataset', '{\"datavis_vis_id\":1}', '2022-01-30T22:50:37+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: invalid PHP path. in D:\\xampp\\htdocs\\omekas\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:63\nStack trace:\n#0 D:\\xampp\\htdocs\\omekas\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 D:\\xampp\\htdocs\\omekas\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 D:\\xampp\\htdocs\\omekas\\modules\\Datavis\\src\\Controller\\SiteAdmin\\IndexController.php(190): Omeka\\Job\\Dispatcher->dispatch(\'Datavis\\\\Job\\\\Gen...\', Array)\n#3 D:\\xampp\\htdocs\\omekas\\modules\\Datavis\\src\\Controller\\SiteAdmin\\IndexController.php(82): Datavis\\Controller\\SiteAdmin\\IndexController->dispatchDatasetGeneration(Object(Datavis\\Api\\Representation\\DatavisVisRepresentation))\n#4 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Datavis\\Controller\\SiteAdmin\\IndexController->addAction()\n#5 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#6 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#7 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(103): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#8 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#9 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#10 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#11 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#12 D:\\xampp\\htdocs\\omekas\\index.php(21): Laminas\\Mvc\\Application->run()\n#13 {main}\r\n', '2022-01-30 22:50:37', '2022-01-30 22:50:37'),
(7, 2, NULL, 'error', 'Datavis\\Job\\GenerateDataset', '{\"datavis_vis_id\":1}', '2022-01-30T22:51:35+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: invalid PHP path. in D:\\xampp\\htdocs\\omekas\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:63\nStack trace:\n#0 D:\\xampp\\htdocs\\omekas\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 D:\\xampp\\htdocs\\omekas\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 D:\\xampp\\htdocs\\omekas\\modules\\Datavis\\src\\Controller\\SiteAdmin\\IndexController.php(190): Omeka\\Job\\Dispatcher->dispatch(\'Datavis\\\\Job\\\\Gen...\', Array)\n#3 D:\\xampp\\htdocs\\omekas\\modules\\Datavis\\src\\Controller\\SiteAdmin\\IndexController.php(127): Datavis\\Controller\\SiteAdmin\\IndexController->dispatchDatasetGeneration(Object(Datavis\\Api\\Representation\\DatavisVisRepresentation))\n#4 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Datavis\\Controller\\SiteAdmin\\IndexController->editAction()\n#5 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#6 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#7 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(103): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#8 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#9 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#10 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#11 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#12 D:\\xampp\\htdocs\\omekas\\index.php(21): Laminas\\Mvc\\Application->run()\n#13 {main}\r\n', '2022-01-30 22:51:35', '2022-01-30 22:51:35'),
(8, 2, NULL, 'error', 'Datavis\\Job\\GenerateDataset', '{\"datavis_vis_id\":1}', '2022-01-30T22:51:53+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: invalid PHP path. in D:\\xampp\\htdocs\\omekas\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:63\nStack trace:\n#0 D:\\xampp\\htdocs\\omekas\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 D:\\xampp\\htdocs\\omekas\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 D:\\xampp\\htdocs\\omekas\\modules\\Datavis\\src\\Controller\\SiteAdmin\\IndexController.php(190): Omeka\\Job\\Dispatcher->dispatch(\'Datavis\\\\Job\\\\Gen...\', Array)\n#3 D:\\xampp\\htdocs\\omekas\\modules\\Datavis\\src\\Controller\\SiteAdmin\\IndexController.php(127): Datavis\\Controller\\SiteAdmin\\IndexController->dispatchDatasetGeneration(Object(Datavis\\Api\\Representation\\DatavisVisRepresentation))\n#4 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Datavis\\Controller\\SiteAdmin\\IndexController->editAction()\n#5 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#6 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#7 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(103): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#8 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#9 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#10 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#11 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#12 D:\\xampp\\htdocs\\omekas\\index.php(21): Laminas\\Mvc\\Application->run()\n#13 {main}\r\n', '2022-01-30 22:51:53', '2022-01-30 22:51:53'),
(9, 2, NULL, 'error', 'Datavis\\Job\\GenerateDataset', '{\"datavis_vis_id\":1}', '2022-01-30T22:52:14+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: invalid PHP path. in D:\\xampp\\htdocs\\omekas\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:63\nStack trace:\n#0 D:\\xampp\\htdocs\\omekas\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 D:\\xampp\\htdocs\\omekas\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 D:\\xampp\\htdocs\\omekas\\modules\\Datavis\\src\\Controller\\SiteAdmin\\IndexController.php(190): Omeka\\Job\\Dispatcher->dispatch(\'Datavis\\\\Job\\\\Gen...\', Array)\n#3 D:\\xampp\\htdocs\\omekas\\modules\\Datavis\\src\\Controller\\SiteAdmin\\IndexController.php(127): Datavis\\Controller\\SiteAdmin\\IndexController->dispatchDatasetGeneration(Object(Datavis\\Api\\Representation\\DatavisVisRepresentation))\n#4 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Datavis\\Controller\\SiteAdmin\\IndexController->editAction()\n#5 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#6 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#7 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(103): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#8 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#9 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#10 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#11 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#12 D:\\xampp\\htdocs\\omekas\\index.php(21): Laminas\\Mvc\\Application->run()\n#13 {main}\r\n', '2022-01-30 22:52:14', '2022-01-30 22:52:14'),
(10, 2, NULL, 'error', 'Datavis\\Job\\GenerateDataset', '{\"datavis_vis_id\":2}', '2022-01-30T23:51:01+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: invalid PHP path. in D:\\xampp\\htdocs\\omekas\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:63\nStack trace:\n#0 D:\\xampp\\htdocs\\omekas\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 D:\\xampp\\htdocs\\omekas\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 D:\\xampp\\htdocs\\omekas\\modules\\Datavis\\src\\Controller\\SiteAdmin\\IndexController.php(190): Omeka\\Job\\Dispatcher->dispatch(\'Datavis\\\\Job\\\\Gen...\', Array)\n#3 D:\\xampp\\htdocs\\omekas\\modules\\Datavis\\src\\Controller\\SiteAdmin\\IndexController.php(82): Datavis\\Controller\\SiteAdmin\\IndexController->dispatchDatasetGeneration(Object(Datavis\\Api\\Representation\\DatavisVisRepresentation))\n#4 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Datavis\\Controller\\SiteAdmin\\IndexController->addAction()\n#5 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#6 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#7 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(103): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#8 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#9 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#10 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#11 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#12 D:\\xampp\\htdocs\\omekas\\index.php(21): Laminas\\Mvc\\Application->run()\n#13 {main}\r\n', '2022-01-30 23:51:01', '2022-01-30 23:51:01'),
(11, 2, NULL, 'error', 'CreateMissingThumbnails\\Job\\CreateMissingThumbnails', NULL, '2022-01-30T23:57:11+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: invalid PHP path. in D:\\xampp\\htdocs\\omekas\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:63\nStack trace:\n#0 D:\\xampp\\htdocs\\omekas\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 D:\\xampp\\htdocs\\omekas\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 D:\\xampp\\htdocs\\omekas\\modules\\CreateMissingThumbnails\\src\\Controller\\Admin\\IndexController.php(22): Omeka\\Job\\Dispatcher->dispatch(\'CreateMissingTh...\')\n#3 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): CreateMissingThumbnails\\Controller\\Admin\\IndexController->indexAction()\n#4 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(103): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 D:\\xampp\\htdocs\\omekas\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 D:\\xampp\\htdocs\\omekas\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2022-01-30 23:57:11', '2022-01-30 23:57:11');

-- --------------------------------------------------------

--
-- Struttura della tabella `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `ingester` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `renderer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `source` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storage_id` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sha256` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `has_original` tinyint(1) NOT NULL,
  `has_thumbnails` tinyint(1) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `lang` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `media`
--

INSERT INTO `media` (`id`, `item_id`, `ingester`, `renderer`, `data`, `source`, `media_type`, `storage_id`, `extension`, `sha256`, `size`, `has_original`, `has_thumbnails`, `position`, `lang`, `alt_text`) VALUES
(137, 33, 'upload', 'file', NULL, 'Castelletto_stura_san_bernardo.jpeg', 'image/jpeg', 'd58b26cf9dacb4697c1bf08fde1ee94890113c27', 'jpeg', '5b7eb11744453268ad45fa9e7ef9228da6b0767689f0faf003a48ba8d8f9dd04', 92026, 1, 1, 1, NULL, NULL),
(169, 168, 'upload', 'file', NULL, 'Entracque_exVoto_1.jpg', 'image/jpeg', '815a115ae013ddee7a5d8730ad0dde546df4259d', 'jpg', 'b779751307a59b25c5fb5b136cecb49d324330b748ab09a6463cccfb552f1a67', 18365, 1, 1, 1, NULL, NULL),
(170, 168, 'upload', 'file', NULL, 'Entracque_exVoto_2.jpg', 'image/jpeg', 'b4c0f16e2708ffce3de072bdc5b4cd6475c3cb4a', 'jpg', 'abd14b0ff5e4cabf776cb2d50390009f3f57dda23c0ee08dd64e5fe632606ced', 18238, 1, 1, 2, NULL, NULL),
(173, 172, 'upload', 'file', NULL, 'Entracque_Casalis.pdf', 'application/pdf', '6d7c9fcb50d50ff9fbef34d6135503873090f59a', 'pdf', '46582dc351a8da79874de225fcf96e7241e4a4e33a8088d57000fdf570fa63e8', 483094, 1, 0, 1, NULL, NULL),
(175, 174, 'upload', 'file', NULL, 'Entracque_BRUNOS_Croce.pdf', 'application/pdf', '3f222d51f2f37b7de394351aad89f84635e45468', 'pdf', '29410f7f08dc65142af5361d17aa0aeb0d5f0fa12bd969c9a968636873334e48', 2854883, 1, 0, 1, NULL, NULL),
(179, 178, 'upload', 'file', NULL, 'CastellettoScene della Passione.pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', '30bb705b6f69aacd901a1bf31865bd5f496deb38', 'pptx', 'a0c9f48781adecd77c5bfa9a5e86de4c22a097e8682f2137ae91ee362c1c070a', 1662612, 1, 0, 1, NULL, NULL),
(181, 180, 'upload', 'file', NULL, 'CastellettoInfernoParadiso.pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', '124ebe57bc47cd93a8a8c0da520d1e88605befe9', 'pptx', '8db9392b8385b124899e282697d0fcbbc9b116c75abce60816598d35aa1578d2', 519761, 1, 0, 1, NULL, NULL),
(183, 182, 'upload', 'file', NULL, 'TeorieSanti_interno.jpg', 'image/jpeg', 'eb6265f72d9601b74500e36128e4e3e4c31b62f8', 'jpg', 'aac784e858e5fba4a711da852539d5b1f29c913adee7db33af355abe4c63e9ee', 60047, 1, 1, 1, NULL, NULL),
(185, 184, 'upload', 'file', NULL, 'TeorieSanti_facciata.jpg', 'image/jpeg', '0a737bfcbe643125ac7103527b0ffec71d640323', 'jpg', '69eb8aeb9b641848039da738ab253244c3bd750767fa5d9fff29477abc1ddca4', 31429, 1, 1, 1, NULL, NULL),
(188, 187, 'upload', 'file', NULL, 'MazzuccoCommittenti.jpg', 'image/jpeg', '452271abcc813937ba65143c481f19b6cce5b71e', 'jpg', 'fddc400eb2c326905595f107174ed1f45eb4a2623b75d8f7d685477490a8dcfe', 125085, 1, 1, 1, NULL, NULL),
(190, 189, 'upload', 'file', NULL, 'Madonna_con_bambino.jpg', 'image/jpeg', 'ae8ebd89fcc89afe0a407735c4b2f1536bac4016', 'jpg', 'c574585646b60ac502948bb63957fcfd7fef9711a2bee9a40cd43cc302862661', 54328, 1, 1, 1, NULL, NULL),
(192, 191, 'upload', 'file', NULL, 'Madonna_con_bambino2.jpg', 'image/jpeg', '8c26b00cb427dd7ed613d491f648b0ce9074704b', 'jpg', 'ed1763ca395abf161550a27153e3b84b44ab8948d72144ec326183ac9dec411b', 39027, 1, 1, 1, NULL, NULL),
(194, 193, 'upload', 'file', NULL, 'Madonna_con_bambino3.jpg', 'image/jpeg', '3bebcec5f4364da85cf4d76b206fe44a12ea36f8', 'jpg', '3df211f787129dbe84de916d1c3514a538db7fa4649f9bd5930b637c24c51a82', 51425, 1, 1, 1, NULL, NULL),
(196, 195, 'upload', 'file', NULL, 'Decorazione_convento.jpg', 'image/jpeg', 'ec1252466353b7c878214c11b91967c4e296b894', 'jpg', '25601c5aea5599f7bdd9bbe49b3e938249ebfa81cd3944c3947e777e41815622', 96703, 1, 1, 1, NULL, NULL),
(200, 199, 'upload', 'file', NULL, 'Mazzuccobio.pdf', 'application/pdf', '6aac37ece349bb85c33f0c2b8aa4dd9dce106680', 'pdf', '81cc66d4e33ba7f7d501b7e1512d575924df4559e46c656d0073bc917e883379', 769528, 1, 0, 1, NULL, NULL),
(202, 201, 'upload', 'file', NULL, 'Castelletto Stura2.pdf', 'application/pdf', 'f2093acf52a581024cf1fd190a6d6bd1be29c4bf', 'pdf', 'f125af9d18c5990130b2298d2428b2b79583c2c9a9286ef1f0f5d6eb3d75318b', 222536, 1, 0, 1, NULL, NULL),
(203, 146, 'upload', 'file', NULL, 'CASTELLETTODiocesiCuneo_1511.jpg', 'image/jpeg', 'e89914f001810fe0f6625cd57010216f4ea21db5', 'jpg', 'd3a42858e06079f83646839934a2f1bb5dbcbdbab1b3810063ddd955f9d3004e', 182851, 1, 1, 1, NULL, NULL),
(204, 146, 'upload', 'file', NULL, 'CASTELLETTODiocesiCuneo_1817.jpg', 'image/jpeg', '0d2ea5aba5b3e1a2813cbb93eaf154cbb1ac2b74', 'jpg', '3f554658cf001ac9b0b41c2b664b4fc908618d0fde1c39a3ef88b3963ca80591', 185722, 1, 1, 2, NULL, NULL),
(205, 166, 'upload', 'file', NULL, 'ValleGesso_inaugurazione_tunnel_stradale_Tenda.jpg', 'image/jpeg', '0e681bc21535ff350033d6c265416fd1bd15df3a', 'jpg', '6a86df5cd2a1b45bd37c81fd29f875dcdcb08623371f48beea5c864d85645d52', 233764, 1, 1, 1, NULL, NULL),
(206, 166, 'upload', 'file', NULL, 'ValleGesso_inaugurazione_tunnel_ferrovia_Tenda.jpg', 'image/jpeg', '2dd85a073be810c4fdaddcd7dee333f2a825d9c2', 'jpg', '7a2f3be069e26e225b4f5e01ef68289e257e775f9961821d1d3b4a5306d7574c', 114396, 1, 1, 2, NULL, NULL),
(207, 165, 'upload', 'file', NULL, 'ValleGesso_TrasportoTorinoNizza.jpg', 'image/jpeg', 'ab2313b46b1c37a8b899625426a4743d5e061367', 'jpg', '06f6e37ac1cbc548c79729342ee4b22b9a33be38f61f095d9906f740cea3fd72', 103779, 1, 1, 1, NULL, NULL),
(209, 208, 'upload', 'file', NULL, 'ValleGesso_Due_itinerari.jpg', 'image/jpeg', 'e65a4b24bbdc761ea2dc7ccd57ea89c688d2e546', 'jpg', 'ce654587dfa9e20707853cd2098b2fc2786e5ad7f9057bf1c0efc17591177408', 95471, 1, 1, 1, NULL, NULL),
(211, 210, 'upload', 'file', NULL, 'ValleGesso_Due_itinerari.jpg', 'image/jpeg', '6beeeea113268acb99e3412cb2c5872997ad070f', 'jpg', 'ce654587dfa9e20707853cd2098b2fc2786e5ad7f9057bf1c0efc17591177408', 95471, 1, 1, 1, NULL, NULL),
(213, 212, 'upload', 'file', NULL, 'Entracque_confronto_chiese.jpg', 'image/jpeg', '77c74fbd159dbf9a15c335acda468cdafdf26248', 'jpg', 'ca74d82a4d4b166c19bd5b2cdd1bf52fe6a76f9ff3d29b670f3e357cfb703cbb', 140818, 1, 1, 1, NULL, NULL),
(215, 214, 'upload', 'file', NULL, 'Entracque_BRUNOS_Croce.pdf', 'application/pdf', '431345830c8fdcdc7a473160f612c4050fe8fb75', 'pdf', '29410f7f08dc65142af5361d17aa0aeb0d5f0fa12bd969c9a968636873334e48', 2854883, 1, 0, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `migration`
--

CREATE TABLE `migration` (
  `version` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `migration`
--

INSERT INTO `migration` (`version`) VALUES
('20171128053327'),
('20180412035023'),
('20180919072656'),
('20180924033501'),
('20181002015551'),
('20181004043735'),
('20181106060421'),
('20190307043537'),
('20190319020708'),
('20190412090532'),
('20190423040354'),
('20190423071228'),
('20190514061351'),
('20190515055359'),
('20190729023728'),
('20190809092609'),
('20190815062003'),
('20200224022356'),
('20200226064602'),
('20200325091157'),
('20200326091310'),
('20200803000000'),
('20200831000000'),
('20210205101827'),
('20210225095734');

-- --------------------------------------------------------

--
-- Struttura della tabella `module`
--

CREATE TABLE `module` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `module`
--

INSERT INTO `module` (`id`, `is_active`, `version`) VALUES
('AdvancedSearch', 1, '3.3.6.9'),
('CreateMissingThumbnails', 1, '0.2.0'),
('Datavis', 1, '1.0.0'),
('EasyInstall', 1, '3.3.6'),
('ValueSuggest', 1, '1.9.0'),
('Wikidata', 1, '1.4.0');

-- --------------------------------------------------------

--
-- Struttura della tabella `password_creation`
--

CREATE TABLE `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `property`
--

CREATE TABLE `property` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `property`
--

INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'title', 'Title', 'A name given to the resource.'),
(2, NULL, 1, 'creator', 'Creator', 'An entity primarily responsible for making the resource.'),
(3, NULL, 1, 'subject', 'Subject', 'The topic of the resource.'),
(4, NULL, 1, 'description', 'Description', 'An account of the resource.'),
(5, NULL, 1, 'publisher', 'Publisher', 'An entity responsible for making the resource available.'),
(6, NULL, 1, 'contributor', 'Contributor', 'An entity responsible for making contributions to the resource.'),
(7, NULL, 1, 'date', 'Date', 'A point or period of time associated with an event in the lifecycle of the resource.'),
(8, NULL, 1, 'type', 'Type', 'The nature or genre of the resource.'),
(9, NULL, 1, 'format', 'Format', 'The file format, physical medium, or dimensions of the resource.'),
(10, NULL, 1, 'identifier', 'Identifier', 'An unambiguous reference to the resource within a given context.'),
(11, NULL, 1, 'source', 'Source', 'A related resource from which the described resource is derived.'),
(12, NULL, 1, 'language', 'Language', 'A language of the resource.'),
(13, NULL, 1, 'relation', 'Relation', 'A related resource.'),
(14, NULL, 1, 'coverage', 'Coverage', 'The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant.'),
(15, NULL, 1, 'rights', 'Rights', 'Information about rights held in and over the resource.'),
(16, NULL, 1, 'audience', 'Audience', 'A class of entity for whom the resource is intended or useful.'),
(17, NULL, 1, 'alternative', 'Alternative Title', 'An alternative name for the resource.'),
(18, NULL, 1, 'tableOfContents', 'Table Of Contents', 'A list of subunits of the resource.'),
(19, NULL, 1, 'abstract', 'Abstract', 'A summary of the resource.'),
(20, NULL, 1, 'created', 'Date Created', 'Date of creation of the resource.'),
(21, NULL, 1, 'valid', 'Date Valid', 'Date (often a range) of validity of a resource.'),
(22, NULL, 1, 'available', 'Date Available', 'Date (often a range) that the resource became or will become available.'),
(23, NULL, 1, 'issued', 'Date Issued', 'Date of formal issuance (e.g., publication) of the resource.'),
(24, NULL, 1, 'modified', 'Date Modified', 'Date on which the resource was changed.'),
(25, NULL, 1, 'extent', 'Extent', 'The size or duration of the resource.'),
(26, NULL, 1, 'medium', 'Medium', 'The material or physical carrier of the resource.'),
(27, NULL, 1, 'isVersionOf', 'Is Version Of', 'A related resource of which the described resource is a version, edition, or adaptation.'),
(28, NULL, 1, 'hasVersion', 'Has Version', 'A related resource that is a version, edition, or adaptation of the described resource.'),
(29, NULL, 1, 'isReplacedBy', 'Is Replaced By', 'A related resource that supplants, displaces, or supersedes the described resource.'),
(30, NULL, 1, 'replaces', 'Replaces', 'A related resource that is supplanted, displaced, or superseded by the described resource.'),
(31, NULL, 1, 'isRequiredBy', 'Is Required By', 'A related resource that requires the described resource to support its function, delivery, or coherence.'),
(32, NULL, 1, 'requires', 'Requires', 'A related resource that is required by the described resource to support its function, delivery, or coherence.'),
(33, NULL, 1, 'isPartOf', 'Is Part Of', 'A related resource in which the described resource is physically or logically included.'),
(34, NULL, 1, 'hasPart', 'Has Part', 'A related resource that is included either physically or logically in the described resource.'),
(35, NULL, 1, 'isReferencedBy', 'Is Referenced By', 'A related resource that references, cites, or otherwise points to the described resource.'),
(36, NULL, 1, 'references', 'References', 'A related resource that is referenced, cited, or otherwise pointed to by the described resource.'),
(37, NULL, 1, 'isFormatOf', 'Is Format Of', 'A related resource that is substantially the same as the described resource, but in another format.'),
(38, NULL, 1, 'hasFormat', 'Has Format', 'A related resource that is substantially the same as the pre-existing described resource, but in another format.'),
(39, NULL, 1, 'conformsTo', 'Conforms To', 'An established standard to which the described resource conforms.'),
(40, NULL, 1, 'spatial', 'Spatial Coverage', 'Spatial characteristics of the resource.'),
(41, NULL, 1, 'temporal', 'Temporal Coverage', 'Temporal characteristics of the resource.'),
(42, NULL, 1, 'mediator', 'Mediator', 'An entity that mediates access to the resource and for whom the resource is intended or useful.'),
(43, NULL, 1, 'dateAccepted', 'Date Accepted', 'Date of acceptance of the resource.'),
(44, NULL, 1, 'dateCopyrighted', 'Date Copyrighted', 'Date of copyright.'),
(45, NULL, 1, 'dateSubmitted', 'Date Submitted', 'Date of submission of the resource.'),
(46, NULL, 1, 'educationLevel', 'Audience Education Level', 'A class of entity, defined in terms of progression through an educational or training context, for which the described resource is intended.'),
(47, NULL, 1, 'accessRights', 'Access Rights', 'Information about who can access the resource or an indication of its security status.'),
(48, NULL, 1, 'bibliographicCitation', 'Bibliographic Citation', 'A bibliographic reference for the resource.'),
(49, NULL, 1, 'license', 'License', 'A legal document giving official permission to do something with the resource.'),
(50, NULL, 1, 'rightsHolder', 'Rights Holder', 'A person or organization owning or managing rights over the resource.'),
(51, NULL, 1, 'provenance', 'Provenance', 'A statement of any changes in ownership and custody of the resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(52, NULL, 1, 'instructionalMethod', 'Instructional Method', 'A process, used to engender knowledge, attitudes and skills, that the described resource is designed to support.'),
(53, NULL, 1, 'accrualMethod', 'Accrual Method', 'The method by which items are added to a collection.'),
(54, NULL, 1, 'accrualPeriodicity', 'Accrual Periodicity', 'The frequency with which items are added to a collection.'),
(55, NULL, 1, 'accrualPolicy', 'Accrual Policy', 'The policy governing the addition of items to a collection.'),
(56, NULL, 3, 'affirmedBy', 'affirmedBy', 'A legal decision that affirms a ruling.'),
(57, NULL, 3, 'annotates', 'annotates', 'Critical or explanatory note for a Document.'),
(58, NULL, 3, 'authorList', 'list of authors', 'An ordered list of authors. Normally, this list is seen as a priority list that order authors by importance.'),
(59, NULL, 3, 'citedBy', 'cited by', 'Relates a document to another document that cites the\nfirst document.'),
(60, NULL, 3, 'cites', 'cites', 'Relates a document to another document that is cited\nby the first document as reference, comment, review, quotation or for\nanother purpose.'),
(61, NULL, 3, 'contributorList', 'list of contributors', 'An ordered list of contributors. Normally, this list is seen as a priority list that order contributors by importance.'),
(62, NULL, 3, 'court', 'court', 'A court associated with a legal document; for example, that which issues a decision.'),
(63, NULL, 3, 'degree', 'degree', 'The thesis degree.'),
(64, NULL, 3, 'director', 'director', 'A Film director.'),
(65, NULL, 3, 'distributor', 'distributor', 'Distributor of a document or a collection of documents.'),
(66, NULL, 3, 'editor', 'editor', 'A person having managerial and sometimes policy-making responsibility for the editorial part of a publishing firm or of a newspaper, magazine, or other publication.'),
(67, NULL, 3, 'editorList', 'list of editors', 'An ordered list of editors. Normally, this list is seen as a priority list that order editors by importance.'),
(68, NULL, 3, 'interviewee', 'interviewee', 'An agent that is interviewed by another agent.'),
(69, NULL, 3, 'interviewer', 'interviewer', 'An agent that interview another agent.'),
(70, NULL, 3, 'issuer', 'issuer', 'An entity responsible for issuing often informally published documents such as press releases, reports, etc.'),
(71, NULL, 3, 'organizer', 'organizer', 'The organizer of an event; includes conference organizers, but also government agencies or other bodies that are responsible for conducting hearings.'),
(72, NULL, 3, 'owner', 'owner', 'Owner of a document or a collection of documents.'),
(73, NULL, 3, 'performer', 'performer', NULL),
(74, NULL, 3, 'presentedAt', 'presented at', 'Relates a document to an event; for example, a paper to a conference.'),
(75, NULL, 3, 'presents', 'presents', 'Relates an event to associated documents; for example, conference to a paper.'),
(76, NULL, 3, 'producer', 'producer', 'Producer of a document or a collection of documents.'),
(77, NULL, 3, 'recipient', 'recipient', 'An agent that receives a communication document.'),
(78, NULL, 3, 'reproducedIn', 'reproducedIn', 'The resource in which another resource is reproduced.'),
(79, NULL, 3, 'reversedBy', 'reversedBy', 'A legal decision that reverses a ruling.'),
(80, NULL, 3, 'reviewOf', 'review of', 'Relates a review document to a reviewed thing (resource, item, etc.).'),
(81, NULL, 3, 'status', 'status', 'The publication status of (typically academic) content.'),
(82, NULL, 3, 'subsequentLegalDecision', 'subsequentLegalDecision', 'A legal decision on appeal that takes action on a case (affirming it, reversing it, etc.).'),
(83, NULL, 3, 'transcriptOf', 'transcript of', 'Relates a document to some transcribed original.'),
(84, NULL, 3, 'translationOf', 'translation of', 'Relates a translated document to the original document.'),
(85, NULL, 3, 'translator', 'translator', 'A person who translates written document from one language to another.'),
(86, NULL, 3, 'abstract', 'abstract', 'A summary of the resource.'),
(87, NULL, 3, 'argued', 'date argued', 'The date on which a legal case is argued before a court. Date is of format xsd:date'),
(88, NULL, 3, 'asin', 'asin', NULL),
(89, NULL, 3, 'chapter', 'chapter', 'An chapter number'),
(90, NULL, 3, 'coden', 'coden', NULL),
(91, NULL, 3, 'content', 'content', 'This property is for a plain-text rendering of the content of a Document. While the plain-text content of an entire document could be described by this property.'),
(92, NULL, 3, 'doi', 'doi', NULL),
(93, NULL, 3, 'eanucc13', 'eanucc13', NULL),
(94, NULL, 3, 'edition', 'edition', 'The name defining a special edition of a document. Normally its a literal value composed of a version number and words.'),
(95, NULL, 3, 'eissn', 'eissn', NULL),
(96, NULL, 3, 'gtin14', 'gtin14', NULL),
(97, NULL, 3, 'handle', 'handle', NULL),
(98, NULL, 3, 'identifier', 'identifier', NULL),
(99, NULL, 3, 'isbn', 'isbn', NULL),
(100, NULL, 3, 'isbn10', 'isbn10', NULL),
(101, NULL, 3, 'isbn13', 'isbn13', NULL),
(102, NULL, 3, 'issn', 'issn', NULL),
(103, NULL, 3, 'issue', 'issue', 'An issue number'),
(104, NULL, 3, 'lccn', 'lccn', NULL),
(105, NULL, 3, 'locator', 'locator', 'A description (often numeric) that locates an item within a containing document or collection.'),
(106, NULL, 3, 'numPages', 'number of pages', 'The number of pages contained in a document'),
(107, NULL, 3, 'numVolumes', 'number of volumes', 'The number of volumes contained in a collection of documents (usually a series, periodical, etc.).'),
(108, NULL, 3, 'number', 'number', 'A generic item or document number. Not to be confused with issue number.'),
(109, NULL, 3, 'oclcnum', 'oclcnum', NULL),
(110, NULL, 3, 'pageEnd', 'page end', 'Ending page number within a continuous page range.'),
(111, NULL, 3, 'pageStart', 'page start', 'Starting page number within a continuous page range.'),
(112, NULL, 3, 'pages', 'pages', 'A string of non-contiguous page spans that locate a Document within a Collection. Example: 23-25, 34, 54-56. For continuous page ranges, use the pageStart and pageEnd properties.'),
(113, NULL, 3, 'pmid', 'pmid', NULL),
(114, NULL, 3, 'prefixName', 'prefix name', 'The prefix of a name'),
(115, NULL, 3, 'section', 'section', 'A section number'),
(116, NULL, 3, 'shortDescription', 'shortDescription', NULL),
(117, NULL, 3, 'shortTitle', 'short title', 'The abbreviation of a title.'),
(118, NULL, 3, 'sici', 'sici', NULL),
(119, NULL, 3, 'suffixName', 'suffix name', 'The suffix of a name'),
(120, NULL, 3, 'upc', 'upc', NULL),
(121, NULL, 3, 'uri', 'uri', 'Universal Resource Identifier of a document'),
(122, NULL, 3, 'volume', 'volume', 'A volume number'),
(123, NULL, 4, 'mbox', 'personal mailbox', 'A  personal mailbox, ie. an Internet mailbox associated with exactly one owner, the first owner of this mailbox. This is a \'static inverse functional property\', in that  there is (across time and change) at most one individual that ever has any particular value for foaf:mbox.'),
(124, NULL, 4, 'mbox_sha1sum', 'sha1sum of a personal mailbox URI name', 'The sha1sum of the URI of an Internet mailbox associated with exactly one owner, the  first owner of the mailbox.'),
(125, NULL, 4, 'gender', 'gender', 'The gender of this Agent (typically but not necessarily \'male\' or \'female\').'),
(126, NULL, 4, 'geekcode', 'geekcode', 'A textual geekcode for this person, see http://www.geekcode.com/geek.html'),
(127, NULL, 4, 'dnaChecksum', 'DNA checksum', 'A checksum for the DNA of some thing. Joke.'),
(128, NULL, 4, 'sha1', 'sha1sum (hex)', 'A sha1sum hash, in hex.'),
(129, NULL, 4, 'based_near', 'based near', 'A location that something is based near, for some broadly human notion of near.'),
(130, NULL, 4, 'title', 'title', 'Title (Mr, Mrs, Ms, Dr. etc)'),
(131, NULL, 4, 'nick', 'nickname', 'A short informal nickname characterising an agent (includes login identifiers, IRC and other chat nicknames).'),
(132, NULL, 4, 'jabberID', 'jabber ID', 'A jabber ID for something.'),
(133, NULL, 4, 'aimChatID', 'AIM chat ID', 'An AIM chat ID'),
(134, NULL, 4, 'skypeID', 'Skype ID', 'A Skype ID'),
(135, NULL, 4, 'icqChatID', 'ICQ chat ID', 'An ICQ chat ID'),
(136, NULL, 4, 'yahooChatID', 'Yahoo chat ID', 'A Yahoo chat ID'),
(137, NULL, 4, 'msnChatID', 'MSN chat ID', 'An MSN chat ID'),
(138, NULL, 4, 'name', 'name', 'A name for some thing.'),
(139, NULL, 4, 'firstName', 'firstName', 'The first name of a person.'),
(140, NULL, 4, 'lastName', 'lastName', 'The last name of a person.'),
(141, NULL, 4, 'givenName', 'Given name', 'The given name of some person.'),
(142, NULL, 4, 'givenname', 'Given name', 'The given name of some person.'),
(143, NULL, 4, 'surname', 'Surname', 'The surname of some person.'),
(144, NULL, 4, 'family_name', 'family_name', 'The family name of some person.'),
(145, NULL, 4, 'familyName', 'familyName', 'The family name of some person.'),
(146, NULL, 4, 'phone', 'phone', 'A phone,  specified using fully qualified tel: URI scheme (refs: http://www.w3.org/Addressing/schemes.html#tel).'),
(147, NULL, 4, 'homepage', 'homepage', 'A homepage for some thing.'),
(148, NULL, 4, 'weblog', 'weblog', 'A weblog of some thing (whether person, group, company etc.).'),
(149, NULL, 4, 'openid', 'openid', 'An OpenID for an Agent.'),
(150, NULL, 4, 'tipjar', 'tipjar', 'A tipjar document for this agent, describing means for payment and reward.'),
(151, NULL, 4, 'plan', 'plan', 'A .plan comment, in the tradition of finger and \'.plan\' files.'),
(152, NULL, 4, 'made', 'made', 'Something that was made by this agent.'),
(153, NULL, 4, 'maker', 'maker', 'An agent that  made this thing.'),
(154, NULL, 4, 'img', 'image', 'An image that can be used to represent some thing (ie. those depictions which are particularly representative of something, eg. one\'s photo on a homepage).'),
(155, NULL, 4, 'depiction', 'depiction', 'A depiction of some thing.'),
(156, NULL, 4, 'depicts', 'depicts', 'A thing depicted in this representation.'),
(157, NULL, 4, 'thumbnail', 'thumbnail', 'A derived thumbnail image.'),
(158, NULL, 4, 'myersBriggs', 'myersBriggs', 'A Myers Briggs (MBTI) personality classification.'),
(159, NULL, 4, 'workplaceHomepage', 'workplace homepage', 'A workplace homepage of some person; the homepage of an organization they work for.'),
(160, NULL, 4, 'workInfoHomepage', 'work info homepage', 'A work info homepage of some person; a page about their work for some organization.'),
(161, NULL, 4, 'schoolHomepage', 'schoolHomepage', 'A homepage of a school attended by the person.'),
(162, NULL, 4, 'knows', 'knows', 'A person known by this person (indicating some level of reciprocated interaction between the parties).'),
(163, NULL, 4, 'interest', 'interest', 'A page about a topic of interest to this person.'),
(164, NULL, 4, 'topic_interest', 'topic_interest', 'A thing of interest to this person.'),
(165, NULL, 4, 'publications', 'publications', 'A link to the publications of this person.'),
(166, NULL, 4, 'currentProject', 'current project', 'A current project this person works on.'),
(167, NULL, 4, 'pastProject', 'past project', 'A project this person has previously worked on.'),
(168, NULL, 4, 'fundedBy', 'funded by', 'An organization funding a project or person.'),
(169, NULL, 4, 'logo', 'logo', 'A logo representing some thing.'),
(170, NULL, 4, 'topic', 'topic', 'A topic of some page or document.'),
(171, NULL, 4, 'primaryTopic', 'primary topic', 'The primary topic of some page or document.'),
(172, NULL, 4, 'focus', 'focus', 'The underlying or \'focal\' entity associated with some SKOS-described concept.'),
(173, NULL, 4, 'isPrimaryTopicOf', 'is primary topic of', 'A document that this thing is the primary topic of.'),
(174, NULL, 4, 'page', 'page', 'A page or document about this thing.'),
(175, NULL, 4, 'theme', 'theme', 'A theme.'),
(176, NULL, 4, 'account', 'account', 'Indicates an account held by this agent.'),
(177, NULL, 4, 'holdsAccount', 'account', 'Indicates an account held by this agent.'),
(178, NULL, 4, 'accountServiceHomepage', 'account service homepage', 'Indicates a homepage of the service provide for this online account.'),
(179, NULL, 4, 'accountName', 'account name', 'Indicates the name (identifier) associated with this online account.'),
(180, NULL, 4, 'member', 'member', 'Indicates a member of a Group'),
(181, NULL, 4, 'membershipClass', 'membershipClass', 'Indicates the class of individuals that are a member of a Group'),
(182, NULL, 4, 'birthday', 'birthday', 'The birthday of this Agent, represented in mm-dd string form, eg. \'12-31\'.'),
(183, NULL, 4, 'age', 'age', 'The age in years of some agent.'),
(184, NULL, 4, 'status', 'status', 'A string expressing what the user is happy for the general public (normally) to know about their current activity.'),
(345, 1, 9, 'abstracts_from', 'astrazione da', NULL),
(346, 1, 9, 'born_in', 'nato a', NULL),
(347, 1, 9, 'caused_by', 'causato da', NULL),
(348, 1, 9, 'causes', 'causa di', NULL),
(349, 1, 9, 'contains', 'contiene', NULL),
(350, 1, 9, 'has_administrative_region', 'ha regione amministrativa', NULL),
(351, 1, 9, 'has_agent', 'agente', NULL),
(352, 1, 9, 'has_arrival', 'arrivo', NULL),
(353, 1, 9, 'has_art-f', 'frammento arte', NULL),
(354, 1, 9, 'has_artist-f', 'frammento artista', NULL),
(355, 1, 9, 'has_artistic_circulation-f', 'frammento circolazione artistica', NULL),
(356, 1, 9, 'has_artistic_geography-f', 'frammento geografia artistica', NULL),
(357, 1, 9, 'has_author', 'frammento autore', NULL),
(358, 1, 9, 'has_branching', 'ha diramazione', NULL),
(359, 1, 9, 'has_chronology-f', 'frammento cronologia', NULL),
(360, 1, 9, 'has_client', 'cliente', NULL),
(361, 1, 9, 'has_commissioning', 'frammento committenza', NULL),
(362, 1, 9, 'has_context-f', 'frammento contesto', NULL),
(363, 1, 9, 'has_credit-by-style-f', 'frammento attribuzione per stile', NULL),
(364, 1, 9, 'has_culturally_defined_region', 'ha regione definita culturalmente', NULL),
(365, 1, 9, 'has_departure', 'partenza', NULL),
(366, 1, 9, 'has_dependency-f', 'frammento dipendenze', NULL),
(367, 1, 9, 'has_duration', 'durata', NULL),
(368, 1, 9, 'has_effect', 'effetto', NULL),
(369, 1, 9, 'has_iconography', 'frammento iconografia', NULL),
(370, 1, 9, 'has_itinerary_continuation', 'continuazione itinerario', NULL),
(371, 1, 9, 'has_knowledge_encoding', 'codifica conoscenza', NULL),
(372, 1, 9, 'has_lifetime_interval', 'ha vissuto in', NULL),
(373, 1, 9, 'has_location-f', 'frammento localizzazione', NULL),
(374, 1, 9, 'has_object', 'ha oggetto', NULL),
(375, 1, 9, 'has_participant', 'partecipante', NULL),
(376, 1, 9, 'has_place_of_birth', 'luogo di nascita', NULL),
(377, 1, 9, 'has_political_framework-f', 'frammento quadro politico', NULL),
(378, 1, 9, 'has_reference', 'riferimento fonte', NULL),
(379, 1, 9, 'has_reference_model', 'ha modello di riferimento', NULL),
(380, 1, 9, 'has_result', 'risultato', NULL),
(381, 1, 9, 'has_source-f', 'fonte', NULL),
(382, 1, 9, 'has_step', 'tappa', NULL),
(383, 1, 9, 'has_step_region', 'regione tappa', NULL),
(384, 1, 9, 'has_story_fragment', 'frammento di narrazione', NULL),
(385, 1, 9, 'has_symbolic_theme', 'ha tema simbolico', NULL),
(386, 1, 9, 'has_time_interval', 'ha intervallo temporale', NULL),
(387, 1, 9, 'holds_in', 'vale in', NULL),
(388, 1, 9, 'is_agent_of', 'agente di', NULL),
(389, 1, 9, 'is_knowledge_encoding_of', 'codifica della conoscenza di', NULL),
(390, 1, 9, 'is_managed_by', 'gestito da', NULL),
(391, 1, 9, 'is_style-based_close_to', 'vicino per confronto stilistico', NULL),
(392, 1, 9, 'is_style-based_credited_with', 'attribuito per stile', NULL),
(393, 1, 9, 'precedes', 'precede', NULL),
(394, 1, 9, 'supports', 'supporta', NULL),
(395, 1, 9, 'top_knowledge_property', 'top_knowledge_property', NULL),
(396, 1, 9, 'top_story_property', 'top_story_property', NULL),
(397, 1, 9, 'within_territory_of', 'nel territorio di', NULL),
(398, NULL, 9, 'has_source_reference', 'riferimento fonte', NULL),
(399, NULL, 9, 'is_source_reference_of', 'riferimento fonte per', NULL),
(400, NULL, 9, 'has_text', 'testo', NULL),
(401, NULL, 9, 'is_branching_of', 'diramazione di', NULL),
(402, NULL, 9, 'has_transit_area-f', 'area di transito', NULL),
(403, NULL, 9, 'has_source_reference-f', 'frammento riferimento fonte', NULL),
(404, NULL, 9, 'has_function-f', 'frammento funzione', NULL),
(405, NULL, 9, 'about_element', 'su elemento', NULL),
(406, NULL, 9, 'has_source', 'fonte', NULL),
(407, NULL, 9, 'is_source_of', 'fonte per', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `resource`
--

CREATE TABLE `resource` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `resource_template_id` int(11) DEFAULT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `resource_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(4, 1, 363, NULL, NULL, 'Affiliazione amministrativa Entracque', 1, '2021-07-25 14:19:17', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(5, 1, 394, NULL, NULL, 'Erezione Chiesa della Confraternita di Santa Croce a Entracque', 1, '2021-07-25 14:40:14', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(6, 1, 383, NULL, NULL, 'Committenza 12 teleri Chiesa della Confraternita di Santa Croce a Entracque', 1, '2021-07-25 14:40:42', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(7, 1, 420, NULL, NULL, 'Chiesa della Confraternita di Santa Croce a Entracque', 1, '2021-07-25 14:41:01', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(8, 1, 444, NULL, NULL, '1538', 1, '2021-07-25 14:41:21', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(9, 1, 444, NULL, NULL, '1658-1660', 1, '2021-07-25 14:41:41', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(10, 1, 405, NULL, NULL, 'Entracque', 1, '2021-07-25 14:41:53', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(11, 1, 378, NULL, NULL, 'Confraternita Santa Croce Entracque', 1, '2021-07-25 14:42:18', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(12, 1, 431, NULL, NULL, 'Modello Confraternita di Santa Croce a Cuneo', 1, '2021-07-25 14:42:35', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(13, 1, 439, NULL, NULL, 'Ciclo di 12 teleri Confraternita SantaCroce Entracque', 1, '2021-07-25 14:42:55', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(14, 1, 429, NULL, NULL, 'Diocesi di Mondovì', 1, '2021-07-25 14:43:15', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(15, 1, 421, NULL, NULL, 'Lorenzo Gastaldi', 1, '2021-07-25 14:43:33', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(16, 1, 420, NULL, NULL, 'Chiesa della Confraternita di Santa Croce a Cuneo', 1, '2021-07-25 14:44:00', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(17, 1, 406, NULL, NULL, 'Vita di Gesù', 1, '2021-07-25 14:44:39', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(18, 1, 406, NULL, NULL, 'Vita della Vergine', 1, '2021-07-25 14:45:17', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(19, 1, 406, NULL, NULL, 'Trinità', 1, '2021-07-25 14:45:29', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(20, 1, 406, NULL, NULL, 'Immacolata Concezione della Vergine', 1, '2021-07-25 14:45:46', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(21, 1, 406, NULL, NULL, 'Riscatto genere umano con sacrificio di Cristo', 1, '2021-07-25 14:46:02', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(22, 1, 405, NULL, NULL, 'Triora', 1, '2021-07-25 14:46:24', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(23, 1, 444, NULL, NULL, '1625-1690', 1, '2021-07-25 14:46:39', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(24, 1, 363, NULL, NULL, 'Affiliazione amministrativa Castelletto Stura', 1, '2021-07-25 15:19:05', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(25, 1, 383, NULL, NULL, 'Committenza edificazione Cappella San Bernardo Castelletto Stura', 1, '2021-07-25 15:19:39', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(26, 1, 383, NULL, NULL, 'Committenza Decorazione Cappella San Bernardo Castelletto Stura', 1, '2021-07-25 15:20:03', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(27, 1, 408, NULL, NULL, 'Percorso processionale Castelletto Stura', 1, '2021-07-25 15:20:28', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(28, 1, 420, NULL, NULL, 'Chiesa parrocchiale Castelletto Stura', 1, '2021-07-25 15:21:09', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(29, 1, 420, NULL, NULL, 'Oratorio Castelletto Stura', 1, '2021-07-25 15:23:06', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(30, 1, 420, NULL, NULL, 'Cappella di Sant’Anna e San Rocco Castelletto Stura', 1, '2021-07-25 15:23:19', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(31, 1, 420, NULL, NULL, 'Cappella di San Grato Castelletto Stura', 1, '2021-07-25 15:23:36', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(32, 1, 420, NULL, NULL, 'Cappella di San Francesco Saverio Castelletto Stura', 1, '2021-07-25 15:23:55', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(33, 1, 420, NULL, NULL, 'Cappella di San Bernardo Castelletto Stura', 1, '2021-07-25 15:28:45', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(34, 1, 406, NULL, NULL, 'Giudizio Universale', 1, '2021-07-25 15:29:59', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(35, 1, 406, NULL, NULL, 'Passione del Signore', 1, '2021-07-25 15:30:14', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(36, 1, 406, NULL, NULL, 'Inferno', 1, '2021-07-25 15:30:26', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(37, 1, 406, NULL, NULL, 'Cavalcata dei vizi', 1, '2021-07-25 15:30:42', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(38, 1, 406, NULL, NULL, 'Paradiso', 1, '2021-07-25 15:30:56', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(39, 1, 406, NULL, NULL, 'Opere di misericordia', 1, '2021-07-25 15:31:10', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(40, 1, 406, NULL, NULL, 'Teorie dei santi', 1, '2021-07-25 15:31:27', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(41, 1, 374, NULL, NULL, 'Affreschi Pareti Cappella San Bernardo Castelletto Stura', 1, '2021-07-25 15:31:55', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(42, 1, 444, NULL, NULL, 'Intorno del 1480', 1, '2021-07-25 15:32:09', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(43, 1, 445, NULL, NULL, 'Parroco Castelletto Stura', 1, '2021-07-25 15:32:23', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(44, 1, 378, NULL, NULL, 'Confraternita Santa Croce Castelletto Stura', 1, '2021-07-25 15:32:42', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(45, 1, 429, NULL, NULL, 'Diocesi di Asti', 1, '2021-07-25 15:33:00', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(46, 1, 405, NULL, NULL, 'Castelletto Stura', 1, '2021-07-25 15:33:15', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(47, 1, 378, NULL, NULL, 'Confraternita Santa Croce Cuneo', 1, '2021-07-25 15:34:18', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(48, 1, 374, NULL, NULL, 'Crocifissione  nell’antica sacrestia di Niella Tanaro', 1, '2021-07-25 15:34:37', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(49, 1, 374, NULL, NULL, 'Madonna col Bambino nel Santuario del Pasco a Villanova Mondovì', 1, '2021-07-25 15:34:55', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(50, 1, 383, NULL, NULL, 'Committenza affreschi della cappella del Santo Sepolcro a Piozzo', 1, '2021-07-25 15:35:13', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(51, 1, 383, NULL, NULL, 'Committenza affreschi della chiesa di San Domenico a Peveragno', 1, '2021-07-25 15:35:26', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(52, 1, 383, NULL, NULL, 'Committenza affreschi del santuario del Brichetto a Morozzo', 1, '2021-07-25 15:35:38', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(53, 1, 444, NULL, NULL, '1481', 1, '2021-07-25 15:35:52', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(54, 1, 444, NULL, NULL, '1487', 1, '2021-07-25 15:36:06', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(55, 1, 444, NULL, NULL, '1491', 1, '2021-07-25 15:36:18', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(56, 1, 374, NULL, NULL, 'frammento con la Madonna con Bambino tra sant’Antonio abate e san Giovanni Battista,  nella cappella di Sant’Antonio a San Michele Mondovì', 1, '2021-07-25 15:36:35', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(57, 1, 374, NULL, NULL, 'trittico con la Madonna con il Bambino e san Pietro e sant’Antonio, nella cappella dio San Pietro in Roncaglia a Benevagienna', 1, '2021-07-25 15:36:53', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(58, 1, 374, NULL, NULL, 'polittico con la Madonna col Bambino e santi nella cappella di San Bernardino a San Michele Mondovì', 1, '2021-07-25 15:37:08', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(59, 1, 374, NULL, NULL, 'decorazione nell’ex convento dei domenicani nella frazione Bertini di Roccaforte Mondovì', 1, '2021-07-25 15:37:22', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(60, 1, 444, NULL, NULL, 'circa 1480', 1, '2021-07-25 15:37:40', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(61, 1, 444, NULL, NULL, '1488', 1, '2021-07-25 15:38:32', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(62, 1, 444, NULL, NULL, '1485', 1, '2021-07-25 15:38:51', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(63, 1, 444, NULL, NULL, '1480', 1, '2021-07-25 15:39:04', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(64, 1, 421, NULL, NULL, 'Giovanni Mazzucco', 1, '2021-07-25 15:47:14', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(65, 1, 362, NULL, NULL, 'Sviluppo economico della Valle Gesso dalla seconda metà del secolo XV', 1, '2021-07-25 16:01:18', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(66, 1, 361, NULL, NULL, 'Acquisizione della Contea di Tenda da parte dei Savoia nel 1579', 1, '2021-07-25 16:01:32', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(67, 1, 362, NULL, NULL, 'Ricerca di percorso terre cisalpine-Nizza alternativo al Col di Tenda', 1, '2021-07-25 16:01:58', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(68, 1, 400, NULL, NULL, 'Evitamento esosi pedaggi imposti dai signori di Tenda', 1, '2021-07-25 16:02:13', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(69, 1, 444, NULL, NULL, '2a metà del secolo XV', 1, '2021-07-25 16:02:32', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(70, 1, 444, NULL, NULL, '1579', 1, '2021-07-25 16:02:43', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(71, 1, 437, NULL, NULL, 'Dinastia Savoia', 1, '2021-07-25 16:03:00', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(72, 1, 409, NULL, NULL, 'Itinerario Valle Gesso', 1, '2021-07-25 16:03:15', '2021-09-18 19:48:16', 'Omeka\\Entity\\Item'),
(73, 1, 409, NULL, NULL, 'Itinerario Tenda', 1, '2021-07-25 16:03:29', '2021-09-18 19:46:47', 'Omeka\\Entity\\Item'),
(74, 1, 409, NULL, NULL, 'Itinerario Valle Gesso – cont. 1', 1, '2021-07-25 16:03:43', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(75, 1, 409, NULL, NULL, 'Itinerario Valle Gesso – cont. 2', 1, '2021-07-25 16:04:02', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(78, 1, 410, NULL, NULL, 'Tappa Tenda-Borgo San Dalmazzo', 1, '2021-07-25 16:13:41', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(80, 1, 405, NULL, NULL, 'Borgo San Dalmazzo', 1, '2021-07-25 16:15:09', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(81, 1, 449, NULL, NULL, 'Valle Vermenagna', 1, '2021-07-25 16:15:26', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(82, 1, 423, NULL, NULL, 'Colle di Tenda', 1, '2021-07-25 16:15:39', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(83, 1, 449, NULL, NULL, 'Valle Roya', 1, '2021-07-25 16:15:53', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(84, 1, 405, NULL, NULL, 'Breglio', 1, '2021-07-25 16:16:07', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(85, 1, 405, NULL, NULL, 'Sospello', 1, '2021-07-25 16:16:19', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(86, 1, 405, NULL, NULL, 'L’Escarène', 1, '2021-07-25 16:16:32', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(87, 1, 405, NULL, NULL, 'St. Martin', 1, '2021-07-25 16:16:47', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(88, 1, 405, NULL, NULL, 'Lantosca', 1, '2021-07-25 16:16:59', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(89, 1, 405, NULL, NULL, 'Lévens', 1, '2021-07-25 16:32:15', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(90, 1, 405, NULL, NULL, 'Utelle', 1, '2021-07-25 16:32:27', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(91, 1, 405, NULL, NULL, 'Nice', 1, '2021-07-25 16:32:47', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(92, 1, 449, NULL, NULL, 'Valle Gesso', 1, '2021-07-25 16:33:02', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(93, 1, 449, NULL, NULL, 'val Vésubie', 1, '2021-07-25 16:33:14', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(94, 1, 423, NULL, NULL, 'Colle del Brouis', 1, '2021-07-25 16:33:40', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(95, 1, 423, NULL, NULL, 'Col de Braus', 1, '2021-07-25 16:33:54', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(96, 1, 423, NULL, NULL, 'Colle delle Finestre', 1, '2021-07-25 16:34:06', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(97, 1, 410, NULL, NULL, 'Tappa Tenda-Valle Vermenagna', 1, '2021-07-25 16:34:53', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(98, 1, 410, NULL, NULL, 'Tappa Tenda-Colle di Tenda', 1, '2021-07-25 16:35:09', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(99, 1, 410, NULL, NULL, 'Tappa Tenda-Valle Roya', 1, '2021-07-25 16:36:13', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(100, 1, 410, NULL, NULL, 'Tappa Tenda-Breglio', 1, '2021-07-25 16:36:53', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(101, 1, 410, NULL, NULL, 'Tappa Tenda-Colle del Brouis', 1, '2021-07-25 16:37:15', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(102, 1, 410, NULL, NULL, 'Tappa Tenda-Sospello', 1, '2021-07-25 16:37:42', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(103, 1, 410, NULL, NULL, 'Tappa Tenda-Col de Braus', 1, '2021-07-25 16:38:06', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(104, 1, 410, NULL, NULL, 'Tappa Tenda-L’Escarène', 1, '2021-07-25 16:38:19', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(105, 1, 410, NULL, NULL, 'Tappa Tenda-Nice', 1, '2021-07-25 16:39:05', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(106, 1, 410, NULL, NULL, 'Tappa Valle Gesso-Nice', 1, '2021-07-25 16:39:50', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(107, 1, 410, NULL, NULL, 'Tappa Valle Gesso-Borgo San Dalmazzo', 1, '2021-07-25 16:40:07', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(108, 1, 410, NULL, NULL, 'Tappa Valle Gesso-Valle Gesso', 1, '2021-07-25 16:40:32', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(109, 1, 410, NULL, NULL, 'Tappa Valle Gesso-Entracque', 1, '2021-07-25 16:41:17', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(110, 1, 410, NULL, NULL, 'Tappa Valle Gesso-Colle delle Finestre', 1, '2021-07-25 16:41:41', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(111, 1, 410, NULL, NULL, 'Tappa Valle Gesso-val Vésubie', 1, '2021-07-25 16:42:08', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(112, 1, 410, NULL, NULL, 'Tappa Valle Gesso-St. Martin', 1, '2021-07-25 16:42:32', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(113, 1, 410, NULL, NULL, 'Tappa Valle Gesso-Lantosca', 1, '2021-07-25 16:42:52', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(114, 1, 410, NULL, NULL, 'Tappa Valle Gesso cont 1-Lévens', 1, '2021-07-25 16:43:47', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(115, 1, 410, NULL, NULL, 'Tappa Valle Gesso cont 2-Utelle', 1, '2021-07-25 16:44:21', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(116, 1, 437, NULL, NULL, 'Signori di Tenda', 1, '2021-07-25 19:07:13', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(117, 1, 420, NULL, NULL, 'Pedaggio itinerario Tenda', 1, '2021-07-25 19:08:18', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(118, 1, 429, NULL, NULL, 'Contea di Tenda', 1, '2021-07-25 19:17:18', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(121, 1, 376, NULL, NULL, 'Confraternita di Santa Croce \na Entracque: Autore', 1, '2021-07-25 19:34:22', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(122, 1, 410, NULL, NULL, 'Tappa Percorso professionale Castelletto Stura - Chiesa parrocchiale', 1, '2021-07-26 12:39:37', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(123, 1, 410, NULL, NULL, 'Tappa Percorso professionale Castelletto Stura - Chiesa parrocchiale', 1, '2021-07-26 12:40:21', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(124, 1, 410, NULL, NULL, 'Tappa Percorso professionale Castelletto Stura - Oratorio', 1, '2021-07-26 12:40:38', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(125, 1, 410, NULL, NULL, 'Tappa Percorso professionale Castelletto Stura - Cappella di Sant\'Anna e San Rocco', 1, '2021-07-26 12:41:01', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(126, 1, 410, NULL, NULL, 'Tappa Percorso professionale Castelletto Stura - Cappella di San Grato', 1, '2021-07-26 12:41:17', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(127, 1, 410, NULL, NULL, 'Tappa Percorso professionale Castelletto Stura - Cappella di San Francesco Saverio', 1, '2021-07-26 12:41:39', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(128, 1, 410, NULL, NULL, 'Tappa Percorso professionale Castelletto Stura - Cappella San Bernardo', 1, '2021-07-26 12:46:10', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(129, 1, 418, NULL, NULL, 'Confraternita di Santa Croce \na Entracque: Articolo', 1, '2021-07-26 13:22:56', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(130, 1, 411, NULL, NULL, 'Confraternita di Santa Croce \na Entracque: Localizzazione', 1, '2021-07-26 13:25:34', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(131, 1, 384, NULL, NULL, 'Confraternita di Santa Croce \na Entracque: Committenza', 1, '2021-07-26 13:26:17', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(132, 1, 442, NULL, NULL, 'Confraternita di Santa Croce \na Entracque: Fonte Palmero 2008', 1, '2021-07-26 13:28:21', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(133, 1, 442, NULL, NULL, 'Confraternita di Santa Croce \na Entracque: Fonte Arneodo et al. 1997', 1, '2021-07-26 13:29:30', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(134, 1, 407, NULL, NULL, 'Confraternita di Santa Croce a Entracque: Iconografia', 1, '2021-07-26 13:30:14', '2021-09-18 20:49:17', 'Omeka\\Entity\\Item'),
(135, 1, 373, NULL, NULL, 'Confraternita di Santa Croce \na Entracque: Geografia artistica', 1, '2021-07-26 13:30:56', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(136, 1, 442, NULL, NULL, 'Confraternita di Santa Croce \na Entracque: Fonte Bartoletti 1997', 1, '2021-07-26 13:32:56', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(137, 1, NULL, NULL, NULL, 'Cappella San Bernardo', 1, '2021-07-26 13:50:11', '2021-07-26 13:50:11', 'Omeka\\Entity\\Media'),
(138, 1, 450, NULL, NULL, 'ARNEODO et al. 1997', 1, '2021-07-26 14:00:49', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(139, 1, 418, NULL, NULL, 'San Bernardo a Castelletto Stura: Articolo', 1, '2021-08-23 10:39:39', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(140, 1, 376, NULL, NULL, 'San Bernardo a Castelletto Stura: Autore', 1, '2021-08-23 10:43:48', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(141, 1, 411, NULL, NULL, 'San Bernardo a Castelletto Stura: Diocesi', 1, '2021-08-23 10:44:14', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(142, 1, 391, NULL, NULL, 'San Bernardo a Castelletto Stura: Dipendenze', 1, '2021-08-23 10:44:37', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(143, 1, 381, NULL, NULL, 'San Bernardo a Castelletto Stura: Cronologia', 1, '2021-08-23 10:44:58', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(144, 1, 384, NULL, NULL, 'San Bernardo a Castelletto Stura: Committenza', 1, '2021-08-23 10:45:21', '2021-09-18 15:32:32', 'Omeka\\Entity\\Item'),
(145, 1, 398, NULL, NULL, 'San Bernardo a Castelletto: Funzione', 1, '2021-08-23 10:45:47', '2021-09-18 15:31:50', 'Omeka\\Entity\\Item'),
(146, 1, 442, NULL, NULL, 'San Bernardo a Castelletto Stura: Fonte Berra 1995', 1, '2021-08-23 10:46:22', '2021-09-18 15:47:08', 'Omeka\\Entity\\Item'),
(147, 1, 442, NULL, NULL, 'San Bernardo a Castelletto Stura: Fonte Comba 1972', 1, '2021-08-23 10:46:48', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(148, 1, 442, NULL, NULL, 'San Bernardo a Castelletto Stura: Fonte Ristorto 1977', 1, '2021-08-23 10:47:10', '2021-09-18 15:44:54', 'Omeka\\Entity\\Item'),
(149, 1, 442, NULL, NULL, 'San Bernardo a Castelletto Stura: Fonte Brezzi Rossetti 1987', 1, '2021-08-23 10:47:28', '2021-09-18 15:41:24', 'Omeka\\Entity\\Item'),
(150, 1, 442, NULL, NULL, 'San Bernardo a Castelletto Stura: Fonte Anonima', 1, '2021-08-23 10:48:57', '2021-09-18 15:29:38', 'Omeka\\Entity\\Item'),
(151, 1, 442, NULL, NULL, 'San Bernardo a Castelletto Stura: Fonte Gazzola 2007', 1, '2021-08-23 10:49:16', '2021-09-18 15:26:58', 'Omeka\\Entity\\Item'),
(152, 1, 407, NULL, NULL, 'San Bernardo a Castelletto Stura: Iconografia', 1, '2021-08-23 12:47:41', '2021-09-18 15:24:29', 'Omeka\\Entity\\Item'),
(153, 1, 370, NULL, NULL, 'San Bernardo a Castelletto Stura: Artista', 1, '2021-08-23 12:53:11', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(154, 1, 373, NULL, NULL, 'San Bernardo a Castelletto Stura: Geografia artistica', 1, '2021-08-23 12:53:59', '2021-09-18 15:39:24', 'Omeka\\Entity\\Item'),
(155, 1, 387, NULL, NULL, 'San Bernardo a Castelletto Stura: Attribuzioni per stile', 1, '2021-08-23 12:54:31', '2021-09-18 15:37:16', 'Omeka\\Entity\\Item'),
(156, 1, 372, NULL, NULL, 'San Bernardo a Castelletto Stura: Circolazione', 1, '2021-08-23 12:54:53', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(157, 1, 442, NULL, NULL, 'San Bernardo a Castelletto Stura: Fonte Quasimodo 2007', 1, '2021-08-23 12:55:15', '2021-09-18 15:17:08', 'Omeka\\Entity\\Item'),
(159, 1, 442, NULL, NULL, 'San Bernardo a Castelletto Stura: Fonte Marino 2007', 1, '2021-08-23 12:55:53', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(160, 1, 418, NULL, NULL, 'Valle Gesso – Strade di transito: Articolo', 1, '2021-08-23 13:07:57', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(161, 1, 376, NULL, NULL, 'Valle Gesso – Strade di transito: Autore', 1, '2021-08-23 13:08:35', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(162, 1, 430, NULL, NULL, 'Valle Gesso – Strade di transito: Quadro politico', 1, '2021-08-23 13:08:51', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(164, 1, 447, NULL, NULL, 'Valle Gesso – Strade di transito: Area di transito', 1, '2021-08-23 13:10:02', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(165, 1, 442, NULL, NULL, 'Valle Gesso – Strade di transito: Fonte Fontana 2013', 1, '2021-08-23 13:10:22', '2021-09-18 19:42:22', 'Omeka\\Entity\\Item'),
(166, 1, 442, NULL, NULL, 'Valle Gesso – Strade di transito: Fonte Collidà et al. 1982', 1, '2021-08-23 13:10:40', '2021-09-18 19:41:16', 'Omeka\\Entity\\Item'),
(167, 1, NULL, NULL, NULL, 'HSG site items', 1, '2021-08-23 13:34:58', '2021-08-23 13:35:29', 'Omeka\\Entity\\ItemSet'),
(168, 1, 453, NULL, NULL, 'Ex voto Chiesa Santa Croce Entracque', 1, '2021-09-13 06:53:31', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(169, 1, NULL, NULL, NULL, 'Ex voto 1', 1, '2021-09-13 06:53:31', '2021-09-13 06:53:31', 'Omeka\\Entity\\Media'),
(170, 1, NULL, NULL, NULL, 'Ex voto 2', 1, '2021-09-13 06:53:31', '2021-09-13 06:53:31', 'Omeka\\Entity\\Media'),
(171, 1, 454, NULL, NULL, 'Confraternita di Santa Croce a Entracque: riferimento ex voto Chiesa Santa Croce', 1, '2021-09-14 12:28:29', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(172, 1, 452, NULL, NULL, 'Palmero 2008', 1, '2021-09-14 14:32:32', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(173, 1, NULL, NULL, NULL, 'Entracque Casalis', 1, '2021-09-14 14:32:32', '2021-09-14 14:32:32', 'Omeka\\Entity\\Media'),
(174, 1, 452, NULL, NULL, 'I pittori Bruno', 1, '2021-09-14 15:40:30', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(175, 1, NULL, NULL, NULL, 'PDF del paragrafo', 1, '2021-09-14 15:40:30', '2021-09-14 15:40:30', 'Omeka\\Entity\\Media'),
(176, 1, 454, NULL, NULL, 'Confraternita di Santa Croce \na Entracque: i pittori Bruno', 1, '2021-09-14 15:44:02', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(177, 1, 454, NULL, NULL, 'Valle Gesso – Strade di transito: Fonte Palmero 1995', 1, '2021-09-14 15:53:03', '2021-09-14 15:55:54', 'Omeka\\Entity\\Item'),
(178, 1, 442, NULL, NULL, 'San Bernardo a Castelletto Stura: Fonte scene della Passione del Signore', 1, '2021-09-18 15:20:19', '2021-09-18 15:20:19', 'Omeka\\Entity\\Item'),
(179, 1, NULL, NULL, NULL, 'Scene della Passione del Signore', 1, '2021-09-18 15:20:19', '2021-09-18 15:20:19', 'Omeka\\Entity\\Media'),
(180, 1, 442, NULL, NULL, 'San Bernardo a Castelletto Stura: Fonte l’Inferno e il Paradiso', 1, '2021-09-18 15:21:07', '2021-09-18 15:21:07', 'Omeka\\Entity\\Item'),
(181, 1, NULL, NULL, NULL, 'L’Inferno e il Paradiso', 1, '2021-09-18 15:21:07', '2021-09-18 15:21:07', 'Omeka\\Entity\\Media'),
(182, 1, 442, NULL, NULL, 'San Bernardo a Castelletto Stura: Fonte teorie dei Santi all’interno', 1, '2021-09-18 15:22:03', '2021-09-18 15:22:03', 'Omeka\\Entity\\Item'),
(183, 1, NULL, NULL, NULL, 'Teorie dei Santi all’interno', 1, '2021-09-18 15:22:03', '2021-09-18 15:22:03', 'Omeka\\Entity\\Media'),
(184, 1, 442, NULL, NULL, 'San Bernardo a Castelletto Stura: Fonte teorie dei Santi sulla facciata', 1, '2021-09-18 15:22:35', '2021-09-18 15:22:35', 'Omeka\\Entity\\Item'),
(185, 1, NULL, NULL, NULL, 'Teorie dei Santi sulla facciata', 1, '2021-09-18 15:22:35', '2021-09-18 15:22:35', 'Omeka\\Entity\\Media'),
(186, 1, 442, NULL, NULL, 'San Bernardo a Castelletto Stura: Fonte Cappella San Bernardo', 1, '2021-09-18 15:28:20', '2021-09-18 15:28:20', 'Omeka\\Entity\\Item'),
(187, 1, 442, NULL, NULL, 'San Bernardo a Castelletto Stura: Fonte figure affrescate ai margini della lunetta con l’Incoronazione della Vergine', 1, '2021-09-18 15:30:52', '2021-09-18 15:30:52', 'Omeka\\Entity\\Item'),
(188, 1, NULL, NULL, NULL, 'Figure affrescate ai margini della lunetta con l’Incoronazione della Vergine', 1, '2021-09-18 15:30:52', '2021-09-18 15:30:52', 'Omeka\\Entity\\Media'),
(189, 1, 442, NULL, NULL, 'San Bernardo a Castelletto Stura: Fonte la Madonna con Bambino tra sant’Antonio abate e san Giovanni Battista,  nella cappella di Sant’Antonio a San Michele Mondovì', 1, '2021-09-18 15:33:46', '2021-09-18 15:33:46', 'Omeka\\Entity\\Item'),
(190, 1, NULL, NULL, NULL, 'Madonna con Bambino tra sant’Antonio abate e san Giovanni Battista, nella cappella di Sant’Antonio a San Michele Mondovì', 1, '2021-09-18 15:33:46', '2021-09-18 15:33:46', 'Omeka\\Entity\\Media'),
(191, 1, 442, NULL, NULL, 'San Bernardo a Castelletto Stura: Fonte trittico con la Madonna con il Bambino e san Pietro e sant’Antonio, nella cappella di San Pietro in Roncaglia a Benevagienna', 1, '2021-09-18 15:34:29', '2021-09-18 15:34:29', 'Omeka\\Entity\\Item'),
(192, 1, NULL, NULL, NULL, 'Trittico con la Madonna con il Bambino e san Pietro e sant’Antonio, nella cappella di San Pietro in Roncaglia a Benevagienna', 1, '2021-09-18 15:34:29', '2021-09-18 15:34:29', 'Omeka\\Entity\\Media'),
(193, 1, 442, NULL, NULL, 'San Bernardo a Castelletto Stura: Fonte polittico con la Madonna col Bambino e santi nella cappella di San Bernardino a San Michele Mondovì', 1, '2021-09-18 15:35:04', '2021-09-18 15:35:04', 'Omeka\\Entity\\Item'),
(194, 1, NULL, NULL, NULL, 'Polittico con la Madonna col Bambino e santi nella cappella di San Bernardino a San Michele Mondovì', 1, '2021-09-18 15:35:04', '2021-09-18 15:35:04', 'Omeka\\Entity\\Media'),
(195, 1, 442, NULL, NULL, 'San Bernardo a Castelletto Stura: Fonte decorazione nell’ex convento dei domenicani nella frazione Bertini di Roccaforte Mondovì', 1, '2021-09-18 15:35:35', '2021-09-18 15:35:35', 'Omeka\\Entity\\Item'),
(196, 1, NULL, NULL, NULL, 'Decorazione nell’ex convento dei domenicani nella frazione Bertini di Roccaforte Mondovì', 1, '2021-09-18 15:35:35', '2021-09-18 15:35:35', 'Omeka\\Entity\\Media'),
(197, 1, 442, NULL, NULL, 'San Bernardo a Castelletto Stura: Fonte santuario del Brichetto a Morozzo', 1, '2021-09-18 15:38:15', '2021-09-18 15:38:15', 'Omeka\\Entity\\Item'),
(198, 1, 442, NULL, NULL, 'San Bernardo a Castelletto Stura: Fonte Cappella del Santo Sepolcro a Piozzo', 1, '2021-09-18 15:38:50', '2021-09-18 15:38:50', 'Omeka\\Entity\\Item'),
(199, 1, 452, NULL, NULL, 'Brezzi Rossetti 1987', 1, '2021-09-18 15:40:53', '2021-09-18 15:40:53', 'Omeka\\Entity\\Item'),
(200, 1, NULL, NULL, NULL, 'Biografia di Giovanni Mazzucco', 1, '2021-09-18 15:40:53', '2021-09-18 15:40:53', 'Omeka\\Entity\\Media'),
(201, 1, 452, NULL, NULL, 'Ristorto 1977', 1, '2021-09-18 15:44:16', '2021-09-18 15:45:03', 'Omeka\\Entity\\Item'),
(202, 1, NULL, NULL, NULL, 'Ristorto 1977 pdf', 1, '2021-09-18 15:44:16', '2021-09-18 15:44:16', 'Omeka\\Entity\\Media'),
(203, 1, NULL, NULL, NULL, 'Diocesi Provincia di Cuneo 1511', 1, '2021-09-18 15:46:53', '2021-09-18 15:46:53', 'Omeka\\Entity\\Media'),
(204, 1, NULL, NULL, NULL, 'Diocesi Provincia di Cuneo 1817', 1, '2021-09-18 15:47:08', '2021-09-18 15:47:08', 'Omeka\\Entity\\Media'),
(205, 1, NULL, NULL, NULL, 'Foto Inaugurazione tunnel stradale Tenda', 1, '2021-09-18 19:41:16', '2021-09-18 19:41:16', 'Omeka\\Entity\\Media'),
(206, 1, NULL, NULL, NULL, 'Foto Inaugurazione tunnel ferroviario Tenda', 1, '2021-09-18 19:41:16', '2021-09-18 19:41:16', 'Omeka\\Entity\\Media'),
(207, 1, NULL, NULL, NULL, 'Mappa trasporto pubblico Torino-Nizza', 1, '2021-09-18 19:42:22', '2021-09-18 19:42:22', 'Omeka\\Entity\\Media'),
(208, 1, 451, NULL, NULL, 'Mappa Itinerari terre cisalpine - Francia', 1, '2021-09-18 19:45:10', '2021-09-18 19:45:10', 'Omeka\\Entity\\Item'),
(209, 1, NULL, NULL, NULL, 'Due itinerari terre cisalpine - Francia', 1, '2021-09-18 19:45:10', '2021-09-18 19:45:10', 'Omeka\\Entity\\Media'),
(210, 1, 442, NULL, NULL, 'Valle Gesso – Strade di transito: Itinerari terre cisalpine - Francia', 1, '2021-09-18 19:56:07', '2021-09-18 19:58:38', 'Omeka\\Entity\\Item'),
(211, 1, NULL, NULL, NULL, 'Figura 2: Mappa itinerari verso la Francia', 1, '2021-09-18 19:56:07', '2021-09-18 19:56:07', 'Omeka\\Entity\\Media'),
(212, 1, 442, NULL, NULL, 'Confraternita di Santa Croce \na Entracque: Confronto chiese Santa Croce', 1, '2021-09-18 20:18:45', '2021-09-18 20:18:45', 'Omeka\\Entity\\Item'),
(213, 1, NULL, NULL, NULL, 'Confronto chiese Santa Croce', 1, '2021-09-18 20:18:45', '2021-09-18 20:18:45', 'Omeka\\Entity\\Media'),
(214, 1, 442, NULL, NULL, 'Confraternita di Santa Croce \na Entracque: Bartoletti 2003', 1, '2021-09-18 20:46:51', '2021-09-18 20:46:51', 'Omeka\\Entity\\Item'),
(215, 1, NULL, NULL, NULL, 'I pittori Bruno', 1, '2021-09-18 20:46:51', '2021-09-18 20:46:51', 'Omeka\\Entity\\Media');

-- --------------------------------------------------------

--
-- Struttura della tabella `resource_class`
--

CREATE TABLE `resource_class` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `resource_class`
--

INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'Agent', 'Agent', 'A resource that acts or has the power to act.'),
(2, NULL, 1, 'AgentClass', 'Agent Class', 'A group of agents.'),
(3, NULL, 1, 'BibliographicResource', 'Bibliographic Resource', 'A book, article, or other documentary resource.'),
(4, NULL, 1, 'FileFormat', 'File Format', 'A digital resource format.'),
(5, NULL, 1, 'Frequency', 'Frequency', 'A rate at which something recurs.'),
(6, NULL, 1, 'Jurisdiction', 'Jurisdiction', 'The extent or range of judicial, law enforcement, or other authority.'),
(7, NULL, 1, 'LicenseDocument', 'License Document', 'A legal document giving official permission to do something with a Resource.'),
(8, NULL, 1, 'LinguisticSystem', 'Linguistic System', 'A system of signs, symbols, sounds, gestures, or rules used in communication.'),
(9, NULL, 1, 'Location', 'Location', 'A spatial region or named place.'),
(10, NULL, 1, 'LocationPeriodOrJurisdiction', 'Location, Period, or Jurisdiction', 'A location, period of time, or jurisdiction.'),
(11, NULL, 1, 'MediaType', 'Media Type', 'A file format or physical medium.'),
(12, NULL, 1, 'MediaTypeOrExtent', 'Media Type or Extent', 'A media type or extent.'),
(13, NULL, 1, 'MethodOfInstruction', 'Method of Instruction', 'A process that is used to engender knowledge, attitudes, and skills.'),
(14, NULL, 1, 'MethodOfAccrual', 'Method of Accrual', 'A method by which resources are added to a collection.'),
(15, NULL, 1, 'PeriodOfTime', 'Period of Time', 'An interval of time that is named or defined by its start and end dates.'),
(16, NULL, 1, 'PhysicalMedium', 'Physical Medium', 'A physical material or carrier.'),
(17, NULL, 1, 'PhysicalResource', 'Physical Resource', 'A material thing.'),
(18, NULL, 1, 'Policy', 'Policy', 'A plan or course of action by an authority, intended to influence and determine decisions, actions, and other matters.'),
(19, NULL, 1, 'ProvenanceStatement', 'Provenance Statement', 'A statement of any changes in ownership and custody of a resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(20, NULL, 1, 'RightsStatement', 'Rights Statement', 'A statement about the intellectual property rights (IPR) held in or over a Resource, a legal document giving official permission to do something with a resource, or a statement about access rights.'),
(21, NULL, 1, 'SizeOrDuration', 'Size or Duration', 'A dimension or extent, or a time taken to play or execute.'),
(22, NULL, 1, 'Standard', 'Standard', 'A basis for comparison; a reference point against which other things can be evaluated.'),
(23, NULL, 2, 'Collection', 'Collection', 'An aggregation of resources.'),
(24, NULL, 2, 'Dataset', 'Dataset', 'Data encoded in a defined structure.'),
(25, NULL, 2, 'Event', 'Event', 'A non-persistent, time-based occurrence.'),
(26, NULL, 2, 'Image', 'Image', 'A visual representation other than text.'),
(27, NULL, 2, 'InteractiveResource', 'Interactive Resource', 'A resource requiring interaction from the user to be understood, executed, or experienced.'),
(28, NULL, 2, 'Service', 'Service', 'A system that provides one or more functions.'),
(29, NULL, 2, 'Software', 'Software', 'A computer program in source or compiled form.'),
(30, NULL, 2, 'Sound', 'Sound', 'A resource primarily intended to be heard.'),
(31, NULL, 2, 'Text', 'Text', 'A resource consisting primarily of words for reading.'),
(32, NULL, 2, 'PhysicalObject', 'Physical Object', 'An inanimate, three-dimensional object or substance.'),
(33, NULL, 2, 'StillImage', 'Still Image', 'A static visual representation.'),
(34, NULL, 2, 'MovingImage', 'Moving Image', 'A series of visual representations imparting an impression of motion when shown in succession.'),
(35, NULL, 3, 'AcademicArticle', 'Academic Article', 'A scholarly academic article, typically published in a journal.'),
(36, NULL, 3, 'Article', 'Article', 'A written composition in prose, usually nonfiction, on a specific topic, forming an independent part of a book or other publication, as a newspaper or magazine.'),
(37, NULL, 3, 'AudioDocument', 'audio document', 'An audio document; aka record.'),
(38, NULL, 3, 'AudioVisualDocument', 'audio-visual document', 'An audio-visual document; film, video, and so forth.'),
(39, NULL, 3, 'Bill', 'Bill', 'Draft legislation presented for discussion to a legal body.'),
(40, NULL, 3, 'Book', 'Book', 'A written or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.'),
(41, NULL, 3, 'BookSection', 'Book Section', 'A section of a book.'),
(42, NULL, 3, 'Brief', 'Brief', 'A written argument submitted to a court.'),
(43, NULL, 3, 'Chapter', 'Chapter', 'A chapter of a book.'),
(44, NULL, 3, 'Code', 'Code', 'A collection of statutes.'),
(45, NULL, 3, 'CollectedDocument', 'Collected Document', 'A document that simultaneously contains other documents.'),
(46, NULL, 3, 'Collection', 'Collection', 'A collection of Documents or Collections'),
(47, NULL, 3, 'Conference', 'Conference', 'A meeting for consultation or discussion.'),
(48, NULL, 3, 'CourtReporter', 'Court Reporter', 'A collection of legal cases.'),
(49, NULL, 3, 'Document', 'Document', 'A document (noun) is a bounded physical representation of body of information designed with the capacity (and usually intent) to communicate. A document may manifest symbolic, diagrammatic or sensory-representational information.'),
(50, NULL, 3, 'DocumentPart', 'document part', 'a distinct part of a larger document or collected document.'),
(51, NULL, 3, 'DocumentStatus', 'Document Status', 'The status of the publication of a document.'),
(52, NULL, 3, 'EditedBook', 'Edited Book', 'An edited book.'),
(53, NULL, 3, 'Email', 'EMail', 'A written communication addressed to a person or organization and transmitted electronically.'),
(54, NULL, 3, 'Event', 'Event', NULL),
(55, NULL, 3, 'Excerpt', 'Excerpt', 'A passage selected from a larger work.'),
(56, NULL, 3, 'Film', 'Film', 'aka movie.'),
(57, NULL, 3, 'Hearing', 'Hearing', 'An instance or a session in which testimony and arguments are presented, esp. before an official, as a judge in a lawsuit.'),
(58, NULL, 3, 'Image', 'Image', 'A document that presents visual or diagrammatic information.'),
(59, NULL, 3, 'Interview', 'Interview', 'A formalized discussion between two or more people.'),
(60, NULL, 3, 'Issue', 'Issue', 'something that is printed or published and distributed, esp. a given number of a periodical'),
(61, NULL, 3, 'Journal', 'Journal', 'A periodical of scholarly journal Articles.'),
(62, NULL, 3, 'LegalCaseDocument', 'Legal Case Document', 'A document accompanying a legal case.'),
(63, NULL, 3, 'LegalDecision', 'Decision', 'A document containing an authoritative determination (as a decree or judgment) made after consideration of facts or law.'),
(64, NULL, 3, 'LegalDocument', 'Legal Document', 'A legal document; for example, a court decision, a brief, and so forth.'),
(65, NULL, 3, 'Legislation', 'Legislation', 'A legal document proposing or enacting a law or a group of laws.'),
(66, NULL, 3, 'Letter', 'Letter', 'A written or printed communication addressed to a person or organization and usually transmitted by mail.'),
(67, NULL, 3, 'Magazine', 'Magazine', 'A periodical of magazine Articles. A magazine is a publication that is issued periodically, usually bound in a paper cover, and typically contains essays, stories, poems, etc., by many writers, and often photographs and drawings, frequently specializing in a particular subject or area, as hobbies, news, or sports.'),
(68, NULL, 3, 'Manual', 'Manual', 'A small reference book, especially one giving instructions.'),
(69, NULL, 3, 'Manuscript', 'Manuscript', 'An unpublished Document, which may also be submitted to a publisher for publication.'),
(70, NULL, 3, 'Map', 'Map', 'A graphical depiction of geographic features.'),
(71, NULL, 3, 'MultiVolumeBook', 'Multivolume Book', 'A loose, thematic, collection of Documents, often Books.'),
(72, NULL, 3, 'Newspaper', 'Newspaper', 'A periodical of documents, usually issued daily or weekly, containing current news, editorials, feature articles, and usually advertising.'),
(73, NULL, 3, 'Note', 'Note', 'Notes or annotations about a resource.'),
(74, NULL, 3, 'Patent', 'Patent', 'A document describing the exclusive right granted by a government to an inventor to manufacture, use, or sell an invention for a certain number of years.'),
(75, NULL, 3, 'Performance', 'Performance', 'A public performance.'),
(76, NULL, 3, 'Periodical', 'Periodical', 'A group of related documents issued at regular intervals.'),
(77, NULL, 3, 'PersonalCommunication', 'Personal Communication', 'A communication between an agent and one or more specific recipients.'),
(78, NULL, 3, 'PersonalCommunicationDocument', 'Personal Communication Document', 'A personal communication manifested in some document.'),
(79, NULL, 3, 'Proceedings', 'Proceedings', 'A compilation of documents published from an event, such as a conference.'),
(80, NULL, 3, 'Quote', 'Quote', 'An excerpted collection of words.'),
(81, NULL, 3, 'ReferenceSource', 'Reference Source', 'A document that presents authoritative reference information, such as a dictionary or encylopedia .'),
(82, NULL, 3, 'Report', 'Report', 'A document describing an account or statement describing in detail an event, situation, or the like, usually as the result of observation, inquiry, etc..'),
(83, NULL, 3, 'Series', 'Series', 'A loose, thematic, collection of Documents, often Books.'),
(84, NULL, 3, 'Slide', 'Slide', 'A slide in a slideshow'),
(85, NULL, 3, 'Slideshow', 'Slideshow', 'A presentation of a series of slides, usually presented in front of an audience with written text and images.'),
(86, NULL, 3, 'Standard', 'Standard', 'A document describing a standard'),
(87, NULL, 3, 'Statute', 'Statute', 'A bill enacted into law.'),
(88, NULL, 3, 'Thesis', 'Thesis', 'A document created to summarize research findings associated with the completion of an academic degree.'),
(89, NULL, 3, 'ThesisDegree', 'Thesis degree', 'The academic degree of a Thesis'),
(90, NULL, 3, 'Webpage', 'Webpage', 'A web page is an online document available (at least initially) on the world wide web. A web page is written first and foremost to appear on the web, as distinct from other online resources such as books, manuscripts or audio documents which use the web primarily as a distribution mechanism alongside other more traditional methods such as print.'),
(91, NULL, 3, 'Website', 'Website', 'A group of Webpages accessible on the Web.'),
(92, NULL, 3, 'Workshop', 'Workshop', 'A seminar, discussion group, or the like, that emphasizes zxchange of ideas and the demonstration and application of techniques, skills, etc.'),
(93, NULL, 4, 'LabelProperty', 'Label Property', 'A foaf:LabelProperty is any RDF property with texual values that serve as labels.'),
(94, NULL, 4, 'Person', 'Person', 'A person.'),
(95, NULL, 4, 'Document', 'Document', 'A document.'),
(96, NULL, 4, 'Organization', 'Organization', 'An organization.'),
(97, NULL, 4, 'Group', 'Group', 'A class of Agents.'),
(98, NULL, 4, 'Agent', 'Agent', 'An agent (eg. person, group, software or physical artifact).'),
(99, NULL, 4, 'Project', 'Project', 'A project (a collective endeavour of some kind).'),
(100, NULL, 4, 'Image', 'Image', 'An image.'),
(101, NULL, 4, 'PersonalProfileDocument', 'PersonalProfileDocument', 'A personal profile RDF document.'),
(102, NULL, 4, 'OnlineAccount', 'Online Account', 'An online account.'),
(103, NULL, 4, 'OnlineGamingAccount', 'Online Gaming Account', 'An online gaming account.'),
(104, NULL, 4, 'OnlineEcommerceAccount', 'Online E-commerce Account', 'An online e-commerce account.'),
(105, NULL, 4, 'OnlineChatAccount', 'Online Chat Account', 'An online chat account.'),
(361, 1, 9, 'Acquisition', 'Acquisizione', NULL),
(362, 1, 9, 'Action', 'Azione', NULL),
(363, 1, 9, 'Administrative_affiliation', 'Affiliazione amministrativa', NULL),
(364, 1, 9, 'Administrative_entity', 'Entità amministrativa', NULL),
(365, 1, 9, 'Agent', 'Agente', NULL),
(366, 1, 9, 'Altarpiece', 'Pezzo d’altare', NULL),
(367, 1, 9, 'Art-f', 'Frammento Arte', NULL),
(368, 1, 9, 'Article', 'Saggio', NULL),
(369, 1, 9, 'Artist', 'Artista', NULL),
(370, 1, 9, 'Artist-f', 'Frammento Artista', NULL),
(371, 1, 9, 'Artistic-geographic_affiliation', 'Affiliazione artistico-geografica', NULL),
(372, 1, 9, 'Artistic_circulation-f', 'Frammento Circolazione artistica', NULL),
(373, 1, 9, 'Artistic_geography-f', 'Frammento Geografia artistica', NULL),
(374, 1, 9, 'Artwork', 'Opera d\'arte', NULL),
(375, 1, 9, 'Association', 'Associazione', NULL),
(376, 1, 9, 'Author-f', 'Frammento Autore', NULL),
(377, 1, 9, 'Breeder', 'Allevatore', NULL),
(378, 1, 9, 'Breeder_brotherhood', 'Confraternita di allevatori', NULL),
(379, 1, 9, 'Brotherhood', 'Confraternita', NULL),
(380, 1, 9, 'Business_partnership', 'Partenariato d’affari', NULL),
(381, 1, 9, 'Chronology-f', 'Frammento Cronologia', NULL),
(382, 1, 9, 'Collective_agent', 'Agente collettivo', NULL),
(383, 1, 9, 'Commissioning', 'Committenza', NULL),
(384, 1, 9, 'Commissioning-f', 'Frammento Committenza', NULL),
(385, 1, 9, 'Context-f', 'Frammento Contesto', NULL),
(386, 1, 9, 'County', 'Contea', NULL),
(387, 1, 9, 'Credit_by-style-f', 'Frammento Attribuzione per concordanza stilistica', NULL),
(388, 1, 9, 'Culturally-defined_region', 'Regione culturalmente definita', NULL),
(389, 1, 9, 'Data_visualization', 'Visualizzazione dati', NULL),
(390, 1, 9, 'Decorative_style', 'Stile decorativo', NULL),
(391, 1, 9, 'Dependency-f', 'Frammento Dipendenze', NULL),
(392, 1, 9, 'Diocese', 'Diocesi', NULL),
(393, 1, 9, 'Economic_development', 'Sviluppo economico', NULL),
(394, 1, 9, 'Erection_of_church', 'Erezione di chiesa', NULL),
(395, 1, 9, 'Fact', 'Fatto', NULL),
(396, 1, 9, 'Family', 'Famiglia', NULL),
(397, 1, 9, 'Fresco', 'Affresco', NULL),
(398, 1, 9, 'Function-f', 'Frammento Funzione', NULL),
(399, 1, 9, 'Geographic_region', 'Regione geografica', NULL),
(400, 1, 9, 'Goal', 'Obiettivo', NULL),
(401, 1, 9, 'HSG_Knowledge_c', 'Conoscenza HSG', NULL),
(402, 1, 9, 'HSG_Story_c', 'Narrazione HSG', NULL),
(403, 1, 9, 'Hospice', 'Ospizio', NULL),
(404, 1, 9, 'Hospital', 'Ospedale', NULL),
(405, 1, 9, 'Human_settlement', 'Insediamento umano', NULL),
(406, 1, 9, 'Iconographic_theme', 'Tema iconografico', NULL),
(407, 1, 9, 'Iconography-f', 'Frammento Iconografia', NULL),
(408, 1, 9, 'Itinerary', 'Itinerario', NULL),
(409, 1, 9, 'Itinerary_CisalpineLands-France', 'Itinerario terre cisalpine-Francia', NULL),
(410, 1, 9, 'Itinerary_step', 'Tappa itinerario', NULL),
(411, 1, 9, 'Location-f', 'Frammento Localizzazione', NULL),
(412, 1, 9, 'Lordship', 'Signoria', NULL),
(413, 1, 9, 'Map', 'Mappa', NULL),
(414, 1, 9, 'Meadow_for_breeding_livestock', 'Prato da allevamento bestiame', NULL),
(415, 1, 9, 'Miniature', 'Miniatura', NULL),
(416, 1, 9, 'Municipality', 'Municipalità', NULL),
(417, 1, 9, 'Mutual_aid_society', 'Società di mutuo soccorso', NULL),
(418, 1, 9, 'Narration', 'Narrazione', NULL),
(419, 1, 9, 'Narration_fragment', 'Frammento di narrazione', NULL),
(420, 1, 9, 'Object', 'Oggetto', NULL),
(421, 1, 9, 'Painter', 'Pittore', NULL),
(422, 1, 9, 'Painting', 'Dipinto', NULL),
(423, 1, 9, 'Pass', 'Valico', NULL),
(424, 1, 9, 'Place', 'Luogo', NULL),
(425, 1, 9, 'Place_of_production', 'Luogo della produzione', NULL),
(426, 1, 9, 'Place_of_sacred_things', 'Luogo del sacro', NULL),
(427, 1, 9, 'Place_of_sociality', 'Luogo della socialità', NULL),
(428, 1, 9, 'Place_region', 'Regione di un luogo', NULL),
(429, 1, 9, 'Political-administrative_region', 'Regione politico-amministrativa', NULL),
(430, 1, 9, 'Political_framework-f', 'Frammento Quadro politico', NULL),
(431, 1, 9, 'Reference_model', 'Modello di riferimento', NULL),
(432, 1, 9, 'Reference_sample', 'Campione di riferimento', NULL),
(433, 1, 9, 'Reference_style', 'Stile di riferimento', NULL),
(434, 1, 9, 'Religious_procession_route', 'Percorso processionale', NULL),
(435, 1, 9, 'Roman_century', 'Centuria romana', NULL),
(436, 1, 9, 'Royal_family', 'Famiglia reale', NULL),
(437, 1, 9, 'Ruler', 'Governatore', NULL),
(438, 1, 9, 'Search', 'Ricerca', NULL),
(439, 1, 9, 'Series_of_painting', 'Ciclo di dipinti', NULL),
(440, 1, 9, 'Single_agent', 'Agente singolo', NULL),
(441, 1, 9, 'Situation', 'Situazione', NULL),
(442, 1, 9, 'Source-f', 'Frammento fonte', NULL),
(443, 1, 9, 'Theme', 'Tema', NULL),
(444, 1, 9, 'Time_interval', 'Intervallo temporale', NULL),
(445, 1, 9, 'Town_priest', 'Parroco del paese', NULL),
(446, 1, 9, 'Transhumance', 'Transumanza', NULL),
(447, 1, 9, 'Transit_area-f', 'Frammento Area transito', NULL),
(448, 1, 9, 'Transit_region', 'Regione di transito', NULL),
(449, 1, 9, 'Valley', 'Valle', NULL),
(450, NULL, 9, 'HSG_Source_reference_c', 'Riferimento fonte', NULL),
(451, NULL, 9, 'HSG_Source_c', 'Fonte HSG', NULL),
(452, NULL, 9, 'Source_document', 'Fonte documento', NULL),
(453, NULL, 9, 'Source_fresco_reproduction', 'Fonte riproduzione affresco', NULL),
(454, NULL, 9, 'Source_reference-f', 'Frammento Riferimento fonte', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `resource_template`
--

CREATE TABLE `resource_template` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `title_property_id` int(11) DEFAULT NULL,
  `description_property_id` int(11) DEFAULT NULL,
  `label` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(1, NULL, NULL, NULL, NULL, 'Base Resource');

-- --------------------------------------------------------

--
-- Struttura della tabella `resource_template_property`
--

CREATE TABLE `resource_template_property` (
  `id` int(11) NOT NULL,
  `resource_template_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `alternate_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_comment` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `data_type` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `is_required` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `resource_template_property`
--

INSERT INTO `resource_template_property` (`id`, `resource_template_id`, `property_id`, `alternate_label`, `alternate_comment`, `position`, `data_type`, `is_required`, `is_private`) VALUES
(1, 1, 1, NULL, NULL, 1, NULL, 0, 0),
(2, 1, 15, NULL, NULL, 2, NULL, 0, 0),
(3, 1, 8, NULL, NULL, 3, NULL, 0, 0),
(4, 1, 2, NULL, NULL, 4, NULL, 0, 0),
(5, 1, 7, NULL, NULL, 5, NULL, 0, 0),
(6, 1, 4, NULL, NULL, 6, NULL, 0, 0),
(7, 1, 9, NULL, NULL, 7, NULL, 0, 0),
(8, 1, 12, NULL, NULL, 8, NULL, 0, 0),
(9, 1, 40, 'Place', NULL, 9, NULL, 0, 0),
(10, 1, 5, NULL, NULL, 10, NULL, 0, 0),
(11, 1, 17, NULL, NULL, 11, NULL, 0, 0),
(12, 1, 6, NULL, NULL, 12, NULL, 0, 0),
(13, 1, 25, NULL, NULL, 13, NULL, 0, 0),
(14, 1, 10, NULL, NULL, 14, NULL, 0, 0),
(15, 1, 13, NULL, NULL, 15, NULL, 0, 0),
(16, 1, 29, NULL, NULL, 16, NULL, 0, 0),
(17, 1, 30, NULL, NULL, 17, NULL, 0, 0),
(18, 1, 50, NULL, NULL, 18, NULL, 0, 0),
(19, 1, 3, NULL, NULL, 19, NULL, 0, 0),
(20, 1, 41, NULL, NULL, 20, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `search_config`
--

CREATE TABLE `search_config` (
  `id` int(11) NOT NULL,
  `engine_id` int(11) NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `form_adapter` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:json)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `search_config`
--

INSERT INTO `search_config` (`id`, `engine_id`, `name`, `path`, `form_adapter`, `settings`, `created`, `modified`) VALUES
(1, 1, 'Default', 'find', 'main', '{\"search\":{\"default_results\":\"default\",\"default_query\":\"\"},\"autosuggest\":{\"suggester\":1,\"url\":\"\",\"url_param_name\":\"\"},\"form\":{\"filters\":[{\"field\":\"item_set_id\",\"label\":\"Collection\",\"type\":\"Omeka/MultiSelect\"},{\"field\":\"resource_class_id\",\"label\":\"Class\",\"type\":\"Omeka/MultiSelectFlat\"},{\"field\":\"resource_template_id\",\"label\":\"Template\",\"type\":\"Omeka/Radio\"},{\"field\":\"title\",\"label\":\"Title\",\"type\":null},{\"field\":\"author\",\"label\":\"Author\",\"type\":null},{\"field\":\"dcterms:subject\",\"label\":\"Subject\",\"type\":null},{\"field\":\"advanced\",\"label\":\"Filters\",\"type\":\"Advanced\",\"fields\":{\"title\":{\"value\":\"title\",\"label\":\"Title\"},\"author\":{\"value\":\"author\",\"label\":\"Author\"},\"dcterms:creator\":{\"value\":\"dcterms:creator\",\"label\":\"Creator\"},\"dcterms:subject\":{\"value\":\"dcterms:subject\",\"label\":\"Subject\"},\"date\":{\"value\":\"date\",\"label\":\"Date\"},\"description\":{\"value\":\"description\",\"label\":\"Description\"},\"resource_class_id\":{\"value\":\"resource_class_id\",\"label\":\"Class\"}},\"max_number\":\"5\",\"field_joiner\":true,\"field_joiner_not\":true,\"field_operator\":true,\"field_operators\":{\"eq\":\"is exactly\",\"in\":\"contains\",\"sw\":\"starts with\",\"ew\":\"ends with\",\"ex\":\"has any value\",\"res\":\"is resource with ID\"}},{\"field\":\"dcterms:date\",\"label\":\"Date range\",\"type\":\"DateRange\"}]},\"display\":{\"search_filters\":\"header\",\"paginator\":\"header\",\"per_pages\":\"header\",\"sort\":\"header\",\"grid_list\":\"header\",\"grid_list_mode\":\"auto\"},\"pagination\":{\"per_pages\":{\"10\":\"Results by 10\",\"25\":\"Results by 25\",\"50\":\"Results by 50\",\"100\":\"Results by 100\"}},\"sort\":{\"fields\":{\"dcterms:title asc\":{\"name\":\"dcterms:title asc\",\"label\":\"Title\"},\"dcterms:title desc\":{\"name\":\"dcterms:title desc\",\"label\":\"Title (from z to a)\"},\"dcterms:date asc\":{\"name\":\"dcterms:date asc\",\"label\":\"Date\"},\"dcterms:date desc\":{\"name\":\"dcterms:date desc\",\"label\":\"Date (most recent first)\"}}},\"facet\":{\"facets\":{\"item_set_id\":{\"name\":\"item_set_id\",\"label\":\"Collections\"},\"resource_class_id\":{\"name\":\"resource_class_id\",\"label\":\"Classes\"},\"dcterms:subject\":{\"name\":\"dcterms:subject\",\"label\":\"Subject\"},\"dcterms:type\":{\"name\":\"dcterms:type\",\"label\":\"Type\"},\"author\":{\"name\":\"author\",\"label\":\"Author\"},\"date\":{\"name\":\"date\",\"label\":\"Date\"},\"dcterms:language\":{\"name\":\"dcterms:language\",\"label\":\"Language\"}},\"languages\":[],\"mode\":\"button\",\"limit\":10,\"order\":\"\",\"display_button\":\"above\",\"display_active\":true,\"display_count\":true}}', '2022-01-30 23:42:59', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `search_engine`
--

CREATE TABLE `search_engine` (
  `id` int(11) NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adapter` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:json)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `search_engine`
--

INSERT INTO `search_engine` (`id`, `name`, `adapter`, `settings`, `created`, `modified`) VALUES
(1, 'Internal (sql)', 'internal', '{\"resources\":[\"items\",\"item_sets\"],\"adapter\":{\"default_search_partial_word\":false,\"multifields\":{\"title\":{\"name\":\"title\",\"label\":\"Title\",\"fields\":[\"dcterms:title\",\"dcterms:alternative\",\"bibo:shortTitle\"]},\"author\":{\"name\":\"author\",\"label\":\"Author\",\"fields\":[\"dcterms:creator\",\"dcterms:contributor\",\"bibo:authorList\",\"bibo:contributorList\",\"bibo:director\",\"bibo:editor\",\"bibo:editorList\",\"bibo:interviewee\",\"bibo:interviewer\",\"bibo:organizer\",\"bibo:performer\",\"bibo:producer\",\"bibo:recipient\",\"bibo:translator\"]},\"creator\":{\"name\":\"creator\",\"label\":\"Creator\",\"fields\":[\"dcterms:creator\"]},\"contributor\":{\"name\":\"contributor\",\"label\":\"Contributor\",\"fields\":[\"dcterms:contributor\",\"bibo:authorList\",\"bibo:contributorList\",\"bibo:director\",\"bibo:editor\",\"bibo:editorList\",\"bibo:interviewee\",\"bibo:interviewer\",\"bibo:organizer\",\"bibo:performer\",\"bibo:producer\",\"bibo:recipient\",\"bibo:translator\"]},\"subject\":{\"name\":\"subject\",\"label\":\"Subject\",\"fields\":[\"dcterms:subject\"]},\"description\":{\"name\":\"description\",\"label\":\"Description\",\"fields\":[\"dcterms:description\",\"dcterms:abstract\",\"dcterms:tableOfContents\",\"bibo:abstract\",\"bibo:shortDescription\"]},\"publisher\":{\"name\":\"publisher\",\"label\":\"Publisher\",\"fields\":[\"dcterms:publisher\",\"bibo:distributor\",\"bibo:issuer\"]},\"date\":{\"name\":\"date\",\"label\":\"Date\",\"fields\":[\"dcterms:date\",\"dcterms:available\",\"dcterms:created\",\"dcterms:issued\",\"dcterms:modified\",\"dcterms:valid\",\"dcterms:dateAccepted\",\"dcterms:dateCopyrighted\",\"dcterms:dateSubmitted\",\"bibo:argued\"]},\"type\":{\"name\":\"type\",\"label\":\"Type\",\"fields\":[\"dcterms:type\"]},\"format\":{\"name\":\"format\",\"label\":\"Format\",\"fields\":[\"dcterms:format\",\"dcterms:extent\",\"dcterms:medium\"]},\"identifier\":{\"name\":\"identifier\",\"label\":\"Identifier\",\"fields\":[\"dcterms:identifier\",\"dcterms:bibliographicCitation\",\"bibo:asin\",\"bibo:coden\",\"bibo:doi\",\"bibo:eanucc13\",\"bibo:eissn\",\"bibo:gtin14\",\"bibo:handle\",\"bibo:identifier\",\"bibo:isbn\",\"bibo:isbn10\",\"bibo:isbn13\",\"bibo:issn\",\"bibo:oclcnum\",\"bibo:pmid\",\"bibo:sici\",\"bibo:upc\",\"bibo:uri\"]},\"source\":{\"name\":\"source\",\"label\":\"Source\",\"fields\":[\"dcterms:source\"]},\"provenance\":{\"name\":\"provenance\",\"label\":\"Provenance\",\"fields\":[\"dcterms:provenance\"]},\"language\":{\"name\":\"language\",\"label\":\"Language\",\"fields\":[\"dcterms:language\"]},\"relation\":{\"name\":\"relation\",\"label\":\"Relation\",\"fields\":[\"dcterms:relation\",\"dcterms:isVersionOf\",\"dcterms:hasVersion\",\"dcterms:isReplacedBy\",\"dcterms:replaces\",\"dcterms:isRequiredBy\",\"dcterms:requires\",\"dcterms:isPartOf\",\"dcterms:hasPart\",\"dcterms:isReferencedBy\",\"dcterms:references\",\"dcterms:isFormatOf\",\"dcterms:hasFormat\",\"dcterms:conformsTo\",\"bibo:annotates\",\"bibo:citedBy\",\"bibo:cites\",\"bibo:reproducedIn\",\"bibo:reviewOf\",\"bibo:transcriptOf\",\"bibo:translationOf\"]},\"coverage\":{\"name\":\"coverage\",\"label\":\"Coverage\",\"fields\":[\"dcterms:coverage\",\"dcterms:spatial\",\"dcterms:temporal\"]},\"rights\":{\"name\":\"rights\",\"label\":\"Rights\",\"fields\":[\"dcterms:rights\",\"dcterms:accessRights\",\"dcterms:license\"]},\"audience\":{\"name\":\"audience\",\"label\":\"Audience\",\"fields\":[\"dcterms:audience\",\"dcterms:mediator\",\"dcterms:educationLevel\"]},\"rightsHolder\":{\"name\":\"rightsHolder\",\"label\":\"Rights holder\",\"fields\":[\"dcterms:rightsHolder\",\"bibo:owner\"]},\"accrualAndInstructional\":{\"name\":\"accrualAndInstructional\",\"label\":\"Accrual and instructional metadata\",\"fields\":[\"dcterms:accrualMethod\",\"dcterms:accrualPeriodicity\",\"dcterms:accrualPolicy\",\"dcterms:instructionalMethod\"]},\"bibliographicData\":{\"name\":\"bibliographicData\",\"label\":\"Bibliographic data\",\"fields\":[\"bibo:chapter\",\"bibo:edition\",\"bibo:issue\",\"bibo:locator\",\"bibo:numPages\",\"bibo:numVolumes\",\"bibo:number\",\"bibo:pageEnd\",\"bibo:pageStart\",\"bibo:pages\",\"bibo:section\",\"bibo:volume\"]}}}}', '2022-01-30 23:42:59', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `search_suggester`
--

CREATE TABLE `search_suggester` (
  `id` int(11) NOT NULL,
  `engine_id` int(11) NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:json)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `search_suggester`
--

INSERT INTO `search_suggester` (`id`, `engine_id`, `name`, `settings`, `created`, `modified`) VALUES
(1, 1, 'Internal suggester (sql)', '{\"direct\":false,\"mode_index\":\"start\",\"mode_search\":\"start\",\"limit\":25,\"length\":50,\"fields\":[],\"excluded_fields\":[]}', '2022-01-30 23:42:59', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `search_suggestion`
--

CREATE TABLE `search_suggestion` (
  `id` int(11) NOT NULL,
  `suggester_id` int(11) NOT NULL,
  `text` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_all` int(11) NOT NULL,
  `total_public` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `session`
--

CREATE TABLE `session` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longblob NOT NULL,
  `modified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('0bs4bj8pl7bbpu6juieuqpgcta', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313634333538393233322e3732323834383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2233376c6d31326334307061696673316773716f75676864393969223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313634333538363430393b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313634333539303730353b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313634333539303730353b7d733a31313a2245617379496e7374616c6c223b613a323a7b733a363a22455850495245223b693a313634333539303630363b733a31313a224558504952455f484f5053223b613a323a7b733a343a22686f7073223b693a31303b733a323a227473223b643a313634333538373030342e3130363938313b7d7d733a33373a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313634333539303834343b7d733a34353a224c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313634333539303532383b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226232663134636263336266373537333963656466376331356561633632326431223b733a33323a226330663161616439386434636164373231653136393832623135636134363039223b733a33323a223466633239653663313061356134383130336261623535393739386639303638223b733a33323a226163646565616238643937383430353337643734656334613061653233323265223b7d733a343a2268617368223b733a36353a2261636465656162386439373834303533376437346563346130616532333232652d3466633239653663313061356134383130336261623535393739386639303638223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d72656469726563745f75726c7c733a32393a22687474703a2f2f6c6f63616c686f73742f6f6d656b61732f61646d696e223b4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a323437323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32373a7b733a33323a223362323334633636373335303238653435363436633332356661333266613737223b733a33323a223937376531373236376139336538623338396662333534636431633834393062223b733a33323a223537643065313433663239313862663332366562313231373236303564656530223b733a33323a226634623962393533613361376232626564383761376265663163313433303334223b733a33323a223230653665333137316663393836633562333137376331346463393938663535223b733a33323a226430313664643931653832643963363936346237393534306163653361356630223b733a33323a226264396135306534663235653637663531623438363831303732623132393062223b733a33323a226363343531316638316138363232336631363763316138356137346636646239223b733a33323a226530613833356338353533353064653830373836303565653264613430313736223b733a33323a223432613834353638656166303038333230303937363462636564633334353036223b733a33323a223463333036383431393935336234303632303033303239656235353661396461223b733a33323a223637353336323364323433663832393564306231653533376564333437653539223b733a33323a223130653263616563313466376137326435626132663433306239336630363036223b733a33323a226265383462383735646364343431643131616637326261656236313333613138223b733a33323a226633393733613339633165373932393135396534383636376231396434343436223b733a33323a223237323465366339643961303762636361626331333930616435343730383132223b733a33323a226164366365643832633462643932346164616334373738666436343439626437223b733a33323a226535376565386338313436323765363534353931666366393937613736626633223b733a33323a223839616564376530313634646164643332373963313265663635363230303335223b733a33323a226430663863306634356366616266626430313862616233303535333138666135223b733a33323a226335636535383565616463393633623730353366616130306531313836346535223b733a33323a223631343539333938316238356235333639666233623534353536343838366663223b733a33323a226439353934643264663336623636363232613936356334333364633533303165223b733a33323a226566346165666538616665316466313636623637336166353536313263643130223b733a33323a226266323035326330356234613230343332393832393662313631363733363864223b733a33323a223136323161366464383737346530303636326439346466646636613936623863223b733a33323a223238623761376230643663303838653330653333373933623631633161633036223b733a33323a226366373461653262313836666261653161306637643833393334393131386531223b733a33323a223663343236626631653266366435356262623261353830363162356337616637223b733a33323a223765646165623966613032356535363466323031656639376236623962653136223b733a33323a223062326332383031393835666637623331316433353636396134353935646361223b733a33323a223137366265383865636135346263363831343964323365333331393865313061223b733a33323a226533333934666636393966313935343062623230623835653731636337363765223b733a33323a223135306430633134663365623131656266303639616562383762646533643832223b733a33323a223264643065316330343330323031333666336632656236663035383964656666223b733a33323a223235313339646163663734653133663763633430626563366130366130326261223b733a33323a223565613262623562346164393739373764383531393738343237343331396363223b733a33323a223166356536393139363737383665646665613639386631356131363466393934223b733a33323a223865386262653639343038386439343537623061623162613366613861373038223b733a33323a223935626135323030633739313532333830616364366533353932636262626330223b733a33323a223731336161376662626138313437373665383433396638396430396531313132223b733a33323a226338386636613730626431616562346433333338313462313538663361653361223b733a33323a223866333930393638333130333038366134303761373536323230383362366630223b733a33323a226462343632383061663764656230396336316161666665303962336336613735223b733a33323a226564343961393437373065633336323062356265343537376134356634323332223b733a33323a226164633764303336343134383031663733323434353437623239313264323066223b733a33323a223664346134356333333331386533323332303035333231316162396566666264223b733a33323a223736663039643962356233386662383233326131363436613835303931633237223b733a33323a223530383661363263396234363430343435396231326465643039323933613431223b733a33323a223937363933636632373938316236653433353633666438633436336530313538223b733a33323a226264393433663532373838646239616130323736623961323737353264653837223b733a33323a226132633333653030373166643939303135316365663363366337366436376566223b733a33323a223838303231366233313337376339303261663435666466396263323166653236223b733a33323a223662373065313931343232356134373530363838343231383737336430393161223b7d733a343a2268617368223b733a36353a2236623730653139313432323561343735303638383432313837373364303931612d3838303231366233313337376339303261663435666466396263323166653236223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a363535323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a37383a7b733a33323a226366306561383630373461633037663530616634356263366566623237323461223b733a33323a226166633362313137613835313232643432333531323036626533663237376262223b733a33323a223539373539386630343137393437393636346135373139663938353364656663223b733a33323a226432383738616338626265653633633865363536663431376266636239363066223b733a33323a223264356564326361376137366566633665633962643134326366336162613539223b733a33323a223637316631623837663066373163386463333164343437303335666335333533223b733a33323a226438363062336138653937623364343465363733356430613936353461643930223b733a33323a223162343739363137313130616162393465353038323833353135373831303566223b733a33323a226361663865333862306163636634346364386437343539336165623830633538223b733a33323a226163666639333432616230373163303363633237353434366434346330666630223b733a33323a223033316561303466313831316133323737346239383463666131383233346131223b733a33323a226332646165326662376561623262313062643266353334323330353233346335223b733a33323a223235376234306336333634323439313838326162336361373231666630663033223b733a33323a223930653762653733303937313365663961363330616134623664656166346161223b733a33323a223238633433616164643139303836383739616332313430313161646535376430223b733a33323a223664396433353034353663323037663761303534396530356530633065393833223b733a33323a223238313531393837333836663164663865353537393335646234646665623537223b733a33323a226465333665636431313730663461313037613333663363316461616564353839223b733a33323a223366633834383032313663386337363433346532643934343536663731326634223b733a33323a223037313562323064663963613166373630306337316132613538343934323239223b733a33323a226362316266366237333161633038336339373634343431623833353638643531223b733a33323a223536336636646638363038643961373833646539336432626561616531343163223b733a33323a223763323462313837326638663539346465373664376265623530306562663965223b733a33323a226134343861366232346637633466656237663938653762656439356233326237223b733a33323a223430353264346638393961616638346236666266343833343633613366626236223b733a33323a226265643463343636393362313363373361343233323333376365653564623435223b733a33323a226538613438353564373763613133623162343261633230306362323365323238223b733a33323a226433636661626435666636333939316636353966613730366634346163346532223b733a33323a226137643538643739653132633330636233386335346332363438383338613335223b733a33323a226339346430656263303739656664336433363331323065353739653232323361223b733a33323a226430386565646666653132333039333831303337326463346438313732313865223b733a33323a226537326631336361373632383661623837326436613438313464333230303863223b733a33323a223732616630326365373864643762303133643631643566383261663538666261223b733a33323a223036333130653864313765333766653532393562663961393537663662663064223b733a33323a223233646233363663356439623336333832303762636162316236643039323462223b733a33323a223230376638393763316363323931653939633630336266303364663661333933223b733a33323a226334373234366634393337333036376436363732366166613863333463663765223b733a33323a223236313535303231353433366538626334613663313237346663333936353331223b733a33323a226666326434353734643837363263306531633163306334386237393130663130223b733a33323a223162356231393835623031666239626139313237636466626464666561373538223b733a33323a223261633561383862363461326338386530656537373033326230633432363835223b733a33323a226264643631623463376436393665386435333232323430623364303036326534223b733a33323a223838303539646436323639393330303361663439653338323737643164663864223b733a33323a226330303431376333633732623864326435653938376166326338666166653265223b733a33323a226536643336373363336234346163646133633131303832636333316466333839223b733a33323a223136343364306437396264656233373731653664363766323061346537343536223b733a33323a223039656566613063383730333339303235353237383061353631376166333732223b733a33323a223063346161326465663237313733646532376438633234613138393835376333223b733a33323a223463343135313238346237393835303732323630343637323364363538663532223b733a33323a223033633261636430346165633363303365363664303065653463326461366133223b733a33323a223261313162613432373033613639666636643466366162666461623666656565223b733a33323a223132613535386235323436646161396234653335363730633135663632663136223b733a33323a226463313836343234656431623363623938653265633363646637653136386461223b733a33323a226533633565616233373638386562663464393537613139316162626139353239223b733a33323a223561366166373735643337383363666532316633376630396237646162303464223b733a33323a223062393262363135633834613439333262383235366435303663346539656663223b733a33323a226566383734636635626237656331386338666232656330396530653438623638223b733a33323a223138313333353636306437333831373765663431353966656461666130383563223b733a33323a226533653662653861333530326432613964663432396130646261356661336264223b733a33323a223134323932363064306161393431373566323065396336616263633738306135223b733a33323a223766613330613264393131306335363534343330306237656366396462353665223b733a33323a226435343334643338626363396638663565633037323663396635333135373238223b733a33323a223762396139373462313839363230363864643663386631313939313361356638223b733a33323a226566363462313634643531623064633362336535653837636632363637343533223b733a33323a223765306639356231313664363637653939343864333431623437633234613038223b733a33323a226539653636313738336264313230333535363938663530303231306161643262223b733a33323a223366373966633836623565636564356131643535353239343233356665326232223b733a33323a223034653837313735353662363865613337346233386539623039323837333764223b733a33323a223235306132656632656235623164343462636265323634346334323865373336223b733a33323a223533313235346234383130356164376335376431643734653335343733363464223b733a33323a226538353836343733363661303837666562663364386265643566363064636330223b733a33323a226463306233356361343432636437336631653563323836326361643830326561223b733a33323a226262623232313230323339343835613936633566666562346562356233336563223b733a33323a223866613665633735373865616133306138316131643337653939616163366466223b733a33323a223662613830393461313564303266623739393565343337323966653932626261223b733a33323a226464653430616566396130333037653038633134623931386339363333646230223b733a33323a223165373661303064313232373634636333386363633338336435326635303366223b733a33323a226339626638393438396238383634376331656539336561633739643731363865223b733a33323a226235303139616364613666623362383536373239336366643732336665386338223b733a33323a226564363835666135636265393531343834316465393237633936373362656636223b733a33323a223266313136626630626238363763353163313361323338336637363938666131223b733a33323a223863636165303637626561323736316536373863386465393830333736643634223b733a33323a223133643564303962356638633838303034623737643337646232646432356665223b733a33323a226330313664313831306634343536396363303864316632633064626461633632223b733a33323a223463616462353664383534313862333738336233353634373333343531653234223b733a33323a223630326235626262386537333436623934353364303866393563393263323762223b733a33323a223661393231623764363163633338353734353561643962643733363463636338223b733a33323a223865626333366161316566346236366633326364353066633463306336633134223b733a33323a226231313464376636633739386361343863643233373338636662643739356633223b733a33323a226338316164656430336361303339323233633562313266313939376561363937223b733a33323a226139366263313064373832613633393438643766633839643934333131353365223b733a33323a223738636135326533353161616339356165313763353538323731616536303763223b733a33323a223461376165353065666639663439383836623661323665656163633830346439223b733a33323a223333643134313264303561346637313737343136636238303864616535343230223b733a33323a223333363031383834653262393766303130613532653635376237626135356232223b733a33323a223161623032366237656432303865613934623539643161366130303031383731223b733a33323a226161323161633534363164316639613462303231613165333031343737313666223b733a33323a226133363338626134393731353137643331396262313835656333383734323463223b733a33323a223935623936366362633435336363383639306466363461303634366164396564223b733a33323a223534326262326562633264343463613963393565326237363961366334363130223b733a33323a223637653039393763313630333231383661663034313065613165663939323936223b733a33323a223738356339393332386233636365306633663565373634396266363231616462223b733a33323a223531656138633531316139646363363234636237343336653865323761396437223b733a33323a223263383437353731383739643965376362306636666637386432343135386130223b733a33323a223237623261666536613939636361623239636465383262363532353438383735223b733a33323a226230376136633862303562653061633436613332636134343064343366343936223b733a33323a226163363962626531653661656538633061386634333032353230353663636566223b733a33323a223031363933323039386663666635616133303239356262303266383464643538223b733a33323a223663363064313432383335626635316264616461373730616465383338303534223b733a33323a226361653262356466653864303831343838633836643139343066613965616631223b733a33323a223730636437633437363363396364343330333066343434343131623638303836223b733a33323a226364303236663034316562396361623064396536313664343630373334303766223b733a33323a226430346163623139616363333965373366313335636239323131396332353562223b733a33323a226533616139376462653765336539626138346230333030616630336533316163223b733a33323a223562613161653430666632313461383632653730366136306539373637653438223b733a33323a226261386361636432393736323466663661613130343066343739356538653939223b733a33323a223833366539613831636631393335306365666537613765656165306662613131223b733a33323a226262613366343365333535373332623363613832633531373562653032633561223b733a33323a223237656434366365323162356661333132656366393666363034653365303432223b733a33323a223132616565373663373164366132373136383930663966376132643735646336223b733a33323a226139366537323839343161656135396362343165643065386439303733376666223b733a33323a226335343165636236373262326131666137353638333937393433363131323261223b733a33323a223465356163393838636232356636346632623666373463626130313966393965223b733a33323a226231616434303732633439396438326162303830376531623730633766656166223b733a33323a226563313464393766306230333737623536363134323264396635356634656238223b733a33323a223136663962333465653032326361383333323966616265613533373533613234223b733a33323a223331313234373334653366303333633637343138633335653938643334393133223b733a33323a226464336237383237313962323835316462343465656439623962636130636535223b733a33323a223965616637623264323962646464303962323634376536316238636365666630223b733a33323a223238303830393765333738323966633361646233343337383936666131373962223b733a33323a223639666536353663383131656561656565393961343561333461643634646466223b733a33323a226536383065653738353532313839323435633538663436343635363634663638223b733a33323a223366656139353330363464623132636437386435623261656163356664643231223b733a33323a226632323733376332346236653165313231366533393333663331386563616363223b733a33323a226636373131633230313132643232323835643331333034663239653531306565223b733a33323a226163623634363134323938623638623464343263343833623264343832313962223b733a33323a223066363835653735643036316135353139383739633537663663613930336461223b733a33323a223333613464373938613233363437363962383937336266333665616164616438223b733a33323a223037393633303563316333373037643837636139646161643562383734386661223b733a33323a223730336364666632663765623264616631623531633530636137666636646230223b733a33323a223364346164353937373730373265343030633665313038633938653562666461223b733a33323a223634303737343765646530373431613537306261643937633364383131646666223b733a33323a226166366266303934333233643763336265306535633666613461313834313965223b733a33323a223433626335623237346437353662616537633438623234646166303535626231223b733a33323a223839333631353464393531666139373030623463656461656162623766653333223b733a33323a223530396139666437373635326562633631346132373932383264376137393564223b733a33323a223438386530313631373034326432323931363930353064383234396135326335223b733a33323a226136393364306234393136366333636265323838643964303165366537346437223b733a33323a226136373035346634623936656335383238396631623831386532663339323931223b733a33323a223832346263383964663438653432323834363535626266666664393933363632223b733a33323a223363646266356532636362363966373433346334326237623863383765393335223b733a33323a226131626561393731366333343366316136643166623430393666643531623361223b733a33323a226561366264383633633833663865643935393863303133353830366262393733223b733a33323a223633303966623366373961343436306137333532306266646437646338326339223b733a33323a226337376431393130646237333839383735653562303131626463643166386432223b733a33323a223536656464353065663462663663623565626135313134376133353832653639223b7d733a343a2268617368223b733a36353a2235366564643530656634626636636235656261353131343761333538326536392d6337376431393130646237333839383735653562303131626463643166386432223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d45617379496e7374616c6c7c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a32393731393a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a363a226164646f6e73223b613a343a7b733a31313a226f6d656b616d6f64756c65223b613a37313a7b733a35383a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d416476616e636564536561726368223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31343a22416476616e636564536561726368223b733a383a22626173656e616d65223b733a31343a22416476616e636564536561726368223b733a333a22646972223b733a31343a22416476616e636564536561726368223b733a373a2276657273696f6e223b733a373a22332e332e362e39223b733a333a227a6970223b733a3131313a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d416476616e6365645365617263682f72656c65617365732f646f776e6c6f61642f332e332e362e392f416476616e6365645365617263682d332e332e362e392e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a36323a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d416476616e636564536561726368506c7573223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31383a22416476616e636564536561726368506c7573223b733a383a22626173656e616d65223b733a31383a22416476616e636564536561726368506c7573223b733a333a22646972223b733a31383a22416476616e636564536561726368506c7573223b733a373a2276657273696f6e223b733a373a22332e332e352e36223b733a333a227a6970223b733a3131393a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d416476616e636564536561726368506c75732f72656c65617365732f646f776e6c6f61642f332e332e352e362f416476616e636564536561726368506c75732d332e332e352e362e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a33373a2268747470733a2f2f6769746875622e636f6d2f7a65726f6372617465732f416c7454657874223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a373a22416c7454657874223b733a383a22626173656e616d65223b733a373a22416c7454657874223b733a333a22646972223b733a373a22416c7454657874223b733a373a2276657273696f6e223b733a353a22312e332e30223b733a333a227a6970223b733a38303a2268747470733a2f2f6769746875622e636f6d2f7a65726f6372617465732f416c74546578742f72656c65617365732f646f776e6c6f61642f76312e332e302f416c74546578742d312e332e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a36303a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d416e616c7974696373536e6970706574223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31363a22416e616c7974696373536e6970706574223b733a383a22626173656e616d65223b733a31363a22416e616c7974696373536e6970706574223b733a333a22646972223b733a31363a22416e616c7974696373536e6970706574223b733a373a2276657273696f6e223b733a373a22332e332e332e31223b733a333a227a6970223b733a3131353a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d416e616c7974696373536e69707065742f72656c65617365732f646f776e6c6f61642f332e332e332e312f416e616c7974696373536e69707065742d332e332e332e312e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a36343a2268747470733a2f2f6769746875622e636f6d2f48424c4c2d436f6c6c656374696f6e2d446576656c6f706d656e742f6f6d656b612d732d616e792d636c6f7564223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a383a22416e79436c6f7564223b733a383a22626173656e616d65223b733a383a22416e79436c6f7564223b733a333a22646972223b733a383a22416e79436c6f7564223b733a373a2276657273696f6e223b733a353a22322e302e30223b733a333a227a6970223b733a3130383a2268747470733a2f2f6769746875622e636f6d2f48424c4c2d436f6c6c656374696f6e2d446576656c6f706d656e742f6f6d656b612d732d616e792d636c6f75642f72656c65617365732f646f776e6c6f61642f76322e302e302f416e79436c6f756476322e302e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a35323a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d42756c6b45646974223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a383a2242756c6b45646974223b733a383a22626173656e616d65223b733a383a2242756c6b45646974223b733a333a22646972223b733a383a2242756c6b45646974223b733a373a2276657273696f6e223b733a383a22332e332e31332e33223b733a333a227a6970223b733a3130313a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d42756c6b456469742f72656c65617365732f646f776e6c6f61642f332e332e31332e332f42756c6b456469742d332e332e31332e332e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34343a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f435353456469746f72223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a393a22435353456469746f72223b733a383a22626173656e616d65223b733a393a22435353456469746f72223b733a333a22646972223b733a393a22435353456469746f72223b733a373a2276657273696f6e223b733a353a22312e332e30223b733a333a227a6970223b733a38393a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f435353456469746f722f72656c65617365732f646f776e6c6f61642f76312e332e302f435353456469746f722d312e332e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34343a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f435356496d706f7274223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a393a22435356496d706f7274223b733a383a22626173656e616d65223b733a393a22435356496d706f7274223b733a333a22646972223b733a393a22435356496d706f7274223b733a373a2276657273696f6e223b733a353a22322e322e31223b733a333a227a6970223b733a38393a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f435356496d706f72742f72656c65617365732f646f776e6c6f61642f76322e322e312f435356496d706f72742d322e322e312e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34383a2268747470733a2f2f6769746875622e636f6d2f6269626c696272652f6f6d656b612d732d6d6f64756c652d436f696e73223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a353a22436f696e73223b733a383a22626173656e616d65223b733a353a22436f696e73223b733a333a22646972223b733a353a22436f696e73223b733a373a2276657273696f6e223b733a353a22332e302e31223b733a333a227a6970223b733a38393a2268747470733a2f2f6769746875622e636f6d2f6269626c696272652f6f6d656b612d732d6d6f64756c652d436f696e732f72656c65617365732f646f776e6c6f61642f76332e302e312f436f696e732d332e302e312e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34353a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f436f6c6c656374696e67223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31303a22436f6c6c656374696e67223b733a383a22626173656e616d65223b733a31303a22436f6c6c656374696e67223b733a333a22646972223b733a31303a22436f6c6c656374696e67223b733a373a2276657273696f6e223b733a353a22312e382e30223b733a333a227a6970223b733a39313a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f436f6c6c656374696e672f72656c65617365732f646f776e6c6f61642f76312e382e302f436f6c6c656374696e672d312e382e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a36363a2268747470733a2f2f6769746875622e636f6d2f6269626c696272652f6f6d656b612d732d6d6f64756c652d4372656174654d697373696e675468756d626e61696c73223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a32333a224372656174654d697373696e675468756d626e61696c73223b733a383a22626173656e616d65223b733a32333a224372656174654d697373696e675468756d626e61696c73223b733a333a22646972223b733a32333a224372656174654d697373696e675468756d626e61696c73223b733a373a2276657273696f6e223b733a353a22302e322e30223b733a333a227a6970223b733a3132353a2268747470733a2f2f6769746875622e636f6d2f6269626c696272652f6f6d656b612d732d6d6f64756c652d4372656174654d697373696e675468756d626e61696c732f72656c65617365732f646f776e6c6f61642f76302e322e302f4372656174654d697373696e675468756d626e61696c732d302e322e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34363a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f437573746f6d566f636162223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31313a22437573746f6d566f636162223b733a383a22626173656e616d65223b733a31313a22437573746f6d566f636162223b733a333a22646972223b733a31313a22437573746f6d566f636162223b733a373a2276657273696f6e223b733a353a22312e342e30223b733a333a227a6970223b733a39333a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f437573746f6d566f6361622f72656c65617365732f646f776e6c6f61642f76312e342e302f437573746f6d566f6361622d312e342e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34373a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f44617461436c65616e696e67223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31323a2244617461436c65616e696e67223b733a383a22626173656e616d65223b733a31323a2244617461436c65616e696e67223b733a333a22646972223b733a31323a2244617461436c65616e696e67223b733a373a2276657273696f6e223b733a353a22312e302e30223b733a333a227a6970223b733a39353a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f44617461436c65616e696e672f72656c65617365732f646f776e6c6f61642f76312e302e302f44617461436c65616e696e672d312e302e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34323a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f44617461766973223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a373a2244617461766973223b733a383a22626173656e616d65223b733a373a2244617461766973223b733a333a22646972223b733a373a2244617461766973223b733a373a2276657273696f6e223b733a353a22312e302e30223b733a333a227a6970223b733a38353a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f446174617669732f72656c65617365732f646f776e6c6f61642f76312e302e302f446174617669732d312e302e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a36303a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d44657269766174697665496d61676573223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31363a2244657269766174697665496d61676573223b733a383a22626173656e616d65223b733a31363a2244657269766174697665496d61676573223b733a333a22646972223b733a31363a2244657269766174697665496d61676573223b733a373a2276657273696f6e223b733a373a22332e332e372e30223b733a333a227a6970223b733a3131353a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d44657269766174697665496d616765732f72656c65617365732f646f776e6c6f61642f332e332e372e302f44657269766174697665496d616765732d332e332e372e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a35303a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f447370616365436f6e6e6563746f72223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31353a22447370616365436f6e6e6563746f72223b733a383a22626173656e616d65223b733a31353a22447370616365436f6e6e6563746f72223b733a333a22646972223b733a31353a22447370616365436f6e6e6563746f72223b733a373a2276657273696f6e223b733a353a22312e332e30223b733a333a227a6970223b733a3130313a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f447370616365436f6e6e6563746f722f72656c65617365732f646f776e6c6f61642f76312e332e302f447370616365436f6e6e6563746f722d312e332e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a35353a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d4555436f6f6b6965426172223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31313a224555436f6f6b6965426172223b733a383a22626173656e616d65223b733a31313a224555436f6f6b6965426172223b733a333a22646972223b733a31313a224555436f6f6b6965426172223b733a373a2276657273696f6e223b733a373a22332e332e342e33223b733a333a227a6970223b733a3130353a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d4555436f6f6b69654261722f72656c65617365732f646f776e6c6f61642f332e332e342e332f4555436f6f6b69654261722d332e332e342e332e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a35353a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d45617379496e7374616c6c223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31313a2245617379496e7374616c6c223b733a383a22626173656e616d65223b733a31313a2245617379496e7374616c6c223b733a333a22646972223b733a31313a2245617379496e7374616c6c223b733a373a2276657273696f6e223b733a353a22332e332e36223b733a333a227a6970223b733a3130313a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d45617379496e7374616c6c2f72656c65617365732f646f776e6c6f61642f332e332e362f45617379496e7374616c6c2d332e332e362e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a33353a2268747470733a2f2f6769746875622e636f6d2f6c617572616c6569662f4578706f7274223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a363a224578706f7274223b733a383a22626173656e616d65223b733a363a224578706f7274223b733a333a22646972223b733a363a224578706f7274223b733a373a2276657273696f6e223b733a353a22312e352e30223b733a333a227a6970223b733a37313a2268747470733a2f2f6769746875622e636f6d2f6c617572616c6569662f4578706f72742f72656c65617365732f646f776e6c6f61642f76312e352e302f4578706f72742e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a35303a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f457874726163744d65746164617461223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31353a22457874726163744d65746164617461223b733a383a22626173656e616d65223b733a31353a22457874726163744d65746164617461223b733a333a22646972223b733a31353a22457874726163744d65746164617461223b733a373a2276657273696f6e223b733a353a22312e302e30223b733a333a227a6970223b733a3130313a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f457874726163744d657461646174612f72656c65617365732f646f776e6c6f61642f76312e302e302f457874726163744d657461646174612d312e302e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a35303a2268747470733a2f2f6769746875622e636f6d2f73796d61632f4f6d656b612d532d6d6f64756c652d457874726163744f6372223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31303a22457874726163744f6372223b733a383a22626173656e616d65223b733a31303a22457874726163744f6372223b733a333a22646972223b733a31303a22457874726163744f6372223b733a373a2276657273696f6e223b733a373a22332e332e322e31223b733a333a227a6970223b733a3130303a2268747470733a2f2f6769746875622e636f6d2f73796d61632f4f6d656b612d532d6d6f64756c652d457874726163744f63722f72656c65617365732f646f776e6c6f61642f76332e332e322e312f457874726163744f63722d332e332e322e312e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34363a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f4578747261637454657874223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31313a224578747261637454657874223b733a383a22626173656e616d65223b733a31313a224578747261637454657874223b733a333a22646972223b733a31313a224578747261637454657874223b733a373a2276657273696f6e223b733a353a22312e322e31223b733a333a227a6970223b733a39333a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f45787472616374546578742f72656c65617365732f646f776e6c6f61642f76312e322e312f45787472616374546578742d312e322e312e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34383a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f4661636574656442726f777365223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31333a224661636574656442726f777365223b733a383a22626173656e616d65223b733a31333a224661636574656442726f777365223b733a333a22646972223b733a31333a224661636574656442726f777365223b733a373a2276657273696f6e223b733a353a22312e302e30223b733a333a227a6970223b733a39373a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f4661636574656442726f7773652f72656c65617365732f646f776e6c6f61642f76312e302e302f4661636574656442726f7773652d312e302e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a35303a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f4665646f7261436f6e6e6563746f72223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31353a224665646f7261436f6e6e6563746f72223b733a383a22626173656e616d65223b733a31353a224665646f7261436f6e6e6563746f72223b733a333a22646972223b733a31353a224665646f7261436f6e6e6563746f72223b733a373a2276657273696f6e223b733a353a22312e332e30223b733a333a227a6970223b733a3130313a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f4665646f7261436f6e6e6563746f722f72656c65617365732f646f776e6c6f61642f76312e332e302f4665646f7261436f6e6e6563746f722d312e332e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34373a2268747470733a2f2f6769746875622e636f6d2f4c69626e616d69632f4f6d656b612d532d4669656c64417354616773223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31323a224669656c6473417354616773223b733a383a22626173656e616d65223b733a31323a224669656c6473417354616773223b733a333a22646972223b733a31323a224669656c6473417354616773223b733a373a2276657273696f6e223b733a353a22312e302e31223b733a333a227a6970223b733a38393a2268747470733a2f2f6769746875622e636f6d2f4c69626e616d69632f4f6d656b612d532d4669656c644173546167732f72656c65617365732f646f776e6c6f61642f76312e302e312f4669656c64734173546167732e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34373a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f46696c65536964656c6f6164223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31323a2246696c65536964656c6f6164223b733a383a22626173656e616d65223b733a31323a2246696c65536964656c6f6164223b733a333a22646972223b733a31323a2246696c65536964656c6f6164223b733a373a2276657273696f6e223b733a353a22312e352e30223b733a333a227a6970223b733a39353a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f46696c65536964656c6f61642f72656c65617365732f646f776e6c6f61642f76312e352e302f46696c65536964656c6f61642d312e352e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a35343a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d466f6c6b736f6e6f6d79223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31303a22466f6c6b736f6e6f6d79223b733a383a22626173656e616d65223b733a31303a22466f6c6b736f6e6f6d79223b733a333a22646972223b733a31303a22466f6c6b736f6e6f6d79223b733a373a2276657273696f6e223b733a383a22332e332e31312e31223b733a333a227a6970223b733a3130353a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d466f6c6b736f6e6f6d792f72656c65617365732f646f776e6c6f61642f332e332e31312e312f466f6c6b736f6e6f6d792d332e332e31312e312e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a35313a2268747470733a2f2f6769746875622e636f6d2f4c69626e616d69632f4f6d656b612d532d476f6f676c65416e616c7974696373223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31353a22476f6f676c65416e616c7974696373223b733a383a22626173656e616d65223b733a31353a22476f6f676c65416e616c7974696373223b733a333a22646972223b733a31353a22476f6f676c65416e616c7974696373223b733a373a2276657273696f6e223b733a353a22312e322e32223b733a333a227a6970223b733a39373a2268747470733a2f2f6769746875622e636f6d2f4c69626e616d69632f4f6d656b612d532d476f6f676c65416e616c79746963732f72656c65617365732f646f776e6c6f61642f76312e322e322f4c69626e616d69634f6d656b615347412e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a35323a2268747470733a2f2f6769746875622e636f6d2f6269626c696272652f6f6d656b612d732d6d6f64756c652d4775657374526f6c65223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a393a224775657374526f6c65223b733a383a22626173656e616d65223b733a393a224775657374526f6c65223b733a333a22646972223b733a393a224775657374526f6c65223b733a373a2276657273696f6e223b733a353a22302e322e30223b733a333a227a6970223b733a39373a2268747470733a2f2f6769746875622e636f6d2f6269626c696272652f6f6d656b612d732d6d6f64756c652d4775657374526f6c652f72656c65617365732f646f776e6c6f61642f76302e322e302f4775657374526f6c652d302e322e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34343a2268747470733a2f2f6769746875622e636f6d2f7a65726f6372617465732f4869646550726f70657274696573223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31343a224869646550726f70657274696573223b733a383a22626173656e616d65223b733a31343a224869646550726f70657274696573223b733a333a22646972223b733a31343a224869646550726f70657274696573223b733a373a2276657273696f6e223b733a353a22312e332e30223b733a333a227a6970223b733a39343a2268747470733a2f2f6769746875622e636f6d2f7a65726f6372617465732f4869646550726f706572746965732f72656c65617365732f646f776e6c6f61642f76312e332e302f4869646550726f706572746965732d312e332e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a35343a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d49696966536572766572223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31303a2249696966536572766572223b733a383a22626173656e616d65223b733a31303a2249696966536572766572223b733a333a22646972223b733a31303a2249696966536572766572223b733a373a2276657273696f6e223b733a373a22332e362e362e34223b733a333a227a6970223b733a3130333a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d496969665365727665722f72656c65617365732f646f776e6c6f61642f332e362e362e342f496969665365727665722d332e362e362e342e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a35353a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d496d616765536572766572223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31313a22496d616765536572766572223b733a383a22626173656e616d65223b733a31313a22496d616765536572766572223b733a333a22646972223b733a31313a22496d616765536572766572223b733a373a2276657273696f6e223b733a373a22332e362e392e33223b733a333a227a6970223b733a3130353a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d496d6167655365727665722f72656c65617365732f646f776e6c6f61642f332e362e392e332f496d6167655365727665722d332e362e392e332e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a35323a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f4974656d4361726f7573656c426c6f636b223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31373a224974656d4361726f7573656c426c6f636b223b733a383a22626173656e616d65223b733a31373a224974656d4361726f7573656c426c6f636b223b733a333a22646972223b733a31373a224974656d4361726f7573656c426c6f636b223b733a373a2276657273696f6e223b733a353a22312e302e30223b733a333a227a6970223b733a3130353a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f4974656d4361726f7573656c426c6f636b2f72656c65617365732f646f776e6c6f61642f76312e302e302f4974656d4361726f7573656c426c6f636b2d312e302e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a33383a2268747470733a2f2f6769746875622e636f6d2f6765676564656e6963652f4974656d436f7079223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a383a224974656d436f7079223b733a383a22626173656e616d65223b733a383a224974656d436f7079223b733a333a22646972223b733a383a224974656d436f7079223b733a373a2276657273696f6e223b733a353a22312e302e31223b733a333a227a6970223b733a37353a2268747470733a2f2f6769746875622e636f6d2f6765676564656e6963652f4974656d436f70792f72656c65617365732f646f776e6c6f61642f312e302e312f4974656d436f70792e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a35353a2268747470733a2f2f6769746875622e636f6d2f6269626c696272652f6f6d656b612d732d6d6f64756c652d4974656d5365747354726565223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31323a224974656d5365747354726565223b733a383a22626173656e616d65223b733a31323a224974656d5365747354726565223b733a333a22646972223b733a31323a224974656d5365747354726565223b733a373a2276657273696f6e223b733a353a22302e342e30223b733a333a227a6970223b733a3130333a2268747470733a2f2f6769746875622e636f6d2f6269626c696272652f6f6d656b612d732d6d6f64756c652d4974656d53657473547265652f72656c65617365732f646f776e6c6f61642f76302e342e302f4974656d53657473547265652d302e342e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34373a2268747470733a2f2f6769746875622e636f6d2f6269626c696272652f6f6d656b612d732d6d6f64756c652d4c646170223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a343a224c646170223b733a383a22626173656e616d65223b733a343a224c646170223b733a333a22646972223b733a343a224c646170223b733a373a2276657273696f6e223b733a353a22302e332e31223b733a333a227a6970223b733a38373a2268747470733a2f2f6769746875622e636f6d2f6269626c696272652f6f6d656b612d732d6d6f64756c652d4c6461702f72656c65617365732f646f776e6c6f61642f76302e332e312f4c6461702d302e332e312e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a35313a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d4c6f636b6f7574223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a373a224c6f636b6f7574223b733a383a22626173656e616d65223b733a373a224c6f636b6f7574223b733a333a22646972223b733a373a224c6f636b6f7574223b733a373a2276657273696f6e223b733a353a22332e332e34223b733a333a227a6970223b733a39333a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d4c6f636b6f75742f72656c65617365732f646f776e6c6f61642f332e332e342f4c6f636b6f75742d332e332e342e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34373a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d4c6f67223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a333a224c6f67223b733a383a22626173656e616d65223b733a333a224c6f67223b733a333a22646972223b733a333a224c6f67223b733a373a2276657273696f6e223b733a383a22332e332e31322e39223b733a333a227a6970223b733a39313a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d4c6f672f72656c65617365732f646f776e6c6f61642f332e332e31322e392f4c6f672d332e332e31322e392e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34323a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f4d617070696e67223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a373a224d617070696e67223b733a383a22626173656e616d65223b733a373a224d617070696e67223b733a333a22646972223b733a373a224d617070696e67223b733a373a2276657273696f6e223b733a353a22312e352e30223b733a333a227a6970223b733a38353a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f4d617070696e672f72656c65617365732f646f776e6c6f61642f76312e352e302f4d617070696e672d312e352e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34393a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f4d6574616461746142726f777365223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31343a224d6574616461746142726f777365223b733a383a22626173656e616d65223b733a31343a224d6574616461746142726f777365223b733a333a22646972223b733a31343a224d6574616461746142726f777365223b733a373a2276657273696f6e223b733a353a22312e342e31223b733a333a227a6970223b733a39393a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f4d6574616461746142726f7773652f72656c65617365732f646f776e6c6f61642f76312e342e312f4d6574616461746142726f7773652d312e342e312e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a37313a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d4e6f476f6f676c654368726f6d65466c6f636b547261636b696e67223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a32373a224e6f476f6f676c654368726f6d65466c6f636b547261636b696e67223b733a383a22626173656e616d65223b733a32373a224e6f476f6f676c654368726f6d65466c6f636b547261636b696e67223b733a333a22646972223b733a32373a224e6f476f6f676c654368726f6d65466c6f636b547261636b696e67223b733a373a2276657273696f6e223b733a373a22332e332e302e31223b733a333a227a6970223b733a3133373a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d4e6f476f6f676c654368726f6d65466c6f636b547261636b696e672f72656c65617365732f646f776e6c6f61642f332e332e302e312f4e6f476f6f676c654368726f6d65466c6f636b547261636b696e672d332e332e302e312e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a35313a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f4e756d65726963446174615479706573223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31363a224e756d65726963446174615479706573223b733a383a22626173656e616d65223b733a31363a224e756d65726963446174615479706573223b733a333a22646972223b733a31363a224e756d65726963446174615479706573223b733a373a2276657273696f6e223b733a353a22312e372e30223b733a333a227a6970223b733a3130333a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f4e756d657269634461746154797065732f72656c65617365732f646f776e6c6f61642f76312e372e302f4e756d657269634461746154797065732d312e372e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a36303a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d4f6169506d685265706f7369746f7279223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31363a224f6169506d685265706f7369746f7279223b733a383a22626173656e616d65223b733a31363a224f6169506d685265706f7369746f7279223b733a333a22646972223b733a31363a224f6169506d685265706f7369746f7279223b733a373a2276657273696f6e223b733a373a22332e332e352e34223b733a333a227a6970223b733a3131353a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d4f6169506d685265706f7369746f72792f72656c65617365732f646f776e6c6f61642f332e332e352e342f4f6169506d685265706f7369746f72792d332e332e352e342e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34393a2268747470733a2f2f6769746875622e636f6d2f73796d61632f4f6d656b612d532d6d6f64756c652d467265655370616365223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a32323a224f6d656b612d4d6f64756c652d467265655370616365223b733a383a22626173656e616d65223b733a32323a224f6d656b612d4d6f64756c652d467265655370616365223b733a333a22646972223b733a32323a224f6d656b612d4d6f64756c652d467265655370616365223b733a373a2276657273696f6e223b4e3b733a333a227a6970223b733a36383a2268747470733a2f2f6769746875622e636f6d2f73796d61632f4f6d656b612d532d6d6f64756c652d4672656553706163652f617263686976652f6d61737465722e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34393a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f4f6d656b6132496d706f72746572223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31343a224f6d656b6132496d706f72746572223b733a383a22626173656e616d65223b733a31343a224f6d656b6132496d706f72746572223b733a333a22646972223b733a31343a224f6d656b6132496d706f72746572223b733a373a2276657273696f6e223b733a353a22312e342e30223b733a333a227a6970223b733a39393a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f4f6d656b6132496d706f727465722f72656c65617365732f646f776e6c6f61642f76312e342e302f4f6d656b6132496d706f727465722d312e342e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a33393a2268747470733a2f2f6769746875622e636f6d2f7a65726f6372617465732f506466456d62656453223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a383a22506466456d626564223b733a383a22626173656e616d65223b733a383a22506466456d626564223b733a333a22646972223b733a383a22506466456d626564223b733a373a2276657273696f6e223b733a353a22312e322e30223b733a333a227a6970223b733a38333a2268747470733a2f2f6769746875622e636f6d2f7a65726f6372617465732f506466456d626564532f72656c65617365732f646f776e6c6f61642f76312e322e302f506466456d6265642d312e322e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a35393a2268747470733a2f2f6769746875622e636f6d2f6269626c696272652f6f6d656b612d732d6d6f64756c652d52616e646f6d4974656d73426c6f636b223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31363a2252616e646f6d4974656d73426c6f636b223b733a383a22626173656e616d65223b733a31363a2252616e646f6d4974656d73426c6f636b223b733a333a22646972223b733a31363a2252616e646f6d4974656d73426c6f636b223b733a373a2276657273696f6e223b733a353a22302e322e30223b733a333a227a6970223b733a3131313a2268747470733a2f2f6769746875622e636f6d2f6269626c696272652f6f6d656b612d732d6d6f64756c652d52616e646f6d4974656d73426c6f636b2f72656c65617365732f646f776e6c6f61642f76302e322e302f52616e646f6d4974656d73426c6f636b2d302e322e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a35353a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d5264664461746174797065223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31313a225264664461746174797065223b733a383a22626173656e616d65223b733a31313a225264664461746174797065223b733a333a22646972223b733a31313a225264664461746174797065223b733a373a2276657273696f6e223b733a373a22332e302e342e31223b733a333a227a6970223b733a3130353a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d52646644617461747970652f72656c65617365732f646f776e6c6f61642f332e302e342e312f52646644617461747970652d332e302e342e312e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a35333a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d5265666572656e6365223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a393a225265666572656e6365223b733a383a22626173656e616d65223b733a393a225265666572656e6365223b733a333a22646972223b733a393a225265666572656e6365223b733a373a2276657273696f6e223b733a383a22332e342e33352e33223b733a333a227a6970223b733a3130333a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d5265666572656e63652f72656c65617365732f646f776e6c6f61642f332e342e33352e332f5265666572656e63652d332e342e33352e332e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a36313a2268747470733a2f2f6769746875622e636f6d2f4d616e4f6e44614d6f6f6e2f6f6d656b612d732d6d6f64756c652d526573747269637465645369746573223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31353a22526573747269637465645369746573223b733a383a22626173656e616d65223b733a31353a22526573747269637465645369746573223b733a333a22646972223b733a31353a22526573747269637465645369746573223b733a373a2276657273696f6e223b733a333a22322e31223b733a333a227a6970223b733a3130383a2268747470733a2f2f6769746875622e636f6d2f4d616e4f6e44614d6f6f6e2f6f6d656b612d732d6d6f64756c652d5265737472696374656453697465732f72656c65617365732f646f776e6c6f61642f76322e312f5265737472696374656453697465732d322e312e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34363a2268747470733a2f2f6769746875622e636f6d2f7a65726f6372617465732f52696768747353746174656d656e7473223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31363a2252696768747353746174656d656e7473223b733a383a22626173656e616d65223b733a31363a2252696768747353746174656d656e7473223b733a333a22646972223b733a31363a2252696768747353746174656d656e7473223b733a373a2276657273696f6e223b733a353a22312e322e30223b733a333a227a6970223b733a39383a2268747470733a2f2f6769746875622e636f6d2f7a65726f6372617465732f52696768747353746174656d656e74732f72656c65617365732f646f776e6c6f61642f76312e322e302f52696768747353746174656d656e74732d312e322e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a36353a2268747470733a2f2f6769746875622e636f6d2f4d616e4f6e44614d6f6f6e2f6f6d656b612d732d6d6f64756c652d526f6c6542617365644e617669676174696f6e223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31393a22526f6c6542617365644e617669676174696f6e223b733a383a22626173656e616d65223b733a31393a22526f6c6542617365644e617669676174696f6e223b733a333a22646972223b733a31393a22526f6c6542617365644e617669676174696f6e223b733a373a2276657273696f6e223b733a333a22312e31223b733a333a227a6970223b733a3131363a2268747470733a2f2f6769746875622e636f6d2f4d616e4f6e44614d6f6f6e2f6f6d656b612d732d6d6f64756c652d526f6c6542617365644e617669676174696f6e2f72656c65617365732f646f776e6c6f61642f76312e312f526f6c6542617365644e617669676174696f6e2d312e312e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34323a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f5363726970746f223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a373a225363726970746f223b733a383a22626173656e616d65223b733a373a225363726970746f223b733a333a22646972223b733a373a225363726970746f223b733a373a2276657273696f6e223b733a353a22312e332e30223b733a333a227a6970223b733a38353a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f5363726970746f2f72656c65617365732f646f776e6c6f61642f76312e332e302f5363726970746f2d312e332e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34393a2268747470733a2f2f6769746875622e636f6d2f6269626c696272652f6f6d656b612d732d6d6f64756c652d536561726368223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a363a22536561726368223b733a383a22626173656e616d65223b733a363a22536561726368223b733a333a22646972223b733a363a22536561726368223b733a373a2276657273696f6e223b733a353a22302e392e30223b733a333a227a6970223b733a39313a2268747470733a2f2f6769746875622e636f6d2f6269626c696272652f6f6d656b612d732d6d6f64756c652d5365617263682f72656c65617365732f646f776e6c6f61642f76302e392e302f5365617263682d302e392e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34323a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f53686172696e67223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a373a2253686172696e67223b733a383a22626173656e616d65223b733a373a2253686172696e67223b733a333a22646972223b733a373a2253686172696e67223b733a373a2276657273696f6e223b733a353a22312e322e30223b733a333a227a6970223b733a38353a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f53686172696e672f72656c65617365732f646f776e6c6f61642f76312e322e302f53686172696e672d312e322e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a35333a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d53686f7274636f6465223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a393a2253686f7274636f6465223b733a383a22626173656e616d65223b733a393a2253686f7274636f6465223b733a333a22646972223b733a393a2253686f7274636f6465223b733a373a2276657273696f6e223b733a393a22332e332e312e342e31223b733a333a227a6970223b733a3130353a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d53686f7274636f64652f72656c65617365732f646f776e6c6f61642f332e332e312e342e312f53686f7274636f64652d332e332e312e342e312e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a35373a2268747470733a2f2f6769746875622e636f6d2f4e656f2d496e737069726174696f6e2f4f6d656b612d532d53696d706c654361726f7573656c223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31343a2253696d706c654361726f7573656c223b733a383a22626173656e616d65223b733a31343a2253696d706c654361726f7573656c223b733a333a22646972223b733a31343a2253696d706c654361726f7573656c223b733a373a2276657273696f6e223b733a353a22312e322e33223b733a333a227a6970223b733a3130313a2268747470733a2f2f6769746875622e636f6d2f4e656f2d496e737069726174696f6e2f4f6d656b612d532d53696d706c654361726f7573656c2f72656c65617365732f646f776e6c6f61642f76312e322e332f53696d706c654361726f7573656c2e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a35303a2268747470733a2f2f6769746875622e636f6d2f697679727a652f6f6d656b612d732d6d6f64756c652d73696d706c65706466223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a393a2253696d706c65506466223b733a383a22626173656e616d65223b733a393a2253696d706c65506466223b733a333a22646972223b733a393a2253696d706c65506466223b733a373a2276657273696f6e223b733a333a22312e30223b733a333a227a6970223b733a38363a2268747470733a2f2f6769746875622e636f6d2f697679727a652f6f6d656b612d732d6d6f64756c652d73696d706c657064662f72656c65617365732f646f776e6c6f61642f312e302f53696d706c655064662e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a36303a2268747470733a2f2f6769746875622e636f6d2f6b79667235392f6f6d656b612d732d6d6f64756c652d53697465536c75674173537562646f6d61696e223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31393a2253697465536c75674173537562646f6d61696e223b733a383a22626173656e616d65223b733a31393a2253697465536c75674173537562646f6d61696e223b733a333a22646972223b733a31393a2253697465536c75674173537562646f6d61696e223b733a373a2276657273696f6e223b733a353a22312e302e30223b733a333a227a6970223b733a3130383a2268747470733a2f2f6769746875622e636f6d2f6b79667235392f6f6d656b612d732d6d6f64756c652d53697465536c75674173537562646f6d61696e2f72656c65617365732f646f776e6c6f61642f312e302e302f53697465536c75674173537562646f6d61696e2e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a35343a2268747470733a2f2f6769746875622e636f6d2f4d616e4f6e44614d6f6f6e2f6f6d656b612d732d6d6f64756c652d536974656d617073223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a383a22536974656d617073223b733a383a22626173656e616d65223b733a383a22536974656d617073223b733a333a22646972223b733a383a22536974656d617073223b733a373a2276657273696f6e223b733a333a22302e31223b733a333a227a6970223b733a39343a2268747470733a2f2f6769746875622e636f6d2f4d616e4f6e44614d6f6f6e2f6f6d656b612d732d6d6f64756c652d536974656d6170732f72656c65617365732f646f776e6c6f61642f76302e312f536974656d6170732d302e312e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34373a2268747470733a2f2f6769746875622e636f6d2f6269626c696272652f6f6d656b612d732d6d6f64756c652d536f6c72223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a343a22536f6c72223b733a383a22626173656e616d65223b733a343a22536f6c72223b733a333a22646972223b733a343a22536f6c72223b733a373a2276657273696f6e223b733a353a22302e392e30223b733a333a227a6970223b733a38373a2268747470733a2f2f6769746875622e636f6d2f6269626c696272652f6f6d656b612d732d6d6f64756c652d536f6c722f72656c65617365732f646f776e6c6f61642f76302e392e302f536f6c722d302e392e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34303a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f556e417069223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a353a22556e417069223b733a383a22626173656e616d65223b733a353a22556e417069223b733a333a22646972223b733a353a22556e417069223b733a373a2276657273696f6e223b733a353a22312e322e30223b733a333a227a6970223b733a38313a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f556e4170692f72656c65617365732f646f776e6c6f61642f76312e322e302f556e4170692d312e322e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a35393a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d556e6976657273616c566965776572223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31353a22556e6976657273616c566965776572223b733a383a22626173656e616d65223b733a31353a22556e6976657273616c566965776572223b733a333a22646972223b733a31353a22556e6976657273616c566965776572223b733a373a2276657273696f6e223b733a373a22332e362e342e35223b733a333a227a6970223b733a3131333a2268747470733a2f2f6769746875622e636f6d2f44616e69656c2d4b4d2f4f6d656b612d532d6d6f64756c652d556e6976657273616c5669657765722f72656c65617365732f646f776e6c6f61642f332e362e342e352f556e6976657273616c5669657765722d332e362e342e352e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a35303a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f55726944657265666572656e636572223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31353a2255726944657265666572656e636572223b733a383a22626173656e616d65223b733a31353a2255726944657265666572656e636572223b733a333a22646972223b733a31353a2255726944657265666572656e636572223b733a373a2276657273696f6e223b733a353a22312e322e30223b733a333a227a6970223b733a3130313a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f55726944657265666572656e6365722f72656c65617365732f646f776e6c6f61642f76312e322e302f55726944657265666572656e6365722d312e322e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a35353a2268747470733a2f2f6769746875622e636f6d2f4d616e4f6e44614d6f6f6e2f6f6d656b612d732d6d6f64756c652d557365724e616d6573223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a393a22557365724e616d6573223b733a383a22626173656e616d65223b733a393a22557365724e616d6573223b733a333a22646972223b733a393a22557365724e616d6573223b733a373a2276657273696f6e223b733a333a22312e30223b733a333a227a6970223b733a39363a2268747470733a2f2f6769746875622e636f6d2f4d616e4f6e44614d6f6f6e2f6f6d656b612d732d6d6f64756c652d557365724e616d65732f72656c65617365732f646f776e6c6f61642f76312e302f557365724e616d65732d312e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34373a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f56616c756553756767657374223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31323a2256616c756553756767657374223b733a383a22626173656e616d65223b733a31323a2256616c756553756767657374223b733a333a22646972223b733a31323a2256616c756553756767657374223b733a373a2276657273696f6e223b733a353a22312e392e30223b733a333a227a6970223b733a39353a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f56616c7565537567676573742f72656c65617365732f646f776e6c6f61642f76312e392e302f56616c7565537567676573742d312e392e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34363a2268747470733a2f2f6769746875622e636f6d2f697679727a652f6f6d656b612d732d6d6f64756c652d76696d656f223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31303a2256696d656f456d626564223b733a383a22626173656e616d65223b733a31303a2256696d656f456d626564223b733a333a22646972223b733a31303a2256696d656f456d626564223b733a373a2276657273696f6e223b733a333a22322e30223b733a333a227a6970223b733a38333a2268747470733a2f2f6769746875622e636f6d2f697679727a652f6f6d656b612d732d6d6f64756c652d76696d656f2f72656c65617365732f646f776e6c6f61642f322e302f56696d656f456d6265642e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34363a2268747470733a2f2f6769746875622e636f6d2f63686e6d2f5765624d6f6e6574697a6174696f6e2d6d6f64756c65223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31353a225765624d6f6e6574697a6174696f6e223b733a383a22626173656e616d65223b733a31353a225765624d6f6e6574697a6174696f6e223b733a333a22646972223b733a31353a225765624d6f6e6574697a6174696f6e223b733a373a2276657273696f6e223b733a353a22312e302e30223b733a333a227a6970223b733a39373a2268747470733a2f2f6769746875622e636f6d2f63686e6d2f5765624d6f6e6574697a6174696f6e2d6d6f64756c652f72656c65617365732f646f776e6c6f61642f76312e302e302f5765624d6f6e6574697a6174696f6e2d312e302e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34323a2268747470733a2f2f6769746875622e636f6d2f6e69736861642f6f6d656b612d732d77696b6964617461223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a383a2257696b6964617461223b733a383a22626173656e616d65223b733a383a2257696b6964617461223b733a333a22646972223b733a383a2257696b6964617461223b733a373a2276657273696f6e223b733a353a22312e342e30223b733a333a227a6970223b733a38303a2268747470733a2f2f6769746875622e636f6d2f6e69736861642f6f6d656b612d732d77696b69646174612f72656c65617365732f646f776e6c6f61642f76312e342e302f57696b69646174612e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34373a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f5a6f7465726f496d706f7274223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31323a225a6f7465726f496d706f7274223b733a383a22626173656e616d65223b733a31323a225a6f7465726f496d706f7274223b733a333a22646972223b733a31323a225a6f7465726f496d706f7274223b733a373a2276657273696f6e223b733a353a22312e322e30223b733a333a227a6970223b733a39353a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d6d6f64756c65732f5a6f7465726f496d706f72742f72656c65617365732f646f776e6c6f61642f76312e322e302f5a6f7465726f496d706f72742d312e322e302e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a35313a2268747470733a2f2f6769746875622e636f6d2f6269626c696272652f6f6d656b612d732d6d6f64756c652d6a51756572795549223b613a383a7b733a343a2274797065223b733a363a226d6f64756c65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a383a226a51756572795549223b733a383a22626173656e616d65223b733a383a226a51756572795549223b733a333a22646972223b733a383a226a51756572795549223b733a373a2276657273696f6e223b733a363a22312e31322e31223b733a333a227a6970223b733a39373a2268747470733a2f2f6769746875622e636f6d2f6269626c696272652f6f6d656b612d732d6d6f64756c652d6a517565727955492f72656c65617365732f646f776e6c6f61642f76312e31322e312f6a517565727955492d312e31322e312e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d7d733a31303a226f6d656b617468656d65223b613a373a7b733a34333a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d7468656d65732f63656e746572726f77223b613a383a7b733a343a2274797065223b733a353a227468656d65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a393a2263656e746572726f77223b733a383a22626173656e616d65223b733a393a2263656e746572726f77223b733a333a22646972223b733a393a2263656e746572726f77223b733a373a2276657273696f6e223b733a353a22312e372e32223b733a333a227a6970223b733a39353a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d7468656d65732f63656e746572726f772f72656c65617365732f646f776e6c6f61642f76312e372e322f7468656d652d63656e746572726f772d76312e372e322e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a33383a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d7468656d65732f636f7a79223b613a383a7b733a343a2274797065223b733a353a227468656d65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a343a22636f7a79223b733a383a22626173656e616d65223b733a343a22636f7a79223b733a333a22646972223b733a343a22636f7a79223b733a373a2276657273696f6e223b733a353a22312e352e32223b733a333a227a6970223b733a38353a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d7468656d65732f636f7a792f72656c65617365732f646f776e6c6f61642f76312e352e322f7468656d652d636f7a792d76312e352e322e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34313a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d7468656d65732f64656661756c74223b613a383a7b733a343a2274797065223b733a353a227468656d65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a373a2264656661756c74223b733a383a22626173656e616d65223b733a373a2264656661756c74223b733a333a22646972223b733a373a2264656661756c74223b733a373a2276657273696f6e223b733a353a22312e362e32223b733a333a227a6970223b733a39313a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d7468656d65732f64656661756c742f72656c65617365732f646f776e6c6f61642f76312e362e322f7468656d652d64656661756c742d76312e362e322e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34363a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d7468656d65732f666f756e646174696f6e2d73223b613a383a7b733a343a2274797065223b733a353a227468656d65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a31303a22666f756e646174696f6e223b733a383a22626173656e616d65223b733a31303a22666f756e646174696f6e223b733a333a22646972223b733a31303a22666f756e646174696f6e223b733a373a2276657273696f6e223b733a353a22312e322e31223b733a333a227a6970223b733a3130313a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d7468656d65732f666f756e646174696f6e2d732f72656c65617365732f646f776e6c6f61642f76312e322e312f7468656d652d666f756e646174696f6e2d732d76312e322e312e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34303a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d7468656d65732f706170657273223b613a383a7b733a343a2274797065223b733a353a227468656d65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a363a22706170657273223b733a383a22626173656e616d65223b733a363a22706170657273223b733a333a22646972223b733a363a22706170657273223b733a373a2276657273696f6e223b733a353a22312e332e32223b733a333a227a6970223b733a38393a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d7468656d65732f7061706572732f72656c65617365732f646f776e6c6f61642f76312e332e322f7468656d652d7061706572732d76312e332e322e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34333a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d7468656d65732f7468616e6b73726f79223b613a383a7b733a343a2274797065223b733a353a227468656d65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a393a227468616e6b73726f79223b733a383a22626173656e616d65223b733a393a227468616e6b73726f79223b733a333a22646972223b733a393a227468616e6b73726f79223b733a373a2276657273696f6e223b733a353a22312e302e31223b733a333a227a6970223b733a39353a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d7468656d65732f7468616e6b73726f792f72656c65617365732f646f776e6c6f61642f76312e302e312f7468656d652d7468616e6b73726f792d76312e302e312e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d733a34323a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d7468656d65732f7468656461696c79223b613a383a7b733a343a2274797065223b733a353a227468656d65223b733a363a22736572766572223b733a393a226f6d656b612e6f7267223b733a343a226e616d65223b733a383a227468656461696c79223b733a383a22626173656e616d65223b733a383a227468656461696c79223b733a333a22646972223b733a383a227468656461696c79223b733a373a2276657273696f6e223b733a353a22312e362e32223b733a333a227a6970223b733a39333a2268747470733a2f2f6769746875622e636f6d2f6f6d656b612d732d7468656d65732f7468656461696c792f72656c65617365732f646f776e6c6f61642f76312e362e322f7468656d652d7468656461696c792d76312e362e322e7a6970223b733a31323a22646570656e64656e63696573223b613a303a7b7d7d7d733a363a226d6f64756c65223b613a303a7b7d733a353a227468656d65223b613a303a7b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3731313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a223034656533643433616133636434386339346232386430356464643861343238223b733a33323a226631346634303732386561303237666665323031343862323233353536633731223b733a33323a223166333532623933363063363230643135646332313831356663656562323138223b733a33323a223532656132356266376562646533313732373033643835653633306165313236223b733a33323a223330646333653962343365616663353634333565373064306238376632306631223b733a33323a223461306636343265393162363465666234633762623663363035623636323233223b733a33323a223430623636303930616636643162626332353438333539363233643532386238223b733a33323a223465643233333634643838643138623565656539356230326239353937346561223b733a33323a226432313961343963383664643139623361663963326165656461313963333139223b733a33323a226235623863336462353632393462643933336533643635376430333266666333223b7d733a343a2268617368223b733a36353a2262356238633364623536323934626439333365336436353764303332666663332d6432313961343963383664643139623361663963326165656461313963333139223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226630323638656163393838616164613630326166656132336133363563343535223b733a33323a226164346361373062363630336330333332363864643037633036386661353765223b733a33323a226263333165626664656534346263366364656261636361366535636436343562223b733a33323a223836386235613661653031656461643962643139353761646532386437656536223b7d733a343a2268617368223b733a36353a2238363862356136616530316564616439626431393537616465323864376565362d6263333165626664656534346263366364656261636361366535636436343562223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1643589233);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('0dgkcig2nsi3eebgc0ls8od731', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313634333538323739342e3233393235353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223030336a6e6f696d37756e376c39306475623969336b74616232223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313634333538353837383b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313634333538363337373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313634333538363333363b7d7d72656469726563745f75726c7c733a32393a22687474703a2f2f6c6f63616c686f73742f6f6d656b61732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226465336332353866363430333765626235316435616333636365643966383830223b733a33323a226231356539373532366162376435376232656132353937313466313336303630223b7d733a343a2268617368223b733a36353a2262313565393735323661623764353762326561323539373134663133363036302d6465336332353866363430333765626235316435616333636365643966383830223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3237313a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a323535323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32383a7b733a33323a226661383938666136643438346436613961373364326235363864383062316462223b733a33323a223332636666383032316230633330303933333734363738383435656239343534223b733a33323a223366316131356464646138373130643039666663636163306465353732313139223b733a33323a226636303364316334376538323039373539666639313062393130383966343437223b733a33323a223166613666303937626139626266376632346637656530336561636161373662223b733a33323a223532386330363033306266346337353731316131656237353966313331316231223b733a33323a226661303134363938393434376334383532386333313334363934653764333532223b733a33323a223361653835633630313332643663386566393738316537316233383431393466223b733a33323a226461393535393735333432376366656630393237396665393164373162623662223b733a33323a223762333430353730363664383039636364333335386333346662646564386138223b733a33323a223630623361373261303832353134643433383232646333633738613339393530223b733a33323a226264316234363164363431663466323839666235623330643863623933396634223b733a33323a226135376238666464303037383030393466313939303432613530343363383532223b733a33323a223264346364363232343733366536353939346437646135626562323864346431223b733a33323a226135633666653530623466653762386336313565353035643366313339333132223b733a33323a226465326235613932386230663565313766333735643262663339643836656466223b733a33323a223366366638353866663262643865666464623562333362366130666534386436223b733a33323a223332356538396562613061303836623631333736623439666539646232386534223b733a33323a223066333963643231616465323531363231383964353234313135363732666633223b733a33323a223238636565306637656230303239326330323334366366613366316161353061223b733a33323a226139343266303366306265353530396136316636396133646363313837333734223b733a33323a223362643564313531313030396630313537373063336666313434326461653130223b733a33323a223662343165353830313463633861633064303564323363333261353761613137223b733a33323a226433333335333163353839626538376339646237306462616261346530613835223b733a33323a223664383164633536653835623965666665623138636536343135643664616334223b733a33323a223237383433356666323761303463363838326332383039353831316161656633223b733a33323a226563666266633965326566383935616531363737353432326461666333643738223b733a33323a223162666163306339306361383934653739316331646664366161323661653234223b733a33323a226437313838396339656235613033333631613038333136663831373437313063223b733a33323a223338393064326262396239616438363930383538313763353536303839316231223b733a33323a223830373339623762326133646532663532656439336333313738643864633237223b733a33323a226163653938636465393639626663366633356661346134623831653234386335223b733a33323a226436383632643732643761383532633734306261396438643662666132666431223b733a33323a226664346665353831373939646334353965373836306561333536373962336634223b733a33323a226631303736623962383363613335363836666664616164626665623534643634223b733a33323a223635636437323936616665383661373366386464346166373036383732373839223b733a33323a226231323965653864666562643936396131323265653031386333383331343665223b733a33323a226238393039636463356164326462343065343738333831323339363262326330223b733a33323a226133316639343665316361303861333735353662313062653331313565633731223b733a33323a226362373763633061656538323033326532326635333938376331356334373231223b733a33323a223765643634376661303665353138376136336130373534376631626335306162223b733a33323a223266313765616364633764383532313065613330643264633530373765666438223b733a33323a223738306637653531373333323230343964326637626535303733616664613965223b733a33323a223535653363626335386133333934376234656532353139303633396165313237223b733a33323a226636333031313835343138373761626433633338373666356332393132386164223b733a33323a223830613733653862383231626364386233333663656232646665356232663434223b733a33323a226337343534353039363739633963386363653662663635326635393732616461223b733a33323a226431653430363930663531373039623035623131653937646437613831626364223b733a33323a223234616166363266373334323237373431316465316333383737626634383136223b733a33323a223730626232653263663236396631643562393961643164633262383135326363223b733a33323a226539643765363366343064373233303135313438363662623663363339663365223b733a33323a226465343335393862306264666436313232666364396334356539303664636133223b733a33323a226539643962353433643237393763633133316234373735343063663761336465223b733a33323a226139626238376366363432326161623233353232336661316661656137306232223b733a33323a226332313630393234316162303066353835303664313461343130663134313539223b733a33323a223863353936306564383434313939373637373761333536616161316564646366223b7d733a343a2268617368223b733a36353a2238633539363065643834343139393736373737613335366161613165646463662d6332313630393234316162303066353835303664313461343130663134313539223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223933383939616331313139393236343138373231323538353339346239666237223b733a33323a226231666261353762303864646634633332336232303664653539313462656231223b733a33323a223932346539316563303463663633323261623737643838393439376363636534223b733a33323a226262633561626661663261326361633232333537663038666166333230323165223b7d733a343a2268617368223b733a36353a2262626335616266616632613263616332323335376630386661663332303231652d3932346539316563303463663633323261623737643838393439376363636534223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1643582794),
('214g7h0d5kjuahcqeh8eo1pk8k', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313634333437313932332e3734353037353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22326933686572386c74626269346a30686e317035716f63307275223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313634333436393338323b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313634333437333839343b7d7d72656469726563745f75726c7c733a32393a22687474703a2f2f6c6f63616c686f73742f6f6d656b61732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223064623838633030663636616632393138643463313037373433653633626439223b733a33323a223634636530643232623037373561623963336539386665656566303239636435223b7d733a343a2268617368223b733a36353a2236346365306432326230373735616239633365393866656565663032396364352d3064623838633030663636616632393138643463313037373433653633626439223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3739313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a226566343961666538343531303732333166633265353863323133623863616335223b733a33323a223834383466303461376562393966346462626362636465326562333837653837223b733a33323a226536366136346338366538323234326139353532386563623335396363326332223b733a33323a223265613635343437626565623133623834613663323138316633333334306534223b733a33323a223566303135356162306634313935323036346237336434336633356437313133223b733a33323a223337356463373738333034343339356638633831343534663030333961646138223b733a33323a223230613463336430393434326134393562313237663737316536383866636161223b733a33323a226231363462333334326332313266623064306565323036323238636135366330223b733a33323a226163366164333638616533666632353035656538326665396662353537656366223b733a33323a223932383730623464346639353437306432323431393739343166656133366435223b733a33323a226432343834636636353835376565636666613534383936343532303139663332223b733a33323a223034343135396433656562326438303831326434666162383064386563326633223b7d733a343a2268617368223b733a36353a2230343431353964336565623264383038313264346661623830643865633266332d6432343834636636353835376565636666613534383936343532303139663332223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1643471925),
('2q98q7r3qnlghbmqereqs4hdlj', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313634333239343336352e3130343137353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223271393871377233716e6c6768626d7165726571733468646c6a223b7d7d, 1643294365),
('3iqr11j5ubhu3kshdgob3g824e', 0x5f5f4c616d696e61737c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313634333431323730352e3034333133363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22716f34677675716d763431753072367263336a6c723133747067223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313634333431343031353b7d733a33373a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313634333431343035353b7d733a34353a224c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313634333431343136373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313634333431343436333b7d733a35303a224c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313634333431363238333b7d7d72656469726563745f75726c7c733a32393a22687474703a2f2f6c6f63616c686f73742f6f6d656b61732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226463643661666634346339316130326262396363316237643564663834343432223b733a33323a223633326330623339353732666461633533653264663432343938616135656535223b7d733a343a2268617368223b733a36353a2236333263306233393537326664616335336532646634323439386161356565352d6463643661666634346339316130326262396363316237643564663834343432223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223931663766386532386164613934653032613561346461633262666435376635223b733a33323a223738336366303430646262613864373463633430613166393439323032616138223b7d733a343a2268617368223b733a36353a2237383363663034306462626138643734636334306131663934393230326161382d3931663766386532386164613934653032613561346461633262666435376635223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226131393539306666386464333430373164383736653362393037336234613362223b733a33323a226262663962623865306366313365343533633134616431366630373964303462223b733a33323a226236623564393761323134343939393564616166346663393666306534643031223b733a33323a226635363731636537353536663238303161646137646636613735396131333136223b7d733a343a2268617368223b733a36353a2266353637316365373535366632383031616461376466366137353961313331362d6236623564393761323134343939393564616166346663393666306534643031223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313539323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31363a7b733a33323a226536333936616535306162303765613032346134373033313561313034363835223b733a33323a223465306462333436666234326639633064316462613262393165316163373461223b733a33323a226237663965643962643433666438393239616137363434346636393262613233223b733a33323a223461646532333233303434313832306131356434613835636235303266323530223b733a33323a223935373964623865383734333735353132363435653565636164346635313137223b733a33323a223038356336613832333235373139376563613238333330326561653463616562223b733a33323a223631646165386562333638356461383537613164353266646633356662373133223b733a33323a226337373464323964356635306231653333343532626264613564613765323361223b733a33323a223061333562623835303862323966343531393330336362626530666130623865223b733a33323a226334396666363533326563336336303839653334356564623833653136366338223b733a33323a223764643337373130383163613033383262396664333739373934353161633865223b733a33323a223634353833396462316465653939633639643565643334326137336565343961223b733a33323a226237373337626461393835643930636664656438653766353836666236386139223b733a33323a223266663761303935323465346135343937626534363435346630363539663332223b733a33323a226630376336336166623362646663656264613463656337323936343337353838223b733a33323a223037306666333734323035316539646263613135613666383431303838373265223b733a33323a223036626534613662636166306537353732383838303233386561316163656537223b733a33323a223235366439366430356435303136643466373536623865623239633634613530223b733a33323a223566653261653835343166393764303530333663316135363936356231386431223b733a33323a226238393234643661366337303764303361313136373965383062643366353561223b733a33323a223765333239363436633338393138333666306136633733306261326537316134223b733a33323a226638666665393666656265373636633132623930343262376461626464333934223b733a33323a223133303565313932323837643438333564323265633738336138643932396533223b733a33323a223262333435656139373936656531313866376632383362343733303131623262223b733a33323a223665636236383330393333613561383466373730656163666635623338326662223b733a33323a223665663562643639646135633832303931623332303931323231313037393863223b733a33323a223236346264353138626134653563333930363261666561656664633564306563223b733a33323a223730646462383566366366393731373036316132633034333661363632343632223b733a33323a223863383830663563626634666635353230313739376632373261616263613238223b733a33323a223838626534333830336534313930336238333130306231626334656636623038223b733a33323a226135306561333531643437376238666537396336633665313062626565343834223b733a33323a223364356561316338363734656333646566353238393433616465383737333062223b7d733a343a2268617368223b733a36353a2233643565613163383637346563336465663532383934336164653837373330622d6135306561333531643437376238666537396336633665313062626565343834223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223763663532336430393438373462346566653937653338396162393039323237223b733a33323a223566313734623365313933353139363939376337636539623763303463626466223b733a33323a223436666338393063336431363961656130623735333264613539666665653837223b733a33323a223432333631313938393061626361356166343866343031636166646162393032223b7d733a343a2268617368223b733a36353a2234323336313139383930616263613561663438663430316361666461623930322d3436666338393063336431363961656130623735333264613539666665653837223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1643412705),
('45o82kcl7g8ll1n5bmqjs038ef', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313634343332383438352e3136343638343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f366b36757262737136366e73716b3735686b72313934316968223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313634343331333632363b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313634343332373736373b7d7d72656469726563745f75726c7c733a32393a22687474703a2f2f6c6f63616c686f73742f6f6d656b61732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223465326437393166636134613662326565653432313736643231663863663331223b733a33323a223264303937336330376239373534363139353265363861393061326533653734223b7d733a343a2268617368223b733a36353a2232643039373363303762393735343631393532653638613930613265336537342d3465326437393166636134613662326565653432313736643231663863663331223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226131373365396434353963393464393764376435633433643532366137633630223b733a33323a223665663663306633396562366461653261356138343266346237653034633135223b733a33323a223635346439393463363331616236336231656464666263366432306138646431223b733a33323a226465653734656262663363333339363337386666366166626635303037623662223b7d733a343a2268617368223b733a36353a2264656537346562626633633333393633373866663661666266353030376236622d3635346439393463363331616236336231656464666263366432306138646431223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1644328485),
('58b8i1svgsilb4vr8pv0rlb6jt', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313634333431303339372e3832333932353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2235386238693173766773696c6234767238707630726c62366a74223b7d7d, 1643410408),
('6tc701fkkrk5i4jp6670guai9f', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313633313939383634332e3435353730333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2268336d6f37756a346b7135326c673068616535316f6765666631223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313633313839323037373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313633323030323134333b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313633323030313730383b7d7d72656469726563745f75726c7c733a35303a22687474703a2f2f6c6f63616c686f73743a383838382f6f6d656b612d735f335f305f365f4853472f61646d696e2f6974656d223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223936396136313237633465376236303563313036353066353764643761643331223b733a33323a226639386139363937323535626338336462353933383665376537643764313464223b7d733a343a2268617368223b733a36353a2266393861393639373235356263383364623539333836653765376437643134642d3936396136313237633465376236303563313036353066353764643761643331223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343837323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a35373a7b733a33323a223862613466373237633135323265376433386432363530326262633862346166223b733a33323a226664653661643637376531333963656434396666613638623532393536333237223b733a33323a223130366434623036383734633663613133326332336461323862363765643332223b733a33323a226336336138316232333734313466653034626266386364353639323763633263223b733a33323a226265643637356631386635396463386162393334316130396435643231633532223b733a33323a226535303331396237376438386664636633366636303639373035363830323661223b733a33323a223263616535376561616632316637623734353235626633366166666565373039223b733a33323a226261636164323861613332646231663131363234373862373837323966336136223b733a33323a226436633865656662636337353038353163643831643634303636633433646630223b733a33323a223931393261363232353138303032613761396233336635646162653536623161223b733a33323a223765613432393330363066386438366561663435393936643234656637323734223b733a33323a226236303265313938383164663762623564373634373634643836313562376237223b733a33323a226266643533373633653462356636363664383163386431643230373238623265223b733a33323a226234393563313262633462346463386332396530353763653737363533666139223b733a33323a223733343565373062376333333066643331353331393430623737333837393833223b733a33323a223830396234323737393031373439653139366334666138383966323234316164223b733a33323a223037313233663562666565323561643166303361353938393165303735646666223b733a33323a226135636366316462313231326537346366393734353763393063393962623534223b733a33323a226566623062663761626562356565363166366466363137616136373933643939223b733a33323a226130316139323134626434306532353066353636323939376333653335393135223b733a33323a223435666562323138386265613862396233336130303937323130303261663734223b733a33323a223433616562343135366466323436363435353434623436323364626330363766223b733a33323a226536636662346430633165313338386566663135363565353266653332343762223b733a33323a226366323463633236666333616662653761653064393637623136663331326266223b733a33323a223532386435356564373466633961343536323738313334656231666637396639223b733a33323a226366323931316161653036653462323731383931653531623236333135333765223b733a33323a223265333939393930613362636564303337326134343239303162393965396436223b733a33323a223164383638376238623832333764353334313837383964343162643332303337223b733a33323a223231306266383936386433326132373335396237303035313733623862663834223b733a33323a226233383738666232376230393331353035343866366430653233373633346362223b733a33323a223230336365636161666535623833666466393266306164653039323533336237223b733a33323a226335396264616665633761336239666139623065656133643234323266646265223b733a33323a223830633635323865306563633962643866646461326635346662343463323833223b733a33323a223564616166323261626232633036653233346639633236323037376430363438223b733a33323a226435656636623831363864666361346431376264646636313366333562383661223b733a33323a226464633063393563613934616534666165316265323163353636623733636231223b733a33323a226132616462626436626134626434336136636363653930393366336664373430223b733a33323a226639653130313339366466386562343965663063363637386433613965623039223b733a33323a223961343664393939343231356533343066636330646563616434613262343838223b733a33323a223162333831333531613231316633353134383463653436663736386535666464223b733a33323a226363333830356231376165626665653037386631343465356435326136386132223b733a33323a226137633339613563313934636562323066633462306434376661396336613134223b733a33323a223933613330366566363763386333656164626638623964633139373830633431223b733a33323a226238373565396562353061616561313138306534373538396166393234386133223b733a33323a223337303832663639613036373339333233373533386165333532643665646132223b733a33323a226238336436376465316238623532303432323165356466303536663032636461223b733a33323a226161353763346431653131336437633861623137396336646661646136613134223b733a33323a223832333134396135333234393564353031343630633561333031373362653431223b733a33323a223661323566346338613261666130653562626331353966303664346232623734223b733a33323a226230646661653765383430613839336566363837633931373935663232373731223b733a33323a226362393634663635353132663464646135363932393234303130363335323934223b733a33323a223561393337316631323966626137646662663339303038616366303966646165223b733a33323a223662393730376533383531333639363433306634346466373531313265326639223b733a33323a226365353462636633356432326238613734633261393634623332353263653262223b733a33323a223765303863383731343139663262333433343537373736316333316165363963223b733a33323a223232333966336137346333393039643134326435633639653165336438663838223b733a33323a223034396663373736626532616564653062626633333833636334373764643136223b733a33323a226265636339393136613130626331306262613934636536343730653937386632223b733a33323a223833313536663236373931623835373236396134393931313439313162386263223b733a33323a223865373065653639653030613736323963373237396135633537626661363762223b733a33323a223730383535643738353465303735336561616139393063376339663839336562223b733a33323a223335616662356430303866316239616562333839623761366632666563346166223b733a33323a223631356266373764316664346162306666633434323663333065306530653666223b733a33323a226566373666343466376337323735636461316332643437386561613931646166223b733a33323a223937346536353230383265653638346637393135336433633934653338313966223b733a33323a223863336261346135613135366137626366336634653563623135386438653239223b733a33323a226566343963353639333430316166346435393463656463313034376666333730223b733a33323a223133656137663663396531373137373966643765666637396261623364306562223b733a33323a223637666539316234643533396337633765613063336630666435396638396638223b733a33323a226265383631663139326232343235623761613538366430613261383033656339223b733a33323a226466356436363462386332653831356239356337313063646361353630353466223b733a33323a223235353366623861336536363136316137343631336439646637353966616165223b733a33323a223633346461303865663663383034656331396434643264616465333363663135223b733a33323a223630653363613963626135633036663332643239653430356332363438643063223b733a33323a226563313237393961643237356636303534363739316664313733626238613038223b733a33323a223831333730376530306161666462623737333963323634363464663839356230223b733a33323a226161623130393464363733396134363834333838313431386463656462316266223b733a33323a223635383965663861303564323930646437333634353563363866626165643532223b733a33323a223961313035646430366162653639333961613230306135616363373765366536223b733a33323a223164383963613933633862356533623633666262306465356664353761353638223b733a33323a223562656465633037336335636363306333306162646265613565363539323763223b733a33323a226639313461663533623931613433356532626161613733623835633365333661223b733a33323a223037636538646438393963643738303663343537396333643634323331653139223b733a33323a223730336331313863343037393437373662376534653135303337313733386334223b733a33323a226339643966326530643235346263353065636533663732303464363333623436223b733a33323a226361333161346238386433663531333536383835623431356436326230386365223b733a33323a226530346363663636393563343734643665653833663237333361306239383933223b733a33323a226464346166656634353934353333323261303630356435653030363135623335223b733a33323a226336323764393131306632366135653432623436363665343565653266316539223b733a33323a223531373031656464663465653064393135373334363337623039373162373864223b733a33323a223463643764653762323832366231656533323266306265323535313261613733223b733a33323a226662313966373532616432613334303434623139626332373632396339383761223b733a33323a223830663536613130653833626130623736356463313636316262643237363331223b733a33323a223965333533646338666238613661633665313438633665346364333833616335223b733a33323a226136663131386239303862393566353130373761323261653637646636643834223b733a33323a226163376132613034616463396536643538656437333335306637386537313639223b733a33323a226338356431666239303933366166636166353630336132386661383237643563223b733a33323a223362626362363430316637666164396161313531663938663962636336383432223b733a33323a226563616238636363643635333832353931393838313462323131313964646261223b733a33323a226562336338666132316639653966396663326633353638386663616662643131223b733a33323a226432636361333136343830363361333535356532623064306331623735333834223b733a33323a223161333630656434643166613931316664303437386362323138633562623330223b733a33323a223966663139663231396362396562623162653938346561373734626330353965223b733a33323a226438323730346533373965323865353736363864363136626238633537306365223b733a33323a226435396362376232643533636532343337386465363433343466373362663066223b733a33323a223236623764333061623964613036623532376333613931646662613532656566223b733a33323a223935663238373264356566633632373664656430396465326433613434663136223b733a33323a223838363233333433626538323037333831666133623761343438313432613861223b733a33323a226634306363323864393633666238613137366161306639333065386433373337223b733a33323a223034656666393231373831366636333330633730386363386630353563613463223b733a33323a223631326537666437366161366563303266323161326566616563633261386165223b733a33323a223332633330353165373637633235646339376332643431393130303264386663223b733a33323a223931316665356335663235393838393232396664393033356365623537386264223b733a33323a223164636364653135623662363233633464636330396538396237653639636236223b7d733a343a2268617368223b733a36353a2231646363646531356236623632336334646363303965383962376536396362362d3931316665356335663235393838393232396664393033356365623537386264223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313139323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31313a7b733a33323a223635396164653765663230396636303065313335323563376261643034663866223b733a33323a226633343662393632616430613565353064316130616262373033623932646230223b733a33323a223132643266306539303734613562626433343365653737363938313062383062223b733a33323a223631333534316165356265356663623363336364303635646332656239616239223b733a33323a223434326263643636383066623264353036333137373338353034346532303939223b733a33323a226561323136386330646532306562366539636361613633303565636133306464223b733a33323a223336646435633666363038356563376631633638313063336637626137393838223b733a33323a223132386231336432396132666561306563613062353132663435326135313735223b733a33323a226531633463313562323162653331316634633531396139333132623534353932223b733a33323a226435306133646237666232353164393366353331316131306430333566313335223b733a33323a226235643239653465393032663662333261616163616639343234653130666237223b733a33323a223533643132636137333962663238353638373737336639356565643135636636223b733a33323a223965303765623335343733306535633832306163623237636533623764373066223b733a33323a226365306137643736376330323662386131313366306335386461666634326433223b733a33323a223066336237653532623961386438356137313339363233356338336132363935223b733a33323a223166663834623437383136356638313661383239383938623035323435643335223b733a33323a223133323933383439636262386336633935623233316463653731343561383262223b733a33323a223264333636323266323861666237346431333531316261323137663164323638223b733a33323a223930376139343936306637353837383233636335346633303037616631646336223b733a33323a223431346136393166376365363032646631366139323637656339333132383736223b733a33323a226330376262333733366239613032353530363034616439633764306138633363223b733a33323a223038393265383861383764646133373437653164633231303930623436396637223b7d733a343a2268617368223b733a36353a2230383932653838613837646461333734376531646332313039306234363966372d6330376262333733366239613032353530363034616439633764306138633363223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1631998643),
('6ub1t4vsgt6l7gmdk23264h529', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313634343334313434382e3037323232373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22326466697072706b387264336d6e33736c61656b336171326a62223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313634343334353030323b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313634343334353033323b7d7d72656469726563745f75726c7c733a32393a22687474703a2f2f6c6f63616c686f73742f6f6d656b61732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223132303737646561353837636665623035396430616664396639663561666132223b733a33323a223066633631313137396130333832623638613265303839336163363939366533223b7d733a343a2268617368223b733a36353a2230666336313131373961303338326236386132653038393361633639393665332d3132303737646561353837636665623035396430616664396639663561666132223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226462373366356166373966343130353166613039353538323131393462666361223b733a33323a223366646334616235376666636331663137393065303765393133663161633139223b733a33323a223533353563373034363637306531663733616565386330353362343536643737223b733a33323a223334646138363464343435393230623333643262663439366264323462656663223b7d733a343a2268617368223b733a36353a2233346461383634643434353932306233336432626634393662643234626566632d3533353563373034363637306531663733616565386330353362343536643737223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1644341448),
('79hf61arbt1t58mpfn2ot584l5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313634333431303339372e3832333932353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2237396866363161726274317435386d70666e326f743538346c35223b7d7d, 1643410408);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('cnacdc4p6fkj04i6ma18ec5pd2', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313634333239383332312e3138343736323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2265736c6f316f66696f75346d3073756262696232733139346a74223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313634333330303630333b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313634333330313137373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313634333330313931373b7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d72656469726563745f75726c7c733a32393a22687474703a2f2f6c6f63616c686f73742f6f6d656b61732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3837313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a373a7b733a33323a223139316565643561633633623663613036303836393264623735633863333737223b733a33323a226265336130656263643535633564303236663937643966346166323664656161223b733a33323a226435373737323135333736333831373964653463393436663437643865353039223b733a33323a223464386439333333363038393266653837356166386365393036316466613533223b733a33323a226130356465373135633436613935623431313730353066303736303830666666223b733a33323a223335376433616538636636626438313234643363376533356634616439396662223b733a33323a223632633038303730623062646566656537656564666533313531323239313561223b733a33323a223234643436646336303836643464643733653763303162636562313938373062223b733a33323a226335376165653831653231373536316366373861643363616439363134373933223b733a33323a223362666637663834643934626438353731313634363464663634386537353639223b733a33323a226231656163376234353262363363306362396438656132633035333864336461223b733a33323a223835366266386630386337633531393663643865376333386130666137356338223b733a33323a226362303766316132313166643566313136323733633937613235343635663235223b733a33323a223739353134623066636234393439326130386365353632343535616137636235223b7d733a343a2268617368223b733a36353a2237393531346230666362343934393261303863653536323435356161376362352d6362303766316132313166643566313136323733633937613235343635663235223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223739333435306234353535623231396566313561656365363938343662313762223b733a33323a223438393666393834626464303730313266323965373531376333366535333361223b7d733a343a2268617368223b733a36353a2234383936663938346264643037303132663239653735313763333665353333612d3739333435306234353535623231396566313561656365363938343662313762223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a323037323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32323a7b733a33323a226337326333336139343663643462666566343638666562363065663936623137223b733a33323a223736643364323433643335343530323336666332333632343839393065343665223b733a33323a223830633864623961626532656438633865653765653763616463363830613034223b733a33323a223637313665323765313564393130386534616134346638383663613966363939223b733a33323a226462353935643566326639386639343237643436636664366663323438613433223b733a33323a226232663731346563393664313865646237386630383364626132303138623133223b733a33323a223130313433633539303261356534373735363564386432363037393839393833223b733a33323a223435376230636538383538613039316638366538666334373737323837373164223b733a33323a223666346439653634626638353061376431316430663932636439646266326161223b733a33323a223137316235356462653132386234623864643662376362396239396661383961223b733a33323a226139386535396163313765343065643365356231636465353732653065313733223b733a33323a223035653332616330656663346234613862653431633066646232663266323966223b733a33323a223830356463376533636637393765313436653231626533623334326537323733223b733a33323a223237393964313733333563393639666539653630333964313230393936653264223b733a33323a226633383566643131363937376135316139346134396435353465333432323235223b733a33323a226430356333626333663731613266356232313765393565333930666232366562223b733a33323a223331353238623263313332626431323331353764323161396637663665376261223b733a33323a226438333938656536313166393939363262323962363464646463666331303763223b733a33323a223235313661666437646239646134613131373833393935393139376331653734223b733a33323a223834613739356563613332643937346230613233303765613934386630626661223b733a33323a223166393731303866393066313364326466333962343635373964346230356432223b733a33323a223138316333356433663265666333353266353036316562323664653563343666223b733a33323a226239323338316432633739356562313731326163393635323034383962346662223b733a33323a226466383435386637623538376336326165626239336632653463373238613132223b733a33323a223036363239353939353833353862386637333431666161626461323836303433223b733a33323a226430653336643731363535366134363065396535376435386633656130396263223b733a33323a223662326630343534653664653266626131333932616534626330353764353366223b733a33323a223134373134326361626235366565393730636239333131643831323364663731223b733a33323a223330353461363834316465366333306338653230393362653566383661396234223b733a33323a223364663363613938656462356262346664636363626637626133656265616663223b733a33323a226535643862633633653631656664366264313736336339313138333262396237223b733a33323a223234316130336532313464303132303139303561333837336562323831643434223b733a33323a223730373237616538366130356361623139346663313461376262363533636339223b733a33323a226339646635306432616366613831366331386665626633306565343163356135223b733a33323a223931633231333866353664343062313036383638623139353830626363373832223b733a33323a223761383463326465626662313264333263616136313462303938316434393861223b733a33323a223234323434366566313039663530613566323132643761666534343139386330223b733a33323a226263616232383764313733346635303030633235353465333231376661323038223b733a33323a223534363234666666623462363339663439373230633835616432306562373737223b733a33323a226261623834323836393936656464633931333035623533336261626565323461223b733a33323a226161623735613530663530363439353133303034353362336164633235386530223b733a33323a223365353431383935383839636364666230343536313738366339653036373535223b733a33323a223464353336373166646536353561353863386562356464333736396239376533223b733a33323a223437333064323530656534623039353930326634646135656235336132646636223b7d733a343a2268617368223b733a36353a2234373330643235306565346230393539303266346461356562353361326466362d3464353336373166646536353561353863386562356464333736396239376533223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1643298321),
('fspqabec1qg1bcl7usfasfemho', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313633313633343935332e3230303538343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22303930396a3133756f6231376d64363037313731666167766775223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313633303639313139303b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313633313633383535333b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313633313633353739343b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313633313633353830343b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313633313633383533363b7d733a34353a224c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313633313239343539323b7d7d72656469726563745f75726c7c733a34353a22687474703a2f2f6c6f63616c686f73743a383838382f6f6d656b612d735f335f305f365f4853472f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226139633635383233653535633461363034643039633238656462656132303132223b733a33323a223463393332356233353235386431393063623734656262306537666339333064223b7d733a343a2268617368223b733a36353a2234633933323562333532353864313930636237346562623065376663393330642d6139633635383233653535633461363034643039633238656462656132303132223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343935323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a35383a7b733a33323a226335373561333033323766326637636365303864656334663963386339313562223b733a33323a226233663165393730386336306664623566623461343233323339393939343939223b733a33323a223333666563336630633961663962393031613936626638316562633736393233223b733a33323a226164326162313033613036376331663039356438626431313463643539333465223b733a33323a223634346639633732313162656230306363356639623064633961633539303432223b733a33323a226431393635613565656430336161356466356465383734373833363463393333223b733a33323a223961626336383432313937333434393663336463623665616233386161303339223b733a33323a226561303832613933323839663464336166326566613536313335323462656664223b733a33323a223337343235613165616464356439656361383630633666633535663762343538223b733a33323a223634383766613039316632303032646138363134353365633437356366376539223b733a33323a226238363330643333353433333334353261313661363231343636333663626331223b733a33323a226664306364346665663333663536363231633734383639613262353337656266223b733a33323a226163643039383436326233363339343466396135646431633463303564636565223b733a33323a226430383465356136383862323161303937646164363438303434303331366534223b733a33323a223264626337303961303732376166306461323466326433363134386463613963223b733a33323a226332396230636230393162396133333435393463383265613164613435316535223b733a33323a223962666639666332373032623534393930653830336636663864373164363632223b733a33323a223561393362376432396632356638643430336132393532623232613666323465223b733a33323a223037333562333930343533656435663766663162626330663432353536366235223b733a33323a226439663334393965323639313633306361633962343532666636636461396137223b733a33323a226639613636636638343036363138366563633830393261383037386263633934223b733a33323a226435373366366632623631393266326263393266366634613265316230326637223b733a33323a223333396335323962366162613034333733363234363836323466376365623764223b733a33323a223763376239616132336133363063353062333166346263313634653365653130223b733a33323a223334373562343431366335653962633939323238333639613831376632353962223b733a33323a223533643765333937363431303238666230653963353765303137396339636461223b733a33323a223561316532636461306566333932386337653766346239316366633431343261223b733a33323a223435613662333739653937313261313166613065303538303736363631626439223b733a33323a223533643330363765316332396564353961666436366265393934643335303030223b733a33323a226439363063656666323036316266666364613663333737313065643166666135223b733a33323a223265386365653330326462653865313033333264306335383438333134633730223b733a33323a226161326336643237313862613064393261623133663636313339643064363537223b733a33323a226232626239363535303265623562613635376631666633656165396462616636223b733a33323a226461336534356431383735613938653337623665343930313339323134316134223b733a33323a226137333038343533303237353666663333363830343336343533343131303930223b733a33323a223731616437373936366236306138633166613564326465666630313332343831223b733a33323a223234376436323233353863313536653462636365643261323730623539643936223b733a33323a226265306564633632313030383730656161613961336339646537653966376435223b733a33323a223035343538643361363465653733316238336362333537383837353266653866223b733a33323a223533393536396333626565633365623030366338363763393464653464653739223b733a33323a223535363939373464616630386134346361613065303531653464316330326266223b733a33323a223366376663373365353864343730666230656335333662326633373365346232223b733a33323a223433336463633537343963346337663935363438363137636237646237643766223b733a33323a223935313431303934366666356665323562623837326564393762643337613064223b733a33323a223465643236616466306164353537623165356631353161326432306537653939223b733a33323a223731303636666530663433303430616232346262643536396436343662353138223b733a33323a226333383839393934633931363333363539373232626232646565326437313462223b733a33323a223864346161633364636637323466623431613031373663343735323232623339223b733a33323a223834396261353761666236636237383062363730323530663561303735343530223b733a33323a226166386562313262303731643330366630376535333430333761623536316661223b733a33323a226634326638613866653938323139363830313731613337633937623565653039223b733a33323a223731313635616635663835363837656338313261646537633438306163366531223b733a33323a223733386239393464396230346534336537326561356539303364316639313365223b733a33323a223261613565393263653162396230643761653232383833663561663330656538223b733a33323a223437653830633939356664613965303130363033643365613234316434636633223b733a33323a226464343937316364333764636235396166323937323032323433653331393663223b733a33323a226435323061336237653330303666356563393237356530323533363433386536223b733a33323a223138656136656131373431373330623764626166373237303638386561316466223b733a33323a226466366436646537373036616339613231316234343930363366306632386235223b733a33323a223764626432643835653730373730376465653664393261373230303664653765223b733a33323a223466303234396261653332653038323232626633316664353530646133653439223b733a33323a223264643731613666613365653863303931366262313334373236363366383736223b733a33323a226132656633376532373966366663663461633937656438643061643363343861223b733a33323a226165636361383934616435346337643437303931616362653962333861343034223b733a33323a223539393735383438623430613038656639373065303031633332346463633565223b733a33323a223666323237656638316137386237656437663666333537633135373231346439223b733a33323a226266323734336361313836626665636530643132653962376366306530383366223b733a33323a226566396532363531643366633763373238613830646139353835373834386135223b733a33323a223933343837613962356233666161376562366564333561626136333237316434223b733a33323a223033666361373736363534386430616133653430363266373337363939626634223b733a33323a223766316164613966356338336363363963356532346666393663336232323731223b733a33323a223633656261623938303561663834393830353039306436373161333066616434223b733a33323a226632376236623761626637386336663231346536376634633936366261326261223b733a33323a226265633865623437656431653739626664613136633630346536313738666666223b733a33323a226565313639383835323138313062613465663432356338623362633439346465223b733a33323a223562326635623065343362333462346331633662653063393939653636643438223b733a33323a223239303737323566626164643462343264646630306337663663336531353332223b733a33323a223139363764323562313564323434393338623336653433616561343137343564223b733a33323a226464383535313938646564623431303837633938343831303833386162376563223b733a33323a223061373561363735383433363536663436613562386137623738373266386135223b733a33323a226333656236323334626438623435646461303339323661636438633333613235223b733a33323a223038636538353765383735303331316130653533333739633132303939313630223b733a33323a226261376365313463346339316330333630613432373962353833373638366331223b733a33323a226261373365333731613537613833393664326461383536613234626537336338223b733a33323a223163333935363930393834366230353965373930363962316230643432323734223b733a33323a226433656532313831366430393666616264323266653361396130323063653662223b733a33323a223965636531653966656536323836313438333039386662343836333432653266223b733a33323a223833346661376639303462613837343866393938346437666236303737353031223b733a33323a226632363730623734363139396432643061383337376664626331393665623061223b733a33323a226363376137333937626135353131636531313365353963626461353036383663223b733a33323a223735386165326532373239613565383964393033633139383235313030366264223b733a33323a223336376530343864313533326138323835643038626439306533326261306162223b733a33323a226261353762313137663634643262353534373239663539333930366366363966223b733a33323a226435666533306136323133303661363064653636316538633135356538376566223b733a33323a226138376363346665303862383161636562636633356561366130643031343830223b733a33323a223061323035303131613137316232323565383534353037306439313234663161223b733a33323a226336636335626664363461666464386537633732623033623334343765393862223b733a33323a223739303038616536643665313531356361636336373438376461633063666234223b733a33323a223034396163333965663562623266343031303661323832303938633865626539223b733a33323a226432356430343630653062663666613962636234333363333163663463353638223b733a33323a223337373465353139383530306438373836363332663839353865356565393863223b733a33323a226439613237653138366663626330393235653464343934653536373933613438223b733a33323a226163333963613462613337383530663932613031393765366337653566653936223b733a33323a223461323933343238383462633637613337336437326535393166333935353834223b733a33323a223439333664326131646531323830643931323437653138363135323936353566223b733a33323a226536653961333836356563666130303239656333656139626239633430356536223b733a33323a223536303864383936383363353065653732323662306232663363313137326431223b733a33323a226338633334666363373761633732656265353862336135386463323432616637223b733a33323a223730633365396638333166376133326133393632313332636565633961376630223b733a33323a226332386366643264666432666161396535336633626637646163343736353461223b733a33323a226363636466313434353661383534393636313136303131663034343062313766223b733a33323a223833373037386565303934633733386331366333346435323638616563333537223b733a33323a223235306233363162636338383265616434333461386531613334376166366333223b733a33323a226535373466356333623562353961306334303838346235616665643737396230223b733a33323a226262623762313965316435323736386361643062646364373833656431393833223b733a33323a226463333633363431376263663038373738306166373261353265396433363138223b7d733a343a2268617368223b733a36353a2264633336333634313762636630383737383061663732613532653964333631382d6262623762313965316435323736386361643062646364373833656431393833223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223035333134326239343665646137613664306233353139343431633836326434223b733a33323a223539663663343861356134313532663035663338653030343933326631383262223b7d733a343a2268617368223b733a36353a2235396636633438613561343135326630356633386530303439333266313832622d3035333134326239343665646137613664306233353139343431633836326434223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223963666561643961323634323330303261613237336461316133633166353061223b733a33323a226666386533323935626437373337366137333762663962363061393137333135223b7d733a343a2268617368223b733a36353a2266663865333239356264373733373661373337626639623630613931373331352d3963666561643961323634323330303261613237336461316133633166353061223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a323135323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32333a7b733a33323a226662353437353066353464393166303163633465646338623764386664393334223b733a33323a223866383666633237663331363163313235303563386562326235313239633930223b733a33323a226530626330306233653233363832393764303162393335666562636665356466223b733a33323a223639643262623434346231343834643463383239353962373064346566316437223b733a33323a226165373737316633633132323933303935316562316332366139396539363234223b733a33323a223163353431636331303333646437333233616365333035363938383936376538223b733a33323a223932616163643433623737343538316430303064663064373763393064326337223b733a33323a223836316664653665313365393538363732346162336537633664323765333032223b733a33323a226562376164366538313561306262393562613738613066316366353634386636223b733a33323a226132613732343465626535323165383562656563303936363936633635633534223b733a33323a223862303939376261646632383364356262343063613662306438343965363137223b733a33323a223839396239653835356638343439356530336163363938653362343561646331223b733a33323a223264316564653435376130353234376265613333383930363637396233313736223b733a33323a226363363766396539393263326137303639313663636436313038316237636436223b733a33323a226531366432353135323539386633303066303163316363306463313835373863223b733a33323a223266306265376365383637633730333530653163343265353133316432666633223b733a33323a226234666231326662613263393466303239653661303936653666333332653732223b733a33323a223363303339393665623536383230636664303964666537383131313033623062223b733a33323a223666383164363135386238303536613665613534656438393436356566663863223b733a33323a223364636233336130653261393937623735306530353433356432346439303465223b733a33323a223834663361306339623934303439336663396135396662393336616336653265223b733a33323a223335653636663562653635313037633265316134616231306535623061653233223b733a33323a223563376337333039393261336339346235306332643938353264366261613466223b733a33323a226139663337366435383233303835643836616231333836333536373536373530223b733a33323a223136333864353833666631373962303162616334303331643339663730666132223b733a33323a226234613332383330313363656565326530313139363935663332306132626435223b733a33323a223437326334653766653630633531626465646662323736653535333163613665223b733a33323a223866366361333831323633323239313962313439323132666332353934613762223b733a33323a226163646465393634393631643763663763613865663261643362373139393563223b733a33323a226166646331333835613630653832656134663666623538303533663866366261223b733a33323a226565613366333938306335363134623230346361386537633134333766656332223b733a33323a226233636363343839323836386265633366346338396665356635663739656135223b733a33323a226661653165613262376130313037626638613535363733333138643735333266223b733a33323a223866666366373631613064616533346562333963623961333435653465363661223b733a33323a223161346238313037336666623362373938626464316237336430613934306437223b733a33323a226539333930613364653635623638373733323532653163636262623133386162223b733a33323a223262393737396366323637623038306162396365643839386139356463346335223b733a33323a226166316330383965363737633138343133633434663162383635633465333134223b733a33323a226433373433366533363661633439363431363762313730393737353364663732223b733a33323a226639633737633739333666373331616338383964616566626234386131646539223b733a33323a223133646561616233656136636637626330346463326639653630646532336535223b733a33323a226139633739323332333239336631306537393965633536326536663866336665223b733a33323a223238616137343462336537353462363061373465623466653866333432333638223b733a33323a226235373132303633303939653931313831333538356461313162396231666134223b733a33323a226432646231626139386634326161663762623965323331393434343133346665223b733a33323a223063373463666635613033616434666132333931653563333534666333346437223b7d733a343a2268617368223b733a36353a2230633734636666356130336164346661323339316535633335346663333464372d6432646231626139386634326161663762623965323331393434343133346665223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226334323731663633386564393939646364616330663736303366613431386438223b733a33323a223736393862646538653664343233623366326230303833656132323266343966223b7d733a343a2268617368223b733a36353a2237363938626465386536643432336233663262303038336561323232663439662d6334323731663633386564393939646364616330663736303366613431386438223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1631634953),
('h4ej7eaa9p4gf8paib7nf6d8u4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313634333735313035302e3733303838333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226834656a3765616139703467663870616962376e663664387534223b7d7d, 1643751052),
('k0q5hi84ob4hbd7topjgf24tcq', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313634333637333238352e3630323835323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b307135686938346f623468626437746f706a67663234746371223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313634333636393938343b7d7d72656469726563745f75726c7c733a32393a22687474703a2f2f6c6f63616c686f73742f6f6d656b61732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223266356265633335353965326261623235323162363764383561363438373735223b733a33323a226535656239636264653665656633326533633863646334613934366663626162223b7d733a343a2268617368223b733a36353a2265356562396362646536656566333265336338636463346139343666636261622d3266356265633335353965326261623235323162363764383561363438373735223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1643673286),
('kga2r6730e78vgtp4f5iuhlmrt', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313633333638333137332e3036373437353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b6761327236373330653738766774703466356975686c6d7274223b7d7d, 1633683173),
('kmgof3hpvjp74haamfu4rv6jtm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313634333738363634342e3634333831323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b6d676f66336870766a7037346861616d6675347276366a746d223b7d7d, 1643786645),
('lkff8vv0buge70bm2bd3gd3s5u', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313634333735373639342e3730373935393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c6b666638767630627567653730626d32626433676433733575223b7d7d, 1643757696),
('loqqjjahq1spnho90makri4aa0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313634333431303339372e3832333932313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c6f71716a6a6168713173706e686f39306d616b726934616130223b7d7d72656469726563745f75726c7c733a32393a22687474703a2f2f6c6f63616c686f73742f6f6d656b61732f61646d696e223b, 1643410399),
('qkof82ap78ag5b87orp8jf3gub', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313634333933343037372e3839363630313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b66763935397234736a683775716c676f6664316f6175693069223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313634333930353131373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313634333933373333313b7d7d72656469726563745f75726c7c733a32393a22687474703a2f2f6c6f63616c686f73742f6f6d656b61732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3535313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a226638633662363237646431633366656338373132663866663263633065343231223b733a33323a226437313966633265373165386236373431376535613063376262613362633737223b733a33323a223864303739366366643864313534363738653037336563646439393937303238223b733a33323a223236313466636661393134323235363961313663623064353435623437386330223b733a33323a226134353363303938636661343032633430643165373233383139343430373836223b733a33323a223535386331323862376230613331383733363765653539303763376435393730223b7d733a343a2268617368223b733a36353a2235353863313238623762306133313837333637656535393037633764353937302d6134353363303938636661343032633430643165373233383139343430373836223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223630336264386334346238343631346235613233336265343330623035376534223b733a33323a223362366535313638626637366535656231303039343466623539336331633236223b733a33323a226438353236353031616434633564353838363963633762303935396436666339223b733a33323a226131303566663561626637633961303033643234393639323239633866353835223b7d733a343a2268617368223b733a36353a2261313035666635616266376339613030336432343936393232396338663538352d6438353236353031616434633564353838363963633762303935396436666339223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1643934078),
('rhbjvalj9denqi01h267jhse3j', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313635333432393130322e3531373131313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227268626a76616c6a3964656e71693031683236376a687365336a223b7d7d, 1653429103),
('rouv3rk1r1uordic9ll12g1klp', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313634333431303339372e3832333932313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22726f757633726b317231756f72646963396c6c313267316b6c70223b7d7d, 1643410408),
('verjng9t37nkl5b88tmavcrh20', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313634333436353735372e3636303332353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227665726a6e67397433376e6b6c35623838746d61766372683230223b7d7d, 1643465769);

-- --------------------------------------------------------

--
-- Struttura della tabella `setting`
--

CREATE TABLE `setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"vincenzo.lombardo@unito.it\"'),
('advancedsearch_all_configs', '{\"1\":\"find\"}'),
('advancedsearch_api_config', '\"\"'),
('advancedsearch_batch_size', '100'),
('advancedsearch_configs', '[1]'),
('advancedsearch_main_config', '1'),
('advancedsearch_restrict_used_terms', 'true'),
('datatypegeometry_buttons', '[\"geometry:geography\",\"geometry:geometry\"]'),
('default_site', '\"\"'),
('default_to_private', '\"0\"'),
('disable_file_validation', '\"0\"'),
('disable_jsonld_embed', '\"0\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('installation_title', '\"Historygraphia\"'),
('locale', '\"\"'),
('media_type_whitelist', '{\"0\":\"application\\/msword\",\"1\":\"application\\/ogg\",\"2\":\"application\\/pdf\",\"3\":\"application\\/rtf\",\"4\":\"application\\/vnd.ms-access\",\"5\":\"application\\/vnd.ms-excel\",\"6\":\"application\\/vnd.ms-powerpoint\",\"7\":\"application\\/vnd.ms-project\",\"8\":\"application\\/vnd.ms-write\",\"9\":\"application\\/vnd.oasis.opendocument.chart\",\"10\":\"application\\/vnd.oasis.opendocument.database\",\"11\":\"application\\/vnd.oasis.opendocument.formula\",\"12\":\"application\\/vnd.oasis.opendocument.graphics\",\"13\":\"application\\/vnd.oasis.opendocument.presentation\",\"14\":\"application\\/vnd.oasis.opendocument.spreadsheet\",\"15\":\"application\\/vnd.oasis.opendocument.text\",\"16\":\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"17\":\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"18\":\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"19\":\"application\\/x-gzip\",\"20\":\"application\\/x-ms-wmp\",\"21\":\"application\\/x-msdownload\",\"22\":\"application\\/x-shockwave-flash\",\"23\":\"application\\/x-tar\",\"24\":\"application\\/zip\",\"25\":\"audio\\/midi\",\"26\":\"audio\\/mp4\",\"27\":\"audio\\/mpeg\",\"28\":\"audio\\/ogg\",\"29\":\"audio\\/x-aac\",\"30\":\"audio\\/x-aiff\",\"31\":\"audio\\/x-ms-wma\",\"32\":\"audio\\/x-ms-wax\",\"33\":\"audio\\/x-realaudio\",\"34\":\"audio\\/x-wav\",\"35\":\"image\\/bmp\",\"36\":\"image\\/gif\",\"37\":\"image\\/jp2\",\"38\":\"image\\/jpeg\",\"39\":\"image\\/pjpeg\",\"40\":\"image\\/png\",\"41\":\"image\\/tiff\",\"42\":\"image\\/x-icon\",\"43\":\"text\\/css\",\"44\":\"text\\/plain\",\"45\":\"text\\/richtext\",\"46\":\"video\\/divx\",\"47\":\"video\\/mp4\",\"48\":\"video\\/mpeg\",\"49\":\"video\\/ogg\",\"50\":\"video\\/quicktime\",\"51\":\"video\\/webm\",\"52\":\"video\\/x-ms-asf\",\"54\":\"video\\/x-msvideo\",\"55\":\"video\\/x-ms-wmv\"}'),
('pagination_per_page', '\"25\"'),
('property_label_information', '\"none\"'),
('recaptcha_secret_key', '\"\"'),
('recaptcha_site_key', '\"\"'),
('time_zone', '\"Europe\\/Rome\"'),
('use_htmlpurifier', '\"0\"'),
('value_languages', '[]'),
('version', '\"3.1.1\"'),
('version_notifications', '\"1\"');

-- --------------------------------------------------------

--
-- Struttura della tabella `site`
--

CREATE TABLE `site` (
  `id` int(11) NOT NULL,
  `homepage_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `slug` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `navigation` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `item_pool` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `assign_new_items` tinyint(1) NOT NULL DEFAULT 0,
  `thumbnail_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `site`
--

INSERT INTO `site` (`id`, `homepage_id`, `owner_id`, `slug`, `theme`, `title`, `summary`, `navigation`, `item_pool`, `created`, `modified`, `is_public`, `assign_new_items`, `thumbnail_id`) VALUES
(1, NULL, 1, 'historygraphia', 'centerrow', 'HiStoryGraphia', NULL, '[{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":2},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":3},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":4},\"links\":[]}]', '[]', '2021-08-23 13:16:24', '2022-01-31 00:00:43', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `site_block_attachment`
--

CREATE TABLE `site_block_attachment` (
  `id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `caption` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `site_item_set`
--

CREATE TABLE `site_item_set` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `site_item_set`
--

INSERT INTO `site_item_set` (`id`, `site_id`, `item_set_id`, `position`) VALUES
(1, 1, 167, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `site_page`
--

CREATE TABLE `site_page` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `slug` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `site_page`
--

INSERT INTO `site_page` (`id`, `site_id`, `slug`, `title`, `is_public`, `created`, `modified`) VALUES
(1, 1, 'hsg_welcome', 'HSG Welcome', 1, '2021-08-23 13:16:24', '2021-08-23 13:22:00'),
(2, 1, 'hsg_narrations', 'Narrations', 1, '2021-08-23 13:23:44', '2021-08-23 13:42:42'),
(3, 1, 'hsg_commissioning', 'Committenze', 1, '2021-08-23 13:30:02', '2021-08-23 13:31:18'),
(4, 1, 'hsg_sources', 'Fonti', 1, '2021-08-23 13:31:37', '2021-08-23 13:33:13');

-- --------------------------------------------------------

--
-- Struttura della tabella `site_page_block`
--

CREATE TABLE `site_page_block` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `layout` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `site_page_block`
--

INSERT INTO `site_page_block` (`id`, `page_id`, `layout`, `data`, `position`) VALUES
(1, 1, 'html', '{\"html\":\"<p>Benvenuti al sito di HiStoryGraphia.<\\/p>\\r\\n\"}', 1),
(2, 2, 'pageTitle', '[]', 1),
(3, 2, 'browsePreview', '{\"resource_type\":\"items\",\"query\":\"&property%5B0%5D%5Bjoiner%5D=and&property%5B0%5D%5Bproperty%5D=&property%5B0%5D%5Btype%5D=eq&property%5B0%5D%5Btext%5D=&resource_class_id%5B%5D=418&resource_template_id%5B%5D=&item_set_id%5B%5D=&site_id=&owner_id=&submit=Search\",\"limit\":\"12\",\"heading\":\"\",\"link-text\":\"Browse all\"}', 2),
(4, 3, 'pageTitle', '[]', 1),
(5, 3, 'browsePreview', '{\"resource_type\":\"items\",\"query\":\"&property%5B0%5D%5Bjoiner%5D=and&property%5B0%5D%5Bproperty%5D=&property%5B0%5D%5Btype%5D=eq&property%5B0%5D%5Btext%5D=&resource_class_id%5B%5D=383&resource_template_id%5B%5D=&item_set_id%5B%5D=&site_id=&owner_id=&submit=Search\",\"limit\":\"12\",\"heading\":\"\",\"link-text\":\"Browse all\"}', 2),
(6, 4, 'pageTitle', '[]', 1),
(7, 4, 'browsePreview', '{\"resource_type\":\"items\",\"query\":\"&property%5B0%5D%5Bjoiner%5D=and&property%5B0%5D%5Bproperty%5D=&property%5B0%5D%5Btype%5D=eq&property%5B0%5D%5Btext%5D=&resource_class_id%5B%5D=442&resource_template_id%5B%5D=&item_set_id%5B%5D=&site_id=&owner_id=&submit=Search\",\"limit\":\"12\",\"heading\":\"\",\"link-text\":\"Browse all\"}', 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `site_permission`
--

CREATE TABLE `site_permission` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `site_permission`
--

INSERT INTO `site_permission` (`id`, `site_id`, `user_id`, `role`) VALUES
(1, 1, 1, 'admin');

-- --------------------------------------------------------

--
-- Struttura della tabella `site_setting`
--

CREATE TABLE `site_setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `site_setting`
--

INSERT INTO `site_setting` (`id`, `site_id`, `value`) VALUES
('advancedsearch_configs', 1, '[1]'),
('advancedsearch_main_config', 1, '1'),
('advancedsearch_redirect_itemset', 1, 'true'),
('advancedsearch_restrict_used_terms', 1, 'true'),
('advancedsearch_search_fields', 1, '[\"common\\/advanced-search\\/fulltext\",\"common\\/advanced-search\\/properties\",\"common\\/advanced-search\\/resource-class\",\"common\\/advanced-search\\/item-sets\",\"common\\/advanced-search\\/date-time\",\"common\\/advanced-search\\/has-media\",\"common\\/advanced-search\\/media-type\",\"common\\/advanced-search\\/data-type-geography\",\"common\\/numeric-data-types-advanced-search\"]'),
('attachment_link_type', 1, '\"item\"'),
('browse_attached_items', 1, '\"0\"'),
('browse_body_property_term', 1, '\"\"'),
('browse_heading_property_term', 1, '\"\"'),
('disable_jsonld_embed', 1, '\"0\"'),
('item_media_embed', 1, '\"0\"'),
('locale', 1, '\"\"'),
('search_resource_names', 1, '[\"site_pages\",\"items\"]'),
('search_restrict_templates', 1, '\"0\"'),
('search_type', 1, '\"sitewide\"'),
('show_attached_pages', 1, '\"1\"'),
('show_page_pagination', 1, '\"1\"'),
('show_user_bar', 1, '\"0\"');

-- --------------------------------------------------------

--
-- Struttura della tabella `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `password_hash` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'vincenzo.lombardo@unito.it', 'Vincenzo Lombardo super', '2021-04-28 22:05:17', '2021-04-28 22:05:17', '$2y$10$bo/Ef3Q0P2GEfibENpQg3eRek54kv0MP1XTuhFHWZTF0dMl/wngQ2', 'global_admin', 1),
(2, 'biondi96giuseppe@gmail.com', 'Pep', '2022-01-27 15:07:57', '2022-01-27 15:07:57', '$2y$10$naTWYK/RwioGQjNLqKze4uzw2mUK.Qif0yWYFvWDNhEC/98v50Iqa', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `user_setting`
--

CREATE TABLE `user_setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `value`
--

CREATE TABLE `value` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value_resource_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uri` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(6, 4, 1, NULL, 'literal', '', 'Affiliazione amministrativa Entracque', NULL, 1),
(7, 5, 1, NULL, 'literal', '', 'Erezione Chiesa della Confraternita di Santa Croce a Entracque', NULL, 1),
(8, 6, 1, NULL, 'literal', '', 'Committenza 12 teleri Chiesa della Confraternita di Santa Croce a Entracque', NULL, 1),
(9, 7, 1, NULL, 'literal', '', 'Chiesa della Confraternita di Santa Croce a Entracque ', NULL, 1),
(10, 8, 1, NULL, 'literal', '', '1538', NULL, 1),
(11, 9, 1, NULL, 'literal', '', '1658-1660', NULL, 1),
(12, 10, 1, NULL, 'literal', '', 'Entracque', NULL, 1),
(13, 11, 1, NULL, 'literal', '', 'Confraternita Santa Croce Entracque', NULL, 1),
(14, 12, 1, NULL, 'literal', '', 'Modello Confraternita di Santa Croce a Cuneo', NULL, 1),
(15, 13, 1, NULL, 'literal', '', 'Ciclo di 12 teleri Confraternita SantaCroce Entracque', NULL, 1),
(16, 14, 1, NULL, 'literal', '', 'Diocesi di Mondovì', NULL, 1),
(17, 15, 1, NULL, 'literal', '', 'Lorenzo Gastaldi', NULL, 1),
(18, 16, 1, NULL, 'literal', '', 'Chiesa della Confraternita di Santa Croce a Cuneo ', NULL, 1),
(19, 17, 1, NULL, 'literal', '', 'Vita di Gesù', NULL, 1),
(20, 18, 1, NULL, 'literal', '', 'Vita della Vergine', NULL, 1),
(21, 19, 1, NULL, 'literal', '', 'Trinità', NULL, 1),
(22, 20, 1, NULL, 'literal', '', 'Immacolata Concezione della Vergine', NULL, 1),
(23, 21, 1, NULL, 'literal', '', 'Riscatto genere umano con sacrificio di Cristo', NULL, 1),
(24, 22, 1, NULL, 'literal', '', 'Triora', NULL, 1),
(25, 23, 1, NULL, 'literal', '', '1625-1690', NULL, 1),
(44, 24, 1, NULL, 'literal', '', 'Affiliazione amministrativa Castelletto Stura', NULL, 1),
(45, 25, 1, NULL, 'literal', '', 'Committenza edificazione Cappella San Bernardo Castelletto Stura', NULL, 1),
(46, 26, 1, NULL, 'literal', '', 'Committenza Decorazione Cappella San Bernardo Castelletto Stura', NULL, 1),
(47, 27, 1, NULL, 'literal', '', 'Percorso processionale Castelletto Stura', NULL, 1),
(48, 28, 1, NULL, 'literal', '', 'Chiesa parrocchiale Castelletto Stura', NULL, 1),
(49, 29, 1, NULL, 'literal', '', 'Oratorio Castelletto Stura', NULL, 1),
(50, 30, 1, NULL, 'literal', '', 'Cappella di Sant’Anna e San Rocco Castelletto Stura', NULL, 1),
(51, 31, 1, NULL, 'literal', '', 'Cappella di San Grato Castelletto Stura', NULL, 1),
(52, 32, 1, NULL, 'literal', '', 'Cappella di San Francesco Saverio Castelletto Stura', NULL, 1),
(53, 33, 1, NULL, 'literal', '', 'Cappella di San Bernardo Castelletto Stura', NULL, 1),
(54, 34, 1, NULL, 'literal', '', 'Giudizio Universale', NULL, 1),
(55, 35, 1, NULL, 'literal', '', 'Passione del Signore', NULL, 1),
(56, 36, 1, NULL, 'literal', '', 'Inferno', NULL, 1),
(57, 37, 1, NULL, 'literal', '', 'Cavalcata dei vizi', NULL, 1),
(58, 38, 1, NULL, 'literal', '', 'Paradiso', NULL, 1),
(59, 39, 1, NULL, 'literal', '', 'Opere di misericordia', NULL, 1),
(60, 40, 1, NULL, 'literal', '', 'Teorie dei santi', NULL, 1),
(61, 41, 1, NULL, 'literal', '', 'Affreschi Pareti Cappella San Bernardo Castelletto Stura', NULL, 1),
(62, 42, 1, NULL, 'literal', '', 'Intorno del 1480', NULL, 1),
(63, 43, 1, NULL, 'literal', '', 'Parroco Castelletto Stura', NULL, 1),
(64, 44, 1, NULL, 'literal', '', 'Confraternita Santa Croce Castelletto Stura', NULL, 1),
(65, 45, 1, NULL, 'literal', '', 'Diocesi di Asti', NULL, 1),
(66, 46, 1, NULL, 'literal', '', 'Castelletto Stura', NULL, 1),
(67, 47, 1, NULL, 'literal', '', 'Confraternita Santa Croce Cuneo', NULL, 1),
(68, 48, 1, NULL, 'literal', '', 'Crocifissione  nell’antica sacrestia di Niella Tanaro', NULL, 1),
(69, 49, 1, NULL, 'literal', '', 'Madonna col Bambino nel Santuario del Pasco a Villanova Mondovì', NULL, 1),
(70, 50, 1, NULL, 'literal', '', 'Committenza affreschi della cappella del Santo Sepolcro a Piozzo ', NULL, 1),
(71, 51, 1, NULL, 'literal', '', 'Committenza affreschi della chiesa di San Domenico a Peveragno ', NULL, 1),
(72, 52, 1, NULL, 'literal', '', 'Committenza affreschi del santuario del Brichetto a Morozzo ', NULL, 1),
(73, 53, 1, NULL, 'literal', '', '1481', NULL, 1),
(74, 54, 1, NULL, 'literal', '', '1487', NULL, 1),
(75, 55, 1, NULL, 'literal', '', '1491', NULL, 1),
(76, 56, 1, NULL, 'literal', '', 'frammento con la Madonna con Bambino tra sant’Antonio abate e san Giovanni Battista,  nella cappella di Sant’Antonio a San Michele Mondovì ', NULL, 1),
(77, 57, 1, NULL, 'literal', '', 'trittico con la Madonna con il Bambino e san Pietro e sant’Antonio, nella cappella dio San Pietro in Roncaglia a Benevagienna ', NULL, 1),
(78, 58, 1, NULL, 'literal', '', 'polittico con la Madonna col Bambino e santi nella cappella di San Bernardino a San Michele Mondovì', NULL, 1),
(79, 59, 1, NULL, 'literal', '', 'decorazione nell’ex convento dei domenicani nella frazione Bertini di Roccaforte Mondovì ', NULL, 1),
(80, 60, 1, NULL, 'literal', '', 'circa 1480', NULL, 1),
(81, 61, 1, NULL, 'literal', '', '1488', NULL, 1),
(82, 62, 1, NULL, 'literal', '', '1485', NULL, 1),
(83, 63, 1, NULL, 'literal', '', '1480', NULL, 1),
(92, 64, 1, NULL, 'literal', '', 'Giovanni Mazzucco', NULL, 1),
(120, 65, 1, NULL, 'literal', '', 'Sviluppo economico della Valle Gesso dalla seconda metà del secolo XV', NULL, 1),
(121, 66, 1, NULL, 'literal', '', 'Acquisizione della Contea di Tenda da parte dei Savoia nel 1579', NULL, 1),
(122, 67, 1, NULL, 'literal', '', 'Ricerca di percorso terre cisalpine-Nizza alternativo al Col di Tenda', NULL, 1),
(123, 68, 1, NULL, 'literal', '', 'Evitamento esosi pedaggi imposti dai signori di Tenda', NULL, 1),
(124, 69, 1, NULL, 'literal', '', '2a metà del secolo XV', NULL, 1),
(125, 70, 1, NULL, 'literal', '', '1579', NULL, 1),
(126, 71, 1, NULL, 'literal', '', 'Dinastia Savoia', NULL, 1),
(127, 72, 1, NULL, 'literal', '', 'Itinerario Valle Gesso', NULL, 1),
(128, 73, 1, NULL, 'literal', '', 'Itinerario Tenda', NULL, 1),
(129, 74, 1, NULL, 'literal', '', 'Itinerario Valle Gesso – cont. 1', NULL, 1),
(130, 75, 1, NULL, 'literal', '', 'Itinerario Valle Gesso – cont. 2', NULL, 1),
(133, 78, 1, NULL, 'literal', '', 'Tappa Tenda-Borgo San Dalmazzo', NULL, 1),
(135, 80, 1, NULL, 'literal', '', 'Borgo San Dalmazzo', NULL, 1),
(136, 81, 1, NULL, 'literal', '', 'Valle Vermenagna ', NULL, 1),
(137, 82, 1, NULL, 'literal', '', 'Colle di Tenda', NULL, 1),
(138, 83, 1, NULL, 'literal', '', 'Valle Roya', NULL, 1),
(139, 84, 1, NULL, 'literal', '', 'Breglio', NULL, 1),
(140, 85, 1, NULL, 'literal', '', 'Sospello', NULL, 1),
(141, 86, 1, NULL, 'literal', '', 'L’Escarène', NULL, 1),
(142, 87, 1, NULL, 'literal', '', 'St. Martin', NULL, 1),
(143, 88, 1, NULL, 'literal', '', 'Lantosca', NULL, 1),
(144, 89, 1, NULL, 'literal', '', 'Lévens', NULL, 1),
(145, 90, 1, NULL, 'literal', '', 'Utelle', NULL, 1),
(146, 91, 1, NULL, 'literal', '', 'Nice', NULL, 1),
(147, 92, 1, NULL, 'literal', '', 'Valle Gesso', NULL, 1),
(148, 93, 1, NULL, 'literal', '', 'val Vésubie', NULL, 1),
(149, 94, 1, NULL, 'literal', '', 'Colle del Brouis', NULL, 1),
(150, 95, 1, NULL, 'literal', '', 'Col de Braus', NULL, 1),
(151, 96, 1, NULL, 'literal', '', 'Colle delle Finestre', NULL, 1),
(152, 97, 1, NULL, 'literal', '', 'Tappa Tenda-Valle Vermenagna', NULL, 1),
(153, 98, 1, NULL, 'literal', '', 'Tappa Tenda-Colle di Tenda', NULL, 1),
(154, 99, 1, NULL, 'literal', '', 'Tappa Tenda-Valle Roya', NULL, 1),
(155, 100, 1, NULL, 'literal', '', 'Tappa Tenda-Breglio', NULL, 1),
(156, 101, 1, NULL, 'literal', '', 'Tappa Tenda-Colle del Brouis', NULL, 1),
(157, 102, 1, NULL, 'literal', '', 'Tappa Tenda-Sospello', NULL, 1),
(158, 103, 1, NULL, 'literal', '', 'Tappa Tenda-Col de Braus', NULL, 1),
(159, 104, 1, NULL, 'literal', '', 'Tappa Tenda-L’Escarène', NULL, 1),
(160, 105, 1, NULL, 'literal', '', 'Tappa Tenda-Nice', NULL, 1),
(161, 106, 1, NULL, 'literal', '', 'Tappa Valle Gesso-Nice', NULL, 1),
(162, 107, 1, NULL, 'literal', '', 'Tappa Valle Gesso-Borgo San Dalmazzo', NULL, 1),
(163, 108, 1, NULL, 'literal', '', 'Tappa Valle Gesso-Valle Gesso', NULL, 1),
(164, 109, 1, NULL, 'literal', '', 'Tappa Valle Gesso-Entracque', NULL, 1),
(165, 110, 1, NULL, 'literal', '', 'Tappa Valle Gesso-Colle delle Finestre', NULL, 1),
(166, 111, 1, NULL, 'literal', '', 'Tappa Valle Gesso-val Vésubie', NULL, 1),
(167, 112, 1, NULL, 'literal', '', 'Tappa Valle Gesso-St. Martin', NULL, 1),
(168, 113, 1, NULL, 'literal', '', 'Tappa Valle Gesso-Lantosca', NULL, 1),
(169, 114, 1, NULL, 'literal', '', 'Tappa Valle Gesso cont 1-Lévens', NULL, 1),
(170, 115, 1, NULL, 'literal', '', 'Tappa Valle Gesso cont 2-Utelle', NULL, 1),
(242, 116, 1, NULL, 'literal', '', 'Signori di Tenda', NULL, 1),
(243, 117, 1, NULL, 'literal', '', 'Pedaggio itinerario Tenda', NULL, 1),
(254, 118, 1, NULL, 'literal', '', 'Contea di Tenda', NULL, 1),
(260, 121, 1, NULL, 'literal', '', 'Confraternita di Santa Croce \na Entracque: Autore ', NULL, 1),
(261, 15, 376, 22, 'resource', NULL, NULL, NULL, 1),
(262, 15, 372, 23, 'resource', NULL, NULL, NULL, 1),
(263, 12, 345, 16, 'resource', NULL, NULL, NULL, 1),
(264, 13, 385, 17, 'resource', NULL, NULL, NULL, 1),
(265, 13, 385, 18, 'resource', NULL, NULL, NULL, 1),
(266, 13, 385, 19, 'resource', NULL, NULL, NULL, 1),
(267, 13, 385, 20, 'resource', NULL, NULL, NULL, 1),
(268, 13, 385, 21, 'resource', NULL, NULL, NULL, 1),
(269, 6, 386, 9, 'resource', NULL, NULL, NULL, 1),
(270, 6, 374, 13, 'resource', NULL, NULL, NULL, 1),
(271, 6, 379, 12, 'resource', NULL, NULL, NULL, 1),
(272, 6, 351, 15, 'resource', NULL, NULL, NULL, 1),
(273, 6, 360, 11, 'resource', NULL, NULL, NULL, 1),
(274, 5, 386, 8, 'resource', NULL, NULL, NULL, 1),
(275, 5, 374, 7, 'resource', NULL, NULL, NULL, 1),
(276, 4, 364, 10, 'resource', NULL, NULL, NULL, 1),
(277, 4, 350, 14, 'resource', NULL, NULL, NULL, 1),
(278, 7, 349, 13, 'resource', NULL, NULL, NULL, 1),
(279, 7, 397, 10, 'resource', NULL, NULL, NULL, 1),
(280, 50, 386, 53, 'resource', NULL, NULL, NULL, 1),
(281, 51, 386, 54, 'resource', NULL, NULL, NULL, 1),
(282, 52, 386, 55, 'resource', NULL, NULL, NULL, 1),
(283, 56, 386, 63, 'resource', NULL, NULL, NULL, 1),
(284, 57, 386, 62, 'resource', NULL, NULL, NULL, 1),
(285, 58, 386, 61, 'resource', NULL, NULL, NULL, 1),
(286, 59, 386, 60, 'resource', NULL, NULL, NULL, 1),
(287, 44, 401, 47, 'resource', NULL, NULL, NULL, 1),
(288, 64, 391, 48, 'resource', NULL, NULL, NULL, 1),
(289, 64, 391, 49, 'resource', NULL, NULL, NULL, 1),
(290, 64, 388, 50, 'resource', NULL, NULL, NULL, 1),
(291, 64, 388, 51, 'resource', NULL, NULL, NULL, 1),
(292, 64, 388, 52, 'resource', NULL, NULL, NULL, 1),
(293, 64, 392, 56, 'resource', NULL, NULL, NULL, 1),
(294, 64, 392, 57, 'resource', NULL, NULL, NULL, 1),
(295, 64, 392, 58, 'resource', NULL, NULL, NULL, 1),
(296, 64, 392, 59, 'resource', NULL, NULL, NULL, 1),
(297, 41, 385, 34, 'resource', NULL, NULL, NULL, 1),
(298, 41, 385, 35, 'resource', NULL, NULL, NULL, 1),
(299, 41, 385, 36, 'resource', NULL, NULL, NULL, 1),
(300, 41, 385, 37, 'resource', NULL, NULL, NULL, 1),
(301, 41, 385, 38, 'resource', NULL, NULL, NULL, 1),
(302, 41, 385, 39, 'resource', NULL, NULL, NULL, 1),
(303, 41, 385, 40, 'resource', NULL, NULL, NULL, 1),
(304, 24, 350, 45, 'resource', NULL, NULL, NULL, 1),
(305, 24, 364, 46, 'resource', NULL, NULL, NULL, 1),
(306, 25, 360, 44, 'resource', NULL, NULL, NULL, 1),
(307, 25, 360, 43, 'resource', NULL, NULL, NULL, 1),
(308, 25, 386, 42, 'resource', NULL, NULL, NULL, 1),
(309, 25, 374, 33, 'resource', NULL, NULL, NULL, 1),
(310, 26, 360, 44, 'resource', NULL, NULL, NULL, 1),
(311, 26, 360, 43, 'resource', NULL, NULL, NULL, 1),
(312, 26, 386, 42, 'resource', NULL, NULL, NULL, 1),
(313, 122, 1, NULL, 'literal', '', 'Tappa Percorso professionale Castelletto Stura - Chiesa parrocchiale', NULL, 1),
(314, 123, 1, NULL, 'literal', '', 'Tappa Percorso professionale Castelletto Stura - Chiesa parrocchiale', NULL, 1),
(315, 124, 1, NULL, 'literal', '', 'Tappa Percorso professionale Castelletto Stura - Oratorio', NULL, 1),
(316, 125, 1, NULL, 'literal', '', 'Tappa Percorso professionale Castelletto Stura - Cappella di Sant\'Anna e San Rocco', NULL, 1),
(317, 126, 1, NULL, 'literal', '', 'Tappa Percorso professionale Castelletto Stura - Cappella di San Grato', NULL, 1),
(318, 127, 1, NULL, 'literal', '', 'Tappa Percorso professionale Castelletto Stura - Cappella di San Francesco Saverio', NULL, 1),
(319, 127, 383, 32, 'resource', NULL, NULL, NULL, 1),
(320, 126, 383, 31, 'resource', NULL, NULL, NULL, 1),
(321, 125, 383, 30, 'resource', NULL, NULL, NULL, 1),
(322, 124, 383, 29, 'resource', NULL, NULL, NULL, 1),
(323, 123, 383, 28, 'resource', NULL, NULL, NULL, 1),
(324, 27, 382, 127, 'resource', NULL, NULL, NULL, 1),
(325, 27, 382, 126, 'resource', NULL, NULL, NULL, 1),
(326, 27, 382, 125, 'resource', NULL, NULL, NULL, 1),
(327, 27, 382, 124, 'resource', NULL, NULL, NULL, 1),
(328, 27, 382, 123, 'resource', NULL, NULL, NULL, 1),
(329, 128, 1, NULL, 'literal', '', 'Tappa Percorso professionale Castelletto Stura - Cappella San Bernardo', NULL, 1),
(330, 27, 382, 128, 'resource', NULL, NULL, NULL, 1),
(331, 128, 383, 33, 'resource', NULL, NULL, NULL, 1),
(332, 98, 383, 82, 'resource', NULL, NULL, NULL, 1),
(333, 98, 393, 99, 'resource', NULL, NULL, NULL, 1),
(334, 78, 383, 80, 'resource', NULL, NULL, NULL, 1),
(335, 78, 393, 97, 'resource', NULL, NULL, NULL, 1),
(336, 97, 383, 81, 'resource', NULL, NULL, NULL, 1),
(337, 97, 393, 98, 'resource', NULL, NULL, NULL, 1),
(338, 99, 383, 83, 'resource', NULL, NULL, NULL, 1),
(339, 99, 393, 100, 'resource', NULL, NULL, NULL, 1),
(340, 100, 383, 84, 'resource', NULL, NULL, NULL, 1),
(341, 100, 393, 101, 'resource', NULL, NULL, NULL, 1),
(342, 101, 383, 94, 'resource', NULL, NULL, NULL, 1),
(343, 101, 393, 102, 'resource', NULL, NULL, NULL, 1),
(344, 102, 383, 85, 'resource', NULL, NULL, NULL, 1),
(345, 102, 393, 103, 'resource', NULL, NULL, NULL, 1),
(346, 103, 383, 95, 'resource', NULL, NULL, NULL, 1),
(347, 103, 393, 104, 'resource', NULL, NULL, NULL, 1),
(348, 104, 383, 86, 'resource', NULL, NULL, NULL, 1),
(349, 104, 393, 105, 'resource', NULL, NULL, NULL, 1),
(350, 105, 383, 91, 'resource', NULL, NULL, NULL, 1),
(351, 107, 383, 80, 'resource', NULL, NULL, NULL, 1),
(352, 107, 393, 108, 'resource', NULL, NULL, NULL, 1),
(353, 109, 383, 10, 'resource', NULL, NULL, NULL, 1),
(354, 109, 393, 110, 'resource', NULL, NULL, NULL, 1),
(355, 108, 383, 92, 'resource', NULL, NULL, NULL, 1),
(356, 108, 393, 109, 'resource', NULL, NULL, NULL, 1),
(357, 110, 383, 96, 'resource', NULL, NULL, NULL, 1),
(358, 110, 393, 111, 'resource', NULL, NULL, NULL, 1),
(359, 111, 383, 93, 'resource', NULL, NULL, NULL, 1),
(360, 111, 393, 112, 'resource', NULL, NULL, NULL, 1),
(361, 112, 383, 87, 'resource', NULL, NULL, NULL, 1),
(362, 112, 393, 113, 'resource', NULL, NULL, NULL, 1),
(363, 113, 383, 88, 'resource', NULL, NULL, NULL, 1),
(364, 113, 393, 114, 'resource', NULL, NULL, NULL, 1),
(365, 113, 393, 115, 'resource', NULL, NULL, NULL, 1),
(366, 114, 383, 89, 'resource', NULL, NULL, NULL, 1),
(367, 114, 393, 106, 'resource', NULL, NULL, NULL, 1),
(368, 115, 383, 90, 'resource', NULL, NULL, NULL, 1),
(369, 115, 393, 106, 'resource', NULL, NULL, NULL, 1),
(370, 106, 383, 91, 'resource', NULL, NULL, NULL, 1),
(371, 73, 365, 78, 'resource', NULL, NULL, NULL, 1),
(372, 73, 352, 105, 'resource', NULL, NULL, NULL, 1),
(373, 73, 382, 78, 'resource', NULL, NULL, NULL, 1),
(374, 73, 382, 97, 'resource', NULL, NULL, NULL, 1),
(375, 73, 382, 98, 'resource', NULL, NULL, NULL, 1),
(376, 73, 382, 99, 'resource', NULL, NULL, NULL, 1),
(377, 73, 382, 100, 'resource', NULL, NULL, NULL, 1),
(378, 73, 382, 101, 'resource', NULL, NULL, NULL, 1),
(379, 73, 382, 102, 'resource', NULL, NULL, NULL, 1),
(380, 73, 382, 103, 'resource', NULL, NULL, NULL, 1),
(381, 73, 382, 104, 'resource', NULL, NULL, NULL, 1),
(382, 73, 382, 105, 'resource', NULL, NULL, NULL, 1),
(383, 73, 367, NULL, 'literal', '', '8h', NULL, 1),
(384, 72, 365, 107, 'resource', NULL, NULL, NULL, 1),
(385, 72, 352, 106, 'resource', NULL, NULL, NULL, 1),
(386, 72, 382, 107, 'resource', NULL, NULL, NULL, 1),
(387, 72, 382, 108, 'resource', NULL, NULL, NULL, 1),
(388, 72, 382, 109, 'resource', NULL, NULL, NULL, 1),
(389, 72, 382, 110, 'resource', NULL, NULL, NULL, 1),
(390, 72, 382, 111, 'resource', NULL, NULL, NULL, 1),
(391, 72, 382, 112, 'resource', NULL, NULL, NULL, 1),
(392, 72, 382, 113, 'resource', NULL, NULL, NULL, 1),
(393, 72, 382, 106, 'resource', NULL, NULL, NULL, 1),
(394, 72, 367, NULL, 'literal', '', '8h', NULL, 1),
(395, 74, 365, 114, 'resource', NULL, NULL, NULL, 1),
(396, 74, 352, 106, 'resource', NULL, NULL, NULL, 1),
(397, 74, 382, 114, 'resource', NULL, NULL, NULL, 1),
(398, 74, 382, 106, 'resource', NULL, NULL, NULL, 1),
(399, 75, 365, 115, 'resource', NULL, NULL, NULL, 1),
(400, 75, 352, 106, 'resource', NULL, NULL, NULL, 1),
(401, 75, 382, 115, 'resource', NULL, NULL, NULL, 1),
(402, 75, 382, 106, 'resource', NULL, NULL, NULL, 1),
(403, 117, 374, 73, 'resource', NULL, NULL, NULL, 1),
(404, 117, 351, 116, 'resource', NULL, NULL, NULL, 1),
(405, 68, 374, 117, 'resource', NULL, NULL, NULL, 1),
(406, 68, 351, 71, 'resource', NULL, NULL, NULL, 1),
(407, 67, 368, 68, 'resource', NULL, NULL, NULL, 1),
(408, 67, 351, 71, 'resource', NULL, NULL, NULL, 1),
(409, 67, 380, 72, 'resource', NULL, NULL, NULL, 1),
(410, 65, 347, 67, 'resource', NULL, NULL, NULL, 1),
(411, 65, 351, 71, 'resource', NULL, NULL, NULL, 1),
(412, 65, 386, 69, 'resource', NULL, NULL, NULL, 1),
(413, 66, 351, 71, 'resource', NULL, NULL, NULL, 1),
(414, 66, 386, 70, 'resource', NULL, NULL, NULL, 1),
(415, 66, 374, 118, 'resource', NULL, NULL, NULL, 1),
(416, 129, 1, NULL, 'literal', '', 'Confraternita di Santa Croce \na Entracque: Articolo', NULL, 1),
(417, 129, 400, NULL, 'literal', '', '[Articolo]: \nConfraternita di Santa Croce \na Entracque', NULL, 1),
(418, 121, 400, NULL, 'literal', '', '[Autore].  Gelsomina Spione', NULL, 1),
(419, 130, 1, NULL, 'literal', '', 'Confraternita di Santa Croce \na Entracque: Localizzazione ', NULL, 1),
(420, 130, 400, NULL, 'literal', '', '[Localizzazione]. Entracque, diocesi di Mondovì', NULL, 1),
(421, 131, 1, NULL, 'literal', '', 'Confraternita di Santa Croce \na Entracque: Committenza', NULL, 1),
(422, 131, 400, NULL, 'literal', '', '[Committenza]. La chiesa della confraternita viene edificata nel 1538, segno dell’affermazione di un notabilato che controlla la vita economica e sociale della comunità e sviluppatosi tra la metà del Quattrocento e la fine del Cinquecento, a seguito dell’incremento dei traffici commerciali. La rete economica favorisce anche la circolazione di artisti. I confratelli di Santa Croce commissionano (1658 - 1660) un ciclo di dodici tele a Lorenzo Gastaldi. La scelta del pittore, che in quel momento si trova a Monaco, e realizza molte opere per le valli del Nizzardo e il basso cuneese, si spiega con interessi economici della comunità e alle frequentazioni liguri-nizzarde della popolazione locale.  Durante il Seicento gli entracquesi vendono ovini e bovini ai macelli di Grasse, Nizza e Genova. Sovente  alcuni abitanti si recavano per affari a Tenda, raggiunta attraverso i colli della Finestra e del Sabbione. A partire dagli anni Settanta del Seicento è potenziata l’attività mercantile, a cui corrisponde il tentativo di rilanciare l’antica strada del colle delle Finestre, che in seguito al potenziamento della strada del colle di Tenda aveva perso la sua importanza.] I rapporti di Entracque con la valle della Vesubie, attraverso il colle delle Finestre, sulla strada di Nizza, determinarono almeno un altro episodio di committenza: il “mastro da bosco” (falegname) Giacomo Rosso di Lantosca realizza nel 1684 un armadio per la parrocchiale di Sant’Antonino.', NULL, 1),
(423, 132, 1, NULL, 'literal', '', 'Confraternita di Santa Croce \na Entracque: Fonte Palmero 2008', NULL, 1),
(424, 132, 400, NULL, 'literal', '', '[Fonte]. B. Palmero, Entracque 2008, https://www.archiviocasalis.it/localized-install/biblio/cuneo/entracque', NULL, 1),
(425, 133, 1, NULL, 'literal', '', 'Confraternita di Santa Croce \na Entracque: Fonte Arneodo et al. 1997', NULL, 1),
(426, 133, 400, NULL, 'literal', '', '[Fonte].  F. ARNEODO, D. DEIDDA, L. VOLPE, Attività pastorizia ed evoluzione degli equilibri socio-economici a Entracque (secoli XV-XVIII), in Entracque : una comunità alpina tra Medioevo ed Età moderna, Atti della giornata di studio, Entracque, 13 Aprile 1997, a cura di R. Comba, M. Cordero, Cuneo 1997, pp. 107-143].', NULL, 1),
(427, 134, 1, NULL, 'literal', '', 'Confraternita di Santa Croce a Entracque: Iconografia', NULL, 1),
(428, 134, 400, NULL, 'literal', '', '[Iconografia]. Si tratta di dodici teleri raffiguranti episodi della vita di Cristo e della Vergine. Una scelta che risponde ai dogmi affermati dalla Chiesa cattolica della Controriforma, l’Immacolata Concezione della Vergine, la Trinità, il riscatto del genere umano attraverso il Sacrificio di Cristo. A questo si aggiungono i riferimenti alle pratiche liturgiche svolte dai confratelli durante il Giovedì Santo, rievocate nell’Ultima Cena e soprattutto nella Lavanda dei piedi. Il modello decorativo di riferimento è quello della Confraternita di Santa Croce a Cuneo, dove nel 1626 sono allestite le tele con i Miracoli della Vera Croce dipinti nel 1626 da Giulio e Giovanni Battista Bruno (che a loro volta rimandano ai modelli decorativi di primo Seicento delle Casacce (oratori), genovesi.', NULL, 1),
(429, 135, 1, NULL, 'literal', '', 'Confraternita di Santa Croce \na Entracque: Geografia artistica', NULL, 1),
(430, 135, 400, NULL, 'literal', '', '[Geografia artistica]. Lorenzo Gastaldi è un pittore originario di Triora (1625-1690); dal 1651 si trasferisce a Monaco dove si ritaglia uno spazio a corte, per poi passare a Nizza e ritornare a Triora nel 1676. Molte sono le opere da lui realizzate, destinate alle valli del Nizzardo e del basso Cuneese.  Le sue opere sono presenti a La Brigue (per la parrocchiale, Immacolata con i santi Sebastiano, Giuseppe, Rocco e Carlo Borromeo), a Peillon (per la parrocchiale, Madonna del Rosario), a Contes in Val Paillon (per la parrocchiale, Pentecoste); a Triora (Natività del Battista per l’Oratorio di San Giovanni Battista);  in valle Stura a Bersezio (per la parrocchiale, Madonna con il Bambino e santi; Sacra Famiglia); Pontebernardo (per la parrocchiale, Madonna con il Bambino, Santi e la Sindone; Moiola; Vernante (per la parrocchiale, la Sindone, 1671; Roccavione (per la cappella dei Santi Rocco e Biagio, 1676; per la parrocchiale uno stendardo per la Compagnia del Rosario, 1678); Demonte (parrocchiale, Madonna con il Bambino e i santi Marco evangelista, Chiara, Grato e Barbara); nella valle della Tinèe, a Isola (per la parrocchiale, Incoronazione della Vergine e i santi Bernardo e Lorenzo). ', NULL, 1),
(431, 136, 1, NULL, 'literal', '', 'Confraternita di Santa Croce \na Entracque: Fonte Bartoletti 1997', NULL, 1),
(432, 136, 400, NULL, 'literal', '', '[FONTE: M. Bartoletti, Due episodi figurativi del Seicento a Entracque: l’attività del pittore Lorenzo Gastaldi e le tele dell’Apostolato nella parrocchiale, in Entracque : una comunità alpina tra Medioevo ed Età moderna, Atti della giornata di studio, Entracque, 13 Aprile 1997, a cura di R. Comba, M. Cordero, Cuneo 1997, pp. 193-214].', NULL, 1),
(433, 137, 1, NULL, 'literal', NULL, 'Cappella San Bernardo', NULL, 1),
(434, 138, 1, NULL, 'literal', '', 'ARNEODO et al. 1997', NULL, 1),
(435, 138, 4, NULL, 'uri', NULL, 'Link Centro Casalis per Aneoddo et al. 1997', 'https://www.archiviocasalis.it/localized-install/biblio/cuneo/entracque', 1),
(436, 133, 406, 138, 'resource', NULL, NULL, NULL, 1),
(437, 129, 357, 121, 'resource', NULL, NULL, NULL, 1),
(438, 129, 373, 130, 'resource', NULL, NULL, NULL, 1),
(439, 129, 361, 131, 'resource', NULL, NULL, NULL, 1),
(440, 129, 369, 134, 'resource', NULL, NULL, NULL, 1),
(441, 129, 356, 135, 'resource', NULL, NULL, NULL, 1),
(442, 131, 403, 133, 'resource', NULL, NULL, NULL, 1),
(443, 131, 403, 132, 'resource', NULL, NULL, NULL, 1),
(444, 135, 403, 136, 'resource', NULL, NULL, NULL, 1),
(445, 139, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Articolo', NULL, 1),
(446, 140, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Autore', NULL, 1),
(447, 141, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Diocesi', NULL, 1),
(448, 142, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Dipendenze', NULL, 1),
(449, 143, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Cronologia', NULL, 1),
(450, 144, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Committenza', NULL, 1),
(451, 145, 1, NULL, 'literal', '', 'San Bernardo a Castelletto: Funzione', NULL, 1),
(452, 146, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Fonte Berra 1995', NULL, 1),
(453, 147, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Fonte Comba 1972', NULL, 1),
(454, 148, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Fonte Ristorto 1977', NULL, 1),
(455, 149, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Fonte Brezzi Rossetti 1987', NULL, 1),
(456, 150, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Fonte Anonima', NULL, 1),
(457, 151, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Fonte Gazzola 2007', NULL, 1),
(458, 140, 400, NULL, 'literal', '', '[Autore].  Gelsomina Spione', NULL, 1),
(459, 146, 400, NULL, 'literal', '', '[Berra 1995] L. Berra, Riordinamento delle Diocesi di Mondovì, Saluzzo, Alba e Fossano ed erezione della Diocesi di Cuneo nel 1817, in “Bollettino della Società per gli Studi Storici, Archeologici e Artistici della Provincia di Cuneo”, 36, 1955, p. 51.', NULL, 1),
(460, 141, 400, NULL, 'literal', '', '[Diocesi]: Diocesi di Asti; dal 1430 Diocesi di Mondovì e in seguito alla riorganizzazione post-napoleonica (1817) passa sotto la Diocesi di Cuneo.', NULL, 1),
(461, 141, 403, 146, 'resource', NULL, NULL, NULL, 1),
(462, 147, 400, NULL, 'literal', '', '[Fonte].  R. Comba, Due resoconti inediti della castellania di Cuneo (1388-1409), in “Bollettino della Società per gli Studi Storici, Archeologici e Artistici della Provincia di Cuneo” , 67, 1972, pp. 32-33].', NULL, 1),
(463, 148, 400, NULL, 'literal', '', '[Fonte]. M. Ristorto, Castelletto Stura. Storia civile e religiosa, Cuneo 1977, pp. 56-73; G. Comino, Castelletto Stura, 1998 https://www.archiviocasalis.it/localized-install/content/castelletto-stura]. ', NULL, 1),
(464, 142, 400, NULL, 'literal', '', '[Dipendenze] Dal 1430 il territorio di Castelletto è assorbito in quello di più vasta pertinenza della “villanova” di Cuneo Nel 1619 Castelletto è infeudato ad Amedeo Ponte di Scarnafigi; nel 1661passa a Francesco Bartolomeo Sandri Trotti, marchese di Montanera, che nel 1668 lo vende a Giovanni Battista Lamberti, famiglia a cui apparterrà fino al periodo della conquista francese.', NULL, 1),
(465, 142, 403, 147, 'resource', NULL, NULL, NULL, 1),
(466, 142, 403, 148, 'resource', NULL, NULL, NULL, 1),
(467, 149, 400, NULL, 'literal', '', '[Brezzi Rossetti 1987] E. Brezzi Rossetti, Giovanni Mazzucco, in La Pittura in Italia. Il Quattrocento, Milano 1987, pp. 708-709]', NULL, 1),
(468, 143, 400, NULL, 'literal', '', '[Cronologia]: sulla base della lettura dei dati di stile, la cronologia di esecuzione cade intorno al 1480.', NULL, 1),
(469, 143, 403, 149, 'resource', NULL, NULL, NULL, 1),
(470, 150, 400, NULL, 'literal', '', '[Anonimo].  La confraternita di Santa Croce di Cuneo concede un aiuto in denaro il 7 marzo 1473.', NULL, 1),
(471, 144, 400, NULL, 'literal', '', '[Committenza]: L’edificazione della cappella e la sua decorazione ad affresco sono realizzati su commissione del parroco del paese con la partecipazione di alcuni notabili (che identifichiamo nelle figure affrescate ai margini della lunetta con l’Incoronazione della Vergine, abbigliate in vesti moderne e più caratterizzate  nella fisionomia rispetto agli altri personaggi), illustri membri della confraternita di Santa Croce, da poco istituita in paese come filiazione della più importante congregazione cuneese.', NULL, 1),
(472, 144, 403, 150, 'resource', NULL, NULL, NULL, 1),
(473, 151, 400, NULL, 'literal', '', '[Gazzola 2007] G.M. Gazzola, San Bernardo nel tessuto rituale di Castelletto Stura. La vita devozionale di un borgo rurale dal Medioevo a oggi, in in Il restauro della cappella di San Bernardo a Castelletto Stura, Cuneo 2007, pp. 101-110].', NULL, 1),
(474, 145, 400, NULL, 'literal', '', '[Funzione] La cappella di San Bernardo, nelle pratiche di devozione del paese, è una delle tappe del percorso processionale che legava i luoghi sacri del paese : la chiesa parrocchiale, l’oratorio di San Sebastiano e quindi la cappella di San Bernardo che con la sua struttura aperta accoglieva per una breve sosta la processione.  A questo itinerario si aggiunge la cappella di Sant’Anna edificata dopo la peste che afflisse il territorio tra il 1520 e il 1526 (dopo la peste del 1630 la cappella assocerà al titolo di Sant’Anna, quello di San Sebastiano, nuovo santo invocato contro il flagello). Nel Seicento si aggiungeranno altre due cappelle, Sant’Anna e San Grato, sulla strada verso Cuneo, e quella intitolata a San Francesco Saverio sulla strada verso Montanera. Il paese era così tutelato da santi in ogni strada di accesso, con le cappelle distribuite sui quattro punti cardinali.', NULL, 1),
(475, 145, 403, 151, 'resource', NULL, NULL, NULL, 1),
(476, 139, 400, NULL, 'literal', '', '[Articolo]: San Bernardo a Castelletto Stura', NULL, 1),
(477, 139, 357, 140, 'resource', NULL, NULL, NULL, 1),
(478, 139, 373, 141, 'resource', NULL, NULL, NULL, 1),
(479, 139, 366, 142, 'resource', NULL, NULL, NULL, 1),
(480, 139, 359, 143, 'resource', NULL, NULL, NULL, 1),
(481, 139, 361, 144, 'resource', NULL, NULL, NULL, 1),
(482, 139, 404, 145, 'resource', NULL, NULL, NULL, 1),
(483, 152, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Iconografia', NULL, 1),
(484, 153, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Artista', NULL, 1),
(485, 154, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Geografia artistica', NULL, 1),
(486, 155, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Attribuzioni per stile', NULL, 1),
(487, 156, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Circolazione', NULL, 1),
(488, 157, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Fonte Quasimodo 2007', NULL, 1),
(490, 159, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Fonte Marino 2007', NULL, 1),
(491, 157, 400, NULL, 'literal', '', ' [Quasimodo 2007] F. Quasimodo, Tra Inferno e Paradiso. L’iconografia degli affreschi, in Il restauro della cappella di San Bernardo a Castelletto Stura, Cuneo 2007, pp.37-58].', NULL, 1),
(492, 159, 400, NULL, 'literal', '', ' [Fonte]. L. Marino, Sulle tracce di Giovanni Mazzucco. Biografia, stile, confronti, in Il restauro della cappella di San Bernardo a Castelletto Stura, Cuneo 2007, pp.59-78].', NULL, 1),
(493, 152, 400, NULL, 'literal', '', '[Iconografia]. Le figure dipinte sulle pareti riassumono alcuni dei temi della spiritualità propria delle confraternite dedicate alla Santa Croce: è una vera narrazione per immagini. \nSulla volta, le scene della Passione del Signore, con una forte accento sulle pratiche della penitenza, richiamano l’uso della flagellazione attuata dai confratelli in alcune processioni, l’Inferno e il Paradiso, sono l’esito del Giudizio Universale che i predicatori del tempo andavano preannunciando.  Ai piedi di queste scene si trovano le sequenze della Cavalcata dei vizi (in relazione con l’Inferno) e le Opere di misericordia (in relazione con il Paradiso).  Le teorie dei Santi (all’interno e sulla facciata) accompagnavano le litanie che ritmavano il cammino processionale in salmi penitenziali o il “Te Deum”, a seconda della festività).', NULL, 1),
(494, 152, 403, 157, 'resource', NULL, NULL, NULL, 1),
(495, 153, 400, NULL, 'literal', '', ' [ARTISTA] Gli affreschi sono assegnati, sulla base dei dati di stile a  Giovanni Mazzucco, un pittore attivo in area monregalese nella seconda metà del Quattrocento.', NULL, 1),
(496, 153, 403, 149, 'resource', NULL, NULL, NULL, 1),
(497, 154, 400, NULL, 'literal', '', ' [GEOGRAFIA ARTISTICA] La prima data utile per ricostruire l’ attività di Giovanni Mazzucco è il 1481, quando firma gli affreschi della cappella del Santo Sepolcro a Piozzo. Nel 1487 decora la chiesa di San Domenico a Peveragno. Al  1491  risale l’ultima opera firmata da Mazzucco, realizzata nel santuario del Brichetto a Morozzo, su commissione di Biagio Fauzone. Questo nucleo di affreschi tutti firmati da Giovanni Mazzucco, sono la base di riferimento per assegnare, al pittore e alla sua bottega, altre opere, affini per i dati di stile.', NULL, 1),
(498, 154, 403, 159, 'resource', NULL, NULL, NULL, 1),
(499, 155, 400, NULL, 'literal', '', '[OPERE ATTRIBUITE PER CONFRONTI STILISTICI] Le attribuzioni più convincenti sono: un frammento con la Madonna con Bambino tra sant’Antonio abate e san Giovanni Battista,  nella cappella di Sant’Antonio a San Michele Mondovì (1480); il trittico con la Madonna con il Bambino e san Pietro e sant’Antonio, nella cappella di San Pietro in Roncaglia a Benevagienna (commissionato nel 1485 dai fratelli Andrea e Giuliano de Capelinis); il polittico con la Madonna col Bambino e santi nella cappella di San Bernardino a San Michele Mondovì (1488) e la decorazione nell’ex convento dei domenicani nella frazione Bertini di Roccaforte Mondovì (circa 1480).', NULL, 1),
(500, 155, 403, 159, 'resource', NULL, NULL, NULL, 1),
(501, 156, 400, NULL, 'literal', '', '[AMBITO/FORTUNA] Un gruppo di affreschi, da datare intorno alla seconda metà del Quattrocento,  appaiono vicini allo stile del Mazzucco, ma non sono direttamente opera del pittore o della sua bottega. E’ il caso della Crocifissione  nell’antica sacrestia di Niella Tanaro; la Madonna col Bambino nel Santuario del Pasco a Villanova Mondovì: sono segni della fortuna di cui gode il linguaggio del pittore. ', NULL, 1),
(502, 156, 403, 159, 'resource', NULL, NULL, NULL, 1),
(503, 139, 369, 152, 'resource', NULL, NULL, NULL, 1),
(504, 139, 354, 153, 'resource', NULL, NULL, NULL, 1),
(505, 139, 356, 154, 'resource', NULL, NULL, NULL, 1),
(506, 139, 355, 156, 'resource', NULL, NULL, NULL, 1),
(507, 139, 363, 155, 'resource', NULL, NULL, NULL, 1),
(508, 160, 1, NULL, 'literal', '', 'Valle Gesso – Strade di transito: Articolo', NULL, 1),
(509, 161, 1, NULL, 'literal', '', 'Valle Gesso – Strade di transito: Autore', NULL, 1),
(510, 162, 1, NULL, 'literal', '', 'Valle Gesso – Strade di transito: Quadro politico', NULL, 1),
(512, 164, 1, NULL, 'literal', '', 'Valle Gesso – Strade di transito: Area di transito', NULL, 1),
(513, 165, 1, NULL, 'literal', '', 'Valle Gesso – Strade di transito: Fonte Fontana 2013', NULL, 1),
(514, 166, 1, NULL, 'literal', '', 'Valle Gesso – Strade di transito: Fonte Collidà et al. 1982', NULL, 1),
(515, 166, 400, NULL, 'literal', '', '[Collidà et al. 1982] F. Collidà, M. Gallo, A. Mola,  Cuneo-Nizza: storia di una ferrovia, Cuneo 1982.', NULL, 1),
(516, 165, 400, NULL, 'literal', '', '[Fontana 2013] J.-L. Fontana, Les capitulations des forts de Nice, Villafranche et Mont-Alban, in Au Coeur des Alpes: Utrecht, actes du colloque de Jausiers, Colmars et Etraunes 14,15,16 Septembre 2012, Barcellonette 2013.', NULL, 1),
(518, 164, 400, NULL, 'literal', '', '[Area di transito]. Gli itinerari che si diramano verso la Francia sono due.\nIl primo da Borgo San Dalmazzo attraversava la valle Vermenagna e valicava il colle di Tenda in direzione di Nizza. Percorreva la valle Roya fino a Breglio e per il colle del Brouis raggiungeva Sospello; da qui valicando il Braus, scendeva a L’Escarene e sbucava a Nizza.\nQuesto itinerario, con alcune varianti, sarà modificato tra il 1610 e il 1714, assumendo il nome di Route Royale (Strada Reale), percorribile da carri e artiglierie. Tra il 1780 e il 1788, sono realizzati nuovi lavori di ampliamento e la via del Tenda diventa la prima strada carrozzabile che attraversa le Alpi. Le trasformazioni  facilitano gli scambi commerciali a scapito del meno agevole Colle di Finestra. Dal 1815, tramontata l’occupazione francese (1792-1815), Vittorio Emanuele I fa istituire il primo servizio di trasporto pubblico da Torino a Nizza, con diligenze trisettimanali.\nNel 1882, l’apertura del tunnel al di sotto del valico tronca l’importanza  dell’antica via commerciale del sale. Alla sua inaugurazione, il traforo del Colle di Tenda era il tunnel  stradale più lungo mai costruito (3182 m). Nel 1898 è ultimata anche una galleria ferroviaria, molto più lunga di quella stradale  (8099 m). \nIl secondo percorso, parallelo alla via del Colle di Tenda, imboccava la valle Gesso e salendo ad Entracque valicava il colle delle Finestre e si immetteva nella val Vésubie, attraversava St. Martin e Lantosca. Da qui si snodavano due tragitti per Nizza: uno passante per Lévens e l’altro per Utelle. ', NULL, 1),
(519, 164, 403, 165, 'resource', NULL, NULL, NULL, 1),
(520, 164, 403, 166, 'resource', NULL, NULL, NULL, 1),
(521, 162, 400, NULL, 'literal', '', '[Quadro politico]. Per evitare gli esosi pedaggi imposti dai signori di Tenda alle merci che transitavano nei territori da loro controllati, I Savoia cercano un percorso alternativo alla strada del Col di Tenda per raggiungere Nizza. L’itinerario scelto dai Savoia è quello che attraversava la valle Gesso, e il Colle di Finestra, forse meno agevole, ma utile ad evitare i pedaggi (1200 scudi all’anno solo per il trasporto del sale) e quindi molto praticato. favorendo così, a partire dalla seconda metà del secolo XV, lo sviluppo economico della Valle e di Entracque. E’ un percorso che verso la metà del Quattrocento era stato addirittura raddoppiato, con il velleitario e un po’ folle progetto attuato da Paganino Dal Pozzo attraverso il colle che oggi da lui prende il nome, il Pagarì, e che supera i 2800 metri di altitudine. \nVa tuttavia detto che, nonostante i pedaggi imposti, la strada del colle di Tenda, attraverso la valle Roya, rimase la strada più battuta, perché più vantaggiosa rispetto agli altri itinerari sia per la minor altitudine che per la migliore percorribilità durante i mesi invernali.\nCon l’annessione nel 1579 della contea di Tenda ai domini dei Savoia, la strada del sale, da Torino a Nizza per il col di Tenda,  si libera dai dazi che fino a quel momento i signori di Tenda avevano infitto al traffico delle merci e diventa la via principale per traffici e comunicazioni. E’ l’avvio della crisi di Entracque, e del suo territorio,  escluso dalla scelta di privilegiare la via passante per Limone e la val Roia per il trasporto di merci e per il rifornimento di sale, a scapito del più problematico collegamento attraverso gli alti passi della val Gesso.', NULL, 1),
(523, 161, 400, NULL, 'literal', '', '[Autore].  Gelsomina Spione', NULL, 1),
(524, 160, 400, NULL, 'literal', '', 'Article: Valle Gesso – Strade di transito', NULL, 1),
(525, 160, 377, 162, 'resource', NULL, NULL, NULL, 1),
(526, 160, 402, 164, 'resource', NULL, NULL, NULL, 1),
(527, 167, 1, NULL, 'literal', '', 'HSG site items', NULL, 1),
(528, 134, 371, 13, 'resource', NULL, NULL, NULL, 1),
(529, 130, 371, 10, 'resource', NULL, NULL, NULL, 1),
(530, 130, 371, 14, 'resource', NULL, NULL, NULL, 1),
(531, 164, 371, 72, 'resource', NULL, NULL, NULL, 1),
(532, 164, 371, 10, 'resource', NULL, NULL, NULL, 1),
(537, 134, 371, 19, 'resource', NULL, NULL, NULL, 1),
(538, 134, 371, 21, 'resource', NULL, NULL, NULL, 1),
(539, 134, 371, 20, 'resource', NULL, NULL, NULL, 1),
(540, 131, 403, 168, 'resource', NULL, NULL, NULL, 1),
(541, 131, 371, 7, 'resource', NULL, NULL, NULL, 1),
(542, 131, 371, 15, 'resource', NULL, NULL, NULL, 1),
(543, 121, 393, 130, 'resource', NULL, NULL, NULL, 1),
(544, 130, 393, 131, 'resource', NULL, NULL, NULL, 1),
(545, 131, 371, 6, 'resource', NULL, NULL, NULL, 1),
(546, 134, 393, 135, 'resource', NULL, NULL, NULL, 1),
(547, 140, 393, 141, 'resource', NULL, NULL, NULL, 1),
(548, 141, 393, 142, 'resource', NULL, NULL, NULL, 1),
(549, 142, 393, 143, 'resource', NULL, NULL, NULL, 1),
(550, 143, 393, 144, 'resource', NULL, NULL, NULL, 1),
(551, 144, 403, 187, 'resource', NULL, NULL, NULL, 1),
(552, 145, 403, 186, 'resource', NULL, NULL, NULL, 1),
(553, 152, 403, 184, 'resource', NULL, NULL, NULL, 1),
(554, 153, 393, 154, 'resource', NULL, NULL, NULL, 1),
(555, 154, 403, 198, 'resource', NULL, NULL, NULL, 1),
(556, 155, 403, 195, 'resource', NULL, NULL, NULL, 1),
(557, 161, 393, 162, 'resource', NULL, NULL, NULL, 1),
(558, 162, 393, 164, 'resource', NULL, NULL, NULL, 1),
(559, 168, 1, NULL, 'literal', '', 'Ex voto Chiesa Santa Croce Entracque', NULL, 1),
(560, 169, 1, NULL, 'literal', NULL, 'Ex voto 1 ', NULL, 1),
(561, 170, 1, NULL, 'literal', NULL, 'Ex voto 2', NULL, 1),
(562, 131, 393, 134, 'resource', NULL, NULL, NULL, 1),
(563, 168, 4, NULL, 'literal', '', 'Ex voto conservati nella Chiesa di Santa Croce a Entracque.', NULL, 1),
(564, 171, 1, NULL, 'literal', '', 'Confraternita di Santa Croce a Entracque: riferimento ex voto Chiesa Santa Croce', NULL, 1),
(565, 172, 1, NULL, 'literal', '', 'Palmero 2008', NULL, 1),
(566, 173, 1, NULL, 'literal', NULL, 'Entracque Casalis', NULL, 1),
(567, 132, 406, 172, 'resource', NULL, NULL, NULL, 1),
(568, 171, 406, 168, 'resource', NULL, NULL, NULL, 1),
(570, 174, 1, NULL, 'literal', '', 'I pittori Bruno', NULL, 1),
(571, 174, 4, NULL, 'literal', '', 'Paragrafo sui pittori Bruno tratto dal saggio di Massimo Bartoletti, Tra Cuneo, le sue valli, la Riviera di Ponente e il Nizzardo durante il Seicento, in Cantieri e documenti del Barocco. Cuneo e le sue valli, a cura di G. Romano, G. Spione,  catalogo della mostra, Cuneo 2003.', NULL, 1),
(572, 175, 1, NULL, 'literal', NULL, 'PDF del paragrafo', NULL, 1),
(573, 176, 1, NULL, 'literal', '', 'Confraternita di Santa Croce \na Entracque: i pittori Bruno', NULL, 1),
(574, 176, 4, NULL, 'literal', '', 'Riferimento a documento testuale', NULL, 1),
(575, 176, 400, NULL, 'literal', '', 'Massimo Bartoletti, Tra Cuneo, le sue valli, la Riviera di Ponente e il Nizzardo durante il Seicento, in Cantieri e documenti del Barocco. Cuneo e le sue valli, a cura di G. Romano, G. Spione,  catalogo della mostra, Cuneo 2003 (nello specifico il paragrafo sui pittori Bruno ).', NULL, 1),
(576, 176, 406, 174, 'resource', NULL, NULL, NULL, 1),
(577, 177, 1, NULL, 'literal', '', 'Valle Gesso – Strade di transito: Fonte Palmero 1995', NULL, 1),
(578, 177, 400, NULL, 'literal', '', 'Fonte]. B. Palmero, Consenso e contrattazione politica lungo la direttrice del col di Tenda (1586-1754). I comuni della val Roya e la progettazione della strada, in Bollettino storico Bibliografico subalpino, XCIII, 1995, pp. 507-546].', NULL, 1),
(579, 178, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Fonte scene della Passione del Signore', NULL, 1),
(580, 179, 1, NULL, 'literal', NULL, 'Scene della Passione del Signore', NULL, 1),
(581, 180, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Fonte l’Inferno e il Paradiso', NULL, 1),
(582, 181, 1, NULL, 'literal', NULL, 'L’Inferno e il Paradiso', NULL, 1),
(583, 182, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Fonte teorie dei Santi all’interno', NULL, 1),
(584, 183, 1, NULL, 'literal', NULL, 'Teorie dei Santi all’interno ', NULL, 1),
(585, 184, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Fonte teorie dei Santi sulla facciata', NULL, 1),
(586, 185, 1, NULL, 'literal', NULL, 'Teorie dei Santi sulla facciata', NULL, 1),
(587, 152, 403, 182, 'resource', NULL, NULL, NULL, 1),
(588, 152, 403, 180, 'resource', NULL, NULL, NULL, 1),
(589, 152, 403, 178, 'resource', NULL, NULL, NULL, 1),
(590, 152, 393, 153, 'resource', NULL, NULL, NULL, 1),
(591, 186, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Fonte Cappella San Bernardo', NULL, 1),
(592, 186, 121, NULL, 'uri', NULL, '', 'https://www.cittaecattedrali.it/it/bces/217-cappella-di-san-bernardo#', 1),
(593, 187, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Fonte figure affrescate ai margini della lunetta con l’Incoronazione della Vergine', NULL, 1),
(594, 188, 1, NULL, 'literal', NULL, 'Figure affrescate ai margini della lunetta con l’Incoronazione della Vergine', NULL, 1),
(595, 145, 393, 152, 'resource', NULL, NULL, NULL, 1),
(596, 144, 393, 145, 'resource', NULL, NULL, NULL, 1),
(597, 189, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Fonte la Madonna con Bambino tra sant’Antonio abate e san Giovanni Battista,  nella cappella di Sant’Antonio a San Michele Mondovì ', NULL, 1),
(598, 190, 1, NULL, 'literal', NULL, 'Madonna con Bambino tra sant’Antonio abate e san Giovanni Battista, nella cappella di Sant’Antonio a San Michele Mondovì ', NULL, 1),
(599, 191, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Fonte trittico con la Madonna con il Bambino e san Pietro e sant’Antonio, nella cappella di San Pietro in Roncaglia a Benevagienna', NULL, 1),
(600, 192, 1, NULL, 'literal', NULL, 'Trittico con la Madonna con il Bambino e san Pietro e sant’Antonio, nella cappella di San Pietro in Roncaglia a Benevagienna', NULL, 1),
(601, 193, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Fonte polittico con la Madonna col Bambino e santi nella cappella di San Bernardino a San Michele Mondovì', NULL, 1),
(602, 194, 1, NULL, 'literal', NULL, 'Polittico con la Madonna col Bambino e santi nella cappella di San Bernardino a San Michele Mondovì', NULL, 1),
(603, 195, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Fonte decorazione nell’ex convento dei domenicani nella frazione Bertini di Roccaforte Mondovì', NULL, 1),
(604, 196, 1, NULL, 'literal', NULL, 'Decorazione nell’ex convento dei domenicani nella frazione Bertini di Roccaforte Mondovì', NULL, 1),
(605, 155, 403, 193, 'resource', NULL, NULL, NULL, 1),
(606, 155, 403, 191, 'resource', NULL, NULL, NULL, 1),
(607, 155, 403, 189, 'resource', NULL, NULL, NULL, 1),
(608, 155, 393, 156, 'resource', NULL, NULL, NULL, 1),
(609, 197, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Fonte santuario del Brichetto a Morozzo', NULL, 1),
(610, 197, 121, NULL, 'uri', NULL, '', 'https://www.cittaecattedrali.it/it/bces/104-santuario-della-madonna-del-brichetto', 1),
(611, 198, 1, NULL, 'literal', '', 'San Bernardo a Castelletto Stura: Fonte Cappella del Santo Sepolcro a Piozzo', NULL, 1),
(612, 198, 121, NULL, 'uri', NULL, '', 'https://www.cittaecattedrali.it/it/bces/409-cappella-santo-sepolcro', 1),
(613, 154, 403, 197, 'resource', NULL, NULL, NULL, 1),
(614, 154, 393, 155, 'resource', NULL, NULL, NULL, 1),
(615, 199, 1, NULL, 'literal', '', 'Brezzi Rossetti 1987', NULL, 1),
(616, 200, 1, NULL, 'literal', NULL, 'Biografia di Giovanni Mazzucco', NULL, 1),
(617, 149, 406, 199, 'resource', NULL, NULL, NULL, 1),
(618, 201, 1, NULL, 'literal', '', 'Ristorto 1977', NULL, 1),
(619, 201, 121, NULL, 'uri', NULL, '', 'https://www.archiviocasalis.it/localized-install/content/castelletto-stura ', 1),
(620, 202, 1, NULL, 'literal', NULL, 'Ristorto 1977 pdf', NULL, 1),
(621, 148, 406, 201, 'resource', NULL, NULL, NULL, 1),
(622, 203, 1, NULL, 'literal', NULL, 'Diocesi Provincia di Cuneo 1511', NULL, 1),
(623, 204, 1, NULL, 'literal', NULL, 'Diocesi Provincia di Cuneo 1817', NULL, 1),
(624, 205, 1, NULL, 'literal', NULL, 'Foto Inaugurazione tunnel stradale Tenda', NULL, 1),
(625, 206, 1, NULL, 'literal', NULL, 'Foto Inaugurazione tunnel ferroviario Tenda', NULL, 1),
(626, 207, 1, NULL, 'literal', NULL, 'Mappa trasporto pubblico Torino-Nizza', NULL, 1),
(627, 208, 1, NULL, 'literal', '', 'Mappa Itinerari terre cisalpine - Francia', NULL, 1),
(628, 209, 1, NULL, 'literal', NULL, 'Due itinerari terre cisalpine - Francia ', NULL, 1),
(629, 73, 406, 208, 'resource', NULL, NULL, NULL, 1),
(630, 72, 406, 208, 'resource', NULL, NULL, NULL, 1),
(631, 210, 1, NULL, 'literal', '', 'Valle Gesso – Strade di transito: Itinerari terre cisalpine - Francia', NULL, 1),
(632, 211, 1, NULL, 'literal', NULL, 'Figura 2: Mappa itinerari verso la Francia', NULL, 1),
(633, 210, 406, 208, 'resource', NULL, NULL, NULL, 1),
(634, 212, 1, NULL, 'literal', '', 'Confraternita di Santa Croce \na Entracque: Confronto chiese Santa Croce', NULL, 1),
(635, 212, 371, 16, 'resource', NULL, NULL, NULL, 1),
(636, 212, 371, 7, 'resource', NULL, NULL, NULL, 1),
(637, 213, 1, NULL, 'literal', NULL, 'Confronto chiese Santa Croce', NULL, 1),
(638, 214, 1, NULL, 'literal', '', 'Confraternita di Santa Croce \na Entracque: Bartoletti 2003', NULL, 1),
(639, 214, 400, NULL, 'literal', '', '[Bartoletti 2003] Massimo Bartoletti, Tra Cuneo, le sue valli, la Riviera di Ponente e il Nizzardo durante il Seicento, in Cantieri e documenti del Barocco. Cuneo e le sue valli, a cura di G. Romano, G. Spione,  catalogo della mostra, Cuneo 2003 (nello specifico il paragrafo su i pittori Bruno ).', NULL, 1),
(640, 215, 1, NULL, 'literal', NULL, 'I pittori Bruno', NULL, 1),
(641, 134, 403, 214, 'resource', NULL, NULL, NULL, 1),
(642, 134, 403, 212, 'resource', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `vocabulary`
--

CREATE TABLE `vocabulary` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `namespace_uri` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(3, NULL, 'http://purl.org/ontology/bibo/', 'bibo', 'Bibliographic Ontology', 'Bibliographic metadata (BIBO)'),
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)'),
(9, 1, 'http://purl.org/hsg#', 'hsg', 'HiStoryGraphia', '');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `api_key`
--
ALTER TABLE `api_key`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C912ED9D7E3C61F9` (`owner_id`);

--
-- Indici per le tabelle `asset`
--
ALTER TABLE `asset`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2AF5A5C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_2AF5A5C7E3C61F9` (`owner_id`);

--
-- Indici per le tabelle `datavis_vis`
--
ALTER TABLE `datavis_vis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A4B1D3067E3C61F9` (`owner_id`),
  ADD KEY `IDX_A4B1D306F6BD1646` (`site_id`);

--
-- Indici per le tabelle `data_type_geography`
--
ALTER TABLE `data_type_geography`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9107FC8E89329D25` (`resource_id`),
  ADD KEY `IDX_9107FC8E549213EC` (`property_id`),
  ADD SPATIAL KEY `idx_value` (`value`);

--
-- Indici per le tabelle `data_type_geometry`
--
ALTER TABLE `data_type_geometry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A9EF3D7D89329D25` (`resource_id`),
  ADD KEY `IDX_A9EF3D7D549213EC` (`property_id`),
  ADD SPATIAL KEY `idx_value` (`value`);

--
-- Indici per le tabelle `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD PRIMARY KEY (`id`,`resource`),
  ADD KEY `IDX_AA31FE4A7E3C61F9` (`owner_id`);
ALTER TABLE `fulltext_search` ADD FULLTEXT KEY `IDX_AA31FE4A2B36786B3B8BA7C7` (`title`,`text`);

--
-- Indici per le tabelle `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD PRIMARY KEY (`item_id`,`item_set_id`),
  ADD KEY `IDX_6D0C9625126F525E` (`item_id`),
  ADD KEY `IDX_6D0C9625960278D7` (`item_set_id`);

--
-- Indici per le tabelle `item_set`
--
ALTER TABLE `item_set`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `item_site`
--
ALTER TABLE `item_site`
  ADD PRIMARY KEY (`item_id`,`site_id`),
  ADD KEY `IDX_A1734D1F126F525E` (`item_id`),
  ADD KEY `IDX_A1734D1FF6BD1646` (`site_id`);

--
-- Indici per le tabelle `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FBD8E0F87E3C61F9` (`owner_id`);

--
-- Indici per le tabelle `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6A2CA10C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_6A2CA10C126F525E` (`item_id`),
  ADD KEY `item_position` (`item_id`,`position`);

--
-- Indici per le tabelle `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indici per le tabelle `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `password_creation`
--
ALTER TABLE `password_creation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C77917B4A76ED395` (`user_id`);

--
-- Indici per le tabelle `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8BF21CDEAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_8BF21CDE7E3C61F9` (`owner_id`),
  ADD KEY `IDX_8BF21CDEAD0E05F6` (`vocabulary_id`);

--
-- Indici per le tabelle `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BC91F4167E3C61F9` (`owner_id`),
  ADD KEY `IDX_BC91F416448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_BC91F41616131EA` (`resource_template_id`),
  ADD KEY `IDX_BC91F416FDFF2E92` (`thumbnail_id`);

--
-- Indici per le tabelle `resource_class`
--
ALTER TABLE `resource_class`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C6F063ADAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_C6F063AD7E3C61F9` (`owner_id`),
  ADD KEY `IDX_C6F063ADAD0E05F6` (`vocabulary_id`);

--
-- Indici per le tabelle `resource_template`
--
ALTER TABLE `resource_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_39ECD52EEA750E8` (`label`),
  ADD KEY `IDX_39ECD52E7E3C61F9` (`owner_id`),
  ADD KEY `IDX_39ECD52E448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_39ECD52E724734A3` (`title_property_id`),
  ADD KEY `IDX_39ECD52EB84E0D1D` (`description_property_id`);

--
-- Indici per le tabelle `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_4689E2F116131EA549213EC` (`resource_template_id`,`property_id`),
  ADD KEY `IDX_4689E2F116131EA` (`resource_template_id`),
  ADD KEY `IDX_4689E2F1549213EC` (`property_id`);

--
-- Indici per le tabelle `search_config`
--
ALTER TABLE `search_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D684063E78C9C0A` (`engine_id`);

--
-- Indici per le tabelle `search_engine`
--
ALTER TABLE `search_engine`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `search_suggester`
--
ALTER TABLE `search_suggester`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F64D915AE78C9C0A` (`engine_id`);

--
-- Indici per le tabelle `search_suggestion`
--
ALTER TABLE `search_suggestion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_536C3D170913F08` (`suggester_id`),
  ADD KEY `search_text_idx` (`text`,`suggester_id`);
ALTER TABLE `search_suggestion` ADD FULLTEXT KEY `IDX_536C3D13B8BA7C7` (`text`);

--
-- Indici per le tabelle `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_694309E4989D9B62` (`slug`),
  ADD UNIQUE KEY `UNIQ_694309E4571EDDA` (`homepage_id`),
  ADD KEY `IDX_694309E47E3C61F9` (`owner_id`),
  ADD KEY `IDX_694309E4FDFF2E92` (`thumbnail_id`);

--
-- Indici per le tabelle `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_236473FEE9ED820C` (`block_id`),
  ADD KEY `IDX_236473FE126F525E` (`item_id`),
  ADD KEY `IDX_236473FEEA9FDD75` (`media_id`),
  ADD KEY `block_position` (`block_id`,`position`);

--
-- Indici per le tabelle `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D4CE134F6BD1646960278D7` (`site_id`,`item_set_id`),
  ADD KEY `IDX_D4CE134F6BD1646` (`site_id`),
  ADD KEY `IDX_D4CE134960278D7` (`item_set_id`),
  ADD KEY `position` (`position`);

--
-- Indici per le tabelle `site_page`
--
ALTER TABLE `site_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2F900BD9F6BD1646989D9B62` (`site_id`,`slug`),
  ADD KEY `IDX_2F900BD9F6BD1646` (`site_id`);

--
-- Indici per le tabelle `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C593E731C4663E4` (`page_id`),
  ADD KEY `page_position` (`page_id`,`position`);

--
-- Indici per le tabelle `site_permission`
--
ALTER TABLE `site_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C0401D6FF6BD1646A76ED395` (`site_id`,`user_id`),
  ADD KEY `IDX_C0401D6FF6BD1646` (`site_id`),
  ADD KEY `IDX_C0401D6FA76ED395` (`user_id`);

--
-- Indici per le tabelle `site_setting`
--
ALTER TABLE `site_setting`
  ADD PRIMARY KEY (`id`,`site_id`),
  ADD KEY `IDX_64D05A53F6BD1646` (`site_id`);

--
-- Indici per le tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Indici per le tabelle `user_setting`
--
ALTER TABLE `user_setting`
  ADD PRIMARY KEY (`id`,`user_id`),
  ADD KEY `IDX_C779A692A76ED395` (`user_id`);

--
-- Indici per le tabelle `value`
--
ALTER TABLE `value`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1D77583489329D25` (`resource_id`),
  ADD KEY `IDX_1D775834549213EC` (`property_id`),
  ADD KEY `IDX_1D7758344BC72506` (`value_resource_id`),
  ADD KEY `value` (`value`(190)),
  ADD KEY `uri` (`uri`(190));

--
-- Indici per le tabelle `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9099C97B9B267FDF` (`namespace_uri`),
  ADD UNIQUE KEY `UNIQ_9099C97B93B1868E` (`prefix`),
  ADD KEY `IDX_9099C97B7E3C61F9` (`owner_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `asset`
--
ALTER TABLE `asset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `datavis_vis`
--
ALTER TABLE `datavis_vis`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `data_type_geography`
--
ALTER TABLE `data_type_geography`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `data_type_geometry`
--
ALTER TABLE `data_type_geometry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la tabella `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=408;

--
-- AUTO_INCREMENT per la tabella `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;

--
-- AUTO_INCREMENT per la tabella `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=455;

--
-- AUTO_INCREMENT per la tabella `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT per la tabella `search_config`
--
ALTER TABLE `search_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `search_engine`
--
ALTER TABLE `search_engine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `search_suggester`
--
ALTER TABLE `search_suggester`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `search_suggestion`
--
ALTER TABLE `search_suggestion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `site_item_set`
--
ALTER TABLE `site_item_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `site_page`
--
ALTER TABLE `site_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `site_page_block`
--
ALTER TABLE `site_page_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `site_permission`
--
ALTER TABLE `site_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `value`
--
ALTER TABLE `value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=643;

--
-- AUTO_INCREMENT per la tabella `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `api_key`
--
ALTER TABLE `api_key`
  ADD CONSTRAINT `FK_C912ED9D7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Limiti per la tabella `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `FK_2AF5A5C7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `datavis_vis`
--
ALTER TABLE `datavis_vis`
  ADD CONSTRAINT `FK_A4B1D3067E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_A4B1D306F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `data_type_geography`
--
ALTER TABLE `data_type_geography`
  ADD CONSTRAINT `FK_9107FC8E549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_9107FC8E89329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `data_type_geometry`
--
ALTER TABLE `data_type_geometry`
  ADD CONSTRAINT `FK_A9EF3D7D549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A9EF3D7D89329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD CONSTRAINT `FK_AA31FE4A7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_1F1B251EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD CONSTRAINT `FK_6D0C9625126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6D0C9625960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `item_set`
--
ALTER TABLE `item_set`
  ADD CONSTRAINT `FK_1015EEEBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `item_site`
--
ALTER TABLE `item_site`
  ADD CONSTRAINT `FK_A1734D1F126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A1734D1FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_FBD8E0F87E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FK_6A2CA10CBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `password_creation`
--
ALTER TABLE `password_creation`
  ADD CONSTRAINT `FK_C77917B4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_8BF21CDE7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_8BF21CDEAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Limiti per la tabella `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `FK_BC91F41616131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F4167E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `resource_class`
--
ALTER TABLE `resource_class`
  ADD CONSTRAINT `FK_C6F063AD7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_C6F063ADAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Limiti per la tabella `resource_template`
--
ALTER TABLE `resource_template`
  ADD CONSTRAINT `FK_39ECD52E448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E724734A3` FOREIGN KEY (`title_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52EB84E0D1D` FOREIGN KEY (`description_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD CONSTRAINT `FK_4689E2F116131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`),
  ADD CONSTRAINT `FK_4689E2F1549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `search_config`
--
ALTER TABLE `search_config`
  ADD CONSTRAINT `FK_D684063E78C9C0A` FOREIGN KEY (`engine_id`) REFERENCES `search_engine` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `search_suggester`
--
ALTER TABLE `search_suggester`
  ADD CONSTRAINT `FK_F64D915AE78C9C0A` FOREIGN KEY (`engine_id`) REFERENCES `search_engine` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `search_suggestion`
--
ALTER TABLE `search_suggestion`
  ADD CONSTRAINT `FK_536C3D170913F08` FOREIGN KEY (`suggester_id`) REFERENCES `search_suggester` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `FK_694309E4571EDDA` FOREIGN KEY (`homepage_id`) REFERENCES `site_page` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E47E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E4FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD CONSTRAINT `FK_236473FE126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_236473FEE9ED820C` FOREIGN KEY (`block_id`) REFERENCES `site_page_block` (`id`),
  ADD CONSTRAINT `FK_236473FEEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD CONSTRAINT `FK_D4CE134960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D4CE134F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `site_page`
--
ALTER TABLE `site_page`
  ADD CONSTRAINT `FK_2F900BD9F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Limiti per la tabella `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD CONSTRAINT `FK_C593E731C4663E4` FOREIGN KEY (`page_id`) REFERENCES `site_page` (`id`);

--
-- Limiti per la tabella `site_permission`
--
ALTER TABLE `site_permission`
  ADD CONSTRAINT `FK_C0401D6FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C0401D6FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `site_setting`
--
ALTER TABLE `site_setting`
  ADD CONSTRAINT `FK_64D05A53F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `user_setting`
--
ALTER TABLE `user_setting`
  ADD CONSTRAINT `FK_C779A692A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `value`
--
ALTER TABLE `value`
  ADD CONSTRAINT `FK_1D7758344BC72506` FOREIGN KEY (`value_resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D775834549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D77583489329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`);

--
-- Limiti per la tabella `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD CONSTRAINT `FK_9099C97B7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-03-2022 a las 21:42:51
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventariocalidad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `assignment`
--

CREATE TABLE `assignment` (
  `id` int(11) NOT NULL,
  `ranchIdHaciendad` int(11) DEFAULT NULL,
  `userIdUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `assignment`
--

INSERT INTO `assignment` (`id`, `ranchIdHaciendad`, `userIdUsuario`) VALUES
(3, 6, 21),
(4, 6, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `id` int(11) NOT NULL,
  `skuId` int(11) DEFAULT NULL,
  `mermaId` int(11) DEFAULT NULL,
  `cantidad` double NOT NULL,
  `cantidadR` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `caja`
--

INSERT INTO `caja` (`id`, `skuId`, `mermaId`, `cantidad`, `cantidadR`) VALUES
(34, 2, 12, 1080, 4),
(35, 3, 12, 216, 3),
(36, 4, 12, 54, 2),
(37, 1, 13, 1080, 4),
(38, 3, 13, 216, 3),
(39, 4, 13, 54, 2),
(43, 8, 15, 1280, 1),
(44, 4, 15, 20, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajas`
--

CREATE TABLE `cajas` (
  `id` int(11) NOT NULL,
  `marca` varchar(255) NOT NULL,
  `peso` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `mermaId` int(11) DEFAULT NULL,
  `estado` tinyint(4) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calibracion`
--

CREATE TABLE `calibracion` (
  `id` int(11) NOT NULL,
  `numMano` int(11) NOT NULL,
  `calibracion` double NOT NULL,
  `perfilRacimoId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `calibracion`
--

INSERT INTO `calibracion` (`id`, `numMano`, `calibracion`, `perfilRacimoId`) VALUES
(1, 1, 44, 1),
(2, 2, 44, 1),
(3, 3, 43, 1),
(4, 4, 44, 1),
(5, 5, 41, 1),
(6, 6, 40, 1),
(7, 7, 39, 1),
(8, 8, 39, 1),
(9, 9, 38, 1),
(10, 1, 44, 2),
(11, 2, 44, 2),
(12, 3, 42, 2),
(13, 4, 42, 2),
(14, 5, 40, 2),
(15, 6, 39, 2),
(16, 7, 39, 2),
(17, 8, 38, 2),
(18, 9, 47, 2),
(19, 1, 43, 3),
(20, 2, 44, 3),
(21, 3, 42, 3),
(22, 4, 42, 3),
(23, 5, 41, 3),
(24, 6, 40, 3),
(25, 7, 39, 3),
(26, 8, 39, 3),
(27, 9, 38, 3),
(28, 1, 43, 4),
(29, 2, 44, 4),
(30, 3, 43, 4),
(31, 4, 41, 4),
(32, 5, 40, 4),
(33, 6, 39, 4),
(34, 7, 38, 4),
(35, 8, 37, 4),
(36, 9, 37, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `idCategoria` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`idCategoria`, `nombre`) VALUES
(29, 'HERRAMIENTAS'),
(30, 'LIMPIEZA'),
(31, 'LABORATORIO'),
(32, 'EQUIPO DE PROTECCION');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `color` varchar(255) NOT NULL,
  `semana` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `color`
--

INSERT INTO `color` (`id`, `color`, `semana`) VALUES
(1, 'amarillo', NULL),
(2, 'verde', NULL),
(3, 'celeste', NULL),
(4, 'blanco', NULL),
(5, 'negro', NULL),
(6, 'morado', NULL),
(7, 'rojo', NULL),
(8, 'cafe', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `defecto`
--

CREATE TABLE `defecto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `tipoDefectoId` int(11) DEFAULT NULL,
  `siglas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `defecto`
--

INSERT INTO `defecto` (`id`, `nombre`, `tipoDefectoId`, `siglas`) VALUES
(1, 'estropeo de campo', 1, 'SR'),
(2, 'sobre grado', 1, 'OG'),
(3, 'bajo grado', 1, 'UG'),
(4, 'daño de pulpa', 1, 'BR'),
(5, 'daño de piel', 1, 'DP'),
(6, 'estropeo por palillo', 1, 'SP'),
(7, 'cuello roto', 1, 'NI'),
(8, 'corte de cuchareta', 2, 'CH'),
(9, 'corte de cuchillo', 2, 'CT'),
(10, 'estropeo de tina', 2, 'SRT'),
(11, 'daño de punta', 2, 'PS'),
(12, 'dedos buenos no salvables', 3, 'BNS'),
(13, 'cicatriz de crecimiento', 4, 'CC'),
(14, 'latex seco', 4, 'LS'),
(15, 'cicatriz de hoja', 4, 'CHO'),
(16, 'dedo corto', 4, 'TS'),
(17, 'dedo largo', 4, 'NA'),
(18, 'mancha roja', 4, 'RR'),
(19, 'rasguño de animal', 4, 'SC'),
(20, 'specklin', 4, 'SK'),
(21, 'daño de insecto', 4, 'BM'),
(22, 'moquillo', 4, 'TC'),
(23, 'jhonston o muñeca', 4, 'PD'),
(24, 'caterpillar', 4, 'CS'),
(25, 'colaspis', 4, 'BM'),
(26, 'trips', 4, 'TH'),
(27, 'almendra crema', 4, 'AB'),
(28, 'daño de corona', 4, 'CD'),
(29, 'mellizos', 4, 'FF'),
(30, 'mal formados', 5, 'ML'),
(31, 'cascara y dedos rajados', 5, 'SP'),
(32, 'chimera', 5, 'CH'),
(33, 'pacha', 5, 'FF'),
(34, 'decoloración de la cascara', 5, 'UD'),
(35, 'mancha de madurez', 5, 'RR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `desgloce_merma`
--

CREATE TABLE `desgloce_merma` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `perfilRacimoId` int(11) DEFAULT NULL,
  `defectoId` int(11) DEFAULT NULL,
  `peso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `desgloce_merma`
--

INSERT INTO `desgloce_merma` (`id`, `cantidad`, `perfilRacimoId`, `defectoId`, `peso`) VALUES
(1, 3, 1, 1, 0),
(2, 15, 1, 12, 0),
(3, 5, 1, 22, 0),
(4, 20, 1, 30, 0),
(5, 3, 2, 1, 395),
(6, 12, 2, 12, 1985),
(7, 5, 2, 13, 740),
(8, 2, 2, 29, 410),
(9, 14, 2, 30, 2370),
(10, 1, 3, 1, 170),
(11, 11, 3, 12, 1815),
(12, 2, 3, 13, 380),
(13, 4, 3, 22, 575),
(14, 9, 3, 30, 1570),
(15, 4, 4, 7, 635),
(16, 7, 4, 12, 950),
(17, 2, 4, 9, 970),
(18, 2, 4, 13, 280),
(19, 2, 4, 7, 180),
(20, 2, 4, 29, 230),
(21, 3, 4, 30, 180),
(22, 2, 4, 35, 180),
(23, 1, 4, 3, 395);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doc`
--

CREATE TABLE `doc` (
  `id` int(11) NOT NULL,
  `departamento` varchar(255) NOT NULL,
  `nSemanas` int(11) NOT NULL,
  `filePath` varchar(255) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `path` varchar(255) NOT NULL,
  `originalname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `doc`
--

INSERT INTO `doc` (`id`, `departamento`, `nSemanas`, `filePath`, `createdAt`, `path`, `originalname`) VALUES
(1, 'mantenimiento', 2, 'HOJA DE VIDA COMPLETA Ing-b649.pdf', '2022-02-09 14:13:47.301998', 'files\\Reportmantenimiento\\HOJA DE VIDA COMPLETA Ing-b649.pdf', 'HOJA DE VIDA COMPLETA Ing. Martin Sanchez Jorgge.pdf'),
(2, 'mantenimiento', 2, 'HOJA DE VIDA COMPLETA Ing-7e94.pdf', '2022-02-09 14:17:49.722336', 'files\\Reportmantenimiento\\HOJA DE VIDA COMPLETA Ing-7e94.pdf', 'HOJA DE VIDA COMPLETA Ing. Martin Sanchez Jorgge.pdf'),
(3, 'mantenimiento', 5, 'HOJA DE VIDA COMPLETA Ing-b649-61fc.pdf', '2022-02-10 10:54:45.487753', 'files\\Reportmantenimiento\\HOJA DE VIDA COMPLETA Ing-b649-61fc.pdf', 'HOJA DE VIDA COMPLETA Ing-b649.pdf'),
(4, 'mantenimiento', 22, 'HOJA DE VIDA COMPLETA Ing-cf99.pdf', '2022-02-10 11:06:16.534605', 'files\\Reportmantenimiento\\HOJA DE VIDA COMPLETA Ing-cf99.pdf', 'HOJA DE VIDA COMPLETA Ing. Martin Sanchez Jorgge.pdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `history`
--

CREATE TABLE `history` (
  `idHistorial` int(11) NOT NULL,
  `inventarioIdInventario` int(11) DEFAULT NULL,
  `userIdUsuario` int(11) DEFAULT NULL,
  `ranchIdHaciendad` int(11) DEFAULT NULL,
  `fechaMovimiento` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `history`
--

INSERT INTO `history` (`idHistorial`, `inventarioIdInventario`, `userIdUsuario`, `ranchIdHaciendad`, `fechaMovimiento`) VALUES
(18, 8, 1, 6, '2022-02-21 15:48:14'),
(19, 12, 14, 6, '2022-03-12 13:08:15'),
(20, 20, 15, 6, '2022-03-12 13:29:44'),
(21, 26, 16, 13, '2022-03-12 13:32:32'),
(22, 14, 16, 13, '2022-03-12 13:33:14'),
(23, 27, 17, 18, '2022-03-12 13:34:45'),
(24, 9, 16, 13, '2022-03-12 13:36:19'),
(25, 24, 15, 6, '2022-03-12 13:36:21'),
(26, 38, 15, 6, '2022-03-12 13:36:48'),
(27, 17, 17, 18, '2022-03-12 13:38:29'),
(28, 19, 17, 18, '2022-03-12 13:39:10'),
(29, 28, 19, 25, '2022-03-12 13:49:46'),
(30, 70, 19, 25, '2022-03-12 13:50:15'),
(31, 39, 18, 12, '2022-03-12 13:55:31'),
(32, 18, 18, 12, '2022-03-12 13:56:05'),
(33, 44, 20, 6, '2022-03-12 13:58:36'),
(34, 15, 20, 6, '2022-03-12 13:59:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventory`
--

CREATE TABLE `inventory` (
  `idInventario` int(11) NOT NULL,
  `numSerie` varchar(255) NOT NULL,
  `nombreProducto` varchar(255) NOT NULL,
  `mantenimieto` tinyint(4) NOT NULL DEFAULT 0,
  `categoryIdCategoria` int(11) DEFAULT NULL,
  `unitMdIdUnidadMedida` int(11) DEFAULT NULL,
  `providerIdProvedor` int(11) DEFAULT NULL,
  `createdAt` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `inUse` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inventory`
--

INSERT INTO `inventory` (`idInventario`, `numSerie`, `nombreProducto`, `mantenimieto`, `categoryIdCategoria`, `unitMdIdUnidadMedida`, `providerIdProvedor`, `createdAt`, `inUse`) VALUES
(8, '1010018', 'BALANZA ELECTRONICA  CASIO  30 KG', 1, 29, 3, 3, '2022-02-17 16:55:58.980035', 1),
(9, '1010112', 'SELLADORA DE BOLSAS 3M M', 0, 29, 3, 3, '2022-02-17 16:56:23.325160', 1),
(10, '1270042', 'SOPLADORA/ASPIRADORA', 0, 29, 3, 3, '2022-02-17 16:56:47.617899', 1),
(11, '1270023', 'TIJERA PARA EMPAQUE', 0, 29, 3, 3, '2022-02-17 16:57:18.069148', 1),
(12, '1030069', 'TABLA DE EMBALAR 2.5CMS', 0, 29, 3, 3, '2022-02-17 16:57:59.168877', 1),
(13, '1030064', 'RADIO DE 21*46* E. 1.75\"', 0, 29, 3, 3, '2022-02-17 16:59:36.111010', 0),
(14, '1030063', 'RADIO DE 21*46* E. 1.25\"', 0, 29, 3, 3, '2022-02-17 16:59:56.061044', 0),
(15, '1030034', 'TABLA DE PICAR SANEO 50*70*3 CM', 0, 29, 3, 3, '2022-02-17 17:00:11.451813', 1),
(16, '1010100', 'BALANZA ELECTRONICA DE PISO', 0, 29, 3, 3, '2022-02-17 17:00:27.921336', 1),
(17, '1010042', 'BALANZA ELECTRONICA GRAMERA', 0, 29, 3, 3, '2022-02-17 17:00:58.839550', 1),
(18, '1010109', 'BALANZA COLGANTE 110 LBS', 0, 29, 3, 3, '2022-02-17 17:01:16.979406', 1),
(19, '1270012', 'BANDEJAS VERDES 3 DIVISIONES 45 PERFORACIONES 86 X 68 X 7 CM', 0, 29, 3, 3, '2022-02-17 17:01:35.806296', 1),
(20, '1270011', 'BANDEJAS NEGRA 3 DIVISIONES 21 PERFORACIONES 91 X 71 X 11.5 CM', 0, 29, 3, 3, '2022-02-17 17:01:51.856223', 1),
(21, '1010090', 'BANDEJAS NARANJA 3 DIVISIONES 21 PERFORACIONES 91 X 71 X 11.5 CM', 0, 29, 3, 3, '2022-02-17 17:02:08.660182', 0),
(23, '1360035', 'CLARIFICADOR DE AGUA PRP 8000', 0, 30, 2, 3, '2022-02-21 18:33:32.680640', 0),
(24, '1030033', 'DETERGENTE INDUSTRIAL 1 KG', 0, 30, 2, 3, '2022-02-21 18:33:58.529219', 1),
(25, '1010047', 'DIOXIDO DE CLORO AL 18% CANECA 30 LTS', 0, 30, 5, 3, '2022-02-21 18:34:17.473310', 0),
(26, '1010046', 'DIOXIDO DE CLORO AL 18% TANQUE 220LTS', 0, 30, 5, 3, '2022-02-21 18:34:34.473149', 1),
(27, '1150007', 'ESCOBA DE MADERA PARA LIMPIEZA', 0, 30, 3, 3, '2022-02-21 18:36:36.787314', 1),
(28, '1150003', 'ESCOBILLON 60CM M/T CERDAS DURAS', 0, 30, 3, 3, '2022-02-21 18:36:55.308261', 1),
(29, '1150004', 'ESPONJA SALVA UÑAS SOLEX', 0, 30, 3, 3, '2022-02-21 18:37:10.115167', 0),
(30, '1150008', 'ESTROPAJO DE ALUMINIO INDUSTRIAL', 0, 30, 3, 3, '2022-02-21 18:37:27.076570', 0),
(31, '1030025', 'LIMPIADOR BANALATEX HUMEDO', 0, 30, 7, 3, '2022-02-21 18:37:48.344569', 0),
(32, '1380014', 'LIMPIADOR BANALATEX SECO', 0, 30, 7, 3, '2022-02-21 18:38:21.694185', 0),
(33, '1030027', 'SACO DE ACIDO CITRICO 25 KG', 0, 30, 2, 3, '2022-02-21 18:38:41.476629', 0),
(34, '1150010', 'SANIT MASTER (AMONIO CUATERNARIO)', 0, 30, 5, 3, '2022-02-21 18:39:21.408242', 0),
(35, '1030047', 'TACHO DE CLORO GRANULADO 45 KILOS', 0, 30, 2, 3, '2022-02-21 18:39:41.005593', 0),
(36, '1170119', 'PROTEC K  (CONTROL COCHINILLA)', 0, 30, 5, 3, '2022-02-21 18:40:00.841897', 0),
(37, '1210003', 'NP-CONTROL (COCHINILLA) CANECA X20LTS', 0, 30, 5, 3, '2022-02-21 18:40:17.445223', 0),
(38, '1380053', 'TARJETA PLASTIFICADA P/IDENTIFICACION DE EMPAQUE', 0, 31, 3, 3, '2022-02-21 18:42:04.255294', 1),
(39, '1120289', 'BOQUILLA 8002', 0, 31, 3, 3, '2022-02-21 18:42:32.114621', 1),
(40, '1360067', 'TINTA SELLO COLOR ROJO FRASCO PEQUEÑO', 0, 31, 3, 3, '2022-02-21 18:42:49.694110', 0),
(41, '1360067', 'TINTA SELLO COLOR ROJO FRASCO PEQUEÑO', 0, 31, 3, 3, '2022-02-21 18:44:10.819658', 0),
(42, '1360064', 'TIZA BLANCA (CAJA 144 UND)', 0, 31, 3, 3, '2022-02-21 18:44:32.320822', 0),
(43, '1010125', 'SELLO 26P CON CIRCULO ', 0, 31, 3, 3, '2022-02-21 18:47:14.524918', 0),
(44, '1010124', 'SELLO 26PN', 0, 31, 3, 3, '2022-02-21 18:47:32.801226', 1),
(45, '1010123', 'SELLO 26P3', 0, 31, 3, 3, '2022-02-21 18:47:52.661606', 0),
(46, '1010122', 'SELLO HA31P', 0, 31, 3, 3, '2022-02-21 18:48:13.163693', 0),
(47, '1010121', 'SELLO NUMERADOR T-15912 12', 0, 31, 3, 3, '2022-02-21 18:48:32.648994', 0),
(48, '1360021', 'RODILLO DE FELPA 4\"', 0, 31, 3, 3, '2022-02-21 18:49:00.457915', 0),
(49, '1010051', 'PROBETA PLASTICA 1000ML', 0, 31, 3, 3, '2022-02-21 18:49:31.237099', 0),
(50, '1360016', 'RODILLO ESPONJA PARA GOMA 4\"', 0, 31, 3, 3, '2022-02-21 18:49:48.252871', 0),
(51, '1360015', 'LIENZO ESTRELLA (PARA REMOJAR ALUMBRE)', 0, 31, 4, 3, '2022-02-21 18:50:02.293228', 0),
(52, '1360013', 'CORTINA DE TELA PARA CONTENEDOR', 0, 31, 3, 3, '2022-02-21 18:50:22.026400', 0),
(53, '1270018', 'TANQUE TIPO BOTELLA PEMD AZUL DE 250 LIT', 0, 31, 3, 3, '2022-02-21 18:51:10.460461', 0),
(54, '1160003', 'TINTA SELLO COLOR NEGRO FRASCO DE 500CC', 0, 31, 3, 3, '2022-02-21 18:51:25.017738', 0),
(55, '1030044', 'BALDE 10 LTS', 0, 31, 3, 3, '2022-02-21 18:51:42.059860', 0),
(56, '1030029', 'CANECA DE GOMA 5 GLN', 0, 31, 7, 3, '2022-02-21 18:51:58.479851', 0),
(57, '1030028', 'SACO DE ALUMBRE 25 KG', 0, 31, 2, 3, '2022-02-21 18:52:28.407399', 0),
(58, '1030020', 'CINTA DE MEDIR PH', 0, 31, 3, 3, '2022-02-21 18:53:02.060112', 0),
(59, '1030019', 'CINTA DE MEDIR BANANO', 0, 31, 3, 3, '2022-02-21 18:54:11.377445', 0),
(60, '1030007', 'BROCHA NATURAL 2\"', 0, 31, 3, 3, '2022-02-21 18:54:29.767103', 0),
(61, '1010102', 'GOMA AKZONOBEL CANECA 5 GLN', 0, 31, 7, 3, '2022-02-21 18:54:48.453807', 0),
(62, '1010089', 'PROTECTOR DE BANDEJA NARANJA 76CM X 75CM X 3MM', 0, 31, 3, 3, '2022-02-21 18:55:08.457192', 0),
(63, '1010078', 'PROTECTORES DE BANDEJAS NEGROS 75CMS X 77CMS X 0.3 PERFORADOS', 0, 31, 3, 3, '2022-02-21 18:55:30.449620', 0),
(64, '1010077', 'PROTECTOR DE BANDEJA VERDE 75CM X 77CM X 0.3CM PERFORADO', 0, 31, 3, 3, '2022-02-21 18:55:56.198382', 0),
(65, '1010064', 'SELLO NUMERADOR T-15910 10 DIGITOS 9MM', 0, 31, 3, 3, '2022-02-21 18:56:26.919749', 0),
(66, '1010053', 'TIRAS PARA DIOXIDO DE CLORO (FRASCO IT 481028 CON 50 TIRAS)', 0, 31, 3, 3, '2022-02-21 18:58:05.737833', 0),
(67, '1010044', 'CRAYON JUMBO  CAJA X12', 0, 31, 3, 3, '2022-02-21 18:58:21.509074', 0),
(68, '1010039', 'BOLILLOS METO 8.22', 0, 31, 3, 3, '2022-02-21 18:58:35.466712', 0),
(69, '1010038', 'ETIQUETADORA DE 1 LINEA 8 DIGITOS METO 8.22', 0, 31, 3, 3, '2022-02-21 18:58:51.699639', 0),
(70, '1260030', 'BOTA CAUCHO AMARILLA TALLA# 37', 0, 32, 3, 3, '2022-02-21 18:59:18.014746', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `longitud_dedos`
--

CREATE TABLE `longitud_dedos` (
  `id` int(11) NOT NULL,
  `numMano` int(11) NOT NULL,
  `longitudDedos` double NOT NULL,
  `perfilRacimoId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `longitud_dedos`
--

INSERT INTO `longitud_dedos` (`id`, `numMano`, `longitudDedos`, `perfilRacimoId`) VALUES
(1, 1, 10, 1),
(2, 2, 10, 1),
(3, 3, 9.75, 1),
(4, 4, 9.5, 1),
(5, 5, 9.5, 1),
(6, 7, 9, 1),
(7, 8, 8.75, 1),
(8, 9, 8, 1),
(9, 1, 9.5, 2),
(10, 2, 9.5, 2),
(11, 3, 9.25, 2),
(12, 4, 9, 2),
(13, 5, 8.75, 2),
(14, 6, 8.5, 2),
(15, 7, 8.5, 2),
(16, 8, 8.5, 2),
(17, 9, 7.5, 2),
(18, 1, 10.25, 3),
(19, 2, 9.75, 3),
(20, 3, 9.5, 3),
(21, 4, 9.25, 3),
(22, 5, 9, 3),
(23, 6, 8.75, 3),
(24, 7, 8, 3),
(25, 8, 8.25, 3),
(26, 9, 7.5, 3),
(27, 1, 10.5, 4),
(28, 2, 9.75, 4),
(29, 3, 9.75, 4),
(30, 4, 9.5, 4),
(31, 5, 9, 4),
(32, 6, 8.5, 4),
(33, 7, 8.25, 4),
(34, 8, 8, 4),
(35, 9, 7, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maintenance`
--

CREATE TABLE `maintenance` (
  `idMantenimiento` int(11) NOT NULL,
  `numMantenimiento` int(11) NOT NULL DEFAULT 1,
  `motivo` varchar(255) NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 0,
  `fechaInicio` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `fechaFin` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `responsableIdResponsable` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `maintenance`
--

INSERT INTO `maintenance` (`idMantenimiento`, `numMantenimiento`, `motivo`, `estado`, `fechaInicio`, `fechaFin`, `responsableIdResponsable`) VALUES
(33, 1, 'estado en mantenimiento', 0, '2022-03-12 13:08:45.205938', '2022-03-12 13:08:45.205938', 13),
(34, 1, 'v<veria', 1, '2022-03-12 13:38:34.788472', '2022-03-12 13:39:12.000000', 14),
(35, 3, 'averia', 1, '2022-03-12 13:39:48.470650', '2022-03-12 13:40:04.000000', 14),
(36, 1, 'materiales mojados', 1, '2022-03-12 13:40:57.895265', '2022-03-12 13:41:10.000000', 21),
(37, 1, 'cantidad innecesaria', 1, '2022-03-12 13:41:02.078297', '2022-03-12 13:41:39.000000', 16),
(38, 1, 'se mojo', 1, '2022-03-12 13:51:59.009377', '2022-03-12 13:52:14.000000', 24),
(39, 1, 'inventario de material', 1, '2022-03-12 14:02:47.276188', '2022-03-12 14:03:08.000000', 15),
(40, 3, 'daño', 1, '2022-03-12 14:03:44.307111', '2022-03-12 14:04:18.000000', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mandated`
--

CREATE TABLE `mandated` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `role` enum('JefePlanta','InspectorPlanta','Calidad','Ninguno') NOT NULL DEFAULT 'Ninguno',
  `ranchIdHaciendad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mandated`
--

INSERT INTO `mandated` (`id`, `name`, `lastName`, `phone`, `role`, `ranchIdHaciendad`) VALUES
(1, 'carlos', 'leon', '0968838669', 'JefePlanta', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `merma`
--

CREATE TABLE `merma` (
  `id` int(11) NOT NULL,
  `ranchIdHaciendad` int(11) DEFAULT NULL,
  `rCortado` double NOT NULL,
  `rProcesado` double NOT NULL,
  `rRechazados` double NOT NULL,
  `pesoFruta` double NOT NULL,
  `pesoRacimo` double NOT NULL,
  `pesoTallo` double NOT NULL,
  `edad` double NOT NULL,
  `calibracion` double NOT NULL,
  `nManos` double NOT NULL,
  `pesoSegundaMano` double NOT NULL,
  `pesoUltimaMano` double NOT NULL,
  `lDedoSegunda` double NOT NULL,
  `lDedoUltima` double NOT NULL,
  `mermaProcesada` double NOT NULL,
  `mermaCortada` double NOT NULL,
  `totalCajas` double NOT NULL,
  `numManosVotadasP` double NOT NULL,
  `numManosVotadasU` double NOT NULL,
  `ratioC` double NOT NULL,
  `ratioP` double NOT NULL,
  `pesoCaja` double NOT NULL,
  `fecha` date DEFAULT NULL,
  `createdAt` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `perfil` tinyint(4) NOT NULL DEFAULT 0,
  `CantidadCJ` int(11) NOT NULL,
  `calibracionUltima` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `merma`
--

INSERT INTO `merma` (`id`, `ranchIdHaciendad`, `rCortado`, `rProcesado`, `rRechazados`, `pesoFruta`, `pesoRacimo`, `pesoTallo`, `edad`, `calibracion`, `nManos`, `pesoSegundaMano`, `pesoUltimaMano`, `lDedoSegunda`, `lDedoUltima`, `mermaProcesada`, `mermaCortada`, `totalCajas`, `numManosVotadasP`, `numManosVotadasU`, `ratioC`, `ratioP`, `pesoCaja`, `fecha`, `createdAt`, `perfil`, `CantidadCJ`, `calibracionUltima`) VALUES
(12, 19, 67708.90000000001, 66923.3, 785.6000000000058, 49.1, 55.2, 6, 11, 43.2, 9.4, 30, 10, 9.5, 7.5, 7523.300000000003, 8308.900000000009, 1414.2857142857142, 0, 0, 1.025587900134673, 1.0376270831149774, 59400, '2022-03-18', '2022-03-21 16:45:22.524491', 0, 3, 0),
(13, 19, 68260.5, 67468.5, 792, 49.5, 55.2, 6, 10.5, 43.2, 9.4, 25, 10, 9.5, 8.5, 8743.5, 9535.5, 1398.2142857142858, 0, 0, 1.0139334921785974, 1.0258358662613982, 58725, '2022-03-21', '2022-03-21 16:45:22.524491', 1, 3, 0),
(15, 11, 75000, 65000, 10000, 50, 60, 10, 11, 45, 9, 0, 0, 10, 8, 8450, 18450, 56550, 9, 120, 0.8976190476190475, 1.0357142857142856, 56550, '2022-03-28', '2022-03-28 15:54:51.683825', 0, 2, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `numero_dedos`
--

CREATE TABLE `numero_dedos` (
  `id` int(11) NOT NULL,
  `numMano` int(11) NOT NULL,
  `numDedos` int(11) NOT NULL,
  `perfilRacimoId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `numero_dedos`
--

INSERT INTO `numero_dedos` (`id`, `numMano`, `numDedos`, `perfilRacimoId`) VALUES
(1, 1, 25, 1),
(2, 2, 23, 1),
(3, 3, 23, 1),
(4, 4, 21, 1),
(5, 5, 22, 1),
(6, 6, 20, 1),
(7, 7, 18, 1),
(8, 8, 18, 1),
(9, 9, 16, 1),
(10, 1, 24, 2),
(11, 2, 25, 2),
(12, 3, 22, 2),
(13, 4, 22, 2),
(14, 5, 20, 2),
(15, 6, 20, 2),
(16, 7, 18, 2),
(17, 8, 18, 2),
(18, 9, 16, 2),
(19, 1, 20, 3),
(20, 2, 22, 3),
(21, 3, 20, 3),
(22, 4, 20, 3),
(23, 5, 19, 3),
(24, 6, 19, 3),
(25, 7, 18, 3),
(26, 8, 18, 3),
(27, 9, 18, 3),
(28, 1, 23, 4),
(29, 2, 22, 4),
(30, 3, 21, 4),
(31, 4, 21, 4),
(32, 5, 20, 4),
(33, 6, 19, 4),
(34, 7, 19, 4),
(35, 8, 18, 4),
(36, 9, 18, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil_racimo`
--

CREATE TABLE `perfil_racimo` (
  `id` int(11) NOT NULL,
  `pesoTallo` double NOT NULL,
  `nRacimo` int(11) NOT NULL,
  `mermaId` int(11) DEFAULT NULL,
  `colorId` int(11) DEFAULT NULL,
  `defectosY` tinyint(4) NOT NULL DEFAULT 0,
  `lote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `perfil_racimo`
--

INSERT INTO `perfil_racimo` (`id`, `pesoTallo`, `nRacimo`, `mermaId`, `colorId`, `defectosY`, `lote`) VALUES
(1, 8.4, 1, 13, 1, 1, 1),
(2, 4000, 2, 13, 8, 1, 3),
(3, 4000, 1, 12, 1, 0, 9),
(4, 4000, 2, 12, 2, 0, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peso_mano`
--

CREATE TABLE `peso_mano` (
  `id` int(11) NOT NULL,
  `numMano` int(11) NOT NULL,
  `perfilRacimoId` int(11) DEFAULT NULL,
  `pesoMano` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `peso_mano`
--

INSERT INTO `peso_mano` (`id`, `numMano`, `perfilRacimoId`, `pesoMano`) VALUES
(1, 1, 1, 5180),
(2, 2, 1, 5065),
(3, 3, 1, 4875),
(4, 4, 1, 4665),
(5, 5, 1, 4410),
(6, 6, 1, 4160),
(7, 7, 1, 3970),
(8, 8, 1, 3810),
(9, 9, 1, 3500),
(10, 1, 2, 4810),
(11, 2, 2, 5009),
(12, 3, 2, 4715),
(13, 4, 2, 4585),
(14, 5, 2, 4010),
(15, 6, 2, 3885),
(16, 7, 2, 3710),
(17, 8, 2, 3580),
(18, 9, 2, 3345),
(19, 1, 3, 4327),
(20, 2, 3, 3822),
(21, 3, 3, 3544),
(22, 4, 3, 3028),
(23, 5, 3, 2842),
(24, 6, 3, 2630),
(25, 7, 3, 2318),
(26, 8, 3, 2002),
(27, 9, 3, 1812),
(28, 1, 4, 3948),
(29, 2, 4, 3627),
(30, 3, 4, 3085),
(31, 4, 4, 2772),
(32, 5, 4, 2541),
(33, 6, 4, 2372),
(34, 7, 4, 2008),
(35, 8, 4, 1971),
(36, 9, 4, 1900);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provider`
--

CREATE TABLE `provider` (
  `idProvedor` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL DEFAULT '0',
  `telefono` varchar(255) NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `provider`
--

INSERT INTO `provider` (`idProvedor`, `nombre`, `direccion`, `telefono`, `email`) VALUES
(1, 'Contructor SA', 'barreiro', '0292898', 'yopmai@sd.com'),
(2, 'Spacex', 'EEUU', '9208928', 'escp@ds.com'),
(3, 'sumifru', '5 de marzo del 200', '2121', 'sumifru@hg.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `query-result-cache`
--

CREATE TABLE `query-result-cache` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `time` bigint(20) NOT NULL,
  `duration` int(11) NOT NULL,
  `query` text NOT NULL,
  `result` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `query-result-cache`
--

INSERT INTO `query-result-cache` (`id`, `identifier`, `time`, `duration`, `query`, `result`) VALUES
(1, NULL, 1648645574329, 1000, 'SELECT `Merma`.`id` AS `Merma_id`, `Merma`.`rCortado` AS `Merma_rCortado`, `Merma`.`rProcesado` AS `Merma_rProcesado`, `Merma`.`rRechazados` AS `Merma_rRechazados`, `Merma`.`pesoFruta` AS `Merma_pesoFruta`, `Merma`.`pesoRacimo` AS `Merma_pesoRacimo`, `Merma`.`pesoTallo` AS `Merma_pesoTallo`, `Merma`.`edad` AS `Merma_edad`, `Merma`.`calibracion` AS `Merma_calibracion`, `Merma`.`nManos` AS `Merma_nManos`, `Merma`.`pesoSegundaMano` AS `Merma_pesoSegundaMano`, `Merma`.`pesoUltimaMano` AS `Merma_pesoUltimaMano`, `Merma`.`lDedoSegunda` AS `Merma_lDedoSegunda`, `Merma`.`lDedoUltima` AS `Merma_lDedoUltima`, `Merma`.`ratioC` AS `Merma_ratioC`, `Merma`.`ratioP` AS `Merma_ratioP`, `Merma`.`mermaProcesada` AS `Merma_mermaProcesada`, `Merma`.`mermaCortada` AS `Merma_mermaCortada`, `Merma`.`totalCajas` AS `Merma_totalCajas`, `Merma`.`numManosVotadasP` AS `Merma_numManosVotadasP`, `Merma`.`numManosVotadasU` AS `Merma_numManosVotadasU`, `Merma`.`pesoCaja` AS `Merma_pesoCaja`, `Merma`.`fecha` AS `Merma_fecha`, `Merma`.`createdAt` AS `Merma_createdAt`, `Merma`.`perfil` AS `Merma_perfil`, `Merma`.`CantidadCJ` AS `Merma_CantidadCJ`, `Merma`.`ranchIdHaciendad` AS `Merma_ranchIdHaciendad`, `Merma__ranch`.`idHaciendad` AS `Merma__ranch_idHaciendad`, `Merma__ranch`.`nombre` AS `Merma__ranch_nombre`, `Merma__ranch`.`condigoHacienda` AS `Merma__ranch_condigoHacienda`, `Merma__ranch`.`zonaIdZona` AS `Merma__ranch_zonaIdZona` FROM `merma` `Merma` LEFT JOIN `ranch` `Merma__ranch` ON `Merma__ranch`.`idHaciendad`=`Merma`.`ranchIdHaciendad` WHERE `Merma`.`fecha` = ? -- PARAMETERS: [\"2022-03-21\"]', '[{\"Merma_id\":13,\"Merma_rCortado\":68260.5,\"Merma_rProcesado\":67468.5,\"Merma_rRechazados\":792,\"Merma_pesoFruta\":49.5,\"Merma_pesoRacimo\":55.2,\"Merma_pesoTallo\":6,\"Merma_edad\":10.5,\"Merma_calibracion\":43.2,\"Merma_nManos\":9.4,\"Merma_pesoSegundaMano\":25,\"Merma_pesoUltimaMano\":10,\"Merma_lDedoSegunda\":9.5,\"Merma_lDedoUltima\":8.5,\"Merma_ratioC\":1.0139334921785974,\"Merma_ratioP\":1.0258358662613982,\"Merma_mermaProcesada\":8743.5,\"Merma_mermaCortada\":9535.5,\"Merma_totalCajas\":1398.2142857142858,\"Merma_numManosVotadasP\":0,\"Merma_numManosVotadasU\":0,\"Merma_pesoCaja\":58725,\"Merma_fecha\":\"2022-03-21T05:00:00.000Z\",\"Merma_createdAt\":\"2022-03-21T16:45:22.524Z\",\"Merma_perfil\":1,\"Merma_CantidadCJ\":3,\"Merma_ranchIdHaciendad\":19,\"Merma__ranch_idHaciendad\":19,\"Merma__ranch_nombre\":\"San Luis 2\",\"Merma__ranch_condigoHacienda\":\"2174\",\"Merma__ranch_zonaIdZona\":3}]'),
(2, NULL, 1648484036489, 1000, 'SELECT `Merma`.`id` AS `Merma_id`, `Merma`.`rCortado` AS `Merma_rCortado`, `Merma`.`rProcesado` AS `Merma_rProcesado`, `Merma`.`rRechazados` AS `Merma_rRechazados`, `Merma`.`pesoFruta` AS `Merma_pesoFruta`, `Merma`.`pesoRacimo` AS `Merma_pesoRacimo`, `Merma`.`pesoTallo` AS `Merma_pesoTallo`, `Merma`.`edad` AS `Merma_edad`, `Merma`.`calibracion` AS `Merma_calibracion`, `Merma`.`nManos` AS `Merma_nManos`, `Merma`.`pesoSegundaMano` AS `Merma_pesoSegundaMano`, `Merma`.`pesoUltimaMano` AS `Merma_pesoUltimaMano`, `Merma`.`lDedoSegunda` AS `Merma_lDedoSegunda`, `Merma`.`lDedoUltima` AS `Merma_lDedoUltima`, `Merma`.`ratioC` AS `Merma_ratioC`, `Merma`.`ratioP` AS `Merma_ratioP`, `Merma`.`mermaProcesada` AS `Merma_mermaProcesada`, `Merma`.`mermaCortada` AS `Merma_mermaCortada`, `Merma`.`totalCajas` AS `Merma_totalCajas`, `Merma`.`numManosVotadasP` AS `Merma_numManosVotadasP`, `Merma`.`numManosVotadasU` AS `Merma_numManosVotadasU`, `Merma`.`pesoCaja` AS `Merma_pesoCaja`, `Merma`.`fecha` AS `Merma_fecha`, `Merma`.`createdAt` AS `Merma_createdAt`, `Merma`.`perfil` AS `Merma_perfil`, `Merma`.`CantidadCJ` AS `Merma_CantidadCJ`, `Merma`.`ranchIdHaciendad` AS `Merma_ranchIdHaciendad`, `Merma__ranch`.`idHaciendad` AS `Merma__ranch_idHaciendad`, `Merma__ranch`.`nombre` AS `Merma__ranch_nombre`, `Merma__ranch`.`condigoHacienda` AS `Merma__ranch_condigoHacienda`, `Merma__ranch`.`zonaIdZona` AS `Merma__ranch_zonaIdZona` FROM `merma` `Merma` LEFT JOIN `ranch` `Merma__ranch` ON `Merma__ranch`.`idHaciendad`=`Merma`.`ranchIdHaciendad` WHERE `Merma`.`fecha` = ? -- PARAMETERS: [\"2022-03-28\"]', '[{\"Merma_id\":15,\"Merma_rCortado\":75000,\"Merma_rProcesado\":65000,\"Merma_rRechazados\":10000,\"Merma_pesoFruta\":50,\"Merma_pesoRacimo\":60,\"Merma_pesoTallo\":10,\"Merma_edad\":11,\"Merma_calibracion\":45,\"Merma_nManos\":9,\"Merma_pesoSegundaMano\":0,\"Merma_pesoUltimaMano\":0,\"Merma_lDedoSegunda\":10,\"Merma_lDedoUltima\":8,\"Merma_ratioC\":0.8976190476190475,\"Merma_ratioP\":1.0357142857142856,\"Merma_mermaProcesada\":8450,\"Merma_mermaCortada\":18450,\"Merma_totalCajas\":56550,\"Merma_numManosVotadasP\":9,\"Merma_numManosVotadasU\":120,\"Merma_pesoCaja\":56550,\"Merma_fecha\":\"2022-03-28T05:00:00.000Z\",\"Merma_createdAt\":\"2022-03-28T15:54:51.683Z\",\"Merma_perfil\":0,\"Merma_CantidadCJ\":2,\"Merma_ranchIdHaciendad\":11,\"Merma__ranch_idHaciendad\":11,\"Merma__ranch_nombre\":\"La Delicia\",\"Merma__ranch_condigoHacienda\":\"2177\",\"Merma__ranch_zonaIdZona\":2}]'),
(3, NULL, 1648649297174, 1000, 'SELECT `Merma`.`id` AS `Merma_id`, `Merma`.`rCortado` AS `Merma_rCortado`, `Merma`.`rProcesado` AS `Merma_rProcesado`, `Merma`.`rRechazados` AS `Merma_rRechazados`, `Merma`.`pesoFruta` AS `Merma_pesoFruta`, `Merma`.`pesoRacimo` AS `Merma_pesoRacimo`, `Merma`.`pesoTallo` AS `Merma_pesoTallo`, `Merma`.`edad` AS `Merma_edad`, `Merma`.`calibracion` AS `Merma_calibracion`, `Merma`.`nManos` AS `Merma_nManos`, `Merma`.`pesoSegundaMano` AS `Merma_pesoSegundaMano`, `Merma`.`pesoUltimaMano` AS `Merma_pesoUltimaMano`, `Merma`.`lDedoSegunda` AS `Merma_lDedoSegunda`, `Merma`.`lDedoUltima` AS `Merma_lDedoUltima`, `Merma`.`ratioC` AS `Merma_ratioC`, `Merma`.`ratioP` AS `Merma_ratioP`, `Merma`.`mermaProcesada` AS `Merma_mermaProcesada`, `Merma`.`mermaCortada` AS `Merma_mermaCortada`, `Merma`.`totalCajas` AS `Merma_totalCajas`, `Merma`.`numManosVotadasP` AS `Merma_numManosVotadasP`, `Merma`.`numManosVotadasU` AS `Merma_numManosVotadasU`, `Merma`.`pesoCaja` AS `Merma_pesoCaja`, `Merma`.`fecha` AS `Merma_fecha`, `Merma`.`createdAt` AS `Merma_createdAt`, `Merma`.`perfil` AS `Merma_perfil`, `Merma`.`CantidadCJ` AS `Merma_CantidadCJ`, `Merma`.`ranchIdHaciendad` AS `Merma_ranchIdHaciendad`, `Merma__ranch`.`idHaciendad` AS `Merma__ranch_idHaciendad`, `Merma__ranch`.`nombre` AS `Merma__ranch_nombre`, `Merma__ranch`.`condigoHacienda` AS `Merma__ranch_condigoHacienda`, `Merma__ranch`.`zonaIdZona` AS `Merma__ranch_zonaIdZona` FROM `merma` `Merma` LEFT JOIN `ranch` `Merma__ranch` ON `Merma__ranch`.`idHaciendad`=`Merma`.`ranchIdHaciendad` WHERE `Merma`.`fecha` = ? -- PARAMETERS: [\"2022-03-30\"]', '[]'),
(4, NULL, 1648651402121, 1000, 'SELECT `Merma`.`id` AS `Merma_id`, `Merma`.`rCortado` AS `Merma_rCortado`, `Merma`.`rProcesado` AS `Merma_rProcesado`, `Merma`.`rRechazados` AS `Merma_rRechazados`, `Merma`.`pesoFruta` AS `Merma_pesoFruta`, `Merma`.`pesoRacimo` AS `Merma_pesoRacimo`, `Merma`.`pesoTallo` AS `Merma_pesoTallo`, `Merma`.`edad` AS `Merma_edad`, `Merma`.`calibracion` AS `Merma_calibracion`, `Merma`.`calibracionUltima` AS `Merma_calibracionUltima`, `Merma`.`nManos` AS `Merma_nManos`, `Merma`.`pesoSegundaMano` AS `Merma_pesoSegundaMano`, `Merma`.`pesoUltimaMano` AS `Merma_pesoUltimaMano`, `Merma`.`lDedoSegunda` AS `Merma_lDedoSegunda`, `Merma`.`lDedoUltima` AS `Merma_lDedoUltima`, `Merma`.`ratioC` AS `Merma_ratioC`, `Merma`.`ratioP` AS `Merma_ratioP`, `Merma`.`mermaProcesada` AS `Merma_mermaProcesada`, `Merma`.`mermaCortada` AS `Merma_mermaCortada`, `Merma`.`totalCajas` AS `Merma_totalCajas`, `Merma`.`numManosVotadasP` AS `Merma_numManosVotadasP`, `Merma`.`numManosVotadasU` AS `Merma_numManosVotadasU`, `Merma`.`pesoCaja` AS `Merma_pesoCaja`, `Merma`.`fecha` AS `Merma_fecha`, `Merma`.`createdAt` AS `Merma_createdAt`, `Merma`.`perfil` AS `Merma_perfil`, `Merma`.`CantidadCJ` AS `Merma_CantidadCJ`, `Merma`.`ranchIdHaciendad` AS `Merma_ranchIdHaciendad`, `Merma__ranch`.`idHaciendad` AS `Merma__ranch_idHaciendad`, `Merma__ranch`.`nombre` AS `Merma__ranch_nombre`, `Merma__ranch`.`condigoHacienda` AS `Merma__ranch_condigoHacienda`, `Merma__ranch`.`zonaIdZona` AS `Merma__ranch_zonaIdZona` FROM `merma` `Merma` LEFT JOIN `ranch` `Merma__ranch` ON `Merma__ranch`.`idHaciendad`=`Merma`.`ranchIdHaciendad` WHERE `Merma`.`fecha` = ? -- PARAMETERS: [\"2022-03-30\"]', '[]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ranch`
--

CREATE TABLE `ranch` (
  `idHaciendad` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `condigoHacienda` varchar(255) NOT NULL,
  `zonaIdZona` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ranch`
--

INSERT INTO `ranch` (`idHaciendad`, `nombre`, `condigoHacienda`, `zonaIdZona`) VALUES
(6, 'la suerte 1', '2173-1', 1),
(7, 'la suerte 2', '2173-2', 1),
(8, 'San Marco 1', '2169-3', 1),
(9, 'San Marco 2', '2169-4', 1),
(10, 'Doña Laura', '2172', 2),
(11, 'La Delicia', '2177', 2),
(12, 'Las Mercedes', '2170', 2),
(13, 'Mano de Dios', '2168', 2),
(14, 'Matilde 1', '1863', 2),
(15, 'Monte Grande', '1864', 2),
(16, 'Triple A', '2113', 2),
(17, 'Carolina', '2176', 3),
(18, 'San Luis 1', '2171', 3),
(19, 'San Luis 2', '2174', 3),
(20, 'Sigal', '2167', 3),
(21, 'Soledad', '1827', 3),
(22, 'Vizcaya', '3672', 3),
(23, 'Claudia Maria', '1874', 4),
(24, 'Clemencia', '1877', 4),
(25, 'Doña Luisa', '2116', 4),
(26, 'Maria Fernanda', '1968', 4),
(27, 'Mercedes', '1872', 4),
(28, 'San Jorge', '1893', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte`
--

CREATE TABLE `reporte` (
  `idReporte` int(11) NOT NULL,
  `reporte` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `fechaIngreso` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `inventoryIdInventario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsable`
--

CREATE TABLE `responsable` (
  `idResponsable` int(11) NOT NULL,
  `fechaIngreso` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `ranchIdHaciendad` int(11) DEFAULT NULL,
  `inventoryIdInventario` int(11) DEFAULT NULL,
  `userIdUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `responsable`
--

INSERT INTO `responsable` (`idResponsable`, `fechaIngreso`, `ranchIdHaciendad`, `inventoryIdInventario`, `userIdUsuario`) VALUES
(13, '2022-02-21 15:48:14.412345', 6, 8, 1),
(14, '2022-03-12 13:08:15.377322', 6, 12, 14),
(15, '2022-03-12 13:29:44.129312', 6, 20, 15),
(16, '2022-03-12 13:32:32.196419', 13, 14, 16),
(17, '2022-03-12 13:34:45.568543', 18, 27, 17),
(18, '2022-03-12 13:36:19.661383', 13, 9, 16),
(19, '2022-03-12 13:36:21.626110', 6, 24, 15),
(20, '2022-03-12 13:36:48.640474', 6, 38, 15),
(21, '2022-03-12 13:38:29.070700', 18, 17, 17),
(22, '2022-03-12 13:39:10.220442', 18, 19, 17),
(23, '2022-03-12 13:49:46.034670', 25, 28, 19),
(24, '2022-03-12 13:50:15.269118', 25, 70, 19),
(25, '2022-03-12 13:55:31.052499', 12, 39, 18),
(27, '2022-03-12 13:56:04.961927', 12, 18, 18),
(28, '2022-03-12 13:58:36.347179', 6, 44, 20),
(29, '2022-03-12 13:59:10.851409', 6, 15, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `rol` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `role`
--

INSERT INTO `role` (`id`, `rol`) VALUES
(1, 'admin'),
(2, 'supervisor'),
(3, 'jfplanta'),
(4, 'calidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sku`
--

CREATE TABLE `sku` (
  `id` int(11) NOT NULL,
  `marca` varchar(255) NOT NULL,
  `empresa` varchar(255) DEFAULT NULL,
  `peso` double NOT NULL,
  `clusters` double NOT NULL DEFAULT 0,
  `dedosMin` double NOT NULL DEFAULT 0,
  `dedosMax` double NOT NULL DEFAULT 0,
  `pesoFrutaFundaMin` double NOT NULL DEFAULT 0,
  `pesoFrutaFundaMax` double NOT NULL DEFAULT 0,
  `calibracionMin` double NOT NULL DEFAULT 0,
  `calibracionMax` double NOT NULL DEFAULT 0,
  `largoDedoMin` double NOT NULL DEFAULT 0,
  `largoDedoMax` double NOT NULL DEFAULT 0,
  `tercero` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sku`
--

INSERT INTO `sku` (`id`, `marca`, `empresa`, `peso`, `clusters`, `dedosMin`, `dedosMax`, `pesoFrutaFundaMin`, `pesoFrutaFundaMax`, `calibracionMin`, `calibracionMax`, `largoDedoMin`, `largoDedoMax`, `tercero`) VALUES
(1, '26pn', 'SUMIFRU JAPON', 43.5, 0, 4, 6, 655, 850, 39, 45, 8, 9.5, 0),
(2, '26p', 'SUMIFRU JAPON', 43.5, 0, 4, 6, 655, 850, 39, 45, 8, 9.5, 0),
(3, '29p', 'SUMIFRU JAPON', 43.5, 0, 4, 6, 605, 750, 37, 45, 7, 9, 0),
(4, '33p', 'SUMIFRU JAPON', 43.5, 0, 4, 6, 505, 650, 37, 45, 7, 9, 0),
(5, '26p3', 'SUMIFRU JAPON', 43.5, 0, 4, 6, 660, 0, 39, 45, 9.5, 0, 0),
(6, '25p', 'FARMIND JAPON', 43.5, 0, 0, 0, 655, 850, 39, 45, 8, 9.5, 0),
(7, '32p', 'FARMIND JAPON', 43.5, 0, 0, 0, 505, 650, 37, 45, 7, 9, 0),
(8, 'HA31P', 'SUMIFRU', 43.5, 31, 4, 6, 555, 700, 37, 39, 7, 8, 0),
(9, '26C', 'SUMIFRU', 43.5, 26, 4, 6, 655, 850, 39, 45, 7, 9.5, 0),
(10, '25PN', 'FARMIND JAPON', 43.5, 26, 4, 6, 655, 850, 39, 45, 7, 9.5, 0),
(11, 'Sharbatly', 'Hilldale', 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(12, 'Lefruit', 'Hilldale', 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(13, 'Supreme', 'Hilldale', 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(14, 'Yellow', 'Asoproagrinero', 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(15, 'Toco', 'Asoproagrinero', 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16, 'Tropical', 'Tropical', 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(17, 'OK Premiun', 'OK', 52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(18, 'Bananzor', 'Pacifico Export', 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(19, 'Mir', 'Pacifico Export', 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(20, 'Berfin', 'Pacifico Export', 46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(21, 'Bonanza\r\n', 'Fanalba', 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(22, 'Estelar', 'Fanalba', 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(23, 'Bagno', 'Bagno', 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(24, 'Ginafruit', 'Ginafruit', 33.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(25, 'Ginafruit', 'Ginafruit', 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(26, 'Extraban', 'Mendoexport', 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(27, 'Gonzalito', 'Exportgonza', 52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(28, 'Interbanana', 'Interbanana', 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(29, 'Bonita', 'Interbanana', 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(30, 'Battaglio', 'Luderson', 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(31, '38PFluta', 'sumpreme furtas', 32.5, 50, 0, 0, 0, 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_defecto`
--

CREATE TABLE `tipo_defecto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_defecto`
--

INSERT INTO `tipo_defecto` (`id`, `nombre`) VALUES
(1, 'cosecha'),
(2, 'empaque'),
(3, 'cut waste'),
(4, 'practicas agrícolas'),
(5, 'fisiológicos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unit_md`
--

CREATE TABLE `unit_md` (
  `idUnidadMedida` int(11) NOT NULL,
  `tipoUnida` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `unit_md`
--

INSERT INTO `unit_md` (`idUnidadMedida`, `tipoUnida`) VALUES
(1, 'Metros(m)'),
(2, 'Kilogramos(Kg)'),
(3, 'Unidad(UND)'),
(4, 'metros cubicos'),
(5, 'litro(L)'),
(6, 'juego(JGO)'),
(7, 'Galon(GAL)'),
(8, 'Frasco'),
(9, 'Cajas'),
(10, 'Par'),
(11, 'metros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `contraseña` varchar(255) NOT NULL DEFAULT '0',
  `createdAt` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `numCedula` varchar(255) NOT NULL,
  `roleId` int(11) DEFAULT NULL,
  `isActive` tinyint(4) NOT NULL DEFAULT 1,
  `fullAccess` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`idUsuario`, `nombre`, `contraseña`, `createdAt`, `updatedAt`, `numCedula`, `roleId`, `isActive`, `fullAccess`) VALUES
(1, 'jonathan', '$2b$10$AH/WuLldBcIbwkGKFi4gz.8/DaUqCv2fCY29fzmoYvYP6TOMaUPFG', '2022-02-04 13:31:52.152950', '2022-03-14 14:58:06.248905', '1207207752', 1, 0, 1),
(14, 'parra', '$2b$10$w3gGLeF7VnlSfPpMu.sal.cvZSGJT0aKjzuGN2yOW5qpKUvEPMUFK', '2022-03-12 13:01:16.909801', '2022-03-15 19:21:00.632420', '120', 4, 0, 0),
(15, 'Parrales', '$2b$10$1/rHs.Ozw2nLNzFRBn5k2.yjpK1tMI79BBU44QpMJRjSJZbl/BbHe', '2022-03-12 13:25:05.418177', '2022-03-12 13:25:05.418177', '1204367971', 2, 0, 0),
(16, 'Sanchez', '$2b$10$ijZnd1pSLkEtabHtci.kJuzXw8ZkcSeLt3qAh6RNVQLTYgcS0obM.', '2022-03-12 13:27:29.068484', '2022-03-12 13:27:29.068484', '1207716992', 2, 0, 0),
(17, 'Leon', '$2b$10$ULdmFLe9cAWqBpYk6gtwauWl75R4h.mEIxfBsa8thKEG6NCzFB9E.', '2022-03-12 13:32:24.675008', '2022-03-12 13:32:24.675008', '1207091313', 2, 0, 0),
(18, 'Olvera', '$2b$10$RABi3pZL3xcJnRFAFwAVcO1uDuy79WoWq1sNvf3CJoFXrkEMhkQD2', '2022-03-12 13:46:01.265763', '2022-03-12 13:46:01.265763', '1205651910', 2, 0, 0),
(19, 'Zamora', '$2b$10$MoFB.paQGXJiUTSNr87HP.rEtqkWVbNPPspifyD.DM5N9j3H72byG', '2022-03-12 13:46:24.929841', '2022-03-12 13:46:24.929841', '1206915298', 2, 0, 0),
(20, 'Cando', '$2b$10$uTXPKbD6D8NErAj9QyD3teNLq.aisCIjujtJP4rJSKfMg6Kjpnfi.', '2022-03-12 13:56:46.528001', '2022-03-12 13:56:46.528001', '1250153341', 2, 0, 0),
(21, 'prueba', '$2b$10$HNFhZGjPdEMANcVZJGTCFOpL9I9pHkJFdwY5LuesFE0P3AHOT2V8e', '2022-03-14 16:18:09.856288', '2022-03-14 16:18:09.856288', '123456', 3, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zona`
--

CREATE TABLE `zona` (
  `idZona` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `usersIdUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `zona`
--

INSERT INTO `zona` (`idZona`, `nombre`, `usersIdUsuario`) VALUES
(1, 'zona 1', 17),
(2, 'zona 2', NULL),
(3, 'zona 3', NULL),
(4, 'zona 4', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_a831661be5a418d5a609650f26d` (`ranchIdHaciendad`),
  ADD KEY `FK_6716f09408e29bd6d3477a0121e` (`userIdUsuario`);

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_6ffafad3a52074d3c1c5d6e6030` (`skuId`),
  ADD KEY `FK_682624e5e5e4001e61c73ee65ae` (`mermaId`);

--
-- Indices de la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_0ba000365bfd6368587230df3e6` (`mermaId`);

--
-- Indices de la tabla `calibracion`
--
ALTER TABLE `calibracion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_7787a6ab9bbea7c572a207065e4` (`perfilRacimoId`);

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `defecto`
--
ALTER TABLE `defecto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_8f08c2eced4a6bfdfabec0a1664` (`tipoDefectoId`);

--
-- Indices de la tabla `desgloce_merma`
--
ALTER TABLE `desgloce_merma`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_5a56b5c5217dceb4b292b227e8d` (`perfilRacimoId`),
  ADD KEY `FK_69606fd1faa0ac27dd4ecf7ceb2` (`defectoId`);

--
-- Indices de la tabla `doc`
--
ALTER TABLE `doc`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`idHistorial`),
  ADD KEY `FK_03454677604b068634e7d2bd077` (`inventarioIdInventario`),
  ADD KEY `FK_4a9ad6789bd3e18242521774ff8` (`userIdUsuario`),
  ADD KEY `FK_03e56b7f190a6a45229277f9a7b` (`ranchIdHaciendad`);

--
-- Indices de la tabla `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`idInventario`),
  ADD KEY `FK_8dd2318c078d937c6999cf85884` (`categoryIdCategoria`),
  ADD KEY `FK_f2bf055afafeec6b9e8aad5fd6d` (`unitMdIdUnidadMedida`),
  ADD KEY `FK_f21ac8fd1de7cb0241ff0fe8e59` (`providerIdProvedor`);

--
-- Indices de la tabla `longitud_dedos`
--
ALTER TABLE `longitud_dedos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_cd08169a2abc6774f28e228cfee` (`perfilRacimoId`);

--
-- Indices de la tabla `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`idMantenimiento`),
  ADD KEY `FK_771719a9a0575e191079462f811` (`responsableIdResponsable`);

--
-- Indices de la tabla `mandated`
--
ALTER TABLE `mandated`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_f434e2241eed8687d13300a8e3f` (`ranchIdHaciendad`);

--
-- Indices de la tabla `merma`
--
ALTER TABLE `merma`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_8c3698e7482b626ca1dc656b633` (`ranchIdHaciendad`);

--
-- Indices de la tabla `numero_dedos`
--
ALTER TABLE `numero_dedos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_685856195c273d4965d075a3664` (`perfilRacimoId`);

--
-- Indices de la tabla `perfil_racimo`
--
ALTER TABLE `perfil_racimo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ea728f93fbb88daf29f46ca2d1b` (`colorId`),
  ADD KEY `FK_1b19437883f2dfca02dde1fccb7` (`mermaId`);

--
-- Indices de la tabla `peso_mano`
--
ALTER TABLE `peso_mano`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_a2a5eb30f54f84c9618411e38d3` (`perfilRacimoId`);

--
-- Indices de la tabla `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`idProvedor`);

--
-- Indices de la tabla `query-result-cache`
--
ALTER TABLE `query-result-cache`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ranch`
--
ALTER TABLE `ranch`
  ADD PRIMARY KEY (`idHaciendad`),
  ADD KEY `FK_d0795734dc7fa25daffbffef978` (`zonaIdZona`);

--
-- Indices de la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD PRIMARY KEY (`idReporte`),
  ADD KEY `FK_7f86ec35f67c59319ed3dab908d` (`inventoryIdInventario`);

--
-- Indices de la tabla `responsable`
--
ALTER TABLE `responsable`
  ADD PRIMARY KEY (`idResponsable`),
  ADD UNIQUE KEY `REL_016b50f7b944bdc1ec84096725` (`inventoryIdInventario`),
  ADD KEY `FK_a7258b11a80eff17bf7e82432b6` (`ranchIdHaciendad`),
  ADD KEY `FK_64edd6c045dc19d59323ae8f1b0` (`userIdUsuario`);

--
-- Indices de la tabla `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sku`
--
ALTER TABLE `sku`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_defecto`
--
ALTER TABLE `tipo_defecto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `unit_md`
--
ALTER TABLE `unit_md`
  ADD PRIMARY KEY (`idUnidadMedida`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `FK_c28e52f758e7bbc53828db92194` (`roleId`);

--
-- Indices de la tabla `zona`
--
ALTER TABLE `zona`
  ADD PRIMARY KEY (`idZona`),
  ADD KEY `FK_0ab1c1845a1ad20e0e6cce3ee24` (`usersIdUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `assignment`
--
ALTER TABLE `assignment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `cajas`
--
ALTER TABLE `cajas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `calibracion`
--
ALTER TABLE `calibracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `defecto`
--
ALTER TABLE `defecto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `desgloce_merma`
--
ALTER TABLE `desgloce_merma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `doc`
--
ALTER TABLE `doc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `history`
--
ALTER TABLE `history`
  MODIFY `idHistorial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `inventory`
--
ALTER TABLE `inventory`
  MODIFY `idInventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT de la tabla `longitud_dedos`
--
ALTER TABLE `longitud_dedos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `idMantenimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `mandated`
--
ALTER TABLE `mandated`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `merma`
--
ALTER TABLE `merma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `numero_dedos`
--
ALTER TABLE `numero_dedos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `perfil_racimo`
--
ALTER TABLE `perfil_racimo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `peso_mano`
--
ALTER TABLE `peso_mano`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `provider`
--
ALTER TABLE `provider`
  MODIFY `idProvedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `query-result-cache`
--
ALTER TABLE `query-result-cache`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ranch`
--
ALTER TABLE `ranch`
  MODIFY `idHaciendad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `reporte`
--
ALTER TABLE `reporte`
  MODIFY `idReporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `responsable`
--
ALTER TABLE `responsable`
  MODIFY `idResponsable` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `sku`
--
ALTER TABLE `sku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `tipo_defecto`
--
ALTER TABLE `tipo_defecto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `unit_md`
--
ALTER TABLE `unit_md`
  MODIFY `idUnidadMedida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `zona`
--
ALTER TABLE `zona`
  MODIFY `idZona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `assignment`
--
ALTER TABLE `assignment`
  ADD CONSTRAINT `FK_6716f09408e29bd6d3477a0121e` FOREIGN KEY (`userIdUsuario`) REFERENCES `user` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_a831661be5a418d5a609650f26d` FOREIGN KEY (`ranchIdHaciendad`) REFERENCES `ranch` (`idHaciendad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `caja`
--
ALTER TABLE `caja`
  ADD CONSTRAINT `FK_682624e5e5e4001e61c73ee65ae` FOREIGN KEY (`mermaId`) REFERENCES `merma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_6ffafad3a52074d3c1c5d6e6030` FOREIGN KEY (`skuId`) REFERENCES `sku` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD CONSTRAINT `FK_0ba000365bfd6368587230df3e6` FOREIGN KEY (`mermaId`) REFERENCES `merma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `calibracion`
--
ALTER TABLE `calibracion`
  ADD CONSTRAINT `FK_7787a6ab9bbea7c572a207065e4` FOREIGN KEY (`perfilRacimoId`) REFERENCES `perfil_racimo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `defecto`
--
ALTER TABLE `defecto`
  ADD CONSTRAINT `FK_8f08c2eced4a6bfdfabec0a1664` FOREIGN KEY (`tipoDefectoId`) REFERENCES `tipo_defecto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `desgloce_merma`
--
ALTER TABLE `desgloce_merma`
  ADD CONSTRAINT `FK_5a56b5c5217dceb4b292b227e8d` FOREIGN KEY (`perfilRacimoId`) REFERENCES `perfil_racimo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_69606fd1faa0ac27dd4ecf7ceb2` FOREIGN KEY (`defectoId`) REFERENCES `defecto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `FK_03454677604b068634e7d2bd077` FOREIGN KEY (`inventarioIdInventario`) REFERENCES `inventory` (`idInventario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_03e56b7f190a6a45229277f9a7b` FOREIGN KEY (`ranchIdHaciendad`) REFERENCES `ranch` (`idHaciendad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_4a9ad6789bd3e18242521774ff8` FOREIGN KEY (`userIdUsuario`) REFERENCES `user` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `FK_8dd2318c078d937c6999cf85884` FOREIGN KEY (`categoryIdCategoria`) REFERENCES `category` (`idCategoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_f21ac8fd1de7cb0241ff0fe8e59` FOREIGN KEY (`providerIdProvedor`) REFERENCES `provider` (`idProvedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_f2bf055afafeec6b9e8aad5fd6d` FOREIGN KEY (`unitMdIdUnidadMedida`) REFERENCES `unit_md` (`idUnidadMedida`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `longitud_dedos`
--
ALTER TABLE `longitud_dedos`
  ADD CONSTRAINT `FK_cd08169a2abc6774f28e228cfee` FOREIGN KEY (`perfilRacimoId`) REFERENCES `perfil_racimo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `maintenance`
--
ALTER TABLE `maintenance`
  ADD CONSTRAINT `FK_771719a9a0575e191079462f811` FOREIGN KEY (`responsableIdResponsable`) REFERENCES `responsable` (`idResponsable`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mandated`
--
ALTER TABLE `mandated`
  ADD CONSTRAINT `FK_f434e2241eed8687d13300a8e3f` FOREIGN KEY (`ranchIdHaciendad`) REFERENCES `ranch` (`idHaciendad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `merma`
--
ALTER TABLE `merma`
  ADD CONSTRAINT `FK_8c3698e7482b626ca1dc656b633` FOREIGN KEY (`ranchIdHaciendad`) REFERENCES `ranch` (`idHaciendad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `numero_dedos`
--
ALTER TABLE `numero_dedos`
  ADD CONSTRAINT `FK_685856195c273d4965d075a3664` FOREIGN KEY (`perfilRacimoId`) REFERENCES `perfil_racimo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `perfil_racimo`
--
ALTER TABLE `perfil_racimo`
  ADD CONSTRAINT `FK_1b19437883f2dfca02dde1fccb7` FOREIGN KEY (`mermaId`) REFERENCES `merma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ea728f93fbb88daf29f46ca2d1b` FOREIGN KEY (`colorId`) REFERENCES `color` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `peso_mano`
--
ALTER TABLE `peso_mano`
  ADD CONSTRAINT `FK_a2a5eb30f54f84c9618411e38d3` FOREIGN KEY (`perfilRacimoId`) REFERENCES `perfil_racimo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ranch`
--
ALTER TABLE `ranch`
  ADD CONSTRAINT `FK_d0795734dc7fa25daffbffef978` FOREIGN KEY (`zonaIdZona`) REFERENCES `zona` (`idZona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD CONSTRAINT `FK_7f86ec35f67c59319ed3dab908d` FOREIGN KEY (`inventoryIdInventario`) REFERENCES `inventory` (`idInventario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `responsable`
--
ALTER TABLE `responsable`
  ADD CONSTRAINT `FK_016b50f7b944bdc1ec84096725f` FOREIGN KEY (`inventoryIdInventario`) REFERENCES `inventory` (`idInventario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_64edd6c045dc19d59323ae8f1b0` FOREIGN KEY (`userIdUsuario`) REFERENCES `user` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_a7258b11a80eff17bf7e82432b6` FOREIGN KEY (`ranchIdHaciendad`) REFERENCES `ranch` (`idHaciendad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_c28e52f758e7bbc53828db92194` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `zona`
--
ALTER TABLE `zona`
  ADD CONSTRAINT `FK_0ab1c1845a1ad20e0e6cce3ee24` FOREIGN KEY (`usersIdUsuario`) REFERENCES `user` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

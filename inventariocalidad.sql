-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-03-2022 a las 20:09:33
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
(15, 16, 13, 6, '2022-02-17 17:14:29'),
(16, 10, 13, 6, '2022-02-18 17:57:32'),
(17, 11, 12, 7, '2022-02-18 19:48:56'),
(18, 8, 1, 6, '2022-02-21 15:48:14');

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
(8, '1010018', 'BALANZA ELECTRONICA  CASIO  30 KG', 0, 29, 3, 3, '2022-02-17 16:55:58.980035', 1),
(9, '1010112', 'SELLADORA DE BOLSAS 3M M', 0, 29, 3, 3, '2022-02-17 16:56:23.325160', 0),
(10, '1270042', 'SOPLADORA/ASPIRADORA', 0, 29, 3, 3, '2022-02-17 16:56:47.617899', 1),
(11, '1270023', 'TIJERA PARA EMPAQUE', 0, 29, 3, 3, '2022-02-17 16:57:18.069148', 1),
(12, '1030069', 'TABLA DE EMBALAR 2.5CMS', 0, 29, 3, 3, '2022-02-17 16:57:59.168877', 0),
(13, '1030064', 'RADIO DE 21*46* E. 1.75\"', 0, 29, 3, 3, '2022-02-17 16:59:36.111010', 0),
(14, '1030063', 'RADIO DE 21*46* E. 1.25\"', 0, 29, 3, 3, '2022-02-17 16:59:56.061044', 0),
(15, '1030034', 'TABLA DE PICAR SANEO 50*70*3 CM', 0, 29, 3, 3, '2022-02-17 17:00:11.451813', 0),
(16, '1010100', 'BALANZA ELECTRONICA DE PISO', 0, 29, 3, 3, '2022-02-17 17:00:27.921336', 1),
(17, '1010042', 'BALANZA ELECTRONICA GRAMERA', 0, 29, 3, 3, '2022-02-17 17:00:58.839550', 0),
(18, '1010109', 'BALANZA COLGANTE 110 LBS', 0, 29, 3, 3, '2022-02-17 17:01:16.979406', 0),
(19, '1270012', 'BANDEJAS VERDES 3 DIVISIONES 45 PERFORACIONES 86 X 68 X 7 CM', 0, 29, 3, 3, '2022-02-17 17:01:35.806296', 0),
(20, '1270011', 'BANDEJAS NEGRA 3 DIVISIONES 21 PERFORACIONES 91 X 71 X 11.5 CM', 0, 29, 3, 3, '2022-02-17 17:01:51.856223', 0),
(21, '1010090', 'BANDEJAS NARANJA 3 DIVISIONES 21 PERFORACIONES 91 X 71 X 11.5 CM', 0, 29, 3, 3, '2022-02-17 17:02:08.660182', 0),
(23, '1360035', 'CLARIFICADOR DE AGUA PRP 8000', 0, 30, 2, 3, '2022-02-21 18:33:32.680640', 0),
(24, '1030033', 'DETERGENTE INDUSTRIAL 1 KG', 0, 30, 2, 3, '2022-02-21 18:33:58.529219', 0),
(25, '1010047', 'DIOXIDO DE CLORO AL 18% CANECA 30 LTS', 0, 30, 5, 3, '2022-02-21 18:34:17.473310', 0),
(26, '1010046', 'DIOXIDO DE CLORO AL 18% TANQUE 220LTS', 0, 30, 5, 3, '2022-02-21 18:34:34.473149', 0),
(27, '1150007', 'ESCOBA DE MADERA PARA LIMPIEZA', 0, 30, 3, 3, '2022-02-21 18:36:36.787314', 0),
(28, '1150003', 'ESCOBILLON 60CM M/T CERDAS DURAS', 0, 30, 3, 3, '2022-02-21 18:36:55.308261', 0),
(29, '1150004', 'ESPONJA SALVA UÑAS SOLEX', 0, 30, 3, 3, '2022-02-21 18:37:10.115167', 0),
(30, '1150008', 'ESTROPAJO DE ALUMINIO INDUSTRIAL', 0, 30, 3, 3, '2022-02-21 18:37:27.076570', 0),
(31, '1030025', 'LIMPIADOR BANALATEX HUMEDO', 0, 30, 7, 3, '2022-02-21 18:37:48.344569', 0),
(32, '1380014', 'LIMPIADOR BANALATEX SECO', 0, 30, 7, 3, '2022-02-21 18:38:21.694185', 0),
(33, '1030027', 'SACO DE ACIDO CITRICO 25 KG', 0, 30, 2, 3, '2022-02-21 18:38:41.476629', 0),
(34, '1150010', 'SANIT MASTER (AMONIO CUATERNARIO)', 0, 30, 5, 3, '2022-02-21 18:39:21.408242', 0),
(35, '1030047', 'TACHO DE CLORO GRANULADO 45 KILOS', 0, 30, 2, 3, '2022-02-21 18:39:41.005593', 0),
(36, '1170119', 'PROTEC K  (CONTROL COCHINILLA)', 0, 30, 5, 3, '2022-02-21 18:40:00.841897', 0),
(37, '1210003', 'NP-CONTROL (COCHINILLA) CANECA X20LTS', 0, 30, 5, 3, '2022-02-21 18:40:17.445223', 0),
(38, '1380053', 'TARJETA PLASTIFICADA P/IDENTIFICACION DE EMPAQUE', 0, 31, 3, 3, '2022-02-21 18:42:04.255294', 0),
(39, '1120289', 'BOQUILLA 8002', 0, 31, 3, 3, '2022-02-21 18:42:32.114621', 0),
(40, '1360067', 'TINTA SELLO COLOR ROJO FRASCO PEQUEÑO', 0, 31, 3, 3, '2022-02-21 18:42:49.694110', 0),
(41, '1360067', 'TINTA SELLO COLOR ROJO FRASCO PEQUEÑO', 0, 31, 3, 3, '2022-02-21 18:44:10.819658', 0),
(42, '1360064', 'TIZA BLANCA (CAJA 144 UND)', 0, 31, 3, 3, '2022-02-21 18:44:32.320822', 0),
(43, '1010125', 'SELLO 26P CON CIRCULO ', 0, 31, 3, 3, '2022-02-21 18:47:14.524918', 0),
(44, '1010124', 'SELLO 26PN', 0, 31, 3, 3, '2022-02-21 18:47:32.801226', 0),
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
(70, '1260030', 'BOTA CAUCHO AMARILLA TALLA# 37', 0, 32, 3, 3, '2022-02-21 18:59:18.014746', 0);

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
(29, 1, 'caulquera', 1, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 10),
(30, 0, 'asdasdasd', 1, '2022-02-21 14:39:14.806242', '2022-02-21 14:51:23.000000', 12),
(31, 1, 'otra cosa', 1, '2022-02-21 14:52:16.799411', '2022-02-21 15:05:14.000000', 12),
(32, 2, 'dasdasd', 1, '2022-02-21 15:05:30.237647', '2022-02-21 15:20:00.000000', 12);

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `merma`
--

CREATE TABLE `merma` (
  `id` int(11) NOT NULL,
  `rCortado` int(11) NOT NULL,
  `rProcesado` int(11) NOT NULL,
  `ranchIdHaciendad` int(11) DEFAULT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `rRechazados` int(11) NOT NULL,
  `pesoFruta` int(11) NOT NULL,
  `calibracion` int(11) NOT NULL,
  `nManos` int(11) NOT NULL,
  `edad` int(11) NOT NULL,
  `ratio` int(11) NOT NULL,
  `mermaProcesada` int(11) NOT NULL,
  `mermaCortada` int(11) NOT NULL,
  `lDedoSegunda` int(11) NOT NULL,
  `lDedoUltima` int(11) NOT NULL,
  `totalCajas` int(11) NOT NULL,
  `pesoRacimo` int(11) NOT NULL,
  `pesoTallo` int(11) NOT NULL,
  `pesoSegundaMano` int(11) NOT NULL,
  `pesoUltimaMano` int(11) NOT NULL,
  `numManosVotadasP` int(11) NOT NULL,
  `numManosVotadasU` int(11) NOT NULL,
  `skuId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(10, '2022-02-17 17:14:29.761537', 6, 16, 13),
(11, '2022-02-18 17:57:31.893695', 6, 10, 13),
(12, '2022-02-18 19:48:56.527865', 7, 11, 12),
(13, '2022-02-21 15:48:14.412345', 6, 8, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sku`
--

CREATE TABLE `sku` (
  `id` int(11) NOT NULL,
  `marca` varchar(255) NOT NULL,
  `peso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`idUsuario`, `nombre`, `contraseña`, `createdAt`, `updatedAt`, `numCedula`, `role`) VALUES
(1, 'jonathan', '$2b$10$AH/WuLldBcIbwkGKFi4gz.8/DaUqCv2fCY29fzmoYvYP6TOMaUPFG', '2022-02-04 13:31:52.152950', '2022-02-04 16:45:20.031526', '1207207752', 'admin'),
(12, 'GPM', '$2b$10$M.iCPn0ZmCSPbQYJ2zasweTltJPd/eXjUECiF2g.DD6794Tuii4Hi', '2022-02-04 16:24:42.683933', '2022-02-07 20:42:59.000000', '0908783426', 'admin'),
(13, 'LEANDRO PEREZ', '$2b$10$NyZ3q5xOGLpNaCEKQyf1wOPpGltuAlsTXRCPXFKvufyP6c7.CFCMK', '2022-02-08 15:51:58.767665', '2022-02-08 15:51:58.767665', '1203362528', 'SuperAdmin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zona`
--

CREATE TABLE `zona` (
  `idZona` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `zona`
--

INSERT INTO `zona` (`idZona`, `nombre`) VALUES
(1, 'zona 1'),
(2, 'zona 2'),
(3, 'zona 3'),
(4, 'zona 4');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_0ba000365bfd6368587230df3e6` (`mermaId`);

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `doc`
--
ALTER TABLE `doc`
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
  ADD KEY `FK_8c3698e7482b626ca1dc656b633` (`ranchIdHaciendad`),
  ADD KEY `FK_d054c82f3e49ac1f8b3c17467c0` (`skuId`);

--
-- Indices de la tabla `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`idProvedor`);

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
  ADD KEY `FK_016b50f7b944bdc1ec84096725f` (`inventoryIdInventario`),
  ADD KEY `FK_64edd6c045dc19d59323ae8f1b0` (`userIdUsuario`);

--
-- Indices de la tabla `sku`
--
ALTER TABLE `sku`
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
  ADD PRIMARY KEY (`idUsuario`);

--
-- Indices de la tabla `zona`
--
ALTER TABLE `zona`
  ADD PRIMARY KEY (`idZona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cajas`
--
ALTER TABLE `cajas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `doc`
--
ALTER TABLE `doc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `history`
--
ALTER TABLE `history`
  MODIFY `idHistorial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `inventory`
--
ALTER TABLE `inventory`
  MODIFY `idInventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT de la tabla `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `idMantenimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `mandated`
--
ALTER TABLE `mandated`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `merma`
--
ALTER TABLE `merma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `provider`
--
ALTER TABLE `provider`
  MODIFY `idProvedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `idResponsable` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `sku`
--
ALTER TABLE `sku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `unit_md`
--
ALTER TABLE `unit_md`
  MODIFY `idUnidadMedida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `zona`
--
ALTER TABLE `zona`
  MODIFY `idZona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD CONSTRAINT `FK_0ba000365bfd6368587230df3e6` FOREIGN KEY (`mermaId`) REFERENCES `merma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `FK_8c3698e7482b626ca1dc656b633` FOREIGN KEY (`ranchIdHaciendad`) REFERENCES `ranch` (`idHaciendad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_d054c82f3e49ac1f8b3c17467c0` FOREIGN KEY (`skuId`) REFERENCES `sku` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

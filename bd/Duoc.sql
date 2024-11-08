-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 08-11-2024 a las 21:35:53
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Duoc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ASIGNATURA`
--

CREATE TABLE `ASIGNATURA` (
  `id_asignatura` int(11) NOT NULL,
  `nombre_asignatura` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CLASE`
--

CREATE TABLE `CLASE` (
  `id_clase` int(11) NOT NULL,
  `num_clase` int(11) NOT NULL,
  `id_asignatura` int(11) NOT NULL,
  `id_seccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ASIGNATURA`
--
ALTER TABLE `ASIGNATURA`
  ADD PRIMARY KEY (`id_asignatura`);

--
-- Indices de la tabla `CLASE`
--
ALTER TABLE `CLASE`
  ADD PRIMARY KEY (`id_clase`),
  ADD KEY `fk_id_asignatura` (`id_asignatura`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `CLASE`
--
ALTER TABLE `CLASE`
  ADD CONSTRAINT `fk_id_asignatura` FOREIGN KEY (`id_asignatura`) REFERENCES `ASIGNATURA` (`id_asignatura`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

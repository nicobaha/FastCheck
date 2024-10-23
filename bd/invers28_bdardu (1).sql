-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 23, 2024 at 03:56 PM
-- Server version: 8.0.37-cll-lve
-- PHP Version: 8.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invers28_bdardu`
--

-- --------------------------------------------------------

--
-- Table structure for table `Alumno`
--

CREATE TABLE `Alumno` (
  `huella_id` int NOT NULL,
  `rut_alumno` int NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `correo_electronico` varchar(100) NOT NULL,
  `id_carrera` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Alumno`
--

INSERT INTO `Alumno` (`huella_id`, `rut_alumno`, `nombre_completo`, `correo_electronico`, `id_carrera`) VALUES
(1, 19308972, 'Juan Pérez', 'juan.perez@email.com', 1),
(2, 20145569, 'María González', 'maria.gonzalez@email.com', 2),
(3, 21567890, 'Ana López', 'ana.lopez@email.com', 4),
(4, 23456789, 'Luis Martínez', 'luis.martinez@email.com', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Arduino`
--

CREATE TABLE `Arduino` (
  `ID_ARDUINO` int NOT NULL,
  `ASISTENCIA` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Alumno`
--
ALTER TABLE `Alumno`
  ADD PRIMARY KEY (`huella_id`);

--
-- Indexes for table `Arduino`
--
ALTER TABLE `Arduino`
  ADD PRIMARY KEY (`ID_ARDUINO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
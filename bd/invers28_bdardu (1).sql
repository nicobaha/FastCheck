-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 24, 2024 at 07:50 AM
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
  `asistencia` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `Arduino`
--
DELIMITER $$
CREATE TRIGGER `presente` AFTER INSERT ON `Arduino` FOR EACH ROW BEGIN
    DECLARE alumno_rut INT;

    -- Obtener el rut del alumno usando ID_ARDUINO = huella_id
    SELECT rut_alumno INTO alumno_rut 
    FROM Alumno 
    WHERE huella_id = NEW.ID_ARDUINO;

    -- Insertar en Data_para_enviar
    INSERT INTO Data_para_enviar (rut_alumno, PRESENTE, COD_CLASE)
    VALUES (alumno_rut, NEW.asistencia, NULL);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Data_para_enviar`
--

CREATE TABLE `Data_para_enviar` (
  `rut_alumno` int NOT NULL,
  `PRESENTE` int DEFAULT NULL,
  `COD_CLASE` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Arduino`
--
ALTER TABLE `Arduino`
  ADD CONSTRAINT `fk_arduino_huella` FOREIGN KEY (`ID_ARDUINO`) REFERENCES `Alumno` (`huella_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- Servidor: localhost:3306
-- Tiempo de generación: 24-10-2024 a las 10:01:43
-- Versión del servidor: 8.0.37-cll-lve
-- Versión de PHP: 8.3.12

USE fastnae;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Estructura de tabla para la tabla `Alumno`
--

CREATE TABLE `Alumno` (
  `huella_id` int NOT NULL AUTO_INCREMENT,
  `rut_alumno` int NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `correo_electronico` varchar(100) NOT NULL,
  `id_carrera` int DEFAULT NULL,
  PRIMARY KEY (`huella_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Alumno`
--

INSERT INTO `Alumno` (`huella_id`, `rut_alumno`, `nombre_completo`, `correo_electronico`, `id_carrera`) VALUES
(1, 19308972, 'Juan Pérez', 'juan.perez@email.com', 1),
(2, 20145569, 'María González', 'maria.gonzalez@email.com', 2),
(3, 21567890, 'Ana López', 'ana.lopez@email.com', 4),
(4, 23456789, 'Luis Martínez', 'luis.martinez@email.com', 3);

--
-- Estructura de tabla para la tabla `Arduino`
--

CREATE TABLE `Arduino` (
  `ID_ARDUINO` int NOT NULL,
  `asistencia` int DEFAULT NULL,
  PRIMARY KEY (`ID_ARDUINO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Trigger para insertar en Data_para_enviar después de una inserción en Arduino
--

DELIMITER //

CREATE TRIGGER `presente` AFTER INSERT ON `Arduino` FOR EACH ROW 
BEGIN
    DECLARE alumno_rut INT;

    -- Obtener el rut del alumno usando ID_ARDUINO = huella_id
    SELECT rut_alumno INTO alumno_rut 
    FROM Alumno 
    WHERE huella_id = NEW.ID_ARDUINO;

    -- Insertar en Data_para_enviar
    INSERT INTO Data_para_enviar (rut_alumno, PRESENTE, COD_CLASE)
    VALUES (alumno_rut, NEW.asistencia, NULL);
END//

DELIMITER ;

--
-- Estructura de tabla para la tabla `Data_para_enviar`
--

CREATE TABLE `Data_para_enviar` (
  `rut_alumno` int NOT NULL,
  `PRESENTE` int DEFAULT NULL,
  `COD_CLASE` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

ALTER TABLE `Arduino`
  ADD CONSTRAINT `fk_arduino_huella` FOREIGN KEY (`ID_ARDUINO`) REFERENCES `Alumno` (`huella_id`) ON DELETE CASCADE;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

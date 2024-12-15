-- Deshabilitar las claves foráneas temporalmente para evitar errores al eliminar
SET FOREIGN_KEY_CHECKS = 0;

-- Eliminar las tablas si existen
DROP TABLE IF EXISTS `CLASE`;
DROP TABLE IF EXISTS `ALUMNO`;
DROP TABLE IF EXISTS `DIA`;
DROP TABLE IF EXISTS `ASIGNATURA`;
DROP TABLE IF EXISTS `Data_recibida`;

-- Crear la tabla ASIGNATURA
CREATE TABLE `ASIGNATURA` (
  `id_asignatura` INT(11) NOT NULL,
  `nombre_asignatura` VARCHAR(200) DEFAULT NULL,
  `cant_clases` INT NOT NULL,
  PRIMARY KEY (`id_asignatura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Crear la tabla DIA
CREATE TABLE `DIA` (
  `id_dia` INT(11) NOT NULL,
  `nombre_dia` VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (`id_dia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Poblar la tabla DIA
INSERT INTO `DIA` (`id_dia`, `nombre_dia`) VALUES
(1, 'Lunes'),
(2, 'Martes'),
(3, 'Miércoles'),
(4, 'Jueves'),
(5, 'Viernes'),
(6, 'Sábado')
ON DUPLICATE KEY UPDATE nombre_dia=VALUES(nombre_dia);

-- Crear la tabla ALUMNO
CREATE TABLE `ALUMNO` (
  `rut` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`rut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Poblar la tabla ALUMNO
INSERT INTO `ALUMNO` (`rut`, `nombre`) VALUES
(19308972, 'Juan Pérez'),
(16894402, 'Andres Blauboeer'),
(20434053, 'Pedro Gutiérrez'),
(33333333, 'Carlos González');

-- Crear la tabla CLASE
CREATE TABLE `CLASE` (
  `id_clase` INT(11) NOT NULL AUTO_INCREMENT,
  `num_clase` INT(11) NOT NULL,
  `id_asignatura` INT(11) NOT NULL,
  `id_seccion` INT(11) NOT NULL,
  `rut` INT,
  `presente` BOOLEAN DEFAULT 0,
  `id_dia` INT NOT NULL,
  PRIMARY KEY (`id_clase`),
  KEY `fk_id_asignatura` (`id_asignatura`),
  KEY `fk_id_dia` (`id_dia`),
  CONSTRAINT `fk_id_asignatura` FOREIGN KEY (`id_asignatura`) REFERENCES `ASIGNATURA` (`id_asignatura`),
  CONSTRAINT `fk_rut_alumno` FOREIGN KEY (`rut`) REFERENCES `ALUMNO` (`rut`),
  CONSTRAINT `fk_id_dia` FOREIGN KEY (`id_dia`) REFERENCES `DIA` (`id_dia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Poblar la tabla ASIGNATURA
INSERT INTO `ASIGNATURA` (`id_asignatura`, `nombre_asignatura`, `cant_clases`) VALUES
(1, 'Matemáticas', 10),
(2, 'Historia', 8),
(3, 'Java', 12),
(4, 'Inglés', 6),
(5, 'Base de Datos', 9)
ON DUPLICATE KEY UPDATE 
    nombre_asignatura=VALUES(nombre_asignatura),
    cant_clases=VALUES(cant_clases);

-- Poblar la tabla CLASE con id_dia
INSERT INTO `CLASE` (`id_clase`, `num_clase`, `id_asignatura`, `id_seccion`, `rut`, `presente`, `id_dia`) VALUES
(1, 1, 1, 1, 19308972, TRUE, 1),
(2, 2, 1, 1, 19308972, FALSE, 2),
(4, 4, 2, 2, 16894402, FALSE, 3);

-- Crear la tabla Data_recibida
CREATE TABLE `Data_recibida` (
  `rut_alumno` INT NOT NULL,
  `PRESENTE` INT DEFAULT NULL,
  `COD_CLASE` INT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Poblar la tabla Data_recibida
INSERT INTO `Data_recibida` (`rut_alumno`, `PRESENTE`, `COD_CLASE`) VALUES
(19308972, 1, 1);

-- Eliminar el procedimiento almacenado si existe
DROP PROCEDURE IF EXISTS InsertarDesdeDataRecibida;

-- Crear el procedimiento almacenado
DELIMITER $$

CREATE PROCEDURE InsertarDesdeDataRecibida()
BEGIN
    DECLARE ultimo_num_clase INT;

    -- Obtener el último valor de num_clase en la tabla CLASE
    SELECT COALESCE(MAX(num_clase), 0) INTO ultimo_num_clase FROM CLASE;

    -- Incrementar el número de clase
    SET ultimo_num_clase = ultimo_num_clase + 1;

    -- Insertar los datos desde la tabla Data_recibida a CLASE
    INSERT INTO CLASE (id_clase, num_clase, id_asignatura, id_seccion, rut, presente, id_dia)
    SELECT 
        NULL,                   -- id_clase: auto-increment
        ultimo_num_clase,       -- num_clase: nuevo número de clase
        dr.COD_CLASE,           -- id_asignatura: código de clase desde Data_recibida
        1,                      -- id_seccion: valor fijo
        dr.rut_alumno,          -- rut: RUT del alumno
        dr.PRESENTE,            -- presente: estado de asistencia
        1                       -- id_dia: valor fijo
    FROM Data_recibida dr;
END$$

DELIMITER ;

-- Rehabilitar las claves foráneas
SET FOREIGN_KEY_CHECKS = 1;
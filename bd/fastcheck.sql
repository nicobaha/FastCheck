-- Deshabilitar las claves foráneas temporalmente
SET FOREIGN_KEY_CHECKS = 0;

-- Eliminar las tablas si existen
DROP TABLE IF EXISTS `Arduino`;
DROP TABLE IF EXISTS `Data_para_enviar`;
DROP TABLE IF EXISTS `Alumno`;

-- Habilitar las claves foráneas
SET FOREIGN_KEY_CHECKS = 1;

-- Crear la tabla Alumno
CREATE TABLE `Alumno` (
  `huella_id` int NOT NULL AUTO_INCREMENT,
  `rut_alumno` int NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `correo_electronico` varchar(100) NOT NULL,
  `id_carrera` int DEFAULT NULL,
  PRIMARY KEY (`huella_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Poblar la tabla Alumno
INSERT INTO `Alumno` (`huella_id`, `rut_alumno`, `nombre_completo`, `correo_electronico`, `id_carrera`) VALUES
(1, 19308972, 'Nicolas Bahamonde', 'ni.bahamonde@duocuc.cl', 1),
(2, 19308971, 'Gabriel Contreras', 'ga@duocuc.cl', 1),
(3, 21483186, 'Ella Zampeze', 'el.zampeze@duocuc.cl', 1),
(4, 21918279, 'Antonia Retamal', 'anretamal@duocuc.cl', 1);

-- Crear la tabla Arduino
CREATE TABLE `Arduino` (
  `ID_ARDUINO` int NOT NULL,
  `asistencia` int DEFAULT NULL,
  PRIMARY KEY (`ID_ARDUINO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Crear la tabla Data_para_enviar con COD_CLASE autoincrementable
CREATE TABLE `Data_para_enviar` (
  `rut_alumno` int NOT NULL,
  `PRESENTE` int DEFAULT NULL,
  `COD_CLASE` int NOT NULL AUTO_INCREMENT PRIMARY KEY
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Crear el trigger para insertar en Data_para_enviar después de una inserción en Arduino
DELIMITER //

CREATE TRIGGER `presente` AFTER INSERT ON `Arduino` FOR EACH ROW 
BEGIN
    DECLARE alumno_rut INT;

    -- Obtener el rut del alumno usando ID_ARDUINO = huella_id
    SELECT rut_alumno INTO alumno_rut 
    FROM Alumno 
    WHERE huella_id = NEW.ID_ARDUINO;

    -- Insertar en Data_para_enviar
    INSERT INTO Data_para_enviar (rut_alumno, PRESENTE)
    VALUES (alumno_rut, NEW.asistencia);
END//

DELIMITER ;

-- Agregar restricción de clave foránea en Arduino
ALTER TABLE `Arduino`
  ADD CONSTRAINT `fk_arduino_huella` FOREIGN KEY (`ID_ARDUINO`) REFERENCES `Alumno` (`huella_id`) ON DELETE CASCADE;

-- Confirmar los cambios
COMMIT;
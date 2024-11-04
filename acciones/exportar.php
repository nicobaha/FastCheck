<?php
// Conexión a la base de datos
include 'conexion.php';

// Consulta de los datos
$query = "SELECT huella_id, rut_alumno, nombre_completo, correo_electronico, id_carrera FROM alumno";
$stmt = $conn->prepare($query);
$stmt->execute();

$alumno = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Configuración del archivo Excel
header("Content-Type: application/vnd.ms-excel");
header("Content-Disposition: attachment; filename=alumno.xls");
header("Pragma: no-cache");
header("Expires: 0");

// Encabezados de la tabla
echo "Huella ID\tRUT\tNombre Completo\tCorreo Electrónico\tID Carrera\n";

// Datos de la tabla
foreach ($alumno as $estudiante) {
    echo "{$estudiante['huella_id']}\t{$estudiante['rut_alumno']}\t{$estudiante['nombre_completo']}\t{$estudiante['correo_electronico']}\t{$estudiante['id_carrera']}\n";
}
?>

<?php
include 'conexion.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $accion = $_POST['accion'];
    $id = $_POST['id'] ?? '';
    $rut_alumno = $_POST['rut_alumno'];
    $nombre_completo = $_POST['nombre_completo'];
    $correo_electronico = $_POST['correo_electronico'];
    $id_carrera = $_POST['id_carrera'];

    if ($accion == 'agregar') {
        $query = "INSERT INTO alumno (rut_alumno, nombre_completo, correo_electronico, id_carrera) VALUES (:rut_alumno, :nombre_completo, :correo_electronico, :id_carrera)";
        $stmt = $conn->prepare($query);
    } elseif ($accion == 'editar') {
        $query = "UPDATE alumno SET rut_alumno = :rut_alumno, nombre_completo = :nombre_completo, correo_electronico = :correo_electronico, id_carrera = :id_carrera WHERE huella_id = :id";
        $stmt = $conn->prepare($query);
        $stmt->bindParam(':id', $id);
    }

    $stmt->bindParam(':rut_alumno', $rut_alumno);
    $stmt->bindParam(':nombre_completo', $nombre_completo);
    $stmt->bindParam(':correo_electronico', $correo_electronico);
    $stmt->bindParam(':id_carrera', $id_carrera);
    $stmt->execute();

    header('Location: ../index.php');
    exit();
}

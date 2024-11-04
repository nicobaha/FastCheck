<?php
include 'conexion.php';

$id = '';
$rut_alumno = '';
$nombre_completo = '';
$correo_electronico = '';
$id_carrera = '';

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $query = "SELECT * FROM alumno WHERE huella_id = :id";
    $stmt = $conn->prepare($query);
    $stmt->bindParam(':id', $id);
    $stmt->execute();
    $estudiante = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($estudiante) {
        $rut_alumno = $estudiante['rut_alumno'];
        $nombre_completo = $estudiante['nombre_completo'];
        $correo_electronico = $estudiante['correo_electronico'];
        $id_carrera = $estudiante['id_carrera'];
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario Estudiante</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2><?= $id ? 'Editar Estudiante' : 'Agregar Estudiante' ?></h2>
        <form action="acciones.php" method="POST">
            <input type="hidden" name="id" value="<?= $id ?>">
            <div class="mb-3">
                <label for="rut_alumno" class="form-label">RUT</label>
                <input type="text" class="form-control" name="rut_alumno" value="<?= $rut_alumno ?>" required>
            </div>
            <div class="mb-3">
                <label for="nombre_completo" class="form-label">Nombre Completo</label>
                <input type="text" class="form-control" name="nombre_completo" value="<?= $nombre_completo ?>" required>
            </div>
            <div class="mb-3">
                <label for="correo_electronico" class="form-label">Correo Electrónico</label>
                <input type="email" class="form-control" name="correo_electronico" value="<?= $correo_electronico ?>" required>
            </div>
            <div class="mb-3">
                <label for="id_carrera" class="form-label">ID Carrera</label>
                <input type="text" class="form-control" name="id_carrera" value="<?= $id_carrera ?>" required>
            </div>
            <button type="submit" name="accion" value="<?= $id ? 'editar' : 'agregar' ?>" class="btn btn-primary"><?= $id ? 'Actualizar' : 'Agregar' ?></button>
            <a href="../index.php" class="btn btn-secondary">Cancelar</a>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
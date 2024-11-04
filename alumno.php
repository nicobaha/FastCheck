<?php
// Conexión a la base de datos
include 'acciones/conexion.php';

// Consulta de los datos
$query = "SELECT huella_id, rut_alumno, nombre_completo, correo_electronico, id_carrera FROM Alumno";

try {
    $stmt = $conn->prepare($query);
    $stmt->execute();
    $alumno = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "Error en la consulta: " . $e->getMessage();
    exit();
}
?>

<table class="table table-striped table-bordered">
    <thead class="table-dark">
        <tr>
            <th>Huella ID</th>
            <th>RUT</th>
            <th>Nombre Completo</th>
            <th>Correo Electrónico</th>
            <th>ID Carrera</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($alumno as $estudiante): ?>
            <tr>
                <td><?= htmlspecialchars($estudiante['huella_id']) ?></td>
                <td><?= htmlspecialchars($estudiante['rut_alumno']) ?></td>
                <td><?= htmlspecialchars($estudiante['nombre_completo']) ?></td>
                <td><?= htmlspecialchars($estudiante['correo_electronico']) ?></td>
                <td><?= htmlspecialchars($estudiante['id_carrera']) ?></td>
                <td>
                    
                    <a href="acciones/formulario.php?id=<?= $estudiante['huella_id'] ?>" class="btn btn-warning btn-sm">Editar</a>
                    <a href="acciones/delete.php?id=<?= $estudiante['huella_id'] ?>" class="btn btn-danger btn-sm" onclick="return confirm('¿Estás seguro de eliminar este estudiante?');">Eliminar</a>
                </td>
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>
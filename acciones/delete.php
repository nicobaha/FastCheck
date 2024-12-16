<?php
include 'conexion.php';

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    try {
        $query = "DELETE FROM alumno WHERE huella_id = :id";
        $stmt = $conn->prepare($query);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();

        if ($stmt->rowCount() > 0) {
            echo "El alumno ha sido eliminado correctamente.";
        } else {
            echo "No se encontró ningún alumno con el ID especificado.";
        }
    } catch (PDOException $e) {
        echo "Error al eliminar el alumno: " . $e->getMessage();
    }
}
header('Location: ../sistema.php');
exit();

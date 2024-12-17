<?php 
$host = 'localhost';    // Cambia si tu servidor es distinto
$dbname = 'fastnae';   // Nombre de la base de datos en Workbench
$username = 'root';   // Nombre de usuario de MySQL Workbench
$password = 'root';  // Contraseña de MySQL Workbench

try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
    exit();
}
?>

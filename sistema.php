<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de alumno</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="mb-4">Lista de alumno</h1>
        <div class="mb-3">
            <a href="acciones/formulario.php" class="btn btn-primary">Agregar Nuevo Estudiante</a>
            <a href="acciones/exportar.php" class="btn btn-success">Exportar a Excel</a>
        </div>
        <div class="table-responsive">
            <?php include 'alumno.php'; ?>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

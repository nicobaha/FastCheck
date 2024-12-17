<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Programación de Clases</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@400;700&display=swap" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/docente.css">
</head>
<body>
    <!-- Header -->
    <header class="py-2 text-white d-flex justify-content-between align-items-center px-4">
        <img src="img/logo-duoc-v2.png" alt="Duoc Logo" height="40">
        <div id="current-time" class="fw-bold"></div>
    </header>

    <!-- Main Container -->
    <main class="bg-light py-4">
        <div class="container bg-white p-4 rounded shadow custom-container">
            <h2 class="mb-4">Programación de Clases</h2>
            
            <!-- Filters -->
            <div class="row mb-4">
                <div class="col-md-4 mb-3">
                    <label for="period">Seleccione Periodo</label>
                    <select id="period" class="form-select">
                        <option>SELECCIONE PERIODO</option>
                    </select>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="sede">Descargar Horario - Sedes</label>
                    <select id="sede" class="form-select">
                        <option>PUERTO MONTT</option>
                    </select>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="weeks">Semanas</label>
                    <select id="weeks" class="form-select">
                        <option>SELECCIONE UNA O MÁS ALTERNATIVAS</option>
                    </select>
                </div>
            </div>
            
            <!-- Buttons -->
            <div class="mb-4 d-flex flex-column">
                <button class="btn btn-success mb-2">Descargar Horario</button>
                <button class="btn btn-secondary">Visualizar Horario</button>
            </div>

            <!-- Table -->
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead class="bg-primary text-white">
                        <tr>
                            <th>Sede</th>
                            <th>Nombre Asignaturas</th>
                            <th>Sigla Sección</th>
                            <th>Jornada</th>
                            <th>Registrar Clase</th>
                            <th>Histórico Asistencia</th>
                            <th>Bitácora Evento</th>
                            <th>N° Clases Registradas</th>
                            <th>Asistencia Promedio</th>
                            <th>Último Registro</th>
                            <th>Reprobación por Inasistencia</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>PUERTO MONTT</td>
                            <td>ARQUITECTURA - (PRÁCTICO)</td>
                            <td>ASY4131-002D</td>
                            <td>D</td>
                            <td><a href="seccion.php" class="btn btn-success btn-sm plus-btn"><img src="icons/plus-lg.svg" alt="Add"></a></td>
                            <td><button class="btn btn-light btn-sm file-btn"><img src="icons/file-earmark-arrow-down-fill.svg" alt="Descargar"></button></td>
                            <td><button class="btn btn-light btn-sm file-btn"><img src="icons/file-earmark-arrow-down-fill.svg" alt="Descargar"></button></td>
                            <td>27</td>
                            <td class="text-danger">84%</td>
                            <td>12-12-2024</td>
                            <td>N/A</td>
                        </tr>
                        <tr>
                            <td>PUERTO MONTT</td>
                            <td>BASE DE DATOS APLICADA 1 - (PRÁCTICO)</td>
                            <td>BOY1101-003D</td>
                            <td>D</td>
                            <td><button class="btn btn-success btn-sm plus-btn"><img src="icons/plus-lg.svg" alt="Add"></button></td>
                            <td><button class="btn btn-light btn-sm file-btn"><img src="icons/file-earmark-arrow-down-fill.svg" alt="Descargar"></button></td>
                            <td><button class="btn btn-light btn-sm file-btn"><img src="icons/file-earmark-arrow-down-fill.svg" alt="Descargar"></button></td>
                            <td>25</td>
                            <td class="text-danger">81%</td>
                            <td>08-12-2024</td>
                            <td>N/A</td>
                        </tr>
                        <tr>
                            <td>PUERTO MONTT</td>
                            <td>ARQUITECTURA - (PRÁCTICO)</td>
                            <td>ASY4131-002D</td>
                            <td>D</td>
                            <td><button class="btn btn-success btn-sm plus-btn"><img src="icons/plus-lg.svg" alt="Add"></button></td>
                            <td><button class="btn btn-light btn-sm file-btn"><img src="icons/file-earmark-arrow-down-fill.svg" alt="Descargar"></button></td>
                            <td><button class="btn btn-light btn-sm file-btn"><img src="icons/file-earmark-arrow-down-fill.svg" alt="Descargar"></button></td>
                            <td>25</td>
                            <td class="text-danger">81%</td>
                            <td>07-12-2024</td>
                            <td>N/A</td>
                        </tr>
                        <tr>
                            <td>PUERTO MONTT</td>
                            <td>BASE DE DATOS APLICADA 1 - (PRÁCTICO)</td>
                            <td>BOY1101-004D</td>
                            <td>D</td>
                            <td><button class="btn btn-success btn-sm plus-btn"><img src="icons/plus-lg.svg" alt="Add"></button></td>
                            <td><button class="btn btn-light btn-sm file-btn"><img src="icons/file-earmark-arrow-down-fill.svg" alt="Descargar"></button></td>
                            <td><button class="btn btn-light btn-sm file-btn"><img src="icons/file-earmark-arrow-down-fill.svg" alt="Descargar"></button></td>
                            <td>25</td>
                            <td class="text-danger">85%</td>
                            <td>07-12-2024</td>
                            <td>N/A</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <script>
        function updateTime() {
            const timeElement = document.getElementById("current-time");
            const now = new Date();
            const options = { 
                weekday: 'long', year: 'numeric', month: 'long', day: 'numeric', 
                hour: '2-digit', minute: '2-digit', second: '2-digit' 
            };
            timeElement.textContent = now.toLocaleDateString('es-ES', options);
        }
        setInterval(updateTime, 1000);
        updateTime();
    </script>
</body>
</html>

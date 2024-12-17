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
    <link rel="stylesheet" href="css/seccion.css">
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

                <!-- Filters -->
                <div class="d-flex flex-wrap justify-content-between mb-4 align-items-center">
                    <div class="d-flex flex-column me-4">
                        <h5 for="sede" class="mb-1">SEDE</h5>
                        <p class="mb-0">PUERTO MONTT</p>
                    </div>
                    <div class="d-flex flex-column me-4">
                        <h5 for="asign" class="mb-1">NOMBRE ASIGNATURA</h5>
                        <p class="mb-0">ARQUITECTURA</p>
                    </div>
                    <div class="d-flex flex-column me-4">
                        <h5 for="seccion" class="mb-1">SIGLA SECCIÓN</h5>
                        <p class="mb-0">ASY4131-002D</p>
                    </div>
                    <div class="d-flex flex-column">
                        <h5 for="jornad" class="mb-1">JORNADA</h5>
                        <p class="mb-0">DIURNA</p>
                    </div>
                </div>

            </div>
        </main>

        <!-- Container 2 -->
        <div class="container bg-white p-4 rounded shadow custom-container">
            <h5 class="mb-2">Seleccione un rango de fechas</h5>

            <div class="row mb-4">
                <div class="col-md-7 d-flex align-items-center">
                    <!-- Date Range Picker -->
                    <div class="me-3 flex-grow-1">
                        <input type="text" name="daterange" class="form-control" value="12/11/2024 - 12/12/2024" />
                    </div>
                    <!-- Botones -->
                    <div class="d-flex gap-2">
                        <button id="filter-btn" class="btn btn-success py-2">Filtrar</button>
                        <button class="btn btn-secondary py-2"><a href="docente.php">Volver</a></button>
                    </div>
                </div>
            </div>

            <!-- Tabla (Oculta inicialmente) -->
            <div id="table-container" class="table-responsive table-hidden mt-4">
                <table class="table table-striped table-hover table-bordered">
                    <thead class="table-header-blue text-white text-center">
                        <tr>
                            <th>N°</th>
                            <th>Horario</th>
                            <th>Sala</th>
                            <th>Tipo</th>
                            <th>Detalle</th>
                            <th>Estado</th>
                            <th>Sub Estado</th>
                            <th>Fecha Cierre</th>
                            <th>Fecha Registro</th>
                            <th>Registro</th>
                        </tr>
                    </thead>
                    <tbody class="text-center align-middle">
                        <tr>
                            <td>1</td>
                            <td>10:41-12:10</td>
                            <td>PM W507 LAB.PC AVANZADO (30)</td>
                            <td>REGULAR</td>
                            <td>N/A</td>
                            <td>PROGRAMADA</td>
                            <td>N/A</td>
                            <td>17-12-2024</td>
                            <td>N/A</td>
                            <td class="action-cell">
                                <button class="btn btn-success btn-sm add-btn">+</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>


        <!-- Script Rango de fechas -->
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
        <script>
            $(function() {
                $('input[name="daterange"]').daterangepicker({
                    opens: 'left',
                    locale: {
                        format: 'DD/MM/YYYY' // Formato para el rango de fechas
                    }
                }, function(start, end, label) {
                    console.log("Rango de fechas seleccionado: " + start.format('YYYY-MM-DD') + ' a ' + end.format('YYYY-MM-DD'));
                });
            });
        </script>



         <!-- Script fecha de sistema-->
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
        
        <script src="js/seccion.js"></script>
</body>
</html>

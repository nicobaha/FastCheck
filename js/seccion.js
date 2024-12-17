document.addEventListener("DOMContentLoaded", function () {
    const filterButton = document.getElementById("filter-btn");
    const tableContainer = document.getElementById("table-container");
    const triggerButton = document.querySelector(".add-btn"); // Botón "+"
    const actionButtonsContainer = document.getElementById("action-buttons");

    // Evento para el botón "Filtrar"
    filterButton.addEventListener("click", function () {
        tableContainer.classList.toggle("table-visible");
    });

    // Evento para el botón "+"
    triggerButton.addEventListener("click", function () {
        // Ocultar la columna "Registro"
        const headerRegistro = document.querySelector("th:nth-child(10)"); // Encabezado
        const registroCells = document.querySelectorAll("td:nth-child(10)"); // Celdas

        headerRegistro.classList.add("hidden-column");
        registroCells.forEach(cell => {
            cell.classList.add("hidden-column");
        });

        actionButtonsContainer.innerHTML = `
            <button class="btn btn-success btn-sm">INICIAR CLASE</button>
            <button class="btn btn-custom-1 btn-sm">FINALIZAR CLASE</button>
            <button class="btn btn-custom-2 btn-sm"><a href="registro-asistencia.php">REGISTRAR ASISTENCIA</a></button>
            <button class="btn btn-custom-3 btn-sm">GUARDAR ASISTENCIA</button>
            <button class="btn btn-info btn-sm">SALIR</button>
        `;
        actionButtonsContainer.classList.add("visible");
    });
});

1. Crear la Base de Datos
Abrir el gestor de base de datos (MySQL Workbench).
Crear una base de datos llamada Fastnae.
Importar el archivo Duoc.sql

2. Configurar PHP en el Dispositivo
Asegúrate de tener PHP instalado y las herramientas necesarias configuradas correctamente.
-Verificar la instalación de PHP:
    Abre una terminal o símbolo del sistema y ejecuta:
    php -v
Si PHP está correctamente instalado, mostrará la versión.

2.2. Configurar las Rutas de PHP
Si utilizas Visual Studio Code (VSCode) como editor, realiza lo siguiente:
-Instalar extensiones necesarias:
    PHP Extension Pack
    PHP Server

-Configurar las rutas en VSCode:
    Abre VSCode y presiona Ctrl + , (Windows) o Cmd + , (Mac) para abrir las configuraciones.
    Escribe "PHP" en la barra de búsqueda.
    
    Configura las siguientes opciones:
    
    - PHP Config Path: Ruta del archivo php.ini.
    - PHP Path: Ruta del archivo ejecutable php.exe o php.

    -------------- Resumen de Rutas Comunes ---------------
    Windows (XAMPP):
    C:\xampp\php\php.ini
    C:\xampp\php\php.exe

    Windows (instalación manual):
    C:\php\php.ini
    C:\php\php.exe

    MacOS (Homebrew):
    /usr/local/etc/php/X.X/php.ini
    /usr/local/bin/php

Guardar las configuraciones.


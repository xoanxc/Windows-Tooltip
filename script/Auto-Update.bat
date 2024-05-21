@echo off
:: Script para actualizar todos los paquetes instalados con winget

echo Actualizando todos los paquetes instalados con winget...
echo.

:: Actualizar la lista de fuentes de paquetes
echo Actualizando la lista de fuentes de paquetes...
winget source update
echo.

:: Listar todos los paquetes instalados y guardar en un archivo temporal
echo Listando todos los paquetes instalados...
winget list > installed_packages.txt
echo.

:: Leer cada línea del archivo de paquetes instalados y actualizar cada paquete
for /F "skip=1 tokens=1,2,3 delims= " %%A in (installed_packages.txt) do (
    echo Actualizando %%A...
    winget upgrade --id %%A --silent --accept-source-agreements --accept-package-agreements
    echo.
)

echo.
echo Actualización completada.
echo.

:: Eliminar archivo temporal
del installed_packages.txt
echo Archivo temporal eliminado.
echo.

pause

@echo off
echo Iniciando comprobación de archivos del sistema (SFC)...
sfc /scannow

echo.
echo Iniciando herramienta DISM para restaurar la imagen del sistema...
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth

echo.
echo Proceso completado.
pause

@echo off
color 2

echo.
echo.
echo              Reparacion de archivos del sistema y optimizacion
echo.
echo.
echo              Presiona cualquier tecla para continuar...
pause >nul

echo.
echo [-] Verificando y reparando archivos del sistema (sfc /scannow)...
echo.

sfc /scannow
if %ERRORLEVEL% neq 0 (
    echo [!] Error durante la verificación y reparacion de archivos del sistema.
) else (
    echo [+] Verificacion y reparacion completadas.
)

echo [-] Verificando el disco (chkdsk)...
echo.

chkdsk
if %ERRORLEVEL% neq 0 (
    echo [!] Error durante la verificación del disco.
) else (
    echo [+] Verificación del disco completada.
)

echo [-] Verificando la salud de la imagen del sistema (DISM /Online /Cleanup-Image /CheckHealth)...
echo.

DISM /Online /Cleanup-Image /CheckHealth
if %ERRORLEVEL% neq 0 (
    echo [!] Error durante la verificacion de salud de la imagen del sistema.
) else (
    echo [+] Verificacion de salud de la imagen del sistema completada.
)

echo [-] Escaneando la salud de la imagen del sistema (DISM.exe /Online /Cleanup-image /Scanhealth)...
echo.

DISM.exe /Online /Cleanup-image /Scanhealth
if %ERRORLEVEL% neq 0 (
    echo [!] Error durante el escaneo de salud de la imagen del sistema.
) else (
    echo [+] Escaneo de salud de la imagen del sistema completado.
)

echo [-] Restaurando la salud de la imagen del sistema (DISM.exe /Online /Cleanup-image /Restorehealth)...
echo.

DISM.exe /Online /Cleanup-image /Restorehealth
if %ERRORLEVEL% neq 0 (
    echo [!] Error durante la restauración de salud de la imagen del sistema.
) else (
    echo [+] Restauracion de salud de la imagen del sistema completada.
)

echo.
echo [+] Proceso de reparacion y optimización completado.
echo.

pause

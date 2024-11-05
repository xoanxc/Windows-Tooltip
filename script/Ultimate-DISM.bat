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
    echo [!] Error durante la verificación y reparación de archivos del sistema.
) else (
    echo [+] Verificación y reparación completadas.
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
    echo [!] Error durante la verificación de salud de la imagen del sistema.
) else (
    echo [+] Verificación de salud de la imagen del sistema completada.
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
    echo [+] Restauración de salud de la imagen del sistema completada.
)

echo [-] Limpieza de componentes del sistema (DISM.exe /Online /Cleanup-Image /startComponentCleanup)...
echo.

DISM.exe /Online /Cleanup-Image /startComponentCleanup
if %ERRORLEVEL% neq 0 (
    echo [!] Error durante la limpieza de componentes del sistema.
) else (
    echo [+] Limpieza de componentes del sistema completada.
)

echo [-] Eliminando componentes obsoletos (DISM.exe /Online /Cleanup-Image /StartComponentCleanup /ResetBase)...
echo.

DISM.exe /Online /Cleanup-Image /StartComponentCleanup /ResetBase
if %ERRORLEVEL% neq 0 (
    echo [!] Error al eliminar componentes obsoletos.
) else (
    echo [+] Eliminación de componentes obsoletos completada.
)

echo [-] Reparando el almacenamiento de Windows (DISM.exe /Online /Cleanup-Image /RestoreHealth /Source:wim)...
echo.

DISM.exe /Online /Cleanup-Image /RestoreHealth /Source:wim
if %ERRORLEVEL% neq 0 (
    echo [!] Error al reparar el almacenamiento de Windows.
) else (
    echo [+] Reparación del almacenamiento de Windows completada.
)

echo.
echo [+] Proceso de reparación y optimización completado.
echo.

pause

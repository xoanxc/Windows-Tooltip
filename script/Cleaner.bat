@echo off
color 2
echo.
echo.
echo                      Optimizacion de archivos temporales
echo.
echo.
echo                    Presiona cualquier tecla para continuar...
pause >nul

echo.
echo [-] Eliminando archivos de registro
echo.

cd /d C:\
del /s /q /f *.log

echo [+] Archivos de registro eliminados
echo.

echo [-] Limpiando archivos temporales
echo.

RD /S /Q %temp%
takeown /f "%temp%" /r /d y
RD /S /Q C:\Windows\temp
takeown /f "C:\Windows\temp" /r /d y
takeown /f %temp% /r /d y
echo [+] Archivos temporales eliminados

echo.
echo [+] Eliminada la cache de actualizaciones de Windows y archivos inutiles

echo.
echo [-] Limpiando
echo.

cleanmgr /sageset:65535 /sagerun:65535

echo.
echo [+] Todos los archivos limpiados
echo.

pause

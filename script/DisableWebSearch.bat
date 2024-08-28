@echo off
:menu
cls
echo ============================================
echo           Menu de Configuracion
echo ============================================
echo 1. Desactivar busqueda web en Windows
echo 2. Restaurar busqueda web en Windows
echo 3. Salir
echo ============================================
set /p opcion="Elige una opcion (1-3): "

if %opcion%==1 goto desactivar
if %opcion%==2 goto restaurar
if %opcion%==3 goto salir
echo Opcion invalida. Intenta de nuevo.
pause
goto menu

:desactivar
echo Desactivando la busqueda web en Windows...
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v AllowSearchToUseLocation /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v CortanaConsent /t REG_DWORD /d 0 /f
echo Cambios aplicados correctamente.
pause
goto menu

:restaurar
echo Restaurando la busqueda web en Windows...
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v AllowSearchToUseLocation /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v CortanaConsent /t REG_DWORD /d 1 /f
echo Configuraciones restauradas correctamente.
pause
goto menu

:salir
echo Saliendo de la aplicacion...
pause
exit


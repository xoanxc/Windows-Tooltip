@echo off
:menu
cls
echo =========================================
echo           Configuracion NetBIOS
echo =========================================
echo 1. Desactivar NetBIOS sobre TCP/IP
echo 2. Activar NetBIOS sobre TCP/IP
echo 3. Salir
echo =========================================
set /p choice=Selecciona una opción (1-3):

if "%choice%"=="1" goto desactivar
if "%choice%"=="2" goto activar
if "%choice%"=="3" goto salir
goto menu

:desactivar
echo Desactivando NetBIOS sobre TCP/IP...
for /f "tokens=*" %%A in ('wmic nicconfig where IPEnabled=true get SettingID') do (
    if not "%%A"=="SettingID" (
        echo Desactivando NetBIOS en el adaptador %%A
        wmic nicconfig where "SettingID='%%A'" call SetTcpipNetbios 2 >nul
    )
)
echo NetBIOS ha sido desactivado.
pause
goto menu

:activar
echo Activando NetBIOS sobre TCP/IP...
for /f "tokens=*" %%A in ('wmic nicconfig where IPEnabled=true get SettingID') do (
    if not "%%A"=="SettingID" (
        echo Activando NetBIOS en el adaptador %%A
        wmic nicconfig where "SettingID='%%A'" call SetTcpipNetbios 1 >nul
    )
)
echo NetBIOS ha sido activado.
pause
goto menu

:salir
exit

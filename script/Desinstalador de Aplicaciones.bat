@echo off
:: Script para desinstalar aplicaciones predeterminadas de Microsoft

:menu
cls
echo Seleccione las aplicaciones que desea desinstalar:
echo.
echo 1. Enlace Movil
echo 2. Xbox Game Bar
echo 3. OneNote
echo 4. Microsoft Solitaire Collection
echo 5. Introduccion
echo 6. Obtener ayuda
echo 7. Recomendaciones
echo 8. Todas las anteriores
echo 9. Salir
echo.
set /p choice="Introduce el numero correpondiente: "

if %choice%==1 goto UninstallYourPhone
if %choice%==2 goto UninstallXbox
if %choice%==3 goto UninstallOneNote
if %choice%==4 goto UninstallSolitaire
if %choice%==5 goto UninstallIntro
if %choice%==6 goto UninstallHelp
if %choice%==7 goto UninstallTips
if %choice%==8 goto UninstallAll
if %choice%==9 goto End
goto menu

:UninstallYourPhone
powershell -Command "Get-AppxPackage Microsoft.YourPhone -AllUsers | Remove-AppxPackage"
echo Enlace Móvil desinstalado.
goto menu

:UninstallXbox
powershell -Command "Get-AppxPackage Microsoft.XboxGamingOverlay -AllUsers | Remove-AppxPackage"
echo Xbox Game Bar desinstalado.
goto menu

:UninstallOneNote
powershell -Command "Get-AppxPackage Microsoft.Office.OneNote -AllUsers | Remove-AppxPackage"
echo OneNote desinstalado.
goto menu

:UninstallSolitaire
powershell -Command "Get-AppxPackage Microsoft.MicrosoftSolitaireCollection -AllUsers | Remove-AppxPackage"
echo Microsoft Solitaire Collection desinstalado.
goto menu

:UninstallIntro
powershell -Command "Get-AppxPackage Microsoft.Getstarted -AllUsers | Remove-AppxPackage"
echo Introducción desinstalado.
goto menu

:UninstallHelp
powershell -Command "Get-AppxPackage Microsoft.GetHelp -AllUsers | Remove-AppxPackage"
echo Obtener ayuda desinstalado.
goto menu

:UninstallTips
powershell -Command "Get-AppxPackage Microsoft.Getstarted -AllUsers | Remove-AppxPackage"
echo Recomendaciones desinstalado.
goto menu

:UninstallAll
powershell -Command "Get-AppxPackage Microsoft.YourPhone -AllUsers | Remove-AppxPackage"
powershell -Command "Get-AppxPackage Microsoft.XboxGamingOverlay -AllUsers | Remove-AppxPackage"
powershell -Command "Get-AppxPackage Microsoft.Office.OneNote -AllUsers | Remove-AppxPackage"
powershell -Command "Get-AppxPackage Microsoft.MicrosoftSolitaireCollection -AllUsers | Remove-AppxPackage"
powershell -Command "Get-AppxPackage Microsoft.Getstarted -AllUsers | Remove-AppxPackage"
powershell -Command "Get-AppxPackage Microsoft.GetHelp -AllUsers | Remove-AppxPackage"
powershell -Command "Get-AppxPackage Microsoft.Getstarted -AllUsers | Remove-AppxPackage"
echo Todas las aplicaciones seleccionadas han sido desinstaladas.
goto menu

:End
echo Finalizando.
pause
exit

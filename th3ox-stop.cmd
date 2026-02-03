@ECHO OFF
TITLE th3ox - Durdur
COLOR 0C

echo.
echo [!] th3ox-dpi durduruluyor...
echo.

taskkill /F /IM th3ox-dpi.exe >nul 2>&1

if %errorLevel% equ 0 (
    echo [OK] th3ox-dpi durduruldu!
) else (
    echo [INFO] th3ox-dpi zaten calismiyordu.
)

echo.
pause

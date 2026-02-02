@ECHO OFF
TITLE th3ox - Durdur
COLOR 0C

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [HATA] Yonetici yetkisi gerekli!
    pause
    exit /b 1
)

echo.
echo [!] th3ox durduruluyor...
echo.

PowerShell -NoProfile -ExecutionPolicy Bypass -File "%~dp0th3ox-engine.ps1" -Stop

echo.
pause

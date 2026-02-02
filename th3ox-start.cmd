@ECHO OFF
TITLE th3ox DPI Bypass - BASIT & ETKILI
COLOR 0A

:: Admin kontrolu
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo [HATA] Yonetici yetkisi gerekli!
    echo Sag tikla - Yonetici olarak calistir
    echo.
    pause
    exit /b 1
)

CLS
echo.
echo ============================================
echo   th3ox DPI Bypass
echo   BASIT & ETKILI - GoodbyeDPI Teknik
echo ============================================
echo.
echo DPI Bypass baslatiliyor...
echo.

PowerShell -NoProfile -ExecutionPolicy Bypass -File "%~dp0th3ox-engine.ps1"

pause

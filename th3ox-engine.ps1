param(
    [switch]$Stop
)

$ErrorActionPreference = "SilentlyContinue"

if ($Stop) {
    Write-Host ""
    Write-Host "[STOP] th3ox-dpi stopping..." -ForegroundColor Yellow
    
    # Kill th3ox-dpi process
    Get-Process -Name "th3ox-dpi" -ErrorAction SilentlyContinue | Stop-Process -Force
    
    Write-Host "[OK] Stopped" -ForegroundColor Green
    Write-Host ""
    exit
}

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  th3ox-dpi v1.0 - WinDivert DPI Bypass" -ForegroundColor Cyan  
Write-Host "  Based on GoodbyeDPI" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# Check if th3ox-dpi.exe exists
if (-not (Test-Path "$PSScriptRoot\th3ox-dpi.exe")) {
    Write-Host "[ERROR] th3ox-dpi.exe not found!" -ForegroundColor Red
    Write-Host ""
    pause
    exit 1
}

# Check if WinDivert files exist
if (-not (Test-Path "$PSScriptRoot\WinDivert.dll")) {
    Write-Host "[ERROR] WinDivert.dll not found!" -ForegroundColor Red
    Write-Host ""
    pause
    exit 1
}

if (-not (Test-Path "$PSScriptRoot\WinDivert64.sys")) {
    Write-Host "[ERROR] WinDivert64.sys not found!" -ForegroundColor Red
    Write-Host ""
    pause
    exit 1
}

Write-Host "[*] DISCORD CUSTOM DPI BYPASS" -ForegroundColor Red
Write-Host ""
Write-Host "Target: Discord Update + Gateway" -ForegroundColor Cyan
Write-Host "  - Fragment Position: 2" -ForegroundColor White
Write-Host "  - TTL: 4" -ForegroundColor White
Write-Host "  - Native Fragment" -ForegroundColor White
Write-Host "  - Reverse Fragment" -ForegroundColor White
Write-Host "  - Wrong Checksum" -ForegroundColor White
Write-Host "  - Max Payload: 1200" -ForegroundColor White
Write-Host ""
Write-Host "RESTART DISCORD NOW!" -ForegroundColor Yellow
Write-Host ""
Write-Host "Press Ctrl+C to stop or close this window" -ForegroundColor Yellow
Write-Host ""

# Custom parameters for Discord (no preset mode)
& "$PSScriptRoot\th3ox-dpi.exe" -f 2 -e 2 --set-ttl 4 --native-frag --reverse-frag --max-payload 1200 --wrong-chksum

param(
    [switch]$Stop
)

$ErrorActionPreference = "SilentlyContinue"

if ($Stop) {
    Write-Host ""
    Write-Host "[STOP] DPI Bypass durduruluyor..." -ForegroundColor Yellow
    
    # TTL varsayilan
    netsh int ipv4 set global defaultcurhoplimit=128 | Out-Null
    Remove-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "DefaultTTL" -Force -ErrorAction SilentlyContinue
    
    Write-Host "[OK] TTL varsayilana donduruldu (128)" -ForegroundColor Green
    Write-Host ""
    exit
}

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  th3ox DPI Bypass - BASIT & ETKILI" -ForegroundColor Cyan  
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# SADECE TTL 64 (Linux default - hizli ve etkili)
Write-Host "[1/2] TTL manipulasyonu (HIZLI)..." -ForegroundColor Yellow

try {
    # IPv4 TTL = 64 (Linux gibi)
    netsh int ipv4 set global defaultcurhoplimit=64 | Out-Null
    
    # Registry TTL = 64
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "DefaultTTL" -Value 64 -Type DWord -Force
    
    Write-Host "    [OK] TTL: 64 (DPI atlatildi + HIZLI)" -ForegroundColor Green
}
catch {
    Write-Host "    [HATA] TTL ayarlanamadi!" -ForegroundColor Red
    exit 1
}

# DNS Cache temizle
Write-Host "[2/2] DNS cache temizleniyor..." -ForegroundColor Yellow
Clear-DnsClientCache
ipconfig /flushdns | Out-Null
Write-Host "    [OK] DNS cache temizlendi" -ForegroundColor Green

Write-Host ""
Write-Host "============================================" -ForegroundColor Green
Write-Host "  DPI BYPASS AKTIF!" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green
Write-Host ""
Write-Host "Discord, YouTube, Twitter calismali!" -ForegroundColor Cyan
Write-Host ""
Write-Host "Pencereyi acik birakin..." -ForegroundColor Yellow
Write-Host "Durdurmak icin: th3ox-stop.cmd" -ForegroundColor Yellow
Write-Host ""

# Suresiz bekle
try {
    while ($true) {
        Start-Sleep -Seconds 60
    }
}
finally {
    # Kapatilinca varsayilana don
    netsh int ipv4 set global defaultcurhoplimit=128 | Out-Null
    Remove-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "DefaultTTL" -Force -ErrorAction SilentlyContinue
}

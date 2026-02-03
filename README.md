# th3ox-dpi - Discord DPI Bypass

Discord ve diğer engellenen servislere erişim için DPI (Deep Packet Inspection) bypass aracı.

## Özellikler

- ✅ GoodbyeDPI WinDivert teknolojisi
- ✅ Arkaplanda sessiz çalışma
- ✅ Discord için özel optimize edilmiş parametreler
- ✅ Fragment + TTL + Wrong Checksum kombinasyonu
- ✅ Kolay başlat/durdur

## Kullanım

### Başlatma
1. **th3ox-start.cmd** dosyasına sağ tıkla
2. **Yönetici olarak çalıştır** seç
3. Discord'u tamamen kapat (Task Manager'dan kontrol et)
4. Discord'u tekrar aç

### Durdurma
- **th3ox-stop.cmd** çalıştır (yönetici yetkisi gerekmez)

## Teknik Detaylar

**Aktif Parametreler:**
```
-f 2              Fragment position (HTTP + HTTPS)
-e 2              Fragment size
--set-ttl 4       TTL değeri (bypass için)
--native-frag     Native fragmentation
--reverse-frag    Reverse fragmentation
--max-payload 1200 Maksimum paket boyutu
--wrong-chksum    Yanlış checksum (DPI kafası karıştırma)
```

## Dosya Yapısı

```
th3ox-dpi/
├── th3ox-dpi.exe      # Ana DPI bypass motoru (GoodbyeDPI)
├── WinDivert.dll      # Paket yakalama kütüphanesi
├── WinDivert64.sys    # Kernel driver
├── th3ox-engine.ps1   # PowerShell wrapper
├── th3ox-start.cmd    # Başlatma scripti
├── th3ox-stop.cmd     # Durdurma scripti
└── README.md          # Bu dosya
```

## Sorun Giderme

**Discord "Checking for updates" da kalıyor:**
- th3ox-stop.cmd çalıştır
- th3ox-start.cmd yönetici olarak çalıştır
- Discord'u Task Manager'dan tamamen kapat
- Discord'u tekrar aç

**Program çalışıyor mu kontrol:**
- Task Manager aç
- "th3ox-dpi.exe" process'ini ara
- Varsa çalışıyor

**Hala çalışmıyor:**
1. Windows Defender/Antivirüs th3ox-dpi.exe'yi engelliyor olabilir
2. WinDivert64.sys driver yüklenememiş olabilir (yönetici yetkisi gerekli)
3. Başka bir DPI bypass tool çalışıyor olabilir (çakışma)

## Önemli Notlar

⚠️ **Yönetici yetkisi zorunlu** - WinDivert kernel driver çalışması için gerekli
⚠️ **Antivirüs uyarısı normal** - Paket manipülasyonu yapan her tool şüpheli görünür
⚠️ **Discord her güncellemede** yeniden başlatılmalı

## Yapımcı

**th3ox** - Discord DPI Bypass Specialist

---
*GoodbyeDPI teknolojisi kullanılarak geliştirilmiştir.*

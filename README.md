# th3ox DPI Bypass - BASIT & ETKILI

## SADECE TTL MANIPULASYONU - GoodbyeDPI Teknik

**th3ox artık en basit haliyle sadece TTL değerini değiştiriyor!**

---

## Hızlı Başlangıç

```
1. th3ox-start.cmd -> Yönetici olarak çalıştır
2. Discord/YouTube/Telegram kullan
3. Durdurmak için: th3ox-stop.cmd
```

---

## Nasıl Çalışır?

th3ox ne yapıyor?

1. **TTL = 64** - Windows varsayılan TTL değeri (128) yerine Linux varsayılanı (64) kullanılır
2. **DNS Cache Temizleme** - Yeni bağlantılar için DNS önbelleği temizlenir

Bu kadar! Karmaşık ayarlar yok, sadece TTL manipülasyonu.

### Neden TTL 64?

- DPI cihazları Windows paketlerini (TTL=128) tanır ve engeller
- TTL=64 ile paketler Linux/Android gibi görünür
- DPI bypass için yeterli ve en hızlı yöntem

---

## Kullanım

```
th3ox-start.cmd    Başlat (YÖNETİCİ)
th3ox-stop.cmd     Durdur (YÖNETİCİ)
```

**MUTLAKA Yönetici olarak çalıştır!**

---

## Test

1. th3ox-start.cmd çalıştır (Yönetici)
2. Discord'u aç
3. YouTube'u dene
4. Telegram'ı test et

Çalışmazsa bilgisayarı yeniden başlat ve tekrar dene.

---

## Sorun Giderme

**Çalışmıyor mu?**
1. th3ox-stop.cmd çalıştır
2. Bilgisayarı yeniden başlat
3. th3ox-start.cmd yönetici olarak çalıştır
4. Tarayıcı/Discord'u kapat-aç

**Hala çalışmıyor:**
- Antivirüsü geçici olarak kapat
- VPN varsa kapat
- Yönetici yetkisiyle çalıştırdığından emin ol

---

## Teknik Detaylar

**Değiştirilen Ayarlar:**
```
netsh int ipv4 set global defaultcurhoplimit=64
Registry: HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\DefaultTTL = 64
DNS Cache: ipconfig /flushdns
```

**Geri Alma:**
```
th3ox-stop.cmd çalıştır
TTL otomatik 128'e döner
```

---

## GoodbyeDPI ile İlişki

Bu proje GoodbyeDPI'dan esinlenmiştir ancak daha basitleştirilmiştir:
- GoodbyeDPI: Karmaşık paket manipülasyonu, çoklu parametre
- th3ox: Sadece TTL değiştirme, tek tuş

**Avantajları:**
- Çok daha hızlı (sadece TTL)
- Daha az kaynak kullanımı
- Kolay kullanım (tek tuş)
- Güvenilir (basit = az hata)
- DefaultTTL (Registry)
- MTU/MSS (Network Interface)
- TCP Chimney Offload (Disabled)
- TCP Autotuning (Restricted)
- ECN Capability (Disabled)
- TCP Timestamps (Disabled)
- PMTU Discovery (Disabled)

DNS ayarina DOKUNULMAZ!

---

## Nasil Calisir?

GoodbyeDPI gibi DPI cihazlarini atlatir:
- TTL degistirilir -> DPI cihazi paketi goremez
- Paketler kucultulur -> DPI analiz edemez
- TCP ozellikleri kapatilir -> Paket takibi engellenir

---

(c) 2025 th3ox Team

NOT: Bu sistem SADECE DPI BYPASS yapar. DNS degistirmez!

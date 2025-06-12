# 🏨 Steze Kost & Guest House Booking System

Sistem manajemen reservasi untuk kost dan guest house, terdiri dari dua bagian utama:

- **Frontend (Pelanggan)** – Laravel + Blade
- **Backend (Admin & Resepsionis)** – Laravel + Filament

---

## 📦 Akses Repositori Kode

🔗 GitHub Repository (Contoh):  
[https://github.com/steze/guesthouse-booking](https://github.com/steze/guesthouse-booking)

📂 Folder Struktur:
```bash
app/
├── Filament/                # Admin & Resepsionis (Filament Panel)
├── Http/
│   ├── Controllers/
│   │   ├── Frontend/       # Kontrol pelanggan
│   │   └── Admin/          # (Opsional) Kostumisasi Filament
├── Models/                 # Share model
resources/
└── views/
    ├── frontend/           # Blade views pelanggan
routes/
├── web.php                 # Routing pelanggan
├── filament.php            # Routing Filament (admin/resepsionis)

# 🌐 Proyek PPSI – Sistem Booking Steze Kost & Guest House

Aplikasi pemesanan kamar berbasis Laravel untuk manajemen cabang, kamar, dan proses booking pelanggan. Dibangun dengan **Laravel Blade** untuk pelanggan, dan **Filament Admin Panel** untuk admin & resepsionis.

---

## 🔧 Teknologi yang Digunakan

- Laravel 10+
- Blade Template (Frontend)
- Filament Admin (Backend)
- Midtrans / Xendit (Pembayaran)
- Laravel Mail (Notifikasi Email)
- Google Maps Embed

---

## 👥 Pembagian Peran Pengembangan

### 🧑 Rekanmu – **Frontend (Pelanggan)**  
📁 Folder utama:
- `resources/views/frontend/`
- `app/Http/Controllers/Frontend/`
- `routes/web.php`

📌 Fokus tugas:
- Halaman utama (daftar cabang)
- Detail cabang & daftar kamar
- Formulir booking
- Halaman sukses booking
- Proses booking + email + Midtrans/Xendit

---

### 🛠 Kamu – **Admin & Resepsionis (Filament)**  
📁 Folder utama:
- `app/Filament/Resources/`
- `routes/filament.php`
- `app/Models/` *(bersama)*

📌 Fokus tugas:
- Panel admin (kelola cabang, kamar, user)
- Panel resepsionis (verifikasi pemesanan, check-in, walk-in)
- Otentikasi user Filament (admin/resepsionis)
- Statistik & laporan

---

## 📁 Struktur Direktori Disepakati


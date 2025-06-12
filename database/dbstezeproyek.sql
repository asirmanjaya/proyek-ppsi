-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2025 at 03:27 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbsteze`
--

-- --------------------------------------------------------

--
-- Table structure for table `cabangs`
--

CREATE TABLE `cabangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `link_maps` text NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cabangs`
--

INSERT INTO `cabangs` (`id`, `nama`, `alamat`, `link_maps`, `gambar`, `created_at`, `updated_at`) VALUES
(6, 'STeZe Kost & Guest House Kota Baru', 'Jl. Pintu Besi, Paal Lima, Kec. Kota Baru, Kota Jambi, Jambi 36129', 'https://maps.app.goo.gl/jUjfMvbFkLDMfHD6A', 'cabangs/01JX8042CZMFP4GGR1BWHGBPRE.png', '2025-06-08 07:46:40', '2025-06-08 07:46:40'),
(7, 'STeZe Sipin', 'Ini Alamat', 'https://maps.app.goo.gl/wAi4CmirHaYArit96', NULL, '2025-06-10 18:38:11', '2025-06-10 18:38:11');

-- --------------------------------------------------------

--
-- Table structure for table `checkins`
--

CREATE TABLE `checkins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pemesanan_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `waktu_checkin` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `checkouts`
--

CREATE TABLE `checkouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `checkin_id` bigint(20) UNSIGNED NOT NULL,
  `waktu_checkout` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas`
--

CREATE TABLE `fasilitas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fasilitas`
--

INSERT INTO `fasilitas` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(27, 'Wi-Fi', '2025-06-08 07:47:31', '2025-06-08 07:47:31'),
(28, 'Parkiran Luas', '2025-06-08 07:47:50', '2025-06-08 07:47:50'),
(29, 'Kamar Mandi dengan Shower', '2025-06-10 18:25:20', '2025-06-10 18:25:20'),
(30, 'Air Minum ', '2025-06-10 18:27:01', '2025-06-10 18:27:01');

-- --------------------------------------------------------

--
-- Table structure for table `kamars`
--

CREATE TABLE `kamars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cabang_id` bigint(20) UNSIGNED NOT NULL,
  `tipe` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `harga_per_malam` decimal(12,2) NOT NULL,
  `stok` int(11) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_kebersihan` enum('tersedia','perlu_dibersihkan') NOT NULL DEFAULT 'tersedia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kamars`
--

INSERT INTO `kamars` (`id`, `cabang_id`, `tipe`, `deskripsi`, `harga_per_malam`, `stok`, `gambar`, `created_at`, `updated_at`, `status_kebersihan`) VALUES
(6, 6, 'Standard', 'Cocok untuk pasangan atau tamu yang menginginkan kenyamanan, Double Room kami dilengkapi dengan satu tempat tidur besar, pencahayaan hangat, serta desain interior minimalis modern. Kamar ini juga dilengkapi fasilitas dasar untuk kenyamanan Anda selama menginap. Semua.', 150000.00, 0, 'kamars/01JX809Y1SANBW378295D11C30.png', '2025-06-08 07:49:52', '2025-06-11 09:29:52', 'tersedia'),
(7, 6, 'Deluxe', 'Kamar denga fasilitas lengkap disertai air hangat untuk relaksasi.', 250000.00, 3, 'kamars/01JX80C2RASXCNSWBW6R4N79B7.png', '2025-06-08 07:51:02', '2025-06-11 15:32:02', 'tersedia'),
(8, 7, 'Standard', 'Ini Deskripsi', 150000.00, 0, NULL, '2025-06-10 18:39:08', '2025-06-10 18:39:08', 'tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `kamar_fasilitas`
--

CREATE TABLE `kamar_fasilitas` (
  `kamar_id` bigint(20) UNSIGNED NOT NULL,
  `fasilitas_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kamar_fasilitas`
--

INSERT INTO `kamar_fasilitas` (`kamar_id`, `fasilitas_id`) VALUES
(6, 27),
(6, 28),
(7, 27),
(7, 28),
(8, 30);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_05_30_051635_create_cabangs_table', 1),
(6, '2025_05_30_051644_create_pelanggans_table', 1),
(7, '2025_05_30_051652_create_kamars_table', 1),
(8, '2025_05_30_051701_create_fasilitas_table', 1),
(9, '2025_05_30_051709_create_kamar_fasilitas_table', 1),
(10, '2025_05_30_051716_create_pemesanans_table', 1),
(11, '2025_05_30_051725_create_pembayarans_table', 1),
(12, '2025_05_30_051733_create_checkins_table', 1),
(13, '2025_05_30_051742_create_checkouts_table', 1),
(14, '2025_05_30_051751_update_users_table', 1),
(15, '2025_05_30_153113_make_email_nullable_on_pemesanans_table', 1),
(16, '2025_06_01_050313_add_nomor_kamar_to_pemesanans_table', 1),
(17, '2025_06_03_144240_change_gambar_column_on_cabangs_table', 2),
(19, '2025_06_06_091829_add_total_harga_to_pemesanans_table', 3),
(20, '2025_06_10_124317_add_jenis_kelamin_to_pemesanans_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggans`
--

CREATE TABLE `pelanggans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nomor_hp` varchar(20) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembayarans`
--

CREATE TABLE `pembayarans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pemesanan_id` bigint(20) UNSIGNED NOT NULL,
  `metode` varchar(50) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `payment_id` varchar(100) DEFAULT NULL,
  `status` enum('pending','success','failed') NOT NULL,
  `payment_response` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pemesanans`
--

CREATE TABLE `pemesanans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_booking` varchar(50) NOT NULL,
  `kamar_id` bigint(20) UNSIGNED NOT NULL,
  `nomor_kamar` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nama_pemesan` varchar(255) NOT NULL,
  `jenis_kelamin` varchar(255) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `tanggal_checkin` date NOT NULL,
  `tanggal_checkout` date NOT NULL,
  `jumlah_tamu` int(11) NOT NULL,
  `nomor_hp` varchar(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sumber` enum('online','walkin') NOT NULL DEFAULT 'online',
  `status` enum('belum_bayar','lunas','checkin','checkout') NOT NULL,
  `total_harga` decimal(12,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pemesanans`
--

INSERT INTO `pemesanans` (`id`, `kode_booking`, `kamar_id`, `nomor_kamar`, `user_id`, `nama_pemesan`, `jenis_kelamin`, `tanggal_lahir`, `tanggal_checkin`, `tanggal_checkout`, `jumlah_tamu`, `nomor_hp`, `email`, `sumber`, `status`, `total_harga`, `created_at`, `updated_at`) VALUES
(46, 'WK-20250610-006', 7, '67', NULL, 'Afisyahn10', NULL, '2008-06-10', '2025-06-10', '2025-06-11', 1, '082392268736', NULL, 'walkin', 'checkin', NULL, '2025-06-10 09:49:36', '2025-06-10 09:49:36'),
(47, 'WK-20250610-002', 6, '334', NULL, 'Michael Gilbert', NULL, '2008-06-10', '2025-06-10', '2025-06-11', 1, '082392268736', NULL, 'walkin', 'checkin', NULL, '2025-06-10 09:57:05', '2025-06-10 09:57:05'),
(48, 'WB-20250611-001', 6, NULL, NULL, 'Asirman', 'Laki-laki', '2007-06-11', '2025-06-11', '2025-06-14', 1, '0895360321439', 'resepsionis.sipin@hotel.com', 'online', 'lunas', 450000.00, '2025-06-10 18:50:03', '2025-06-10 18:50:03'),
(49, 'WB-20250611-002', 6, NULL, NULL, 'asd', 'Perempuan', '2007-06-11', '2025-06-11', '2025-06-12', 1, '0895360321439', 'labe@nwjns.us', 'online', 'lunas', 150000.00, '2025-06-11 05:29:15', '2025-06-11 05:29:15'),
(50, 'WB-20250611-003', 6, NULL, NULL, 'Asirman', 'Laki-laki', '2007-06-11', '2025-06-11', '2025-06-12', 1, '0895360321439', 'resepsionis.sipin@hotel.com', 'online', 'lunas', 150000.00, '2025-06-11 06:03:52', '2025-06-11 06:03:52'),
(51, 'WB-20250611-004', 6, NULL, NULL, 'Asirman', 'Laki-laki', '2007-06-11', '2025-06-11', '2025-06-12', 1, '0895360321439', 'resepsionis.sipin@hotel.com', 'online', 'lunas', 150000.00, '2025-06-11 09:29:52', '2025-06-11 09:29:52'),
(52, 'WK-20250611-001', 7, '02', NULL, 'Afisyah', 'laki-laki', '2008-06-11', '2025-06-11', '2025-06-12', 1, '082392268736', NULL, 'walkin', 'checkin', NULL, '2025-06-11 15:32:02', '2025-06-11 15:32:02');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','resepsionis') NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cabang_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`, `cabang_id`) VALUES
(1, 'Admin Utama', 'admin@gmail.com', NULL, '$2y$10$Wm1aVLQW8iW9iylYz27vpuFEBtznlabo35nbQ./UyAqWGgrMgPBd.', 'admin', NULL, '2025-06-03 07:28:19', '2025-06-03 07:28:19', NULL),
(3, 'Resepsionis 1', 'resepsionis@gmail.com', NULL, '$2y$10$.FliQz4w7rLl1LmTD1ApgOtcSFN4iiX9xK67wd.RAaqucvwsCu0K6', 'resepsionis', NULL, '2025-06-08 07:51:54', '2025-06-08 07:51:54', 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cabangs`
--
ALTER TABLE `cabangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `checkins`
--
ALTER TABLE `checkins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checkins_pemesanan_id_foreign` (`pemesanan_id`),
  ADD KEY `checkins_user_id_foreign` (`user_id`);

--
-- Indexes for table `checkouts`
--
ALTER TABLE `checkouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checkouts_checkin_id_foreign` (`checkin_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kamars`
--
ALTER TABLE `kamars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kamars_cabang_id_foreign` (`cabang_id`);

--
-- Indexes for table `kamar_fasilitas`
--
ALTER TABLE `kamar_fasilitas`
  ADD PRIMARY KEY (`kamar_id`,`fasilitas_id`),
  ADD KEY `kamar_fasilitas_fasilitas_id_foreign` (`fasilitas_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pelanggans`
--
ALTER TABLE `pelanggans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pelanggans_email_unique` (`email`);

--
-- Indexes for table `pembayarans`
--
ALTER TABLE `pembayarans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pembayarans_pemesanan_id_foreign` (`pemesanan_id`);

--
-- Indexes for table `pemesanans`
--
ALTER TABLE `pemesanans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pemesanans_kode_booking_unique` (`kode_booking`),
  ADD KEY `pemesanans_kamar_id_foreign` (`kamar_id`),
  ADD KEY `pemesanans_user_id_foreign` (`user_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_cabang_id_foreign` (`cabang_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cabangs`
--
ALTER TABLE `cabangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `checkins`
--
ALTER TABLE `checkins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `checkouts`
--
ALTER TABLE `checkouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fasilitas`
--
ALTER TABLE `fasilitas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `kamars`
--
ALTER TABLE `kamars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pelanggans`
--
ALTER TABLE `pelanggans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembayarans`
--
ALTER TABLE `pembayarans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pemesanans`
--
ALTER TABLE `pemesanans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `checkins`
--
ALTER TABLE `checkins`
  ADD CONSTRAINT `checkins_pemesanan_id_foreign` FOREIGN KEY (`pemesanan_id`) REFERENCES `pemesanans` (`id`),
  ADD CONSTRAINT `checkins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `checkouts`
--
ALTER TABLE `checkouts`
  ADD CONSTRAINT `checkouts_checkin_id_foreign` FOREIGN KEY (`checkin_id`) REFERENCES `checkins` (`id`);

--
-- Constraints for table `kamars`
--
ALTER TABLE `kamars`
  ADD CONSTRAINT `kamars_cabang_id_foreign` FOREIGN KEY (`cabang_id`) REFERENCES `cabangs` (`id`);

--
-- Constraints for table `kamar_fasilitas`
--
ALTER TABLE `kamar_fasilitas`
  ADD CONSTRAINT `kamar_fasilitas_fasilitas_id_foreign` FOREIGN KEY (`fasilitas_id`) REFERENCES `fasilitas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kamar_fasilitas_kamar_id_foreign` FOREIGN KEY (`kamar_id`) REFERENCES `kamars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pembayarans`
--
ALTER TABLE `pembayarans`
  ADD CONSTRAINT `pembayarans_pemesanan_id_foreign` FOREIGN KEY (`pemesanan_id`) REFERENCES `pemesanans` (`id`);

--
-- Constraints for table `pemesanans`
--
ALTER TABLE `pemesanans`
  ADD CONSTRAINT `pemesanans_kamar_id_foreign` FOREIGN KEY (`kamar_id`) REFERENCES `kamars` (`id`),
  ADD CONSTRAINT `pemesanans_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_cabang_id_foreign` FOREIGN KEY (`cabang_id`) REFERENCES `cabangs` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

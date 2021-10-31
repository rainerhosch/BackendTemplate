-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 31 Okt 2021 pada 14.22
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_basic_app`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `id_menu` int(11) NOT NULL,
  `nama_menu` varchar(20) NOT NULL,
  `link_menu` text NOT NULL,
  `type` varchar(20) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `is_active` int(1) NOT NULL,
  `editable` enum('N/A','YES','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_menu`
--

INSERT INTO `tbl_menu` (`id_menu`, `nama_menu`, `link_menu`, `type`, `icon`, `is_active`, `editable`) VALUES
(1, 'Dashboard', 'dashboard', 'statis', 'gi gi-dashboard', 1, 'YES'),
(2, 'Transaksi', 'transaksi', 'dinamis', 'gi gi-usd', 1, 'YES'),
(3, 'Manajemen', 'manajemen', 'dinamis', 'gi gi-adjust_alt', 1, 'N/A'),
(4, 'Master', 'master', 'dinamis', 'fa fa-database', 1, 'YES'),
(999, 'Sync Data Simak', 'sync-simak', 'statis', 'fa fa-sync', 1, 'YES');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_submenu`
--

CREATE TABLE `tbl_submenu` (
  `id_submenu` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `nama_submenu` varchar(26) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `is_active` int(1) NOT NULL COMMENT 'untuk status menu'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_submenu`
--

INSERT INTO `tbl_submenu` (`id_submenu`, `id_menu`, `nama_submenu`, `url`, `icon`, `is_active`) VALUES
(1, 2, 'Pembayaran *SPP', 'transaksi/pembayaran_spp', 'fa fa-genderless', 1),
(2, 2, 'Pembayaran Lainnya', 'transaksi/pembayaran_lainnya', 'fa fa-genderless', 1),
(3, 3, 'Manajemen Menu', 'manajemen/manajemen-menu', 'fa fa-genderless', 1),
(4, 3, 'Manajemen SubMenu', 'manajemen/manajemen-submenu', 'fa fa-genderless', 1),
(5, 3, 'Manajemen User', 'manajemen/manajemen-user', 'fa fa-genderless', 1),
(6, 4, 'Master Uang SPP', 'master/UangSpp', 'fa fa-genderless', 1),
(7, 4, 'Master Uang Bangunan', 'master/PengembanganKampus', 'fa fa-genderless', 1),
(8, 4, 'Master Kerja Praktek', 'master/KerjaPraktek', 'fa fa-genderless', 1),
(9, 4, 'Master Seminar Skripsi', 'master/SeminarSkripsi', 'fa fa-genderless', 1),
(10, 4, 'Master Sidang Skripsi', 'master/SidangSkripsi', 'fa fa-genderless', 1),
(11, 4, 'Master Wisuda', 'master/Wisuda', 'fa fa-genderless', 1),
(12, 4, 'Master TOEFL', 'master/TOEFL', 'fa fa-genderless', 1),
(13, 4, 'Master Kemahasiswaan', 'master/Kemahasiswaan', 'fa fa-genderless', 1),
(14, 4, 'Master Konversi', 'master/Konversi', 'fa fa-genderless', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(25) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `nama_user`, `username`, `password`, `role`) VALUES
(1, 'Dev Account', 'devstt', '202cb962ac59075b964b07152d234b70', 1),
(2, 'Master Admin', 'masteradmin', '202cb962ac59075b964b07152d234b70', 2),
(11, 'Rizky Ardiansyah', 'admin1', '202cb962ac59075b964b07152d234b70', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 0, 2),
(4, 1, 3),
(5, 2, 1),
(6, 2, 4),
(7, 3, 1),
(8, 3, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

CREATE TABLE `user_role` (
  `id_role` int(11) NOT NULL,
  `role_type` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indeks untuk tabel `tbl_submenu`
--
ALTER TABLE `tbl_submenu`
  ADD PRIMARY KEY (`id_submenu`),
  ADD KEY `id_menu` (`id_menu`),
  ADD KEY `id_submenu` (`id_submenu`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `nama_user` (`nama_user`);

--
-- Indeks untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id_role`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT untuk tabel `tbl_submenu`
--
ALTER TABLE `tbl_submenu`
  MODIFY `id_submenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2020 at 08:03 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skripsi_2020`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun_bank`
--

CREATE TABLE `akun_bank` (
  `id` int(4) NOT NULL,
  `pengguna_id` int(4) NOT NULL,
  `nomor_rekening` int(20) NOT NULL,
  `nama_pemilik` varchar(20) NOT NULL,
  `bank_penerbit` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id` int(4) NOT NULL,
  `role` enum('admin','petani','sopir') NOT NULL,
  `email` varchar(120) DEFAULT NULL,
  `seluler` varchar(15) DEFAULT NULL,
  `username` varchar(16) DEFAULT NULL,
  `password` varchar(40) NOT NULL,
  `nama_lengkap` varchar(80) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `status` enum('aktif','non-aktif','blokir') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id`, `role`, `email`, `seluler`, `username`, `password`, `nama_lengkap`, `alamat`, `status`) VALUES
(1, 'admin', 'admin@aplikasi-angkutan.medansoftware.com', '082167368585', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', NULL, 'aktif'),
(2, 'sopir', 'sopir@aplikasi-angkutan.medansoftware.com', '082167368586', 'sopir', 'd386c1221d25de3e8eb78dd5e73a8aac', 'Sopir', NULL, 'aktif'),
(3, 'petani', 'petani@aplikasi-angkutan.medansoftware.com', '082167368587', 'petani', 'd180e8e96956e056f23a05fadda0e2bd', 'Petani', NULL, 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan_transportasi`
--

CREATE TABLE `pesanan_transportasi` (
  `id` int(4) NOT NULL,
  `transportasi_id` int(4) NOT NULL,
  `pemesan` int(4) NOT NULL,
  `nama_lengkap` varchar(80) NOT NULL,
  `seluler` varchar(15) NOT NULL,
  `jadwal_angkut` datetime NOT NULL,
  `penjualan` double DEFAULT NULL,
  `upah_angkut` double DEFAULT NULL,
  `total_pendapatan` double DEFAULT NULL,
  `penjemputan` tinytext NOT NULL,
  `tanggal_pemesanan` datetime NOT NULL,
  `catatan` tinytext DEFAULT NULL,
  `status` enum('pesan','konfirmasi','batal','proses','selesai') NOT NULL DEFAULT 'pesan'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`name`, `value`) VALUES
('upah_angkut', '150'),
('harga_sawit', '1000');

-- --------------------------------------------------------

--
-- Table structure for table `transportasi`
--

CREATE TABLE `transportasi` (
  `id` int(4) NOT NULL,
  `jenis` enum('pickup','truck') NOT NULL,
  `nomor_plat` varchar(10) NOT NULL,
  `beban_angkut` double NOT NULL,
  `pengemudi` int(4) NOT NULL,
  `status` enum('tersedia','tidak-tersedia') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun_bank`
--
ALTER TABLE `akun_bank`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengguna_id` (`pengguna_id`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesanan_transportasi`
--
ALTER TABLE `pesanan_transportasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pesanan_transportasi_ibfk_1` (`transportasi_id`),
  ADD KEY `pesanan_transportasi_ibfk_2` (`pemesan`);

--
-- Indexes for table `transportasi`
--
ALTER TABLE `transportasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengemudi` (`pengemudi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akun_bank`
--
ALTER TABLE `akun_bank`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pesanan_transportasi`
--
ALTER TABLE `pesanan_transportasi`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transportasi`
--
ALTER TABLE `transportasi`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `akun_bank`
--
ALTER TABLE `akun_bank`
  ADD CONSTRAINT `akun_bank_ibfk_1` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pesanan_transportasi`
--
ALTER TABLE `pesanan_transportasi`
  ADD CONSTRAINT `pesanan_transportasi_ibfk_1` FOREIGN KEY (`transportasi_id`) REFERENCES `transportasi` (`id`),
  ADD CONSTRAINT `pesanan_transportasi_ibfk_2` FOREIGN KEY (`pemesan`) REFERENCES `pengguna` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transportasi`
--
ALTER TABLE `transportasi`
  ADD CONSTRAINT `transportasi_ibfk_1` FOREIGN KEY (`pengemudi`) REFERENCES `pengguna` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
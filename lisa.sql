-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 03, 2024 at 06:24 PM
-- Server version: 8.0.30
-- PHP Version: 8.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lisa`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `id_akun` int NOT NULL,
  `nama_akun` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jenis_akun` enum('Aktiva Lancar','Aktiva Tetap','Modal','Utang Lancar','Pendapatan','Beban','Pengeluaran','Kewajiban','Harga Pokok Penjualan','Penyusutan') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `wajib` tinyint(1) DEFAULT NULL,
  `kode_akun` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`id_akun`, `nama_akun`, `jenis_akun`, `wajib`, `kode_akun`) VALUES
(5, 'Kas', 'Aktiva Lancar', 1, '100001'),
(6, 'Bank BRI', 'Aktiva Lancar', NULL, '100002'),
(7, 'Pendapatan', 'Pendapatan', 1, '500001'),
(8, 'Peralatan Kantor', 'Aktiva Tetap', NULL, '200001'),
(9, 'Modal', 'Modal', NULL, '900001'),
(10, 'Bangunan', 'Aktiva Tetap', NULL, '200002'),
(11, 'Gaji ', 'Beban', NULL, '1212121');

-- --------------------------------------------------------

--
-- Stand-in structure for view `jurnal`
-- (See below for the actual view)
--
CREATE TABLE `jurnal` (
`akun` varchar(255)
,`debit` decimal(10,2)
,`deskripsi` text
,`id_transaksi` int
,`jenis_akun` enum('Aktiva Lancar','Aktiva Tetap','Modal','Utang Lancar','Pendapatan','Beban','Pengeluaran','Kewajiban','Harga Pokok Penjualan','Penyusutan')
,`kode_transaksi` varchar(255)
,`kredit` decimal(10,2)
,`tanggal_transaksi` date
);

-- --------------------------------------------------------

--
-- Table structure for table `pemasok`
--

CREATE TABLE `pemasok` (
  `id_pemasok` int NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `keterangan` text,
  `kontak` varbinary(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pemasok`
--

INSERT INTO `pemasok` (`id_pemasok`, `nama`, `keterangan`, `kontak`) VALUES
(2, 'Yuvi', 'Toko Buku', 0x393831323132313231),
(5, 'Barokaha', 'Toko Bangunana', 0x313131);

-- --------------------------------------------------------

--
-- Table structure for table `pemasukan`
--

CREATE TABLE `pemasukan` (
  `id_pemasukan` int NOT NULL,
  `kode_pemasukan` varchar(50) DEFAULT NULL,
  `id_pemasok` int DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `tanggal_transaksi` date DEFAULT NULL,
  `id_pengguna` int DEFAULT NULL,
  `id_akun` int DEFAULT NULL,
  `keterangan` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pemasukan`
--

INSERT INTO `pemasukan` (`id_pemasukan`, `kode_pemasukan`, `id_pemasok`, `total`, `tanggal_transaksi`, `id_pengguna`, `id_akun`, `keterangan`) VALUES
(7, 'PM-001', 2, 10000000.00, '2024-08-01', 1, 5, 'Setoran Modal'),
(8, 'PM-002', 5, 5000000.00, '2024-08-31', 1, 5, 'SPP'),
(9, 'PM-003', 2, 5000000.00, '2024-09-01', 1, 5, 'Donatur'),
(10, 'PM-004', 2, 10000000.00, '2024-09-20', 1, 5, 'spp'),
(11, 'PM-005', 2, 20000000.00, '2024-09-01', 1, 6, 'modal');

-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `id_pengeluaran` int NOT NULL,
  `kode_pengeluaran` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_pemasok` int DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `tanggal_transaksi` date DEFAULT NULL,
  `id_pengguna` int DEFAULT NULL,
  `id_akun` int DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pengeluaran`
--

INSERT INTO `pengeluaran` (`id_pengeluaran`, `kode_pengeluaran`, `id_pemasok`, `total`, `tanggal_transaksi`, `id_pengguna`, `id_akun`, `keterangan`) VALUES
(6, 'PG-001', 2, 1000000.00, '2024-08-14', 1, 5, 'Peralatan Kantor'),
(7, 'PG-002', 2, 5000000.00, '2024-09-03', 1, 5, 'Beli Printer'),
(8, 'PG-003', 5, 2000000.00, '2024-09-06', 1, 5, 'Bangku'),
(9, 'PG-004', 2, 2000000.00, '2024-09-20', 1, 5, 'gaji');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `username`, `password`, `level`, `nama`) VALUES
(1, 'admin', '$2y$10$IFurjz8bw3a2t0HlX2rV4.iEsMpop3E0HXz/HIoLUW/LPFI8IlC6.', 'Admin', 'Tono'),
(5, 'masruroh', '$2y$10$HgDS54taM1AAEQPoF9xBOOY7hlulrWseoMeDKwb/Bd0RwORzE6Qam', 'Kepala Sekolah', 'Masruroh, S.Pd.'),
(7, 'catur', '$2y$10$xVCRHx99PZW/q2J5dgGXyuqOXoV4i0qUqoglvERWV7H9ng5zSe67i', 'Bendahara', 'Catur Tri Wahyu, S.Pd.');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kode_transaksi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `id_akun_debit` int NOT NULL,
  `id_akun_kredit` int NOT NULL,
  `tanggal_transaksi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `deskripsi`, `kode_transaksi`, `total`, `id_akun_debit`, `id_akun_kredit`, `tanggal_transaksi`) VALUES
(10, 'Setoran Modal', 'PM-001', 10000000.00, 5, 9, '2024-08-01'),
(11, 'SPP', 'PM-002', 5000000.00, 5, 7, '2024-08-31'),
(12, 'Peralatan Kantor', 'PG-001', 1000000.00, 8, 5, '2024-08-14'),
(13, 'Beli Printer', 'PG-002', 5000000.00, 8, 5, '2024-09-03'),
(14, 'Donatur', 'PM-003', 5000000.00, 5, 9, '2024-09-01'),
(15, 'spp', 'PM-004', 10000000.00, 5, 7, '2024-09-20'),
(16, 'modal', 'PM-005', 20000000.00, 6, 9, '2024-09-01'),
(17, 'Bangku', 'PG-003', 2000000.00, 10, 5, '2024-09-06'),
(18, 'gaji', 'PG-004', 2000000.00, 11, 5, '2024-09-20');

-- --------------------------------------------------------

--
-- Structure for view `jurnal`
--
DROP TABLE IF EXISTS `jurnal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `jurnal`  AS SELECT `t`.`tanggal_transaksi` AS `tanggal_transaksi`, `t`.`kode_transaksi` AS `kode_transaksi`, `t`.`deskripsi` AS `deskripsi`, `a1`.`nama_akun` AS `akun`, `a1`.`jenis_akun` AS `jenis_akun`, `t`.`id_transaksi` AS `id_transaksi`, (case when (`t`.`id_akun_debit` = `a1`.`id_akun`) then `t`.`total` else 0 end) AS `debit`, (case when (`t`.`id_akun_kredit` = `a1`.`id_akun`) then `t`.`total` else 0 end) AS `kredit` FROM (`transaksi` `t` join `akun` `a1` on(((`t`.`id_akun_debit` = `a1`.`id_akun`) or (`t`.`id_akun_kredit` = `a1`.`id_akun`)))) ORDER BY `t`.`tanggal_transaksi` ASC ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id_akun`);

--
-- Indexes for table `pemasok`
--
ALTER TABLE `pemasok`
  ADD PRIMARY KEY (`id_pemasok`),
  ADD KEY `id_pemasok` (`id_pemasok`);

--
-- Indexes for table `pemasukan`
--
ALTER TABLE `pemasukan`
  ADD PRIMARY KEY (`id_pemasukan`),
  ADD KEY `id_pemasok` (`id_pemasok`),
  ADD KEY `id_akun` (`id_akun`),
  ADD KEY `id_pengguna` (`id_pengguna`);

--
-- Indexes for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`id_pengeluaran`),
  ADD KEY `id_pemasok` (`id_pemasok`),
  ADD KEY `id_akun` (`id_akun`),
  ADD KEY `id_pengguna` (`id_pengguna`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_akun_debit` (`id_akun_debit`),
  ADD KEY `id_akun_kredit` (`id_akun_kredit`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akun`
--
ALTER TABLE `akun`
  MODIFY `id_akun` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pemasok`
--
ALTER TABLE `pemasok`
  MODIFY `id_pemasok` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pemasukan`
--
ALTER TABLE `pemasukan`
  MODIFY `id_pemasukan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  MODIFY `id_pengeluaran` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pemasukan`
--
ALTER TABLE `pemasukan`
  ADD CONSTRAINT `pemasukan_ibfk_2` FOREIGN KEY (`id_akun`) REFERENCES `akun` (`id_akun`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemasukan_ibfk_3` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD CONSTRAINT `pengeluaran_ibfk_2` FOREIGN KEY (`id_akun`) REFERENCES `akun` (`id_akun`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengeluaran_ibfk_3` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_akun_debit`) REFERENCES `akun` (`id_akun`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_akun_kredit`) REFERENCES `akun` (`id_akun`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

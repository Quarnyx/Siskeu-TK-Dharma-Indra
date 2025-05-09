-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Bulan Mei 2025 pada 01.06
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

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
-- Struktur dari tabel `akun`
--

CREATE TABLE `akun` (
  `id_akun` int(11) NOT NULL,
  `nama_akun` varchar(50) DEFAULT NULL,
  `jenis_akun` enum('Aktiva Lancar','Aktiva Tetap','Modal','Utang Lancar','Pendapatan','Beban','Pengeluaran','Kewajiban','Harga Pokok Penjualan','Penyusutan') DEFAULT NULL,
  `wajib` tinyint(1) DEFAULT NULL,
  `kode_akun` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `akun`
--

INSERT INTO `akun` (`id_akun`, `nama_akun`, `jenis_akun`, `wajib`, `kode_akun`) VALUES
(5, 'Kas', 'Aktiva Lancar', 1, '101'),
(7, 'Pendapatan', 'Pendapatan', 1, '401'),
(9, 'Modal', 'Modal', NULL, '301'),
(13, 'Biaya Transportasi Guru', 'Beban', NULL, '502'),
(16, 'Biaya air ', 'Beban', 0, '501'),
(17, 'Biaya Pemeliharaan', 'Beban', 0, '503'),
(18, 'Biaya Perlengkapan ', 'Beban', 0, '504'),
(19, 'Biaya Peralatan ', 'Beban', 0, '505'),
(20, 'Biaya Makan Bersama', 'Beban', 0, '506'),
(21, 'Hutang Gaji', 'Utang Lancar', 0, '201'),
(22, 'Biaya Kegiatan Sosial', 'Beban', 0, '507'),
(26, 'Biaya Listrik', 'Beban', 0, '508'),
(27, 'Biaya Seragam', 'Beban', 0, '509'),
(28, 'Biaya Listrik', 'Beban', 0, '512');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `id_guru` int(11) NOT NULL,
  `nama_guru` varchar(100) DEFAULT NULL,
  `jk` enum('Laki-laki','Perempuan') NOT NULL,
  `agama_guru` enum('Islam','Kristen','Hindu','Budha','Konghucu') NOT NULL,
  `alamat` text DEFAULT NULL,
  `no_telp` varchar(15) DEFAULT NULL,
  `foto_guru` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`id_guru`, `nama_guru`, `jk`, `agama_guru`, `alamat`, `no_telp`, `foto_guru`) VALUES
(2, 'Masruroh, S.Pd', 'Perempuan', 'Islam', 'Kedungsuren RT 04 RW 04 Kaliwungu Selatan ', '088980244893', 'Masruroh, S.Pd.jpeg'),
(4, 'Catur Sri Wahyuni, S.Pd', 'Perempuan', 'Islam', 'Wunungsari RT 01 RW 05 Kedungsuren Kaliwungu Selatan\r\n', '083128298135', 'Catur Sri Wahyuni, S.Pd.jpeg'),
(5, 'Rulin Firanika, S.Pd', 'Perempuan', 'Islam', 'Asri RT 01 RW 02 Kedungsuren Kaliwungu Selatan \r\n', '083822187862', 'Rulin Firanika, S.Pd.jpeg');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `jurnal`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `jurnal` (
`tanggal_transaksi` date
,`kode_transaksi` varchar(255)
,`deskripsi` text
,`akun` varchar(50)
,`jenis_akun` enum('Aktiva Lancar','Aktiva Tetap','Modal','Utang Lancar','Pendapatan','Beban','Pengeluaran','Kewajiban','Harga Pokok Penjualan','Penyusutan')
,`id_transaksi` int(11)
,`debit` decimal(10,2)
,`kredit` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemasukan`
--

CREATE TABLE `pemasukan` (
  `id_pemasukan` int(11) NOT NULL,
  `kode_pemasukan` varchar(50) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `tanggal_transaksi` date DEFAULT NULL,
  `id_pengguna` int(11) DEFAULT NULL,
  `id_akun` int(11) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `kode_pengguna` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `pemasukan`
--

INSERT INTO `pemasukan` (`id_pemasukan`, `kode_pemasukan`, `total`, `tanggal_transaksi`, `id_pengguna`, `id_akun`, `keterangan`, `kode_pengguna`) VALUES
(173, 'PJ-001', 150000.00, '2024-08-05', 7, 5, 'Pembayaran pendukung pembelajaran', 'TK-003'),
(174, 'PJ-002', 150000.00, '2024-05-08', 7, 5, 'Pembayaran porseni ellen', 'TK-003'),
(175, 'PJ-003', 65000.00, '2024-05-08', 7, 5, 'Pembayaran spp ellen agustus 24', 'TK-003'),
(176, 'PJ-004', 65000.00, '2025-01-06', 7, 5, 'Pembayaran spp adzka dwi jan 25', 'TK-003'),
(179, 'PJ-005', 65000.00, '2025-01-06', 7, 5, 'Pembayaran SPP ADZA DWI feb 25', 'TK-003'),
(180, 'PJ-006', 65000.00, '2025-01-08', 7, 5, 'Pembayaran spp riska nafia 01-25', 'TK-003'),
(181, 'PJ-007', 65000.00, '2025-01-08', 7, 5, 'Pembayaran spp misha malayeka 01-25', 'TK-003'),
(182, 'PJ-008', 65000.00, '2025-01-08', 7, 5, 'Pembayaran spp misha malayeka 02-25', 'TK-003'),
(183, 'PJ-009', 65000.00, '2025-02-07', 7, 5, 'Pembayaran spp eling 01-25', 'TK-003'),
(184, 'PJ-010', 65000.00, '2025-02-07', 7, 5, 'Pembayaran spp eling 02-25', 'TK-003'),
(185, 'PJ-011', 65000.00, '2025-02-07', 7, 5, 'Pembayaran spp eling 03-25', 'TK-003'),
(186, 'PJ-012', 65000.00, '2025-02-15', 7, 5, 'Pembayaran spp riska nafia 02-25', 'TK-003'),
(188, 'PJ-013', 275000.00, '2025-04-11', 7, 5, 'Pembayaran seragam eling', 'TK-003'),
(189, 'PJ-014', 100000.00, '2025-03-06', 7, 5, 'Pembayaran pembangunan adira', 'TK-003'),
(190, 'PJ-015', 150000.00, '2025-03-06', 7, 5, 'Pembayaran porseni adira', 'TK-003'),
(191, 'PJ-016', 150000.00, '2025-03-06', 7, 5, 'Pembayaran pendukung pembelajaran adira', 'TK-003'),
(192, 'PJ-017', 150000.00, '2024-12-20', 7, 5, 'Pembayaran pendukung pembelajaran kholid', 'TK-003'),
(193, 'PJ-018', 100000.00, '2024-12-20', 7, 5, 'Pembayaran pembangunan kholid', 'TK-003'),
(194, 'PJ-019', 275000.00, '2024-08-13', 7, 5, 'Pembayaran seragam wildan', 'TK-003'),
(195, 'PJ-020', 275000.00, '2025-01-13', 7, 5, 'Pembayaran seragam talita', 'TK-003'),
(196, 'PJ-021', 65000.00, '2025-01-13', 7, 5, 'Pembayaran spp tsamara 01-25', 'TK-003');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_siswa` int(11) DEFAULT NULL,
  `jenis_pembayaran` enum('SPP','Pembangunan','Seragam','Porseni','Pembayaran Lainnya') DEFAULT NULL,
  `bulan_tagihan` varchar(50) DEFAULT NULL,
  `tanggal_pembayaran` date DEFAULT NULL,
  `kode_pemasukan` varchar(50) DEFAULT NULL,
  `jumlah` decimal(10,2) DEFAULT NULL,
  `tahun_tagihan` varchar(50) DEFAULT NULL,
  `bukti_pembayaran` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_siswa`, `jenis_pembayaran`, `bulan_tagihan`, `tanggal_pembayaran`, `kode_pemasukan`, `jumlah`, `tahun_tagihan`, `bukti_pembayaran`) VALUES
(89, 35, 'SPP', 'January', '2025-02-21', 'PJ-035', 65000.00, '2025', NULL),
(92, 5, 'SPP', 'March', '2025-03-04', 'PJ-038', 65000.00, '2025', NULL),
(101, 25, 'SPP', 'March', '2025-04-11', 'PJ-048', 65000.00, '2025', NULL),
(102, 3, 'SPP', 'May', '2025-04-11', 'PJ-049', 65000.00, '2025', NULL),
(103, 3, 'Pembangunan', 'November', '2025-04-14', 'PJ-050', 1000.00, '2023', NULL),
(150, 56, 'Pembayaran Lainnya', 'July', '2024-08-05', 'PJ-001', 150000.00, '2024', 'PJ-001.jpeg'),
(151, 56, 'Porseni', 'July', '2024-05-08', 'PJ-002', 150000.00, '2024', 'PJ-002.jpeg'),
(152, 56, 'SPP', 'August', '2024-05-08', 'PJ-003', 65000.00, '2024', 'PJ-003.jpeg'),
(153, 42, 'SPP', 'January', '2025-01-06', 'PJ-004', 65000.00, '2025', 'PJ-004.jpeg'),
(156, 42, 'SPP', 'February', '2025-01-06', 'PJ-005', 65000.00, '2025', 'PJ-005.jpeg'),
(157, 44, 'SPP', 'January', '2025-01-08', 'PJ-006', 65000.00, '2025', 'PJ-006.jpeg'),
(158, 52, 'SPP', 'January', '2025-01-08', 'PJ-007', 65000.00, '2025', 'PJ-007.jpeg'),
(159, 52, 'SPP', 'February', '2025-01-08', 'PJ-008', 65000.00, '2025', 'PJ-008.jpeg'),
(160, 48, 'SPP', 'January', '2025-02-07', 'PJ-009', 65000.00, '2025', 'PJ-009.jpeg'),
(161, 48, 'SPP', 'February', '2025-02-07', 'PJ-010', 65000.00, '2025', 'PJ-010.jpeg'),
(162, 48, 'SPP', 'March', '2025-02-07', 'PJ-011', 65000.00, '2025', 'PJ-011.jpeg'),
(163, 44, 'SPP', 'February', '2025-02-15', 'PJ-012', 65000.00, '2025', 'PJ-012.jpeg'),
(165, 48, 'Seragam', 'July', '2025-04-11', 'PJ-013', 275000.00, '2024', 'PJ-013.jpeg'),
(166, 41, 'Pembangunan', 'July', '2025-03-06', 'PJ-014', 100000.00, '2024', 'PJ-014.jpeg'),
(167, 41, 'Porseni', 'July', '2025-03-06', 'PJ-015', 150000.00, '2024', 'PJ-015.jpeg'),
(168, 41, 'Pembayaran Lainnya', 'July', '2025-03-06', 'PJ-016', 150000.00, '2025', 'PJ-016.jpeg'),
(169, 57, 'Pembayaran Lainnya', 'July', '2024-12-20', 'PJ-017', 150000.00, '2024', 'PJ-017.jpeg'),
(170, 57, 'Pembangunan', 'July', '2024-12-20', 'PJ-018', 100000.00, '2024', 'PJ-018.jpeg'),
(171, 58, 'Seragam', 'July', '2024-08-13', 'PJ-019', 275000.00, '2024', 'PJ-019.jpeg'),
(172, 45, 'Seragam', 'July', '2025-01-13', 'PJ-020', 275000.00, '2024', 'PJ-020.jpeg'),
(173, 63, 'SPP', 'January', '2025-01-13', 'PJ-021', 65000.00, '2025', 'PJ-021.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `id_pengeluaran` int(11) NOT NULL,
  `kode_pengeluaran` varchar(50) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `tanggal_transaksi` date DEFAULT NULL,
  `id_pengguna` int(11) DEFAULT NULL,
  `id_akun` int(11) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `kode_pengguna` varchar(50) DEFAULT NULL,
  `nota` varchar(100) DEFAULT NULL,
  `guru_penerima` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `pengeluaran`
--

INSERT INTO `pengeluaran` (`id_pengeluaran`, `kode_pengeluaran`, `total`, `tanggal_transaksi`, `id_pengguna`, `id_akun`, `keterangan`, `kode_pengguna`, `nota`, `guru_penerima`) VALUES
(30, 'PG-001', 103000.00, '2025-02-19', 5, 5, 'Biaya Listrik Bulan januari 2025', 'TK-001', 'WhatsApp Image 2025-02-27 at 12.36.50.jpeg', 'Rulin Firanika, S.Pd'),
(35, 'PG-002', 92000.00, '2025-01-06', 7, 5, 'pembelian stick dan platisin', 'TK-003', 'WhatsApp Image 2025-03-22 at 16.11.40 (3).jpeg', 'Rulin Firanika, S.Pd'),
(36, 'PG-003', 107500.00, '2025-01-26', 7, 5, 'pembelian kertas origami dan lakban', 'TK-003', 'WhatsApp Image 2025-03-22 at 16.11.40 (1).jpeg', 'Rulin Firanika, S.Pd'),
(37, 'PG-004', 480000.00, '2025-01-31', 7, 5, 'makan siang bersama 40 nasi kotak', 'TK-003', 'WhatsApp Image 2025-03-22 at 16.11.40.jpeg', 'Catur Sri Wahyuni, S.Pd'),
(38, 'PG-005', 192000.00, '2025-01-28', 7, 5, 'pembelian kertas', 'TK-003', 'WhatsApp Image 2025-03-22 at 16.11.39 (2).jpeg', 'Rulin Firanika, S.Pd'),
(39, 'PG-006', 335000.00, '2025-02-05', 7, 5, 'pembelian perlengkapan alat tulis', 'TK-003', 'WhatsApp Image 2025-03-22 at 16.11.39 (1).jpeg', 'Rulin Firanika, S.Pd'),
(40, 'PG-007', 329000.00, '2025-02-13', 7, 5, 'pembelian crayon', 'TK-003', 'WhatsApp Image 2025-03-22 at 16.11.30.jpeg', 'Masruroh, S.Pd'),
(42, 'PG-008', 180000.00, '2025-02-25', 7, 5, 'pembelian lilin mainan', 'TK-003', 'WhatsApp Image 2025-03-22 at 16.11.39.jpeg', 'Masruroh, S.Pd'),
(43, 'PG-009', 15000.00, '2025-03-01', 7, 5, 'biaya air bulan maret 2025', 'TK-003', 'WhatsApp Image 2025-03-22 at 16.11.41.jpeg', 'Catur Sri Wahyuni, S.Pd'),
(44, 'PG-010', 20000.00, '2025-04-10', 7, 5, 'pembayaran biaya air 03/25', 'TK-003', 'biaya air.jpeg', 'Rulin Firanika, S.Pd'),
(46, 'PG-011', 100000.00, '2025-05-07', 7, 5, 'pembayaran biaya listrik bulan mei 2025', 'TK-003', 'WhatsApp Image 2025-05-05 at 12.22.29.jpeg', 'Rulin Firanika, S.Pd');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(20) DEFAULT NULL,
  `nama` varchar(55) DEFAULT NULL,
  `kode_pengguna` varchar(50) DEFAULT NULL,
  `foto_pengguna` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `username`, `password`, `level`, `nama`, `kode_pengguna`, `foto_pengguna`) VALUES
(5, 'masruroh', '$2y$10$qE1j888lNYL2JIJcq7GEEe32k98H8EoDkk..U1Ci/8M2FciifAqIO', 'Kepala Sekolah', 'MASRUROH, S.Pd', 'TK-001', 'TK-001.jpeg'),
(7, 'catur', '$2y$10$2.WfztxzIErQJIN6F9eoI.yCSI528KbvP9eJLM3woz5voem3cSsa6', 'Bendahara', 'CATUR SRI WAHYUNI, S.Pd', 'TK-003', 'TK-003.jpeg'),
(12, 'Rulin', '$2y$10$okmn1OrngeVEHZYilYlP7emUj7dS6I5fsZFqRKphF..br6kOYXujq', 'Sekretaris', 'RULIN FIRANIKA, S.Pd', 'TK-002', 'TK-002.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL,
  `nama_siswa` varchar(50) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `alamat` text NOT NULL,
  `tahun_masuk` int(11) NOT NULL,
  `nama_ayah` varchar(50) NOT NULL,
  `nama_ibu` varchar(50) NOT NULL,
  `no_telp` varchar(15) DEFAULT NULL,
  `kelas` varchar(20) NOT NULL,
  `nipd` varchar(30) DEFAULT NULL,
  `agama` enum('Islam','Kristen','Hindu','Budha','Konghucu') NOT NULL,
  `foto_siswa` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nama_siswa`, `jenis_kelamin`, `alamat`, `tahun_masuk`, `nama_ayah`, `nama_ibu`, `no_telp`, `kelas`, `nipd`, `agama`, `foto_siswa`) VALUES
(41, 'ADIRA HERMAWAN', 'Laki-laki', 'Kedungsuren RT 01 RW 01 Kaliwungu Selatan', 2024, 'ADE HERMAWAN', 'RIDNAWATI', '089242700027', 'B1', '1075', 'Islam', '1075.jpeg'),
(42, 'ADZKA DWI AWANDINI', 'Perempuan', 'Kedungsuren RT 04 RW 02', 2024, 'MOKHAMAD ABDUL ROIS', 'DEWI MIARNI', '0000', 'B2', '1108', 'Islam', '1108.jpeg'),
(43, 'AKMAL DYANDRA WINARDI', 'Laki-laki', 'Kedungsuren RT 03 RW 02', 2024, 'AGUS PURNOMO WINARDI', 'LELI PUJI ASTUTI', '0895411592346', 'A', '1103', 'Islam', '1103.jpeg'),
(44, 'RISKA NAFIA', 'Perempuan', 'Krajan Timur RT 001 RW 005 Kedungsuren', 2024, 'NGATIRIN', 'TARSIYAH', '9999', 'A', '1094', 'Islam', '1094.jpeg'),
(45, 'TALITA ELFINA SHAQUEENA', 'Perempuan', 'Candiroto RT 03 RW 05 Kedungsuren', 2024, 'KUZEMASRONI', 'MASROKAH', '999', 'A', '1088', 'Islam', '1088.jpeg'),
(46, 'ANINDYA AQILA SHAQUILLA', 'Perempuan', 'Kedungsuren RT 1 RW 6', 2024, 'AHMAD DINI', 'SUGIYATI', '0000', 'A', '1102', 'Islam', '1102.jpeg'),
(47, 'ARSYILA NADHIRA AZMI', 'Perempuan', 'Tunggak sari RT 2 RW 6 Kedungsuren', 2024, 'Sukirman', 'Sulastri', '000', 'A', '1117', 'Islam', '1117.jpeg'),
(48, 'ELING GEMEBYARING CAHAYA SUMARMONO', 'Perempuan', 'Kedungsuren RT 5 RW 2 ', 2024, 'ADHI SUMARMONO', 'SISMA SWA PURNAMASARI', '085642504521', 'A', '0000', 'Islam', '0000.jpeg'),
(49, 'KANIA NOVIANA PUTRI', 'Perempuan', 'Tunggak Sari RT 2 RW 6 Kedungsuren', 2024, 'IMAM WAHYUDI', 'SUSI YANAH', '0000', 'A', '1118', 'Islam', '1118.jpeg'),
(50, 'MUHAMMAD NIZAM MAULANA', 'Laki-laki', 'Tunggak Mulypo RT 3 RW 6 Kedungsuren', 2024, 'MUH JAPRI', 'AMALIA', '0000', 'B1', '1096', 'Islam', '1096.jpeg'),
(51, 'NESSIA ZELINE ZAKEISHA', 'Perempuan', 'Candiroto RT 3 RW 5 Kedungsuren', 2024, 'MUSABIKIS', 'TANTRI', '0000', 'A', '1114', 'Islam', '1114.jpeg'),
(52, 'MISHA MALAYEKA RAMADHANI', 'Perempuan', 'Muntuksari RT 4 RW 1 Kedungsuren', 2024, 'SUJONO', 'KUMAIDAH', '0000', 'A', '1112', 'Islam', '1112.jpeg'),
(53, 'HAFIZ TRI WICAKSONO', 'Laki-laki', 'Wunungsari RT 1 RW 5 Kedungsuren', 2024, 'SAMSUDIN', 'DIAN PURWANTI', '0000', 'B2', '1070', 'Islam', '1070.jpeg'),
(54, 'RAFFA EGI MAULANA', 'Laki-laki', 'Kauman Timur RT 4 RW 2 Kedungsuren', 2024, 'AHMAD ROMADHON', 'TRI YULIATI', '0000', 'B1', '1071', 'Islam', '1071.jpeg'),
(55, 'ARKA DWI FATHIAN', 'Laki-laki', 'DWIMULYO RT 2 RW 2 Kedungsuren', 2024, 'ASPIRIN', 'NANIK PUSTILAH', '08', 'B2', '1098', 'Islam', '1098.jpeg'),
(56, 'ELLEN CASSANDRA', 'Perempuan', 'Kebonsari RT 04 RW 05 Kedungsuren', 2024, 'LALANG POPO ANGGORO', 'TRIYANI', '000', 'B1', '1072', 'Islam', '1072.jpeg'),
(57, 'MUHAMMAD KHOLID ALMUBAROK', 'Laki-laki', 'KEDUNGSUREN RT 2 RW 5', 2024, 'ROMDONI', 'SITI ASROFAH', '08', 'B2', '1099', 'Islam', '1099.jpeg'),
(58, 'AHMAD WILDAN ALFAQIH', 'Laki-laki', 'KEDUNGSUREN RT 1 RW 6', 2024, 'NASIKUN', 'KHOERUN NIKMAH', '08', 'B2', '1083', 'Islam', '1083.jpeg'),
(59, 'ASKA WAHYU RISKI', 'Laki-laki', 'CANDIROTO RT 3 RW 5 KEDUNGSUREN', 2024, 'PUNDI WAHYU UTOMO', 'SITI KOMARIYAH', '089025271899', 'B2', '10871', 'Islam', '10871.jpeg'),
(60, 'RAFI HAMIZAN ABDILLAH', 'Laki-laki', 'KEDUNGSUREN RT 4 RW 5 ', 2024, 'ROBANI', 'SOPIATUN', '081236279021', 'B2', '1106', 'Islam', '1106.jpeg'),
(61, 'BINAR GENDHIS ALITA', 'Perempuan', 'KEDUNGSUREN RT 1 RW 6', 2024, 'SUTRISNO', 'KARIYATUN', '08787', 'B2', '1086', 'Islam', '1086.jpeg'),
(62, 'FARZAN DIWANGKARA NURBAKTI', 'Laki-laki', 'KEDUNGSUREN RT 3 RW 1', 2024, 'SLAMET SUGIARTO', 'WINARNI', '088', 'B2', '1078', 'Islam', '1078.jpeg'),
(63, 'TSAMARA KHAIRA MURTI', 'Perempuan', 'KEDUNGSUREN RT 3 RW 1', 2024, 'PANON PUPUT ANGANTI', 'EVA PUSPITA FEBRIANTI', '0888', 'B2', '1080', 'Islam', '1080.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `kode_transaksi` varchar(255) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `id_akun_debit` int(11) NOT NULL,
  `id_akun_kredit` int(11) NOT NULL,
  `tanggal_transaksi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `deskripsi`, `kode_transaksi`, `total`, `id_akun_debit`, `id_akun_kredit`, `tanggal_transaksi`) VALUES
(74, 'Biaya Listrik Bulan januari 2025', 'PG-001', 103000.00, 26, 5, '2025-02-19'),
(148, 'pembelian stick dan platisin', 'PG-002', 92000.00, 18, 5, '2025-01-06'),
(149, 'pembelian kertas origami dan lakban', 'PG-003', 107500.00, 18, 5, '2025-01-26'),
(150, 'makan siang bersama 40 nasi kotak', 'PG-004', 480000.00, 20, 5, '2025-01-31'),
(151, 'pembelian kertas', 'PG-005', 192000.00, 18, 5, '2025-01-28'),
(152, 'pembelian perlengkapan alat tulis', 'PG-006', 335000.00, 18, 5, '2025-02-05'),
(153, 'pembelian crayon', 'PG-007', 329000.00, 18, 5, '2025-02-13'),
(155, 'pembelian lilin mainan', 'PG-008', 180000.00, 18, 5, '2025-02-25'),
(156, 'biaya air bulan maret 2025', 'PG-009', 15000.00, 16, 5, '2025-03-01'),
(164, 'pembayaran biaya air 03/25', 'PG-010', 20000.00, 16, 5, '2025-04-10'),
(216, 'Pembayaran pendukung pembelajaran', 'PJ-001', 150000.00, 5, 7, '2024-08-05'),
(217, 'Pembayaran porseni ellen', 'PJ-002', 150000.00, 5, 7, '2024-05-08'),
(218, 'Pembayaran spp ellen agustus 24', 'PJ-003', 65000.00, 5, 7, '2024-05-08'),
(219, 'Pembayaran spp adzka dwi jan 25', 'PJ-004', 65000.00, 5, 7, '2025-01-06'),
(222, 'Pembayaran SPP ADZA DWI feb 25', 'PJ-005', 65000.00, 5, 7, '2025-01-06'),
(223, 'Pembayaran spp riska nafia 01-25', 'PJ-006', 65000.00, 5, 7, '2025-01-08'),
(224, 'Pembayaran spp misha malayeka 01-25', 'PJ-007', 65000.00, 5, 7, '2025-01-08'),
(225, 'Pembayaran spp misha malayeka 02-25', 'PJ-008', 65000.00, 5, 7, '2025-01-08'),
(226, 'Pembayaran spp eling 01-25', 'PJ-009', 65000.00, 5, 7, '2025-02-07'),
(227, 'Pembayaran spp eling 02-25', 'PJ-010', 65000.00, 5, 7, '2025-02-07'),
(228, 'Pembayaran spp eling 03-25', 'PJ-011', 65000.00, 5, 7, '2025-02-07'),
(229, 'Pembayaran spp riska nafia 02-25', 'PJ-012', 65000.00, 5, 7, '2025-02-15'),
(231, 'Pembayaran seragam eling', 'PJ-013', 275000.00, 5, 7, '2025-04-11'),
(232, 'Pembayaran pembangunan adira', 'PJ-014', 100000.00, 5, 7, '2025-03-06'),
(233, 'Pembayaran porseni adira', 'PJ-015', 150000.00, 5, 7, '2025-03-06'),
(234, 'Pembayaran pendukung pembelajaran adira', 'PJ-016', 150000.00, 5, 7, '2025-03-06'),
(235, 'Pembayaran pendukung pembelajaran kholid', 'PJ-017', 150000.00, 5, 7, '2024-12-20'),
(236, 'Pembayaran pembangunan kholid', 'PJ-018', 100000.00, 5, 7, '2024-12-20'),
(237, 'Pembayaran seragam wildan', 'PJ-019', 275000.00, 5, 7, '2024-08-13'),
(238, 'Pembayaran seragam talita', 'PJ-020', 275000.00, 5, 7, '2025-01-13'),
(239, 'Pembayaran spp tsamara 01-25', 'PJ-021', 65000.00, 5, 7, '2025-01-13'),
(242, 'pembayaran biaya listrik bulan mei 2025', 'PG-011', 100000.00, 26, 5, '2025-05-07');

-- --------------------------------------------------------

--
-- Struktur untuk view `jurnal`
--
DROP TABLE IF EXISTS `jurnal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `jurnal`  AS SELECT `t`.`tanggal_transaksi` AS `tanggal_transaksi`, `t`.`kode_transaksi` AS `kode_transaksi`, `t`.`deskripsi` AS `deskripsi`, `a1`.`nama_akun` AS `akun`, `a1`.`jenis_akun` AS `jenis_akun`, `t`.`id_transaksi` AS `id_transaksi`, CASE WHEN `t`.`id_akun_debit` = `a1`.`id_akun` THEN `t`.`total` ELSE 0 END AS `debit`, CASE WHEN `t`.`id_akun_kredit` = `a1`.`id_akun` THEN `t`.`total` ELSE 0 END AS `kredit` FROM (`transaksi` `t` join `akun` `a1` on(`t`.`id_akun_debit` = `a1`.`id_akun` or `t`.`id_akun_kredit` = `a1`.`id_akun`)) ORDER BY `t`.`tanggal_transaksi` ASC ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id_akun`) USING BTREE;

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id_guru`) USING BTREE;

--
-- Indeks untuk tabel `pemasukan`
--
ALTER TABLE `pemasukan`
  ADD PRIMARY KEY (`id_pemasukan`) USING BTREE,
  ADD KEY `id_akun` (`id_akun`) USING BTREE,
  ADD KEY `id_pengguna` (`id_pengguna`) USING BTREE;

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`) USING BTREE;

--
-- Indeks untuk tabel `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`id_pengeluaran`) USING BTREE,
  ADD KEY `id_akun` (`id_akun`) USING BTREE,
  ADD KEY `id_pengguna` (`id_pengguna`) USING BTREE;

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`) USING BTREE;

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`) USING BTREE;

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`) USING BTREE,
  ADD KEY `id_akun_debit` (`id_akun_debit`) USING BTREE,
  ADD KEY `id_akun_kredit` (`id_akun_kredit`) USING BTREE;

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `akun`
--
ALTER TABLE `akun`
  MODIFY `id_akun` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `guru`
--
ALTER TABLE `guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `pemasukan`
--
ALTER TABLE `pemasukan`
  MODIFY `id_pemasukan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT untuk tabel `pengeluaran`
--
ALTER TABLE `pengeluaran`
  MODIFY `id_pengeluaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pemasukan`
--
ALTER TABLE `pemasukan`
  ADD CONSTRAINT `pemasukan_ibfk_2` FOREIGN KEY (`id_akun`) REFERENCES `akun` (`id_akun`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemasukan_ibfk_3` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD CONSTRAINT `pengeluaran_ibfk_2` FOREIGN KEY (`id_akun`) REFERENCES `akun` (`id_akun`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengeluaran_ibfk_3` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_akun_debit`) REFERENCES `akun` (`id_akun`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_akun_kredit`) REFERENCES `akun` (`id_akun`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

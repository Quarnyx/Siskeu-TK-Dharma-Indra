/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : 127.0.0.1:3306
 Source Schema         : lisa

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 09/05/2025 11:08:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for akun
-- ----------------------------
DROP TABLE IF EXISTS `akun`;
CREATE TABLE `akun`  (
  `id_akun` int NOT NULL AUTO_INCREMENT,
  `nama_akun` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jenis_akun` enum('Aktiva Lancar','Aktiva Tetap','Modal','Utang Lancar','Pendapatan','Beban','Pengeluaran','Kewajiban','Harga Pokok Penjualan','Penyusutan') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `wajib` tinyint(1) NULL DEFAULT NULL,
  `kode_akun` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_akun`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of akun
-- ----------------------------
INSERT INTO `akun` VALUES (5, 'Kas', 'Aktiva Lancar', 1, '101');
INSERT INTO `akun` VALUES (7, 'Pendapatan', 'Pendapatan', 1, '401');
INSERT INTO `akun` VALUES (9, 'Modal', 'Modal', NULL, '301');
INSERT INTO `akun` VALUES (13, 'Biaya Transportasi Guru', 'Beban', NULL, '502');
INSERT INTO `akun` VALUES (16, 'Biaya air ', 'Beban', 0, '501');
INSERT INTO `akun` VALUES (17, 'Biaya Pemeliharaan', 'Beban', 0, '503');
INSERT INTO `akun` VALUES (18, 'Biaya Perlengkapan ', 'Beban', 0, '504');
INSERT INTO `akun` VALUES (19, 'Biaya Peralatan ', 'Beban', 0, '505');
INSERT INTO `akun` VALUES (20, 'Biaya Makan Bersama', 'Beban', 0, '506');
INSERT INTO `akun` VALUES (21, 'Hutang Gaji', 'Utang Lancar', 0, '201');
INSERT INTO `akun` VALUES (22, 'Biaya Kegiatan Sosial', 'Beban', 0, '507');
INSERT INTO `akun` VALUES (26, 'Biaya Listrik', 'Beban', 0, '508');
INSERT INTO `akun` VALUES (27, 'Biaya Seragam', 'Beban', 0, '509');
INSERT INTO `akun` VALUES (28, 'Biaya Listrik', 'Beban', 0, '512');

-- ----------------------------
-- Table structure for guru
-- ----------------------------
DROP TABLE IF EXISTS `guru`;
CREATE TABLE `guru`  (
  `id_guru` int NOT NULL AUTO_INCREMENT,
  `nama_guru` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jk` enum('Laki-laki','Perempuan') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `agama_guru` enum('Islam','Kristen','Hindu','Budha','Konghucu') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `no_telp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `foto_guru` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_guru`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of guru
-- ----------------------------
INSERT INTO `guru` VALUES (2, 'Masruroh, S.Pd', 'Perempuan', 'Islam', 'Kedungsuren RT 04 RW 04 Kaliwungu Selatan ', '088980244893', 'Masruroh, S.Pd.jpeg');
INSERT INTO `guru` VALUES (4, 'Catur Sri Wahyuni, S.Pd', 'Perempuan', 'Islam', 'Wunungsari RT 01 RW 05 Kedungsuren Kaliwungu Selatan\r\n', '083128298135', 'Catur Sri Wahyuni, S.Pd.jpeg');
INSERT INTO `guru` VALUES (5, 'Rulin Firanika, S.Pd', 'Perempuan', 'Islam', 'Asri RT 01 RW 02 Kedungsuren Kaliwungu Selatan \r\n', '083822187862', 'Rulin Firanika, S.Pd.jpeg');

-- ----------------------------
-- Table structure for pemasukan
-- ----------------------------
DROP TABLE IF EXISTS `pemasukan`;
CREATE TABLE `pemasukan`  (
  `id_pemasukan` int NOT NULL AUTO_INCREMENT,
  `kode_pemasukan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total` decimal(10, 2) NULL DEFAULT NULL,
  `tanggal_transaksi` date NULL DEFAULT NULL,
  `id_pengguna` int NULL DEFAULT NULL,
  `id_akun` int NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `kode_pengguna` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bukti_pemasukan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_pemasukan`) USING BTREE,
  INDEX `id_akun`(`id_akun` ASC) USING BTREE,
  INDEX `id_pengguna`(`id_pengguna` ASC) USING BTREE,
  CONSTRAINT `pemasukan_ibfk_2` FOREIGN KEY (`id_akun`) REFERENCES `akun` (`id_akun`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pemasukan_ibfk_3` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 204 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pemasukan
-- ----------------------------
INSERT INTO `pemasukan` VALUES (173, 'PJ-001', 150000.00, '2024-08-05', 7, 5, 'Pembayaran pendukung pembelajaran', 'TK-003', NULL);
INSERT INTO `pemasukan` VALUES (174, 'PJ-002', 150000.00, '2024-05-08', 7, 5, 'Pembayaran porseni ellen', 'TK-003', NULL);
INSERT INTO `pemasukan` VALUES (175, 'PJ-003', 65000.00, '2024-05-08', 7, 5, 'Pembayaran spp ellen agustus 24', 'TK-003', NULL);
INSERT INTO `pemasukan` VALUES (176, 'PJ-004', 65000.00, '2025-01-06', 7, 5, 'Pembayaran spp adzka dwi jan 25', 'TK-003', NULL);
INSERT INTO `pemasukan` VALUES (179, 'PJ-005', 65000.00, '2025-01-06', 7, 5, 'Pembayaran SPP ADZA DWI feb 25', 'TK-003', NULL);
INSERT INTO `pemasukan` VALUES (180, 'PJ-006', 65000.00, '2025-01-08', 7, 5, 'Pembayaran spp riska nafia 01-25', 'TK-003', NULL);
INSERT INTO `pemasukan` VALUES (181, 'PJ-007', 65000.00, '2025-01-08', 7, 5, 'Pembayaran spp misha malayeka 01-25', 'TK-003', NULL);
INSERT INTO `pemasukan` VALUES (182, 'PJ-008', 65000.00, '2025-01-08', 7, 5, 'Pembayaran spp misha malayeka 02-25', 'TK-003', NULL);
INSERT INTO `pemasukan` VALUES (183, 'PJ-009', 65000.00, '2025-02-07', 7, 5, 'Pembayaran spp eling 01-25', 'TK-003', NULL);
INSERT INTO `pemasukan` VALUES (184, 'PJ-010', 65000.00, '2025-02-07', 7, 5, 'Pembayaran spp eling 02-255', 'TK-003', NULL);
INSERT INTO `pemasukan` VALUES (185, 'PJ-011', 65000.00, '2025-02-07', 7, 5, 'Pembayaran spp eling 03-25', 'TK-003', NULL);
INSERT INTO `pemasukan` VALUES (186, 'PJ-012', 65000.00, '2025-02-15', 7, 5, 'Pembayaran spp riska nafia 02-25', 'TK-003', NULL);
INSERT INTO `pemasukan` VALUES (188, 'PJ-013', 275000.00, '2025-04-11', 7, 5, 'Pembayaran seragam eling', 'TK-003', NULL);
INSERT INTO `pemasukan` VALUES (189, 'PJ-014', 100000.00, '2025-03-06', 7, 5, 'Pembayaran pembangunan adira', 'TK-003', NULL);
INSERT INTO `pemasukan` VALUES (190, 'PJ-015', 150000.00, '2025-03-06', 7, 5, 'Pembayaran porseni adira', 'TK-003', NULL);
INSERT INTO `pemasukan` VALUES (191, 'PJ-016', 150000.00, '2025-03-06', 7, 5, 'Pembayaran pendukung pembelajaran adira', 'TK-003', NULL);
INSERT INTO `pemasukan` VALUES (192, 'PJ-017', 150000.00, '2024-12-20', 7, 5, 'Pembayaran pendukung pembelajaran kholid', 'TK-003', NULL);
INSERT INTO `pemasukan` VALUES (193, 'PJ-018', 100000.00, '2024-12-20', 7, 5, 'Pembayaran pembangunan kholid', 'TK-003', NULL);
INSERT INTO `pemasukan` VALUES (194, 'PJ-019', 275000.00, '2024-08-13', 7, 5, 'Pembayaran seragam wildan', 'TK-003', NULL);
INSERT INTO `pemasukan` VALUES (195, 'PJ-020', 275000.00, '2025-01-13', 7, 5, 'Pembayaran seragam talita', 'TK-003', NULL);
INSERT INTO `pemasukan` VALUES (196, 'PJ-021', 65000.00, '2025-01-13', 7, 5, 'Pembayaran spp tsamara 01-25', 'TK-003', NULL);
INSERT INTO `pemasukan` VALUES (199, 'PJ-022', 15000.00, '2025-05-09', 7, 5, 'adsdasdadaaaa', 'TK-003', 'PJ-022.png');

-- ----------------------------
-- Table structure for pembayaran
-- ----------------------------
DROP TABLE IF EXISTS `pembayaran`;
CREATE TABLE `pembayaran`  (
  `id_pembayaran` int NOT NULL AUTO_INCREMENT,
  `id_siswa` int NULL DEFAULT NULL,
  `jenis_pembayaran` enum('SPP','Pembangunan','Seragam','Porseni','Pembayaran Lainnya') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bulan_tagihan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tanggal_pembayaran` date NULL DEFAULT NULL,
  `kode_pemasukan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jumlah` decimal(10, 2) NULL DEFAULT NULL,
  `tahun_tagihan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bukti_pembayaran` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_pembayaran`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 179 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pembayaran
-- ----------------------------
INSERT INTO `pembayaran` VALUES (89, 35, 'SPP', 'January', '2025-02-21', 'PJ-035', 65000.00, '2025', NULL);
INSERT INTO `pembayaran` VALUES (92, 5, 'SPP', 'March', '2025-03-04', 'PJ-038', 65000.00, '2025', NULL);
INSERT INTO `pembayaran` VALUES (101, 25, 'SPP', 'March', '2025-04-11', 'PJ-048', 65000.00, '2025', NULL);
INSERT INTO `pembayaran` VALUES (102, 3, 'SPP', 'May', '2025-04-11', 'PJ-049', 65000.00, '2025', NULL);
INSERT INTO `pembayaran` VALUES (103, 3, 'Pembangunan', 'November', '2025-04-14', 'PJ-050', 1000.00, '2023', NULL);
INSERT INTO `pembayaran` VALUES (150, 56, 'Pembayaran Lainnya', 'July', '2024-08-05', 'PJ-001', 150000.00, '2024', 'PJ-001.jpeg');
INSERT INTO `pembayaran` VALUES (151, 56, 'Porseni', 'July', '2024-05-08', 'PJ-002', 150000.00, '2024', 'PJ-002.jpeg');
INSERT INTO `pembayaran` VALUES (152, 56, 'SPP', 'August', '2024-05-08', 'PJ-003', 65000.00, '2024', 'PJ-003.jpeg');
INSERT INTO `pembayaran` VALUES (153, 42, 'SPP', 'January', '2025-01-06', 'PJ-004', 65000.00, '2025', 'PJ-004.jpeg');
INSERT INTO `pembayaran` VALUES (156, 42, 'SPP', 'February', '2025-01-06', 'PJ-005', 65000.00, '2025', 'PJ-005.jpeg');
INSERT INTO `pembayaran` VALUES (157, 44, 'SPP', 'January', '2025-01-08', 'PJ-006', 65000.00, '2025', 'PJ-006.jpeg');
INSERT INTO `pembayaran` VALUES (158, 52, 'SPP', 'January', '2025-01-08', 'PJ-007', 65000.00, '2025', 'PJ-007.jpeg');
INSERT INTO `pembayaran` VALUES (159, 52, 'SPP', 'February', '2025-01-08', 'PJ-008', 65000.00, '2025', 'PJ-008.jpeg');
INSERT INTO `pembayaran` VALUES (160, 48, 'SPP', 'January', '2025-02-07', 'PJ-009', 65000.00, '2025', 'PJ-009.jpeg');
INSERT INTO `pembayaran` VALUES (161, 48, 'SPP', 'February', '2025-02-07', 'PJ-010', 65000.00, '2025', 'PJ-010.jpeg');
INSERT INTO `pembayaran` VALUES (162, 48, 'SPP', 'March', '2025-02-07', 'PJ-011', 65000.00, '2025', 'PJ-011.jpeg');
INSERT INTO `pembayaran` VALUES (163, 44, 'SPP', 'February', '2025-02-15', 'PJ-012', 65000.00, '2025', 'PJ-012.jpeg');
INSERT INTO `pembayaran` VALUES (165, 48, 'Seragam', 'July', '2025-04-11', 'PJ-013', 275000.00, '2024', 'PJ-013.jpeg');
INSERT INTO `pembayaran` VALUES (166, 41, 'Pembangunan', 'July', '2025-03-06', 'PJ-014', 100000.00, '2024', 'PJ-014.jpeg');
INSERT INTO `pembayaran` VALUES (167, 41, 'Porseni', 'July', '2025-03-06', 'PJ-015', 150000.00, '2024', 'PJ-015.jpeg');
INSERT INTO `pembayaran` VALUES (168, 41, 'Pembayaran Lainnya', 'July', '2025-03-06', 'PJ-016', 150000.00, '2025', 'PJ-016.jpeg');
INSERT INTO `pembayaran` VALUES (169, 57, 'Pembayaran Lainnya', 'July', '2024-12-20', 'PJ-017', 150000.00, '2024', 'PJ-017.jpeg');
INSERT INTO `pembayaran` VALUES (170, 57, 'Pembangunan', 'July', '2024-12-20', 'PJ-018', 100000.00, '2024', 'PJ-018.jpeg');
INSERT INTO `pembayaran` VALUES (171, 58, 'Seragam', 'July', '2024-08-13', 'PJ-019', 275000.00, '2024', 'PJ-019.jpeg');
INSERT INTO `pembayaran` VALUES (172, 45, 'Seragam', 'July', '2025-01-13', 'PJ-020', 275000.00, '2024', 'PJ-020.jpeg');
INSERT INTO `pembayaran` VALUES (173, 63, 'SPP', 'January', '2025-01-13', 'PJ-021', 65000.00, '2025', 'PJ-021.jpeg');

-- ----------------------------
-- Table structure for pengeluaran
-- ----------------------------
DROP TABLE IF EXISTS `pengeluaran`;
CREATE TABLE `pengeluaran`  (
  `id_pengeluaran` int NOT NULL AUTO_INCREMENT,
  `kode_pengeluaran` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total` decimal(10, 2) NULL DEFAULT NULL,
  `tanggal_transaksi` date NULL DEFAULT NULL,
  `id_pengguna` int NULL DEFAULT NULL,
  `id_akun` int NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `kode_pengguna` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nota` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `guru_penerima` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_pengeluaran`) USING BTREE,
  INDEX `id_akun`(`id_akun` ASC) USING BTREE,
  INDEX `id_pengguna`(`id_pengguna` ASC) USING BTREE,
  CONSTRAINT `pengeluaran_ibfk_2` FOREIGN KEY (`id_akun`) REFERENCES `akun` (`id_akun`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pengeluaran_ibfk_3` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pengeluaran
-- ----------------------------
INSERT INTO `pengeluaran` VALUES (30, 'PG-001', 103000.00, '2025-02-19', 5, 5, 'Biaya Listrik Bulan januari 2025', 'TK-001', 'WhatsApp Image 2025-02-27 at 12.36.50.jpeg', 'Rulin Firanika, S.Pd');
INSERT INTO `pengeluaran` VALUES (35, 'PG-002', 92000.00, '2025-01-06', 7, 5, 'pembelian stick dan platisin', 'TK-003', 'WhatsApp Image 2025-03-22 at 16.11.40 (3).jpeg', 'Rulin Firanika, S.Pd');
INSERT INTO `pengeluaran` VALUES (36, 'PG-003', 107500.00, '2025-01-26', 7, 5, 'pembelian kertas origami dan lakban', 'TK-003', 'WhatsApp Image 2025-03-22 at 16.11.40 (1).jpeg', 'Rulin Firanika, S.Pd');
INSERT INTO `pengeluaran` VALUES (37, 'PG-004', 480000.00, '2025-01-31', 7, 5, 'makan siang bersama 40 nasi kotak', 'TK-003', 'WhatsApp Image 2025-03-22 at 16.11.40.jpeg', 'Catur Sri Wahyuni, S.Pd');
INSERT INTO `pengeluaran` VALUES (38, 'PG-005', 192000.00, '2025-01-28', 7, 5, 'pembelian kertas', 'TK-003', 'WhatsApp Image 2025-03-22 at 16.11.39 (2).jpeg', 'Rulin Firanika, S.Pd');
INSERT INTO `pengeluaran` VALUES (39, 'PG-006', 335000.00, '2025-02-05', 7, 5, 'pembelian perlengkapan alat tulis', 'TK-003', 'WhatsApp Image 2025-03-22 at 16.11.39 (1).jpeg', 'Rulin Firanika, S.Pd');
INSERT INTO `pengeluaran` VALUES (40, 'PG-007', 329000.00, '2025-02-13', 7, 5, 'pembelian crayon', 'TK-003', 'WhatsApp Image 2025-03-22 at 16.11.30.jpeg', 'Masruroh, S.Pd');
INSERT INTO `pengeluaran` VALUES (42, 'PG-008', 180000.00, '2025-02-25', 7, 5, 'pembelian lilin mainan', 'TK-003', 'WhatsApp Image 2025-03-22 at 16.11.39.jpeg', 'Masruroh, S.Pd');
INSERT INTO `pengeluaran` VALUES (43, 'PG-009', 15000.00, '2025-03-01', 7, 5, 'biaya air bulan maret 2025', 'TK-003', 'WhatsApp Image 2025-03-22 at 16.11.41.jpeg', 'Catur Sri Wahyuni, S.Pd');
INSERT INTO `pengeluaran` VALUES (44, 'PG-010', 20000.00, '2025-04-10', 7, 5, 'pembayaran biaya air 03/25', 'TK-003', 'biaya air.jpeg', 'Rulin Firanika, S.Pd');
INSERT INTO `pengeluaran` VALUES (46, 'PG-011', 100000.00, '2025-05-07', 7, 5, 'pembayaran biaya listrik bulan mei 2025', 'TK-003', 'WhatsApp Image 2025-05-05 at 12.22.29.jpeg', 'Rulin Firanika, S.Pd');

-- ----------------------------
-- Table structure for pengguna
-- ----------------------------
DROP TABLE IF EXISTS `pengguna`;
CREATE TABLE `pengguna`  (
  `id_pengguna` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `kode_pengguna` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `foto_pengguna` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_pengguna`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pengguna
-- ----------------------------
INSERT INTO `pengguna` VALUES (5, 'masruroh', '$2y$10$qE1j888lNYL2JIJcq7GEEe32k98H8EoDkk..U1Ci/8M2FciifAqIO', 'Kepala Sekolah', 'MASRUROH, S.Pd', 'TK-001', 'TK-001.jpeg');
INSERT INTO `pengguna` VALUES (7, 'catur', '$2y$10$2.WfztxzIErQJIN6F9eoI.yCSI528KbvP9eJLM3woz5voem3cSsa6', 'Bendahara', 'CATUR SRI WAHYUNI, S.Pd', 'TK-003', 'TK-003.jpeg');
INSERT INTO `pengguna` VALUES (12, 'Rulin', '$2y$10$okmn1OrngeVEHZYilYlP7emUj7dS6I5fsZFqRKphF..br6kOYXujq', 'Sekretaris', 'RULIN FIRANIKA, S.Pd', 'TK-002', 'TK-002.jpeg');

-- ----------------------------
-- Table structure for siswa
-- ----------------------------
DROP TABLE IF EXISTS `siswa`;
CREATE TABLE `siswa`  (
  `id_siswa` int NOT NULL AUTO_INCREMENT,
  `nama_siswa` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tahun_masuk` int NOT NULL,
  `nama_ayah` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_ibu` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `no_telp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `kelas` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nipd` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `agama` enum('Islam','Kristen','Hindu','Budha','Konghucu') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `foto_siswa` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_siswa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of siswa
-- ----------------------------
INSERT INTO `siswa` VALUES (41, 'ADIRA HERMAWAN', 'Laki-laki', 'Kedungsuren RT 01 RW 01 Kaliwungu Selatan', 2024, 'ADE HERMAWAN', 'RIDNAWATI', '089242700027', 'B1', '1075', 'Islam', '1075.jpeg');
INSERT INTO `siswa` VALUES (42, 'ADZKA DWI AWANDINI', 'Perempuan', 'Kedungsuren RT 04 RW 02', 2024, 'MOKHAMAD ABDUL ROIS', 'DEWI MIARNI', '0000', 'B2', '1108', 'Islam', '1108.jpeg');
INSERT INTO `siswa` VALUES (43, 'AKMAL DYANDRA WINARDI', 'Laki-laki', 'Kedungsuren RT 03 RW 02', 2024, 'AGUS PURNOMO WINARDI', 'LELI PUJI ASTUTI', '0895411592346', 'A', '1103', 'Islam', '1103.jpeg');
INSERT INTO `siswa` VALUES (44, 'RISKA NAFIA', 'Perempuan', 'Krajan Timur RT 001 RW 005 Kedungsuren', 2024, 'NGATIRIN', 'TARSIYAH', '9999', 'A', '1094', 'Islam', '1094.jpeg');
INSERT INTO `siswa` VALUES (45, 'TALITA ELFINA SHAQUEENA', 'Perempuan', 'Candiroto RT 03 RW 05 Kedungsuren', 2024, 'KUZEMASRONI', 'MASROKAH', '999', 'A', '1088', 'Islam', '1088.jpeg');
INSERT INTO `siswa` VALUES (46, 'ANINDYA AQILA SHAQUILLA', 'Perempuan', 'Kedungsuren RT 1 RW 6', 2024, 'AHMAD DINI', 'SUGIYATI', '0000', 'A', '1102', 'Islam', '1102.jpeg');
INSERT INTO `siswa` VALUES (47, 'ARSYILA NADHIRA AZMI', 'Perempuan', 'Tunggak sari RT 2 RW 6 Kedungsuren', 2024, 'Sukirman', 'Sulastri', '000', 'A', '1117', 'Islam', '1117.jpeg');
INSERT INTO `siswa` VALUES (48, 'ELING GEMEBYARING CAHAYA SUMARMONO', 'Perempuan', 'Kedungsuren RT 5 RW 2 ', 2024, 'ADHI SUMARMONO', 'SISMA SWA PURNAMASARI', '085642504521', 'A', '0000', 'Islam', '0000.jpeg');
INSERT INTO `siswa` VALUES (49, 'KANIA NOVIANA PUTRI', 'Perempuan', 'Tunggak Sari RT 2 RW 6 Kedungsuren', 2024, 'IMAM WAHYUDI', 'SUSI YANAH', '0000', 'A', '1118', 'Islam', '1118.jpeg');
INSERT INTO `siswa` VALUES (50, 'MUHAMMAD NIZAM MAULANA', 'Laki-laki', 'Tunggak Mulypo RT 3 RW 6 Kedungsuren', 2024, 'MUH JAPRI', 'AMALIA', '0000', 'B1', '1096', 'Islam', '1096.jpeg');
INSERT INTO `siswa` VALUES (51, 'NESSIA ZELINE ZAKEISHA', 'Perempuan', 'Candiroto RT 3 RW 5 Kedungsuren', 2024, 'MUSABIKIS', 'TANTRI', '0000', 'A', '1114', 'Islam', '1114.jpeg');
INSERT INTO `siswa` VALUES (52, 'MISHA MALAYEKA RAMADHANI', 'Perempuan', 'Muntuksari RT 4 RW 1 Kedungsuren', 2024, 'SUJONO', 'KUMAIDAH', '0000', 'A', '1112', 'Islam', '1112.jpeg');
INSERT INTO `siswa` VALUES (53, 'HAFIZ TRI WICAKSONO', 'Laki-laki', 'Wunungsari RT 1 RW 5 Kedungsuren', 2024, 'SAMSUDIN', 'DIAN PURWANTI', '0000', 'B2', '1070', 'Islam', '1070.jpeg');
INSERT INTO `siswa` VALUES (54, 'RAFFA EGI MAULANA', 'Laki-laki', 'Kauman Timur RT 4 RW 2 Kedungsuren', 2024, 'AHMAD ROMADHON', 'TRI YULIATI', '0000', 'B1', '1071', 'Islam', '1071.jpeg');
INSERT INTO `siswa` VALUES (55, 'ARKA DWI FATHIAN', 'Laki-laki', 'DWIMULYO RT 2 RW 2 Kedungsuren', 2024, 'ASPIRIN', 'NANIK PUSTILAH', '08', 'B2', '1098', 'Islam', '1098.jpeg');
INSERT INTO `siswa` VALUES (56, 'ELLEN CASSANDRA', 'Perempuan', 'Kebonsari RT 04 RW 05 Kedungsuren', 2024, 'LALANG POPO ANGGORO', 'TRIYANI', '000', 'B1', '1072', 'Islam', '1072.jpeg');
INSERT INTO `siswa` VALUES (57, 'MUHAMMAD KHOLID ALMUBAROK', 'Laki-laki', 'KEDUNGSUREN RT 2 RW 5', 2024, 'ROMDONI', 'SITI ASROFAH', '08', 'B2', '1099', 'Islam', '1099.jpeg');
INSERT INTO `siswa` VALUES (58, 'AHMAD WILDAN ALFAQIH', 'Laki-laki', 'KEDUNGSUREN RT 1 RW 6', 2024, 'NASIKUN', 'KHOERUN NIKMAH', '08', 'B2', '1083', 'Islam', '1083.jpeg');
INSERT INTO `siswa` VALUES (59, 'ASKA WAHYU RISKI', 'Laki-laki', 'CANDIROTO RT 3 RW 5 KEDUNGSUREN', 2024, 'PUNDI WAHYU UTOMO', 'SITI KOMARIYAH', '089025271899', 'B2', '10871', 'Islam', '10871.jpeg');
INSERT INTO `siswa` VALUES (60, 'RAFI HAMIZAN ABDILLAH', 'Laki-laki', 'KEDUNGSUREN RT 4 RW 5 ', 2024, 'ROBANI', 'SOPIATUN', '081236279021', 'B2', '1106', 'Islam', '1106.jpeg');
INSERT INTO `siswa` VALUES (61, 'BINAR GENDHIS ALITA', 'Perempuan', 'KEDUNGSUREN RT 1 RW 6', 2024, 'SUTRISNO', 'KARIYATUN', '08787', 'B2', '1086', 'Islam', '1086.jpeg');
INSERT INTO `siswa` VALUES (62, 'FARZAN DIWANGKARA NURBAKTI', 'Laki-laki', 'KEDUNGSUREN RT 3 RW 1', 2024, 'SLAMET SUGIARTO', 'WINARNI', '088', 'B2', '1078', 'Islam', '1078.jpeg');
INSERT INTO `siswa` VALUES (63, 'TSAMARA KHAIRA MURTI', 'Perempuan', 'KEDUNGSUREN RT 3 RW 1', 2024, 'PANON PUPUT ANGANTI', 'EVA PUSPITA FEBRIANTI', '0888', 'B2', '1080', 'Islam', '1080.jpeg');

-- ----------------------------
-- Table structure for transaksi
-- ----------------------------
DROP TABLE IF EXISTS `transaksi`;
CREATE TABLE `transaksi`  (
  `id_transaksi` int NOT NULL AUTO_INCREMENT,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kode_transaksi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `total` decimal(10, 2) NOT NULL,
  `id_akun_debit` int NOT NULL,
  `id_akun_kredit` int NOT NULL,
  `tanggal_transaksi` date NULL DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`) USING BTREE,
  INDEX `id_akun_debit`(`id_akun_debit` ASC) USING BTREE,
  INDEX `id_akun_kredit`(`id_akun_kredit` ASC) USING BTREE,
  CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_akun_debit`) REFERENCES `akun` (`id_akun`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_akun_kredit`) REFERENCES `akun` (`id_akun`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 248 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of transaksi
-- ----------------------------
INSERT INTO `transaksi` VALUES (74, 'Biaya Listrik Bulan januari 2025', 'PG-001', 103000.00, 26, 5, '2025-02-19');
INSERT INTO `transaksi` VALUES (148, 'pembelian stick dan platisin', 'PG-002', 92000.00, 18, 5, '2025-01-06');
INSERT INTO `transaksi` VALUES (149, 'pembelian kertas origami dan lakban', 'PG-003', 107500.00, 18, 5, '2025-01-26');
INSERT INTO `transaksi` VALUES (150, 'makan siang bersama 40 nasi kotak', 'PG-004', 480000.00, 20, 5, '2025-01-31');
INSERT INTO `transaksi` VALUES (151, 'pembelian kertas', 'PG-005', 192000.00, 18, 5, '2025-01-28');
INSERT INTO `transaksi` VALUES (152, 'pembelian perlengkapan alat tulis', 'PG-006', 335000.00, 18, 5, '2025-02-05');
INSERT INTO `transaksi` VALUES (153, 'pembelian crayon', 'PG-007', 329000.00, 18, 5, '2025-02-13');
INSERT INTO `transaksi` VALUES (155, 'pembelian lilin mainan', 'PG-008', 180000.00, 18, 5, '2025-02-25');
INSERT INTO `transaksi` VALUES (156, 'biaya air bulan maret 2025', 'PG-009', 15000.00, 16, 5, '2025-03-01');
INSERT INTO `transaksi` VALUES (164, 'pembayaran biaya air 03/25', 'PG-010', 20000.00, 16, 5, '2025-04-10');
INSERT INTO `transaksi` VALUES (216, 'Pembayaran pendukung pembelajaran', 'PJ-001', 150000.00, 5, 7, '2024-08-05');
INSERT INTO `transaksi` VALUES (217, 'Pembayaran porseni ellen', 'PJ-002', 150000.00, 5, 7, '2024-05-08');
INSERT INTO `transaksi` VALUES (218, 'Pembayaran spp ellen agustus 24', 'PJ-003', 65000.00, 5, 7, '2024-05-08');
INSERT INTO `transaksi` VALUES (219, 'Pembayaran spp adzka dwi jan 25', 'PJ-004', 65000.00, 5, 7, '2025-01-06');
INSERT INTO `transaksi` VALUES (222, 'Pembayaran SPP ADZA DWI feb 25', 'PJ-005', 65000.00, 5, 7, '2025-01-06');
INSERT INTO `transaksi` VALUES (223, 'Pembayaran spp riska nafia 01-25', 'PJ-006', 65000.00, 5, 7, '2025-01-08');
INSERT INTO `transaksi` VALUES (224, 'Pembayaran spp misha malayeka 01-25', 'PJ-007', 65000.00, 5, 7, '2025-01-08');
INSERT INTO `transaksi` VALUES (225, 'Pembayaran spp misha malayeka 02-25', 'PJ-008', 65000.00, 5, 7, '2025-01-08');
INSERT INTO `transaksi` VALUES (226, 'Pembayaran spp eling 01-25', 'PJ-009', 65000.00, 5, 7, '2025-02-07');
INSERT INTO `transaksi` VALUES (227, 'Pembayaran spp eling 02-255', 'PJ-010', 65000.00, 5, 7, '2025-02-07');
INSERT INTO `transaksi` VALUES (228, 'Pembayaran spp eling 03-25', 'PJ-011', 65000.00, 5, 7, '2025-02-07');
INSERT INTO `transaksi` VALUES (229, 'Pembayaran spp riska nafia 02-25', 'PJ-012', 65000.00, 5, 7, '2025-02-15');
INSERT INTO `transaksi` VALUES (231, 'Pembayaran seragam eling', 'PJ-013', 275000.00, 5, 7, '2025-04-11');
INSERT INTO `transaksi` VALUES (232, 'Pembayaran pembangunan adira', 'PJ-014', 100000.00, 5, 7, '2025-03-06');
INSERT INTO `transaksi` VALUES (233, 'Pembayaran porseni adira', 'PJ-015', 150000.00, 5, 7, '2025-03-06');
INSERT INTO `transaksi` VALUES (234, 'Pembayaran pendukung pembelajaran adira', 'PJ-016', 150000.00, 5, 7, '2025-03-06');
INSERT INTO `transaksi` VALUES (235, 'Pembayaran pendukung pembelajaran kholid', 'PJ-017', 150000.00, 5, 7, '2024-12-20');
INSERT INTO `transaksi` VALUES (236, 'Pembayaran pembangunan kholid', 'PJ-018', 100000.00, 5, 7, '2024-12-20');
INSERT INTO `transaksi` VALUES (237, 'Pembayaran seragam wildan', 'PJ-019', 275000.00, 5, 7, '2024-08-13');
INSERT INTO `transaksi` VALUES (238, 'Pembayaran seragam talita', 'PJ-020', 275000.00, 5, 7, '2025-01-13');
INSERT INTO `transaksi` VALUES (239, 'Pembayaran spp tsamara 01-25', 'PJ-021', 65000.00, 5, 7, '2025-01-13');
INSERT INTO `transaksi` VALUES (242, 'pembayaran biaya listrik bulan mei 2025', 'PG-011', 100000.00, 26, 5, '2025-05-07');
INSERT INTO `transaksi` VALUES (243, 'adsdasdadaaaa', 'PJ-022', 15000.00, 5, 9, '2025-05-09');

-- ----------------------------
-- View structure for jurnal
-- ----------------------------
DROP VIEW IF EXISTS `jurnal`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `jurnal` AS select `t`.`tanggal_transaksi` AS `tanggal_transaksi`,`t`.`kode_transaksi` AS `kode_transaksi`,`t`.`deskripsi` AS `deskripsi`,`a1`.`nama_akun` AS `akun`,`a1`.`jenis_akun` AS `jenis_akun`,`t`.`id_transaksi` AS `id_transaksi`,(case when (`t`.`id_akun_debit` = `a1`.`id_akun`) then `t`.`total` else 0 end) AS `debit`,(case when (`t`.`id_akun_kredit` = `a1`.`id_akun`) then `t`.`total` else 0 end) AS `kredit` from (`transaksi` `t` join `akun` `a1` on(((`t`.`id_akun_debit` = `a1`.`id_akun`) or (`t`.`id_akun_kredit` = `a1`.`id_akun`)))) order by `t`.`tanggal_transaksi`;

SET FOREIGN_KEY_CHECKS = 1;

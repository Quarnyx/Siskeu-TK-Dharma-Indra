/*
 Navicat Premium Data Transfer

 Source Server         : localost
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : lisa

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 31/01/2025 14:04:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for akun
-- ----------------------------
DROP TABLE IF EXISTS `akun`;
CREATE TABLE `akun`  (
  `id_akun` int NOT NULL AUTO_INCREMENT,
  `nama_akun` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jenis_akun` enum('Aktiva Lancar','Aktiva Tetap','Modal','Utang Lancar','Pendapatan','Beban','Pengeluaran','Kewajiban','Harga Pokok Penjualan','Penyusutan') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `wajib` tinyint(1) NULL DEFAULT NULL,
  `kode_akun` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_akun`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of akun
-- ----------------------------
INSERT INTO `akun` VALUES (5, 'Kas', 'Aktiva Lancar', 1, '100001');
INSERT INTO `akun` VALUES (6, 'Bank BCA', 'Aktiva Lancar', 1, '100002');
INSERT INTO `akun` VALUES (7, 'Pendapatan', 'Pendapatan', 1, '500001');
INSERT INTO `akun` VALUES (8, 'Peralatan Kantor', 'Aktiva Tetap', NULL, '200001');
INSERT INTO `akun` VALUES (9, 'Modal', 'Modal', NULL, '900001');
INSERT INTO `akun` VALUES (10, 'Bangunan', 'Aktiva Tetap', NULL, '200002');
INSERT INTO `akun` VALUES (11, 'Gaji ', 'Beban', NULL, '1212121');
INSERT INTO `akun` VALUES (12, 'Peralatan Kebersihan', 'Aktiva Tetap', NULL, '800001');
INSERT INTO `akun` VALUES (13, 'Transportasi', 'Pengeluaran', NULL, '90000');

-- ----------------------------
-- Table structure for guru
-- ----------------------------
DROP TABLE IF EXISTS `guru`;
CREATE TABLE `guru`  (
  `id_guru` int NOT NULL AUTO_INCREMENT,
  `nama_guru` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `no_telp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_guru`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of guru
-- ----------------------------
INSERT INTO `guru` VALUES (2, 'Sobirina', 'a', '092312312422');
INSERT INTO `guru` VALUES (3, 'Julia', 'sdasdasdasdasdsa', '018313');

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
  PRIMARY KEY (`id_pemasukan`) USING BTREE,
  INDEX `id_akun`(`id_akun` ASC) USING BTREE,
  INDEX `id_pengguna`(`id_pengguna` ASC) USING BTREE,
  CONSTRAINT `pemasukan_ibfk_2` FOREIGN KEY (`id_akun`) REFERENCES `akun` (`id_akun`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pemasukan_ibfk_3` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pemasukan
-- ----------------------------
INSERT INTO `pemasukan` VALUES (17, 'PJ-001', 100000.00, '2025-01-29', 5, 5, 'adsdada', 'P616');
INSERT INTO `pemasukan` VALUES (18, 'PJ-002', 200000.00, '2025-01-30', 5, 5, 'Pembayaran asdad', 'P616');
INSERT INTO `pemasukan` VALUES (21, 'PJ-003', 120000.00, '2025-01-31', 5, 5, 'Pembayaran', 'TK-001');
INSERT INTO `pemasukan` VALUES (22, 'PJ-004', 120000.00, '2025-01-30', 5, 5, 'Pembayaran', 'TK-001');
INSERT INTO `pemasukan` VALUES (23, 'PJ-005', 120000.00, '2025-01-31', 5, 5, 'Pembayaran', 'TK-001');
INSERT INTO `pemasukan` VALUES (24, 'PJ-006', 2560000.00, '2025-01-02', 5, 5, 'Pembayaran', 'TK-001');
INSERT INTO `pemasukan` VALUES (25, 'PJ-007', 15000.00, '2025-01-15', 5, 5, 'Pembayaran adada', 'TK-001');
INSERT INTO `pemasukan` VALUES (26, 'PJ-008', 120000.00, '2025-01-31', 5, 5, 'Pembayaran', 'TK-001');
INSERT INTO `pemasukan` VALUES (27, 'PJ-009', 120000.00, '2025-01-31', 5, 5, 'Pembayaran', 'TK-001');

-- ----------------------------
-- Table structure for pembayaran
-- ----------------------------
DROP TABLE IF EXISTS `pembayaran`;
CREATE TABLE `pembayaran`  (
  `id_pembayaran` int NOT NULL AUTO_INCREMENT,
  `id_siswa` int NULL DEFAULT NULL,
  `jenis_pembayaran` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bulan_tagihan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tanggal_pembayaran` date NULL DEFAULT NULL,
  `kode_pemasukan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jumlah` decimal(10, 2) NULL DEFAULT NULL,
  `tahun_tagihan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_pembayaran`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pembayaran
-- ----------------------------
INSERT INTO `pembayaran` VALUES (3, 1, 'SPP', 'January', '2025-01-31', 'PJ-003', 120000.00, '2025');
INSERT INTO `pembayaran` VALUES (4, 3, 'SPP', 'January', '2025-01-30', 'PJ-004', 120000.00, '2025');
INSERT INTO `pembayaran` VALUES (5, 3, 'SPP', 'February', '2025-01-31', 'PJ-005', 120000.00, '2025');
INSERT INTO `pembayaran` VALUES (6, 3, 'Pembangunan', 'Januari', '2025-01-02', 'PJ-006', 2560000.00, '2025');
INSERT INTO `pembayaran` VALUES (7, 1, 'Pembayaran Lainnya', 'Maret', '2025-01-15', 'PJ-007', 15000.00, '2024');
INSERT INTO `pembayaran` VALUES (8, 1, 'Seragam', 'Februari', '2025-01-31', 'PJ-008', 120000.00, '2025');
INSERT INTO `pembayaran` VALUES (9, 3, 'Porseni', 'Februari', '2025-01-31', 'PJ-009', 120000.00, '2025');

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
  `nota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `guru_penerima` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_pengeluaran`) USING BTREE,
  INDEX `id_akun`(`id_akun` ASC) USING BTREE,
  INDEX `id_pengguna`(`id_pengguna` ASC) USING BTREE,
  CONSTRAINT `pengeluaran_ibfk_2` FOREIGN KEY (`id_akun`) REFERENCES `akun` (`id_akun`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pengeluaran_ibfk_3` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pengeluaran
-- ----------------------------
INSERT INTO `pengeluaran` VALUES (12, 'PG-001', 15000.00, '2025-01-29', 5, 5, 'asdsada', 'P616', NULL, NULL);
INSERT INTO `pengeluaran` VALUES (14, 'PG-002', 11000.00, '2025-01-29', 5, 5, 'asdaasdada', 'P616', 'catatan validasi sistem.txt', NULL);
INSERT INTO `pengeluaran` VALUES (15, 'PG-003', 26800.00, '2025-01-29', 5, 5, 'adsada', 'P616', 'catatan validasi sistem.txt', 'Julia');

-- ----------------------------
-- Table structure for pengguna
-- ----------------------------
DROP TABLE IF EXISTS `pengguna`;
CREATE TABLE `pengguna`  (
  `id_pengguna` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `kode_pengguna` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_pengguna`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pengguna
-- ----------------------------
INSERT INTO `pengguna` VALUES (5, 'masruroh', '$2y$10$qE1j888lNYL2JIJcq7GEEe32k98H8EoDkk..U1Ci/8M2FciifAqIO', 'Kepala Sekolah', 'Masruroh, S.Pd.', 'TK-001');
INSERT INTO `pengguna` VALUES (7, 'catur', '$2y$10$2.WfztxzIErQJIN6F9eoI.yCSI528KbvP9eJLM3woz5voem3cSsa6', 'Bendahara', 'Catur Tri Wahyu, S.Pd.', 'TK-003');
INSERT INTO `pengguna` VALUES (12, 'sekretaris', '$2y$10$Iwngqg7raFo8wRZPycghVeUM4UdILshPBa9aYWLQKuE1ssxYO6bNK', 'Sekretaris', 'Sekretaris', 'TK-002');

-- ----------------------------
-- Table structure for siswa
-- ----------------------------
DROP TABLE IF EXISTS `siswa`;
CREATE TABLE `siswa`  (
  `id_siswa` int NOT NULL AUTO_INCREMENT,
  `nama_siswa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tahun_masuk` int NOT NULL,
  `nama_ayah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_ibu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `no_telp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `kelas` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nisn` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_siswa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of siswa
-- ----------------------------
INSERT INTO `siswa` VALUES (1, 'Jono', 'Kendal', 2022, 'Tono', 'Sutini', '010391313', '2A', '99029');
INSERT INTO `siswa` VALUES (3, 'Laplus D', 'Kendal A', 2022, 'AaV', 'Ba', '087662848242', '2B', '21331');

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
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transaksi
-- ----------------------------
INSERT INTO `transaksi` VALUES (23, 'adada', 'PJ-001', 75000.00, 5, 9, '2024-10-28');
INSERT INTO `transaksi` VALUES (24, 'adada', 'PG-001', 15000.00, 8, 5, '2024-10-28');
INSERT INTO `transaksi` VALUES (25, 'adadada', 'PJ-002', 15000.00, 5, 9, '2024-10-29');
INSERT INTO `transaksi` VALUES (26, 'adsdada', 'PJ-001', 100000.00, 5, 7, '2025-01-29');
INSERT INTO `transaksi` VALUES (27, 'asdsada', 'PG-001', 15000.00, 8, 5, '2025-01-29');
INSERT INTO `transaksi` VALUES (29, 'asdaasdada', 'PG-002', 11000.00, 10, 5, '2025-01-29');
INSERT INTO `transaksi` VALUES (30, 'adsada', 'PG-003', 26800.00, 13, 5, '2025-01-29');
INSERT INTO `transaksi` VALUES (31, 'Pembayaran asdad', 'PJ-002', 200000.00, 5, 7, '2025-01-30');
INSERT INTO `transaksi` VALUES (34, 'Pembayaran', 'PJ-003', 120000.00, 5, 7, '2025-01-31');
INSERT INTO `transaksi` VALUES (35, 'Pembayaran', 'PJ-004', 120000.00, 5, 7, '2025-01-30');
INSERT INTO `transaksi` VALUES (36, 'Pembayaran', 'PJ-005', 120000.00, 5, 7, '2025-01-31');
INSERT INTO `transaksi` VALUES (37, 'Pembayaran', 'PJ-006', 2560000.00, 5, 7, '2025-01-02');
INSERT INTO `transaksi` VALUES (38, 'Pembayaran adada', 'PJ-007', 15000.00, 5, 7, '2025-01-15');
INSERT INTO `transaksi` VALUES (39, 'Pembayaran', 'PJ-008', 120000.00, 5, 7, '2025-01-31');
INSERT INTO `transaksi` VALUES (40, 'Pembayaran', 'PJ-009', 120000.00, 5, 7, '2025-01-31');

-- ----------------------------
-- View structure for jurnal
-- ----------------------------
DROP VIEW IF EXISTS `jurnal`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `jurnal` AS select `t`.`tanggal_transaksi` AS `tanggal_transaksi`,`t`.`kode_transaksi` AS `kode_transaksi`,`t`.`deskripsi` AS `deskripsi`,`a1`.`nama_akun` AS `akun`,`a1`.`jenis_akun` AS `jenis_akun`,`t`.`id_transaksi` AS `id_transaksi`,(case when (`t`.`id_akun_debit` = `a1`.`id_akun`) then `t`.`total` else 0 end) AS `debit`,(case when (`t`.`id_akun_kredit` = `a1`.`id_akun`) then `t`.`total` else 0 end) AS `kredit` from (`transaksi` `t` join `akun` `a1` on(((`t`.`id_akun_debit` = `a1`.`id_akun`) or (`t`.`id_akun_kredit` = `a1`.`id_akun`)))) order by `t`.`tanggal_transaksi`;

SET FOREIGN_KEY_CHECKS = 1;

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

 Date: 19/04/2025 21:47:40
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
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
  `nama_guru` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jk` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `agama_guru` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `no_telp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_guru`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of guru
-- ----------------------------
INSERT INTO `guru` VALUES (2, 'Masruroh, S.Pd', 'Perempuan', 'Islam', 'Kedungsuren RT 009 RW 001', '083174275199');
INSERT INTO `guru` VALUES (4, 'Catur Sri Wahyuni, S.Pd', 'Perempuan', 'Islam', 'Kedungsuren RT 005 RW 005', '0897251008391');
INSERT INTO `guru` VALUES (5, 'Rulin Firanika, S.Pd', 'Perempuan', 'Islam', 'Perum Delta Asri 6 Kaliwungu Kendal', '089242700027');

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
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pemasukan
-- ----------------------------
INSERT INTO `pemasukan` VALUES (109, 'PJ-035', 65000.00, '2025-02-21', 7, 5, 'Pembayaran spp marselino 01/25', 'TK-003');
INSERT INTO `pemasukan` VALUES (110, 'PJ-036', 65000.00, '2025-02-25', 7, 5, 'Pembayaran spp alanudin 01/25', 'TK-003');
INSERT INTO `pemasukan` VALUES (111, 'PJ-037', 275000.00, '2025-02-25', 7, 5, 'Pembayaran seragam alanudin', 'TK-003');
INSERT INTO `pemasukan` VALUES (112, 'PJ-038', 65000.00, '2025-03-04', 7, 5, 'Pembayaran spp haya 03/25', 'TK-003');
INSERT INTO `pemasukan` VALUES (123, 'PJ-047', 30000.00, '2025-04-11', 5, 5, 'Penerimaan kas dari kantin', 'TK-001');
INSERT INTO `pemasukan` VALUES (124, 'PJ-048', 65000.00, '2025-04-11', 5, 5, 'Pembayaran spp ariel 03/25', 'TK-001');
INSERT INTO `pemasukan` VALUES (125, 'PJ-049', 65000.00, '2025-04-11', 5, 5, 'Pembayaran spp akmal ', 'TK-001');
INSERT INTO `pemasukan` VALUES (126, 'PJ-050', 1000.00, '2025-04-14', 5, 5, 'Pembayaran sn', 'TK-001');

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
  `bukti_pembayaran` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_pembayaran`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pembayaran
-- ----------------------------
INSERT INTO `pembayaran` VALUES (3, 0, 'SPP', 'January', '2025-01-22', 'PJ-003', 120000.00, '2025', NULL);
INSERT INTO `pembayaran` VALUES (7, 1, 'Pembayaran Lainnya', 'March', '2025-01-15', 'PJ-007', 15000.00, '2024', NULL);
INSERT INTO `pembayaran` VALUES (30, 0, 'SPP', 'January', '2025-01-22', 'PJ-003', 120000.00, '2025', NULL);
INSERT INTO `pembayaran` VALUES (89, 35, 'SPP', 'January', '2025-02-21', 'PJ-035', 65000.00, '2025', NULL);
INSERT INTO `pembayaran` VALUES (90, 32, 'SPP', 'January', '2025-02-25', 'PJ-036', 65000.00, '2025', NULL);
INSERT INTO `pembayaran` VALUES (91, 32, 'Seragam', 'August', '2025-02-25', 'PJ-037', 275000.00, '2025', NULL);
INSERT INTO `pembayaran` VALUES (92, 5, 'SPP', 'March', '2025-03-04', 'PJ-038', 65000.00, '2025', NULL);
INSERT INTO `pembayaran` VALUES (101, 25, 'SPP', 'March', '2025-04-11', 'PJ-048', 65000.00, '2025', NULL);
INSERT INTO `pembayaran` VALUES (102, 3, 'SPP', 'May', '2025-04-11', 'PJ-049', 65000.00, '2025', NULL);
INSERT INTO `pembayaran` VALUES (103, 3, 'Pembangunan', 'November', '2025-04-14', 'PJ-050', 1000.00, '2023', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
  `foto_pengguna` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_pengguna`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pengguna
-- ----------------------------
INSERT INTO `pengguna` VALUES (5, 'masruroh', '$2y$10$qE1j888lNYL2JIJcq7GEEe32k98H8EoDkk..U1Ci/8M2FciifAqIO', 'Kepala Sekolah', 'Masruroh, S.Pd.', 'TK-001', 'TK-001.png');
INSERT INTO `pengguna` VALUES (7, 'catur', '$2y$10$2.WfztxzIErQJIN6F9eoI.yCSI528KbvP9eJLM3woz5voem3cSsa6', 'Bendahara', 'Catur Tri Wahyu, S.Pd.', 'TK-003', NULL);
INSERT INTO `pengguna` VALUES (12, 'Rulin', '$2y$10$okmn1OrngeVEHZYilYlP7emUj7dS6I5fsZFqRKphF..br6kOYXujq', 'Sekretaris', 'Rulin Firanika, S.Pd', 'TK-002', 'TK-002.png');

-- ----------------------------
-- Table structure for siswa
-- ----------------------------
DROP TABLE IF EXISTS `siswa`;
CREATE TABLE `siswa`  (
  `id_siswa` int NOT NULL AUTO_INCREMENT,
  `nama_siswa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jenis_kelamin` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tahun_masuk` int NOT NULL,
  `nama_ayah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_ibu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `no_telp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `kelas` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nisn` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `agama` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `foto_siswa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_siswa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of siswa
-- ----------------------------
INSERT INTO `siswa` VALUES (31, 'Selviana Putri', 'Perempuan', 'Kedungsuren RT 004 RW 005', 2024, 'Akram', 'Sulistina', '081836482819', 'A', '2927516989', 'Islam', NULL);
INSERT INTO `siswa` VALUES (32, 'Alanudin Baskara', 'Laki-Laki', 'Kedungsuren RT 001 RW 008', 2024, 'Andi', 'Tyas', '081936387978', 'A', '1125609876', 'Islam', NULL);
INSERT INTO `siswa` VALUES (33, 'Aksanta Rois', 'Laki-Laki', 'Kedungsuren RT 004 RW 001', 2024, 'Kona', 'Rista', '089163726187', 'A', '1672687889', 'Islam', NULL);
INSERT INTO `siswa` VALUES (34, 'Reynanta Andrian', 'Laki-laki', 'Kedungsuren RT 01 RW 003', 2024, 'Awal Pratama', 'Novianti', '081624362716', 'B', '1072426767', 'Islam', '1072426767.jpg');

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
) ENGINE = InnoDB AUTO_INCREMENT = 173 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of transaksi
-- ----------------------------
INSERT INTO `transaksi` VALUES (74, 'Biaya Listrik Bulan januari 2025', 'PG-001', 103000.00, 26, 5, '2025-02-19');
INSERT INTO `transaksi` VALUES (141, 'Pembayaran spp marselino 01/25', 'PJ-035', 65000.00, 5, 7, '2025-02-21');
INSERT INTO `transaksi` VALUES (142, 'Pembayaran spp alanudin 01/25', 'PJ-036', 65000.00, 5, 7, '2025-02-25');
INSERT INTO `transaksi` VALUES (143, 'Pembayaran seragam alanudin', 'PJ-037', 275000.00, 5, 7, '2025-02-25');
INSERT INTO `transaksi` VALUES (144, 'Pembayaran spp haya 03/25', 'PJ-038', 65000.00, 5, 7, '2025-03-04');
INSERT INTO `transaksi` VALUES (148, 'pembelian stick dan platisin', 'PG-002', 92000.00, 18, 5, '2025-01-06');
INSERT INTO `transaksi` VALUES (149, 'pembelian kertas origami dan lakban', 'PG-003', 107500.00, 18, 5, '2025-01-26');
INSERT INTO `transaksi` VALUES (150, 'makan siang bersama 40 nasi kotak', 'PG-004', 480000.00, 20, 5, '2025-01-31');
INSERT INTO `transaksi` VALUES (151, 'pembelian kertas', 'PG-005', 192000.00, 18, 5, '2025-01-28');
INSERT INTO `transaksi` VALUES (152, 'pembelian perlengkapan alat tulis', 'PG-006', 335000.00, 18, 5, '2025-02-05');
INSERT INTO `transaksi` VALUES (153, 'pembelian crayon', 'PG-007', 329000.00, 18, 5, '2025-02-13');
INSERT INTO `transaksi` VALUES (155, 'pembelian lilin mainan', 'PG-008', 180000.00, 18, 5, '2025-02-25');
INSERT INTO `transaksi` VALUES (156, 'biaya air bulan maret 2025', 'PG-009', 15000.00, 16, 5, '2025-03-01');
INSERT INTO `transaksi` VALUES (164, 'pembayaran biaya air 03/25', 'PG-010', 20000.00, 16, 5, '2025-04-10');
INSERT INTO `transaksi` VALUES (165, 'Penerimaan kas dari kantin', 'PJ-047', 30000.00, 5, 5, '2025-04-11');
INSERT INTO `transaksi` VALUES (166, 'Pembayaran spp ariel 03/25', 'PJ-048', 65000.00, 5, 7, '2025-04-11');
INSERT INTO `transaksi` VALUES (168, 'Pembayaran spp akmal ', 'PJ-049', 65000.00, 5, 7, '2025-04-11');
INSERT INTO `transaksi` VALUES (169, 'Pembayaran sn', 'PJ-050', 1000.00, 5, 7, '2025-04-14');

-- ----------------------------
-- View structure for jurnal
-- ----------------------------
DROP VIEW IF EXISTS `jurnal`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `jurnal` AS select `t`.`tanggal_transaksi` AS `tanggal_transaksi`,`t`.`kode_transaksi` AS `kode_transaksi`,`t`.`deskripsi` AS `deskripsi`,`a1`.`nama_akun` AS `akun`,`a1`.`jenis_akun` AS `jenis_akun`,`t`.`id_transaksi` AS `id_transaksi`,(case when (`t`.`id_akun_debit` = `a1`.`id_akun`) then `t`.`total` else 0 end) AS `debit`,(case when (`t`.`id_akun_kredit` = `a1`.`id_akun`) then `t`.`total` else 0 end) AS `kredit` from (`transaksi` `t` join `akun` `a1` on(((`t`.`id_akun_debit` = `a1`.`id_akun`) or (`t`.`id_akun_kredit` = `a1`.`id_akun`)))) order by `t`.`tanggal_transaksi`;

SET FOREIGN_KEY_CHECKS = 1;

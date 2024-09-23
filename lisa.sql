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

 Date: 24/09/2024 00:35:49
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
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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

-- ----------------------------
-- Table structure for pemasukan
-- ----------------------------
DROP TABLE IF EXISTS `pemasukan`;
CREATE TABLE `pemasukan`  (
  `id_pemasukan` int NOT NULL AUTO_INCREMENT,
  `kode_pemasukan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `total` decimal(10, 2) NULL DEFAULT NULL,
  `tanggal_transaksi` date NULL DEFAULT NULL,
  `id_pengguna` int NULL DEFAULT NULL,
  `id_akun` int NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id_pemasukan`) USING BTREE,
  INDEX `id_akun`(`id_akun` ASC) USING BTREE,
  INDEX `id_pengguna`(`id_pengguna` ASC) USING BTREE,
  CONSTRAINT `pemasukan_ibfk_2` FOREIGN KEY (`id_akun`) REFERENCES `akun` (`id_akun`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pemasukan_ibfk_3` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pemasukan
-- ----------------------------
INSERT INTO `pemasukan` VALUES (7, 'PM-001', 10000000.00, '2024-08-01', 1, 5, 'Setoran Modal');
INSERT INTO `pemasukan` VALUES (8, 'PM-002', 5000000.00, '2024-08-31', 1, 5, 'SPP');
INSERT INTO `pemasukan` VALUES (9, 'PM-003', 5000000.00, '2024-09-01', 1, 5, 'Donatur');
INSERT INTO `pemasukan` VALUES (10, 'PM-004', 10000000.00, '2024-09-20', 1, 5, 'spp');
INSERT INTO `pemasukan` VALUES (11, 'PM-005', 20000000.00, '2024-09-01', 1, 6, 'modal');
INSERT INTO `pemasukan` VALUES (13, 'PJ-006', 100000.00, '2024-09-05', 1, 5, 'ljjllj');
INSERT INTO `pemasukan` VALUES (14, 'PJ-006', 2560000.00, '2024-09-07', 1, 5, 'asdada');

-- ----------------------------
-- Table structure for pengeluaran
-- ----------------------------
DROP TABLE IF EXISTS `pengeluaran`;
CREATE TABLE `pengeluaran`  (
  `id_pengeluaran` int NOT NULL AUTO_INCREMENT,
  `kode_pengeluaran` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `total` decimal(10, 2) NULL DEFAULT NULL,
  `tanggal_transaksi` date NULL DEFAULT NULL,
  `id_pengguna` int NULL DEFAULT NULL,
  `id_akun` int NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id_pengeluaran`) USING BTREE,
  INDEX `id_akun`(`id_akun` ASC) USING BTREE,
  INDEX `id_pengguna`(`id_pengguna` ASC) USING BTREE,
  CONSTRAINT `pengeluaran_ibfk_2` FOREIGN KEY (`id_akun`) REFERENCES `akun` (`id_akun`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pengeluaran_ibfk_3` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pengeluaran
-- ----------------------------
INSERT INTO `pengeluaran` VALUES (6, 'PG-001', 1000000.00, '2024-08-14', 1, 5, 'Peralatan Kantor');
INSERT INTO `pengeluaran` VALUES (7, 'PG-002', 5000000.00, '2024-09-03', 1, 5, 'Beli Printer');
INSERT INTO `pengeluaran` VALUES (8, 'PG-003', 2000000.00, '2024-09-06', 1, 5, 'Bangku');
INSERT INTO `pengeluaran` VALUES (9, 'PG-004', 2000000.00, '2024-09-20', 1, 5, 'gaji');

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
  PRIMARY KEY (`id_pengguna`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pengguna
-- ----------------------------
INSERT INTO `pengguna` VALUES (1, 'admin', '$2y$10$IFurjz8bw3a2t0HlX2rV4.iEsMpop3E0HXz/HIoLUW/LPFI8IlC6.', 'Admin', 'Tono');
INSERT INTO `pengguna` VALUES (5, 'masruroh', '$2y$10$XzmvjxHsuf.WrC6OCbdxZePka7U0OdQN2ygLFFObD0eY4SULn93W.', 'Kepala Sekolah', 'Masruroh, S.Pd.');
INSERT INTO `pengguna` VALUES (7, 'catur', '$2y$10$xVCRHx99PZW/q2J5dgGXyuqOXoV4i0qUqoglvERWV7H9ng5zSe67i', 'Bendahara', 'Catur Tri Wahyu, S.Pd.');

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
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transaksi
-- ----------------------------
INSERT INTO `transaksi` VALUES (10, 'Setoran Modal', 'PM-001', 10000000.00, 5, 9, '2024-08-01');
INSERT INTO `transaksi` VALUES (11, 'SPP', 'PM-002', 5000000.00, 5, 7, '2024-08-31');
INSERT INTO `transaksi` VALUES (12, 'Peralatan Kantor', 'PG-001', 1000000.00, 8, 5, '2024-08-14');
INSERT INTO `transaksi` VALUES (13, 'Beli Printer', 'PG-002', 5000000.00, 8, 5, '2024-09-03');
INSERT INTO `transaksi` VALUES (14, 'Donatur', 'PM-003', 5000000.00, 5, 9, '2024-09-01');
INSERT INTO `transaksi` VALUES (15, 'spp', 'PM-004', 10000000.00, 5, 7, '2024-09-20');
INSERT INTO `transaksi` VALUES (16, 'modal', 'PM-005', 20000000.00, 6, 9, '2024-09-01');
INSERT INTO `transaksi` VALUES (17, 'Bangku', 'PG-003', 2000000.00, 10, 5, '2024-09-06');
INSERT INTO `transaksi` VALUES (18, 'gaji', 'PG-004', 2000000.00, 11, 5, '2024-09-20');
INSERT INTO `transaksi` VALUES (20, 'asdada', 'PJ-006', 2560000.00, 5, 7, '2024-09-07');
INSERT INTO `transaksi` VALUES (21, 'asdada', 'PJ-006', 2560000.00, 5, 7, '2024-09-07');

-- ----------------------------
-- View structure for jurnal
-- ----------------------------
DROP VIEW IF EXISTS `jurnal`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `jurnal` AS select `t`.`tanggal_transaksi` AS `tanggal_transaksi`,`t`.`kode_transaksi` AS `kode_transaksi`,`t`.`deskripsi` AS `deskripsi`,`a1`.`nama_akun` AS `akun`,`a1`.`jenis_akun` AS `jenis_akun`,`t`.`id_transaksi` AS `id_transaksi`,(case when (`t`.`id_akun_debit` = `a1`.`id_akun`) then `t`.`total` else 0 end) AS `debit`,(case when (`t`.`id_akun_kredit` = `a1`.`id_akun`) then `t`.`total` else 0 end) AS `kredit` from (`transaksi` `t` join `akun` `a1` on(((`t`.`id_akun_debit` = `a1`.`id_akun`) or (`t`.`id_akun_kredit` = `a1`.`id_akun`)))) order by `t`.`tanggal_transaksi`;

SET FOREIGN_KEY_CHECKS = 1;

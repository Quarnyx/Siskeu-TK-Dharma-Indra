<?php

switch ($_GET['page'] ?? '') {
    case '':
    case 'home':
        include 'pages/home.php';
        break;
    case 'pengguna':
        include 'pages/pengguna/index.php';
        break;
    case 'akun':
        include 'pages/akun/index.php';
        break;
    case 'pemasukan':
        include 'pages/pemasukan/index.php';
        break;
    case 'pengeluaran':
        include 'pages/pengeluaran/index.php';
        break;
    case 'laporan-pengeluaran':
        include 'pages/laporan-pengeluaran/index.php';
        break;
    case 'laporan-pendapatan':
        include 'pages/laporan-pemasukan/index.php';
        break;
    case 'arus-kas':
        include 'pages/arus-kas/index.php';
        break;
    case 'guru':
        include 'pages/guru/index.php';
        break;
    case 'siswa':
        include 'pages/siswa/index.php';
        break;
    case 'pembayaran':
        include 'pages/pembayaran/index.php';
        break;
    case 'laporan-pembayaran':
        include 'pages/laporan-pembayaran/index.php';
        break;
    default:
        include 'pages-404.php';
        break;
}
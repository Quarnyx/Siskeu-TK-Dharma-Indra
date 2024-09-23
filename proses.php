<?php
function tambahTransaksi($id_akun_debit, $id_akun_kredit, $total, $deskripsi, $tanggal_transaksi, $kode_transaksi, $conn)
{
    $sql = "INSERT INTO transaksi (id_akun_debit, id_akun_kredit, total, deskripsi, tanggal_transaksi, kode_transaksi) VALUES ('$id_akun_debit', '$id_akun_kredit', '$total', '$deskripsi', '$tanggal_transaksi', '$kode_transaksi')";
    $result = $conn->query($sql);
    if ($result) {
        http_response_code(200);
    } else {
        http_response_code(500);
        echo $conn->error;
    }
}
function hapusTransaksi($kode, $conn)
{
    $sql = "DELETE FROM transaksi WHERE kode_transaksi = '$kode'";
    $result = $conn->query($sql);
    if ($result) {
        http_response_code(200);
    } else {
        http_response_code(500);
        echo $conn->error;
    }
}
function editTransaksi($conn, $id_akun_debit, $id_akun_kredit, $total, $deskripsi, $kode_transaksi, $tanggal_transaksi)
{
    $sql = "UPDATE transaksi SET id_akun_debit = '$id_akun_debit', id_akun_kredit = '$id_akun_kredit', total = '$total', deskripsi = '$deskripsi', tanggal_transaksi = '$tanggal_transaksi' WHERE kode_transaksi = '$kode_transaksi'";
    $result = $conn->query($sql);
    if ($result) {
        http_response_code(200);
    } else {
        http_response_code(500);
        echo $conn->error;
    }
}

function editPembelian($conn, $id_akun_debit, $id_akun_kredit, $total, $catatan, $id)
{
    $sql = "UPDATE jurnal SET id_akun_debit = '$id_akun_debit', id_akun_kredit = '$id_akun_kredit', total = '$total', catatan = '$catatan' WHERE id_transaksi = '$id'";
    $result = $conn->query($sql);
    if ($result) {
        http_response_code(200);
    } else {
        http_response_code(500);
        echo $conn->error;
    }
}

require_once 'config.php';
switch ($_GET['aksi'] ?? '') {
    case 'tambah-pengguna':
        $username = $_POST['username'];
        $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
        $nama = $_POST['nama'];
        $level = $_POST['level'];
        $sql = "INSERT INTO pengguna (username, password, level, nama) VALUES ('$username', '$password', '$level', '$nama')";
        $result = $conn->query($sql);
        if ($result) {
            echo 'ok';
            http_response_code(200);
        } else {
            echo 'error';
            echo $conn->error;
            http_response_code(400);
        }
        break;
    case 'hapus-pengguna':
        $id = $_POST['id'];
        $sql = "DELETE FROM pengguna WHERE id_pengguna = '$id'";
        $result = $conn->query($sql);
        if ($result) {
            echo 'ok';
            http_response_code(200);
        } else {
            echo 'error';
            echo $conn->error;
            http_response_code(400);
        }
        break;
    case 'edit-pengguna':
        $id = $_POST['id'];
        $nama = $_POST['nama'];
        $username = $_POST['username'];
        $level = $_POST['level'];
        $sql = "UPDATE pengguna SET username = '$username', level = '$level', nama = '$nama' WHERE id_pengguna = '$id'";
        $result = $conn->query($sql);
        if ($result) {
            echo 'ok';
            http_response_code(200);
        } else {
            echo 'error';
            echo $conn->error;
            http_response_code(400);
        }
        break;
    case 'ganti-password':
        $id = $_POST['id'];
        $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
        $sql = "UPDATE pengguna SET password = '$password' WHERE id_pengguna = '$id'";
        $result = $conn->query($sql);
        if ($result) {
            echo 'ok';
            http_response_code(200);
        } else {
            echo 'error';
            echo $conn->error;
            http_response_code(400);
        }
        break;
    case 'tambah-akun':
        $nama_akun = $_POST['nama_akun'];
        $jenis_akun = $_POST['jenis_akun'];
        $kode_akun = $_POST['kode_akun'];
        $sql = "INSERT INTO akun (nama_akun, jenis_akun,kode_akun) VALUES ('$nama_akun', '$jenis_akun', '$kode_akun')";
        $result = $conn->query($sql);
        if ($result) {
            echo 'ok';
            http_response_code(200);
        } else {
            echo 'error';
            echo $conn->error;
            http_response_code(400);
        }
        break;
    case 'edit-akun':
        $id = $_POST['id'];
        $nama_akun = $_POST['nama_akun'];
        $jenis_akun = $_POST['jenis_akun'];
        $kode_akun = $_POST['kode_akun'];
        $sql = "UPDATE akun SET nama_akun = '$nama_akun',jenis_akun = '$jenis_akun',kode_akun = '$kode_akun' WHERE id_akun = '$id'";
        $result = $conn->query($sql);
        if ($result) {
            echo 'ok';
            http_response_code(200);
        } else {
            echo 'error';
            echo $conn->error;
            http_response_code(400);
        }
        break;
    case 'hapus-akun':
        $id = $_POST['id'];
        $sql = "DELETE FROM akun WHERE id_akun = '$id'";
        $result = $conn->query($sql);
        if ($result) {
            echo 'ok';
            http_response_code(200);
        } else {
            echo 'error';
            echo $conn->error;
            http_response_code(400);
        }
        break;
    case 'tambah-pemasukan':
        $total = $_POST['total'];
        $keterangan = $_POST['keterangan'];
        $tanggal_transaksi = $_POST['tanggal_transaksi'];
        $id_akun_debit = $_POST['id_akun_debit'];
        $id_akun_kredit = $_POST['id_akun_kredit'];
        $kode_pemasukan = $_POST['kode_pemasukan'];
        $id_pengguna = $_POST['id_pengguna'];

        $sql = "INSERT INTO pemasukan (total, keterangan, tanggal_transaksi, id_akun, kode_pemasukan, id_pengguna) 
            VALUES ('$total', '$keterangan', '$tanggal_transaksi', '$id_akun_debit', '$kode_pemasukan', '$id_pengguna')";
        $result = $conn->query($sql);
        if ($result) {
            echo 'ok';
            http_response_code(200);
        } else {
            echo 'error';
            echo $conn->error;
            http_response_code(400);
        }
        tambahTransaksi($id_akun_debit, $id_akun_kredit, $total, $keterangan, $tanggal_transaksi, $kode_pemasukan, $conn);
        break;
    case 'hapus-pemasukan':
        $id = $_POST['id'];
        $kode = $_POST['kode'];
        $sql = "DELETE FROM pemasukan WHERE id_pemasukan = '$id'";
        $result = $conn->query($sql);
        if ($result) {
            echo 'ok';
            http_response_code(200);
        } else {
            echo 'error';
            echo $conn->error;
            http_response_code(400);
        }
        hapusTransaksi($kode, $conn);
        break;
    case 'edit-pemasukan':
        $id = $_POST['id'];
        $total = $_POST['total'];
        $total = $_POST['total'];
        $keterangan = $_POST['keterangan'];
        $tanggal_transaksi = $_POST['tanggal_transaksi'];
        $id_akun_debit = $_POST['id_akun_debit'];
        $id_akun_kredit = $_POST['id_akun_kredit'];
        $kode_pemasukan = $_POST['kode_pemasukan'];
        $id_pengguna = $_POST['id_pengguna'];

        $sql = "UPDATE pemasukan SET total = '$total', keterangan = '$keterangan', tanggal_transaksi = '$tanggal_transaksi', id_akun = '$id_akun_debit', kode_pemasukan = '$kode_pemasukan', id_pengguna = '$id_pengguna' WHERE id_pemasukan = '$id'";
        $result = $conn->query($sql);
        if ($result) {
            echo 'ok';
            http_response_code(200);
        } else {
            echo 'error';
            echo $conn->error;
            http_response_code(400);
        }
        editTransaksi($conn, $id_akun_debit, $id_akun_kredit, $total, $keterangan, $kode_pemasukan, $tanggal_transaksi);
        break;
    case 'tambah-pengeluaran':
        $total = $_POST['total'];
        $keterangan = $_POST['keterangan'];
        $tanggal_transaksi = $_POST['tanggal_transaksi'];
        $id_akun_debit = $_POST['id_akun_debit'];
        $id_akun_kredit = $_POST['id_akun_kredit'];
        $kode_pengeluaran = $_POST['kode_pengeluaran'];
        $id_pengguna = $_POST['id_pengguna'];

        $sql = "INSERT INTO pengeluaran (total, keterangan, tanggal_transaksi, id_akun, kode_pengeluaran, id_pengguna) 
            VALUES ('$total', '$keterangan', '$tanggal_transaksi', '$id_akun_kredit', '$kode_pengeluaran', '$id_pengguna')";
        $result = $conn->query($sql);
        if ($result) {
            echo 'ok';
            http_response_code(200);
        } else {
            echo 'error';
            echo $conn->error;
            http_response_code(400);
        }
        tambahTransaksi($id_akun_debit, $id_akun_kredit, $total, $keterangan, $tanggal_transaksi, $kode_pengeluaran, $conn);
        break;
    case 'hapus-pengeluaran':
        $id = $_POST['id'];
        $kode = $_POST['kode'];
        $sql = "DELETE FROM pengeluaran WHERE id_pengeluaran = '$id'";
        $result = $conn->query($sql);
        if ($result) {
            echo 'ok';
            http_response_code(200);
        } else {
            echo 'error';
            echo $conn->error;
            http_response_code(400);
        }
        hapusTransaksi($kode, $conn);
        break;
    case 'edit-pengeluaran':
        $id = $_POST['id'];
        $total = $_POST['total'];
        $total = $_POST['total'];
        $keterangan = $_POST['keterangan'];
        $tanggal_transaksi = $_POST['tanggal_transaksi'];
        $id_akun_debit = $_POST['id_akun_debit'];
        $id_akun_kredit = $_POST['id_akun_kredit'];
        $kode_pengeluaran = $_POST['kode_pengeluaran'];
        $id_pengguna = $_POST['id_pengguna'];

        $sql = "UPDATE pengeluaran SET total = '$total', keterangan = '$keterangan', tanggal_transaksi = '$tanggal_transaksi', id_akun = '$id_akun_kredit', kode_pengeluaran = '$kode_pengeluaran', id_pengguna = '$id_pengguna' WHERE id_pengeluaran = '$id'";
        $result = $conn->query($sql);
        if ($result) {
            echo 'ok';
            http_response_code(200);
        } else {
            echo 'error';
            echo $conn->error;
            http_response_code(400);
        }
        editTransaksi($conn, $id_akun_debit, $id_akun_kredit, $total, $keterangan, $kode_pengeluaran, $tanggal_transaksi);
        break;
    default:
        break;
}
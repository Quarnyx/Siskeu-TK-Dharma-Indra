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
        $kode_pengguna = $_POST['kode_pengguna'];
        $sql = "INSERT INTO pengguna (kode_pengguna, username, password, level, nama) VALUES ('$kode_pengguna', '$username', '$password', '$level', '$nama')";
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
        $sql = "UPDATE pengguna SET username = '$username', nama = '$nama' WHERE id_pengguna = '$id'";
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
        $wajib = $_POST['wajib'];
        $sql = "INSERT INTO akun (nama_akun, jenis_akun,kode_akun, wajib) VALUES ('$nama_akun', '$jenis_akun', '$kode_akun', '$wajib')";
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
        $kode_pengguna = $_POST['kode_pengguna'];

        $sql = "INSERT INTO pemasukan (total, keterangan, tanggal_transaksi, id_akun, kode_pemasukan, id_pengguna, kode_pengguna) 
            VALUES ('$total', '$keterangan', '$tanggal_transaksi', '$id_akun_debit', '$kode_pemasukan', '$id_pengguna', '$kode_pengguna')";
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
        $kode_pengguna = $_POST['kode_pengguna'];
        $nota = $_FILES['nota']['name'];
        $target_dir = "pages/pengeluaran/upload/";
        $target_file = $target_dir . basename($_FILES["nota"]["name"]);
        move_uploaded_file($_FILES["nota"]["tmp_name"], $target_file);
        $guru_penerima = $_POST['guru_penerima'];

        $sql = "INSERT INTO pengeluaran (total, keterangan, tanggal_transaksi, id_akun, kode_pengeluaran, id_pengguna, kode_pengguna, nota, guru_penerima) 
            VALUES ('$total', '$keterangan', '$tanggal_transaksi', '$id_akun_kredit', '$kode_pengeluaran', '$id_pengguna', '$kode_pengguna', '$nota', '$guru_penerima')";
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
        $guru_penerima = $_POST['guru_penerima'];

        $sql = "UPDATE pengeluaran SET total = '$total', keterangan = '$keterangan', tanggal_transaksi = '$tanggal_transaksi', id_akun = '$id_akun_kredit', kode_pengeluaran = '$kode_pengeluaran', id_pengguna = '$id_pengguna', guru_penerima = '$guru_penerima' WHERE id_pengeluaran = '$id'";
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
    case 'tambah-guru':
        $nama = $_POST['nama_guru'];
        $no_telp = $_POST['no_telp'];
        $alamat = $_POST['alamat'];
        $sql = "INSERT INTO guru (nama_guru, no_telp, alamat) VALUES ('$nama', '$no_telp', '$alamat')";
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
    case 'edit-guru':
        $id = $_POST['id'];
        $nama = $_POST['nama_guru'];
        $no_telp = $_POST['no_telp'];
        $alamat = $_POST['alamat'];
        $sql = "UPDATE guru SET nama_guru = '$nama', no_telp = '$no_telp', alamat = '$alamat' WHERE id_guru = '$id'";
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
    case 'hapus-guru':
        $id = $_POST['id'];
        $sql = "DELETE FROM guru WHERE id_guru = '$id'";
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
    case 'tambah-siswa':
        $nisn = $_POST['nisn'];
        $nama_siswa = $_POST['nama_siswa'];
        $kelas = $_POST['kelas'];
        $tahun_masuk = $_POST['tahun_masuk'];
        $nama_ibu = $_POST['nama_ibu'];
        $nama_ayah = $_POST['nama_ayah'];
        $no_telp = $_POST['no_telp'];
        $alamat = $_POST['alamat'];
        $sql = "INSERT INTO siswa (nisn, nama_siswa, kelas, tahun_masuk, nama_ibu, nama_ayah, no_telp, alamat) VALUES ('$nisn', '$nama_siswa', '$kelas', '$tahun_masuk', '$nama_ibu', '$nama_ayah', '$no_telp', '$alamat')";
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
    case 'edit-siswa':
        $id = $_POST['id'];
        $nisn = $_POST['nisn'];
        $nama_siswa = $_POST['nama_siswa'];
        $kelas = $_POST['kelas'];
        $tahun_masuk = $_POST['tahun_masuk'];
        $nama_ibu = $_POST['nama_ibu'];
        $nama_ayah = $_POST['nama_ayah'];
        $no_telp = $_POST['no_telp'];
        $alamat = $_POST['alamat'];
        $sql = "UPDATE siswa SET nisn='$nisn', nama_siswa='$nama_siswa', kelas='$kelas', tahun_masuk='$tahun_masuk', nama_ibu='$nama_ibu', nama_ayah='$nama_ayah', no_telp='$no_telp', alamat='$alamat' WHERE id_siswa = '$id'";
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
    case 'hapus-siswa':
        $id = $_POST['id'];
        $sql = "DELETE FROM siswa WHERE id_siswa = '$id'";
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
    case 'tambah-pembayaran':
        $total = $_POST['total'];
        $keterangan = $_POST['keterangan'];
        $tanggal_transaksi = $_POST['tanggal_transaksi'];
        $id_akun_debit = $_POST['id_akun_debit'];
        $id_akun_kredit = $_POST['id_akun_kredit'];
        $kode_pemasukan = $_POST['kode_pemasukan'];
        $id_pengguna = $_POST['id_pengguna'];
        $kode_pengguna = $_POST['kode_pengguna'];
        $id_siswa = $_POST['id_siswa'];
        $jenis_pembayaran = $_POST['jenis_pembayaran'];
        $bulan_tagihan = $_POST['bulan_tagihan'];
        $tahun_tagihan = $_POST['tahun_tagihan'];


        $sql = "INSERT INTO pemasukan (total, keterangan, tanggal_transaksi, id_akun, kode_pemasukan, id_pengguna, kode_pengguna) 
            VALUES ('$total', '$keterangan', '$tanggal_transaksi', '$id_akun_debit', '$kode_pemasukan', '$id_pengguna', '$kode_pengguna')";
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

        $sqlpembayaran = "INSERT INTO pembayaran (id_siswa, kode_pemasukan, jumlah, tanggal_pembayaran, jenis_pembayaran, bulan_tagihan, tahun_tagihan) 
            VALUES ('$id_siswa', '$kode_pemasukan', '$total', '$tanggal_transaksi', '$jenis_pembayaran', '$bulan_tagihan', '$tahun_tagihan')";
        $result = $conn->query($sqlpembayaran);

        break;
    case 'edit-pembayaran':
        $id = $_POST['id'];
        $total = $_POST['total'];
        $keterangan = $_POST['keterangan'];
        $tanggal_transaksi = $_POST['tanggal_transaksi'];
        $kode_pengguna = $_POST['kode_pengguna'];
        $id_siswa = $_POST['id_siswa'];
        $jenis_pembayaran = $_POST['jenis_pembayaran'];
        $bulan_tagihan = $_POST['bulan_tagihan'];
        $tahun_tagihan = $_POST['tahun_tagihan'];

        $sql = "UPDATE pembayaran SET jumlah = '$total', tanggal_pembayaran = '$tanggal_transaksi', id_siswa = '$id_siswa', jenis_pembayaran = '$jenis_pembayaran', bulan_tagihan = '$bulan_tagihan', tahun_tagihan = '$tahun_tagihan' WHERE kode_pemasukan = '$id'";
        $result = $conn->query($sql);
        if ($result) {
            http_response_code(200);
        } else {
            echo 'error';
            echo $conn->error;
            http_response_code(400);
        }

        // update pemasukan
        $sql = "UPDATE pemasukan SET total = '$total', keterangan = '$keterangan', tanggal_transaksi = '$tanggal_transaksi', kode_pengguna = '$kode_pengguna' WHERE kode_pemasukan = '$id'";
        $result = $conn->query($sql);
        if ($result) {
            http_response_code(200);
        } else {
            echo 'error';
            echo $conn->error;
            http_response_code(400);
        }

        // update transaksi
        $sql = "UPDATE transaksi SET total = '$total', deskripsi = '$keterangan', tanggal_transaksi = '$tanggal_transaksi' WHERE kode_transaksi = '$id'";
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

    case 'hapus-pembayaran':
        $id = $_POST['id'];
        $kode = $_POST['kode'];
        $sql = "DELETE FROM pembayaran WHERE id_pembayaran = '$id'";
        $result = $conn->query($sql);
        if ($result) {
            echo 'ok';
            http_response_code(200);
        } else {
            echo 'error';
            echo $conn->error;
            http_response_code(400);
        }
        // hapus pemasukan
        $sql = "DELETE FROM pemasukan WHERE kode_pemasukan = '$kode'";
        $result = $conn->query($sql);
        hapusTransaksi($kode, $conn);
        break;
    default:
        break;
}
<?php
session_start();
require('../../vendor/fpdf/fpdf.php');
$pdf = new FPDF('L', 'mm', 'Letter');

include '../../config.php';

$tanggal = date('Y-m-d');
$kepala_sekolah = "SELECT * FROM pengguna WHERE level = 'Kepala Sekolah'";
$result = $conn->query($kepala_sekolah);
$kepsek = $result->fetch_assoc();

// data pembayaran
$data_pembayaran = "SELECT
	pembayaran.*, 
	siswa.nama_siswa, 
	siswa.nipd
FROM
	pembayaran
	INNER JOIN
	siswa
	ON 
		pembayaran.id_siswa = siswa.id_siswa WHERE kode_pemasukan = '$_GET[id]'";
$result = $conn->query($data_pembayaran);
$data_pembayaran = $result->fetch_assoc();

$query = mysqli_query($conn, "select * from pembayaran");
$row = mysqli_fetch_array($query);


$pdf->AddPage();
$pdf->Image('../../assets/images/logo.png', 15, 5, 25, 25);
$pdf->SetFont('Arial', 'B', 21);
$pdf->Cell(0, 7, strtoupper('PENDIDIKAN ANAK USIA DINI'), 0, 1, 'C');
$pdf->Cell(0, 7, strtoupper('TK DHARMA INDRA'), 0, 1, 'C');
$pdf->SetFont('Arial', 'B', 10);
$pdf->Cell(0, 7, 'Alamat : Ds. Kedungsuren RT 03 RW 01 Kec.Kaliwungu Selatan Kab.Kendal Kode Pos 51373', 0, 1, 'C');
$pdf->Cell(10, 10, '', 0, 1);

//Membuat line (garis)
$pdf->SetLineWidth(1);
$pdf->Line(10, 31, 270, 31);
$pdf->SetLineWidth(0);
$pdf->Line(10, 32, 270, 32);

$pdf->SetFont('Arial', 'B', 14);

$pdf->Cell(0, 10, 'Bukti Pembayaran', 0, 1, 'C');

$pdf->SetFont('Arial', '', 11);
$pdf->Cell(160, 6, 'Tanggal Cetak : ' . tanggal($tanggal) . ' - ' . date('H:i:s'), 0, 0, 'L');
$pdf->Cell(100, 6, 'Kode Pembayaran : ' . $data_pembayaran['kode_pemasukan'], 0, 1, 'L');
$pdf->Cell(160, 6, 'Nama Siswa : ' . $data_pembayaran['nama_siswa'], 0, 0, 'L');
$pdf->Cell(100, 6, 'Tanggal Pembayaran : ' . $data_pembayaran['tanggal_pembayaran'], 0, 1, 'L');
$pdf->Cell(160, 6, 'NIPD : ' . $data_pembayaran['nipd'], 0, 1, 'L');
$pdf->Cell(10, 2, '', 0, 1);

$pdf->SetFont('Arial', 'B', 10);

$pdf->Cell(10, 6, 'No', 1, 0, 'C');
$pdf->Cell(90, 6, 'Jenis Pembayaran', 1, 0, 'C');
$pdf->Cell(100, 6, 'Bulan Tagihan', 1, 0, 'C');
$pdf->cell(60, 6, 'Nominal', 1, 1, 'C');


$pdf->SetFont('Arial', '', 10);

$sql = "SELECT * FROM pembayaran WHERE kode_pemasukan = '$_GET[id]'";
$hasil = mysqli_query($conn, $sql);
$no = 1;
//Menampilkan data dengan perulangan while
while ($data = mysqli_fetch_array($hasil)):
    $pdf->Cell(10, 6, $no, 1, 0, 'C');
    $pdf->Cell(90, 6, $data['jenis_pembayaran'], 1, 0, 'C');
    $pdf->Cell(100, 6, $data['bulan_tagihan'] . ' - ' . $data['tahun_tagihan'], 1, 0, 'C');
    $pdf->Cell(60, 6, 'Rp. ' . number_format($data['jumlah'], 0, ',', '.'), 1, 1, 'C');
    $no++;
endwhile;

//Membuat format peulisan tanggal
function tanggal($tanggal)
{
    $bulan = array(
        1 => 'Januari',
        'Februari',
        'Maret',
        'April',
        'Mei',
        'Juni',
        'Juli',
        'Agustus',
        'September',
        'Oktober',
        'November',
        'Desember'
    );
    $split = explode('-', $tanggal);
    return $split[2] . ' ' . $bulan[(int) $split[1]] . ' ' . $split[0];
}

//Menampilkan keterangan tambahan
$tanggal = date('Y-m-d');
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(460, 15, '', 0, 1, 'C');
$pdf->Cell(460, 12, tanggal($tanggal), 0, 1, 'C');
$pdf->Cell(460, 0, 'Kepala Sekolah', 0, 1, 'C');
$pdf->Cell(460, 7, '', 0, 1, 'C');
$pdf->Cell(460, 50, $kepsek['nama'], 0, 1, 'C');

$pdf->Output();
?>
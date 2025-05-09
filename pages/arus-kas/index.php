<div class="container-fluid">

    <!-- start page title -->
    <div class="row d-print-none">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0 font-size-18">Laporan Arus Kas</h4>

                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item"><a href="javascript: void(0);">Sistem Informasi</a></li>
                        <li class="breadcrumb-item active">Laporan Arus Kas</li>
                    </ol>
                </div>

            </div>
        </div>
    </div>
    <!-- end page title -->
    <div class="row d-print-none">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title mb-0">Filter Tanggal</h5>
                </div><!-- end card header -->
                <?php
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
                $daritanggal = "";
                $sampaitanggal = "";

                if (isset($_GET['dari_tanggal']) && isset($_GET['sampai_tanggal'])) {
                    $daritanggal = $_GET['dari_tanggal'];
                    $sampaitanggal = $_GET['sampai_tanggal'];
                    $judul = tanggal($daritanggal) . ' - ' . tanggal($sampaitanggal);
                } else {
                    $judul = 'Semua Tanggal';
                }

                ?>
                <div class="card-body">
                    <form action="" method="get" class="row g-3">
                        <input type="hidden" name="page" value="arus-kas">
                        <div class="col-md-6">
                            <label for="validationDefault01" class="form-label">Dari Tanggal</label>
                            <input type="date" class="form-control" id="validationDefault01" required=""
                                name="dari_tanggal">
                        </div>
                        <div class="col-md-6">
                            <label for="validationDefault02" class="form-label">Sampai Tanggal</label>
                            <input type="date" class="form-control" id="validationDefault02" required=""
                                name="sampai_tanggal">
                        </div>
                        <div class="col-12">
                            <button class="btn btn-primary" type="submit">Pilih</button>
                        </div>
                    </form>
                </div> <!-- end card-body -->
            </div> <!-- end card-->
        </div>
    </div>
    <?php if (isset($_GET['dari_tanggal']) && isset($_GET['sampai_tanggal'])) { ?>
        <!-- end row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-sm-3 text-end">
                                <img src="assets/images/logo.png" width="100px" alt="brand" />
                            </div>
                            <div class="col-sm-8 text-center">
                                <h1>PENDIDIKAN ANAK USIA DINI</h1>
                                <h1><b>TK DHARMA INDRA</b></h1>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-sm-12 text-center">
                                <h6>Alamat : Ds. Kedungsuren RT 03 RW 01 Kec.Kaliwungu Selatan Kab.Kendal Kode Pos 51373
                                </h6>
                            </div>
                        </div>
                        <hr class="my-1">
                        <div class="card-body">

                            <div class="row mt-1">
                                <div class="col-sm-12">
                                    <p class="mb-3 text-center"><b>Laporan Arus Kas</b> <br> Tanggal : <?php
                                    if (!empty($_GET["dari_tanggal"]) && !empty($_GET["sampai_tanggal"])) {
                                        echo tanggal($_GET['dari_tanggal']) . " s.d " . tanggal($_GET['sampai_tanggal']);
                                    } else {
                                        echo "Semua";
                                    }
                                    ?>
                                    </p>
                                    <table class="mt-5 table" id="dataTable" width="100%" cellspacing="0">
                                        <thead class="text-center">
                                            <tr>
                                                <th>Akun</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            // include database
                                            require_once 'config.php';
                                            $kondisi = "";

                                            if (!empty($_GET["dari_tanggal"]) && !empty($_GET["sampai_tanggal"]))
                                                $kondisi = "WHERE date(tanggal_transaksi) between '" . $_GET['dari_tanggal'] . "' AND '" . $_GET['sampai_tanggal'] . "'";
                                            $sqlkassebelum = "SELECT sum(debit) - sum(kredit) as total FROM jurnal WHERE jenis_akun = 'Aktiva Lancar' AND tanggal_transaksi < '" . $_GET['dari_tanggal'] . "'";
                                            $querykassebelum = mysqli_query($conn, $sqlkassebelum);
                                            $datakassebelum = mysqli_fetch_array($querykassebelum);
                                            $kassebelum = $datakassebelum['total'];
                                            if (empty($kassebelum)) {
                                                $kassebelum = 0;
                                            }
                                            ?>
                                            <tr>
                                                <td>Saldo Kas Awal</td>
                                                <td><?= "Rp. " . number_format($kassebelum, 2, ',', '.') ?>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2"><b>A. Arus Kas yang dihasilkan dari aktivitas operasi</b>
                                                </td>
                                            </tr>
                                            <?php
                                            $totaloperasi = 0;
                                            $sqloperasi = "SELECT sum(kredit) as total, akun FROM jurnal $kondisi AND jenis_akun = 'Pendapatan'";
                                            $queryoperasi = mysqli_query($conn, $sqloperasi);
                                            $dataoperasi = mysqli_fetch_array($queryoperasi);
                                            $sqlbeban = "SELECT sum(debit) as total, akun FROM jurnal $kondisi AND jenis_akun = 'Beban'";
                                            $querybeban = mysqli_query($conn, $sqlbeban);
                                            $databeban = mysqli_fetch_array($querybeban);
                                            $totaloperasi = $dataoperasi['total'] - $databeban['total'];
                                            ?>
                                            <tr>
                                                <td>Pendapatan Bersih</td>
                                                <td><?= "Rp. " . number_format($totaloperasi, 2, ',', '.') ?></td>
                                            </tr>
                                            <?php

                                            ?>
                                            <tr>
                                                <td>
                                                    <b>Kas Bersih dari Kegiatan Operasi</b>
                                                </td>
                                                <td><b><?= "Rp. " . number_format($totaloperasi, 2, ',', '.') ?></b></td>

                                            </tr>
                                            <tr>
                                                <td colspan="2"><b>B. Arus Kas dari Investasi</b></td>
                                            </tr>
                                            <?php
                                            $sqltetap = "SELECT sum(debit) as total, akun FROM jurnal $kondisi AND jenis_akun = 'Aktiva Tetap' GROUP BY akun";
                                            $querytetap = mysqli_query($conn, $sqltetap);
                                            $totaltetap = 0;
                                            while ($datatetap = mysqli_fetch_array($querytetap)) {
                                                $totaltetap += $datatetap['total'];
                                                ?>
                                                <tr>
                                                    <td><?= $datatetap['akun'] ?></td>
                                                    <td><?= "Rp. " . number_format($datatetap['total'], 2, ',', '.') ?></td>
                                                </tr>
                                                <?php
                                            }
                                            ?>
                                            <tr>
                                                <td>
                                                    <b>Kas Bersih dari Kegiatan Investasi</b>
                                                </td>
                                                <td><b><?= "Rp. " . number_format($totaltetap, 2, ',', '.') ?></b></td>

                                            </tr>
                                            <tr>
                                                <td colspan="2"><b>C. Arus Kas dari Pendanaan</b></td>
                                            </tr>
                                            <?php
                                            $sqlpendanaan = "SELECT sum(kredit) as total, akun FROM jurnal $kondisi AND jenis_akun = 'Modal' GROUP BY akun";
                                            $querypendanaan = mysqli_query($conn, $sqlpendanaan);
                                            $totalpendanaan = 0;
                                            while ($datapendanaan = mysqli_fetch_array($querypendanaan)) {
                                                $totalpendanaan += $datapendanaan['total'];
                                                ?>
                                                <tr>
                                                    <td><?= $datapendanaan['akun'] ?></td>
                                                    <td><?= "Rp. " . number_format($datapendanaan['total'], 2, ',', '.') ?></td>
                                                </tr>
                                                <?php
                                            }
                                            ?>
                                            <tr>
                                                <td>
                                                    <b>Kas Bersih dari Kegiatan Pendanaan</b>
                                                </td>
                                                <td><b><?= "Rp. " . number_format($totalpendanaan, 2, ',', '.') ?></b></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>Pergerakan Kas</b>
                                                </td>
                                                <td><b><?= "Rp. " . number_format($totaloperasi - $totaltetap + $totalpendanaan, 2, ',', '.') ?></b>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>Total Kas</b>
                                                </td>
                                                <td><b><?= "Rp. " . number_format(($totaloperasi - $totaltetap + $totalpendanaan) + $kassebelum, 2, ',', '.') ?></b>
                                                </td>

                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <div class="mt-3" style="text-align:center;">
                                        <p class="font-weight-bold"><br>Kepala Sekolah</p>
                                        <div class="mt-5">
                                            <?php
                                            $sql = "SELECT * FROM pengguna WHERE level='Kepala Sekolah'";
                                            $query = mysqli_query($conn, $sql);
                                            $data = mysqli_fetch_array($query);

                                            ?>
                                            <p class="font-weight-bold"> <?= $data['nama'] ?></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="mt-3" style="text-align:center;">
                                        <p class="font-weight-bold">Kedungsuren, <?= tanggal(date('Y-m-d')) ?><br>Bendahara
                                        </p>
                                        <div class="mt-5">
                                            <?php
                                            $sql = "SELECT * FROM pengguna WHERE level='Bendahara'";
                                            $query = mysqli_query($conn, $sql);
                                            $data = mysqli_fetch_array($query);
                                            ?>
                                            <p class="font-weight-bold"> <?= $data['nama'] ?></p>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="d-print-none mt-3">
                                <div class="float-end">
                                    <a href="javascript:window.print()"
                                        class="btn btn-success waves-effect waves-light me-1"><i class="fa fa-print"></i>
                                        Cetak</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <?php
    } ?>


</div> <!-- container-fluid -->
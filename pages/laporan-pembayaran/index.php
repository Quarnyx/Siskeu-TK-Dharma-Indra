<div class="container-fluid">

    <!-- start page title -->
    <div class="row d-print-none">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0 font-size-18">Laporan Pendapatan</h4>

                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item"><a href="javascript: void(0);">Sistem Informasi</a></li>
                        <li class="breadcrumb-item active">Laporan Pendapatan</li>
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
                require_once 'config.php';
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
                        <input type="hidden" name="page" value="laporan-pembayaran">
                        <div class="col-md-6">
                            <label for="validationDefault01" class="form-label">Kelas</label>
                            <select class="form-select" id="validationDefault01" name="kelas">
                                <option value="">Semua Kelas</option>
                                <?php
                                $kelas = mysqli_query($conn, "SELECT kelas FROM siswa GROUP BY kelas");
                                while ($data = mysqli_fetch_array($kelas)) {
                                    echo '<option value="' . $data['kelas'] . '">' . $data['kelas'] . '</option>';
                                }
                                ?>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label for="validationDefault02" class="form-label">Tahun</label>
                            <select class="form-select" id="validationDefault02" required="" name="tahun">
                                <?php
                                $tahun = mysqli_query($conn, "SELECT tahun_tagihan FROM pembayaran GROUP BY tahun_tagihan");
                                while ($data = mysqli_fetch_array($tahun)) {
                                    echo '<option value="' . $data['tahun_tagihan'] . '">' . $data['tahun_tagihan'] . '</option>';
                                }
                                ?>
                            </select>
                        </div>
                        <div class="col-12">
                            <button class="btn btn-primary" type="submit">Pilih</button>
                        </div>
                    </form>
                </div> <!-- end card-body -->
            </div> <!-- end card-->
        </div>
    </div>

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
                                <p class="mb-3 text-center"><b>Laporan Pembayaran SISWA</b> <br> Tahun : <?php
                                if (!empty($_GET["tahun"])) {
                                    echo $_GET['tahun'];
                                } else {
                                    echo date('Y');
                                }
                                ?>
                                    <br>
                                    Kelas : <?php
                                    if (!empty($_GET["kelas"])) {
                                        echo $_GET['kelas'];
                                    } else {
                                        echo 'Semua Kelas';
                                    }
                                    ?>
                                </p>
                                <table class="mt-5 table table-bordered" style="border : 5px!important" id="dataTable"
                                    width="100%" cellspacing="0">
                                    <thead class="text-center">
                                        <tr>
                                            <th style="vertical-align: middle" rowspan="2">No</th>
                                            <th style="vertical-align: middle" rowspan="2">Nama</th>
                                            <th style="vertical-align: middle" rowspan="2">NIPD</th>
                                            <th style="vertical-align: middle" colspan="12">SPP</th>
                                            <th style="vertical-align: middle" rowspan="2">Pembangunan</th>
                                            <th style="vertical-align: middle" rowspan="2">Seragam</th>
                                            <th style="vertical-align: middle" rowspan="2">Porseni</th>
                                            <th style="vertical-align: middle" rowspan="2">Lain-lain</th>
                                        </tr>
                                        <tr>
                                            <th>1</th>
                                            <th>2</th>
                                            <th>3</th>
                                            <th>4</th>
                                            <th>5</th>
                                            <th>6</th>
                                            <th>7</th>
                                            <th>8</th>
                                            <th>9</th>
                                            <th>10</th>
                                            <th>11</th>
                                            <th>12</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $kelas = "";
                                        if (!empty($_GET["kelas"])) {
                                            $kelas = "WHERE kelas = '" . $_GET['kelas'] . "'";
                                        }
                                        $tahun = date('Y');
                                        if (!empty($_GET["tahun"])) {
                                            $tahun = $_GET['tahun'];
                                        }

                                        $no = 1;
                                        $sql = "SELECT * FROM siswa $kelas";
                                        $query = mysqli_query($conn, $sql);
                                        while ($data = mysqli_fetch_array($query)) {
                                            $id = $data['id_siswa'];
                                            ?>
                                            <tr>
                                                <td class="text-center"><?= $no++ ?></td>
                                                <td class="text-center"><?= $data['nama_siswa'] ?></td>
                                                <td class="text-center"><?= $data['nipd'] ?></td>

                                                <?php
                                                for ($month = 1; $month <= 12; $month++) {
                                                    $sql2 = "SELECT * FROM pembayaran WHERE id_siswa = '$id' AND jenis_pembayaran = 'SPP' AND bulan_tagihan = '" . date('F', mktime(0, 0, 0, $month, 10)) . "' AND tahun_tagihan = '$tahun'";
                                                    $query2 = mysqli_query($conn, $sql2);
                                                    echo '<td class="text-center">';
                                                    if (mysqli_num_rows($query2) > 0) {
                                                        echo '<i class="fa fa-check text-success"></i>';
                                                    }
                                                    echo '</td>';
                                                }
                                                ?>
                                                <td class="text-center"><?php
                                                $sql3 = "SELECT * FROM pembayaran WHERE id_siswa = '$id' AND jenis_pembayaran = 'Pembangunan'";
                                                $query3 = mysqli_query($conn, $sql3);
                                                if (mysqli_num_rows($query3) > 0) {
                                                    echo '<i class="fa fa-check text-success"></i>';
                                                }
                                                ?></td>
                                                <td class="text-center">
                                                    <?php
                                                    $sql4 = "SELECT * FROM pembayaran WHERE id_siswa = '$id' AND jenis_pembayaran = 'Seragam'";
                                                    $query4 = mysqli_query($conn, $sql4);
                                                    if (mysqli_num_rows($query4) > 0) {
                                                        echo '<i class="fa fa-check text-success"></i>';
                                                    }
                                                    ?>
                                                </td>
                                                <td class="text-center">
                                                    <?php
                                                    $sql5 = "SELECT * FROM pembayaran WHERE id_siswa = '$id' AND jenis_pembayaran = 'Porseni'";
                                                    $query5 = mysqli_query($conn, $sql5);
                                                    if (mysqli_num_rows($query5) > 0) {
                                                        echo '<i class="fa fa-check text-success"></i>';
                                                    }
                                                    ?>
                                                </td>
                                                <td class="text-center">
                                                    <?php
                                                    $sql6 = "SELECT * FROM pembayaran WHERE id_siswa = '$id' AND jenis_pembayaran = 'Pembayaran Lainnya'";
                                                    $query6 = mysqli_query($conn, $sql6);
                                                    if (mysqli_num_rows($query6) > 0) {
                                                        echo '<i class="fa fa-check text-success"></i>';
                                                    }
                                                    ?>
                                                </td>
                                            </tr>
                                        <?php } ?>
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

    </div> <!-- container-fluid -->
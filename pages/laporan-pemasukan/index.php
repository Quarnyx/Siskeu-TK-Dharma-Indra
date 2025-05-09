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
                        <input type="hidden" name="page" value="laporan-pendapatan">
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
                                <p class="mb-3 text-center"><b>Laporan Pendapatan Kas</b> <br> Tanggal : <?php
                                if (!empty($_GET["dari_tanggal"]) && !empty($_GET["sampai_tanggal"])) {
                                    echo tanggal($_GET['dari_tanggal']) . " s.d " . tanggal($_GET['sampai_tanggal']);
                                } else {
                                    echo "Semua";
                                }
                                ?>
                                </p>
                                <table class="mt-5 table table-bordered" style="border : 5px!important" id="dataTable"
                                    width="100%" cellspacing="0">
                                    <thead class="text-center">
                                        <tr>
                                            <th>No</th>
                                            <th>No. Transaksi</th>
                                            <th>Tanggal</th>
                                            <th>Keterangan</th>
                                            <th>Jumlah</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        // include database
                                        require_once 'config.php';
                                        $kondisi = "";

                                        if (!empty($_GET["dari_tanggal"]) && !empty($_GET["sampai_tanggal"]))
                                            $kondisi = "WHERE date(tanggal_transaksi) between '" . $_GET['dari_tanggal'] . "' AND '" . $_GET['sampai_tanggal'] . "'";

                                        $sql = "SELECT * FROM pemasukan $kondisi ORDER BY tanggal_transaksi asc";
                                        $hasil = mysqli_query($conn, $sql);
                                        $no = 0;
                                        $status = '';
                                        $total = 0;

                                        //Menampilkan data dengan perulangan while
                                        while ($data = mysqli_fetch_array($hasil)):
                                            $no++;
                                            if ($data['tanggal_transaksi'] == '0000-00-00') {
                                                $tanggal = "";
                                            } else {
                                                $tanggal = date("d/m/Y", strtotime($data['tanggal_transaksi']));
                                            }
                                            ?>
                                            <tr>
                                                <td class="text-center"><?php echo $no; ?></td>
                                                <td><?= $data['kode_pemasukan'] ?></td>
                                                <td><?= tanggal($data['tanggal_transaksi']) ?></td>
                                                <td><?= $data['keterangan'] ?></td>
                                                <td><?= "Rp. " . number_format($data['total'], 0, ',', '.') ?></td>
                                            </tr>
                                            <!-- bagian akhir (penutup) while -->
                                            <?php
                                            $total += $data['total'];
                                        endwhile;
                                        ?>

                                        <td colspan="4" class="text-center"><b>Total Pengeluaran</b">
                                        </td>
                                        <td><b><?php echo "Rp. " . number_format($total, 0, ',', '.') ?></b></td>

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
                                        <p class="font-weight-bold"> <?= $_SESSION['nama']; ?></p>
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
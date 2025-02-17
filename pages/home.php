<div class="container-fluid">

    <!-- start page title -->
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0 font-size-18">Dashboard</h4>

                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item"><a href="javascript: void(0);">Sistem Informasi</a></li>
                        <li class="breadcrumb-item active">Dashboard</li>
                    </ol>
                </div>

            </div>
        </div>
    </div>
    <!-- end page title -->

    <div class="row">
        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card border border-success card-h-100">
                <div class="card-header bg-transparent border-success">
                    <h5 class="my-0 text-success">Saldo Kas</h5>
                </div>
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-12">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Total Saldo Kas</span>
                            <h4 class="mb-3 text-success">
                                <?php
                                require_once 'config.php';
                                $sql = "SELECT SUM(debit - kredit) AS total_kas FROM jurnal WHERE jenis_akun = 'Aktiva Lancar'";
                                $result = $conn->query($sql);
                                $row = $result->fetch_assoc();
                                $total_kas = $row['total_kas'];

                                ?>
                                Rp<span class=""><?php echo number_format($total_kas, 2, ',', '.'); ?></span>
                            </h4>
                        </div>
                    </div>
                </div><!-- end card body -->
            </div><!-- end card -->
        </div><!-- end col -->
        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card border border-info card-h-100">
                <div class="card-header bg-transparent border-info">
                    <h5 class="my-0 text-info">Total Pendapatan</h5>
                </div>
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-12">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Total Pendapatan Bulan Ini</span>
                            <h4 class="mb-3 text-info">
                                <?php
                                require_once 'config.php';
                                $sql = "SELECT SUM(total) AS total FROM pemasukan WHERE MONTH(tanggal_transaksi) = MONTH(CURDATE())";
                                $result = $conn->query($sql);
                                $row = $result->fetch_assoc();
                                $total_kas = $row['total'];

                                ?>
                                Rp<span class=""><?php echo number_format($total_kas, 2, ',', '.'); ?></span>
                            </h4>
                        </div>
                    </div>
                </div><!-- end card body -->
            </div><!-- end card -->
        </div><!-- end col -->

        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card border border-danger card-h-100">
                <div class="card-header bg-transparent border-danger">
                    <h5 class="my-0 text-danger">Total Pengeluaran</h5>
                </div>
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-12">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Total Pengeluaran Bulan Ini</span>
                            <h4 class="mb-3 text-danger">
                                <?php
                                require_once 'config.php';
                                $sql = "SELECT SUM(total) AS total FROM pengeluaran WHERE MONTH(tanggal_transaksi) = MONTH(CURDATE())";
                                $result = $conn->query($sql);
                                $row = $result->fetch_assoc();
                                $total_kas = $row['total'];

                                ?>
                                Rp<span class=""><?php echo number_format($total_kas, 2, ',', '.'); ?></span>
                            </h4>
                        </div>
                    </div>
                </div><!-- end card body -->
            </div><!-- end card -->
        </div><!-- end col -->

        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card border border-primary card-h-100">
                <div class="card-header bg-transparent border-primary">
                    <h5 class="my-0 text-primary">Pengguna</h5>
                </div>
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-12">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Jumlah Pengguna Aplikasi</span>
                            <h4 class="mb-3 text-primary">
                                <?php
                                require_once 'config.php';
                                $sql = "SELECT count(id_pengguna) AS total FROM pengguna";
                                $result = $conn->query($sql);
                                $row = $result->fetch_assoc();
                                $total_kas = $row['total'];

                                ?>
                                <span class=""><?php echo $total_kas ?></span>
                            </h4>
                        </div>
                    </div>
                </div><!-- end card body -->
            </div><!-- end card -->
        </div><!-- end col -->



    </div><!-- end row-->
    <div class="row">
        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card border border-info card-h-100">
                <div class="card-header bg-transparent border-info">
                    <h5 class="my-0 text-info">Total Penerimaan</h5>
                </div>
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-12">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Total Penerimaan Hari Ini</span>
                            <h4 class="mb-3 text-info">
                                <?php
                                require_once 'config.php';
                                $sql = "SELECT SUM(total) AS total FROM pemasukan WHERE tanggal_transaksi = CURDATE()";
                                $result = $conn->query($sql);
                                $row = $result->fetch_assoc();
                                $total_kas = $row['total'];

                                if ($total_kas == null) {
                                    $total_kas = 0;
                                }

                                ?>
                                Rp<span class=""><?php echo number_format($total_kas, 2, ',', '.'); ?></span>
                            </h4>
                        </div>
                    </div>
                </div><!-- end card body -->
            </div><!-- end card -->
        </div><!-- end col -->

        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card border border-danger card-h-100">
                <div class="card-header bg-transparent border-danger">
                    <h5 class="my-0 text-danger">Total Pengeluaran</h5>
                </div>
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-12">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Total Pengeluaran Hari Ini</span>
                            <h4 class="mb-3 text-danger">
                                <?php
                                require_once 'config.php';
                                $sql = "SELECT SUM(total) AS total FROM pengeluaran WHERE tanggal_transaksi = CURDATE()";
                                $result = $conn->query($sql);
                                $row = $result->fetch_assoc();
                                $total_kas = $row['total'];
                                if ($total_kas == null) {
                                    $total_kas = 0;
                                }

                                ?>
                                Rp<span class=""><?php echo number_format($total_kas, 2, ',', '.'); ?></span>
                            </h4>
                        </div>
                    </div>
                </div><!-- end card body -->
            </div><!-- end card -->
        </div><!-- end col -->
    </div>
    <div class="row">
        <div class="col-xl-12">
            <!-- card -->
            <div class="card">
                <!-- card body -->
                <div class="card-body">
                    <div class="d-flex flex-wrap align-items-center mb-4">
                        <h5 class="card-title me-2">Grafik Pengeluaran dan Pendapatan</h5>

                    </div>

                    <div class="row align-items-center">
                        <div class="col-xl-12">
                            <div>
                                <div id="market-overview" data-colors='["#5156be", "#34c38f"]' class="apex-charts">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end card -->
            </div>
            <!-- end col -->
        </div>
        <!-- end row-->


    </div>
    <!-- end row-->


</div>
<?php
require_once 'config.php';
$sqlpemasukan = "SELECT
                YEAR(tanggal_transaksi) AS year,
                MONTH(tanggal_transaksi) AS month,
                SUM(total) AS total_pemasukan
            FROM
	            pemasukan
                WHERE YEAR(tanggal_transaksi) = YEAR(CURDATE())
            GROUP BY year, month";
$sqlpengeluaran = "SELECT
                YEAR(tanggal_transaksi) AS year,
                MONTH(tanggal_transaksi) AS month,
                SUM(total) AS total_pengeluaran
            FROM
	            pengeluaran
                WHERE YEAR(tanggal_transaksi) = YEAR(CURDATE())
            GROUP BY year, month";

$hasilpemasukan = $conn->query($sqlpemasukan);
$data_pemasukan = [];

if ($hasilpemasukan->num_rows > 0) {
    while ($row = $hasilpemasukan->fetch_assoc()) {
        $data_pemasukan[] = $row;
    }
}

$hasilpengeluaran = $conn->query($sqlpengeluaran);
$datapengeluaran = [];

if ($hasilpengeluaran->num_rows > 0) {
    while ($row = $hasilpengeluaran->fetch_assoc()) {
        $datapengeluaran[] = $row;
    }
}

// Preparing data for ApexCharts
$months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
$total_pemasukans = array_fill(0, 12, 0);  // Initialize an array with 12 zeros
$total_pengeluarans = array_fill(0, 12, 0);   // Initialize an array with 12 zeros

// Map buys data to corresponding months
foreach ($datapengeluaran as $data) {
    $total_pengeluarans[$data['month'] - 1] = $data['total_pengeluaran'];
}
// Map sales data to corresponding months
foreach ($data_pemasukan as $data) {
    $total_pemasukans[$data['month'] - 1] = $data['total_pemasukan'];
}

$conn->close();
?>
<script>
    function getChartColorsArray(chartId) {
        var colors = $(chartId).attr('data-colors');
        var colors = JSON.parse(colors);
        return colors.map(function (value) {
            var newValue = value.replace(' ', '');
            if (newValue.indexOf('--') != -1) {
                var color = getComputedStyle(document.documentElement).getPropertyValue(newValue);
                if (color) return color;
            } else {
                return newValue;
            }
        })
    }
    const pemasukan = <?php echo json_encode($total_pemasukans); ?>;
    const pengeluaran = <?php echo json_encode($total_pengeluarans); ?>;
    var barchartColors = getChartColorsArray("#market-overview");
    var options = {
        series: [{
            name: 'Pemasukan',
            data: pemasukan
        }, {
            name: 'Pengeluaran',
            data: pengeluaran
        }],
        chart: {
            type: 'bar',
            height: 400,
            stacked: true,
            toolbar: {
                show: false
            },
        },
        plotOptions: {
            bar: {
                columnWidth: '20%',
            },
        },
        colors: barchartColors,
        fill: {
            opacity: 1
        },
        dataLabels: {
            enabled: false,
        },
        legend: {
            show: false,
        },
        yaxis: {
            labels: {
                formatter: function (y) {
                    return y.toFixed(0) + "";
                }
            }
        },
        xaxis: {
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
            labels: {
                rotate: -90
            }
        }
    };

    var chart = new ApexCharts(document.querySelector("#market-overview"), options);
    chart.render();
</script>
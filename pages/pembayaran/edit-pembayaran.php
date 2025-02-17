<?php include "../../config.php";
$sql = "SELECT * FROM pembayaran WHERE kode_pemasukan = '$_POST[id]'";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
}
?>
<form id="form-edit" enctype="multipart/form-data">
    <input type="hidden" name="id" value="<?= $row['kode_pemasukan'] ?>">
    <input type="hidden" name="id_pengguna" value="<?php session_start();
    echo $_SESSION['id_pengguna']; ?>">
    <input type="hidden" name="kode_pengguna" value="<?php
    echo $_SESSION['kode_pengguna']; ?>">
    <div class="d-grid gap-3">
        <div class="row">
            <div class="col-md-6">
                <label for="kode_pemasukan" class="form-label">Kode Pemasukan</label>
                <input type="text" class="form-control" name="kode_pemasukan" id="kode_pemasukan"
                    value="<?= $row['kode_pemasukan'] ?>" placeholder="" readonly>
            </div>
            <div class="col-md-6">
                <label for="total" class="form-label">Total</label>
                <input type="number" class="form-control" name="total" id="total" placeholder=""
                    value="<?= $row['jumlah'] ?>">
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <label for="" class="form-label">Tanggal Transaksi</label>
                <input type="date" class="form-control" name="tanggal_transaksi" id="tanggal_transaksi" placeholder=""
                    value="<?= $row['tanggal_pembayaran'] ?>">
            </div>
            <div class="col-md-6">
                <label class="form-label">Nama Siswa</label>
                <select name="id_siswa" class="form-select">
                    <option value="-">Pilih Siswa</option>
                    <?php
                    require_once '../../config.php';
                    $sqla = "SELECT * FROM siswa";
                    $resulta = $conn->query($sqla);
                    while ($rowa = $resulta->fetch_assoc()) {
                        ?>
                        <option value="<?= $rowa['id_siswa'] ?>" <?php if ($rowa['id_siswa'] == $row['id_siswa'])
                              echo "selected"; ?>><?= $rowa['nama_siswa'] ?></option>
                        <?php
                    }
                    ?>
                </select>
            </div>

        </div>
        <div class="row">
            <div class="col-md-6">
                <label class="form-label">Jenis Pembayaran</label>
                <select name="jenis_pembayaran" class="form-select">
                    <option value="SPP" <?php if ($row['jenis_pembayaran'] == "SPP")
                        echo "selected"; ?>>SPP
                    </option>
                    <option value="Pembangunan" <?php if ($row['jenis_pembayaran'] == "Pembangunan")
                        echo "selected"; ?>>
                        Pembangunan</option>
                    <option value="Seragam" <?php if ($row['jenis_pembayaran'] == "Seragam")
                        echo "selected"; ?>>Seragam
                    </option>
                    <option value="Porseni" <?php if ($row['jenis_pembayaran'] == "Porseni")
                        echo "selected"; ?>>Porseni
                    </option>
                    <option value="Pembayaran Lainnya" <?php if ($row['jenis_pembayaran'] == "Pembayaran Lainnya")
                        echo "selected"; ?>>Pembayaran Lainnya</option>
                </select>
            </div>
            <div class="col-md-3">
                <label class="form-label">Bulan Tagihan</label>
                <select name="bulan_tagihan" class="form-select">
                    <option value="January" <?php if ($row['bulan_tagihan'] == "January")
                        echo "selected"; ?>>Januari
                    </option>
                    <option value="February" <?php if ($row['bulan_tagihan'] == "February")
                        echo "selected"; ?>>Februari
                    </option>
                    <option value="March" <?php if ($row['bulan_tagihan'] == "March")
                        echo "selected"; ?>>Maret</option>
                    <option value="April" <?php if ($row['bulan_tagihan'] == "April")
                        echo "selected"; ?>>April</option>
                    <option value="May" <?php if ($row['bulan_tagihan'] == "May")
                        echo "selected"; ?>>Mei</option>
                    <option value="June" <?php if ($row['bulan_tagihan'] == "June")
                        echo "selected"; ?>>Juni</option>
                    <option value="July" <?php if ($row['bulan_tagihan'] == "July")
                        echo "selected"; ?>>Juli</option>
                    <option value="August" <?php if ($row['bulan_tagihan'] == "August")
                        echo "selected"; ?>>Agustus
                    </option>
                    <option value="September" <?php if ($row['bulan_tagihan'] == "September")
                        echo "selected"; ?>>
                        September</option>
                    <option value="October" <?php if ($row['bulan_tagihan'] == "October")
                        echo "selected"; ?>>Oktober
                    </option>
                    <option value="November" <?php if ($row['bulan_tagihan'] == "November")
                        echo "selected"; ?>>November
                    </option>
                    <option value="December" <?php if ($row['bulan_tagihan'] == "December")
                        echo "selected"; ?>>Desember
                    </option>
                </select>
            </div>
            <div class="col-md-3">
                <label class="form-label">Tahun Tagihan</label>
                <select name="tahun_tagihan" class="form-select">
                    <?php
                    $currentYear = date("Y");
                    for ($year = 2022; $year <= 2030; $year++) {
                        $selected = ($year == $row['tahun_tagihan']) ? 'selected' : '';
                        echo "<option value=\"$year\" $selected>$year</option>";
                    }
                    ?>
                </select>
            </div>
        </div>
        <!-- take data from pemasukan -->
        <?php
        require_once '../../config.php';
        $sql = "SELECT * FROM pemasukan WHERE kode_pemasukan = '$_POST[id]'";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            $rowb = $result->fetch_assoc();
        }
        ?>

        <div class="row">
            <div class="col-md-12">
                <label for="keterangan" class="form-label">Keterangan</label>
                <textarea class="form-control" name="keterangan" id="keterangan"
                    placeholder="Keterangan"><?= $rowb['keterangan'] ?></textarea>
            </div>
        </div>

    </div>
    <button type="submit" class="btn btn-primary mt-3">Simpan</button>
</form>
<script>
    $("#form-edit").submit(function (e) {
        e.preventDefault();
        var formData = new FormData(this);
        $.ajax({
            type: 'POST',
            url: 'proses.php?aksi=edit-pembayaran',
            data: formData,
            cache: false,
            contentType: false,
            processData: false,
            success: function (data) {
                if (data == "ok") {
                    loadTable();
                    $('.modal').modal('hide');
                    alertify.success('Edit Berhasil');

                } else {
                    alertify.error('Edit Gagal');

                }
            },
            error: function (data) {
                alertify.error(data);
            }
        });
    });
</script>
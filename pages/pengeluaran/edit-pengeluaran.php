<?php include "../../config.php";
$sql = "SELECT * FROM pengeluaran WHERE id_pengeluaran = '$_POST[id]'";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
}
$sqltransaksi = "SELECT * FROM transaksi WHERE kode_transaksi = '$row[kode_pengeluaran]'";
$resulttransaksi = $conn->query($sqltransaksi);
if ($resulttransaksi->num_rows > 0) {
    $rowtransaksi = $resulttransaksi->fetch_assoc();
}
?>
<form id="form-edit" enctype="multipart/form-data">
    <input type="hidden" name="id" value="<?= $row['id_pengeluaran'] ?>">
    <input type="hidden" name="id_pengguna" value="<?php session_start();
    echo $_SESSION['id_pengguna']; ?>">
    <div class="d-grid gap-3">
        <div class="row">
            <div class="col-md-6">
                <label for="kode_pengeluaran" class="form-label">Kode Pengeluaran</label>
                <input type="text" class="form-control" name="kode_pengeluaran" id="kode_pengeluaran"
                    value="<?= $row['kode_pengeluaran'] ?>" placeholder="" readonly>
            </div>
            <div class="col-md-6">
                <label for="total" class="form-label">Total</label>
                <input type="number" class="form-control" name="total" id="total" placeholder=""
                    value="<?= $row['total'] ?>">
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="" class="form-label">Akun Pembayaran</label>
                <select name="id_akun_kredit" class="form-select">
                    <?php
                    require_once '../../config.php';
                    $sql = "SELECT * FROM akun";
                    $result = $conn->query($sql);
                    while ($rowa = $result->fetch_assoc()) {
                        ?>
                        <option value="<?= $rowa['id_akun'] ?>" <?php if ($rowtransaksi['id_akun_kredit'] == $rowa['id_akun'])
                              echo 'selected' ?>><?= $rowa['nama_akun'] ?></option>
                        <?php
                    }
                    ?>
                </select>
            </div>
            <div class="col-md-6">
                <label for="" class="form-label">Tujuan Akun</label>
                <select name="id_akun_debit" class="form-select">
                    <?php
                    require_once '../../config.php';
                    $sql = "SELECT * FROM akun";
                    $result = $conn->query($sql);
                    while ($rowb = $result->fetch_assoc()) {
                        ?>
                        <option value="<?= $rowb['id_akun'] ?>" <?php if ($rowtransaksi['id_akun_debit'] == $rowb['id_akun'])
                              echo 'selected' ?>><?= $rowb['nama_akun'] ?></option>
                        <?php
                    }
                    ?>
                </select>
            </div>

        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="" class="form-label">Tanggal Transaksi</label>
                <input type="date" class="form-control" name="tanggal_transaksi" id="tanggal_transaksi" placeholder=""
                    value="<?= $row['tanggal_transaksi'] ?>">
            </div>

        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="guru_penerima" class="form-label">Guru Penerima</label>
                <select name="guru_penerima" class="form-select">
                    <option value="-">Pilih Guru</option>
                    <?php
                    require_once '../../config.php';
                    $sql = "SELECT * FROM guru";
                    $result = $conn->query($sql);
                    while ($rowa = $result->fetch_assoc()) {
                        ?>
                        <option value="<?= $rowa['nama_guru'] ?>" <?php if ($row['guru_penerima'] == $rowa['nama_guru'])
                              echo 'selected' ?>><?= $rowa['nama_guru'] ?></option>
                        <?php
                    }
                    ?>
                </select>
            </div>

        </div>

        <div class="row">
            <div class="col-md-12">
                <label for="keterangan" class="form-label">Keterangan</label>
                <textarea class="form-control" name="keterangan" id="keterangan"
                    placeholder="Keterangan"><?= $row['keterangan'] ?></textarea>
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
            url: 'proses.php?aksi=edit-pengeluaran',
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
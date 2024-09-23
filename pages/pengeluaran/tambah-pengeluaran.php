<form id="tambah-pengeluaran" enctype="multipart/form-data">
    <input type="hidden" name="id_pengguna" value="<?php session_start();
    echo $_SESSION['id_pengguna']; ?>">
    <div class="d-grid gap-3">
        <div class="row">
            <?php
            require_once '../../config.php';
            // generate kode pengeluaran
            $query = mysqli_query($conn, "SELECT MAX(kode_pengeluaran) AS kode_pengeluaran FROM pengeluaran");
            $data = mysqli_fetch_array($query);
            $max = $data['kode_pengeluaran'] ? substr($data['kode_pengeluaran'], 3, 3) : "000";
            $no = $max + 1;
            $char = "PG-";
            $kode = $char . sprintf("%03s", $no);
            ?>
            <div class="col-md-6">
                <label for="kode_pengeluaran" class="form-label">Kode Pemasukan</label>
                <input type="text" class="form-control" name="kode_pengeluaran" value="<?= $kode ?>" placeholder="">
            </div>
            <div class="col-md-6">
                <label for="total" class="form-label">Total</label>
                <input type="number" class="form-control" name="total" id="total" placeholder="">
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
                    while ($row = $result->fetch_assoc()) {
                        ?>
                        <option value="<?= $row['id_akun'] ?>"><?= $row['nama_akun'] ?></option>
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
                    while ($row = $result->fetch_assoc()) {
                        ?>
                        <option value="<?= $row['id_akun'] ?>"><?= $row['nama_akun'] ?></option>
                        <?php
                    }
                    ?>
                </select>
            </div>

        </div>
        <div class="row">

            <div class="col-md-6">
                <label for="" class="form-label">Tanggal Transaksi</label>
                <input type="date" class="form-control" name="tanggal_transaksi" id="tanggal_transaksi" placeholder="">
            </div>

        </div>

        <div class="row">
            <div class="col-md-12">
                <label for="keterangan" class="form-label">Keterangan</label>
                <textarea class="form-control" name="keterangan" id="keterangan" placeholder="Keterangan"></textarea>
            </div>
        </div>

    </div>
    <button type="submit" class="btn btn-primary mt-3">Simpan</button>
</form>
<script>
    $("#tambah-pengeluaran").submit(function (e) {
        var formData = new FormData(this);

        e.preventDefault();
        $.ajax({
            type: "POST",
            url: "proses.php?aksi=tambah-pengeluaran",
            data: formData,
            contentType: false,
            processData: false,
            success: function (data) {
                if (data == "ok") {
                    loadTable();
                    $('.modal').modal('hide');
                    alertify.success('Pengguna Berhasil Ditambah');

                } else {
                    alertify.error('Pengguna Gagal Ditambah');

                }
            }
        });
    });
</script>
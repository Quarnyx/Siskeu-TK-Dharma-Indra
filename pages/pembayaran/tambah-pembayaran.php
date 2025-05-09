<form id="tambah-pemasukan" enctype="multipart/form-data">
    <input type="hidden" name="id_pengguna" value="<?php session_start();
    echo $_SESSION['id_pengguna']; ?>">
    <input type="hidden" name="kode_pengguna" value="<?php
    echo $_SESSION['kode_pengguna']; ?>">
    <div class="d-grid gap-3">
        <div class="row">
            <?php
            require_once '../../config.php';
            // generate kode pemasukan
            $query = mysqli_query($conn, "SELECT MAX(kode_pemasukan) AS kode_pemasukan FROM pemasukan");
            $data = mysqli_fetch_array($query);
            $max = $data['kode_pemasukan'] ? substr($data['kode_pemasukan'], 3, 3) : "000";
            $no = $max + 1;
            $char = "PJ-";
            $kode = $char . sprintf("%03s", $no);
            ?>
            <div class="col-md-6">
                <label for="kode_pemasukan" class="form-label">Kode Pemasukan</label>
                <input type="text" class="form-control" name="kode_pemasukan" id="kode_pemasukan" value="<?= $kode ?>"
                    placeholder="">
            </div>
            <div class="col-md-6">
                <label for="total" class="form-label">Total</label>
                <input type="number" class="form-control" name="total" id="total" placeholder="">
            </div>
        </div>
        <input type="hidden" name="id_akun_debit" value="5">
        <input type="hidden" name="id_akun_kredit" value="7">
        <div class="row">
            <div class="col-md-6">
                <label for="" class="form-label">Tanggal Transaksi</label>
                <input type="date" class="form-control" name="tanggal_transaksi" id="tanggal_transaksi" placeholder="">
            </div>
            <div class="col-md-6">
                <label class="form-label">Nama Siswa</label>
                <select name="id_siswa" class="form-select">
                    <option value="-">Pilih Siswa</option>
                    <?php
                    require_once '../../config.php';
                    $sql = "SELECT * FROM siswa";
                    $result = $conn->query($sql);
                    while ($row = $result->fetch_assoc()) {
                        ?>
                        <option value="<?= $row['id_siswa'] ?>"><?= $row['nama_siswa'] ?></option>
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
                    <option value="-">Pilih Jenis Pembayaran</option>
                    <option value="SPP">SPP</option>
                    <option value="Pembangunan">Pembangunan</option>
                    <option value="Seragam">Seragam</option>
                    <option value="Porseni">Porseni</option>
                    <option value="Pembayaran Lainnya">Pembayaran Lainnya</option>
                </select>
            </div>
            <div class="col-md-3">
                <label class="form-label">Bulan Tagihan</label>
                <select name="bulan_tagihan" class="form-select">
                    <option value="-">Pilih Bulan Tagihan</option>
                    <option value="January">Januari</option>
                    <option value="February">Februari</option>
                    <option value="March">Maret</option>
                    <option value="April">April</option>
                    <option value="May">Mei</option>
                    <option value="June">Juni</option>
                    <option value="July">Juli</option>
                    <option value="August">Agustus</option>
                    <option value="September">September</option>
                    <option value="October">Oktober</option>
                    <option value="November">November</option>
                    <option value="December">Desember</option>
                </select>
            </div>
            <div class="col-md-3">
                <label class="form-label">Tahun Tagihan</label>
                <select name="tahun_tagihan" class="form-select">
                    <option value="-">Pilih Tahun Tagihan</option>
                    <option value="2022">2022</option>
                    <option value="2023">2023</option>
                    <option value="2024">2024</option>
                    <option value="2025">2025</option>
                    <option value="2026">2026</option>
                    <option value="2027">2027</option>
                    <option value="2028">2028</option>
                    <option value="2029">2029</option>
                    <option value="2030">2030</option>
                </select>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <label for="keterangan" class="form-label">Keterangan</label>
                <textarea class="form-control" name="keterangan" id="keterangan"
                    placeholder="Keterangan">Pembayaran</textarea>
            </div>
            <div class="col-md-4">
                <label for="bukti_pembayaran" class="form-label">Bukti Pembayaran</label>
                <input type="file" class="form-control" id="bukti_pembayaran" name="bukti_pembayaran">
            </div>
        </div>

    </div>
    <button type="submit" class="btn btn-primary mt-3">Simpan</button>
</form>
<script>
    $("#tambah-pemasukan").submit(function (e) {
        var formData = new FormData(this);

        e.preventDefault();
        $.ajax({
            type: "POST",
            url: "proses.php?aksi=tambah-pembayaran",
            data: formData,
            contentType: false,
            processData: false,
            success: function (data) {
                if (data == "ok") {
                    loadTable();
                    $('.modal').modal('hide');
                    alertify.success('Pembayaran Berhasil Ditambah');

                }
                if (data == "error") {
                    alertify.error('Pembayaran Gagal Ditambah');
                }
            },
            error: function () {
                alertify.error('Pembayaran Gagal Ditambah Atau Sudah Ada');
            }
        });
    });
</script>
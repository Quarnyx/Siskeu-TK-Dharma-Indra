<form id="tambah-akun" enctype="multipart/form-data">
    <div class="d-grid gap-3">
        <div>
            <label for="nama" class="form-label">Name Akun</label>
            <input type="text" class="form-control" name="nama_akun" id="nama" placeholder="Nama">
        </div>
        <div>
            <label for="kontak" class="form-label">Kode Akun</label>
            <input type="text" class="form-control" name="kode_akun" id="kontak" placeholder="Kode">
        </div>
        <div class="mb-3 row">
            <div class="col-md-6">
                <label for="" class="form-label">Jenis Akun</label>
                <select name="jenis_akun" class="form-select">
                    <?php
                    require_once '../../config.php';
                    $query = mysqli_query($conn, "SHOW COLUMNS FROM akun LIKE 'jenis_akun'");
                    $enum = explode("','", substr(mysqli_fetch_array($query)['Type'], 6, -2));
                    foreach ($enum as $key => $value) {
                        echo "<option value='$value'>$value</option>";
                    }

                    ?>
                </select>
            </div>
            <div class="col-md-6">
                <label class="form-label">Akun Wajib</label>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="wajib" id="flexRadioDefault1" value="1">
                    <label class="form-check-label" for="flexRadioDefault1">
                        Ya
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="wajib" id="flexRadioDefault2" value="0">
                    <label class="form-check-label" for="flexRadioDefault2">
                        Tidak
                    </label>
                </div>
            </div>
        </div>
    </div>
    <button type="submit" class="btn btn-primary mt-3">Simpan</button>
</form>
<script>
    $("#tambah-akun").submit(function (e) {
        var formData = new FormData(this);

        e.preventDefault();
        $.ajax({
            type: "POST",
            url: "proses.php?aksi=tambah-akun",
            data: formData,
            contentType: false,
            processData: false,
            success: function (data) {
                if (data == "ok") {
                    loadTable();
                    $('.modal').modal('hide');
                    alertify.success('Akun Berhasil Ditambah');

                } else {
                    alertify.error('Akun Gagal Ditambah');

                }
            }
        });
    });
</script>
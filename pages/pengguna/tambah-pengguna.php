<form id="tambah-pengguna" enctype="multipart/form-data">
    <div class="d-grid gap-3">
        <div class="row">
            <div class="col-md-6">
                <?php

                require_once '../../config.php';
                $query = mysqli_query($conn, "SELECT MAX(kode_pengguna) AS kode_pengguna FROM pengguna");
                $data = mysqli_fetch_array($query);
                $max = $data['kode_pengguna'] ? substr($data['kode_pengguna'], 3, 3) : "000";
                $no = $max + 1;
                $char = "TK-";
                $kode = $char . sprintf("%03s", $no);
                ?>
                <label for="kode_pengguna" class="form-label">Kode Pengguna</label>
                <input type="text" class="form-control" name="kode_pengguna" id="kode_pengguna"
                    placeholder="Kode Pengguna" value="<?= $kode ?>">
            </div>
            <div class="col-md-6">
                <label for="foto" class="form-label">Foto Pengguna</label>
                <input type="file" class="form-control" id="foto" name="foto">
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="nama" class="form-label">Nama</label>
                <input type="text" class="form-control" name="nama" id="nama" placeholder="Nama">
            </div>
            <div class="col-md-6">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" name="username" id="username" placeholder="Username">
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" name="password" id="password" placeholder="Password">
            </div>
            <div class="col-md-6">
                <label for="level" class="form-label">Level</label>
                <select class="form-select" name="level" id="level">
                    <option value="Sekretaris">Sekretaris</option>
                    <option value="Kepala Sekolah">Kepala Sekolah</option>
                    <option value="Bendahara">Bendahara</option>

                </select>
            </div>
        </div>

    </div>
    <button type="submit" class="btn btn-primary mt-3">Simpan</button>
</form>
<script>
    $("#tambah-pengguna").submit(function (e) {
        var formData = new FormData(this);

        e.preventDefault();
        $.ajax({
            type: "POST",
            url: "proses.php?aksi=tambah-pengguna",
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
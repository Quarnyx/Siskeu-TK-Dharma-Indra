<form id="tambah-siswa" enctype="multipart/form-data">
    <div class="d-grid gap-3">
        <div class="row">
            <div class="col-md-4">
                <label for="nama" class="form-label">Nama Siswa</label>
                <input type="text" class="form-control" name="nama_siswa" id="nama_siswa" placeholder="Nama Siswa">
            </div>
            <div class="col-md-4">
                <label for="nipd" class="form-label">NIPD</label>
                <input type="text" class="form-control" name="nipd" id="nipd" placeholder="NIPD">
            </div>
            <div class="col-md-4">
                <label for="jenis_kelamin" class="form-label">Jenis Kelamin</label>
                <select class="form-select" name="jenis_kelamin" id="jenis_kelamin">
                    <option value="Laki-laki">Laki-laki</option>
                    <option value="Perempuan">Perempuan</option>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <label for="kelas" class="form-label">Kelas</label>
                <input type="text" class="form-control" name="kelas" id="kelas" placeholder="Kelas">
            </div>
            <div class="col-md-4">
                <label for="tahun_masuk" class="form-label">Tahun Masuk</label>
                <input type="number" class="form-control" name="tahun_masuk" id="tahun_masuk" placeholder="Tahun Masuk">
            </div>
            <div class="col-md-4">
                <label for="foto" class="form-label">Foto Siswa</label>
                <input type="file" class="form-control" id="foto" name="foto_siswa">
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <label for="nama_ibu" class="form-label">Nama Ibu</label>
                <input type="text" class="form-control" name="nama_ibu" id="nama_ibu" placeholder="Nama Ibu">
            </div>
            <div class="col-md-4">
                <label for="nama_ayah" class="form-label">Nama Ayah</label>
                <input type="text" class="form-control" name="nama_ayah" id="nama_ayah" placeholder="Nama Ayah">
            </div>
            <div class="col-md-4">
                <label for="agama" class="form-label">Agama</label>
                <select class="form-select" name="agama" id="agama">
                    <option value="Islam">Islam</option>
                    <option value="Kristen">Kristen</option>
                    <option value="Hindu">Hindu</option>
                    <option value="Budha">Budha</option>
                    <option value="Konghucu">Konghucu</option>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="password" class="form-label">Alamat</label>
                <textarea class="form-control" name="alamat" id="alamat" placeholder="Alamat"></textarea>
            </div>
            <div class="col-md-6">
                <label for="username" class="form-label">No Telepon</label>
                <input type="text" class="form-control" name="no_telp" id="no_telp" placeholder="No Telepon">
            </div>
        </div>

    </div>
    <button type="submit" class="btn btn-primary mt-3">Simpan</button>
</form>
<script>
    $("#tambah-siswa").submit(function (e) {
        var formData = new FormData(this);

        e.preventDefault();
        $.ajax({
            type: "POST",
            url: "proses.php?aksi=tambah-siswa",
            data: formData,
            contentType: false,
            processData: false,
            success: function (data) {
                if (data == "ok") {
                    loadTable();
                    $('.modal').modal('hide');
                    alertify.success('Siswa Berhasil Ditambah');

                } else {
                    alertify.error('Siswa Gagal Ditambah');

                }
            }
        });
    });
</script>
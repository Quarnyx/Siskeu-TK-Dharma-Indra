<form id="tambah-guru" enctype="multipart/form-data">
    <div class="d-grid gap-3">
        <div class="row">
            <div class="col-md-6">
                <label for="nama" class="form-label">Nama Guru</label>
                <input type="text" class="form-control" name="nama_guru" id="nama_guru" placeholder="Nama Guru">
            </div>
            <div class="col-md-6">
                <label for="username" class="form-label">No Telepon</label>
                <input type="text" class="form-control" name="no_telp" id="no_telp" placeholder="No Telepon">
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <label for="password" class="form-label">Alamat</label>
                <textarea class="form-control" name="alamat" id="alamat" placeholder="Alamat"></textarea>
            </div>
        </div>

    </div>
    <button type="submit" class="btn btn-primary mt-3">SImpan</button>
</form>
<script>
    $("#tambah-guru").submit(function (e) {
        var formData = new FormData(this);

        e.preventDefault();
        $.ajax({
            type: "POST",
            url: "proses.php?aksi=tambah-guru",
            data: formData,
            contentType: false,
            processData: false,
            success: function (data) {
                if (data == "ok") {
                    loadTable();
                    $('.modal').modal('hide');
                    alertify.success('Guru Berhasil Ditambah');

                } else {
                    alertify.error('Guru Gagal Ditambah');

                }
            }
        });
    });
</script>
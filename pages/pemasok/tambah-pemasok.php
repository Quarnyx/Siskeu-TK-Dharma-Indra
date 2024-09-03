<form id="tambah-pemasok" enctype="multipart/form-data">
    <div class="d-grid gap-3">
        <div class="row">
            <div class="col-md-6">
                <label for="nama" class="form-label">Name Pemasok</label>
                <input type="text" class="form-control" name="nama" id="nama" placeholder="Nama">
            </div>
            <div class="col-md-6">
                <label for="kontak" class="form-label">Kontak</label>
                <input type="text" class="form-control" name="kontak" id="kontak" placeholder="kontak">
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <label for="kontak" class="form-label">Keterangan</label>
                <textarea class="form-control" name="keterangan" id="kontak" placeholder="Keterangan"></textarea>
            </div>
        </div>
    </div>
    <button type="submit" class="btn btn-primary mt-3">Simpan</button>
</form>
<script>
    $("#tambah-pemasok").submit(function (e) {
        var formData = new FormData(this);

        e.preventDefault();
        $.ajax({
            type: "POST",
            url: "proses.php?aksi=tambah-pemasok",
            data: formData,
            contentType: false,
            processData: false,
            success: function (data) {
                if (data == "ok") {
                    loadTable();
                    $('.modal').modal('hide');
                    alertify.success('Pemasok Berhasil Ditambah');

                } else {
                    alertify.error('Pemasok Gagal Ditambah');

                }
            }
        });
    });
</script>
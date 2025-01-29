<?php
include "../../config.php";
$sql = "SELECT * FROM guru WHERE id_guru = '$_POST[id]'";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
}
?>
<form id="form-edit" enctype="multipart/form-data">
    <input type="hidden" name="id" value="<?= $row['id_guru'] ?>">
    <div class="d-grid gap-3">
        <div class="row">
            <div class="col-md-6">
                <label for="nama" class="form-label">Nama Guru</label>
                <input type="text" class="form-control" name="nama_guru" id="nama_guru" placeholder="Nama Guru"
                    value="<?= $row['nama_guru'] ?>">
            </div>
            <div class="col-md-6">
                <label for="username" class="form-label">No Telepon</label>
                <input type="text" class="form-control" name="no_telp" id="no_telp" placeholder="No Telepon"
                    value="<?= $row['no_telp'] ?>">
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <label for="password" class="form-label">Alamat</label>
                <textarea class="form-control" name="alamat" id="alamat"
                    placeholder="Alamat"><?= $row['alamat'] ?></textarea>
            </div>
        </div>

        <button type="submit" class="btn btn-primary mt-3">SImpan</button>
</form>
<script>
    $("#form-edit").submit(function (e) {
        e.preventDefault();
        var formData = new FormData(this);
        $.ajax({
            type: 'POST',
            url: 'proses.php?aksi=edit-guru',
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
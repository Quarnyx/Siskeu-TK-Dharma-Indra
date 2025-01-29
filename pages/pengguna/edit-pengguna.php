<?php
include "../../config.php";
$sql = "SELECT * FROM pengguna WHERE id_pengguna = '$_POST[id]'";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
}
?>
<form id="form-edit" enctype="multipart/form-data">
    <input type="hidden" name="id" value="<?= $row['id_pengguna'] ?>">
    <div class="d-grid gap-3">
        <div>
            <label for="nama" class="form-label">Nama</label>
            <input type="text" class="form-control " name="nama" id="nama" placeholder="Nama"
                value="<?= $row['nama'] ?>">
        </div>
        <div>
            <label for="username" class="form-label">Username</label>
            <input type="text" class="form-control " name="username" id="username" placeholder="Username"
                value="<?= $row['username'] ?>">
        </div>

        <button type="submit" class="btn btn-primary mt-3">SImpan</button>
</form>
<script>
    $("#form-edit").submit(function (e) {
        e.preventDefault();
        var formData = new FormData(this);
        $.ajax({
            type: 'POST',
            url: 'proses.php?aksi=edit-pengguna',
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
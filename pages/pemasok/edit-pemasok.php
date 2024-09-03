<?php
include "../../config.php";
$sql = "SELECT * FROM pemasok WHERE id_pemasok = '$_POST[id]'";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
}
?>
<form id="form-edit" enctype="multipart/form-data">
    <input type="hidden" name="id" value="<?= $row['id_pemasok'] ?>">
    <div class="d-grid gap-3">
        <div class="row">
            <div class="col-md-6">
                <label for="nama" class="form-label">Name Pemasok</label>
                <input type="text" class="form-control" name="nama" id="nama" placeholder="Nama"
                    value="<?= $row['nama'] ?>">
            </div>
            <div class="col-md-6">
                <label for="kontak" class="form-label">Kontak</label>
                <input type="text" class="form-control" name="kontak" id="kontak" placeholder="kontak"
                    value="<?= $row['kontak'] ?>">
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <label for="kontak" class="form-label">Keterangan</label>
                <textarea class="form-control" name="keterangan" id="kontak"
                    placeholder="Keterangan"><?= $row['keterangan'] ?></textarea>
            </div>
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
            url: 'proses.php?aksi=edit-pemasok',
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
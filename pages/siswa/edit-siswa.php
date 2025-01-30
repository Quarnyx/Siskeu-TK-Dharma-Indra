<?php
include "../../config.php";
$sql = "SELECT * FROM siswa WHERE id_siswa = '$_POST[id]'";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
}
?>
<form id="form-edit" enctype="multipart/form-data">
    <input type="hidden" name="id" value="<?= $row['id_siswa'] ?>">
    <div class="d-grid gap-3">
        <div class="row">
            <div class="col-md-6">
                <label for="nama" class="form-label">Nama Siswa</label>
                <input type="text" class="form-control" name="nama_siswa" id="nama_siswa" placeholder="Nama Siswa"
                    value="<?= $row['nama_siswa'] ?>">
            </div>
            <div class="col-md-6">
                <label for="nisn" class="form-label">NISN</label>
                <input type="text" class="form-control" name="nisn" id="nisn" placeholder="NISN"
                    value="<?= $row['nisn'] ?>">
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="kelas" class="form-label">Kelas</label>
                <input type="text" class="form-control" name="kelas" id="kelas" placeholder="Kelas"
                    value="<?= $row['kelas'] ?>">
            </div>
            <div class="col-md-6">
                <label for="tahun_masuk" class="form-label">Tahun Masuk</label>
                <input type="number" class="form-control" name="tahun_masuk" id="tahun_masuk" placeholder="Tahun Masuk"
                    value="<?= $row['tahun_masuk'] ?>">
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="nama_ibu" class="form-label">Nama Ibu</label>
                <input type="text" class="form-control" name="nama_ibu" id="nama_ibu" placeholder="Nama Ibu"
                    value="<?= $row['nama_ibu'] ?>">
            </div>
            <div class="col-md-6">
                <label for="nama_ayah" class="form-label">Nama Ayah</label>
                <input type="text" class="form-control" name="nama_ayah" id="nama_ayah" placeholder="Nama Ayah"
                    value="<?= $row['nama_ayah'] ?>">
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="password" class="form-label">Alamat</label>
                <textarea class="form-control" name="alamat" id="alamat"
                    placeholder="Alamat"><?php echo $row['alamat'] ?></textarea>
            </div>
            <div class="col-md-6">
                <label for="username" class="form-label">No Telepon</label>
                <input type="text" class="form-control" name="no_telp" id="no_telp" placeholder="No Telepon"
                    value="<?= $row['no_telp'] ?>">
            </div>
        </div>

        <button type="submit" class="btn btn-primary mt-3">Simpan</button>
</form>
<script>
    $("#form-edit").submit(function (e) {
        e.preventDefault();
        var formData = new FormData(this);
        $.ajax({
            type: 'POST',
            url: 'proses.php?aksi=edit-siswa',
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
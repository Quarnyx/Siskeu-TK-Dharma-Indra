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
                <label for="jk" class="form-label">Jenis Kelamin</label> </br>
                <input type="radio" name="jk" value="Laki-Laki" <?php if ($row['jk'] =='Laki-Laki' )
                echo   "checked" ; ?>> Laki-Laki  </br>
                <input type="radio" name="jk" value="Perempuan" <?php if ($row['jk'] =='Perempuan' )
                echo  "checked"; ?>> Perempuan
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="username" class="form-label">No Telepon</label>
                <input type="text" class="form-control" name="no_telp" id="no_telp" placeholder="No Telepon"
                    value="<?= $row['no_telp'] ?>">
            </div>
            <div class="col-md-6">
                <label for="agama" class="form-label">Agama</label> </br>
                <input type="radio" name="agama_guru" value="Islam" <?php if ($row['agama_guru'] =='Islam' )
                echo   "checked" ; ?>> Islam  
                <input type="radio" name="agama_guru" value="Kristen" <?php if ($row['agama_guru'] =='Kristen' )
                echo  "checked"; ?>> Kristen 
                <input type="radio" name="agama_guru" value="Hindu" <?php if ($row['agama_guru'] =='Hindu' )
                echo  "checked"; ?>> Hindu </br>
                <input type="radio" name="agama_guru" value="Budha" <?php if ($row['agama_guru'] =='Budha' )
                echo  "checked"; ?>> Budha
                <input type="radio" name="agama_guru" value="Konghucu" <?php if ($row['agama_guru'] =='Konghucu' )
                echo  "checked"; ?>> Konghucu
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="password" class="form-label">Alamat</label>
                <textarea class="form-control" name="alamat" id="alamat"
                    placeholder="Alamat"><?= $row['alamat'] ?></textarea>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4">
                                <img src="pages/guru/foto-guru/<?= $row['foto_guru'] ?>" width="100px"
                                    height="100px" class="img">
                            </div>
                            <div class="col-md-8">
                                <label for="foto" class="form-label">Ganti Foto Guru</label>
                                <input type="file" class="form-control" id="foto" name="foto_guru">
                            </div>
                        </div>
                    </div>
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
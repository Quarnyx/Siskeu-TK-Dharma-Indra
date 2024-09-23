<?php
include "../../config.php";
$sql = "SELECT * FROM akun WHERE id_akun = '$_POST[id]'";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
}
?>
<form id="form-edit" enctype="multipart/form-data">
    <input type="hidden" name="id" value="<?= $row['id_akun'] ?>">
    <div class="d-grid gap-3">
        <div>
            <label for="nama" class="form-label">Nama Akun Baru</label>
            <input type="text" class="form-control" name="nama_akun" id="nama" placeholder=""
                value="<?= $row['nama_akun'] ?>">
        </div>
        <div>
            <label for="kontak" class="form-label">Kode Akun</label>
            <input type="text" class="form-control" name="kode_akun" id="kontak" placeholder=""
                value="<?= $row['kode_akun'] ?>">
        </div>
        <div>
            <label for="" class="form-label">Jenis Akun</label>
            <select name="jenis_akun" class="form-select">
                <?php
                require_once '../../config.php';
                $query = mysqli_query($conn, "SHOW COLUMNS FROM akun LIKE 'jenis_akun'");
                $enum = explode("','", substr(mysqli_fetch_array($query)['Type'], 6, -2));
                foreach ($enum as $key => $value) {
                    echo "<option value='$value'" . ($value == $row['jenis_akun'] ? 'selected' : '') . ">$value</option>";
                }

                ?>
            </select>
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
            url: 'proses.php?aksi=edit-akun',
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
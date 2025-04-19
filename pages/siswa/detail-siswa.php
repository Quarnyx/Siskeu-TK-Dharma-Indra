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
            <div class="col-md-4">
                <label for="nama" class="form-label">Nama Siswa</label>
                <input type="text" class="form-control" name="nama_siswa" id="nama_siswa" placeholder="Nama Siswa"
                    value="<?= $row['nama_siswa'] ?>" disabled>
            </div>
            <div class="col-md-4">
                <label for="nisn" class="form-label">NISN</label>
                <input type="text" class="form-control" name="nisn" id="nisn" placeholder="NISN"
                    value="<?= $row['nisn'] ?>" disabled>
            </div>
            <div class="col-md-4">
                <label for="jenis_kelamin" class="form-label">Jenis Kelamin</label>
                <input type="text" class="form-control" name="jenis_kelamin" id="jenis_kelamin"
                    placeholder="Jenis Kelamin" value="<?= $row['jenis_kelamin'] ?>" disabled>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8">
                <div class="mb-3">
                    <label for="kelas" class="form-label">Kelas</label>
                    <input type="text" class="form-control" name="kelas" id="kelas" placeholder="Kelas"
                        value="<?= $row['kelas'] ?>">
                </div>
                <div class="mb-3">
                    <label for="tahun_masuk" class="form-label">Tahun Masuk</label>
                    <input type="number" class="form-control" name="tahun_masuk" id="tahun_masuk"
                        placeholder="Tahun Masuk" value="<?= $row['tahun_masuk'] ?>">
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4">
                                <img src="pages/siswa/foto-siswa/<?= $row['foto_siswa'] ?>" width="100px" height="100px"
                                    class="img">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <label for="nama_ibu" class="form-label">Nama Ibu</label>
                <input type="text" class="form-control" name="nama_ibu" id="nama_ibu" placeholder="Nama Ibu"
                    value="<?= $row['nama_ibu'] ?>" disabled>
            </div>
            <div class="col-md-4">
                <label for="nama_ayah" class="form-label">Nama Ayah</label>
                <input type="text" class="form-control" name="nama_ayah" id="nama_ayah" placeholder="Nama Ayah"
                    value="<?= $row['nama_ayah'] ?>" disabled>
            </div>
            <div class="col-md-4">
                <label for="agama" class="form-label">Agama</label>
                <select class="form-select" name="agama" id="agama" disabled>
                    <option value="Islam" <?php if ($row['agama'] == "Islam")
                        echo "selected"; ?>>Islam</option>
                    <option value="Kristen" <?php if ($row['agama'] == "Kristen")
                        echo "selected"; ?>>Kristen</option>
                    <option value="Hindu" <?php if ($row['agama'] == "Hindu")
                        echo "selected"; ?>>Hindu</option>
                    <option value="Budha" <?php if ($row['agama'] == "Budha")
                        echo "selected"; ?>>Budha</option>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="password" class="form-label">Alamat</label>
                <textarea class="form-control" name="alamat" id="alamat" placeholder="Alamat"
                    disabled><?php echo $row['alamat'] ?></textarea>
            </div>
            <div class="col-md-6">
                <label for="username" class="form-label">No Telepon</label>
                <input type="text" class="form-control" name="no_telp" id="no_telp" placeholder="No Telepon"
                    value="<?= $row['no_telp'] ?>" disabled>
            </div>
        </div>
</form>
<script>

</script>
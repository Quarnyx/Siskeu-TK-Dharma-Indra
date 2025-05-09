<table id="table-data" class="table table-bordered table-striped">
    <thead>
        <tr>
            <th>No</th>
            <th>NIPD</th>
            <th>Nama</th>
            <th>Jenis Kelamin</th>
            <th>Kelas</th>
            <th>Tahun Masuk</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php
        require_once '../../config.php';
        $no = 1;
        $sql = "SELECT * FROM siswa";
        $result = $conn->query($sql);
        while ($row = $result->fetch_assoc()) {
            ?>
            <tr>
                <td><?= $no++ ?></td>
                <td><?= $row['nipd'] ?></td>
                <td><?= $row['nama_siswa'] ?></td>
                <td><?= $row['jenis_kelamin'] ?></td>
                <td><?= $row['kelas'] ?></td>
                <td><?= $row['tahun_masuk'] ?></td>
                <td>
                    <button id="edit" data-nama="<?= $row['nama_siswa'] ?>" data-id="<?= $row['id_siswa'] ?>"
                        class="btn btn-primary btn-sm">Edit</button>
                    <button id="delete" data-nama="<?= $row['nama_siswa'] ?>" data-id="<?= $row['id_siswa'] ?>"
                        class="btn btn-danger btn-sm">Hapus</button>
                    <button id="detail" data-nama="<?= $row['nama_siswa'] ?>" data-id="<?= $row['id_siswa'] ?>"
                        class="btn btn-info btn-sm">Detail</button>

                </td>
            </tr>
            <?php
        }
        ?>
    </tbody>
</table>
<script>

    $(document).ready(function () {
        $('#table-data').DataTable();
        $('#table-data').on('click', '#edit', function () {
            const id = $(this).data('id');
            const nama = $(this).data('nama');
            $.ajax({
                type: 'POST',
                url: 'pages/siswa/edit-siswa.php',
                data: 'id=' + id + '&nama=' + nama,
                success: function (data) {
                    $('.modal').modal('show');
                    $('.modal-title').html('Edit Data ' + nama);
                    $('.modal .modal-body').html(data);
                }
            })
        });

        $('#table-data').on('click', '#detail', function () {
            const id = $(this).data('id');
            const nama = $(this).data('nama');
            $.ajax({
                type: 'POST',
                url: 'pages/siswa/detail-siswa.php',
                data: 'id=' + id + '&nama=' + nama,
                success: function (data) {
                    $('.modal').modal('show');
                    $('.modal-title').html('Detail Data ' + nama);
                    $('.modal .modal-body').html(data);
                }
            })
        });

        $('#table-data').on('click', '#delete', function () {
            const id = $(this).data('id');
            const nama = $(this).data('nama');
            alertify.confirm('Hapus', 'Apakah anda yakin ingin menghapus data ' + nama + '?', function () {
                $.ajax({
                    type: 'POST',
                    url: 'proses.php?aksi=hapus-siswa',
                    data: 'id=' + id,
                    success: function (data) {
                        if (data == "ok") {
                            loadTable();
                            $('.modal').modal('hide');
                            alertify.success('Siswa Berhasil Dihapus');

                        } else {
                            alertify.error('Siswa Gagal Dihapus');

                        }
                    },
                    error: function (data) {
                        alertify.error(data);
                    }
                })
            }, function () {
                alertify.error('Hapus dibatalkan');
            })
        });
    });
</script>
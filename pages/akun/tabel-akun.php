<table id="table-data" class="table table-bordered table-striped">
    <thead>
        <tr>
            <th>#</th>
            <th>Kode Akun</th>
            <th>Nama Akun</th>
            <th>Jenis Akun</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php
        require_once '../../config.php';
        $no = 1;
        $sql = "SELECT * FROM akun ORDER BY kode_akun ASC";
        $result = $conn->query($sql);
        while ($row = $result->fetch_assoc()) {
            ?>
            <tr>
                <td><?= $no++ ?></td>
                <td><?= $row['kode_akun'] ?></td>
                <td><?= $row['nama_akun'] ?></td>
                <td><?= $row['jenis_akun'] ?></td>
                <td>
                    <?php
                    if ($row['wajib'] != 1) { {
                        }
                        ?>
                        <button id="delete" data-nama="<?= $row['nama_akun'] ?>" data-id="<?= $row['id_akun'] ?>"
                            class="btn btn-danger btn-sm">Hapus</button>
                    <?php } ?>

                    <button id="edit" data-nama="<?= $row['nama_akun'] ?>" data-id="<?= $row['id_akun'] ?>"
                        class="btn btn-primary btn-sm">Edit</button>
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
                url: 'pages/akun/edit-akun.php',
                data: 'id=' + id + '&nama=' + nama,
                success: function (data) {
                    $('.modal').modal('show');
                    $('.modal-title').html('Edit Data ' + nama);
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
                    url: 'proses.php?aksi=hapus-akun',
                    data: 'id=' + id,
                    success: function (data) {
                        if (data == "ok") {
                            loadTable();
                            $('.modal').modal('hide');
                            alertify.success('Akun Berhasil Dihapus');

                        } else {
                            alertify.error('Akun Gagal Dihapus');

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
<table id="table-data" class="table table-bordered table-striped">
    <thead>
        <tr>
            <th>#</th>
            <th>Kode</th>
            <th>Keterangan</th>
            <th>Tanggal</th>
            <th>Total</th>
            <th>Pengguna</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php
        require_once '../../config.php';
        $no = 1;
        $sql = "SELECT
                    pemasukan.*, 
                    pengguna.nama
                FROM
                    pemasukan
                    INNER JOIN
                    pengguna
                    ON 
                        pemasukan.id_pengguna = pengguna.id_pengguna";
        $result = $conn->query($sql);
        while ($row = $result->fetch_assoc()) {
            ?>
            <tr>
                <td><?= $no++ ?></td>
                <td><?= $row['kode_pemasukan'] ?></td>
                <td><?= $row['keterangan'] ?></td>
                <td><?= $row['tanggal_transaksi'] ?></td>
                <td><?= "Rp. " . number_format($row['total'], 0, ',', '.') ?></td>
                <td><?= $row['nama'] ?></td>
                <td>
                    <button id="edit" data-nama="<?= $row['kode_pemasukan'] ?>" data-id="<?= $row['id_pemasukan'] ?>"
                        class="btn btn-primary btn-sm">Edit</button>
                    <button id="delete" data-nama="<?= $row['kode_pemasukan'] ?>" data-id="<?= $row['id_pemasukan'] ?>"
                        class="btn btn-danger btn-sm">Hapus</button>

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
                url: 'pages/pemasukan/edit-pemasukan.php',
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
                    url: 'proses.php?aksi=hapus-pemasukan',
                    data: 'id=' + id + '&kode=' + nama,
                    success: function (data) {
                        if (data == "ok") {
                            loadTable();
                            $('.modal').modal('hide');
                            alertify.success('Pemasukan Berhasil Dihapus');

                        } else {
                            alertify.error('Pemasukan Gagal Dihapus');

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
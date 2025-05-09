<table id="table-data" class="table table-bordered table-striped">
    <thead>
        <tr>
            <th>No</th>
            <th>Jenis Pembayaran</th>
            <th>Siswa</th>
            <th>Jumlah</th>
            <th>Tanggal Pembayaran</th>
            <th>Bulan Tagihan</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php
        require_once '../../config.php';
        $no = 1;
        $sql = "SELECT
	               pembayaran.*, 
                   siswa.nama_siswa,
                   siswa.kelas
                FROM
	               pembayaran
	               INNER JOIN
	               siswa
	               ON 
		              pembayaran.id_siswa = siswa.id_siswa";
        $result = $conn->query($sql);
        while ($row = $result->fetch_assoc()) {
            ?>
            <tr>
                <td><?= $no++ ?></td>
                <td><?= $row['jenis_pembayaran'] ?></td>
                <td><?= $row['nama_siswa'] . " - " . $row['kelas'] ?></td>
                <td><?= "Rp. " . number_format($row['jumlah'], 0, ',', '.') ?></td>
                <td><?= $row['tanggal_pembayaran'] ?></td>
                <td><?= $row['bulan_tagihan'] ?> - <?= $row['tahun_tagihan'] ?></td>
                <td>
                    <button id="edit" data-nama="<?= $row['kode_pemasukan'] ?>" data-id="<?= $row['kode_pemasukan'] ?>"
                        class="btn btn-primary btn-sm">Edit</button>
                    <button id="delete" data-nama="<?= $row['kode_pemasukan'] ?>" data-id="<?= $row['id_pembayaran'] ?>"
                        class="btn btn-danger btn-sm">Hapus</button>
                    <?php if ($row['bukti_pembayaran'] != null) { ?>
                        <a target="_blank" href="pages/pembayaran/bukti-pembayaran/<?= $row['bukti_pembayaran'] ?>"
                            data-id="<?= $row['id_pembayaran'] ?>" class="btn btn-success btn-sm">Download Bukti</a>
                    <?php } ?>
                    <a target="_blank" href="pages/pembayaran/cetak-bukti-pembayaran.php?id=<?= $row['kode_pemasukan'] ?>"
                        data-id="<?= $row['id_pembayaran'] ?>" class="btn btn-info btn-sm">Cetak Bukti</a>


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
                url: 'pages/pembayaran/edit-pembayaran.php',
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
                    url: 'proses.php?aksi=hapus-pembayaran',
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
<?php
$id = $_REQUEST['id'];
$model = new DataPelanggan();
$pelanggan = $model->getPelanggan($id);

?>

<div>
    <h3>Kode : <?= $pelanggan['kode'] ?></h3>
    <h3>Nama Pelanggan : <?= $pelanggan['nama'] ?></h3>
    <h3>Jenis Kelamin : <?= $pelanggan['jk'] ?></h3>
    <h3>Tempat Lahir : <?= $pelanggan['tmp_lahir'] ?></h3>
    <h3>Tanggal Lahir : <?= $pelanggan['tgl_lahir'] ?></h3>
    <h3>Email : <?= $pelanggan['email'] ?></h3>
    <h3>Kartu ID : <?= $pelanggan['kartu_id'] ?></h3>
</div>
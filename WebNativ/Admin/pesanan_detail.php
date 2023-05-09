<?php
$id = $_REQUEST['id'];
$model = new DataPesanan();
$pesanan = $model->getPesanan($id);

?>

<div>
    <h3>Tanggal Pesanan : <?= $pesanan['tanggal'] ?></h3>
    <h3>Total Pesanan : <?= $pesanan['total'] ?></h3>
    <h3>Pelanggan ID : <?= $pesanan['pelanggan_id'] ?></h3>
    <h3>Status Pembayaran : <?= $pesanan['status_pembayaran'] ?></h3>
</div>
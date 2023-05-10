<?php
$id = $_REQUEST['id'];
$model = new DataPesanan();
$pesanan = $model->getPesanan($id);

?>
<br>
<h1 class="mt-4">Pesanan Detail</h1>
<div class="card-body">
    <div class="card mb-4">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Tanggal</th>
                                            <th>Total</th>
                                            <th>Pelanggan ID</th>
                                            <th>Status Pembayaran</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><?= $pesanan['tanggal'] ?></td>
                                            <td><?= $pesanan['total']?></td>
                                            <td><?= $pesanan['pelanggan_id']?></td>
                                            <td><?= $pesanan['status_pembayaran']?></td>
  
                                        </tr>
                                    </tbody>
                                    </table>
</div>
</div>

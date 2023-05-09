<?php
$id = $_REQUEST['id'];
$model = new DataKartu();
$kartu = $model->getKartu($id);

?>
<br>
<div>
    <h3>Kode : <?= $kartu['kode'] ?></h3>
    <h3>Nama : <?= $kartu['nama'] ?></h3>
    <h3>Diskon : <?= $kartu['diskon'] ?></h3>
    <h3>Iuran : <?= $kartu['iuran'] ?></h3>
</div>
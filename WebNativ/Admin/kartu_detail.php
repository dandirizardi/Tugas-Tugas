<?php
$id = $_REQUEST['id'];
$model = new DataKartu();
$kartu = $model->getKartu($id);

?>

<div>
    <h3><?= $kartu['nama'] ?></h3>
</div>
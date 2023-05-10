<?php
$id = $_REQUEST['id'];
$model = new DataKartu();
$kartu = $model->getKartu($id);

?>
<br>
<h1 class="mt-4">Kartu Detail</h1>
<div class="card-body">
    <div class="card mb-4">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Kode</th>
                                            <th>Nama</th>
                                            <th>Diskon</th>
                                            <th>Iuran</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><?= $kartu['kode'] ?></td>
                                            <td><?= $kartu['nama']?></td>
                                            <td><?= $kartu['diskon']?></td>
                                            <td><?= $kartu['iuran']?></td>
  
                                        </tr>
                                    </tbody>
                                    </table>
</div>
</div>

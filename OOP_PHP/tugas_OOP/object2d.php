<?php 
require_once 'Lingkaran.php';
require_once 'PersegiPanjang.php';
require_once 'Segitiga.php';

$lingkaran = new lingkaran (15);
$persegiP = new persegipanjang (30,10);
$segitiga = new segitiga (10,17,20);

$bentuk2D = array($lingkaran,$persegiP,$segitiga);

echo"<table width='50%' border='2' bgcolor='beige' style='text-align:center; margin-left:23%;'>
        <h1 style='text-align:center;'>Bangun Datar</h1>
        <tr bgcolor=#deb887>
            <th>Nama Bidang</th>
            <th>Luas Bidang</th>
            <th>Keliling Bidang</th>
        </tr>";

        foreach ($bentuk2D as $cetak) {
            echo"<tr>";
            echo"<td>".$cetak->NamaBidang();
            echo"<td>".$cetak->LuasBidang();
            echo"<td>".$cetak->KelilingBidang();
        }
?>
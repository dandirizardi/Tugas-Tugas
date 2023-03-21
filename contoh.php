<?php

echo 'hallo world';

//ini pemanggil di php

//belajar var

$namaSiswa = "Dandi";
$umur = 20;
$berat_badan = 46;
$_pekerjaan = "Mahasiswa";
$test = "coba";

echo '<hr>';
echo 'Nama Mahasiswa : '.$namaSiswa;
echo '<br> Umur : '.$umur;
echo '<br> Berat Badan : '.$berat_badan;
echo '<br> Pekerjaan : '.$_pekerjaan;

?>

<hr>
Nama Siswa : <?= $namaSiswa ?>
<br> Umur : <?= $umur ?>
<br> Berat Badan : <?= $berat_badan ?>
<br> Pekerjaan : <?= $_pekerjaan ?>
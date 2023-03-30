<?php 
require 'Pegawai.php';

$pegawai1 = new Pegawai('01111','Andi','Manager','Kristen','Menikah');
$pegawai2 = new Pegawai('01112','Figo','Manager','Islam','Lajang');
$pegawai3 = new Pegawai('01113','Ferdi','Asisten Manager','Islam','Menikah');
$pegawai4 = new Pegawai('01114','Jaka','Asisten Manager','Islam','Lajang');
$pegawai5 = new Pegawai('01115','Dandy','Manager','Islam','Lajang');


$ar_pegawai = [$pegawai1,$pegawai2,$pegawai3,$pegawai4,$pegawai5];

foreach($ar_pegawai as $pegawai){
    $pegawai->cetak();
}

?>
<?php 
require_once 'Dosen.php';
require_once 'Mahasiswa.php';
require_once 'Staff.php';
//obek nya

//dosen
$d1 = new Dosen ('Budi','L','1111','M.Kom');
$d2 = new Dosen ('Andi','L','1112','M.Kom');

//mahasiswa
$m1 = new Mahasiswa('Ali','L','02221','Teknik Informatika');
$m2 = new Mahasiswa('Siti','P','02222','Teknik Informatika');

//staff
$s = new Staff('Ari','L','01120','Staff Marketing','2000000');


$ar_data = [$d1,$d2,$m1,$m2,$s];

foreach ($ar_data as $data){
    $data->cetak();
}

?>
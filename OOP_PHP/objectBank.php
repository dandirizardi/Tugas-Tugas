<?php 
require 'Bank.php';
//object

$n1 = new Bank('001','Siti','30000000');
$n2 = new Bank('002','Andi','40000000');
$n3 = new Bank('003','Ari','50000000');
$n4 = new Bank('004','Bayu','6000000000');
$n5 = new Bank('005','Indri','70000000');
$n6 = new Bank('006','Ayu','65000000');


$n1->ambil(2000000);
$n1->setor(3000000);
$n2->setor(3000000);
$dataNasabah = array($n1,$n2,$n3,$n4,$n5,$n6);
foreach ($dataNasabah as $nasabah){
    $nasabah->cetak();
}
echo '<br>Jumlah Nasabah '.Bank::$jml.' Orang';


?>
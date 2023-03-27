<?php 

//jika tidak menggunakan looping
echo 'Bilangan 1';
echo '<br> Bilangan 2';
echo '<hr>';

//menggunakan looping increment
for($x=1; $x <= 10; $x++){
    echo '<br> Bilangan '.$x;
}
echo'<br>';
//menggunakan looping decrement
for($a=10; $a >= 1; $a--){
    echo '<br>Angka '.$a;
}

//looping menggunkan while

echo'<hr> looping menggunkan while <br>';
$xz=1;
while($xz <= 5){
    echo '<br> Bilangan'.$xz;
    $xz++;
}
echo'<br>';
$yz=5;
while($yz >= 1){
    echo '<br> Bilangan'.$yz;
    $yz--;
}

echo'<br>';
//contoh do shile
$d=1;
do{
    echo'<br>'.$d;
    $d++;
}
while($d<=10);

?>
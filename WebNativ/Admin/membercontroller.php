<?php 
session_start();
include_once 'koneksi.php';
include_once 'models/Member.php';

$username = $_POST ['username'];
$password = $_POST ['password'];

$data = [
    $username,
    $password
];

$model = new Member();
$rs = $model->ceklogin($data);
if(!empty($rs)){
    $_SESSION['MEMBER'] = $rs;
    header('Location:http://localhost:8888/WebNativ/Admin/index.php?url=product');
}
else {
    echo '<script> Alert("User/Password anda salah");history.back();</script>';
}

?>
<?php
include_once 'koneksi.php';
include_once 'models/Data_Pelanggan.php';

//step pertama yaitu menangkap request form
$kode = $_POST['kode'];
$nama = $_POST['nama'];
$jk = $_POST['jk'];
$tmp_lahir = $_POST['tmp_lahir'];
$tgl_lahir = $_POST['tgl_lahir'];
$email = $_POST['email'];
$kartu_id = $_POST['kartu_id'];

//penangkapan from diatas dijadikan array
$data = [
    $kode,
    $nama,
    $jk,
    $tmp_lahir,
    $tgl_lahir,
    $email,
    $kartu_id

];
$model = new DataPelanggan();
$tombol = $_REQUEST['proses'];
switch($tombol){
    case 'simpan':$model->simpan($data); break;
    case 'ubah':
        $data[]= $_POST['idx']; $model->ubah($data);break;
    default:
    header('Location:index.php?url=data_pelanggan');
    break;
}
header('Location:index.php?url=data_pelanggan');
?>
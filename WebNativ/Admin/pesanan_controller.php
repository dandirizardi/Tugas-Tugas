<?php
include_once 'koneksi.php';
include_once 'models/Data_Pesanan.php';

//step pertama yaitu menangkap request form
$tanggal = $_POST['tanggal'];
$total = $_POST['total'];
$pelanggan_id = $_POST['pelanggan_id'];


//penangkapan from diatas dijadikan array
$data = [
    $tanggal,
    $total,
    $pelanggan_id


];
$model = new DataPesanan();
$tombol = $_REQUEST['proses'];
switch($tombol){
    case 'simpan':$model->simpan($data); break;
    case 'ubah':
        $data[]= $_POST['idx']; $model->ubah($data);break;
    case 'hapus':
        unset($data); $model->hapus($_POST['idx']); break;
    default:
    header('Location:index.php?url=data_pesanan');
    break;
}
header('Location:index.php?url=data_pesanan');
?>
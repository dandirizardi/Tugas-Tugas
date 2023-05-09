<?php 
class DataKartu {
    private $koneksi;
    public function __construct(){
        global $dbh;
        $this->koneksi = $dbh;
    }
    public function DataKartu(){
        $sql = "SELECT * FROM kartu";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute();
        $rs = $ps->fetchAll();
        return $rs;
    }

    public function getKartu($id){
        $sql = "SELECT kartu.*, pelanggan.nama as kategori FROM kartu INNER JOIN
        pelanggan ON kartu.id = pelanggan.kartu_id WHERE kartu.id = ?";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute([$id]);
        $rs = $ps->fetch();
        return $rs;
    }

    public function simpan($data){
        $sql = "INSERT INTO kartu(kode, nama, diskon, iuran)
        VALUES (?,?,?,?)";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute($data);
    }

}

?>
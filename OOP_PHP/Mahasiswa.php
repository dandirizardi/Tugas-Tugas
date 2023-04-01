<?php
require_once 'person.php';

class Mahasiswa extends person{
    public $smester;
    public $jurusan;
    public function __construct($nama,$gender,$smester,$jurusan){
        parent::__construct($nama,$gender);
        $this->smester = $smester;
        $this->jurusan = $jurusan;
    }
    public function cetak(){
        parent::cetak();
        echo '<br>Smester : '.$this->smester;
        echo '<br>Jurusan : '.$this->jurusan;
        echo '<hr>';
    }
}


?>
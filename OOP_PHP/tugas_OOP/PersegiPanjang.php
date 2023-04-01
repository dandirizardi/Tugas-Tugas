<?php 
require_once 'abstract1.php';
class PersegiPanjang extends Bentuk2D {
    public $panjang;
    public $lebar;

    public function __construct($panjang,$lebar){
        $this->panjang = $panjang;
        $this->lebar = $lebar;
    }

    public function NamaBidang(){
        return "<br>Persegi Panjang";
    }

    public function LuasBidang(){
        $luas = $this->panjang * $this->lebar;
        return $luas;
    }

    public function KelilingBidang(){
        $keliling = 2 * ($this->panjang * $this->lebar);
        return $keliling;
    }

}


?>
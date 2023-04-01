<?php 
require_once 'abstract1.php';
class Segitiga extends Bentuk2D {
    public $alas;
    public $tinggi;
    public $sisi;

    public function __construct($alas,$tinggi,$sisi){
        $this->alas = $alas;
        $this->tinggi = $tinggi;
        $this->sisi = $sisi;
    }

    public function NamaBidang(){
        return "<br>Segitiga Sama Kaki";
    }

    public function LuasBidang(){
        $luas = 0.5 * $this->alas * $this->tinggi;
        return $luas;
    }

    public function KelilingBidang(){
        $keliling = $this->alas + $this->sisi + $this->sisi;
        return $keliling;
    }


}

?>
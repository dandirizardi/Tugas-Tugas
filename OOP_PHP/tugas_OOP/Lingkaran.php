<?php 
require_once 'abstract1.php';
class Lingkaran extends Bentuk2D {
    public $jari2;
    public function __construct($jari2){
        $this->jari2 = $jari2;
    }
    public function NamaBidang(){
        return "<br>Lingkaran";
    }
    public function LuasBidang(){
        $luas = 3.14 * $this->jari2 * $this->jari2;
        return $luas;
    }
    public function KelilingBidang(){
        $keliling = 2 * 3.14 * $this->jari2;
        return $keliling;
    }


}

?>
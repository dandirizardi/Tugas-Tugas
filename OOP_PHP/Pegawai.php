<?php 
error_reporting(0);
class Pegawai{
    protected $nip;
    public $nama;
    private $jabatan;
    private $agama;
    private $status;
    private $gaji_pokok;
    static $jml;
    const PT = 'PT. HTP Indonesia';

    public function __construct($nip,$nama,$jabatan,$agama,$status){
        $this->nip = $nip;
        $this->nama = $nama;
        $this->jabatan = $jabatan;
        $this->agama = $agama;
        $this->status = $status;
        $this->gaji_pokok = $this->setGajiPokok($jabatan);
        self::$jml++;
    }
    public function setGajiPokok($jabatan){
        switch($jabatan){
            case 'Manager' : $gapok = 15000000;break;
            case 'Asisten Manager' : $gapok = 10000000;break;
            case 'Kepala Staff' : $gapok = 7000000;break;
            case 'Staff' : $gapok = 5000000;break;
            default: $gapok;
        }
        return $gapok;
    }

    public function setTunjab(){
        return 0.2 * $this->gaji_pokok;
    }

    public function setTunkel(){
        return ($this->status == 'Menikah') ? (0.1 * $this->gaji_pokok):0;
    }


    public function setZakatMuslim(){
        if($this->agama == 'Islam' && $this->gaji_pokok > 6000000){
            return 0.025 * $this->gaji_pokok;
        }
        else{
            return 0;
        }
    }


    public function setGajiBersih(){
        return $this->gaji_pokok + $this->setTunjab() + $this->setTunkel() - $this->setZakatMuslim();

    }

    public function cetak(){
        echo '------------- REKAPAN GAJI --------------<br><br>';
        echo 'NIP Pegawai : '.$this->nip;
        echo '<br> Nama Pegawai : '.$this->nama;
        echo '<br>Jabatan : '.$this->jabatan;
        echo '<br>Agama : '.$this->agama;
        echo '<br>Status : '.$this->status;
        echo '<br><br>Gaji Pokok : Rp '.number_format($this->gaji_pokok, 0, ',', '.');
        echo '<br>Tunjangan Jabatan : Rp '.number_format($this->setTunjab(), 0, ',', '.');
        echo'<br>Tunjangan Keluarga : Rp '.number_format($this->setTunkel(), 0, ',', '.');
        echo'<br>Wajib Zakat (Bagi Muslim) : Rp '.number_format($this->setZakatMuslim(), 0, ',', '.');
        echo'<br>Gaji Bersih : Rp '.number_format($this->setGajiBersih(), 0, ',', '.');
        echo '<hr>';
    }
}

?>
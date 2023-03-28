<?php
$m1 = ['NIM'=>'01111021', 'Nama' => 'Andi', 'Nilai' => 80];
$m2 = ['NIM'=>'01111022', 'Nama' => 'Ani', 'Nilai' => 70];
$m3 = ['NIM'=>'01111023', 'Nama' => 'Ari', 'Nilai' => 60];
$m4 = ['NIM'=>'01111024', 'Nama' => 'Bani', 'Nilai' => 55];
$m5 = ['NIM'=>'01111025', 'Nama' => 'Budi', 'Nilai' => 75];
$m6 = ['NIM'=>'01111026', 'Nama' => 'Dini', 'Nilai' => 90];
$m7 = ['NIM'=>'01111027', 'Nama' => 'Putri', 'Nilai' => 98];
$m8 = ['NIM'=>'01111028', 'Nama' => 'Fasa', 'Nilai' => 85];
$m9 = ['NIM'=>'01111029', 'Nama' => 'Putri', 'Nilai' => 92];
$m10 = ['NIM'=>'01111030', 'Nama' => 'Fasa', 'Nilai' => 60];

$mahasiswa = [$m1,$m2,$m3,$m4,$m5,$m6,$m7,$m8,$m9,$m10];
$ar_judul = ['No','NIM','Nama','Nilai','Keterngan','Grade','Predikat'];

$jml_data = count($mahasiswa);
$n_max = $mahasiswa[0]['Nilai'];
$n_min = $mahasiswa[0]['Nilai'];
$total_n = 0;

foreach ($mahasiswa as $id => $nilai){
    $total_n += $nilai['Nilai'];
    if($nilai['Nilai'] < $n_min){
        $n_min = $nilai['Nilai'];
    }
    if($nilai['Nilai'] > $n_max){
        $n_max = $nilai['Nilai'];
    }
}

$rata2 = $total_n/$jml_data;
$keterangan = [
    'Jumlah Mahasiswa' => $jml_data,
    'Nilai Tertinggi' => $n_max,
    'Nilai Terendah' => $n_min,
    'Rata-Rata Nilai' => $rata2

]


?>
<h1 style="text-align: center;">Data Mahasiswa</h1>
<table border="1px" width="100%" bgcolor="beige" style="text-align:center">
    <thead>
    <tr bgcolor=#deb887>
            <?php 
                foreach ($ar_judul as $judul){
            ?>
                <th><?= $judul ?></th>
                
             <?php }?>
        </tr>
    </thead>

    <tbody>
        <?php 
            $no = 1;
            foreach($mahasiswa as $mhs){ 
            $ket = ($mhs['Nilai']>= 60)? 'Lulus' : 'Tidak Lulus';
            //grade
            if($mhs ['Nilai'] >=  85 && $mhs['Nilai'] <= 100) $grade = 'A';
            else if($mhs ['Nilai'] >=  75 && $mhs['Nilai'] <= 80) $grade = 'B';
            else if($mhs ['Nilai'] >=  60 && $mhs['Nilai'] <= 74) $grade = 'C';
            else if($mhs ['Nilai'] >=  30 && $mhs['Nilai'] <= 59) $grade = 'D';
            else if($mhs ['Nilai'] >=  0 && $mhs['Nilai'] <= 29) $grade = 'E';
            else $grade = '';

            switch ($grade){
                case "A" : $predikat = "Memuaskan"; break;
                case "B" : $predikat = "Bagus"; break;
                case "C" : $predikat = "Cukup"; break;
                case "D" : $predikat = "Kurang"; break;
                case "E" : $predikat = "Buruk"; break;
                default : $predikat ="";
            }

        ?>
            <tr>
                <td><?= $no ?></td>
                <td><?= $mhs['NIM'] ?></td>
                <td><?= $mhs['Nama'] ?></td>
                <td><?= $mhs['Nilai'] ?></td>
                <td><?= $ket ?></td>
                <td><?= $grade?></td>
                <td><?= $predikat?></td>

            </tr>
        <?php $no++; } ?>
    </tbody>
    <tfoot bgcolor=#deb887>
        <?php 
            foreach($keterangan as $ket => $hasil){    
        ?>
        <tr>
            <th colspan="6"><?= $ket ?></th>
            <th><?= $hasil ?></th>
        </tr>
        <?php } ?>
    </tfoot>
</table>
</table>
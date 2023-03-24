<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tugas 2 PHP Dandi</title>
    <style>
        body{
            font-family: arial;
            margin-left: 35%;
            margin-top: 5%;
            background-color: cadetblue;
        }
        fieldset{
        
            border-radius:20px;
            width: 400px;
            
        }

    </style>
</head>
<body>
    <h1>Form Rincian Gaji Pegawai</h1>
    <fieldset>
    <form method="POST">
        <table>
            <tr>
                <td> Nama Pegawai</td>
                <td>:</td>
                <td>
                    <input type="text" name="nama" placeholder="Input Nama Pegawai">
                </td>
            </tr>
            <tr>
                <td>Jabatan</td>
                <td>:</td>
                <td>
                    <select name="jabatan">
                        <option value="">--Pilih Jabatan--</option>
                        <option value="Manager">Manager</option>
                        <option value="Asisten">Asisten</option>
                        <option value="Kabag">Kabag</option>
                        <option value="Staff">Staff</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Status</td>
                <td>:</td>
                <td>
                    <input type="radio" name="status" value="Menikah">Menikah
                    <input type="radio" name="status" value="Lajang">Lajang
                </td>
            </tr>
            <tr>
                <td>Agama</td>
                <td>:</td>
                <td>
                    <select name="agama">
                        <option value="">--Pilih Agama--</option>
                        <option value="Islam">Islam</option>
                        <option value="Kristen">Kristen</option>
                        <option value="Buddha">Buddha</option>
                        <option value="Konghucu">Konghucu</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Jumlah Anak (Jika Menikah)</td>
                <td>:</td>
                <td>
                    <input type="number" name="anak" placeholder="Input Jumlah Anak">
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>
                    <input type="submit" name="submit" value="Kirim">
                </td>
            </tr>
        </table>
    </form>
    </fieldset>

    <?php 
    error_reporting(0);
    if (isset($_POST['submit'])){
            $nama = $_POST['nama'];
            $jabatan = $_POST['jabatan'];
            $status = $_POST['status'];
            $anak = $_POST['anak'];
            $agama = $_POST['agama'];

        switch ($jabatan){
            case 'Manager';
                $gajiPk = 20000000;
            break;
            case 'Asisten';
                $gajiPk = 15000000;
            break;
            case 'Kabag';
                $gajiPk = 10000000;
            break;
            case 'Staff';
                $gajiPk = 4000000;
            break;
            default:
                $gajiPk = 0;
            break;
        }
        
        $tunjJab = 0.2 * $gajiPk;

        if ($status == 'Menikah'){
            if ($anak > 0 && $anak <=2){
                $tunjKel = 0.05 * $gajiPk;
            }elseif ($anak >= 3 && $anak <=5){
                $tunjKel = 0.1 * $gajiPk;;
            }else{
                $tunjKel = 0;
            }
        }else{
            $tunjKel = 0;
        }

        $gajiKotor = $gajiPk + $tunjJab + $tunjKel;
        $zakat_profesi = ($agama == 'Islam' && $gajiKotor >= 6000000)? 0.025 * $gajiKotor : 0;
        $gajiBersih = $gajiKotor - $zakat_profesi;

        echo '<br> Nama Pegawai : '.$nama;
        echo '<br> Jabatan : '.$jabatan;
        echo '<br> Status : '.$status;
        echo '<br> Jumlah Anak : '.$anak;
        echo '<br><br>---------------------------Gaji Pegawai---------------------------<br>';
        echo '<br> Gaji Pokok : Rp '.number_format($gajiPk, 0, ',', ',');
        echo '<br> Tunjangan Jabatan : Rp '.number_format($tunjJab, 0, ',', ',');
        echo '<br> Tunjangan Keluarga : Rp '.number_format($tunjKel, 0, ',', ',');
        echo '<br> <br>Gaji Kotor : Rp '.number_format($gajiKotor, 0, ',', ',');
        echo '<br> Zakat Wajib Membayar (Bagi Muslim) : Rp '.number_format($zakat_profesi, 0, ',', ',');
        echo '<br> <br>Take Home Pay : Rp '.number_format($gajiBersih, 0, ',', ',');
        echo '<br> ------------------------------------------------------------------------';
    }
    ?>
</body>
</html>
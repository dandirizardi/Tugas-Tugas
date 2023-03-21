<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tugas1 PHP</title>
    <style>
        body{
            background-color : #f5f5dc;
            text-align : center;
        }
        fieldset{
            width : 300px;
            margin-left : 40%;
        }
    </style>
</head>
<body>
    <h1>Menghitung Luas & Keliling Jajar Genjang</h1>
    <fieldset>
    <form method="POST">
        <table>
            <tr>
                <td> Masukan Alas</td>
                <td>:</td>
                <td>
                    <input type="text" name="alas" require>
                </td>
            </tr>
            <tr>
                <td>Masukan Tinggi</td>
                <td>:</td>
                <td>
                    <input type="text" name="tinggi" require>
                </td>
            </tr>
            <tr>
                <td>
                     <input type="submit" name="submit" value="Hitung">
                </td>
            </tr>
        </table>
    </form>
    </fieldset>
</body>
</html>


<?php 

    if(isset($_POST['submit'])){

        $alas = $_POST['alas'];
        $tinggi = $_POST['tinggi'];

        $luas = $alas * $tinggi;
        $keliling = 2 * ($alas + $tinggi);

        echo '<br> Hasil Perhitungan ';
        echo '<br> Diketahui ';
        echo '<br> Alas : '.$alas;
        echo '<br> Tinggi : '.$tinggi;
        echo '<br><br> Luas Jajar Genjang : '.$luas;
        echo '<br> Keliling Jajar Genjang : '.$keliling;
    }

?>
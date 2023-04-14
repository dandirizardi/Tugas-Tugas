
//3.1

1.	Tampilkan produk yang asset nya diatas 20jt

MariaDB [dbtoko1]> SELECT * FROM produk WHERE harga_beli*stok >20000000;
+----+------+--------+------------+------------+------+----------+-----------------+
| id | kode | nama   | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+--------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas |    4000000 |    5000000 |   10 |        3 |               1 |
+----+------+--------+------------+------------+------+----------+-----------------+

2.	Tampilkan data produk beserta selisih stok dengan minimal stok

MariaDB [dbtoko1]> SELECT SUM(stok - min_stok) AS selisih from produk;
+---------+
| selisih |
+---------+
|      10 |
+---------+

3.	Tampilkan total asset produk secara keseluruhan

MariaDB [dbtoko1]> SELECT SUM(stok) AS total_asset from produk;
+-------------+
| total_asset |
+-------------+
|          32 |
+-------------+

4.	Tampilkan data pelanggan yang lahirnya antara tahun 1999 sampai 2004

MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir) BETWEEN 1999 AND 2004;
+----+--------+----------------+------+-----------+-------------------+----------+------------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | email             | kartu_id | tgl_lahir  |
+----+--------+----------------+------+-----------+-------------------+----------+------------+
| 11 | 011103 | Sekar          | P    | Kediri    | sekar@gmail.com   |        1 | 2001-09-08 |
| 13 | 011105 | Pradana        | L    | Jakarta   | pradana@gmail.com |        3 | 2001-08-01 |
| 14 | 011106 | Gayatri Putri  | P    | Jakarta   | gayatri@gmail.com |        4 | 2002-09-01 |
+----+--------+----------------+------+-----------+-------------------+----------+------------+

5.	Tampilkan data pelanggan yang lahirnya tahun 1998

MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir)=1998;
+----+--------+----------------+------+------------+------------------+----------+------------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | email            | kartu_id | tgl_lahir  |
+----+--------+----------------+------+------------+------------------+----------+------------+
|  6 | 011102 | Pandan Wangi   | P    | Yogyakarta | pandan@gmail.com |        3 | 1998-08-07 |
+----+--------+----------------+------+------------+------------------+----------+------------+

6.	Tampilkan data pelanggan yang berulang tahun bulan agustus

MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE MONTH(tgl_lahir)=08;
+----+--------+----------------+------+------------+-------------------+----------+------------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | email             | kartu_id | tgl_lahir  |
+----+--------+----------------+------+------------+-------------------+----------+------------+
|  6 | 011102 | Pandan Wangi   | P    | Yogyakarta | pandan@gmail.com  |        3 | 1998-08-07 |
| 13 | 011105 | Pradana        | L    | Jakarta    | pradana@gmail.com |        3 | 2001-08-01 |
+----+--------+----------------+------+------------+-------------------+----------+------------+

7.	Tampilkan data pelanggan : nama, tmp_lahir, tgl_lahir dan umur (selisih tahun sekarang dikurang tahun kelahiran)

MariaDB [dbtoko1]> SELECT nama_pelanggan,tmp_lahir,tgl_lahir,(YEAR(NOW())-YEAR(tgl_lahir))AS umur FROM pelanggan;
+----------------+------------+------------+------+
| nama_pelanggan | tmp_lahir  | tgl_lahir  | umur |
+----------------+------------+------------+------+
| Agung          | Bandung    | 1997-09-06 |   26 |
| Pandan Wangi   | Yogyakarta | 1998-08-07 |   25 |
| Sekar          | Kediri     | 2001-09-08 |   22 |
| Suandi         | Kediri     | 1997-09-08 |   26 |
| Pradana        | Jakarta    | 2001-08-01 |   22 |
| Gayatri Putri  | Jakarta    | 2002-09-01 |   21 |
+----------------+------------+------------+------+

//3.2

1.	Berapa jumlah pelanggan yang tahun lahirnya 1998

MariaDB [dbtoko1]> SELECT COUNT(*) AS jml_pelanggan1998  FROM pelanggan WHERE YEAR(tgl_lahir) = 1998; 
+-------------------+
| jml_pelanggan1998 |
+-------------------+
|                 1 |
+-------------------+

2.	Berapa jumlah pelanggan perempuan yang tempat lahirnya di Jakarta

MariaDB [dbtoko1]> SELECT COUNT(*) AS P_JKT FROM pelanggan WHERE jk = 'P' AND tmp_lahir = 'Jakarta';
+-------+
| P_JKT |
+-------+
|     1 |
+-------+


3.	Berapa jumlah total stok semua produk yang harga jualnya dibawah 10rb

MariaDB [dbtoko1]> SELECT SUM(stok) AS jml_total_stok FROM produk WHERE harga_jual < 10000;
+----------------+
| jml_total_stok |
+----------------+
|              5 |
+----------------+

4.	Ada berapa produk yang mempunyai kode awal K

MariaDB [dbtoko1]> SELECT COUNT(*) AS jml_kode_awalK FROM produk WHERE kode LIKE 'K%';
+----------------+
| jml_kode_awalK |
+----------------+
|              1 |
+----------------+

5.	Berapa harga jual rata-rata produk yang diatas 1jt

MariaDB [dbtoko1]> SELECT AVG(harga_jual) AS rata2_up1jt FROM produk WHERE harga_jual > 1000000;
+-------------+
| rata2_up1jt |
+-------------+
|     3500000 |
+-------------+

6.	Tampilkan jumlah stok yang paling besar

MariaDB [dbtoko1]> SELECT MAX(stok) AS max_stok FROM produk;
+----------+
| max_stok |
+----------+
|       10 |
+----------+

7.	Ada berapa produk yang stoknya kurang dari minimal stok

MariaDB [dbtoko1]> SELECT COUNT(*) AS jmlstok_minstok FROM produk WHERE stok < min_stok;
+-----------------+
| jmlstok_minstok |
+-----------------+
|               1 |
+-----------------+

8.	Berapa total asset dari keseluruhan produk

MariaDB [dbtoko1]> SELECT SUM(harga_beli * stok) AS total_aset FROM produk;
+------------+
| total_aset |
+------------+
|   73018000 |
+------------+



//3.3

1.	Tampilkan data produk : id, nama, stok dan informasi jika stok telah sampai batas minimal atau kurang dari minimum stok dengan informasi ‘segera belanja’ jika tidak ‘stok aman’.

MariaDB [dbtoko1]> SELECT id, nama, stok,
    -> IF(stok < min_stok, 'segera belanja', 'stok aman') AS status_stok FROM produk;
+----+------------+------+----------------+
| id | nama       | stok | status_stok    |
+----+------------+------+----------------+
|  1 | TV         |    3 | stok aman      |
|  2 | TV 21 Inch |   10 | stok aman      |
|  3 | Kulkas     |   10 | stok aman      |
|  4 | Meja Makan |    4 | stok aman      |
|  5 | Taro       |    3 | stok aman      |
|  6 | Teh Kotak  |    2 | segera belanja |
+----+------------+------+----------------+

2.	Tampilkan data pelanggan: id, nama, umur dan kategori umur : jika umur < 17 → ‘muda’ , 17-55 → ‘Dewasa’, selainnya ‘Tua’

MariaDB [dbtoko1]> SELECT id, nama_pelanggan, YEAR(CURDATE()) - YEAR(tgl_lahir) as umur,
    -> CASE
    -> WHEN YEAR(CURDATE()) - YEAR(tgl_lahir) < 17 THEN 'muda'
    -> WHEN YEAR(CURDATE()) - YEAR(tgl_lahir) BETWEEN 17 AND 55 THEN 'Dewasa'
    -> ELSE 'Tua'
    -> END AS kategori_umur
    -> FROM pelanggan;
+----+----------------+------+---------------+
| id | nama_pelanggan | umur | kategori_umur |
+----+----------------+------+---------------+
|  1 | Agung          |   26 | Dewasa        |
|  6 | Pandan Wangi   |   25 | Dewasa        |
| 11 | Sekar          |   22 | Dewasa        |
| 12 | Suandi         |   26 | Dewasa        |
| 13 | Pradana        |   22 | Dewasa        |
| 14 | Gayatri Putri  |   21 | Dewasa        |
+----+----------------+------+---------------+

3.	Tampilkan data produk: id, kode, nama, dan bonus untuk kode ‘TV01’ →’DVD Player’ , ‘K001’ → ‘Rice Cooker’ selain dari diatas ‘Tidak Ada’

MariaDB [dbtoko1]> SELECT id, kode, nama,
    ->  CASE WHEN kode = 'TV01' THEN 'DVD Player'
    -> WHEN kode = 'K001' THEN 'Rice Cooker'
    -> ELSE 'Tidak Ada'
    -> END AS bonus FROM produk;
+----+------+------------+-------------+
| id | kode | nama       | bonus       |
+----+------+------------+-------------+
|  1 | TV01 | TV         | DVD Player  |
|  2 | TV02 | TV 21 Inch | Tidak Ada   |
|  3 | K001 | Kulkas     | Rice Cooker |
|  4 | M001 | Meja Makan | Tidak Ada   |
|  5 | T001 | Taro       | Tidak Ada   |
|  6 | TK01 | Teh Kotak  | Tidak Ada   |
+----+------+------------+-------------+


//3.4

1.	Tampilkan data statistik jumlah tempat lahir pelanggan

MariaDB [dbtoko1]> SELECT tmp_lahir, COUNT(*) AS jumlah_pelanggan FROM pelanggan GROUP BY tmp_lahir;
+------------+------------------+
| tmp_lahir  | jumlah_pelanggan |
+------------+------------------+
| Bandung    |                1 |
| Jakarta    |                2 |
| Kediri     |                2 |
| Yogyakarta |                1 |
+------------+------------------+

2.	Tampilkan jumlah statistik produk berdasarkan jenis produk

MariaDB [dbtoko1]> SELECT jenis_produk.nama AS jenis_produk, COUNT(*) AS statistik_produk
    -> FROM produk JOIN jenis_produk ON produk.jenis_produk_id = jenis_produk.id
    -> GROUP BY jenis_produk.nama;
+--------------+------------------+
| jenis_produk | statistik_produk |
+--------------+------------------+
| Elektronik   |                3 |
| Furniture    |                1 |
| Makanan      |                1 |
| Minuman      |                1 |
+--------------+------------------+

3.	Tampilkan data pelanggan yang usianya dibawah rata usia pelanggan

MariaDB [dbtoko1]> SELECT id, kode, nama_pelanggan, YEAR(CURDATE()) - YEAR(tgl_lahir) AS usia 
    -> FROM pelanggan 
    -> HAVING usia < (SELECT AVG(YEAR(CURDATE()) - YEAR(tgl_lahir)) FROM pelanggan);
+----+--------+----------------+------+
| id | kode   | nama_pelanggan | usia |
+----+--------+----------------+------+
| 11 | 011103 | Sekar          |   22 |
| 13 | 011105 | Pradana        |   22 |
| 14 | 011106 | Gayatri Putri  |   21 |
+----+--------+----------------+------+

4.	Tampilkan data produk yang harganya diatas rata-rata harga produk

MariaDB [dbtoko1]> SELECT * FROM produk WHERE harga_jual > (SELECT AVG(harga_jual) FROM produk);
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
+----+------+------------+------------+------------+------+----------+-----------------+


5.	Tampilkan data pelanggan yang memiliki kartu dimana iuran tahunan kartu diatas 90rb

SELECT p.id, p.kode, p.nama_pelanggan, k.iuran
    -> FROM pelanggan p JOIN kartu k ON p.kartu_id = k.id
    -> WHERE k.iuran > 90000;
Empty set (0.015 sec)

6.	Tampilkan statistik data produk dimana harga produknya dibawah rata-rata harga produk secara keseluruhan

MariaDB [dbtoko1]>  SELECT jenis_produk.nama AS statistik_jenis_produk, COUNT(*) AS jumlah_produk, AVG(harga_jual) AS rata2_harga_statistik
    -> FROM produk JOIN jenis_produk ON produk.jenis_produk_id = jenis_produk.id
    -> GROUP BY jenis_produk.nama
    -> HAVING rata2_harga_statistik < (SELECT AVG(harga_jual) FROM produk);
+------------------------+---------------+-----------------------+
| statistik_jenis_produk | jumlah_produk | rata2_harga_statistik |
+------------------------+---------------+-----------------------+
| Furniture              |             1 |               2000000 |
| Makanan                |             1 |                  5000 |
| Minuman                |             1 |                  4000 |

7.	Tampilkan data pelanggan yang memiliki kartu dimana diskon kartu yang diberikan diatas 3%

MariaDB [dbtoko1]> SELECT p.id, p.kode, p.nama_pelanggan, k.nama, k.diskon
    -> FROM pelanggan p JOIN kartu k ON p.kartu_id = k.id
    -> WHERE k.diskon > 0.03;
+----+--------+----------------+--------+--------+
| id | kode   | nama_pelanggan | nama   | diskon |
+----+--------+----------------+--------+--------+
|  1 | 011101 | Agung          | Silver |  15000 |
|  6 | 011102 | Pandan Wangi   | Gold   |  20000 |
| 11 | 011103 | Sekar          | Silver |  15000 |
| 12 | 011104 | Suandi         | Perak  |  10000 |
| 13 | 011105 | Pradana        | Gold   |  20000 |
| 14 | 011106 | Gayatri Putri  | Perak  |  10000 |

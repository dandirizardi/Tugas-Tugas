
//soal 2.1

Database changed
MariaDB [dbtoko1]> SELECT * FROM produk ORDER BY harga_jual DESC;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
|  6 | TK01 | Teh Kotak  |       3000 |       4000 |    2 |       10 |               3 |
+----+------+------------+------------+------------+------+----------+-----------------+
6 rows in set (0.008 sec)

MariaDB [dbtoko1]> SELECT kode,nama_pelanggan,tmp_lahir,tgl_lahir FROM pelanggan;
+--------+----------------+------------+------------+
| kode   | nama_pelanggan | tmp_lahir  | tgl_lahir  |
+--------+----------------+------------+------------+
| 011101 | Agung          | Bandung    | 1997-09-06 |
| 011102 | Pandan Wangi   | Yogyakarta | 1998-08-07 |
| 011103 | Sekar          | Kediri     | 2001-09-08 |
| 011104 | Suandi         | Kediri     | 1997-09-08 |
| 011105 | Pradana        | Jakarta    | 2001-08-01 |
| 011106 | Gayatri Putri  | Jakarta    | 2002-09-01 |
+--------+----------------+------------+------------+
6 rows in set (0.000 sec)

MariaDB [dbtoko1]> SELECT kode,nama, stok from produk WHERE stok=4;
+------+------------+------+
| kode | nama       | stok |
+------+------------+------+
| M001 | Meja Makan |    4 |
+------+------------+------+
1 row in set (0.005 sec)

MariaDB [dbtoko1]> SELECT * from pelanggan WHERE tmp_lahir='jakarta';
+----+--------+----------------+------+-----------+-------------------+----------+------------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | email             | kartu_id | tgl_lahir  |
+----+--------+----------------+------+-----------+-------------------+----------+------------+
| 13 | 011105 | Pradana        | L    | Jakarta   | pradana@gmail.com |        3 | 2001-08-01 |
| 14 | 011106 | Gayatri Putri  | P    | Jakarta   | gayatri@gmail.com |        4 | 2002-09-01 |
+----+--------+----------------+------+-----------+-------------------+----------+------------+
2 rows in set (0.000 sec)

MariaDB [dbtoko1]> SELECT kode, nama_pelanggan, tmp_lahir, tgl_lahir from pelanggan ORDER BY tgl_lahir DESC;
+--------+----------------+------------+------------+
| kode   | nama_pelanggan | tmp_lahir  | tgl_lahir  |
+--------+----------------+------------+------------+
| 011106 | Gayatri Putri  | Jakarta    | 2002-09-01 |
| 011103 | Sekar          | Kediri     | 2001-09-08 |
| 011105 | Pradana        | Jakarta    | 2001-08-01 |
| 011102 | Pandan Wangi   | Yogyakarta | 1998-08-07 |
| 011104 | Suandi         | Kediri     | 1997-09-08 |
| 011101 | Agung          | Bandung    | 1997-09-06 |
+--------+----------------+------------+------------+
6 rows in set (0.000 sec)

//soal 2.2

MariaDB [dbtoko1]> SELECT * from produk WHERE stok=3 OR stok=10;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
+----+------+------------+------------+------------+------+----------+-----------------+
4 rows in set (0.012 sec)

MariaDB [dbtoko1]> SELECT * FROM produk WHERE harga_jual < 5000000 AND harga_jual > 500000;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
+----+------+------------+------------+------------+------+----------+-----------------+
3 rows in set (0.003 sec)

MariaDB [dbtoko1]> SELECT * FROM produk WHERE min_stok > stok;
+----+------+-----------+------------+------------+------+----------+-----------------+
| id | kode | nama      | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+-----------+------------+------------+------+----------+-----------------+
|  6 | TK01 | Teh Kotak |       3000 |       4000 |    2 |       10 |               3 |
+----+------+-----------+------------+------------+------+----------+-----------------+
1 row in set (0.000 sec)

MariaDB [dbtoko1]> SELECT * FROM pelanggan ORDER BY tgl_lahir DESC;
+----+--------+----------------+------+------------+-------------------+----------+------------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | email             | kartu_id | tgl_lahir  |
+----+--------+----------------+------+------------+-------------------+----------+------------+
| 14 | 011106 | Gayatri Putri  | P    | Jakarta    | gayatri@gmail.com |        4 | 2002-09-01 |
| 11 | 011103 | Sekar          | P    | Kediri     | sekar@gmail.com   |        1 | 2001-09-08 |
| 13 | 011105 | Pradana        | L    | Jakarta    | pradana@gmail.com |        3 | 2001-08-01 |
|  6 | 011102 | Pandan Wangi   | P    | Yogyakarta | pandan@gmail.com  |        3 | 1998-08-07 |
| 12 | 011104 | Suandi         | L    | Kediri     | suandi@gmail.com  |        4 | 1997-09-08 |
|  1 | 011101 | Agung          | L    | Bandung    | agung@gmail.com   |        1 | 1997-09-06 |
+----+--------+----------------+------+------------+-------------------+----------+------------+
6 rows in set (0.003 sec)

MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE tmp_lahir='jakarta' AND jk='P';
+----+--------+----------------+------+-----------+-------------------+----------+------------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | email             | kartu_id | tgl_lahir  |
+----+--------+----------------+------+-----------+-------------------+----------+------------+
| 14 | 011106 | Gayatri Putri  | P    | Jakarta   | gayatri@gmail.com |        4 | 2002-09-01 |
+----+--------+----------------+------+-----------+-------------------+----------+------------+
1 row in set (0.010 sec)

MariaDB [dbtoko1]> SELECT * FROM pelanggan;
+----+--------+----------------+------+------------+-------------------+----------+------------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | email             | kartu_id | tgl_lahir  |
+----+--------+----------------+------+------------+-------------------+----------+------------+
|  1 | 011101 | Agung          | L    | Bandung    | agung@gmail.com   |        1 | 1997-09-06 |
|  6 | 011102 | Pandan Wangi   | P    | Yogyakarta | pandan@gmail.com  |        3 | 1998-08-07 |
| 11 | 011103 | Sekar          | P    | Kediri     | sekar@gmail.com   |        1 | 2001-09-08 |
| 12 | 011104 | Suandi         | L    | Kediri     | suandi@gmail.com  |        4 | 1997-09-08 |
| 13 | 011105 | Pradana        | L    | Jakarta    | pradana@gmail.com |        3 | 2001-08-01 |
| 14 | 011106 | Gayatri Putri  | P    | Jakarta    | gayatri@gmail.com |        4 | 2002-09-01 |
+----+--------+----------------+------+------------+-------------------+----------+------------+
6 rows in set (0.000 sec)

MariaDB [dbtoko1]> SELECT * from pelanggan WHERE id IN (2,4,6);
+----+--------+----------------+------+------------+------------------+----------+------------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | email            | kartu_id | tgl_lahir  |
+----+--------+----------------+------+------------+------------------+----------+------------+
|  6 | 011102 | Pandan Wangi   | P    | Yogyakarta | pandan@gmail.com |        3 | 1998-08-07 |
+----+--------+----------------+------+------------+------------------+----------+------------+
1 row in set (0.012 sec)

MariaDB [dbtoko1]> SELECT * FROM produk WHERE harga_jual >= 500000 AND harga_jual<= 6000000;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
+----+------+------------+------------+------------+------+----------+-----------------+
4 rows in set (0.003 sec)

//soal 2.3

MariaDB [dbtoko1]> SELECT * FROM produk WHERE kode LIKE 'K%' OR kode LIKE 'M%';
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
+----+------+------------+------------+------------+------+----------+-----------------+
2 rows in set (0.010 sec)

MariaDB [dbtoko1]> SELECT * FROM produk WHERE kode LIKE 'M%';
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
+----+------+------------+------------+------------+------+----------+-----------------+
1 row in set (0.000 sec)

MariaDB [dbtoko1]> SELECT * FROM produk WHERE kode IN ('TV01','TV02');
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
+----+------+------------+------------+------------+------+----------+-----------------+
2 rows in set (0.000 sec)

MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE nama_pelanggan LIKE '%SA%';
Empty set (0.000 sec)

MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE tmp_lahir NOT IN ('Jakarta') AND nama_pelanggan LIKE '%yo%';
Empty set (0.000 sec)

MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE SUBSTRING(nama_pelanggan, 2, 1) = 'A';
+----+--------+----------------+------+------------+-------------------+----------+------------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | email             | kartu_id | tgl_lahir  |
+----+--------+----------------+------+------------+-------------------+----------+------------+
|  6 | 011102 | Pandan Wangi   | P    | Yogyakarta | pandan@gmail.com  |        3 | 1998-08-07 |
| 14 | 011106 | Gayatri Putri  | P    | Jakarta    | gayatri@gmail.com |        4 | 2002-09-01 |
+----+--------+----------------+------+------------+-------------------+----------+------------+
2 rows in set (0.010 sec)

//soal 2.4

MariaDB [dbtoko1]> SELECT *FROM produk ORDER BY harga_beli DESC LIMIT 2;
+----+------+--------+------------+------------+------+----------+-----------------+
| id | kode | nama   | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+--------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas |    4000000 |    5000000 |   10 |        3 |               1 |
|  1 | TV01 | TV     |    3000000 |    4000000 |    3 |        2 |               1 |
+----+------+--------+------------+------------+------+----------+-----------------+
2 rows in set (0.000 sec)

MariaDB [dbtoko1]> SELECT * FROM produk WHERE harga_jual = (SELECT MIN(harga_jual) FROM produk);
+----+------+-----------+------------+------------+------+----------+-----------------+
| id | kode | nama      | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+-----------+------------+------------+------+----------+-----------------+
|  6 | TK01 | Teh Kotak |       3000 |       4000 |    2 |       10 |               3 |
+----+------+-----------+------------+------------+------+----------+-----------------+
1 row in set (0.011 sec)

MariaDB [dbtoko1]> SELECT * FROM produk WHERE stok = (SELECT MAX(stok) FROM produk);
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
+----+------+------------+------------+------------+------+----------+-----------------+
2 rows in set (0.000 sec)

MariaDB [dbtoko1]> SELECT * FROM produk WHERE stok = (SELECT MIN(stok) FROM produk) LIMIT 2;
+----+------+-----------+------------+------------+------+----------+-----------------+
| id | kode | nama      | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+-----------+------------+------------+------+----------+-----------------+
|  6 | TK01 | Teh Kotak |       3000 |       4000 |    2 |       10 |               3 |
+----+------+-----------+------------+------------+------+----------+-----------------+
1 row in set (0.009 sec)

MariaDB [dbtoko1]> SELECT * FROM pelanggan;
+----+--------+----------------+------+------------+-------------------+----------+------------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | email             | kartu_id | tgl_lahir  |
+----+--------+----------------+------+------------+-------------------+----------+------------+
|  1 | 011101 | Agung          | L    | Bandung    | agung@gmail.com   |        1 | 1997-09-06 |
|  6 | 011102 | Pandan Wangi   | P    | Yogyakarta | pandan@gmail.com  |        3 | 1998-08-07 |
| 11 | 011103 | Sekar          | P    | Kediri     | sekar@gmail.com   |        1 | 2001-09-08 |
| 12 | 011104 | Suandi         | L    | Kediri     | suandi@gmail.com  |        4 | 1997-09-08 |
| 13 | 011105 | Pradana        | L    | Jakarta    | pradana@gmail.com |        3 | 2001-08-01 |
| 14 | 011106 | Gayatri Putri  | P    | Jakarta    | gayatri@gmail.com |        4 | 2002-09-01 |
+----+--------+----------------+------+------------+-------------------+----------+------------+
6 rows in set (0.000 sec)

MariaDB [dbtoko1]> SELECT * FROM pelanggan ORDER BY tgl_lahir DESC LIMIT 1;
+----+--------+----------------+------+-----------+-------------------+----------+------------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | email             | kartu_id | tgl_lahir  |
+----+--------+----------------+------+-----------+-------------------+----------+------------+
| 14 | 011106 | Gayatri Putri  | P    | Jakarta   | gayatri@gmail.com |        4 | 2002-09-01 |
+----+--------+----------------+------+-----------+-------------------+----------+------------+
1 row in set (0.011 sec)

MariaDB [dbtoko1]> SELECT * FROM pelanggan ORDER BY tgl_lahir ASC LIMIT 1;
+----+--------+----------------+------+-----------+-----------------+----------+------------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | email           | kartu_id | tgl_lahir  |
+----+--------+----------------+------+-----------+-----------------+----------+------------+
|  1 | 011101 | Agung          | L    | Bandung   | agung@gmail.com |        1 | 1997-09-06 |
+----+--------+----------------+------+-----------+-----------------+----------+------------+
1 row in set (0.004 sec)

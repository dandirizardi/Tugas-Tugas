//fungsi inputPelanggan

MariaDB [dbtoko1]> desc pelanggan;
    -> $$
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| id             | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode           | varchar(10) | YES  | UNI | NULL    |                |
| nama_pelanggan | varchar(50) | YES  |     | NULL    |                |
| jk             | char(1)     | YES  |     | NULL    |                |
| tmp_lahir      | varchar(50) | YES  |     | NULL    |                |
| email          | varchar(30) | YES  |     | NULL    |                |
| kartu_id       | int(11)     | NO   | MUL | NULL    |                |
| tgl_lahir      | date        | YES  |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+
8 rows in set (0.007 sec)

MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE PROCEDURE inputPelanggan(kode varchar(10), nama_pelanggan varchar(50), jk char, tmp_lahir varchar(50), email varchar(30), kartu_id int, tgl_lahir date)
    -> BEGIN
    -> INSERT INTO pelanggan (kode,nama_pelanggan,jk,tmp_lahir,email,kartu_id,tgl_lahir) VALUES (kode,nama_pelanggan,jk,tmp_lahir,email,kartu_id,tgl_lahir);
    -> END$$

MariaDB [dbtoko1]> CALL inputPelanggan('011107','Bayu','L','Depok','bayu@gmail.com',3,'2002-07-05');
Query OK, 1 row affected (0.003 sec)

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
| 16 | 011107 | Bayu           | L    | Depok      | bayu@gmail.com    |        3 | 2002-07-05 |
+----+--------+----------------+------+------------+-------------------+----------+------------+
7 rows in set (0.001 sec)


//fungsi showPelanggan

MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE PROCEDURE showPelanggan()
    -> BEGIN
    -> SELECT kode,nama_pelanggan,email FROM pelanggan;
    -> END
    -> $$
Query OK, 0 rows affected (0.068 sec)

MariaDB [dbtoko1]> CALL showPelanggan();
    -> END
    -> $$
+--------+----------------+-------------------+
| kode   | nama_pelanggan | email             |
+--------+----------------+-------------------+
| 011101 | Agung          | agung@gmail.com   |
| 011102 | Pandan Wangi   | pandan@gmail.com  |
| 011103 | Sekar          | sekar@gmail.com   |
| 011104 | Suandi         | suandi@gmail.com  |
| 011105 | Pradana        | pradana@gmail.com |
| 011106 | Gayatri Putri  | gayatri@gmail.com |
| 011107 | Bayu           | bayu@gmail.com    |
+--------+----------------+-------------------+
7 rows in set (0.001 sec)


//fungsi inputProduk

MariaDB [dbtoko1]> DELIMITER $$                                                                                           
MariaDB [dbtoko1]> CREATE PROCEDURE inputProduk(kode varchar(10),nama varchar(45),harga_beli double,harga_jual double,stok int,min_stok int,jenis_poduk_id int)
    -> BEGIN
    -> INSERT INTO produk (kode,nama ,harga_beli,harga_jual,stok,min_stok,jenis_produk_id) VALUES (kode,nama ,harga_beli,harga_jual,stok,min_stok,jenis_produk_id);
    -> END$$
Query OK, 0 rows affected (0.073 sec)

MariaDB [dbtoko1]> DELIMITER ;
MariaDB [dbtoko1]> CALL inputProduk('K002','AC 1PK',2500000,3500000,5,2,1);
Query OK, 1 row affected (0.005 sec)

MariaDB [dbtoko1]> SELECT * FROM produk;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
|  6 | TK01 | Teh Kotak  |       3000 |       4000 |    2 |       10 |               3 |
| 10 | K002 | AC 1PK     |    2500000 |    3500000 |    5 |        2 |            NULL |
+----+------+------------+------------+------------+------+----------+-----------------+
7 rows in set (0.005 sec)

//fungsi showProduk

MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> SELECT * FROM produk;
    -> $$
MariaDB [dbtoko1]> CREATE PROCEDURE showProduk()
    -> BEGIN
    -> SELECT nama, harga_beli,harga_jual FROM produk;
    -> END
    -> $$
MariaDB [dbtoko1]> CALL showProduk();
    -> end
    -> $$

+------------+------------+------------+
| nama       | harga_beli | harga_jual |
+------------+------------+------------+
| TV         |    3000000 |    4000000 |
| TV 21 Inch |    2000000 |    3000000 |
| Kulkas     |    4000000 |    5000000 |
| Meja Makan |    1000000 |    2000000 |
| Taro       |       4000 |       5000 |
| Teh Kotak  |       3000 |       4000 |
| AC 1PK     |    2500000 |    3500000 |
+------------+------------+------------+

//fungsi totalPesanan

MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE PROCEDURE totalPesanan()
    -> BEGIN
    -> DECLARE total int;
    -> SELECT COUNT(id) INTO total FROM pesanan;
    -> SELECT total;
    -> END;
    -> $$
Query OK, 0 rows affected (0.073 sec)

MariaDB [dbtoko1]> DELIMITER ;
MariaDB [dbtoko1]> CALL totalPesanan();
+-------+
| total |
+-------+
|     2 |
+-------+
1 row in set (0.022 sec)

Query OK, 1 row affected (0.022 sec)

//menampilkan semua pesanan 

MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE PROCEDURE totalPesanan
    -> AND$$
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'AND' at line 2
MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> create procedure showPesanan()
    -> BEGIN
    -> select pesanan.id, pesanan.tanggal, pelanggan.nama_pelanggan, pesanan.total from pesanan
    -> join pelangan on pesanan.pelanggan_id = pelanggan.id;
    -> END$$
Query OK, 0 rows affected (0.069 sec)

MariaDB [dbtoko1]> DELIMITER ;
MariaDB [dbtoko1]> SELECT p.id, p.tanggal, p.total, pl.nama_pelanggan
    -> FROM pesanan p
    -> JOIN pelanggan pl ON p.pelanggan_id = pl.id;
+----+------------+--------+----------------+
| id | tanggal    | total  | nama_pelanggan |
+----+------------+--------+----------------+
|  1 | 2023-02-01 | 200000 | Agung          |
|  2 | 2022-02-02 |  30000 | Agung          |
+----+------------+--------+----------------+
2 rows in set (0.011 sec)

//view baru: pesanan_produk_vw

MariaDB [dbtoko1]> CREATE VIEW pesanan_produk_vw AS
    -> SELECT pelanggan.nama_pelanggan,tmp_lahir,email, produk.kode,nama, pesanan.id,tanggal,total FROM pesanan
    -> INNER JOIN pelanggan ON pesanan.pelanggan_id = pelanggan.id
    -> INNER JOIN produk ON pesanan.pelanggan_id = produk.jenis_produk_id;
Query OK, 0 rows affected (0.076 sec)

MariaDB [dbtoko1]> SELECT * FROM pesanan_produk_vw;
+----------------+-----------+-----------------+------+------------+----+------------+--------+
| nama_pelanggan | tmp_lahir | email           | kode | nama       | id | tanggal    | total  |
+----------------+-----------+-----------------+------+------------+----+------------+--------+
| Agung          | Bandung   | agung@gmail.com | TV01 | TV         |  1 | 2023-02-01 | 200000 |
| Agung          | Bandung   | agung@gmail.com | TV01 | TV         |  2 | 2022-02-02 |  30000 |
| Agung          | Bandung   | agung@gmail.com | TV02 | TV 21 Inch |  1 | 2023-02-01 | 200000 |
| Agung          | Bandung   | agung@gmail.com | TV02 | TV 21 Inch |  2 | 2022-02-02 |  30000 |
| Agung          | Bandung   | agung@gmail.com | K001 | Kulkas     |  1 | 2023-02-01 | 200000 |
| Agung          | Bandung   | agung@gmail.com | K001 | Kulkas     |  2 | 2022-02-02 |  30000 |
+----------------+-----------+-----------------+------+------------+----+------------+--------+
6 rows in set (0.001 sec)



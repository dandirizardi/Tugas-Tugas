

mysql> use dbtoko1;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> select * from pesanan;
+----+------------+-------+--------------+
| id | tanggal    | total | pelanggan_id |
+----+------------+-------+--------------+
|  1 | 2023-02-01 | 20000 |            1 |
|  2 | 2022-02-02 | 30000 |            1 |
|  3 | 2022-02-02 | 30000 |            1 |
+----+------------+-------+--------------+
3 rows in set (0.00 sec)

mysql> select * from pembayaran;
+----+-------------+------------+--------+------+------------+-------------------+
| id | no_kuitansi | tanggal    | jumlah | ke   | pesanan_id | status_pembayaran |
+----+-------------+------------+--------+------+------------+-------------------+
|  2 | P0001       | 2023-02-01 |  20000 |    1 |          1 | belum lunas       |
+----+-------------+------------+--------+------+------------+-------------------+
1 row in set (0.00 sec)

mysql> ALTER TABLE pesanan ADD status_pembayaran VARCHAR(11) DEFAULT 'Belum Lunas';
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc pesanan;
+-------------------+-------------+------+-----+-------------+----------------+
| Field             | Type        | Null | Key | Default     | Extra          |
+-------------------+-------------+------+-----+-------------+----------------+
| id                | int(11)     | NO   | PRI | NULL        | auto_increment |
| tanggal           | date        | YES  |     | NULL        |                |
| total             | double      | YES  |     | NULL        |                |
| pelanggan_id      | int(11)     | NO   |     | NULL        |                |
| status_pembayaran | varchar(11) | YES  |     | Belum Lunas |                |
+-------------------+-------------+------+-----+-------------+----------------+
5 rows in set (0.00 sec)

mysql> DESC pembayaran;
+-------------------+-------------+------+-----+---------+----------------+
| Field             | Type        | Null | Key | Default | Extra          |
+-------------------+-------------+------+-----+---------+----------------+
| id                | int(11)     | NO   | PRI | NULL    | auto_increment |
| no_kuitansi       | varchar(10) | YES  | UNI | NULL    |                |
| tanggal           | date        | YES  |     | NULL    |                |
| jumlah            | double      | YES  |     | NULL    |                |
| ke                | int(11)     | YES  |     | NULL    |                |
| pesanan_id        | int(11)     | NO   |     | NULL    |                |
| status_pembayaran | varchar(20) | YES  |     | NULL    |                |
+-------------------+-------------+------+-----+---------+----------------+
7 rows in set (0.00 sec)

mysql> ALTER TABLE pembayaran DROP COLUMN status_pembayaran;
Query OK, 0 rows affected (0.12 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc pembayaran;
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| id          | int(11)     | NO   | PRI | NULL    | auto_increment |
| no_kuitansi | varchar(10) | YES  | UNI | NULL    |                |
| tanggal     | date        | YES  |     | NULL    |                |
| jumlah      | double      | YES  |     | NULL    |                |
| ke          | int(11)     | YES  |     | NULL    |                |
| pesanan_id  | int(11)     | NO   |     | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+
6 rows in set (0.00 sec)


mysql> DELETE FROM pembayaran WHERE id=2;
Query OK, 1 row affected (0.00 sec)

mysql> select * from pembayaran;
Empty set (0.00 sec)

mysql> DROP TRIGGER update_status_pembayaran;
Query OK, 0 rows affected (0.01 sec)

mysql> DELIMITER $$
mysql> CREATE TRIGGER update_status_pembayaran
    -> AFTER INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> UPDATE pesanan SET status_pembayaran = 'Lunas' WHERE pesanan.id = NEW.pesanan_id;
    -> END $$
Query OK, 0 rows affected (0.04 sec)

mysql> SELECT * FROM pesanan;
    -> $$
+----+------------+-------+--------------+-------------------+
| id | tanggal    | total | pelanggan_id | status_pembayaran |
+----+------------+-------+--------------+-------------------+
|  1 | 2023-02-01 | 20000 |            1 | Belum Lunas       |
|  2 | 2022-02-02 | 30000 |            1 | Belum Lunas       |
|  3 | 2022-02-02 | 30000 |            1 | Belum Lunas       |
+----+------------+-------+--------------+-------------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM pembayaran;
    -> $$
Empty set (0.01 sec)

mysql> INSERT INTO pembayaran VALUES (1,'P0001','2023-02-01',20000,1,1);
    -> $$
Query OK, 1 row affected (0.01 sec)

mysql> DELIMITER ;
mysql> SELECT * FROM pembayaran;
+----+-------------+------------+--------+------+------------+
| id | no_kuitansi | tanggal    | jumlah | ke   | pesanan_id |
+----+-------------+------------+--------+------+------------+
|  1 | P0001       | 2023-02-01 |  20000 |    1 |          1 |
+----+-------------+------------+--------+------+------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM pesanan;
+----+------------+-------+--------------+-------------------+
| id | tanggal    | total | pelanggan_id | status_pembayaran |
+----+------------+-------+--------------+-------------------+
|  1 | 2023-02-01 | 20000 |            1 | Lunas             |
|  2 | 2022-02-02 | 30000 |            1 | Belum Lunas       |
|  3 | 2022-02-02 | 30000 |            1 | Belum Lunas       |
+----+------------+-------+--------------+-------------------+
3 rows in set (0.00 sec)

mysql> 

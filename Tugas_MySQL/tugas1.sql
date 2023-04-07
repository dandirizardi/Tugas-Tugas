admin@Dandi-Macbook ~ % mysql.server start
Starting MariaDB
 SUCCESS! 
admin@Dandi-Macbook ~ % 230407 20:29:18 mysqld_safe Logging to '/usr/local/var/mysql/Dandi-Macbook.local.err'.
230407 20:29:18 mysqld_safe A mysqld process already exists
show databases;
zsh: command not found: show
admin@Dandi-Macbook ~ % mysql
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 10
Server version: 10.11.2-MariaDB Homebrew

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| dbtoko1            |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| test               |
+--------------------+
6 rows in set (0.005 sec)

MariaDB [(none)]> use dbtoko1;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
MariaDB [dbtoko1]> show tables;
+-------------------+
| Tables_in_dbtoko1 |
+-------------------+
| jenis_produk      |
| kartu             |
| pelanggan         |
| pembayaran        |
| pesanan           |
+-------------------+
5 rows in set (0.001 sec)

MariaDB [dbtoko1]> CREATE TABLE produk(
    -> id int NOT NULL auto_increment primary key,
    -> kode VARCHAR(10),
    -> nama VARCHAR(45),
    -> harga_beli DOUBLE,
    -> harga_jual DOUBLE,
    -> stok INT,
    -> min_stok INT,
    -> jenis_produk_id INT NOT NULL REFERENCES jenis_produk(id));
Query OK, 0 rows affected (0.121 sec)

MariaDB [dbtoko1]> CREATE TABLE pesanan_items(
    -> id int NOT NULL auto_increment primary key,
    -> produk_id INT NOT NULL REFERENCES produk(id),
    -> pesanan_id INT NOT NULL REFERENCES pesanan(id),
    -> qty INT,
    -> harga DOUBLE);
Query OK, 0 rows affected (0.079 sec)

MariaDB [dbtoko1]> CREATE TABLE vendor(
    -> id int NOT NULL auto_increment primary key,
    -> nomer VARCHAR(4),
    -> nama VARCHAR(40),
    -> kota VARCHAR(30),
    -> kontak VARCHAR(30));
Query OK, 0 rows affected (0.068 sec)

MariaDB [dbtoko1]> CREATE TABLE pembelian(
    -> id int NOT NULL auto_increment primary key,
    -> tanggal VARCHAR(45),
    -> nomer VARCHAR(10),
    -> produk_id INT NOT NULL REFERENCES produk(id),
    -> jumlah INT,
    -> harga double,
    -> vendor_id INT NOT NULL REFERENCES vendor(id));
Query OK, 0 rows affected (0.091 sec)

MariaDB [dbtoko1]> show tables;
+-------------------+
| Tables_in_dbtoko1 |
+-------------------+
| jenis_produk      |
| kartu             |
| pelanggan         |
| pembayaran        |
| pembelian         |
| pesanan           |
| pesanan_items     |
| produk            |
| vendor            |
+-------------------+
9 rows in set (0.001 sec)

MariaDB [dbtoko1]> desc pelanggan;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| id         | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode       | varchar(10) | YES  | UNI | NULL    |                |
| nama       | varchar(45) | YES  |     | NULL    |                |
| jk         | char(1)     | YES  |     | NULL    |                |
| tump_lahir | varchar(20) | YES  |     | NULL    |                |
| email      | varchar(30) | YES  |     | NULL    |                |
| kartu_id   | int(11)     | NO   | MUL | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
7 rows in set (0.013 sec)

MariaDB [dbtoko1]> ALTER TABLE jenis_produk
    -> ;
Query OK, 0 rows affected (0.004 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko1]> desc jenis_produk;
+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| id    | int(11)     | NO   | PRI | NULL    | auto_increment |
| nama  | varchar(20) | YES  |     | NULL    |                |
| ket   | varchar(50) | YES  |     | NULL    |                |
+-------+-------------+------+-----+---------+----------------+
3 rows in set (0.017 sec)

MariaDB [dbtoko1]> ALTER TABLE pelanggan
    -> ADD COLUMN alamat VARCHAR(40) AFTER kartu_id;
Query OK, 0 rows affected (0.193 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko1]> desc pelanggan;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| id         | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode       | varchar(10) | YES  | UNI | NULL    |                |
| nama       | varchar(45) | YES  |     | NULL    |                |
| jk         | char(1)     | YES  |     | NULL    |                |
| tump_lahir | varchar(20) | YES  |     | NULL    |                |
| email      | varchar(30) | YES  |     | NULL    |                |
| kartu_id   | int(11)     | NO   | MUL | NULL    |                |
| alamat     | varchar(40) | YES  |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
8 rows in set (0.012 sec)

MariaDB [dbtoko1]> ALTER TABLE pelanggan
    -> CHANGE nama nama_pelanggan VARCHAR(50);
Query OK, 0 rows affected (0.167 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko1]> desc pelanggan
    -> ;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| id             | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode           | varchar(10) | YES  | UNI | NULL    |                |
| nama_pelanggan | varchar(50) | YES  |     | NULL    |                |
| jk             | char(1)     | YES  |     | NULL    |                |
| tump_lahir     | varchar(20) | YES  |     | NULL    |                |
| email          | varchar(30) | YES  |     | NULL    |                |
| kartu_id       | int(11)     | NO   | MUL | NULL    |                |
| alamat         | varchar(40) | YES  |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+
8 rows in set (0.008 sec)
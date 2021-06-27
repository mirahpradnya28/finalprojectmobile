<?php
include 'conn.php';

$nama = $_POST['nama'];
$kode = $_POST['kode'];


$connect->query("INSERT INTO pelanggan (nama_pelanggan,kode_pelanggan) VALUES ('".$nama."','".$kode."')");

?>
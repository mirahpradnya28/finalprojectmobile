<?php
include 'conn.php';

$id = $_POST['id'];
$kodeBarang = $_POST['kodeBarang'];
$namaBarang = $_POST['namaBarang'];
$hargaBarang = $_POST['hargaBarang'];
$stokBarang = $_POST['stokBarang'];
$gambar = $_POST['gambar'];

$connect->query("UPDATE barang SET kode='".$kodeBarang."',nama='".$namaBarang."',harga='".$hargaBarang."',gambar='".$gambar."' WHERE id=".$id);

?>
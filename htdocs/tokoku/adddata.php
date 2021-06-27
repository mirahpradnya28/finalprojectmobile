<?php
include 'conn.php';

$kodeBarang = $_POST['kodeBarang'];
$namaBarang = $_POST['namaBarang'];
$hargaBarang = $_POST['hargaBarang'];
$stokBarang = $_POST['stokBarang'];
$gambar = $_POST['gambar'];

$connect->query("INSERT INTO barang (kode,nama,harga,stok,gambar) VALUES ('".$kodeBarang."','".$namaBarang."','".$hargaBarang."','".$stokBarang."','".$gambar."')");

?>
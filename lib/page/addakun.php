<?php
include 'conn.php';

$username = $_POST['username'];
$password = $_POST['pass'];

$connect->query("INSERT INTO masuk (username, pass) VALUES ('".$username."','".$password."')");

?>
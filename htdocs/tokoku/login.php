<?php
    include 'conn.php';

    $username= $_POST['username'];
    $password=$_POST['password'];

    $sql="SELECT * FROM masuk WHERE username= '".$username."' AND password='".$password."'";
    $result= mysqli_query($conn,$sql);
    $count= mysqli_num_rows($result);

    if ($count == 1){
        echo json_encode("Sukses");
    }else{
        echo json_encode("Error");
        }
    }
?>
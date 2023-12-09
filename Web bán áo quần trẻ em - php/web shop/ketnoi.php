<?php
// $conn = new mysqli("localhost","root","","database");
$conn = mysqli_connect("127.0.0.1:3306","root","","database");
// Check connection
if ($conn -> connect_errno) {
  echo "Kết nối mysqli lỗi:". $conn -> connect_error;
  exit();
}
?>
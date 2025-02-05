<?php
include('ketnoi.php');
$id=$_GET['id'];
$sql = "DELETE FROM products WHERE prd_id=$id";
$query = mysqli_query($conn, $sql);
header('location: cart.php');
?>
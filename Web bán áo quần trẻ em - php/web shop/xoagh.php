<?php
include('ketnoi.php');
$id=$_GET['id'];
$email = "khách";
if (isset($_SESSION['email']) && $_SESSION['email']) {
    $email = $_SESSION['email'];
}
$sql = "DELETE from cart where prd_id=$id and username='$email'";
$query = mysqli_query($conn, $sql);
header('location: cart.php');
?>
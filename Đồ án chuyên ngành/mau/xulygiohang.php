<?php
session_start();
include('ketnoi.php');
$prd_id = $_GET['id'];
$username = "khách";
if (isset($_SESSION['email']) && $_SESSION['email']) {
    $username = $_SESSION['email'];
}
$row = mysqli_fetch_assoc(mysqli_query($conn, "SELECT * from cart where prd_id=$prd_id"));
if ((mysqli_num_rows(mysqli_query($conn, "SELECT * from cart where prd_id=$prd_id")) > 0) && ($row['username'] == $username)) {
    $quantitycart = $row['quantitycart'] + 1;
    $sql_up = "UPDATE cart SET quantitycart = $quantitycart where prd_id = $prd_id";
} else {
    $quantitycart = 1;
    $sql_up = "INSERT into cart (username, prd_id, quantitycart)
    values ('$username', $prd_id, $quantitycart)";
}

$query_up = mysqli_query($conn, $sql_up);
header('location: cart.php')
    ?>
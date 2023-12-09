<!DOCTYPE html>
<html lang="en"></html>
<head>
    <meta charset ="UTF-8">
    <meta http-equiv="'X-UA-Compatible" content="IE=edge">
    <title>Sunni Shop</title>
    <link rel="stylesheet" href="style.css" />
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
</head>

<body>
    <div class="header">
    <!--Thanh tiêu đề-->
    <div class="container">
    <div class="navbar">
        <div class="logo">
            <img src="img/logo.png" width="125px" alt="">
        </div>
        <nav>
            <ul id="MenuItems">
                <li><a class="active" href="index.php">Trang Chủ</a></li>
                <li><a href="shop.php">Sản Phẩm</a></li>
                <li><a href="dmsp.php">Danh Mục Sản Phẩm</a></li>
                <li><a href="blog.php">Blog</a></li>
                <li><a href="lienhe.php">Liên Hệ</a></li>
                <li><a href="account.php">Tài Khoản</a></li>
            </ul>
        </nav>
        <li><a href="cart.php"><i class="fa fa-shopping-bag" aria-hidden="true"></i>&emsp;&emsp;</a></li>
        <li><a href="timkiem.php"><i class="far fa-search search-icon"></i>&emsp;&emsp;</a></li>
    </div>
    </div> 
    </div> 
<!-- don gia mot san pham -->
<?php
include('ketnoi.php');
session_start();
$email = "khách";
if(isset($_SESSION['email'])&&$_SESSION['email'])
{
    $email = $_SESSION['email'];
}
$sql="SELECT * from cart inner join products on cart.prd_id = products.prd_id";
$query= mysqli_query($conn, $sql);
$tong=0;
$dem=0;
$i=0;

?>
<div class="giohang">
    <div class="card-body">
    <table class="table">
    <thead class="thead-dark">
    <tr>
    <th></th>
    <th>Tên sản phẩm</th>   
    <th>Ảnh sản phẩm</th>
    <th>Giá sản phẩm</th>
    <th>Số lượng</th>
    <th colspan=2><center>Chỉnh sửa</center></th>
    <th>Xóa</th>
    </tr>
    </thead>
    </div>
    <?php
    $i=1;
    while($row = mysqli_fetch_assoc($query))    
    {
        if($row['username']==$email){
    ?>
    <tr>
        <td><?php echo $i++;?></td>
        <td><?php echo $row['prd_name'];?></td>
        <td><img style="width: 100px"; src="<?php echo $row['image'];?>"></td>
        <td><?php echo $row ['price'];?>đ</td>
        <td><?php echo $row['quantitycart'];?></td>
        <td><a href="themgh.php?id=<?php echo $row['prd_id'];?>">Tăng</a></td>
        <td><a href="giamgh.php?id=<?php echo $row['prd_id'];?>">Giảm</a></td>
        <td><a onclick="return Del('<?php echo $row['prd_name'];?>')" href="xoagh.php?id=<?php echo $row['prd_id'];?>">Xóa</a></td>
    </tr>
<?php
    $tong = $tong + ($row ['price'] * $row['quantitycart']);
    $dem=$dem+1;
    } }
    if($dem==0) echo '<tr><td colspan="8"><center>'.'Chưa có sản phẩm trong giỏ hàng'.'</center></td></tr>';
?>
    <tr><td colspan="8"><b>Tổng tiền: </b><?php echo $tong;?>đ</td></tr>
</table>

<script>
    function Del(name){
    return confirm("Bạn có chắc muốn xóa sản phẩm: "+ name + "?");
}
</script>
</div>





<!-- Thông Tin Shop -->
<div class="footer">
    <div class="container">
        <div class="row">
            <div class="footer-col-2">
                <img src="img/logo.png" alt="">

                <h3>Thông Tin Liên Hệ</h3>
                <ul>
                    <li>Địa Chỉ: Lô 2, A2 Võ Văn Kiệt, Phường An Hải Đông, Quận Sơn Trà, TP. Đà Nẵng</li>
                    <li>Số Điện Thoại:012345678</li>
                 </ul>
            </div>
            <div class="footer-col-3">
                <h3>Các Mặt Hàng Của Shop</h3>
                <ul>
                    <li>Áo Khoác</li>
                    <li>Aó Thun</li>
                    <li>Quần</li>
                    <li>Vaý Đầm</li>
                    <li>Đồ Bộ</li>
                </ul>
            </div>

            <div class="footer-col-4">
                <h3>Theo dõi tại :</h3>
                <ul>
                    <li>facebook</li>
                    <li>Youtube</li>
                    <li>Instagram</li>
                    <li>Twitter</li>
                    <li>Tiktok</li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>
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
    <!--thanh tieu de-->
    <div class="container">
    <div class="navbar">
        <div class="logo">
            <img src="img/logo.png" width="125px" alt="">
        </div>
        <nav>
            <ul id="MenuItems">
                <li><a class="active" href="index.php">Trang Chủ</a></li>
                <li><a href="shop.php">Sản Phẩm</a></li>
                <li><a href="dmsp.php">Danh Muc San Pham</a></li>
                <li><a href="blog.php">Blog</a></li>
                <li><a href="contacy.php">Liên Hệ</a></li>
                <li><a href="account.php">Tài Khoản</a></li>
            </ul>
        </nav>
        <li><a href="dmsp.php"><i class="fa fa-shopping-bag" aria-hidden="true"></i>&emsp;&emsp;</a></li>
        <li><a href="timkiem.php"><i class="far fa-search search-icon"></i>&emsp;&emsp;</a></li>
    </div>
    </div> 
</div></div>





<!--1 san pham-->
<br><br><br><h1>Chi tiết sản phẩm</h1>
<div class="small-container">
<?php
include('ketnoi.php');
$id = $_GET['id'];
$sql = "SELECT * from products inner join brands on products.brand_id = brands.brand_id where prd_id=$id";
$query = mysqli_query($conn, $sql);
$i=1;
    while ($row = mysqli_fetch_assoc($query)) {
    ?>
        <div class="small-container">
        <div class="row">
        <div class="sp">
        <img src="<?php echo $row['image'];?>">
    </div>
        <div class="sp">
        <h1>Giới thiệu sản phẩm</h1></br></br></br>
            <p><?php echo $row['prd_name'];?></p>
            <a href="cart.php" class="btn" >Thêm vào giỏ hàng</a>
            <p><?php echo $row ['price'];?> Đ</p>
        </div>
        </div>
    </div>
        <?php
    }
        ?>
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
<!DOCTYPE html>
<html lang="en">

</html>

<head>
    <meta charset="UTF-8">
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
                        <li><a href="dmsp.php">Danh Mục Sản Phẩm</a></li>
                        <li><a href="blog.php">Blog</a></li>
                        <li><a href="contacy.php">Liên Hệ</a></li>
                        <li><a href="account.php">Tài Khoản</a></li>
                    </ul>
                </nav>
                <li><a href="cart.php"><i class="fa fa-shopping-bag" aria-hidden="true"></i>&emsp;&emsp;</a></li>
                <li><a href="search.php"><i class="far fa-search search-icon"></i>&emsp;&emsp;</a></li>
            </div>
        </div>
    </div>

    <!--San Pham Sap Ra Mat-->
    <div class="small-container">
        <h2 class="title">Sản Phẩm Sắp Ra Mắt</h2>
        <!--Co 4 San Pham-->
        <div class="row">
            <?php
            include('ketnoi.php');
            $sql = "SELECT * from products inner join brands on products.brand_id = brands.brand_id";
            $query = mysqli_query($conn, $sql);
            $i = 1;
            while ($row = mysqli_fetch_assoc($query)) {
                ?>
                <div class="col-4">
                    <a href="product-details.php?id=<?php echo $row['prd_id']; ?>">
                        <img src="<?php echo $row['image']; ?>">
                        <h4>
                            <?php echo $row['prd_name']; ?>
                        </h4>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star" aria-hidden="true"></i>
                    </a>
                </div>
                <p>
                    <?php echo $row['price']; ?>
                </p>
            </div>
            <?php
            }
            ?>
    </div>

    <!--brands-->
    <div class="brands">
        <div class="small-container">
            <div class="row">
                <div class="col-5">
                    <img src="img/logo22.png" alt="">
                </div>

                <div class="col-5">
                    <img src="img/logo 3.png" alt="">
                </div>

                <div class="col-5">
                    <img src="img/logo 44.png" alt="">
                </div>

                <div class="col-5">
                    <img src="img/logo 11.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <div class="clear"></div>

    <!-- Thông Tin Shop -->
    <div class="footer">
        <div class="container">
            <div class="row">
                <div class="footer-col-2">
                    <img src="img/logo.png" alt="">

                    <h3>Thông Tin Liên Hệ</h3>
                    <ul>
                        <li>Địa Chỉ: Lô 2, A2 Võ Văn Kiệt, Phường An Hải Đông, Quận Sơn Trà, TP. Đà Nẵng
                        </li>
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
    </div>
</body>

</html>
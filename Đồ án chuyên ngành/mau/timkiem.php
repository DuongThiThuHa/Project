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


<!-- chức năng tìm kiếm   -->
<br><br>
<div align ="center">
    <form action="timkiem.php" method="get">
    Tìm Kiếm: <input type="text" name="search" />
    <input type="submit" name="ok" value="OK" />
    </form>
</div>
<br><br>
<?php
    include('ketnoi.php');
    // Nếu người dùng submit form thì thực hiện
    // if (isset($_REQUEST['ok'])){
    // Gán hàm addslashes để chống sql injection
    $search = addslashes($_GET['search']);
    // Nếu $search rỗng thì báo lỗi, tức là người dùng chưa nhập liệu mà đã nhấn submit.
    if (empty($search)){
        echo "Yêu cầu nhập đầy đủ thông tin !";
    }else{
        // Dùng câu lênh like trong sql và sứ dụng toán tử % của php để tìm kiếm dữ liệu chính xác hơn.
        $query = "select * from products where prd_name like '%$search%'";
        // Kết nối sql
        // mysql_connect("127.0.0.1:3306", "root","","database");
        // Thực thi câu truy vấn
        $sql = mysqli_query($conn,$query);
        // Đếm số đong trả về trong sql.
        $num = mysqli_num_rows($sql);
        // Nếu có kết quả thì hiển thị, ngược lại thì thông báo không tìm thấy kết quả
        if ($num > 0 && $search != ""){
        // Dùng $num để đếm số dòng trả về.
        echo "$num <b>$search</b>";
        // Vòng lặp while & mysql_fetch_assoc dùng để lấy toàn bộ dữ liệu có trong table và trả về dữ liệu ở dạng array.
        ?>
        <table class="table">
    <thead class="thead-dark">
    <tr>
        <th></th>
    <th>Tên sản phẩm</th>   
    <th>Ảnh sản phẩm</th>
    <th>Giá sản phẩm</th>
    <th>Số lượng sản phẩm</th> 
    <th>Mô tả sản phẩm</th>
    </tr>
        <?php
            $i=1;
            while ($row = mysqli_fetch_assoc($sql)){
                ?> 
                <tr>
                    <td><?php echo $i++;?></td>
                    <td><?php echo $row['prd_name'];?></td>
                    <td><img style="width: 100px"; src="<?php echo $row['image'];?>"></td>
                    <td><?php echo $row ['price'];?></td>
                    <td><?php echo $row['quantily'];?></td>
                    <td><?php echo $row['description'];?></td>
            </tr>
    <?php
                }
                    echo '</thead></table>';
                }else {
                    echo "Không tìm thấy sản phẩm !";
                }
            }
        // }
?>   
<br><br><br><br>

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

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
<?php
	header('Content-Type:text/html;charset=UTF-8');
	if (isset($_POST['login'])) 
	{
	    include('ketnoi.php');
    session_start();
	    //Lấy dữ liệu nhập vào
	    $email = addslashes($_POST['email']);
	    $password = addslashes($_POST['password']);  
	    //Kiểm tra đã nhập đủ tên đăng nhập với mật khẩu chưa
	    if (!$email || !$password) {
	        echo "<br>vui lòng nhập đầy đủ tên đăng nhập và mật khẩu.<br><br>trở lại<br><br></a>";
	        exit;
	    }
	    // mã hóa pasword
	    $password = md5($password);  
	    //Kiểm tra tên đăng nhập có tồn tại không
	    $query = mysqli_query($conn,"SELECT email,password from member where email='$email'");
	    if (mysqli_num_rows($query) == 0) {
	        echo "<br>tên đăng nhập này không tồn tại.<br><br>vui lòng kiểm tra lại.<br><br>trở lại<br><br></a>";
	        exit;
	    }
	    //Lấy mật khẩu trong database ra
	    $row = mysqli_fetch_array($query);
	    //So sánh 2 mật khẩu có trùng khớp hay không
	    if ($password != $row['password']){
	        echo "<br>mật khẩu không đúng.<br><br>vui lòng nhập lại.<br><br>trở lại<br><br></a>";
	        exit;
	    }
	    //Lưu tên đăng nhập
	    $_SESSION['email'] = $email;
	    header("location: index.php");
		exit;
}
?>
<div class="list_a">
<div class = "login">
</br></br></br>
    <center>
        <h2><strong>ĐĂNG NHẬP TÀI KHOẢN</strong></h2></br></br>
        </center>	
        <form action='account.php' method='POST'>
        <eenter>
            <center>
                Email <input type = "text" name = "email"/></br></br>
                Mật khẩu <input type = "password" name = "password"/></br></br>
                <input type = "submit" name = "login" value = "ĐĂNG NHẬP"/></br></br>
		        Bạn chưa có tài khoản? <a href='dangky.php' title='Đăng ký'>ĐĂNG KÝ tại đây</a></br></br>
				Đăng nhập với quyền quản lý? <a href='login-ad.php' title='Đăng nhap ad'>Tại đây</a></br></br>
				<input type=hidden name="id" value="user">
            </center>
        </eenter>
        </form>
</div>
</div>
</div>
</br></br></br></br>

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
                    <li>Facebook</li>
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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sunni Shop</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
</head>
<body>
    <div class="header">
<!-- Thanh Tiêu Đề -->
<div class="container">
    <div class="navbar">
        <div class="logo">
            <img src="img/logo.png" alt="" width="125px" >
        </div>
        <nav>
            <ul>
                <li><a class="active" href="index.php">Trang Chủ</a></li>
                <li><a href="shop.php">Shop</a></li>
                <li><a href="dmsp.php">Danh Mục Sản Phẩm</a></li>
                <li><a href="blog.php">Giới Thiệu</a></li>
                <li><a href="lienhe.php">Liên Hệ</a></li>
                <li><a href="account.php">Tài Khoản</a></li>
            </ul>
        </nav>  
        <img src="img/cart.png" alt="" width="30px" height="30px" >
    </div>
</div>  
</div>
</div>  

<?php
    header('Content-Type:text/html;charset=UTF-8');
	if(isset($_POST['dangky'])){
	    include('ketnoi.php');	     
	    $username = addslashes($_POST['username']);
	    $phonenumber = addslashes($_POST['phonenumber']);
        $email = addslashes($_POST['email']);
        $password = addslashes($_POST['password']);
    if(!$username || !$phonenumber || !$email || !$password ){
        echo "<br>vui lòng nhập đầy đủ thông tin.<br><br><a href='dangky.php'>trở lại<br><br></a>".'</center>';
        exit;}   
        $password = md5($password);
    if(mysqli_num_rows(mysqli_query($conn,"SELECT username from member where username='$username'")) > 0){
        echo "<br>tên đăng nhập này đã có người dùng.<br><br>vui lòng chọn tên đăng nhập khác.<br><br><a href='dangky.php'>trở lại<br><br></a>";
        exit;}
    if(!preg_match("/[_a-z0-9-]*@[a-z0-9-]*(\.[a-z]{2,4})$/", $email)){
        echo "<br>email không hợp lệ.<br><br>vui lòng nhập lại email.<br><br> <a href='dangky.php'>trở lại<br><br></a>";
        exit;}
    if(mysqli_num_rows(mysqli_query($conn,"SELECT email from member where email='$email'")) > 0){
        echo "<br>email này đã có người dùng.<br><br>vui lòng chọn email khác.<br><br> <a href='dangky.php'>trở lại<br><br></a>";
        exit;}  
    $addmember = mysqli_query($conn,"
        insert into member(username,phonenumber,email,password)
        values(
            '{$username}',
            '{$phonenumber}',
            '{$email}',
            '{$password}')");             
        $_SESSION['email'] = $email;
	    header("location:account.php");
		exit;
    }
?>

<div class="list_b">
<br><br><br><br>
<div class = "dangky">
    <center>
        <h2><strong>ĐĂNG KÝ TÀI KHOẢN</strong></h2></br>
    </center>	
    <form action='dangky.php' method='POST'>
    <eenter>
        <center>
            Họ và tên <input type = "text" name = "username"/>
            <br><br>
            Số điện thoại <input type = "text" name = "phonenumber"/>
            <br><br>
            Email <input type = "text" name = "email"/>
            <br><br>
            Mật khẩu <input type = "password" name = "password"/>
            <input type = "submit" name = "dangky" value = "TẠO TÀI KHOẢN"/></br></br>
            Bạn đã có tài khoản?<a href='account.php' title='Đăng nhập'>Đăng nhập</a>
        </center>
    </eenter>
    </form>
</div>
</div>
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
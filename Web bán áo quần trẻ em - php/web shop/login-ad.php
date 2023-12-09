<?php
	header('Content-Type:text/html;charset=UTF-8');
	if (isset($_POST['login-ad'])) 
	{
	    include('ketnoi.php');
	    //Lấy dữ liệu nhập vào
	    $username = addslashes($_POST['username']);
	    $password = addslashes($_POST['password']);  
	    //Kiểm tra đã nhập đủ tên đăng nhập với mật khẩu chưa
	    if (!$username || !$password) {
	        echo "<br>vui lòng nhập đầy đủ tên đăng nhập và mật khẩu.<br><br>trở lại<br><br></a>";
	        exit;
	    }
	    // mã hóa pasword
	    //Kiểm tra tên đăng nhập có tồn tại không
	    $query = mysqli_query($conn,"SELECT username,password from admin where username='$username'");
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
	    $_SESSION['username'] = $username;
	    header("location: danhsach.php");
		exit;
}
?>
<div class="list_a">
<br><br><br><br><br><br><br><br><br>
<div class = "login-ad">
    <center>
        <h2><strong>ĐĂNG NHẬP ADMIN</strong></h2>
        </center>	
        <form action='login-ad.php' method='POST'>
        <eenter>
            <center>
                Tên Đăng Nhập <input type = "text" name = "username"/>
                Mật khẩu <input type = "password" name = "password"/>
                <input type = "submit" name = "login-ad" value = "ĐĂNG NHẬP"/>
            </center>
        </eenter>
        </form>
</div>
</div>
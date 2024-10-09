import "./login.css";
import { Link, useNavigate } from "react-router-dom";
import { useState } from "react";
import { loginUser } from "../../redux/apiRequest";
import { useDispatch } from "react-redux";
const Login = () => {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const dispatch = useDispatch();
  const navigate = useNavigate();

  const handleLogin = (e) => {
    e.preventDefault();
    const newUser = {
      username: username,
      password: password,
    };
    loginUser(newUser, dispatch, navigate);
  };
  return (
    <section className="login-container">
      <div className="login-title"> Đăng Nhập</div>
      <form onSubmit={handleLogin}>
        <label>USERNAME</label>
        <input
          class ="nameinput"
          type="text"
          placeholder="Enter your username"
          onChange={(e) => setUsername(e.target.value)}
        />
        <label>PASSWORD</label>
        <input
          class ="passwordinput"
          type="password"
          placeholder="Enter your password"
          onChange={(e) => setPassword(e.target.value)}
        />
        <button class="loginbutton" type="submit"> Đăng Nhập </button>
      </form>
      <div className="login-register"> Bạn chưa có tài khoản? </div>
      <Link className="login-register-link" to="/register">
        Đăng ký Ngay!
      </Link>
      
    </section>
  );
};

export default Login;

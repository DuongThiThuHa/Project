import { useState } from "react";
import { useDispatch } from "react-redux";
import { useNavigate } from "react-router-dom";
import { registerUser } from "../../redux/apiRequest";
import "./register.css";
const Register = () => {
  const [email,setEmail] = useState("");
  const [username,setUsername] = useState("");
  const [password,setPassword] = useState("");
  const dispatch = useDispatch();
  const navigate = useNavigate();

  const handleRegister= (e)=>{
    e.preventDefault();
    const newUser = {
      username:username,
      email: email,
      password:password,
    };
    registerUser(newUser,dispatch,navigate);
  }
  return (
    <section className="register-container">
      <div className="register-title"> Đăng Ký </div>
      <form onSubmit={handleRegister}>
        <label>EMAIL</label>
        <input
          class="input"
          type="text"
          placeholder="Enter your email"
          onChange={(e)=>setEmail(e.target.value)}
        />
        <label>USERNAME</label>
        <input
        class="input"
          type="text"
          placeholder="Enter your username"
          onChange={(e)=>setUsername(e.target.value)}
        />
        <label>PASSWORD</label>
        <input
        class="input"
          type="password"
          placeholder="Enter your password"
          onChange={(e)=>setPassword(e.target.value)}
        />
        <button class="buttonr" type="submit"> Tạo Tài Khoản </button>
      </form>
    </section>
  );
};

export default Register;

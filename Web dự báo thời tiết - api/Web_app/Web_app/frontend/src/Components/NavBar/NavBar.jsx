
import { Link, useNavigate } from "react-router-dom";
import {useDispatch, useSelector} from "react-redux";
import "./navbar.css";
import { logOut } from "../../redux/apiRequest";
import { createAxios } from "../../createInstance";
import { logOutSuccess } from "../../redux/authSlice";
//import {cities} from"./data";

const NavBar = () => {
  const user = useSelector((state)=> state.auth.login.currentUser);
  const accessToken = user?.accessToken;
  const id = user?._id;
  const dispatch = useDispatch();
  const navigate = useNavigate();
  let axiosJWT = createAxios(user,dispatch,logOutSuccess);

  const cities = [
]

  const handleLogout = () =>{
    logOut(dispatch,id,navigate, accessToken,axiosJWT);
  }
  return (
    <nav className="navbar-container">
      
      {user? (
        <>
      <div className="city">
      {cities.map((city) => (
        <button
          key={city.id}
          className="text-white text-base font-medium cursor-pointer transition ease-out hover:scale-150"
        >
          {city.title}
        </button>
      ))}
      </div>

        {/* <Link to="/" className="navbar-home"> Home </Link> */}
        <div className="user-logout">
        <p className="navbar-user">Hi, <span>  {user.username} </span> </p>
        <Link to="/logout" className="navbar-logout" onClick={handleLogout}> Log out</Link></div>
        </>
      ) : (    
        <>
      <Link to="/login" className="navbar-login"> Login </Link>
      <Link to="/register" className="navbar-register"> Register</Link>
      </>
)}
    </nav>
  );
};

export default NavBar;

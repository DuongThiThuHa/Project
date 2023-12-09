// import { useEffect } from "react";
// import { useDispatch, useSelector } from "react-redux";
// import { useNavigate } from "react-router-dom";
// import jwt_decode from "jwt-decode";
// import { getAllUsers } from "../../redux/apiRequest";
// import { createAxios } from "../../createInstance";
// import axios from "axios";
// import "./home.css";
// import { loginSuccess } from "../../redux/authSlice";

// const HomePage = () => {
//   const user = useSelector((state) => state.auth.login?.currentUser);
//   const userList = useSelector((state) => state.users.users?.allUsers);
//   const msg = useSelector((state) => state.users?.msg);
//   const dispatch = useDispatch();
//   const navigate = useNavigate();
//   let axiosJWT = createAxios(user, dispatch, loginSuccess);

//   // const handleDelete = (id) => {
//   //   deleteUser(user?.accessToken, dispatch, id, axiosJWT);
//   // };

//   useEffect(() => {
//     if (!user) {
//       navigate("/login");
//     }
//     if (user?.accessToken) {
//       getAllUsers(user?.accessToken, dispatch, axiosJWT);
//     }
//   }, []);

//   return (
//     <main className="home-container">
//       <div className="home-title">User List</div>
//       <div className="home-role">
//         {`Your role: ${user?.admin ? `Admin` : `User`}`}
//       </div>
//       <div className="home-userlist">
//         {userList?.map((user) => {
//           return (
//             <div className="user-container">
//               <div className="home-user">{user.username}</div>
//               <div
//                 className="delete-user"
//                 // onClick={() => handleDelete(user._id)}
//               >
//                 {" "}
//                 Delete{" "}
//               </div>
//             </div>
//           );
//         })}
//       </div>
//       <div className="errorMsg">{msg}</div>
//     </main>
//   );
// };

// export default HomePage;
import "./home.css";
import TopButtons from "../TopButtons";
import Inputs from "../Inputs";
import TimeAndLocation from "../TimeAndLocation";
import TemperatureAndDetails from "../TemperatureAndDetails";
import Forecast from "../Forecast";
import getFormattedWeatherData from "../services/weatherService";
import { useEffect, useState } from "react";
import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";


function HomePage() {
  const [query, setQuery] = useState({ q: "Hanoi" });
  const [units, setUnits] = useState("metric");
  const [weather, setWeather] = useState(null);

  useEffect(() => {
    const fetchWeather = async () => {
      const message = query.q ? query.q : "current location.";

      toast.info("Fetching weather for " + message);

      await getFormattedWeatherData({ ...query, units }).then((data) => {
        toast.success(
          `Successfully fetched weather for ${data.name}, ${data.country}.`
        );

        setWeather(data);
      });
    };

    fetchWeather();
  }, [query, units]);

  const formatBackground = () => {
    if (!weather) return "from-cyan-700 to-blue-700";
    const threshold = units === "metric" ? 20 : 60;
    if (weather.temp <= threshold) return "from-cyan-700 to-blue-700";

    return "from-yellow-700 to-orange-700";
  };

  return (
    <div
      className={`mx-auto max-w-screen-md mt-4 py-5 px-32 bg-gradient-to-br  h-fit shadow-xl shadow-gray-400 ${formatBackground()}`}
    >
      <TopButtons setQuery={setQuery} />
      <Inputs setQuery={setQuery} units={units} setUnits={setUnits} />

      {weather && (
        <div>
          <TimeAndLocation weather={weather} />
          <TemperatureAndDetails weather={weather} />

          <Forecast title="hourly forecast" items={weather.hourly} />
          <Forecast title="daily forecast" items={weather.daily} />
        </div>
      )};

      <ToastContainer autoClose={5000} theme="colored" newestOnTop={true} />
    </div>
  );
}

export default HomePage;

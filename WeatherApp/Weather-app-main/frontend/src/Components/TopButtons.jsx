import React from "react";

function TopButtons({ setQuery }) {
  const cities = [
    {
      id: 1,
      title: "Da Nang",
    },
    {
      id: 2,
      title: "Ha Noi",
    },
    {
      id: 3,
      title: "Hue",
    },
    {
      id: 4,
      title: "HaiPhong",
    },
    {
      id: 5,
      title: "Ho Chi Minh",
    },
  ];

  return (
    <div className="flex items-center justify-around my-6">
      {cities.map((city) => (
        <button
          key={city.id}
          className="text-white text-lg font-medium"
          onClick={() => setQuery({ q: city.title })}
        >
          {city.title}
        </button>
      ))}
    </div>
  );
}

export default TopButtons;

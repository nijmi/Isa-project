function getCurrentDate() {
      const date = new Date();
      const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
      return date.toLocaleDateString('en-US', options);
    }
    document.getElementById("date-container").innerText = getCurrentDate();

    // Fetch weather by city name
    function fetchWeatherData(city) {
      const apiKey = '8bdcd617b04e9085eb16159753a60754';
      const url = `https://api.openweathermap.org/data/2.5/weather?q=${encodeURIComponent(city)}&appid=${apiKey}&units=metric`;

      fetch(url)
        .then(res => res.json())
        .then(data => {
          if (data.cod === 200) {
            const iconUrl = `https://openweathermap.org/img/wn/${data.weather[0].icon}@2x.png`;
            document.getElementById("weather-icon").src = iconUrl;
            document.getElementById("weather-icon").style.display = 'block';
            document.getElementById("weather-icon").alt = data.weather[0].description;

            document.getElementById("city-name").innerText = `City: ${data.name}, ${data.sys.country}`;
            document.getElementById("temperature").innerText = `Temperature: ${data.main.temp}°C`;
            document.getElementById("feels-like").innerText = `Feels like: ${data.main.feels_like}°C`;
            document.getElementById("pressure").innerText = `Pressure: ${data.main.pressure} hPa`;
            document.getElementById("description").innerText = `Currently: ${data.weather[0].description}`;
            document.getElementById("humidity").innerText = `Humidity: ${data.main.humidity}%`;
            document.getElementById("windspeed").innerText = `Wind Speed: ${data.wind.speed} m/s`;
          } else {
            alert("City not found. Please try again.");
          }
        })
        .catch(err => {
          console.error(err);
          alert("An error occurred. Please try again later.");
        });
    }

    // On button click, get city and fetch data
    document.getElementById("get-weather-btn").addEventListener("click", () => {
      const city = document.getElementById("city-input").value.trim();
      if (city) {
        fetchWeatherData(city);
      } else {
        alert("Please enter a city!");
      }
    });

    // Load Edinburgh weather on page load
    window.addEventListener("DOMContentLoaded", () => {
      document.getElementById("city-input").value = "Edinburgh";
      fetchWeatherData("Edinburgh");
    });
 function getCurrentDate() {
      const date = new Date();
      const options = { month: 'short', day: 'numeric', year: 'numeric' };
      return date.toLocaleDateString('en-US', options);
    }
    document.getElementById("date-container").innerText = getCurrentDate();

    function displayWeather(data, lastUpdated) {
      document.getElementById("weather-icon").src = data.icon_url;
      document.getElementById("weather-icon").style.display = 'block';
      document.getElementById("weather-icon").alt = data.description;

      document.getElementById("city-name").innerText = `City: ${data.name}, ${data.country}`;
      document.getElementById("temperature").innerText = `Temperature: ${data.temp}°C`;
      document.getElementById("feels-like").innerText = `Feels like: ${data.feels_like}°C`;
      document.getElementById("pressure").innerText = `Pressure: ${data.pressure}`;
      document.getElementById("description").innerText = `Currently: ${data.description}`;
      document.getElementById("humidity").innerText = `Humidity: ${data.humidity}%`;
      document.getElementById("windspeed").innerText = `Wind Speed: ${data.wind_speed} m/s`;
      document.getElementById("last-updated").innerText = `Last updated: ${new Date(lastUpdated).toLocaleString()}`;
    }

    function fetchWeatherData(city) {
      const apiKey = '8bdcd617b04e9085eb16159753a60754';
      const url = `https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${apiKey}&units=metric`;

      fetch(url)
        .then(response => response.json())
        .then(data => {
          if (data.cod === 200) {
            const iconUrl = `https://openweathermap.org/img/wn/${data.weather[0].icon}@2x.png`;

            const weatherData = {
              name: data.name,
              country: data.sys.country,
              temp: data.main.temp,
              feels_like: data.main.feels_like,
              pressure: data.main.pressure,
              humidity: data.main.humidity,
              wind_speed: data.wind.speed,
              description: data.weather[0].description,
              icon_url: iconUrl
            };

            displayWeather(weatherData, new Date().toISOString());

            // Save to backend
            fetch(`http://localhost/weather/db.php?city=${city}`, {
              method: 'POST',
              headers: { 'Content-Type': 'application/json' },
              body: JSON.stringify(weatherData)
            });
          } else {
            alert('City not found. Please try again.');
          }
        })
        .catch(error => {
          console.error('Error fetching weather data:', error);
          alert('An error occurred. Please try again later.');
        });
    }

    function checkAndFetchWeatherData(city) {
      fetch(`http://localhost/weather/checkWeather.php?city=${city}`)
        .then(response => response.json())
        .then(data => {
          const lastUpdated = new Date(data.recorded_at);
          const now = new Date();
          const diffInHours = (now - lastUpdated) / (1000 * 60 * 60);

          if (diffInHours >= 2) {
            fetchWeatherData(city); // Data too old, fetch new
          } else {
            fetch(`http://localhost/weather/getCachedWeather.php?city=${city}`)
              .then(res => res.json())
              .then(cachedData => {
                displayWeather(cachedData, cachedData.recorded_at);
              });
          }

          setTimeout(() => checkAndFetchWeatherData(city), 2 * 60 * 60 * 1000); // Repeat after 2 hours
        })
        .catch(error => {
          console.error('Error checking weather data:', error);
          fetchWeatherData(city); // Fallback
        });
    }

    // Default city on load
    window.onload = () => {
      document.getElementById("city-input").value = "Edinburgh";
      checkAndFetchWeatherData("Edinburgh");
    };

    // On button click
    document.getElementById("get-weather-btn").addEventListener("click", () => {
      const city = document.getElementById("city-input").value.trim();
      if (city) {
        checkAndFetchWeatherData(city);
      } else {
        alert("Please enter a city!");
      }
    });
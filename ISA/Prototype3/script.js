// Show current date
function getCurrentDate() {
    const date = new Date();
    const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
    return date.toLocaleDateString('en-US', options);
}
document.getElementById("date-container").innerText = getCurrentDate();

// Display weather data
function displayWeather(data) {
    const iconCode = data.weather[0].icon;
    const iconUrl = `https://openweathermap.org/img/wn/${iconCode}@2x.png`;
    const condition = data.weather[0].description;

    document.getElementById("weather-icon").src = iconUrl;
    document.getElementById("weather-icon").style.display = 'block';
    document.getElementById("weather-icon").alt = condition;

    document.getElementById("city-name").innerText = `City: ${data.name}, ${data.sys.country}`;
    document.getElementById("temperature").innerText = `Temperature: ${data.main.temp}°C`;
    document.getElementById("feels-like").innerText = `Feels like: ${data.main.feels_like}°C`;
    document.getElementById("pressure").innerText = `Pressure: ${data.main.pressure}`;
    document.getElementById("description").innerText = `Currently: ${condition}`;
    document.getElementById("humidity").innerText = `Humidity: ${data.main.humidity}%`;
    document.getElementById("windspeed").innerText = `Wind Speed: ${data.wind.speed} m/s`;
}

// Save weather data to localStorage
function saveWeatherData(city, data) {
    const weatherData = {
        city: city,
        data: data,
        timestamp: new Date().getTime()
    };
    localStorage.setItem(city, JSON.stringify(weatherData));
}

// Check localStorage for valid weather data
function getWeatherDataFromLocalStorage(city) {
    const storedData = localStorage.getItem(city);
    if (storedData) {
        const weatherData = JSON.parse(storedData);
        const now = new Date().getTime();
        const diffInHours = (now - weatherData.timestamp) / (1000 * 60 * 60);
        if (diffInHours < 2) {
            console.log(" Using cached weather data.");
            displayWeather(weatherData.data);
            return true;
        } else {
            console.log(" Cached data expired.");
        }
    }
    return false;
}

// Fetch weather data from OpenWeather
async function fetchWeatherData(city) {
    const apiKey = '8bdcd617b04e9085eb16159753a60754';
    const url = `https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${apiKey}&units=metric`;

    try {
        const response = await fetch(url);
        const text = await response.text();

        try {
            const data = JSON.parse(text);

            if (data.cod === 200) {
                displayWeather(data);
                saveWeatherData(city, data);
            } else {
                alert(` Error: ${data.message}`);
                console.error("City not found or API error:", data.message);
            }
        } catch (e) {
            console.error(" Failed to parse JSON:", text);
            alert(" Unexpected server response. Try again later.");
        }
    } catch (error) {
        console.error(" Network error:", error);
        alert("Network error. Please check your internet.");
    }
}

//  Your requested logging version of this function
function checkAndFetchWeatherData(city) {
    if (!getWeatherDataFromLocalStorage(city)) {
        console.log(" Fetching new weather data...");
        fetchWeatherData(city);
    } else {
        console.log(" Using existing weather data.");
    }
}

// Load weather on page load
window.onload = () => {
    checkAndFetchWeatherData('Edinburgh'); // Default city
};

// Search button
document.getElementById('get-weather-btn').addEventListener('click', () => {
    const city = document.getElementById('city-input').value.trim();
    if (city) {
        checkAndFetchWeatherData(city);
    } else {
        alert(' Please enter a city name.');
    }
});

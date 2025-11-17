<?php
header('Content-Type: application/json');

// Enable CORS for a specific domain 
header("Access-Control-Allow-Origin:http://nijmi.free");  
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

$serverName = "sql107.infinityfree.com";
$userName = "if0_38247584";
$passWord = "tboHZg5OvDL1A";
$conn = mysqli_connect($serverName, $userName, $passWord);

if (!$conn) {
    die(json_encode(["error" => "Failed to connect to database: " . mysqli_connect_error()])); 
}

mysqli_select_db($conn, 'if0_38247584_nijmi');
$createTableQuery = "CREATE TABLE IF NOT EXISTS weather (
    id INT AUTO_INCREMENT PRIMARY KEY,
    city_name VARCHAR(255) NOT NULL,
    temperature FLOAT NOT NULL,
    feels_like FLOAT NOT NULL,
    pressure INT NOT NULL,
    description VARCHAR(255) NOT NULL,
    humidity INT NOT NULL,
    wind_speed FLOAT NOT NULL,
    recorded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)";

if (!mysqli_query($conn, $createTableQuery)) {
    echo json_encode(["status" => "error", "message" => "Failed to create weather table"]);
    exit;
}

// Get the city parameter from the URL
$weather = $_GET['city'] ?? "Edinburgh"; // Default to Edinburgh if no city is provided

// Checking the city name before using in the SQL query
$weather = mysqli_real_escape_string($conn, $weather); // Escape special characters in the string

// Query the database for the weather data of the requested city
$selectQuery = "SELECT * FROM weather WHERE city_name='$weather' ORDER BY recorded_at DESC LIMIT 1";
$result = mysqli_query($conn, $selectQuery);

if (mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
    $recordedAt = $row['recorded_at'];

    // Check if the data is older than 2 hours
    $currentTime = new DateTime();
    $recordedTime = new DateTime($recordedAt);
    $interval = $currentTime->diff($recordedTime);

    if ($interval->h < 2) {
        // If the data is less than 2 hours old, return it
        echo json_encode(["status" => "success", "data" => $row]);
        exit; // Exit after returning the cached data
    }
}

// Fetch new data from OpenWeather if the data is outdated or not found in the database
$apiKey = '8bdcd617b04e9085eb16159753a60754';
$url = "https://api.openweathermap.org/data/2.5/weather?q=" . urlencode($weather) . "&appid=" . $apiKey . "&units=metric";
$response = file_get_contents($url);
$data = json_decode($response, true);

if (isset($data['main'])) {
    // Extract the weather data from OpenWeather API response
    $city_name = mysqli_real_escape_string($conn, $data['name']);
    $temp = $data['main']['temp'];
    $feels_like = $data['main']['feels_like'];
    $pressure = $data['main']['pressure'];
    $description = mysqli_real_escape_string($conn, $data['weather'][0]['description']);
    $humidity = $data['main']['humidity'];
    $wind_speed = $data['wind']['speed'];

    // Insert the new data into the database
    $insertQuery = "INSERT INTO weather(city_name, temperature, feels_like, pressure, description, humidity, wind_speed)
                    VALUES('$city_name', $temp, $feels_like, $pressure, '$description', $humidity, $wind_speed)";
    
    if (mysqli_query($conn, $insertQuery)) {
        echo json_encode(["status" => "success", "data" => [
            'city_name' => $city_name,
            'temperature' => $temp,
            'feels_like' => $feels_like,
            'pressure' => $pressure,
            'description' => $description,
            'humidity' => $humidity,
            'wind_speed' => $wind_speed
        ]]);
    } else {
        echo json_encode(["status" => "error", "message" => "Error saving weather data"]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Error fetching data from OpenWeather"]);
}

// Close the database connection
mysqli_close($conn);
?>

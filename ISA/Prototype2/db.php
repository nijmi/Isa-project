<?php
include("checkWeather.php");

$city = $_GET['city'] ?? "Edinburgh";
$city = mysqli_real_escape_string($conn, $city);

$apiKey = '8bdcd617b04e9085eb16159753a60754';
$apiUrl = "https://api.openweathermap.org/data/2.5/weather?q=" . urlencode($city) . "&appid=$apiKey&units=metric";
$response = file_get_contents($apiUrl);
$data = json_decode($response, true);

if (isset($data['main'])) {
    $city_name = mysqli_real_escape_string($conn, $data['name']);
    $country = mysqli_real_escape_string($conn, $data['sys']['country']);
    $temperature = $data['main']['temp'];
    $feels_like = $data['main']['feels_like'];
    $pressure = $data['main']['pressure'];
    $humidity = $data['main']['humidity'];
    $wind_speed = $data['wind']['speed'];
    $description = mysqli_real_escape_string($conn, $data['weather'][0]['description']);
    $icon = $data['weather'][0]['icon'];
    $icon_url = "https://openweathermap.org/img/wn/$icon@2x.png";

    $insert = "INSERT INTO weather (city_name, country, temperature, feels_like, pressure, description, humidity, wind_speed, icon_url) 
               VALUES ('$city_name', '$country', $temperature, $feels_like, $pressure, '$description', $humidity, $wind_speed, '$icon_url')";
    mysqli_query($conn, $insert);

    echo json_encode([
        "status" => "success",
        "source" => "api",
        "data" => [
            "city_name" => $city_name,
            "country" => $country,
            "temperature" => $temperature,
            "feels_like" => $feels_like,
            "pressure" => $pressure,
            "description" => $description,
            "humidity" => $humidity,
            "wind_speed" => $wind_speed,
            "icon_url" => $icon_url,
            "recorded_at" => date('Y-m-d H:i:s')
        ]
    ]);
} else {
    echo json_encode(["status" => "error", "message" => "City not found."]);
}
mysqli_close($conn);
?>

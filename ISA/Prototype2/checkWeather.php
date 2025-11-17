<?php
include("db.php");

$city = $_GET['city'] ?? "Edinburgh";
$city = mysqli_real_escape_string($conn, $city);

$query = "SELECT * FROM weather WHERE city_name='$city' ORDER BY recorded_at DESC LIMIT 1";
$result = mysqli_query($conn, $query);

if ($result && mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
    $last = new DateTime($row['recorded_at']);
    $now = new DateTime();
    $diff = $now->getTimestamp() - $last->getTimestamp();

    if ($diff < 2 * 3600) { // less than 2 hours
        echo json_encode(["status" => "success", "source" => "cache", "data" => $row]);
    } else {
        echo json_encode(["status" => "stale", "message" => "Cached data too old."]);
    }
} else {
    echo json_encode(["status" => "none", "message" => "No cached data found."]);
}
mysqli_close($conn);
?>

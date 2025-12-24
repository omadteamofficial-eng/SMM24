<?php
// Renderda yoki Dockerda Environment o'zgaruvchilardan oladi
$host = getenv('DB_HOST') ?: 'db'; 
$user = getenv('DB_USER') ?: 'bot_user';
$pass = getenv('DB_PASS') ?: 'bot_password';
$db   = getenv('DB_NAME') ?: 'bot_database';

$connect = mysqli_connect($host, $user, $pass, $db);

if (!$connect) {
    die("Baza bilan aloqa yo'q: " . mysqli_connect_error());
}
mysqli_set_charset($connect, "utf8mb4");
?>


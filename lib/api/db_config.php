<?php

//MySql server and database info
$db = "ambulance_app_db";
$host = "localhost";
$db_user = 'root';
$db_password = '';

//connecting to database
$conn = mysqli_connect($host, $db_user, $db_password, $db);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";
?>
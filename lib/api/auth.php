<?php
include('db_config.php');

//checks if both email and password where entered
if (isset($_POST["username"]) && isset($_POST["password"])) {


  $username = $_POST["username"];
  $password = $_POST["password"];

  $username = mysqli_real_escape_string($conn, $username);


  $sql = "SELECT * FROM user WHERE username = '$username'";


  $res = mysqli_query($conn, $sql);
  $numrows = mysqli_num_rows($res);


  if ($numrows > 0) {
    //is there is any data with that email
    $obj = mysqli_fetch_object($res);

    if ($password == $obj->password) {
      $return["success"] = true;
      $return["user_id"] = $obj->user_id;
      $return["username"] = $obj->username;
      $return["user_profile"] = $obj->user_profile;
      $return["merchant_name"] = $obj->merchant_name;
      $return["cellphone"] = $obj->cellphone;
      $return["user_type"] = $obj->user_type;
    }
  }
}
mysqli_close($conn);

header('Content-Type: application/json');

echo json_encode($return);

?>
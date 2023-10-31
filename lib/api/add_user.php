<?php

require_once("db_config.php");

$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
        
    case 'POST':
        $signin_type = $_REQUEST["user_type"];

        echo $signin_type;

        switch ($signin_type) {
            /*
             * --------------------
             * google signup
             * -------------------
            */
            case "user":
                $merchant_name = "";
                $merchant_address = "";
                $cellphone = "";
                $email_address = "";
                $town_city = "";
                $username = "";
                $password = "";
                $user_profile = "";

                $merchant_name =  mysqli_real_escape_string($conn, $_POST["patient_name"]);
                $merchant_address = mysqli_real_escape_string($conn, $_POST["patient_address"]);
                $cellphone = mysqli_real_escape_string($conn, $_POST["cellphone"]);
                $email_address = mysqli_real_escape_string($conn, $_POST["Email"]);
                $town_city = mysqli_real_escape_string($conn, $_POST["town_city"]);
                $username = mysqli_real_escape_string($conn, $_POST["username"]);
                $password = mysqli_real_escape_string($conn, $_POST["password"]);
                $user_profile = mysqli_real_escape_string($conn, $_POST["profile"]);

                $errors = array();
                $data = "success";

                $user_check_query = "SELECT * FROM user WHERE username = '$username' LIMIT 1";

                $result = mysqli_query($conn, $user_check_query);
                $user = mysqli_fetch_assoc($result);

                if ($user) { // if user exists
                    if ($user['username'] === $username) {
                        array_push($errors, "Username already exists");
                    }
                }
                if (count($errors) == 0) {

                $query = "INSERT INTO user(merchant_name, merchant_address, cellphone, email_address, town_city, username,password,user_profile,user_type)
                    VALUES ('$merchant_name','$merchant_address','$cellphone','$email_address','$town_city','$username','$password','$user_profile','$signin_type')";

                    mysqli_query($conn, $query) or die(mysqli_error($co));

                    echo "$merchant_name";
                    echo "$merchant_address";
                    echo "$cellphone";
                    echo "$email_address";
                    echo "$town_city";
                    echo "$username";
                    echo "$password";
                    echo "$user_profile";
                }

                mysqli_close($conn);
                header('Content-Type: application/json');
                echo json_encode($errors);
                break;
        }
    break;
}
?>
<?php
// Database connection parameters
$servername = "localhost"; // Change this if your database is hosted elsewhere
$username = "root";
$password = "";
$dbname = "phpdemo";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Function to sanitize input data
function sanitize_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

// Process form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sanitize inputs
    $name = sanitize_input($_POST["name"]);
    $lastname = sanitize_input($_POST["lastname"]);
    $mobilenumber = sanitize_input($_POST["mobilenumber"]);
    $address = sanitize_input($_POST["address"]);
    $email = sanitize_input($_POST["email"]);
    $password = sanitize_input($_POST["password"]);
    $confirm_password = sanitize_input($_POST["confirm_password"]);
    // Insert user data into database
    $sql = "INSERT INTO register (name, lastname, mobilenumber, address, email, password,confirm_password)
    VALUES ('$name', '$lastname', '$mobilenumber', '$address', '$email', '$password','$confirm_password')";

    if ($conn->query($sql) === TRUE) {
        // echo "New record created successfully";
        header("Location:../login.html");
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

// Close connection
$conn->close();
?>

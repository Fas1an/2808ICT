<html>
<body>

<?php
$servername = "localhost";
$username = "admin_staff_enrollment_121";
$password = "Password8!";
$dbname = "assignment2_121";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
echo "Connected successfully <br> <br>"; 
  

$first_name = $_POST['input2'];
$last_name = $_POST['input3'];
$DOB = $_POST['input4'];
$Gender = $_POST['input5'];
$phone = $_POST['input6'];

$bytes = random_bytes(20);
$randomid = bin2hex($bytes);
$sql = "INSERT INTO tbl_person_details (id_person,first_name, last_name, DOB, gender, mobile_phone) VALUES ('$randomid', '$first_name', '$last_name', '$DOB', '$Gender', '$phone')";

if ($conn->multi_query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}
  
$conn->close();
?><br><br>
 

Input 2  <?php echo $_POST["input2"]; ?><br>
Input 3  <?php echo $_POST["input3"]; ?><br>
Input 4  <?php echo $_POST["input4"]; ?><br>
Input 5  <?php echo $_POST["input5"]; ?><br>
Input 6  <?php echo $_POST["input6"]; ?>

  <form action="unsafe_main.php" method="post">
    <table width="50%">
      <tr>
          <td>First Name</td>
          <td><input type="text" name="input2"></td>
      </tr>
      <tr>
          <td>Last Name</td>
          <td><input type="text" name="input3"></td>
      </tr>
      <tr>
          <td>DOB</td>
          <td><input type="text" name="input4"></td>
      </tr>
      <tr>
          <td>Gender</td>
          <td><input type="text" name="input5"></td>
      </tr>
      <tr>
          <td>Mobile Phone</td>
          <td><input type="text" name="input6"></td>
      </tr>
    </table>
    <input type="submit" value="OK" name="s">
</form>  
</body>
</html>
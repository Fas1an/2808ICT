<html>
<body>

<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "assignment2_121";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
echo "Connected successfully <br> <br>"; 


// Insert a new Student record
$student_id = $_POST['input1'];
$first_name = $_POST['input2'];
$last_name = $_POST['input3'];
$DOB = $_POST['input4'];
$sex = $_POST['input5'];
$phone = $_POST['input6'];

$result = $student_id;

$bytes = random_bytes(20);
$randomid = bin2hex($bytes);

// Prepared statement
$stmt = $conn->prepare("INSERT INTO tbl_person_details (id_person ,first_name, last_name, DOB, gender, mobile_phone)  VALUES (?,?,?,?,?,?)");	

if ($stmt) {
    // Bind Parameters
    $stmt->bind_param('sssssi', $randomid , $first_name, $last_name, $DOB, $sex, $phone);
    $stmt->execute();
    if ($stmt->errno) {
		echo "Failed to insert the record. <br>";
		echo "MySQL Error Code    = " . $stmt->errno . "<br>";
		echo "MySQL Error Message = " . $stmt->error . "<br> <br>";
		$result = false;
    }
} else {
    echo "MySQL Error Code    = " . $conn->errno . "<br>";
	echo "MySQL Error Message = " . $conn->error . "<br> <br>";
	$result = false;
}
$conn->close();

if ($result) {
	echo "<br>$result created successfully<br>";
}
else {
	echo "<br>Failed to insert \"" . $student_id . "\"<br>";
}

?><br><br>

Input 1  <?php echo $_POST["input1"]; ?><br>
Input 2  <?php echo $_POST["input2"]; ?><br>
Input 3  <?php echo $_POST["input3"]; ?><br>
Input 4  <?php echo $_POST["input4"]; ?><br>
Input 5  <?php echo $_POST["input5"]; ?><br>
Input 6  <?php echo $_POST["input6"]; ?>

  <p>
  <a href="/index.html">Return to the form</a>
  </p>
  
  <form action="safe_main.php" method="post">
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

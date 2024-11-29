<?php
session_start();

// SERVER 1
$SERVER_NAME = 'SERVER 1';
$DB_ADDRESS = 'localhost';
$DB_USERNAME = 'root';
$DB_PASSWORD = '2020jx2';
$DB_ACCOUNT = 'paysys';
$DB_INGAME = 'jx2ib_database';


// initializing variables
$username = "";
$coin = '9999';
$email = "jx2full2014@gmail.com";
$errors = array(); 
$current_coin = 0;

// connect to the database
$db = mysqli_connect($DB_ADDRESS, $DB_USERNAME, $DB_PASSWORD, $DB_ACCOUNT);

if (isset($_POST['btn_cancel'])) {
  header('location:index.php');
}
//-----------------------------------------------------------------------------
//							REGISTER AND LOGIN
//-----------------------------------------------------------------------------
if (isset($_POST['btn_regis'])) {
	register($db);
}

if (isset($_POST['btn_login'])) {
  	login($db);
}
//-----------------------------------------------------------------------------
//                           ACCOUNT MANAGEMENT
//-----------------------------------------------------------------------------
if (isset($_POST['btn_charge'])) {
  	charge($db);
}
//-----------------------------------------------------------------------------
//                           CHARACTER MANAGEMENT
//-----------------------------------------------------------------------------

if (isset($_POST['btn_del_role'])) {
  $server_index = 1;
	if(isset($_POST['server'])) {
		$server_index = $_POST['server'];
		if ($server_index == 2) {
	   	$db = mysqli_connect($DB_ADDRESS2, $DB_USERNAME2, $DB_PASSWORD2, $DB_ACCOUNT2); 
    }
	}
  delRole($db,$server_index);
}

if (isset($_POST['btn_edit_role'])) {
	$server_index = 1;
  if(isset($_POST['server'])) {
    $server_index = $_POST['server'];
    if ($server_index == 2) {
      $db = mysqli_connect($DB_ADDRESS2, $DB_USERNAME2, $DB_PASSWORD2, $DB_ACCOUNT2); 
    }
  }
  editRole($db, $server_index);
}

//-----------------------------------------------------------------------------
//                           	FUNCTIONS
//-----------------------------------------------------------------------------

function register($db) {

  // receive all input values from the form
  $username = mysqli_real_escape_string($db, $_POST['username']);
  $password_1 = mysqli_real_escape_string($db, $_POST['password_1']);
  $password_2 = mysqli_real_escape_string($db, $_POST['password_2']);

  // form validation: ensure that the form is correctly filled ...
  // by adding (array_push()) corresponding error unto $errors array
  global $errors;
  if (empty($username)) { array_push($errors, "Username is required"); }
  if (empty($password_1)) { array_push($errors, "Password is required"); }
  if ($password_1 != $password_2) {
	array_push($errors, "The two passwords do not match");
  }

  // first check the database to make sure 
  // a user does not already exist with the same username and/or email
  $user_check_query = "SELECT * FROM account WHERE username='$username' LIMIT 1";
  $result = mysqli_query($db, $user_check_query);
  $user = mysqli_fetch_assoc($result);
  
  if ($user) { // if user exists
    if ($user['username'] === $username) {
      array_push($errors, "Username already exists");
    }
  }

  // Finally, register user if there are no errors in the form
  if (count($errors) == 0) {
  	$password = md5($password_1);//encrypt the password before saving in the database
	global $coin, $email;
  	$query = "INSERT INTO account (username, secpassword, password, rowpass, coin, email) 
  			  VALUES('$username', '$password', '$password', '$password_1', '$coin', '$email')";
  	mysqli_query($db, $query);
  	$_SESSION['username'] = $username;
  	$_SESSION['success'] = "You are now logged in";
  	header('location: register_success.php');
  } else {
	 // header('location: register.php');
	echo '<h1 style="color:red;">Register failed! </h1>';
	foreach($errors as $msg)
		echo $msg . "<br>";
  }
}


function login($db) {
	 // receive all input values from the form
  $username = mysqli_real_escape_string($db, $_POST['username']);
  $password = mysqli_real_escape_string($db, $_POST['password']);

  // form validation: ensure that the form is correctly filled ...
  // by adding (array_push()) corresponding error unto $errors array
  global $errors;
  if (empty($username)) { array_push($errors, "Username is required"); }
  if (empty($password)) { array_push($errors, "Password is required"); }

  // first check the database to make sure 
  // a user does not already exist with the same username and/or email
  $user_check_query = "SELECT * FROM account WHERE username='$username' LIMIT 1";
  $result = mysqli_query($db, $user_check_query);
  $user = mysqli_fetch_assoc($result);

  if ($user) {
    $password = md5($password);
    if ($user['password'] !== $password)
      array_push($errors, "Password is incorrect!");
  } else {
    array_push($errors, "Account is not existed!");
  }

  // FINAL STEP => UPDATE DATA
  if (count($errors) == 0) {
    if ($user['username'] === $username) { // Make sure it's the right account
      $_SESSION['username'] = $username;
      $_SESSION['success'] = "You are now logged in";
      header('location: index.php');
    }
  } else {
	  // header('location: login.php');
    echo '<h1 style="color:red;">Login failed! </h1>';
    foreach($errors as $msg)
      echo $msg . "<br>";
  }
}


function editRole($db, $server=1) {
	  // receive all input values from the form
  $username = mysqli_real_escape_string($db, $_POST['username']);
  $password = mysqli_real_escape_string($db, $_POST['password']);
  $rolename = mysqli_real_escape_string($db, $_POST['rolename']);
  $newrolename = mysqli_real_escape_string($db, $_POST['newrolename']);

  // form validation: ensure that the form is correctly filled ...
  // by adding (array_push()) corresponding error unto $errors array
  global $errors;
  if (empty($username)) { array_push($errors, "Username is required"); }
  if (empty($password)) { array_push($errors, "Second password is required"); }
  if (empty($rolename)) { array_push($errors, "Rolename is required"); }
  if (empty($newrolename)) { array_push($errors, "New rolename is required"); }
  if ($rolename == $newrolename) {
    array_push($errors, "New rolename must be different from the old one!");
  }

  $user_check_query = "SELECT * FROM account WHERE username='$username' LIMIT 1";
  $result = mysqli_query($db, $user_check_query);
  $user = mysqli_fetch_assoc($result);

  if ($user) {
    if ($password) {
      $password = md5($password);
      if ($user['secpassword'] !== $password)
        array_push($errors, "Second password is incorrect!");
    }
  } else {
    array_push($errors, "Account is not existed!");
  }

  // connect to the database
  global $db;
  if ($server == 1) {
    global $DB_ADDRESS, $DB_USERNAME, $DB_PASSWORD, $DB_INGAME;
    $db = mysqli_connect($DB_ADDRESS, $DB_USERNAME, $DB_PASSWORD, $DB_INGAME);
  } else if ($server == 2) {
    global $DB_ADDRESS2, $DB_USERNAME2, $DB_PASSWORD2, $DB_INGAME2;
      $db = mysqli_connect($DB_ADDRESS2, $DB_USERNAME2, $DB_PASSWORD2, $DB_INGAME2);
  }

  // Change character set to utf8
  $db -> set_charset("utf8");
  $user_check_query = "SELECT Account, Rolename FROM role WHERE Account='$username' AND Rolename='$rolename'";
  $result = mysqli_query($db, $user_check_query);
  $user = mysqli_fetch_assoc($result);
  
  if (!$user) { // if user exists
    array_push($errors, "Rolename is not existed!");
  }

  // FINAL STEP => UPDATE DATA
  if (count($errors) == 0) {
    if ($user['Account'] === $username) { // Make sure it's the right account
      $query = "UPDATE role SET Rolename='$newrolename' WHERE Account='$username' AND RoleName='$rolename'";
      $result = mysqli_query($db,$query);
      if ($result) {
        echo '<center><h1 style="color:green">Update role successfully!</h1><br>Come back home page in 5 seconds . . .' ;
        header('Refresh: 5; index.php');
      } else {
        echo "<center>Rolename you are trying to change already exist. Please take others.";
      }
    }
  } else {
    echo '<center><h1 style="color:red;">Update role failed! </h1>';
    foreach($errors as $msg)
      echo $msg . "<br>";
  }
}

function charge($db) {
	 // receive all input values from the form
  $charge_coin = mysqli_real_escape_string($db, $_POST['charge_coin']);

  // form validation: ensure that the form is correctly filled ...
  // by adding (array_push()) corresponding error unto $errors array
  global $errors;
  if (empty($charge_coin)) { array_push($errors, "Coin is required"); }

  
  $username = mysqli_real_escape_string($db, $_POST['username']);
  //var_dump($username);

  // first check the database to make sure 
  // a user does not already exist with the same username and/or email
  $user_check_query = "SELECT * FROM account WHERE Username='$username' LIMIT 1";
  $result = mysqli_query($db, $user_check_query);
  $user = mysqli_fetch_assoc($result);

  // FINAL STEP => UPDATE DATA
  //var_dump($user['coin']);
  if (count($errors) == 0) {
	$current_coin = $user['coin'];
	$new_coin = $current_coin + $charge_coin;
    if ($user['username'] === $username) { // Make sure it's the right account
	
      $query = "UPDATE account SET Coin='$new_coin' WHERE Username='$username'";
      $result = mysqli_query($db,$query);
      if ($result) {
        echo '<center><h1 style="color:green">Charge successfully!</h1><br>Come back charge page in 1 seconds . . .' ;
        header('Refresh: 1; charge.php');
      } else {
        echo "<center>Charge failed!";
      }
    }
  } else {
	  // header('Refresh: 1; charge.php');
    echo '<center><h1 style="color:red;">Charge failed! </h1>';
    foreach($errors as $msg)
      echo $msg . "<br>";
  }
}


function getCoin() {
	if (isset($_SESSION['username'])) {
		$username = $_SESSION['username'];

		// Change character set to utf8
		global $db;
		$db -> set_charset("utf8");
		$query = "SELECT Username,Coin FROM account WHERE Username='$username'";
		$result = mysqli_query($db, $query);
		$user = mysqli_fetch_assoc($result);

		if ($result) {
			$current_coin = $user['Coin'];
		}
	}
	return $current_coin;
}


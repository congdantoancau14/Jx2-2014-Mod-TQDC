<?php
session_start();
?>
<html>
<head>
	<title>User Login</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<script type="text/javascript" src="scripts.js"></script>
</head>
<body>
	
	<center>
	<?php if($_SESSION["username"]) {?>
	<nav>
		<ul>
		  <li><a class="active" href="index.php">Home</a></li>
		  <li><a href="charge.php">Charge</a></li>
		  <li style="float: right;"><a href="logout.php">Logout</a></li>
		</ul>
	</nav>
	<h1>Welcome <span style="color:orange;"><?php echo $_SESSION["username"]; ?></span>!</h1>
	<?php } else { ?>
	<nav>
		<ul>
		  <li><a class="active" href="index.php">Home</a></li>
		  <li style="float: right;"><a href="login.php">Login</a></li>
		  <li style="float: right;"><a href="register.php">Sign up</a></li>
		</ul>
	</nav>
	<h1>Welcome, guest! You might want to be <a href="login.php">login</a> or <a href="register.php">sign up</a></h1>
	<?php } ?>
</body>
</html>
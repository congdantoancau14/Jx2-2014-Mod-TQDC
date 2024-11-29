<?php include('server.php') ?>
<?php 
	if($_SESSION["username"]) 
		header('location:index.php');
?>
<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<script type="text/javascript" src="scripts.js"></script>
</head>
<body>
	<center>
	
	
	<nav>
		<ul>
		  <li><a class="active" href="index.php">Home</a></li>
		  <li style="float: right;"><a href="register.php">Sign up</a></li>
		</ul>
	</nav>
	
	<div class="header">
		<h1>Login</h1>
	</div>
	
	<form method="post" action="server.php">
		<?php include('errors.php'); ?>
		<div class="input-group">
			<label>Username</label>
			<input type="text" name="username" value="<?php echo $username; ?>">
		</div>
		<div class="input-group">
			<label>Password</label>
			<input type="password" name="password">
		</div>
		<div class="input-group">
			<button type="submit" class="btn" name="btn_login">Submit</button>
		</div>
	</form>
	<center>
</body>
</html>

<?php 
	include('server.php');
	$username = $_SESSION["username"];
	$rolename = $_GET['rolename'];
?>
<!DOCTYPE html>
<html>
<head>
	<title>Edit Role</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="header">
		<h2>Edit Role</h2><br>
	</div>

	<form method="post" action="server.php">
		<?php include('errors.php'); ?>
		<div class="input-group">
			<label>Account</label>
			<input type="text" name="username" value="<?php echo $username; ?>">
		</div>
		<div class="input-group">
			<label>Second Password</label>
			<input type="password" name="password">
		</div>
		<div class="input-group">
			<label>Current Rolename</label>
			<input type="text" name="rolename" value="<?php echo $rolename ?>">
		</div>
		<div class="input-group">
			<label>New Rolename</label>
			<input type="text" name="newrolename">
		</div>
		<div class="input-group">
			<button type="submit" class="btn" name="btn_edit_role">Submit</button>
		</div>
	</form>
</body>
</html>

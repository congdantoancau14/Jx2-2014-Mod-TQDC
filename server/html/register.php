<?php include('server.php') ?>
<!DOCTYPE html>
<html>
<head>
	<title>Tạo Tài Khoản</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<script type="text/javascript" src="scripts.js"></script>
</head>
<body>

	<?php if($_SESSION["username"]) {?>
		header("location:index.php");
	<?php } else { ?>
	<nav>
		<ul>
		  <li><a class="active" href="index.php">Home</a></li>
		  <li style="float: right;"><a href="login.php">Login</a></li>
		</ul>
	</nav>
	<div class="header">
		
		<h2>Tạo Tài Khoản</h2><br>
	
	</div>

	<form method="post" action="server.php">
		<?php include('errors.php'); ?>
		<div class="input-group">
			<label>Tài khoản</label>
			<input type="text" name="username" value="<?php echo $username; ?>">
		</div>
		<div class="input-group">
			<label>Mật khẩu</label>
			<input type="password" name="password_1">
		</div>
		<div class="input-group">
			<label>Nhập lại mật khẩu</label>
			<input type="password" name="password_2">
		</div>
		<div class="input-group">
			<button type="submit" class="btn" name="btn_regis">Đăng ký</button>
		</div>
	</form>
	<center>
	<?php } ?>
	
</body>
</html>

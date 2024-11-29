<?php include('server.php'); ?>
<?php $current_coin = getCoin(); ?>

<html>
<head>
	<title>Charge</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<script type="text/javascript" src="scripts.js"></script>
</head>
<body>
	
	<center>
	<?php if($_SESSION["username"]) { ?>
	<nav>
		<ul>
		  <li><a class="active" href="index.php">Home</a></li>
		  <li><a href="charge.php">Charge</a></li>
		  <li style="float: right;"><a href="logout.php">Logout</a></li>
		</ul>
	</nav>
	<h1>Welcome <span style="color:orange;"><?php echo $_SESSION["username"]; ?></span>!</h1>
	<div class="header">
		<h1>Charge</h1>
	</div>
	<form method="post" action="server.php">
		<?php include('errors.php'); ?>
		<div class="input-group" hidden>
			<label>User name</label>
			<input type="text" name="username" value="<?php echo $_SESSION["username"]; ?>" >
		</div>
		<div class="input-group">
			<label>Number of current coins</label>
			<input type="text" name="current_coin" value="<?php echo $current_coin; ?>" disabled>
		</div>
		<div class="input-group">
			<label>Number of charge coins</label>
			<input type="text" name="charge_coin" value="0">
		</div>
		<div class="input-group">
			<button type="submit" class="btn" name="btn_charge">Submit</button>
		</div>
	</form>
	<center>
	<?php } else { ?>
	<nav>
		<ul>
		  <li><a class="active" href="index.php">Home</a></li>
		  <li style="float: right;"><a href="login.php">Login</a></li>
		</ul>
	</nav>
	<h1>Please login first!</h1>
	<?php } ?>
</body>
</html>
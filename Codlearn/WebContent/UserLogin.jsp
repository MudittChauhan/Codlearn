<!DOCTYPE HTML>

<html>

<head>
  <title>User Login</title>
 <link rel="stylesheet" href="css/Rreset.css">
<link rel='stylesheet prefetch'
	href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900'>
<link rel='stylesheet prefetch'
	href='http://fonts.googleapis.com/css?family=Montserrat:400,700'>
<link rel='stylesheet prefetch'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="css/Rstyle.css"> 
</head>

<body>
 <div class="container">
		<div class="info">
			<h1>Codlearn Login</h1>
			<span><i class="fa fa-heart"></i> Enter Your Valid User-ID <i
				class="fa fa-heart"></i></span>
		</div>
</div>

<div class="form">
	<div class="thumbnail">
		<img
				src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/169963/hat.svg" />
	</div>
    <form class="login-form"  action="Userlogin" method="get">
        <input type="text" id="email" name="email" placeholder="Enter Your Registered Email" pattern="[A-Z,a-z_z0-9._%+-]+@[A-Z,a-z0-9.-]+\.[A-Z,a-z]{2,3}$" value="" required /> 
        <input type="password" id="password" name="password" placeholder="Your Password" required />
		<button>Login</button>
	</form>
</div>
        
<footer>
	<p>Copyright &copy; | Deployed by Mudit Chauhan.</p>
</footer>

</body>
</html>

       
<!DOCTYPE HTML>
<html>
<head>
  <title>:: Instructions For JOE ::</title>
<link rel="stylesheet" href="css/fb.css" type="text/css" />
<script type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</script>
</head>
 <% 
    HttpSession session1=request.getSession();
    if
            (session.getAttribute("name")==null)
    {
        response.sendRedirect("UserLogin.jsp?msg=Please login First");
    }
    %>
<body class="login" onload="noBack();" 
	onpageshow="if (event.persisted) noBack();" onunload="">
	<div id="facebook-Bar">
		<div id="facebook-Frame"></div>
	</div>
	<h4 align="right" style="color: #000000;"> Welcome,
       <%= session.getAttribute("name")%> <a href="Thanku.jsp">(LOGOUT)</a></h4>
	<div class="loginbox radius">
	<h2 style="color: #ff9966; text-align: center;">:: Instructions &
			Disclaimer For JOE ::</h2>
		<div class="loginheader">
			
				<div class="loginform">
					<h4 class="title" style="color: #cc0033; text-align: left;">
            <br><br><form id="login" method="get" action='Questions.jsp'>
        <div class="loginform">
		<h4 class="title" style="color: #cc0033; text-align: left;">
         The Guidelines for Conduct of Online Examinations should be communicated to all students.<br> 
        1) Time Allowed per question is <b>'8 seconds'</b>, after that new question will generated and you will not assign any marks for that.<br> 
        2) Read each question very carefully.<br>
        3) There will be 10 Questions. Each will have 2 Marks. There is negative marking of mark 1 at each wrong answer.<br> 
         
        4) All questions are OBJECTIVE multiple choice. Each question will have at least 4 choices.<br>
        5) The examination site will remain operational for 10 minutes as per prescribed time schedule, student need to complete his/her exam within this time limit no further extra time will be allowed.<br>
        6) Once Click on <b>"Proceed To JOE"</b> you will not return back.</h4>
</div>
<br>
<center>
<p>
<button class="radius title">
<b>Proceed To JOE</b>
</button>
</p>
</center>
</form>
</div>
</div>
</body>
</html>
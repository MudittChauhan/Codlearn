<%@page import="java.util.concurrent.ExecutionException"%>
<%@page import="javax.servlet.*"%>
<%@page import="java.sql.*"%>
<%! static int counter=1;%>
<%! static int countRows=0;%> 
<%! String question_no;%>
<%! static int count=0;%>    
<%! String answer;%>
<!DOCTYPE HTML>
<html><head>
<link rel='stylesheet' type='text/css' href='css/timer.css'>
<style type="text/css">
.styled-button-1 {
	-webkit-box-shadow:rgba(0,0,0,0.2) 0 1px 0 0;
	-moz-box-shadow:rgba(0,0,0,0.2) 0 1px 0 0;
	box-shadow:rgba(0,0,0,0.2) 0 1px 0 0;
	color:#333;
	background-color:#FA2;
	border-radius:5px;
	-moz-border-radius:5px;
	-webkit-border-radius:5px;
	border:none;
	font-family:'Helvetica Neue',Arial,sans-serif;
	font-size:16px;
	font-weight:700;
	height:36px;
	padding:4px 16px;
	text-shadow:#FE6 0 1px 0
}
 </style>
          
<script type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</script>
</head>
<body onload="noBack();"onpageshow="if (event.persisted) noBack();" onunload="">
   
    <hr>   
     
    <% 
    HttpSession session1=request.getSession();
    if
            (session.getAttribute("name")==null)
    {
        response.sendRedirect("UserLogin.jsp?msg=Please login First");
    }
    %>
<% int current = 0;
Connection con = null;
ResultSet rs = null;
%>
 
 <h2>:: Time Remaining ::</h2>   
 <div id="clockdiv">
            
            <div>
              <span class="hours"></span>
              <div class="smalltext">Hours</div>
            </div>
            <div>
              <span class="minutes"></span>
              <div class="smalltext">Minutes</div>
            </div>
            <div>
              <span class="seconds"></span>
              <div class="smalltext">Seconds</div>
            </div>
</div>
          
                     
<script>  
//Gets time from current time to end time and returns an object containing the difference
function getTimeRemaining(endtime) {
  // Get the difference in milliseconds from the end time to now
  var t = Date.parse(endtime) - Date.parse(new Date());

  // Convert milliseconds to seconds, minutes, etc.
  var seconds = Math.floor((t / 1000) % 60);
  var minutes = Math.floor((t / 1000 / 60) % 60);
  var hours = Math.floor((t / (1000 * 60 * 60)) % 24);
  

  // Return total time in milliseconds and conversions
  return {
    'total': t,
    'hours': hours,
    'minutes': minutes,
    'seconds': seconds
  };
}

// Draws and updates the clock every second
function initializeClock(id, endtime) {
  // Get clock HTML elements for altering
  var clock = document.getElementById(id);
  var hoursSpan = clock.querySelector('.hours');
  var minutesSpan = clock.querySelector('.minutes');
  var secondsSpan = clock.querySelector('.seconds');

  // Function to update clock, run every second
  function updateClock() {
    // Get time remaining object from getTimeRemaining using endgame
    var t = getTimeRemaining(endtime);

    // Set HTML of the elements to the appropriate time units from the object returned from getTimeRemaining
   
    hoursSpan.innerHTML = ('0' + t.hours).slice(-2); // This slice removes the last two (-2) characters from the string, likely the two decimal points
    minutesSpan.innerHTML = ('0' + t.minutes).slice(-2);
    secondsSpan.innerHTML = ('0' + t.seconds).slice(-2);

    // If the timer has finished, stop updating the clock
    if (t.total <= 0) {
    	clock.innerHTML = 'Yout Time is Up';
      clearInterval(timeinterval);
      window.location="Questions.jsp";
    }
  }

  // Run function once (setInterval doesn't run immediately but after the interval time)
  updateClock();
  // Run updateClock function every second (1000 milliseconds)
  var timeinterval = setInterval(updateClock, 1000);
}


// Set deadline (the end date)

var deadline = new Date(Date.parse(new Date()) + 10* 60 * 1000);


// Create clock on ID 'clockdiv' with the end time 'deadline'
initializeClock('clockdiv', deadline);
</script> 
<hr>


            
             <h4 align="right" style="color: #000000;"> Welcome,
       <%= session.getAttribute("name")%></h4>
      <% 
      if (request.getParameter("hidden") != null) {
    	  current = Integer.parseInt(request.getParameter("hidden"));
    	  }
      int i=0;
      int n=1;
      Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/joe","root","");
		Statement st=con.createStatement();
		rs=st.executeQuery("select * from questions order by rand()");
      
		for (int j = 0; j < current; j++) {
            	rs.next();
            	}
            	if (!rs.next()) {
            	out.println("All questions are over. Click on Finish to view your Result");
            	} else {
            	
          
                 i++;
                String q=rs.getString(1);
                String a=rs.getString(2);
                String b=rs.getString(3);
                String c1=rs.getString(4);
                String d=rs.getString(5);
                String o=rs.getString(6);
                session.setAttribute("un",o);
                %>
               <form action="Answer.jsp" method="get">
               
                <table align="center">
                <font size=6 color=purpal>:: Java Online Exam ::</font>
                <tr><th><font size='5' color='green'>
                    Q. <%= q%> </font></th></tr>
            
            <br>
          <tr><td><font size='4' color='blue'>A: <%= a%><input type=radio  name="rb" value="A" ></font></td></tr>
           <br>
           
           <tr><td><font size='4' color='blue'>B: <%= b%><input type=radio  name="rb" value="B" ></font></td></tr>
           <br>
            
           <tr><td><font size='4' color='blue'>C: <%= c1%><input type="radio"  name="rb" value="C" ></font> </td></tr>
           <br>
           
           <tr><td><font size='4' color='blue'>D: <%= d%><input type="radio"  name="rb" value="D" ></font></td></tr>
           </table>
           
          <br>
           <br>
           </font> 
           <% n++;
            }%>
         <center>
         <INPUT TYPE="hidden" NAME="hidden" VALUE="<%=current + 1%>">
        
    	<input type='submit' name='next' value='Next' class="styled-button-1" >
    	<input type='submit' name='save' value='Save and Finish' onclick="form.action='Final.jsp'; return true;" class="styled-button-1"></p>
         </center>
                  
</form>
      
      
      </div>
        
        
      </div>
    </div>
    <br><br><br><br>
     <footer>
     <p>Copyright &copy; |design by Muditt Chauhan</p>
    </footer>
  </div>
   
</body>
</html>
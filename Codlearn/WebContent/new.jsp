<%@page import="java.util.concurrent.ExecutionException"%>
<%@page import="javax.servlet.*"%>
<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<link rel='stylesheet' type='text/css' href='css/timer.css'>
</head>
<body>
    <hr>   
     
    <% 
    HttpSession session1=request.getSession();
    if
            (session.getAttribute("name")==null)
    {
        response.sendRedirect("UserLogin.jsp?msg=Please login First");
    }
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

var deadline = new Date(Date.parse(new Date()) +  10 * 60 * 1000);


// Create clock on ID 'clockdiv' with the end time 'deadline'
initializeClock('clockdiv', deadline);
</script>

<h4 align="right" style="color: #000000;"> Welcome,
       <%= session.getAttribute("name")%></h4>
        
        <FORM NAME="form1" ACTION="new.jsp" METHOD="POST">
<%!  String q=null;
String a=null;
String b=null;
String c1=null;
String d=null;
String o=null; %>
        <% 
            int current = 1;
       
      
            if(request.getParameter("hidden") != null) {
                current = Integer.parseInt(request.getParameter("hidden"));
            }

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/joe","root","");

            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery("select * from questions"); 
            	if(rs.next()){
            		
            q=rs.getString(1);
            a=rs.getString(2);
            b=rs.getString(3);
            c1=rs.getString(4);
            d=rs.getString(5);
            o=rs.getString(6);
            	
            session.setAttribute("un",o);
            	}	
            if(current < 1){
                current = 1;
            }

            rs.last();
            int rows = rs.getRow();
            if(current <= rows){
            	rs.absolute(current);
            }    
        %>
<br><br>
            <TABLE align="center">
            <font size=6 color=purpal>:: Java Online Exam ::</font><br><br>
                <TR>
                    <TH>Q. <%= q %></TH>
                </TR>
                	<TR><TD> <%= a %> <input type=radio  name="rb" value="A" ></TD></TR>
                    <TR><TD> <%= b %> <input type=radio  name="rb" value="A" ></TD></TR>
                    <TR><TD> <%= c1 %> <input type=radio  name="rb" value="A" ></TD></TR>
                    <TR><TD> <%= d %> <input type=radio  name="rb" value="A" ></TD></TR>
            </TABLE>
            <BR>
            <INPUT TYPE="HIDDEN" NAME="hidden" VALUE="<%= current %>">
            <INPUT TYPE="BUTTON" VALUE="Next Record" ONCLICK="moveNext()">
            <INPUT TYPE="BUTTON" VALUE="Previous Record" ONCLICK="movePrevious()">
        </FORM>

        <SCRIPT>
            
            function moveNext()
            {
                var counter = 0
                counter = parseInt(document.form1.hidden.value) + 1
                document.form1.hidden.value = counter
                form1.submit()
            }    
            function movePrevious()
            {
                var counter = 0
                counter = parseInt(document.form1.hidden.value) - 1
                document.form1.hidden.value = counter
                form1.submit()
            }    
            
        </SCRIPT>
    </BODY>
</HTML>
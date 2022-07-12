<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*" import="java.lang.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.schedule.model.DBConnection"%>      
         
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta hhtp-equiv="Content-Type" content="text/html"; charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
 
<title>Delete schedule page</title>
<link href="css/insert.css" rel="stylesheet" type="text/css">

</head>
<body>

	<nav>
      <div class="logo">25Quickbus</div>
      <input type="checkbox" id="click">
      <label for="click" class="menu-btn">
        <i class="fas fa-bars"></i>
      </label>
      <ul>
        <li><a class="active" href="#">Home</a></li>
        <li><a href="#">About us</a></li>
        <li><a href="#">Career</a></li>
        <li><a href="#">Contact us</a></li>
        <li><a href="#">Feedback</a></li>
        <li><a href="<%=request.getContextPath()%>/LogoutServlet">Logout</a></li>
      </ul>
    </nav>
   
 
   <br><br>
	<br><br>	
	
	
	<div class="container">
		<div class="contact-box">
			<div class="left"></div>
			<div class="right">
	
		<h2> Delete Bus schedule</h2>
		<form action="<%=request.getContextPath()%>/ScheduleDelete" method="Post">
			 
			 
			 <%
			
			Connection con = null;
			Statement statement = null;
			ResultSet resultSet = null;
			con = DBConnection.createConnection();
			statement=con.createStatement();
			String u = request.getParameter("u");
			int num = Integer.parseInt(u);
			String sql ="SELECT * FROM schedule where idschedule ='"+num+"'";
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
					
			%> 
			
			
			<label for="id">Schedule Number</label>
			<input type="text" class="field" name = "sid" value='<%=resultSet.getString("idschedule") %>' readonly>
			
			
			<label for="date">Date</label>
			<input type="Date" class="field" name = "date" value='<%=resultSet.getString("date") %>' readonly>
			
			
			
			<label for="date">Bus Name</label>
			<input type="text" class="field" name = "name" value='<%=resultSet.getString("bus_name") %>' readonly>
			
			
			
			<label for="date">Bus Route</label>
			<input type="text" class="field" name = "route" value='<%=resultSet.getString("bus_route") %>' readonly>
			
			
			<label for="dtime">Depature Time</label>
			<input type="time" class="field" name = "dtime" value='<%=resultSet.getString("departure_time") %>' readonly>
			
			
			<label for="atime">Arrival Time</label>
			<input type="time" class="field" name = "atime" value='<%=resultSet.getString("arrival_time") %>' readonly>
			
			<%
			 }
			%>
			
			<input type="submit" class="btn" name="submit" value="Delete schedule" ><br><br>
		   <input type="button" class="btn"  name="button" value="Cancel" onclick="window.location='display.jsp'">
		   
		</form>
	
</div>
</div>
</div>	
	
<br><br>	
<br><br>	

<div class="footer-dark">
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-md-3 item">
                        <h3>Services</h3>
                        <ul>
                            <li><a href="#">Web design</a></li>
                            <li><a href="#">Development</a></li>
                            <li><a href="#">Hosting</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-6 col-md-3 item">
                        <h3>About</h3>
                        <ul>
                            <li><a href="#">Company</a></li>
                            <li><a href="#">Team</a></li>
                            <li><a href="#">Careers</a></li>
                        </ul>
                    </div>
                    <div class="col-md-6 item text">
                        <h3>Company Name</h3>
                        <p>Praesent sed lobortis mi. Suspendisse vel placerat ligula. Vivamus ac sem lacus. Ut vehicula rhoncus elementum. Etiam quis tristique lectus. Aliquam in arcu eget velit pulvinar dictum vel in justo.</p>
                    </div>
                    <div class="col item social"><a href="#"><i class="icon ion-social-facebook"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-instagram"></i></a></div>
                </div>
                <p class="copyright">Company Name © 2021</p>
            </div>
        </footer>
    </div>




</body>
</html>
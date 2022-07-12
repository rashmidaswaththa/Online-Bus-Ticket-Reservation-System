<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>   
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
	 <link rel="preconnect" href="https://fonts.gstatic.com">
	 <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700;900&family=Mukta:wght@300;400;600;700;800&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
	<title>Display page</title>
	<link href="css/display.css" rel="stylesheet" type="text/css">
	
</head>
<body>
<!-- create navigation on the top of the page -->
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
        <li><a href="<%=request.getContextPath()%>/LogoutServlet">Logout</a></li><!-- -display logout on the header to logout from the system -->
      </ul>
    </nav>
   
 
    <br><br>

	
	
	
	<i><h1 align="center">Bus Schedule</h1></i><br><br>
	<div ><center><input type="button" class="button" value="+Add new schedule" onclick="window.location='Insertschedule.jsp'" ></center></div>
	
	<!-- -create table to retrieve data from the schedule table -->
	<table >
		
			<tr>
			</tr>
			<tr bgcolor="#007399">
			<th><b>Schedule Number</b></th>
			<th><b>Date</b></th>
			<th><b>Bus name</b></th>
			<th><b>Bus route</b></th>
			<th><b>Departure time</b></th>
			<th><b>Estimated arrival time</b></th>
			<th><b>Update</b></th>
			<th><b>Remove</b></th>
			</tr>
	<!-- create connection on this page to retrieve data from the schedule table -->	
	<%
	try{ 
	Connection con = null;
	Statement statement = null;
	ResultSet resultSet = null;
	con = DBConnection.createConnection();
	statement=con.createStatement();
	String sql ="SELECT * FROM schedule";
	
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){
		
	
	%>
	<!-- --get data from the table using getString() method -->	
			<tr bgcolor="#ced5d0">
			<td><%=resultSet.getString("idschedule") %></td>
			<td><%=resultSet.getString("date") %></td>
			<td><%=resultSet.getString("bus_name") %></td>
			<td><%=resultSet.getString("bus_route") %></td>
			<td><%=resultSet.getString("departure_time") %></td>
			<td><%=resultSet.getString("arrival_time") %></td>
			<td><a href='Updateschedule.jsp?u=<%=resultSet.getString("idschedule") %>'><div class="bt1"><input type=button name="update" value="Update"/></div> </a></td>
			<td><a href='Deleteschedule.jsp?u=<%=resultSet.getString("idschedule") %>'><div class="bt2"><input type=button name="delete" value="Remove" /></div></a></td>
		    </tr>
		
	<% 
	}
	
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
	</table>
	<br><br>

	<!-- create footer -->
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